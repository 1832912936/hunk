<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/5/0005
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查检验</title>
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
        <h1>检查检验</h1>
    </div>
</center>
<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-hover" id="sstable">
                <thead>
                <tr>
                    <th style="text-align: center;vertical-align:middle;">
                        门诊住院号
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        病人姓名
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        送检医生名称
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        检验时间
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        标本类型
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        组合名称
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        病人编码
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        病人类别名称
                    </th>
                    <th style="text-align: center;vertical-align:middle;">
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <center>
                <div id = "page_info_area_zyc" style="font-family:'隶书';font-size: 20px;"></div>
                <div id="page_nav_area_zyc"></div>
            </center>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var ipNo = sessionStorage.getItem( "ipNo" );
        findjy(1,ipNo);
    });

    function findjy(pn,ipNo) {
        $.ajax({
            url:"${APP_PATH}/findjy",
            data:{"pn":pn,"ipNo":ipNo},
            type:"post",
            dataType:'json',
            success:function (result) {
                //1\ 解析并显示员工数据
                hzjbqkSsqks(result);
                // 2、解析并显示分页信息
                build_page_info_zyc(result);
                //3解析并显示分页条信息
                build_page_nav_zyc(result);
            }
        })
    }

    function hzjbqkSsqks(result) {
        // 每次点击清空table
        $("#sstable tbody").empty();  // 清空
        var emr = result.extend.viewLisBrxx.list;
        $.each(emr , function (index,item) {
            var applyitem_jq = item.applyitem;
            if (applyitem_jq.length > 10) {
                var a = (applyitem_jq.slice(0,10)+"...");
                var applyitem = $("<td title=\""+applyitem_jq+"\" style=\"text-align: center;vertical-align:middle;\"></td>").append(a);
            }else{
                var applyitem = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.applyitem);
            }
            var vmzzyh = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vmzzyh);
            var vbrxm = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vbrxm);
            var vsjysmc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vsjysmc);
            var dJysj = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.dJysj);
            var vbblx = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vbblx);
            var vbrbm = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vbrbm);
            var vbrlbmc = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.vbrlbmc);
            var findjjBtn  = $("<button></button>").addClass("btn btn-primary btn-sm find_jj")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看");

            //appen方法直行完成以后还是返回原来的元素
            $("<tr></tr>").append(vmzzyh)
                .append(vbrxm)
                .append(vsjysmc)
                .append(dJysj)
                .append(vbblx)
                .append(applyitem)
                .append(vbrbm)
                .append(vbrlbmc)
                .append(findjjBtn)
                .appendTo("#sstable tbody");//把数据提交到emr_table 中tbody
        })
    }

    $(document).on("click",".find_jj",function (){
        var vBrbm = $(this).parents("tr").find("td:eq(6)").text();
        sessionStorage.setItem("vBrbm",vBrbm);
        window.location.href="${sessionScope.path}/ssm_crud_war/jyjc_1.jsp";
    });


    function build_page_info_zyc(result){
        $("#page_info_area_zyc").empty();//清空分页信息

        $("#page_info_area_zyc").append("当前"+result.extend.viewLisBrxx.pageNum+"页","总"+
            result.extend.viewLisBrxx.pages +"页," +
            "总"+result.extend.viewLisBrxx.total+"记录数")
    }

    function build_page_nav_zyc(result) {
        var ipNo = sessionStorage.getItem( "ipNo" );
        $("#page_nav_area_zyc").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.viewLisBrxx.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                findjy(1,ipNo);
            });
            prePageLi.click(function () {
                findjy(result.extend.viewLisBrxx.pageNum - 1,ipNo);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.viewLisBrxx.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                findjy(result.extend.viewLisBrxx.pageNum + 1,ipNo);
            });
            lastPageLi.click(function () {
                findjy(result.extend.viewLisBrxx.pages,ipNo);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.viewLisBrxx.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.viewLisBrxx.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                findjy(item,ipNo);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_zyc");
    }

    <%--function go_back() {--%>
    <%--    window.location.href="${sessionScope.path}/ssm_crud_war/index.jsp";--%>
    <%--    sessionStorage.clear()--%>
    <%--}--%>
</script>
</html>
