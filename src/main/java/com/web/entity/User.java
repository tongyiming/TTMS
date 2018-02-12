package com.web.entity;

/**
 * Created by shiyi on 16/9/23.
 */
public class User {

    private int id;
    private String username;
    private String password;
    private String picture;
    private String callphone;

    public User() {}

    public User(int id, String username, String password, String picture, String callphone) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.picture = picture;
        this.callphone = callphone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getCallphone() {
        return callphone;
    }

    public void setCallphone(String callphone) {
        this.callphone = callphone;
    }
}
