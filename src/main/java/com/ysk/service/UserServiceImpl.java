package com.ysk.service;

import com.ysk.entity.User;
import com.ysk.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User getUserById(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public User getUserByUsernameAndPwd(String username, String password) {
        return userMapper.getUserByUsernameAndPwd(username, password);
    }

    @Override
    public List<User> getUserList(String userName, Integer userRole, int currentPageNo, int pageSize) {
        System.out.println("currentPageNo" + currentPageNo);
        System.out.println("pageSize" + pageSize);
        System.out.println("startIndex" + (currentPageNo - 1) * pageSize);
        return userMapper.getUserList(userName, userRole, (currentPageNo - 1) * pageSize, pageSize);
    }

    @Override
    public int getUserCount(String userName, Integer userRole) {
        return userMapper.getUserCount(userName, userRole);
    }

    @Override
    public boolean addUser(User user) {
        return userMapper.add(user) > 0;
    }

    @Override
    public boolean delUserById(int id) {
        return userMapper.delUserById(id) > 0;
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.updateUser(user) > 0;
    }

    @Override
    public boolean updatePassword(int id, String password) {
        return userMapper.updatePassword(id, password) > 0;
    }
}
