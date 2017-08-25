package com.store.controller.admin;

import com.store.been.AjaxResult;
import com.store.been.PageBean;
import com.store.been.TaotaoResult;
import com.store.service.SolrSearchService;
import org.apache.solr.client.solrj.SolrServerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/**
 * Created by 陈晓海 on 2017/8/20.
 */
@Controller
@RequestMapping("admin/search")
public class SearchController {
    @Autowired
    private SolrSearchService searchService;
    @RequestMapping("importData")
    @ResponseBody
    public AjaxResult importData() throws Exception {
        return searchService.importData();
    }
    @RequestMapping("searching")
    @ResponseBody
    public TaotaoResult search(PageBean pageBean) throws Exception {
        if(pageBean.getSearchText() == null){
            return TaotaoResult.build(400,"查询的条件不能为空");
        }
        System.out.println(pageBean.getSearchText());
        pageBean = searchService.search(pageBean);
        System.out.println(pageBean.getRecordList().size());
        return TaotaoResult.ok(pageBean);
    }
}
