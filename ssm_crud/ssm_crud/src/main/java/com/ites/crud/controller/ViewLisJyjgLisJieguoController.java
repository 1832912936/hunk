package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.Msg;
import com.ites.crud.bean.ViewLisJyjgLisJieguo;
import com.ites.crud.service.ViewLisJyjgLisJieguoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@SuppressWarnings("all")
public class ViewLisJyjgLisJieguoController {
    @Autowired
    private ViewLisJyjgLisJieguoService viewLisJyjgLisJieguoService;

    @RequestMapping("findjj")
    @ResponseBody
    public Msg findjj(@RequestParam(value = "pn",defaultValue = "1") Integer pn, ViewLisJyjgLisJieguo viewLisJyjgLisJieguo){
        PageHelper.startPage(pn , 10);
        List<ViewLisJyjgLisJieguo> viewLisJyjgLisJieguos = viewLisJyjgLisJieguoService.findjj(viewLisJyjgLisJieguo);
        PageInfo page =  new PageInfo(viewLisJyjgLisJieguos,5);
        return Msg.success().add("viewLisJyjgLisJieguos",page);
    }
}
