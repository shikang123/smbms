<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>用户详情-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/det.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="userManager"/>
    </jsp:include>

        <div class="right">

            <div class="title">
                用户详情
            </div>

            <div class="detail">
                <div>
                    <label>用户编码：</label><span>${sessionScope.detailUser.userCode}</span>
                </div>
                <div>
                    <label>用户名称：</label>${sessionScope.detailUser.userName}
                </div>
                <div>
                    <label>出生日期：</label>${sessionScope.detailUser.birthday}
                </div>
                <div>
                    <label>用户性别：</label>${sessionScope.detailUser.gender==1?"男":"女"}
                </div>
                <div>
                    <label>用户电话：</label>${sessionScope.detailUser.phone}
                </div>
                <div>
                    <label>用户地址：</label>${sessionScope.detailUser.address}
                </div>
                <div>
                    <label>用户角色：</label>${sessionScope.detailUser.role.roleName}
                </div>
                <div>
                    <label>创建人ID：</label>${sessionScope.detailUser.createdBy}
                </div>
                <div>
                    <label>创建日期：</label>${sessionScope.detailUser.creationDate.toLocaleString()}
                </div>
                <div>
                    <label>修改人ID：</label>${sessionScope.detailUser.modifyBy}
                </div>
                <div>
                    <label>修改日期：</label>${sessionScope.detailUser.modifyDate.toLocaleString()}
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
