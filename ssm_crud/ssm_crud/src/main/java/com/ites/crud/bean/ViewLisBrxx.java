package com.ites.crud.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class ViewLisBrxx {
    @TableField("v_mzzyh")
    private String vMzzyh;
    @TableField("v_brxm")
    private String vBrxm;
    @TableField("v_sjysmc")
    private String vSjysmc;

    @TableField("d_jysj")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date dJysj;
    @TableField("v_bblx")
    private String vBblx;
    private String applyitem;
    @TableField("v_brbm")
    private String vBrbm;
    @TableField("v_brlbmc")
    private String vBrlbmc;
    @TableField("ip_no")
    private String ipNo;
}
