<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>订单详情-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bill/det.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="billManager"/>
    </jsp:include>

    <div class="right">

        <div class="title">
            订单详情
        </div>

        <div class="detail">
            <div>
                <label>订单编码：</label><span>${sessionScope.detailBill.billCode}</span>
            </div>
            <div>
                <label>商品名称：</label>${sessionScope.detailBill.productName}
            </div>
            <div>
                <label>单位：</label>${sessionScope.detailBill.productUnit}
            </div>
            <div>
                <label>数量：</label>${sessionScope.detailBill.productCount}
            </div>
            <div>
                <label>总价格：</label>${sessionScope.detailBill.totalPrice}
            </div>
            <div>
                <label>是否已支付：</label>${sessionScope.detailBill.isPayment==1?"未支付":"已支付"}
            </div>
            <div>
                <label>创建人ID：</label>${sessionScope.detailBill.createdBy}
            </div>
            <div>
                <label>创建日期：</label>${sessionScope.detailBill.creationDate.toLocaleString()}
            </div>
            <div>
                <label>修改人ID：</label>${sessionScope.detailBill.modifyBy}
            </div>
            <div>
                <label>修改日期：</label>${sessionScope.detailBill.modifyDate.toLocaleString()}
            </div>
            <div>
                <label>供应商：</label>${sessionScope.detailBill.provider.proName}
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
