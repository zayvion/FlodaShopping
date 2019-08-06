<%--
  User: dc
  Date: 2019/8/5
  Time: 16:24
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><base href="<%=basePath%>">
<head>
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
                                    <li>
                                        <a href="#" class="offcanvas-btn">
                                            <i class="lnr lnr-magnifier"></i>
                                        </a>
                                    </li>
                                    <li class="user-hover">
                                        <a href="#">
                                            <i class="lnr lnr-user"></i>
                                        </a>
                                        <ul class="dropdown-list">
                                            <li><a href="login-register.html">登录</a></li>
                                            <li><a href="login-register.html">注册</a></li>
                                            <li><a href="my-account.html">个人中心</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="wishlist.html">
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

<!-- main wrapper start -->
<main>
    <!-- breadcrumb area start -->
    <div class="breadcrumb-area common-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <h1>购物车</h1>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">购物车</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <!-- cart main wrapper start -->
    <div class="cart-main-wrapper section-space pb-0">
        <div class="container">
            <div class="section-bg-color">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Cart Table Area -->
                        <div class="cart-table table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th class="pro-thumbnail">商品展示</th>
                                    <th class="pro-title">产品名称</th>
                                    <th class="pro-price">价格</th>
                                    <th class="pro-quantity">数量</th>
                                    <th class="pro-subtotal">结算</th>
                                    <th class="pro-remove">移除</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product/product-1.jpg" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="#">产品名称</a></td>
                                    <td class="pro-price"><span>￥295.00</span></td>
                                    <td class="pro-quantity">
                                        <div class="pro-qty"><input type="text" value="1"></div>
                                    </td>
                                    <td class="pro-subtotal"><span>￥295.00</span></td>
                                    <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                                <tr>
                                    <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product/product-2.jpg" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="#">产品名称</a></td>
                                    <td class="pro-price"><span>￥275.00</span></td>
                                    <td class="pro-quantity">
                                        <div class="pro-qty"><input type="text" value="2"></div>
                                    </td>
                                    <td class="pro-subtotal"><span>￥550.00</span></td>
                                    <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                                <tr>
                                    <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product/product-3.jpg" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="#">产品名称</a></td>
                                    <td class="pro-price"><span>￥295.00</span></td>
                                    <td class="pro-quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1" />
                                        </div>
                                    </td>
                                    <td class="pro-subtotal"><span>￥295.00</span></td>
                                    <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                                <tr>
                                    <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product/product-4.jpg" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="#">产品名称</a></td>
                                    <td class="pro-price"><span>￥110.00</span></td>
                                    <td class="pro-quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="3" />
                                        </div>
                                    </td>
                                    <td class="pro-subtotal"><span>￥110.00</span></td>
                                    <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- Cart Update Option -->
                        <div class="cart-update-option d-block d-md-flex justify-content-between">
                            <div class="cart-update">
                                <a href="#" class="btn btn__bg">更新购物车</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 ml-auto">
                        <!-- Cart Calculation Area -->
                        <div class="cart-calculator-wrapper">
                            <div class="cart-calculate-items">
                                <h3>购物车结算</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                            <td>总金额</td>
                                            <td>￥230</td>
                                        </tr>
                                        <tr>
                                            <td>运费</td>
                                            <td>￥70</td>
                                        </tr>
                                        <tr class="total">
                                            <td>结算金额</td>
                                            <td class="total-amount">￥300</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <a href="checkout.html" class="btn btn__bg d-block">去结算</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- cart main wrapper end -->
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

<!-- offcanvas mini cart start -->
<div class="offcanvas-minicart-wrapper">
    <div class="minicart-inner">
        <div class="offcanvas-overlay"></div>
        <div class="minicart-inner-content">
            <div class="minicart-close">
                <i class="lnr lnr-cross"></i>
            </div>
            <div class="minicart-content-box">
                <div class="minicart-item-wrapper">
                    <ul>
                        <li class="minicart-item">
                            <div class="minicart-thumb">
                                <a href="product-details.html">
                                    <img src="assets/img/cart/cart-1.jpg" alt="product">
                                </a>
                            </div>
                            <div class="minicart-content">
                                <h3 class="product-name">
                                    <a href="product-details.html">商品名称</a>
                                </h3>
                                <p>
                                    <span class="cart-quantity">1 <strong>&times;</strong></span>
                                    <span class="cart-price">￥100.00</span>
                                </p>
                            </div>
                            <button class="minicart-remove"><i class="lnr lnr-cross"></i></button>
                        </li>
                        <li class="minicart-item">
                            <div class="minicart-thumb">
                                <a href="product-details.html">
                                    <img src="assets/img/cart/cart-2.jpg" alt="product">
                                </a>
                            </div>
                            <div class="minicart-content">
                                <h3 class="product-name">
                                    <a href="product-details.html">商品名称</a>
                                </h3>
                                <p>
                                    <span class="cart-quantity">1 <strong>&times;</strong></span>
                                    <span class="cart-price">￥80.00</span>
                                </p>
                            </div>
                            <button class="minicart-remove"><i class="lnr lnr-cross"></i></button>
                        </li>
                    </ul>
                </div>

                <div class="minicart-pricing-box">
                    <ul>
                        <li>
                            <span>总金额</span>
                            <span><strong>￥300.00</strong></span>
                        </li>
                        <li>
                            <span>折扣 </span>
                            <span><strong>￥10.00</strong></span>
                        </li>
                        <li class="total">
                            <span>结算金额</span>
                            <span><strong>￥370.00</strong></span>
                        </li>
                    </ul>
                </div>

                <div class="minicart-button">
                    <a href="cart.html"><i class="fa fa-shopping-cart"></i> 查看购物车</a>
                    <a href="cart.html"><i class="fa fa-share"></i> 去结算</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- offcanvas mini cart end -->

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