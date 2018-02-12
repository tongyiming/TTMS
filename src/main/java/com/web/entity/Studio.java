package com.web.entity;

/**
 * Created by AdminService on 2016/9/27 0027.
 */
public class Studio {
    private int id;                           //编号
    private String name;                      //放映厅名称
    private int studio_row_count;             //座位行数
    private int studio_col_count;             //座位列数
    private String studio_introduction;      //放映厅介绍
    private int studio_status;               //放映厅状态 1使用状态 2空闲状态 3损坏状态

    public Studio(){}

    public Studio(int id, String name, int studio_row_count, int studio_col_count, String studio_introduction, int studio_status) {
        this.id = id;
        this.name = name;
        this.studio_row_count = studio_row_count;
        this.studio_col_count = studio_col_count;
        this.studio_introduction = studio_introduction;
        this.studio_status = studio_status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStudio_row_count() {
        return studio_row_count;
    }

    public void setStudio_row_count(int studio_row_count) {
        this.studio_row_count = studio_row_count;
    }

    public int getStudio_col_count() {
        return studio_col_count;
    }

    public void setStudio_col_count(int studio_col_count) {
        this.studio_col_count = studio_col_count;
    }

    public String getStudio_introduction() {
        return studio_introduction;
    }

    public void setStudio_introduction(String studio_introduction) {
        this.studio_introduction = studio_introduction;
    }

    public int getStudio_status() {
        return studio_status;
    }

    public void setStudio_status(int studio_status) {
        this.studio_status = studio_status;
    }
}
