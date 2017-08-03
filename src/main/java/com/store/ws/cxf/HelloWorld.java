package com.store.ws.cxf;

import javax.jws.WebService;

/**
 * Created by 陈晓海 on 2017/8/3.
 */
@WebService
public interface HelloWorld {

    String say(String str);

}
