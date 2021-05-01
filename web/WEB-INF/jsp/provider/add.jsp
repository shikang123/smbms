<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>供应商添加-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/provider/add.css">

</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="providerManager"/>
    </jsp:include>

    <div class="right">
        <h2 class="title">添加供应商</h2>
        <form method="post" action="${pageContext.request.contextPath }/provider/add">
            <div>
                <label for="proCode">供应商编码：</label>
                <input type="text" name="proCode" id="proCode" value=""><span> *</span>
            </div>
            <div>
                <label for="proName">供应商名称：</label>
                <input type="text" name="proName" id="proName" value=""><span> *</span>
            </div>
            <div>
                <label for="proContact">联系人：</label>
                <input type="text" name="proContact" id="proContact"><span> *</span>
            </div>
            <div>
                <label for="proPhone">联系电话：</label>
                <input type="text" name="proPhone" id="proPhone"><span> *</span>
            </div>
            <div>
                <label for="proAddress">地址：</label>
                <input type="text" name="proAddress" id="proAddress"><span> *</span>
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
<!-- js脚本 -->
<script>
    let path = document.getElementById("path").value;
</script>
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
