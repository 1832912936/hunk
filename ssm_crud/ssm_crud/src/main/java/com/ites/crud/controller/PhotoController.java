package com.ites.crud.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.Msg;
import com.ites.crud.bean.Photo;
import com.ites.crud.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PhotoController {
@Autowired
     PhotoService photoService;
    @RequestMapping("/findPhoto")
    @ResponseBody
    public Msg findPhoto (@RequestParam(value = "pn",defaultValue = "1") Integer pn,String bah , Integer zycs){
    PageHelper.startPage(pn,10);
    List<Photo> photos = photoService.FindPhoto(bah,zycs);
    PageInfo page =  new PageInfo(photos,5);
    return Msg.success().add("getPhoto",page);
}

}
