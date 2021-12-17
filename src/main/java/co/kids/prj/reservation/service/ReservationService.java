package co.kids.prj.reservation.service;

import java.util.List;

public interface ReservationService {
	List<ReservationVO> reservSelectList(ReservLodVO vo);
	List<ReservationVO> reservSortList(ReservLodVO vo);
	ReservationVO reservSelect(ReservationVO vo);
	ReservLodVO reservLodgSelect(ReservLodVO vo);
	int reservInsert(ReservationVO vo);
	int reservDelete(ReservationVO vo);
	int reservUpdate(ReservationVO vo);
}
