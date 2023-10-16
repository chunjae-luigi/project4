package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Reservation;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ReservationMapper {
    @Select("SELECT * FROM reservation WHERE status!='end' ORDER BY rdate ASC LIMIT #{postStart}, #{postCount}")
    public List<Reservation> reservationList(Page page);

    @Select("SELECT * FROM reservation WHERE rdate=#{rdate} and rtime=#{rtime}")
    public List<Reservation> reservationGetTimeList(Reservation reservation);

    @Select("SELECT * FROM reservation where rno=#{rno}")
    public Reservation reservationGet(int rno);

    @Select("INSERT INTO reservation(id, rdate, rtime) VALUES(#{id}, #{rdate}, ${rtime})")
    public void reservationInsert(Reservation reservation);

    @Update("UPDATE reservation SET status=#{status}")
    public void reservationUpdateStatus(Reservation reservation);
}
