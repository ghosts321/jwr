package com.wr4.util;

import java.io.PrintStream;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class Numberx
{
  private static int RANGE = 26;

  public static int random()
  {
    return random(100);
  }

  public static int random(int max)
  {
    return new Random().nextInt(max + 1);
  }

  public static int[] randoms(int n)
  {
    return randoms(n, 100);
  }

  public static int[] randoms(int n, int max)
  {
    if (n < 0) n = 0;
    if (max <= 0) max = 1;

    int[] rt = new int[n];
    Random random = new Random();
    for (int i = 0; i < n; i++) {
      rt[i] = random.nextInt(max + 1);
    }
    return rt;
  }

  public static int safeIndex(int index, int length)
  {
    if (length < 1) return 0;

    index %= length;
    if (index < 0) index += length;
    return index;
  }

  public static int safeRange(int n, int min, int max)
  {
    if (n < min) return min;
    if (n > max) return max;
    return n;
  }

  public static List<Integer> range(int from, int to)
  {
    return range(from, to, 1);
  }

  public static List<Integer> range(int from, int to, int step)
  {
    List rt = new ArrayList();

    if ((step == 0) || ((from > to) && (step > 0)) || ((from < to) && (step < 0))) {
      return rt;
    }
    if (from < to) {
      for (int i = from; i <= to; i += step)
        rt.add(Integer.valueOf(i));
    }
    else {
      for (int i = from; i >= to; i += step) {
        rt.add(Integer.valueOf(i));
      }
    }
    return rt;
  }

  public static String toString(Double number)
  {
    if (number == null) return "";

    return toString(number.doubleValue());
  }

  public static String toString(double number)
  {
    return toString(number, "#.########");
  }

  public static String toString(double number, String formatPattern)
  {
    if (Double.isNaN(number)) return "NaN";

    NumberFormat formatter = new DecimalFormat(formatPattern);
    String string = formatter.format(number);

    return string;
  }

  public static int toInt(String s, int defaultValue)
  {
    try
    {
      return Integer.parseInt(s); } catch (Exception e) {
    }
    return defaultValue;
  }

  public static long toLong(String s, long defaultValue)
  {
    try {
      return Long.parseLong(s); } catch (Exception e) {
    }
    return defaultValue;
  }

  public static double toDouble(String s, double defaultValue)
  {
    try
    {
      return Double.parseDouble(s); } catch (Exception e) {
    }
    return defaultValue;
  }

  public static String toPercent(double d)
  {
    return toString(d, "#.##%");
  }

  public static String percent(double d)
  {
    return toPercent(d);
  }

  public static int power(int n, int m)
  {
    int rt = 1;
    for (int i = 0; i < m; i++) {
      rt *= n;
    }
    return rt;
  }

  public static double sum(double[] values)
  {
    if (values == null) return 0.0D;
    double rt = 0.0D;
    for (int i = 0; i < values.length; i++) {
      rt += values[i];
    }
    return rt;
  }

  public static double[] radio(double[] values)
  {
    if (values == null) return null;

    double sum = sum(values);
    int n = values.length;
    double[] rt = new double[n];
    for (int i = 0; i < n; i++) {
      rt[i] = (sum == 0.0D ? (0.0D / 0.0D) : values[i] / sum);
    }
    return rt;
  }

  public static boolean hasZero(double[] values)
  {
    if (values == null) return false;
    for (int i = 0; i < values.length; i++) {
      if (values[i] == 0.0D) return true;
    }
    return false;
  }

  public static double[] zeros(double[] values)
  {
    if (values == null) return null;
    int n = values.length;
    double[] rt = new double[n];
    for (int i = 0; i < n; i++) {
      rt[i] = (values[i] == 0.0D ? 0.0D : 1.0D);
    }
    return rt;
  }

  public static double[] toDouble(int[] values)
  {
    if (values == null) return null;
    double[] rt = new double[values.length];
    for (int i = 0; i < values.length; i++) {
      rt[i] = values[i];
    }
    return rt;
  }

  public static int[] toInt(double[] values)
  {
    if (values == null) return null;
    int[] rt = new int[values.length];
    for (int i = 0; i < values.length; i++) {
      rt[i] = ((int)values[i]);
    }
    return rt;
  }

  public static double[] multiply(double[] values, double[] radios)
  {
    if ((values == null) || (radios == null)) return null;
    if (values.length != radios.length) return null;
    int n = values.length;
    double[] rt = new double[n];
    for (int i = 0; i < n; i++) {
      values[i] *= radios[i];
    }
    return rt;
  }

  public static double[] adjustSum(double[] v0, double[] v1)
  {
    if ((v0 == null) || (v1 == null)) return null;
    if ((v0.length != v1.length) || (!hasZero(v1))) {
      return v1;
    }
    int n = v0.length;

    double sum1 = sum(v0) - sum(v1);
    double[] zeros = zeros(v1);
    double[] v2 = multiply(v0, zeros);
    double[] radio = radio(v2);
    double[] rt = new double[n];
    for (int i = 0; i < n; i++) {
      v1[i] += sum1 * radio[i];
    }
    return rt;
  }

  public static double[] adjustRound(double[] values, int index)
  {
    if (values == null) return null;
    int n = values.length;
    double[] rt = new double[n];
    double sum0 = Math.round(sum(values));
    for (int i = 0; i < n; i++) {
      rt[i] = Math.round(values[i]);
    }
    double sum1 = sum(rt);
    if (sum0 != sum1) {
      double delta = sum0 - sum1;
      int safeIndex = safeIndex(index, values.length);
      rt[safeIndex] += Math.round(delta);
    }

    return rt;
  }

  public static boolean isDigit(String value)
  {
    if (value == null) return false;
    char[] chars = value.toCharArray();
    for (int i = 0; i < chars.length; i++) {
      if (!Character.isDigit(chars[i])) return false;
    }
    return true;
  }

  public static boolean isNumber(Object o)
  {
    if (o == null) return false;
    return o.getClass().getSuperclass() == Number.class;
  }

  public static int[] excel2Ints(String code)
  {
    int[] rt = { -1, -1 };
    if ((code == null) || (code.length() < 2)) {
      System.err.println("Numberx.Excel2Ints() �������ԣ�" + code);
      return rt;
    }
    char[] chars = code.toCharArray();
    if (!Character.isLetter(chars[0])) {
      System.err.println("Numberx.Excel2Ints() �������ԣ�" + code);
      return rt;
    }
    int colLen = Character.isLetter(chars[1]) ? 2 : 1;
    String col = code.substring(0, colLen);
    String row = code.substring(colLen);

    if (!isDigit(row)) {
      System.err.println("Numberx.Excel2Ints() �������ԣ�" + code);
      return rt;
    }

    int col_i = AZ2Int(col);
    int row_i = toInt(row, 0);
    if (row_i == 0) {
      System.err.println("Numberx.Excel2Ints() �������ԣ�" + code);
      return rt;
    }

    return new int[] { col_i, row_i - 1 };
  }

  public static int AZ2Int(String AZ)
  {
    if ((AZ == null) || ((AZ.length() != 1) && (AZ.length() != 2))) {
      System.err.println("Numberx.AZtoInt() �д�Ų����Ҫ��" + AZ);
      return -1;
    }
    AZ = AZ.toUpperCase();
    if (AZ.length() == 1) {
      return AZ.charAt(0) - 'A';
    }
    char c0 = AZ.charAt(0);
    char c1 = AZ.charAt(1);
    return (c0 - 'A' + 1) * RANGE + (c1 - 'A');
  }

  public static String int2AZ(int i)
  {
    if ((i < 0) || (i > 255)) {
      System.err.println("�б�ų��[0-255]��" + i);
      return null;
    }
    if (i < RANGE) {
      return (65 + i+"");
    }
    return (65 + i / RANGE - 1) + (char)(65 + i % RANGE)+"";
  }

  public static int[] digits(int n)
  {
    n = Math.abs(n);
    String s=n+"";
    char[] chars = s.toCharArray();
    int[] digits = new int[chars.length];
    for (int i = 0; i < chars.length; i++) {
      chars[i] -= '0';
    }
    return digits;
  }

  public static Set<Integer> digitSet(int n)
  {
    int[] digits = digits(n);
    Set set = new TreeSet();
    for (int i = 0; i < digits.length; i++) {
      set.add(Integer.valueOf(digits[i]));
    }
    return set;
  }

  public static String binary(int n)
  {
    return bin(n);
  }

  public static boolean isPrime(int n)
  {
    if (n <= 1) return false;
    if ((n == 2) || (n == 3) || (n == 5) || (n == 7)) return true;
    if ((n % 2 == 0) || (n % 3 == 0) || (n % 5 == 0) || (n % 7 == 0)) return false;
    for (int i = 7; (i * i > 0) && (i * i <= n); i += 2) {
      if (n % i == 0) return false;
    }
    return true;
  }

  public static String hex(int n)
  {
    return Integer.toString(n, 16);
  }

  public static String bin(int n)
  {
    return Integer.toString(n, 2);
  }

  public static int hex2i(String hex)
  {
    try
    {
      return Integer.parseInt(hex, 16); } catch (Exception e) {
    }
    return -1;
  }

  public static int bin2i(String bin)
  {
    try
    {
      return Integer.parseInt(bin, 2); } catch (Exception e) {
    }
    return -1;
  }

  public static void main(String[] argv)
  {
    String[] ss = { 
      " A1", "112", "A-3", "Azz3", "AZ-2.3" };

    for (int i = 0; i < ss.length; i++) {
      System.out.println(Arrays.asList(new int[][] { excel2Ints(ss[i]) }));
    }

    System.out.println(toString(new Double(-10.334300000000001D)));
    System.out.println(toString(new Double(-10.0D)));
  }
}
