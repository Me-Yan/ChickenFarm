package com.me.inner.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2018/9/4.
 */
public class UserDTO implements Serializable {

    private static final long serialVersionUID = -4398457886143682753L;

    // DB Columns
    private Integer userId;
    private String username;
    private String password;
    private String enabled;
    private Date createDate;
    private String createBy;
    private Date updateDate;
    private String updateBy;

    // for operation and view
    private List<RoleDTO> roleList;
    private List<ResourceDTO> resourceList;
    private UserInfoDTO userInfo;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
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

    public List<RoleDTO> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<RoleDTO> roleList) {
        this.roleList = roleList;
    }

    public List<ResourceDTO> getResourceList() {
        return resourceList;
    }

    public void setResourceList(List<ResourceDTO> resourceList) {
        this.resourceList = resourceList;
    }

    public UserInfoDTO getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfoDTO userInfo) {
        this.userInfo = userInfo;
    }
}
