package com.store.service.impl;

import com.store.dao.CartItemsMapper;
import com.store.dao.CartMapper;
import com.store.dao.ItemsMapper;
import com.store.model.Cart;
import com.store.model.CartItems;
import com.store.model.Items;
import com.store.service.CartService;
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
            Items items;
            Cart cart = cartMapper.selectOne(new Cart(userId));
            //判断该用户的购物车是否已经存在商品，即是否已经创建过购物车
            //如果已经创建过就不用创建
            CartItems cartItems;
            if (cart != null) {
                //判断购物车是否存在该商品
                cartItems = cartItemsMapper.selectOne(new CartItems(itemsId,cart.getId()));
                //如果不为空则该商品数量加一，否则就添加该商品
                if (cartItems != null) {
                    cartItems.setItemsNumber(cartItems.getItemsNumber() + 1);
                    cartItems.setCost(cartItems.getMoney() * cartItems.getItemsNumber());
                    //修改该商品的信息
                    cartItemsMapper.updateByPrimaryKeySelective(cartItems);
                } else {
                    //先取得商品的信息
                    items = itemsMapper.selectOne(new Items(itemsId));
                    //在购物车添加该商品
                    cartItems = new CartItems(itemsId,cart.getId(),1,items.getPrice(),items.getPrice());
                    //保存
                    cartItemsMapper.insertSelective(cartItems);
                }
            } else {
                //先取得商品的信息
                items = itemsMapper.selectOne(new Items(itemsId));
                //创建新的购物车
                cart = new Cart(userId);
                //取得购物车的id
                Integer cartId = cartMapper.addCart(cart);
                //创建购物车的商品
                cartItems = new CartItems(itemsId,cartId,1,items.getPrice(),items.getPrice());
                System.out.println("cartItems-->"+cartItems);
                //保存
                cartItemsMapper.insertSelective(cartItems);
            }
            System.out.println("cart-->" + cart);
            //修改订单的总金额,在原来的总金额上加上刚刚加入的商品的价格
            cart.setPayment(cart.getPayment() + cartItems.getMoney());
            cartMapper.updatePayment(cart);
        } catch (Exception e) {
            e.printStackTrace();
            //由于加了trycatch，所以必须加上下面的代码事务才会回滚，如果不加trycatch则会自动回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly() ;
        }
    }

    public Cart showCart(Integer id) {
        return cartMapper.showCart(id);
    }
}
