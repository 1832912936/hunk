package com.ites.crud.service;

import com.ites.crud.bean.ViewLisBrxx;
import com.ites.crud.dao.ViewLisBrxxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ViewLisBrxxService {
    @Autowired
    private ViewLisBrxxMapper viewLisBrxxMapper;

    public List<ViewLisBrxx> findjy(ViewLisBrxx viewLisBrxx){
        return viewLisBrxxMapper.findjy(viewLisBrxx);
    }
}
