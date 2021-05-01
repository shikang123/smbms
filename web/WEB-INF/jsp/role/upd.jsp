<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色修改-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/role/upd.css">

</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath }/static/images/logo.png"/>
        <jsp:param name="active" value="roleManager"/>
    </jsp:include>

    <div class="right">
        <h2 class="title">修改角色</h2>
        <form method="post" action="${pageContext.request.contextPath }/role/upd">
            <input type="hidden" name="id" value="${sessionScope.updateRole.id}">
            <div>
                <label for="roleCode">角色编码：</label>
                <input type="text" name="roleCode" id="roleCode" value="${sessionScope.updateRole.roleCode}"> *
                <!-- 放置提示信息 -->
                <span></span>
            </div>
            <div>
                <label for="roleName">角色名称：</label>
                <input type="text" name="roleName" id="roleName" value="${sessionScope.updateRole.roleName}"> *
                <span></span>
            </div>
            <div class="providerAddBtn">
                <input type="button" id="add" name="add" value="保存" >
                <input type="button" id="back" name="back" value="返回" >
            </div>
        </form>
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
        /*绑定提交按钮*/
        $("#add").click(function () {
            document.forms[0].submit();
        })
        /*绑定返回按钮*/
        $("#back").click(function () {
            window.history.back();
        })
    })
</script>

</body>
</html>

