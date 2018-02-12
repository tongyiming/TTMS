package com.web.serviceImpl;
import com.web.dao.*;
import com.web.entity.*;
import com.web.service.AdminService;
import org.apache.ibatis.jdbc.Null;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.nio.IntBuffer;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by 塞上江南果 on 2016/10/30.
 */
@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private FilmDAO filmDAO;
    @Autowired
    private ScheduleDAO scheduleDao;
    @Autowired
    private StudioDAO studioDao;
    @Autowired
    private SeatDAO seatDao;
    @Autowired
    private UserDAO userDao;
    @Autowired
    private OrderDAO orderDao;
//    @Autowired
//    private AdminService adminService;
    public ModelAndView get_home(String page) {
        ModelAndView mav = new ModelAndView(page);
        return mav;
    }

    public int login(String username, String password, String number, String code) {

        if (!username.equals("1234")) {
            return 1;//"用户名不存在"
        }

        if (!password.equals("1234")) {
            return 2;//"密码错误"
        } else {
            number = number.toUpperCase();
            if (!code.equals(number)) {
                return 3;//"验证码错误"
            }
            return 4;//登陆成功
        }
    }

    public ModelAndView get_film(String filmid, String page) {
        ModelAndView mav = new ModelAndView(page);
        Film film = filmDAO.selectFilmFromId(Integer.parseInt(filmid));
        mav.addObject("film", film);
        return mav;
    }

    public ModelAndView to_update(String filmid, String page) {
        ModelAndView mav = new ModelAndView(page);
        Film film = filmDAO.selectFilmFromId(Integer.parseInt(filmid));
        mav.addObject("film", film);
        return mav;
    }

    public int update_film(String id, String film_type, String file_status, String name, String lang, String length, String introduction, String ticket_price, String cover) {
        Film film = new Film();
        film.setId(Integer.parseInt(id));
        film.setFilm_type(film_type);
        film.setFile_status(Integer.parseInt(file_status));
        film.setName(name);
        film.setLang(lang);
        film.setLength(Integer.parseInt(length));
        film.setIntroduction(introduction);
        film.setTicket_price(Integer.parseInt(ticket_price));
        film.setCover(cover);
        int falg = filmDAO.updateFilmFromId(film);
        return falg;
    }

    public ModelAndView delete_film(String filmid, String page) {
        ModelAndView mav = new ModelAndView(page);
        int flag = filmDAO.deleteFilmFromId(Integer.parseInt(filmid));
        List<Film> film;
        if (flag > 0) {
            film = filmDAO.selectAll();
            mav.addObject("film", film);
            for (Film f : film) {
                System.out.println(f.getName());
            }
            mav.addObject("delmssage", "delete success");
            return mav;
        }
        film = filmDAO.selectAll();
        mav.addObject("film", film);
        mav.addObject("delmssage", "delete failed");
        return mav;
    }

    public int insert_film(String film_type, String file_status, String name, String lang, String length, String introduction, String ticket_price, String cover) {
        Film film = new Film();
        film.setFilm_type(film_type);
        film.setFile_status(Integer.parseInt(file_status));
        film.setName(name);
        film.setLang(lang);
        film.setLength(Integer.parseInt(length));
        film.setIntroduction(introduction);
        film.setTicket_price(Integer.parseInt(ticket_price));
        film.setCover(cover);
        int flag = filmDAO.insertFilm(film);
        return flag;
    }

    public ModelAndView get_allfilm(String page) {
        ModelAndView mav = new ModelAndView(page);
        List<Film> film;
        film = filmDAO.selectAll();
        mav.addObject("film", film);
        return mav;
    }

    /**
     * 演出计划增删改查
     */
    public ModelAndView get_allschedule(String page) {

        ModelAndView mav = new ModelAndView(page);
        List<Schedule> schedules;
        List<Film> films = new ArrayList<Film>();
        List<Studio> studios = new ArrayList<Studio>();
        schedules = scheduleDao.selectScheduleAll();

        mav.addObject("schedules", schedules);


        for (Schedule schedule : schedules) {
            if (studioDao.selectStudioFromId(schedule.getStudio_id()) != null && filmDAO.selectFilmFromId(schedule.getFilm_id()) != null) {
                Film film = new Film();
                Studio studio = new Studio();
                studio.setName(studioDao.selectStudioFromId(schedule.getStudio_id()).getName());
                film.setName(filmDAO.selectFilmFromId(schedule.getFilm_id()).getName());
                studios.add(studio);
                films.add(film);

            }

        }
        if (studios != null && films != null) {
            mav.addObject("studios", studios);
            mav.addObject("films", films);
            System.out.println("11111111");
            return mav;
        }
        mav.addObject("nullmag", "no message");
        return mav;
    }

    public ModelAndView get_message(int scheduleid, String page)
    {
        ModelAndView mav = new ModelAndView(page);
        Film film = new Film();
        Studio studio = new Studio();
        Schedule schedule = scheduleDao.selectScheduleFromId(scheduleid);
        studio.setName(studioDao.selectStudioFromId(schedule.getStudio_id()).getName());
        film.setName(filmDAO.selectFilmFromId(schedule.getFilm_id()).getName());
        mav.addObject("film",film);
        mav.addObject("studio", studio);
        mav.addObject("schedule", schedule);
        return mav;



    }


    public ModelAndView get_schedule(int scheduleid, String page) {
        ModelAndView mav = new ModelAndView(page);
        Schedule schedule = scheduleDao.selectScheduleFromId(scheduleid);
        mav.addObject("schedule", schedule);

        return mav;
    }

    public int insert_schedule(String page, int studio_id, int film_id, Timestamp sche_time, int sche_ticket_price) {
        ModelAndView mav = new ModelAndView(page);
        Schedule schedule = new Schedule();
        schedule.setStudio_id(studio_id);
        schedule.setFilm_id(film_id);
        schedule.setSche_time(sche_time);
        schedule.setSche_ticket_price(sche_ticket_price);
        int flag = scheduleDao.insertSchedule(schedule);
        List<Schedule> schedulelist = null;
        if (flag > 0) {

            return flag;
        }

        return flag;

    }

    public ModelAndView delete_schedule(String scheduleid, String page) {
        ModelAndView mav = new ModelAndView(page);
        int flag = scheduleDao.deleteScheduleFromId(Integer.parseInt(scheduleid));
        if (flag > 0) {
            List<Schedule> schedules;
            List<Film> films = new ArrayList<Film>();
            List<Studio> studios = new ArrayList<Studio>();
            schedules = scheduleDao.selectScheduleAll();
            System.out.println("11111111");
            mav.addObject("schedules", schedules);


            for (Schedule schedule : schedules) {
                if (studioDao.selectStudioFromId(schedule.getStudio_id()) != null && filmDAO.selectFilmFromId(schedule.getFilm_id()) != null) {
                    Film film = new Film();
                    Studio studio = new Studio();
                    studio.setName(studioDao.selectStudioFromId(schedule.getStudio_id()).getName());
                    film.setName(filmDAO.selectFilmFromId(schedule.getFilm_id()).getName());
                    studios.add(studio);
                    films.add(film);

                }

            }
            if (studios != null && films != null) {
                mav.addObject("studios", studios);
                mav.addObject("films", films);
                return mav;
            }
        }
            mav.addObject("nullmag", "no message");
            return mav;



    }

    public ModelAndView update_schedule(int schedule_id, String page, int studio_id, int film_id, Timestamp sche_time, int sche_ticket_price)
    {
        ModelAndView mav = new ModelAndView(page);
        Schedule schedule = new Schedule();
        schedule.setId(schedule_id);
        schedule.setStudio_id(studio_id);
        schedule.setFilm_id(film_id);
        schedule.setSche_time(sche_time);
        schedule.setSche_ticket_price(sche_ticket_price);
        System.out.print("update before");
        int flag = scheduleDao.updateScheduleFromId(schedule);
        System.out.print("update after->" + flag);
        if (flag > 0) {
            List<Schedule> schedules;
            List<Film> films = new ArrayList<Film>();
            List<Studio> studios = new ArrayList<Studio>();
            schedules = scheduleDao.selectScheduleAll();
            mav.addObject("schedules", schedules);
            for (Schedule sche : schedules) {
                if (studioDao.selectStudioFromId(sche.getStudio_id()) != null && filmDAO.selectFilmFromId(sche.getFilm_id()) != null) {
                    Film film = new Film();
                    Studio studio = new Studio();
                    studio.setName(studioDao.selectStudioFromId(sche.getStudio_id()).getName());
                    film.setName(filmDAO.selectFilmFromId(sche.getFilm_id()).getName());
                    studios.add(studio);
                    films.add(film);

                }

            }
            if (studios != null && films != null) {
                mav.addObject("studios", studios);
                mav.addObject("films", films);
                return mav;
            }
        }
        mav.addObject("nullmag", "no message");
        return mav;
    }

    /*
        影厅增删改查
     */
    public ModelAndView get_studio(String studioid, String page) {
        ModelAndView mav = new ModelAndView(page);
        Studio studio = studioDao.selectStudioFromId(Integer.parseInt(studioid));
        mav.addObject("studio", studio);
        return mav;
    }

    public ModelAndView get_allstudio(String page)
    {
        ModelAndView mav = new ModelAndView(page);
        List<Studio> studios = new ArrayList<Studio>();
        studios = studioDao.selectAllStudio();
        mav.addObject("studios",studios);
        return mav;
    }

    public int insert_studio(String name, int studio_row_count, int studio_col_count, String studio_introduction, int studio_status)
    {
        Studio studio = new Studio();
        studio.setName(name);
        studio.setStudio_col_count(studio_row_count);
        studio.setStudio_row_count(studio_col_count);
        studio.setStudio_introduction(studio_introduction);
        studio.setStudio_status(studio_status);
        int flag = studioDao.insertStudio(studio);
        return flag;

    }

    public ModelAndView delete_studio(String studioid, String page) {
        ModelAndView mav = new ModelAndView(page);
        int flag = studioDao.deleteStudioFromId(Integer.parseInt(studioid));
        List<Studio> studios;
        System.out.println("("+ flag+")");
        if (flag > 0) {
            studios = studioDao.selectAllStudio();
            mav.addObject("studios", studios);
            mav.addObject("delmssage", "delete success");
            return mav;
        }
        studios = studioDao.selectAllStudio();
        mav.addObject("studios", studios);
        mav.addObject("delmssage", "delete failed");
        return mav;
    }

    public ModelAndView update_studio(int studio_id,String toPage,String studio_name, int studio_rows, int studio_cols, int studio_stutas, String studio_introduce)
    {
        ModelAndView mav = new ModelAndView(toPage);
        Studio studio = new Studio();
        studio.setId(studio_id);
        studio.setName(studio_name);
        studio.setStudio_col_count(studio_cols);
        studio.setStudio_row_count(studio_rows);
        studio.setStudio_status(studio_stutas);
        studio.setStudio_introduction(studio_introduce);

        int flag = studioDao.updateStudioFromId(studio);
        System.out.println("*"+flag+"*");
        if (flag > 0) {
            List<Studio> studios = studioDao.selectAllStudio();
            mav.addObject("studios",studios);
            mav.addObject("updatemessage", "update success");
            return mav;
        }
        List<Studio> studios = studioDao.selectAllStudio();
        mav.addObject("studios",studios);
        mav.addObject("updatemessage", "update failed");
        return mav;
    }

    public ModelAndView get_studiomessage(String studioid, String page) {
        ModelAndView mav = new ModelAndView(page);
        Studio studio = studioDao.selectStudioFromId(Integer.parseInt(studioid));
        mav.addObject("studio", studio);
        return mav;
    }
/*
    座位管理
 */

    public ModelAndView get_seats(String page, int studioid)
    {
        ModelAndView mav = new ModelAndView(page);
        List<Seat> seats = new ArrayList<Seat>();
        Studio studio;
        studio = studioDao.selectStudioFromId(studioid);
        seats = seatDao.selectSeatFromStudioId(studioid);
        mav.addObject("studio",studio);
        mav.addObject("seats",seats);
        return mav;
    }
    public ModelAndView get_users(String page)
    {
        ModelAndView mav = new ModelAndView(page);
        List<User> users = new ArrayList<User>();
        users = userDao.selectUserAll();
        mav.addObject("users",users);
        return mav;
    }
    public ModelAndView get_sale(String page)
    {
        ModelAndView mav = new ModelAndView(page);
        List<Order> orders = new ArrayList<Order>();
        List<Film> films = new ArrayList<Film>();
        List<Studio> studios = new ArrayList<Studio>();
        List<User> users = new ArrayList<User>();
        List<Seat> seats = new ArrayList<Seat>();
        List<Schedule> schedules = new ArrayList<Schedule>();
        int sum=0;
        orders = orderDao.selectAllOrder();
        for (Order order:orders) {
            User user = new User();
            Film film = new Film();
            Studio studio = new Studio();
            Seat seat = new Seat();
            Schedule schedule = new Schedule();
            user = userDao.selectUserFromId(order.getUser_id());
            film = filmDAO.selectFilmFromId(scheduleDao.selectScheduleFromId(order.getSche_id()).getFilm_id());
            studio = studioDao.selectStudioFromId(scheduleDao.selectScheduleFromId(order.getSche_id()).getStudio_id());
            seat = seatDao.selectSeatFromId(order.getSeat_id());
            schedule = scheduleDao.selectScheduleFromId(order.getSche_id());
            users.add(user);
            films.add(film);
            studios.add(studio);
            seats.add(seat);
            schedules.add(schedule);
            sum += scheduleDao.selectScheduleFromId(order.getSche_id()).getSche_ticket_price();
        }
        mav.addObject("orders",orders);
        mav.addObject("users",users);
        mav.addObject("films",films);
        mav.addObject("studios",studios);
        mav.addObject("seats",seats);
        mav.addObject("schedules",schedules);
        mav.addObject("sum",sum);
        System.out.println(sum);
        return mav;
    }

    public ModelAndView update_seat(String page, String seat_json, int studioid)
    {
        ModelAndView mav = null;
       ObjectMapper mapper = new ObjectMapper();
        System.out.println("jackjson"+seat_json);

        try {
            List<LinkedHashMap<String, Object>> maps = mapper.readValue(seat_json, List.class);
            System.out.println(maps.size());
            for(int i=0; i<maps.size();i++)
            {
                Map<String, Object> map = maps.get(i);
                Set<String> set = map.keySet();
                int k =0;
                Seat seat=null;
                for(Iterator<String> it = set.iterator();it.hasNext();)
                {
                        String key = it.next();
                        if(k==0)
                        {
                            seat = seatDao.selectSeatFromId(Integer.parseInt(map.get(key).toString()));
                            System.out.println(Integer.parseInt(map.get(key).toString()));
                        }
                        if(k==1)
                        {
                            System.out.println(Integer.parseInt(map.get(key).toString()));
                            seat.setSeat_status(Integer.parseInt(map.get(key).toString()));
                            seatDao.updateSeatFromId(seat);
                        }
                        k++;
                }
            }
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return get_seats(page,studioid);
    }
    public Film selectFilmFromId(int id){
        return filmDAO.selectFilmFromId(id);
    }
    public List<Film> selectAll(){
        return filmDAO.selectAll();
    }
    public List<Film> selectFilmFromFilmStatus(int file_status,int num,int start){
        return filmDAO.selectFilmFromFilmStatus(file_status,num,start);
    }
}
