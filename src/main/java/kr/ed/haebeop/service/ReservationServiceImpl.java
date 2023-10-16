package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Reservation;
import kr.ed.haebeop.persistence.ReservationMapper;

import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public boolean reservationInsert(Reservation reservation) {
        List<Reservation> reserved = reservationMapper.reservationGetTimeList(reservation);

        boolean success = true;

        if(!reserved.isEmpty() && reserved.size()>=2){success=false;}
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
    public List<Reservation> reservationList(Page page) {
        return reservationMapper.reservationList(page);
    }
}
