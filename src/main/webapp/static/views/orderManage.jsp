<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/1/17 0017
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>销售订单数据</title>

    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../staticRes/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <!--图标库-->
    <link href="../staticRes/fontawesome_5.15.4/css/fontawesome.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/brands.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/solid.css" rel="stylesheet">

    <link href="../staticRes/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="../staticRes/css/animate.css" rel="stylesheet">
    <link href="../staticRes/css/style.css?v=2.2.0" rel="stylesheet">

</head>
<body>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">

                    <div class="dropdown profile-element">
                        <span>
                            <img alt="image" class="img-circle" src="http://localhost:8080${message.head}"/>
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.jsp#">
                                <span class="clear">
                                    <span class="block m-t-xs"> <strong class="font-bold">${message.name}</strong>
                                    </span>
                                    <span class="text-muted text-xs block">${message.level} <b class="caret"></b>
                                    </span>
                                </span>
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
                    <a href="index.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">数据管理</span>
                        <span class="fa arrow"></span></a>
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
                    <a href=""><i class="fas fa-address-card"></i> <span class="nav-label">个人信息</span>
                        <span class="fa arrow"></span></a>
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
<%--                <li>--%>
<%--                    <a href=""><i class="fa fa-comments"></i> <span class="nav-label">即时通讯</span><span class="label label-danger pull-right">New</span></a>--%>
<%--                </li>--%>
            </ul>

        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
<%--                <div class="navbar-header">--%>
<%--                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="/UserInfo/IndexPage"><i class="fas fa-desktop"></i> </a>--%>
<%--                </div>--%>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="/UserInfo/IndexPage" title="返回首页">
                            <i class="fa fa-home"></i></a>${message.name} 欢迎使用
                        </span>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-sign-out"></i> 退出</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="wrapper wrapper-content">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-lg-12">
                        <table class="table table-hover margin bottom">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>订单号</th>
                                <th class="text-center">订单详情</th>
                                <th class="text-center">客户</th>
                                <th class="text-center">商铺</th>
                                <th class="text-center">交易金额</th>
                                <th class="text-center">交易时间</th>
                                <th class="text-center">修改人</th>
                                <th class="text-center">修改时间</th>
                                <th class="text-center">交易状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="orderlists" items="${order_message.AllOrderList}">
                                <tr>
                                    <td class="text-center">${orderlists.mId}</td>
                                    <td>${orderlists.mOrderNumber}</td>
                                    <td>${orderlists.mContent}</td>
                                    <td>${orderlists.mOrder}</td>
                                    <td>${orderlists.mShopper}</td>
                                    <td class="text-center"><span class="label label-primary">&yen;${orderlists.mTradingPrice}</span></td>
                                    <td class="text-center small">${orderlists.mCreateTime}</td>
                                    <td>${orderlists.mEditor}</td>
                                    <td>${orderlists.mEditTime}</td>
                                    <td class="text-center">${orderlists.mTradingType}</td>
                                </tr>
                            </c:forEach>

<%--                            <tr>--%>
<%--                                <td class="text-center">1</td>--%>
<%--                                <td>22cc4b1e20240114152033</td>--%>
<%--                                <td>黄焖鸡一份，加辣</td>--%>
<%--                                <td>用户123</td>--%>
<%--                                <td>有一家店铺</td>--%>
<%--                                <td class="text-center"><span class="label label-primary">&yen;35</span></td>--%>
<%--                                <td class="text-center small">2024-01-14 15:20:33</td>--%>
<%--                                <td></td>--%>
<%--                                <td></td>--%>
<%--                                <td class="text-center">1</td>--%>
<%--                            </tr>--%>
                            </tbody>
                        </table>
                    </div>
<%--                    <a>${order_message.AllOrderList}</a>--%>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="../staticRes/js/jquery-2.1.1.min.js"></script>
<script src="../staticRes/js/bootstrap.min.js?v=3.4.0"></script>
<script src="../staticRes/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../staticRes/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Flot -->
<script src="../staticRes/js/plugins/flot/jquery.flot.js"></script>
<script src="../staticRes/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../staticRes/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../staticRes/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../staticRes/js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../staticRes/js/plugins/flot/jquery.flot.symbol.js"></script>
<!-- Peity -->
<script src="../staticRes/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../staticRes/js/demo/peity-demo.js"></script>
<!-- Custom and plugin javascript -->
<script src="../staticRes/js/hplus.js?v=2.2.0"></script>
<script src="../staticRes/js/plugins/pace/pace.min.js"></script>
<!-- jQuery UI -->
<script src="../staticRes/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Jvectormap -->
<script src="../staticRes/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../staticRes/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- EayPIE -->
<script src="../staticRes/js/plugins/easypiechart/jquery.easypiechart.js"></script>
<!-- Sparkline -->
<script src="../staticRes/js/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- Sparkline demo data  -->
<script src="../staticRes/js/demo/sparkline-demo.js"></script>

</body>

</html>
