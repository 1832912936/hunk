package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.BqHlHzhldNext;
import com.ites.crud.bean.Msg;
import com.ites.crud.service.BqHlHzhldNextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@SuppressWarnings("all")
public class BqHlHzhldNextController {
    @Autowired
    private BqHlHzhldNextService bqHlHzhldNextService;

    @RequestMapping("findTw")
    @ResponseBody
    public Msg findTw(@RequestParam(value = "pn",defaultValue = "1") Integer pn, BqHlHzhldNext bqHlHzhldNext){
        PageHelper.startPage(pn , 10);
        List<BqHlHzhldNext> bqHlHzhldNexts = bqHlHzhldNextService.findTw(bqHlHzhldNext);
        PageInfo page =  new PageInfo(bqHlHzhldNexts,5);
        return Msg.success().add("bqHlHzhldNexts",page);
    }
}
