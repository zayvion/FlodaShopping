<%--
  User: zwf97
  Date: 2019/8/5
  Time: 14:22
  Description：404页面
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
    <title>用户管理</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <script src="assets/js/ace-extra.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/dist/echarts.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Nova+Flat' rel='stylesheet' type='text/css'>
    <style>
        body {
            font-family: 'Nova Flat', cursive;
            background-color: #fff;
            color: #B396FF;
        }
        .pad-top {
            padding-top:60px;
        }
        .text-center {
            text-align:center;
        }
        #error-link {
            font-size:150px;
            padding:10px;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="row pad-top text-center">
        <div class="col-md-6 col-md-offset-3 text-center">
            <h1>  What have you done? </h1>
            <h5> Now Go Back Using Below LInk</h5>
            <span id="error-link"></span>
            <h2>! ERROR DECETED !</h2>
        </div>
    </div>

    <div class="row text-center">
        <div class="col-md-8 col-md-offset-2">

            <h3> <i  class="fa fa-lightbulb-o fa-5x"></i> </h3><br><br>
            <a href="#" class="btn btn-primary">返回主页</a>
        </div>
    </div>

    <script src="js/countUp.js"></script>
    <script src="js/custom.js"></script>
</div>
</body>
</html>