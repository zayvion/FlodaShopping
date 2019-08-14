<%--
  User: dc
  Date: 2019/8/5
  Time: 16:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <title>搜索-Floda</title>

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
        .button-group a{
            padding-top: 11px;
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
                            <!-- main menu navbar start -->
                            <nav class="desktop-menu"  style="height: 100px">

                            </nav>
                            <!-- main menu navbar end -->
                        </div>
                    </div>
                    <!-- main menu area end -->

                    <!-- mini cart area start -->
                    <div class="col-lg-3">
                        <div class="header-configure-wrapper">
                            <div class="header-configure-area">
                                <ul class="nav justify-content-end">
                                    <li class="user-hover">
                                        <a href="javascript:void(0)">
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
                                        <a href="wishlist.jsp" id="wish"></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" class="minicart-btn" id="superscript" onclick="getCartInfos()"></a>
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
                            <a href="index.jsp">
                                <img src="assets/img/logo/logo.png" alt="Brand Logo">
                            </a>
                        </div>
                        <div class="mobile-menu-toggler">
                            <div class="mini-cart-wrap">
                                <a href="cart.jsp">
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
                            <h1>购物</h1>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">购物</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <!-- page main wrapper start -->
    <div class="shop-main-wrapper section-space pb-0">
        <div class="container">
            <div class="row">
                <!-- sidebar area start -->
                <div class="col-lg-3 order-2 order-lg-1">
                    <aside class="sidebar-wrapper">
                        <!-- single sidebar start -->
                        <div class="sidebar-single">
                            <h3 class="sidebar-title">商品类别</h3>
                            <div class="sidebar-body">
                                <ul class="shop-categories">
                                    <c:forEach items="${requestScope.cate_list}" var="cate">
                                        <li><a href="moreProduct?cate_id=${cate.cate_id}">${cate.cate_name}<span>${cate.cate_pronums}</span></a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- single sidebar end -->
                    </aside>
                </div>
                <!-- sidebar area end -->

                <!-- shop main wrapper start -->
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="shop-product-wrapper">
                        <!-- shop product top wrap start -->
                        <div class="shop-top-bar">
                            <div class="row align-items-center">
                                <div class="col-lg-7 col-md-6 order-2 order-md-1">
                                    <div class="top-bar-left">
                                        <div class="product-view-mode">
                                            <a class="active" href="#" data-target="grid-view" data-toggle="tooltip" title="网格展示"><i class="fa fa-th"></i></a>
                                            <a href="#" data-target="list-view" data-toggle="tooltip" title="列表展示"><i class="fa fa-list"></i></a>
                                        </div>
                                        <div class="product-amount">
                                            <p>共${requestScope.searchProduct.totalNum} 件商品</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6 order-1 order-md-2">
                                    <div class="top-bar-right">
                                        <div class="product-short">
                                            <p>排序 : </p>
                                            <select class="nice-select" name="sortby">
                                                <option value="price">价格</option>
                                                <option value="createtime">最新</option>
                                                <option value="hot">热度</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- shop product top wrap start -->

                        <!-- product item list wrapper start -->
                        <div class="shop-product-wrap grid-view row mbn-40">
                            <s:if test="#request.msg != null">
                                <p style="font-size: 20px; margin: 0 auto" >${requestScope.msg}</p>
                            </s:if>
                            <!-- product single item start -->
                            <c:forEach items="${requestScope.searchResult.data}" var="product">
                                <div class="col-md-4 col-sm-6">
                                    <!-- product grid start -->
                                    <div class="product-item">
                                        <figure class="product-thumb">
                                            <a href="productDetail?id=${product.pro_id}">
                                                <img class="pri-img" src="${product.pro_imgAddr}" alt="product">
                                                <img class="sec-img" src="${product.pro_imgAddr}" alt="product">
                                            </a>
                                            <div class="button-group">
                                                <a href="javascript:void(0)" data-toggle="tooltip" data-placement="left" title="添加收藏" onclick="addWishlist(${product.pro_id})"><i class="lnr lnr-heart"></i></a>
                                                <a href="#" onclick='getProduct(${product.pro_id})'data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" data-placement="left" title="快速预览"><i class="lnr lnr-magnifier"></i></span></a>
                                                <a href="javascript:void(0)" onclick="addCart(${product.pro_id})" data-toggle="tooltip" data-placement="left" title="添加购物车"><i class="lnr lnr-cart"></i></a>
                                            </div>
                                        </figure>
                                        <div class="product-caption">
                                            <p class="product-name">
                                                <a href="productDetail?id=${product.pro_id}">${product.pro_name}</a>
                                            </p>
                                            <div class="price-box">
                                                <span class="price-regular">￥${product.pro_price}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product grid end -->

                                    <!-- product list item end -->
                                    <div class="product-list-item">
                                        <figure class="product-thumb">
                                            <a href="product-details.jsp">
                                                <img class="pri-img" src="${product.pro_imgAddr}" alt="product">
                                                <img class="sec-img" src="${product.pro_imgAddr}" alt="product">
                                            </a>
                                        </figure>
                                        <div class="product-content-list">
                                            <h5 class="product-name"><a href="productDetail?id=${product.pro_id}">${product.pro_name}</a></h5>
                                            <div class="price-box">
                                                <span class="price-regular">￥${product.pro_price}</span>
                                            </div>
                                            <p>
                                                    ${product.pro_desc}
                                            </p>
                                            <div class="button-group-list">
                                                <a class="btn-big" href="cart.jsp" data-toggle="tooltip" title="添加购物车"><i class="lnr lnr-cart"></i>添加购物车</a>
                                                <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip" title="快速预览"><i class="lnr lnr-magnifier"></i></span></a>
                                                <a href="wishlist.jsp" data-toggle="tooltip" title="添加收藏"><i class="lnr lnr-heart"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product list item end -->
                                </div>
                            </c:forEach>
                            <!-- product single item start -->
                        </div>
                        <!-- product item list wrapper end -->

                        <!-- start pagination area -->
                        <div class="paginatoin-area text-center">
                            <ul class="pagination-box">
                                <li><a class="previous" href="searchProduct?keyword=${requestScope.keyword}&startPage=${requestScope.searchResult.nowPage-1<=0?requestScope.searchResult.nowPage:requestScope.searchResult.nowPage-1}"><i class="lnr lnr-chevron-left"></i></a></li>
                                <c:forEach begin="1" end="${requestScope.pagelist.totalPage}" var="page">
                                    <li ${requestScope.pagelist.nowPage == page ? 'class="active"':''}><a href="searchProduct?keyword=${requestScope.keyword}&startPage=${page}">${page}</a></li>
                                </c:forEach>
                                <li><a class="next" href="searchProduct?keyword=${requestScope.keyword}&startPage=${requestScope.pagelist.nowPage+1>requestScope.searchResult.totalPage?requestScope.searchResult.nowPage:requestScope.searchResult.nowPage+1}"><i class="lnr lnr-chevron-right"></i></a></li>
                            </ul>
                        </div>
                        <!-- end pagination area -->
                    </div>
                </div>
                <!-- shop main wrapper end -->
            </div>
        </div>
    </div>
    <!-- page main wrapper end -->
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
                    <ul id="CartInfos"></ul>
                </div>

                <div class="minicart-pricing-box">
                    <ul id="total"> </ul>
                </div>

                <div class="minicart-button">
                    <a href="cart.jsp"><i class="fa fa-shopping-cart"></i>查看购物车</a>
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
    function getCartInfos(){
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "http://localhost:8080/getCartInfos",
            //请求成功
            success: function (msg) {
                if(typeof msg == "string"){
                    $("#CartInfos").empty();
                    $("#CartInfos").append("<h4>请先登录！</h4>");
                }else {
                    var total = 0;
                    $("#CartInfos").empty();
                    $("#total").empty();
                    for (var i = 0; i < msg.length; i++){
                        $("#CartInfos").append("<li class=\"minicart-item\">\n" +
                            "                            <div class=\"minicart-thumb\">\n" +
                            "                                <a href='productDetail?id="+msg[i].pro_id+"'>\n" +
                            "                                    <img src="+msg[i].url+" alt=\"product\">\n" +
                            "                                </a>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"minicart-content\">\n" +
                            "                                <h3 class=\"product-name\">\n" +
                            "                                    <a href='productDetail?id="+msg[i].pro_id+"'>"+msg[i].pro_name+"</a>\n" +
                            "                                </h3>\n" +
                            "                                <p>\n" +
                            "                                    <span class=\"cart-quantity\">"+msg[i].pro_number+"<strong>&times;</strong></span>\n" +
                            "                                    <span class=\"cart-price\">￥"+msg[i].pro_price+"</span>\n" +
                            "                                </p>\n" +
                            "                            </div>\n" +
                            "                            <button class=\"minicart-remove\"><i class=\"lnr lnr-cross\" onclick='delCart("+msg[i].cart_id+")'></i></button>\n" +
                            "                        </li>");
                        total += msg[i].cart_price;
                    }
                    $("#total").append("<li>\n" +
                        "                            <span>总金额</span>\n" +
                        "                            <span><strong>￥"+total+"</strong></span>\n" +
                        "                        </li>");
                }
            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        })
    }
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
    function addCart(pro_id){
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "http://localhost:8080/addCart",
            //传参
            data: {"pro_id":pro_id,"pro_number":1},
            //请求成功
            success: function (result) {
                if(result.status == 200){
                    alert("添加成功！");
                    getCartNum();
                }else{
                    alert("添加失败，请登录！");
                }

            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }

    function delCart(cart_id) {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址+请求参数
            url: "http://localhost:8080/delCart?cart_id="+cart_id,
            //请求成功
            success: function (data) {
                if(data.status == 200){
                    alert("删除成功！");
                    getCartNum();
                }else {
                    alert("删除失败！")
                }

            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        })
    }

    function getWishNum() {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "http://localhost:8080/getWishlistInfos",
            //请求成功
            success: function (data) {
                if(typeof data == "string"){
                    $("#wish").empty();
                    $("#wish").append("<i class=\"lnr lnr-heart\"></i>\n" +
                        "                                            <div class=\"notification\">0</div>");
                }else {
                    $("#wish").empty();
                    $("#wish").append("<i class=\"lnr lnr-heart\"></i>\n" +
                        "                                            <div class=\"notification\">"+data.length+"</div>");
                }

            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        })
    }
    function getCartNum() {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "http://localhost:8080/getCartInfos",
            //请求成功
            success: function (data) {
                if(typeof data == "string"){
                    $("#superscript").empty();
                    $("#superscript").append("<i class=\"lnr lnr-cart\"></i>\n" +
                        "                                            <div class=\"notification\">0</div>");
                }else {
                    $("#superscript").empty();
                    $("#superscript").append("<i class=\"lnr lnr-cart\"></i>\n" +
                        "                                            <div class=\"notification\">"+data.length+"</div>");
                }

            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        })
    }
    function addWishlist(pro_id){
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址+请求参数
            url: "http://localhost:8080/addWishlist?pro_id="+pro_id,
            //请求成功
            success: function (data) {
                console.log(data);
                if(data.status == 200){
                    alert("添加成功！");
                    getWishNum();
                }else {
                    alert("添加失败！");
                }

            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        })
    }
    $(function () {
        getWishNum();
        getCartNum();
    })
</script>
</body>
</html>