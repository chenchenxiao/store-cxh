package com.store.test;

import com.store.util.IDUtils;
import org.junit.Test;

/**
 * Created by 陈晓海 on 2017/7/17.
 */
public class getIdTest {
    @Test
    public void test(){
        System.out.println("id-->" + IDUtils.genItemId());
    }
}
