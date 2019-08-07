<%--
  User: zwf97
  Date: 2019/8/7
  Time: 9：41
  Description：登录页面
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
    <title>后台登录页面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="loginassets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="loginassets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="loginassets/css/form-elements.css">
    <link rel="stylesheet" href="loginassets/css/style.css">
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="loginassets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="loginassets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="loginassets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="loginassets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="loginassets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>
<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">

            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>登录管理系统</h3>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-key"></i>
                        </div>
                        <span style="color: red;">${msg}</span>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="user_loginUser" method="post" class="login-form">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">用户名</label>
                                <input type="text" name="username" placeholder="用户名" class="form-username form-control" id="form-username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="password" placeholder="密码" class="form-password form-control" id="form-password">
                            </div>
                            <button type="submit" class="btn" id="#login">登录</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<!-- Javascript -->
<script src="loginassets/js/jquery-1.11.1.min.js"></script>
<script src="loginassets/bootstrap/js/bootstrap.min.js"></script>
<script src="loginassets/js/jquery.backstretch.min.js"></script>
<script src="loginassets/js/scripts.js"></script>
</body>
</html>