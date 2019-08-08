<%--
  User: zwf97
  Date: 2019/8/5
  Time: 14:22
  Description：分类管理页面
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
    <title>分类管理</title>
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
<br><br><h1 style="text-align: center;">分类管理</h1>
<a class="btn btn-primary" style="position: absolute; right: 120px;" data-toggle="modal" data-target="#exampleModal">添加分类</a><br><br><br><br>

<table class="table table-border table-bordered table-striped table-hover"
       style="width: 80%;text-align:center;margin: 0 auto;" id="tableData">
</table>

<%--添加分类模态框--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <form class="modal-content" action="addCategroy" method="post">
            <div class="modal-header">
                添加分类
            </div>
            <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">类目名称:</label>
                        <input type="text" class="form-control" id="recipient-name" name="cate.cate_name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">描述:</label>
                        <textarea class="form-control" id="message-text" name="cate.cate_desc"></textarea>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">添加分类</button>
            </div>
        </form>
    </div>
</div>

<%--修改模态框--%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <form class="modal-content" action="updateCategroy" method="post">
            <div class="modal-header">
                分类修改
            </div>
            <div class="modal-body" id="updateForm">
                <input type="hidden" name="cate.cate_id" id="cate_id">
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">类目名称:</label>
                    <input type="text" class="form-control" name="cate.cate_name" id="cate_name">
                </div>
                <div class="form-group">
                    <label for="message-text" class="col-form-label">描述:</label>
                    <textarea class="form-control" name="cate.cate_desc" id="cate_desc"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">修改</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "getCategroies",
            //请求成功
            success : function(result) {
                $("#tableData").empty();
                $("#tableData").append("<tr>\n" +
                    "        <td><b>编号</b></td>\n" +
                    "        <td><b>类目名称</b></td>\n" +
                    "        <td><b>描述</b></td>\n" +
                    "        <td><b>操作</b></td>\n" +
                    "    </tr>");
                for (var i = 0; i < result.length; i++){
                    $("#tableData").append("<tr>\n" +
                        "        <td>"+result[i].cate_id+"</td>\n" +
                        "        <td>"+result[i].cate_name+"</td>\n" +
                        "        <td>"+result[i].cate_desc+"</td>\n" +
                        "        <td>\n" +
                        "            <a class=\"btn btn-warning radius\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\" onclick=\"getCate("+result[i].cate_id+")\">修改</a>\n" +
                        "            <a class=\"btn btn-danger radius\" onclick=\"delCate("+result[i].cate_id+")\">删除</a>\n" +
                        "        </td>\n" +
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

    function getCate(id){
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址+请求参数
            url : "getCategroy?id="+id,
            //请求成功
            success : function(result) {
                $("#cate_id").val('');
                $("#cate_name").val('');
                $("#cate_desc").val('');
                $("#cate_id").val(result.cate_id);
                $("#cate_name").val(result.cate_name);
                $("#cate_desc").val(result.cate_desc);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }

    function delCate(id){
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "json",
            //请求地址+请求参数
            url : "delCategroy?id="+id,
            //请求成功
            success : function(result) {
                location.href = "classify.jsp";
                console.log(id);
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