package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.Hzjbqkb;
import com.ites.crud.bean.Msg;
import com.ites.crud.service.HzjbqkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@SuppressWarnings("all")
public class HzjbqkbController {
    @Autowired
    HzjbqkbService hzjbqkbService;

    @RequestMapping("/findAll")
    @ResponseBody
    public Msg findAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Hzjbqkb hzjbqkb){
        PageHelper.startPage(pn , 10);
        List<Hzjbqkb> hzjbqkbs = hzjbqkbService .findAll(hzjbqkb);
        PageInfo page =  new PageInfo(hzjbqkbs,5);
        //PageInfo<Hzjbqkb> pageInfo = new PageInfo<Hzjbqkb>(hzjbqkb);
        return Msg.success().add("hzjbqkb",page);
    }
}
