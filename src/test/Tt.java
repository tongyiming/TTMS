
import com.web.dao.FilmDAO;
import com.web.dao.ScheduleDAO;
import com.web.dao.SeatDAO;
import com.web.entity.Film;
import com.web.entity.Schedule;
import com.web.entity.Seat;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by shiyi on 16/9/24.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring-MVC.xml"
        ,"classpath:config/spring-mybatis.xml"})
public class Tt {

    @Autowired
    private SeatDAO seatDAO;

    @Autowired
    private ScheduleDAO scheduleDAO;

    @Test
   public void insertUser()
    {
   Seat seat =new Seat();
      for (int i=0;i<13;i++)
    {
          for(int j=0;j<18;j++)
       {
            seat.setStudio_id(4);
             seat.setSeat_row(i+1);
              seat.setSeat_col(j+1);
              seat.setSeat_status(1);
              if(j==3) {
                  seat.setSeat_status(2);
            }
              seatDAO.insertSeat(seat);
         }
       }
       List<Seat> seats=seatDAO.selectSeatFromStudioId(1);
        for(Seat s:seats){
            System.out.print(s.getId());
            System.out.print(s.getStudio_id());
        }
    }

}
