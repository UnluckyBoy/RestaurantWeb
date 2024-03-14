<%@ page import="com.server.model.pojo.Product" %><%--
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

    <title>私房菜后台管理-产品管理</title>

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
                            <li><a href="/Restaurant/userinfoPage">个人信息</a></li>
<%--                            <li><a href="">联系我们</a></li>--%>
                            <li><a href="#" id="mailboxLink">信箱</a></li>
                            <li class="divider"></li>
                            <li><a href="/Restaurant/logout">安全退出</a></li>
                        </ul>
                    </div>
                </li>
                <li class="active">
                    <a href=""><i class="fa fa-th-large"></i> <span class="nav-label">数据管理</span>
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
                                <th class="text-center">商品样式</th>
<%--                                <th class="text-center">序号</th>--%>
                                <th class="text-center">商品名称</th>
                                <th class="text-center">商品详情</th>
                                <th class="text-center">商品类型</th>
                                <th class="text-center">商家</th>
                                <th class="text-center">售价</th>
                                <th class="text-center">备注</th>
                            </tr>
                            </thead>
                            <tbody id="product-table-body">
<%--                            <c:forEach var="productLists" items="${product_message.list}">--%>
<%--                                <tr class="product-table-column">--%>
<%--                                    <td class="text-center">--%>
<%--                                        <img id="product_head" src="http://localhost:8080${productLists.pIcon}" alt="Image" width="64" height="64">--%>
<%--                                    </td>--%>
<%--                                    <td class="text-center">${productLists.pId}</td>--%>
<%--                                    <td class="text-center" id="product_name">${productLists.pName}</td>--%>
<%--                                    <td class="text-center">${productLists.pDescription}</td>--%>
<%--                                    <td class="text-center">${productLists.pType}</td>--%>
<%--                                    <td class="text-center" id="product_shopper">${productLists.pShopper}</td>--%>
<%--                                    <td class="text-center"><span class="label label-primary">&yen;${productLists.pPrice}</span></td>--%>
<%--                                    <td class="text-center small">--%>
<%--                                        <button id="btn_add" type="button" class="btn-add btn btn-success">修改</button>--%>
<%--                                        <button id="btn_delete" type="button" class="btn-delete btn btn-danger">删除</button>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:forEach>--%>
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
                                <p class="text-center">
                                    <strong>产品ID:</strong>
                                    <strong id="productIdToDelete"></strong>
<%--                                    <strong>产品名称:</strong>--%>
<%--                                    <strong id="productName"></strong>--%>
                                </p>
                                <strong class="label label-danger center-block">重要数据！请慎重!!!是否删除？</strong>
                            </div>
                            <div class="modal-footer">
                                <div class="text-center">
                                    <button type="button" class="btn btn-danger" id="confirm_btn">确定</button>
                                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--图片修改弹窗-->
                <die class="modal inmodal" id="imageEditModal" tabindex="-1" role="dialog"  aria-hidden="true">
                    <div class="modal-dialog"><!--放大窗口时添加:modal-lg-->
                        <div class="modal-content animated fadeIn">
                            <div class="modal-header">
                                <label class="modal-title label label-primary center-block">图片更新</label>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <input type="file" id="product_head_file" name="" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" id="updateImage">保存</button>
                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </die>
                <!--全部修改-弹窗的HTML结构 -->
                <die class="modal inmodal" id="editModal" tabindex="-1" role="dialog"  aria-hidden="true">
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
                                        <th class="text-center small">序号</th>
<%--                                        <th class="text-center small">商品样式</th>--%>
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
                                        <td class="text-center small" contenteditable="true" id="td_data2"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data3"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data4"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data5"></td>
                                        <td class="text-center small" contenteditable="true" id="td_data6"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" id="updateProductBtn">保存</button>
                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </die>
            </div>
        </div>
        <div class="text-center"><!--按钮-->
            <p>
                <strong id="currentPage"></strong><strong id="allPage"></strong>
            </p>
            <button type="button" class="btn btn-success" onclick="add_Product()">添 加</button>
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

<script src="../staticRes/js/plugins/jeditable/jquery.jeditable.js"></script>
<!-- Data Tables -->
<script src="../staticRes/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="../staticRes/js/plugins/dataTables/dataTables.bootstrap.js"></script>

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
    let globalProductData;//全局变量
    $(document).ready(function() {
        //提示
        document.getElementById('mailboxLink').addEventListener('click', function(event) {
            // 阻止链接的默认行为（即刷新页面）
            event.preventDefault();
            // 弹出弹窗
            alert('功能尚未实装！敬请期待！');
        });

        // 发送 AJAX 请求获取产品数据
        fetchData('/Restaurant/freshProductPage',1);
        // $.ajax({
        //     url: '/Restaurant/freshProductPage', // 替换为你的后端服务URL
        //     type: 'GET', // 或者 'POST'，取决于你的后端服务需要的请求类型
        //     dataType: 'json', // 期望从服务器返回的数据类型
        //     success: function(data) {
        //         console.log("返回的数据:"+data.pageSize);
        //         globalProductData=data;//全局变量赋值
        //         var tbody = $('#product-table-body'); // 获取 tbody 元素
        //         if(data && data.list){
        //             tbody.empty(); // 清空 tbody中的内容
        //             //var pageSize = data.pageSize; //分页默认大小
        //             //var displayedCount = 0; // 用于跟踪已经显示的产品数量
        //             // 遍历数据并创建表格行
        //             $.each(data.list, function(index, product) {
        //                 // if (displayedCount >= pageSize) {
        //                 //     return false; // 当达到 pageSize 时退出循环
        //                 // }
        //                 var row = $('<tr class="product-table-column"></tr>'); // 创建新的表格行
        //                 // 创建并添加单元格到行中
        //                 //row.append($('<td class="text-center"><img src="' + product.pIcon + '" alt="Image" width="64" height="64"></td>'));
        //                 var imgCell = $('<td class="text-center"></td>').append($('<img src="' + product.pIcon + '" alt="Image" width="64" height="64">'));
        //                 row.append(imgCell);
        //                 row.append($('<td class="text-center">' + product.pId + '</td>'));
        //                 row.append($('<td class="text-center">' + product.pName + '</td>'));
        //                 row.append($('<td class="text-center">' + product.pDescription + '</td>'));
        //                 row.append($('<td class="text-center">' + product.pType + '</td>'));
        //                 row.append($('<td class="text-center">' + product.pShopper + '</td>'));
        //                 row.append($('<td class="text-center"><span class="label label-primary">&yen;' + product.pPrice + '</span></td>'));
        //                 // 创建修改按钮并添加事件处理函数
        //                 var btnAdd = $('<button type="button" class="btn-add btn btn-success">修改</button>');
        //                 var btnDet = $('<button type="button" class="btn-delete btn btn-danger">删除</button>');
        //                 row.append($('<td class="text-center small"></td>').append(btnAdd).append(btnDet));
        //                 // 为当前行的 <img> 元素添加点击事件
        //                 imgCell.find('img').on('click', function() {
        //                     // 在这里,访问到当前的product对象
        //                     //alert('你点击了产品图片，产品名称是：' + product.pName);
        //                     $("#imageEditModal").modal("show");
        //                     /** 头像按钮修改 */
        //                     document.getElementById('updateImage').addEventListener('click', function() {
        //                         var fileInput = $("#product_head_file")[0];
        //                         var file = fileInput.files[0];
        //                         var productName =product.pName; //产品名称
        //                         var productShopper = product.pShopper; //商家
        //                         var formData = new FormData();
        //                         if (file) {
        //                             formData.append("image", file);
        //                             formData.append("pName", productName);
        //                             formData.append("pShopper", productShopper);
        //                             $.ajax({
        //                                 url: "/Restaurant/upload_product_head", //SpringBoot应用地址
        //                                 type: "POST",
        //                                 data: formData,
        //                                 contentType: false,
        //                                 processData: false,
        //                                 success: function(data) {
        //                                     alert("上传结果:" + data);
        //                                     location.reload(true);
        //                                 },
        //                                 error: function(jqXHR, textStatus, errorMessage) {
        //                                     alert("上传结果:" + errorMessage);
        //                                 }
        //                             });
        //                             $("#imageEditModal").modal("hide"); // 隐藏模态框
        //                         } else {
        //                             alert("请选择图片!");
        //                         }
        //                     });
        //                 });
        //                 // 将行添加到 tbody 中
        //                 tbody.append(row);
        //                 // 增加已显示的产品数量
        //                 //displayedCount++;
        //             });
        //             //显示页码
        //             $("#currentPage").text(data.pageNum);
        //             $("#allPage").text("/"+data.pages);
        //         }
        //     },
        //     error: function(jqXHR, textStatus, errorThrown) {
        //         // 处理请求失败的情况
        //         console.error('AJAX 请求失败: ' + textStatus, errorThrown);
        //     }
        // });

        // 修改按钮的点击事件
        $(document).on('click', '.btn-add', function() {
            // 获取当前行的数据，例如产品ID或其他需要的信息
            var productId = $(this).closest('tr').find("td:eq(0)").text();
            var productName=$(this).closest('tr').find("td:eq(2)").text();
            var productDes = $(this).closest('tr').find("td:eq(3)").text();
            var productType=$(this).closest('tr').find("td:eq(4)").text();
            var productShopper = $(this).closest('tr').find("td:eq(5)").text();
            var productPrice=$(this).closest('tr').find("td:eq(6)").text().slice(1);
            console.log("要修改的数据:"+productId+","+productName);
            // 使用productId作为参数
            //alert("修改按钮被点击了，产品ID为: " + productId);
            $("#editModal").modal("show");
            $("#td_data1").text(productId);
            $("#td_data2").text(productName);
            $("#td_data3").text(productDes);
            $("#td_data4").text(productType);
            $("#td_data5").text(productShopper);
            $("#td_data6").text(productPrice);
            $("#updateProductBtn").click(function (){
                // 封装要发送的数据
                var order_data = {
                    id: $("#td_data1").text(),
                    name: $("#td_data2").text(),
                    description: $("#td_data3").text(),
                    type: $("#td_data4").text(),
                    shopper: $("#td_data5").text(),
                    price: $("#td_data6").text()
                };
                console.log("发送的封装数据:"+order_data.id+","+order_data.name+","+order_data.description
                    +","+order_data.type+","+order_data.shopper+","+order_data.price)
                // 发送数据到后端
                $.ajax({
                    url: '/Restaurant/update_product_info',  // 替换为实际的 Spring Boot 后端端点
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(order_data),
                    success: function(response) {
                        console.log('数据成功发送到后端',response);
                        // 在这里处理后端的响应
                        $("#editModal").modal("hide");
                        location.reload();
                    },
                    error: function(jqXHR, textStatus, errorMessage) {
                        console.log("数据上传异常:" + errorMessage);
                        $("#editModal").modal("hide");
                    }
                });
            });

        });
        // 删除按钮的点击事件
        $(document).on('click', '.btn-delete', function() {
            // 获取当前行的数据
            var productId = $(this).closest('tr').find("td:eq(0)").text(); // 假设有一个类为pId的td元素包含产品ID
            // 弹出一个Bootstrap的确认框
            $('#productIdToDelete').text(productId);
            $('#confirm_Modal').modal('show');
        });
        // 确认删除的按钮点击事件
        $('#confirm_Modal').on('click', '#confirm_btn', function() {
            // 获取之前存储在modal中的产品ID
            var productIdToDelete = $('#confirm_Modal').find('#productIdToDelete').text();
            // 删除逻辑,使用productIdToDelete作为参数
            console.log("确认删除产品ID为: " + productIdToDelete);
            // var formData = new FormData();
            // formData.append("id", productIdToDelete);
            // 执行删除操作，可能是发送AJAX请求到服务器
            $.ajax({
                url: '/Restaurant/delete_product', // 你的后端接口URL
                type: 'GET',
                data: { id: productIdToDelete },
                success: function(data) {
                    //location.reload(true);
                    console.log("刷新成功:" + data);
                    // 关闭模态框
                    $('#confirm_Modal').modal('hide');
                    location.reload(true);
                },
                error: function(jqXHR, textStatus, errorMessage) {
                    console.log("刷新失败:" + errorMessage);
                }
            });
        });
    });

    /**
     * 添加产品
     */
    function add_Product(){
        console.log("添加产品");
        alert("此功能涉及店铺注册等相关逻辑，暂未实装！敬请期待！！！");
    }

    // 上一页按钮点击事件处理函数
    function previousPage() {
        if (globalProductData.pageNum>1) {//hasPreviousPage
            var newPageNum = globalProductData.prePage; // 或 pageInfo.pageNum - 1;
            // 发送请求到服务器获取新页面的数据，并更新页面内容
            // 例如：updatePageContent(newPageNum);
            console.log('切换到上一页，页码：' + newPageNum);
            fetchData('/Restaurant/freshProductPage',newPageNum);
        } else {
            console.log('已经是第一页了');
            alert("已经是第一页!");
        }
    }
    // 下一页按钮点击事件处理函数
    function nextPage() {
        if (globalProductData.hasNextPage) {
            var newPageNum = globalProductData.nextPage; // 或 pageInfo.pageNum + 1;
            // 发送请求到服务器获取新页面的数据，并更新页面内容
            // 例如：updatePageContent(newPageNum);
            console.log('切换到下一页，页码：' + newPageNum);
            fetchData('/Restaurant/freshProductPage',newPageNum);
        } else {
            console.log('已经是最后一页了');
            alert("已经是最后一页!");
        }
    }

    //重复使用的ajax功能模块,用于刷新上下页
    function fetchData(url,newPageNum){
        // 发送AJAX请求到后端获取下一页数据
        $.ajax({
            url:url, // 你的后端Api:'/Restaurant/freshProductPage'
            type: 'GET',
            data: { pageNum: newPageNum}, // 将下一页的页码作为参数传递
            dataType: 'json',
            success: function(data) {
                console.log("返回的数据:"+data.pageSize);
                globalProductData=data;//全局变量赋值
                var tbody = $('#product-table-body'); // 获取 tbody 元素
                if(data && data.list){
                    tbody.empty(); // 清空 tbody中的内容
                    //var pageSize = data.pageSize; //分页默认大小
                    //var displayedCount = 0; // 用于跟踪已经显示的产品数量
                    //var displayedCount = 0; // 用于跟踪已经显示的产品数量
                    // 遍历数据并创建表格行
                    $.each(data.list, function(index, product) {
                        var row = $('<tr class="product-table-column"></tr>'); // 创建新的表格行
                        // 创建并添加单元格到行中
                        row.append($('<td class="text-center">' + product.pId + '</td>'));
                        //row.append($('<td class="text-center"><img src="' + product.pIcon + '" alt="Image" width="64" height="64"></td>'));
                        var imgCell = $('<td class="text-center"></td>').append($('<img src="' + product.pIcon + '" alt="Image" width="64" height="64">'));
                        row.append(imgCell);
                        // row.append($('<td class="text-center">' + product.pId + '</td>'));
                        row.append($('<td class="text-center">' + product.pName + '</td>'));
                        row.append($('<td class="text-center">' + product.pDescription + '</td>'));
                        row.append($('<td class="text-center">' + product.pType + '</td>'));
                        row.append($('<td class="text-center">' + product.pShopper + '</td>'));
                        row.append($('<td class="text-center"><span class="label label-primary">&yen;' + product.pPrice + '</span></td>'));
                        // 创建修改按钮并添加事件处理函数
                        var btnAdd = $('<button type="button" class="btn-add btn btn-success">修改</button>');
                        var btnDet = $('<button type="button" class="btn-delete btn btn-danger">删除</button>');
                        row.append($('<td class="text-center small"></td>').append(btnAdd).append(btnDet));
                        // 为当前行的 <img> 元素添加点击事件
                        imgCell.find('img').on('click', function() {
                            // 在这里,访问到当前的product对象
                            //alert('你点击了产品图片，产品名称是：' + product.pName);
                            $("#imageEditModal").modal("show");
                            /** 头像按钮修改 */
                            document.getElementById('updateImage').addEventListener('click', function() {
                                var fileInput = $("#product_head_file")[0];
                                var file = fileInput.files[0];
                                var productName =product.pName; //产品名称
                                var productShopper = product.pShopper; //商家
                                var formData = new FormData();
                                if (file) {
                                    formData.append("image", file);
                                    formData.append("pName", productName);
                                    formData.append("pShopper", productShopper);
                                    $.ajax({
                                        url: "/Restaurant/upload_product_head",
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
                                    $("#imageEditModal").modal("hide"); // 隐藏模态框
                                } else {
                                    alert("请选择图片!");
                                }
                            });
                        });
                        // 将行添加到 tbody 中
                        tbody.append(row);
                    });
                    //显示页码
                    $("#currentPage").text(data.pageNum);
                    $("#allPage").text("/"+data.pages);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // 处理请求失败的情况
                console.error('AJAX 请求失败: ' + textStatus, errorThrown);
            }
        });
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

</script>

</body>

</html>
