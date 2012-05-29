package cn.com.atblue.common.sms;

import cn.com.atblue.common.util.DateUtil;
import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.oa.dao.ODao;
import cn.com.atblue.oa.dao.OfficeSmsPersonDAO;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.smslib.InboundMessage;
import org.springframework.beans.factory.BeanFactory;

import java.util.Date;
import java.util.List;

public class SMSReadJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        BeanFactory beanFactory = (BeanFactory) jobExecutionContext.getJobDetail().getJobDataMap().get("beanFactory");
        SMSHandler smsHandler = (SMSHandler) beanFactory.getBean("smsHandler");
        ODao oDao = (ODao) beanFactory.getBean("oDao");
        if(!smsHandler.isStarted()){
            smsHandler.init();
            smsHandler.start();
        }
        List<InboundMessage> list = smsHandler.readUnReadSMS();
        if (list != null && list.size() > 0) {
            for (InboundMessage message : list) {
                String phone = message.getOriginator();
                String text = message.getText();
                if (!StringUtil.isBlankOrEmpty(text)) {
                    oDao.updateSmsPerson(text,phone.substring(2));
                }
            }
        }
//        smsHandler.destroy();
    }
}
