<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>供应商详情-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/provider/det.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/images/logo.png"/>
        <jsp:param name="active" value="providerManager"/>
    </jsp:include>

    <div class="right">

        <div class="title">
            供应商详情
        </div>

        <div class="detail">
            <div>
                <label>供应商编码：</label><span>${sessionScope.detailPro.proCode}</span>
            </div>
            <div>
                <label>供应商名称：</label>${sessionScope.detailPro.proName}
            </div>
            <div>
                <label>供应商详情：</label>${sessionScope.detailPro.proDesc}
            </div>
            <div>
                <label>供应联系人：</label>${sessionScope.detailPro.proContact}
            </div>
            <div>
                <label>电话号码：</label>${sessionScope.detailPro.proPhone}
            </div>
            <div>
                <label>供应商地址：</label>${sessionScope.detailPro.proAddress}
            </div>
            <div>
                <label>创建人ID：</label>${sessionScope.detailPro.createdBy}
            </div>
            <div>
                <label>创建日期：</label>${sessionScope.detailPro.creationDate.toLocaleString()}
            </div>
            <div>
                <label>修改人ID：</label>${sessionScope.detailPro.modifyBy}
            </div>
            <div>
                <label>修改日期：</label>${sessionScope.detailPro.modifyDate.toLocaleString()}
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
<!-- js脚本 -->
<script>
    let path = document.getElementById("path").value;
</script>
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
