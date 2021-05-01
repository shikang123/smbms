package com.ysk.service;

import com.ysk.entity.Role;
import com.ysk.entity.User;
import com.ysk.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
    private RoleMapper roleMapper;

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    @Override
    public List<Role> getRoleList(String roleCode, String roleName, int currentPageNo, int pageSize) {
        return roleMapper.getRoleList(roleCode, roleName,(currentPageNo-1)*pageSize, pageSize);
    }

    @Override
    public List<Role> getIdAndName() {
        return roleMapper.getIdAndName();
    }

    @Override
    public int getCount(String roleCode, String roleName) {
        return roleMapper.getCount(roleCode, roleName);
    }

    @Override
    public int addRole(Role role) {
        return roleMapper.addRole(role);
    }

    @Override
    public Role getRoleById(int id) {
        return roleMapper.getRoleById(id);
    }

    @Override
    public int updRole(Role role) {
        return roleMapper.updRole(role);
    }

    @Override
    public int delete(int id) {
        return roleMapper.deleteRoleById(id);
    }
}
