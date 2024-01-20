package com.server.service;

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
}
