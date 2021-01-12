package com.ites.crud.dao;

import com.ites.crud.bean.Hzjbqkb;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface HzjbqkbMapper {
    //查询全部用户
    List<Hzjbqkb> findAll(Hzjbqkb hzjbqkb);
}
