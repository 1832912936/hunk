package com.ites.crud.dao;

import com.ites.crud.bean.Hzjbqkb;

import java.util.List;

public interface HzqkbMapper {

   //入院病历查询患者基本信息
    List<Hzjbqkb> findRybl(String bah);
}
