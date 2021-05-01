package com.ysk.mapper;

import com.ysk.entity.Role;
import com.ysk.entity.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("RoleMapper")
public class RoleMapperImpl implements RoleMapper {

    private SqlSessionTemplate sqlSessionTemplate;
    @Autowired
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    /**
     *
     */
    @Override
    public List<Role> getRoleList(String roleCode, String roleName, int startIndex, int pageSize) {
        return sqlSessionTemplate.getMapper(RoleMapper.class).getRoleList(roleCode, roleName, startIndex, pageSize);
    }

    /**
     * 获取角色id与name
     */
    @Override
    public List<Role> getIdAndName() {
        return sqlSessionTemplate.getMapper(RoleMapper.class).getIdAndName();
    }

    @Override
    public int getCount(String roleCode, String roleName) {
        return sqlSessionTemplate.getMapper(RoleMapper.class).getCount(roleCode, roleName);
    }

    @Override
    public int addRole(Role role) {
        return sqlSessionTemplate.getMapper(RoleMapper.class).addRole(role);
    }

    @Override
    public Role getRoleById(int id) {
        return sqlSessionTemplate.getMapper(RoleMapper.class).getRoleById(id);
    }

    @Override
    public int updRole(Role role) {
        return sqlSessionTemplate.getMapper(RoleMapper.class).updRole(role);
    }

    @Override
    public int deleteRoleById(int id) {
        return sqlSessionTemplate.getMapper(RoleMapper.class).deleteRoleById(id);
    }
}
