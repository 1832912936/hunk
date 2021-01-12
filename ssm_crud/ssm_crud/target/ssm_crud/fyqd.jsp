<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/16/0016
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>住院费用清单</title>
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
        <h1>住院费用清单</h1>
    </div>
</center>
<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-hover" id="zyfyqd">
                <thead>
                    <tr>
                        <th style="text-align: center;vertical-align:middle;">
                            开据科室
                        </th>
                        <th style="text-align: center;vertical-align:middle;">
                            项目名称
                        </th>
                        <th style="text-align: center;vertical-align:middle;">
                            规格
                        </th>
                        <th style="text-align: center;vertical-align:middle;">
                            零售单位
                        </th>
                        <th style="text-align: center;vertical-align:middle;">
                            零售价
                        </th>
                        <th style="text-align: center;vertical-align:middle;">
                            数量
                        </th>
                        <th style="text-align: center;vertical-align:middle;">
                            金额
                        </th>
                        <th style="text-align: center;vertical-align:middle;">
                            收费时间
                        </th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <center>
                <div id = "page_info_area_fyqd" style="font-family:'隶书';font-size: 20px;"></div>
                <div id="page_nav_area_fyqd"></div>
            </center>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        findfyqd(1,bah,zycs);
    });

    function findfyqd(pn,bah,zycs) {
        $.ajax({
            url:"${APP_PATH}/findFyqd",
            data:{"pn":pn,"bah":bah,"zycs":zycs},
            type:"post",
            dataType:'json',
            success:function (result) {
                findfyqda(result);
                page_info_area_fyqd(result);
                page_nav_area_fyqd(result);
            }
        })
    }

    function findfyqda(result) {
        // 每次点击清空table
        $("#zyfyqd tbody").empty();  // 清空
        var emr = result.extend.zyYpXmHzs.list;
        $.each(emr , function (index,item) {
            var kjksmc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.kjksmc);
            var xmmc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.xmmc);
            var gg = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.gg);
            var lsdw = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.lsdw);
            var lsj = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.lsj);
            var sl = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.sl);
            var lsje = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.lsje);
            var sfsj = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.sfsj);

            //appen方法直行完成以后还是返回原来的元素
            $("<tr></tr>").append(kjksmc)
                .append(xmmc)
                .append(gg)
                .append(lsdw)
                .append(lsj)
                .append(sl)
                .append(lsje)
                .append(sfsj)
                .appendTo("#zyfyqd tbody");//把数据提交到emr_table 中tbody
        })
    }

    function page_info_area_fyqd(result){
        $("#page_info_area_fyqd").empty();//清空分页信息

        $("#page_info_area_fyqd").append("当前"+result.extend.zyYpXmHzs.pageNum+"页","总"+
            result.extend.zyYpXmHzs.pages +"页," +
            "总"+result.extend.zyYpXmHzs.total+"记录数")
    }

    function page_nav_area_fyqd(result) {
        var bah = sessionStorage.getItem( "bah" );
        var zycs = sessionStorage.getItem( "zycs" );
        $("#page_nav_area_fyqd").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.zyYpXmHzs.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                findfyqd(1,bah,zycs);
            });
            prePageLi.click(function () {
                findfyqd(result.extend.zyYpXmHzs.pageNum - 1,bah,zycs);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.zyYpXmHzs.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                findfyqd(result.extend.zyYpXmHzs.pageNum + 1,bah,zycs);
            });
            lastPageLi.click(function () {
                findfyqd(result.extend.zyYpXmHzs.pages,bah,zycs);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.zyYpXmHzs.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.zyYpXmHzs.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                findfyqd(item,bah,zycs);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_fyqd");
    }

    <%--function go_back() {--%>
    <%--    window.location.href="${sessionScope.path}/ssm_crud_war/index.jsp";--%>
    <%--    sessionStorage.clear()--%>
    <%--}--%>
</script>
</html>
