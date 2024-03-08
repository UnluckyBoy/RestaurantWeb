package com.server.model.mapper;

import com.github.pagehelper.PageInfo;
import com.server.model.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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
    public boolean up_product_Icon(Map<String,Object> map);//更新产品头像
    public List<MessageView> getCurrentMessage();//获取前5消息显示
    public boolean up_product_Info(Map<String,Object> map);//更新产品信息
    public boolean delete_product(String id);//删除产品

    /**分页操作**/
    @Select("select " +
            "pId, " +
            "pName, " +
            "pIcon, " +
            "pDescription, " +
            "pType, " +
            "pShopper, " +
            "pPrice " +
            "from product_info_data")
    List<Product> getPageProduct(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);//产品多数据分页

    @Select("select " +
            "mId, " +
            "mOrderNumber, " +
            "mContent, " +
            "mOrder, " +
            "mShopper, " +
            "mTradingPrice, " +
            "DATE_FORMAT(mCreateTime, '%Y-%m-%d %H:%i:%s') AS mCreateTime, " +
            "mEditor, " +
            "DATE_FORMAT(mEditTime, '%Y-%m-%d %H:%i:%s') AS mEditTime, " +
            "mTradingType " +
            "from order_info_data")
    List<OrderInfo> getPageAllOrder(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);//全部订单分页获取
}
