package com.store.service.impl;

import com.store.dao.CartMapper;
import com.store.dao.UserMapper;
import com.store.model.Cart;
import com.store.model.User;
import com.store.service.UserService;
import com.store.util.Md5Util;
import com.store.ws.emailValidate.ValidateEmailWebService;
import com.store.ws.emailValidate.ValidateEmailWebServiceSoap;
import com.store.ws.phoneValidate.MobileCodeWS;
import com.store.ws.phoneValidate.MobileCodeWSSoap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.provider.MD5;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CartMapper cartMapper;
    //检验用户名或手机号或邮箱是否已被注册
    public Integer checkRepeat(User user) {
        return userMapper.selectCount(user);
    }

    //注册用户,注册时就创建好购物车
    public void addUser(User user) {
        user.setPassword(Md5Util.convertMD5(user.getPassword()));
        userMapper.insert(user);
        cartMapper.addCart(new Cart(user.getId()));
    }

    //用户登录
    public User login(User user){
        user.setPassword(Md5Util.convertMD5(user.getPassword()));
        return userMapper.selectOne(user);
    }

    //用户修改自己的资料
    public User findUpdateUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    //用户修改资料时检验用户名
    public Integer checkAccount(String account) {
        return userMapper.checkAccount(account);
    }

    //用户修改资料
    public void update(User user){
        if(user.getPassword() != null){
            user.setPassword(Md5Util.convertMD5(user.getPassword()));
        }
        userMapper.updateByPrimaryKeySelective(user);
    }

    //根据用户名校验是否存在对应的用户
    public User checkUser(String condition) {
        return userMapper.checkUser(condition);
    }

    //校验用户输入的电话号码是不是真实可用的
    public Boolean phoneValidate(String phoneNumber){
        MobileCodeWS mobileCodeWS = new MobileCodeWS();
        MobileCodeWSSoap mobileCodeWSSoap = mobileCodeWS.getMobileCodeWSSoap();
        //第一个参数是手机号码，第二个是商业用户的ID，免费用户用""空字符串
        String result = mobileCodeWSSoap.getMobileCodeInfo(phoneNumber,"");
        //判断结果的长度，因为如果是正确的话，返回的信息超过10个字符串，如果错误则小于
        if(result.length() < 10){
            return false;
        }
        return true;
    }

    //校验用户输入的邮箱是不是真实可用的
    public Boolean emailValidate(String emailNumber){
        ValidateEmailWebService emailWebService = new ValidateEmailWebService();
        ValidateEmailWebServiceSoap serviceSoap = emailWebService.getValidateEmailWebServiceSoap();
        short result = serviceSoap.validateEmailAddress(emailNumber);
        //判断得到的结果是不是等于1，如果是则说明邮箱真实可用,各个返回值代表什么要看wsdl件
        if(result == 1){
            return true;
        }
        return false;
    }
}
