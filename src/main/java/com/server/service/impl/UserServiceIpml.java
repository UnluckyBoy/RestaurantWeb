package com.server.service.impl;

import com.github.pagehelper.PageInfo;
import com.server.model.mapper.UserMapper;
import com.server.model.pojo.UserInfo;
import com.server.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("UserService")
public class UserServiceIpml implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserInfo infoQuery(Map<String,Object> map) {
        return userMapper.infoQuery(map);
    }

    @Override
    public UserInfo login(Map<String,Object> map) {
        return userMapper.login(map);
    }

    @Override
    public boolean register(Map<String, Object> map) {
        return userMapper.register(map);
    }

    @Override
    public List<UserInfo> fuzzyQuery(String name) {
        return userMapper.fuzzyQuery(name);
    }

    @Override
    public boolean fresh_status_login(Map<String, Object> map) {
        return userMapper.fresh_status_login(map);
    }

    @Override
    public boolean fresh_status_logout(Map<String, Object> map) {
        return userMapper.fresh_status_logout(map);
    }

    @Override
    public boolean fresh_head(Map<String, Object> map) {
        return userMapper.fresh_head(map);
    }

    @Override
    public int getUserCount() {
        return userMapper.getUserCount();
    }

    @Override
    public int getUserOnlineCount() {
        return userMapper.getUserOnlineCount();
    }

    @Override
    public boolean fresh_segment_info(Map<String, Object> map) {
        return userMapper.fresh_segment_info(map);
    }

    @Override
    public boolean update_user_info(Map<String, Object> map) {
        return userMapper.update_user_info(map);
    }

    @Override
    public PageInfo<UserInfo> getPageUserInfo(int pageNum,int pageSize) {
        List<UserInfo> userInfoList=userMapper.getPageUserInfo(pageNum,pageSize);
        return new PageInfo<>(userInfoList);
    }

}
