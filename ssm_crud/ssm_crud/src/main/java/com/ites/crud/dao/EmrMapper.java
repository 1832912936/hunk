package com.ites.crud.dao;

import com.ites.crud.bean.EMR_IP_REGISTER;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface EmrMapper {

    //查询全部用户
    List<EMR_IP_REGISTER> findEmr(EMR_IP_REGISTER emr_ip_register);

    //根据用户编号查询相对信息
    List<EMR_IP_REGISTER> findOneById(String regno);

    // 模糊查询
    List<EMR_IP_REGISTER> findOneByName(@Param("regno")String regno,@Param("name")String name,@Param("age") String age);

    //根据用户编号查询相对信息

    List<EMR_IP_REGISTER> findOneByText(@Param("regno") String regno,@Param("mz") String mz);

    // 入院病历
    List<EMR_IP_REGISTER> findOneByText_t(@Param("regno") String regno,@Param("mz") String mz);




}
