<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>用户添加-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/add.css">

</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/static/images/logo.png"/>
        <jsp:param name="active" value="userManager"/>
    </jsp:include>

        <div class="right">
            <h2 class="title">添加用户</h2>
            <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/add">
                <div>
                    <label for="userCode">用户编码：</label>
                    <input type="text" name="userCode" id="userCode" value="">
                    <span class="showMsg"> *</span>
                </div>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="">
                    <span class="showMsg"> *</span>
                </div>
                <div>
                    <label for="birth">出生日期：</label>
                    <input type="text" id="birth" name="birthday">
                </div>
                <div>
                    <label for="userPassword">用户密码：</label>
                    <input type="password" name="userPassword" id="userPassword" value="">
                    <span class="showMsg"> *</span>
                </div>
                <div>
                    <label for="confirm">确认密码：</label>
                    <input type="password" name="confirm" id="confirm">
                    <span class="showMsg"> *</span>
                </div>
                <div>
                    <label>用户性别：</label>
                    <input type="radio" checked name="gender" value="1" id="men"><label for="men">男</label>
                    <input type="radio" name="gender" value="2" id="women"><label for="women">女</label>
                </div>
                <div>
                    <label for="phone">用户电话：</label>
                    <input type="text" name="phone" id="phone">
                    <span class="showMsg"> *</span>
                </div>
                <div>
                    <label for="address">用户地址：</label>
                    <input type="text" name="address" id="address">
                </div>
                <div>
                    <label >用户角色：</label>
                    <!-- 异步获取角色数据 -->
                    <label for="selectRole"></label><select name="roleId" id="selectRole">
                        <option value="">请选择角色</option>
                    </select>
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
<script>
    /*项目根路径*/
    let path = document.getElementById("path").value;
</script>
<%--异步请求角色数据--%>
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
    $(function () {
        /**
         * 异步请求role数据
         */
        $.ajax({
            url: path + "/role/simpleRoleList",
            dataType:"json",
            success: function(result) {
                showRoleSelect(result["simpleRoleList"]);
            }
        });

        /**
         * 绑定返回按钮
         */
        $("#back").click(function () {
            window.history.back();
        })

        /**
         * 表单数据提交前的校验
         */
        //全为true才能提交: userCode, userName, userPassword, confirm, phone
        let flags = [false, false, false, false, false];
        function showMsg(element, data) {
            element.innerText = data.text;
            element.style.color = data.color;
            element.style.fontSize = "12px";
        }

        // 验证密码是否合法
        $("#userPassword").focus(function () {
            let showMsgElement = $(".showMsg")[2];
            showMsg(showMsgElement, {color: "#888888", text: " ...(请输入6~12位数字或字母)"})
        }).blur(function (e) {
            let newPass = e.target.value;
            let showMsgElement = $(".showMsg")[2];
            let regex = /^[0-9a-zA-Z]{6,12}$/;
            if(regex.test(newPass)) {
                showMsg(showMsgElement, {color: "green", text: " ok"});
                flags[2] = true;
            } else {
                showMsg(showMsgElement, {color: "red", text: " error"});
                flags[2] = false;
            }
        })

        // 验证确认密码与密码是否一致
        $("#confirm").focus(function () {
            let showMsgElement = $(".showMsg")[3];
            showMsg(showMsgElement, {color: "#888888", text: " ...(请确认密码)"})
        }).blur(function (e) {
            let showMsgElement = $(".showMsg")[3];
            let userPassword = e.target.value;
            let confirmPass =  document.getElementById("userPassword").value;
            if(userPassword === confirmPass) {
                showMsg(showMsgElement, {color: "green", text: " ok"})
                flags[3] = true;
            } else {
                showMsg(showMsgElement, {color: "red", text: " error"})
                flags[3] = false;
            }
        })

        $("#save").on("click", function (e) {
            e.preventDefault();
            if(flags[0] && flags[1] && flags[2]) {
                document.forms[0].submit();
            }
        })

    })
</script>

</body>
</html>
