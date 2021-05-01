<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<div class="head">
    <img src="<%=request.getParameter("logoUrl")%>" alt="">
    <span class="title">超市订单管理系统</span>
    <span class="right">欢迎您，<i>${sessionScope.userSession.userName}</i><a href="${pageContext.request.contextPath}/user/logout">退出系统</a></span>
</div>
<div class="main">
    <div class="left">
        <div class="ul">功能列表</div>
        <div class="li <%=request.getParameter("active").equals("userManager")?"active":""%>" id="userManager">用户管理</div>
        <div class="line"></div>
        <div class="li <%=request.getParameter("active").equals("billManager")?"active":""%>" id="billManager">订单管理</div>
        <div class="line"></div>
        <div class="li <%=request.getParameter("active").equals("roleManager")?"active":""%>" id="roleManager">角色管理</div>
        <div class="line"></div>
        <div class="li <%=request.getParameter("active").equals("providerManager")?"active":""%>" id="providerManager">供应商管理</div>
        <div class="line"></div>
        <div class="li <%=request.getParameter("active").equals("modifyPassword")?"active":""%>" id="modifyPassword">修改密码</div>
        <div class="line"></div>
        <div class="li" id="logout">退出系统</div>
        <div class="line"></div>
    </div>