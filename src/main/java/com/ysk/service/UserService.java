package com.ysk.service;

import com.ysk.entity.User;

import java.util.List;

public interface UserService {

    /**
     * 通过id查询用户
     */
    public User getUserById(int id);

    /**
     * 通过用户名和密码
     */
    public User getUserByUsernameAndPwd(String username, String password);
    /**
     * 通过条件查询-userList
     */
    public List<User> getUserList(String userName, Integer userRole, int currentPageNo, int pageSize);

    /**
     * 通过条件查询-用户表记录数
     */
    public int getUserCount(String userName, Integer userRole);

    /**
     * 添加用户
     */
    public boolean addUser(User user);

    /**
     * 通过id删除用户
     */
    public boolean delUserById(int id);

    /**
     * 更新用户
     */
    public boolean updateUser(User user);

    /**
     * 修改密码
     */
    public boolean updatePassword(int id, String password);

}
