package com.server.model.mapper;

import com.server.model.pojo.Product;
import com.server.model.pojo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Mapper接口
 */
@Mapper //mybatis的mapper类
@Repository //将mapper交由spring容器管理
public interface UserMapper {
    public UserInfo infoQuery(Map<String,Object> map);//查询
    public UserInfo login(Map<String,Object> map);//登录
    public boolean register(Map<String,Object> map);//注册
    public List<UserInfo> fuzzyQuery(String name);//昵称查询
    public boolean fresh_status_login(Map<String,Object> map);//更新登录信息
    public boolean fresh_status_logout(Map<String,Object> map);
    public boolean fresh_head(Map<String,Object> map);//更新头像
    public int getUserCount();//查询用户数
    public int getUserOnlineCount();//查询当前在线用户
    public boolean fresh_segment_info(Map<String,Object> map);//更新部分信息
    public boolean update_user_info(Map<String,Object> map);//更新用户信息,管理员端

    /***分页操作***/
    /*用户信息分页*/
    @Select("select " +
            "uId," +
            "uHead," +
            "uName," +
            "uPassword," +
            "uSex," +
            "uAccount," +
            "uPhone," +
            "uEmail," +
            "uLevel," +
            "uStatus," +
            "uAddressIp " +
            "from user_info_data")
    List<UserInfo> getPageUserInfo(@Param("pageNum") int pageNum,
                                   @Param("pageSize") int pageSize);
}