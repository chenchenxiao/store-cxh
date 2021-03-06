package com.store.controller.admin;

import com.store.been.AjaxResult;
import com.store.been.PageBean;
import com.store.dao.LuceneDao;
import com.store.model.Advertisement;
import com.store.model.Items;
import com.store.model.ItemsCustom;
import com.store.model.User;
import com.store.service.AdvertisementService;
import com.store.util.FileUploadUtil;
import com.store.util.LuceneUtil;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/28.
 * 广告的控制器
 */
@Controller
@RequestMapping("/admin/advertisement")
public class AdvertisementController extends BaseAdminController<Advertisement,Long>{
    @Autowired
    private AdvertisementService advertisementService;
    //上传广告图片时的图片预览功能
    @RequestMapping("showPhoto")
    public void showPhoto(PrintWriter outs, MultipartFile picture, HttpServletRequest request, Integer id) throws IOException {
        //判断上传的图片格式是否正确，正确就返回图片的名称，可以在前台进行预览
        if(!photoExt.contains(FileUploadUtil.getFileExt(picture.getOriginalFilename()))){
            outs.print("{\"showResult\":"+false+"}");
            outs.close();
        }
        //获取图片名称，返回后显示
        String photoName = FileUploadUtil.uploadUserPhoto(picture, FileUploadUtil.ADVERTISEMENT_PATH);
        outs.print("{\"showResult\":\""+ photoName +"\"}");
        outs.close();
    }

    //显示用户所有的广告
    @RequestMapping("showAdvertisement")
    public String showAdvertisement(HttpSession session, Model model, PageBean pageBean){
        User user = (User) session.getAttribute("loginUser");
        model.addAttribute("PageBean",advertisementService.showAdvertisements(user.getId(),pageBean));
        return TEMPLATE_PATH + "advertisementList";
    }

    //跳转到用户上传广告页
    @RequestMapping("adSaveUI")
    public String adSaveUI(HttpSession session,Model model){
        //从session从取得登录用户的信息
        User user = (User) session.getAttribute("loginUser");
        //根据用户id取得对应的商品集合
        List<Items> itemsList = advertisementService.showAllItems(user.getId());
        System.out.println(itemsList.size());
        //查询用户所有的商品，用来显示在多选框上
        model.addAttribute("itemsList",itemsList);
        return TEMPLATE_PATH + "adSaveUI";
    }

    //用户上传广告
    @RequestMapping("saveAd")
    public String saveAd(@Valid Advertisement advertisement, BindingResult bindingResult,String uid, Model model, RedirectAttributes redirectAttributes,MultipartFile picture){
        System.out.println(advertisement.getDescription());
        if(picture.getOriginalFilename().length() > 0){
            //判断上传的照片的类型是否符合要求
            if(!photoExt.contains(FileUploadUtil.getFileExt(picture.getOriginalFilename()))) {
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "图片格式不正确"));
                return REDIRECT_URL + "adSaveUI" ;
            }
        }
        //判断填写的信息格式是否正确
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("result",new AjaxResult(false,"商品介绍长度在3到8个字符串之间！"));
            return REDIRECT_URL + "adSaveUI";
        }
        //判断是否上传了图片，如果有就设置图片的名称
        if(picture.getOriginalFilename().length() > 0){
            String photoName = FileUploadUtil.uploadUserPhoto(picture,FileUploadUtil.ADVERTISEMENT_PATH);
            advertisement.setPhoto(photoName);
        }
        //根据广告是否有id选择增添或修改方法
        if(advertisement.getId() != null){
           advertisementService.update(advertisement);
        }else{
           advertisementService.add(advertisement);
        }
        return REDIRECT_URL + "showAdvertisement" ;
    }

    //删除单个广告信息
    @RequestMapping("deleteOneAd/{id}")
    public String deleteOneId(@PathVariable("id") Integer id){
        advertisementService.deleteOne(id);
        return REDIRECT_URL + "showAdvertisement";
    }
    //删除多个广告信息
    @RequestMapping("deleteByIds")
    public String deleteByIds(Integer[] ids){
        advertisementService.deleteByIds(ids);
        return REDIRECT_URL + "showAdvertisement";
    }
    //跳转到修改广告信息
    @RequestMapping("updateUI/{id}")
    public String updateUI(@PathVariable("id") Integer id,Model model,HttpSession session){
        //从session从取得登录用户的信息
        User user = (User) session.getAttribute("loginUser");
        //根据用户id取得对应的商品集合
        List<Items> itemsList = advertisementService.showAllItems(user.getId());
        model.addAttribute("itemsList",itemsList);
        Advertisement advertisement = advertisementService.selectById(id);
        model.addAttribute("ad",advertisement);
        return TEMPLATE_PATH + "adSaveUI";
    }

    //商城首页，要显示广告信息，同时把数据库的商品数据存入lucene索引库
    @RequestMapping("indexAd")
    public String indexAd(Model model) throws Exception {
        List<Advertisement> advertisementList = advertisementService.selectByStatus();
        model.addAttribute("adList",advertisementList);
        //热销商品
        model.addAttribute("hotSellList",advertisementService.selectHotSell(null));
        //推荐商品
        List<Items> clothesList = advertisementService.selectHotSell("服装");
        List<Items> foodList = advertisementService.selectHotSell("美食");
        List<Items> notebookList = advertisementService.selectHotSell("笔记本");
        List<Items> sportsList = advertisementService.selectHotSell("运动");
        List<Items> homeList = advertisementService.selectHotSell("家居");
        //判断取得的集合中是否存在数据，如果有就取第一个
        if(clothesList.size() > 0){
            model.addAttribute("clothes",clothesList.get(0));
            System.out.println(clothesList.get(0));
        }
        if(foodList.size() > 0){
            model.addAttribute("food",foodList.get(0));
            System.out.println(foodList.get(0));
        }
        if(notebookList.size() > 0){
            model.addAttribute("notebook",notebookList.get(0));
            System.out.println(notebookList.get(0));
        }
        if(sportsList.size() > 0){
            model.addAttribute("sports",sportsList.get(0));
            System.out.println(sportsList.get(0));
        }
        if(homeList.size() > 0){
            model.addAttribute("home",homeList.get(0));
            System.out.println(homeList.get(0));
        }
        return "/show";
    }

    private int page;       //定时更新时开始分页的页数

    //每隔一小时更新数据库的广告数据，即更新显示状态
    @Scheduled(cron = "0 0 */1 * * ?")
    public void quartzUpdate(){
        page++;
        //获得总分页数
        Long aLong = advertisementService.comparePage(page,5);
        //比较总分页数是否小于page，如果是就让page为1，重头开始刷新数据
        if(aLong < page){
            this.page = 1;
        }
        //执行更新操作
        advertisementService.quartzUpdate(page,5);
    }


    @RequestMapping("testLucene")
    public void testLucene() throws Exception {
        LuceneDao luceneDao = new LuceneDao();
        luceneDao.deleteAll();
        System.out.println("delete");
    }

}
