package com.ites.crud.dao;

import com.ites.crud.bean.ViewLisJyjgLisJieguo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ViewLisJyjgLisJieguoMapper {
    List<ViewLisJyjgLisJieguo> findjj(ViewLisJyjgLisJieguo viewLisJyjgLisJieguo);
}
