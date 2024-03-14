<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/2/22 0022
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>私房菜后台管理-公共消息</title>

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
                    <div class="logo-element">
                        H+
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

        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row animated fadeInRight">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="text-center float-e-margins p-md">
                                    <span>布局预览:</span>
                                    <a href="/Restaurant/CommonMessagePage" class="btn btn-xs btn-primary" id="lightVersion">浅色</a>
                                    <a href="/Restaurant/CommonMessagePage" class="btn btn-xs btn-success" id="darkVersion">深色</a>
                                    <a href="/Restaurant/CommonMessagePage" class="btn btn-xs btn-info" id="leftVersion">布局切换</a>
                                </div>
                                <div class="" id="ibox-content">
                                    <div id="vertical-timeline" class="vertical-container light-timeline">
<%--                                        <c:forEach var="messagelists" items="${Announcement_message.AnnouncementList}">--%>
<%--                                            <div class="vertical-timeline-block">--%>
<%--                                                <div class="vertical-timeline-icon navy-bg">--%>
<%--                                                    <i class="fas fa-atom"></i>--%>
<%--                                                </div>--%>
<%--                                                <div class="vertical-timeline-content">--%>
<%--                                                    <h2>${messagelists.aTitle}</h2>--%>
<%--                                                    <p>${messagelists.aContent}</p>--%>
<%--                                                    <span class="vertical-date"><br><small>${messagelists.aCreateTime}</small></span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </c:forEach>--%>
<%--                                        <div class="vertical-timeline-block">--%>
<%--                                            <div class="vertical-timeline-icon navy-bg">--%>
<%--                                                <i class="fa fa-briefcase"></i>--%>
<%--                                            </div>--%>
<%--                                            <div class="vertical-timeline-content">--%>
<%--                                                <h2>会议</h2>--%>
<%--                                                <p>上一年的销售业绩发布会。总结产品营销和销售趋势及销售的现状。</p>--%>
<%--                                                <span class="vertical-date">今天--%>
<%--                                                    <br><small>2月3日</small></br>--%>
<%--                                                </span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center"><!--按钮-->
            <p>
                <strong id="currentPage"></strong><strong id="allPage"></strong>
            </p>
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#messageEditModal">发布</button>
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

        <!--发布消息弹窗-->
        <die class="modal inmodal" id="messageEditModal" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog modal-lg"><!--放大窗口时添加:modal-lg-->
                <div class="modal-content animated fadeIn">
                    <div class="modal-header" style="display: flex; justify-content: center; align-items: center;">
                        <div class="form-group">
                            <input type="text" id="messageTitle" class="form-control" placeholder="消息标题" style="max-width: 500px;">
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" id="messageContent" class="form-control" placeholder="消息内容...">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="text-center">
                            <button type="button" class="btn btn-primary" id="updateMessage" onclick="upMessage()">推送</button>
                            <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
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
    let globalMessageData;
    $(document).ready(function() {
        //信箱按钮弹窗
        document.getElementById('mailboxLink').addEventListener('click', function(event) {
            // 阻止链接的默认行为（即刷新页面）
            event.preventDefault();
            // 弹出弹窗
            alert('功能尚未实装！敬请期待！');
        });
        //初始化数据
        freshData('/Restaurant/freshMessagePage',1);

        //修改页面布局
        $('#lightVersion').click(function (event) {
            event.preventDefault()
            $('#ibox-content').removeClass('ibox-content');
            $('#vertical-timeline').removeClass('dark-timeline');
            $('#vertical-timeline').addClass('light-timeline');
        });
        $('#darkVersion').click(function (event) {
            event.preventDefault()
            $('#ibox-content').addClass('ibox-content');
            $('#vertical-timeline').removeClass('light-timeline');
            $('#vertical-timeline').addClass('dark-timeline');
        });
        $('#leftVersion').click(function (event) {
            event.preventDefault()
            $('#vertical-timeline').toggleClass('center-orientation');
        });
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

    function upMessage(){
        var title=$("#messageTitle").val();
        var content=$("#messageContent").val();
        if(title.trim()===''||content.trim()===''){
            alert("请检查输入内容！");
        }
        // 封装要发送的数据
        var formData = new FormData();
        formData.append("title",title);
        formData.append("content", content);
        formData.append("publisher", '${message.account}');
        formData.append("createTime", getCurrentDateTime());
        console.log("后端数据:"+formData.get("title")+","+formData.get("content")+
            ","+formData.get("publisher")+","+formData.get("createTime"));
        // 发送数据到后端
        $.ajax({
            url: '/Restaurant/addMessage',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                alert("推送成功！"+data);
                $("#messageEditModal").modal("hide")
                location.reload();
            },
            error: function(jqXHR, textStatus, errorMessage) {
                alert("推送失败！" + errorMessage);
            }
        });
    }

    function freshData(url,pagenum){
        $.ajax({
            url:url, // 你的后端 API 端点
            type: 'GET',
            data: { pageNum: pagenum},
            dataType: 'json', // 期望返回的数据类型
            success: function(data) {
                globalMessageData=data;
                if(data && data.list){
                    var timelineContainer = $('#vertical-timeline');
                    $.each(data.list, function(index, messagelist) {
                        // 创建 .vertical-timeline-block 元素
                        var timelineBlock = $('<div>').addClass('vertical-timeline-block');
                        var timelineIcon = $('<div>').addClass('vertical-timeline-icon navy-bg');
                        var icon = $('<i>').addClass('fas fa-atom');
                        timelineIcon.append(icon);
                        timelineBlock.append(timelineIcon);
                        var timelineContent = $('<div>').addClass('vertical-timeline-content');
                        var title = $('<h2>').text(messagelist.aTitle);
                        var content = $('<p>').text(messagelist.aContent);
                        var date = $('<span>').addClass('vertical-date').append($('<br>')).append($('<small>').text(messagelist.aCreateTime));
                        timelineContent.append(title);
                        timelineContent.append(content);
                        timelineContent.append(date);
                        timelineBlock.append(timelineContent);
                        // 将新创建的元素添加到容器中
                        timelineContainer.append(timelineBlock);
                    });
                    $("#currentPage").text(data.pageNum);
                    $("#allPage").text("/"+data.pages);
                }
            },
            error: function(xhr, status, error) {
                // 处理错误情况
                console.error("AJAX 请求失败: " + error);
            }
        });
    }

    // 上一页按钮点击事件处理函数
    function previousPage() {
        if (globalMessageData.pageNum>1) {//hasPreviousPage
            var newPageNum = globalMessageData.prePage; // 或 pageInfo.pageNum - 1;
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
        if (globalMessageData.hasNextPage) {
            var newPageNum = globalMessageData.nextPage; // 或 pageInfo.pageNum + 1;
            // 发送请求到服务器获取新页面的数据，并更新页面内容
            // 例如：updatePageContent(newPageNum);
            console.log('切换到下一页，页码：' + newPageNum);
            fetchData('/Restaurant/freshProductPage',newPageNum);
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
</script>

</body>

</html>
