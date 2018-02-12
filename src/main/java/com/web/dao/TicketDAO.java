package com.web.dao;

import com.web.entity.Ticket;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2016/9/27 0027.
        */

@Repository("TicketDAO")
public interface TicketDAO {
    public Ticket selectTicketFromId(int id);

    public int insertTicket(Ticket ticket);

    public int deleteTicketFromSeatId(int seat_id);

    public int updateTicketFromSeatId(Ticket ticket);
}
