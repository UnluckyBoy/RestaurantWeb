package com.server.service;

import com.github.pagehelper.PageInfo;
import com.server.model.pojo.*;
import org.apache.ibatis.annotations.Param;
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
    public List<OrderInfo> orderQueryAll();
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

    public boolean freshOrder(Map<String,Object> map);
    public List<Product> getAllProduct();
    public boolean up_product_Icon(Map<String,Object> map);
    public List<MessageView> getCurrentMessage();
    PageInfo<Product> getPageProduct(int pageNum,int pageSize);
    PageInfo<OrderInfo> getPageAllOrder(int pageNum,int pageSize);
    PageInfo<AllTradingView> getTradingView(int pageNum,int pageSize);
    PageInfo<MessageView> getMessage(int pageNum,int pageSize);
    public boolean up_product_Info(Map<String,Object> map);//更新产品信息
    public boolean delete_product(String id);
    public boolean add_message(Map<String,Object>map);
    public boolean add_shopping_cart(Map<String,Object>map);
}
