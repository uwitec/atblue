package cn.com.atblue.manager.service;

import cn.com.atblue.manager.bean.CUser;

public interface IUserService {

    public CUser login(String userName, String password);
    
    public CUser getCUserByUserName(String userName);

}
