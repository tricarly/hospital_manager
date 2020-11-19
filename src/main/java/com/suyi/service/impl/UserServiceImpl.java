package com.suyi.service.impl;

import com.suyi.domain.User;
import com.suyi.mapper.UserMapper;
import com.suyi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean insert(User user) {
        user.setCreatetime(new Date());
        int i = userMapper.insert(user);
        if (i>0){
            return true;
        }
        return false;
    }

    @Override
    public User selectByUsernameAndPassword(String username, String password) {
        return userMapper.selectByUsernameAndPassword(username, password);
    }

    @Override
    public boolean selectByUsername(String username) {
        User user = userMapper.selectByUsername(username);
        if (user!=null){
            return false;
        }
        return true;
    }

    @Override
    public boolean selectByEmail(String email) {
        User user = userMapper.selectByEmail(email);
        if (user!=null){
            return false;
        }
        return true;
    }
}
