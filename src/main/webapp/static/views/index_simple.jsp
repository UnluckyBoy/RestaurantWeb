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

    <title>私房菜-主页</title>
    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <!--图标库-->
    <link href="../staticRes/fontawesome_5.15.4/css/fontawesome.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/brands.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/solid.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="../staticRes/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="../staticRes/css/animate.css" rel="stylesheet">
    <link href="../staticRes/css/style.css?v=2.2.0" rel="stylesheet">
    <link href="../staticRes/css/matrix.css" rel="stylesheet">

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
                                    <span class="block m-t-xs">
                                        <strong class="font-bold"> ${message.name} </strong>
                                    </span>
                                    <span class="text-muted text-xs block"> ${message.level}
                                        <b class="caret"></b>
                                    </span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="/Restaurant/infoSimplePage">个人信息</a></li>
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
<%--                        <span class="fa arrow"></span>--%>
                    </a>
                </li>
                <li class="active">
                    <a href="">
                        <i class="fas fa-address-card"></i>
                        <span class="nav-label">个人管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
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
                        <span class="m-r-sm text-muted welcome-message">
                            <a href="/Restaurant/IndexSimplePage" title="返回首页"><i class="fa fa-home"></i></a>
                            <strong class="font-bold label-warning-light">${message.name}</strong> | 欢迎使用
                        </span>
                    </li>
                    <li>
                        <a href="/Restaurant/logout"><i class="fas fa-sign-out-alt"></i>退出</a>
                    </li>
                </ul>
            </nav>
        </div>

        <!--商品视图-->
        <div class="container">
            <div class="row">
                <!-- 商品列表容器 -->
                <div id="product-list" class="col-md-12">
                    <!-- 商品项将在这里动态生成 -->
                </div>
            </div>

            <div class="text-center"><!--按钮-->
                <p>
                    <strong id="currentPage"></strong><strong id="allPage"></strong>
                </p>
                <button type="button" class="btn btn-primary" onclick="previousPage()">上一页</button>
                <button type="button" class="btn btn-primary" onclick="nextPage()">下一页</button>
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

        freshData('/Restaurant/freshProductPage',1);

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
    function previousPage() {
        if (globalData.pageNum>1) {//hasPreviousPage
            var newPageNum = globalData.prePage; // 或 pageInfo.pageNum - 1;
            // 发送请求到服务器获取新页面的数据，并更新页面内容
            // 例如：updatePageContent(newPageNum);
            console.log('切换到上一页，页码：' + newPageNum);
            freshData('/Restaurant/freshProductPage',newPageNum);
        } else {
            console.log('已经是第一页了');
            alert("已经是第一页!");
            //$("#lastBtn").disabled = true;
        }
    }
    // 下一页按钮点击事件处理函数
    function nextPage() {
        if (globalData.hasNextPage) {
            var newPageNum = globalData.nextPage;
            console.log('切换到下一页，页码：' + newPageNum);
            freshData('/Restaurant/freshProductPage',newPageNum);
        } else {
            console.log('已经是最后一页了');
            alert("已经是最后一页!");
        }
    }

    function freshData(url,newPageNum){
        // 发送 AJAX 请求获取数据
        $.ajax({
            url:url,
            type: 'GET',
            data: { pageNum: newPageNum},
            dataType: 'json', //服务器返回JSON格式
            success: function(data) {
                globalData=data;
                if(data && data.list){
                    // 清空之前的商品列表（如果有的话）
                    $('#product-list').empty();
                    // 遍历商品数据并创建DOM元素
                    $.each(data.list, function(index, product) {
                        var productItem = $('<div>').addClass('col-md-4 product-item product-item-spacing');
                        var productImage = $('<div>').addClass('product-image');
                        var imageElement = $('<img>').attr('src', product.pImage).attr('alt', '商品图片');
                        productImage.append(imageElement);
                        var productInfo = $('<div>').addClass('product-info');
                        var nameElement = $('<h3>').text(product.pName);
                        var priceElement = $('<p>').addClass('price').text('￥' + product.pPrice);
                        var descriptionElement = $('<p>').text(product.pDescription);
                        var addToCartButton = $('<button>').addClass('btn btn-sm btn-primary add-to-cart').text('加入购物车');
                        // 为添加到购物车的按钮添加点击事件
                        addToCartButton.click(function() {
                            // 在这里执行您希望当按钮被点击时发生的操作
                            //alert('产品:' + product.pName + ' 已添加到购物车!');
                            addShoppingCrat('/Restaurant/add_shopping_cart',product.pName,
                                '${message.account}',product.pShopper,product.pPrice);
                        });
                        productInfo.append(nameElement, priceElement, descriptionElement, addToCartButton);
                        productItem.append(productImage, productInfo);
                        // 将商品项添加到商品列表容器中
                        $('#product-list').append(productItem);
                    });
                    //显示页码
                    $("#currentPage").text(data.pageNum);
                    $("#allPage").text("/"+data.pages);
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX请求失败: " + error);
            }
        });
    }

    function addShoppingCrat(url,content,creator,shopper,tradingPrice){
        $.ajax({
            url:url,
            type: 'GET',
            data: {
                content: content+"一份",
                creator: creator,
                shopper: shopper,
                tradingPrice: tradingPrice
            },
            dataType: 'json', //服务器返回JSON格式
            success: function(data) {

            },
            error: function(xhr, status, error) {
                console.error("添加购物车失败: " + error);
            }
        });
    }
</script>

</body>

</html>
