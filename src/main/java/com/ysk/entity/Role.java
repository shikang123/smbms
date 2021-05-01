package com.ysk.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class Role implements Serializable {
    private Integer id;   //id
    private String roleCode; //角色编码
    private String roleName; //角色名称
    private Date creationDate; //创建时间
    private Date modifyDate;//更新时间
    private Integer modifyBy; //更新者
    private Integer createdBy; //创建者

    private List<User> users;
}
