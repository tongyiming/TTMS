package com.web.serviceImpl;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.web.dao.UserDAO;
import com.web.entity.User;
import com.web.service.GainService;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by shiyi on 16/9/24.
 */

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private GainService gainService;

    public ModelAndView login(String fromPage, HttpSession session, String username, String password, String number, String code) {
        String toPage = "home";
        List<User> userlist = userDAO.selectUserFromName(username);
        //session.setAttribute("name",null);
        if(userlist.size() == 0)
        {
            ModelAndView mav1 = new ModelAndView(fromPage);
            mav1.addObject("error", "用户名不存在");
            return mav1;
        }

        User user = userlist.get(0);
        if(!user.getPassword().equals(password))
        {
            ModelAndView mav2 = new ModelAndView(fromPage);
            mav2.addObject("error", "密码错误");
            return mav2;
        }else {
            number=number.toUpperCase();
            if(!code.equals(number)){
                ModelAndView mav3 = new ModelAndView(fromPage);
                mav3.addObject("error", "验证码错误");
                return mav3;
            }
            User user1=userDAO.selectUserFromName(username).get(0);
            session.setAttribute("name",username);
            session.setAttribute("user",user1);
            return gainService.get_home(toPage);
        }
    }


    public ModelAndView register(String fromPage, String toPage, String username, String password) {
        List list = userDAO.selectUserFromName(username);
        if(list.size()!=0)
        {
            ModelAndView mav = new ModelAndView(fromPage);
            mav.addObject("error", "用户名已存在");
            return mav;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPicture("16.jpg");
        int flag = userDAO.insertUser(user);
        if(flag==0){
            ModelAndView mav = new ModelAndView(fromPage);
            mav.addObject("error", "注册失败");
            return mav;
        }
        ModelAndView mav = new ModelAndView(toPage);
        mav.addObject("username", username);
        mav.addObject("message", "注册");
        return mav;
    }

    public int updateUser(User user){
        return userDAO.updateUser(user);
    }

    public boolean selectUserFromName(String username){
        boolean flag=false;
        List<User> users=userDAO.selectUserFromName(username);
        //可以进行注册
        if(users.size()==0){
            flag=true;
        }
        return flag;
    }
}
