package com.me.inner.service;

import com.me.inner.dto.UserDTO;

/**
 * Created by Me on 2018/9/4.
 */
public interface UserService {

    void updateUser(UserDTO user);

    UserDTO getUserByUserId(Integer userId);
}
