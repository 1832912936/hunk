<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/5/0005
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病程记录</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body style="font-size: 14px;line-height: 1.428">
<%--<button style="margin-top: 50px;margin-left: 50px" class="btn btn-primary btn-sm" onclick="go_back()">←&nbsp;&nbsp;返回首页</button>--%>
<center class="row">
    <div class="col-md-12">
        <h1>病程记录</h1>
    </div>

</center>
<div class="col-md-3"></div>
<div class="col-md-6">
    <table class="table table-hover" id="emr_table" style="border-collapse: collapse;">
        <thead>

        </thead>
    </table>
    <table class="table table-hover" id="emr_table_1" style="border-collapse: collapse;">
       <tbody>
<%--            <tr>--%>
<%--                <td class="text-center"><H3>首次病程</H3></td>--%>
<%--           </tr>--%>
<%--            <tr>--%>
<%--                <td><h4>2020-11-10</h4></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><p class="lead">首次病程信息</p></td>--%>
<%--            </tr>--%>
       </tbody>
    </table>

</div>
<div class="col-md-3"></div>


</body>
<script type="text/javascript">
    $(function () {
        var regno = sessionStorage.getItem( "regno" );
        var mz = sessionStorage.getItem("mz");
        find(regno,mz)
    })

    function find(regno,mz) {


        $.ajax({
            url:"${APP_PATH}/findOneByText?",
            data:{"regno":regno,"mz":mz},
            type:"POST",
            dataType:'json',
            success:function (result) {
                console.log(result)
                //调用方法循环
                find_stuc_text(result)
            }
        })
    }
    function find_stuc_text(result){
        $("#emr_table_1 tbody").empty();
        var Emr_bl_list = result.extend.pageInfo;
        $.each(Emr_bl_list,function (index, item) {

            // 这里是通过病案号和mz 获取到的主要内容，通过拼接的方式放到tbody 里面
            var h3_stuctname =  $("<h4></h4>").addClass("text-center").append(item.stuctname);
            var biaotou = $("<td></td>").append(h3_stuctname)
            var shijian  = $("<td></td>").append(item.bctime);
            var neirong = $("<td></td>").append(item.stuctext);
            $("<tr></tr>").append(biaotou).appendTo("#emr_table_1 tbody");
            $("<tr></tr>").append(shijian).appendTo("#emr_table_1 tbody");
            $("<tr></tr>").append(neirong).appendTo("#emr_table_1 tbody");
        } )
    }
    function findHzxx(regno) {
        $.ajax({
            url:"${APP_PATH}/findRybl?",
            data:{"bah":regno},
            type:"POST",
            dataType:"json",
            success:function (result) {
                // 调用方法信心 for each 循环
                find_hzxx(result)
                console.log(result)
            }
        })
    }
    function find_hzxx(result) {
        var hzxx = result.extend.hzqkb;
        $.each(hzxx,function (index,item) {
            $(".hzxm").append(item.hzxm);
            $(".sfzh").append(item.sfzh);
            $(".xb").append(item.xb);
            $(".gjdz").append(item.gjdz);
            $(".nly").append(item.nly);
            $(".gzdw").append(item.gzdw);
            $(".hf").append(item.hf);
            $(".minzu").append(item.minzu);
            $(".ryrq").append(item.ryrq);
            $(".zy").append(item.zy);
        })
    }
</script>
</html>
