<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单修改-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bill/upd.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="billManager"/>
    </jsp:include>

    <div class="right">
        <h2 class="title">修改订单</h2>
        <form method="post" action="${pageContext.request.contextPath }/bill/upd">
            <input type="hidden" name="id" value="${sessionScope.updateBill.id}">
            <div>
                <label for="billCode">订单编码：</label>
                <input type="text" name="billCode" id="billCode" value="${sessionScope.updateBill.billCode}"> *
                <!-- 放置提示信息 -->
                <span></span>
            </div>
            <div>
                <label for="productName">产品名称：</label>
                <input type="text" name="productName" id="productName" value="${sessionScope.updateBill.productName}"> *
                <span></span>
            </div>
            <div>
                <label for="productUnit">产品单位：</label>
                <input type="text" name="productUnit" id="productUnit" value="${sessionScope.updateBill.productUnit}"> *
                <span></span>
            </div>
            <div>
                <label for="productCount">产品数量：</label>
                <input type="text" name="productCount" id="productCount"
                       value="${sessionScope.updateBill.productCount}"> *
                <span></span>
            </div>
            <div>
                <label for="totalPrice">总价：</label>
                <input type="text" name="totalPrice" id="totalPrice" value="${sessionScope.updateBill.totalPrice}"> *
                <span></span>
            </div>
            <div>
                <label for="totalPrice">是否已付款：</label>
                <label>
                    <input type="radio" name="isPayment" value="1" ${sessionScope.updateBill.isPayment==1?"checked":""}>
                    未付款
                </label>
                <label>
                    <input type="radio" name="isPayment" value="2" ${sessionScope.updateBill.isPayment==2?"checked":""}>
                    已付款
                </label>
                <span></span>
            </div>
            <div>
                <label>供应商：</label>
                <input id="currentProviderId" type="hidden"
                       name="currentProviderId" value="${sessionScope.updateBill.provider.id}">
                <!-- 异步获取供应商数据 -->
                <label for="selectProvider"></label><select name="providerId" id="selectProvider">
                    <option value="">请选择供应商</option>
                </select>
                <span></span>
            </div>
            <div class="providerAddBtn">
                <input type="button" id="add" name="add" value="保存">
                <input type="button" id="back" name="back" value="返回">
            </div>
        </form>
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
    //展示provider数据
    let selectProvider = document.getElementById("selectProvider");
    function showProviderSelect(data) {
        for (let i = 0; i < data.length; i++) {
            let option = document.createElement("option");
            option.value = data[i]["id"];
            option.innerText = data[i]["proName"];
            selectProvider.appendChild(option);
        }
    }

    /*页面加载时，绑定供应商*/
    function setProvider() {
        let providerId = document.getElementById("currentProviderId").value;
        console.log(providerId);
        let select = document.getElementById("selectProvider");
        for (let i = 0; i < select.options.length; i++) {
            if (select.options[i].value === providerId) {
                select.options[i].selected = true;
                break;
            }
        }
    }

    $(function () {
        /*请求provider数据*/
        $.ajax({
            url: path + "/provider/simpleProviderList",
            dataType: "json",
            success: function (result) {
                showProviderSelect(result["simpleProviderList"]);
                setProvider(); //默认选中当前订单的供应商
            }
        });
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
