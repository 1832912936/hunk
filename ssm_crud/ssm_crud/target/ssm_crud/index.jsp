
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>病历信息</title>
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

<%-- 搭建显示页面 --%>
<div>
    <center class="row">
        <div class="col-md-12">
            <h1>沧州市精神病医院</h1>
            <h1>病历信息</h1>
        </div>
    </center>
    <center>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入病历号：<input type="text" id="input_text">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入姓名：<input type="text" id="input_name">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入身份证号码：<input type="text" id="input_age">
        <button class="btn btn-primary btn-sm  btn_find_text" type="button">查询</button>
<%--        <button class="btn btn-primary btn-sm  btn_find_sx" type="button">刷新</button>--%>
    </center>

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-hover" id="emr_table" style="border-collapse: collapse;">
                <thead>
                <tr>
                    <th style="text-align: center;">病历编号</th>
                    <th style="text-align: center;">姓名</th>
                    <th style="text-align: center;">性别</th>
                    <th style="text-align: center;">年龄</th>
                    <th style="                                                             text-align: center;">操作</th>
                </tr>
                <tbody>
                </tbody>
            </table>
            <center>
                <%-- 显示分页信息 --%>
                <div>
                    <%-- 分页文字信息 --%>
                    <div id = "page_info_area" style="font-family:'隶书';font-size: 20px;"></div>
                    <%-- 分页条信息 --%>
                    <div  id="page_nav_area"></div>
                </div>
            </center>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</div>
<script type="text/javascript">

    //获取URL中传递过来的参数
    function getQueryVariable(variable)
    {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return('');
    }

    $(function () {
        var bah = getQueryVariable("id");
        $("#input_text").val(bah)

        // 查询数据
        //$(".btn_find_text").click(function () {
            var regno  = $("#input_text").val();
            var name = $("#input_name").val();
            var age = $("#input_age").val();
            if(regno==""&&name==""&&age==""){
                //  to_page(1);
                alert("请输入搜索条件")
                $("#emr_bl_stuc tbody").empty();
                $("#emr_bl_table tbody").empty();
            }else{
                to_page_ByName(1);
                $("#emr_bl_stuc tbody").empty();
                $("#emr_bl_table tbody").empty();
            }
       // });



    });

    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/findEmr",
            data:"pn="+pn,
            type:"get",
            success:function (result) {
               // console.log(result)
                //1\ 解析并显示员工数据
                build_Emr_table(result);
                // 2、解析并显示分页信息
                build_page_info(result);
                //3解析并显示分页条信息
                build_page_nav(result);
            }
        })
    }

    // 解析显示人员数据
    function build_Emr_table(result) {
        // 每次点击清空table
        $("#emr_table tbody").empty();  // 清空
        var emr = result.extend.pageInfo.list;
        $.each(emr , function (index,item) {
            var regnoTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.regno);
            var nameTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.name);
            var sexTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.sex=="1"?"男":"女");
            var ageTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.age);
            var ipNo = $("<td style='display: none'></td>").append(item.ipNo);
            var ipCnt = $("<td style='display: none'></td>").append(item.ipCnt);
          //  alert(item.ipCnt)
            var ipTime = $("<td style='display: none'></td>").append(item.ipTime);
            var findzyBtn  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_zy")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看住院病案");
            var findBtn  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看住院病历");
            var findBtn1  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_cyjl")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看出院诊断");
            var findBtn5  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_tw")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看体温单");
            var findBtn2  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_jyjc")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看检查检验记录");
            var findBtn3  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_yzjl")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看医嘱");
            var findBtn4  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_fyqd")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看住院费用清单");
            var findBtn6  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_photo")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看治疗单图片");
            var div1 = $("<div></div>").append(findzyBtn).append(findBtn).append(findBtn1).append(findBtn5);
            var div2 = $("<div></div>").append(findBtn2).append(findBtn3).append(findBtn4).append(findBtn6);
            var btn = $("<td style=\"text-align: center;vertical-align:middle;width: 600px;valign=\"middle\"\"></td>").append(div1).append(div2);
            $("<tr></tr>").append(regnoTd)
                .append(nameTd)
                .append(sexTd)
                .append(ageTd)
                .append(btn)
                .append(ipNo)
                .append(ipCnt)
                .append(ipTime)
                .appendTo("#emr_table tbody");
        })
    }

    $(document).on('click','.find_tw',function () {
        var ipNo =$(this).parents("tr").find("td:eq(5)").text();
        var ipCnt =$(this).parents("tr").find("td:eq(6)").text();
      //  alert(ipNo)
       // alert(ipCnt)
        sessionStorage.setItem("bah",ipNo);
        sessionStorage.setItem("zycs",ipCnt);
        $.ajax({
            url:"${APP_PATH}/findTw",
            data:{"pn":1,"bah":ipNo,"zycs":ipCnt},
            type:"post",
            dataType:'json',
            success:function (result) {

                var emr = result.extend.bqHlHzhldNexts.list;
                if(emr != ''){
                    //window.location.href="${sessionScope.path}/ssm_crud_war/twd.jsp";
                    window.open("${sessionScope.path}/ssm_crud_war/twd.jsp");
                }else {
                    alert('该病人暂无体温单')
                }
            }
        })

    });

    //查看住院费用清单
    $(document).on('click','.find_fyqd',function () {
        var ipNo =$(this).parents("tr").find("td:eq(5)").text();
        var ipCnt =$(this).parents("tr").find("td:eq(6)").text();
        sessionStorage.setItem("bah",ipNo);
        sessionStorage.setItem("zycs",ipCnt);
        $.ajax({
            url:"${APP_PATH}/findFyqd",
            data:{"pn":1,"bah":ipNo,"zycs":ipCnt},
            type:"post",
            dataType:'json',
            success:function (result) {
                var emr = result.extend.zyYpXmHzs.list;
                if(emr != ''){
                  //  window.location.href="${sessionScope.path}/ssm_crud_war/fyqd.jsp";
                    window.open("${sessionScope.path}/ssm_crud_war/fyqd.jsp");
                }else {
                    alert('该病人暂无住院费用清单')
                }
            }
        })

    });

    function build_page_info(result){
        $("#page_info_area").empty();//清空分页信息
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页","总"+
            result.extend.pageInfo.pages +"页," +
            "总"+result.extend.pageInfo.total+"记录数")
    }

    //解析显示分页信息
    function build_page_nav(result) {
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.pageInfo.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.pageInfo.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                to_page(item);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //查看住院病案
    $(document).on('click','.find_zy',function (key, value) {
        var ipNo =$(this).parents("tr").find("td:eq(5)").text();
       // alert(ipNo)
        sessionStorage.setItem("ipNo",ipNo);
       // window.location.href="${sessionScope.path}/ssm_crud_war/zyblsy.jsp";
        window.open("${sessionScope.path}/ssm_crud_war/zyblsy.jsp");
    });

    //查看出院诊断
    $(document).on('click','.find_cyjl',function () {
        var ipNo =$(this).parents("tr").find("td:eq(5)").text();
        $.ajax({
            url:"${APP_PATH}/findAll",
            data:{"pn":1,"ipNo":ipNo},
            type:"post",
            success:function (result) {
                var emr = result.extend.hzjbqkb.list;

                if(emr != ''){
                    $.each( emr , function (index,item) {
                        bah = item.bah;
                        sessionStorage.setItem("bah",bah);
                        zycs = item.zycs;
                        sessionStorage.setItem("zycs",zycs);
                    });
                    cyjl();
                }else{
                    alert('该患者住院病案不存在，无法查看出院记录！')
                }
            }
        });
    });

    function cyjl(){
        var bah = sessionStorage.getItem('bah');
        var zycs = sessionStorage.getItem('zycs');
       // console.log(bah,zycs);
        $.ajax({
            url:"${APP_PATH}/findAllByBah",
            data:{"pn":1,"bah":bah,'zycs':zycs},
            type:"post",
            dataType:'json',
            success:function (result) {
                var emr = result.extend.hzjbqkZdqkCyzd.list;
                if(emr != ''){
                   // window.location.href="${sessionScope.path}/ssm_crud_war/cyjl.jsp";
                    window.open("${sessionScope.path}/ssm_crud_war/cyjl.jsp");
                }else{
                    alert('该病人暂无出院记录！')
                }
            }
        });
    }

    //查看检查检验记录
    $(document).on('click','.find_jyjc',function () {
        var ipNo = $(this).parents("tr").find("td:eq(5)").text();
        sessionStorage.setItem("ipNo",ipNo);
        $.ajax({
            url:"${APP_PATH}/findjy",
            data:{"pn":1,"ipNo":ipNo},
            type:"post",
            dataType:'json',
            success:function (result) {
                var emr = result.extend.viewLisBrxx.list;
                if (emr != ''){
                   // window.location.href="${sessionScope.path}/ssm_crud_war/jyjc.jsp";
                    window.open("${sessionScope.path}/ssm_crud_war/jyjc.jsp");
                }else{
                    alert("该患者暂无检验检测记录！");
                }
            }
        });

    });

    //查看医嘱
    $(document).on('click','.find_yzjl',function () {
        var ipNo =$(this).parents("tr").find("td:eq(5)").text();
        $.ajax({
            url:"${APP_PATH}/findAll",
            data:{"pn":1,"ipNo":ipNo},
            type:"post",
            success:function (result) {
                var emr = result.extend.hzjbqkb.list;
                if(emr != ''){
                    $.each( emr , function (index,item) {
                        bah = item.bah;
                        sessionStorage.setItem("bah",bah);
                        zycs = item.zycs;
                        sessionStorage.setItem("zycs",zycs);
                    });
                    yzjl();
                }else{
                    alert('该患者住院病案不存在，无法查看医嘱记录！')
                }
            }
        });
    });

    function yzjl(){
        var bah = sessionStorage.getItem('bah');
        var zycs = sessionStorage.getItem('zycs');
        $.ajax({
            url:"${APP_PATH}/findYz",
            data:{"pn":1,"bah":bah,'zycs':zycs},
            type:"get",
            success:function (result) {
                var emr = result.extend.findyz.list;
                if(emr != ''){
                    //window.location.href="${sessionScope.path}/ssm_crud_war/yzjl.jsp";
                    window.open("${sessionScope.path}/ssm_crud_war/yzjl.jsp");
                }else{
                    alert('该病人暂无医嘱记录！')
                }
            }
        });
    }

    //查看住院病历
    $(document).on("click",".find_btn",function () {
        var regno = $(this).parents("tr").find("td:eq(0)").text();
        var ipTime = $(this).parents("tr").find("td:eq(7)").text();
        sessionStorage.setItem("regno",regno);
        sessionStorage.setItem("ipTime",ipTime);
      //  window.location.href="${sessionScope.path}/ssm_crud_war/zybl.jsp";
        window.open("${sessionScope.path}/ssm_crud_war/zybl.jsp")
    });

    // 查询数据
    $(".btn_find_text").click(function () {



        var regno  = $("#input_text").val();
        var name = $("#input_name").val();
        var age = $("#input_age").val();
        if(regno==""&&name==""&&age==""){
          //  to_page(1);
            alert("请输入搜索条件")
            $("#emr_bl_stuc tbody").empty();
            $("#emr_bl_table tbody").empty();
        }else{
            to_page_ByName(1);
            $("#emr_bl_stuc tbody").empty();
            $("#emr_bl_table tbody").empty();
        }
    });

    $(".btn_find_sx").click(function () {
        $("#input_text").val("");
        $("#input_name").val("");
        $("#input_age").val("");
        to_page(1);
        $("#emr_bl_stuc tbody").empty();
        $("#emr_bl_table tbody").empty();
    });

    function to_page_ByName(pn) {

        var regno  = $("#input_text").val();
        var name = $("#input_name").val();
        var age = $("#input_age").val();
        if(age==""){
            age;
        }else{
            age+"岁";
        }
        $.ajax({
            url:"${APP_PATH}/findOneByName?",
            data:"regno="+regno+"&name="+name+"&age="+age+"&pn="+pn,
            type: "POST",
            success:function (result) {
              // console.log(result)
                if(result.code=100){
                    //解析显示一条数据
                    bild_find_text(result);
                    // 2、解析并显示分页信息
                    build_page_info_text(result);
                    //3解析并显示分页条信息
                    build_page_nav_text(result);
                }else{
                    alert("暂无此信息相匹配人员");
                    //to_page(1);
                }
            }
        });
    }

    // 解析显示分页信息
    function build_page_info_text(result){
        $("#page_info_area").empty();//清空分页信息
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页","总"+
            result.extend.pageInfo.pages +"页," +
            "总"+result.extend.pageInfo.total+"记录数")
    }

    function build_page_nav_text(result) {
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.pageInfo.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                to_page_ByName(1);
            });
            prePageLi.click(function () {
                to_page_ByName(result.extend.pageInfo.pageNum - 1);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.pageInfo.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                to_page_ByName(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page_ByName(result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                to_page_ByName(item);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    function bild_find_text(result) {
        $("#emr_table tbody").empty();  // 清空
        var emr = result.extend.pageInfo.list;
        $.each(emr , function (index,item) {
            var regnoTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.regno);
            var nameTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.name);
            var sexTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.sex=="1"?"男":"女");
            var ageTd = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.age);
            var ipNo = $("<td style='display: none'></td>").append(item.ipNo);
            var ipCnt = $("<td style='display: none'></td>").append(item.ipCnt);
            var ipTime = $("<td style='display: none'></td>").append(item.ipTime);
            var findzyBtn  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_zy")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看住院病案");
            var findBtn  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看住院病历");
            var findBtn1  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_cyjl")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看出院诊断");
            var findBtn5  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_tw")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看体温单");
            var findBtn2  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_jyjc")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看检查检验记录");
            var findBtn3  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_yzjl")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看医嘱");
            var findBtn4  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_fyqd")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看住院费用清单");
            var findBtn6  = $("<button style='margin-right: 5px;margin-bottom: 5px'></button>").addClass("btn btn-primary btn-sm find_photo")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看治疗单图片");
            var div1 = $("<div></div>").append(findzyBtn).append(findBtn).append(findBtn1).append(findBtn5);
            var div2 = $("<div></div>").append(findBtn2).append(findBtn3).append(findBtn4).append(findBtn6);
            var btn = $("<td style=\"text-align: center;vertical-align:middle;width: 600px;valign=\"middle\"\"></td>").append(div1).append(div2);
            $("<tr></tr>").append(regnoTd)
                .append(nameTd)
                .append(sexTd)
                .append(ageTd)
                .append(btn)
                .append(ipNo)
                .append(ipCnt)
                .append(ipTime)
                .appendTo("#emr_table tbody");
        })
    }
    //  图片查看
    $(document).on('click','.find_photo',function () {
        var ipNo =$(this).parents("tr").find("td:eq(5)").text();
        var ipCnt =$(this).parents("tr").find("td:eq(6)").text();
        sessionStorage.setItem("bah",ipNo);
        sessionStorage.setItem("zycs",ipCnt);
        //获取到  bah 和zycs  通过ajax 进行传递值
        $.ajax({
            url:"${APP_PATH}/findPhoto",
            data:{"pn":1,"bah":ipNo,"zycs":ipCnt},
            type:"post",
            success:function (result) {
              // console.log(result)
                var emr = result.extend.getPhoto.list;
                if(emr != ''){
                    //window.location.href="${sessionScope.path}/ssm_crud_war/twd.jsp";
                    //判断返回来的值（即  在数据库搜索是否有这个人的  图片信息 如果有的进行跳转新的页面，新页面尽心  页面初始话加载方法 ，进行列表显示）
                    window.open("${sessionScope.path}/ssm_crud_war/photoList.jsp");
                }else {
                    alert('该病人暂无图片信息')
                }
            }
        })
    });

</script>
</body>
</html>
