<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/5/0005
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医嘱记录</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--<button style="margin-top: 50px;margin-left: 50px" class="btn btn-primary btn-sm" onclick="go_back()">←&nbsp;&nbsp;返回首页</button>--%>
<center class="row">
    <div class="col-md-12">
        <h1>沧州市精神病医院</h1>
        <h1>医嘱记录</h1>
    </div>
</center>
<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div>
                <button class="btn btn-primary btn-sm find_cyjl btn_cq">长期医嘱</button>
                <button class="btn btn-primary btn-sm find_cyjl btn_ls">临时医嘱</button>
            </div>
            <table class="table table-hover" id="yz_table">
                <thead>
                <tr>
                    <th style="text-align: center;vertical-align:middle;">开始时间</th>
                    <th style="text-align: center;vertical-align:middle;">医嘱内容</th>
                    <th style="text-align: center;vertical-align:middle;">剂量</th>
                    <th style="text-align: center;vertical-align:middle;">单位</th>
                    <th style="text-align: center;vertical-align:middle;">用药频次</th>
                    <th style="text-align: center;vertical-align:middle;">执行时间</th>
                    <th style="text-align: center;vertical-align:middle;">医师</th>
                    <th style="text-align: center;vertical-align:middle;">护士</th>
                    <th style="text-align: center;vertical-align:middle;">停止时间</th>
                    <th style="text-align: center;vertical-align:middle;">医师</th>
                    <th style="text-align: center;vertical-align:middle;">护士</th>
                    <th style="text-align: center;vertical-align:middle;">医嘱标志</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <center>
                <div id = "page_info_area_yz" style="font-family:'隶书';font-size: 20px;"></div>
                <div  id="page_nav_area_yz"></div>
            </center>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    var bah_D
    var zycs_D
    $(function () {
        var bah = sessionStorage.getItem( "bah" );
        bah_D =  bah
        var zycs = sessionStorage.getItem( "zycs" );
        zycs_D = zycs
        to_page_two_cq(1,bah,zycs);
    });

    function to_page_two(pn,bah,zycs){
        $.ajax({
            url:"${APP_PATH}/findYz",
            data:{"pn":pn,"bah":bah,'zycs':zycs},
            type:"get",
            success:function (result) {
                console.log(result);
                //1\ 解析并显示员工数据
                //console.log(result)
                var bz = '长期'
                build_yz_table(result,bz);
                // 2、解析并显示分页信息
                build_page_info_yz(result);
                //3解析并显示分页条信息
                build_page_nav_yz(result);
            }
        })
    }
            // 需要增加一个参数，判断是否为长期医嘱
    function build_yz_table(result,bz) {

        // 每次点击清空table
        $("#yz_table tbody").empty();  // 清空
        var yz = result.extend.findyz.list;
        $.each(yz , function (index,item) {

            var sxsj =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.sxsj);
            var xmmc =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.xmmc);
            var jl   =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.jl);
            var jldw =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.jldw);
            var yfpc=$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.pcmc);
            alert(item.pcmc)
            var yyms =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.yyms);
            var ysdm =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.ysdm);
            var hdr1 =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.hdr1);
            var tzsj =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.tzsj);

            if (bz == "临时"){
                var tzys =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append("");
                var tzry =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append("");
            }
            else {
                var tzys =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.tzys);
                var tzry =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.tzry);
            }


            var yzbz =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.yzbz);

            //appen方法直行完成以后还是返回原来的元素

                $("<tr></tr>").append(sxsj)
                    .append(xmmc)
                    .append(jl)
                    .append(jldw)
                    .append(yfpc)
                    .append(yyms)
                    .append(ysdm)
                    .append(hdr1)
                    .append(tzsj)
                    .append(tzys)
                    .append(tzry)
                    .append(yzbz)
                    .appendTo("#yz_table tbody");//把数据提交到emr_table 中tbody

        })
    }

    function build_page_info_yz(result) {
         $("#page_info_area_yz").empty();//清空分页信息
         $("#page_info_area_yz").append("当前"+result.extend.findyz.pageNum+"页","总"+
             result.extend.findyz.pages +"页," +
             "总"+result.extend.findyz.total+"记录数")
    }

    function build_page_nav_yz(result) {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        $("#page_nav_area_yz").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.findyz.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                to_page_two(1,bah,zycs);
            });
            prePageLi.click(function () {
                to_page_two(result.extend.findyz.pageNum - 1,bah,zycs);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.findyz.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                to_page_two(result.extend.findyz.pageNum + 1,bah,zycs);
            });
            lastPageLi.click(function () {
                to_page_two(result.extend.findyz.pages,bah,zycs);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.findyz.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.findyz.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                to_page_two(item,bah,zycs);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_yz");

    }

    <%--function go_back() {--%>
    <%--    window.location.href="${sessionScope.path}/ssm_crud_war/index.jsp";--%>
    <%--    sessionStorage.clear()--%>
    <%--}--%>
    $(document).on('click','.btn_cq',function () {
       // alert("长期")
        to_page_two_cq(1,bah_D,zycs_D)
    });
    function to_page_two_cq(pn,bah_D,zycs_D){
        bah_D = bah_D.replace(/(^\s*)|(\s*$)/g, "") // 删除空格
        $.ajax({
            url:"${APP_PATH}/findYzCq?",
            data:{"pn":pn,"bah":bah_D,'zycs':zycs_D},
            type:"get",
            success:function (result) {
                console.log(result);
                //1\ 解析并显示员工数据
                //console.log(result)
                var bz = '长期'
                 build_yz_table(result,bz);
                // // 2、解析并显示分页信息
                 build_page_info_yz(result);
                // //3解析并显示分页条信息
                 build_page_nav_yz_cq(result);
            }
        })
    }
//       --------------------------------------长期分页---------------------------------------------------------------------------

    function build_page_nav_yz_cq(result) {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        $("#page_nav_area_yz").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.findyz.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                to_page_two_cq(1,bah,zycs);
            });
            prePageLi.click(function () {
                to_page_two_cq(result.extend.findyz.pageNum - 1,bah,zycs);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.findyz.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                to_page_two_cq(result.extend.findyz.pageNum + 1,bah,zycs);
            });
            lastPageLi.click(function () {
                to_page_two_cq(result.extend.findyz.pages,bah,zycs);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.findyz.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.findyz.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                to_page_two_cq(item,bah,zycs);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_yz");

    }


















    $(document).on('click','.btn_ls',function () {
       // alert("临时")
        to_page_two_ls(1,bah_D,zycs_D)

    });


    function to_page_two_ls(pn,bah_D,zycs_D){
        bah_D = bah_D.replace(/(^\s*)|(\s*$)/g, "") // 删除空格
        $.ajax({
            url:"${APP_PATH}/findYzLs",
            data:{"pn":pn,"bah":bah_D,'zycs':zycs_D},
            type:"get",
            success:function (result) {
                //console.log(result);
                //1\ 解析并显示员工数据
                //console.log(result)
                var bz = '临时'
                build_yz_table(result,bz);
                // 2、解析并显示分页信息
                build_page_info_yz(result);
                //3解析并显示分页条信息
                build_page_nav_yz_ls(result);
            }
        })
    }
//    -----------------------------临时分页--------------------------------------------------------

    function build_page_nav_yz_ls(result) {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        $("#page_nav_area_yz").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.findyz.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                to_page_two_ls(1,bah,zycs);
            });
            prePageLi.click(function () {
                to_page_two_ls(result.extend.findyz.pageNum - 1,bah,zycs);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.findyz.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                to_page_two_ls(result.extend.findyz.pageNum + 1,bah,zycs);
            });
            lastPageLi.click(function () {
                to_page_two_ls(result.extend.findyz.pages,bah,zycs);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.findyz.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.findyz.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                to_page_two_ls(item,bah,zycs);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_yz");
    }


</script>
</html>
