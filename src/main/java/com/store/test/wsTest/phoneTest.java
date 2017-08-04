package com.store.test.wsTest;

import com.store.ws.phoneValidate.MobileCodeWS;
import com.store.ws.phoneValidate.MobileCodeWSSoap;
import org.junit.Test;


/**
 * Created by 陈晓海 on 2017/8/3.
 * 调用电话号码归属地查询服务的测试类
 */
public class phoneTest {
    MobileCodeWS mobileCodeWS = new MobileCodeWS();
    MobileCodeWSSoap mobileCodeWSSoap = mobileCodeWS.getMobileCodeWSSoap();
    @Test
    public void test(){
        //如果找不到就会返回  没有此号记录
        String mobileCodeInfo = mobileCodeWSSoap.getMobileCodeInfo("13414057676", "");
        System.out.println(mobileCodeInfo);
    }
}
