package com.me.inner.vo;

import java.io.Serializable;

/**
 * Created by Me on 2018/10/14.
 */
public class RecordOverviewVO implements Serializable {

    private static final long serialVersionUID = -7741368437591311878L;

    private Double amount;
    private Double price;
    private Double weight;
    private Integer count;

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
