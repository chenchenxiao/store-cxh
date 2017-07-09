package com.store.util;

import java.util.Random;

/**
 * Created by 陈晓海 on 2017/7/8.
 * 生成6位数的手机验证码工具类
 */
public class CheckNumberUtil {
    public static String getCheckNumber() {
        String charValue = "";
        for (int i = 0; i < 6; i++) {
            char c = (char) (randomInt(0, 10) + '0');
            charValue += String.valueOf(c);
        }
        return charValue;
    }

    private static int randomInt(int from, int to) {
        Random r = new Random();
        return from + r.nextInt(to - from);
    }
}
