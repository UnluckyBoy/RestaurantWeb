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

    <title>私房菜后台管理- 登录</title>
    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../staticRes/css/matrix.css" rel="stylesheet">
    <!--图标库-->
    <link href="../staticRes/fontawesome_5.15.4/css/fontawesome.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/brands.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/solid.css" rel="stylesheet">
    <link href="../staticRes/css/animate.css" rel="stylesheet">
    <link href="../staticRes/css/style.css?v=2.2.0" rel="stylesheet">
</head>

<%--<body class="gray-bg">--%>
<body class="matrix-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">
                <span><img src="http://localhost:8080/staticRes/img/icon.png" alt="Logo" class="logo-image"></span>
            </h1>
        </div>
        <h2 style="font-weight: bold; color: white;">基于JAVA Web的阿婆私房菜管理平台的设计与开发</h2>
        <h3 style="font-weight: bold; color: white;">欢迎使用</h3>
        <form class="m-t" role="form" action="/Restaurant/login" method="post">
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
                <a href=""><small style="color: blue;">忘记密码了？</small></a> | <a href="/Restaurant/registerPage"><small style="color: yellowgreen;">注册新账号</small></a>
            </p>
        </form>
    </div>
</div>
<!-- Mainly scripts -->
<script src="../staticRes/js/jquery-2.1.1.min.js"></script>
<script src="../staticRes/js/bootstrap.min.js?v=3.4.0"></script>
</body>

</html>
