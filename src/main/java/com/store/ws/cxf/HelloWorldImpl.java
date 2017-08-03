package com.store.ws.cxf;

import org.springframework.stereotype.Component;

import javax.jws.WebService;

/**
 * Created by 陈晓海 on 2017/8/3.
 */
@WebService
@Component("helloWorld")
public class HelloWorldImpl implements HelloWorld {
    public String say(String str) {
        return "Hello"+str;
    }
}
