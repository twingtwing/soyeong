package co.kids.prj.adminQ.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminQController {

	//고객 센터 리스트 페이지
	@GetMapping("/adminQuestion.do")
	public String adminQuestion() {
		return "admin/question/adminQuestion";
	}

	//QnA 상세 페이지
	@GetMapping("/questionA.do")
	public String questionA() {
		return "admin/question/questionA";
	}

	//QnA 수정
	@GetMapping("/qeustionAUpdate.do")
	public String qeustionAUpdate() {
		return "admin/question/qeustionAUpdate";
	}
	
	//QnA 등록
	@GetMapping("/qeustionAInsert.do")
	public String qeustionAInsert() {
		return "admin/question/qeustionAInsert";
	}

	//고객의 소리 상세 페이지
	@GetMapping("/questionV.do")
	public String questionV() {
		return "admin/question/questionV";
	}
	
}
