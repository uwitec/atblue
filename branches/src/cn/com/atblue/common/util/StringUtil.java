package cn.com.atblue.common.util;

import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.text.StringCharacterIterator;
import java.util.*;

public final class StringUtil {
    private static final String[] hexDigits = {"0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

    public static String replace(String strSource, String strFrom, String strTo) {
        if (strSource == null) return null;
        if ((strFrom == null) || (strFrom.equals(""))) {
            return strSource;
        }
        String strDest = "";
        int intFromLen = strFrom.length();
        int intPos;
        while ((intPos = strSource.indexOf(strFrom)) != -1) {
            strDest = strDest + strSource.substring(0, intPos);
            strDest = strDest + strTo;
            strSource = strSource.substring(intPos + intFromLen);
        }
        strDest = strDest + strSource;

        return strDest;
    }

    public static String[] split(String source, String delim) {
        if (source == null) {
            String[] wordLists = new String[1];
            wordLists[0] = source;
            return wordLists;
        }
        if (delim == null) {
            delim = ",";
        }
        StringTokenizer st = new StringTokenizer(source, delim);
        int total = st.countTokens();
        String[] wordLists = new String[total];
        for (int i = 0; i < total; i++) {
            wordLists[i] = st.nextToken();
        }
        return wordLists;
    }

    public static String substring(String source, int length) {
        if ((source == null) || (source.equals("")))
            return "";
        String temp;
        if (source.length() > length)
            temp = source.substring(0, length);
        else {
            temp = source;
        }
        return temp;
    }

    public static String[] split(String source, char delim) {
        return split(source, String.valueOf(delim));
    }

    public static String[] split(String source) {
        return split(source, ",");
    }

    public static String combineStringArray(String[] array, String delim) {
        if (array == null) {
            return "";
        }
        int length = array.length - 1;
        if (delim == null) {
            delim = "";
        }
        StringBuffer result = new StringBuffer(length * 8);
        for (int i = 0; i < length; i++) {
            result.append(array[i]);
            result.append(delim);
        }
        result.append(array[length]);
        return result.toString();
    }

    public static String trimLeft(String value) {
        String result = value;
        if (result == null) return result;
        char[] ch = result.toCharArray();
        int index = -1;
        for (int i = 0; (i < ch.length) &&
                (Character.isWhitespace(ch[i])); i++) {
            index = i;
        }

        if (index != -1) {
            result = result.substring(index + 1);
        }
        return result;
    }

    public static String trimRight(String value) {
        String result = value;
        if (result == null) return result;
        char[] ch = result.toCharArray();
        int endIndex = -1;
        for (int i = ch.length - 1; (i > -1) &&
                (Character.isWhitespace(ch[i])); i--) {
            endIndex = i;
        }

        if (endIndex != -1) {
            result = result.substring(0, endIndex);
        }
        return result;
    }

    public static String escapeCharacter(String source, Map escapeCharMap) {
        if ((source == null) || (source.length() == 0)) {
            return source;
        }
        if (escapeCharMap.size() == 0) {
            return source;
        }
        StringBuffer sb = new StringBuffer();
        StringCharacterIterator sci = new StringCharacterIterator(source);
        for (char c = sci.first(); c != 65535; c = sci.next()) {
            String character = String.valueOf(c);
            if (escapeCharMap.containsKey(character)) {
                character = (String) escapeCharMap.get(character);
            }
            sb.append(character);
        }
        return sb.toString();
    }

    public static String escapeString(String source, Map escapeStringMap) {
        if ((source == null) || (source.length() == 0)) {
            return source;
        }
        if (escapeStringMap.size() == 0) {
            return source;
        }
        Collection colValues = escapeStringMap.values();
        Collection colKeys = escapeStringMap.keySet();
        Iterator itValues = colValues.iterator();
        Iterator itKeys = colKeys.iterator();
        while ((itValues.hasNext()) && (itKeys.hasNext())) {
            source = replace(source, (String) (String) itKeys.next(), (String) (String) itValues.next());
        }
        return source;
    }

    public static String parseGBtoISO(String str) {
        String ss = str;
        if (ss != null) {
            try {
                ss = new String(ss.getBytes("GB2312"), "ISO8859-1");
            } catch (UnsupportedEncodingException ex) {
                return str;
            }
            return ss;
        }
        return null;
    }

    public static String parseISOtoGB(String str) {
        if (str == null)
            return "";
        for (int i = 0; i < str.length(); i++)
            if (str.charAt(i) > 'ÿ') {
                return str;
            }
        try {
            return new String(str.getBytes("ISO8859-1"), "GB2312");
        } catch (UnsupportedEncodingException ex) {
        }
        return str;
    }

    public static String parseISOtoUTF(String str) {
        if (str == null)
            return "";
        for (int i = 0; i < str.length(); i++)
            if (str.charAt(i) > 'ÿ') {
                return str;
            }
        try {
            return new String(str.getBytes("ISO8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException ex) {
        }
        return str;
    }

    public static String parseGBtoUTF(String str) {
        if (str == null)
            return "";
        for (int i = 0; i < str.length(); i++)
            if (str.charAt(i) > 'ÿ') {
                return str;
            }
        try {
            return new String(str.getBytes("GB2312"), "UTF-8");
        } catch (UnsupportedEncodingException ex) {
        }
        return str;
    }

    public static boolean contains(String[] strings, String string, boolean caseSensitive) {
        for (String string1 : strings) {
            if (caseSensitive) {
                if (string1.equals(string)) {
                    return true;
                }
            } else if (string1.equalsIgnoreCase(string)) {
                return true;
            }
        }

        return false;
    }

    public static boolean contains(String[] strings, String string) {
        return contains(strings, string, true);
    }

    public static boolean containsIgnoreCase(String[] strings, String string) {
        return contains(strings, string, false);
    }

    public static String parseNull(Object s, String rtnstr) {
        return parseNull(s, "", rtnstr);
    }

    public static String parseNull(Object object, String format, String rtnstr) {
        if (rtnstr == null) rtnstr = "";
        if (object == null)
            return rtnstr;
        if ((object instanceof String)) {
            if (object.toString().length() == 0) {
                return rtnstr;
            }
            return object.toString();
        }
        if ((object instanceof Date)) {
            if ((format == null) || (format.length() == 0)) format = "yyyy-MM-dd";
            SimpleDateFormat dateFormat = new SimpleDateFormat(format);
            return dateFormat.format((Date) object);
        }
        return object.toString();
    }

    public static String getUUID() {
        return UUID.randomUUID().toString();
    }

    public static boolean isBlankOrEmpty(String str) {
        if (str != null && !"".equals(str.trim())) {
            return false;
        }
        return true;
    }

    public static String MD5Encode(String str) {
        String resultStr = null;
        if (str == null)
            return str;
        try {
            resultStr = new String(str);
            MessageDigest md = MessageDigest.getInstance("MD5");
            resultStr = byteArrayToHexString(md.digest(resultStr.getBytes()));
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return resultStr;
    }

    public static String byteArrayToHexString(byte[] b) {
        if (b == null)
            return null;
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < b.length; i++)
            result.append(byteToHexString(b[i]));
        return result.toString();
    }

    private static String byteToHexString(byte b) {
        int k = b;
        if (k < 0)
            k += 256;
        int m = k / 16;
        int n = k % 16;
        return hexDigits[m] + hexDigits[n];
    }

    public static String getFileSize(double size) {

        double g = 1024 * 1024 * 1024.0;
        double m = 1024 * 1024.0;
        double k = 1024.0;
        if (size > g) {
            return NumberUtil.format(size / g, 2) + "G";
        } else if (size > m) {
            return NumberUtil.format(size / m, 2) + "M";
        } else if (size > k) {
            return NumberUtil.format(size / k, 2) + "K";
        } else {
            return NumberUtil.format(size, 2) + "Byte";
        }
    }

    public static Document str2Doc(String xmlStr) throws IOException,
            JDOMException {
        InputStream inputStream = new ByteArrayInputStream(xmlStr
                .getBytes("UTF-8"));
        SAXBuilder saxBuilder = new SAXBuilder();
        Document doc = saxBuilder.build(inputStream);
        return doc;
    }

    public static void main(String[] args) {
    }
}