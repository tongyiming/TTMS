package com.web.dao;

import com.web.entity.Schedule;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/9/27 0027.
 */
@Repository("ScheduleDAO")
public interface ScheduleDAO {
    public List<Schedule> selectScheduleAll();

    public Schedule selectScheduleFromId(int id);

    public Schedule selectScheduleFromStudioId(int studio_id);

    public List<Schedule> selectScheduleFromFilmId(int film_id);

    public int insertSchedule(Schedule schedule);

    public int deleteScheduleFromId(int id);

    public int updateScheduleFromId(Schedule schedule);

}
