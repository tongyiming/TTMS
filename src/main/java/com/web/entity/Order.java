package com.web.entity;

/**
 * Created by Administrator on 2016/11/30 0030.
 */
public class Order {
    private int id;             //编号
    private int user_id;        //用户id
    private int seat_id;        //座位id
    private int sche_id;        //演出计划id
    private int order_status;   //订单状态 1未消费 2已消费

    public Order(){}

    public Order(int id, int user_id, int seat_id, int sche_id, int order_status) {
        this.id = id;
        this.user_id = user_id;
        this.seat_id = seat_id;
        this.sche_id = sche_id;
        this.order_status = order_status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }
}
