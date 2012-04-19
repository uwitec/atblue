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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定时短信发送任务
 */
public class SMSSendJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        BeanFactory beanFactory = (BeanFactory) jobExecutionContext.getJobDetail().getJobDataMap().get("beanFactory");
        SMSHandler smsHandler = (SMSHandler) beanFactory.getBean("smsHandler");
        ODao oDao = (ODao) beanFactory.getBean("oDao");

        List list = oDao.getSmsPersonsList();
        if (list != null && list.size() > 0) {
            smsHandler.init();
            smsHandler.start();
            for (int i = 0; i < list.size(); i++) {
//                OfficeSmsPerson map = list.get(i);
//                String USER_NAME = StringUtil.parseNull(map.get("USER_NAME"), "");
//                String DXNR = StringUtil.parseNull(map.get("DXNR"), "");
//                String PHONE = StringUtil.parseNull(map.get("PHONE"), "");
//                String TZID = StringUtil.parseNull(map.get("TZID"), "");
//                StringBuffer s = new StringBuffer();
//                s.append("尊敬的" + USER_NAME + "您好：");
//                s.append("OA系统有[").append(DXNR).append("]等待您签收！");
//                s.append("请发短信返回数字").append(TZID).append("进行签收！");
//                if (!StringUtil.isBlankOrEmpty(PHONE)) {
//                    OutboundMessage message = new OutboundMessage(PHONE, DXNR);
//                    smsHandler.sendSMS(message);
//                }
            }
//            oDao.deleteAllSms();
            smsHandler.destroy();
        }
        System.out.println("测试任务!");
    }

}
