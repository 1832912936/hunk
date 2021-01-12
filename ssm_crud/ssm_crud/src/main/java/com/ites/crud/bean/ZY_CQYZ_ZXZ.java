package com.ites.crud.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;


//@JSONField(format="yyyy-MM-dd HH:mm:ss")
public class ZY_CQYZ_ZXZ {
    private String  yzbz;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date  sxsj;
    private String yzlb;
    private String xmmc;
    private Double jl;
    private String jldw;
    private String yftj;
    private String yfpc;
    private String pcmc;
    private String yyms;
    private String ystssm;
    private String ysdm;
    private String hdr1;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date tzsj;
    private String  tzys;
    private  String tzry;
    private String bah;
    private String zycs;


    public String getPcmc() {
        return pcmc;
    }

    public void setPcmc(String pcmc) {
        this.pcmc = pcmc;
    }

    public String getZycs() {
        return zycs;
    }

    public void setZycs(String zycs) {
        this.zycs = zycs;
    }

    public String getBah() {
        return bah;
    }

    public void setBah(String bah) {
        this.bah = bah;
    }

    public String getYzbz() {
        return yzbz;
    }

    public void setYzbz(String yzbz) {
        this.yzbz = yzbz;
    }

    public Date getSxsj() {
        return sxsj;
    }

    public void setSxsj(Date sxsj) {
        this.sxsj = sxsj;
    }

    public String getYzlb() {
        return yzlb;
    }

    public void setYzlb(String yzlb) {
        this.yzlb = yzlb;
    }

    public String getXmmc() {
        return xmmc;
    }

    public void setXmmc(String xmmc) {
        this.xmmc = xmmc;
    }

    public Double getJl() {
        return jl;
    }

    public void setJl(Double jl) {
        this.jl = jl;
    }

    public String getJldw() {
        return jldw;
    }

    public void setJldw(String jldw) {
        this.jldw = jldw;
    }

    public String getYftj() {
        return yftj;
    }

    public void setYftj(String yftj) {
        this.yftj = yftj;
    }

    public String getYfpc() {
        return yfpc;
    }

    public void setYfpc(String yfpc) {
        this.yfpc = yfpc;
    }

    public String getYyms() {
        return yyms;
    }

    public void setYyms(String yyms) {
        this.yyms = yyms;
    }

    public String getYstssm() {
        return ystssm;
    }

    public void setYstssm(String ystssm) {
        this.ystssm = ystssm;
    }

    public String getYsdm() {
        return ysdm;
    }

    public void setYsdm(String ysdm) {
        this.ysdm = ysdm;
    }

    public String getHdr1() {
        return hdr1;
    }

    public void setHdr1(String hdr1) {
        this.hdr1 = hdr1;
    }

    public Date getTzsj() {
        return tzsj;
    }

    public void setTzsj(Date tzsj) {
        this.tzsj = tzsj;
    }

    public String getTzys() {
        return tzys;
    }

    public void setTzys(String tzys) {
        this.tzys = tzys;
    }

    public String getTzry() {
        return tzry;
    }

    public void setTzry(String tzry) {
        this.tzry = tzry;
    }

    public ZY_CQYZ_ZXZ(String yzbz, Date sxsj, String yzlb, String xmmc, Double jl, String jldw, String yftj, String yfpc, String yyms, String ystssm, String ysdm, String hdr1, Date tzsj, String tzys, String tzry, String bah, String zycs) {
        this.yzbz = yzbz;
        this.sxsj = sxsj;
        this.yzlb = yzlb;
        this.xmmc = xmmc;
        this.jl = jl;
        this.jldw = jldw;
        this.yftj = yftj;
        this.yfpc = yfpc;
        this.yyms = yyms;
        this.ystssm = ystssm;
        this.ysdm = ysdm;
        this.hdr1 = hdr1;
        this.tzsj = tzsj;
        this.tzys = tzys;
        this.tzry = tzry;
        this.bah = bah;
        this.zycs = zycs;
    }

    @Override
    public String toString() {
        return "ZY_CQYZ_ZXZ{" +
                "yzbz='" + yzbz + '\'' +
                ", sxsj=" + sxsj +
                ", yzlb='" + yzlb + '\'' +
                ", xmmc='" + xmmc + '\'' +
                ", jl=" + jl +
                ", jldw='" + jldw + '\'' +
                ", yftj='" + yftj + '\'' +
                ", yfpc='" + yfpc + '\'' +
                ", yyms='" + yyms + '\'' +
                ", ystssm='" + ystssm + '\'' +
                ", ysdm='" + ysdm + '\'' +
                ", hdr1='" + hdr1 + '\'' +
                ", tzsj=" + tzsj +
                ", tzys='" + tzys + '\'' +
                ", tzry='" + tzry + '\'' +
                ", bah='" + bah + '\'' +
                ", zycs='" + zycs + '\'' +
                ", pcmc='" + pcmc + '\'' +
                '}';
    }

    public ZY_CQYZ_ZXZ() {
    }
}
