package com.web.dao;

import com.web.entity.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/11/30 0030.
 */

@Repository("OrderDAO")
public interface OrderDAO {
    public List<Order> selectAllOrder();

    public List<Order> selectOrderFromOrderStatus(int order_status);

    public List<Order> selectAllOrderById(int user_id);

    public List<Order> selectOrderFromOrderStatusById(int order_status,int user_id);

    public int insertOrder(Order orderform);

    public int deleteOrderFromId(int id);

    public int updateOrderFromOrderStatus(int id, int order_status);
}
