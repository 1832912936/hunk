<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2020/8/4/0004
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>住院病案首页</title>
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
        <h1>住院病案首页</h1>
    </div>
</center>
<div class="row" id="zybl">
    <div class="col-md-12">
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                <div>
                    医疗付款方式：<span id="fkfs" ></span>
                </div>
            </div>
            <div class="col-md-3">
                <div>
                    健康卡号：<span id="jkkh" ></span>
                </div>
            </div>
            <div class="col-md-3">
                <div>
                    第&nbsp;<span id="djc" ></span>&nbsp;次住院
                </div>
            </div>
            <div class="col-md-3">
                <div>
                    住院号：<span id="zyh" ></span>
                </div>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-2">
                姓名：<span id="xm" ></span>
            </div>
            <div class="col-md-2">
                性别：<span id="xb" ></span>
            </div>
            <div class="col-md-3">
                出生日期：<span id="csrq" ></span>
            </div>
            <div class="col-md-3">
                年龄：<span id="nl" ></span>
            </div>
            <div class="col-md-2">
                国籍：<span id="gj" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                （年龄不足1周岁的）年龄 &nbsp; <span id="nlz" ></span> &nbsp; 个月
            </div>
            <div class="col-md-4">
                新生儿出生体重&nbsp;<span id="cstz" ></span>&nbsp;克
            </div>
            <div class="col-md-4">
                新生儿入院体重&nbsp;<span id="rytz" ></span>&nbsp;克
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-2">
                出生地
            </div>
            <div class="col-md-2">
                <span id="s" ></span>省（区、市）
            </div>
            <div class="col-md-2">
                <span id="x" ></span>县
            </div>
            <div class="col-md-2">
                籍贯<span id="jg" ></span>
            </div>
            <div class="col-md-2">
                省（区、市）<span id="sqs" ></span>
            </div>
            <div class="col-md-2">
                民族：<span id="mz" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                身份证号：<span id="sfzh" ></span>
            </div>
            <div class="col-md-4">
                职业：<span id="zy" ></span>
            </div>
            <div class="col-md-4">
                婚否：<span id="hf" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                现住址：<span id="xzz" ></span>
            </div>
            <div class="col-md-4">
                电话：<span id="xzz_dh" ></span>
            </div>
            <div class="col-md-4">
                邮政编码：<span id="xzz_yb" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-6">
                户口地址：<span id="hk_dz" ></span>
            </div>
            <div class="col-md-6">
                邮政编码：<span id="hk_yb" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                工作单位：<span id="gzdw" ></span>
            </div>
            <div class="col-md-4">
                电话：<span id="gzdw_dh" ></span>
            </div>
            <div class="col-md-4">
                邮政编码：<span id="gzdw_yb" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                联系人姓名：<span id="lxr_xm" ></span>
            </div>
            <div class="col-md-3">
                关系：<span id="lxr_gx" ></span>
            </div>
            <div class="col-md-3">
                地址：<span id="lxr_dz" ></span>
            </div>
            <div class="col-md-3">
                电话：<span id="lxr_dh" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-12">
                入院途径：<span id="rytj" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-12">
                治疗类别：<span id="zllb" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                入院日期：<span id="ryrq" ></span>
            </div>
            <div class="col-md-3">
                入院科室：<span id="ryks" ></span>
            </div>
            <div class="col-md-3">
                病房：<span id="bf" ></span>
            </div>
            <div class="col-md-3">
                转科科室：<span id="zkks" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                出院日期：<span id="cyrq" ></span>
            </div>
            <div class="col-md-3">
                出院科室：<span id="cyks" ></span>
            </div>
            <div class="col-md-3">
                病房：<span id="bf_c" ></span>
            </div>
            <div class="col-md-3">
                实际住院：<span id="sjzy" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-6">
                门（急）诊诊断（中医诊断）：<span id="zyzd" ></span>
            </div>
            <div class="col-md-6">
                疾病编码：<span id="jbbm" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-6">
                门（急）诊诊断（中医诊断）：<span id="zyzd1" ></span>
            </div>
            <div class="col-md-6">
                疾病编码：<span id="jbbm1" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-6">
                实施临床路径：<span id="sslclj" ></span>
            </div>
            <div class="col-md-6">
                使用医疗机构中药制剂：<span id="zyzj" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                使用中医诊疗设备：<span id="zlsb" ></span>
            </div>
            <div class="col-md-4">
                使用中医诊疗技术：<span id="zljs" ></span>
            </div>
            <div class="col-md-4">
                辨证施护：<span id="bzsh" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                入院病情：<span id="rybq" ></span>
            </div>
            <div class="col-md-4">
                入院确诊日期：<span id="ryrq1" ></span>
            </div>
            <div class="col-md-4">
                确诊天数：<span id="qzts" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-12">
                损伤、中毒外部原因：<span id="yy" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-12">
                医院感染名称：<span id="grmc" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                病理诊断：<span  id="blzd" ></span>
            </div>
            <div class="col-md-4">
                疾病编码：<span id="blzd_icd10" ></span>
            </div>
            <div class="col-md-4">
                病历号：<span id="xx_bh" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                血型：<span id="xx_sxfy" ></span>
            </div>
            <div class="col-md-4">
                RH：<span id="xx_rh" ></span>
            </div>
            <div class="col-md-4">
                死亡患者尸检：<span id="sjbz" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-12">
                离院方式：<span id="liyuanfangshi" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                拟接收医疗机构名称：<span id="liyuan_jigou" ></span>
            </div>
            <div class="col-md-4">
                药物过敏：<span id="ywgm_hbsag" ></span>
            </div>
            <div class="col-md-4">
                <span id="ywgms" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-6">
                是否有出院31天内再住院计划：<span id="cy31ry" ></span>
            </div>
            <div class="col-md-6">
                目的：<span id="cy31ry_md" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                颅脑损伤患者昏迷时间：入院前&nbsp;<span id="hunmi_ryr" ></span>&nbsp;天
            </div>
            <div class="col-md-2">
                <span id="hunmi_rys" ></span>小时
            </div>
            <div class="col-md-2">
                <span id="hunmi_ryf" ></span>分钟
            </div>
            <div class="col-md-2">
                入院后&nbsp;<span id="hunmi_cyr" ></span>&nbsp;天
            </div>
            <div class="col-md-2">
                <span id="hunmi_cys" ></span>小时
            </div>
            <div class="col-md-1">
                <span id="hunmi_cyf" ></span>分钟
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                科主任<span id="ys_zr" ></span>
            </div>
            <div class="col-md-3">
                主任（副主任）医师<span id="ys_fzr" ></span>
            </div>
            <div class="col-md-3">
                主治医师<span id="ys_zz" ></span>
            </div>
            <div class="col-md-3">
                住院医师<span id="ys_zy" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                责任护士<span id="ys_yjs" ></span>
            </div>
            <div class="col-md-3">
                进修医师<span id="ys_jx" ></span>
            </div>
            <div class="col-md-3">
                实习医师<span id="ys_sx" ></span>
            </div>
            <div class="col-md-3">
                编码员<span id="bmry" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-3">
                病案质量分<span id="bazl" ></span>
            </div>
            <div class="col-md-3">
                质控医师<span id="bazl_zkys" ></span>
            </div>
            <div class="col-md-3">
                质控护士<span id="bzzl_zkhs" ></span>
            </div>
            <div class="col-md-3">
                质控日期<span id="bzzl_zkrq" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-2">
                诊断符合情况
            </div>
            <div class="col-md-2">
                门诊与出院：<span id="zdfh_mzcy" ></span>
            </div>
            <div class="col-md-3">
                入院与出院：<span id="zdfh_rycy" ></span>
            </div>
            <div class="col-md-3">
                术前与术后：<span id="zdfh_sqsh" ></span>
            </div>
            <div class="col-md-2">
                临床与病历：<span id="zdfh_lcbl" ></span>
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
        <div class="row">
            <div class="col-md-4">
                放射与病理：<span id="zdfh_fsbl" ></span>
            </div>
            <div class="col-md-4">
                抢救&nbsp;<span id="qjcs" ></span>&nbsp;次
            </div>
            <div class="col-md-4">
                成功&nbsp;<span id="qjcgcs" ></span>&nbsp;次
            </div>
        </div>
        <div style="width: 100%;height: 1px;background-color: black;border: 1px none black;margin: 5px 0px 5px 0px"></div>
    </div>
    <%-- 显示分页信息 --%>
    <center>
        <%-- 分页文字信息 --%>
        <div id = "page_info_area_sy" style="font-family:'隶书';font-size: 20px;"></div>
        <%-- 分页条信息 --%>
        <div  id="page_nav_area_sy"></div>
    </center>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var ipNo = sessionStorage.getItem( "ipNo" );
        findAll(1,ipNo);
    });

    function findAll(pn,ipNo) {
        $.ajax({
            url:"${APP_PATH}/findAll",
            data:{"pn":pn,"ipNo":ipNo},
            type:"post",
            success:function (result) {
                //1\ 解析并显示员工数据
                hzjbqkb(result);
                // 2、解析并显示分页信息
                build_page_info_sy(result);
                //3解析并显示分页条信息
                build_page_nav_sy(result);
                var emr = result.extend.hzjbqkb.list;
                $.each( emr , function (index,item) {
                    bah = item.bah;
                    zycs = item.zycs
                });
            }
        })
    }

    function hzjbqkb(result) {
        $("span p").empty();  // 清空
        var emr = result.extend.hzjbqkb.list;
        if(emr != ''){
            $.each(emr , function (index,item) {
                $("<p style='display : inline;'></p>").append(item.sflb).appendTo("#fkfs");
                $("<p style='display : inline;'></p>").append(item.jiankangka).appendTo("#jkkh");
                $("<p style='display : inline;'></p>").append(item.sjzycs).appendTo("#djc");
                $("<p style='display : inline;'></p>").append(item.bah).appendTo("#zyh");
                $("<p style='display : inline;'></p>").append(item.xm).appendTo("#xm");
                $("<p style='display : inline;'></p>").append(item.xb).appendTo("#xb");
                $("<p style='display : inline;'></p>").append(item.csrq).appendTo("#csrq");
                $("<p style='display : inline;'></p>").append(item.nlNum,item.nldw,item.nlChar).appendTo("#nl");
                $("<p style='display : inline;'></p>").append(item.gj).appendTo("#gj");
                $("<p style='display : inline;'></p>").append(item.nlBuzu).appendTo("#nlz");
                $("<p style='display : inline;'></p>").append(item.xinshengerTj).appendTo("#cstz");
                $("<p style='display : inline;'></p>").append(item.xinshengerRytj).appendTo("#rytz");
                $("<p style='display : inline;'></p>").append(item.csss).appendTo("#s");
                $("<p style='display : inline;'></p>").append(item.cssx).appendTo("#x");
                $("<p style='display : inline;'></p>").append(item.jgSs).appendTo("#jg");
                $("<p style='display : inline;'></p>").append(item.jgSx).appendTo("#sqs");
                $("<p style='display : inline;'></p>").append(item.mz).appendTo("#mz");
                $("<p style='display : inline;'></p>").append(item.sfzh).appendTo("#sfzh");
                $("<p style='display : inline;'></p>").append(item.zy).appendTo("#zy");
                $("<p style='display : inline;'></p>").append(item.hf).appendTo("#hf");
                $("<p style='display : inline;'></p>").append(item.xiandizhiDz).appendTo("#xzz");
                $("<p style='display : inline;'></p>").append(item.xiandizhiDh).appendTo("#xzz_dh");
                $("<p style='display : inline;'></p>").append(item.xiandizhiYb).appendTo("#xzz_yb");
                $("<p style='display : inline;'></p>").append(item.hkDz).appendTo("#hk_dz");
                $("<p style='display : inline;'></p>").append(item.hkYb).appendTo("#hk_yb");
                $("<p style='display : inline;'></p>").append(item.gzdwName).appendTo("#gzdw");
                $("<p style='display : inline;'></p>").append(item.gzdwDh).appendTo("#gzdw_dh");
                $("<p style='display : inline;'></p>").append(item.gzdwYb).appendTo("#gzdw_yb");
                $("<p style='display : inline;'></p>").append(item.lxrName).appendTo("#lxr_xm");
                $("<p style='display : inline;'></p>").append(item.lxrGx).appendTo("#lxr_gx");
                $("<p style='display : inline;'></p>").append(item.lxrDz).appendTo("#lxr_dz");
                $("<p style='display : inline;'></p>").append(item.lxrDh).appendTo("#lxr_dh");
                $("<p style='display : inline;'></p>").append(item.rytujing).appendTo("#rytj");
                $("<p style='display : inline;'></p>").append(item.zllb).appendTo("#zllb");
                $("<p style='display : inline;'></p>").append(item.ryrq).appendTo("#ryrq");
                $("<p style='display : inline;'></p>").append(item.ryks).appendTo("#ryks");
                $("<p style='display : inline;'></p>").append(item.bfRy).appendTo("#bf");
                $("<p style='display : inline;'></p>").append(item.zkks).appendTo("#zkks");
                $("<p style='display : inline;'></p>").append(item.cyrq).appendTo("#cyrq");
                $("<p style='display : inline;'></p>").append(item.cyks).appendTo("#cyks");
                $("<p style='display : inline;'></p>").append(item.bfCy).appendTo("#bf_c");
                $("<p style='display : inline;'></p>").append(item.zyts,item.zytsDw).appendTo("#sjzy");
                $("<p style='display : inline;'></p>").append(item.mzzdXy).appendTo("#zyzd");
                $("<p style='display : inline;'></p>").append(item.mzzdXyIcd10).appendTo("#jbbm");
                $("<p style='display : inline;'></p>").append(item.mzzd).appendTo("#zyzd1");
                $("<p style='display : inline;'></p>").append(item.mzzdIcd10).appendTo("#jbbm1");
                $("<p style='display : inline;'></p>").append(item.sslclj).appendTo("#sslclj");
                $("<p style='display : inline;'></p>").append(item.syyljgzyzj).appendTo("#zyzj");
                $("<p style='display : inline;'></p>").append(item.syzyzlsb).appendTo("#zlsb");
                $("<p style='display : inline;'></p>").append(item.syzyzljs).appendTo("#zljs");
                $("<p style='display : inline;'></p>").append(item.bzsh).appendTo("#bzsh");
                $("<p style='display : inline;'></p>").append(item.ryqk).appendTo("#rybq");
                $("<p style='display : inline;'></p>").append(item.ryqzrq).appendTo("#ryrq1");
                $("<p style='display : inline;'></p>").append(item.ryqzts).appendTo("#qzts");
                $("<p style='display : inline;'></p>").append(item.sszdwbyy).appendTo("#yy");
                $("<p style='display : inline;'></p>").append(item.yngrmc).appendTo("#grmc");
                $("<p style='display : inline;'></p>").append(item.blzd).appendTo("#blzd");
                $("<p style='display : inline;'></p>").append(item.blzdIcd10).appendTo("#blzd_icd10");
                $("<p style='display : inline;'></p>").append(item.xxBh).appendTo("#xx_bh");
                $("<p style='display : inline;'></p>").append(item.xxSxfy).appendTo("#xx_sxfy");
                $("<p style='display : inline;'></p>").append(item.xxRh).appendTo("#xx_rh");
                $("<p style='display : inline;'></p>").append(item.sjbz).appendTo("#sjbz");
                $("<p style='display : inline;'></p>").append(item.liyuanfangshi).appendTo("#liyuanfangshi");
                $("<p style='display : inline;'></p>").append(item.liyuanJigou).appendTo("#liyuan_jigou");
                $("<p style='display : inline;'></p>").append(item.ywgmHbsag).appendTo("#ywgm_hbsag");
                $("<p style='display : inline;'></p>").append(item.ywgms).appendTo("#ywgms");
                $("<p style='display : inline;'></p>").append(item.cy31ry).appendTo("#cy31ry");
                $("<p style='display : inline;'></p>").append(item.cy31ryMd).appendTo("#cy31ry_md");
                $("<p style='display : inline;'></p>").append(item.hunmiRyr).appendTo("#hunmi_ryr");
                $("<p style='display : inline;'></p>").append(item.hunmiRys).appendTo("#hunmi_rys");
                $("<p style='display : inline;'></p>").append(item.hunmiRyf).appendTo("#hunmi_ryf");
                $("<p style='display : inline;'></p>").append(item.hunmiCyr).appendTo("#hunmi_cyr");
                $("<p style='display : inline;'></p>").append(item.hunmiCys).appendTo("#hunmi_cys");
                $("<p style='display : inline;'></p>").append(item.hunmiCyf).appendTo("#hunmi_cyf");
                $("<p style='display : inline;'></p>").append(item.ysZr).appendTo("#ys_zr");
                $("<p style='display : inline;'></p>").append(item.ysFzr).appendTo("#ys_fzr");
                $("<p style='display : inline;'></p>").append(item.ysZz).appendTo("#ys_zz");
                $("<p style='display : inline;'></p>").append(item.ysZy).appendTo("#ys_zy");
                $("<p style='display : inline;'></p>").append(item.ysYjs).appendTo("#ys_yjs");
                $("<p style='display : inline;'></p>").append(item.ysJx).appendTo("#ys_jx");
                $("<p style='display : inline;'></p>").append(item.ysSx).appendTo("#ys_sx");
                $("<p style='display : inline;'></p>").append(item.bmry).appendTo("#bmry");
                $("<p style='display : inline;'></p>").append(item.bazl).appendTo("#bazl");
                $("<p style='display : inline;'></p>").append(item.bazlZkys).appendTo("#bazl_zkys");
                $("<p style='display : inline;'></p>").append(item.bzzlZkhs).appendTo("#bzzl_zkhs");
                $("<p style='display : inline;'></p>").append(item.bzzlZkrq).appendTo("#bzzl_zkrq");
                $("<p style='display : inline;'></p>").append(item.zdfhMzcy).appendTo("#zdfh_mzcy");
                $("<p style='display : inline;'></p>").append(item.zdfhRycy).appendTo("#zdfh_rycy");
                $("<p style='display : inline;'></p>").append(item.zdfhsqsh).appendTo("#zdfh_sqsh");
                $("<p style='display : inline;'></p>").append(item.zdfhLcbl).appendTo("#zdfh_lcbl");
                $("<p style='display : inline;'></p>").append(item.zdfhFsbl).appendTo("#zdfh_fsbl");
                $("<p style='display : inline;'></p>").append(item.qjcs).appendTo("#qjcs");
                $("<p style='display : inline;'></p>").append(item.qjcgcs).appendTo("#qjcgcs");
            })
        }else{
            var obj = document.getElementById('zybl')
            obj.innerHTML = '';
            $("<center id='jz'></center>").append().appendTo("#zybl");
            $("<h3></h3>").append('暂无匹配数据').appendTo("#jz");
        }
    }

    function build_page_info_sy(result){
        $("#page_info_area_sy").empty();//清空分页信息

        $("#page_info_area_sy").append("当前"+result.extend.hzjbqkb.pageNum+"页","总"+
            result.extend.hzjbqkb.pages +"页," +
            "总"+result.extend.hzjbqkb.total+"记录数")
    }

    function build_page_nav_sy(result) {
        $("#page_nav_area_sy").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(!result.extend.hzjbqkb.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            firstPageLi.click(function () {
                findAll(1);
            });
            prePageLi.click(function () {
                findAll(result.extend.hzjbqkb.pageNum - 1);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (!result.extend.hzjbqkb.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function () {
                findAll(result.extend.hzjbqkb.pageNum + 1);
            });
            lastPageLi.click(function () {
                findAll(result.extend.hzjbqkb.pages);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.hzjbqkb.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.hzjbqkb.pageNum == item){
                numLi.addClass("active")
            }
            ul.append(numLi);
            numLi.click(function () {
                findAll(item);
            });
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area_sy");
    }
    
    <%--function go_back() {--%>
    <%--    window.location.href="${sessionScope.path}/ssm_crud_war/index.jsp";--%>
    <%--    sessionStorage.clear()--%>
    <%--}--%>
</script>
</html>
