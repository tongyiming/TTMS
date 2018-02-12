package com.web.service;

import com.web.entity.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by shiyi on 16/9/24.
 */
public interface UserService {

    public ModelAndView login(String fromPage, HttpSession session, String username, String password, String number, String code);
    public ModelAndView register(String fromPage, String toPage, String username, String password);
    public int updateUser(User user);
    public boolean selectUserFromName(String username);

}
