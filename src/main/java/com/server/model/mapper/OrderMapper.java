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
}
