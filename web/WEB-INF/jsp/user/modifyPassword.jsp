<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>用户管理-超市订单管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/modifyPassword.css">

</head>
<body>
<div class="wrap">
    <jsp:include page="../common/head.jsp">
        <jsp:param name="logoUrl" value="${pageContext.request.contextPath}/images/logo.png"/>
        <jsp:param name="active" value="modifyPassword"/>
    </jsp:include>
    <div class="right">
        <div class="title">修改密码</div>
        <form id="form" method="post" action="${pageContext.request.contextPath}/user/modify">
            <label for="oldPass">
                <input type="password" name="oldPass" id="oldPass" placeholder="旧密码"><span class="showMsg"> *</span>
            </label>
            <label for="newPass">
                <input type="password" name="newPass" id="newPass" placeholder="新密码"><span class="showMsg"> *</span>
            </label>
            <label for="confirmPass">
                <input type="password" name="confirmPass" id="confirmPass" placeholder="确认密码"><span class="showMsg"> *</span>
            </label>
            <label>
                <button id="save">保存</button>
            </label>
        </form>
        <div class="success_msg">
            ${success}
        </div>
        <div class="error_msg">
            ${error}
        </div>
    </div>
</div>
<%--main--%>

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
    $(function () {
        /*全为true才能提交*/
        let flags = [false, false, false];

        function showMsg(element, data) {
            element.innerText = data.text;
            element.style.color = data.color;
            element.style.fontSize = "12px";
        }

        /*验证旧密码是否正确*/
        $("#oldPass").focus(function () {
            let showMsgElement = $(".showMsg")[0];
            showMsg(showMsgElement, {color: "#888888", text: " ..."})
        }).blur(function (e) {
            let oldPass = e.target.value;
            let showMsgElement = $(".showMsg")[0];
            $.ajax({
                url: path + "/user/oldPass",
                data: {oldPass},
                success: function (data) {
                    if(data === "true") {
                        showMsg(showMsgElement, {color: "green", text: " 正确"});
                        flags[0] = true;
                    } else {
                        showMsg(showMsgElement, {color: "red", text: " 错误"});
                        flags[0] = false;
                    }
                }
            })
        })

        /*输入新密码*/
        $("#newPass").focus(function () {
            let showMsgElement = $(".showMsg")[1];
            showMsg(showMsgElement, {color: "#888888", text: " ...(请输入6~12位的数字或字母)"})
        }).blur(function (e) {
            let newPass = e.target.value;
            let showMsgElement = $(".showMsg")[1];
            let regex = /^[0-9a-zA-Z]{6,12}$/;
            if(regex.test(newPass)) {
                showMsg(showMsgElement, {color: "green", text: " 正确"});
                flags[1] = true;
            } else {
                showMsg(showMsgElement, {color: "red", text: " 错误"});
                flags[1] = false;
            }
        })

        /*输入确认密码*/
        $("#confirmPass").focus(function () {
            let showMsgElement = $(".showMsg")[2];
            showMsg(showMsgElement, {color: "#888888", text: " ...(请确认密码)"})
        }).blur(function (e) {
            let showMsgElement = $(".showMsg")[2];
            let confirmPass = e.target.value;
            let newPass =  document.getElementById("newPass").value;
            console.log(confirmPass)
            console.log(newPass)
            console.log(confirmPass === newPass)
            if(confirmPass === newPass) {
                showMsg(showMsgElement, {color: "green", text: " 正确"})
                flags[2] = true;
            } else {
                showMsg(showMsgElement, {color: "red", text: " 错误"})
                flags[2] = false;
            }
        })

        $("#save").on("click", function (e) {
            e.preventDefault();
            if(flags[0] && flags[1] && flags[2]) {
                document.forms[0].submit();
            }
        })
    });
</script>

</body>
</html>
