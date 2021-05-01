package com.ysk.mapper;

import com.ysk.entity.Role;
import com.ysk.entity.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserMapperTest {

    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    UserMapper userMapper = context.getBean("userMapper", UserMapper.class);

    @Test
    public void add() {
        User user = new User();
        user.setUserCode("ysk");
        user.setUserName("视康");
        user.setUserPassword("wjdi1840");
        Role role = new Role();
        role.setId(4);
        user.setRole(role);
        userMapper.add(user);
    }

    @Test
    public void getUserById() {
        userMapper.getUserById(3);
    }

    @Test
    public void getUserByUsernameAndPwd() {
        userMapper.getUserByUsernameAndPwd("ysk", "wjdi1840");
    }

    @Test
    public void getUserList() {
        userMapper.getUserList("赵", 2, 0, 1);
    }

}
