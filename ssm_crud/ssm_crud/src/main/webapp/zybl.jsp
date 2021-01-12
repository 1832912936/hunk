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
    <title>住院病历</title>
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
        <h1>住院病历</h1>
    </div>
</center>
<div>
    <div class="row" style="display: inline;">

        <div class="col-md-1"></div>
        <div class="col-md-4" style="display: inline;">
            <table class="table table-hover" id="emr_bl_table">
                <thead>
                <tr>

                    <th style="text-align: center;vertical-align:middle;">病案号</th>
                    <th style="text-align: center;vertical-align:middle;">住院病历</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">住院病历</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>


                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">护理</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>




                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">手术</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>


                    <tr>
                        <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                        <td style="text-align: center;vertical-align:middle;">感染</td>
                        <td> <button class="btn btn-primary btn-sm find_bl">
                                <span class="glyphicon glyphicon-pencil">查看</span>
                            </button>
                        </td>
                    </tr>


                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">会诊</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>


                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">其他</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>



                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">出院小结</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>


                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">门诊</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>


                <tr>
                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>
                    <td style="text-align: center;vertical-align:middle;">病程记录</td>
                    <td> <button class="btn btn-primary btn-sm find_bl">
                        <span class="glyphicon glyphicon-pencil">查看</span>
                    </button>
                    </td>
                </tr>


<%--                <tr>--%>
<%--                    <td class="td_regno" style="text-align: center;vertical-align:middle;"></td>--%>
<%--                    <td style="text-align: center;vertical-align:middle;">病案首页</td>--%>
<%--                    <td> <button class="btn btn-primary btn-sm find_bl">--%>
<%--                        <span class="glyphicon glyphicon-pencil">查看</span>--%>
<%--                    </button>--%>
<%--                    </td>--%>
<%--                </tr>--%>


                </tbody>
            </table>
        </div>

        <%--后续数据--%>
        <div class="col-md-6" style="display: inline;">
            <table class="table table-hover" id="emr_bl_stuc">
                <div>
<%--              style="display: inline;float: right;--%>
                     <h3 id="rq">病人入院时间：</h3>
                </div>
                <thead>
                <tr>
<%--                    <th>&nbsp;</th>--%>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var regno = sessionStorage.getItem( "regno" );
        var ipTime = sessionStorage.getItem( "ipTime" );
        $(".td_regno").append(regno)
        $("<span></span>").append(ipTime).appendTo("#rq");
        find(regno);
    });
    function find(regno) {

        $.ajax({
            url:"${APP_PATH}/findOneById?",
            data:"regno="+regno,
            type:"POST",
            success:function (result) {
                var Emr_bl_list = result.extend.a;
                //1、显示并解析第二章表的数据 修改默认值
                 // build_bl_table(result);
            }
        })
    }
    function build_bl_table(result) {
        //每次点击清空数据
        $("#emr_bl_table tbody").empty();  // 清空
        //备注：这里需要改为 没有也要显示 住院病历模块， 实现原理 病案号是活值，通过一个死的值for循环进行循环出所有的住院病历模板， 点击查看通过获取的 病案号和 死值的病历 模板进行数据库查询如果没有就 显示无数据
        var Emr_bl = result.extend.a;
        if (Emr_bl == 1){
            //数据为空添加到emr_bl_table  tbody
            var aTb = $("<th></th>").append("无数据");
            $("#emr_bl_stuc tbody").empty();  // 清空
            $("<tr></tr>").append(aTb).appendTo("#emr_bl_table tbody");//把数据提交到emr_table 中tbody
        }else{
            $("#emr_bl_stuc tbody").empty();  // 清空
            var Emr_bl_list = result.extend.a;
            $.each(Emr_bl_list,function (index, item) {
                var Emr_bl_regno_tb = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.regno);
                var Emr_bl_name_tb = $("<td style=\"text-align: center;vertical-align:middle;\"></td>").append(item.mz);
                var findBtn  = $("<button></button>").addClass("btn btn-primary btn-sm find_bl")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看");
                $("<tr></tr>").append(Emr_bl_regno_tb)
                    .append(Emr_bl_name_tb)
                    .append(findBtn)
                    .appendTo("#emr_bl_table tbody");
            } )
        }
    }


    $(document).on("click",".find_bl",function (){
        // 备注：需要添加东西  如果点击的是名称记录那么就走另外一个接口，接口单独调用条语句取
        // 或者 不使用text文档显示 ， 使用纯文本内容
        var regno = $(this).parents("tr").find("td:eq(0)").text();
        var  mz = $(this).parents("tr").find("td:eq(1)").text();
        $.ajax({
            url:"${APP_PATH}/findOneByText?",
            data:{"regno":regno,"mz":mz},
            type:"POST",
            dataType:'json',
            success:function (result) {
                console.log(result)
                sessionStorage.setItem("regno",regno);
                sessionStorage.setItem("mz",mz);
                if (mz =="住院病历"){
                    //通过进行排版
                window.open("${sessionScope.path}/ssm_crud_war/rybl_html.jsp");
                }else
                    if(mz =="病程记录"){
                    window.open("${sessionScope.path}/ssm_crud_war/bcjl.jsp")
                }else
                    if(mz == '出院小结'){
                        window.open("${sessionScope.path}/ssm_crud_war/cyxj.jsp")
                    }
                    else {
                            build_bl_stuc(result);
                }
            }
        })
    });
    function build_bl_stuc(result){
        $("#emr_bl_stuc tbody").empty();
        var tr  = $("<tr></tr>");
        var td = $("<td></td>");
        var hr = $("<hr>");
        $("<textarea  id=\"textarea_text\" style=\"height: 680px;width: 100%;resize: none;\" readonly></textarea>")
            .append(td)
            .append(tr).appendTo("#emr_bl_stuc tbody");
        var Emr_bl_list = result.extend.pageInfo;
        $.each(Emr_bl_list,function (index, item) {
            $("#textarea_text")
                .append("                                                                                       "+item.stuctname+"\n")
                .append("                 " +"\n")
                .append(item.stuctext+"\n");
        } )
    }
</script>
</html>
