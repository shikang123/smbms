package com.ysk.controller;

import com.alibaba.fastjson.JSONArray;
import com.ysk.entity.Provider;
import com.ysk.entity.User;
import com.ysk.mapper.ProviderMapper;
import com.ysk.utils.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/provider")
public class ProviderController {

    ProviderMapper providerMapper;
    @Autowired
    public void setProviderMapper(ProviderMapper providerMapper) {
        this.providerMapper = providerMapper;
    }

    /**
     * 展示角色列表
     */
    @RequestMapping("/list")
    public String list(HttpSession session, String queryProName, Integer pageIndex) {
        System.out.println("provider - list----------");
        System.out.println("queryProName==>" + queryProName);
        System.out.println("pageIndex    ==>" + pageIndex);

        ///////////分页类
        PageSupport pageSupport = new PageSupport();
        int totalCount = providerMapper.getProCount(queryProName);
        int pageSize = 6;
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        pageSupport.setCurrentPageNo(pageIndex ==  null ? 1 : pageIndex);
        ///

        List<Provider> proList = providerMapper.getProList(queryProName, ((pageSupport.getCurrentPageNo() - 1) * pageSupport.getPageSize()), pageSupport.getPageSize());

        session.setAttribute("queryProName", queryProName);
        session.setAttribute("proList", proList);
        session.setAttribute("pageSupport", pageSupport);

        return "/WEB-INF/jsp/provider/list.jsp";
    }

    /**
     * 异步请求，获取供应商信息
     */
    @RequestMapping("/simpleProviderList")
    @ResponseBody
    public String simpleRoleList() {
        List<Provider> simpleProviderList = providerMapper.getIdAndName();
        Map<String, List<Provider>> map = new HashMap<>();
        map.put("simpleProviderList", simpleProviderList);
        return JSONArray.toJSONString(map);
    }

    /**
     * 跳转到添加页面
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "/WEB-INF/jsp/provider/add.jsp";
    }
    /**
     * 添加角色
     */
    @RequestMapping("/add")
    public String add(Provider provider, HttpSession session) {
        provider.setCreationDate(new Date());
        provider.setCreatedBy(((User)(session.getAttribute("userSession"))).getId());
        System.out.println("provider====>" + provider);
        providerMapper.addProvider(provider);
        return "redirect:/provider/list";
    }
    /**
     * 删除角色
     */
    @RequestMapping("/del")
    public String del(int id) {
        providerMapper.delProviderById(id);
        return "redirect:/provider/list";
    }

    /**
     * 获取数据并跳转到修改页
     */
    @RequestMapping("/toUpd")
    public String toUpt(int id, HttpSession session) {
        Provider provider = providerMapper.getProviderById(id);
        session.setAttribute("updatePro", provider);
        return "/WEB-INF/jsp/provider/upd.jsp";
    }
    /**
     * 修改用户
     */
    @RequestMapping("/upd")
    public String upt(Provider provider, HttpSession session) {
        System.out.println("provider====>" + provider);

        provider.setModifyDate(new Date());
        provider.setModifyBy(((User)(session.getAttribute("userSession"))).getId());

        providerMapper.updProvider(provider);
        return "redirect:/provider/list";
    }

    /**
     * 通过id查询用户详情
     */
    @RequestMapping("/det")
    public String det(int id, HttpSession session) {
        Provider provider = providerMapper.getProviderById(id);
        session.setAttribute("detailPro", provider);
        return "/WEB-INF/jsp/provider/det.jsp";
    }

}
