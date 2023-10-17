package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Reservation;
import kr.ed.haebeop.util.Page;

import java.io.IOException;
import java.util.List;

public interface ReservationService {
    public List<Reservation> reservationList(Page page);
    public List<Reservation> reservationGetTimeList(Reservation reservation);
    public Reservation reservationGet(int rno);
    public boolean reservationInsert(Reservation reservation) throws IOException;
    public int reservationCount();
    public void reservationUpdateStatus(Reservation reservation);
}
