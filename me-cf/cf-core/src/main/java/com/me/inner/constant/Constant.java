package com.me.inner.constant;

/**
 * Created by Me on 2018/8/30.
 */
public class Constant {

    public interface User_Role {
        String ROLE_SUPER = "ROLE_SUP"; // 超级管理员
        String ROLE_NOR = "ROLE_NOR";   // 普通用户
    }

    public interface Sex {
        String MALE = "1";
        String FEMALE = "0";
    }

    public interface Classify_Status {
        String STABLED = "Stabled";
        String VARIABLE = "Variable";
    }

    public interface Record_Type {
        String WEIGHT = "weight";
        String PRICE = "price";
        String AMOUNT = "amount";
        String COUNT = "count";
    }

    public interface Code_Type {
        String RECORD_TYPE = "recordType";
    }
}