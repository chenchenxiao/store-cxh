package com.store.controller.admin;

import com.store.been.AjaxResult;
import com.store.model.Mail;
import com.store.model.User;
import com.store.service.UserService;
import com.store.util.CheckNumberUtil;
import com.store.util.FileUploadUtil;
import com.store.util.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.util.UUID;
import org.apache.commons.mail.EmailException;
/**
 * Created by 陈晓海 on 2017/7/8.
 */
@Controller
@RequestMapping("admin/user")
public class UserController extends BaseAdminController<User,Long> {
    @Autowired
    private UserService userService;

    //校验用户名或手机号是否已被注册
    @RequestMapping("checkRepeat")
    public void checkRepeat(User user,PrintWriter outs){
        System.out.println("user-___->" + user);
        //如果已被注册就返回false，否则返回true；
        if(userService.checkRepeat(user) > 0){
            System.out.println("boolean-->" + false);
            outs.print("{\"result\":"+false+"}");
            outs.close();
        }else{
            System.out.println("boolean-->" + true);
            outs.print("{\"result\":"+true+"}");
            outs.close();
        }
    }

    //获取手机验证码
    @RequestMapping("checkPhone")
    public void phoneCheck(String phoneNumber,PrintWriter outs) throws IOException {
        System.out.println("phoneNumber-->" + phoneNumber);
        //获取验证码
        String checkNumber = CheckNumberUtil.getCheckNumber();
        //发送手机短信
//        SendPhoneMsgUtil.sendMsg(phoneNumber,checkNumber);
        System.out.println("发送完短信了");
        //返回验证码
        outs.print("{\"result\":"+checkNumber+"}");
        outs.close();
    }

    //注册用户
    @RequestMapping("regist")
    public String regist(@Valid User user,BindingResult bindingResult, Model model){
        //判断注册格式是否正确，不正确就给出提示，否则进行用户名校验，如果前两步都没问题就注册成功
        if(bindingResult.hasErrors()){
            model.addAttribute("result",new AjaxResult(true,"格式填写错误"));
            System.out.println("格式填写错误");
            return "userRegist";
        }else if(userService.checkRepeat(user) > 0) {       //防止表单重复提交
            model.addAttribute("result",new AjaxResult(false,"该用户已被注册！"));
            return "admin/user/loginUI";
        }else{
            userService.addUser(user);
            model.addAttribute("result",new AjaxResult(true,"注册成功,请登录"));
            return "admin/user/loginUI";
        }
    }

    //用户登录
    @RequestMapping("login")
    public String login(User user, Model model, HttpSession session){
        //根据密码和用户名查找对应的用户信息
        User loginUser = userService.login(user);
        User preUser = (User) session.getAttribute("loginUser");
        if(preUser!=null){
            model.addAttribute("result", new AjaxResult(false, "您已登录，请不要重复登录"));
            return "admin/user/loginUI";
        }
        //如果找到了就把信息保存到session域，找不到就给出提示
        try {
            if (loginUser != null) {
                session.setAttribute("loginUser",loginUser);
                return "show";
            } else {
                model.addAttribute("result", new AjaxResult(false, "用户名和密码匹配失败"));
                System.out.println("登录失败");
                return "admin/user/loginUI";
            }
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("result",new AjaxResult(false,"发生错误了"));
            return "admin/user/loginUI";
        }
    }

    //用户退出
    @RequestMapping("logout")
    public String logout(HttpSession session){
        //移除指定的session的值
        session.removeAttribute("loginUser");
        return "show";
    }

    //跳转到用户后台管理页面
    @RequestMapping("show")
    public String show(){
        return TEMPLATE_PATH + "show" ;
    }

    //跳转到用户修改资料页面
    @RequestMapping("updateUI/{id}")
    public String updateUI(@PathVariable("id") Integer id, Model model){
        //根据ID找到对应的用户信息，显示到前台修改页面
        model.addAttribute("user",userService.findUpdateUser(id));
        return TEMPLATE_PATH + "updateUI";
    }

    //用户修改资料
    @RequestMapping("update")
    public String update(@Valid User user,BindingResult bindingResult,String oldAccount,HttpServletRequest request, RedirectAttributes redirectAttributes,HttpSession session,MultipartFile pictures){
        //后台校验用户的注册信息
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "格式填写错误！"));
            return "redirect:/admin/user/updateUI/" + user.getId();
        }
        //判断是否上传了图片
        if(pictures.getOriginalFilename().length() > 0){
            //判断上传的照片的类型是否符合要求
            if(!photoExt.contains(FileUploadUtil.getFileExt(pictures.getOriginalFilename()))) {
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "头像只能是照片格式的文件"));
                return "redirect:/admin/user/updateUI/" + user.getId();
            }
        }
        try{            //此处为后台校验
            if(oldAccount.equals(user.getAccount())){  //判断用户名是否与修改之前相同
                    if(pictures.getOriginalFilename().length() > 0){     //判断照片是否为空，为空就直接修改用户资料
                         user.setPhoto(FileUploadUtil.uploadUserPhoto(pictures,FileUploadUtil.USER_PATH));
                    }
                    userService.update(user);
                    session.setAttribute("loginUser",user);     //重新给session域的loginUser赋值
                    redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"操作成功"));
                    return  "redirect:/admin/user/index";

            }else if(user.getAccount()!=null && userService.checkAccount(user.getAccount()) > 0 ){      //判断用户名是否重复注册
                     redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"该账户已被使用，请重新注册"));
                    return  "redirect:/admin/user/updateUI/" + user.getId();
            }else{          //成功修改
                    redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"操作成功"));
                    session.setAttribute("loginUser",user);     //重新给session域的loginUser赋值
                    if(pictures.getOriginalFilename().length() > 0){
                        System.out.println("picctureName" + pictures.getOriginalFilename());
                        //上传图片，并且把图片的名称set进user对象里
                        user.setPhoto(FileUploadUtil.uploadUserPhoto(pictures,FileUploadUtil.USER_PATH));
                    }
                    //修改信息
                    userService.update(user);
                    return "redirect:/admin/user/index";
            }
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"内部错误"));
            return TEMPLATE_PATH + "updateUI/" + user.getId();
        }
    }

    //上传头像时用ajax实现图片预览功能
    @RequestMapping("showPhoto")
    public void showPhoto(PrintWriter outs, MultipartFile pictures, HttpServletRequest request) throws IOException {
        System.out.println(FileUploadUtil.getFileExt(pictures.getOriginalFilename()));
        System.out.println(!photoExt.contains(FileUploadUtil.getFileExt(pictures.getOriginalFilename())));
        //判断上传的图片格式是否正确，正确就返回图片的名称，可以在前台进行预览
        if(!photoExt.contains(FileUploadUtil.getFileExt(pictures.getOriginalFilename()))){
            outs.print("{\"showResult\":"+false+"}");
            outs.close();
        }
        //查看的图片的名称
        String photoName = FileUploadUtil.uploadUserPhoto(pictures,FileUploadUtil.USER_PATH);
        outs.print("{\"showResult\":\""+ photoName +"\"}");
        outs.close();
    }

    //跳转到用户查看安全设置页面
    @RequestMapping("securityUI/{id}")
    public String securityUI(@PathVariable("id") Integer id, Model model){
        System.out.println("id-->" + id);
        //根据id查找对应用户的信息
        User user = userService.findUpdateUser(id);
        //把手机号码中间的4位换成*号
        String phone = user.getPhoneNumber().replace(user.getPhoneNumber().substring(3,7),"****");
        //判断该用户是否已经绑定了邮箱，如果已绑定就把邮箱号中间的4位改为****
        if(user.getEmail() != null) {
            String email = user.getEmail().replace(user.getEmail().substring(3, 7), "****");
            model.addAttribute("email",email);
        }
        //保存邮箱和手机号，在修改页面时发生校验码要用到
        model.addAttribute("user",user);
        model.addAttribute("phone",phone);
        return TEMPLATE_PATH + "securityUI";
    }
    //跳转到用户修改手机页面
    @RequestMapping("updatePhoneUI/{id}")
    public String updatePhoneUI(@PathVariable("id") Integer id, Model model){
        model.addAttribute("user",userService.findUpdateUser(id));
        return TEMPLATE_PATH + "updatePhoneUI";
    }

    //用户修改邮箱或手机
    @RequestMapping("securityUpdate")
    public String securityUpdate(User user,RedirectAttributes redirectAttributes){
        System.out.println("user-___->" + user.toString());
        System.out.println("num" + userService.checkRepeat(user));
        //获取用户id
        Integer id = user.getId();
        //先把ID设为空，后台校验手机号或邮箱是否被注册过，若果不这样做的话检查是否被使用时会把ID一起查询，即根据ID和手机或邮箱查询
        //这样做校验的就是当前用户的信息
        user.setId(null);
        //判断用户手机或邮箱是否被注册
        if(userService.checkRepeat(user) > 0){
            if(user.getPhoneNumber() != null){
                redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"该手机号已被使用，请重新注册"));
                return  "redirect:/admin/user/updatePhoneUI/"+id;
            }else{
                redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"该邮箱已被使用，请重新注册"));
                return  "redirect:/admin/user/updateEmailUI/"+id;
            }
        }
        //若没被注册过就重新把ID值set进去，再修改
        user.setId(id);
        userService.update(user);
        return "redirect:/admin/user/index";
    }

    //跳转到绑定邮箱页面
    @RequestMapping("updateEmailUI/{id}")
    public String updateEmailUI(@PathVariable("id") Integer id, Model model){
       model.addAttribute("user",userService.findUpdateUser(id));
       return TEMPLATE_PATH + "updateEmailUI";
    }
    //用户绑定邮箱，发送校验码
    @RequestMapping("checkEmail")
    public void checkEmail(String email,PrintWriter outs){
        String checkNumber = MailUtils.send(email);
        System.out.println("email-->" + email);
        outs.print("{\"result\":\""+ checkNumber +"\"}");
        outs.close();
    }

    //用户找回密码时校验身份，根据用户名或邮箱或手机号进行校验
    @RequestMapping("checkUser")
    public void checkUser(String condition,PrintWriter outs){
        //根据用户名校验是否存在符合条件的用户
        User user = userService.checkUser(condition);
        //r如果不存在就返回false，存在就把邮箱和手机号和id已json的格式返回，前台发送校验信息时需要用到
        if(user == null){
            System.out.println("false");
            outs.print("{\"result\":"+false+"}");
            outs.close();
        }else{
            outs.print("{\"email\":\""+ user.getEmail() +"\",\"phoneNumber\":\"" + user.getPhoneNumber() + "\",\"id\":\"" + user.getId() + "\"}");
            outs.close();
        }
    }

    //用户找回密码通过校验后，重置密码
    @RequestMapping("findPassword")
    public String findPassword(User user,Model model){
        model.addAttribute("result",new AjaxResult(true,"找回密码成功"));
        userService.update(user);
        return "admin/user/loginUI";
    }

    //用户登录后展示左边的功能列表
    @RequestMapping("showLeft")
    public String showLeft(){
        return TEMPLATE_PATH + "left";
    }

    @RequestMapping("test")
    public void test(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
}
