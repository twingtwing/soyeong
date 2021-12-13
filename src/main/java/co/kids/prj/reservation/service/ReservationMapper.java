package co.kids.prj.reservation.service;

import java.util.List;

public interface ReservationMapper {
	List<ReservationVO> reservSelectList();
	ReservationVO reservSelect(ReservationVO vo);
	int reservInsert(ReservationVO vo);
	int reservDelete(ReservationVO vo);
	int reservUpdate(ReservationVO vo);
}
