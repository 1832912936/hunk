package com.ites.crud.dao;


import com.ites.crud.bean.BqHlHzhldNext;
import com.ites.crud.bean.Photo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PhotoMapper {
    //查询
    List<Photo> findPhoto(@Param("bah")String bah,@Param("zycs") Integer zycs);

}
