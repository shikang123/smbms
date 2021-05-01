<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>用户修改-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/upd.css">

</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="userManager"/>
    </jsp:include>

    <div class="right">
        <h2 class="title">用户修改</h2>
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath}/user/upd">
            <input type="hidden" name="id" value="${sessionScope.updateUser.id}">
            <div>
                <label for="userCode">用户编码：</label>
                <input type="text" name="userCode" id="userCode" value="${sessionScope.updateUser.userCode}"> *
                <!-- 放置提示信息 -->
                <span></span>
            </div>
            <div>
                <label for="userName">用户名称：</label>
                <input type="text" name="userName" id="userName" value="${sessionScope.updateUser.userName}"> *
                <span></span>
            </div>
            <div>
                <label for="birthday">出生日期：</label>
                <input type="text" id="birthday" name="birthday" value="${sessionScope.updateUser.birthday}">
                <span></span>
            </div>
            <input type="hidden" name="userPassword" value="${sessionScope.updateUser.userPassword}">
            <div>
                <label>用户性别：</label>
                <input type="radio" ${sessionScope.updateUser.gender==1?"checked":""} name="gender" value="1" id="men"><label for="men">男</label>
                <input type="radio" ${sessionScope.updateUser.gender==2?"checked":""}  name="gender" value="2" id="women"><label for="women">女</label>
            </div>
            <div>
                <label for="phone">用户电话：</label>
                <input type="text" name="phone" id="phone" value="${sessionScope.updateUser.phone}">
                <span></span>
            </div>
            <div>
                <label for="address">用户地址：</label>
                <input type="text" name="address" id="address" value="${sessionScope.updateUser.address}">
                <span></span>
            </div>
            <div>
                <label >用户角色：</label>
                <input id="currentRoleId" type="hidden" name="currentRoleId" value="${sessionScope.updateUser.role.id}">
                <!-- 异步获取角色数据 -->
                <label for="selectRole"></label><select name="roleId" id="selectRole">
                    <option value="">请选择角色</option>
                </select>
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
<%--系统根路径--%>
<script>
    let path = document.getElementById("path").value;
</script>
<%--jquery--%>
<script src="${pageContext.request.contextPath}/static/js/jquery3_6_0.js"></script>
<script src="${pageContext.request.contextPath}/static/js/nav.js"></script>
<script>
    //展示role数据
    let roleSelect = document.getElementById("selectRole");
    function showRoleSelect(data) {
        console.log(typeof data, data);
        for (let i = 0; i < data.length; i++) {
            let option = document.createElement("option");
            option.value = data[i]["id"];
            option.innerText = data[i]["roleName"];
            roleSelect.appendChild(option);
        }
    }
    /*页面加载时，绑定用户角色*/
    function setRole() {
        let roleId = document.getElementById("currentRoleId").value;
        let select = document.getElementById("selectRole");
        for (let i = 0; i < select.options.length; i++) {
            console.log(select.options[i].value === roleId, typeof roleId, typeof select.options[i].value)
            if (select.options[i].value === roleId) {
                select.options[i].selected = true;
                break;
            }
        }
    }
    <%--异步请求角色数据--%>
    $(function () {
        /*请求role数据*/
        $.ajax({
            url: path + "/role/simpleRoleList",
            dataType:"json",
            success: function(result) {
                showRoleSelect(result["simpleRoleList"]);
                setRole(); //默认选中当前用户的角色名
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
