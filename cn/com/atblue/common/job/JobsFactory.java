package cn.com.atblue.common.job;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class JobsFactory implements BeanFactoryAware {

    private BeanFactory beanFactory;
    private static String PROPERTY_FILE = "/config/jobs.xml";
    private List jobList = new ArrayList();
    private Scheduler scheduler;

    public JobsFactory() {
    }

    public void init() {
        SAXBuilder sb = new SAXBuilder();
        Document doc = null;
        try {
            doc = sb.build(JobsFactory.class.getResourceAsStream(PROPERTY_FILE));
        } catch (JDOMException ex) {
        } catch (Exception ex) {
        }
        Element root = doc.getRootElement();
        String description = root.getChild("description").getText();
        List jobs = root.getChildren("job");
        if (jobs != null && jobs.size() > 0) {
            for (int i = 0; i < jobs.size(); i++) {
                Element job = (Element) jobs.get(i);
                Element nostart = job.getChild("nostart");
                if (nostart != null && nostart.getText().equalsIgnoreCase("true")) {
                    continue;
                }
                String jobdesc = job.getChild("description").getText();
                String name = job.getChild("name").getText();
                String jobclass = job.getChild("class").getText();
                String time = job.getChild("time").getText();
                JobBean bean = new JobBean();
                bean.setName(name);
                bean.setDescription(jobdesc);
                Class clazz = null;
                try {
                    clazz = Class.forName(jobclass);
                } catch (ClassNotFoundException e) {
                }
                bean.setJobClass(clazz);
                bean.setCronTime(time);
                jobList.add(bean);
            }
        }
    }

    public void start() {
        if (jobList != null && jobList.size() > 0) {
            try {
                scheduler = StdSchedulerFactory.getDefaultScheduler();
                scheduler.start();
            } catch (Exception e) {
            }
            for (int i = 0; i < jobList.size(); i++) {
                JobBean bean = (JobBean) jobList.get(i);
                try {
                    addJob(bean.getCronTime(), bean.getName(), bean.getJobClass());
                } catch (Exception e) {
                }
            }
        }
    }

    private void addJob(String time, String name, Class clazz) {
        if (name == null || "".equals(name))
            name = clazz.getName();
        Trigger triggers = null;
        JobDetail jobDetails = new JobDetail(name, Scheduler.DEFAULT_GROUP, clazz);
        jobDetails.getJobDataMap().put("beanFactory", beanFactory);
        try {
            triggers = new CronTrigger(name,
                    Scheduler.DEFAULT_GROUP, time.trim());
        } catch (ParseException e) {
        }
        try {
            scheduler.scheduleJob(jobDetails, triggers);
        } catch (SchedulerException e) {
        }
        try {
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(
                    name, Scheduler.DEFAULT_GROUP);
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }

    public void initAddStart() {
        init();
        start();
    }

    public List getJobList() {
        return jobList;
    }

    public void setJobList(List jobList) {
        this.jobList = jobList;
    }

    public BeanFactory getBeanFactory() {
        return beanFactory;
    }

    public void setBeanFactory(BeanFactory beanFactory) {
        this.beanFactory = beanFactory;
    }
}
