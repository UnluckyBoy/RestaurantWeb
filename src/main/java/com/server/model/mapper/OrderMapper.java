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
    public boolean add_message(Map<String,Object>map);//发布信息
    public boolean add_shopping_cart(Map<String,Object>map);//购物车
    public boolean buy_create_order(Map<String,Object>map);//购买插入
    public boolean delete_shopping_cart(Map<String,Object>map);//删除购物车数据

    /***分页操作***/
    /*产品分页*/
    @Select("select " +
            "pId, " +
            "pName, " +
            "pIcon, " +
            "pDescription, " +
            "pType, " +
            "pShopper, " +
            "pPrice, " +
            "pImage " +
            "from product_info_data")
    List<Product> getPageProduct(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);//产品多数据分页

    /*订单分页*/
    @Select("select " +
            "mId, " +
            "mOrderNumber, " +
            "mContent, " +
            "mOrder, " +
            "mShopper, " +
            "mTradingPrice, " +
            "DATE_FORMAT(mCreateTime, '%Y-%m-%d %H:%i:%s') as mCreateTime, " +
            "mEditor, " +
            "DATE_FORMAT(mEditTime, '%Y-%m-%d %H:%i:%s') as mEditTime, " +
            "mTradingType " +
            "from order_info_data")
    List<OrderInfo> getPageAllOrder(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);//全部订单分页获取

    /*销售视图分页*/
    @Select("with CTEMP as ("+"SELECT " + "ROW_NUMBER() OVER (order by (SELECT null)) as id, " +
            "sum(order_info_data.mTradingPrice) as mTradingPrice, " +
            "product_info_data.pName, " +
            "product_info_data.pType " +
            "from order_info_data join product_info_data " +
            "on order_info_data.mShopper = product_info_data.pShopper " +
            "where order_info_data.mTradingType=1 " +
            "group by product_info_data.pName, product_info_data.pType" + ")" +
            "SELECT " +
            "id," +
            "mTradingPrice, " +
            "pName, " +
            "pType " +
            "from CTEMP")
    List<AllTradingView> getTradingView(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    /*消息分页*/
    @Select("select " +
            "aId," +
            "aTitle," +
            "aContent," +
            "aPublisher," +
            "aCreateTime," +
            "aType " +
            "from announcement_data order by aCreateTime desc")
    List<MessageView> getMessage(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    /*购物车分页*/
    @Select("select " +
            "cId," +
            "cTitle," +
            "cContent," +
            "cCreator," +
            "cShopper," +
            "cNumber," +
            "cTradingPrice," +
            "cCreateTime " +
            "from shopping_cart_data " +
            "where cCreator = #{creator}")
    List<ShoppingCart> getShoppingCart(@Param("pageNum") int pageNum,
                                       @Param("pageSize") int pageSize,
                                       @Param("creator") String creator);
    /*分页获取购买记录*/
    @Select("select " +
            "mId," +
            "mOrderNumber," +
            "mContent," +
            "mOrder," +
            "mShopper," +
            "mTradingPrice," +
            "mCreateTime," +
            "mEditor," +
            "mEditTime," +
            "mTradingType " +
            "from order_info_data where mOrder=#{order}")
    List<OrderInfo> getOrderList(@Param("pageNum") int pageNum,
                                       @Param("pageSize") int pageSize,
                                       @Param("order") String order);
}
