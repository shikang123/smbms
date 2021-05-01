package com.ysk.mapper;

import com.ysk.entity.Bill;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("billMapper")
public class BillMapperImpl implements BillMapper {
    private SqlSessionTemplate sqlSessionTemplate;
    @Autowired
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public Bill getBillById(int id) {
        return sqlSessionTemplate.getMapper(BillMapper.class).getBillById(id);
    }

    @Override
    public int updBill(Bill bill) {
        return sqlSessionTemplate.getMapper(BillMapper.class).updBill(bill);
    }

    @Override
    public List<Bill> getBillList(String billCode, String productName, Integer providerId, int startIndex, int pageSize) {
        return sqlSessionTemplate.getMapper(BillMapper.class).getBillList(billCode, productName, providerId, startIndex, pageSize);
    }

    @Override
    public int getBillCount(String billCode, String productName, Integer providerId) {
        return sqlSessionTemplate.getMapper(BillMapper.class).getBillCount(billCode, productName, providerId);
    }

    @Override
    public int deleteBillById(int id) {
        return sqlSessionTemplate.getMapper(BillMapper.class).deleteBillById(id);
    }

    @Override
    public int addBill(Bill bill) {
        return sqlSessionTemplate.getMapper(BillMapper.class).addBill(bill);
    }
}
