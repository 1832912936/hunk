<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/10/21
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图片</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%--<img class="image jsyysglimg"  src="http://localhost:8080/text/manage/query_pic?dz=E:/upload/indexfile/52b77290-0993-4a4d-b60c-2572953f2cc8.jpg" height="120" alt="" id="ZP2">--%>

<center>
<img class="image jsyysglimg"  src="" width="100%"  id="ZP2">
</center>
</body>

<script>
$(function () {
    var lujing = sessionStorage.getItem( "lujing" );
    console.log(lujing);
   // http://localhost:8080/ssm_crud_war/zybl.jsp
var photoPath =  "http://192.168.1.22:8080/ssm_crud_war/photo/query_pic?";
//dz就是图片的地址
$("#ZP2").attr("src", photoPath + "dz="+lujing);

})






</script>
</html>


