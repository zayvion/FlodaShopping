<%--
  User: zwf97
  Date: 2019/8/5
  Time: 14:22
  Description：查看评论页面
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
    <title>查看评论</title>
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
<br><br><h1 style="text-align: center;">查看评论</h1><br><br>
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
            url : "getEcaluates",
            //请求成功
            success : function(result) {
                $("#tableData").empty();
                $("#tableData").append("<tr>\n" +
                    "        <td><b>评论ID</b></td>\n" +
                    "        <td><b>商品ID</b></td>\n" +
                    "        <td><b>订单ID</b></td>\n" +
                    "        <td><b>用户ID</b></td>\n" +
                    "        <td><b>用户名</b></td>\n" +
                    "        <td><b>评论内容</b></td>\n" +
                    "        <td><b>评论时间</b></td>\n" +
                    "    </tr>");
                for (var i = 0; i < result.length; i++){
                    $("#tableData").append("<tr>\n" +
                        "        <td>"+result[i].ecal_id+"</td>\n" +
                        "        <td><a href='http://localhost:8080/productDetail?id="+result[i].product_id+"' target='_blank'>"+result[i].product_id+"</a></td>\n" +
                        "        <td>"+result[i].order_id+"</td>\n" +
                        "        <td>"+result[i].user_id+"</td>\n" +
                        "        <td>"+result[i].username+"</td>\n" +
                        "        <td>"+result[i].ecal_content+"</td>\n" +
                        "        <td>"+result[i].ecal_time+"</td>\n" +
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