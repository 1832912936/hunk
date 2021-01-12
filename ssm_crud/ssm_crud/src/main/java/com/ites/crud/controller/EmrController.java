package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.EMR_IP_REGISTER;
import com.ites.crud.bean.Msg;
import com.ites.crud.service.Emrservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;


@Controller
@SuppressWarnings("all")
public class EmrController {


    @Autowired
     Emrservice emrservice;

    /*使用json数据*/
    @RequestMapping("/findEmr")
    @ResponseBody/*要使用responsebody需要导入jackson包*/
    public Msg getEmrWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        //引入pagehelper
        // 在查询之前调用，传入页面以及每页的大小
        PageHelper.startPage(pn , 10);
        List<EMR_IP_REGISTER> emr_ip_registers = emrservice .fondEmr();
        //使用pageinfo包装查询后的结果， 只需要将pageinfo交给页面
        //封装了详细的分页信息， 包括我们查询出来的数据
        PageInfo page =  new PageInfo(emr_ip_registers,5);

        return Msg.success().add("pageInfo",page);

    }



    @RequestMapping(value="/findOneById",method = RequestMethod.POST)
    @ResponseBody
    public Msg findOneById(@RequestParam (value = "regno")String regno){
        int a  = 1;
        List<EMR_IP_REGISTER> emr_ip_registers = emrservice.findOneById(regno);
        if (emr_ip_registers.size()>0){
            return Msg.success().add("a",emr_ip_registers);
        }else{
            return Msg.success().add("a",a );
        }
    }

    @RequestMapping(value = "/findOneByName",method = RequestMethod.POST)
    @ResponseBody
    public Msg findOneByName(HttpServletRequest request){
        String regno = request.getParameter("regno");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        int pn = Integer.parseInt(request.getParameter("pn"));
        PageHelper.startPage(pn , 10);
        List<EMR_IP_REGISTER> emr_ip_registers = emrservice.findOneByName(regno,name,age);
        PageInfo page =  new PageInfo(emr_ip_registers,5);
        return Msg.success().add("pageInfo",page);
    }

    @RequestMapping(value = "/findOneByText",method = RequestMethod.POST)
    @ResponseBody
    public Msg findOneByText(HttpServletRequest request){
        String regno = request.getParameter("regno");
        String mz = request.getParameter("mz");
        // 后天可以进行判断如果是入院病历可以通过mz判断如果是入院病历的话，就会走另外一个后台sql
        if (mz.equals("住院病历")){
            List<EMR_IP_REGISTER> oneByText = emrservice.findOneByText_t(regno, mz);
            return Msg.success().add("pageInfo", oneByText);
        }else {
            List<EMR_IP_REGISTER> oneByText = emrservice.findOneByText(regno, mz);
            return Msg.success().add("pageInfo", oneByText);
        }
    }



}
