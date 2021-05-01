package com.ysk.controller;

import com.ysk.entity.Bill;
import com.ysk.entity.Provider;
import com.ysk.entity.Role;
import com.ysk.entity.User;
import com.ysk.mapper.BillMapper;
import com.ysk.mapper.ProviderMapper;
import com.ysk.utils.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/bill")
public class BillController {
    private BillMapper billMapper;
    private ProviderMapper providerMapper;
    @Autowired
    public void setBillMapper(BillMapper billMapper) {
        this.billMapper = billMapper;
    }
    @Autowired
    public void setProviderMapper(ProviderMapper providerMapper) {
        this.providerMapper = providerMapper;
    }

    /**
     * 跳转到添加页面
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "/WEB-INF/jsp/bill/add.jsp";
    }
    /**
     * 添加用户
     */
    @RequestMapping("/add")
    public String add(Bill bill, int providerId, HttpSession session) {
        Provider provider = new Provider();
        provider.setId(providerId);
        bill.setProvider(provider);
        bill.setCreationDate(new Date());
        bill.setCreatedBy(((User)(session.getAttribute("userSession"))).getId());
        billMapper.addBill(bill);
        return "redirect:/bill/list";
    }

    /**
     * 删除用户
     */
    @RequestMapping("/del")
    public String del(int id) {
        billMapper.deleteBillById(id);
        return "redirect:/bill/list";
    }

    /**
     * 获取数据并跳转到修改页
     */
    @RequestMapping("/toUpd")
    public String toUpt(int id, HttpSession session) {
        Bill bill = billMapper.getBillById(id);
        session.setAttribute("updateBill", bill);
        return "/WEB-INF/jsp/bill/upd.jsp";
    }
    /**
     * 修改订单
     */
    @RequestMapping("/upd")
    public String upt(Bill bill, Integer providerId, HttpSession session) {
        System.out.println("bill====>" + bill);
        System.out.println("providerId====>" + providerId);

        Provider provider = new Provider();
        provider.setId(providerId);
        bill.setProvider(provider);
        bill.setModifyDate(new Date());
        bill.setModifyBy(((User)(session.getAttribute("userSession"))).getId());

        billMapper.updBill(bill);
        return "redirect:/bill/list";
    }

    /**
     * 通过id查询订单详情
     */
    @RequestMapping("/det")
    public String det(int id, HttpSession session) {
        Bill bill = billMapper.getBillById(id);
        session.setAttribute("detailBill", bill);
        return "/WEB-INF/jsp/bill/det.jsp";
    }

    /**
     * 展示订单列表
     */
    @RequestMapping("/list")
    public String list(HttpSession session, String queryBillCode, String queryProductName, Integer queryProviderId, Integer pageIndex) {
        System.out.println("bill - list----------");
        System.out.println("queryBillCode==>" + queryBillCode);
        System.out.println("queryProductName  ==>" + queryProductName);
        System.out.println("queryProviderId  ==>" + queryProviderId);
        System.out.println("pageIndex    ==>" + pageIndex);

        ///////////分页类
        PageSupport pageSupport = new PageSupport();
        int totalCount = billMapper.getBillCount(queryBillCode, queryProductName, queryProviderId);
        int pageSize = 6;
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        pageSupport.setCurrentPageNo(pageIndex ==  null ? 1 : pageIndex);
        ///

        List<Provider> simpleProviderList = providerMapper.getIdAndName();

        List<Bill> billList = billMapper.getBillList(queryBillCode, queryProductName, queryProviderId, (pageSupport.getCurrentPageNo() - 1) * pageSupport.getPageSize(), pageSupport.getPageSize());

        session.setAttribute("queryBillCode", queryBillCode);
        session.setAttribute("queryProductName", queryProductName);
        session.setAttribute("queryProviderId", queryProviderId);
        session.setAttribute("simpleProviderList", simpleProviderList);
        session.setAttribute("billList", billList);
        session.setAttribute("pageSupport", pageSupport);

        return "/WEB-INF/jsp/bill/list.jsp";
    }

}
