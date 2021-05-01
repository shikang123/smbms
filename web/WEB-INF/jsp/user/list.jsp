<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/list.css">

</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="userManager"/>
    </jsp:include>

        <div class="right">
            <div class="nav">
                <form action="${pageContext.request.contextPath}/user/list" method="post">
                    <label for="uname"><input value="${sessionScope.queryUserName}" id="uname" type="text" name="queryUserName" placeholder="用户名"></label>
                    <label for="roleId">
                        <select id="roleId" name="queryRoleId">
                            <option value="">请选择角色</option>
                            <c:forEach items="${sessionScope.simpleRoleList}" var="role">
                                <option ${sessionScope.queryRoleId == role.id?"selected":""} value="${role.id}">${role.roleName}</option>
                            </c:forEach>
                        </select>
                    </label>
                    <input type="hidden" name="pageIndex" value="1">
                    <input type="submit" value="查询">
                </form>
                <button onclick="add()">添加用户</button>
            </div>
            <div class="list">
                <div class="th">
                    <div class="td">用户ID</div>
                    <div class="line"></div>
                    <div class="td">用户编码</div>
                    <div class="line"></div>
                    <div class="td">用户名称</div>
                    <div class="line"></div>
                    <div class="td">角色</div>
                    <div class="line"></div>
                    <div class="td">手机</div>
                    <div class="line"></div>
                    <div class="td">操作</div>
                </div>
                <c:forEach items="${sessionScope.userList}" var="user">
                    <div class="tr">
                        <div class="td">${user.id}</div>
                        <div class="td">${user.userCode}</div>
                        <div class="td">${user.userName}</div>
                        <div class="td">${user.role.roleName}</div>
                        <div class="td">${user.phone}</div>
                        <div class="td">
                            <img onclick="det(${user.id})" src="${pageContext.request.contextPath}/static/images/detaill.png" title="详情" alt="详情">
                            <img onclick="upd(${user.id})" src="${pageContext.request.contextPath}/static/images/update.png" title="修改" alt="修改">
                            <img onclick="del(${user.id})" src="${pageContext.request.contextPath}/static/images/delete.png" title="删除" alt="删除">
                        </div>
                    </div>
                </c:forEach>
            </div>

            <%--分页模块--%>
            <script src="${pageContext.request.contextPath}/static/js/pagemodule.js"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/pagemodule.css"/>
            <jsp:include page="../common/pagemodule.jsp"/>

        </div>

    </div><%--main--%>

    <jsp:include page="../common/foot.jsp"/>

</div><%--wrap--%>


<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<!-- js脚本 -->
<script>
    let path = document.getElementById("path").value;
</script>
<script src="${pageContext.request.contextPath}/static/js/jquery3_6_0.js"></script>
<script src="${pageContext.request.contextPath}/static/js/nav.js"></script>
<script>

    function add() {
        window.location.href = path + "/user/toAdd";
    }

    function det(id) {
        window.location.href = path + "/user/det?id=" + id;
    }

    function upd(id) {
        window.location.href = path + "/user/toUpd?id=" + id;
    }

    function del(id) {
        window.location.href = path + "/user/del?id=" + id;
    }

</script>

</body>
</html>

