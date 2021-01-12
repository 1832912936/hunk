package com.ites.crud.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class BqHlHzhldNext {
    private String bah;
    private String zycs;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date sj;
    private String zyts;
    private String tw;
    private String mb;
    private String hx;
    private String bz1;
}
