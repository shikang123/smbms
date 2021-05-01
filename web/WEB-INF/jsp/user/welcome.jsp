<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>

<html>
<head>
    <title>超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
</head>
<body>
<div class="wrap">
    <%--头部 & 左侧导航栏--%>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="helloPage"/>
    </jsp:include>
        <%--右侧 - 主体--%>
        <div class="right">
            <div class="hello">
                <img src="${pageContext.request.contextPath}/static/images/lock.png" alt="">
                <span>欢迎您，<i>${sessionScope.userSession.userName}</i></span>
            </div>
        </div>
    </div> <%--main--%>
    <%--底部--%>
    <jsp:include page="../common/foot.jsp"/>

</div><%--wrap--%>

<%--提供系统发布路径给js--%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<!-- js脚本 -->
<script>
    let path = document.getElementById("path").value;
</script>
<script src="${pageContext.request.contextPath}/static/js/jquery3_6_0.js"></script>
<script src="${pageContext.request.contextPath}/static/js/nav.js"></script>
</body>
</html>
