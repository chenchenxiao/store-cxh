package com.store.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.store.been.PageBean;
import com.store.dao.AdvertisementMapper;
import com.store.dao.ItemsMapper;
import com.store.dao.LuceneDao;
import com.store.model.Advertisement;
import com.store.model.Items;
import com.store.model.ItemsCustom;
import com.store.model.User;
import com.store.service.AdvertisementService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 陈晓海 on 2017/7/28.
 */
@Service
public class AdvertisementServiceImpl implements AdvertisementService {
    @Autowired
    private AdvertisementMapper advertisementMapper;
    @Autowired
    private ItemsMapper itemsMapper;

    public PageBean showAdvertisements(Integer id, PageBean pageBean) {
        System.out.println(advertisementMapper);
        if (" ".equals(pageBean.getSearchText())) {
            pageBean.setSearchText(null);
        }
        if (pageBean.getSearchText() != null) {
            pageBean.setSearchText("%" + pageBean.getSearchText() + "%");
        }
        PageHelper.startPage(pageBean.getPage(), pageBean.getSize());
        List list = advertisementMapper.selectAdvertisements(id, pageBean.getSearchText());
        //把分页出来的数据放入pageBean
        pageBean.setRecordList(list);
        //取分页信息
        PageInfo<Advertisement> pageInfo = new PageInfo<Advertisement>(list);
        pageBean.init((int) pageInfo.getTotal(), list);
        return pageBean;
    }

    //根据用户id查找用户所有的商品
    public List<Items> showAllItems(Integer userId) {
        Items items = new Items();
        items.setUid(userId);
        return itemsMapper.select(items);
    }

    //根据用户id查找
    public Advertisement selectOneAd(Integer id) {
        return advertisementMapper.selectOne(new Advertisement(id));
    }

    //添加
    public void add(Advertisement advertisement) {
        Items items = itemsMapper.selectByPrimaryKey(advertisement.getItemsId());
        advertisement.setItemsName(items.getName());
        advertisement.setUserId(items.getUid());
        advertisement.setStatus(0);
        advertisementMapper.insert(advertisement);
    }

    //修改
    public void update(Advertisement advertisement) {
        Items items = itemsMapper.selectByPrimaryKey(advertisement.getItemsId());
        advertisement.setItemsName(items.getName());
        advertisementMapper.updateAd(advertisement);
    }

    //删除单条信息
    public void deleteOne(Integer id) {
        advertisementMapper.deleteById(id);
    }

    //批量删除
    public void deleteByIds(Integer[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        for (int i : ids) {
            list.add(i);
        }
        advertisementMapper.deleteByIds(list);
    }

    //根据广告id查找
    public Advertisement selectById(Integer id) {
        return advertisementMapper.selectById(id);
    }

    //查找已经显示的广告
    public List<Advertisement> selectByStatus() {
        PageHelper.startPage(1, 5);
        List list = advertisementMapper.selectByStatus(1);
        return list;
    }

    //比较定时更新时分页的页数是否大于总页数
    public Long comparePage(Integer page,Integer size) {
        PageHelper.startPage(page, size);
        List<Advertisement> list = advertisementMapper.selectByStatus(null);
        //取分页信息
        PageInfo<Advertisement> pageInfo = new PageInfo<Advertisement>(list);
        System.out.println("compare-------------------" + (pageInfo.getTotal() + size - 1) / size);
        return (pageInfo.getTotal() + size - 1) / size;
    }


    //定时更新广告信息，0表示未显示，1表示显示。存在问题，例如
    //最开始显示的是0110 0101 0000，第一次修改让广告显示后是1111 1111 0000，修改让广告不显示后是0000 1111 0000
    //这样就会导致刚刚显示的广告又马上不让显示了，目前没找到解决方法
    //修改未显示的广告后同时修改已经显示的广告
    public void quartzUpdate(Integer page,Integer size) {
        ////比较定时更新时分页的页数是否大于总页数
        System.out.println("page-->" + page);
        //先通过分页取得要修改的广告信息集合
        List<Advertisement> passList = new ArrayList<Advertisement>();
        //从page - 1页开始分页，这么写是因为
        //例如第2次执行完程序后是  000 111 000，第3次从page - 1开始修改完才是000 111 111
        PageHelper.startPage(page - 1, size);
        passList = advertisementMapper.selectByStatus(0);
        //通过遍历取得广告的id
        List<Integer> passIntegerList = new ArrayList<Integer>();
        for (Advertisement ad : passList) {
            passIntegerList.add(ad.getId());
        }
        //判断广告id的集合长度是否大于0，即是否分页取到了数据，如果有数据，就进行修改
        if (passIntegerList.size() > 0) {
            System.out.println("adPass-------------------------");
            advertisementMapper.updateStatus(passIntegerList,1);
        }
        //修改显示过的广告
        List<Advertisement> notPassList = new ArrayList<Advertisement>();
        //判断是否是第一页分页，这么做是因为如果不判断的话，修改让广告显示后又马上改回来了，广告状态没变化
        //例如第一次修改让广告显示后是111 000 000，如果不判断又会修改为000 000 000，这样就死循环了
        if(page == 1 ){
            //取出当前所有的已显示广告信息
            notPassList = advertisementMapper.selectByStatus(1);
            //判断是否已显示的广告信息数量大于每页显示个数
            //例如111 000 000 11，如果是就会修改最后的一个1，
            //如果不大于每页显示个数，则是 111 000 000 00，此时就不用进行修改，否则改了就死循环
            if(notPassList.size() > size){
                //如果是就改第二页分页的数据
                PageHelper.startPage(2,size);
                notPassList = advertisementMapper.selectByStatus(1);
            }else{
                //如果不是就重新给集合实例化，目的是为了清空上面取的所有的已显示广告信息
                notPassList = new ArrayList<Advertisement>();
            }
        }
        //判断page是否大于1，如果不判断也会死循环
        //例如第一次修改后是111 000 000，如果不判断就改会修改成000 000 000，死循环
        //判断后是从第二页开始修改  111 111 000，修改完才是000 111 000
        if (page - 1 > 0) {
            //先通过分页取得要修改的广告信息集合,取得上一次已经显示过的广告信息
            PageHelper.startPage(1, size);
            notPassList = advertisementMapper.selectByStatus(1);
        }
            //通过遍历取得广告的id
        List<Integer> notPassIntegerList = new ArrayList<Integer>();
        for (Advertisement ad : notPassList) {
            notPassIntegerList.add(ad.getId());
        }
        //判断广告id的集合是否为空，即是否分页取到了数据，如果有数据，就进行修改
        if (notPassIntegerList.size() > 0) {
            System.out.println("Notpass---------------------");
            advertisementMapper.updateStatus(notPassIntegerList,0);
        }
    }

    //查询热销商品
    public List<Items> selectHotSell(String type) {
        return advertisementMapper.selectHotSell(type);
    }

    //将数据存入索引库
    public void addToLucene() throws Exception {
        //存放Items的集合
        List<Items> itemsList;
        //存放ItemsCustom的集合
        List<ItemsCustom> itemsCustomList = new ArrayList<ItemsCustom>();
        ItemsCustom itemsCustom;
        LuceneDao luceneDao = new LuceneDao();
        //先判断索引库中是否已经存了数据，如果已经存了就不用存
        Boolean flag = luceneDao.isIndexNull();
        if(flag){
            itemsList = itemsMapper.selectAll();
            //通过遍历将查询到的Items集合中的数据填入ItemsCustom中
            for(int i = 0;i < itemsList.size();i++){
                itemsCustom = new ItemsCustom();
                itemsCustom.setId(itemsList.get(i).getId());
                itemsCustom.setUid(itemsList.get(i).getUid());
                itemsCustom.setName(itemsList.get(i).getName());
                itemsCustom.setTitle(itemsList.get(i).getTitle());
                itemsCustom.setType(itemsList.get(i).getType());
                itemsCustom.setPhoto(itemsList.get(i).getPhoto());
                itemsCustom.setPrice(itemsList.get(i).getPrice());
                itemsCustomList.add(itemsCustom);
            }
            //执行添加多条数据操作
              System.out.println("realList-->" + itemsCustomList);
              luceneDao.addList(itemsCustomList);
        }
    }
}




