package cn.com.atblue.common.codegen.jdbc;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class BeanInjector<T> {
    private Class<T> injectClass;

    public BeanInjector(Class<T> injectClass) {
        this.injectClass = injectClass;
    }

    public T inject(Map<String, Object> map) {
        Object o = null;
        try {
            o = this.injectClass.newInstance();
            if ((map == null) || (map.size() == 0)) {
                return (T) o;
            }
            Method[] methods = o.getClass().getMethods();
            for (Method aMethod : methods) {
                String name = aMethod.getName();
                if (name.indexOf("set") != 0)
                    continue;
                Class _class = aMethod.getParameterTypes()[0];
                name = name.substring(3);
                try {
                    if ((_class == Long.class) || (_class == Long.TYPE)) {
                        Object tmp = map.get(parseName(name));
                        if (tmp != null) {
                            if ((tmp instanceof BigDecimal))
                                aMethod.invoke(o, new Object[]{Long.valueOf(((BigDecimal) tmp).longValue())});
                            else
                                aMethod.invoke(o, new Object[]{Long.valueOf(new BigDecimal(tmp.toString()).longValue())});
                        }
                    } else if ((_class == Integer.class) || (_class == Integer.TYPE)) {
                        Object tmp = map.get(parseName(name));
                        if (tmp != null) {
                            if ((tmp instanceof BigDecimal))
                                aMethod.invoke(o, new Object[]{Integer.valueOf(((BigDecimal) tmp).intValue())});
                            else
                                aMethod.invoke(o, new Object[]{Integer.valueOf(new BigDecimal(tmp.toString()).intValue())});
                        }
                    } else if ((_class == Float.class) || (_class == Float.TYPE)) {
                        Object tmp = map.get(parseName(name));
                        if (tmp != null) {
                            if ((tmp instanceof BigDecimal))
                                aMethod.invoke(o, new Object[]{Float.valueOf(((BigDecimal) tmp).floatValue())});
                            else
                                aMethod.invoke(o, new Object[]{Float.valueOf(new BigDecimal(tmp.toString()).floatValue())});
                        }
                    } else if ((_class == Double.class) || (_class == Double.TYPE)) {
                        Object tmp = map.get(parseName(name));
                        if (tmp != null) {
                            if ((tmp instanceof BigDecimal))
                                aMethod.invoke(o, new Object[]{Double.valueOf(((BigDecimal) tmp).doubleValue())});
                            else
                                aMethod.invoke(o, new Object[]{Double.valueOf(new BigDecimal(tmp.toString()).doubleValue())});
                        }
                    } else if (_class == String.class) {
                        Object obj = map.get(parseName(name));
                        if (obj != null)
                            aMethod.invoke(o, new Object[]{obj.toString()});
                    } else if (_class == Date.class) {
                        aMethod.invoke(o, new Object[]{(Date) map.get(parseName(name))});
                    } else if (_class == Timestamp.class) {
                        aMethod.invoke(o, new Object[]{(Timestamp) map.get(parseName(name))});
                    }
                } catch (ClassCastException e) {
                    e.printStackTrace();
                }
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return (T) o;
    }

    public List<T> inject(List<Map<String, Object>> list) {
        List _list = new ArrayList();
        for (Map aList : list) {
            _list.add(inject(aList));
        }
        return _list;
    }

    private String parseName(String s) {
        StringBuffer buffer = new StringBuffer();
        int count = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if ((c >= 'A') && (c <= 'Z')) {
                if (count == 0) {
                    buffer.append(c);
                    count++;
                } else {
                    buffer.append('_').append(c);
                }
            } else buffer.append(Character.toUpperCase(c));
        }

        return buffer.toString();
    }
}