package com.store.test.wsTest;

import com.store.ws.emailValidate.ValidateEmailWebService;
import com.store.ws.emailValidate.ValidateEmailWebServiceSoap;
import org.junit.Test;

/**
 * Created by 陈晓海 on 2017/8/3.
 */
public class emailValidate {
    ValidateEmailWebService emailWebService = new ValidateEmailWebService();
    ValidateEmailWebServiceSoap serviceSoap = emailWebService.getValidateEmailWebServiceSoap();
    @Test
    public void emailValidateTest(){
        short i = serviceSoap.validateEmailAddress("127504121212@qq.com");
        System.out.println(i);
    }
}
