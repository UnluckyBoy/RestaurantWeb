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

    @RequestMapping("/GetAll")
    public void Login(HttpServletRequest request, Model model, HttpSession session){
        //Map<String,Object> resultMap=new HashMap<>();
        List<Object> orderInfoList=new ArrayList<>();
        orderInfoList=orderService.orderQueryAll();
        System.out.println("所有订单:\t"+orderInfoList.toString());
    }

    @RequestMapping("/GetAllCount")
    public void GetAllCount(HttpServletRequest request, Model model, HttpSession session){
        int count=orderService.getAllCount();
        System.out.println("所有订单数:\t"+count);
    }
}
