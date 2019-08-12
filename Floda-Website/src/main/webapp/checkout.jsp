<%--
  User: dc
  Date: 2019/8/5
  Time: 16:26
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
    <title>订单结算-Floda</title>
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
        .fr {
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

        .addre .tit .fr a, span {
            text-decoration: none;
            font-size: 12px;
            float: right;
            outline: none;
            color: #262626;
            line-height: 45px;
        }

        .order-summary-details a {
            text-decoration: underline;
            font-size: 12px;
            outline: none;
            color: #262626;
            line-height: 30px;
        }

        .addre .tit .fr span {
            padding-left: 10px;
            padding-right: 10px;
        }

        .checkout-billing-details-wrap img {
            float: left;
            border: 2px solid #dbdbdb;
            margin: 0px 20px 30px 0;
            cursor: pointer;
        }

        .checkout-billing-details-wrap img.on {
            border: 2px solid #C10000;
        }

        .checkout-billing-details-wrap.shipping span {
            width: 136px;
            height: 38px;
            text-align: center;
            line-height: 38px;
            float: left;
            border: 2px solid #dbdbdb;
            margin: 0px 20px 30px 0;
            cursor: pointer;
        }

        .checkout-billing-details-wrap.shipping span.on {
            border: 2px solid #C10000;
        }
        #btn_gopay{
            width: 168px;
            height: 30px;
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
                                <nav class="desktop-menu" style="height: 100px">

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
                                                    <li><a href="my-account.jsp">${sessionScope.onliner.username}</a>
                                                    </li>
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
                                <li class="breadcrumb-item"><a href="index.jsp"><i class="fa fa-home"></i></a></li>
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
                <div class="col-lg-11">
                    <div class="checkout-billing-details-wrap">
                        <h2>收件信息</h2>
                        <s:iterator value="#request.address" var="item">
                            <div class="addre fl on">
                                <input type='hidden' name='addresss_id' id='addresss_id' value="${item.user_addr_id}"/>
                                <div class="tit clearfix">
                                    <p class="fl" style="font-size: 16px"><b>${receiver_name}</b>
                                    </p>
                                </div>
                                <div class="addCon">
                                    <p style="font-size: 14px">${receiver_addr}</p>
                                    <p style="font-size: 14px">${receiver_tel}</p>
                                </div>
                            </div>
                        </s:iterator>
                    </div>
                    <!-- Order Summary Details -->
                    <div class="row col-lg-12">
                        <div class="checkout-billing-details-wrap">
                            <h2>订单预览<a href="#" class="fr"></a></h2>
                            <div class="cart-table table-responsive">
                                <table class="table table-bordered" style="margin-bottom: 30px">
                                    <thead>
                                    <tr>
                                        <th class="pro-thumbnail">商品展示</th>
                                        <th class="pro-title">产品名称</th>
                                        <th class="pro-price">价格</th>
                                        <th class="pro-quantity">数量</th>
                                        <th class="pro-subtotal">结算</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody"></tbody>
                                </table>
                            </div>
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
                                                <ul id="total"></ul>
                                            </div>

                                            <div class="minicart-button">
                                                <a href="cart.jsp"><i class="fa fa-shopping-cart"></i> 查看购物车</a>
                                                <a href="cart.jsp"><i class="fa fa-share"></i> 去结算</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row col-lg-12">
                        <div class="checkout-billing-details-wrap">
                            <h2>支付方式</h2>
                            <img class="on" src="assets/img/way/way01.jpg">
                            <img src="assets/img/way/way04.jpg">
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
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "http://localhost:8080/getCartInfos",
            //请求成功
            success: function (result) {
                console.log(result);
                var total = 0;
                for (var i = 0; i < result.length; i++) {
                    var str = "<tr>\n" +
                        "                <td class=\"pro-thumbnail\"><a href='productDetail?id=" + result[i].pro_id + "'><img class=\"img-fluid\" src=" + result[i].url + " alt=\"Product\" /></a></td>\n" +
                        "                <td class=\"pro-title\"><a href='productDetail?id=" + result[i].pro_id + "'>" + result[i].pro_name + "</a></td>\n" +
                        "                <td class=\"pro-price\"><span>￥" + result[i].pro_price + "</span></td>\n" +
                        "                <td class=\"pro-quantity\">\n" +
                        "                <div>\n" +
                        "                    <div>" + result[i].pro_number + "</div>\n" +
                        "                </div>\n" +
                        "                </td>\n" +
                        "                <td class=\"pro-subtotal\"><span>￥" + result[i].cart_price + "</span></td>\n" +
                        "            </tr>"
                    var row = $(str);
                    $("#tbody").append(row);
                    total += result[i].cart_price;
                }
                var total = $("<div class='cart-calculator-wrapper' style='position: absolute;right: 100px'>\n" +
                    "                            <div class='cart-calculate-items'>\n" +
                    "                                <h3 style='text-align: center'>结算</h3>\n" +
                    "                                <div class='table-responsive'>\n" +
                    "                                    <table class='table-danger'>\n" +
                    "                                        <tbody><tr class='total' id='totalMoney'><td>金额</td>\n" +
                    "                                            <td class='total-amount'>￥"+total+"</td></tr>\n" +
                    "                                    </tbody></table>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "<form action='createOrder' id='form_createOrder' method='post'>" +
                    "<input type='hidden' name='addr_id' id='form_addr_id' value=''><input type='hidden' name='total' id='form_total' value=''>" +
                    "                           </form><button class='btn btn__bg d-block' id='btn_gopay' onclick='submit()'>去付款</button>\n" +
                    "                        </div>");
                $("#tbody").append(total);


            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        })
        $(".addre").click(function () {
            var $addr = $(".addre");
            for (var i = 0; i < $addr.length; i++) {
                $addr.eq(i).removeClass('on');
            }
            $(this).toggleClass('on');
        });

        $(".checkout-billing-details-wrap img").click(function () {
            var $addr = $(".checkout-billing-details-wrap img");
            for (var i = 0; i < $addr.length; i++) {
                $addr.eq(i).removeClass('on');
            }
            $(this).toggleClass('on');
        });

        $(".checkout-billing-details-wrap.shipping span").click(function () {
            var $addr = $(".checkout-billing-details-wrap.shipping span");
            for (var i = 0; i < $addr.length; i++) {
                $addr.eq(i).removeClass('on');
            }
            $(this).toggleClass('on');
        });


    })
    function submit () {
        var addr_id = $(".on #addresss_id ").val();
        var total = $(".total-amount").text().substr(1);
        console.log(total);
        console.log("进来了")
        $("#form_addr_id").val(addr_id);
        $("#form_total").val(total);
        $('#form_createOrder').submit();
    }
</script>
</body>
</html>