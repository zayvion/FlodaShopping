<%--
  User: zwf97
  Date: 2019/8/5
  Time: 14:11
  Description：主页
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
    <meta charset="utf-8" />
    <title>后台管理系统 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <script src="assets/js/ace-extra.min.js"></script>
    <script src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
    </script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>


    <script type="text/javascript">
        $(function () {
            var cid = $('#nav_list> li>.submenu');
            cid.each(function (i) {
                $(this).attr('id', "Sort_link_" + i);

            })
        })
        jQuery(document).ready(function () {
            $.each($(".submenu"), function () {
                var $aobjs = $(this).children("li");
                var rowCount = $aobjs.size();
                var divHeigth = $(this).height();
                $aobjs.height(divHeigth / rowCount);
            });
            //初始化宽度、高度
            $("#main-container").height($(window).height() - 76);
            $("#iframe").height($(window).height() - 140);

            $(".sidebar").height($(window).height() - 99);
            var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height", thisHeight);

            //当文档窗口发生改变时 触发
            $(window).resize(function () {
                $("#main-container").height($(window).height() - 76);
                $("#iframe").height($(window).height() - 140);
                $(".sidebar").height($(window).height() - 99);

                var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height", thisHeight);
            });
            $(".iframeurl").click(function () {
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src", cid).ready();
                $("#Bcrumbs").attr("href", cid).ready();
                $(".Current_page a").attr('href', cid).ready();
                $(".Current_page").attr('name', cid);
                $(".Current_page").html(cname).css({ "color": "#333333", "cursor": "default" }).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
                $("#parentIfour").html('').css("display", "none").ready();
            });


        });
        /*********************点击事件*********************/
        $(document).ready(function () {
            $('#nav_list').find('li.home').click(function () {
                $('#nav_list').find('li.home').removeClass('active');
                $(this).addClass('active');
            });


            //时间设置
            function currentTime() {
                var d = new Date(), str = '';
                str += d.getFullYear() + '年';
                str += d.getMonth() + 1 + '月';
                str += d.getDate() + '日';
                str += d.getHours() + '时';
                str += d.getMinutes() + '分';
                str += d.getSeconds() + '秒';
                return str;
            }
            setInterval(function () { $('#time').html(currentTime) }, 1000);
            //修改密码
            $('.change_Password').on('click', function () {
                layer.open({
                    type: 1,
                    title: '修改密码',
                    area: ['300px', '300px'],
                    shadeClose: true,
                    content: $('#change_Pass'),
                    btn: ['确认修改'],
                    yes: function (index, layero) {
                        if ($("#password").val() == "") {
                            layer.alert('原密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        if ($("#Nes_pas").val() == "") {
                            layer.alert('新密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }

                        if ($("#c_mew_pas").val() == "") {
                            layer.alert('确认新密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                            layer.alert('密码不一致!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        else {
                            layer.alert('修改成功！', {
                                title: '提示框',
                                icon: 1,
                            });
                            layer.close(index);
                        }
                    }
                });
            });
            $('#Exit_system').on('click', function () {
                layer.confirm('是否确定退出系统？', {
                        btn: ['是', '否'],//按钮
                        icon: 2,
                    },
                    function () {
                        location.href = "index.jsp";

                    });
            });
        })
    </script>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try { ace.settings.check('navbar', 'fixed') } catch (e) { }
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <img src="./images/logo.jpg" alt="" style="padding-top: 20px;width: 100px;">
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="time"><em id="time"></em></span><span
                            class="user-info"><small>欢迎光临,</small>${userFlag}</span>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a id="Exit_system"><i class="icon-off"></i>退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try { ace.settings.check('main-container', 'fixed') } catch (e) { }
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try { ace.settings.check('sidebar', 'fixed') } catch (e) { }
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    后台管理系统
                </div>
                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>
                    <span class="btn btn-info"></span>
                    <span class="btn btn-warning"></span>
                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- #sidebar-shortcuts -->
            <ul class="nav nav-list" id="nav_list">
                <li class="home"><a href="javascript:void(0)" name="user.jsp" class="iframeurl" title=""><i
                        class="icon-user"></i><span class="menu-text"> 用户管理 </span></a></li>
                <li><a href="#" class="dropdown-toggle"><i class=" icon-gift"></i><span class="menu-text"> 商品管理
							</span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a href="javascript:void(0)" name="classify.jsp" title="分类管理"
                                            class="iframeurl"><i class="icon-double-angle-right"></i>分类管理</a></li>
                        <li class="home"><a href="javascript:void(0)" name="product.jsp" title="商品管理"
                                            class="iframeurl"><i class="icon-double-angle-right"></i>商品管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-shopping-cart"></i><span class="menu-text">
								订单管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a href="javascript:void(0)" name="order.jsp" title="查看订单"
                                            class="iframeurl"><i class="icon-double-angle-right"></i>订单详情</a></li>
                    </ul>
                </li>
                <li><a href="#" class="dropdown-toggle"><i class="icon-comment"></i><span class="menu-text"> 评价管理
							</span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a name="ecaluate.jsp" title="查看评论"
                                            class="iframeurl"><i class="icon-double-angle-right"></i>查看评论</a></li>
                    </ul>
                </li>
                <li><a class="dropdown-toggle" data-toggle="modal" data-target="#myModal" style="cursor:hand;"><img src="assets/avatars/material-delete.svg" style="width: 24px;margin-left: 3px"/><span class="menu-text" style="margin-left: 5px"> 清除缓存</span></li>
            </ul>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
            <script type="text/javascript">
                try { ace.settings.check('sidebar', 'collapsed') } catch (e) { }
            </script>
        </div>
        <div class="main-content">
            <script type="text/javascript">
                try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
            </script>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb" style="margin-top: 10px;">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="main.jsp">首页</a>
                    </li>
                    <li class="active"><span class="Current_page iframeurl"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
                    <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                </ul>
            </div>

            <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;" name="iframe" frameborder="0"
                    src="user.jsp"> </iframe>

        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">清除缓存</h4>
                </div>
                <div class="modal-body">
                    是否清除缓存？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="CleanCacheAction()">确定清除</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function CleanCacheAction() {
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "json",
            //请求地址
            url : "http://localhost:8081/cleanCache",
            //请求成功
            success : function(result) {
                console.log(result);
                alert("清除缓存成功！");
                $('#myModal').modal('hide');//隐藏modal
                $('.modal fade').remove();//去掉遮罩层
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }
</script>

</body>
</html>