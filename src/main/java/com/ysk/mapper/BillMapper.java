package com.ysk.mapper;

import com.ysk.entity.Bill;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BillMapper {

    Bill getBillById(@Param("billId") int id);

    int updBill(Bill bill);

    /**
     * 通过条件查询-userList
     * @return
     */
    List<Bill> getBillList(@Param("billCode") String billCode, @Param("productName") String productName, @Param("providerId") Integer providerId, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

    /**
     * 通过条件查询-用户表记录数
     */
    int getBillCount(@Param("billCode") String billCode, @Param("productName") String productName, @Param("providerId") Integer providerId);

    int deleteBillById(@Param("billId") int billId);

    int addBill(Bill bill);
}
