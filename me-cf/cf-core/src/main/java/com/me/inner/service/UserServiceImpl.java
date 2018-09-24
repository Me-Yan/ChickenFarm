package com.me.inner.service;


import com.me.inner.dto.BaseUserDetails;
import com.me.inner.dto.UserDTO;
import com.me.inner.dto.UserInfoDTO;
import com.me.inner.mapper.UserMapper;
import com.me.inner.util.CommonUtil;
import com.me.inner.util.SecurityUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by Me on 2018/9/4.
 */

@Service
public class UserServiceImpl implements UserService {

    Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    public UserDTO getUserByUserId(Integer userId) {
        logger.debug("Execute Method getUserByUserId...");

        return userMapper.getUserByUserId(userId);
    }

    public void updateUser(UserDTO user) {
        logger.debug("Execute Method updateUser...");

        BaseUserDetails userDetail = SecurityUtil.getUserInfo();

        String username = userDetail.getUsername();
        Integer userId = userDetail.getUserId();
        Date curDate = new Date();

        if (StringUtils.isNotBlank(user.getPassword())) {
            String originPassword = user.getPassword();
            String presentedPassword = CommonUtil.encodePassword(originPassword);

            user.setPassword(presentedPassword);
            user.setUpdateDate(curDate);
            user.setUpdateBy(username);
            user.setUserId(userId);

            userMapper.updatePassword(user);
        }

        UserInfoDTO userInfo = user.getUserInfo();
        userInfo.setUserId(userId);
        userInfo.setCreateBy(username);
        userInfo.setCreateDate(curDate);

        userMapper.updateUserInfo(userInfo);
    }
}
