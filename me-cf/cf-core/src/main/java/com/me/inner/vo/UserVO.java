package com.me.inner.vo;

import com.me.inner.dto.UserDTO;
import com.me.inner.dto.UserInfoDTO;

import java.io.Serializable;

/**
 * Created by Me on 2018/9/19.
 */
public class UserVO implements Serializable {

    private static final long serialVersionUID = 2403629587820443316L;

    private UserInfoDTO userInfo;
    private String resetI;
    private String password;
    private String confirmPassword;
    private String birthDayStr;

    public UserInfoDTO getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfoDTO userInfo) {
        this.userInfo = userInfo;
    }

    public String getResetI() {
        return resetI;
    }

    public void setResetI(String resetI) {
        this.resetI = resetI;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getBirthDayStr() {
        return birthDayStr;
    }

    public void setBirthDayStr(String birthDayStr) {
        this.birthDayStr = birthDayStr;
    }
}
