package cn.com.atblue.common.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;

/**
 * 数字操作工具类，提供常见的数字操作需要的方法。
 */

public class NumberUtil {
    /**
     * 此类中封装一些常用的数字操作。 所有方法都是静态方法，不需要生成此类的实例， 为避免生成此类的实例，构造方法被申明为private类型的。
     */
    private NumberUtil() {
    }

    /**
     * 将数字v四舍五入到 maximumFractionDigits位小数
     *
     * @param v
     *            待四舍五入的数字
     * @param maximumFractionDigits
     *            小数位数
     * @return 四舍五入后的字符串结果
     */
    public static String format(double v, int maximumFractionDigits) {
        DecimalFormat decimalFormat = new DecimalFormat();
        decimalFormat.setMaximumFractionDigits(maximumFractionDigits);
        return decimalFormat.format(v);
    }

    /**
     * 将数字格式化为指定格式
     *
     * @param v
     *            待格式化数字
     * @param format
     *            格式
     * @return 指定格式的数字
     */
    public static String format(double v, String format) {
        DecimalFormat decimalFormat = new DecimalFormat(format);
        return decimalFormat.format(v);
    }

    /**
     * 将字符串解析为默认格式的Number
     *
     * @param v
     *            待解析字符串
     * @return 解析后的数字
     */
    public static Number parse(String v) {
        return parse(v, null);
    }

    /**
     * 将字符串解析为指定格式的Number
     *
     * @param v
     *            待解析字符串
     * @param format
     *            格式
     * @return 解析后的数字
     */
    public static Number parse(String v, String format) {
        NumberFormat decimalFormat = DecimalFormat.getInstance();
        if (format != null) {
            decimalFormat = new DecimalFormat(format);
        }
        Number number = null;
        if (v == null) {
            return 0;
        }
        try {
            number = decimalFormat.parse(v);
        } catch (ParseException e) {
            number = 0;
        }
        return number;
    }

    /**
     * 四舍五入
     *
     * @param number
     *            待处理的数字
     * @param maximumFractionDigits
     *            四舍五入数字
     * @return 四舍五入结果
     */
    public static double round(Number number, int maximumFractionDigits) {
        try {
            return new BigDecimal(Double.toString(number.doubleValue()))
                    .setScale(maximumFractionDigits, BigDecimal.ROUND_HALF_UP)
                    .doubleValue();
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
