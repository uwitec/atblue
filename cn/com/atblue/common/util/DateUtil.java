package cn.com.atblue.common.util;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

public class DateUtil {
    public static String getLocalDate() {
        return format(new java.util.Date());
    }

    public static java.util.Date getDateTime() {
        return new java.util.Date(System.currentTimeMillis());
    }

    public static String getLocalDate(String dateFormat) {
        return format(getDate(), dateFormat);
    }

    public static java.util.Date getDate() {
        return new java.util.Date();
    }

    public static java.util.Date getDate(String format) {
        return parse(getLocalDate(format));
    }

    public static String format(java.util.Date date) {
        return format(date, "yyyy-MM-dd");
    }

    public static String format(java.util.Date date, String dateFormat) {
        if (date == null) return "";
        Format formatter = new SimpleDateFormat(dateFormat);
        return formatter.format(date);
    }

    public static String format(java.util.Date date, String dateFormat, String defaultRtn) {
        if (defaultRtn == null) defaultRtn = "";
        if (date == null) return defaultRtn;
        Format formatter = new SimpleDateFormat(dateFormat);
        return formatter.format(date);
    }

    public static java.util.Date parse(String str) {
        return parse(str, "yyyy-MM-dd");
    }

    public static java.util.Date parse(String str, String dateFormat) {
        SimpleDateFormat format = new SimpleDateFormat(dateFormat);
        try {
            if (str == null) {
                return null;
            }
            return format.parse(str);
        } catch (ParseException e) {
        }
        return null;
    }

    public static java.util.Date add(java.util.Date date, int field, int amount) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(field, amount);
        return calendar.getTime();
    }

    public static String[] splitDay(String dateStart, String dateEnd, String dateFormat) {
        SimpleDateFormat format = new SimpleDateFormat(dateFormat);
        Calendar grcStart = new GregorianCalendar();
        Calendar grcEnd = new GregorianCalendar();

        if ((dateStart == null) || (dateEnd == null)) {
            String[] wordLists = new String[1];
            wordLists[0] = dateStart;
            return wordLists;
        }
        try {
            grcStart.setTime(format.parse(dateStart));
        } catch (ParseException e) {
            grcStart = new GregorianCalendar();
        }
        try {
            grcEnd.setTime(format.parse(dateEnd));
        } catch (ParseException ex) {
            grcEnd = new GregorianCalendar();
        }
        return splitDay(grcStart, grcEnd, dateFormat);
    }

    public static String[] splitDay(Calendar grcStart, Calendar grcEnd, String dateFormat) {
        SimpleDateFormat format = new SimpleDateFormat(dateFormat);
        GregorianCalendar grcTmp = new GregorianCalendar();
        grcTmp.setTime(grcStart.getTime());
        int total = 0;
        while (grcTmp.get(1) < grcEnd.get(1)) {
            if (grcTmp.isLeapYear(grcTmp.get(1)))
                total += 365;
            else
                total += 366;
            grcTmp.add(1, 1);
        }
        if (grcTmp.get(1) == grcEnd.get(1))
            total += grcEnd.get(6) - grcTmp.get(6);
        if (total <= 0)
            return null;
        String[] wordLists = new String[total];
        for (int i = 0; i < total; i++) {
            wordLists[i] = format.format(grcStart.getTime());
            grcStart.add(5, 1);
        }
        return wordLists;
    }

    public static String[] splitMonth(String startMonth, String endMonth, String monthFormat) {
        SimpleDateFormat format = new SimpleDateFormat(monthFormat);
        Calendar grcStart = new GregorianCalendar();
        Calendar grcEnd = new GregorianCalendar();

        if ((startMonth == null) || (endMonth == null)) {
            String[] wordLists = new String[1];
            wordLists[0] = startMonth;
            return wordLists;
        }
        try {
            grcStart.setTime(format.parse(startMonth));
        } catch (ParseException e) {
            grcStart = new GregorianCalendar();
        }
        try {
            grcEnd.setTime(format.parse(endMonth));
        } catch (ParseException ex) {
            grcEnd = new GregorianCalendar();
        }
        return splitMonth(grcStart, grcEnd, monthFormat);
    }

    public static String[] splitMonth(Calendar grcStart, Calendar grcEnd, String dateFormat) {
        SimpleDateFormat format = new SimpleDateFormat(dateFormat);
        GregorianCalendar grcTmp = new GregorianCalendar();
        grcTmp.setTime(grcStart.getTime());
        int total = 0;
        while (grcTmp.get(1) < grcEnd.get(1)) {
            total += 12;
            grcTmp.add(1, 1);
        }
        if (grcTmp.get(1) == grcEnd.get(1))
            total += grcEnd.get(2) - grcTmp.get(2);
        if (total <= 0)
            return null;
        total++;
        String[] wordLists = new String[total];
        for (int i = 0; i < total; i++) {
            wordLists[i] = format.format(grcStart.getTime());
            grcStart.add(2, 1);
        }
        return wordLists;
    }

    public static int differenceOfDay(java.util.Date date1, java.util.Date date2) {
        int sign = date1.compareTo(date2);
        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        if (sign > 0) {
            cal1.setTime(date1);
            cal2.setTime(date2);
        } else {
            cal1.setTime(date2);
            cal2.setTime(date1);
        }
        int total = 0;
        while (cal2.get(1) < cal1.get(1)) {
            total += cal2.getActualMaximum(6);
            cal2.add(1, 1);
        }
        if (cal2.get(1) == cal1.get(1)) {
            total += cal1.get(6) - cal2.get(6);
        }
        return sign * total;
    }

    public static java.util.Date getFirstDayPeriodOfTenDays(java.util.Date date, int amount) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int xunCount = (calendar.get(5) - 1) / 10;
        if (xunCount == 3) xunCount = 2;
        int monthDiff;
        if (xunCount + amount < 0) {
            if ((xunCount + amount) / 3 == 0) monthDiff = (xunCount + amount) / 3 - 1;
            else
                monthDiff = (xunCount + amount) / 3;
        } else {
            monthDiff = (xunCount + amount) / 3;
        }
        calendar.setTime(add(calendar.getTime(), 2, monthDiff));
        if ((xunCount + amount) % 3 == 0)
            xunCount = 0;
        else if ((xunCount + amount) % 3 < 0)
            xunCount = (xunCount + amount) % 3 + 3;
        else {
            xunCount = (xunCount + amount) % 3;
        }
        switch (xunCount) {
            case 0:
                calendar.set(5, 1);
                break;
            case 1:
                calendar.set(5, 11);
                break;
            default:
                calendar.set(5, 21);
        }
        return calendar.getTime();
    }

    public static java.util.Date getEndDayPeriodOfTenDays(java.util.Date date, int amount) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int xunCount = (calendar.get(5) - 1) / 10;
        if (xunCount == 3) xunCount = 2;
        int monthDiff;
        if (xunCount + amount < 0) {
            if ((xunCount + amount) / 3 == 0) monthDiff = (xunCount + amount) / 3 - 1;
            else
                monthDiff = (xunCount + amount) / 3;
        } else {
            monthDiff = (xunCount + amount) / 3;
        }
        calendar.setTime(add(calendar.getTime(), 2, monthDiff));
        if ((xunCount + amount) % 3 == 0)
            xunCount = 0;
        else if ((xunCount + amount) % 3 < 0)
            xunCount = (xunCount + amount) % 3 + 3;
        else {
            xunCount = (xunCount + amount) % 3;
        }
        switch (xunCount) {
            case 0:
                calendar.set(5, 10);
                break;
            case 1:
                calendar.set(5, 20);
                break;
            default:
                calendar.set(5, calendar.getActualMaximum(5));
        }
        return calendar.getTime();
    }

    private static long getDays(java.util.Date date1, java.util.Date date2) {
        long quot = 0L;
        try {
            quot = date1.getTime() - date2.getTime();
            quot = quot / 1000L / 60L / 60L / 24L;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Math.abs(quot);
    }

    private static java.util.Date getStartTime(int i) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(6, 1);
        int k = calendar.get(7);
        calendar.add(6, 1 - k);
        calendar.add(3, i - 1);
        return calendar.getTime();
    }

    private static java.util.Date getEndTime(int i) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(6, 1);
        int k = calendar.get(7);
        calendar.add(6, 1 - k);
        calendar.add(3, i - 1);
        calendar.add(6, 6);
        return calendar.getTime();
    }

    public static String getYear(java.util.Date q) {
        return format(q, "yyyy");
    }

    public static String getMonth(java.util.Date q) {
        return format(q, "MM");
    }

    public static String getDay(java.util.Date q) {
        return format(q, "dd");
    }

    public static java.util.Date addDate(java.util.Date date, int field, int i) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(field, i);
        return calendar.getTime();
    }

    public static java.util.Date addDate(java.util.Date date, int i) {
        return addDate(date, 5, i);
    }

    public static java.util.Date addMonth(java.util.Date date, int i) {
        return addDate(date, 2, i);
    }

    public static java.util.Date addYear(java.util.Date date, int i) {
        return addDate(date, 1, i);
    }

    public static java.util.Date[] getTenDay(String year, String month, int param) {
        java.util.Date[] date = new java.util.Date[2];

        if (param == 1) {
            date[0] = parse(year + "-" + month + "-01");
            date[1] = parse(year + "-" + month + "-10");
        } else if (param == 2) {
            date[0] = parse(year + "-" + month + "-11");
            date[1] = parse(year + "-" + month + "-20");
        } else if (param == 3) {
            date[0] = parse(year + "-" + month + "-21");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date[0]);
            date[1] = parse(year + "-" + month + "-" + calendar.getActualMaximum(5));
        }

        return date;
    }

    public static int getLastDayOfMonth(java.util.Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.getActualMaximum(5);
    }

    public static String getXd(java.util.Date date) {
        String rtn = "";
        if ((Integer.parseInt(getDay(date)) >= 1) && (Integer.parseInt(getDay(date)) < 11))
            rtn = "1";
        else if ((Integer.parseInt(getDay(date)) > 10) && (Integer.parseInt(getDay(date)) < 21))
            rtn = "2";
        else {
            rtn = "3";
        }
        return rtn;
    }

    public static Map getLastDate(String beginTime, String endTime) {
        Calendar calStart = Calendar.getInstance();
        calStart.setTime(java.sql.Date.valueOf(beginTime));
        Calendar calEnd = Calendar.getInstance();
        calEnd.setTime(java.sql.Date.valueOf(endTime));
        Calendar calTmp = (Calendar) calStart.clone();
        Calendar calLast = (Calendar) calStart.clone();
        while (!calEnd.equals(calTmp)) {
            calTmp.add(5, 1);
            calLast.add(5, -1);
        }
        calLast.add(5, -1);
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Map m = new HashMap();
        m.put("sBegin", f.format(calLast.getTime()));
        calStart.add(5, -1);
        m.put("sEnd", f.format(calStart.getTime()));

        return m;
    }

    public static Map<String, String> getXun(Calendar cal) {
        Map m = new HashMap();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat f1 = new SimpleDateFormat("MM");
        if (cal.get(5) < 10) {
            Calendar c = Calendar.getInstance();
            c.set(cal.get(1), cal.get(2) - 1, 21);
            m.put("thisBegin", f.format(c.getTime()));
            c.set(1, cal.get(1));
            c.set(2, cal.get(2));
            c.set(5, 1);
            c.add(5, -1);
            m.put("thisEnd", f.format(c.getTime()));
            c.set(2, cal.get(2) - 1);
            m.put("thisTitle", f1.format(c.getTime()) + "下旬");

            c.set(cal.get(1), cal.get(2) - 1, 11);
            m.put("lastBegin", f.format(c.getTime()));
            c.set(cal.get(1), cal.get(2) - 1, 20);
            m.put("lastEnd", f.format(c.getTime()));
            c.set(2, cal.get(2) - 1);
            m.put("lastTitle", f1.format(c.getTime()) + "中旬");
        } else if ((cal.get(5) >= 10) && (cal.get(5) < 20)) {
            Calendar c = Calendar.getInstance();
            c.set(cal.get(1), cal.get(2), 1);
            m.put("thisBegin", f.format(c.getTime()));
            c.set(cal.get(1), cal.get(2), 10);
            m.put("thisEnd", f.format(c.getTime()));
            c.set(2, cal.get(2));
            m.put("thisTitle", f1.format(c.getTime()) + "上旬");

            c.set(cal.get(1), cal.get(2) - 1, 21);
            m.put("lastBegin", f.format(c.getTime()));
            c.set(1, cal.get(1));
            c.set(2, cal.get(2));
            c.set(5, 1);
            c.add(5, -1);
            m.put("lastEnd", f.format(c.getTime()));
            c.set(2, cal.get(2) - 1);
            m.put("lastTitle", f1.format(c.getTime()) + "下旬");
        } else if (cal.get(5) >= 20) {
            Calendar c = Calendar.getInstance();
            c.set(cal.get(1), cal.get(2), 11);
            m.put("thisBegin", f.format(c.getTime()));
            c.set(cal.get(1), cal.get(2), 20);
            m.put("thisEnd", f.format(c.getTime()));
            c.set(2, cal.get(2));
            m.put("thisTitle", f1.format(c.getTime()) + "中旬");

            c.set(cal.get(1), cal.get(2), 1);
            m.put("lastBegin", f.format(c.getTime()));
            c.set(cal.get(1), cal.get(2), 10);
            m.put("lastEnd", f.format(c.getTime()));
            c.set(2, cal.get(2));
            m.put("lastTitle", f1.format(c.getTime()) + "上旬");
        }
        return m;
    }

    public static Map<String, String> getMonth(Calendar cal) {
        Map m = new HashMap();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat f1 = new SimpleDateFormat("MM");
        Calendar c = Calendar.getInstance();
        c.set(cal.get(1), cal.get(2), 1);
        m.put("thisBegin", f.format(c.getTime()));
        c.set(1, cal.get(1));
        c.set(2, cal.get(2) + 1);
        c.set(5, 1);
        c.add(5, -1);
        m.put("thisEnd", f.format(c.getTime()));
        c.set(2, cal.get(2));
        m.put("thisTitle", f1.format(c.getTime()) + "月");

        c.set(cal.get(1), cal.get(2) - 1, 1);
        m.put("lastBegin", f.format(c.getTime()));
        c.set(1, cal.get(1));
        c.set(2, cal.get(2));
        c.set(5, 1);
        c.add(5, -1);
        m.put("lastEnd", f.format(c.getTime()));
        c.set(2, cal.get(2) - 1);
        m.put("lastTitle", f1.format(c.getTime()) + "月");
        return m;
    }

    public static Map getXun(Calendar cal, int i) {
        Map m = new HashMap();
        Calendar cb = Calendar.getInstance();
        Calendar ce = Calendar.getInstance();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        if (i == 1) {
            cb.set(cal.get(1), cal.get(2), 1);
            m.put("begin", f.format(cb.getTime()));
            ce.set(cal.get(1), cal.get(2), 10);
            m.put("end", f.format(ce.getTime()));
        }
        if (i == 2) {
            cb.set(cal.get(1), cal.get(2), 11);
            m.put("begin", f.format(cb.getTime()));
            ce.set(cal.get(1), cal.get(2), 20);
            m.put("end", f.format(ce.getTime()));
        }
        if (i == 3) {
            cb.set(cal.get(1), cal.get(2), 21);
            m.put("begin", f.format(cb.getTime()));
            ce.set(2, cal.get(1));
            ce.set(5, 1);
            ce.add(5, -1);
            m.put("end", f.format(ce.getTime()));
        }
        return m;
    }

    public static boolean isLastDate(String date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(java.sql.Date.valueOf(date));
        boolean flag = false;
        int m = cal.get(2);
        Calendar c = (Calendar) cal.clone();
        c.add(5, 1);
        int n = c.get(2);
        if (m != n) {
            flag = true;
        }
        return flag;
    }

    public static String getNextDay(String date, int amount) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(java.sql.Date.valueOf(date));
        cal.add(5, amount);
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

        Calendar today = Calendar.getInstance();
        today.setTime(new java.util.Date());
        if (cal.getTime().getTime() > today.getTime().getTime()) {
            return f.format(today.getTime());
        }
        return f.format(cal.getTime());
    }

    public String getPreYear(String date, int amount) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(java.sql.Date.valueOf(date));
        cal.add(1, amount);
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

        Calendar today = Calendar.getInstance();
        today.setTime(new java.util.Date());
        if (cal.getTime().getTime() > today.getTime().getTime()) {
            return f.format(today.getTime());
        }
        return f.format(cal.getTime());
    }
}