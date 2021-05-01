package com.ysk.mapper;

import com.ysk.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    /**
     * 添加用户
     */
    int add(User user);

    /**
     * 通过id查询
     */
    User getUserById(@Param("uid") Integer id);

    /**
     * 通过用户名和密码
     */
    User getUserByUsernameAndPwd(@Param("uname") String username, @Param("pwd") String password);

    /**
     * 通过条件查询-userList
     * @return
     */
    List<User> getUserList(@Param("userName") String userName, @Param("userRole") Integer userRole, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

    /**
     * 通过条件查询-用户表记录数
     */
    int getUserCount(@Param("userName") String userName, @Param("userRole") Integer userRole);

    /**
     * 通过id删除用户
     */
    int delUserById(@Param("uid") Integer id);

    /**
     * 更新用户
     */
    int updateUser(User user);

    /**
     * 修改密码
     */
    int updatePassword(@Param("uid") int id, @Param("password") String password);
}
