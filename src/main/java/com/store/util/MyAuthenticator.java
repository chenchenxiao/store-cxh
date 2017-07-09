package com.store.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * Created by 陈晓海 on 2017/6/8.
 */
public class MyAuthenticator extends Authenticator {
    String userName = null;
    String password = null;
    public MyAuthenticator(){}
    public MyAuthenticator(String userName,String password){
        this.userName = userName;
        this.password = password;
    }
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, password);
    }
}
