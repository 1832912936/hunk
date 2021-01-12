package com.ites.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ites.crud.bean.Msg;
import com.ites.crud.bean.ZyYpXmHz;
import com.ites.crud.service.ZyYpXmHzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.util.List;

@Controller
@SuppressWarnings("all")
public class ZyYpXmHzController {
    @Autowired
    private ZyYpXmHzService zyYpXmHzService;

    @RequestMapping("/findFyqd")
    @ResponseBody
    public Msg findFyqd(@RequestParam(value = "pn",defaultValue = "1") Integer pn, ZyYpXmHz zyYpXmHz){
        DecimalFormat decimalFormat = new DecimalFormat("##0.00");
        PageHelper.startPage(pn , 10);
        List<ZyYpXmHz> zyYpXmHzs = zyYpXmHzService.findFyqd(zyYpXmHz);
        for (int i = 0; i < zyYpXmHzs.size(); i++) {
            ZyYpXmHz zyYpXmHz1 = zyYpXmHzs.get(i);                      //获取到每行的数据
            Double get_lsj = Double.parseDouble(zyYpXmHz1.getLsj());    //获取到零售价并从String转为Double
            Double a = null;
            a = (Double)(Math.round(get_lsj*100)/100.0);                //将四舍五入后保留两位的数字存在a中
            String lsj = decimalFormat.format(a);                       //格式话小数并转为String保留两位小数
            zyYpXmHz1.setLsj(lsj);                                      //将转换后的值set回去

            Double get_sl = Double.parseDouble(zyYpXmHz1.getSl());
            Double b = null;
            b = (Double)(Math.round(get_sl*100)/100.0);
            String sl = decimalFormat.format(b);
            zyYpXmHz1.setSl(sl);

            Double get_lsje = Double.parseDouble(zyYpXmHz1.getLsje());
            Double c = null;
            c = (Double)(Math.round(get_lsje*100)/100.0);
            String lsje = decimalFormat.format(c);
            zyYpXmHz1.setLsje(lsje);
        }
        PageInfo page =  new PageInfo(zyYpXmHzs,5);
        return Msg.success().add("zyYpXmHzs",page);
    }
}
