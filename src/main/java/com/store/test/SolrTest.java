package com.store.test;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

/**
 * Created by 陈晓海 on 2017/8/20.
 */
public class SolrTest {

    @Test
    public void testAdd() throws IOException, SolrServerException {
        // 创建HttpSolrServer
        HttpSolrServer solrServer = new HttpSolrServer("http://192.168.216.132:88/solr");
        SolrInputDocument document = new SolrInputDocument();
        document.setField("item_price","99");
        document.setField("item_number","55");
        document.setField("item_photo","照片");
        document.setField("item_type","美食");
        document.setField("item_title","测试美食");
        document.setField("item_name","名字");
        document.setField("id","99");
        solrServer.add(document);
//        solrServer.deleteById("10086");
        solrServer.commit();
    }
}
