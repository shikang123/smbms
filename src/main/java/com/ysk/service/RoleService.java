package com.ysk.service;

import com.ysk.entity.Role;
import com.ysk.entity.User;

import java.util.List;

public interface RoleService {

    /**
     * 通过条件查询-roleList
     */
    public List<Role> getRoleList(String roleCode, String roleName, int currentPageNo, int pageSize);
    /**
     * 获取角色id和名称
     */
    public List<Role> getIdAndName();

    //获取角色列表数目
    public int getCount(String roleCode, String roleName);

    public int addRole(Role role);

    public Role getRoleById(int id);

    public int updRole(Role role);

    public int delete(int id);

}
