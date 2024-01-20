package com.server.model.mapper;

import com.server.model.pojo.OrderInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @ClassName OrderMapper
 * @Author Create By matrix
 * @Date 2024/1/20 0020 15:39
 */
@Mapper //mybatis的mapper类
@Repository
public interface OrderMapper {
    public List<Object> orderQueryAll();//查询所有订单信息
    public int getAllCount();//查询所有订单
    public int getTradingCount();//查询交易订单
    public int getNotTradingCount();//查询取消订单
    public int sumTradingPrice();//总收入
    public int getNearMonthCount();//最近一个月订单数
    public int getNearMonthTradingPrice();//最近一个月订单总额
}
