package cn.com.atblue.common.sms;

import cn.com.atblue.common.util.StringUtil;
import cn.com.atblue.oa.dao.ODao;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.smslib.OutboundMessage;
import org.springframework.beans.factory.BeanFactory;

import java.util.HashMap;
import java.util.List;

/**
 * 定时短信发送任务
 */
public class SMSSendJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        BeanFactory beanFactory = (BeanFactory) jobExecutionContext.getJobDetail().getJobDataMap().get("beanFactory");
        SMSHandler smsHandler = (SMSHandler) beanFactory.getBean("smsHandler");
        OfficeSmsDAO officeSmsDAO = (OfficeSmsDAO) beanFactory.getBean("officeSmsDAO");
        OfficeSmsHisDAO officeSmsHisDAO = (OfficeSmsHisDAO) beanFactory.getBean("officeSmsHisDAO");
        ODao oDao = (ODao) beanFactory.getBean("oDao");
        List list = officeSmsDAO.queryForList(new HashMap());
        if (list != null && list.size() > 0) {
            smsHandler.init();
            smsHandler.start();
            for (int i = 0; i < list.size(); i++) {
                OfficeSms officeSms = (OfficeSms) list.get(i);
                OfficeSmsHis officeSmsHis = new OfficeSmsHis();
                officeSmsHis.setHisId(StringUtil.getUUID());
                officeSmsHis.setUserId(officeSms.getUserId());
                officeSmsHis.setUserName(officeSms.getUserName());
                officeSmsHis.setPhone(officeSms.getPhone());
                officeSmsHis.setSmsContent(officeSms.getSmsContent());
                officeSmsHis.setModuleFlag(officeSms.getModuleFlag());
                if (officeSms != null &&
                        !StringUtil.isBlankOrEmpty(officeSms.getPhone()) &&
                        !StringUtil.isBlankOrEmpty(officeSms.getSmsContent())) {
                    OutboundMessage message = new OutboundMessage(officeSms.getPhone(), officeSms.getSmsContent());
                    smsHandler.sendSMS(message);
                    officeSmsHis.setSfqs("0");
                }
                officeSmsHisDAO.addOfficeSmsHis(officeSmsHis);
            }
            oDao.deleteAllSms();
            smsHandler.destroy();
        }
        System.out.println("测试任务!");
    }

}
