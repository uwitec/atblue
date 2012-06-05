package cn.com.atblue.common.sms;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.common.SysConfig;
import cn.com.atblue.common.util.StringUtil;
import org.smslib.*;
import org.smslib.AGateway.Protocols;
import org.smslib.Message.MessageEncodings;
import org.smslib.modem.SerialModemGateway;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class SMSHandler {
    private String comPort;//com口
    private int baudRate; //波特率
    private String manufacturer;
    private Service smsService;

    private  static SMSHandler instance;

    public SMSHandler() {
        SysConfig sysConfig =(SysConfig) SpringFactory.instance.getBean("propertyConfig");
        String manufacturer = sysConfig.getProperty("manufacturer");
        String comPort = sysConfig.getProperty("comPort");
        String baudRate = sysConfig.getProperty("baudRate");
        this.comPort = comPort;
        if(!StringUtil.isBlankOrEmpty(baudRate)){
            this.baudRate = Integer.valueOf(baudRate).intValue();
        }
        this.manufacturer = manufacturer;
        init();
        start();
    }

    public static SMSHandler getInstance(){
        if(instance == null){
            instance = new SMSHandler();
        }
        return instance;
    }

    public void init() {
        smsService = Service.getInstance();
        SerialModemGateway gateway =
                new SerialModemGateway("modem." + comPort, comPort, baudRate, manufacturer, "17254");
        gateway.setInbound(true);
        gateway.setOutbound(true);
        gateway.setProtocol(Protocols.PDU);
        gateway.setSimPin("0000");
        try {
            smsService.addGateway(gateway);
            System.out.println("短信猫已经启动！");
        } catch (GatewayException e) {
            e.printStackTrace();
        }
    }

    public void start() {
        try {
            smsService.startService();
            System.out.println("启动连接服务！");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
        try {
            smsService.stopService();
            System.out.println("停止连接服务！");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   public void deleteSMS(InboundMessage msg){
       try {
           smsService.deleteMessage(msg);
       } catch (TimeoutException e) {
           e.printStackTrace();
       } catch (GatewayException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       } catch (InterruptedException e) {
           e.printStackTrace();
       }
   }
    public boolean sendSMS(OutboundMessage msg) {
        msg.setEncoding(MessageEncodings.ENCUCS2);
        try {
            return smsService.sendMessage(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean queueMessage(OutboundMessage msg) {
        msg.setEncoding(MessageEncodings.ENCUCS2);
        try {
            return smsService.queueMessage(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isStarted() {
        if (smsService != null && smsService.getServiceStatus() == Service.ServiceStatus.STARTED) {
            for (AGateway gateway : smsService.getGateways()) {
                if (gateway.getStatus() == AGateway.GatewayStatuses.STARTED) {
                    return true;
                }
            }
        }
        return false;
    }

    public List<InboundMessage> readSMS() {
        List<InboundMessage> msgList = new LinkedList<InboundMessage>();
        if (!isStarted()) {
            return msgList;
        }
        try {
            this.smsService.readMessages(msgList, InboundMessage.MessageClasses.ALL);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msgList;
    }

    public List<InboundMessage> readUnReadSMS() {
        List<InboundMessage> msgList = new LinkedList<InboundMessage>();
        if (!isStarted()) {
            return msgList;
        }
        try {
            this.smsService.readMessages(msgList, InboundMessage.MessageClasses.UNREAD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msgList;
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize();
        this.destroy();
    }

    public String getComPort() {
        return comPort;
    }

    public void setComPort(String comPort) {
        this.comPort = comPort;
    }

    public int getBaudRate() {
        return baudRate;
    }

    public void setBaudRate(int baudRate) {
        this.baudRate = baudRate;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public Service getSmsService() {
        return smsService;
    }

    public void setSmsService(Service smsService) {
        this.smsService = smsService;
    }
}
