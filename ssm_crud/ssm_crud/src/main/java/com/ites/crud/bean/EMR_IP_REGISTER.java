package com.ites.crud.bean;


import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class EMR_IP_REGISTER {
    //select REG_NO,NAME,SEX ,age from EMR_IP_REGISTER
    private String REGNO;
    private String NAME;
    private String SEX;
    private String AGE;
    private String TABNO;
    private String MZ;
    private String BCTITLE;
    private String BCTIME;
    private String STUCTEXT;
    private String STUCTNAME;
    private String MZFLAG;
    @TableField("ip_no")
    private String ipNo;
    @TableField("ip_cnt")
    private String ipCnt;
    private String a;
    private String pn;
    @TableField("IP_Time")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date ipTime;

    public String getREGNO() {
        return REGNO;
    }

    public void setREGNO(String REGNO) {
        this.REGNO = REGNO;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public String getSEX() {
        return SEX;
    }

    public void setSEX(String SEX) {
        this.SEX = SEX;
    }

    public String getAGE() {
        return AGE;
    }

    public void setAGE(String AGE) {
        this.AGE = AGE;
    }

    public String getTABNO() {
        return TABNO;
    }

    public void setTABNO(String TABNO) {
        this.TABNO = TABNO;
    }

    public String getMZ() {
        return MZ;
    }

    public void setMZ(String MZ) {
        this.MZ = MZ;
    }

    public String getBCTITLE() {
        return BCTITLE;
    }

    public void setBCTITLE(String BCTITLE) {
        this.BCTITLE = BCTITLE;
    }

    public String getBCTIME() {
        return BCTIME;
    }

    public void setBCTIME(String BCTIME) {
        this.BCTIME = BCTIME;
    }

    public String getSTUCTEXT() {
        return STUCTEXT;
    }

    public void setSTUCTEXT(String STUCTEXT) {
        this.STUCTEXT = STUCTEXT;
    }

    public String getSTUCTNAME() {
        return STUCTNAME;
    }

    public void setSTUCTNAME(String STUCTNAME) {
        this.STUCTNAME = STUCTNAME;
    }

    public String getMZFLAG() {
        return MZFLAG;
    }

    public void setMZFLAG(String MZFLAG) {
        this.MZFLAG = MZFLAG;
    }

    public String getIpNo() {
        return ipNo;
    }

    public void setIpNo(String ipNo) {
        this.ipNo = ipNo;
    }

    public String getIpCnt() {
        return ipCnt;
    }

    public void setIpCnt(String ipCnt) {
        this.ipCnt = ipCnt;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public String getPn() {
        return pn;
    }

    public void setPn(String pn) {
        this.pn = pn;
    }

    public Date getIpTime() {
        return ipTime;
    }

    public void setIpTime(Date ipTime) {
        this.ipTime = ipTime;
    }

    @Override
    public String toString() {
        return "EMR_IP_REGISTER{" +
                "REGNO='" + REGNO + '\'' +
                ", NAME='" + NAME + '\'' +
                ", SEX='" + SEX + '\'' +
                ", AGE='" + AGE + '\'' +
                ", TABNO='" + TABNO + '\'' +
                ", MZ='" + MZ + '\'' +
                ", BCTITLE='" + BCTITLE + '\'' +
                ", BCTIME='" + BCTIME + '\'' +
                ", STUCTEXT='" + STUCTEXT + '\'' +
                ", STUCTNAME='" + STUCTNAME + '\'' +
                ", MZFLAG='" + MZFLAG + '\'' +
                ", ipNo='" + ipNo + '\'' +
                ", ipCnt='" + ipCnt + '\'' +
                ", a='" + a + '\'' +
                ", pn='" + pn + '\'' +
                ", ipTime=" + ipTime +
                '}';
    }
}
