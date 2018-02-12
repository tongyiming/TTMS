package com.web.entity;

/**
 * Created by AdminService on 2016/9/27 0027.
 */
public class Seat {
    private int id;                      //编号
    private int studio_id;               //所属放映厅id
    private int seat_row;                //座位行号
    private int seat_col;               //座位列号
    private int seat_status;            //座位状态 1使用状态 2 损坏状态 3空置状态

    public Seat(){}

    public Seat(int id, int studio_id, int seat_row, int seat_col, int seat_status) {
        this.id = id;
        this.studio_id = studio_id;
        this.seat_row = seat_row;
        this.seat_col = seat_col;
        this.seat_status = seat_status;
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

    public int getSeat_row() {
        return seat_row;
    }

    public void setSeat_row(int seat_row) {
        this.seat_row = seat_row;
    }

    public int getSeat_col() {
        return seat_col;
    }

    public void setSeat_col(int seat_col) {
        this.seat_col = seat_col;
    }

    public int getSeat_status() {
        return seat_status;
    }

    public void setSeat_status(int seat_status) {
        this.seat_status = seat_status;
    }
}
