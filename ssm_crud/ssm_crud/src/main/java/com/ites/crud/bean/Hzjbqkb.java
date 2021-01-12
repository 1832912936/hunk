package com.ites.crud.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Hzjbqkb {
    private String zycs;
    private String sflb;
    private String jiankangka;
    private Integer sjzycs;
    private String bah;
    private String xm;
    private String xb;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date csrq;
    @TableField("nl_num")
    private Integer nlNum;
    private String nldw;
    @TableField("nl_char")
    private String nlChar;
    private String gj;
    @TableField("nl_buzu")
    private Integer nlBuzu;
    @TableField("xinshenger_tj")
    private Double xinshengerTj;
    @TableField("xinshenger_rytj")
    private Double xinshengerRytj;
    private String csss;
    private String cssx;
    @TableField("jg_ss")
    private String jgSs;
    @TableField("jg_sx")
    private String jgSx;
    private String mz;
    private String sfzh;
    private String zy;
    private String hf;
    @TableField("xiandizhi_dz")
    private String xiandizhiDz;
    @TableField("xiandizhi_dh")
    private String xiandizhiDh;
    @TableField("xiandizhi_yb")
    private String xiandizhiYb;
    @TableField("hk_dz")
    private String hkDz;
    @TableField("hk_yb")
    private String hkYb;
    @TableField("gzdw_name")
    private String gzdwName;
    @TableField("gzdw_dh")
    private String gzdwDh;
    @TableField("gzdw_yb")
    private String gzdwYb;
    @TableField("lxr_name")
    private String lxrName;
    @TableField("lxr_gx")
    private String lxrGx;
    @TableField("lxr_dz")
    private String lxrDz;
    @TableField("lxr_dh")
    private String lxrDh;
    private String rytujing;
    private String zllb;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date ryrq;
    private String ryks;
    @TableField("bf_ry")
    private String bfRy;
    private String zkks;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date cyrq;
    private String cyks;
    @TableField("bf_cy")
    private String bfCy;
    private Integer zyts;
    @TableField("zyts_dw")
    private String zytsDw;
    @TableField("mzzd_zy")
    private String mzzdZy;
    @TableField("mzzd_zy_icd10")
    private String mzzdZyIcd10;
    private String mzzd;
    @TableField("mzzd_icd10")
    private String mzzdIcd10;
    private String sslclj;
    private String syyljgzyzj;
    private String syzyzlsb;
    private String syzyzljs;
    private String bzsh;
    private String ryqk;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date ryqzrq;
    private String ryqzts;
    private String sszdwbyy;
    private String yngrmc;
    /*==========================================================================================================================================================================*/
    private String blzd;
    @TableField("blzd_icd10")
    private String blzdIcd10;
    @TableField("xx_bh")
    private String xxBh;
    @TableField("xx_sxfy")
    private String xxSxfy;
    @TableField("xx_rh")
    private String xxRh;
    private String sjbz;
    private String liyuanfangshi;
    @TableField("liyuan_jigou")
    private String liyuanJigou;
    @TableField("ywgm_hbsag")
    private String ywgmHbsag;
    private String ywgms;
    private String cy31ry;
    @TableField("cy31ry_md")
    private String cy31ryMd;
    @TableField("hunmi_ryr")
    private String hunmiRyr;
    @TableField("hunmi_rys")
    private String hunmiRys;
    @TableField("hunmi_ryf")
    private String hunmiRyf;
    @TableField("hunmi_cyr")
    private String hunmiCyr;
    @TableField("hunmi_cys")
    private String hunmiCys;
    @TableField("hunmi_cyf")
    private String hunmiCyf;
    @TableField("ys_zr")
    private String ysZr;
    @TableField("ys_fzr")
    private String ysFzr;
    @TableField("ys_zz")
    private String ysZz;
    @TableField("ys_zy")
    private String ysZy;
    @TableField("ys_yjs")
    private String ysYjs;
    @TableField("ys_jx")
    private String ysJx;
    @TableField("ys_sx")
    private String ysSx;
    private String bmry;
    private String bazl;
    @TableField("bazl_zkys")
    private String bazlZkys;
    @TableField("bzzl_zkhs")
    private String bzzlZkhs;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @TableField("bzzl_zkrq")
    private Date bzzlZkrq;
    @TableField("zdfh_mzcy")
    private String zdfhMzcy;
    @TableField("zdfh_rycy")
    private String zdfhRycy;
    @TableField("zdfh_sqsh")
    private String zdfhsqsh;
    @TableField("zdfh_lcbl")
    private String zdfhLcbl;
    @TableField("zdfh_fsbl")
    private String zdfhFsbl;
    private Integer qjcs;
    private Integer qjcgcs;
    @TableField("ip_no")
    private String ipNo;

    public String getIpNo() {
        return ipNo;
    }

    public void setIpNo(String ipNo) {
        this.ipNo = ipNo;
    }

    public String getZycs() {
        return zycs;
    }

    public String getSflb() {
        return sflb;
    }

    public String getJiankangka() {
        return jiankangka;
    }

    public Integer getSjzycs() {
        return sjzycs;
    }

    public String getBah() {
        return bah;
    }

    public String getXm() {
        return xm;
    }

    public String getXb() {
        return xb;
    }

    public Date getCsrq() {
        return csrq;
    }

    public Integer getNlNum() {
        return nlNum;
    }

    public String getNldw() {
        return nldw;
    }

    public String getNlChar() {
        return nlChar;
    }

    public String getGj() {
        return gj;
    }

    public Integer getNlBuzu() {
        return nlBuzu;
    }

    public Double getXinshengerTj() {
        return xinshengerTj;
    }

    public Double getXinshengerRytj() {
        return xinshengerRytj;
    }

    public String getCsss() {
        return csss;
    }

    public String getCssx() {
        return cssx;
    }

    public String getJgSs() {
        return jgSs;
    }

    public String getJgSx() {
        return jgSx;
    }

    public String getMz() {
        return mz;
    }

    public String getSfzh() {
        return sfzh;
    }

    public String getZy() {
        return zy;
    }

    public String getHf() {
        return hf;
    }

    public String getXiandizhiDz() {
        return xiandizhiDz;
    }

    public String getXiandizhiDh() {
        return xiandizhiDh;
    }

    public String getXiandizhiYb() {
        return xiandizhiYb;
    }

    public String getHkDz() {
        return hkDz;
    }

    public String getHkYb() {
        return hkYb;
    }

    public String getGzdwName() {
        return gzdwName;
    }

    public String getGzdwDh() {
        return gzdwDh;
    }

    public String getGzdwYb() {
        return gzdwYb;
    }

    public String getLxrName() {
        return lxrName;
    }

    public String getLxrGx() {
        return lxrGx;
    }

    public String getLxrDz() {
        return lxrDz;
    }

    public String getLxrDh() {
        return lxrDh;
    }

    public String getRytujing() {
        return rytujing;
    }

    public String getZllb() {
        return zllb;
    }

    public Date getRyrq() {
        return ryrq;
    }

    public String getRyks() {
        return ryks;
    }

    public String getBfRy() {
        return bfRy;
    }

    public String getZkks() {
        return zkks;
    }

    public Date getCyrq() {
        return cyrq;
    }

    public String getCyks() {
        return cyks;
    }

    public String getBfCy() {
        return bfCy;
    }

    public Integer getZyts() {
        return zyts;
    }

    public String getZytsDw() {
        return zytsDw;
    }

    public String getMzzdZy() {
        return mzzdZy;
    }

    public String getMzzdZyIcd10() {
        return mzzdZyIcd10;
    }

    public String getMzzd() {
        return mzzd;
    }

    public String getMzzdIcd10() {
        return mzzdIcd10;
    }

    public String getSslclj() {
        return sslclj;
    }

    public String getSyyljgzyzj() {
        return syyljgzyzj;
    }

    public String getSyzyzlsb() {
        return syzyzlsb;
    }

    public String getSyzyzljs() {
        return syzyzljs;
    }

    public String getBzsh() {
        return bzsh;
    }

    public String getRyqk() {
        return ryqk;
    }

    public Date getRyqzrq() {
        return ryqzrq;
    }

    public String getRyqzts() {
        return ryqzts;
    }

    public String getSszdwbyy() {
        return sszdwbyy;
    }

    public String getYngrmc() {
        return yngrmc;
    }

    public String getBlzd() {
        return blzd;
    }

    public String getBlzdIcd10() {
        return blzdIcd10;
    }

    public String getXxBh() {
        return xxBh;
    }

    public String getXxSxfy() {
        return xxSxfy;
    }

    public String getXxRh() {
        return xxRh;
    }

    public String getSjbz() {
        return sjbz;
    }

    public String getLiyuanfangshi() {
        return liyuanfangshi;
    }

    public String getLiyuanJigou() {
        return liyuanJigou;
    }

    public String getYwgmHbsag() {
        return ywgmHbsag;
    }

    public String getYwgms() {
        return ywgms;
    }

    public String getCy31ry() {
        return cy31ry;
    }

    public String getCy31ryMd() {
        return cy31ryMd;
    }

    public String getHunmiRyr() {
        return hunmiRyr;
    }

    public String getHunmiRys() {
        return hunmiRys;
    }

    public String getHunmiRyf() {
        return hunmiRyf;
    }

    public String getHunmiCyr() {
        return hunmiCyr;
    }

    public String getHunmiCys() {
        return hunmiCys;
    }

    public String getHunmiCyf() {
        return hunmiCyf;
    }

    public String getYsZr() {
        return ysZr;
    }

    public String getYsFzr() {
        return ysFzr;
    }

    public String getYsZz() {
        return ysZz;
    }

    public String getYsZy() {
        return ysZy;
    }

    public String getYsYjs() {
        return ysYjs;
    }

    public String getYsJx() {
        return ysJx;
    }

    public String getYsSx() {
        return ysSx;
    }

    public String getBmry() {
        return bmry;
    }

    public String getBazl() {
        return bazl;
    }

    public String getBazlZkys() {
        return bazlZkys;
    }

    public String getBzzlZkhs() {
        return bzzlZkhs;
    }

    public Date getBzzlZkrq() {
        return bzzlZkrq;
    }

    public String getZdfhMzcy() {
        return zdfhMzcy;
    }

    public String getZdfhRycy() {
        return zdfhRycy;
    }

    public String getZdfhsqsh() {
        return zdfhsqsh;
    }

    public String getZdfhLcbl() {
        return zdfhLcbl;
    }

    public String getZdfhFsbl() {
        return zdfhFsbl;
    }

    public Integer getQjcs() {
        return qjcs;
    }

    public Integer getQjcgcs() {
        return qjcgcs;
    }

    public void setZycs(String zycs) {
        this.zycs = zycs;
    }

    public void setSflb(String sflb) {
        this.sflb = sflb;
    }

    public void setJiankangka(String jiankangka) {
        this.jiankangka = jiankangka;
    }

    public void setSjzycs(Integer sjzycs) {
        this.sjzycs = sjzycs;
    }

    public void setBah(String bah) {
        this.bah = bah;
    }

    public void setXm(String xm) {
        this.xm = xm;
    }

    public void setXb(String xb) {
        this.xb = xb;
    }

    public void setCsrq(Date csrq) {
        this.csrq = csrq;
    }

    public void setNlNum(Integer nlNum) {
        this.nlNum = nlNum;
    }

    public void setNldw(String nldw) {
        this.nldw = nldw;
    }

    public void setNlChar(String nlChar) {
        this.nlChar = nlChar;
    }

    public void setGj(String gj) {
        this.gj = gj;
    }

    public void setNlBuzu(Integer nlBuzu) {
        this.nlBuzu = nlBuzu;
    }

    public void setXinshengerTj(Double xinshengerTj) {
        this.xinshengerTj = xinshengerTj;
    }

    public void setXinshengerRytj(Double xinshengerRytj) {
        this.xinshengerRytj = xinshengerRytj;
    }

    public void setCsss(String csss) {
        this.csss = csss;
    }

    public void setCssx(String cssx) {
        this.cssx = cssx;
    }

    public void setJgSs(String jgSs) {
        this.jgSs = jgSs;
    }

    public void setJgSx(String jgSx) {
        this.jgSx = jgSx;
    }

    public void setMz(String mz) {
        this.mz = mz;
    }

    public void setSfzh(String sfzh) {
        this.sfzh = sfzh;
    }

    public void setZy(String zy) {
        this.zy = zy;
    }

    public void setHf(String hf) {
        this.hf = hf;
    }

    public void setXiandizhiDz(String xiandizhiDz) {
        this.xiandizhiDz = xiandizhiDz;
    }

    public void setXiandizhiDh(String xiandizhiDh) {
        this.xiandizhiDh = xiandizhiDh;
    }

    public void setXiandizhiYb(String xiandizhiYb) {
        this.xiandizhiYb = xiandizhiYb;
    }

    public void setHkDz(String hkDz) {
        this.hkDz = hkDz;
    }

    public void setHkYb(String hkYb) {
        this.hkYb = hkYb;
    }

    public void setGzdwName(String gzdwName) {
        this.gzdwName = gzdwName;
    }

    public void setGzdwDh(String gzdwDh) {
        this.gzdwDh = gzdwDh;
    }

    public void setGzdwYb(String gzdwYb) {
        this.gzdwYb = gzdwYb;
    }

    public void setLxrName(String lxrName) {
        this.lxrName = lxrName;
    }

    public void setLxrGx(String lxrGx) {
        this.lxrGx = lxrGx;
    }

    public void setLxrDz(String lxrDz) {
        this.lxrDz = lxrDz;
    }

    public void setLxrDh(String lxrDh) {
        this.lxrDh = lxrDh;
    }

    public void setRytujing(String rytujing) {
        this.rytujing = rytujing;
    }

    public void setZllb(String zllb) {
        this.zllb = zllb;
    }

    public void setRyrq(Date ryrq) {
        this.ryrq = ryrq;
    }

    public void setRyks(String ryks) {
        this.ryks = ryks;
    }

    public void setBfRy(String bfRy) {
        this.bfRy = bfRy;
    }

    public void setZkks(String zkks) {
        this.zkks = zkks;
    }

    public void setCyrq(Date cyrq) {
        this.cyrq = cyrq;
    }

    public void setCyks(String cyks) {
        this.cyks = cyks;
    }

    public void setBfCy(String bfCy) {
        this.bfCy = bfCy;
    }

    public void setZyts(Integer zyts) {
        this.zyts = zyts;
    }

    public void setZytsDw(String zytsDw) {
        this.zytsDw = zytsDw;
    }

    public void setMzzdZy(String mzzdZy) {
        this.mzzdZy = mzzdZy;
    }

    public void setMzzdZyIcd10(String mzzdZyIcd10) {
        this.mzzdZyIcd10 = mzzdZyIcd10;
    }

    public void setMzzd(String mzzd) {
        this.mzzd = mzzd;
    }

    public void setMzzdIcd10(String mzzdIcd10) {
        this.mzzdIcd10 = mzzdIcd10;
    }

    public void setSslclj(String sslclj) {
        this.sslclj = sslclj;
    }

    public void setSyyljgzyzj(String syyljgzyzj) {
        this.syyljgzyzj = syyljgzyzj;
    }

    public void setSyzyzlsb(String syzyzlsb) {
        this.syzyzlsb = syzyzlsb;
    }

    public void setSyzyzljs(String syzyzljs) {
        this.syzyzljs = syzyzljs;
    }

    public void setBzsh(String bzsh) {
        this.bzsh = bzsh;
    }

    public void setRyqk(String ryqk) {
        this.ryqk = ryqk;
    }

    public void setRyqzrq(Date ryqzrq) {
        this.ryqzrq = ryqzrq;
    }

    public void setRyqzts(String ryqzts) {
        this.ryqzts = ryqzts;
    }

    public void setSszdwbyy(String sszdwbyy) {
        this.sszdwbyy = sszdwbyy;
    }

    public void setYngrmc(String yngrmc) {
        this.yngrmc = yngrmc;
    }

    public void setBlzd(String blzd) {
        this.blzd = blzd;
    }

    public void setBlzdIcd10(String blzdIcd10) {
        this.blzdIcd10 = blzdIcd10;
    }

    public void setXxBh(String xxBh) {
        this.xxBh = xxBh;
    }

    public void setXxSxfy(String xxSxfy) {
        this.xxSxfy = xxSxfy;
    }

    public void setXxRh(String xxRh) {
        this.xxRh = xxRh;
    }

    public void setSjbz(String sjbz) {
        this.sjbz = sjbz;
    }

    public void setLiyuanfangshi(String liyuanfangshi) {
        this.liyuanfangshi = liyuanfangshi;
    }

    public void setLiyuanJigou(String liyuanJigou) {
        this.liyuanJigou = liyuanJigou;
    }

    public void setYwgmHbsag(String ywgmHbsag) {
        this.ywgmHbsag = ywgmHbsag;
    }

    public void setYwgms(String ywgms) {
        this.ywgms = ywgms;
    }

    public void setCy31ry(String cy31ry) {
        this.cy31ry = cy31ry;
    }

    public void setCy31ryMd(String cy31ryMd) {
        this.cy31ryMd = cy31ryMd;
    }

    public void setHunmiRyr(String hunmiRyr) {
        this.hunmiRyr = hunmiRyr;
    }

    public void setHunmiRys(String hunmiRys) {
        this.hunmiRys = hunmiRys;
    }

    public void setHunmiRyf(String hunmiRyf) {
        this.hunmiRyf = hunmiRyf;
    }

    public void setHunmiCyr(String hunmiCyr) {
        this.hunmiCyr = hunmiCyr;
    }

    public void setHunmiCys(String hunmiCys) {
        this.hunmiCys = hunmiCys;
    }

    public void setHunmiCyf(String hunmiCyf) {
        this.hunmiCyf = hunmiCyf;
    }

    public void setYsZr(String ysZr) {
        this.ysZr = ysZr;
    }

    public void setYsFzr(String ysFzr) {
        this.ysFzr = ysFzr;
    }

    public void setYsZz(String ysZz) {
        this.ysZz = ysZz;
    }

    public void setYsZy(String ysZy) {
        this.ysZy = ysZy;
    }

    public void setYsYjs(String ysYjs) {
        this.ysYjs = ysYjs;
    }

    public void setYsJx(String ysJx) {
        this.ysJx = ysJx;
    }

    public void setYsSx(String ysSx) {
        this.ysSx = ysSx;
    }

    public void setBmry(String bmry) {
        this.bmry = bmry;
    }

    public void setBazl(String bazl) {
        this.bazl = bazl;
    }

    public void setBazlZkys(String bazlZkys) {
        this.bazlZkys = bazlZkys;
    }

    public void setBzzlZkhs(String bzzlZkhs) {
        this.bzzlZkhs = bzzlZkhs;
    }

    public void setBzzlZkrq(Date bzzlZkrq) {
        this.bzzlZkrq = bzzlZkrq;
    }

    public void setZdfhMzcy(String zdfhMzcy) {
        this.zdfhMzcy = zdfhMzcy;
    }

    public void setZdfhRycy(String zdfhRycy) {
        this.zdfhRycy = zdfhRycy;
    }

    public void setZdfhsqsh(String zdfhsqsh) {
        this.zdfhsqsh = zdfhsqsh;
    }

    public void setZdfhLcbl(String zdfhLcbl) {
        this.zdfhLcbl = zdfhLcbl;
    }

    public void setZdfhFsbl(String zdfhFsbl) {
        this.zdfhFsbl = zdfhFsbl;
    }

    public void setQjcs(Integer qjcs) {
        this.qjcs = qjcs;
    }

    public void setQjcgcs(Integer qjcgcs) {
        this.qjcgcs = qjcgcs;
    }

    public Hzjbqkb(String zycs, String sflb, String jiankangka, Integer sjzycs, String bah, String xm, String xb, Date csrq, Integer nlNum, String nldw, String nlChar, String gj, Integer nlBuzu, Double xinshengerTj, Double xinshengerRytj, String csss, String cssx, String jgSs, String jgSx, String mz, String sfzh, String zy, String hf, String xiandizhiDz, String xiandizhiDh, String xiandizhiYb, String hkDz, String hkYb, String gzdwName, String gzdwDh, String gzdwYb, String lxrName, String lxrGx, String lxrDz, String lxrDh, String rytujing, String zllb, Date ryrq, String ryks, String bfRy, String zkks, Date cyrq, String cyks, String bfCy, Integer zyts, String zytsDw, String mzzdZy, String mzzdZyIcd10, String mzzd, String mzzdIcd10, String sslclj, String syyljgzyzj, String syzyzlsb, String syzyzljs, String bzsh, String ryqk, Date ryqzrq, String ryqzts, String sszdwbyy, String yngrmc, String blzd, String blzdIcd10, String xxBh, String xxSxfy, String xxRh, String sjbz, String liyuanfangshi, String liyuanJigou, String ywgmHbsag, String ywgms, String cy31ry, String cy31ryMd, String hunmiRyr, String hunmiRys, String hunmiRyf, String hunmiCyr, String hunmiCys, String hunmiCyf, String ysZr, String ysFzr, String ysZz, String ysZy, String ysYjs, String ysJx, String ysSx, String bmry, String bazl, String bazlZkys, String bzzlZkhs, Date bzzlZkrq, String zdfhMzcy, String zdfhRycy, String zdfhsqsh, String zdfhLcbl, String zdfhFsbl, Integer qjcs, Integer qjcgcs, String ipNo) {
        this.zycs = zycs;
        this.sflb = sflb;
        this.jiankangka = jiankangka;
        this.sjzycs = sjzycs;
        this.bah = bah;
        this.xm = xm;
        this.xb = xb;
        this.csrq = csrq;
        this.nlNum = nlNum;
        this.nldw = nldw;
        this.nlChar = nlChar;
        this.gj = gj;
        this.nlBuzu = nlBuzu;
        this.xinshengerTj = xinshengerTj;
        this.xinshengerRytj = xinshengerRytj;
        this.csss = csss;
        this.cssx = cssx;
        this.jgSs = jgSs;
        this.jgSx = jgSx;
        this.mz = mz;
        this.sfzh = sfzh;
        this.zy = zy;
        this.hf = hf;
        this.xiandizhiDz = xiandizhiDz;
        this.xiandizhiDh = xiandizhiDh;
        this.xiandizhiYb = xiandizhiYb;
        this.hkDz = hkDz;
        this.hkYb = hkYb;
        this.gzdwName = gzdwName;
        this.gzdwDh = gzdwDh;
        this.gzdwYb = gzdwYb;
        this.lxrName = lxrName;
        this.lxrGx = lxrGx;
        this.lxrDz = lxrDz;
        this.lxrDh = lxrDh;
        this.rytujing = rytujing;
        this.zllb = zllb;
        this.ryrq = ryrq;
        this.ryks = ryks;
        this.bfRy = bfRy;
        this.zkks = zkks;
        this.cyrq = cyrq;
        this.cyks = cyks;
        this.bfCy = bfCy;
        this.zyts = zyts;
        this.zytsDw = zytsDw;
        this.mzzdZy = mzzdZy;
        this.mzzdZyIcd10 = mzzdZyIcd10;
        this.mzzd = mzzd;
        this.mzzdIcd10 = mzzdIcd10;
        this.sslclj = sslclj;
        this.syyljgzyzj = syyljgzyzj;
        this.syzyzlsb = syzyzlsb;
        this.syzyzljs = syzyzljs;
        this.bzsh = bzsh;
        this.ryqk = ryqk;
        this.ryqzrq = ryqzrq;
        this.ryqzts = ryqzts;
        this.sszdwbyy = sszdwbyy;
        this.yngrmc = yngrmc;
        this.blzd = blzd;
        this.blzdIcd10 = blzdIcd10;
        this.xxBh = xxBh;
        this.xxSxfy = xxSxfy;
        this.xxRh = xxRh;
        this.sjbz = sjbz;
        this.liyuanfangshi = liyuanfangshi;
        this.liyuanJigou = liyuanJigou;
        this.ywgmHbsag = ywgmHbsag;
        this.ywgms = ywgms;
        this.cy31ry = cy31ry;
        this.cy31ryMd = cy31ryMd;
        this.hunmiRyr = hunmiRyr;
        this.hunmiRys = hunmiRys;
        this.hunmiRyf = hunmiRyf;
        this.hunmiCyr = hunmiCyr;
        this.hunmiCys = hunmiCys;
        this.hunmiCyf = hunmiCyf;
        this.ysZr = ysZr;
        this.ysFzr = ysFzr;
        this.ysZz = ysZz;
        this.ysZy = ysZy;
        this.ysYjs = ysYjs;
        this.ysJx = ysJx;
        this.ysSx = ysSx;
        this.bmry = bmry;
        this.bazl = bazl;
        this.bazlZkys = bazlZkys;
        this.bzzlZkhs = bzzlZkhs;
        this.bzzlZkrq = bzzlZkrq;
        this.zdfhMzcy = zdfhMzcy;
        this.zdfhRycy = zdfhRycy;
        this.zdfhsqsh = zdfhsqsh;
        this.zdfhLcbl = zdfhLcbl;
        this.zdfhFsbl = zdfhFsbl;
        this.qjcs = qjcs;
        this.qjcgcs = qjcgcs;
        this.ipNo = ipNo;
    }

    public Hzjbqkb() {
    }

    @Override
    public String toString() {
        return "Hzjbqkb{" +
                "zycs='" + zycs + '\'' +
                ", sflb='" + sflb + '\'' +
                ", jiankangka='" + jiankangka + '\'' +
                ", sjzycs=" + sjzycs +
                ", bah='" + bah + '\'' +
                ", xm='" + xm + '\'' +
                ", xb='" + xb + '\'' +
                ", csrq=" + csrq +
                ", nlNum=" + nlNum +
                ", nldw='" + nldw + '\'' +
                ", nlChar='" + nlChar + '\'' +
                ", gj='" + gj + '\'' +
                ", nlBuzu=" + nlBuzu +
                ", xinshengerTj=" + xinshengerTj +
                ", xinshengerRytj=" + xinshengerRytj +
                ", csss='" + csss + '\'' +
                ", cssx='" + cssx + '\'' +
                ", jgSs='" + jgSs + '\'' +
                ", jgSx='" + jgSx + '\'' +
                ", mz='" + mz + '\'' +
                ", sfzh='" + sfzh + '\'' +
                ", zy='" + zy + '\'' +
                ", hf='" + hf + '\'' +
                ", xiandizhiDz='" + xiandizhiDz + '\'' +
                ", xiandizhiDh='" + xiandizhiDh + '\'' +
                ", xiandizhiYb='" + xiandizhiYb + '\'' +
                ", hkDz='" + hkDz + '\'' +
                ", hkYb='" + hkYb + '\'' +
                ", gzdwName='" + gzdwName + '\'' +
                ", gzdwDh='" + gzdwDh + '\'' +
                ", gzdwYb='" + gzdwYb + '\'' +
                ", lxrName='" + lxrName + '\'' +
                ", lxrGx='" + lxrGx + '\'' +
                ", lxrDz='" + lxrDz + '\'' +
                ", lxrDh='" + lxrDh + '\'' +
                ", rytujing='" + rytujing + '\'' +
                ", zllb='" + zllb + '\'' +
                ", ryrq=" + ryrq +
                ", ryks='" + ryks + '\'' +
                ", bfRy='" + bfRy + '\'' +
                ", zkks='" + zkks + '\'' +
                ", cyrq=" + cyrq +
                ", cyks='" + cyks + '\'' +
                ", bfCy='" + bfCy + '\'' +
                ", zyts=" + zyts +
                ", zytsDw='" + zytsDw + '\'' +
                ", mzzdZy='" + mzzdZy + '\'' +
                ", mzzdZyIcd10='" + mzzdZyIcd10 + '\'' +
                ", mzzd='" + mzzd + '\'' +
                ", mzzdIcd10='" + mzzdIcd10 + '\'' +
                ", sslclj='" + sslclj + '\'' +
                ", syyljgzyzj='" + syyljgzyzj + '\'' +
                ", syzyzlsb='" + syzyzlsb + '\'' +
                ", syzyzljs='" + syzyzljs + '\'' +
                ", bzsh='" + bzsh + '\'' +
                ", ryqk='" + ryqk + '\'' +
                ", ryqzrq=" + ryqzrq +
                ", ryqzts='" + ryqzts + '\'' +
                ", sszdwbyy='" + sszdwbyy + '\'' +
                ", yngrmc='" + yngrmc + '\'' +
                ", blzd='" + blzd + '\'' +
                ", blzdIcd10='" + blzdIcd10 + '\'' +
                ", xxBh='" + xxBh + '\'' +
                ", xxSxfy='" + xxSxfy + '\'' +
                ", xxRh='" + xxRh + '\'' +
                ", sjbz='" + sjbz + '\'' +
                ", liyuanfangshi='" + liyuanfangshi + '\'' +
                ", liyuanJigou='" + liyuanJigou + '\'' +
                ", ywgmHbsag='" + ywgmHbsag + '\'' +
                ", ywgms='" + ywgms + '\'' +
                ", cy31ry='" + cy31ry + '\'' +
                ", cy31ryMd='" + cy31ryMd + '\'' +
                ", hunmiRyr='" + hunmiRyr + '\'' +
                ", hunmiRys='" + hunmiRys + '\'' +
                ", hunmiRyf='" + hunmiRyf + '\'' +
                ", hunmiCyr='" + hunmiCyr + '\'' +
                ", hunmiCys='" + hunmiCys + '\'' +
                ", hunmiCyf='" + hunmiCyf + '\'' +
                ", ysZr='" + ysZr + '\'' +
                ", ysFzr='" + ysFzr + '\'' +
                ", ysZz='" + ysZz + '\'' +
                ", ysZy='" + ysZy + '\'' +
                ", ysYjs='" + ysYjs + '\'' +
                ", ysJx='" + ysJx + '\'' +
                ", ysSx='" + ysSx + '\'' +
                ", bmry='" + bmry + '\'' +
                ", bazl='" + bazl + '\'' +
                ", bazlZkys='" + bazlZkys + '\'' +
                ", bzzlZkhs='" + bzzlZkhs + '\'' +
                ", bzzlZkrq=" + bzzlZkrq +
                ", zdfhMzcy='" + zdfhMzcy + '\'' +
                ", zdfhRycy='" + zdfhRycy + '\'' +
                ", zdfhsqsh='" + zdfhsqsh + '\'' +
                ", zdfhLcbl='" + zdfhLcbl + '\'' +
                ", zdfhFsbl='" + zdfhFsbl + '\'' +
                ", qjcs=" + qjcs +
                ", qjcgcs=" + qjcgcs +
                ", ipNo='" + ipNo + '\'' +
                '}';
    }
}
