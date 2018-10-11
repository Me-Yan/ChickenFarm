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
        String STABLED = "Stabled";     // 不可关闭的
        String VARIABLE = "Variable";   // 可关闭的
    }

    public interface Record_Type {
        String MORE = "more";       // 销售数据
        String WEIGHT = "weight";   // 重量
        String PRICE = "price";     // 价格
        String AMOUNT = "amount";   // 金额
        String COUNT = "count";     // 鸡的损失数量
    }

    public interface Code_Type {
        String RECORD_TYPE = "recordType";
    }
}