package com.store.service;

import com.store.been.AjaxResult;
import com.store.been.PageBean;
import org.apache.solr.client.solrj.SolrServerException;

import java.io.IOException;

/**
 * Created by 陈晓海 on 2017/8/20.
 */
public interface SolrSearchService {
    AjaxResult importData() throws IOException, SolrServerException;

    PageBean search(PageBean pageBean) throws Exception;


}
