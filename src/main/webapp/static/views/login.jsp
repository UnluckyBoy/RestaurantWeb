<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/1/19 0019
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>阿婆私房菜后台管理- 登录</title>
    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../staticRes/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="../staticRes/css/animate.css" rel="stylesheet">
    <link href="../staticRes/css/style.css?v=2.2.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name"></h1>
        </div>
        <h3>欢迎使用</h3>
        <form class="m-t" role="form" action="/UserInfo/login" method="post">
            <div class="form-group">
                <label for="account"></label>
                <input id="account" name="account" type="text" class="form-control" placeholder="账户" required="">
            </div>
            <div class="form-group">
                <label for="password"></label>
                <input id="password" name="password" type="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            <p class="text-muted text-center">
                <a href=""><small>忘记密码了？</small></a> | <a href="/UserInfo/registerPage">注册一个新账号</a>
            </p>
        </form>
    </div>
</div>
<!-- Mainly scripts -->
<script src="../staticRes/js/jquery-2.1.1.min.js"></script>
<script src="../staticRes/js/bootstrap.min.js?v=3.4.0"></script>
</body>

</html>
