package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Reservation;
import kr.ed.haebeop.persistence.ReservationMapper;

import kr.ed.haebeop.util.Page;
import kr.ed.haebeop.util.SettingConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.List;

@Service
public class ReservationServiceImpl implements ReservationService{
    @Autowired
    ReservationMapper reservationMapper;

    @Override
    public Reservation reservationGet(int rno) {
        return reservationMapper.reservationGet(rno);
    }

    @Override
    public List<Reservation> reservationGetTimeList(Reservation reservation) {
        return reservationMapper.reservationGetTimeList(reservation);
    }

    @Override
    @Transactional
    public boolean reservationInsert(Reservation reservation, ServletContext servletContext) throws IOException {
        List<Reservation> reserved = reservationMapper.reservationGetTimeList(reservation);

        boolean success = true;
        int capacity = Integer.parseInt(SettingConfig.getProperty("reservation.capacity", servletContext));

        if(!reserved.isEmpty() && reserved.size()>=capacity){success=false;}
        else{
            reservationMapper.reservationInsert(reservation);
        }
        return success;
    }

    @Override
    public void reservationUpdateStatus(Reservation reservation) {
        reservationMapper.reservationUpdateStatus(reservation);
    }

    @Override
    public int reservationCount() {
        return reservationMapper.reservationCount();
    }

    @Override
    public List<Reservation> reservationList(Page page) {
        return reservationMapper.reservationList(page);
    }

    @Override
    public List<Reservation> reservationMyList(String id) {
        return reservationMapper.reservationMyList(id);
    }
}
