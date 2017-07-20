package com.store.controller.admin;

import com.store.been.AjaxResult;
import com.store.been.PageBean;
import com.store.model.Items;
import com.store.model.User;
import com.store.service.impl.ItemsService;
import com.store.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 陈晓海 on 2017/7/17.
 */
@Controller
@RequestMapping("admin/items")
public class ItemsController extends BaseAdminController<Items,Long>{
    @Autowired
    private ItemsService itemsService;

    //用户点击我的商品查看已上架的商品
    @RequestMapping("itemsList")
    public String itemsList(Model model, PageBean pageBean,HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        model.addAttribute("PageBean",itemsService.showItems(pageBean,user.getId()));
        return TEMPLATE_PATH + "itemsList";
    }

    //用户跳转到修改或添加商品的页面
    @RequestMapping("saveUI")
    public String saveUI(){
        return TEMPLATE_PATH + "saveUI";
    }

    //商品图片的预览功能
    //上传头像时用ajax实现图片预览功能
    @RequestMapping("showPhoto")
    public void showPhoto(PrintWriter outs, MultipartFile picture, HttpServletRequest request) throws IOException {
        System.out.println(FileUploadUtil.getFileExt(picture.getOriginalFilename()));
        System.out.println(!photoExt.contains(FileUploadUtil.getFileExt(picture.getOriginalFilename())));
        //判断上传的图片格式是否正确，正确就返回图片的名称，可以在前台进行预览
        if(!photoExt.contains(FileUploadUtil.getFileExt(picture.getOriginalFilename()))){
            outs.print("{\"showResult\":"+false+"}");
            outs.close();
        }
        //查看的图片的名称
        String photoName = FileUploadUtil.uploadUserPhoto(picture,FileUploadUtil.ITEMS_PATH);
        outs.print("{\"showResult\":\""+ photoName +"\"}");
        outs.close();
    }

    //用户增添商品
    @RequestMapping("save")
    public String save(@Valid Items items, BindingResult bindingResult, RedirectAttributes redirectAttributes, MultipartFile picture,HttpSession session){
//        User user = (User) session.getAttribute("loginUser");
        if(picture.getOriginalFilename().length() > 0){
            //判断上传的照片的类型是否符合要求
            if(!photoExt.contains(FileUploadUtil.getFileExt(picture.getOriginalFilename()))) {
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "头像只能是照片格式的文件"));
                return REDIRECT_URL + "saveUI";
            }
        }
        //检查商品的信息格式是否正确
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"格式填写错误!"));
            return REDIRECT_URL+ "saveUI";
        }

        if(picture.getOriginalFilename().length() > 0){
            items.setPhoto(FileUploadUtil.uploadUserPhoto(picture,FileUploadUtil.ITEMS_PATH));
        }
//        items.setUser(user);
        if(items.getId() == null){
            itemsService.save(items);
        }
        else{
            itemsService.update(items);
        }
        return REDIRECT_URL + "itemsList";
    }

    //用户点击修改页面显示所要修改的商品的信息
    @RequestMapping("updateUI/{id}")
    public String updateUI(@PathVariable Integer id,Model model){
        model.addAttribute("item",itemsService.showOneItems(id));
        return TEMPLATE_PATH + "saveUI";
    }

    //用户批量删除商品
    @RequestMapping("deleteByIds")
    public String deleteByIds(Integer[] ids){
        itemsService.delete(ids);
        return REDIRECT_URL + "itemsList";
    }

    //用户删除单个商品
    @RequestMapping("deleteOne")
    public String deleteOne(Integer id){
        itemsService.deleteOne(id);
        return REDIRECT_URL + "itemsList";
    }
}
