package com.web.service;

import com.web.entity.Film;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by 塞上江南果 on 2016/10/30.
 */
public interface AdminService {
    public ModelAndView get_home(String page);
    public int login(String username, String password, String number,String code);
    public ModelAndView get_film(String filmid,String page);
    public int update_film(String id,String film_type,String file_status,String name,String lang,String length,String introduction,String ticket_price,String cover);
    public int insert_film(String film_type,String file_status,String name,String lang,String length,String introduction,String ticket_price,String cover);
    public ModelAndView delete_film(String filmid,String page);
    public ModelAndView to_update(String filmid,String page);
    public ModelAndView get_allfilm(String page);
    public ModelAndView get_schedule(int scheduleid, String page);
    public int insert_schedule(String page, int studio_id, int film_id, Timestamp sche_time, int sche_ticket_price);
    public ModelAndView delete_schedule(String scheduleid, String page);
    public ModelAndView update_schedule(int schedule_id, String page, int studio_id, int film_id, Timestamp sche_time, int sche_ticket_price);
    public ModelAndView get_allschedule(String page);
    public ModelAndView get_message(int scheduleid, String page);
    public ModelAndView get_studio(String studioid, String page);
    public ModelAndView get_allstudio(String page);
    public int insert_studio(String name, int studio_row_count, int studio_col_count, String studio_introduction, int studio_status);
    public ModelAndView delete_studio(String studioid, String page);
    public ModelAndView update_studio(int studio_id,String toPage,String studio_name, int studio_rows, int studio_cols, int studio_stutas, String studio_introduce);
    public ModelAndView get_studiomessage(String studioid, String page);
    public ModelAndView get_seats(String page, int studioid);
    public ModelAndView get_users(String page);
    public ModelAndView get_sale(String page);
    public ModelAndView update_seat(String page, String seat_json,int studioud);
    public Film selectFilmFromId(int id);
    public List<Film> selectAll();
    public List<Film> selectFilmFromFilmStatus(int file_status,int num,int start);
}
