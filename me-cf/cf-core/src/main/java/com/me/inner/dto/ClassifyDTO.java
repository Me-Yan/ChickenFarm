package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/15.
 */
public class ClassifyDTO implements Serializable {

    private static final long serialVersionUID = -2661845663282876796L;

    // DB Columns
    private Integer classifyId;
    private String classifyName;
    private String classifyClass;
    private Integer sequence;
    private String status;
    private Date createDate;
    private String createBy;
    private Date updateDate;
    private String updateBy;

    // operation and view
    private List<CategoryDTO> categoryList;
    private Integer activeCategory;
    private Integer closedCategory;
    private String createDateStr;
    private Integer serialNo;

    public Integer getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(Integer serialNo) {
        this.serialNo = serialNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }

    public Integer getActiveCategory() {
        return activeCategory;
    }

    public void setActiveCategory(Integer activeCategory) {
        this.activeCategory = activeCategory;
    }

    public Integer getClosedCategory() {
        return closedCategory;
    }

    public void setClosedCategory(Integer closedCategory) {
        this.closedCategory = closedCategory;
    }

    public List<CategoryDTO> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<CategoryDTO> categoryList) {
        this.categoryList = categoryList;
    }

    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public String getClassifyClass() {
        return classifyClass;
    }

    public void setClassifyClass(String classifyClass) {
        this.classifyClass = classifyClass;
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

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
