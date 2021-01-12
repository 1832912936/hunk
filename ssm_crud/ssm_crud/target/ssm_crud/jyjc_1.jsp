<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/9/0009
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查结果</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--<button style="margin-top: 50px;margin-left: 50px" class="btn btn-primary btn-sm" onclick="go_back()">←&nbsp;&nbsp;返回首页</button>--%>
<button style="margin-top: 50px;margin-left: 50px" class="btn btn-primary btn-sm" onclick="go_back_1()">←&nbsp;&nbsp;返回上一页</button>
<center class="row">
    <div class="col-md-12">
        <h1>沧州市精神病医院</h1>
        <h1>检查结果</h1>
    </div>
</center>
<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-hover" id="jyjcjl">
                <thead>
                <tr>
                    <th style="text-align: center;vertical-align:middle;">
                        项目名称
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        英文名称
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        检验结果
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        结果单位
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        结果标示状态
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        参考值
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        参考值类型
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        标志
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        病人编码
                    </th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <center>
                <div id = "page_info_area_jj" style="font-family:'隶书';font-size: 20px;"></div>
                <div id="page_nav_area_jj"></div>
            </center>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var vBrbm = sessionStorage.getItem('vBrbm');
        find(1,vBrbm)
    });

    function find(pn,vBrbm){
        $.ajax({
            url:"${APP_PATH}/findjj",
            data:{"pn":pn,"vBrbm":vBrbm},
            type:"POST",
            dataType:'json',
            success:function (result) {
                findjj(result);
                build_page_info_jj(result);
                build_page_nav_jj(result);
            }
        })
    }

    function findjj(result) {
        // 每次点击清空table
        $("#jyjcjl tbody").empty();  // 清空
        var emr = result.extend.viewLisJyjgLisJieguos.list;
        console.log(emr);
        $.each(emr , function (index,item) {
            var vxmmc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vxmmc);
            var vywmc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vywmc);
            var vjyjg = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vjyjg);
            var vdw = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vdw);
            var vjgzt = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vjgzt);
            var vckz = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vckz);
            var vckzlx = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vckzlx);
            var vbz  = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vbz);
            var vbrbm = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vbrbm);

            //appen方法直行完成以后还是返回原来的元素
            $("<tr></tr>").append(vxmmc)
                .append(vywmc)
                .append(vjyjg)
                .append(vdw)
                .append(vjgzt)
                .append(vckz)
                .append(vckzlx)
                .append(vbz)
                .append(vbrbm)
                .appendTo("#jyjcjl tbody");//把数据提交到emr_table 中tbody
        })
    }

    function build_page_info_jj(result){
        $("#page_info_area_jj").empty();//清空分页信息

        $("#page_info_area_jj").append("当前"+result.extend.viewLisJyjgLisJieguos.pageNum+"页","总"+
            result.extend.viewLisJyjgLisJieguos.pages +"页," +
            "总"+result.extend.viewLisJyjgLisJieguos.total+"记录数")
    }

    function build_page_nav_jj(result) {
        var vBrbm = sessionStorage.getItem("vBrbm")
        $("#page_nav_area_jj").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.viewLisJyjgLisJieguos.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                find(1,vBrbm);
            });
            prePageLi.click(function () {
                find(result.extend.viewLisJyjgLisJieguos.pageNum - 1,vBrbm);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.viewLisJyjgLisJieguos.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                find(result.extend.viewLisJyjgLisJieguos.pageNum + 1,vBrbm);
            });
            lastPageLi.click(function () {
                find(result.extend.viewLisJyjgLisJieguos.pages,vBrbm);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.viewLisJyjgLisJieguos.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.viewLisJyjgLisJieguos.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                find(item,vBrbm);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_jj");
    }

    <%--function go_back() {--%>
    <%--    window.location.href="${sessionScope.path}/ssm_crud_war/index.jsp";--%>
    <%--    sessionStorage.clear()--%>
    <%--}--%>
    function go_back_1() {
        window.location.href="${sessionScope.path}/ssm_crud_war/jyjc.jsp";
        sessionStorage.removeItem("vBrbm");
    }
</script>
</html>
