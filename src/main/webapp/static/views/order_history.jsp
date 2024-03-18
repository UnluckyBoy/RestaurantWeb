<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/3/18 0018
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>私房菜后台管理-购物车</title>
    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="../staticRes/css/matrix.css" rel="stylesheet">
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
                            <img id="user_head" alt="image" class="img-circle" src="http://localhost:8080${message.head}" onclick="upUserHead()"/>
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
                            <li><a href="/Restaurant/userinfoPage">个人信息</a></li>
                            <li><a href="#" id="mailboxLink">信箱</a></li>
                            <li class="divider"></li>
                            <li><a href="/Restaurant/logout">安全退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        私房菜平台
                    </div>
                </li>
                <li>
                    <a href="/Restaurant/IndexSimplePage">
                        <i class="fa fa-th-large"></i>
                        <span class="nav-label">商品列表</span>
                    </a>
                </li>
                <li class="active">
                    <a href="">
                        <i class="fas fa-address-card"></i>
                        <span class="nav-label">个人管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a href="/Restaurant/shopping_cartPage">购物车</a></li>
                        <li><a href="/Restaurant/order_historyPage">购买记录</a></li>
                        <li><a href="/Restaurant/infoSimplePage">个人信息</a></li>
                        <li><a href="/Restaurant/helpCenterSimplePage">帮助中心</a>
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
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="/Restaurant/IndexSimplePage" title="返回首页">
                            <i class="fa fa-home"></i></a> <strong class="font-bold label-warning-light" >${message.name}</strong> | 欢迎使用
                        </span>
                    </li>
                    <li>
                        <a href="/Restaurant/logout"><i class="fas fa-sign-out-alt"></i>退出</a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row animated fadeInRight">
                        <div class="col-lg-12">
                            <table class="table table-hover margin bottom">
                                <thead>
                                <tr>
                                    <th class="text-center small">订单</th>
                                    <th class="text-center small">详情</th>
                                    <th class="text-center small">商家</th>
                                    <th class="text-center small">价格</th>
                                    <th class="text-center small">备注</th>
                                </tr>
                                </thead>
                                <tbody id="shopping_cart-table-body">
                                <!--自定义渲染-->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="text-center"><!--按钮-->
            <p>
                <strong id="currentPage"></strong><strong id="allPage"></strong>
            </p>
            <button type="button" class="btn btn-primary" onclick="previousPage()">上一页</button>
            <button type="button" class="btn btn-primary" onclick="nextPage()">下一页</button>
        </div>

        <!--图片修改弹窗-->
        <die class="modal inmodal" id="userHeadEditModal" tabindex="-1" role="dialog"  aria-hidden="true">
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
        </die>
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
<script>
    let global_data;

    $(document).ready(function() {
        //信箱按钮弹窗
        document.getElementById('mailboxLink').addEventListener('click', function (event) {
            // 阻止链接的默认行为（即刷新页面）
            event.preventDefault();
            // 弹出弹窗
            alert('功能尚未实装！敬请期待！');
        });

        freshOrderHistory('/Restaurant/order_history',1,'${message.account}');

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

    /*获取购物车数据*/
    function freshOrderHistory(url,newPageNum,order){
        $.ajax({
            url:url,
            type: 'GET',
            data: {
                pageNum: newPageNum,
                order: order
            },
            dataType: 'json',
            success: function(data) {
                global_data=data;
                console.log("订单记录数据:"+data.list[0]);
                var tbody = $('#shopping_cart-table-body');
                if(data && data.list){
                    tbody.empty();
                    $.each(data.list, function(index, order) {
                        var row = $('<tr class="shopping_cart-table-column"></tr>');
                        row.append($('<td class="text-center small">' + order.mOrderNumber + '</td>'));
                        row.append($('<td class="text-center small">' + order.mContent + '</td>'));
                        row.append($('<td class="text-center small">' + order.mShopper + '</td>'));
                        row.append($('<td class="text-center small"><span class="label label-primary">&yen;' + order.mTradingPrice + '</span></td>'));
                        if(isMoreThanThreeDays(order.mCreateTime)||order.mTradingType==0){
                            // 创建修改按钮并添加事件处理函数
                            var btnCancel = $('<button type="button" class="btn-cancel btn btn-sm btn-disable" disabled>撤销</button>');
                        }else{
                            var btnCancel = $('<button type="button" class="btn-cancel btn btn-sm btn-success">撤销</button>');
                        }
                        //撤销
                        btnCancel.click(function() {
                            //alert('订单 ' + order.mOrderNumber + '已被撤销');
                            var order_data = {
                                mId: order.mId,
                                mOrderNumber: order.mOrderNumber,
                                mContent: order.mContent,
                                mOrder: order.mOrder,
                                mShopper: order.mShopper,
                                mTradingPrice: order.mTradingPrice,
                                mCreateTime: order.mCreateTime,
                                mEditor: '${message.account}',
                                mEditTime:getCurrentDateTime(),
                                mTradingType: 0
                            };
                            $.ajax({
                                url: '/Restaurant/update_order',
                                type: 'POST',
                                contentType: 'application/json',
                                data: JSON.stringify(order_data),
                                success: function(response) {
                                    console.log('数据成功发送到后端',response);
                                    // 在这里处理后端的响应
                                    if(response=="success"){
                                        alert('订单 ' + order.mOrderNumber + '已被撤销');
                                        location.reload(true);
                                    }
                                },
                                error: function(error) {
                                    console.error('发送数据到后端时出错', error);
                                }
                            });
                        });
                        row.append($('<td class="text-center small"></td>').append(btnCancel));

                        tbody.append(row);
                    });
                    //显示页码
                    $("#currentPage").text(data.pageNum);
                    $("#allPage").text("/"+data.pages);
                }
            },
            error: function(xhr, status, error) {
                console.error("获取数据失败: " + error);
            }
        });
    }

    function previousPage() {
        if (global_data.pageNum>1) {//hasPreviousPage
            var newPageNum = global_data.prePage;
            console.log('切换到上一页，页码：' + newPageNum);
            freshOrderHistory('/Restaurant/order_history',newPageNum,'${message.account}');
        } else {
            console.log('已经是第一页了');
            alert("已经是第一页!");
        }
    }
    function nextPage() {
        if (global_data.hasNextPage) {
            var newPageNum = global_data.nextPage;
            console.log('切换到下一页，页码：' + newPageNum);
            freshOrderHistory('/Restaurant/order_history',newPageNum,'${message.account}');
        } else {
            console.log('已经是最后一页了');
            alert("已经是最后一页!");
        }
    }

    /**
     * 获取当前时间
     * @returns {string}
     */
    function getCurrentDateTime() {
        var currentDate = new Date();
        // 获取年、月、日、小时、分钟、秒
        var year = currentDate.getFullYear();
        var month = addZero(currentDate.getMonth() + 1);  // 月份从0开始，需要加1
        var day = addZero(currentDate.getDate());
        var hours = addZero(currentDate.getHours());
        var minutes = addZero(currentDate.getMinutes());
        var seconds = addZero(currentDate.getSeconds());
        // 格式化为：yyyy-MM-dd HH:mm:ss
        var formattedDateTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
        return formattedDateTime;
    }
    // 补零函数，用于确保单个数字在前面加0
    function addZero(number) {
        return number < 10 ? '0' + number : number;
    }

    /**
     * 计算timeString1距离当前时间是否超过3天
     * @param timeString1
     * @param timeString2
     * @returns {boolean}
     */
    function isMoreThanThreeDays(timeString1) {
        // 创建两个Date对象
        const date1 = new Date(timeString1);
        const date2 = new Date(getCurrentDateTime());
        // 确保两个日期都是有效的
        if (isNaN(date1.getTime()) || isNaN(date2.getTime())) {
            throw new Error('Invalid date strings');
        }
        // 计算两个日期之间的毫秒差
        const diff = Math.abs(date2 - date1);
        // 将毫秒转换为天
        const diffDays = Math.ceil(diff / (1000 * 60 * 60 * 24));
        // 检查是否超过3天
        return diffDays > 3;
    }
</script>
</body>
</html>
