package cn.com.atblue.common.sms;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.oa.bean.OfficeSmsPerson;
import cn.com.atblue.oa.dao.ODao;
import cn.com.atblue.oa.dao.OfficeSmsPersonDAO;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.smslib.OutboundMessage;
import org.springframework.beans.factory.BeanFactory;

import java.util.List;

/**
 * 定时短信发送任务
 */
public class SMSSendJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        BeanFactory beanFactory = (BeanFactory) jobExecutionContext.getJobDetail().getJobDataMap().get("beanFactory");
        SMSHandler smsHandler = (SMSHandler) beanFactory.getBean("smsHandler");
        ODao oDao = (ODao) beanFactory.getBean("oDao");
        OfficeSmsPersonDAO officeSmsPersonDAO = (OfficeSmsPersonDAO) beanFactory.getBean("officeSmsPersonDAO");

        List list = oDao.getSmsPersonsList();
        if (list != null && list.size() > 0) {
            if(!smsHandler.isStarted()){
                smsHandler.init();
                smsHandler.start();
            }
            System.out.println("短信猫已经启动！");
            for (int i = 0; i < list.size(); i++) {
                OfficeSmsPerson bean = (OfficeSmsPerson) list.get(i);
                String USER_NAME = StringUtil.parseNull(bean.getUserName(), "");
                String DXNR = StringUtil.parseNull(bean.getDxnr(), "");
                String PHONE = StringUtil.parseNull(bean.getPhone(), "");
                String TZID = StringUtil.parseNull(bean.getTzid(), "");
//                StringBuffer s = new StringBuffer();
//                s.append("尊敬的" + USER_NAME + "您好：");
//                s.append("OA系统有[").append(DXNR).append("]等待您签收！");
//                s.append("请发短信返回数字").append(TZID).append("进行签收！");
                if (!StringUtil.isBlankOrEmpty(PHONE)) {
                    OutboundMessage message = new OutboundMessage(PHONE, DXNR);
                    smsHandler.sendSMS(message);
                    bean.setSffs("1");
                    System.out.println("短息发送成功："+message);
                    officeSmsPersonDAO.modOfficeSmsPerson(bean);
                }

            }
//            smsHandler.destroy();
        }
    }
}
