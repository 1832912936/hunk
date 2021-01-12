package com.ites.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

@Controller
@RequestMapping(value = "/photo")
public class photo{
    /**
     * 获取图片的方法
     * @param request
     * @param response
     * @param dz 图片地址
     * @return
     */
    @RequestMapping(value = "/query_pic")
    @ResponseBody
    public void query_pic(HttpServletRequest request,HttpServletResponse response,@RequestParam("dz") String dz) {
        try {
            File pf = new File(dz);
            if (!pf.exists()) {
                return;
            }
            double rate = 1; //rate是压缩比率  1为原图  0.1为最模糊
            int[] results = getImgWidth(pf);
            int widthdist = 0;
            int heightdist = 0;
            if (results == null || results[0] == 0 || results[1] == 0) {
                return;
            } else {
                widthdist = (int) (results[0] * rate);
                heightdist = (int) (results[1] * rate);
            }
            Image src = javax.imageio.ImageIO.read(pf);
            BufferedImage tag = new BufferedImage((int) widthdist, (int) heightdist,
                    BufferedImage.TYPE_INT_RGB);

            tag.getGraphics().drawImage(src.getScaledInstance(widthdist, heightdist, Image.SCALE_SMOOTH), 0, 0,
                    null);
            ServletOutputStream fout = response.getOutputStream();
            ImageIO.write(tag, "jpg", fout);
            fout.close();
        } catch (Exception e) {
            //异常处理
        }
    }
    public static int[] getImgWidth(File file) {
        InputStream is = null;
        BufferedImage src = null;
        int result[] = { 0, 0 };
        try {
            is = new FileInputStream(file);
            src = javax.imageio.ImageIO.read(is);
            result[0] = src.getWidth(null); // 得到源图宽
            result[1] = src.getHeight(null); // 得到源图高
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}