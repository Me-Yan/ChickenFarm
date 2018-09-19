package com.me.inner.vo;

import com.me.inner.dto.UserDTO;

import java.io.Serializable;

/**
 * Created by Me on 2018/9/19.
 */
public class UserVO implements Serializable {

    private static final long serialVersionUID = 2403629587820443316L;

    private UserDTO user;
    private String resetI;
    private String confirmPassword;
    private String birthDayStr;

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public String getResetI() {
        return resetI;
    }

    public void setResetI(String resetI) {
        this.resetI = resetI;
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
