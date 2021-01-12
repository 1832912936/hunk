package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.Msg;
import com.ites.crud.bean.ViewLisBrxx;
import com.ites.crud.service.ViewLisBrxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@SuppressWarnings("all")
public class ViewLisBrxxController {
    @Autowired
    private ViewLisBrxxService viewlisBrxxService;

    @RequestMapping("/findjy")
    @ResponseBody
    public Msg findjy(@RequestParam(value = "pn",defaultValue = "1") Integer pn, ViewLisBrxx viewLisBrxx){
        PageHelper.startPage(pn , 10);
        List<ViewLisBrxx> ViewLisBrxxes = viewlisBrxxService.findjy(viewLisBrxx);
        PageInfo page =  new PageInfo(ViewLisBrxxes,5);
        return Msg.success().add("viewLisBrxx",page);
    }
}
