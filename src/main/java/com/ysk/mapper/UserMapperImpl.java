package com.ysk.mapper;

import com.ysk.entity.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userMapper")
public class UserMapperImpl implements UserMapper {

    private SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    /**
     * 添加一个用户
     * @param user
     * @return
     */
    @Override
    public int add(User user) {
        return sqlSessionTemplate.getMapper(UserMapper.class).add(user);
    }

    /**
     * 通过id查询用户
     */
    @Override
    public User getUserById(Integer id) {
        return sqlSessionTemplate.getMapper(UserMapper.class).getUserById(id);
    }

    /**
     * 通过用户名和密码查询用户并返回该用户
     */
    @Override
    public User getUserByUsernameAndPwd(String username, String password) {
        return sqlSessionTemplate.getMapper(UserMapper.class).getUserByUsernameAndPwd(username, password);
    }

    /**
     * 带条件且分页查询用户
     */
    @Override
    public List<User> getUserList(String userName, Integer userRole, int startIndex, int pageSize) {
        return sqlSessionTemplate.getMapper(UserMapper.class).getUserList(userName, userRole, startIndex, pageSize);
    }

    /**
     * 查询带条件的用户总数
     */
    @Override
    public int getUserCount(String userName, Integer userRole) {
        return sqlSessionTemplate.getMapper(UserMapper.class).getUserCount(userName, userRole);
    }

    /**
     * 通过id删除用户
     */
    @Override
    public int delUserById(Integer id) {
        return sqlSessionTemplate.getMapper(UserMapper.class).delUserById(id);
    }

    /**
     * 通过id更新用户
     */
    @Override
    public int updateUser(User user) {
        return sqlSessionTemplate.getMapper(UserMapper.class).updateUser(user);
    }

    @Override
    public int updatePassword(int id, String password) {
        return sqlSessionTemplate.getMapper(UserMapper.class).updatePassword(id, password);
    }
}
