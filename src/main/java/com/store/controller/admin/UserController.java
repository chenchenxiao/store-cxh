package com.store.controller.admin;

import com.store.been.AjaxResult;
import com.store.model.User;
import com.store.service.UserService;
import com.store.util.CheckNumberUtil;
import com.store.util.FileUploadUtil;
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
    public void checkName(User user,PrintWriter outs){
        System.out.println(user.getAccount());
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
        System.out.println(pictures.getOriginalFilename());
        String filePath = request.getSession().getServletContext().getRealPath("") + FileUploadUtil.USER_PATH;
        try{
            if(oldAccount.equals(user.getAccount())){
                if(!photoExt.contains(FileUploadUtil.getFileExt(pictures.getOriginalFilename()))){
                    redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"头像只能是照片格式的文件"));
                    return  "redirect:/admin/user/updateUI/" + user.getId();
                }else{
                    String photoName =  UUID.randomUUID().toString() + "." + FileUploadUtil.getFileExt(pictures.getOriginalFilename());
                    if(pictures!=null){
                        File file = new File(filePath);
                        if(!file.exists()){
                            file.mkdirs();
                        }
                        //存照片到webapp下
                        pictures.transferTo(new File(file,photoName));
                    }
                    user.setPhoto(photoName);
                    userService.update(user);
                    redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"操作成功"));
                    return  "redirect:/admin/user/index";
                }
            }else if(userService.checkAccount(user.getAccount()) > 0){
                redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"该账户已被使用，请重新注册"));
                return  "redirect:/admin/user/updateUI/" + user.getId();
            }else{
                redirectAttributes.addFlashAttribute("result",new AjaxResult(true,"操作成功"));
                session.setAttribute("loginUser",user);
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
            System.out.println("!!!!!!!!!false");
            outs.print("{\"showResult\":"+false+"}");
            outs.close();
        }
        String filePath = request.getSession().getServletContext().getRealPath("") + FileUploadUtil.USER_PATH;
        String photoName =  UUID.randomUUID().toString() + "." + FileUploadUtil.getFileExt(pictures.getOriginalFilename());
        if(pictures!=null){
            File file = new File(filePath);
            if(!file.exists()){
                file.mkdirs();
            }
            //存照片到webapp下的images里
           pictures.transferTo(new File(file,photoName));
            //返回图片的名字
            outs.print("{\"showResult\":\""+photoName+"\"}");
            outs.close();
        }
//        String photoName = FileUploadUtil.uploadFile(pictures);
//        outs.print("{\"showResult\":\""+photoName+"\"}");
//        outs.close();
//        String uploadPath = request.getSession().getServletContext().getRealPath("")+ "photo";
//        try {
//            if(pictures!=null){
//                System.out.println("photo!=null");
//                File file = new File(uploadPath);
//                if(!file.exists()){
//                    file.mkdirs();
//                }
//                //照片的名称
//                String photoName = UUID.randomUUID().toString() + "." + FileUploadUtil.getFileExt(pictures.getOriginalFilename());
//                //存照片到webApp下的images里
//                pictures.transferTo(new File(file,photoName));
//                //返回图片的名字
//                outs.print("{\"showResult\":\""+photoName+"\"}");
//                outs.close();
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    @RequestMapping("test")
    public void test(){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
}
