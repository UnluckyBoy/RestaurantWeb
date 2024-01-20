package com.server.service.impl;

import com.server.model.mapper.OrderMapper;
import com.server.model.pojo.OrderInfo;
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
    public List<Object> orderQueryAll() {
        return orderMapper.orderQueryAll();
    }

    @Override
    public int getAllCount() {
        return orderMapper.getAllCount();
    }
}
