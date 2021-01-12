package com.ites.crud.service;

import com.ites.crud.bean.BqHlHzhldNext;
import com.ites.crud.dao.BqHlHzhldNextMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BqHlHzhldNextService {
    @Autowired
    private BqHlHzhldNextMapper bqHlHzhldNextMapper;

    public List<BqHlHzhldNext> findTw(BqHlHzhldNext bqHlHzhldNext){
        return bqHlHzhldNextMapper.findTw(bqHlHzhldNext);
    }
}
