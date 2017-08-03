package com.store.dao;

import com.store.been.PageBean;
import com.store.model.ItemsCustom;
import com.store.util.LuceneUtil;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.*;
import org.apache.lucene.store.Directory;
import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/8/1.
 * lucene全文检索dao
 */
public class LuceneDao {

    //根据关键字查询,分页
    public PageBean findAllByKeywords(PageBean pageBean) throws Exception{
        //创建用于存查找出来的数据的list
        List<ItemsCustom> itemsCustomList = new ArrayList<ItemsCustom>();
        //分词器版本，要查询的字段，使用第三方分词器IKAnalyzer
        QueryParser queryParser = new MultiFieldQueryParser(LuceneUtil.getVersion(),new String[]{"type","title","name"},LuceneUtil.getAnalyzer());
        //创建封装查询关键字的对象
        Query query = queryParser.parse(pageBean.getSearchText());
        //创建IndexSearcher对象
        IndexSearcher indexSearcher = new IndexSearcher(LuceneUtil.getDirectory());
        //查询，每次只取查到的前100条数据
        TopDocs topDocs = indexSearcher.search(query,100);//核心
        //以下代码对内容中含有关键字的字符串高亮显示
        //格式对象
        Formatter formatter = new SimpleHTMLFormatter("<font color='red'>","</font>");
        //关键字对象
        Scorer scorer = new QueryScorer(query);
        //高亮对象
        Highlighter highlighter = new Highlighter(formatter,scorer);
        //搜索多少条记录，如果当前开始的条数大于总条数，则取总条数
        Integer size = pageBean.getSize();
        Integer start = (pageBean.getPage() - 1) * size;
        int middle = Math.min(start + size,topDocs.totalHits);
        for(int i=start;i<middle;i++){
            //取查询后的单条数据
            ScoreDoc scoreDoc = topDocs.scoreDocs[i];
            int no = scoreDoc.doc;
            //关键字没有高亮
            Document document = indexSearcher.doc(no);
            //关键字高亮
            String typeHighlighter = highlighter.getBestFragment(LuceneUtil.getAnalyzer(),"type",document.get("type"));
            String titleHighlighter = highlighter.getBestFragment(LuceneUtil.getAnalyzer(),"title",document.get("title"));
            String nameHighlighter = highlighter.getBestFragment(LuceneUtil.getAnalyzer(),"name",document.get("name"));
            //判断是否查找到数据，如果找得到就将高亮后的结果再次封装到document对象中
            if(typeHighlighter != null){
                 document.getField("type").setValue(typeHighlighter);
            }if(titleHighlighter != null){
                document.getField("title").setValue(titleHighlighter);
            }if(nameHighlighter != null){
                document.getField("name").setValue(nameHighlighter);
            }
            //把数据转为javabean
            ItemsCustom itemsCustom = (ItemsCustom)LuceneUtil.document2javabean(document,ItemsCustom.class);
            //把javabean填入list集合
            itemsCustomList.add(itemsCustom);
        }
        pageBean.init(topDocs.totalHits,itemsCustomList);
        return pageBean.init(topDocs.totalHits,itemsCustomList);
    }

    //根据id从索引库删除对应数据
    public void deleteOne(Integer id) throws Exception{
        System.out.println("OK?");
        //创建IndexWriter对象，第一个参数是lucene索引库最终对应于硬盘中的目录，
        // 第二个是分词器
        // 第三个是最多将稳步拆分成出多少词汇
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
        //执行删除操作
        indexWriter.deleteDocuments(new Term("id",id.toString()));//核心
        indexWriter.close();
    }
    //批量删除索引库的数据
    public void deleteByIds(Integer[] ids) throws Exception {
        //创建IndexWriter对象，第一个参数是lucene索引库最终对应于硬盘中的目录，
        // 第二个是分词器
        // 第三个是最多将稳步拆分成出多少词汇
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
        //通过遍历删除数据
        for(Integer id:ids){
            indexWriter.deleteDocuments(new Term("id",id.toString()));//核心
        }
        indexWriter.close();
    }
    //删除索引库的所有数据
    public void deleteAll() throws Exception {
        //创建IndexWriter对象，第一个参数是lucene索引库最终对应于硬盘中的目录，
        // 第二个是分词器
        // 第三个是最多将稳步拆分成出多少词汇
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
        //执行删除操作
        indexWriter.deleteAll();
        indexWriter.close();
    }

    //增添单条数据到索引库中
    public void add(ItemsCustom itemsCustom) throws Exception{
        //将javabean转成document对象
        Document document = LuceneUtil.javabean2document(itemsCustom);
        //创建IndexWriter对象
        // 第一个参数是lucene索引库最终对应于硬盘中的目录，
        // 第二个是分词器
        // 第三个是最多将文本拆分出多少词汇，取前多少个
        if (IndexWriter.isLocked(LuceneUtil.getDirectory())) {
            IndexWriter.unlock(LuceneUtil.getDirectory());
        }
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
        //执行增添操作
        indexWriter.addDocument(document);//核心
        indexWriter.close();
    }

    //添加多条数据到索引库
    public void addList(List<?> list) throws Exception {
        System.out.println("Dao-->" + list.toString());
        //获得document对象的list集合
        List<Document> documentList = (List<Document>) LuceneUtil.javabean2documentList(list);
//        List<Document> documentList = new ArrayList<Document>();
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
        //通过遍历把document对象加入索引库中
        for(int i = 0;i < documentList.size();i++){
            indexWriter.addDocument(documentList.get(i));//核心
        }
        //合并cfs文件
//        indexWriter.optimize();
        //每隔2个文件合并一次cfs文件
//        indexWriter.setMergeFactor(2);
        indexWriter.close();
    }

    //根据传入的对象的id修改索引库中单条数据
    public void update(ItemsCustom itemsCustom) throws Exception{
        //将javabean转成document对象
        Document document = LuceneUtil.javabean2document(itemsCustom);
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
		/*
		 * 参数一：term表示需要更新的document对象，id表示document对象中的id属性
		 * 参数二：新的document对象
		 */
        indexWriter.updateDocument(new Term("id",itemsCustom.getId().toString()),document);//核心
        indexWriter.close();
    }

    //判断索引库是否已经存在数据的方法
    public Boolean isIndexNull(){
        Directory directory  = LuceneUtil.getDirectory();
        //建立索引搜索，指定索引目录
        Integer number = 0;
        try {
            String[] strings = directory.listAll();
            System.out.println("strings" + strings.toString());
            //判断是否存在文件，如果不存在则说明没有数据
//            if(!directory.fileExists("_0.cfs")){
//                System.out.println(strings.toString());
//                System.out.println("directory.fileExists(\"_0.cfs\")???" + directory.fileExists("_0.cfs"));
//                return true;
//            }
            if(strings.length > 2){
                IndexSearcher searcher = new IndexSearcher(directory, true);
                number = searcher.maxDoc();
                return number > 0 ? false:true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }
}
