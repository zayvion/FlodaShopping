<%--
  User: dc
  Date: 2019/8/5
  Time: 16:13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>  <base href="<%=basePath%>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>登录-Floda</title>

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />

    <!-- Google fonts include -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear" rel="stylesheet">

    <!-- All Vendor & plugins CSS include -->
    <link href="assets/css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
    .back_login{
        color: #CC2121;
        font-size: 12px;
        margin-top: -6px;
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
                    <!-- Login Content Start -->
                    <div class="col-lg-6" style="margin: 30px auto">
                        <div class="login-reg-form-wrap">
                            <h2>登录
                                <span class="text-success" style="font-size: 12px;margin-left: 50px">${requestScope.hint}</span>
                                <span class="text-success" style="font-size: 12px;margin-left: 50px">${requestScope.hints}</span>
                            </h2>
                            <form action="user_login.action" method="post">
                                <div class="single-input-item">
                                    <input type="text" placeholder="用户名" name="username" required value="${requestScope.newUser.username}"/>
                                </div>
                                <div class="single-input-item">
                                    <input type="password" placeholder="密码" name="password" required/>
                                </div>
                                <div class="single-input-item">
                                    <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                        <div class="remember-meta">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="rememberMe">
                                                <label class="custom-control-label" for="rememberMe">记住我</label>
                                            </div>
                                        </div>
                                        <a href="#" class="forget-pwd">忘记密码?</a>
                                    </div>
                                </div>
                                <div class="single-input-item">
                                    <button class="btn btn__bg" type="submit">登录</button>
                                    <a href="register.jsp" class="back_login">没有账户?去注册</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Login Content End -->

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
</body>
</html>