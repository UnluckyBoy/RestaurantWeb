<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/1/14 0014
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>私房菜后台管理</title>
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

                    <div class="dropdown profile-element">
                        <span>
<%--                            <img alt="image" class="img-circle" src="../img/profile_small.jpg" />--%>
                            <img alt="image" class="img-circle" src="http://localhost:8080${message.head}"/>
<%--                            <img alt="image" class="img-circle" src="http://localhost:8080"<%=session.getAttribute("head")%>/>--%>
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.jsp#">
                                <span class="clear">
                                    <span class="block m-t-xs">
                                        <strong class="font-bold"> ${message.name} </strong>
                                    </span>
                                    <span class="text-muted text-xs block"> ${message.level}
                                        <b class="caret"></b>
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
                        私房菜后台管理
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
                    <a href="index.jsp#"><i class="fa fa-desktop"></i> <span class="nav-label">页面</span></a>
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
                        <span class="m-r-sm text-muted welcome-message">
                            <a href="/UserInfo/IndexPage" title="返回首页">
                                <i class="fa fa-home"></i></a> ${message.name} 欢迎使用
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
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-success pull-right">全年</span>
                            <h5>总收入</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">&yen; ${order_message.TradingPrice}</h1>
<%--                            <div class="stat-percent font-bold text-success">100%<i class="fa fa-bolt"></i>--%>
<%--                            </div>--%>
<%--                            <small>测试</small>--%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right">全年</span>
                            <h5>用户数</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">${order_message.UserCount}</h1>
<%--                            <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>--%>
<%--                            </div>--%>
<%--                            <small>新访客</small>--%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-danger pull-right">当前时段</span>
                            <h5>在线用户</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">${order_message.OnlineCount}</h1>
<%--                            <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>--%>
<%--                            </div>--%>
<%--                            <small>12月</small>--%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-info pull-right">全年</span>
                            <h5>总订单</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">${order_message.AllOrderCount}</h1>
                            <div class="stat-percent font-bold text-info">${order_message.Valid}<i class="fa fa-level-up"></i>
                            </div>
                            <small>有效订单</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>订单</h5>
                            <div class="pull-right">
                                <div class="btn-group">
<%--                                    <button type="button" class="btn btn-xs btn-white active">天</button>--%>
<%--                                    <button type="button" class="btn btn-xs btn-white">月</button>--%>
<%--                                    <button type="button" class="btn btn-xs btn-white">年</button>--%>
                                </div>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <!--柱形图-->
                                <div class="col-lg-9">
                                    <div class="flot-chart">
                                        <div class="flot-chart-content" id="flot-dashboard-chart"></div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <ul class="stat-list">
                                        <li>
                                            <h2 class="no-margins">${order_message.AllOrderCount}</h2>
                                            <small>订单总数</small>
<%--                                            <div class="stat-percent">48% <i class="fa fa-level-up text-navy"></i>--%>
<%--                                            </div>--%>
                                            <div class="progress progress-mini">
                                                <div style="width: 100%;" class="progress-bar"></div>
                                            </div>
                                        </li>
                                        <li>
                                            <h2 class="no-margins ">${order_message.NearMonthCount}</h2>
                                            <small>最近一个月订单</small>
                                            <div class="stat-percent">${order_message.NearMonthValid}<i class="fa fa-level-down text-navy"></i>
                                            </div>
                                            <div class="progress progress-mini">
                                                <div style="width: ${order_message.NearMonthValid};" class="progress-bar"></div>
                                            </div>
                                        </li>
                                        <li>
                                            <h2 class="no-margins ">&yen; ${order_message.NearMonthTradingPrice}</h2>
                                            <small>最近一个月销售额</small>
                                            <div class="stat-percent">${order_message.NearPriceValid}<i class="fa fa-bolt text-navy"></i>
                                            </div>
                                            <div class="progress progress-mini">
                                                <div style="width: ${order_message.NearPriceValid};" class="progress-bar"></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>交易详情</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <table class="table table-hover margin bottom">
                                            <thead>
                                            <tr>
                                                <th style="width: 1%" class="text-center">序号</th>
                                                <th>商品</th>
                                                <th class="text-center">类别</th>
                                                <th class="text-center">销售额</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="orderlist" items="${order_message.AllTradingList}">
                                                <tr>
                                                    <td class="text-center">${orderlist.id}</td>
                                                    <td>${orderlist.pName}</td>
                                                    <td class="text-center small">${orderlist.pType}</td>
                                                    <td class="text-center"><span class="label label-primary">&yen;${orderlist.mTradingPrice}</span></td>
                                                </tr>
                                            </c:forEach>
                                            <%--                                            <tr>--%>
<%--                                                <td class="text-center">1</td>--%>
<%--                                                <td>防盗门</td>--%>
<%--                                                <td class="text-center small">2014.9.15</td>--%>
<%--                                                <td class="text-center"><span class="label label-primary">&yen;483.00</span>--%>
<%--                                                </td>--%>

<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="text-center">2</td>--%>
<%--                                                <td>衣柜</td>--%>
<%--                                                <td class="text-center small">2014.9.15</td>--%>
<%--                                                <td class="text-center">--%>
<%--                                                    <span class="label label-primary">&yen;327.00</span>--%>
<%--                                                </td>--%>

<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="text-center">3</td>--%>
<%--                                                <td>防盗门</td>--%>
<%--                                                <td class="text-center small">2014.9.15</td>--%>
<%--                                                <td class="text-center"><span class="label label-warning">&yen;125.00</span>--%>
<%--                                                </td>--%>

<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="text-center">4</td>--%>
<%--                                                <td>橱柜</td>--%>
<%--                                                <td class="text-center small">2014.9.15</td>--%>
<%--                                                <td class="text-center"><span class="label label-primary">&yen;344.00</span>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="text-center">5</td>--%>
<%--                                                <td>手机</td>--%>
<%--                                                <td class="text-center small">2014.9.15</td>--%>
<%--                                                <td class="text-center"><span class="label label-primary">&yen;235.00</span>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="text-center">6</td>--%>
<%--                                                <td>显示器</td>--%>
<%--                                                <td class="text-center small">2014.9.15</td>--%>
<%--                                                <td class="text-center"><span class="label label-primary">&yen;100.00</span>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
                                            </tbody>
                                        </table>
                                    </div>
<%--                                    <div class="col-lg-6">--%>
<%--                                        <div id="world-map" style="height: 300px;"></div>--%>
<%--                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="../js/jquery-2.1.1.min.js"></script>
<script src="../js/bootstrap.min.js?v=3.4.0"></script>
<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="../js/hplus.js?v=2.2.0"></script>
<script src="../js/plugins/pace/pace.min.js"></script>

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

<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

<script>
    $(document).ready(function () {
        $('.chart').easyPieChart({
            barColor: '#f8ac59',
            //                scaleColor: false,
            scaleLength: 5,
            lineWidth: 4,
            size: 80
        });

        $('.chart2').easyPieChart({
            barColor: '#1c84c6',
            //                scaleColor: false,
            scaleLength: 5,
            lineWidth: 4,
            size: 80
        });

        // var data2 = [
        //     [gd(2012, 1, 1), 0], [gd(2012, 1, 2), 6], [gd(2012, 1, 3), 4], [gd(2012, 1, 4), 8],
        //     [gd(2012, 1, 5), 9], [gd(2012, 1, 6), 7], [gd(2012, 1, 7), 5], [gd(2012, 1, 8), 4],
        //     [gd(2012, 1, 9), 7], [gd(2012, 1, 10), 8], [gd(2012, 1, 11), 9], [gd(2012, 1, 12), 6],
        //     [gd(2012, 1, 13), 0], [gd(2012, 1, 14), 5], [gd(2012, 1, 15), 11], [gd(2012, 1, 16), 8],
        //     [gd(2012, 1, 17), 8], [gd(2012, 1, 18), 11], [gd(2012, 1, 19), 11], [gd(2012, 1, 20), 6],
        //     [gd(2012, 1, 21), 6], [gd(2012, 1, 22), 8], [gd(2012, 1, 23), 11], [gd(2012, 1, 24), 13],
        //     [gd(2012, 1, 25), 7], [gd(2012, 1, 26), 9], [gd(2012, 1, 27), 9], [gd(2012, 1, 28), 8],
        //     [gd(2012, 1, 29), 5], [gd(2012, 1, 30), 8], [gd(2012, 1, 31), 25]
        // ];
        // var data3 = [
        //     [gd(2012, 1, 1), 800], [gd(2012, 1, 2), 500], [gd(2012, 1, 3), 600], [gd(2012, 1, 4), 700],
        //     [gd(2012, 1, 5), 500], [gd(2012, 1, 6), 456], [gd(2012, 1, 7), 800], [gd(2012, 1, 8), 589],
        //     [gd(2012, 1, 9), 467], [gd(2012, 1, 10), 876], [gd(2012, 1, 11), 689], [gd(2012, 1, 12), 700],
        //     [gd(2012, 1, 13), 500], [gd(2012, 1, 14), 600], [gd(2012, 1, 15), 700], [gd(2012, 1, 16), 786],
        //     [gd(2012, 1, 17), 345], [gd(2012, 1, 18), 888], [gd(2012, 1, 19), 888], [gd(2012, 1, 20), 888],
        //     [gd(2012, 1, 21), 987], [gd(2012, 1, 22), 444], [gd(2012, 1, 23), 999], [gd(2012, 1, 24), 567],
        //     [gd(2012, 1, 25), 786], [gd(2012, 1, 26), 666], [gd(2012, 1, 27), 888], [gd(2012, 1, 28), 900],
        //     [gd(2012, 1, 29), 178], [gd(2012, 1, 30), 555], [gd(2012, 1, 31), 993]
        // ];
        var data2=${order_message.NearMonValidTrading};//有效订单
        var data3=${order_message.NearMonAllTrading};//全部订单

        var dataset = [
            {
                label: "订单数",
                data: data3,
                color: "#1ab394",
                bars: {
                    show: true,
                    align: "center",
                    barWidth: 24 * 60 * 60 * 600,
                    lineWidth: 0
                }

            }, {
                label: "付款数",
                data: data2,
                yaxis: 2,
                color: "#464f88",
                lines: {
                    lineWidth: 1,
                    show: true,
                    fill: true,
                    fillColor: {
                        colors: [{
                            opacity: 0.2
                        }, {
                            opacity: 0.2
                        }]
                    }
                },
                splines: {
                    show: false,
                    tension: 0.6,
                    lineWidth: 1,
                    fill: 0.1
                },
            }
        ];

        var options = {
            xaxis: {
                mode: "time",
                tickSize: [3, "day"],
                tickLength: 0,
                axisLabel: "Date",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Arial',
                axisLabelPadding: 10,
                color: "#838383"
            },
            yaxes: [{
                position: "left",
                max: 1070,
                color: "#838383",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Arial',
                axisLabelPadding: 3
            }, {
                position: "right",
                clolor: "#838383",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: ' Arial',
                axisLabelPadding: 67
            }
            ],
            legend: {
                noColumns: 1,
                labelBoxBorderColor: "#000000",
                position: "nw"
            },
            grid: {
                hoverable: false,
                borderWidth: 0,
                color: '#838383'
            }
        };

        function gd(year, month, day) {
            return new Date(year, month - 1, day).getTime();
        }
        var previousPoint = null,previousLabel = null;
        $.plot($("#flot-dashboard-chart"), dataset, options);

        // var mapData = {
        //     "US": 298,
        //     "SA": 200,
        //     "DE": 220,
        //     "FR": 540,
        //     "CN": 120,
        //     "AU": 760,
        //     "BR": 550,
        //     "IN": 200,
        //     "GB": 120,
        // };
        //
        // $('#world-map').vectorMap({
        //     map: 'world_mill_en',
        //     backgroundColor: "transparent",
        //     regionStyle: {
        //         initial: {
        //             fill: '#e4e4e4',
        //             "fill-opacity": 0.9,
        //             stroke: 'none',
        //             "stroke-width": 0,
        //             "stroke-opacity": 0
        //         }
        //     },
        //
        //     series: {
        //         regions: [{
        //             values: mapData,
        //             scale: ["#1ab394", "#22d6b1"],
        //             normalizeFunction: 'polynomial'
        //         }]
        //     },
        // });
    });
</script>

</body>

</html>
