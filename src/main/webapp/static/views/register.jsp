<%--
  Created by IntelliJ IDEA.
  User: matrix
  Date: 2024/1/19 0019
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>阿婆私房菜后台管理 - 注册</title>
    <link href="../staticRes/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <!--图标库-->
    <link href="../staticRes/fontawesome_5.15.4/css/fontawesome.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/brands.css" rel="stylesheet">
    <link href="../staticRes/fontawesome_5.15.4/css/solid.css" rel="stylesheet">
    <link href="../staticRes/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../staticRes/css/animate.css" rel="stylesheet">
    <link href="../staticRes/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name"></h1>
        </div>
        <h3>欢迎注册</h3>
        <p>创建一个新账户</p>
        <div class="form-group">
            <input id="input_name" type="text" class="form-control" placeholder="请输入账户名">
        </div>
        <div class="form-group">
            <input id="account" type="text" class="form-control" placeholder="请输入账户">
        </div>
        <div class="form-group">
            <input id="password" type="password" class="form-control" placeholder="请输入密码">
        </div>
        <div class="form-group">
            <input id="password_confirm" type="password" class="form-control" placeholder="请再次输入密码">
        </div>
        <div class="form-group text-left">
            <div class="checkbox i-checks">
                <label class="no-padding" for="agreement-btn">
                    <input id="agreement-btn" type="checkbox" value="checked">我同意注册协议
                </label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary block full-width m-b" id="register_btn">注 册</button>
        <p class="text-muted text-center"><small>已经有账户了？</small><a href="/Restaurant/loginPage">点此登录</a>
        </p>
    </div>
</div>

<!-- Mainly scripts -->
<script src="../staticRes/js/jquery-2.1.1.min.js"></script>
<script src="../staticRes/js/bootstrap.min.js?v=3.4.0"></script>
<!-- iCheck -->
<script src="../staticRes/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

        // 绑定注册按钮的点击事件
        $('#register_btn').on('click', function(e) {
            var name=$("#input_name").val();
            var account=$("#account").val();
            var password=$("#password").val();
            var password_confirm=$("#password_confirm").val();
            //console.log(name+","+account+","+password+","+password_confirm);
            if(name.trim()===''||account.trim()===''||password.trim()===''||password_confirm.trim()===''){
                alert("请检查输入!");
            }else {
                if (password != password_confirm) {
                    alert("密码不一致!");
                } else {
                    // 检测复选框是否被勾选
                    //var isChecked = $('input[type="checkbox"]', '.i-checks').iCheck('isChecked');
                    var isChecked=$('#agreement-btn').prop('checked')
                    console.log("勾选框值:"+isChecked);
                    if (!isChecked) {
                        // 如果没有勾选，则显示提示
                        alert('请勾选“我同意注册协议”以完成注册！');
                    }else {
                        //alert('已勾选!');
                        $.ajax({
                            url:'/Restaurant/register',
                            type: 'Post',
                            data: {
                                name: name,
                                account: account,
                                password: password
                            },
                            success: function(data) {
                                alert("注册成功!");
                                window.location.href ='/Restaurant/loginPage';
                            },
                            error: function(xhr, status, errorMessage) {
                                //console.log("注册失败:"+xhr.responseText);
                                if(xhr.responseText==="isRegister"){
                                    alert("此账号已注册,请检查!");
                                }else{
                                    alert("注册失败!");
                                }
                            }
                        });
                    }
                }
            }
        });
        // 监听复选框状态变化
        // $('input[type="checkbox"]', '.i-checks').on('ifChanged', function(event) {
        //     // 如果复选框被勾选，则启用注册按钮
        //     if ($(this).is(':checked')) {
        //         $('#register_btn').prop('disabled', false);
        //     }else{
        //         $('#register_btn').prop('disabled', true);
        //     }
        // });
        // // 页面加载时，如果复选框未被勾选，则禁用注册按钮
        // if (!$('input[type="checkbox"]', '.i-checks').is(':checked')) {
        //     $('#register_btn').prop('disabled', true);
        // }
    });
</script>
</body>

</html>
