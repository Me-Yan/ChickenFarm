package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2018/9/15.
 */
public class AttachmentDTO implements Serializable {

    private static final long serialVersionUID = 3817797463436106762L;

    // DB Columns
    private Integer attachId;
    private Integer categoryId;
    private String path;
    private String attachName;
    private String month;
    private String active;
    private Date createDate;
    private String createBy;

    public Integer getAttachId() {
        return attachId;
    }

    public void setAttachId(Integer attachId) {
        this.attachId = attachId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getAttachName() {
        return attachName;
    }

    public void setAttachName(String attachName) {
        this.attachName = attachName;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
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
