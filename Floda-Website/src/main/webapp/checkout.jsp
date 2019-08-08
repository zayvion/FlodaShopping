<%--
  User: dc
  Date: 2019/8/5
  Time: 16:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .fr{
            text-decoration: underline;
            font-size: 12px;
            float: right;
            outline: none;
            color: #262626;
            line-height: 30px;
        }
        .addre.on {
            border: 2px solid #C10000;
        }

        .addre {
            width: 315px;
            margin: 20px 20px 20px 0px;
            border: 2px solid #dbdbdb;
            cursor: pointer;
            font-size: 12px;
            float: left;
        }
        .fl {
            float: left;
        }
        .addre .tit {
            height: 45px;
            line-height: 45px;
            padding: 0 10px;
            border-bottom: 1px solid #dbdbdb;
        }
        .addre .addCon {
            padding: 0 10px;
            background: #f5f5f5;
        }
        .addre .addCon p {
            line-height: 50px;
        }
        .addre .tit .fr a,span{
            text-decoration: none;
            font-size: 12px;
            float: right;
            outline: none;
            color: #262626;
            line-height: 45px;
        }
        .order-summary-details a{
            text-decoration: underline;
            font-size: 12px;
            outline: none;
            color: #262626;
            line-height: 30px;
        }
        .addre .tit .fr span{
            padding-left: 10px;
            padding-right: 10px;
        }
        .checkout-billing-details-wrap img{
            float: left;
            border: 2px solid #dbdbdb;
            margin: 0px 20px 30px 0;
            cursor: pointer;
        }
        .checkout-billing-details-wrap img.on {
            border: 2px solid #C10000;
        }
        .checkout-billing-details-wrap.shipping span{
            width: 136px;
            height: 38px;
            text-align: center;
            line-height: 38px;
            float: left;
            border: 2px solid #dbdbdb;
            margin: 0px 20px 30px 0;
            cursor: pointer;
        }
        .checkout-billing-details-wrap.shipping span.on{
            border: 2px solid #C10000;
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
                            <a href="index.html">
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
                                                    <li><a href="my_account.jsp">${sessionScope.onliner.username}</a></li>
                                                    <li><a href="user_exit.action">退出</a></li>
                                                </c:when>
                                            </c:choose>
                                        </ul>
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

    <!-- mobile header start -->
    <div class="mobile-header d-lg-none d-md-block sticky">
        <!--mobile header top start -->
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="mobile-main-header">
                        <div class="mobile-logo">
                            <a href="index.html">
                                <img src="assets/img/logo/logo.png" alt="Brand Logo">
                            </a>
                        </div>
                        <div class="mobile-menu-toggler">
                            <div class="mini-cart-wrap">
                                <a href="cart.html">
                                    <i class="lnr lnr-cart"></i>
                                </a>
                            </div>
                            <div class="mobile-menu-btn">
                                <div class="off-canvas-btn">
                                    <i class="lnr lnr-menu"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- mobile header top start -->
    </div>
    <!-- mobile header end -->
</header>
<!-- end Header Area -->

<!-- off-canvas menu start -->
<aside class="off-canvas-wrapper">
    <div class="off-canvas-overlay"></div>
    <div class="off-canvas-inner-content">
        <div class="btn-close-off-canvas">
            <i class="lnr lnr-cross"></i>
        </div>
    </div>
</aside>
<!-- off-canvas menu end -->



<!-- main wrapper start -->
<main>
    <!-- breadcrumb area start -->
    <div class="breadcrumb-area common-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <h1>订单结算</h1>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">订单结算</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <!-- checkout main wrapper start -->
    <div class="checkout-page-wrapper section-space pb-0">
        <div class="container">
            <div class="row">
                <!-- Checkout Billing Details -->
                <div class="col-lg-7">
                    <div class="checkout-billing-details-wrap">
                        <h2>收件信息<a href="#" class="fr">新增地址</a></h2>
                        <div class="addre fl on">
                            <div class="tit clearfix">
                                <p class="fl">张三1
                                    <span class="default">[默认地址]</span>
                                </p>
                                <p class="fr">
                                    <a href="#">删除</a>
                                    <span>|</span>
                                    <a href="#" class="edit">编辑</a>
                                </p>
                            </div>
                            <div class="addCon">
                                <p>河北省&nbsp;唐山市&nbsp;路北区&nbsp;大学生公寓村</p>
                                <p>15732570937</p>
                            </div>
                        </div>
                        <div class="addre fl">
                            <div class="tit clearfix">
                                <p class="fl">张三1
                                    <span class="default"></span>
                                </p>
                                <p class="fr">
                                    <a href="#">删除</a>
                                    <span>|</span>
                                    <a href="#" class="edit">编辑</a>
                                </p>
                            </div>
                            <div class="addCon">
                                <p>河北省&nbsp;唐山市&nbsp;路北区&nbsp;大学生公寓村</p>
                                <p>15732570937</p>
                            </div>
                        </div>
                        <div class="addre fl">
                            <div class="tit clearfix">
                                <p class="fl">张三1
                                    <span class="default"></span>
                                </p>
                                <p class="fr">
                                    <a href="#">删除</a>
                                    <span>|</span>
                                    <a href="#" class="edit">编辑</a>
                                </p>
                            </div>
                            <div class="addCon">
                                <p>河北省&nbsp;唐山市&nbsp;路北区&nbsp;大学生公寓村</p>
                                <p>15732570937</p>
                            </div>
                        </div>
                        <div class="addre fl">
                            <div class="tit clearfix">
                                <p class="fl">张三1
                                    <span class="default"></span>
                                </p>
                                <p class="fr">
                                    <a href="#">删除</a>
                                    <span>|</span>
                                    <a href="#" class="edit">编辑</a>
                                </p>
                            </div>
                            <div class="addCon">
                                <p>河北省&nbsp;唐山市&nbsp;路北区&nbsp;大学生公寓村</p>
                                <p>15732570937</p>
                            </div>
                        </div>
                    </div>
                    <div class="checkout-billing-details-wrap">
                        <h2>支付方式</h2>
                        <img class="on" src="assets/img/way/way01.jpg">
                        <img src="assets/img/way/way04.jpg">
                    </div>
                    <div class="checkout-billing-details-wrap shipping" style="margin-top: 102px">
                        <h2>快递信息</h2>
                        <span class="on">顺风快递</span>
                        <span>百世汇通</span>
                        <span>圆通快递</span>
                        <span>中通快递</span>
                    </div>
                </div>

                <!-- Order Summary Details -->
                <div class="col-lg-5">
                    <div class="order-summary-details">
                        <h2>订单内容<a href="#" class="fr">返回购物车</a></h2>
                        <div class="order-summary-content">
                            <!-- Order Summary Table -->
                            <div class="order-summary-table table-responsive text-center">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>金额</strong></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><a href="product-details.html">商品名称 <strong> × 1</strong></a>
                                        </td>
                                        <td>￥165.00</td>
                                    </tr>
                                    <tr>
                                        <td><a href="product-details.html">商品名称 <strong> × 4</strong></a>
                                        </td>
                                        <td>￥165.00</td>
                                    </tr>
                                    <tr>
                                        <td><a href="product-details.html">商品名称 <strong> × 2</strong></a>
                                        </td>
                                        <td>￥165.00</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td>商品金额</td>
                                        <td>￥400</td>
                                    </tr>
                                    <tr>
                                        <td>优惠金额</td>
                                        <td>￥50</td>
                                    </tr>
                                    <tr>
                                        <td>运费</td>
                                        <td>免运费</td>
                                    </tr>
                                    <tr>
                                        <td>合计</td>
                                        <td style="color: #c10000;font-weight: bold;font-size: 22px">￥350</td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- Order Payment Method -->
                            <div class="order-payment-method">
                                <div class="summary-footer-area">
                                    <button type="submit" class="btn btn__bg" style="width: 100%">去支付</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- checkout main wrapper end -->
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
<script src="assets/js/jquery.min.js"></script>
<script>
    $(function () {
        $(".addre").click(function () {
            var $addr = $(".addre");
            for (var i = 0;i < $addr.length;i ++){
                $addr.eq(i).removeClass('on');
            }
            $(this).toggleClass('on');
        });

        $(".checkout-billing-details-wrap img").click(function () {
            var $addr = $(".checkout-billing-details-wrap img");
            for (var i = 0;i < $addr.length;i ++){
                $addr.eq(i).removeClass('on');
            }
            $(this).toggleClass('on');
        });

        $(".checkout-billing-details-wrap.shipping span").click(function () {
            var $addr = $(".checkout-billing-details-wrap.shipping span");
            for (var i = 0;i < $addr.length;i ++){
                $addr.eq(i).removeClass('on');
            }
            $(this).toggleClass('on');
        });
    })
</script>
</body>
</html>