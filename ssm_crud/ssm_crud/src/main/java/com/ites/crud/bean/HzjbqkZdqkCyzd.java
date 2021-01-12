package com.ites.crud.bean;

import com.baomidou.mybatisplus.annotation.TableField;

public class HzjbqkZdqkCyzd {
    private String bah;
    private String zycs;
    private String bz;
    @TableField("zd_icd10")
    private String zdIcd10;
    @TableField("zd_mc")
    private String zdMc;
    private String zlxg;
    private String ryqk;

    public void setBah(String bah) {
        this.bah = bah;
    }

    public void setZycs(String zycs) {
        this.zycs = zycs;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public void setZdIcd10(String zdIcd10) {
        this.zdIcd10 = zdIcd10;
    }

    public void setZdMc(String zdMc) {
        this.zdMc = zdMc;
    }

    public void setZlxg(String zlxg) {
        this.zlxg = zlxg;
    }

    public void setRyqk(String ryqk) {
        this.ryqk = ryqk;
    }

    public String getBah() {
        return bah;
    }

    public String getZycs() {
        return zycs;
    }

    public String getBz() {
        return bz;
    }

    public String getZdIcd10() {
        return zdIcd10;
    }

    public String getZdMc() {
        return zdMc;
    }

    public String getZlxg() {
        return zlxg;
    }

    public String getRyqk() {
        return ryqk;
    }

    public HzjbqkZdqkCyzd(String bah, String zycs, String bz, String zdIcd10, String zdMc, String zlxg, String ryqk) {
        this.bah = bah;
        this.zycs = zycs;
        this.bz = bz;
        this.zdIcd10 = zdIcd10;
        this.zdMc = zdMc;
        this.zlxg = zlxg;
        this.ryqk = ryqk;
    }

    public HzjbqkZdqkCyzd() {
    }

    @Override
    public String toString() {
        return "HzjbqkZdqkCyzd{" +
                "bah='" + bah + '\'' +
                ", zycs='" + zycs + '\'' +
                ", bz='" + bz + '\'' +
                ", zdIcd10='" + zdIcd10 + '\'' +
                ", zdMc='" + zdMc + '\'' +
                ", zlxg='" + zlxg + '\'' +
                ", ryqk='" + ryqk + '\'' +
                '}';
    }
}
