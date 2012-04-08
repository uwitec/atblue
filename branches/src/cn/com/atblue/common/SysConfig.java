package cn.com.atblue.common;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class SysConfig implements ApplicationContextAware {
    public static ApplicationContext applicationContext;
    private String propLocation;
    private Properties property;

    public void init() {
        if (propLocation != null) {
            if (propLocation.indexOf(",") != -1) {
                String[] locations = propLocation.split(",");
                int size = locations.length;
                for (int i = 0; i < size; i++) {
                    String location = locations[i];
                    initSinglePropertyFile(location);
                }
            } else {
                initSinglePropertyFile(propLocation);
            }
        }
    }

    public void initSinglePropertyFile(String location) {
        if (location.trim().endsWith(".properties")) {
            InputStream in = SysConfig.class.getClassLoader().getResourceAsStream(location);
            if (property == null)
                property = new Properties();
            try {
                property.load(in);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public String getPropLocation() {
        return propLocation;
    }

    public void setPropLocation(String propLocation) {
        this.propLocation = propLocation;
    }

    public String getProperty(String propname) {
        return property.getProperty(propname);
    }

    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        SysConfig.applicationContext = applicationContext;
    }
}
