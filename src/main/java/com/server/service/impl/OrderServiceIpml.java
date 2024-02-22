package com.server.service.impl;

import com.server.model.mapper.OrderMapper;
import com.server.model.pojo.AllTradingView;
import com.server.model.pojo.MonthCountView;
import com.server.model.pojo.OrderInfo;
import com.server.model.pojo.Product;
import com.server.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName OrderServiceIpml
 * @Author Create By matrix
 * @Date 2024/1/20 0020 15:58
 */
@Service("OrderService")
public class OrderServiceIpml implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<OrderInfo> orderQueryAll() {
        return orderMapper.orderQueryAll();
    }

    @Override
    public int getAllCount() {
        return orderMapper.getAllCount();
    }

    @Override
    public int getTradingCount() {
        return orderMapper.getTradingCount();
    }

    @Override
    public int getNotTradingCount() {
        return orderMapper.getNotTradingCount();
    }

    @Override
    public int sumTradingPrice() {
        return orderMapper.sumTradingPrice();
    }

    @Override
    public int getNearMonthCount() {
        return orderMapper.getNearMonthCount();
    }

    @Override
    public int getNearMonthTradingPrice() {
//        Integer temp=orderMapper.getNearMonthTradingPrice();
//        if(temp==null){
//            return 0;
//        }else{
//            return temp;
//        }
        return orderMapper.getNearMonthTradingPrice();
    }

    @Override
    public List<MonthCountView> getCurrentYearAllOrderCount() {
        return orderMapper.getCurrentYearAllOrderCount();
    }

    @Override
    public List<MonthCountView> getMonthView() {
        return orderMapper.getMonthView();
    }

    @Override
    public List<MonthCountView> getMonthTradingView() {
        return orderMapper.getMonthTradingView();
    }

    @Override
    public List<AllTradingView> getAllTradingView() {
        return orderMapper.getAllTradingView();
    }

    @Override
    public boolean freshOrder(Map<String, Object> map) {
        return orderMapper.freshOrder(map);
    }

    @Override
    public List<Product> getAllProduct() {
        return orderMapper.getAllProduct();
    }
}
