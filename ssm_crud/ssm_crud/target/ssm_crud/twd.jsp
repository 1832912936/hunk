<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/17/0017
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>患者体温单</title>
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
        <h1>体温单</h1>
    </div>
</center>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <table class="table table-hover" id="tw_table">
            <thead>
            <tr>
                <th style="text-align: center;vertical-align:middle;">时间</th>
                <th style="text-align: center;vertical-align:middle;">住院天数</th>
                <th style="text-align: center;vertical-align:middle;">体温</th>
                <th style="text-align: center;vertical-align:middle;">脉搏</th>
                <th style="text-align: center;vertical-align:middle;">呼吸</th>
                <th style="text-align: center;vertical-align:middle;">类型</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <center>
            <div id = "page_info_area_tw" style="font-family:'隶书';font-size: 20px;"></div>
            <div  id="page_nav_area_tw"></div>
        </center>
    </div>
    <div class="col-md-1"></div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        findTw(1,bah,zycs);
    });

    function findTw(pn,bah,zycs){
        $.ajax({
            url:"${APP_PATH}/findTw",
            data:{"pn":pn,"bah":bah,"zycs":zycs},
            type:"post",
            dataType:'json',
            success:function (result) {
                console.log(result);
                build_tw_table(result);
                build_page_info_tw(result);
                build_page_nav_tw(result);
            }
        })
    }

    function build_tw_table(result) {
        // 每次点击清空table
        $("#tw_table tbody").empty();  // 清空
        var yz = result.extend.bqHlHzhldNexts.list;
        $.each(yz , function (index,item) {
            var sj =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.sj);
            var zyts =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.zyts);
            var tw =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.tw);
            var mb =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.mb);
            var hx =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.hx);
            var bz1 =$("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.bz1);
            //appen方法直行完成以后还是返回原来的元素
            $("<tr></tr>").append(sj)
                .append(zyts)
                .append(tw)
                .append(mb)
                .append(hx)
                .append(bz1)
                .appendTo("#tw_table tbody");//把数据提交到emr_table 中tbody
        })

    }

    function build_page_info_tw(result) {
        $("#page_info_area_tw").empty();//清空分页信息
        $("#page_info_area_tw").append("当前"+result.extend.bqHlHzhldNexts.pageNum+"页","总"+
            result.extend.bqHlHzhldNexts.pages +"页," +
            "总"+result.extend.bqHlHzhldNexts.total+"记录数")
    }

    function build_page_nav_tw(result) {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        $("#page_nav_area_tw").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.bqHlHzhldNexts.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                findTw(1,bah,zycs);
            });
            prePageLi.click(function () {
                findTw(result.extend.bqHlHzhldNexts.pageNum - 1,bah,zycs);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.bqHlHzhldNexts.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                findTw(result.extend.bqHlHzhldNexts.pageNum + 1,bah,zycs);
            });
            lastPageLi.click(function () {
                findTw(result.extend.bqHlHzhldNexts.pages,bah,zycs);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.bqHlHzhldNexts.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.bqHlHzhldNexts.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                findTw(item,bah,zycs);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_tw");

    }

    <%--function go_back() {--%>
    <%--    window.location.href="${sessionScope.path}/ssm_crud_war/index.jsp";--%>
    <%--    sessionStorage.clear()--%>
    <%--}--%>
</script>
</html>
