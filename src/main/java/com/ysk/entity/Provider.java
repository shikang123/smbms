package com.ysk.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Provider {
    private Integer id;//主键ID,
    private String proCode;//供应商编码,
    private String proName;//供应商名称,
    private String proDesc;//供应商详细描述,
    private String proContact;//供应商联系人,
    private String proPhone;//联系电话,
    private String proFax;//微信,
    private String proAddress;//地址,
    private Integer createdBy;//创建者（userId）,
    private Date creationDate;//创建时间,
    private Date  modifyDate;// 更新时间,
    private Integer modifyBy;//更新者（userId）

    private List<Bill> bills;
}
