package com.ysk.controller;

import com.ysk.entity.Role;
import com.ysk.entity.User;
import com.ysk.service.RoleService;
import com.ysk.service.UserService;
import com.ysk.utils.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;
    private RoleService roleService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    /**
     * 跳转到添加页面
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "/WEB-INF/jsp/user/add.jsp";
    }
    /**
     * 添加用户
     */
    @RequestMapping("/add")
    public String add(User user, Integer roleId, HttpSession session) {
        Role role = new Role();
        role.setId(roleId);
        user.setRole(role);
        user.setCreationDate(new Date());
        user.setCreatedBy(((User)(session.getAttribute("userSession"))).getId());
        userService.addUser(user);
        return "redirect:/user/list";
    }

    /**
     * 删除用户
     */
    @RequestMapping("/del")
    public String del(int id) {
        userService.delUserById(id);
        return "redirect:/user/list";
    }

    /**
     * 获取数据并跳转到修改页
     */
    @RequestMapping("/toUpd")
    public String toUpt(int id, HttpSession session) {
        User user = userService.getUserById(id);
        session.setAttribute("updateUser", user);
        return "/WEB-INF/jsp/user/upd.jsp";
    }
    /**
     * 修改用户
     */
    @RequestMapping("/upd")
    public String upt(User user, Integer roleId, HttpSession session) {
        System.out.println("user====>" + user);
        System.out.println("roleId====>" + roleId);

        Role role = new Role();
        role.setId(roleId);
        user.setRole(role);
        user.setModifyDate(new Date());
        user.setModifyBy(((User)(session.getAttribute("userSession"))).getId());

        userService.updateUser(user);
        return "redirect:/user/list";
    }

    /**
     * 通过id查询用户详情
     */
    @RequestMapping("/det")
    public String det(int id, HttpSession session) {
        User user = userService.getUserById(id);
        session.setAttribute("detailUser", user);
        return "/WEB-INF/jsp/user/det.jsp";
    }

    /**
     * 展示用户列表
     */
    @RequestMapping("/list")
    public String list(HttpSession session, String queryUserName, Integer queryRoleId, Integer pageIndex) {
        System.out.println("user - list----------");
        System.out.println("queryUserName==>" + queryUserName);
        System.out.println("queryRoleId  ==>" + queryRoleId);
        System.out.println("pageIndex    ==>" + pageIndex);

        ///////////分页类
        PageSupport pageSupport = new PageSupport();
        int totalCount = userService.getUserCount(queryUserName, queryRoleId);
        int pageSize = 6;
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        pageSupport.setCurrentPageNo(pageIndex ==  null ? 1 : pageIndex);
        ///


        List<Role> simpleRoleList = roleService.getIdAndName();


        List<User> userList = userService.getUserList(queryUserName, queryRoleId, pageSupport.getCurrentPageNo(), pageSupport.getPageSize());

        session.setAttribute("queryUserName", queryUserName);
        session.setAttribute("queryRoleId", queryRoleId);
        session.setAttribute("userList", userList);
        session.setAttribute("simpleRoleList", simpleRoleList);
        session.setAttribute("pageSupport", pageSupport);

        return "/WEB-INF/jsp/user/list.jsp";
    }

    /**
     * 跳转到登录页
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "/WEB-INF/jsp/user/login.jsp";
    }
    /**
     * 用户登录
     */
    @RequestMapping("/login")
    public String login(@RequestParam("username") String username,@RequestParam("password") String password, HttpSession session) {
        User user = userService.getUserByUsernameAndPwd(username, password);
        System.out.println(username+" "+password);
        String res;
        if(user != null) {
            System.out.println("login-------------");
            session.setAttribute("userSession", user);
            res = "redirect:/user/welcome"; //登录成功，重定向进入首页
        } else {
            res = "/user/logout"; //返回登录界面
        }
        return res;
    }

    /**
     * 登录成功，转入欢迎页
     */
    @RequestMapping("/welcome")
    public String toWelcome() {
        return "/WEB-INF/jsp/user/welcome.jsp";
    }



    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        System.out.println("logout-------------");
        session.removeAttribute("userSession");
        return "/WEB-INF/jsp/user/login.jsp";
    }

    /**
     * 异步请求，获取用户密码
     */
    @RequestMapping("/oldPass")
    @ResponseBody
    public String getCurrentUserPass(HttpSession session, String oldPass) {
        String currentUserPassword = ((User) (session.getAttribute("userSession"))).getUserPassword();
        String res = "false";
        if(currentUserPassword.equals(oldPass)) {
            res = "true";
        }
        return res;
    }

    /**
     * 跳转到修改密码页
     */
    @RequestMapping("/modifyPwd")
    public String toModifyPwd() {
        return "/WEB-INF/jsp/user/modifyPassword.jsp";
    }

    /**
     * 修改用户密码
     */
    @RequestMapping("/modify")
    public String modifyCurrentUserPassword(HttpSession session, String newPass, Model model) {
        User currentUser = (User) (session.getAttribute("userSession"));
        int id = currentUser.getId();
        boolean flag = userService.updatePassword(id, newPass);
        if(flag) {
            currentUser.setUserPassword(newPass);
            model.addAttribute("success", "修改成功");
        } else {
            model.addAttribute("error", "修改失败");
        }
        return "/WEB-INF/jsp/user/modifyPassword.jsp";
    }



}
