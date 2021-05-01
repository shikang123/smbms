<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色详情-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/role/det.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="roleManager"/>
    </jsp:include>

    <div class="right">

        <div class="title">
            角色详情
        </div>

        <div class="detail">
            <div>
                <label>角色编码：</label><span>${sessionScope.detailRole.roleCode}</span>
            </div>
            <div>
                <label>角色名称：</label>${sessionScope.detailRole.roleName}
            </div>
            <div>
                <label>创建人ID：</label>${sessionScope.detailRole.createdBy}
            </div>
            <div>
                <label>创建日期：</label>${sessionScope.detailRole.creationDate.toLocaleString()}
            </div>
            <div>
                <label>修改人ID：</label>${sessionScope.detailRole.modifyBy}
            </div>
            <div>
                <label>修改日期：</label>${sessionScope.detailRole.modifyDate.toLocaleString()}
            </div>
            <div>
                <button id="back">返回</button>
            </div>
        </div>

    </div>
</div><%--main--%>

<jsp:include page="../common/foot.jsp"/>

</div><%--wrap--%>


<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<%--系统根路径--%>
<script>
    let path = document.getElementById("path").value;
</script>
<%--jquery--%>
<script src="${pageContext.request.contextPath}/static/js/jquery3_6_0.js"></script>
<script src="${pageContext.request.contextPath}/static/js/nav.js"></script>

<script>
    /*绑定返回按钮*/
    document.getElementById("back").onclick = function() {
        window.history.back();
    }
</script>

</body>
</html>
