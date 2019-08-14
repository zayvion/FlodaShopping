<%--
  User: zwf97
  Date: 2019/8/13
  Time: 9:17
  Description：查看订单页面
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
    <title>查看订单</title>
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
<br><br><h1 style="text-align: center;">查看订单</h1><br><br>

<table class="table table-border table-bordered table-striped table-hover"
       style="width: 80%;text-align:center;margin: 0 auto;" id="tableData">
</table>
<script type="text/javascript">
    $(function () {
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "getOrderInfos",
            //请求成功
            success : function(result) {
                console.log(result);
                $("#tableData").empty();
                $("#tableData").append("<tr>\n" +
                    "        <td><b>订单编号</b></td>\n" +
                    "        <td><b>用户姓名</b></td>\n" +
                    "        <td><b>订单状态</b></td>\n" +
                    "        <td><b>订单金额</b></td>\n" +
                    "        <td><b>订单日期</b></td>\n" +
                    "    </tr>");
                for (var i = 0; i < result.length; i++){
                    $("#tableData").append("<tr>\n" +
                        "        <td>"+result[i].order_id+"</td>\n" +
                        "        <td>"+result[i].user_name+"</td>\n" +
                        "        <td>"+result[i].type+"</td>\n" +
                        "        <td>¥"+result[i].order_money+"</td>\n" +
                        "        <td>"+result[i].creattime+"</td>\n" +
                        "    </tr>");
                }
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    })
</script>
</body>
</html>