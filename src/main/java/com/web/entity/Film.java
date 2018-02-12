package com.web.entity;

/**
 * Created by AdminService on 2016/9/27 0027.
 */
public class Film {
    private int id;                              //编号
    private String film_type;                     //影片类型
    private int file_status;                     //影片状态 1正在上映 2即将上映 3已经上映
    private String name;                         //影片名
    private String lang;                         //语种
    private int length;                         //播放长度
    private String introduction;                //影片描述
    private int ticket_price;                    //票价
    private String cover;                       //影片封面图
    private String picture_1;                   //影片剧照1
    private String picture_2;                   //影片剧照2
    private String picture_3;                   //影片剧照3
    private String picture_4;                   //影片剧照4

    public Film(){}

    public Film(int id, String film_type, int file_status, String name, String lang, int length, String introduction, int ticket_price, String cover, String picture_1, String picture_2, String picture_3, String picture_4) {
        this.id = id;
        this.film_type = film_type;
        this.file_status = file_status;
        this.name = name;
        this.lang = lang;
        this.length = length;
        this.introduction = introduction;
        this.ticket_price = ticket_price;
        this.cover = cover;
        this.picture_1 = picture_1;
        this.picture_2 = picture_2;
        this.picture_3 = picture_3;
        this.picture_4 = picture_4;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilm_type() {
        return film_type;
    }

    public void setFilm_type(String film_type) {
        this.film_type = film_type;
    }

    public int getFile_status() {
        return file_status;
    }

    public void setFile_status(int file_status) {
        this.file_status = file_status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getTicket_price() {
        return ticket_price;
    }

    public void setTicket_price(int ticket_price) {
        this.ticket_price = ticket_price;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getPicture_1() {
        return picture_1;
    }

    public void setPicture_1(String picture_1) {
        this.picture_1 = picture_1;
    }

    public String getPicture_2() {
        return picture_2;
    }

    public void setPicture_2(String picture_2) {
        this.picture_2 = picture_2;
    }

    public String getPicture_3() {
        return picture_3;
    }

    public void setPicture_3(String picture_3) {
        this.picture_3 = picture_3;
    }

    public String getPicture_4() {
        return picture_4;
    }

    public void setPicture_4(String picture_4) {
        this.picture_4 = picture_4;
    }
}
