package com.store.test;

import com.store.util.IDUtils;
import org.junit.Test;

import java.util.Random;

/**
 * Created by 陈晓海 on 2017/7/8.
 */
public class NumberTest {
    @Test
    public void getRandNum() {
        String charValue = "";
        for (int i = 0; i < 6; i++) {
            char c = (char) (randomInt(0, 10) + '0');
            charValue += String.valueOf(c);
        }
        System.out.println("charValue-->" + charValue);
    }
    public void idTest(){
        System.out.println(IDUtils.genItemId());
    }
    private int randomInt(int from, int to) {
        Random r = new Random();
        return from + r.nextInt(to - from);
    }


}
