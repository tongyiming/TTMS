package com.web.dao;

import java.util.List;
import com.web.entity.Seat;
import com.web.entity.Studio;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2016/9/27 0027.
 */
@Repository("SeatDAO")
public interface SeatDAO {
    public Seat selectSeatFromId(int id);

    public Seat selectSeatFromLocation(int seat_row,int seat_col);

    public List<Seat> selectSeatFromSeatStatus(int seat_status);


    public List<Seat> selectSeatFromStudioId(int studio_id);
    //public int createStudioSeat(Studio studio);根据演出厅批量生成座位

    public int insertSeat(Seat seat);

    public int deleteSeatFromId(int id);

    public int updateSeatFromId(Seat seat);
}
