package co.kids.prj.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class ReservationImpl implements ReservationService {
	
	@Autowired
	private ReservationMapper map;

	@Override
	public List<ReservationVO> reservSelectList() {
		// TODO Auto-generated method stub
		return map.reservSelectList();
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

}
