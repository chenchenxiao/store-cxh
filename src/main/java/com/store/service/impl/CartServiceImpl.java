package com.store.service.impl;

import com.store.dao.CartItemsMapper;
import com.store.dao.CartMapper;
import com.store.dao.ItemsMapper;
import com.store.model.Cart;
import com.store.model.CartItems;
import com.store.model.Items;
import com.store.service.CartService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

/**
 * Created by 陈晓海 on 2017/7/25.
 */
@Service
public class CartServiceImpl implements CartService{
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private CartItemsMapper cartItemsMapper;
    @Autowired
    private ItemsMapper itemsMapper;

    public void addToCart(Integer itemsId,Integer userId)  {
        //先从数据库查找是否存在符合条件的对象
        try {
            Cart cart = cartMapper.selectOne(new Cart(userId));
            CartItems cartItems;
            //根据购物车id和商品id取得购物车中该商品信息
            cartItems = cartItemsMapper.selectOne(new CartItems(itemsId,cart.getId()));
            //判断购物车中是否有该商品，如果不为空则该商品数量加一，否则就添加该商品
            if (cartItems != null) {
                cartItems.setItemsNumber(cartItems.getItemsNumber() + 1);
                cartItems.setCost(cartItems.getMoney() * cartItems.getItemsNumber());
                //修改该商品的信息b03e559c1331.png
                cartItemsMapper.updateByPrimaryKeySelective(cartItems);
            } else {
                //先取得商品的信息
                Items items = itemsMapper.selectOne(new Items(itemsId));
                //在购物车添加该商品
                cartItems = new CartItems(itemsId,cart.getId(),1,items.getPrice(),items.getPrice(),items.getPhoto(),items.getTitle());
                //保存
                cartItemsMapper.insertSelective(cartItems);
            }
            System.out.println("cart-->" + cart);
            //修改订单的总金额,在原来的总金额上加上刚刚加入的商品的价格
            //判断购物车金额是否为空，不为空就原来有的加上新的，为空就直接加上新的
            if(cart.getPayment() != null){
                cart.setPayment(cart.getPayment() + cartItems.getMoney());
                cartMapper.updatePayment(cart);
            }else{
                cart.setPayment(cartItems.getMoney());
                cartMapper.updatePayment(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
            //由于加了trycatch，所以必须加上下面的代码事务才会回滚，如果不加trycatch则会自动回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly() ;
        }
    }

    //展示购物车时更新购物车的总金额，以防商品的价格改变了，或者被删除了
    public Cart showCart(Integer id) {
        Cart cart = cartMapper.getCartByUserId(id);
        //判断购物车是否存在商品，如果存在就重新计算价格，
        if(cart != null){
            List<CartItems> cartItemsList = cart.getCartItemsList();
            Float payment = Float.valueOf(0);
            for(int i = 0;i < cartItemsList.size();i++){
                System.out.println(cartItemsList.get(i).getCost());
                //各个商品的全额相加就是购物车所有商品的总价
                payment += cartItemsList.get(i).getCost();
            }
            //设置购物车商品的总金额
            cart.setPayment(payment);
            //修改同步到数据库
            cartMapper.updatePayment(cart);
        }
        return cartMapper.showCart(id);
    }
}
