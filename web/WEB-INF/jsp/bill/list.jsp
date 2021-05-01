<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bill/list.css">

</head>
<body>

<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="billManager"/>
    </jsp:include>

        <div class="right">
            <div class="nav">
                <form action="${pageContext.request.contextPath}/bill/list">
                    <label for="billCode"><input value="${sessionScope.queryBillCode}" id="billCode" type="text" name="queryBillCode" placeholder="订单编码"></label>
                    <label for="productName"><input value="${sessionScope.queryProductName}" id="productName" type="text" name="queryProductName" placeholder="订单名"></label>
                    <label>
                        <select name="queryProviderId">
                            <option value="">请选择供应商</option>
                            <c:forEach items="${sessionScope.simpleProviderList}" var="provider">
                                <option ${sessionScope.queryProviderId == provider.id?"selected":""} value="${provider.id}">${provider.proName}</option>
                            </c:forEach>
                        </select>
                    </label>
                    <input type="hidden" name="pageIndex" value="1">
                    <input type="submit" value="查询">
                </form>
                <button class="addItem">添加订单</button>
            </div>
            <div class="list">
                <div class="th">
                    <div class="td">订单编码</div>
                    <div class="line"></div>
                    <div class="td">订单名称</div>
                    <div class="line"></div>
                    <div class="td">商品总额</div>
                    <div class="line"></div>
                    <div class="td">是否支付</div>
                    <div class="line"></div>
                    <div class="td">操作</div>
                </div>
                <c:forEach items="${sessionScope.billList}" var="bill">
                    <div class="tr">
                        <div class="td">${bill.billCode}</div>
                        <div class="td">${bill.productName}</div>
                        <div class="td">￥${bill.totalPrice} 元</div>
                        <div class="td">${bill.isPayment==1?"未付款":"已付款"}</div>
                        <div class="td">
                            <img onclick="det(${bill.id})" src="${pageContext.request.contextPath}/static/images/detaill.png" title="详情" alt="详情">
                            <img onclick="upd(${bill.id})" src="${pageContext.request.contextPath}/static/images/update.png" title="修改" alt="修改">
                            <c:choose>
                                <c:when test="${bill.isPayment==2}">
                                    <img onclick="del(${bill.id})" src="${pageContext.request.contextPath}/static/images/delete.png" title="删除" alt="删除">
                                </c:when>
                                <c:otherwise>
                                    <img style="cursor: default;" src="${pageContext.request.contextPath}/static/images/nodelete.png" alt="删除">
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
<!-- js脚本 -->
<script>
    let path = document.getElementById("path").value;
</script>
<script src="${pageContext.request.contextPath}/static/js/jquery3_6_0.js"></script>
<script src="${pageContext.request.contextPath}/static/js/nav.js"></script>
<script>
    $(function () {
        $(".addItem").on("click", function () {
            window.location.href = path + "/bill/toAdd";
        });
    })

    function det(id) {
        window.location.href = path + "/bill/det?id=" + id;
    }

    function upd(id) {
        window.location.href = path + "/bill/toUpd?id=" + id;
    }

    function del(id) {
        window.location.href = path + "/bill/del?id=" + id;
    }
</script>

</body>
</html>

