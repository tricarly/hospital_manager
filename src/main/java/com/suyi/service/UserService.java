package com.suyi.service;

import com.suyi.domain.User;

public interface UserService {

    boolean insert(User user);

    User selectByUsernameAndPassword(String username, String password);

    boolean selectByUsername(String username);

    boolean selectByEmail(String email);
}
