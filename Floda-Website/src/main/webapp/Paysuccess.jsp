<%--
  User: zayvion
  Date: 2019-08-10
  Time: 17:57
  Description：
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
    <title>支付成功</title>
    <base href="<%=basePath%>">
</head>
<body>
支付成功！
<h3>订单号：${out_trade_no}</h3>
<h3>总金额：${total_amount}</h3>
<h3>订单名称：${subject}</h3>
<h3>描述：${body}</h3>
</body>
</html>
