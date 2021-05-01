<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/provider/list.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="providerManager"/>
    </jsp:include>
    <div class="right">
        <div class="nav">
            <form action="${pageContext.request.contextPath}/provider/list">
                <label for="providerName">
                    <input value="${sessionScope.queryProName}"
                           id="providerName" type="text" name="queryProName" placeholder="供应商名">
                </label>
                <input type="hidden" name="pageIndex" value="1">
                <input type="submit" value="查询">
            </form>
            <button class="addItem">添加供应商</button>
        </div>
        <div class="list">
            <div class="th">
                <div class="td">供应商编码</div>
                <div class="line"></div>
                <div class="td">供应商名称</div>
                <div class="line"></div>
                <div class="td">供应商联系人</div>
                <div class="line"></div>
                <div class="td">供应商电话</div>
                <div class="line"></div>
                <div class="td">操作</div>
            </div>
            <c:forEach items="${sessionScope.proList}" var="pro">
                <div class="tr">
                    <div class="td">${pro.proCode}</div>
                    <div class="td">${pro.proName}</div>
                    <div class="td">${pro.proContact}</div>
                    <div class="td">${pro.proPhone}</div>
                    <div class="td">
                        <img onclick="det(${pro.id})" src="${pageContext.request.contextPath}/static/images/detaill.png" title="详情" alt="详情">
                        <img onclick="upd(${pro.id})" src="${pageContext.request.contextPath}/static/images/update.png" title="修改" alt="修改">
                        <c:choose>
                            <c:when test="${pro.bills.size() > 0}">
                                <img style="cursor: default;" src="${pageContext.request.contextPath}/static/images/nodelete.png" alt="删除">
                            </c:when>
                            <c:otherwise>
                                <img onclick="del(${pro.id})" src="${pageContext.request.contextPath}/static/images/delete.png" title="删除" alt="删除">
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
</div>
<%--main--%>

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
            window.location.href = path + "/provider/toAdd";
        });
    })

    function det(id) {
        window.location.href = path + "/provider/det?id=" + id;
    }

    function upd(id) {
        window.location.href = path + "/provider/toUpd?id=" + id;
    }

    function del(id) {
        window.location.href = path + "/provider/del?id=" + id;
    }
</script>

</body>
</html>

