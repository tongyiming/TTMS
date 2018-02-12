package com.web.serviceImpl;

import com.web.dao.*;
import com.web.entity.*;
import com.web.service.GainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by TongYiMing on 2016/10/26.
 */

@Service("GainServiceImpl")
public class GainServiceImpl implements GainService{

    @Autowired
    private FilmDAO filmDAO;

    @Autowired
    private ScheduleDAO scheduleDAO;

    @Autowired
    private StudioDAO studioDAO;

    @Autowired
    private SeatDAO seatDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private OrderDAO orderDAO;


    public ModelAndView get_home(String page) {
        int num=4;
        List<Film> now_film = filmDAO.selectFilmFromFilmStatus(1,num,0);
        List<Film> films=filmDAO.selectAllFilmFromFilmStatus(1);
        int nowmax_page=films.size()%num==0 ? films.size()/num : films.size()/num+1;
        films=filmDAO.selectAllFilmFromFilmStatus(2);
        int thenmax_page=films.size()%num==0 ? films.size()/num : films.size()/num+1;
        ModelAndView mav = new ModelAndView(page);
        mav.addObject("now_film", now_film);
        mav.addObject("nowmax_page",nowmax_page);
        mav.addObject("thenmax_page",thenmax_page);
        return mav;
    }

    public ModelAndView get_film(String filmid,String page){
        Film film=filmDAO.selectFilmFromId(Integer.parseInt(filmid));
        List<Schedule> schedules=scheduleDAO.selectScheduleFromFilmId(Integer.parseInt(filmid));
        ModelAndView mav =new ModelAndView(page);
        mav.addObject("film",film);
        mav.addObject("schedules",schedules);
        return mav;
    }

    public ModelAndView buy_ticket(String scheduleid,String page){
            Schedule schedule = scheduleDAO.selectScheduleFromId(Integer.parseInt(scheduleid));
            Film film=filmDAO.selectFilmFromId(schedule.getFilm_id());
            Studio studio = studioDAO.selectStudioFromId(schedule.getStudio_id());
            List<Seat> seats=seatDAO.selectSeatFromStudioId(schedule.getStudio_id());
            ModelAndView mav = new ModelAndView(page);
            mav.addObject("film",film);
            mav.addObject("studio", studio);
            mav.addObject("seats",seats);
            mav.addObject("schedule",schedule);
            return mav;
    }

    public ModelAndView return_ticket(String id,String username,String scheduleid,String page)
    {
        String[] seatid=id.split("\\,");
        List<Seat> seats=new ArrayList<Seat>();
        Seat seat;
        int flag=0;
        for(int i=0;i<seatid.length;i++){
            seat=seatDAO.selectSeatFromId(Integer.parseInt(seatid[i]));
            seats.add(seat);
            seat.setSeat_status(3);	//更改为的座位状态
            seatDAO.updateSeatFromId(seat);
            seats.add(seat);
            //自动添加订单
            List<User> user=userDAO.selectUserFromName(username);
            int userid=user.get(0).getId();
            Order order=new Order();
            order.setUser_id(userid);
            order.setSeat_id(Integer.parseInt(seatid[i]));
            order.setSche_id(Integer.parseInt(scheduleid));
            order.setOrder_status(2);
            flag = orderDAO.insertOrder(order);
            if(flag<=0)     break;
        }

        Schedule schedule=scheduleDAO.selectScheduleFromId(Integer.parseInt(scheduleid));
        Film film=filmDAO.selectFilmFromId(schedule.getFilm_id());
        Studio studio=studioDAO.selectStudioFromId(schedule.getStudio_id());

        ModelAndView mav =new ModelAndView(page);
        if (flag>0){
            mav.addObject("inmessage","购买成功");
        }else{
            mav.addObject("inmessage", "出错了");
        }
        mav.addObject("seats",seats);
        mav.addObject("schedule",schedule);
        mav.addObject("film",film);
        mav.addObject("studio",studio);
        return mav;
    }
}
