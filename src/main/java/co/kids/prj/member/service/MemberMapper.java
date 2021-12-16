package co.kids.prj.member.service;

import java.util.List;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberAuthorUpdate(MemberVO vo);
	int memberDelete(MemberVO vo); 
	List<MemberVO> memberSearch(MemberVO vo);
	int changePw(MemberVO vo);
}
