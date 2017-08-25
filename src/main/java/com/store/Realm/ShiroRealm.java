package com.store.Realm;

import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;

/**
 * Created by 陈晓海 on 2017/8/21.
 */
public class ShiroRealm extends AuthenticatingRealm {

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("doGetAuthenticationInfo-->" + authenticationToken.hashCode());
        //1、把AuthenticationToken转成UsernamePasswordToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
        //2、从UsernamePasswordToken获取username
        String username = upToken.getUsername();
        //3、调用数据库的方法，从数据库查询username对应的记录
        System.out.println("username-->" + username);
        //4、若用户不存在，则可以抛出UnknownAccountException异常
        if("unknown".equals(username)){
            throw new UnknownAccountException("用户不存在");
        }
        //5、根据用户信息的情况，决定是否需要抛出其他的AuthenticationException异常
        if("monster".equals(username)){
            throw  new LockedAccountException("用户被锁定");
        }
        //6、根据用户的情况，来构建AuthenticationInfo对象并返回，通常使用的实现类为SimpleAutehentication
        //下面的信息是从数据库中获取的
        //1).principal ：认证的实体信息，可以是username，也可以是数据表对应的用户的实体类对象
        Object principal = username;
        //2).credentials:密码
        Object credentials = null;
        if("admin".equals(username)){
             credentials = "e10adc3949ba59abbe56e057f20f883e";
        }else if("user".equals(username)){
            credentials = "098d2c478e9c11555ce2823231e02ec1";
        }
        //3).realmName:当前realm对象的name，调用父类的getName()
        String realmName = getName();
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal,credentials,realmName);
//        //4).盐值
//        ByteSource credentialsSalt = ByteSource.Util.bytes(username);
//        info = new SimpleAuthenticationInfo(principal,credentials,credentialsSalt,realmName);
//        System.out.println(info.getCredentials());
        return info;
    }

    public static void main(String[] args){
        Object credentails = "123456";
        Object salt = ByteSource.Util.bytes("admin");
        int hashIterations = 1024;
        Object result = new SimpleHash("MD5",credentails,salt,hashIterations);
        System.out.println(result);
    }
}
