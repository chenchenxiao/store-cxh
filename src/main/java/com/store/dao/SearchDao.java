package com.store.dao;

import com.store.been.PageBean;
import org.apache.solr.client.solrj.SolrQuery;

/**
 * Created by 陈晓海 on 2017/8/20.
 */
public interface SearchDao {
    PageBean search(SolrQuery query) throws Exception;
}
