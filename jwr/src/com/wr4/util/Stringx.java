package com.wr4.util;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Stringx
{
  public static String capitalize(String src)
  {
    if (nullity(src)) return src;

    char[] cs = src.toCharArray();
    cs[0] = Character.toUpperCase(cs[0]);
    return new String(cs);
  }

  public static String capitalize(String src, boolean more)
  {
    if (nullity(src)) return src;

    return capitalize(src.toLowerCase());
  }

  public static String upper(String src)
  {
    return capitalize(src);
  }

  public static String lower(String src)
  {
    if (nullity(src)) return src;

    char[] cs = src.toCharArray();
    cs[0] = Character.toLowerCase(cs[0]);
    return new String(cs);
  }

  public static String left(String src, String substr)
  {
    if ((src == null) || (substr == null)) return "";

    int idx = src.indexOf(substr);
    if (idx == -1) {
      return "";
    }
    return src.substring(0, idx);
  }

  public static String leftback(String src, String substr)
  {
    if ((src == null) || (substr == null)) return "";

    int idx = src.indexOf(substr);
    if (idx == -1) {
      return "";
    }
    int len = substr.length();
    while (true)
    {
      int tmp = src.indexOf(substr, idx + len);
      if (tmp == -1) {
        break;
      }
      idx = tmp;
    }
    int tmp;
    return src.substring(0, idx);
  }

  public static String right(String src, String substr)
  {
    if ((src == null) || (substr == null)) return "";

    int idx = src.indexOf(substr);
    if (idx == -1) {
      return "";
    }
    return src.substring(idx + substr.length());
  }

  public static String rightback(String src, String substr)
  {
    if ((src == null) || (substr == null)) return "";

    int idx = src.indexOf(substr);
    if (idx == -1) {
      return "";
    }
    int len = substr.length();
    while (true)
    {
      int tmp = src.indexOf(substr, idx + len);
      if (tmp == -1) {
        break;
      }
      idx = tmp;
    }
    int tmp;
    return src.substring(idx + len);
  }

  public static String between(String src, String str1, String str2)
  {
    if ((src == null) || (str1 == null) || (str2 == null)) return "";

    String rt = src;
    rt = right(rt, str1);
    rt = left(rt, str2);
    return rt;
  }

  public static String replaceFirst(String src, String from, String to)
  {
    if ((src == null) || (from == null) || (to == null)) return "";

    StringBuffer sb = new StringBuffer(src);
    int idx = src.indexOf(from);
    int len = from.length();
    if (idx != -1) {
      sb = sb.replace(idx, idx + len, to);
    }

    return new String(sb);
  }

  public static String replaceAll(String src, String from, String to)
  {
    if ((src == null) || (from == null) || (to == null)) return "";

    StringBuffer sb = new StringBuffer(src);

    int len = from.length();
    int fromIndex = 0;
    int i1;
    while ((i1 = src.indexOf(from, fromIndex)) != -1)
    {
//      int i1;
      int i2 = i1 + len;
      int tail = src.length() - i2;
      sb = sb.replace(i1, i2, to);
      src = new String(sb);
      fromIndex = src.length() - tail;
    }

    return new String(sb);
  }

  public static String replace(String src, String from, String to)
  {
    return replaceFirst(src, from, to);
  }

  public static String replace(String src, String[] from, String[] to)
  {
    if ((src == null) || (from == null) || (to == null) || (from.length != to.length)) return "";

    String rt = src;

    int len = Math.min(from.length, to.length);

    for (int i = 0; i < len; i++) {
      rt = replace(rt, from[i], to[i]);
    }

    return rt;
  }

  public static String replaceAll(String src, String[] from, String[] to)
  {
    if ((src == null) || (from == null) || (to == null) || (from.length != to.length)) return "";

    String rt = src;

    int len = Math.min(from.length, to.length);

    for (int i = 0; i < len; i++) {
      rt = replaceAll(rt, from[i], to[i]);
    }

    return rt;
  }

  public static String replaceBetween(String src, String before, String after, String to)
  {
    String from = between(src, before, after);

    return replaceFirst(src, from, to);
  }

  public static String replaceInclude(String src, String before, String after, String to)
  {
    String from = between(src, before, after);
    return replace(src, before + from + after, to);
  }

  public static String trim(String src)
  {
    if (nullity(src)) return "";

    String rt = src.trim();
    rt = replaceAll(rt, 
      new String[] { " ", "\t", "��" }, 
      new String[] { "", "", "" });
    return rt;
  }

  public static String[] split(String src, String sep)
  {
    if ((src == null) || (src.equals("")) || (sep == null) || (sep.equals(""))) {
      return new String[0];
    }
    List v = new ArrayList();

    int len = sep.length();
    int idx;
    while ((idx = src.indexOf(sep)) != -1)
    {
//      int idx;
      v.add(src.substring(0, idx));
      idx += len;
      src = src.substring(idx);
    }
    v.add(src);

    return (String[])v.toArray(new String[0]);
  }

  public static String[] split(String src, String sep, String quo)
  {
    if ((src == null) || (src.equals("")) || 
      (sep == null) || (sep.equals("")) || 
      (quo == null) || (
      (!quo.equals("\"")) && (!quo.equals("'")))) {
      return new String[0];
    }
    List v = new ArrayList();

    int i0 = 0;
    int i1 = 1;
    int len = sep.length();
    boolean has_quo = false;
    while (true) {
      if ((has_quo = src.startsWith(quo, i0)))
        i1 = src.indexOf(quo + sep, i0 + 1);
      else {
        i1 = src.indexOf(sep, i0);
      }
      if (i1 == -1) break;
      if (has_quo) {
        v.add(src.substring(i0, i1 + 1));
        i0 = i1 + (1 + len);
      } else {
        v.add(src.substring(i0, i1));
        i0 = i1 + len;
      }
    }
    v.add(src.substring(i0));

    return (String[])v.toArray(new String[0]);
  }

  public static String[][] split2table(String express, String lineSep, String colSep)
  {
    if ((nullity(express)) || 
      (nullity(lineSep)) || 
      (nullity(colSep))) {
      return new String[0][0];
    }
    String[] rows = split(express, lineSep);
    String[][] table = new String[rows.length][];
    for (int i = 0; i < rows.length; i++) {
      table[i] = split(rows[i], colSep);
    }
    return table;
  }

  public static int[] split2ints(String src, String sep)
  {
    String[] strs = split(src, sep);
    int[] ints0 = new int[strs.length];
    int nn = 0;
    int i = 0; for (int n = strs.length; i < n; i++) {
      if (!strs[i].equals("")) {
        try {
          ints0[nn] = Integer.parseInt(strs[i]);
        } catch (Exception e) {
          ints0[nn] = 0;
        }
        nn++;
      }
    }

    int[] ints1 = new int[nn];
    System.arraycopy(ints0, 0, ints1, 0, nn);

    return ints1;
  }

  public static boolean[] split2bools(String src, String sep)
  {
    String[] strs = split(src, sep);
    boolean[] booleans0 = new boolean[strs.length];
    int nn = 0;
    int i = 0; for (int n = strs.length; i < n; i++) {
      if (!strs[i].equals("")) {
        try {
          booleans0[nn] = Boolean.parseBoolean(strs[i]);
        } catch (Exception e) {
          booleans0[nn] = false;
        }
        nn++;
      }
    }

    boolean[] booleans1 = new boolean[nn];
    System.arraycopy(booleans0, 0, booleans1, 0, nn);

    return booleans1;
  }

  public static String join(String[] array, String sep)
  {
    if ((array == null) || (array.length == 0)) {
      return "";
    }

    int len = array.length;
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < len - 1; i++) {
      sb.append(array[i]).append(sep);
    }
    sb.append(array[(len - 1)]);

    return sb.toString();
  }

  public static String join(String[] array)
  {
    return join(array, ", ");
  }

  public static String join(String[] array, String sep, String pre, String post)
  {
    if ((array == null) || (array.length == 0)) {
      return "";
    }

    int len = array.length;
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < len - 1; i++) {
      sb.append(pre).append(array[i]).append(post).append(sep);
    }
    sb.append(pre).append(array[(len - 1)]).append(post);

    return sb.toString();
  }

  public static String join(int[] array, String sep)
  {
    if ((array == null) || (array.length == 0)) {
      return "";
    }

    int len = array.length;
    StringBuffer sb = new StringBuffer();

    for (int i = 0; i < len - 1; i++)
    {
      String item = Integer.valueOf(array[i]).toString();
      sb.append(item).append(sep);
    }

    sb.append(array[(len - 1)]);

    return sb.toString();
  }

  public static String join(boolean[] array, String sep)
  {
    if ((array == null) || (array.length == 0)) {
      return "";
    }

    int len = array.length;
    StringBuffer sb = new StringBuffer();

    for (int i = 0; i < len - 1; i++) {
      String item = Boolean.valueOf(array[i]).toString();
      sb.append(item).append(sep);
    }

    sb.append(array[(len - 1)]);

    return sb.toString();
  }

  public static String join(String[][] table, String lineSep, String colSep)
  {
    if ((table == null) || (table.length == 0)) return "";

    StringBuffer rt = new StringBuffer("");
    for (int i = 0; i < table.length; i++) {
      if (i > 0) rt.append(lineSep);
      rt.append(join(table[i], colSep));
    }
    return rt.toString();
  }

  public static String join(List<?> nn, String sep)
  {
    if (nn == null) return "";

    int size = nn.size();
    String[] ss = new String[size];
    for (int i = 0; i < size; i++) {
      Object o = nn.get(i);
      ss[i] = str(o);
    }
    return join(ss, sep);
  }

  public static String str(Object o)
  {
    if (o == null)
      return "";
    if ((o instanceof Double))
      return Numberx.toString((Double)o);
    if ((o instanceof Float)) {
      return Numberx.toString(((Float)o).doubleValue());
    }
    return o.toString();
  }

  public static String[] unique(String[] strArray)
  {
    if (strArray == null) return new String[0];

    List unique = new ArrayList();
    for (int i = 0; i < strArray.length; i++) {
      if (!unique.contains(strArray[i])) {
        unique.add(strArray[i]);
      }
    }
    return (String[])unique.toArray(new String[0]);
  }

  public static String[] set(String[] strArray)
  {
    return unique(strArray);
  }

  public static boolean isSet(String[] strArray)
  {
    if (strArray == null) return false;

    int n = strArray.length;
    String s1 = "";
    String s2 = "";
    for (int i = 0; i < n; i++) {
      s1 = strArray[i];
      for (int j = 0; j < n; j++) {
        if (i != j) s2 = strArray[j];
        if (s1.equals(s2)) return false;
      }
    }
    return true;
  }

  public static List<String> ss2set(String[] ss)
  {
    if (ss == null) return new ArrayList();

    Set set = new LinkedHashSet();
    String[] arrayOfString = ss; int j = ss.length; for (int i = 0; i < j; i++) { String s = arrayOfString[i];
      if (!nullity(s))
        set.add(s.trim().toLowerCase());
    }
    return new ArrayList(set);
  }

  public static void sort(String[] strArray)
  {
    if (strArray == null) return;

    Arrays.sort(strArray);
  }

  public static String[][] group(String[] src_list)
  {
    if ((src_list == null) || (src_list.length == 0)) {
      return new String[][] { new String[0], new String[0] };
    }
    List value = new ArrayList();
    List num = new ArrayList();
    String cur_str = src_list[0];
    value.add(cur_str);
    int n = 1;

    String tmp = null;
    for (int i = 1; i < src_list.length; i++) {
      tmp = src_list[i];
      if (tmp.equals(cur_str))
      {
        n++;
      }
      else {
        num.add(n);
        value.add(tmp);
        n = 1;
        cur_str = tmp;
      }
    }
    num.add(n);

    String[] rt_v = (String[])value.toArray(new String[0]);
    String[] rt_n = (String[])num.toArray(new String[0]);

    return new String[][] { rt_v, rt_n };
  }

  public static boolean include(String str, String[] strArray)
  {
    return in(str, strArray);
  }

  public static boolean in(String str, String[] strArray)
  {
    if ((str == null) || (strArray == null)) return false;

    int i = 0; for (int n = strArray.length; i < n; i++) {
      if (str.equals(strArray[i])) return true;
    }

    return false;
  }

  public static boolean isSubset(String[] sub, String[] all)
  {
    if ((sub == null) || (all == null)) return false;

    for (int i = 0; i < sub.length; i++) {
      if (!in(sub[i], all)) return false;
    }
    return true;
  }

  public static boolean same(String s1, String s2)
  {
    if ((s1 == null) && (s2 == null)) return true;
    if ((s1 == null) || (s2 == null)) return false;
    return s1.equals(s2);
  }

  public static String[] remove1(String[] source, String remove)
  {
    if (source == null) return new String[0];

    List rt = new ArrayList();
    for (int i = 0; i < source.length; i++) {
      if (!same(source[i], remove)) rt.add(source[i]);
    }

    return (String[])rt.toArray(new String[rt.size()]);
  }

  public static String[] remove(String[] source, String[] remove)
  {
    if ((source == null) || (remove == null)) return new String[0];

    List rt = new ArrayList();
    for (int i = 0; i < source.length; i++) {
      if (!in(source[i], remove)) {
        rt.add(source[i]);
      }
    }

    return (String[])rt.toArray(new String[rt.size()]);
  }

  public static int index(String str, String[] strArray)
  {
    if ((str == null) || (strArray == null)) return -1;

    for (int i = 0; i < strArray.length; i++) {
      if (str.equals(strArray[i])) return i;
    }
    return -1;
  }

  public static int index(String str, String[] strArray, boolean ignoreCase)
  {
    if ((str == null) || (strArray == null)) return -1;

    for (int i = 0; i < strArray.length; i++) {
      boolean equals = ignoreCase ? str.equalsIgnoreCase(strArray[i]) : str.equals(strArray[i]);
      if (equals) return i;
    }

    return -1;
  }

  public static String insert(String str, String substr, String newstr)
  {
    if ((str == null) || (substr == null) || (newstr == null)) return "";
    String rt = left(str, substr) + newstr + substr + right(str, substr);
    return rt;
  }

  public static String insertback(String str, String substr, String newstr)
  {
    if ((str == null) || (substr == null) || (newstr == null)) return "";
    String rt = leftback(str, substr) + newstr + substr + rightback(str, substr);
    return rt;
  }

  public static String fill(String s, int len)
  {
    if ((s == null) || (s.equals("")) || (len < 1)) return s;
    int len1 = s.length();
    if (len1 >= len) return s;

    int n = len / len1;
    int m = len % len1;
    StringBuffer sb = new StringBuffer(len);
    for (int i = 0; i < n; i++) {
      sb.append(s);
    }
    if (m != 0) sb.append(s.substring(0, m));
    return sb.toString();
  }

  public static String padLeft(String str, int len, String s)
  {
    if ((str == null) || (str.equals("")) || (len < str.length()) || (s == null) || (s.equals(""))) {
      return str;
    }
    String rt = fill(s, len);
    int n = len - str.length();

    return rt.substring(0, n) + str;
  }

  public static String padRight(String str, int len, String s)
  {
    if ((str == null) || (str.equals("")) || (len < str.length()) || (s == null) || (s.equals(""))) {
      return str;
    }
    String rt = fill(s, len);
    int n = len - str.length();

    return str + rt.substring(0, n);
  }

  public static String[] padLeft(String[] ss, String s)
  {
    if ((ss == null) || (s == null) || (s.equals(""))) return ss;

    int max = -1;
    int n = ss.length;
    for (int i = 0; i < n; i++)
      if (ss[i] != null) {
        int m = ss[i].length();
        if (m > max) max = m;
      }
    String[] rt = new String[n];
    for (int i = 0; i < n; i++) {
      rt[i] = padLeft(ss[i], max, s);
    }
    return rt;
  }

  public static String[] padRight(String[] ss, String s)
  {
    if ((ss == null) || (s == null) || (s.equals(""))) return ss;

    int max = -1;
    int n = ss.length;
    for (int i = 0; i < n; i++)
      if (ss[i] != null) {
        int m = ss[i].length();
        if (m > max) max = m;
      }
    String[] rt = new String[n];
    for (int i = 0; i < n; i++) {
      rt[i] = padRight(ss[i], max, s);
    }
    return rt;
  }

  public static String base64enc(String str)
  {
    if (str == null) {
      System.err.println("Stringx.base64encode (String) : null string.");
      return "";
    }

    String rt = null;
    try {
      rt = new BASE64Encoder().encode(str.getBytes("utf-8"));
    } catch (Exception e) {
      System.err.println("Stringx.base64encode (String) : encode error - " + e);
      return "";
    }

    return rt;
  }

  public static String base64dec(String str)
  {
    if (str == null) {
      System.err.println("Stringx.base64encode (String) : null string.");
      return "";
    }

    String rt = null;
    try {
      byte[] bt = new BASE64Decoder().decodeBuffer(str);
      rt = new String(bt, "utf-8");
    } catch (Exception e) {
      System.err.println("Stringx.base64encode (String) : encode error - " + e);
      return "";
    }

    return rt;
  }

  public static String md5(String str)
  {
    if (str == null) return "";

    String rt = "";
    try {
      MessageDigest md5 = MessageDigest.getInstance("MD5");
      md5.update(str.getBytes("gb2312"));
      byte[] bt = md5.digest();
      String s = null;
      int l = 0;
      for (int i = 0; i < bt.length; i++) {
        s = Integer.toHexString(bt[i]);
        l = s.length();
        if (l > 2) s = s.substring(l - 2, l);
        else if (l == 1) s = "0" + s;
        rt = rt + s;
      }
    }
    catch (NoSuchAlgorithmException e1) {
      e1.printStackTrace();
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }

    return rt;
  }

  public static String s(String param, String s_default)
  {
    return check(param, s_default);
  }

  public static String check(String param, String src_default)
  {
    if (nullity(param)) {
      return src_default;
    }
    return param;
  }

  public static boolean nullity(String param)
  {
    return (param == null) || (param.trim().equals(""));
  }

  public static boolean isTrue(String param)
  {
    return "true".equalsIgnoreCase(param);
  }

  public static String[][] map2array(Map<String, String> map)
  {
    if (map == null) return new String[2][0];

    int n = map.size();
    String[][] rt = new String[2][n];

    rt[0] = ((String[])map.keySet().toArray(new String[n]));
    rt[1] = ((String[])map.values().toArray(new String[n]));

    return rt;
  }

  public static String[] list2array(List<String> list)
  {
    return collect2array(list);
  }

  public static String[] collect2array(Collection<String> c)
  {
    if (c == null) return new String[0];

    int n = c.size();

    String[] rt = (String[])c.toArray(new String[n]);

    return rt;
  }

  public static <T> List<T> list(T[] ss)
  {
    return Arrays.asList(ss);
  }

  public static String format(String formatPattern, Object[] param)
  {
    String rt = MessageFormat.format(formatPattern, param);
    return rt;
  }

  public static String printf(String format, Object[] args)
  {
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    pw.printf(format, args);
    return sw.toString();
  }

  public static boolean isString(Object o)
  {
    if (o == null) return false;
    return o.getClass() == String.class;
  }

  public static String escapeHtml(String src)
  {
    if (nullity(src)) return src;

    return replaceAll(src, 
      new String[] { "&", "<", ">", "\"" }, 
      new String[] { "&amp;", "&lt;", "&gt;", "&quot;" });
  }

  public static String uid()
  {
    return UUID.randomUUID().toString();
  }

  public static String sub(String s, int i0, int i1)
  {
    if (s == null) return null;
    if (s.equals("")) return "";

    int len = s.length();
    i0 = Numberx.safeIndex(i0, len);
    i1 = Numberx.safeIndex(i1, len);
    if (i0 > i1) {
      int t = i0;
      i0 = i1;
      i1 = t;
    }
    return s.substring(i0, i1 + 1);
  }

  public static void main(String[] args)
  {
    String[] sa = { 
      "", 
      "a", 
      "abc", 
      "message digest", 
      "abcdefghijklmnopqrstuvwxyz", 
      "1" };

    String s = null;
    for (int i = 0; i < sa.length; i++) {
      s = md5(sa[i]);
      System.out.println(sa[i] + "==" + s);
    }

    System.out.println("test ---------- list2array ----------");
    List l = null;
    String[] rt = list2array(l);
    System.out.println(rt.length);

    l = new ArrayList();
    rt = list2array(l);
    System.out.println(rt.length);

    l.add("hello");
    l.add("����");
    l.add(null);
    rt = list2array(l);
    System.out.println(rt[1]);
    System.out.println(join(rt, ", ", "\"", "\""));

    System.out.println("test ----- format -----");
    s = format("[{0}]: {1} {2,number,#.##} {3,date,yyyy/MM/dd} {3,time,aHH:mm:ss}", 
      new Object[] { "James", new Integer(100), new Double(2003.1415926499999D), new Date() });

    System.out.println(s);

    s = "aa bb {to-be-remove}cc";
    s = printf(replaceInclude(s, "{", "}", ""), new Object[0]);
    System.out.println(s);

    System.out.println(ss2set(new String[] { "a", " a ", "A", null, "" }));

    System.out.println("ï¿½2\002\001\001\001");
  }
}