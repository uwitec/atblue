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
public class SMSSendJob implements Job {
    public static boolean isStarting = false;
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        if(isStarting)return;
        BeanFactory beanFactory = (BeanFactory) jobExecutionContext.getJobDetail().getJobDataMap().get("beanFactory");
        SMSHandler smsHandler =SMSHandler.getInstance();
        ODao oDao = (ODao) beanFactory.getBean("oDao");
        OfficeSmsPersonDAO officeSmsPersonDAO = (OfficeSmsPersonDAO) beanFactory.getBean("officeSmsPersonDAO");
        isStarting = true;
        smsHandler.start();
        List list = oDao.getSmsPersonsList();
        if (list != null && list.size() > 0) {
            System.out.println("开始发送短息！");
            for (int i = 0; i < list.size(); i++) {
                OfficeSmsPerson bean = (OfficeSmsPerson) list.get(i);
                String USER_NAME = StringUtil.parseNull(bean.getUserName(), "");
                String DXNR = StringUtil.parseNull(bean.getDxnr(), "");
                String PHONE = StringUtil.parseNull(bean.getPhone(), "");
                String TZID = StringUtil.parseNull(bean.getTzid(), "");
                if (!StringUtil.isBlankOrEmpty(PHONE)) {
                    OutboundMessage message = new OutboundMessage(PHONE, DXNR);
                    smsHandler.sendSMS(message);
                    bean.setSffs("1");
                    System.out.println("短息发送成功：" + message);
                    officeSmsPersonDAO.modOfficeSmsPerson(bean);
                }
            }
            System.out.println("发送短息结束！");
        }
        List<InboundMessage> list2 = smsHandler.readUnReadSMS();
        if (list2 != null && list2.size() > 0) {
            System.out.println("开始读取短息！");
            for (InboundMessage message : list2) {
                String phone = message.getOriginator();
                String text = message.getText();
                System.out.println("已经读取短息:"+text);
                if (!StringUtil.isBlankOrEmpty(text)) {
                    System.out.println("短息读取成功：" + phone);
                    oDao.updateSmsPerson(text.trim(), phone.substring(2));
                    smsHandler.deleteSMS(message);
                }
            }
            System.out.println("读取短息结束！");
        }
        smsHandler.destroy();
        isStarting = false;
    }
}
