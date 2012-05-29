package cn.com.atblue.common.sms;

import org.smslib.*;
import org.smslib.AGateway.Protocols;
import org.smslib.Message.MessageEncodings;
import org.smslib.modem.SerialModemGateway;

import java.util.LinkedList;
import java.util.List;

public class SMSHandler {
    private String comPort;//com口
    private int baudRate; //波特率
    private String manufacturer;
    private Service smsService;

    public SMSHandler() {
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

    public boolean sendSMS(OutboundMessage msg) {
        msg.setEncoding(MessageEncodings.ENCUCS2);
        try {
            return smsService.sendMessage(msg);
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
