package co.kids.prj.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kids.prj.reservation.service.ReservationVO;

@Repository("memberDao")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper map;

	@Override
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList();
	}

	@Override
	public MemberVO memberSelect(MemberVO vo) {
		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

	@Override
	public int memberAuthorUpdate(MemberVO vo) {
		return map.memberAuthorUpdate(vo);
	}

	@Override
	public List<MemberVO> memberSearch(MemberVO vo) {
		return map.memberSearch(vo);
	}

	@Override
	public int changePw(MemberVO vo) {
		return map.changePw(vo);
	}

	@Override
	public int joinSNS(MemberVO vo) {
		return map.joinSNS(vo);
	}

	@Override
	public List<ReservationVO> memberSales(ReservationVO vo) {
		return map.memberSales(vo);
	}

	@Override
	public int changeRefund(ReservationVO vo) {
		return map.changeRefund(vo);
	}

}
