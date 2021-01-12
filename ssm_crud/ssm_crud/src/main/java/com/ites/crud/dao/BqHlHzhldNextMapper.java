package com.ites.crud.dao;

import com.ites.crud.bean.BqHlHzhldNext;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BqHlHzhldNextMapper {
    List<BqHlHzhldNext> findTw(BqHlHzhldNext bqHlHzhldNext);
}
