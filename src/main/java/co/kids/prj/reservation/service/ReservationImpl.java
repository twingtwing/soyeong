package co.kids.prj.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("rDao")
public class ReservationImpl implements ReservationService {
	
	@Autowired
	private ReservationMapper map;

	@Override
	public List<ReservationVO> reservSelectList(ReservLodVO vo) {
		// TODO Auto-generated method stub
		return map.reservSelectList(vo);
	}

	@Override
	public ReservationVO reservSelect(ReservationVO vo) {
		// TODO Auto-generated method stub
		return map.reservSelect(vo);
	}

	@Override
	public int reservInsert(ReservationVO vo) {
		// TODO Auto-generated method stub
		return map.reservInsert(vo);
	}

	@Override
	public int reservDelete(ReservationVO vo) {
		// TODO Auto-generated method stub
		return map.reservDelete(vo);
	}

	@Override
	public int reservUpdate(ReservationVO vo) {
		// TODO Auto-generated method stub
		return map.reservUpdate(vo);
	}

	@Override
	public List<ReservationVO> reservSortList(ReservLodVO vo) {	
		return map.reservSortList(vo);
	}

	@Override
	public ReservLodVO reservLodgSelect(ReservLodVO vo) {
		return map.reservLodgSelect(vo);
	}


}
