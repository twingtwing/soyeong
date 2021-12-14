package co.kids.prj.question.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.kids.prj.question.service.QuestionAService;
import co.kids.prj.question.service.QuestionAVO;
import co.kids.prj.question.service.QuestionVService;
import co.kids.prj.question.service.QuestionVVO;

@Controller
public class QuestionController {
	@Autowired private QuestionAService questionADao;
	@Autowired private QuestionVService questionVDao;
	
	@Autowired private String saveDir;
	
	//FaQ list 가지고 오는 동시에 페이지 이동
	@GetMapping("/question.do")
	public String question(Model model) {
		List<QuestionAVO> list = questionADao.questionAList();
		model.addAttribute("QnAs",list);
		model.addAttribute("size",Math.floor(list.size()/10));
		model.addAttribute("extra",list.size()%10);
		return "question/question";
	}
	
	//고객의 소리 투고
	
	
	@PostMapping("/ajaxQuestion.do")
	@ResponseBody
	public String  userQuestion(QuestionVVO vo, MultipartFile fileQ,HttpSession session){
		
		//작성자
		vo.setId((String)session.getAttribute("id"));
		
		String result = "T";
	
		if(fileQ != null) {
			//파일
			String fileName = fileQ.getOriginalFilename();
			int comma = fileName.lastIndexOf(".");
			String pFileName = fileName.substring(0, comma) +"_Q_"+ UUID.randomUUID().toString()+fileName.substring(comma);
			
			File target = new File(saveDir,fileName);
			
			vo.setqFile(fileName);
			vo.setqPFile(pFileName);
			
			//파일 저장
			if(! new File(saveDir).exists()) {
				new File(saveDir).mkdir();
			}
			
			//파일 복사 
			try {
				FileCopyUtils.copy(fileQ.getBytes(), target);
				int r = questionVDao.questionVInsert(vo);
				if(r == 0) { result = "F"; }
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}else {//{resu}
			int r = questionVDao.questionVInsert(vo);
			if(r == 0) { result = "{F"; }
		}

			return result;
	}
	
	//=======admin

	//고객 센터 리스트 페이지 -->둘이 분리 시킬거임
	@GetMapping("/adminQuestion.do")
	public String adminQuestion(Model model) {
		model.addAttribute("QnAs", questionADao.questionAList());
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
