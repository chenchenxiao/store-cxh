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
    UserService userService;

    //校验用户名或手机号是否已被注册
    @RequestMapping("checkRepeat")
    public void checkRepeat(User user,PrintWriter outs){
        System.out.println("user-___->" + user);
        if(userService.checkRepeat(user) > 0){
            System.out.println("boolean-->" + false);
            outs.print("{\"result\":"+false+"}");
        }else{
            System.out.println("boolean-->" + true);
            outs.print("{\"result\":"+true+"}");
        }
    }

    //获取手机验证码
    @RequestMapping("checkPhone")
    public void phoneCheck(String phoneNumber,PrintWriter outs) throws IOException {
        System.out.println("phoneNumber-->" + phoneNumber);
        String checkNumber = CheckNumberUtil.getCheckNumber();
//        SendPhoneMsgUtil.sendMsg(phoneNumber,checkNumber);
        System.out.println("发送完短信了");
        outs.print("{\"result\":"+checkNumber+"}");
    }

    //注册用户
    @RequestMapping("regist")
    public String regist(@Valid User user,BindingResult bindingResult, Model model){
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
        User loginUser = userService.login(user);
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
        model.addAttribute("user",userService.findUpdateUser(id));
        return TEMPLATE_PATH + "updateUI";
    }

    //用户修改资料
    @RequestMapping("update")
    public String update(User user,String oldAccount,HttpServletRequest request, RedirectAttributes redirectAttributes,HttpSession session,MultipartFile pictures){
        //图片的保存路径
        try{
            if(oldAccount.equals(user.getAccount())){  //判断用户名是否与修改之前相同
                if(!photoExt.contains(FileUploadUtil.getFileExt(pictures.getOriginalFilename()))){      //判断上传的照片的类型是否符合要求
                    redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"头像只能是照片格式的文件"));
                    return  "redirect:/admin/user/updateUI/" + user.getId();
                }else{      //修改照片的名字
                    if(pictures.getOriginalFilename().length() > 0){     //判断照片是否为空，为空就直接修改用户资料
                       user.setPhoto(FileUploadUtil.uploadUserPhoto(pictures,FileUploadUtil.USER_PATH));
                    }
                    userService.update(user);
                    session.setAttribute("loginUser",user);
                    redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"操作成功"));
                    return  "redirect:/admin/user/index";
                }
            }else if(user.getAccount()!=null && userService.checkAccount(user.getAccount()) > 0 ){      //判断用户名是否重复注册
                     redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"该账户已被使用，请重新注册"));
                    return  "redirect:/admin/user/updateUI/" + user.getId();
            }else{          //成功修改
                    redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"操作成功"));
                    session.setAttribute("loginUser",user);
                    if(pictures.getOriginalFilename().length() > 0){
                        System.out.println("picctureName" + pictures.getOriginalFilename());
                        user.setPhoto(FileUploadUtil.uploadUserPhoto(pictures,FileUploadUtil.USER_PATH));
                    }
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
        if(!photoExt.contains(FileUploadUtil.getFileExt(pictures.getOriginalFilename()))){
            outs.print("{\"showResult\":"+false+"}");
            outs.close();
        }
//        String filePath = request.getSession().getServletContext().getRealPath("") + FileUploadUtil.USER_PATH;
//        String photoName =  UUID.randomUUID().toString() + "." + FileUploadUtil.getFileExt(pictures.getOriginalFilename());
//        if(pictures!=null){
//            File file = new File(filePath);
//            if(!file.exists()){
//                file.mkdirs();
//            }
//            //存照片到webapp下的images里
//           pictures.transferTo(new File(file,photoName));
//            //返回图片的名字
        String photoName = FileUploadUtil.uploadUserPhoto(pictures,FileUploadUtil.USER_PATH);
        outs.print("{\"showResult\":\""+ photoName +"\"}");
        outs.close();
    }

    //跳转到用户查看安全设置页面
    @RequestMapping("securityUI/{id}")
    public String securityUI(@PathVariable("id") Integer id, Model model){
        User user = userService.findUpdateUser(id);
        //把手机号码中间的4位换成*号
        String phone = user.getPhoneNumber().replace(user.getPhoneNumber().substring(3,7),"****");
        String email = user.getEmail().replace(user.getEmail().substring(3,7),"****");
        model.addAttribute("user",user);
        model.addAttribute("email",email);
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
        Integer id = user.getId();
        user.setId(null);
        if(userService.checkRepeat(user) > 0){
            if(user.getPhoneNumber() != null){
                redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"该手机号已被使用，请重新注册"));
                return  "redirect:/admin/user/updatePhoneUI/"+id;
            }else{
                redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"该邮箱已被使用，请重新注册"));
                return  "redirect:/admin/user/updateEmailUI/"+id;
            }
        }
        userService.update(user);
        return "redirect:/admin/user/index";
    }

    //跳转到绑定邮箱页面
    @RequestMapping("updateEmailUI/{id}")
    public String updateEmailUI(@PathVariable("id") Integer id, Model model){
       model.addAttribute("user",userService.findUpdateUser(id));
       return TEMPLATE_PATH + "updateEmailUI";
    }
    //用户绑定，校验邮箱
    @RequestMapping("checkEmail")
    public void checkEmail(String email,PrintWriter outs){
        String checkNumber = MailUtils.send(email);
        System.out.println("email-->" + email);
        outs.print("{\"result\":\""+ checkNumber +"\"}");
    }

    //用户找回密码时校验身份
    @RequestMapping("checkUser")
    public void checkUser(String condition,PrintWriter outs){
        User user = userService.checkUser(condition);
        System.out.println("user" + user);
        if(user == null){
            outs.print("{\"result\":"+false+"}");
            System.out.println("false");
        }else{
            outs.print("{\"email\":\""+ user.getEmail() +"\",\"phoneNumber\":\"" + user.getPhoneNumber() + "\",\"id\":\"" + user.getId() + "\"}");
        }
    }

    //用户找回密码，重置密码
    @RequestMapping("findPassword")
    public String findPassword(User user,Model model){
        model.addAttribute("result",new AjaxResult(true,"找回密码成功"));
        userService.update(user);
        return "admin/user/loginUI";
    }

    @RequestMapping("test")
    public void test(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
}
