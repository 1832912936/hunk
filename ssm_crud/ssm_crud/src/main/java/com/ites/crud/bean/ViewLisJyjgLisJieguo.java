package com.ites.crud.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

@Data
public class ViewLisJyjgLisJieguo {
    @TableField("v_xmmc")
    private String vXmmc;
    @TableField("v_ywmc")
    private String vYwmc;
    @TableField("v_jyjg")
    private String vJyjg;
    @TableField("v_jgzt")
    private String vJgzt;
    @TableField("v_ckz")
    private String vCkz;
    @TableField("v_ckzlx")
    private String vCkzlx;
    @TableField("v_dw")
    private String vDw;
    @TableField("v_bz")
    private String vBz;
    @TableField("v_brbm")
    private String vBrbm;
    @TableField("v_mzzyh")
    private String vMzzyh;
    @TableField("v_brlbmc")
    private String vBrlbmc;
    @TableField("v_bblx")
    private String vBblx;
    private String applyitem;
    @TableField("l_xmdm")
    private String lXmdm;
    @TableField("l_dysx")
    private String lDysx;
    @TableField("d_sj")
    private String dSj;
    @TableField("v_sybz")
    private String vSybz;
    @TableField("v_jgzt1")
    private String vJgzt1;
    @TableField("v_cutoff")
    private String vCutoff;
    @TableField("v_od")
    private String vOd;
    @TableField("v_ct")
    private String vCt;
    @TableField("v_memo")
    private String vMemo;
    @TableField("v_jyff")
    private String vJyff;
    @TableField("v_wjzbz")
    private String vWjzbz;
    @TableField("l_ld")
    private String lId;
}
