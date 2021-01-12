package com.ites.crud.service;

import com.ites.crud.bean.EMR_IP_REGISTER;

import com.ites.crud.dao.EmrMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class Emrservice {

    @Autowired
    EmrMapper emrMapper;
   public  List<EMR_IP_REGISTER> fondEmr(){
       return emrMapper.findEmr(null);
   }

   public List<EMR_IP_REGISTER> findOneById(String regno){
       return emrMapper.findOneById(regno);
   }


    public List<EMR_IP_REGISTER> findOneByName(String regno,String name,String age){
        return emrMapper.findOneByName(regno,name,age);
    }

    public List<EMR_IP_REGISTER>findOneByText(String regno,String mz){
        return emrMapper.findOneByText(regno,mz);
    }
    public List<EMR_IP_REGISTER>findOneByText_t(String regno,String mz){
        return emrMapper.findOneByText_t(regno,mz);
    }



}

