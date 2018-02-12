package com.web.entity;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by AdminService on 2016/9/27 0027.
 */
public class Schedule {
    private int id;                      //编号
    private int studio_id;               //放映厅id
    private int film_id;                 //影片id
    private Timestamp sche_time;              //演出时间
    private int sche_ticket_price;       //票价

    public Schedule(){}

    public Schedule(int id, int studio_id, int film_id, Timestamp sche_time, int sche_ticket_price) {
        this.id = id;
        this.studio_id = studio_id;
        this.film_id = film_id;
        this.sche_time = sche_time;
        this.sche_ticket_price = sche_ticket_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudio_id() {
        return studio_id;
    }

    public void setStudio_id(int studio_id) {
        this.studio_id = studio_id;
    }

    public int getFilm_id() {
        return film_id;
    }

    public void setFilm_id(int film_id) {
        this.film_id = film_id;
    }

    public Timestamp getSche_time() {
        return sche_time;
    }

    public void setSche_time(Timestamp sche_time) {
        this.sche_time = sche_time;
    }

    public int getSche_ticket_price() {
        return sche_ticket_price;
    }

    public void setSche_ticket_price(int sche_ticket_price) {
        this.sche_ticket_price = sche_ticket_price;
    }
}
