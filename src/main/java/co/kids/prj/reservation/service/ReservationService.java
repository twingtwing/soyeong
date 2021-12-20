package co.kids.prj.reservation.service;

import java.util.List;

import co.kids.prj.lodging.service.LodgingVO;

public interface ReservationService {
	List<ReservationVO> reservSelectList(ReservLodVO vo);
	List<ReservationVO> reservSortList(ReservLodVO vo);
	List<ReservLodVO> hostSortList(ReservLodVO vo);
	ReservationVO reservSelect(ReservationVO vo);
	ReservLodVO reservLodgSelect(ReservLodVO vo);
	int reservInsert(ReservationVO vo);
	int reservDelete(ReservationVO vo);
	int reservUpdate(ReservationVO vo);
}
