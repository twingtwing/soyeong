package co.kids.prj.question.web;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.kids.prj.question.service.QuestionAService;
import co.kids.prj.question.service.QuestionAVO;
import co.kids.prj.question.service.QuestionVService;

@Controller
public class AdminQuestionController {
	@Autowired private QuestionAService questionADao;
	@Autowired private QuestionVService questionVDao;

	//QnA 리스트 
	
	@GetMapping("/questionAList.do")
	public String questionAList(Model model) throws JsonProcessingException {
		ObjectMapper ob = new ObjectMapper();
		model.addAttribute("QnAs", ob.writeValueAsString(questionADao.questionAList()));
		return "admin/question/questionAList";
	}

	//QnA 상세 페이지
	@GetMapping("/questionASelect.do")
	public String questionA(Model model, @Param("fNo") int fNo) {
		model.addAttribute("QnA", questionADao.questionASelect(fNo));
		return "admin/question/questionASelect";
	}
	
	//QnA 등록 페이지 이동
	@GetMapping("/qeustionAInsert.do")
	public String qeustionAInsert() {
		return "admin/question/qeustionAInsert";
	}

	
	//QnA 등록 처리
	@PostMapping("/qeustionAInsertForm.do")
	public String qeustionAInsertForm(Model model, QuestionAVO vo) {
		System.out.println(vo.getfAnswer());
		System.out.println(vo.getfTitle());
		System.out.println(vo.getfCategory());
		String path = "redirect:questionAList.do";
		int r = questionADao.questionAInsert(vo);
		if(r>0) {
			model.addAttribute("QnA", questionADao.questionASelect(vo.getfNo()));
			path = "admin/question/questionASelect";
		}
		return path;
	}
	 
	//QnA 수정 페이지 이동
	@GetMapping("/qeustionAUpdate.do")
	public String qeustionAUpdate(Model model, @Param("fNo") int fNo) {
		model.addAttribute("QnA", questionADao.questionASelect(fNo));
		return "admin/question/qeustionAUpdate";
	}
	
	//QnA 수정 처리
	@PostMapping("/qeustionAUpdateForm.do")
	public String qeustionAUpdateForm(Model model, QuestionAVO vo) {
		String path = "redirect:questionAList.do";
		int r = questionADao.questionAUpdate(vo);
		if(r>0) {
			model.addAttribute("QnA", questionADao.questionASelect(vo.getfNo()));
			path = "admin/question/questionASelect";
		}
		return path;
	}
	
	//QnA 삭제
	@GetMapping("/qeustionADelete.do")
	public String qeustionADelete(Model model, @Param("fNo") int fNo) {
		questionADao.questionADelete(fNo);
		return "redirect:questionAList.do";
	}
	
	//serach
	
	//=====고객의 소리======
	
	//고객의 소리 리스트
	@GetMapping("/questionVList.do")
	public String questionVList(Model model) throws JsonProcessingException {
		ObjectMapper ob = new ObjectMapper();
		model.addAttribute("voices", ob.writeValueAsString(questionVDao.questionVList()));
		return "admin/question/questionVList";
	}
	
	//고객의 소리 상세 페이지
	@GetMapping("/questionVSelect.do")
	public String questionV(Model model, @Param("qNo") int qNo) {
		model.addAttribute("voice", questionVDao.questionVSelect(qNo));
		return "admin/question/questionVSelect";
	}
	
	//serach

}
