package com.web.serviceImpl;

import com.web.dao.*;
import com.web.entity.*;
import com.web.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/12/3 0003.
 */
@Service("OrderServiceImpl")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;
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
    //放映时间，票价，电影名，电影图片，座位行列值，影厅名，订单状态
    public ModelAndView get_home(String page,String username){
        List<User> user=userDAO.selectUserFromName(username);
        int userid=user.get(0).getId();
        ModelAndView mav = new ModelAndView(page);
        List<Order> orders=new ArrayList<Order>();
        orders=orderDAO.selectAllOrderById(userid);
        List<Film> films=new ArrayList<Film>();
        List<Studio> studios=new ArrayList<Studio>();
        List<Seat> seats=new ArrayList<Seat>();
        List<Schedule> schedules=new ArrayList<Schedule>();
        for(Order order:orders){
            Film film=new Film();
            Studio studio=new Studio();
            Seat seat=new Seat();
            Schedule schedule=new Schedule();
            schedule=scheduleDAO.selectScheduleFromId(order.getSche_id());
            schedules.add(schedule);
            film=filmDAO.selectFilmFromId(schedule.getFilm_id());
            films.add(film);
            studio=studioDAO.selectStudioFromId(schedule.getStudio_id());
            studios.add(studio);
            seat=seatDAO.selectSeatFromId(order.getSeat_id());
            seats.add(seat);
        }
        mav.addObject("schedules",schedules);
        mav.addObject("films",films);
        mav.addObject("studios",studios);
        mav.addObject("seats",seats);
        mav.addObject("orders",orders);
        return mav;
    }

    public ModelAndView get_OrderformFromStatus(String order_status,String page,String username){
        List<User> user=userDAO.selectUserFromName(username);
        int userid=user.get(0).getId();
        ModelAndView mav = new ModelAndView(page);
        List<Order> orders=new ArrayList<Order>();
        orders=orderDAO.selectOrderFromOrderStatusById(Integer.parseInt(order_status),userid);
        List<Film> films=new ArrayList<Film>();
        List<Studio> studios=new ArrayList<Studio>();
        List<Seat> seats=new ArrayList<Seat>();
        List<Schedule> schedules=new ArrayList<Schedule>();
        for(Order order:orders){
            Film film=new Film();
            Studio studio=new Studio();
            Seat seat=new Seat();
            Schedule schedule=new Schedule();
            schedule=scheduleDAO.selectScheduleFromId(order.getSche_id());
            schedules.add(schedule);
            film=filmDAO.selectFilmFromId(schedule.getFilm_id());
            films.add(film);
            studio=studioDAO.selectStudioFromId(schedule.getStudio_id());
            studios.add(studio);
            seat=seatDAO.selectSeatFromId(order.getSeat_id());
            seats.add(seat);
        }
        mav.addObject("schedules",schedules);
        mav.addObject("films",films);
        mav.addObject("studios",studios);
        mav.addObject("seats",seats);
        mav.addObject("orders",orders);
        return mav;
    }
    public ModelAndView delete_Order(String id,String page,String username){
        ModelAndView mav;
        int flag=orderDAO.deleteOrderFromId(Integer.parseInt(id));
        mav=get_home(page,username);
        if(flag>0){
            mav.addObject("delmssage","delete success");
            return mav;
        }
        mav.addObject("delmssage","delete failed");
        return mav;
    }
    public int insert_Orderform(String user_id,String seat_id,String sche_id){
        Order orderform=new Order();
        orderform.setUser_id(Integer.parseInt(user_id));
        orderform.setSeat_id(Integer.parseInt(seat_id));
        orderform.setSche_id(Integer.parseInt(sche_id));
        orderform.setOrder_status(1);
        return orderDAO.insertOrder(orderform);
    }
//    public void update_OrderformFromOrderStatus(){
//
//    }
}
