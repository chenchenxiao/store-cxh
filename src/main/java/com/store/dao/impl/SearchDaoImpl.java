package com.store.dao.impl;

import com.store.been.PageBean;
import com.store.dao.SearchDao;
import com.store.model.Items;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by 陈晓海 on 2017/8/20.
 */
@Repository
public class SearchDaoImpl implements SearchDao {

    @Autowired
    SolrServer solrServer;

    public PageBean search(SolrQuery query) throws Exception {
        //查询到的结果
        QueryResponse queryResponse = solrServer.query(query);
        SolrDocumentList solrDocumentList = queryResponse.getResults();
        //商品的集合
        List<Items> itemsList  = new ArrayList<Items>();
        //高亮的结果
        Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
        //遍历得到itemList
        for(SolrDocument solrDocument:solrDocumentList){
            Items items = new Items();
            //设值
            List<String> list = highlighting.get(solrDocument.get("id")).get("item_title");
            items.setId(Integer.valueOf(String.valueOf(solrDocument.get("id"))));
            String title = "";
            //判断查询到的值是否高亮
            if(list != null && list.size() > 0){
                title = list.get(0);
            }else{
                title = (String) solrDocument.get("item_title");
            }
            items.setTitle(title);
            items.setType((String) solrDocument.get("item_type"));
            items.setNumber(Integer.valueOf(String.valueOf(solrDocument.get("item_number"))));
            items.setPrice(Float.valueOf(String.valueOf(solrDocument.get("item_price"))));
            items.setName((String) solrDocument.get("item_name"));
            items.setPhoto((String) solrDocument.get("item_photo"));
            itemsList.add(items);
        }
    return new PageBean().init((int) solrDocumentList.getNumFound(),itemsList);
    }
}
