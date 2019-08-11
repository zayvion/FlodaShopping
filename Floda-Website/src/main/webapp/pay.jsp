<%--
  User: zayvion
  Date: 2019-08-10
  Time: 17:14
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
    <title>支付</title>
    <base href="<%=basePath%>">
</head>
<body>
${result}
</body>
</html>
