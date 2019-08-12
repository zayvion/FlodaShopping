<%@ page import="pojo.User" %><%--
  User: dc
  Date: 2019/8/9
  Time: 12:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    User onliner = (User) request.getSession().getAttribute("onliner");
%>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>Floda</title>
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />
    <!-- Google fonts include -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear" rel="stylesheet">
    <!-- All Vendor & plugins CSS include -->
    <link href="assets/css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css">
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
    <style>
        .address_card{
            width: 250PX;
            border: 1px solid #b3b3b3;
            padding: 10px;
            margin: 0 0 10px 5px;
            position: relative;
            display: inline-block;
        }
        .address_card p:nth-child(2){
            height: 75px;
        }
        .save,.exit{
            display: inline-block;
            width: 100px;
            height: 36px;
            line-height: 36px;
            text-align: center;
            background: #fff;
            border: 1px solid #e6e6e6;
        }
        .save{
            background: #A10000;
            color: #FFFFFF;
        }
        .nice-select{
            width: 150px;
        }
        /*修改*/
        #file{
            opacity: 0;
            width: 75px;
            height: 25px;
            border: 1px solid #9f191f;
            margin:20px 0 0 185px;
            z-index: 999;
        }
        #clone{
            width: 75px;
            height: 25px;
            margin:-25px 0 0 195px;
            z-index: 1;
            background: #d9534f;
            text-align: center;
            line-height: 25px;
            color: #fff;
            border-radius: 5px;
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
            <div class="container">
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

                    <!-- main menu area start -->
                    <div class="col-lg-6 position-static">
                        <div class="main-menu-area">
                            <div class="main-menu">
                                <!-- main menu navbar start -->
                                <nav class="desktop-menu"  style="height: 100px">

                                </nav>
                                <!-- main menu navbar end -->
                            </div>
                        </div>
                    </div>
                    <!-- main menu area end -->

                    <!-- mini cart area start -->
                    <div class="col-lg-3">
                        <div class="header-configure-wrapper">
                            <div class="header-configure-area">
                                <ul class="nav justify-content-end">
                                    <li class="user-hover">
                                        <a href="#">
                                            <i class="lnr lnr-user"></i>
                                        </a>
                                        <ul class="dropdown-list">
                                            <c:choose>
                                                <c:when test="${sessionScope.onliner.username == null}">
                                                    <li><a href="login.jsp">登录</a></li>
                                                    <li><a href="register.jsp">注册</a></li>
                                                </c:when>
                                                <c:when test="${sessionScope.onliner.username != null}">
                                                    <li><a href="my-account.jsp">${sessionScope.onliner.username}</a></li>
                                                    <li><a href="user_exit.action">退出</a></li>
                                                </c:when>
                                            </c:choose>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="wishlist.jsp">
                                            <i class="lnr lnr-heart"></i>
                                            <div class="notification">0</div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="minicart-btn">
                                            <i class="lnr lnr-cart"></i>
                                            <div class="notification">2</div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- mini cart area end -->
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
    <!-- breadcrumb area start -->
    <div class="breadcrumb-area common-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <h1>个人中心</h1>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="fa fa-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">个人中心</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->
    <!-- my account wrapper start -->
    <div class="my-account-wrapper section-space pb-0">
        <div class="container">
            <div class="section-bg-color">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- My Account Page Start -->
                        <div class="myaccount-page-wrapper">
                            <!-- My Account Tab Menu Start -->
                            <div class="row">
                                <div class="col-lg-3 col-md-4">
                                    <div class="myaccount-tab-menu nav" role="tablist">
                                        <a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i>
                                            我的中心</a>
                                        <a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i>
                                            我的订单</a>
                                        <a href="#address-edit" data-toggle="tab" onclick="getAddress(${sessionScope.onliner.user_id})"><i class="fa fa-map-marker"></i>
                                            地址管理</a>
                                        <a href="#account-info" data-toggle="tab" onclick="getUserInfo()"><i class="fa fa-user"></i> 个人信息</a>
                                        <a href="login-register.jsp"><i class="fa fa-sign-out"></i> 退出登录</a>
                                    </div>
                                </div>
                                <!-- My Account Tab Menu End -->

                                <!-- My Account Tab Content Start -->
                                <div class="col-lg-9 col-md-8">
                                    <div class="tab-content" id="myaccountContent">
                                        <!-- Single Tab Content Start -->
                                        <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                            <div class="myaccount-content">
                                                <h3>Dashboard</h3>
                                                <div class="welcome">
                                                    <p>Hello, <strong>Erik Jhonson</strong> (If Not <strong>Jhonson
                                                        !</strong><a href="login-register.jsp" class="logout"> Logout</a>)</p>
                                                </div>
                                                <p class="mb-0">From your account dashboard. you can easily check &
                                                    view your recent orders, manage your shipping and billing addresses
                                                    and edit your password and account details.</p>
                                            </div>
                                        </div>
                                        <!-- Single Tab Content End -->

                                        <!-- Single Tab Content Start -->
                                        <div class="tab-pane fade" id="orders" role="tabpanel">
                                            <div class="myaccount-content">
                                                <h3>Orders</h3>
                                                <div class="myaccount-table table-responsive text-center">
                                                    <table class="table table-bordered">
                                                        <thead class="thead-light">
                                                        <tr>
                                                            <th>Order</th>
                                                            <th>Date</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th>Action</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>Aug 22, 2019</td>
                                                            <td>Pending</td>
                                                            <td>$3000</td>
                                                            <td><a href="cart.jsp" class="btn btn__bg">View</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>July 22, 2019</td>
                                                            <td>Approved</td>
                                                            <td>$200</td>
                                                            <td><a href="cart.jsp" class="btn btn__bg">View</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>June 12, 2019</td>
                                                            <td>On Hold</td>
                                                            <td>$990</td>
                                                            <td><a href="cart.jsp" class="btn btn__bg">View</a>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Single Tab Content End -->

                                        <!-- Single Tab Content Start -->
                                        <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                            <div class="myaccount-content">
                                                <h3>地址管理
                                                    <a href="javascript:void(0)"
                                                       data-toggle="modal" data-target="#addAddr"
                                                       style="float:right;font-size: 14px;padding: 5px 10px;background: #cc2121;color: #fff">添加地址
                                                    </a>
                                                </h3>
                                                <div id="addr-container">
                                                    <div class="address_card">

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                        <!-- Single Tab Content End -->

                                        <!-- Single Tab Content Start -->
                                        <div class="tab-pane fade" id="account-info" role="tabpanel">
                                            <div class="myaccount-content">
                                                <h3>个人信息</h3>
                                                <div class="account-details-form">
                                                    <form action="#" onsubmit="return false" method="post" id="updateUserInfoForm">
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="name" class="required">姓名</label>
                                                                    <input type="text" id="name" name="info.name" placeholder="姓名" />
                                                                    <input type="hidden" id="userInfo_id" name="info.userInfo_id">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <img id="show"  class="img-thumbnail" style="margin:30px 0 0 120px;width: 230px;height: 250px">
                                                                <input id="head" type="hidden" name="info.head">
                                                                <input type="file" id="file" name="imgFile" accept="image/png, image/jpeg, image/gif, image/jpg" onchange="changepic(this)">
                                                                <div id="clone">图片上传</div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: -200px">
                                                            <div class="clearfix visible-xs-block"></div>
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="email" class="required">邮箱</label>
                                                                    <input type="email" id="email" name="info.email" placeholder="邮箱" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label class="required">性别</label>
                                                                    <select class="form-control" id="sex" name="info.sex">
                                                                        <option value="0">男</option>
                                                                        <option value="1">女</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <fieldset>
                                                            <legend>修改密码</legend>
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="single-input-item">
                                                                        <label for="current-pwd" class="required">原始密码</label>
                                                                        <input type="password" id="current-pwd" name="current_pwd" placeholder="原始密码" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="single-input-item">
                                                                        <label for="code" class="required">邮箱验证码</label>
                                                                        <input type="text" id="code" name="code" placeholder="邮箱验证码" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="single-input-item">
                                                                        <label for="new-pwd" class="required">新密码</label>
                                                                        <input type="password" id="new-pwd" name="new_pwd" placeholder="新密码" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="single-input-item">
                                                                        <label for="confirm-pwd" class="required">重复密码</label>
                                                                        <input type="password" id="confirm-pwd" placeholder="重复密码" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <div class="single-input-item">
                                                            <button class="btn btn__bg" onclick="updateUserInfo()">保存修改</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div> <!-- Single Tab Content End -->
                                    </div>
                                </div> <!-- My Account Tab Content End -->
                            </div>
                        </div> <!-- My Account Page End -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- my account wrapper end -->
</main>
<!-- main wrapper end -->

<!-- Start Footer Area Wrapper -->
<footer class="footer-wrapper">

    <!-- footer widget area start -->
    <div class="footer-widget-area">
        <div class="container">
            <div class="footer-widget-inner section-space">
                <div class="row mbn-30">
                    <!-- footer widget item start -->
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <div class="footer-widget-item mb-30">
                            <div class="footer-widget-title">
                                <h5>基本信息</h5>
                            </div>
                            <ul class="footer-widget-body accout-widget">
                                <li class="address">
                                    <em><i class="lnr lnr-map-marker"></i></em>德创智谷
                                </li>
                                <li class="email">
                                    <em><i class="lnr lnr-envelope"></i> 收件地址: </em>
                                    <a href="mailto:test@yourdomain.com">2680300117@gmail.com</a>
                                </li>
                                <li class="phone">
                                    <em><i class="lnr lnr-phone-handset"></i> 联系电话: </em>
                                    <a href="tel:(012)800456789-987">(012) 800 456 789-987</a>
                                </li>
                            </ul>
                            <div class="payment-method">
                                <img src="assets/img/payment-pic.png" alt="payment method">
                            </div>
                        </div>
                    </div>
                    <!-- footer widget item end -->

                    <!-- footer widget item start -->
                    <div class="col-lg-2 col-md-6 col-sm-4">
                        <div class="footer-widget-item mb-30">
                            <div class="footer-widget-title">
                                <h5>分类</h5>
                            </div>
                            <ul class="footer-widget-body">
                                <li><a href="#">电子商务</a></li>
                                <li><a href="#">购物</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- footer widget item end -->

                    <!-- footer widget item start -->
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="footer-widget-item mb-30">
                            <div class="footer-widget-title">
                                <h5>信息</h5>
                            </div>
                            <ul class="footer-widget-body">
                                <li><a href="#">主页</a></li>
                                <li><a href="#">关于我们</a></li>
                                <li><a href="#">联系我们</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- footer widget item end -->

                    <!-- footer widget item start -->
                    <div class="col-lg-2 offset-lg-1 col-md-6 col-sm-6">
                        <div class="footer-widget-item mb-30">
                            <div class="footer-widget-title">
                                <h5>快速通道</h5>
                            </div>
                            <ul class="footer-widget-body">
                                <li><a href="#">商城地址</a></li>
                                <li><a href="#">个人中心</a></li>
                                <li><a href="#">订单跟踪</a></li>
                                <li><a href="#">尺寸参考</a></li>
                                <li><a href="#">联系我们</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- footer widget item end -->
                </div>
            </div>
        </div>
    </div>
    <!-- footer widget area end -->

    <!-- footer bottom area start -->
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 order-2 order-md-1">
                    <div class="copyright-text">
                        <p>Copyright ©All Right Reserved.</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- footer bottom area end -->

</footer>
<!-- End Footer Area Wrapper -->

<!-- Quick view modal start -->
<div class="modal" id="quick_view">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <!-- product details inner end -->
                <div class="product-details-inner">
                    <div class="row">
                        <div class="col-lg-5 col-md-5">
                            <div class="product-large-slider">
                                <div class="pro-large-img">
                                    <img src="assets/img/product/product-details-img1.jpg" alt="product-details" />
                                </div>
                                <div class="pro-large-img">
                                    <img src="assets/img/product/product-details-img2.jpg" alt="product-details" />
                                </div>
                                <div class="pro-large-img">
                                    <img src="assets/img/product/product-details-img3.jpg" alt="product-details" />
                                </div>
                                <div class="pro-large-img">
                                    <img src="assets/img/product/product-details-img4.jpg" alt="product-details" />
                                </div>
                            </div>
                            <div class="pro-nav slick-row-10 slick-arrow-style">
                                <div class="pro-nav-thumb">
                                    <img src="assets/img/product/product-details-img1.jpg" alt="product-details" />
                                </div>
                                <div class="pro-nav-thumb">
                                    <img src="assets/img/product/product-details-img2.jpg" alt="product-details" />
                                </div>
                                <div class="pro-nav-thumb">
                                    <img src="assets/img/product/product-details-img3.jpg" alt="product-details" />
                                </div>
                                <div class="pro-nav-thumb">
                                    <img src="assets/img/product/product-details-img4.jpg" alt="product-details" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7">
                            <div class="product-details-des quick-details">
                                <h3 class="product-name">Orchid flower white stick</h3>
                                <div class="ratings d-flex">
                                    <span><i class="lnr lnr-star"></i></span>
                                    <span><i class="lnr lnr-star"></i></span>
                                    <span><i class="lnr lnr-star"></i></span>
                                    <span><i class="lnr lnr-star"></i></span>
                                    <span><i class="lnr lnr-star"></i></span>
                                    <div class="pro-review">
                                        <span>1 Reviews</span>
                                    </div>
                                </div>
                                <div class="price-box">
                                    <span class="price-regular">$70.00</span>
                                    <span class="price-old"><del>$90.00</del></span>
                                </div>
                                <h5 class="offer-text"><strong>Hurry up</strong>! offer ends in:</h5>
                                <div class="product-countdown" data-countdown="2019/08/25"></div>
                                <div class="availability">
                                    <i class="fa fa-check-circle"></i>
                                    <span>200 in stock</span>
                                </div>
                                <p class="pro-desc">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                    eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>
                                <div class="quantity-cart-box d-flex align-items-center">
                                    <h5>qty:</h5>
                                    <div class="quantity">
                                        <div class="pro-qty"><input type="text" value="1"></div>
                                    </div>
                                    <div class="action_link">
                                        <a class="btn btn-cart2" href="#">Add to cart</a>
                                    </div>
                                </div>
                                <div class="useful-links">
                                    <a href="#" data-toggle="tooltip" title="Compare"><i
                                            class="lnr lnr-sync"></i>compare</a>
                                    <a href="#" data-toggle="tooltip" title="Wishlist"><i
                                            class="lnr lnr-heart"></i>wishlist</a>
                                </div>
                                <div class="like-icon">
                                    <a class="facebook" href="#"><i class="fa fa-facebook"></i>like</a>
                                    <a class="twitter" href="#"><i class="fa fa-twitter"></i>tweet</a>
                                    <a class="pinterest" href="#"><i class="fa fa-pinterest"></i>save</a>
                                    <a class="google" href="#"><i class="fa fa-google-plus"></i>share</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- product details inner end -->
            </div>
        </div>
    </div>
</div>
<!-- Quick view modal end -->

<!-- Scroll to top start -->
<div class="scroll-top not-visible">
    <i class="fa fa-angle-up"></i>
</div>
<!-- Scroll to Top End -->

<!--添加地址的模态框-->
<div class="modal fade" style="width: 500px;margin: 100px 0 0 500px" id="addAddr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form action="user_addAddress.action" onsubmit="return false" method="post" id="addrForm">
                    <div class="form-group">
                        <input type="text" class="form-control" id="receiver_name" name="userAddr.receiver_name" placeholder="收件人">
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" id="receiver_tel" name="userAddr.receiver_tel" placeholder="电话号码">
                    </div>
                    <div id="selects" class="form-group" style="display: flex">
                        <select class="form-control" style="width: 120px" id="pro" name="userAddr.pro" onchange="getChilren(this)">
                            <option disabled selected>省份/自治区</option>
                        </select>
                        <select class="form-control" style="width: 120px" id="city" name="userAddr.city" onchange="getChilren(this)">
                            <option disabled selected>城市/地区</option>
                        </select>
                        <select class="form-control" style="width: 120px" id="area" name="userAddr.area" onchange="getChilren(this)">
                            <option disabled selected>区/县</option>
                        </select>
                        <select class="form-control" style="width: 120px" id="street" name="userAddr.street">
                            <option disabled selected>配送区域</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <textarea class="form-control" rows="3" id="receiver_addr" name="userAddr.receiver_addr" placeholder="详细地址"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="zip" name="userAddr.zip" placeholder="邮政编码">
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="exit">取消</button>
                        <button type="button" data-dismiss="modal" class="save" onclick="subAddress(${sessionScope.onliner.user_id})">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--修改地址模态框--%>
<div class="modal fade" style="width: 500px;margin: 100px 0 0 500px" id="updaterAddr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form action="user_addAddress.action" onsubmit="return false" method="post" id="updateForm">
                    <div class="form-group">
                        <input type="hidden" id="up_user_addr_id" name="userAddr.user_addr_id" value="">
                        <input type="text" class="form-control" id="up_receiver_name" name="userAddr.receiver_name" placeholder="收件人">
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" id="up_receiver_tel" name="userAddr.receiver_tel" placeholder="电话号码">
                    </div>
                    <div id="up_selects" class="form-group" style="display: flex">
                        <select class="form-control" style="width: 120px" id="up_pro" name="userAddr.pro" onchange="getChilren(this)">
                            <option disabled selected>省份/自治区</option>
                        </select>
                        <select class="form-control" style="width: 120px"  name="userAddr.city" onchange="getChilren(this)">
                            <option disabled selected>城市/地区</option>
                        </select>
                        <select class="form-control" style="width: 120px" name="userAddr.area" onchange="getChilren(this)">
                            <option disabled selected>区/县</option>
                        </select>
                        <select class="form-control" style="width: 120px" name="userAddr.street">
                            <option disabled selected>配送区域</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <textarea class="form-control" rows="3" id="up_receiver_addr" name="userAddr.receiver_addr" placeholder="详细地址"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="up_zip" name="userAddr.zip" placeholder="邮政编码">
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="exit">取消</button>
                        <button type="button" data-dismiss="modal" class="save" onclick="editAddress(${sessionScope.onliner.user_id})">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- All vendor & plugins & active js include here -->
<!--All Vendor Js -->
<script src="assets/js/vendor.js"></script>
<!-- Active Js -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/active.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.form.min.js"></script>
<script>
    var userId = <%=onliner.getUser_id()%>;

    //查询当前登录用户的个人详细信息
    function getUserInfo(){
        $.get("user_getUserInfo.action",function (data,status) {
            $("#name").val(data.name);
            $("#userInfo_id").val(data.userInfo_id);
            $("#show").attr("src",data.headAddr);
            $("#email").val(data.email);
            $("#sex").find("option[value="+data.sex+"]").attr("selected","selected");
            $("#head").val(data.head);
        });
    }

    //添加地址表单提交
    function subAddress(user_id) {
        $.post("user_addAddress.action",$("#addrForm").serialize(),function (data,status) {
            if (data.status == 200){
                getAddress(user_id);
            }else {
                alert(data.msg);
            }
        });
    };

    //修改用户个人信息
    function updateUserInfo() {
        var $current_pwd = $("#current-pwd").val();

        var options = {
            url: "user_updateUserInfo.action", //提交地址：默认是form的action,如果申明,则会覆盖
            type: "post",   //默认是form的method（get or post），如果申明，则会覆盖
            //success: getUserInfo(),  //提交成功后的回调函数
            dataType: "json" //html(默认), xml, script, json...接受服务端返回的类型
        };

        if ($current_pwd != ""){
            if ($("#new-pwd").val().trim() == "" || $("#confirm-pwd").val().trim() == ""){
                alert("新密码不能为空！");
                return;
            }
            if ($("#new-pwd").val().trim() != $("#confirm-pwd").val().trim()){
                alert("两次输入的密码不一致,请重新输入!");
                return;
            }
        }

        $("#updateUserInfoForm").ajaxSubmit(options);

    }

    //删除地址
    function removeAddr(user_addr_id) {
        $.post("user_removeAddr.action",{user_addr_id:user_addr_id},function (data,status) {
            if (data.status == 200){
                getAddress(userId);
            }else {
                alert(data.msg);
            }
        })
    };

    //编辑地址
    function getAddrById(user_addr_id) {
        $.get("user_getAddrById.action",{user_addr_id:user_addr_id},function (data,status) {
            $("#up_user_addr_id").val(data.user_addr_id);
            $("#up_receiver_name").val(data.receiver_name);
            $("#up_receiver_tel").val(data.receiver_tel);
            var addrs = data.receiver_addr.split(",");
            $("#up_receiver_addr").val(addrs[addrs.length-1]);
            $("#up_zip").val(data.zip);
        })
    }

    //修改地址表单提交
    function editAddress(user_id) {
        $.post("user_updateAddress.action",$("#updateForm").serialize(),function (data,status) {
            if (data.status == 200){
                getAddress(user_id);
            }else {
                alert(data.msg);
            }
        });
    };

    //js上传图片预览
    function changepic(obj){
        //console.log(obj.files[0]);//这里可以获取上传文件的name
        var newsrc = getObjectURL(obj.files[0]);
        document.getElementById('show').src=newsrc;
    }
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }

    /**
     * 查询地址
     */
    function getAddress(user_id){
        $.post("user_getAddress.action",{user_id:user_id},function (data,status) {
            $("#addr-container").empty();
            $.each(data,function (index,item) {
                var addr = "<div class=\"address_card\">\n" +
                    "<address>\n" +
                    "<p><strong>"+item.receiver_name+"</strong></p>\n" +
                    "<p>"+item.receiver_addr+"</p>\n" +
                    "<p>电话: "+item.receiver_tel+"</p>\n" +
                    "</address>\n" +
                    "<a href='javascript:void(0)' data-toggle='modal' data-target='#updaterAddr' onclick='getAddrById("+item.user_addr_id+")' class=\"btn btn__bg\"><i class=\"fa fa-edit\"></i>\n" +
                    "修改地址</a>\n" +
                    "<a href='javascript:void(0)' onclick='removeAddr("+item.user_addr_id+")' class=\"btn btn__bg\"><i class=\"fa fa-trash\"></i>\n" +
                    "移除地址</a>\n" +
                    "</div>";
                $("#addr-container").append(addr);
            })
        });
    }

    /**
     * ajax加载省市联动
     */
    $(function () {
        $.get("user_getArea.action",{parent_id:0},function (data,status) {
            $.each(data,function (index,item) {
                $('#pro').append("<option value='"+item.address_id+"'>"+item.area_name+"</option>");
                $('#up_pro').append("<option value='"+item.address_id+"'>"+item.area_name+"</option>");
            })
        });
    });

    //获取下一级区域菜单
    function getChilren(obj) {
        var vs = $(obj).children("option:selected").val();
        $.post("user_getArea.action",{parent_id:vs},function (data,status) {
            console.log(data);
            $(obj).nextAll().empty();
            $.each(data,function (index,item) {
                $(obj).next().append("<option value='"+item.address_id+"'>"+item.area_name+"</option>");
            })
        })
    }
</script>
</body>
</html>