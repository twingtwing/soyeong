package co.kids.prj.reservation.service;

import java.util.List;

public interface ReservationMapper {
	List<ReservationVO> reservSelectList(ReservLodVO vo);
	List<ReservationVO> reservSortList(ReservLodVO vo);
	ReservationVO reservSelect(ReservationVO vo);
	int reservInsert(ReservationVO vo);
	int reservDelete(ReservationVO vo);
	int reservUpdate(ReservationVO vo);
}
