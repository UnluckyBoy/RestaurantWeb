package com.server.controller;

import com.server.model.pojo.OrderInfo;
import com.server.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName OrderController
 * @Author Create By matrix
 * @Date 2024/1/20 0020 16:06
 */
@Controller
//@ResponseBody
@RequestMapping("/OrderInfo")
public class OrderController {
    @Autowired
    private OrderService orderService;

    private OrderInfo orderInfo;

    @RequestMapping("/GetAllOrder")
    public void Login(HttpServletRequest request, Model model, HttpSession session){
        //Map<String,Object> resultMap=new HashMap<>();
        List<Object> orderInfoList=new ArrayList<>();
        orderInfoList=orderService.orderQueryAll();
        System.out.println("所有订单:\t"+orderInfoList.toString());
    }

    @RequestMapping("/GetAllCount")
    public int GetAllCount(){
        int count=orderService.getAllCount();
        System.out.println("所有订单数:\t"+count);
        return count;
    }

    @RequestMapping("/GetTradingCount")
    public int GetTradingCount(){
        int count=orderService.getTradingCount();
        System.out.println("交易订单数:\t"+count);
        return count;
    }
    @RequestMapping("/GetNotTradingCount")
    public int GetNotTradingCount(){
        int count=orderService.getNotTradingCount();
        System.out.println("取消订单数:\t"+count);
        return count;
    }
//    @RequestMapping("/GetAllTypeCount")
//    public Map GetAllTypeCount(){
//        Map<String,Object> resultMap=new HashMap<>();
//        resultMap.put("AllOrderCount",GetAllCount());
//        resultMap.put("TradingOrderCount",GetTradingCount());
//        resultMap.put("NotTradingOrderCount",GetNotTradingCount());
//        System.out.println("订单数数据:\t"+resultMap.toString());
//        return resultMap;
//    }
}
