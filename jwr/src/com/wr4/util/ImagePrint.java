package com.wr4.util;


import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.lang.reflect.Field;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.media.jai.JAI;
import javax.media.jai.PlanarImage;

public class ImagePrint
{
  public RenderedImage createImage(String text, String fontName, String style, int size, String color)
  {
    int fontStyle = getFontStyle(style);
    Font font = new Font(fontName, fontStyle, size);

    color = Stringx.replace(color, "#", "0x");
    Color fontColor = Color.decode(color);

    Map bounds = determineBounds(font, text);

    double width = ((Rectangle2D)bounds.get("rectangle")).getWidth();
    int ascent = ((FontMetrics)bounds.get("fontMetrics")).getAscent();
    BufferedImage image = new BufferedImage((int)Math.ceil(width) + 5, 
      (int)Math.ceil(ascent) + 10, 2);
    Graphics2D graphics = (Graphics2D)image.getGraphics();

    graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, 
      RenderingHints.VALUE_ANTIALIAS_ON);

    graphics.setColor(new Color(0, 0, 0, 0));
    graphics.fillRect(0, 0, image.getWidth(), image.getHeight());

    graphics.setColor(fontColor);
    graphics.setFont(font);
    graphics.drawString(text, 0, graphics.getFontMetrics().getAscent());

    ParameterBlock pb = new ParameterBlock();
    pb.add(image);
    PlanarImage renderedImage = JAI.create("awtImage", pb);

    return renderedImage;
  }

  private int getFontStyle(String style)
  {
    if (Stringx.nullity(style)) return 0;

    try
    {
      return Font.class.getDeclaredField(style.toUpperCase()).getInt(Font.class);
    } catch (Exception e) {
      e.printStackTrace();
    }return 0;
  }

  private Map<String, Object> determineBounds(Font font, String text)
  {
    int width = 1000;
    int height = 1000;

    BufferedImage image = new BufferedImage(width, height, 1);
    Graphics2D graphics = (Graphics2D)image.getGraphics();
    graphics.setFont(font);

    Map bounds = new LinkedHashMap();

    bounds.put("rectangle", graphics.getFontMetrics().getStringBounds(text, graphics));
    bounds.put("fontMetrics", graphics.getFontMetrics());
    return bounds;
  }

  public static void main(String[] args)
    throws FileNotFoundException
  {
//    if (args.length == 0) {
//      String usage = "DDDDDDDDDDDDDDDDDDDDDDDDDDDDD";
//
//      System.out.println(usage);
//      return;
//    }
	  
//    String text = Stringx.s(args[0], "e://cert-org.jpg");
//    String name = Stringx.s(args[1], "e://cert-org.jpg");
//    String style = Stringx.s(args[2], "plain");
//    int size = Numberx.toInt(args[3], 32);
//    String color = Stringx.s(args[4], "#454545");
//    String filename = Stringx.s(args[5], "D://1111.jpg");

    String text = "e://cert-org.jpg";
    String name = "e://cert-org.jpg";
    String style =  "plain";
    int size = 32;
    String color ="#454545";
    String filename = "D://1111.jpg";
    
    
    ImagePrint o = new ImagePrint();

    FileOutputStream fos = new FileOutputStream(new File(filename));
    RenderedImage image = o.createImage(text, name, style, size, color);
    JAI.create("encode", image, fos, "jpg", null);
  }
}