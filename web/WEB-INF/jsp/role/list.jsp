<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/role/list.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="roleManager"/>
    </jsp:include>
        <div class="right">
            <div class="nav">
                <form action="${pageContext.request.contextPath}/role/list" method="post">
                    <label for="roleCode"><input value="${sessionScope.queryRoleCode}" id="roleCode" type="text" name="queryRoleCode" placeholder="角色编码"></label>
                    <label for="roleName"><input value="${sessionScope.queryRoleName}" id="roleName" type="text" name="queryRoleName" placeholder="角色名"></label>
                    <input type="hidden" name="pageIndex" value="1">
                    <input type="submit" value="查询">
                </form>
                <button class="addItem">添加角色</button>
            </div>
            <div class="list">
                <div class="th">
                    <div class="td">角色编码</div>
                    <div class="line"></div>
                    <div class="td">角色名</div>
                    <div class="line"></div>
                    <div class="td">操作</div>
                </div>
                <c:forEach items="${sessionScope.roleList}" var="role">
                    <div class="tr">
                        <div class="td">${role.roleCode}</div>
                        <div class="td">${role.roleName}</div>
                        <div class="td">
                            <img onclick="det(${role.id})" src="${pageContext.request.contextPath}/static/images/detaill.png" title="详情" alt="详情">
                            <img onclick="upd(${role.id})" src="${pageContext.request.contextPath}/static/images/update.png" title="修改" alt="修改">
                            <c:choose>
                                <c:when test="${role.users.size() > 0}">
                                    <img style="cursor: default;" src="${pageContext.request.contextPath}/static/images/nodelete.png" alt="删除">
                                </c:when>
                                <c:otherwise>
                                    <img onclick="del(${role.id})" src="${pageContext.request.contextPath}/static/images/delete.png" title="删除" alt="删除">
                                </c:otherwise>
                            </c:choose>
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
<script>
    /*项目根路径*/
    let path = document.getElementById("path").value;
</script>
<%--异步请求角色数据--%>
<%--jquery--%>
<script src="${pageContext.request.contextPath}/static/js/jquery3_6_0.js"></script>
<script src="${pageContext.request.contextPath}/static/js/nav.js"></script>
<script>
    $(function () {
        $(".addItem").on("click", function () {
            window.location.href = path + "/role/toAdd";
        });
    })

    function det(id) {
        window.location.href = path + "/role/det?id=" + id;
    }

    function upd(id) {
        window.location.href = path + "/role/toUpd?id=" + id;
    }

    function del(id) {
        window.location.href = path + "/role/del?id=" + id;
    }

</script>


</body>
</html>

