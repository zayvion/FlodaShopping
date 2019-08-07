<%--
  User: dc
  Date: 2019/8/5
  Time: 16:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
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
                                            <c:if test="${sessionScope.onliner.username == ''}">
                                                <li><a href="login.jsp">登录</a></li>
                                                <li><a href="register.jsp">注册</a></li>
                                            </c:if>
                                            <c:if test="${sessionScope.onliner.username != ''}">
                                                <li><a href="my_account.jsp">${sessionScope.onliner.username}</a></li>
                                                <li><a href="user_exit.action">退出</a></li>
                                            </c:if>
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

<!-- off-canvas menu start -->
<aside class="off-canvas-wrapper">
    <div class="off-canvas-overlay"></div>
    <div class="off-canvas-inner-content">
        <div class="btn-close-off-canvas">
            <i class="lnr lnr-cross"></i>
        </div>

        <div class="off-canvas-inner">
            <!-- search box start -->
            <div class="search-box-offcanvas">
                <form>
                    <input type="text" placeholder="Search Here...">
                    <button class="search-btn"><i class="lnr lnr-magnifier"></i></button>
                </form>
            </div>
            <!-- search box end -->

        </div>
    </div>
</aside>
<!-- off-canvas menu end -->



<!-- main wrapper start -->
<main>
    <!-- slider area start -->
    <section class="slider-area">
        <div class="hero-slider-active slick-arrow-style slick-arrow-style_hero slick-dot-style">
            <!-- single slider item start -->
            <div class="hero-single-slide ">
                <div class="hero-slider-item bg-img" data-bg="assets/img/slider/home1-slide1.jpg">
                </div>
            </div>
            <!-- single slider item end -->

            <!-- single slider item start -->
            <div class="hero-single-slide">
                <div class="hero-slider-item bg-img" data-bg="assets/img/slider/home1-slide2.jpg">
                </div>
            </div>
            <!-- single slider item start -->
        </div>
    </section>
    <!-- slider area end -->

    <!-- banner statistics start -->
    <section class="banner-statistics section-space" style="margin-top: -350px">
        <div class="container">
            <div class="row mbn-30">
                <!-- start store item -->
                <div class="col-md-4">
                    <div class="banner-item mb-30">
                        <figure class="banner-thumb">
                            <a href="#">
                                <img src="assets/img/banner/img1-top-floda1.jpg" alt="">
                            </a>
                            <figcaption class="banner-content">
                                <h2 class="text1">商品分类(英文)</h2>
                                <h2 class="text2">商品分类(中文)</h2>
                                <a class="store-link" href="#">购买</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- start store item -->

                <!-- start store item -->
                <div class="col-md-4">
                    <div class="banner-item mb-30">
                        <figure class="banner-thumb">
                            <a href="#">
                                <img src="assets/img/banner/img1-top-floda2.jpg" alt="">
                            </a>
                            <figcaption class="banner-content">
                                <h2 class="text1">商品分类(英文)</h2>
                                <h2 class="text2">商品分类(中文)</h2>
                                <a class="store-link" href="#">购买</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- start store item -->

                <!-- start store item -->
                <div class="col-md-4">
                    <div class="banner-item mb-30">
                        <figure class="banner-thumb">
                            <a href="#">
                                <img src="assets/img/banner/img1-top-floda3.jpg" alt="">
                            </a>
                            <figcaption class="banner-content">
                                <h2 class="text1">商品分类(英文)</h2>
                                <h2 class="text2">商品分类(中文)</h2>
                                <a class="store-link" href="#">购买</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                <!-- start store item -->
            </div>
        </div>
    </section>
    <!-- banner statistics end -->

    <!-- our product area start -->
    <section class="our-product section-space">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title text-center">
                        <h2>新品上线</h2>
                    </div>
                </div>
            </div>
            <div class="row mtn-40">
                <div id="new_Produt" class='row mtn-40'>

                    </div>

                </div>
                <div class="col-12">
                    <div class="view-more-btn">
                        <a class="btn-hero btn-load-more" href="shop.jsp">查看更多商品 ></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- our product area end -->

    <!-- trending product area start -->
    <section class="top-sellers section-space">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title text-center">
                        <h2>热门商品</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-carousel--4 slick-row-15 slick-sm-row-10 slick-arrow-style">
                        <!-- product single item start -->
                        <div class="product-item">
                            <figure class="product-thumb">
                                <a href="product-details.html">
                                    <img class="pri-img" src="assets/img/product/product-9.jpg" alt="product">
                                    <img class="sec-img" src="assets/img/product/product-6.jpg" alt="product">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new">
                                        <span>新品</span>
                                    </div>
                                </div>
                                <div class="button-group">
                                    <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="添加收藏"><i class="lnr lnr-heart"></i></a>
                                    <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="快速预览"><i class="lnr lnr-magnifier"></i></span></a>
                                    <a href="cart.html" data-toggle="tooltip" data-placement="left" title="添加购物车"><i class="lnr lnr-cart"></i></a>
                                </div>
                            </figure>
                            <div class="product-caption">
                                <p class="product-name">
                                    <a href="product-details.html">商品名称</a>
                                </p>
                                <div class="price-box">
                                    <span class="price-regular">￥60.00</span>
                                    <span class="price-old"><del>￥70.00</del></span>
                                </div>
                            </div>
                        </div>
                        <!-- product single item end -->

                        <!-- product single item start -->
                        <div class="product-item">
                            <figure class="product-thumb">
                                <a href="product-details.html">
                                    <img class="pri-img" src="assets/img/product/product-10.jpg" alt="product">
                                    <img class="sec-img" src="assets/img/product/product-1.jpg" alt="product">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new">
                                        <span>新品</span>
                                    </div>
                                    <div class="product-label discount">
                                        <span>10%</span>
                                    </div>
                                </div>
                                <div class="button-group">
                                    <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="添加收藏"><i class="lnr lnr-heart"></i></a>
                                    <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="快速预览"><i class="lnr lnr-magnifier"></i></span></a>
                                    <a href="cart.html" data-toggle="tooltip" data-placement="left" title="添加购物车"><i class="lnr lnr-cart"></i></a>
                                </div>
                            </figure>
                            <div class="product-caption">
                                <p class="product-name">
                                    <a href="product-details.html">商品名称</a>
                                </p>
                                <div class="price-box">
                                    <span class="price-regular">￥60.00</span>
                                    <span class="price-old"><del>￥70.00</del></span>
                                </div>
                            </div>
                        </div>
                        <!-- product single item end -->

                        <!-- product single item start -->
                        <div class="product-item">
                            <figure class="product-thumb">
                                <a href="product-details.html">
                                    <img class="pri-img" src="assets/img/product/product-11.jpg" alt="product">
                                    <img class="sec-img" src="assets/img/product/product-8.jpg" alt="product">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new">
                                        <span>新品</span>
                                    </div>
                                    <div class="product-label discount">
                                        <span>15%</span>
                                    </div>
                                </div>
                                <div class="button-group">
                                    <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="添加收藏"><i class="lnr lnr-heart"></i></a>
                                    <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="快速预览"><i class="lnr lnr-magnifier"></i></span></a>
                                    <a href="cart.html" data-toggle="tooltip" data-placement="left" title="添加购物车"><i class="lnr lnr-cart"></i></a>
                                </div>
                            </figure>
                            <div class="product-caption">
                                <p class="product-name">
                                    <a href="product-details.html">商品名称</a>
                                </p>
                                <div class="price-box">
                                    <span class="price-regular">￥60.00</span>
                                    <span class="price-old"><del>￥70.00</del></span>
                                </div>
                            </div>
                        </div>
                        <!-- product single item end -->

                        <!-- product single item start -->
                        <div class="product-item">
                            <figure class="product-thumb">
                                <a href="product-details.html">
                                    <img class="pri-img" src="assets/img/product/product-12.jpg" alt="product">
                                    <img class="sec-img" src="assets/img/product/product-2.jpg" alt="product">
                                </a>
                                <div class="product-badge">
                                    <div class="product-label new">
                                        <span>新品</span>
                                    </div>
                                    <div class="product-label discount">
                                        <span>10%</span>
                                    </div>
                                </div>
                                <div class="button-group">
                                    <a href="wishlist.html" data-toggle="tooltip" data-placement="left" title="添加收藏"><i class="lnr lnr-heart"></i></a>
                                    <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="快速预览"><i class="lnr lnr-magnifier"></i></span></a>
                                    <a href="cart.html" data-toggle="tooltip" data-placement="left" title="添加购物车"><i class="lnr lnr-cart"></i></a>
                                </div>
                            </figure>
                            <div class="product-caption">
                                <p class="product-name">
                                    <a href="product-details.html">商品名称</a>
                                </p>
                                <div class="price-box">
                                    <span class="price-regular">￥60.00</span>
                                    <span class="price-old"><del>￥70.00</del></span>
                                </div>
                            </div>
                        </div>
                        <!-- product single item end -->

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- trending product area end -->
    <!-- service policy start -->
    <section class="service-policy-area section-space p-0">
        <div class="container">
            <div class="row" style="margin-left: 50px">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <!-- start policy single item -->
                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="assets/img/icon/free_shipping.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>免费送货</h5>
                            <p>所有订单免费送货</p>
                        </div>
                    </div>
                    <!-- end policy single item -->
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <!-- start policy single item -->
                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="assets/img/icon/support247.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>在线服务 24/7</h5>
                            <p>全天在线服务</p>
                        </div>
                    </div>
                    <!-- end policy single item -->
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <!-- start policy single item -->
                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="assets/img/icon/money_back.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>无理由退货</h5>
                            <p>30天无理由退货</p>
                        </div>
                    </div>
                    <!-- end policy single item -->
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <!-- start policy single item -->
                    <div class="service-policy-item">
                        <div class="icons">
                            <img src="assets/img/icon/promotions.png" alt="">
                        </div>
                        <div class="policy-terms">
                            <h5>订单折扣</h5>
                            <p>每笔订单折扣</p>
                        </div>
                    </div>
                    <!-- end policy single item -->
                </div>
            </div>
        </div>
    </section>
    <!-- service policy end -->



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
                                    <img id="modal_img" src="assets/img/product/product-details-img1.jpg"height="400px" width="400px" alt="product-details" />
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-7 col-md-7">
                            <div class="product-details-des quick-details">
                                <h3 class="product-name" id="model_pro_name">商品名称</h3>

                                <div class="price-box">
                                    <span class="price-regular" id="model_pro_price">￥70.00</span>
                                </div>
                                <p class="pro-desc"id="model_pro_desc">商品描述</p>
                                <div class="quantity-cart-box d-flex align-items-center">
                                    <h5>数量:</h5>
                                    <div class="quantity">
                                        <div class="pro-qty"><input type="text" value="1"></div>
                                    </div>
                                    <div class="action_link">
                                        <a class="btn btn-cart2" href="#">添加至购物车</a>
                                    </div>
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

<!-- offcanvas search form start -->
<div class="offcanvas-search-wrapper">
    <div class="offcanvas-search-inner">
        <div class="offcanvas-close">
            <i class="lnr lnr-cross"></i>
        </div>
        <div class="container">
            <div class="offcanvas-search-box">
                <form class="d-flex bdr-bottom w-100">
                    <input type="text" placeholder="搜索商品">
                    <button class="search-btn"><i class="lnr lnr-magnifier"></i>搜索</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- offcanvas search form end -->

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
                                    <img  src="assets/img/cart/cart-1.jpg" alt="product">
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
                    <a href="cart.jsp"><i class="fa fa-shopping-cart"></i> 查看购物车</a>
                    <a href="cart.jsp"><i class="fa fa-share"></i> 去结算</a>
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
<script>
    $(function () {
        $.ajax({
            url:" http://localhost:8081/getProducts",
            type:"post",
            data: {"startPage": 1, "item": 8},
            success:function (result) {
                console.log(result)
                $.each(result.data,function (index,item) {
                    $("#new_Produt").append(" <div class='col-lg-3 col-md-4 col-sm-6'>\n" +
                        "                        <div class='product-item mt-40'\">\n" +
                        "                            <figure class='product-thumb'>\n" +
                        "                                <a href='productDetail?id="+result.pro_id+"'>\n" +
                        "                                    <img height='270px' width='270px' class='pri-img' src='"+item.pro_imgUrl+"'>\<n></n>" +
                        "                                     <img class='sec-img'height='270px' width='270px'  src='"+item.pro_imgUrl+"' alt='product'>"+
                        "                                </a>\n" +
                        "                                <div class='product-badge'>\n" +
                        "                                    <div class='product-label new'>\n" +
                        "                                        <span>新品</span>\n" +
                        "                                    </div>\n" +
                        "                                </div>\n" +
                        "                                <div class='button-group'>\n" +
                        "                                    <a href='addWish?id="+item.pro_id+"' data-toggle='tooltip' data-placement='left' title='添加收藏'><i class='lnr lnr-heart' ></i></a>\n" +
                        "                                    <a href='#'onclick='getProduct("+item.pro_id+")' data-toggle='modal' data-target='#quick_view'><span data-toggle='\"tooltip' data-placement='left' title='快速预览'><i class='lnr lnr-magnifier'></i></span></a>\n" +
                        "                                    <a href='addCart?id="+item.pro_id+"' data-toggle='tooltip' data-placement='left' title='添加购物车'><i class='lnr lnr-cart'></i></a>\n" +
                        "                                </div>\n" +
                        "                            </figure>\n" +
                        "                            <div class='product-caption'>\n" +
                        "                                <p class='product-name'>\n" +
                        "                                    <a href='productDetail?id="+result.pro_id+"'"+item.pro_name+"</a>\n" +
                        "                                </p>\n" +
                        "                                <div class='price-box'>\n" +
                        "                                    <span class='pro-title'>"+item.pro_name+"</span>\n" +
                        "                                    <span class='price-regular'>￥70.00</span>\n" +
                        "                                </div>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>")
                })
            },
            error:function (e) {

            }
        })

    });
    function getProduct(id) {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "http://localhost:8081/getProduct?id="+id,

            //请求成功
            success: function (result) {
                console.log(result)
                getImg(result.pro_imgId);
                $("#model_pro_name").empty();
                $("#model_pro_price").empty();
                $("#model_pro_desc").empty();
                $("#model_pro_name").append(result.pro_name);
                $("#model_pro_price").append("¥"+result.pro_price);
                $("#model_pro_desc").append(result.pro_desc);
            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }
    function getImg(id) {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "http://localhost:8081/getImgUrl?id="+id,

            //请求成功
            success: function (result) {
                $("#modal_img").attr("src",result);
                return result
            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }
</script>
</body>
</html>