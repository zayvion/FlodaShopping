<%--
  User: zwf97
  Date: 2019/8/5
  Time: 14:22
  Description：用户管理页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

</head>
<body>
<br><br><h1 style="text-align: center;">用户管理</h1><br><br>
<a class="btn btn-primary" style="position: absolute; right: 120px;">添加用户</a><br><br><br><br>

<table class="table table-border table-bordered table-striped table-hover"
       style="width: 80%;text-align:center;margin: 0 auto;">

    <tr>
        <td><b>表头</b></td>
        <td><b>表头</b></td>
        <td><b>表头</b></td>
        <td><b>表头</b></td>
        <td><b>表头</b></td>
    </tr>
</table>

</body>
</html>