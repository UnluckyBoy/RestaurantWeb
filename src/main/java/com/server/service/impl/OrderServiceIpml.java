package com.server.service.impl;

import com.github.pagehelper.PageInfo;
import com.server.model.mapper.OrderMapper;
import com.server.model.pojo.*;
import com.server.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    @Override
    public boolean up_product_Icon(Map<String, Object> map) {
        return orderMapper.up_product_Icon(map);
    }

    @Override
    public List<MessageView> getCurrentMessage() {
        return orderMapper.getCurrentMessage();
    }

    @Override
    public PageInfo<Product> getPageProduct(int pageNum, int pageSize) {
        //return orderMapper.getPageProduct(pageNum,pageSize);
        List<Product> productList = orderMapper.getPageProduct(pageNum, pageSize);//多个数据分页
        return new PageInfo<>(productList);
    }

    @Override
    public PageInfo<OrderInfo> getPageAllOrder(int pageNum, int pageSize) {
        List<OrderInfo> orderList = orderMapper.getPageAllOrder(pageNum, pageSize);//多个数据分页

        // 遍历订单列表并转换null值为空字符串
//        List<OrderInfo> ordersWithEmptyString = orderList.stream()
//                .map(order -> {
//                    if (order.getmEditor() == null) { // 检查字段是否为null
//                        order.setmEditor(""); // 如果是，则设置为空字符串
//                    }
//                    if(order.getmEditTime()==null){
//                        order.setmEditTime("");
//                    }
//                    return order;
//                })
//                .collect(Collectors.toList());
//        return new PageInfo<>(ordersWithEmptyString);
        return new PageInfo<>(orderList);
    }

    @Override
    public PageInfo<AllTradingView> getTradingView(int pageNum, int pageSize) {
        List<AllTradingView> tradingViewList = orderMapper.getTradingView(pageNum, pageSize);//多个数据分页
        return new PageInfo<>(tradingViewList);
    }

    @Override
    public PageInfo<MessageView> getMessage(int pageNum, int pageSize) {
        List<MessageView> messageViewList = orderMapper.getMessage(pageNum, pageSize);//多个数据分页
        return new PageInfo<>(messageViewList);
    }

    @Override
    public boolean up_product_Info(Map<String, Object> map) {
        return orderMapper.up_product_Info(map);
    }

    @Override
    public boolean delete_product(String id) {
        return orderMapper.delete_product(id);
    }

    @Override
    public boolean add_message(Map<String, Object> map) {
        return orderMapper.add_message(map);
    }

    @Override
    public boolean add_shopping_cart(Map<String, Object> map) {
        return orderMapper.add_shopping_cart(map);
    }
}
