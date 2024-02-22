package com.server.model.mapper;

import com.server.model.pojo.AllTradingView;
import com.server.model.pojo.MonthCountView;
import com.server.model.pojo.OrderInfo;
import com.server.model.pojo.Product;
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
    List<OrderInfo> orderQueryAll();//查询所有订单信息
    public int getAllCount();//查询所有订单
    public int getTradingCount();//查询交易订单
    public int getNotTradingCount();//查询取消订单
    public int sumTradingPrice();//总收入
    public int getNearMonthCount();//最近一个月订单数
    public int getNearMonthTradingPrice();//最近一个月订单总额
    public List<MonthCountView> getCurrentYearAllOrderCount();//查找当前
    public List<MonthCountView> getMonthView();//查找当前年月的订单量并按照天数分组
    public List<MonthCountView> getMonthTradingView();//查找当前年月的有效交易量并按照天数分组
    public List<AllTradingView> getAllTradingView();//查找当月有效订单数据的产品、类别、销售额按照高到低排序

    public boolean freshOrder(Map<String,Object> map);//更新订单信息
    public List<Product> getAllProduct();//获取所有产品
}
