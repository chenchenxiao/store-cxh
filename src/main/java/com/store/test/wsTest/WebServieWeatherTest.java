package com.store.test.wsTest;
import com.store.weather.ArrayOfString;
import com.store.weather.WeatherWS;
import com.store.weather.WeatherWSSoap;
import org.junit.Test;

import java.util.List;

/**
 * Created by 陈晓海 on 2017/8/3.
 * 调用天气服务的测试类
 */
public class WebServieWeatherTest {
    @Test
    public void testWeather(){
        //通过查看WSDL文档获取服务
        WeatherWS ws = new WeatherWS();
        //获取SOAP服务
        WeatherWSSoap weatherWSoap = ws.getWeatherWSSoap();
        System.out.println("获取指定城市天气---------------------");
        ArrayOfString str = weatherWSoap.getWeather("上海"," ");
        System.out.println(str);
        List<String> list= str.getString();
        System.out.println(list.size());
        for(String temp:list){
            System.out.println(temp);
        }
    }
}
