package com.store.ws.cxf;

import com.store.ws.helloWorld.*;

/**
 * Created by 陈晓海 on 2017/8/3.
 * webService的测试类，自己发布了个helloworld的服务后又通过命令行调用了这个服务,此处看成是客户端
 */
public class WebServiceTest {
    HelloWorldImplService helloWorldImplService = new HelloWorldImplService();
    public static void main(String[] args){
        WebServiceTest ws = new WebServiceTest();
        System.out.println(ws.getHello());
    }

    public String getHello(){
        return getSevice().say("webService----------");
    }
    public com.store.ws.helloWorld.HelloWorld getSevice(){
        return helloWorldImplService.getHelloWorldImplPort();
    }
}
