<%--
<%--
  User: zwf97
  Date: 2019/8/5
  Time: 14:22
  Description：分类管理页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <title>商品管理</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <script src="assets/js/ace-extra.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/dist/echarts.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</head>
<body>
<br><br>
<h1 style="text-align: center;">商品管理</h1>
<a class="btn btn-primary" style="position: absolute; right: 120px;" data-toggle="modal"
   data-target="#addModal">添加商品</a><br><br><br><br>

<table class="table table-border table-bordered table-striped table-hover"
       style="width: 80%;text-align:center;margin: 0 auto;" id="tableData">
    <thead>
    <tr>
        <td><b>商品编号</b></td>
        <td><b>商品主图</b></td>
        <td><b>商品名称</b></td>
        <td><b>商品价格</b></td>
        <td><b>商品状态</b></td>
        <td><b>商品库存</b></td>
        <td><b>操作</b></td>
    </tr>
    <tbody id="tbody"></tbody>
    </thead>

</table>
<div class="text-center" id="page_nav">

</div>

<%--添加分类模态框--%>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true"  data-backdrop="static">
    <div class="modal-dialog" role="document">
        <form class="modal-content" action="addProduct" method="post" enctype="multipart/form-data">
            <div class="modal-header">
                添加商品
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="pro_name" class="col-form-label">商品名称:</label>
                    <input type="text" class="form-control" id="pro_name" name="product.pro_name">
                </div>
                <div class="form-group">
                    <label for="pro_desc" class="col-form-label">商品描述:</label>
                    <textarea class="form-control" id="pro_desc" name="product.pro_desc"></textarea>
                </div>
                <div>
                    <label for="pro_cate" class="col-form-label">商品类别:</label>
                    <select class="form-control" id="pro_cate" name="product.pro_cateId">

                    </select>
                </div>
                <br>
                <div>
                    <label  class="col-form-label">是否上架:</label>
                    <input type="radio" class="radio-inline" value="0" name="product.pro_status"/>上架
                    <input type="radio" class="radio-inline" value="1" name="product.pro_status"/>下架
                </div>
                <br>
                <div class="form-group">
                    <label for="pro_img" class="col-form-label">商品图片:</label>
                    <input type="file" class="form-control" id="pro_img" name="imgFile">
                    <input type="text" class="form-control" id="pro_imgdesc" name="img.img_desc" placeholder="图片描述">
                </div>
                <div class="form-group">
                    <label for="pro_price" class="col-form-label">商品价格:</label>
                    <input type="text" class="form-control" id="pro_price" name="product.pro_price">
                </div>
                <div class="form-group">
                    <label for="pro_num" class="col-form-label">商品库存:</label>
                    <input type="text" class="form-control" id="pro_num" name="product.pro_numbers">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">添加商品</button>
            </div>
        </form>
    </div>
</div>
<%--修改商品模态框--%>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <form class="modal-content" action="updateProduct" method="post" enctype="multipart/form-data">
            <div class="modal-header">
                编辑商品
            </div>
            <input type="hidden"name="product.pro_id" id="update_pro_id"/>
            <div class="modal-body">
                <div class="form-group">
                    <label for="update_pro_name" class="col-form-label">商品名称:</label>
                    <input type="text" class="form-control" id="update_pro_name" name="product.pro_name">
                </div>
                <div class="form-group">
                    <label for="update_pro_desc" class="col-form-label">商品描述:</label>
                    <textarea class="form-control" id="update_pro_desc" name="product.pro_desc"></textarea>
                </div>
                <div>
                    <label for="update_pro_cate" class="col-form-label">商品类别:</label>
                    <select class="form-control" id="update_pro_cate" name="product.pro_cateId">

                    </select>
                </div>
                <br>
                <div class="update_radio">
                    <label  class="col-form-label">是否上架:</label>
                    <input type="radio" class="radio-inline" value="0" name="product.pro_status"/>上架
                    <input type="radio" class="radio-inline" value="1" name="product.pro_status"/>下架
                </div>
                <br>
                <div class="form-group">
                    <label for="update_pro_img" class="col-form-label">商品图片:</label>
                    <img id="pro_pic"  height="200" width="200"/>
                    <input type="file" class="form-control" id="update_pro_img" name="imgFile">
                    <input type="text" class="form-control" id="update_pro_imgdesc" name="img.img_desc" placeholder="图片描述">
                </div>
                <div class="form-group">
                    <label for="update_pro_price" class="col-form-label">商品价格:</label>
                    <input type="text" class="form-control" id="update_pro_price" name="product.pro_price">
                </div>
                <div class="form-group">
                    <label for="update_pro_num" class="col-form-label">商品库存:</label>
                    <input type="text" class="form-control" id="update_pro_num" name="product.pro_numbers">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">添加商品</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(function () {
    toPage(1);
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "getCategroies",
            //请求成功
            success : function(result) {
                console.log(result)
                $("#pro_cate").empty();
                $("#pro_cate").append("<option>--请选择类型---</option>");
                $.each(result,function (index,item) {
                    $("#pro_cate").append("<option name='product.pro_cateId' value='"+item.cate_id+"'>"+item.cate_name+"</optiond>")
                    $("#update_pro_cate").append("<option name='product.pro_cateId' value='"+item.cate_id+"'>"+item.cate_name+"</optiond>")
                })
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });

    })
    function toPage(page) {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "getProducts",
            data: {"startPage": page, "item": 8},
            //请求成功
            success: function (result) {
                $("#tbody").empty();
                console.log(result);
                $.each(result.data, function (index, item) {
                    $("#tbody").append("<tr><td>" + item.pro_id + "</td><td><a href='http://localhost:8080/productDetail?id="+item.pro_id+"' target='_blank'><img width='80px' height='80px' src='" + item.pro_imgUrl + "'/></a></td><td><a href='http://localhost:8080/productDetail?id="+item.pro_id+"' target='_blank'>" + item.pro_name + "</a></td><td>" + item.pro_price + "</td><td>" + item.pro_status + "</td><td>" + item.pro_numbers + "</td><td>" +
                        "<a class='btn btn-warning radius' data-toggle='modal' data-target='#updateModal' onclick='getProduct("+item.pro_id+")'>编辑商品</a></td></tr>");
                })
                var span = $("<p>当前第<span class='badge'>"+result.nowPage+"</span>页，总<span class='badge'>"+result.totalPage+"</span>页，总 <span class='badge'>"+result.totalNum+"</span>条记录</p>");
                var nav = $("<nav aria-label='Page navigation'>\n" +
                    "            <ul class='pagination'>\n" +
                    "                <li id='li_left'>\n" +
                    "                    <a  class='' id='left' aria-label='Previous'>\n" +
                    "                        <span aria-hidden='true'>&laquo;</span>\n" +
                    "                    </a>\n" +
                    "                </li>\n" +
                    "                <li id='li_right'>\n" +
                    "                    <a class='' id='right' aria-label='Next'>\n" +
                    "                        <span aria-hidden='true'>&raquo;</span>\n" +
                    "                    </a>\n" +
                    "                </li>\n" +
                    "            </ul>\n" +
                    "        </nav>");
                $("#page_nav").empty().append(span).append(nav);
                console.log("now:"+result.nowPage+typeof result.nowPage);
                console.log("now:"+result.totalPage+typeof result.totalPage);
                if (result.nowPage == 1){
                    $("#li_left").addClass("disabled");
                }else{
                    $("#left").click(function () {
                        toPage(result.nowPage-1);
                    });
                }
                if (result.nowPage == result.totalPage) {
                    $("#li_right").addClass("disabled");
                }else{
                    $("#right").click(function () {
                        toPage(result.nowPage+1);
                    });
                }

            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
   }
    function getProduct(id) {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "getProduct?id="+id,

            //请求成功
            success: function (result) {
                //清空内容
               $("#update_pro_name").val('');
               $("#update_pro_cate").val('');
               $("#update_pro_price").val('');
               $("#update_pro_num").val('');
               // $(".update_radio input[name='product.pro_status']").val('1');
               //将请求的数据进行展示
                console.log(result);
                $("#update_pro_id").attr("value",result.pro_id);
                $("#update_pro_id").val(result.pro_id);
                $("#update_pro_name").val(result.pro_name);
                $("#update_pro_desc").val(result.pro_desc);
                $("#update_pro_price").val(result.pro_price);
                $("#update_pro_cate").val(result.pro_cateId);
                $("#update_pro_num").val(result.pro_numbers);
                $(".update_radio input[name='product.pro_status']").val([result.pro_status]).attr("checked","checked");
                getImg(result.pro_imgId)

            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }
    function getImg(id) {
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            datatype: "json",
            //请求地址
            url: "getImgUrl?id="+id,

            //请求成功
            success: function (result) {
                $("#pro_pic").attr("src",result);
                return result
            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }
</script>
</body>
</html>