package com.ites.crud.service;

import com.ites.crud.bean.HzjbqkZdqkCyzd;
import com.ites.crud.dao.HzjbqkZdqkCyzdMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HzjbqkZdqkCyzdService {
    @Autowired
    private HzjbqkZdqkCyzdMapper hzjbqkZdqkCyzdMapper;

    public List<HzjbqkZdqkCyzd> findAllByBah(HzjbqkZdqkCyzd hzjbqkZdqkCyzd){
        return hzjbqkZdqkCyzdMapper.findAllByBah(hzjbqkZdqkCyzd);
    }
}
