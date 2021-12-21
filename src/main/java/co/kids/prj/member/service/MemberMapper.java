package co.kids.prj.member.service;

import java.util.List;

import co.kids.prj.reservation.service.ReservationVO;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberAuthorUpdate(MemberVO vo);
	int memberDelete(MemberVO vo); 
	List<MemberVO> memberSearch(MemberVO vo);
	int changePw(MemberVO vo);
	
	int joinSNS(MemberVO vo);
	
	//매출관리
	List<ReservationVO> memberSales(ReservationVO vo);
	int changeRefund(ReservationVO vo);
	List<MemberVO> totalHost(MemberVO vo);
}
