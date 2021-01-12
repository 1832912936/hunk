package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.HzjbqkZdqkCyzd;
import com.ites.crud.bean.Msg;
import com.ites.crud.service.HzjbqkZdqkCyzdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@SuppressWarnings("all")
public class HzjbqkZdqkCyzdController {
    @Autowired
    private HzjbqkZdqkCyzdService hzjbqkZdqkCyzdService;

    @RequestMapping("/findAllByBah")
    @ResponseBody
    public Msg findAllByBah(@RequestParam(value = "pn",defaultValue = "1") Integer pn, HzjbqkZdqkCyzd hzjbqkZdqkCyzd){
        PageHelper.startPage(pn , 10);
        List<HzjbqkZdqkCyzd> hzjbqkZdqkCyzds = hzjbqkZdqkCyzdService.findAllByBah(hzjbqkZdqkCyzd);
        PageInfo page =  new PageInfo(hzjbqkZdqkCyzds,5);
        return Msg.success().add("hzjbqkZdqkCyzd",page);
    }
}
