package com.store.service.impl;

import com.store.been.AjaxResult;
import com.store.been.PageBean;
import com.store.dao.ItemsMapper;
import com.store.dao.SearchDao;
import com.store.model.Items;
import com.store.service.SolrSearchService;
import com.store.util.ExceptionUtil;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/8/20.
 */
@Service
public class SolrSearchServiceImpl implements SolrSearchService {
    @Autowired
    private ItemsMapper itemsMapper;
    @Autowired
    private SolrServer solrServer;
    @Autowired
    private SearchDao searchDao;
    public AjaxResult importData() throws IOException, SolrServerException {
        List<Items> itemsList = itemsMapper.selectAll();
        try{
            for(Items items:itemsList){
                SolrInputDocument document = new SolrInputDocument();
                document.setField("id",items.getId());
                document.setField("item_title",items.getTitle());
                document.setField("item_type",items.getType());
                document.setField("item_name",items.getName());
                document.setField("item_number",items.getNumber());
                document.setField("item_price",items.getPrice());
                document.setField("item_photo",items.getPhoto());
                solrServer.add(document);
            }
            solrServer.commit();
        }catch (Exception e){
            e.printStackTrace();
            return new AjaxResult(false, ExceptionUtil.getStackTrace(e));
        }
        return new AjaxResult(true,"导入成功");
    }

    public PageBean search(PageBean pageBean) throws Exception {
//        pageBean.setSearchText(new String(pageBean.getSearchText().getBytes("ISO-8859-1"),"utf-8"));
        String searchtext = pageBean.getSearchText();
        System.out.println(searchtext);
        //查询对象
        SolrQuery solrQuery = new SolrQuery();
        //查询条件
        solrQuery.setQuery("item_title:" + pageBean.getSearchText());
        //分页开始页数
        solrQuery.setStart((pageBean.getPage() - 1) * pageBean.getSize());
        //每页显示几条
        solrQuery.setRows(pageBean.getSize());
        //过滤条件
        solrQuery.set("df","item_keywords");
        //高亮设置
        solrQuery.setHighlight(true);
        solrQuery.addHighlightField("item_title");
        solrQuery.setHighlightSimplePre("<em style=\\\"color:red\\\">");
        solrQuery.setHighlightSimplePost("</em>");
        //取得查到数据后返回的pageBean
        pageBean = searchDao.search(solrQuery);
        return pageBean;
    }
}
