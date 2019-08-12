<%--
  User: dc
  Date: 2019/8/5
  Time: 16:13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page isELIgnored="false" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>用户注册-Floda</title>
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon"/>
    <!-- Google fonts include -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear"
          rel="stylesheet">
    <!-- All Vendor & plugins CSS include -->
    <link href="assets/css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        #btn_code {
            font-size: 14px;
            height: 40px;
            padding-top: 10px;
            width: 150px;
            background-color: #CC2121;
            color: #fff;
            margin-top: 5px;
        }

        #btn_code:hover {
            height: 40px;
            padding-top: 10px;
            width: 150px;
            background-color: #111;
            color: #fff;
        }
    </style>
</head>
<body>
<!-- Start Header Area -->
<header class="header-area">
    <!-- main header start -->
    <div class="main-header d-none d-lg-block">

        <!-- header middle area start -->
        <div class="header-main-area sticky">
            <div class="container" style="margin-top: 30px">
                <div class="row align-items-center position-relative">
                    <!-- start logo area -->
                    <div class="col-lg-3">
                        <div class="logo">
                            <a href="index.jsp">
                                <img src="assets/img/logo/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- start logo area -->
                </div>
            </div>
        </div>
        <!-- header middle area end -->
    </div>
    <!-- main header start -->
</header>
<!-- end Header Area -->


<!-- main wrapper start -->
<main>
    <!-- login register wrapper start -->
    <div class="login-register-wrapper section-space pb-0">
        <div class="container">
            <div class="member-area-from-wrap">
                <div class="row">
                    <!-- Register Content Start -->
                    <div class="col-lg-6" style="margin: 30px auto">
                        <div class="login-reg-form-wrap sign-up-form">
                            <h2>注册<span class="hint"
                                        style="color: #CC2121;font-size: 12px;margin-left: 50px">${requestScope.hint}</span>
                            </h2>
                            <form action="user_register" method="post" id="registerform">
                                <div class="single-input-item">
                                    <input type="text" placeholder="用户名" required name="username"/>
                                </div>
                                <div class="row">
                                    <div class="single-input-item col-lg-8">
                                        <input type="tel" placeholder="电话号码" required name="tel" id="tel"/>
                                    </div>
                                    <div class="single-input-item col-lg-4">
                                        <a id="btn_code" href="javascript:void(0)" class="btn btn-light">获取验证码</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="single-input-item">
                                            <input type="password" placeholder="密码" required name="password"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single-input-item">
                                            <input type="password" placeholder="重复密码" required name="repeat_pwd"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single-input-item">
                                            <input type="text" placeholder="短信验证码" required name="code"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-input-item">
                                    <button class="btn btn__bg" type="submit">注册</button>
                                    <a href="login.jsp" class="forget-pwd">返回登录</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Register Content End -->
                </div>
            </div>
        </div>
    </div>
    <!-- login register wrapper end -->
</main>
<!-- main wrapper end -->

<!-- Scroll to top start -->
<div class="scroll-top not-visible">
    <i class="fa fa-angle-up"></i>
</div>
<!-- Scroll to Top End -->

<!-- All vendor & plugins & active js include here -->
<!--All Vendor Js -->
<script src="assets/js/vendor.js"></script>
<!-- Active Js -->
<script src="assets/js/active.js"></script>
<script>
    //检查两次密码是否一致
    $("#registerform").submit(function () {
        if ($("#registerform input[type='password']").eq(0).val().trim() !== $("#registerform input[type='password']").eq(1).val().trim()) {
            $(".hint").html("两次密码输入不一致，请重新输入!")
            return false;
        } else {
            return true;
        }
    });
    $("#btn_code").click(function () {
        let tel = $("#tel").val();
        if($('#tel').val()==''||$('#tel').val().length<11){
            alert("手机号码格式错误")
            return;
        }
        $.post('sendRegSMS?phoneNumber='+tel, function () {
            console.log('验证码发送成功');
        })
        let count = 60;
        const countDown = setInterval(() => {
            if (count === 0) {
                $('#btn_code').text('重新发送').removeAttr('disabled');
                $('#btn_code').css({
                    background: '#CC2121',
                    color: '#fff',
                    cursor: 'pointer'
                });
                clearInterval(countDown);
            } else {
                $('#btn_code').attr('disabled', true);
                $('#btn_code').css({
                    background: '#c7c7c7',
                    color: '#6a6a6a',
                    cursor: 'default'
                });
                $('#btn_code').text(count + '秒后可重新获取');
                count--;

            }
        }, 1000);

    })
</script>
</body>
</body>
</html>