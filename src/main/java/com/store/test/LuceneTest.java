package com.store.test;

import com.store.been.PageBean;
import com.store.dao.LuceneDao;
import com.store.model.Items;
import com.store.model.ItemsCustom;
import com.store.model.User;
import com.store.util.LuceneUtil;

import java.io.IOException;
import java.io.StringReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.TermAttribute;
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
import org.junit.Test;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * Created by 陈晓海 on 2017/7/31.
 */
public class LuceneTest {

//    public void add() throws Exception{
//        Article article = new Article(1,"编程","java是一门语言");
//        Document document = LuceneUtil.javabean2document(article);
//        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
//        indexWriter.addDocument(document);//核心
//        //合并cfs文件
////        indexWriter.optimize();
//        //每隔2个文件合并一次cfs文件
//        indexWriter.setMergeFactor(2);
//        indexWriter.close();
//    }

    @Test
    public void addItems() throws Exception{
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Items items = new Items();
        items.setUid(22);
        items.setId(1);
        items.setType("服装吖吖");
        items.setUpdateDate(new Date());
        items.setAddDate(new Date());
        items.setPhoto(new Date().toString());
        items.setPrice(5f);
        items.setTitle("测试");
        items.setName("名字");
        items.setDetails("细节");
        items.setNumber(22);
        items.setUser(new User());
        Document document = LuceneUtil.javabean2document(items);
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
        indexWriter.addDocument(document);//核心
        //合并cfs文件
//        indexWriter.optimize();
        //每隔2个文件合并一次cfs文件
        indexWriter.setMergeFactor(2);
        indexWriter.close();
    }


//    @Test
//    public void addAll() throws Exception{
//        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
//
//        Article article1 = new Article(1,"编程","c是一门语言");
//        Document document1 = LuceneUtil.javabean2document(article1);
//        indexWriter.addDocument(document1);
//
//        Article article2 = new Article(2,"语言","java是一门语言");
//        Document document2 = LuceneUtil.javabean2document(article2);
//        indexWriter.addDocument(document2);
//
//        Article article3 = new Article(3,"语言","php是一门语言");
//        Document document3 = LuceneUtil.javabean2document(article3);
//        indexWriter.addDocument(document3);
//
//        indexWriter.close();
//    }

    @Test
    public void findAllByKeywords() throws Exception{
        String keywords = "服装";
        List<ItemsCustom> articleList = new ArrayList<ItemsCustom>();
        QueryParser queryParser = new MultiFieldQueryParser(LuceneUtil.getVersion(),new String[]{"type","id","title","name"},LuceneUtil.getAnalyzer());
        Query query = queryParser.parse(keywords);
        IndexSearcher indexSearcher = new IndexSearcher(LuceneUtil.getDirectory());
        TopDocs topDocs = indexSearcher.search(query,100);//核心

//        //以下代码对内容中含有关键字的字符串高亮显示
//
        //格式对象
        Formatter formatter = new SimpleHTMLFormatter("<font color='red'>","</font>");
        //关键字对象
        Scorer scorer = new QueryScorer(query);
        //高亮对象
        Highlighter highlighter = new Highlighter(formatter,scorer);

        for(int i=0;i<topDocs.scoreDocs.length;i++){
            ScoreDoc scoreDoc = topDocs.scoreDocs[i];
            int no = scoreDoc.doc;
            //关键字没有高亮
            Document document = indexSearcher.doc(no);

//            //关键字高亮
//            String titleHighlighter = highlighter.getBestFragment(LuceneUtil.getAnalyzer(),"name",document.get("name"));
//            String contentHighlighter = highlighter.getBestFragment(LuceneUtil.getAnalyzer(),"content",document.get("content"));
//
//            //将高亮后的结果再次封装到document对象中
//            document.getField("name").setValue(titleHighlighter);
//            document.getField("content").setValue(contentHighlighter);
            ItemsCustom article = (ItemsCustom)LuceneUtil.document2javabean(document,ItemsCustom.class);
            articleList.add(article);
        }
        System.out.println(articleList.size());
        for(ItemsCustom a : articleList){
            System.out.println( a );
        }
    }
    private static void testAnalyzer(Analyzer analyzer, String text) throws Exception {
        System.out.println("当前使用的分词器：" + analyzer.getClass());
        TokenStream tokenStream = analyzer.tokenStream("content",new StringReader(text));
        tokenStream.addAttribute(TermAttribute.class);
        while (tokenStream.incrementToken()) {
            TermAttribute termAttribute = tokenStream.getAttribute(TermAttribute.class);
            System.out.println(termAttribute.term());
        }
    }


//    @Test
//    public void test() throws Exception {
//        Article article = new Article(1,"测试","就是测试一下而已");
//        Document document = LuceneUtil.javabean2document(article);
//
//        Article article2 = (Article) LuceneUtil.document2javabean(document,Article.class);
//        System.out.println(article2);
//
//        testAnalyzer(new IKAnalyzer(),"传智播客说我们的首都是北京呀");
//    }

    @Test
    public void testDate() throws ParseException {
           List<Document> documentList = new ArrayList<Document>();
           documentList.add(new Document());
           ItemsCustom itemsCustom = new ItemsCustom();
        System.out.println(itemsCustom.getClass());
           System.out.println(documentList.get(0).getClass());
    }

    @Test
    public void addList() throws Exception{
        ItemsCustom itemsCustom = new ItemsCustom(1,"名字","标题","类型",5F,"照片");
        ItemsCustom itemsCustom2 = new ItemsCustom(2,"名字2","标题2","类型",6F,"照片");
        ItemsCustom itemsCustom3 = new ItemsCustom(3,"名字3","标题3","类型",7F,"照片");
        List<Object> list = new ArrayList<Object>();
        list.add(itemsCustom);
        list.add(itemsCustom2);
        list.add(itemsCustom3);
        List<Document> documentList = (List<Document>) LuceneUtil.javabean2documentList(list);
//        List<Document> documentList = new ArrayList<Document>();
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
        for(int i = 0;i < documentList.size();i++){
            indexWriter.addDocument(documentList.get(i));//核心
        }
//        合并cfs文件
//        indexWriter.optimize();
//        每隔2个文件合并一次cfs文件
//        indexWriter.setMergeFactor(2);
        indexWriter.close();
    }

    @Test
    public void delete() throws Exception{
        IndexWriter indexWriter = new IndexWriter(LuceneUtil.getDirectory(),LuceneUtil.getAnalyzer(),LuceneUtil.getMaxFieldLength());
//        indexWriter.deleteDocuments(new Term("id","2"));//核心
        indexWriter.deleteAll();
        indexWriter.close();
    }


    @Test
    public void findAll() throws IOException {
        //建立索引搜索，指定索引目录
        IndexSearcher searcher = new IndexSearcher(LuceneUtil.getDirectory(), true);
        //获取最大文档数量
        Integer number = searcher.maxDoc();
        System.out.println("number--?" + number);
    }

    @Test
    public void testDao() throws Exception {
        PageBean pageBean = new PageBean();
        pageBean.setSearchText("服装");
        PageBean pageBean1=  new LuceneDao().findAllByKeywords(pageBean);
        System.out.println(pageBean1.getRecordList().toString());
    }

    @Test
    public void update() throws Exception{
        ItemsCustom itemsCustom = new ItemsCustom();
        itemsCustom.setId(49);
        itemsCustom.setTitle("修改Lucene");
        itemsCustom.setType("修改Lucene");
        itemsCustom.setName("修改Lucene");
        itemsCustom.setUid(53);
        itemsCustom.setPhoto("修改Lucene");
        itemsCustom.setPrice(1F);
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



}
