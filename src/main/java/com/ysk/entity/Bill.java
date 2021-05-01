package com.ysk.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Bill {
    private Integer id;//主键ID,
    private String billCode;//账单编码,
    private String productName;//商品名称,
    private String productDesc;//商品描述,
    private String productUnit;//商品单位,
    private double productCount;//商品数量,
    private double totalPrice;//商品总额,
    private int isPayment;//是否支付,
    private Integer createdBy;//创建者（userId）,
    private Date creationDate;//创建时间,
    private Date  modifyDate;// 更新时间,
    private Integer modifyBy;//更新者（userId）,

    private Provider provider;//供应商
}
