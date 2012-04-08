package cn.com.atblue.common;

import cn.com.atblue.common.codegen.CodeManager;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;

public class SpringFactory implements ApplicationContextAware {
    private ApplicationContext applicationContext;
    public static SpringFactory instance;
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
         this.applicationContext = applicationContext;
         instance = this;
    }
    
    public Object getBean(String beanName){
        if(applicationContext == null){
            String[] locations = { "/config/spring.xml" };
            this.applicationContext = new ClassPathXmlApplicationContext(locations);
        }
        return applicationContext.getBean(beanName);
    }
    
    public DataSource getDataSource(){
        return  (DataSource)getBean("internalDataSource");
    }
    public CodeManager getCodeManager(){
        return  (CodeManager)getBean("codeManager");
    }
}
