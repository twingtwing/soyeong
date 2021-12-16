package co.kids.prj.member.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.kids.prj.member.service.MemberService;
import co.kids.prj.member.service.MemberVO;

@Controller
public class adminMemberController {
	@Autowired private MemberService memberDao;
	
	//위치 옮김
	//멤버리스트
	@RequestMapping("/adminMemberList.do")
	public String adminMemberList(Model model) {
		ObjectMapper ob = new ObjectMapper();
		try {
			model.addAttribute("members", ob.writeValueAsString(memberDao.memberSelectList()));
		} catch (JsonProcessingException e) {
			model.addAttribute("members", "");
		}
		return "admin/member/memberList";
	}
	
	//맴버 상세화면
	@GetMapping("/memberSelect.do")
	public String memberSelect(Model model, MemberVO vo) {
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "admin/member/memberSelect";
	}
	
	//멤버검색
	@GetMapping("/memberSearch.do")
	@ResponseBody
	public List<MemberVO> memberSearch(MemberVO vo,@Param("category") String category,@Param("input") String input){
		if(category.equals("id")) {
			vo.setId(input);
		}else if(category.equals("name")) {
			vo.setName(input);
		}
		return memberDao.memberSearch(vo);
	}
	
	//멤버 권한 수정
	@PostMapping("/memberAuthorUpdate.do")
	@ResponseBody
	public String memberAuthorUpdate(MemberVO vo) {
		String result = "N";
		int r = memberDao.memberAuthorUpdate(vo);
		if(r>0) {result ="Y";}
		return result;
	}
	
	//멤버..삭제...???
	
}
