package com.wr4.util;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class FontImage
{

	 /**图片格式：JPG*/
	 private static final String PICTRUE_FORMATE_JPG = "jpg";

	
	  /* 获取字符长度，一个汉字作为 1 个字符, 一个英文字母作为 0.5 个字符
	  * @param text
	  * @return 字符长度，如：text="中国",返回 2；text="test",返回 2；text="中国ABC",返回 4.**/

	 public static int getLength(String text) {
	     int textLength = text.length();
	     int length = textLength;
	     for (int i = 0; i < textLength; i++) {
	         if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
	             length++;
	         }
	     }
	     return (length % 2 == 0) ? length / 2 : length / 2 + 1;
	 }

	
	 public static void pressText(String pressText,String targetFile, String sourceImg,
             String fontName, int fontStyle, Color color, int fontSize, int x,
             int y) {
         try {
        	   
             File _file = new File(sourceImg);
             
             FileOutputStream out = new FileOutputStream(targetFile);
             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             
             InputStream is=new FileInputStream(_file);
             BufferedImage bi=ImageIO.read(is);
             Image src=(Image)bi;
//             Image src = ImageIO.read(_file);
             int wideth = src.getWidth(null);
             int height = src.getHeight(null);
             BufferedImage image = new BufferedImage(wideth, height,
                     BufferedImage.TYPE_INT_RGB);
             Graphics g = image.createGraphics();
             g.drawImage(src, 0, 0, wideth, height, null);
             // String s="www.qhd.com.cn";
             g.setColor(Color.BLACK);
             g.setFont(new Font(fontName, fontStyle, fontSize));
 
            g.drawString(pressText, wideth - fontSize - x, height - fontSize
                     / 2 - y);
             g.dispose();
//             FileOutputStream out = new FileOutputStream(targetImg);
//             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             encoder.encode(image);
             out.close();

         } catch (Exception e) {
             System.out.println(e);
         }
     }
	 /**
	  * 
	  * @param pressText 图片打印文字数组
	  * @param targetFile 目标路径
	  * @param sourceImg 源文件
	  * @param fontName 字体类型 "宋体",
	  * @param fontStyle 字体类别 Font.BOLD, 
	  * @param color  Color.BLACK,
	  * @param fontSize 40
	  */
	 public static void pressTextGroup(String pressText[],String targetFile, String sourceImg,
             String fontName, int fontStyle, Color color, int fontSize) {
         try {
        	   
             File _file = new File(sourceImg);
             
             FileOutputStream out = new FileOutputStream(targetFile);
             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             
             InputStream is=new FileInputStream(_file);
             BufferedImage bi=ImageIO.read(is);
             Image src=(Image)bi;
//             Image src = ImageIO.read(_file);
             int wideth = src.getWidth(null);
             int height = src.getHeight(null);
             BufferedImage image = new BufferedImage(wideth, height,
                     BufferedImage.TYPE_INT_RGB);
             Graphics g = image.createGraphics();
             g.drawImage(src, 0, 0, wideth, height, null);
             // String s="www.qhd.com.cn";
             g.setColor(Color.BLACK);
             g.setFont(new Font(fontName, fontStyle, fontSize));
             //与图片打印的字对应的x y坐标
             if("cert-pn.jpg".equals(sourceImg.substring(sourceImg.length()-11, sourceImg.length()))){
            	 int offsetX[]={510,520,520,520,520,760};
                 int offsetY[]={815,390,320,245,177,45};
                 for(int i=0;i<pressText.length;i++){
                	 if(i==0){
                		 InputStream tis=new FileInputStream(pressText[i]);
                         BufferedImage tbi=ImageIO.read(tis);
                         Image tsrc=(Image)tbi;
                		 //画照片
                		 g.drawImage(tsrc,(int)wideth - fontSize - offsetX[i], (int)height - fontSize/ 2 - offsetY[i], 275, 365, null);
                	 }else{
                		 //往图片上写字
                    	 g.drawString(pressText[i], wideth - fontSize - offsetX[i], height - fontSize
                                 / 2 - offsetY[i]);
                	 }
                	
                 }
             }else{
            	 int offsetX[]={530,530,530,1385,1385,450,490};
                 int offsetY[]={835,715,595,345,295,205,465};
                 for(int i=0;i<pressText.length;i++){
                	 if(i==1){
                		 int len=pressText[i].length()/13+1;
                		 for(int j=0;j<len;j++){
                			 String str="";
                			 if(j==len-1){
                				  str=pressText[i].substring(j*13, pressText[i].length());
                			 }else{
                				  str=pressText[i].substring(j*13, (j+1)*13);
                			 }
                			 g.drawString(str, wideth - fontSize - offsetX[i], height - fontSize
                                     / 2 - offsetY[i]+45*j);
                		 }
//                		 if(len>13){
//                			 String str1=pressText[i].substring(0, 13);
//                			 String str2=pressText[i].substring(13,pressText[i].length());
//                			 g.drawString(str1, wideth - fontSize - offsetX[i], height - fontSize
//                                     / 2 - offsetY[i]);
//                			 g.drawString(str2, wideth - fontSize - offsetX[i], height - fontSize
//                                     / 2 - offsetY[i]+45);
//                		 }
                	 }else{
                	 //往图片上写字
                	 g.drawString(pressText[i], wideth - fontSize - offsetX[i], height - fontSize
                             / 2 - offsetY[i]);
                	 }
                 }
             }
            
           
             g.dispose();
//             FileOutputStream out = new FileOutputStream(targetImg);
//             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             encoder.encode(image);
             out.close();

         } catch (Exception e) {
        	 e.printStackTrace();
             System.out.println(e);
         }
     }
	 
	 public static void main(String[] args) throws IOException {
//		         pressImage("C://pic//jpg", "C://bb.jpg", 5000, 5000, 0f);
		 String text[]={"d://name.jpg","单位名称单位名\\n称单位名称单位名称单位名称单位名称单位名称单位名称","资质类型","资质等级","证书编号","有效期:2011年02月02日至2014年03月03日"};
		 pressTextGroup(text ,"d://222.jpg","d://cert-org.jpg", "宋体", Font.BOLD,  Color.BLACK,34);
//		         resize("C://pic//4.jpg", 1000, 500, true);
		 
		 
		     }


}