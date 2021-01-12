package com.ites.crud.dao;

import com.ites.crud.bean.HzjbqkZdqkCyzd;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HzjbqkZdqkCyzdMapper {
    //查询全部
    List<HzjbqkZdqkCyzd> findAllByBah(HzjbqkZdqkCyzd hzjbqkZdqkCyzd);
}
