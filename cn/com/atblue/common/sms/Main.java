package cn.com.atblue.common.sms;

import org.smslib.InboundMessage;
import org.smslib.OutboundMessage;

import java.util.List;
public class Main {

    public static void main(String[] args) {
        SMSHandler smsHandler = new SMSHandler();
        smsHandler.setComPort("COM3");
        smsHandler.setBaudRate(9600);
        smsHandler.setManufacturer("wavecom");
        smsHandler.init();
        smsHandler.start();
//        List<InboundMessage> list = smsHandler.readSMS();
//        if(list != null){
//            for(InboundMessage message : list){
//                System.out.println(message.getOriginator()+":"+message.getText());
//            }
//        }
        OutboundMessage msg = new  OutboundMessage("13805468530","hello blue!");
        smsHandler.sendSMS(msg);
        System.out.println("read success!");
        smsHandler.destroy();
//        System.out.println("8613589976993".substring(2));
    }
}
