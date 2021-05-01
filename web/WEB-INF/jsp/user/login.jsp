<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>登录系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/login.css">
</head>
<body>
<div class="wrap">
    <div class="loginBox">
        <div class="title">超市订单管理系统</div>
        <form action="${pageContext.request.contextPath}/user/login" method="post">
            <label for="uname" class="username">
                <img src="${pageContext.request.contextPath}/static/images/unameIcon.png" alt="">
                <input autofocus type="text" name="username" id="uname" placeholder="默认账号 admin" autocomplete="off">
            </label>
            <label for="pwd" class="password">
                <img src="${pageContext.request.contextPath}/static/images/pwdIcon.png" alt="">
                <input type="password" name="password" id="pwd" placeholder="默认密码 1234567">
            </label>
            <span>
                <input type="submit" value="登录">
                <input type="reset" value="重置">
            </span>
        </form>
    </div>
</div>
</body>
</html>
