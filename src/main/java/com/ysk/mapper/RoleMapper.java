package com.ysk.mapper;

import com.ysk.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    List<Role> getRoleList(@Param("roleCode") String roleCode, @Param("roleName") String roleName, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

    List<Role> getIdAndName();

    int getCount(@Param("roleCode") String roleCode, @Param("roleName") String roleName);

    int addRole(Role role);

    Role getRoleById(int id);

    int updRole(Role role);

    int deleteRoleById(int id);

}
