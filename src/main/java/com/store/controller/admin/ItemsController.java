package com.store.controller.admin;

import com.store.been.AjaxResult;
import com.store.been.PageBean;
import com.store.model.Items;
import com.store.model.User;
import com.store.service.ItemsService;
import com.store.util.FileUploadUtil;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

/**
 * Created by 陈晓海 on 2017/7/17.
 * 商品控制器
 */
@Controller
@RequestMapping("admin/items")
public class ItemsController extends BaseAdminController<Items,Long>{
    @Autowired
    private ItemsService itemsService;

    //用户查看自己的商品
    @RequestMapping("itemsList")
    public String itemsList(Model model, PageBean pageBean,HttpSession httpSession,String preDate,String lastDate) throws ParseException {
        model.addAttribute("preDate",preDate);
        model.addAttribute("lastDate",lastDate);
        //获取用户的信息，因为在用户点击我的商品时是没法直接获取id的，所以只能通过取session域的对象来取值
        User user = (User) httpSession.getAttribute("loginUser");
        model.addAttribute("PageBean",itemsService.showItems(pageBean,user.getId(),preDate,lastDate));
        return TEMPLATE_PATH + "itemsList";
    }

    //用户跳转到添加商品的页面
    @RequestMapping("saveUI")
    public String saveUI(){
        return TEMPLATE_PATH + "saveUI";
    }

    //商品图片的预览功能
    //上传头像时用ajax实现图片预览功能
    @RequestMapping("showPhoto")
    public void showPhoto(PrintWriter outs, MultipartFile picture, HttpServletRequest request,Integer id) throws IOException {
        //判断上传的图片格式是否正确，正确就返回图片的名称，可以在前台进行预览
        if(!photoExt.contains(FileUploadUtil.getFileExt(picture.getOriginalFilename()))){
            outs.print("{\"showResult\":"+false+"}");
            outs.close();
        }
        //获取图片名称，返回后显示
        String photoName = FileUploadUtil.uploadUserPhoto(picture, FileUploadUtil.ITEMS_PATH);
        outs.print("{\"showResult\":\""+ photoName +"\"}");
        outs.close();
    }

    //用户增添商品
    @RequestMapping("save")
    public String save(@Valid Items items, BindingResult bindingResult, RedirectAttributes redirectAttributes, MultipartFile picture) throws Exception {
        if(picture.getOriginalFilename().length() > 0){
            //判断上传的照片的类型是否符合要求
            if(!photoExt.contains(FileUploadUtil.getFileExt(picture.getOriginalFilename()))) {
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "头像只能是照片格式的文件"));
                return REDIRECT_URL + "updateUI/" + items.getId();
            }
        }
        //检查商品的信息格式是否正确
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"格式填写错误!"));
            return REDIRECT_URL+ "saveUI";
        }
        //判断是否上传了图片，如果有就设置图片名称
        if(picture.getOriginalFilename().length() > 0){
            String photoName = FileUploadUtil.uploadUserPhoto(picture,FileUploadUtil.ITEMS_PATH);
            items.setPhoto(photoName);
        }
        //判断前台是否取得到商品的id值，如果取不到，就是增添操作，如果取得到，就是修改操作
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
    public String deleteByIds(Integer[] ids) throws Exception {
        itemsService.delete(ids);
        return REDIRECT_URL + "itemsList";
    }
    //用户删除单个商品
    @RequestMapping("deleteOne")
    public String deleteOne(Integer id){
        itemsService.deleteOne(id);
        return REDIRECT_URL + "itemsList";
    }

    //用户导出商品信息
    @RequestMapping("exportExcel")
    public void exportExcel( @RequestParam("ids") Integer[] ids,HttpServletResponse response) throws Exception {
        System.out.println(ids);
        List<Items> list = itemsService.expList(ids);
        response.setContentType("application/x-excel");
        response.setHeader("Content-Disposition", "attachment;filename=" + new String("商品列表.xls".getBytes(), "ISO-8859-1"));
        ServletOutputStream outputStream = response.getOutputStream();
        itemsService.exportExcel(list,outputStream);
        if(outputStream != null){
            outputStream.close();
        }
    }

    //导入商品信息
    @RequestMapping("importExcel")
    public String importExcel(MultipartFile itemsFile,HttpSession session,RedirectAttributes redirectAttributes){
        String excelExt = "xls,xlsx";
        //后台校验导入的文件是否为excel格式的文件
        if(!excelExt.contains(FileUploadUtil.getFileExt(itemsFile.getOriginalFilename()))){
            redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"只能导入excel格式的文件"));
            return REDIRECT_URL + "itemsList";
        }
        User user = (User) session.getAttribute("loginUser");
        itemsService.importExcel(itemsFile,user.getId());
        return REDIRECT_URL + "itemsList";
    }

    //校验用户选择导入的文件是否为excel文件
    @RequestMapping("checkExcel")
    public void checkExcel(PrintWriter outs, MultipartFile itemsFile) throws IOException {
        System.out.println(FileUploadUtil.getFileExt(itemsFile.getOriginalFilename()));
        System.out.println(!photoExt.contains(FileUploadUtil.getFileExt(itemsFile.getOriginalFilename())));
        //excel文件的后缀名
        String excelExt = "xls,xlsx";
        //判断要导入的excel文件的格式是否正确
        if(!excelExt.contains(FileUploadUtil.getFileExt(itemsFile.getOriginalFilename()))){
            outs.print("{\"checkResult\":"+false+"}");
            outs.close();
        }else{
            outs.print("{\"checkResult\":"+true+"}");
            outs.close();
        }
    }

    //用户查看指定类型的商品
    @RequestMapping("showTypeItems")
    public String showTypeItems(String type,Model model,PageBean pageBean,RedirectAttributes redirectAttributes) throws Exception {
        System.out.println("type-->" + type);
        System.out.println("searchtext-->" + pageBean.getSearchText());
        if(type == null){
            if(pageBean.getSearchText() == null || pageBean.getSearchText().equals("")){
                redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"没有找到符相关宝贝"));
                return "redirect:/admin/advertisement/indexAd";
            }
        }
        model.addAttribute("PageBean",itemsService.showTypeItems(type,pageBean));
        model.addAttribute("type",type);        //把type的值传到前台，这里不在前台用pagebean取是因为如果在前台取的话将是取到一个数组，而不是字符串
        return "admin/items/product";
    }

    //用户查看商品详情
    @RequestMapping("viewItems")
    public String viewItems(Integer id,Model model){
        System.out.println("id" + id);
        model.addAttribute("userItems",itemsService.selectUserItems(id));
        model.addAttribute("items",itemsService.showOneItems(id));
        return "admin/items/itemsShow";
    }



}
