package com.ites.crud.service;

import com.ites.crud.bean.Hzjbqkb;
import com.ites.crud.dao.HzqkbMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class HzqkbService {
    @Autowired
    HzqkbMapper hzqkbMapper;
    public List<Hzjbqkb> findRybl(String bah){
        return hzqkbMapper.findRybl(bah);
    }
}