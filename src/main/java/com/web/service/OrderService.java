package com.web.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2016/12/1 0001.
 */
public interface OrderService {
    public ModelAndView get_home(String page,String username);
    //调用get_home即可 public ModelAndView get_allOrderform(String page);
    public ModelAndView get_OrderformFromStatus(String order_status, String page,String username);
    public ModelAndView delete_Order(String id,String page,String username);
    public int insert_Orderform(String user_id, String seat_id, String sche_id);
    //public void update_OrderformFromOrderStatus();
}
