package com.web.entity;

/**
 * Created by AdminService on 2016/9/27 0027.
 */
public class Ticket {
    private int id;                    //编号
    private int seat_id;               //座位id
    private int sche_id;              //演出计划id
    private int ticket_price;         //票价
    private int ticket_status;        //票状态 1已支付 2已退票',

    public Ticket(){}

    public Ticket(int id, int seat_id, int sche_id, int ticket_price, int ticket_status) {
        this.id = id;
        this.seat_id = seat_id;
        this.sche_id = sche_id;
        this.ticket_price = ticket_price;
        this.ticket_status = ticket_status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(int seat_id) {
        this.seat_id = seat_id;
    }

    public int getSche_id() {
        return sche_id;
    }

    public void setSche_id(int sche_id) {
        this.sche_id = sche_id;
    }

    public int getTicket_price() {
        return ticket_price;
    }

    public void setTicket_price(int ticket_price) {
        this.ticket_price = ticket_price;
    }

    public int getTicket_status() {
        return ticket_status;
    }

    public void setTicket_status(int ticket_status) {
        this.ticket_status = ticket_status;
    }
}


