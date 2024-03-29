package com.server.service;
import com.github.pagehelper.PageInfo;
import com.server.model.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface UserService {
    public UserInfo infoQuery(Map<String,Object> map);;
    public UserInfo login(Map<String,Object> map);
    public boolean register(Map<String,Object> map);
    public List<UserInfo> fuzzyQuery(String name);
    public boolean fresh_status_login(Map<String,Object> map);//更新登录信息
    public boolean fresh_status_logout(Map<String,Object> map);//登出
    public boolean fresh_head(Map<String,Object> map);//更新头像
    public int getUserCount();//查询用户数
    public int getUserOnlineCount();//查询当前在线用户
    public boolean fresh_segment_info(Map<String,Object> map);
    public boolean update_user_info(Map<String,Object> map);
    PageInfo<UserInfo> getPageUserInfo(int pageNum, int pageSize);
}
