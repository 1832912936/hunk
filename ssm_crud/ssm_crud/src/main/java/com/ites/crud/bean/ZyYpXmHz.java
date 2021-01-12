package com.ites.crud.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class ZyYpXmHz {
    private String bah;
    private String zycs;
    private String kjksmc;
    private String xmmc;
    private String gg;

    public String getBah() {
        return bah;
    }

    public void setBah(String bah) {
        this.bah = bah;
    }

    public String getZycs() {
        return zycs;
    }

    public void setZycs(String zycs) {
        this.zycs = zycs;
    }

    public String getKjksmc() {
        return kjksmc;
    }

    public void setKjksmc(String kjksmc) {
        this.kjksmc = kjksmc;
    }

    public String getXmmc() {
        return xmmc;
    }

    public void setXmmc(String xmmc) {
        this.xmmc = xmmc;
    }

    public String getGg() {
        return gg;
    }

    public void setGg(String gg) {
        this.gg = gg;
    }

    public String getLsdw() {
        return lsdw;
    }

    public void setLsdw(String lsdw) {
        this.lsdw = lsdw;
    }

    public String getLsj() {
        return lsj;
    }

    public void setLsj(String lsj) {
        this.lsj = lsj;
    }

    public String getSl() {
        return sl;
    }

    public void setSl(String sl) {
        this.sl = sl;
    }

    public String getLsje() {
        return lsje;
    }

    public void setLsje(String lsje) {
        this.lsje = lsje;
    }

    public Date getSfsj() {
        return sfsj;
    }

    public void setSfsj(Date sfsj) {
        this.sfsj = sfsj;
    }

    private String lsdw;
    private String lsj;
    private String sl;
    private String lsje;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date sfsj;
}
