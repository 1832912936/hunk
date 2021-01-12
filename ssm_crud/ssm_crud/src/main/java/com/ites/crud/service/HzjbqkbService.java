package com.ites.crud.service;

import com.ites.crud.bean.Hzjbqkb;
import com.ites.crud.dao.HzjbqkbMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HzjbqkbService {
    @Autowired
    HzjbqkbMapper hzjbqkbMapper;

    public List<Hzjbqkb> findAll(Hzjbqkb hzjbqkb){
        return hzjbqkbMapper.findAll(hzjbqkb);
    }
}
