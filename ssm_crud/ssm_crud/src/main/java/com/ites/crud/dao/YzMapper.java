package com.ites.crud.dao;

import com.ites.crud.bean.ZY_CQYZ_ZXZ;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface YzMapper {
    //查询view_zy_cqyz_zxz 视图
    List<ZY_CQYZ_ZXZ> findYz(ZY_CQYZ_ZXZ zy_cqyz_zxz);
    //查询 长期
    List<ZY_CQYZ_ZXZ> findYzCq(ZY_CQYZ_ZXZ zy_cqyz_zxz);
    //查询 临时
    List<ZY_CQYZ_ZXZ> findYzLs(ZY_CQYZ_ZXZ zy_cqyz_zxz);




}
