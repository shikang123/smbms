package com.ysk.controller;

import com.alibaba.fastjson.JSONArray;
import com.ysk.entity.Role;
import com.ysk.entity.User;
import com.ysk.service.RoleService;
import com.ysk.utils.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    private RoleService roleService;

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    /**
     * 异步请求，获取职位信息
     */
    @RequestMapping("/simpleRoleList")
    @ResponseBody
    public String simpleRoleList() {
        List<Role> roleList = roleService.getIdAndName();
        Map<String, List<Role>> map = new HashMap<>();
        map.put("simpleRoleList", roleList);
        return JSONArray.toJSONString(map);
    }

    /**
     * 展示角色列表
     */
    @RequestMapping("/list")
    public String list(HttpSession session, String queryRoleCode, String queryRoleName, Integer pageIndex) {
        System.out.println("role - list----------");
        System.out.println("queryRoleCode==>" + queryRoleCode);
        System.out.println("queryRoleName  ==>" + queryRoleName);
        System.out.println("pageIndex    ==>" + pageIndex);

        ///////////分页类
        PageSupport pageSupport = new PageSupport();
        int totalCount = roleService.getCount(queryRoleCode, queryRoleName);
        int pageSize = 6;
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        pageSupport.setCurrentPageNo(pageIndex ==  null ? 1 : pageIndex);
        ///

        List<Role> roleList = roleService.getRoleList(queryRoleCode, queryRoleName, pageSupport.getCurrentPageNo(), pageSupport.getPageSize());

        session.setAttribute("queryRoleCode", queryRoleCode);
        session.setAttribute("queryRoleName", queryRoleName);
        session.setAttribute("roleList", roleList);
        session.setAttribute("pageSupport", pageSupport);

        return "/WEB-INF/jsp/role/list.jsp";
    }


    /**
     * 跳转到添加页面
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "/WEB-INF/jsp/role/add.jsp";
    }
    /**
     * 添加角色
     */
    @RequestMapping("/add")
    public String add(Role role, HttpSession session) {
        role.setCreationDate(new Date());
        role.setCreatedBy(((User)(session.getAttribute("userSession"))).getId());
        System.out.println("role====>" + role);
        roleService.addRole(role);
        return "redirect:/role/list";
    }

    /**
     * 删除角色
     */
    @RequestMapping("/del")
    public String del(int id) {
        roleService.delete(id);
        return "redirect:/role/list";
    }

    /**
     * 获取数据并跳转到修改页
     */
    @RequestMapping("/toUpd")
    public String toUpt(int id, HttpSession session) {
        Role role = roleService.getRoleById(id);
        session.setAttribute("updateRole", role);
        return "/WEB-INF/jsp/role/upd.jsp";
    }
    /**
     * 修改用户
     */
    @RequestMapping("/upd")
    public String upt(Role role, HttpSession session) {
        System.out.println("role====>" + role);

        role.setModifyDate(new Date());
        role.setModifyBy(((User)(session.getAttribute("userSession"))).getId());

        roleService.updRole(role);
        return "redirect:/role/list";
    }

    /**
     * 通过id查询用户详情
     */
    @RequestMapping("/det")
    public String det(int id, HttpSession session) {
        Role role = roleService.getRoleById(id);
        session.setAttribute("detailRole", role);
        return "/WEB-INF/jsp/role/det.jsp";
    }
}
