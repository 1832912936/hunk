package com.ites.crud.dao;

import com.ites.crud.bean.ZyYpXmHz;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ZyYpXmHzMapper {
    List<ZyYpXmHz> findFyqd(ZyYpXmHz zyYpXmHz);
}
