package co.kids.prj.reservation.service;

import java.util.List;

public interface ReservationService {
	List<ReservationVO> reservSelectList(ReservationVO vo);
	ReservationVO reservSelect(ReservationVO vo);
	int reservInsert(ReservationVO vo);
	int reservDelete(ReservationVO vo);
	int reservUpdate(ReservationVO vo);
	
}
