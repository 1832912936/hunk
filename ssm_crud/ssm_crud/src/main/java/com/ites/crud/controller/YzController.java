package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.Msg;
import com.ites.crud.bean.ZY_CQYZ_ZXZ;
import com.ites.crud.service.YzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@SuppressWarnings("all")
public class YzController {
    @Autowired
    YzService yzService;
    @RequestMapping("/findYz")
    @ResponseBody
    public Msg findYz(@RequestParam(value = "pn",defaultValue = "1") Integer pn,ZY_CQYZ_ZXZ zy_cqyz_zxz){
        PageHelper.startPage(pn , 10);
        List<ZY_CQYZ_ZXZ> findyz = yzService.findYz(zy_cqyz_zxz);
        PageInfo page =  new PageInfo(findyz,5);
        return  Msg.success().add("findyz",page);
    }
    @RequestMapping("/findYzCq")
    @ResponseBody
    public Msg findYzCQ(@RequestParam(value = "pn",defaultValue = "1") Integer pn,ZY_CQYZ_ZXZ zy_cqyz_zxz){
        System.out.println("长期");
        PageHelper.startPage(pn , 10);
        List<ZY_CQYZ_ZXZ> findyz = yzService.findYzCq(zy_cqyz_zxz);
        PageInfo page =  new PageInfo(findyz,5);
        return  Msg.success().add("findyz",page);
    }
    @RequestMapping("/findYzLs")
    @ResponseBody
    public Msg findYzLs(@RequestParam(value = "pn",defaultValue = "1") Integer pn,ZY_CQYZ_ZXZ zy_cqyz_zxz){
        System.out.println("临时");
        PageHelper.startPage(pn , 10);
        List<ZY_CQYZ_ZXZ> findyz = yzService.findYzLs(zy_cqyz_zxz);
        PageInfo page =  new PageInfo(findyz,5);
        return  Msg.success().add("findyz",page);
    }


}
