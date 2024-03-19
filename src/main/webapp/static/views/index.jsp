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

    <title>私房菜后台管理-主页</title>
    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <!--图标库-->
    <link href="../staticRes/fontawesome_5.15.4/css/fontawesome.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/brands.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/solid.css" rel="stylesheet">
    <!-- Gritter -->
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
<%--                            <img alt="image" class="img-circle" src="../img/profile_small.jpg" />--%>
                            <!--data-toggle="modal" data-target="#confirm_Modal",onclick="upUserHead()-->
                            <img id="user_head" alt="image" class="img-circle" src="http://localhost:8080${message.head}" onclick="upUserHead()"/>
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
<%--                            <li><a href="">修改头像</a></li>--%>
                            <li><a href="/Restaurant/userinfoPage">个人信息</a></li>
<%--                            <li><a href="">联系我们</a></li>--%>
                            <li><a href="#" id="mailboxLink">信箱</a></li>
                            <li class="divider"></li>
                            <li><a href="/Restaurant/logout">安全退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        私房菜后台管理
                    </div>

                </li>
                <li class="active">
                    <a href=""><i class="fa fa-th-large"></i> <span class="nav-label">数据管理</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/Restaurant/OrderManagerPage">订单数据</a></li>
                        <li><a href="/Restaurant/ProductPage">菜单管理</a></li>
                        <li><a href="/Restaurant/CommonMessagePage">公共信息</a></li>
                        <li><a href="/Restaurant/userManagePage">用户管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="fas fa-address-card"></i> <span class="nav-label">个人管理</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/Restaurant/userinfoPage">个人信息</a>
                        </li>
                        <li><a href="/Restaurant/helpCenterPage">帮助中心</a>
<%--                        </li>--%>
<%--                        <li><a href="">时间轴</a>--%>
<%--                        </li>--%>
                        <li><a href="/Restaurant/logout">退出</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
<%--                <div class="navbar-header">--%>
<%--                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="/Restaurant/IndexPage"><i class="fas fa-desktop"></i> </a>--%>
<%--                </div>--%>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">
                            <a href="/Restaurant/IndexPage" title="返回首页"><i class="fa fa-home"></i>
                            </a>
                            <strong class="font-bold label-warning-light">${message.name}</strong> | 欢迎使用
                        </span>
                    </li>
                    <li>
                        <a href="/Restaurant/logout"><i class="fas fa-sign-out-alt"></i>退出</a>
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
                            <h1 class="no-margins">&yen; ${index_message.TradingPrice}</h1>
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
                            <h1 class="no-margins">${index_message.UserCount}</h1>
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
                            <h1 class="no-margins">${index_message.OnlineCount}</h1>
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
                            <h1 class="no-margins">${index_message.AllOrderCount}</h1>
                            <div class="stat-percent font-bold text-info">${index_message.Valid}<i class="fa fa-level-up"></i>
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
                                            <h2 class="no-margins">${index_message.AllOrderCount}</h2>
                                            <small>订单总数</small>
<%--                                            <div class="stat-percent">48% <i class="fa fa-level-up text-navy"></i>--%>
<%--                                            </div>--%>
                                            <div class="progress progress-mini">
                                                <div style="width: 100%;" class="progress-bar"></div>
                                            </div>
                                        </li>
                                        <li>
                                            <h2 class="no-margins ">${index_message.NearMonthCount}</h2>
                                            <small>最近一个月订单</small>
                                            <div class="stat-percent">${index_message.NearMonthValid}<i class="fa fa-level-down text-navy"></i>
                                            </div>
                                            <div class="progress progress-mini">
                                                <div style="width: ${index_message.NearMonthValid};" class="progress-bar"></div>
                                            </div>
                                        </li>
                                        <li>
                                            <h2 class="no-margins ">&yen; ${index_message.NearMonthTradingPrice}</h2>
                                            <small>最近一个月销售额</small>
                                            <div class="stat-percent">${index_message.NearPriceValid}<i class="fa fa-bolt text-navy"></i>
                                            </div>
                                            <div class="progress progress-mini">
                                                <div style="width: ${index_message.NearPriceValid};" class="progress-bar"></div>
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
<%--                                <div class="ibox-tools">--%>
<%--                                    <a class="collapse-link">--%>
<%--                                        <i class="fa fa-chevron-up"></i>--%>
<%--                                    </a>--%>
<%--                                    <a class="close-link">--%>
<%--                                        <i class="fa fa-times"></i>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <table class="table table-hover margin bottom">
                                            <thead>
                                            <tr>
                                                <th class="text-center">序号</th>
                                                <th class="text-center">商品</th>
                                                <th class="text-center">类别</th>
                                                <th class="text-center">销售额</th>
                                            </tr>
                                            </thead>
                                            <tbody id="index_trading_table_body">
<%--                                            <c:forEach var="orderlist" items="${index_message.AllTradingList}">--%>
<%--                                                <tr>--%>
<%--                                                    <td>${orderlist.id}</td>--%>
<%--                                                    <td>${orderlist.pName}</td>--%>
<%--                                                    <td class="text-center small">${orderlist.pType}</td>--%>
<%--                                                    <td class="text-center"><span class="label label-primary">&yen;${orderlist.mTradingPrice}</span></td>--%>
<%--                                                </tr>--%>
<%--                                            </c:forEach>--%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="text-center"><!--按钮-->
                                    <p>
                                        <strong id="currentPage"></strong><strong id="allPage"></strong>
                                    </p>
                                    <button type="button" class="btn btn-primary" onclick="previousOrderPage()" id="lastBtn">上一页</button>
                                    <button type="button" class="btn btn-primary" onclick="nextOrderPage()">下一页</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--图片修改弹窗-->
        <div class="modal inmodal" id="userHeadEditModal" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <label class="modal-title label label-primary center-block">头像上传</label>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="file" id="user_head_file" name="" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="text-center">
                            <button type="button" class="btn btn-primary" id="updateHead" onclick="updateHead()">保存</button>
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
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
<!-- Custom and plugin javascript -->
<script src="../staticRes/js/hplus.js?v=2.2.0"></script>
<script src="../staticRes/js/plugins/pace/pace.min.js"></script>
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

<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

<script>
    $(document).ready(function () {
        let globalData;

        //信箱按钮弹窗
        document.getElementById('mailboxLink').addEventListener('click', function (event) {
            // 阻止链接的默认行为（即刷新页面）
            event.preventDefault();
            // 弹出弹窗
            alert('功能尚未实装！敬请期待！');
        });

        // 发送 AJAX 请求获取数据
        freshData('/Restaurant/freshTradingViewPage',1);

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
        var data2=${index_message.NearMonValidTrading};//有效订单
        var data3=${index_message.NearMonAllTrading};//全部订单
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
    });

    function upUserHead(){
        $("#userHeadEditModal").modal("show")
    }
    function updateHead(){
        var fileInput = $("#user_head_file")[0];
        var file = fileInput.files[0];
        var formData = new FormData();
        if (file) {
            formData.append("image", file);
            formData.append("account", '${message.account}');
            formData.append("name", '${message.name}');
            $.ajax({
                url: "/Restaurant/upload_user_head", //SpringBoot应用地址
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    alert("上传结果:" + data);
                    location.reload(true);
                },
                error: function(jqXHR, textStatus, errorMessage) {
                    alert("上传结果:" + errorMessage);
                }
            });
            $("#userHeadEditModal").modal("hide"); // 隐藏模态框
        } else {
            alert("请选择图片!");
        }
    }

    // 上一页按钮点击事件处理函数
    function previousOrderPage() {
        if (globalData.pageNum>1) {//hasPreviousPage
            var newPageNum = globalData.prePage; // 或 pageInfo.pageNum - 1;
            // 发送请求到服务器获取新页面的数据，并更新页面内容
            // 例如：updatePageContent(newPageNum);
            console.log('切换到上一页，页码：' + newPageNum);
            freshData('/Restaurant/freshTradingViewPage',newPageNum);
        } else {
            console.log('已经是第一页了');
            alert("已经是第一页!");
            //$("#lastBtn").disabled = true;
        }
    }
    // 下一页按钮点击事件处理函数
    function nextOrderPage() {
        if (globalData.hasNextPage) {
            var newPageNum = globalData.nextPage;
            console.log('切换到下一页，页码：' + newPageNum);
            freshData('/Restaurant/freshTradingViewPage',newPageNum);
        } else {
            console.log('已经是最后一页了');
            alert("已经是最后一页!");
        }
    }

    function freshData(url,newPageNum){
        // 发送 AJAX 请求获取数据
        $.ajax({
            url: url, // 替换为你的后端服务URL
            type: 'GET',
            data: { pageNum: newPageNum}, //将页码作为参数传递
            dataType: 'json',
            success: function (data) {
                globalData = data;//全局变量赋值
                var tbody = $('#index_trading_table_body'); // 获取 tbody 元素
                if (data && data.list) {
                    tbody.empty(); // 清空 tbody中的内容
                    // 遍历数据并创建表格行
                    $.each(data.list, function (index, order) {
                        var row = $('<tr class="index-trading-table-column"></tr>'); // 创建新的表格行
                        // 创建并添加单元格到行中
                        row.append($('<td class="text-center">' + order.id + '</td>'));
                        row.append($('<td class="text-center">' + order.pName + '</td>'));
                        row.append($('<td class="text-center">' + order.pType + '</td>'));
                        row.append($('<td class="text-center small"><span class="label label-primary">&yen;' + order.mTradingPrice + '</span></td>'));
                        // 将行添加到 tbody 中
                        tbody.append(row);
                    });
                    //显示页码
                    $("#currentPage").text(data.pageNum);
                    $("#allPage").text("/" + data.pages);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // 处理请求失败的情况
                console.error('AJAX 请求失败: ' + textStatus, errorThrown);
            }
        });
    }
</script>

</body>

</html>
