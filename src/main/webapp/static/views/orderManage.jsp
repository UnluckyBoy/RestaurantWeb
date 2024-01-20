<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/1/17 0017
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>销售订单数据</title>

    <link href="../css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <!-- Morris -->
    <link href="../css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="../js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css?v=2.2.0" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">

                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="../img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.jsp#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Beaut-zihan</strong>
                             </span> <span class="text-muted text-xs block">超级管理员 <b class="caret"></b></span> </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="">修改头像</a>
                            </li>
                            <li><a href="">个人资料</a>
                            </li>
                            <li><a href="">联系我们</a>
                            </li>
                            <li><a href="">信箱</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        H+
                    </div>

                </li>
                <li class="active">
                    <a href="index.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">数据管理</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="">订单数据<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="/UserInfo/OrderManagerPage">查看所有</a>
                                </li>
                                <li>
                                    <a href="">修改</a>
                                </li>
                            </ul>
                        </li>
                        <li><a href="">菜单管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="">查询</a>
                                </li>
                                <li>
                                    <a href="">新增</a>
                                </li>
                                <li>
                                    <a href="">修改</a>
                                </li>
                                <li>
                                    <a href="">删除</a>
                                </li>
                            </ul>
                        </li>
                        <li><a href="">公共信息<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="">查询</a>
                                </li>
                                <li>
                                    <a href="">新增</a>
                                </li>
                                <li>
                                    <a href="">修改</a>
                                </li>
                                <li>
                                    <a href="">删除</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="fa fa-desktop"></i> <span class="nav-label">页面</span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="">联系人</a>
                        </li>
                        <li><a href="">个人资料</a>
                        </li>
                        <li><a href="">帮助中心</a>
                        </li>
                        <li><a href="">时间轴</a>
                        </li>
                        <li><a href="">登录</a>
                        </li>
                        <li><a href="">注册</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="fa fa-sitemap"></i> <span class="nav-label">菜单 </span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="index.html#">三级菜单 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="index.jsp#">三级菜单 01</a>
                                </li>
                                <li>
                                    <a href="index.jsp#">三级菜单 01</a>
                                </li>
                                <li>
                                    <a href="index.jsp#">三级菜单 01</a>
                                </li>

                            </ul>
                        </li>
                        <li><a href="index.jsp#">二级菜单</a>
                        </li>
                        <li>
                            <a href="index.jsp#">二级菜单</a>
                        </li>
                        <li>
                            <a href="index.jsp#">二级菜单</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="fa fa-comments"></i> <span class="nav-label">即时通讯</span><span class="label label-danger pull-right">New</span></a>
                </li>
            </ul>

        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="index.html#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="/UserInfo/IndexPage" title="返回首页">
                            <i class="fa fa-home"></i></a>欢迎使用
                        </span>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="../js/jquery-2.1.1.min.js"></script>
<script src="../js/bootstrap.min.js?v=3.4.0"></script>
<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../js/plugins/flot/jquery.flot.js"></script>
<script src="../js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../js/plugins/flot/jquery.flot.symbol.js"></script>

<!-- Peity -->
<script src="../js/plugins/peity/jquery.peity.min.js"></script>
<script src="../js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="../js/hplus.js?v=2.2.0"></script>
<script src="../js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="../js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- Jvectormap -->
<script src="../js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- EayPIE -->
<script src="../js/plugins/easypiechart/jquery.easypiechart.js"></script>

<!-- Sparkline -->
<script src="../js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="../js/demo/sparkline-demo.js"></script>

</body>

</html>
