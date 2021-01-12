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
    <title>出院小结</title>
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
        <h1>出院小结</h1>
    </div>

</center>
<div class="col-md-3"></div>
<div class="col-md-6">
    <table class="table table-hover" id="emr_table" style="border-collapse: collapse;">
        <thead>
        <tr>
            <td class="hzxm"><b>姓名：</b></td>
            <td class="xb"><b>性别：</b></td>
            <td class="nly"><b>年龄：</b></td>
            <td class="zy"><b>职业：</b></td>
        </tr>
        </thead>
    </table>
    <table class="table table-hover" id="emr_table_1" style="border-collapse: collapse;">
       <tbody>
       <tr>
           <td>哈</td>
           <td>哈</td>
       </tr>
       </tbody>
    </table>

</div>
<div class="col-md-3"></div>


</body>
<script type="text/javascript">
    $(function () {
        var regno = sessionStorage.getItem( "regno" );
        var mz = sessionStorage.getItem("mz");
        $("b").css("fontSize" , '18px')
        findHzxx(regno,mz); // 通过通过 bah 查到患者信息
        find(regno,mz);
    })

    function find(regno,mz) {
        $.ajax({
            url:"${APP_PATH}/findOneByText?",
            data:{"regno":regno,"mz":mz},
            type:"POST",
            dataType:'json',
            success:function (result) {
               //console.log(result)
                //调用方法循环
                find_stuc_text(result)
            }
        })
    }
    function find_stuc_text(result){
        $("#emr_table_1 tbody").empty();
        var Emr_bl_list = result.extend.pageInfo;
        $.each(Emr_bl_list,function (index, item) {

            // // 这里是通过病案号和mz 获取到的主要内容，通过拼接的方式放到tbody 里面
            var stuctname = $("<td style='font-size: 20px;font-weight: bold'></td>").append(item.stuctname)
            var stuctext = $("<td></td>").append(item.stuctext)
            $("<tr></tr>").append(stuctname).append(stuctext).appendTo("#emr_table_1 tbody")


            // var biaotou =  $("<b></b>").append(item.stuctname).appendTo("<td></td>")
            // var neirong = $("<td></td>").append(item.stuctext)
            // $("<tr style=''></tr>").append(biaotou)
            //     .append(neirong)
            //     .appendTo("#emr_table_1 tbody");

        } )
    }
    function findHzxx(regno) {
      // alert("走患者")
        $.ajax({
            url:"${APP_PATH}/findRybl?",
            data:{"bah":regno},
            type:"POST",
            dataType:"json",
            success:function (result) {
                console.log(result)
                // 调用方法信心 for each 循环
                find_hzxx(result)
            }
        })
    }
    function find_hzxx(result) {

        var hzxx = result.extend.hzqkb;
        $.each(hzxx,function (index,item) {
            // 可以进行判断  看看哪个列是为空的， 然后决定标签是否为空
            //console.log(item)
            $(".hzxm").append(item.hzxm);
            $(".xb").append(item.xb);
            $(".nly").append(item.nly);
            $(".zy").append(item.zy);

         //
         //    if (item.st1 !=null) {
         //        var st_jq = item.st1.indexOf("："); // 获取掉下标
         //        var st_jc = item.st1.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st1.substring(st_jq + 1, item.st1.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".zy").append(st_jc).append(st_nr);
         //    }else {
         //        $(".zy").append("<b>职业：</b> 无");
         //    }
         //
         //    if (item.st2 !=null) {
         //        var st_jq = item.st2.indexOf("："); // 获取掉下标
         //        var st_jc = item.st2.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st2.substring(st_jq + 1, item.st2.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".cjrq").append(st_jc).append(st_nr);
         //    }else {
         //        $(".cjrq").append("<b>采集日期：</b> 无");
         //
         //    }
         //
         //
         //   // $(".cjrq").append(item.st2);
         //  //  $(".whcd").append(item.st3);
         //    if (item.st3 !=null) {
         //        var st_jq = item.st3.indexOf("："); // 获取掉下标
         //        var st_jc = item.st3.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st3.substring(st_jq + 1, item.st3.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".whcd").append(st_jc).append(st_nr);
         //    }else {
         //        $(".whcd").append("<b>文化程度：</b> 无");
         //    }
         //
         //
         //    //$(".lxdh").append(item.st4);
         //    if (item.st4 !=null) {
         //        var st_jq = item.st4.indexOf("："); // 获取掉下标
         //        var st_jc = item.st4.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st4.substring(st_jq + 1, item.st4.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".lxdh").append(st_jc).append(st_nr);
         //    }else {
         //        $(".lxdh").append("<b>联系电话：</b> 无");
         //    }
         //
         //
         //    //$(".bscsz").append(item.st5);
         //    if (item.st5 !=null) {
         //        var st_jq = item.st5.indexOf("："); // 获取掉下标
         //        var st_jc = item.st5.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st5.substring(st_jq + 1, item.st5.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".bscsz").append(st_jc).append(st_nr);
         //    }else {
         //        $(".bscsz").append("<b>病史陈述者：</b> 无");
         //    }
         //
         //
         //    //$(".hzgx").append(item.st6);
         //    if (item.st6 !=null) {
         //        var st_jq = item.st6.indexOf("："); // 获取掉下标
         //        var st_jc = item.st6.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st6.substring(st_jq + 1, item.st6.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".hzgx").append(st_jc).append(st_nr);
         //    }else {
         //        $(".hzgx").append("<b>与患者关系：</b> 无");
         //    }
         //
         //
         //    //$(".csrdh").append(item.st7);
         //    if (item.st7 !=null) {
         //        var st_jq = item.st7.indexOf("："); // 获取掉下标
         //        var st_jc = item.st7.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st7.substring(st_jq + 1, item.st7.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".csrdh").append(st_jc).append(st_nr);
         //    }else {
         //        $(".csrdh").append("<b style='font-size: 18px'>陈述人电话：</b> 无");
         //    }
         //
         //
         //
         //   // $(".csrdz").append(item.st8);
         //    if (item.st8 !=null) {
         //        var st_jq = item.st8.indexOf("："); // 获取掉下标
         //        var st_jc = item.st8.substring(0, st_jq) + ":" // 截取到从第一额开始到：的值
         //        var st_nr = item.st8.substring(st_jq + 1, item.st8.length);// 获取到：后面所有的内容
         //        var st_jc = $("<b></b>").append(st_jc)
         //        var st_nr = $("<spean></spean>").append(st_nr)
         //        $(".csrdz").append(st_jc).append(st_nr);
         //    }else {
         //        $(".csrdz").append("<b>陈述人地址：</b> 无");
         //    }
         //
         //
         //
         //
         //    if (item.zs1 != null) {
         //        var zs_jq = item.zs1.indexOf("："); // 获取掉下标
         //        var zs_jc = item.zs1.substring(0, zs_jq) + ":" // 截取到从第一额开始到：的值
         //        var zs_nr = item.zs1.substring(zs_jq + 1, item.zs1.length);// 获取到：后面所有的内容
         //        var zs_jc = $("<b></b>").append(zs_jc)
         //        var zs_s = $("<spean></spean>").append(zs_nr)
         //        var zs = $("<td></td>").append(zs_jc).append(zs_s)
         //    }
         //
         //
         // //   var zs =  $("<td></td>").append(item.zs1)
         //    //var xbs =  $("<tr></tr>").append(item.xbs1)
         //    if (item.xbs1 !=null) {
         //        var xbs_jq = item.xbs1.indexOf("："); // 获取掉下标
         //        var xbs_jc = item.xbs1.substring(0, xbs_jq) + ":" // 截取到从第一额开始到：的值
         //        var xbs_nr = item.xbs1.substring(xbs_jq + 1, item.xbs1.length);// 获取到：后面所有的内容
         //        var xbs_jc = $("<b></b>").append(xbs_jc)
         //        var xbs_nr = $("<spean></spean>").append(xbs_nr)
         //        var xbs = $("<td></td>").append(xbs_jc).append(xbs_nr)
         //    }
         //
         //    //var jws1 =  $("<td></td>").append(item.jws1)
         //    if (item.jws1 != null) {
         //        var jws_jq = item.jws1.indexOf("："); // 获取掉下标
         //        var jws_jc = item.jws1.substring(0, jws_jq) + ":" // 截取到从第一额开始到：的值
         //        var jws_nr = item.jws1.substring(jws_jq + 1, item.jws1.length);// 获取到：后面所有的内容
         //        var jws_jc = $("<b></b>").append(jws_jc)
         //        var jws_nr = $("<spean></spean>").append(jws_nr)
         //        var jws1 = $("<td></td>").append(jws_jc).append(jws_nr)
         //    }
         //
         //  // var grs1 =  $("<td></td>").append(item.grs1)
         //    if (item.grs1 != null ){
         //        var grs_jq = item.grs1.indexOf("："); // 获取掉下标
         //        var grs_jc = item.grs1.substring(0,grs_jq)+":" // 截取到从第一额开始到：的值
         //        var grs_nr=item.grs1.substring(grs_jq+1,item.grs1.length);// 获取到：后面所有的内容
         //        var grs_jc = $("<b></b>").append(grs_jc)
         //        var grs_nr = $("<spean></spean>").append(grs_nr)
         //        var grs1 = $("<td></td>").append(grs_jc).append(grs_nr)
         //    }
         //
         //   // var jzs1 =  $("<td></td>").append(item.jzs1)
         //    if (item.jzs1 != null ) {
         //        var jzs_jq = item.jzs1.indexOf("："); // 获取掉下标
         //        var jzs_jc = item.jzs1.substring(0, jzs_jq) + ":" // 截取到从第一额开始到：的值
         //        var jzs_nr = item.jzs1.substring(jzs_jq + 1, item.jzs1.length);// 获取到：后面所有的内容
         //        var jzs_jc = $("<b></b>").append(jzs_jc)
         //        var jzs_nr = $("<spean></spean>").append(jzs_nr)
         //        var jzs1 = $("<td></td>").append(jzs_jc).append(jzs_nr)
         //    }
         //
         //    if (item.tgjc1 != null )  {
         //        var tgjc1 =  $("<td class='tgjc'><b>体格检查：</b></td>").append(item.tgjc1)
         //    }
         //
         //
         //    if (item.ybqk1 != null) {
         //        //var ybqk1 = $("<td></td>").append(item.ybqk1)
         //        var ybqk_jq = item.ybqk1.indexOf("："); // 获取掉下标
         //        var ybqk_jc = item.ybqk1.substring(0, ybqk_jq) + ":" // 截取到从第一额开始到：的值
         //        var ybqk_nr = item.ybqk1.substring(ybqk_jq + 1, item.ybqk1.length);// 获取到：后面所有的内容
         //        var ybqk_jc = $("<b></b>").append(ybqk_jc)
         //        var ybqk_nr = $("<spean></spean>").append(ybqk_nr)
         //        var ybqk1 = $("<td></td>").append(ybqk_jc).append(ybqk_nr)
         //
         //    }
         //  //  var ybqk1 = $("<td></td>").append(item.ybqk1)
         //    //var pf1 =  $("<td></td>").append(item.pf1)
         //
         //    if (item.pf1 !=null){
         //        var pf_jq = item.pf1.indexOf("："); // 获取掉下标
         //        var pf_jc = item.pf1.substring(0, pf_jq) + ":" // 截取到从第一额开始到：的值
         //        var pf_nr = item.pf1.substring(pf_jq + 1, item.pf1.length);// 获取到：后面所有的内容
         //        var pf_jc = $("<b></b>").append(pf_jc)
         //        var pf_nr = $("<spean></spean>").append(pf_nr)
         //        var pf1 = $("<td></td>").append(pf_jc).append(pf_nr)
         //    }
         //
         //    //var lb1 =  $("<td></td>").append(item.lb1)
         //    if (item.lb1 !=null){
         //        var lb_jq = item.lb1.indexOf("："); // 获取掉下标
         //        var lb_jc = item.lb1.substring(0, lb_jq) + ":" // 截取到从第一额开始到：的值
         //        var lb_nr = item.lb1.substring(lb_jq + 1, item.lb1.length);// 获取到：后面所有的内容
         //        var lb_jc = $("<b></b>").append(lb_jc)
         //        var lb_nr = $("<spean></spean>").append(lb_nr)
         //        var lb1 = $("<td></td>").append(lb_jc).append(lb_nr)
         //    }
         //
         //
         //    //var tb1 =  $("<td></td>").append(item.tb1)
         //    if (item.tb1 !=null){
         //        var tb_jq = item.tb1.indexOf("："); // 获取掉下标
         //        var tb_jc = item.tb1.substring(0, tb_jq) + ":" // 截取到从第一额开始到：的值
         //        var tb_nr = item.tb1.substring(tb_jq + 1, item.tb1.length);// 获取到：后面所有的内容
         //        var tb_jc = $("<b></b>").append(tb_jc)
         //        var tb_nr = $("<spean></spean>").append(tb_nr)
         //        var tb1 = $("<td></td>").append(tb_jc).append(tb_nr)
         //
         //    }
         //
         //
         //    //var jb1 =  $("<td></td>").append(item.jb1)
         //    if (item.jb1 !=null){
         //        var jb_jq = item.jb1.indexOf("："); // 获取掉下标
         //        var jb_jc = item.jb1.substring(0, jb_jq) + ":" // 截取到从第一额开始到：的值
         //        var jb_nr = item.jb1.substring(jb_jq + 1, item.jb1.length);// 获取到：后面所有的内容
         //        var jb_jc = $("<b></b>").append(jb_jc)
         //        var jb_nr = $("<spean></spean>").append(jb_nr)
         //        var jb1 = $("<td></td>").append(jb_jc).append(jb_nr)
         //    }
         //
         //
         //    //var xb1 =  $("<td></td>").append(item.xb1)
         //    if (item.xb1 !=null){
         //        var xb_jq = item.xb1.indexOf("："); // 获取掉下标
         //        var xb_jc = item.xb1.substring(0, xb_jq) + ":" // 截取到从第一额开始到：的值
         //        var xb_nr = item.jb1.substring(xb_jq + 1, item.xb1.length);// 获取到：后面所有的内容
         //        var xb_jc = $("<b></b>").append(xb_jc)
         //        var xb_nr = $("<spean></spean>").append(xb_nr)
         //        var xb1 = $("<td></td>").append(xb_jc).append(xb_nr)
         //    }
         //
         // //  var jzsz1 =  $("<td></td>").append(item.jzsz1)
         //    if (item.jzsz1 !=null){
         //        var jzsz_jq = item.jzsz1.indexOf("："); // 获取掉下标
         //        var jzsz_jc = item.jzsz1.substring(0, jzsz_jq) + ":" // 截取到从第一额开始到：的值
         //        var jzsz_nr = item.jb1.substring(jzsz_jq + 1, item.jzsz1.length);// 获取到：后面所有的内容
         //        var jzsz_jc = $("<b></b>").append(jzsz_jc)
         //        var jzsz_nr = $("<spean></spean>").append(jzsz_nr)
         //        var jzsz1 = $("<td></td>").append(jzsz_jc).append(jzsz_nr)
         //    }
         //
         //
         //    //var fbb1 =  $("<td></td>").append(item.fbb1)
         //    if (item.fbb1 !=null){
         //        var fbb_jq = item.fbb1.indexOf("："); // 获取掉下标
         //        var fbb_jc = item.fbb1.substring(0, fbb_jq) + ":" // 截取到从第一额开始到：的值
         //        var fbb_nr = item.jb1.substring(fbb_jq + 1, item.fbb1.length);// 获取到：后面所有的内容
         //        var fbb_jc = $("<b></b>").append(fbb_jc)
         //        var fbb_nr = $("<spean></spean>").append(fbb_nr)
         //        var fbb1 = $("<td></td>").append(fbb_jc).append(fbb_nr)
         //    }
         //
         //
         //
         //   //var xz1 =  $("<td></td>").append(item.xz1)
         //    if (item.xz1 !=null){
         //        var xz_jq = item.xz1.indexOf("："); // 获取掉下标
         //        var xz_jc = item.xz1.substring(0, xz_jq) + ":" // 截取到从第一额开始到：的值
         //        var xz_nr = item.jb1.substring(xz_jq + 1, item.xz1.length);// 获取到：后面所有的内容
         //        var xz_jc = $("<b></b>").append(xz_jc)
         //        var xz_nr = $("<spean></spean>").append(xz_nr)
         //        var xz1 = $("<td></td>").append(xz_jc).append(xz_nr)
         //    }
         //    //var fb1 =  $("<td></td>").append(item.fb1)
         //    if (item.fb1 !=null){
         //        var fb_jq = item.fb1.indexOf("："); // 获取掉下标
         //        var fb_jc = item.fb1.substring(0, fb_jq) + ":" // 截取到从第一额开始到：的值
         //        var fb_nr = item.jb1.substring(fb_jq + 1, item.fb1.length);// 获取到：后面所有的内容
         //        var fb_jc = $("<b></b>").append(fb_jc)
         //        var fb_nr = $("<spean></spean>").append(fb_nr)
         //        var fb1 = $("<td></td>").append(fb_jc).append(fb_nr)
         //    }
         //   // var zc1 =  $("<td></td>").append(item.zc1)
         //    if (item.zc1 !=null){
         //        var zc_jq = item.zc1.indexOf("："); // 获取掉下标
         //        var zc_jc = item.zc1.substring(0, zc_jq) + ":" // 截取到从第一额开始到：的值
         //        var zc_nr = item.jb1.substring(zc_jq + 1, item.zc1.length);// 获取到：后面所有的内容
         //        var zc_jc = $("<b></b>").append(zc_jc)
         //        var zc_nr = $("<spean></spean>").append(zc_nr)
         //        var zc1 = $("<td></td>").append(zc_jc).append(zc_nr)
         //    }
         //   // var sjxt1 =  $("<td></td>").append(item.sjxt1)
         //    if (item.sjxt1 !=null){
         //        var sjxt_jq = item.sjxt1.indexOf("："); // 获取掉下标
         //        var sjxt_jc = item.sjxt1.substring(0, sjxt_jq) + ":" // 截取到从第一额开始到：的值
         //        var sjxt_nr = item.jb1.substring(sjxt_jq + 1, item.sjxt1.length);// 获取到：后面所有的内容
         //        var sjxt_jc = $("<b></b>").append(sjxt_jc)
         //        var sjxt_nr = $("<spean></spean>").append(sjxt_nr)
         //        var sjxt1 = $("<td></td>").append(sjxt_jc).append(sjxt_nr)
         //    }
         //
         //    if (item.fzjc1 !=null){
         //        var fzjc1 =  $("<td><b>辅助检查:</b></td>").append(item.fzjc1)
         //    }
         //    if (item.cyzd1 !=null){
         //        var cyzd1 =  $("<td><b>出院诊断：</b></td>").append(item.cyzd1)
         //    }
         //    if (item.cbzd1 !=null){
         //        var cbzd1 =  $("<td><b>初步诊断:</b></td>").append(item.cbzd1)
         //    }
         //    if (item.ysqz1 !=null){
         //        var ysqz1 =  $("<td><b>医师签字：</b></td>").append(item.ysqz1)
         //    }
         //    if (item.cyzd1 !=null){
         //        var cyzd1 =  $("<td><b>出院诊断：</b></td>").append(item.cyzd1)
         //    }
         //    if (item.qzrq1 !=null){
         //        var qzrq1 =  $("<td><b>签字日期：</b></td>").append(item.qzrq1)
         //    }
         //    if (item.yjsZsl !=null){
         //        var yjs_Zsl =  $("<td><b>月经史：</b></td>").append(item.yjsZsl)
         //    }
         //
         //    $("<tr></tr>").append(zs).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(xbs).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(jws1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(grs1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(jzs1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(tgjc1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(ybqk1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(pf1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(lb1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(tb1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(jb1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(xb1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(jzsz1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(fbb1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(xz1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(fb1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(zc1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(sjxt1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(fzjc1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(cyzd1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(cbzd1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(ysqz1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(qzrq1).appendTo("#emr_table_1 tbody");
         //    $("<tr></tr>").append(yjs_Zsl).appendTo("#emr_table_1 tbody");
        })
    }



</script>
</html>
