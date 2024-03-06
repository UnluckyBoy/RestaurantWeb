<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/2/22 0022
  Time: 13:08
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

    <title>产品管理</title>

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
                            <li><a href="/Restaurant/logout">安全退出</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active">
                    <a href="index.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">数据管理</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="/Restaurant/OrderManagerPage">订单数据</a>
                        </li>
                        <li><a href="/Restaurant/ProductPage">菜单管理</a></li>
                        <li><a href="/Restaurant/CommonMessagePage">公共信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="fas fa-address-card"></i> <span class="nav-label">个人信息</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="">个人资料</a></li>
                        <li><a href="">帮助中心</a></li>
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
                        <a href="/Restaurant/logout"><i class="fas fa-sign-out-alt"></i> 退出</a>
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
                                <th class="text-center">商品样式</th>
                                <th class="text-center">商品名称</th>
                                <th class="text-center">商品详情</th>
                                <th class="text-center">商品类型</th>
                                <th class="text-center">商家</th>
                                <th class="text-center">售价</th>
                                <th class="text-center">备注</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="productLists" items="${Product_message.ProductList}">
                                <tr class="product-table-column">
                                    <td class="text-center">${productLists.pId}</td>
<%--                                    <td class="text-center small">${productlists.pIcon}</td>--%>
                                    <td class="text-center">
                                        <img id="product_head" src="http://localhost:8080${productLists.pIcon}" alt="Image" width="64" height="64">
                                    </td>
                                    <td class="text-center" id="product_name">${productLists.pName}</td>
                                    <td class="text-center">${productLists.pDescription}</td>
                                    <td class="text-center">${productLists.pType}</td>
                                    <td class="text-center" id="product_shopper">${productLists.pShopper}</td>
                                    <td class="text-center"><span class="label label-primary">&yen;${productLists.pPrice}</span></td>
                                    <td class="text-center small">
                                        <button id="btn_add" type="button" class="btn btn-success" onclick="update_Product()">修改</button>
                                        <button id="btn_delete" type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirm_Modal">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!--确定删除窗口-小模态窗口-->
                <div class="modal inmodal fade" id="confirm_Modal" tabindex="-1" role="dialog"  aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
<%--                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
                                <label>温馨提示</label>
                            </div>
                            <div class="modal-body">
                                <strong class="label label-danger center-block">重要数据！请慎重!!!是否删除？</strong>
                            </div>
                            <div class="modal-footer">
                                <div class="text-center">
                                    <button type="button" class="btn btn-danger">确定</button>
                                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--图片修改弹窗-->
                <die class="modal inmodal" id="imageEditModal" tabindex="-1" role="dialog"  aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content animated fadeIn">
                            <div class="modal-header">
                                <label class="modal-title label label-primary center-block">图片更新</label>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="file" id="product_head_file" name="" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" id="updateHead">保存</button>
                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </die>
                <!--全部修改-弹窗的HTML结构 -->
                <div class="modal inmodal" id="editModal" tabindex="-1" role="dialog"  aria-hidden="true">
                    <div class="modal-dialog modal-lg"><!--modal-lg设置大窗口-->
                        <div class="modal-content animated fadeIn"><!--设置窗口动画模式-->
                            <div class="modal-header">
                                <h4 class="modal-title label label-primary center-block">订单修改</h4>
                                <small class="label label-danger center-block">重要数据！请慎重!!!</small>
                            </div>
                            <div class="col-lg-12">
                                <table class="table table-hover margin bottom" id="editTable"><!--border="1",显示表格边框,且边框宽度为1像素-->
                                    <thead>
                                    <tr>
                                        <th class="small">序号</th>
                                        <th class="text-center small">商品样式</th>
                                        <th class="text-center small">商品名称</th>
                                        <th class="text-center small">商品详情</th>
                                        <th class="text-center small">商品类型</th>
                                        <th class="text-center small">商家</th>
                                        <th class="text-center small">售价</th>
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
                                        <td class="text-center small" contenteditable="true" id="td_data7"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
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
            <button type="button" class="btn btn-primary">上一页</button>
            <button type="button" class="btn btn-primary">下一页</button>
            <button type="button" class="btn btn-success" onclick="add_Product()">添 加</button>
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

<!--给数据表添加点击响应逻辑-->
<script>
    $(document).ready(function() {
        // 给每一行添加点击事件
        // $(".product-table-column").on("click", function() {
        //     // 获取当前行的数据，以示例为准，这里获取第一列的文本内容
        //     var orderId = $(this).find("td:first").text();
        //     var orderContent = $(this).find("td:eq(6)").text(); //以示例为准，获取第三列的内容
        //     console.log("内容: " + orderContent+"  长度:"+orderContent.length);
        //     // 在编辑弹窗中显示数据
        //     document.getElementById("td_data1").innerText = orderId;
        //     document.getElementById("td_data2").innerText = $(this).find("td:eq(1)").attr("src");
        //     document.getElementById("td_data3").innerText = $(this).find("td:eq(2)").text();
        //     document.getElementById("td_data4").innerText = $(this).find("td:eq(3)").text();
        //     document.getElementById("td_data5").innerText = $(this).find("td:eq(4)").text();
        //     document.getElementById("td_data6").innerText = $(this).find("td:eq(5)").text();
        //     document.getElementById("td_data7").innerText = $(this).find("td:eq(6)").text().slice(1);
        //     // // 弹出编辑弹窗
        //     // $("#editModal").css("display", "block");
        //     $("#editModal").modal("show"); // 显示模态框(使用Bootstrap库显示)
        //     //$("#editModal").modal("hide"); // 隐藏模态框
        // });

        /**
         * 第一行:first-child
         * 第二行:nth-child(2)
         */
        $('table tr td:nth-child(2)').click(function() {
            // 获取当前点击的<td>元素的文本或其他属性
            var cellText = $(this).parent().find("td:eq(0)").text();
            var pName=$(this).parent().find("td:eq(2)").text();
            var pShopper=$(this).parent().find("td:eq(5)").text();
            console.log("点击了图片"+cellText);
            $("#imageEditModal").modal("show");

            document.getElementById('updateHead').addEventListener('click', function() {
                var fileInput = $("#product_head_file")[0];
                var file = fileInput.files[0];
                var productName =pName; //产品名称
                var productShopper = pShopper; //商家
                var formData = new FormData();
                if (file) {
                    formData.append("image", file);
                    formData.append("pName", productName);
                    formData.append("pShopper", productShopper);
                    $.ajax({
                        url: "/Restaurant/upload_product_head", //SpringBoot应用地址
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
                    $("#imageEditModal").modal("hide"); // 隐藏模态框
                } else {
                    alert("请选择图片!");
                }
            });
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
        // 在这里可以执行保存操作，例如更新数据或者发送到后端
        var result="{pId="+ result_data1+",pIcon="+ result_data2+",pName="+ result_data3
            +",pDescription=" + result_data4+",pType=" + result_data5+",pShopper="+ result_data6
            +",pPrice="+ result_data7+"}";
        console.log("编辑后的数据: " +result);

        // 封装要发送的数据
        var order_data = {
            mId: result_data1,
            mOrderNumber: result_data2,
            mContent: result_data3,
            mOrder: result_data4,
            mShopper: result_data5,
            mTradingPrice: result_data6,
            mCreateTime: result_data7
        };

        // 发送数据到后端
        // $.ajax({
        //     url: '/Restaurant/update_order',  // 替换为实际的 Spring Boot 后端端点
        //     type: 'POST',
        //     contentType: 'application/json',
        //     data: JSON.stringify(order_data),
        //     success: function(response) {
        //         console.log('数据成功发送到后端',response);
        //         // 在这里处理后端的响应
        //         if(response=="success"){
        //             location.reload();
        //         }
        //     },
        //     error: function(error) {
        //         console.error('发送数据到后端时出错', error);
        //     }
        // });

        // 隐藏编辑弹窗
        //$("#editModal").css("display", "none");
        $("#editModal").modal("hide"); // 隐藏模态框
    }

    /**
     * 上传图片到后端
     */
    // function upProductHead(){
    //     var fileInput = $("#product_head_file")[0];
    //     var file = fileInput.files[0];
    //     var productName ="测试"; //产品名称
    //     var shopper = "测试"; //商家
    //
    //     var formData = new FormData();
    //     if (file) {
    //         formData.append("image", file);
    //         formData.append("pName", productName);
    //         formData.append("pShopper", shopper);
    //         $.ajax({
    //             url: "/Restaurant/upload_product_head", //SpringBoot应用地址
    //             type: "POST",
    //             data: formData,
    //             contentType: false,
    //             processData: false,
    //             success: function(data) {
    //                 alert("上传结果:" + data);
    //             },
    //             error: function(jqXHR, textStatus, errorMessage) {
    //                 alert("上传结果:" + errorMessage);
    //             }
    //         });
    //         $("#imageEditModal").modal("hide"); // 隐藏模态框
    //     } else {
    //         alert("请选择图片!");
    //     }
    // }

    /**
     * 添加产品
     */
    function add_Product(){
        console.log("添加产品");
    }
    /**
     * 修改产品
     */
    function update_Product(){
        console.log("修改产品");
    }
    /**
     * 删除产品
     */
    function delete_Product(){
        alert('是否确定删除?');
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
</script>

</body>

</html>
