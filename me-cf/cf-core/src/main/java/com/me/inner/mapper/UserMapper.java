package com.me.inner.mapper;

import com.me.inner.dto.UserDTO;
import com.me.inner.dto.UserInfoDTO;

/**
 * Created by Me on 2018/9/4.
 */
public interface UserMapper {

    void updatePassword(UserDTO user);

    void updateUserInfo(UserInfoDTO userInfo);

    UserDTO getUserByUserId(Integer userId);

}
