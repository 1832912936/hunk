package com.ites.crud.service;

import com.ites.crud.bean.ZyYpXmHz;
import com.ites.crud.dao.ZyYpXmHzMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZyYpXmHzService {
    @Autowired
    private ZyYpXmHzMapper zyYpXmHzMapper;

    public List<ZyYpXmHz> findFyqd(ZyYpXmHz zyYpXmHz){
        return zyYpXmHzMapper.findFyqd(zyYpXmHz);
    }


}
