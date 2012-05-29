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
        List<InboundMessage> list = smsHandler.readUnReadSMS();
        if(list != null){
            for(InboundMessage message : list){
                System.out.println(message.getOriginator()+":"+message.getText());
            }
        }
//        OutboundMessage msg = new  OutboundMessage("13805468530","DotA是Defense of the Ancients的简称，可以译作守护古树、守护遗迹、远古遗迹守卫， 是指基于魔兽争霸3：冰封王座（由暴雪娱乐公司出品）的多人即时对战自定义地图，可支持10个人同时连线游戏。Dota以对立的两个小队展开对战，通常是5v5，游戏目的是守护自己的远古遗迹（近卫方的生命之树、天灾方的冰封王座），同时摧毁对方的远古遗迹。DotA是目前唯一被暴雪娱乐公司官方认可的魔兽争霸的RPG地图。Allstars系列现更新作者为美国人IceFrog。Dota以对立的两个小队展开对战，通常是5v5，正如该游戏名称所表现的，游戏目的是守护自己的远古遗迹（近卫方的生命之树、天灾方的冰封王座），同时摧毁对方的远古遗迹。为了到达对方的远古遗迹，一方英雄必须战胜对方的部队、防御建筑和英雄。 ");
//        smsHandler.sendSMS(msg);
        System.out.println("read success!");
        smsHandler.destroy();
//        System.out.println("8613589976993".substring(2));
    }
}
