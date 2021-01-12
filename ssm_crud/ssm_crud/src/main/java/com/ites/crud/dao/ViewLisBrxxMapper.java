package com.ites.crud.dao;

import com.ites.crud.bean.ViewLisBrxx;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ViewLisBrxxMapper {
    List<ViewLisBrxx> findjy(ViewLisBrxx viewLisBrxx);
}