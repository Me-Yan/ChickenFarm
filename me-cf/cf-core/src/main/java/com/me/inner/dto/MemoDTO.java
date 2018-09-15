package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2018/9/15.
 */
public class MemoDTO implements Serializable {

    private static final long serialVersionUID = 8479251056812612563L;

    // DB Columns
    private Integer memoId;
    private Integer userId;
    private String content;
    private Date day;
    private String status;
    private String active;
    private Date createDate;
    private String createBy;

    public Integer getMemoId() {
        return memoId;
    }

    public void setMemoId(Integer memoId) {
        this.memoId = memoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
}
