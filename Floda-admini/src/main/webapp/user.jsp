<%--
  User: zwf97
  Date: 2019/8/5
  Time: 14:22
  Description：用户管理页面
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

</head>
<body>
<br><br><h1 style="text-align: center;">用户管理</h1><br><br>
<div style="margin-left: 130px;margin-bottom: 20px"><a class="btn btn-primary" href="http://localhost:8080/exportUser" target="_blank">导出到Excel</a></div>
<table class="table table-border table-bordered table-striped table-hover"
       style="width: 80%;text-align:center;margin: 0 auto;">
    <tr>
        <td><b>编号</b></td>
        <td><b>用户名</b></td>
        <td><b>电话号码</b></td>
        <td><b>状态</b></td>
        <td><b>类型</b></td>
        <td><b>操作</b></td>
    </tr>
</table>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">详细信息</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="hidden" value="1">
                        <label for="name">用户姓名</label>
                        <input type="text" class="form-control" id="name" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="email">邮箱</label>
                        <input type="email" class="form-control" id="email" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="sex">性别</label>
                        <select class="form-control" disabled id="sex">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="email">用户头像</label>
                        <img id="head" alt="..." style="width: 80px;height: 80px;border: 2px solid #b3b3b3">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $.get("user_list.action",function (data,status) {
            console.log(data);
            $.each(data,function (index,item) {
                if (item.type == 1){
                    var _tr = "<tr>\n" +
                        "        <td><b>"+item.user_id+"</b></td>\n" +
                        "        <td><b>"+item.username+"</b></td>\n" +
                        "        <td><b>"+item.tel+"</b></td>\n" +
                        "        <td><b>"+(item.status == '0'?'正常':'封号')+"</b></td>\n" +
                        "        <td><b>"+(item.type == 0 ?'管理员':'用户')+"</b></td>\n" +
                        "        <td><b>" +
                        "            <a class=\"btn btn-primary btn-xs radius\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"getUserInfo("+item.user_id+")\">查看详细信息</a>\n" +
                        "            <a class=\"btn btn-danger btn-xs radius\" onclick=\"stopUser("+item.user_id+")\">封号</a>\n" +
                        "            <a class=\"btn btn-success btn-xs radius\" onclick=\"startUser("+item.user_id+")\">解封</a>\n" +
                        "        </b></td>\n" +
                        "    </tr>";
                    $('.table').append(_tr);
                }
            })
        })
    });

    function getUserInfo(id) {
        $.post("user_info.action?userId="+id,function (data,status) {
            console.log(data);
            $("#name").val(data.name);
            $("#email").val(data.email);
            $("#sex").val(data.sex);
            $("#head").attr("src",data.head);
        })
    }

    function stopUser(id) {
        $.post("user_stop.action?userId="+id,function (data,status) {
            location.href = "user.jsp"
        })
    }

    function startUser(id) {
        $.post("user_start.action?userId="+id,function (data,status) {
            location.href = "user.jsp"
        })
    }
</script>
</body>
</html>