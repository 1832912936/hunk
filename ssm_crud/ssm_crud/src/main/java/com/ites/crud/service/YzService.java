package com.ites.crud.service;

import com.ites.crud.bean.ZY_CQYZ_ZXZ;
import com.ites.crud.dao.YzMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class YzService {
    @Autowired
    YzMapper yzMapper;
    public List<ZY_CQYZ_ZXZ>  findYz(ZY_CQYZ_ZXZ zy_cqyz_zxz){

        return yzMapper.findYz(zy_cqyz_zxz);
    }
    public List<ZY_CQYZ_ZXZ>  findYzCq(ZY_CQYZ_ZXZ zy_cqyz_zxz){

        return yzMapper.findYzCq(zy_cqyz_zxz);
    }

    public List<ZY_CQYZ_ZXZ>  findYzLs(ZY_CQYZ_ZXZ zy_cqyz_zxz){

        return yzMapper.findYzLs(zy_cqyz_zxz);
    }



}
