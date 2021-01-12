package com.ites.crud.service;

import com.ites.crud.bean.ViewLisJyjgLisJieguo;
import com.ites.crud.dao.ViewLisJyjgLisJieguoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ViewLisJyjgLisJieguoService {
    @Autowired
    private ViewLisJyjgLisJieguoMapper viewLisJyjgLisJieguoMapper;

    public List<ViewLisJyjgLisJieguo> findjj(ViewLisJyjgLisJieguo viewLisJyjgLisJieguo){
        return viewLisJyjgLisJieguoMapper.findjj(viewLisJyjgLisJieguo);
    }
}
