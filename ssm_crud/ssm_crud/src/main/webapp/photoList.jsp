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
<%--<button style="margin-top: 50px;margin-left: 50px" class="btn btn-primary btn-sm" onclick="go_back()">←&nbsp;&nbsp;返回首页</button>--%>
<center class="row">
    <div class="col-md-12">
    </div>
</center>
<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-hover" id="zyfyqd">
                <thead>
                <tr>
                    <th  style="text-align: center;vertical-align:middle;">病案号</th>
                    <th  style="text-align: center;vertical-align:middle;">住院次数</th>
                    <th  style="text-align: center;vertical-align:middle;">类别名称</th>
                    <th  style="text-align: center;vertical-align:middle;">路径</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <center>
                <div id = "page_info_area_photo" style="font-family:'隶书';font-size: 20px;"></div>
                <div id="page_nav_area_photo"></div>
            </center>

        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>

<script>

    $(function () {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        //alert(bah+"_______"+zycs )
        findPhotoList(1,bah,zycs)
    });
    // 获取到  bah 和zycs  可以通过 两个参数 在调用
    function findPhotoList(pn,bah,zycs) {
        $.ajax({
            url:"${APP_PATH}/findPhoto",
            data:{"pn":pn,"bah":bah,"zycs":zycs},
            type:"post",
            dataType:'json',
            success:function (result) {
               //成功之后 进行渲染
                console.log(result)
                findPhotoName(result)
                page_info_area_photo(result)
                page_nav_area_photo(result)
            }
        })
    }

    function findPhotoName(result) {
            $("#zyfyqd tbody").empty();//清空
        var emr = result.extend.getPhoto.list;
        $.each(emr,function (index,item) {
            var bah = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.bah);
            var zycs = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.zycs);
            var lbmc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.lbmc);
            var lj = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.lj);
            var findBtn  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_photo")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看图片");
            //appen方法直行完成以后还是返回原来的元素
            $("<tr></tr>").append(bah)
                .append(zycs)
                .append(lbmc)
                .append(lj)
                .append(findBtn)
                .appendTo("#zyfyqd tbody");//把数据提交到emr_table 中tbody

        })

    }
    $(document).on("click",".find_photo",function () {
        var lujing =$(this).parents("tr").find("td:eq(3)").text();

        var th = "/"
        lujing = lujing.replace(/\\/g,th)   // 将// 转换为  \\
        // 取到全局路径 把 全局路径传递到 photo.jsp 文件里面
        sessionStorage.setItem( "lujing",lujing );
        window.open("${sessionScope.path}/ssm_crud_war/photo.jsp"); // 跳转到 photo.jsp 页面里面


    })

    function page_info_area_photo(result){
        $("#page_info_area_photo").empty();//清空分页信息

        $("#page_info_area_photo").append("当前"+result.extend.getPhoto.pageNum+"页","总"+
            result.extend.getPhoto.pages +"页," +
            "总"+result.extend.getPhoto.total+"记录数")
    }

    function page_nav_area_photo(result) {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        $("#page_nav_area_photo").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.getPhoto.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                findPhotoList(1,bah,zycs);
            });
            prePageLi.click(function () {
                findPhotoList(result.extend.getPhoto.pageNum - 1,bah,zycs);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.getPhoto.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                findPhotoList(result.extend.getPhoto.pageNum + 1,bah,zycs);
            });
            lastPageLi.click(function () {
                findPhotoList(result.extend.getPhoto.pages,bah,zycs);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.getPhoto.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.getPhoto.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                findPhotoList(item,bah,zycs);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_photo");
    }




</script>
</html>


