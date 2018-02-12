package com.web.controller;

import com.web.dao.FilmDAO;
import com.web.entity.Film;
import com.web.service.AdminService;
import com.web.service.GainService;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by 塞上江南果 on 2016/10/30.
 */
@Controller("AdminController")
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("home")
    public ModelAndView index(HttpServletRequest request)
    {
        return adminService.get_home("login");
    }

    @RequestMapping("login")
    public ModelAndView login(HttpServletRequest request)
    {
        String username = request.getParameter("uname");
        String password = request.getParameter("pwd");
        String number = request.getParameter("vcode");  //接收的验证码
        HttpSession session = request.getSession();
        String code = "";
        Object obj = session.getAttribute("code");
        if(obj != null)
            code = obj.toString();//真实验证码
        String fromPage = "redirect:/Admin/home";
        String toPage = "play";
        int flag= adminService.login(username, password,number,code);
        HttpSession session2=request.getSession();
        session2.setAttribute("Adminname",null);
        switch (flag){
            case 1:
                ModelAndView mav1 = new ModelAndView(fromPage);
                mav1.addObject("error", "用户名不存在");
                return mav1;
            case 2:
                ModelAndView mav2 = new ModelAndView(fromPage);
                mav2.addObject("error", "密码错误");
                return mav2;
            case 3:
                ModelAndView mav3 = new ModelAndView(fromPage);
                mav3.addObject("error", "验证码错误");
                return mav3;
            case 4:
                ModelAndView mav4 = new ModelAndView(toPage);
                session2.setAttribute("Adminname",username);
                List<Film> film = adminService.selectAll();
                mav4.addObject("film", film);
                return mav4;
            default:
                ModelAndView mav = new ModelAndView(fromPage);
                mav.addObject("error", "异常错误");
                return mav;
        }
    }

    @RequestMapping("getfilm")
    public ModelAndView getfilm(HttpServletRequest request)
    {
        String id=(String)request.getParameter("filmid");
        String toPage = "findPlay";

        return adminService.get_film(id,toPage);
    }
    @RequestMapping("toupdate")
    public ModelAndView toupdate(HttpServletRequest request)
    {
        String filmid=request.getParameter("filmid");
        String page="updatePlay";
        return adminService.to_update(filmid,page);
    }
    @RequestMapping("updatefilm")
    public ModelAndView updatefilm(HttpServletRequest request)
    {
        String Page="findPlay";
        ModelAndView mav = new ModelAndView(Page);
        String id=request.getParameter("playid");
        String film_type=request.getParameter("playtype");
        String file_status=request.getParameter("playstatus");
        String name=request.getParameter("playname");
        String lang=request.getParameter("playlang");
        String length=request.getParameter("playlength");
        String introduction=request.getParameter("playintroduce");
        String ticket_price=request.getParameter("playprice");
        String cover=request.getParameter("playpicture");
        int flag=adminService.update_film(id,film_type,file_status,name,lang,length,introduction,ticket_price,cover);
        Film film;
        if (flag>0){
            film=adminService.selectFilmFromId(Integer.parseInt(id));
            mav.addObject("film",film);
            mav.addObject("upmessage","update success");
            return mav;
        }
        film=adminService.selectFilmFromId(Integer.parseInt(id));
        mav.addObject("film",film);
        mav.addObject("upmessage","update failed");
        return mav;
    }
    @RequestMapping("deletefilm")
    public ModelAndView deletefilm(HttpServletRequest request)
    {
        String id=(String)request.getParameter("filmid");
        String toPage = "play";

        return adminService.delete_film(id,toPage);
    }
    @RequestMapping("insertfilm")
    public ModelAndView insertfilm(HttpServletRequest request)
    {
        String Page="addPlay";
        ModelAndView mav = new ModelAndView(Page);
        String film_type=request.getParameter("playtype");
        String file_status=request.getParameter("playstatus");
        String name=request.getParameter("playname");
        String lang=request.getParameter("playlang");
        String length=request.getParameter("playlength");
        String introduction=request.getParameter("playintroduce");
        String ticket_price=request.getParameter("playprice");
        String cover=request.getParameter("playpicture");
        int flag=adminService.insert_film(film_type,file_status,name,lang,length,introduction,ticket_price,cover);
        if (flag>0){
            mav.addObject("inmessage","insert success");
            return mav;
        }
        mav.addObject("inmessage","insert failed");
        return mav;
    }
    @RequestMapping("showAddPlay")
    public ModelAndView showAddPlay(HttpServletRequest request){
        String Page="addPlay";
        ModelAndView mav = new ModelAndView(Page);
        return mav;
    }

    @RequestMapping("getallfilm")
    public ModelAndView getallfilm(HttpServletRequest request){
        String page="play";
        return adminService.get_allfilm(page);
    }

    @RequestMapping("getallschedule")
    public ModelAndView getallschedule(HttpServletRequest request) {
        String page = "schedule";

        return adminService.get_allschedule(page);
    }

    @RequestMapping("insertschedule")
    public ModelAndView insertschedule(HttpServletRequest request)
    {

        String Page="addSchedule";
        ModelAndView mav = new ModelAndView(Page);
        int studio_id=Integer.parseInt(request.getParameter("studioid"));
        int film_id=Integer.parseInt(request.getParameter("filmid"));
        String  sche_time = request.getParameter("schetime");
        int sche_ticket_price=Integer.parseInt(request.getParameter("scheprice"));
        java.sql.Timestamp sqldate = java.sql.Timestamp.valueOf(sche_time);

        int flag=adminService.insert_schedule(Page, studio_id, film_id, sqldate, sche_ticket_price);
        if (flag>0){
            mav.addObject("inmessage","insert success");
            return mav;
        }
        mav.addObject("inmessage","insert failed");
        return mav;
    }
    @RequestMapping("showAddSchedule")
    public ModelAndView showAddSchedule(HttpServletRequest request){
        String Page="addSchedule";
        ModelAndView mav = new ModelAndView(Page);
        return mav;
    }
    @RequestMapping("deleteschedule")
    public ModelAndView deleteschedule(HttpServletRequest request)
    {
        String id=(String)request.getParameter("scheduleid");
        String toPage = "schedule";

        return adminService.delete_schedule(id,toPage);
    }
    @RequestMapping("getschedule")
    public ModelAndView getschedule(HttpServletRequest request) {
        String page = "updateSchedule";
        int scheduleid = Integer.parseInt(request.getParameter("scheduleid"));
        return adminService.get_schedule(scheduleid, page);
    }

    @RequestMapping("updateschedule")
    public ModelAndView updateschedule(HttpServletRequest request)
    {
        int schedule_id = Integer.parseInt(request.getParameter("scheduleid"));
        int studio_id = Integer.parseInt(request.getParameter("studioid"));
        int film_id = Integer.parseInt(request.getParameter("filmid"));
        Timestamp sche_time = Timestamp.valueOf(request.getParameter("schetime"));
        int sche_ticket_price = Integer.parseInt(request.getParameter("scheprice"));
        String toPage = "schedule";

        return adminService.update_schedule(schedule_id,toPage,studio_id, film_id, sche_time, sche_ticket_price);
    }
    @RequestMapping("findschedule")
    public ModelAndView findschedule(HttpServletRequest request) {
        String page = "findSchedule";
        int scheduleid = Integer.parseInt(request.getParameter("scheduleid"));
        return adminService.get_message(scheduleid, page);
    }



    @RequestMapping("getallstudio")
    public ModelAndView getallstudio(HttpServletRequest request)
    {
        String toPage = "studio";

        return adminService.get_allstudio(toPage);
    }

    @RequestMapping("insertstudio")
    public ModelAndView insertstudio(HttpServletRequest request)
    {
        String Page="add_studio";
        ModelAndView mav = new ModelAndView(Page);
        String name = request.getParameter("studioname");
        int studio_row_count = Integer.parseInt(request.getParameter("studiorows"));
        int studio_col_count = Integer.parseInt(request.getParameter("studiocols"));
        String studio_introduction = request.getParameter("studiointroduce");
        int studio_status = Integer.parseInt(request.getParameter("studiostutas"));
        int flag=adminService.insert_studio(name, studio_row_count,  studio_col_count, studio_introduction, studio_status);
        if (flag>0){
            mav.addObject("inmessage","insert success");
            return mav;
        }
        mav.addObject("inmessage","insert failed");
        return mav;
    }
    @RequestMapping("showAddStudio")
    public ModelAndView showAddStudio(HttpServletRequest request){
        String Page="add_studio";
        ModelAndView mav = new ModelAndView(Page);
        return mav;
    }

    @RequestMapping("deletestudio")
    public ModelAndView deletestudio(HttpServletRequest request)
    {
        String id=(String)request.getParameter("studioid");
        String toPage = "studio";

        return adminService.delete_studio(id,toPage);
    }
    @RequestMapping("updatestudio")
    public ModelAndView updatestudio(HttpServletRequest request)
    {
        int studio_id = Integer.parseInt(request.getParameter("studioid"));
        System.out.println(studio_id);
        String studio_name = request.getParameter("studioname");
        System.out.println(studio_name);
        int studio_rows = Integer.parseInt(request.getParameter("studiorows"));
        System.out.println(studio_rows);
        int studio_cols = Integer.parseInt(request.getParameter("studiocols"));
        int studio_stutas = Integer.parseInt(request.getParameter("studiostatus"));
        String studio_introduce = request.getParameter("studiointroduce");
        String toPage = "studio";
        System.out.println("123");

        return adminService.update_studio(studio_id,toPage,studio_name, studio_rows, studio_cols, studio_stutas, studio_introduce);
    }

    @RequestMapping("getstudio")
    public ModelAndView getstudio(HttpServletRequest request) {
        String page = "updateStudio";
        String studioid =request.getParameter("studioid");
        return adminService.get_studio(studioid, page);
    }

    @RequestMapping("findstudio")
    public ModelAndView findstudio(HttpServletRequest request) {
        String page = "findStudio";
        String studioid = request.getParameter("studioid");
        return adminService.get_studiomessage(studioid, page);
    }

    @RequestMapping("getseats")
    public ModelAndView getseats(HttpServletRequest request) {
        String page = "seat";
        int studioid = Integer.parseInt(request.getParameter("studioid"));
        return adminService.get_seats( page,studioid);
    }

    @RequestMapping("getusers")
    public ModelAndView getusers(HttpServletRequest request) {
        String page = "user";

        return adminService.get_users( page);
    }

    @RequestMapping("getsale")
    public ModelAndView getsale(HttpServletRequest request) {
        String page = "sale";

        return adminService.get_sale( page);
    }
    @RequestMapping("updateseat")
    public ModelAndView updateseat(HttpServletRequest request) {
        String page = "seat";
        String json = request.getParameter("seats");
        System.out.println("json"+ json);
        Integer studioid = Integer.parseInt(request.getParameter("studioid"));
        return adminService.update_seat(page,json,studioid);
    }

}
