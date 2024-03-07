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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>私房菜后台管理-销售订单</title>

    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
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
<%--                            <li><a href="">修改头像</a></li>--%>
                            <li><a href="/Restaurant/userinfoPage">个人信息</a></li>
<%--                            <li><a href="">联系我们</a></li>--%>
                            <li><a href="#" id="mailboxLink">信箱</a></li>
                            <li class="divider"></li>
                            <li><a href="/Restaurant/logout">安全退出</a></li>
                        </ul>
                    </div>
                </li>
                <li class="active">
                    <a href="index.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">数据管理</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/Restaurant/OrderManagerPage">订单数据</a></li>
                        <li><a href="/Restaurant/ProductPage">菜单管理</a></li>
                        <li><a href="/Restaurant/CommonMessagePage">公共信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="fas fa-address-card"></i> <span class="nav-label">个人信息</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/Restaurant/userinfoPage">个人信息</a></li>
                        <li><a href="/Restaurant/helpCenterPage">帮助中心</a></li>
                        <li><a href="/Restaurant/logout">退出</a></li>
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
                        <span class="m-r-sm text-muted welcome-message"><a href="/Restaurant/IndexPage" title="返回首页">
                            <i class="fa fa-home"></i></a> <strong class="font-bold label-warning-light" >${message.name}</strong> | 欢迎使用
                        </span>
                    </li>
                    <li>
                        <a href="/Restaurant/logout"><i class="fas fa-sign-out-alt"></i>退出</a>
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
                                <th class="text-center">序号</th>
                                <th class="text-center">订单号</th>
                                <th class="text-center">订单详情</th>
                                <th>客户</th>
                                <th>商铺</th>
                                <th class="text-center">交易金额</th>
                                <th class="text-center">交易时间</th>
                                <th class="text-center">修改人</th>
                                <th class="text-center">修改时间</th>
                                <th class="text-center">交易状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="orderlists" items="${order_message.list}">
                                <tr class="order-table-column">
                                    <td class="text-center small">${orderlists.mId}</td>
                                    <td class="text-center small">${orderlists.mOrderNumber}</td>
                                    <td class="text-center small">${orderlists.mContent}</td>
                                    <td class="text-center small">${orderlists.mOrder}</td>
                                    <td class="text-center small">${orderlists.mShopper}</td>
                                    <td class="text-center small"><span class="label label-primary">&yen;${orderlists.mTradingPrice}</span></td>
                                    <td class="text-center small">${orderlists.mCreateTime}</td>
                                    <td class="text-center small">${orderlists.mEditor}</td>
                                    <td class="text-center small">${orderlists.mEditTime}</td>
                                    <td class="text-center small">${orderlists.mTradingType}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 弹窗的HTML结构 -->
                <div class="modal inmodal" id="editModal" tabindex="-1" role="dialog"  aria-hidden="true">
                    <div class="modal-dialog modal-lg"><!--modal-lg设置大窗口-->
                        <div class="modal-content animated fadeIn"><!--设置窗口动画模式-->
                            <div class="modal-header">
<%--                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
<%--                                <i class="fa fa-clock-o modal-icon"></i>--%>
                                <h4 class="modal-title label label-primary center-block">订单修改</h4>
                                <small class="label label-danger center-block">重要数据！请慎重!!!</small>
                            </div>
                            <div class="modal-body"><!--col-lg-12-->
                                <table class="table table-hover margin bottom" id="editTable"><!--border="1",显示表格边框,且边框宽度为1像素-->
                                    <thead>
                                    <tr>
                                        <th class="text-center small">序号</th>
                                        <th class="text-center small">订单号</th>
                                        <th class="text-center small">订单详情</th>
                                        <th class="text-center small">客户</th>
                                        <th class="text-center small">商铺</th>
                                        <th class="text-center small">交易金额</th>
                                        <th class="text-center small">交易时间</th>
                                        <th class="text-center small">修改人</th>
                                        <th class="text-center small">修改时间</th>
                                        <th class="text-center small">交易状态</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-center small" id="td_data1"></td>
                                        <td class="text-center small" id="td_data2"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data3"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data4"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data5"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data6"></td>
                                        <td class="text-center small" id="td_data7"></td>
                                        <td class="text-center small" id="td_data8"></td>
                                        <td class="text-center small" id="td_data9"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data10"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer"><!--text-center-modal-footer-->
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" onclick="saveEditedData()">保存</button>
                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center"><!--按钮-->
            <p><strong>${order_message.pageNum}/${order_message.pages}</strong></p>
            <button type="button" class="btn btn-primary" onclick="previousOrderPage()">上一页</button>
            <button type="button" class="btn btn-primary" onclick="nextOrderPage()">下一页</button>
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

<!--给数据表添加点击响应逻辑-->
<script>
    $(document).ready(function() {
        //信箱按钮弹窗
        document.getElementById('mailboxLink').addEventListener('click', function(event) {
            // 阻止链接的默认行为（即刷新页面）
            event.preventDefault();
            // 弹出弹窗
            alert('功能尚未实装！敬请期待！');
        });

        // 给每一行添加点击事件
        $(".order-table-column").on("click", function() {
            // 获取当前行的数据，以示例为准，这里获取第一列的文本内容
            var orderId = $(this).find("td:first").text();
            console.log("点击的行: "+ orderId+ "\t"+$(this).find("td:eq(1)").text()
                + "\t"+$(this).find("td:eq(2)").text()+ "\t"+$(this).find("td:eq(3)").text()
                + "\t"+$(this).find("td:eq(4)").text()+ "\t"+$(this).find("td:eq(5)").text()
                + "\t"+$(this).find("td:eq(6)").text()+ "\t"+$(this).find("td:eq(7)").text()
                + "\t"+$(this).find("td:eq(8)").text()+ "\t"+$(this).find("td:eq(9)").text());
            //var orderContent = $(this).find("td:eq(2)").text(); //以示例为准，获取第三列的内容
            //console.log("内容: " + orderContent);


            // // 在编辑弹窗中显示数据
             //$("#modal-body-content").val(orderContent);
            // var paragraph = document.getElementById("modal-body-content");
            // paragraph.innerHTML =orderContent;
            document.getElementById("td_data1").innerText = orderId;
            document.getElementById("td_data2").innerText = $(this).find("td:eq(1)").text();
            document.getElementById("td_data3").innerText = $(this).find("td:eq(2)").text();
            document.getElementById("td_data4").innerText = $(this).find("td:eq(3)").text();
            document.getElementById("td_data5").innerText = $(this).find("td:eq(4)").text();
            document.getElementById("td_data6").innerText = $(this).find("td:eq(5)").text().slice(1);
            document.getElementById("td_data7").innerText = $(this).find("td:eq(6)").text();
            document.getElementById("td_data8").innerText = $(this).find("td:eq(7)").text();
            document.getElementById("td_data9").innerText = $(this).find("td:eq(8)").text();
            document.getElementById("td_data10").innerText = $(this).find("td:eq(9)").text();
            // // 弹出编辑弹窗
            // $("#editModal").css("display", "block");
            $("#editModal").modal("show"); // 显示模态框(使用Bootstrap库显示)
            //$("#editModal").modal("hide"); // 隐藏模态框
        });
    });
    // 点击保存按钮时的操作
    function saveEditedData() {
        // 获取编辑后的数据
        var table=$("#editTable");
        var result_data1 = table.find("td:eq(0)").text();
        var result_data2 = table.find("td:eq(1)").text();
        var result_data3 = table.find("td:eq(2)").text();
        var result_data4 = table.find("td:eq(3)").text();
        var result_data5 = table.find("td:eq(4)").text();
        var result_data6 = table.find("td:eq(5)").text();
        var result_data7 = table.find("td:eq(6)").text();
        var result_data8 = '${message.name}';//修改人
        var result_data9 = getCurrentDateTime();//修改时间
        var result_data10 = table.find("td:eq(9)").text();
        // 在这里可以执行保存操作，例如更新数据或者发送到后端
        var result="{mId="+ result_data1+",mOrderNumber="+ result_data2+",mContent="+ result_data3
            +",mOrder=" + result_data4+",mShopper=" + result_data5+",mTradingPrice="+ result_data6
            +",mCreateTime="+ result_data7+",mEditor="+ result_data8+",mEditTime=" + result_data9
            +",mTradingType="+ result_data10+"}";
        console.log("编辑后的数据: " +result);

        // 封装要发送的数据
        var order_data = {
            mId: result_data1,
            mOrderNumber: result_data2,
            mContent: result_data3,
            mOrder: result_data4,
            mShopper: result_data5,
            mTradingPrice: result_data6,
            mCreateTime: result_data7,
            mEditor: result_data8,
            mEditTime: result_data9,
            mTradingType: result_data10
        };
        // 发送数据到后端
        $.ajax({
            url: '/Restaurant/update_order',  // 替换为实际的 Spring Boot 后端端点
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(order_data),
            success: function(response) {
                console.log('数据成功发送到后端',response);
                // 在这里处理后端的响应
                if(response=="success"){
                    location.reload();
                }
            },
            error: function(error) {
                console.error('发送数据到后端时出错', error);
            }
        });

        // 隐藏编辑弹窗
        //$("#editModal").css("display", "none");
        $("#editModal").modal("hide"); // 隐藏模态框
    }

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
                    location.reload();
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
    // 上一页按钮点击事件处理函数
    function previousOrderPage() {
        if (${order_message.hasPreviousPage}) {//hasPreviousPage
            var newPageNum = ${order_message.prePage}; // 或 pageInfo.pageNum - 1;
            // 发送请求到服务器获取新页面的数据，并更新页面内容
            // 例如：updatePageContent(newPageNum);
            console.log('切换到上一页，页码：' + newPageNum);
        } else {
            console.log('已经是第一页了');
            alert("已经是第一页!");
        }
    }
    // 下一页按钮点击事件处理函数
    function nextOrderPage() {
        if (${order_message.hasNextPage}) {
            var newPageNum = ${order_message.nextPage}; // 或 pageInfo.pageNum + 1;
            // 发送请求到服务器获取新页面的数据，并更新页面内容
            // 例如：updatePageContent(newPageNum);
            console.log('切换到下一页，页码：' + newPageNum);
        } else {
            console.log('已经是最后一页了');
            alert("已经是最后一页!");
        }
    }
</script>

</body>

</html>
