package com.ites.crud.service;


import com.ites.crud.bean.Photo;
import com.ites.crud.dao.PhotoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhotoService {
    @Autowired
    private PhotoMapper photoMapper;
    public List<Photo> FindPhoto(String bah ,Integer zycs ){
        //System.out.println("service 层显示+"+bah);
        //System.out.println("service 层显示+"+zycs);
        return photoMapper.findPhoto(bah,zycs);
        };



}
