<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/5/0005
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>出院记录</title>
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
        <h1>出院记录</h1>
    </div>
</center>
<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-hover" id="yytable">
                <thead>
                <tr>
                    <th style="text-align: center;vertical-align:middle;">
                        ICD10
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        西医出院诊断
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        出院情况
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        入院病情
                    </th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <center>
                <div class="col-md-12">
                    <div id = "page_info_area_yy" style="font-family:'隶书';font-size: 20px;"></div>
                    <div  id="page_nav_area_yy"></div>
                </div>
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
        findAllByBah(1,bah,zycs);
    });
    function findAllByBah(pn,bah,zycs) {
        $.ajax({
            url:"${APP_PATH}/findAllByBah",
            data:{"pn":pn,"bah":bah,'zycs':zycs},
            type:"post",
            dataType:'json',
            success:function (result) {
                //1\ 解析并显示员工数据
                hzjbqkZdqkCyzd(result);
                // 2、解析并显示分页信息
                build_page_info_yy(result);
                //3解析并显示分页条信息
                build_page_nav_yy(result);
            }
        })
    }

    function hzjbqkZdqkCyzd(result) {
        // 每次点击清空table
        $("#yytable tbody").empty();  // 清空
        var emr = result.extend.hzjbqkZdqkCyzd.list;
        $.each(emr , function (index,item) {
            var zd_icd10 = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.zdIcd10);
            var zd_mc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.zdMc);
            var zlxg = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.zlxg);
            var ryqk = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.ryqk);

            //appen方法直行完成以后还是返回原来的元素
            $("<tr></tr>").append(zd_icd10)
                .append(zd_mc)
                .append(zlxg)
                .append(ryqk)
                .appendTo("#yytable tbody");//把数据提交到emr_table 中tbody
        })
    }

    function build_page_info_yy(result){
        $("#page_info_area_yy").empty();//清空分页信息

        $("#page_info_area_yy").append("当前"+result.extend.hzjbqkZdqkCyzd.pageNum+"页","总"+
            result.extend.hzjbqkZdqkCyzd.pages +"页," +
            "总"+result.extend.hzjbqkZdqkCyzd.total+"记录数")
    }

    function build_page_nav_yy(result) {
        $("#page_nav_area_yy").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.hzjbqkZdqkCyzd.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                findAllByBah(1,bah,zycs);
            });
            prePageLi.click(function () {
                findAllByBah(result.extend.hzjbqkZdqkCyzd.pageNum - 1,bah,zycs);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.hzjbqkZdqkCyzd.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                findAllByBah(result.extend.hzjbqkZdqkCyzd.pageNum + 1,bah,zycs);
            });
            lastPageLi.click(function () {
                findAllByBah(result.extend.hzjbqkZdqkCyzd.pages,bah,zycs);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.hzjbqkZdqkCyzd.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.hzjbqkZdqkCyzd.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                findAllByBah(item,bah,zycs);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_yy");
    }

    <%--function go_back() {--%>
    <%--    window.location.href="${sessionScope.path}/ssm_crud_war/index.jsp";--%>
    <%--    sessionStorage.clear()--%>
    <%--}--%>
</script>
</html>
