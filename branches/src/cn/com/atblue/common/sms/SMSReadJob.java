package cn.com.atblue.common.sms;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.oa.bean.OfficeSmsPerson;
import cn.com.atblue.oa.dao.ODao;
import cn.com.atblue.oa.dao.OfficeSmsPersonDAO;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.smslib.InboundMessage;
import org.smslib.OutboundMessage;
import org.springframework.beans.factory.BeanFactory;

import java.util.List;

/**
 * 定时短信任务
 */
public class SMSReadJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        BeanFactory beanFactory = (BeanFactory) jobExecutionContext.getJobDetail().getJobDataMap().get("beanFactory");
        SMSHandler smsHandler =SMSHandler.getInstance();
        ODao oDao = (ODao) beanFactory.getBean("oDao");
        smsHandler.start();
        List<InboundMessage> list2 = smsHandler.readUnReadSMS();
        System.out.println("开始读取短息！");
        if (list2 != null && list2.size() > 0) {
            smsHandler.start();
            for (InboundMessage message : list2) {
                String phone = message.getOriginator();
                String text = message.getText();
                System.out.println("已经读取短息:"+text);
                if (!StringUtil.isBlankOrEmpty(text)) {
                    System.out.println("短息读取成功：" + phone);
                    oDao.updateSmsPerson(text, phone.substring(2));
                    smsHandler.deleteSMS(message); //删除短信
                }
            }

        }
        smsHandler.destroy();
        System.out.println("读取短息结束！");
    }
}
