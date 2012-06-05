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
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        BeanFactory beanFactory = (BeanFactory) jobExecutionContext.getJobDetail().getJobDataMap().get("beanFactory");
        SMSHandler smsHandler =SMSHandler.getInstance();
        ODao oDao = (ODao) beanFactory.getBean("oDao");
        OfficeSmsPersonDAO officeSmsPersonDAO = (OfficeSmsPersonDAO) beanFactory.getBean("officeSmsPersonDAO");

        List list = oDao.getSmsPersonsList();
        if (list != null && list.size() > 0) {

            for (int i = 0; i < list.size(); i++) {
                OfficeSmsPerson bean = (OfficeSmsPerson) list.get(i);
                String USER_NAME = StringUtil.parseNull(bean.getUserName(), "");
                String DXNR = StringUtil.parseNull(bean.getDxnr(), "");
                String PHONE = StringUtil.parseNull(bean.getPhone(), "");
                String TZID = StringUtil.parseNull(bean.getTzid(), "");
                if (!StringUtil.isBlankOrEmpty(PHONE)) {
                    OutboundMessage message = new OutboundMessage(PHONE, DXNR);
                    smsHandler.queueMessage(message);
                    bean.setSffs("1");
                    System.out.println("短息发送成功：" + message);
                    officeSmsPersonDAO.modOfficeSmsPerson(bean);
                }
            }
        }
    }
}
