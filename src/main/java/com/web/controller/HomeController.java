package com.web.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import com.web.entity.Film;
import com.web.dao.FilmDAO;
import com.web.entity.User;
import com.web.service.AdminService;
import com.web.service.GainService;
import com.web.service.OrderService;
import com.web.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by shiyi on 16/9/23.
 */


@Controller("HomeController")
@RequestMapping("/Home")
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private GainService gainService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AdminService adminService;

    @RequestMapping("then")
    public void then(HttpServletRequest request,HttpServletResponse response)
    {
        int thenstart=1;
        int num=4;
        if(request.getParameter("thenstart")!=null)
            thenstart = Integer.parseInt(request.getParameter("thenstart"));
        PrintWriter out=null;
        try {
            out = response.getWriter();
            List<Film> then_film = adminService.selectFilmFromFilmStatus(2,num,(thenstart-1)*num);
            ObjectMapper mapper = new ObjectMapper();
            String str = mapper.writeValueAsString(then_film);
            out.println(str);
            out.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @RequestMapping("now")
    public void now(HttpServletRequest request,HttpServletResponse response)
    {
        int nowstart=1;
        int num=4;
        if(request.getParameter("nowstart")!=null)
            nowstart = Integer.parseInt(request.getParameter("nowstart"));
        PrintWriter out=null;
        try {
            out = response.getWriter();
            List<Film> now_film = adminService.selectFilmFromFilmStatus(1,num,(nowstart-1)*num);
            ObjectMapper mapper = new ObjectMapper();
            String str = mapper.writeValueAsString(now_film);
            out.println(str);
            out.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @RequestMapping("home")
    public ModelAndView index(HttpServletRequest request)
    {
        return gainService.get_home("home");
    }

    @RequestMapping("index")
    public String index()
    {
        return "";
    }

    @RequestMapping("login")
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response)
    {
        PrintWriter out=null;
        try {
            out = response.getWriter();
        }catch (Exception e){
            e.printStackTrace();
        }
        String username = request.getParameter("uname");
        String password = request.getParameter("pwd");
        String number = request.getParameter("vcode");  //接收的验证码
        HttpSession session = request.getSession();
        String code = "";
        Object obj = session.getAttribute("code");
        if(obj != null)
            code = obj.toString();//真实验证码
        String fromPage = "redirect:/Home/home";
        return userService.login(fromPage,session,username, password,number,code);
    }
    @RequestMapping("register")
    public void register(HttpServletRequest request, HttpServletResponse response)
    {
        try {
            PrintWriter out = response.getWriter();
            String username = request.getParameter("username");
            System.out.println("username:"+username);
            String result = "no";
            if (username != null && !username.equals("")) {
                if(userService.selectUserFromName(username)) {
                    result = "yes";
                }
                out.write(result);
                out.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("insertuser")
    public ModelAndView insertuser(HttpServletRequest request)
    {
        String username = (String)request.getParameter("username");
        String password = (String)request.getParameter("pass");
        String fromPage = "tttt";	//error.jsp
        String toPage = "regSuccess";	//返回注册成功页面
        return userService.register(fromPage, toPage, username, password);
    }

    @RequestMapping("showfilm")
    public ModelAndView showfilm(HttpServletRequest request)
    {
        String id=(String)request.getParameter("now_id");
        String toPage = "buy_ticket";
        return gainService.get_film(id,toPage);
    }


    @RequestMapping("buyticket")
    public ModelAndView buyticket(HttpServletRequest request)
    {
        String scheduleid=request.getParameter("scheduleid");
        String page="choice_seat";
        return gainService.buy_ticket(scheduleid,page);
    }

    @RequestMapping("returnticket")
    public ModelAndView returnticket(HttpServletRequest request)
    {
        String fromPage = "tttt";
        String toPage = "order";
        HttpSession session=request.getSession();
        String name=(String) session.getAttribute("name");
        if(name==null)
        {
            ModelAndView mav = new ModelAndView(fromPage);
            mav.addObject("error", "请先登录");
            return mav;
        }
        String id=request.getParameter("seatid");
        String scheduleid=request.getParameter("scheduleid");
        return gainService.return_ticket(id,name,scheduleid,toPage);
    }

    @RequestMapping("gethome")
    public ModelAndView gethome(HttpServletRequest request){
        String username=(String) request.getSession().getAttribute("name");
        String page="ordercenter";
        return orderService.get_home(page,username);
    }

    @RequestMapping("deleteOrder")
    public ModelAndView deleteOrder(HttpServletRequest request){
        String username=(String) request.getSession().getAttribute("name");
        String page="ordercenter";
        String id=request.getParameter("orderid");
        return orderService.delete_Order(id,page,username);
    }

    @RequestMapping("getOrderformFromStatus")
    public ModelAndView get_OrderformFromStatus(HttpServletRequest request){
        String username=(String) request.getSession().getAttribute("name");
        String page="ordercenter";
        String order_status=request.getParameter("status");
        return orderService.get_OrderformFromStatus(order_status,page,username);
    }

    @RequestMapping("updateUser")
    public ModelAndView updateUser(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("usermessage");
        String paramName = "", paramValue = "";
        User user=(User) request.getSession().getAttribute("user");

        DiskFileItemFactory dff = new DiskFileItemFactory();
        dff.setSizeThreshold(1024000);
        ServletFileUpload sfu = new ServletFileUpload(dff);
        sfu.setFileSizeMax(1024 * 1024 * 2);
        try
        {
            List<FileItem> uploaditems = sfu.parseRequest(request);
            for (FileItem fileItem : uploaditems)
            {

                paramName = fileItem.getFieldName();
                if (fileItem.isFormField())
                {
                    paramValue=fileItem.getString();
                    if ("usercallphone".equals(paramName))
                        user.setCallphone(paramValue);
                }
                else
                {
                    String fileName = "C:\\Users\\Administrator\\Desktop\\TTMS\\target\\maven-springmvc\\";
                    fileName += fileItem.getName();
                    String fileName1 = request.getServletContext().getRealPath("/");
                    fileName1 += fileItem.getName();
//                    System.out.println(s+fileName);
                    //fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
                    //C:\Users\Administrator\Desktop\TTMS\src\main\webapp\WEB-INF\statics\images
                    System.out.println("路径:"+fileName);
                    File file = new File(fileName);
                    File file1 = new File(fileName1);
                    fileItem.write(file);
                    fileItem.write(file1);
                    user.setPicture(fileItem.getName());
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally {
            userService.updateUser(user);
        }
        return mav;
    }

}
