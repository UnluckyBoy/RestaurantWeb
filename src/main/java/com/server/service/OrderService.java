package com.server.service;

import com.server.model.pojo.AllTradingView;
import com.server.model.pojo.MonthCountView;
import com.server.model.pojo.OrderInfo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName OrderService
 * @Author Create By matrix
 * @Date 2024/1/20 0020 15:57
 */
@Service
public interface OrderService {
    public List<Object> orderQueryAll();
    public int getAllCount();
    public int getTradingCount();
    public int getNotTradingCount();
    public int sumTradingPrice();
    public int getNearMonthCount();//最近一个月订单数
    public int getNearMonthTradingPrice();//最近一个月订单总额
    public List<MonthCountView> getCurrentYearAllOrderCount();//查找当前
    public List<MonthCountView> getMonthView();
    public List<MonthCountView> getMonthTradingView();
    public List<AllTradingView> getAllTradingView();
}
