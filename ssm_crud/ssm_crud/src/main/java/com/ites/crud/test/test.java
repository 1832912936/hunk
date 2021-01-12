package com.ites.crud.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.io.*;
import java.sql.SQLException;
//验证是否连接数据库成功
public class test {
    @SuppressWarnings("resource")
    @Test
    public void testDataSources() throws SQLException {

        ApplicationContext ac = null;
        {
            ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        }
        DataSource dataSource=ac.getBean(DataSource.class);
        System.out.println(dataSource.getConnection());
    }
    @Test
    public  void textreadfile() throws FileNotFoundException, IOException {
        String  filepath = "C:\\Users\\admin\\OneDrive\\图片\\本机照片";
        File file = new File("C:\\Users\\admin\\OneDrive\\图片\\本机照片");
        if (!file.isDirectory()) {
            System.out.println("文件");
            System.out.println("path=" + file.getPath());
            System.out.println("absolutepath=" + file.getAbsolutePath());
            System.out.println("name=" + file.getName());
        } else if (file.isDirectory()) {
            System.out.println("文件夹");
            String[] filelist = file.list();
            for (int i = 0; i < filelist.length; i++) {
                File readfile = new File(filepath + "\\" + filelist[i]);
                if (!readfile.isDirectory()) {
                    System.out.println("path=" + readfile.getPath());
                    System.out.println("absolutepath="
                            + readfile.getAbsolutePath());
                    System.out.println("name=" + readfile.getName());
                } else if (readfile.isDirectory()) {
                }
            }
        }

    }




}
