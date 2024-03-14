package com.server.controller;

import com.github.pagehelper.PageInfo;
import com.server.model.pojo.*;
import com.server.service.OrderService;
import com.server.tools.*;
import com.server.service.UserService;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.time.Month;
import java.util.*;

/**
 * 控制层
 *
 * @Controller
 * @ResponseBody
 * 与
 * @RestController
 * 一样
 */
@Controller
//@ResponseBody
@RequestMapping("/Restaurant")
public class GetInfoContro {
    private static String system_Path=System.getProperty("user.dir")+"/BackResource/";
    private static String user_info_Path="/HeadIcon";

    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    /**
     * 在RedisConfig文件中配置了redisTemplate的序列化
     * 客户端也能正确显示键值对
     */
    @Autowired
    private RedisTemplate redisTemplate;
    private UserInfo mUser;
    //private List<UserInfo> mListUser;
    private static String PASSWORD_EncryKEY = "EncryptionKey_By-WuMing";//自定义密钥:EncryptionKey_By-WuMing
    private static String mHand="/default.png";//默认头像地址
    private static String root_dir=System.getProperty("user.dir")+"/BackResource/";
    private static String product_dir="ProductIcon/";//产品图片路径
    private static String user_dir="HeadIcon/";//用户图片路径

//    /**
//     * 登录接口
//     * @param account
//     * @param password
//     * @return
//     */
//    @RequestMapping( "/login")
//    public Map Login(@RequestParam("account") String account, @RequestParam("password") String password,
//                     HttpServletRequest request){
//
//        Map<String,Object> resultMap=new HashMap<>();
//        Map<String,Object> requestMap=new HashMap<>();
//
//        requestMap.put("account",account);
//        //对密码解密
//        String mEncryPwd = Pwd3DESUtil.encode3Des(PASSWORD_EncryKEY, password);
//        requestMap.put("password",mEncryPwd);
//        requestMap.put("status",1);
//
//        /**显示ip**/
//        String currentIp= IPUtil.getIpAddress(request);
//        System.out.println("IP:"+currentIp);
//        requestMap.put("addressIp",currentIp);
//
//        /** 查询缓存是否存在
//         * 否则查询数据库，写入Redis缓存
//         * */
////        BoundHashOperations hashOps = redisTemplate.boundHashOps(account);
////        if(hashOps.entries().size()>0){
////            //System.out.println("Redis not null");
////            resultMap=hashOps.entries();
////        } else{
////            //System.out.println("Redis is null");
////            try{
////                mUser=userService.login(requestMap);
////                resultMap=CommonClass2Map("success",mUser);
////
////                //System.out.println("__写入Redis缓存Key："+acount);
////                redisTemplate.opsForHash().putAll(account,resultMap);//写入Redis
////                redisTemplate.expire(account,5, TimeUnit.MINUTES);
////            }catch (Exception e){
////                System.out.println("查询异常——mUser is:"+e.getMessage());
////                resultMap.put("result","error");
////            }
////        }
//        try{
//            mUser= userService.login(requestMap);
//            if(mUser.getmStatus()!=0){
//                /*
//                if(mUser.getmAddressIp()!=currentIp){
//                    System.out.println("两次登录ip不一致"+mUser.getmAddressIp()+currentIp);
//                }
//                */
//                resultMap.put("result","login_lock");
//            }else{
//                boolean login_status= userService.fresh_status_login(requestMap);
//                if(login_status){
//                    resultMap=CommonClass2Map("success",mUser);
//                }else{
//                    resultMap.put("result","error");
//                }
//            }
//        }catch (Exception e){
//            System.out.println("查询异常:"+e.getMessage());
//            resultMap.put("result","error");
//        }
//
//        System.out.println("Server_running_login_Map:\n"+resultMap.toString());
//        return resultMap;
//    }
//
//    /**
//     * 登出接口
//     * @param account
//     * @param password
//     * @param request
//     * @return
//     */
//    @RequestMapping( "/logout")
//    public Map Logout(@RequestParam("account") String account, @RequestParam("password") String password,
//                      HttpServletRequest request){
//        Map<String,Object> resultMap=new HashMap<>();
//        Map<String,Object> requestMap=new HashMap<>();
//        requestMap.put("account",account);
//        String mEncryPwd = Pwd3DESUtil.encode3Des(PASSWORD_EncryKEY, password);
//        requestMap.put("password",mEncryPwd);
//        requestMap.put("status",0);
//        try{
//            if((userService.infoQuery(requestMap).getmStatus()==1)){
//                boolean logout= userService.fresh_status_logout(requestMap);
//                if(logout){
//                    resultMap.put("result","success");
//                }else{
//                    System.out.println("登出异常:"+logout);
//                    resultMap.put("result","error");
//                }
//            }else{
//                System.out.println("登出异常:尚未登录");
//                resultMap.put("result","unlogin");
//            }
//        }catch (Exception e){
//            System.out.println("登出异常:"+e.getMessage());
//            resultMap.put("result","error");
//        }
//
//        return resultMap;
//    }
//
//    /**
//     * 注册接口
//     * @param name
//     * @param account   账户
//     * @param password  密码
//     * @return
//     */
//    @RequestMapping("/register")
//    public Map Register(@RequestParam("name") String name,
//                        @RequestParam("account") String account,@RequestParam("password") String password){
//        System.out.println("Request_name="+name+"___account="+account+"___password="+password);
//        Map<String,Object> resultMap=new HashMap<>();
//        Map<String,Object> requestMap=new HashMap<>();
//
//        requestMap.put("head",mHand);
//        requestMap.put("name",name);
//        requestMap.put("account",account);
//        requestMap.put("sex","男");
//        //对密码加密
//        String mEncryPwd = Pwd3DESUtil.encode3Des(PASSWORD_EncryKEY, password);
//        requestMap.put("password",mEncryPwd);
//
//        //若未存在，写入数据库返回Json
//        if((userService.infoQuery(requestMap)==null)){
//            boolean regKey= userService.register(requestMap);
//            if(regKey){
//                System.out.println("注册成功:"+regKey);
//                try{
//                    mUser= userService.infoQuery(requestMap);
//                    resultMap=CommonClass2Map("success",mUser);
//
//                    //System.out.println("__写入Key："+acount);
//                    redisTemplate.opsForHash().putAll(account,resultMap);//写入Redis
//                    redisTemplate.expire(account,5, TimeUnit.MINUTES);
//                }catch (Exception e){
//                    System.out.println("查询异常——mUser is:"+e.getMessage());
//                    resultMap.put("result","false");
//                }
//            }
//            return resultMap;
//        }else{
//            //若已存在，返回false
//            resultMap.put("result", "false");
//            return resultMap;
//        }
//    }
//
//    /**
//     * 注册校验、账户获取信息
//     * @param account 账户信息
//     * @return
//     */
//    @RequestMapping("/queryinfo")
//    public Map RegiQuery(@RequestParam("account") String account){
//        Map<String,Object> resultMap=new HashMap<>();
//        Map<String,Object> requestMap=new HashMap<>();
//        requestMap.put("account",account);
//        try{
//            mUser= userService.infoQuery(requestMap);
//            if(!(mUser.equals(null))){
//                //表示账户已注册
//                resultMap.put("id",mUser.getmId());
//                resultMap.put("head",mUser.getmHead());
//                resultMap.put("name",mUser.getmName());
//                resultMap.put("account",mUser.getmAccount());
//                resultMap.put("password",mUser.getmPassword());
//                resultMap.put("sex",mUser.getmSex());
//                resultMap.put("phone",mUser.getmPhone());
//                resultMap.put("email",mUser.getmEmail());
//                resultMap.put("gptNum",mUser.getmGptNum());
//                resultMap.put("level",mUser.getmLevel());
//            }else
//                resultMap.put("result","UnRegister");
//        }catch (Exception e){
//            System.out.println("查询异常_尚未注册:"+e.getMessage());
//            resultMap.put("result","UnRegister");
//        }
//        return resultMap;
//    }
//
//    @RequestMapping("/fuzzyQuery/name")
//    public List<UserInfo> FuzzyQuery(@RequestParam("name") String name){
//        List<UserInfo> mList= userService.fuzzyQuery(name);
//        return mList;
//    }
//
//    @RequestMapping("/doGptTrans")
//    public Map UpGptNum(@RequestParam("account") String account){
//        Map<String,Object> resultMap=new HashMap();
//        Map<String,Object> requestMap=new HashMap<>();
//        requestMap.put("account",account);
//        UserInfo temp= userService.infoQuery(requestMap);
//        if(temp!=null){
//            Map<String,Object> upMap=new HashMap<>();
//            upMap.put("account",temp.getmAccount());
//            upMap.put("password",temp.getmPassword());
//            upMap.put("gptnum",temp.getmGptNum()-1);
//            if(temp.getmGptNum()>0){
//                try{
//                    boolean upConfirm= userService.upgptnumber(upMap);
//                    if(upConfirm){
//                        UserInfo resultClass= userService.infoQuery(requestMap);
//                        System.out.println("有权限,update成功:");
//                        resultMap=CommonClass2Map("Permission",resultClass);
//                    }else{
//                        /**更新失败**/
//                        System.out.println("有权限,update失败:");
//                        resultMap=CommonClass2Map("error",temp);
//                    }
//                }catch (Exception e){
//                    System.out.println("update异常:"+e.getMessage());
//                    resultMap=CommonClass2Map("error",temp);
//                }
//            }else{
//                System.out.println("没有权限");
//                resultMap=CommonClass2Map("NullPermission",temp);
//            }
//        }
//        return resultMap;
//    }
//
//    @RequestMapping("/update_gpt_num")
//    public Map Update_Gpt_Num(@RequestParam("account") String account){
//
//        Map<String,Object> resultMap=new HashMap();
//        Map<String,Object> requestMap=new HashMap<>();
//        requestMap.put("account",account);
//        UserInfo temp= userService.infoQuery(requestMap);
//        if(temp!=null&&temp.getmStatus()==1){
//            Map<String,Object> upMap=new HashMap<>();
//            upMap.put("account",temp.getmAccount());
//            upMap.put("password",temp.getmPassword());
//            upMap.put("gptnum",1);
//            try{
//                boolean upConfirm= userService.upgptnumber(upMap);
//                if(upConfirm){
//                    UserInfo resultClass= userService.infoQuery(requestMap);
//                    resultMap=CommonClass2Map("success",resultClass);
//                    System.out.println("update成功");
//                }else{
//                    System.out.println("update异常_更新失败");
//                    resultMap=CommonClass2Map("error",temp);
//                }
//            }catch (Exception e){
//                System.out.println("update异常:"+e.getMessage());
//                resultMap=CommonClass2Map("error",temp);
//            }
//        }else{
//            System.out.println("update异常_用户未登录");
//            resultMap=CommonClass2Map("error",temp);
//        }
//        return resultMap;
//    }
//
//    @RequestMapping("/upHead")
//    public Map UpHead(@RequestParam("account") String account,@RequestParam("file") MultipartFile file){
//        Map<String,Object> resultMap=new HashMap();
//        Map<String,Object> requestMap=new HashMap<>();
//        System.out.println("传输的文件:"+file.getOriginalFilename());
//        //String filename = file.getOriginalFilename();//获取上传文件名
//        requestMap.put("account",account);
//        UserInfo temp= userService.infoQuery(requestMap);
//        if(temp!=null){
//            String filename=temp.getmName()+file.getOriginalFilename()
//                    .substring(file.getOriginalFilename().lastIndexOf("."));
//            String origin_head=temp.getmHead();
//            String origin_head_name=origin_head.substring(10,origin_head.length());
//            System.out.println(TimeUtil.GetTime(true)+"\t原有的文件名:"+origin_head_name);
//            if(!(filename.equals(origin_head_name))){
//                /**文件不同名,包括后缀名,删除**/
//                //System.out.println(TimeTool.GetTime(true)+"\t文件同名");
//                ImageFileIOUtil.deleteImage(system_Path,user_info_Path,origin_head_name);
//            }
//            boolean save=ImageFileIOUtil.writeImage(system_Path,user_info_Path,filename,file);
//            if(save){
//                requestMap.put("head",user_info_Path+filename);
//                boolean upHead= userService.fresh_head(requestMap);
//                if(upHead){
//                    System.out.println("更新成功");
//                    UserInfo resultClass= userService.infoQuery(requestMap);
//                    resultMap=CommonClass2Map("success",resultClass);
//                }else{
//                    System.out.println("更新数据库异常");
//                    resultMap=CommonClass2Map("error",temp);
//                }
//            }else{
//                //文件写入失败
//                resultMap=CommonClass2Map("error",temp);
//            }
//
//        }else{
//            resultMap=CommonClass2Map("error",temp);
//        }
//        return resultMap;
//    }
//
//
//    /***
//     * 返回公共类方法
//     * @param result
//     * @param temp
//     * @return
//     */

    public Map CommonClass2Map(UserInfo temp){
        Map<String,Object> tempMap=new HashMap();
        tempMap.put("id",temp.getmId());
        tempMap.put("head",temp.getmHead());
        tempMap.put("name",temp.getmName());
        tempMap.put("account",temp.getmAccount());
        tempMap.put("password",temp.getmPassword());
        tempMap.put("sex",temp.getmSex());
        tempMap.put("phone",temp.getmPhone());
        tempMap.put("email",temp.getmEmail());
        //tempMap.put("gptNum",temp.getmGptNum());
        if(temp.getmLevel()==1){
            tempMap.put("level","管理员");
        }else{
            tempMap.put("level","用户");
        }
        tempMap.put("status",temp.getmStatus());
        tempMap.put("ip",temp.getmAddressIp());
        return tempMap;
    }

    public UserInfo freshUserInfo(HttpSession session,Model model){
        Object currentUserObj = session.getAttribute("current_user");
        if (currentUserObj instanceof Map) {
            Map<String, String> currentUserMap = (Map<String, String>) currentUserObj;
            String account = currentUserMap.get("account");
            String password = currentUserMap.get("password");

            Map<String,Object> map=new HashMap<>();
            map.put("account",account);
            map.put("password",password);
            //System.out.println("刷新用户信息session:"+session.getAttribute("current_user"));
            System.out.println("刷新用户信息:"+map.toString());
            return userService.infoQuery(map);
        } else {
            System.out.println("The attribute 'current_user' is not a Map.");
            return null;
        }
    }

    /**
     * 订单数据逻辑
     * @return
     */
    public Map indexDataMap(){
        Map<String,Object> indexMap=new HashMap<>();
        int allOrderCount=orderService.getAllCount();//全部订单
        int tradingOrderCount=orderService.getTradingCount();//交易订单总数
        int notTradingOrderCount=orderService.getNotTradingCount();//未交易订单总数
        String valid=ComputePercent((tradingOrderCount/(float)allOrderCount)*100);//有效订单百分比
        int sumTradingPrice=orderService.sumTradingPrice();//金额总和
        int nearMonthCount=orderService.getNearMonthCount();//近一月订单
        int nearMonthTradingPrice=orderService.getNearMonthTradingPrice();//近一月销售金额
        String nearMonthValid=ComputePercent((nearMonthCount/(float)tradingOrderCount)*100);//近一月有效订单百分比
        String nearPriceValid=ComputePercent((nearMonthTradingPrice/(float)sumTradingPrice)*100);//近一月有效金额百分比

        indexMap.put("AllOrderCount",allOrderCount);
        indexMap.put("TradingOrderCount",tradingOrderCount);
        indexMap.put("NotTradingOrderCount",notTradingOrderCount);
        indexMap.put("TradingPrice",sumTradingPrice);
        indexMap.put("Valid",valid);
        indexMap.put("UserCount",userService.getUserCount());
        indexMap.put("OnlineCount",userService.getUserOnlineCount());
        indexMap.put("NearMonthCount",nearMonthCount);
        indexMap.put("NearMonthTradingPrice",nearMonthTradingPrice);
        indexMap.put("NearMonthValid",nearMonthValid);
        indexMap.put("NearPriceValid",nearPriceValid);
        indexMap.put("NearMonAllTrading",getMonAllTradingData(false));//月全订单
        indexMap.put("NearMonValidTrading",getMonAllTradingData(true));//月有效订单
        //indexMap.put("AllTradingList",orderService.getAllTradingView());
        //orderMap.put("AllOrderList",orderService.orderQueryAll());
        return indexMap;
    }

    /**
     * 产品数据逻辑
     * @return
     */
    public Map ProductMap(){
        Map<String,Object> productMap=new HashMap<>();
        productMap.put("ProductList",orderService.getAllProduct());
        return productMap;
    }

    /**
     * 消息数据逻辑
     * @return
     */
    public Map MessageMap(){
        Map<String,Object> messageMap=new HashMap<>();
        List<MessageView> messageList=orderService.getCurrentMessage();
        messageMap.put("AnnouncementList",messageList);
        return messageMap;
    }

    /**
     * 刷新session
     * @param session
     * @param sessionKey
     * @param map
     */
    public void freshSession(HttpSession session,String sessionKey,Map<String,Object> map){
        session.setAttribute(sessionKey,map);
    }

    /**
     * 百分比计算
     * @param number
     * @return
     */
    public String ComputePercent(float number){
        /**
         * 创建DecimalFormat对象
         * 并使用格式字符串#.00指定保留两位小数
         */
        DecimalFormat df = new DecimalFormat("#.00");
        String formatNum = df.format(number)+"%";
        return formatNum;
    }

    /**
     * * 获取当前:
     * 月全订单数、有效订单数
     * @param allType 有效订单true、全订单标识false
     * @return
     */
    public List getMonAllTradingData(boolean allType){
        List<MonthCountView> listView = null;
        if(allType){
            listView=orderService.getMonthTradingView();//月有效订单
        }else{
            listView=orderService.getMonthView();//月全订单
        }
        List resultList=new ArrayList();
        if(listView.size()>0){
            int year = TimeUtil.setTime(listView.get(0).getmTime()).getYear();
            int month = TimeUtil.setTime(listView.get(0).getmTime()).getMonthValue();
            int day = TimeUtil.setTime(listView.get(0).getmTime()).getDayOfMonth();
            if(day>0){
                for(int x=1;x<day;x++){
                    resultList.add("[gd("+year+","+month+","+x+"),"+0+"]");
                }
            }
            //System.out.println("日期补全:\n"+temp.size()+"\t"+temp.toString());
            for(int i=0;i<listView.size();i++){
                //resultList.add("[gd("+list.get(i).getmTime().replaceAll("-",",")+"),"+list.get(i).getmCount()+"]");
                resultList.add("[gd("+TimeUtil.setTime(listView.get(i).getmTime()).getYear()+","+
                        TimeUtil.setTime(listView.get(i).getmTime()).getMonthValue()+","+
                        TimeUtil.setTime(listView.get(i).getmTime()).getDayOfMonth()+"),"+listView.get(i).getmCount()+"]");
            }
            //System.out.println("订单temp:\n"+temp.size()+"\t"+temp.toString());
            int monEndDay=Month.of(month).length(TimeUtil.LeapYearChecker(listView.get(0).getmTime()));
            int end_day=TimeUtil.setTime(listView.get(listView.size()-1).getmTime()).getDayOfMonth();
            //System.out.println("monEndDay:"+monEndDay+"\t"+"end_day:"+end_day);
            if(end_day<monEndDay){
                for(int z=end_day+1;z<monEndDay+1;z++){
                    resultList.add("[gd("+year+","+month+","+z+"),"+0+"]");
                }
            }
            System.out.println("订单temp:\n"+resultList.size()+"\t"+resultList.toString());
        }
        return resultList;
    }

    /**
     * 测试加密
     * @param password
     * @return
     */
    @RequestMapping("/test_password")
    public Map TestPassword(@RequestParam String password){
        Map<String,String> resultMap=new HashMap<>();
        //对密码加密
        String mEncryPwd = Pwd3DESUtil.encode3Des(PASSWORD_EncryKEY, password);
        System.out.println("加密前：\n"+password+"\n加密后：\n"+mEncryPwd);
        System.out.println("\nServer_running___"+resultMap.toString());
        return resultMap;
    }
    @RequestMapping("/test")
    public void Test(){
        float valid=(2/(float)3)*100;
        DecimalFormat df = new DecimalFormat("#.00");//创建DecimalFormat对象,并使用格式字符串#.00指定保留两位小数
        String formattedValue = df.format(valid);
        System.out.println("百分比:"+formattedValue);

        //System.out.println("月全订单数据:"+getMonAllTradingData().toString());

//        orderMap.put("AllTradingList",orderService.getAllTradingView());
//        orderMap.put("AllOrderList",orderService.orderQueryAll());
        List<Product> test1=orderService.getAllProduct();
        List<OrderInfo> test2=orderService.orderQueryAll();
        System.out.println("test1:"+test1.size()+"\t"+test1.toString());
        System.out.println("test2:"+test2.size()+"\t"+test2.toString());

//        Map<String,Object> testMap=new HashMap<>();
//        testMap.put("AllTradingList",orderService.getAllTradingView());
//        testMap.put("AllOrderList",orderService.orderQueryAll());
//        System.out.println("testMap:"+testMap.toString());

        //生成订单
        System.out.println("随机生成的订单号: " + OrderNumberUtil.randOrderNumber());


    }

    @RequestMapping("/IndexPage")
    public String IndexPage(HttpServletRequest request,HttpSession session,Model model){
        if (session != null && session.getAttribute("current_user") != null) {
            // Session不为空且包含"userId"属性，表示用户已登录
            //System.out.println("主页用户session消息message:\t"+session.getAttribute("current_user"));
            mUser=freshUserInfo(session,model);
            if(mUser!=null){
                model.addAttribute("message", CommonClass2Map(mUser));
                session.setAttribute("current_user",model.getAttribute("message"));
            }else{
                model.addAttribute("message", session.getAttribute("current_user"));
            }
            model.addAttribute("index_message",indexDataMap());
            System.out.println("主页用户消息message:\t"+model.getAttribute("message"));
            session.setAttribute("index_message",model.getAttribute("index_message"));
            return "index";
        } else {
            // Session为空或不包含"userId"属性，表示用户未登录
            System.out.println("用户未登录");
            return "redirect:/Restaurant/loginPage";
        }
    }

    @RequestMapping("/loginPage")
    public String LoginPage(HttpServletRequest request,Model model){
        return "login";
    }
    @RequestMapping("/registerPage")
    public String registerPage(HttpServletRequest request,Model model){
        return "register";
    }

    @RequestMapping("/helpCenterPage")
    public String helpCenter(HttpServletRequest request,Model model,HttpSession session){
        if (session != null && session.getAttribute("current_user") != null) {

            model.addAttribute("message", session.getAttribute("current_user"));
            model.addAttribute("index_message", session.getAttribute("index_message"));
        }
        return "helpCenter";
    }
    @RequestMapping("/userinfoPage")
    public String UserInfoPage(HttpServletRequest request,Model model,HttpSession session){
        if (session != null && session.getAttribute("current_user") != null) {
            mUser=freshUserInfo(session,model);
            if(mUser!=null){
                model.addAttribute("message", CommonClass2Map(mUser));
                session.setAttribute("current_user",model.getAttribute("message"));
            }else{
                model.addAttribute("message", session.getAttribute("current_user"));
            }

            //model.addAttribute("message", session.getAttribute("current_user"));
            model.addAttribute("index_message", session.getAttribute("index_message"));
        }
        return "infoPage";
    }

    @RequestMapping("/OrderManagerPage")
    public String OrderManagerPage(HttpServletRequest request,Model model,HttpSession session,
                                   @RequestParam(defaultValue = "1") int pageNum,
                                   @RequestParam(defaultValue = "6") int pageSize){
        if (session != null && session.getAttribute("current_user") != null) {
            // Session不为空且包含"userId"属性，表示用户已登录
            model.addAttribute("message", session.getAttribute("current_user"));
        }
        return "orderManage";
    }
    @RequestMapping("/ProductPage")
    public String ProductPage(HttpServletRequest request,Model model,HttpSession session){
        if (session != null && session.getAttribute("current_user") != null) {
            // Session不为空且包含"userId"属性，表示用户已登录
            model.addAttribute("message", session.getAttribute("current_user"));
        }
        return "product";
    }
    @RequestMapping("/CommonMessagePage")
    public String CommonMessagePage(HttpServletRequest request,HttpSession session,Model model){
        if (session != null && session.getAttribute("current_user") != null) {
            // Session不为空且包含"userId"属性，表示用户已登录
            model.addAttribute("message", session.getAttribute("current_user"));
            //model.addAttribute("Announcement_message",MessageMap());
            //session.setAttribute("Announcement_message",model.getAttribute("Announcement_message"));
            //System.out.println("CommonMessagePage消息数据Announcement_message:"+session.getAttribute("Announcement_message"));
        }
        return "commonMessage";
    }

    @RequestMapping("/freshOrderPage")
    public ResponseEntity<Object> freshOrderPage(HttpServletRequest request,Model model,HttpSession session,
                                                   @RequestParam(defaultValue = "1") int pageNum,
                                                   @RequestParam(defaultValue = "6") int pageSize){
        PageInfo<OrderInfo> pageInfo = orderService.getPageAllOrder(pageNum, pageSize);
        if(pageInfo!=null){
            System.out.println("freshOrderPage返回的数据:"+pageInfo);
            return ResponseEntity.ok(pageInfo);
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed");
        }
    }

    @RequestMapping("/freshTradingViewPage")
    public ResponseEntity<Object> freshTradingViewPage(HttpServletRequest request,Model model,HttpSession session,
                                                 @RequestParam(defaultValue = "1") int pageNum,
                                                 @RequestParam(defaultValue = "6") int pageSize){
        PageInfo<AllTradingView> pageInfo = orderService.getTradingView(pageNum, pageSize);
        if(pageInfo!=null){
            System.out.println("freshTradingViewPage返回的数据:"+pageInfo);
            return ResponseEntity.ok(pageInfo);
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed");
        }
    }

    @RequestMapping("/freshProductPage")
    public ResponseEntity<Object> freshProductPage(HttpServletRequest request,Model model,HttpSession session,
                                                @RequestParam(defaultValue = "1") int pageNum,
                                                @RequestParam(defaultValue = "6") int pageSize){
        PageInfo<Product> pageInfo = orderService.getPageProduct(pageNum, pageSize);
        if(pageInfo!=null){
            //return pageInfo;
            //model.addAttribute("product_message", pageInfo);
            //session.setAttribute("product_message",model.getAttribute("product_message"));
            //return ResponseEntity.ok("success"+model.getAttribute("product_message"));
            System.out.println("freshProductPage返回的数据:"+pageInfo);
            return ResponseEntity.ok(pageInfo);
        }else{
            //model.addAttribute("product_message", session.getAttribute("product_message"));
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed");
            //return new PageInfo<Product>((List<Product>) session.getAttribute("product_message"));
        }
    }
    @RequestMapping("/freshMessagePage")
    public ResponseEntity<Object> freshMessagePage(HttpServletRequest request,Model model,HttpSession session,
                                                 @RequestParam(defaultValue = "1") int pageNum,
                                                 @RequestParam(defaultValue = "5") int pageSize){
        PageInfo<MessageView> pageInfo = orderService.getMessage(pageNum, pageSize);
        if(pageInfo!=null){
            System.out.println("freshMessagePage返回的数据:"+pageInfo);
            return ResponseEntity.ok(pageInfo);
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed");
        }
    }
    @RequestMapping("/addMessage")
    public ResponseEntity<Object> addMessage(HttpServletRequest request,Model model,HttpSession session,
                                             @RequestParam("title") String title, @RequestParam("content") String content,
                                             @RequestParam("publisher") String publisher,
                                             @RequestParam("createTime") String createTime){
        //System.out.println("请求内容:"+title+","+content+","+publisher+","+createTime);
        Map<String,Object> messageMap=new HashMap<>();
        messageMap.put("title",title);
        messageMap.put("content",content);
        messageMap.put("publisher",publisher);
        messageMap.put("createTime",createTime);
        boolean result=orderService.add_message(messageMap);
        if(!result){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed");
        }
        return ResponseEntity.ok("success");
    }



    @RequestMapping("/login")
    public String Login(@RequestParam("account") String account, @RequestParam("password") String password,
                     HttpServletRequest request,Model model,HttpSession session){
        Map<String,Object> resultMap=new HashMap<>();
        Map<String,Object> requestMap=new HashMap<>();
        requestMap.put("account",account);
        //对密码解密
        String mEncryPwd = Pwd3DESUtil.encode3Des(PASSWORD_EncryKEY, password);
        requestMap.put("password",mEncryPwd);
        requestMap.put("status",1);
        /**显示ip**/
        String currentIp= IPUtil.getIpAddress(request);
        //System.out.println("IP:"+currentIp);
        requestMap.put("addressIp",currentIp);

        /** 查询缓存是否存在
         * 否则查询数据库，写入Redis缓存
         * */
//        BoundHashOperations hashOps = redisTemplate.boundHashOps(account);
//        if(hashOps.entries().size()>0){
//            //System.out.println("Redis not null");
//            resultMap=hashOps.entries();
//        } else{
//            //System.out.println("Redis is null");
//            try{
//                mUser=userService.login(requestMap);
//                resultMap=CommonClass2Map("success",mUser);
//
//                //System.out.println("__写入Redis缓存Key："+acount);
//                redisTemplate.opsForHash().putAll(account,resultMap);//写入Redis
//                redisTemplate.expire(account,5, TimeUnit.MINUTES);
//            }catch (Exception e){
//                System.out.println("查询异常——mUser is:"+e.getMessage());
//                resultMap.put("result","error");
//            }
//        }
        try{
            mUser= userService.login(requestMap);
            if(mUser.getmStatus()!=0){
                /*
                if(mUser.getmAddressIp()!=currentIp){
                    System.out.println("两次登录ip不一致"+mUser.getmAddressIp()+currentIp);
                }
                */
                resultMap.put("result","login_lock");
                return "login";
            }else{
                boolean login_status= userService.fresh_status_login(requestMap);
                if(login_status){
                    resultMap=CommonClass2Map(mUser);
                    //freshSession(session,"current_user",resultMap);
                    session.setAttribute("current_user",resultMap);
                    return "redirect:/Restaurant/IndexPage";//重定向到主页
                }else{
                    resultMap.put("result","error");
                    return "login";
                }
            }
        }catch (Exception e){
            System.out.println("查询异常:"+e.getMessage());
            resultMap.put("result","error");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String SignOut(HttpServletRequest request,HttpSession session,Model model){
        //System.out.println("用户信息:"+session.getAttribute("current_user").getClass());//java.util.HashMap
        if (session != null && session.getAttribute("current_user") != null) {
            Map<String, Object> requestMap=(Map) session.getAttribute("current_user");
            //System.out.println("用户信息:"+requestMap.get("account"));
            requestMap.put("status",0);
            //System.out.println("登出请求Map:"+requestMap.toString());
            //String mEncryPwd = Pwd3DESUtil.encode3Des(PASSWORD_EncryKEY, password);
            //requestMap.put("password",mEncryPwd);
            try{
                if((userService.infoQuery(requestMap).getmStatus()==1)){
                    boolean logout= userService.fresh_status_logout(requestMap);
                    if(logout){
                        session.invalidate(); //使当前session失效
                        return "redirect:/Restaurant/loginPage";
                    }else{
                        System.out.println("登出异常:"+logout);
                        return "";
                    }
                }else{
                    System.out.println("登出异常:尚未登录");
                    return "";
                }
            }catch (Exception e){
                System.out.println("登出异常:"+e.getMessage());
                return "";
            }
            //session.invalidate(); //使当前session失效
            //session.removeAttribute("attributeName"); // 移除名为"attributeName"的属性
        }
        return "";
    }

    @RequestMapping("/update_order")
    public ResponseEntity<String> UpOrder(@RequestBody Map<String, Object> order_data, HttpServletRequest request,
                                          Model model, HttpSession session){
        System.out.println("订单修改数据:"+order_data.toString());
        boolean fresh_result=orderService.freshOrder(order_data);
        if(fresh_result){
            return ResponseEntity.ok("success");
        }else{
            return ResponseEntity.ok("error");
        }
    }
    @RequestMapping("/update_product_info")
    public ResponseEntity<String> UpProductInfo(@RequestBody Map<String, Object> requestBody, HttpServletRequest request,
                                          Model model, HttpSession session){
        System.out.println("订单修改数据:"+requestBody.toString());
        boolean fresh_result=orderService.up_product_Info(requestBody);
        if(fresh_result){
            return ResponseEntity.ok("success");
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed");
        }
        //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed");
    }

    @RequestMapping("/upload_user_head")
    public ResponseEntity<String> handleHeadUpload(@RequestParam("image") MultipartFile file,
                                                   @RequestParam("account") String account,
                                                   @RequestParam("name") String name,
                                                   HttpSession session,Model model) throws IOException{
        System.out.println("上传用户头像:"+account+"___"+name);
        if (file.isEmpty()) {
            return new ResponseEntity<>("请选择图片.", HttpStatus.BAD_REQUEST);
        }
        String image_suffix=ImageFileIOUtil.getSuffix(file);//后缀
        //String imageName=name+"_"+TimeUtil.formatTime(TimeUtil.GetTime(true))+"."+image_suffix;
        String imageName=name+"."+image_suffix;
        String result=ImageFileIOUtil.writeImageResized(imageName,root_dir,user_dir,file);

        Map<String, Object> user_headMap=new HashMap<>();
        user_headMap.put("head","/"+user_dir+imageName);
        user_headMap.put("account",account);
        if(result=="success"&&userService.fresh_head(user_headMap)){
            return ResponseEntity.ok("success");
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed:" + result);
        }
    }

    @RequestMapping("/upload_user_info")
    public ResponseEntity<String> handleUpUserInfo(@RequestParam("account") String account,
                                                   @RequestParam("name") String name,
                                                   @RequestParam("phone") String phone,
                                                   @RequestParam("email") String email,
                                                   HttpSession session,Model model){
        System.out.println("更新信息:"+account+name+phone+email);
        Map<String,Object> map=new HashMap<>();
        map.put("account",account);
        map.put("name",name);
        map.put("phone",phone);
        map.put("email",email);
        if(userService.fresh_segment_info(map)){
            //freshSession(session,"current_user",);
            return ResponseEntity.ok("success");
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed:");
        }
        //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed:");
    }

    @RequestMapping("/upload_product_head")
    public ResponseEntity<String> handleFileUpload(@RequestParam("image") MultipartFile file,
                                                   @RequestParam("pName") String pName,
                                                   @RequestParam("pShopper") String pShopper,
                                                   HttpSession session,Model model) throws IOException{
        System.out.println("上传图片:"+pName+"___"+pShopper);
        if (file.isEmpty()) {
            return new ResponseEntity<>("请选择图片.", HttpStatus.BAD_REQUEST);
        }
        // 获取文件原始名称
        String originalFileName = file.getOriginalFilename();
        String image_suffix=originalFileName.substring(originalFileName.lastIndexOf(".") + 1).toLowerCase();//后缀
        //String imageName=pName+"_"+pShopper+"_"+TimeUtil.formatTime(TimeUtil.GetTime(true))+"."+image_suffix;
        String imageName=pName+"_"+pShopper+"."+image_suffix;
        Map<String, Object> up_headMap=new HashMap<>();
        String result=ImageFileIOUtil.writeImageResized(imageName,root_dir,product_dir,file);
        up_headMap.put("pIcon","/"+product_dir+imageName);
        up_headMap.put("pName",pName);
        up_headMap.put("pShopper",pShopper);
        if(result=="success"&&orderService.up_product_Icon(up_headMap)){
            //freshSession(session,"order_message",indexDataMap());//更新订单Map
            //freshSession(session,"product_message",ProductMap());//更新产品Map
            return ResponseEntity.ok("success");
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed:" + result);
        }
    }

    @RequestMapping("/delete_product")
    public ResponseEntity<String> handleDeleteProduct(HttpSession session,Model model,
                                                      @RequestParam("id") String id){
        if(orderService.delete_product(id)){
            return ResponseEntity.ok("success");
        }else{
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failed:");
        }
    }

    @RequestMapping("/test_page")
    public String listProducts(Model model,HttpSession session, @RequestParam(defaultValue = "1") int pageNum,
                            @RequestParam(defaultValue = "6") int pageSize) {
        PageInfo<Product> productInfo = orderService.getPageProduct(pageNum, pageSize);
        PageInfo<OrderInfo> orderInfo = orderService.getPageAllOrder(pageNum, pageSize);
        model.addAttribute("product_message", productInfo);
        model.addAttribute("order_message", orderInfo);
        System.out.println("分页测试product_message:"+model.getAttribute("product_message")+"页数:"+pageNum+"___页内容:"+pageSize);
        System.out.println("分页测试order_message:"+model.getAttribute("order_message")+"页数:"+pageNum+"___页内容:"+pageSize);
        return "";
    }
}
