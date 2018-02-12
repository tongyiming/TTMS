package com.web.service;

import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;

/**
 * Created by TongYiMing on 2016/10/26.
 */
public interface GainService  {
    public ModelAndView get_home(String page);
    public ModelAndView get_film(String filmid,String page);
    public ModelAndView buy_ticket(String scheduleid,String page);
    public ModelAndView return_ticket(String id,String username,String scheduleid,String page);

}
