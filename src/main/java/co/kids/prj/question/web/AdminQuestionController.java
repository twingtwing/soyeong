package co.kids.prj.question.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.kids.prj.question.service.QuestionAService;
import co.kids.prj.question.service.QuestionAVO;
import co.kids.prj.question.service.QuestionVService;
import co.kids.prj.question.service.QuestionVVO;

@Controller
public class AdminQuestionController {
	@Autowired private QuestionAService questionADao;
	@Autowired private QuestionVService questionVDao;
	
	@Autowired private JavaMailSender mailSender;
	
	@Autowired private String saveDir;
	
	//QnA 리스트 
	@GetMapping("/questionAList.do")
	public String questionAList(Model model) {
		ObjectMapper ob = new ObjectMapper();
		try {
			model.addAttribute("QnAs", ob.writeValueAsString(questionADao.questionAList()));
		} catch (JsonProcessingException e) {
			model.addAttribute("QnAs", "");
		}
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
	
	//QnA 검색
	@GetMapping("/questionASearch.do")
	@ResponseBody
	public List<QuestionAVO> questionASearch(QuestionAVO vo) {
		return questionADao.questionASearch(vo);
	}
	
	//=====고객의 소리======
	
	//고객의 소리 리스트
	@GetMapping("/questionVList.do")
	public String questionVList(Model model) {
		Gson gson = new GsonBuilder().create();	
		model.addAttribute("voices",gson.toJson(questionVDao.questionVList()));
		return "admin/question/questionVList";
	}
	
	//고객의 소리 상세 페이지
	@GetMapping("/questionVSelect.do")
	public String questionV(Model model, @Param("qNo") int qNo) {
		model.addAttribute("voice", questionVDao.questionVSelect(qNo));
		return "admin/question/questionVSelect";
	}

	//고객의 소리 검색
	@GetMapping("/questionVSearch.do")
	@ResponseBody
	public List<QuestionVVO> questionVSearch(QuestionVVO vo) {
		return questionVDao.questionVSearch(vo);
	}
	
	//고객의 소리 처리상태 변경
	@PostMapping("/questionChangeProcess.do")
	@ResponseBody
	public String questionChangeProcess(Model model, @Param("qNo") int qNo) {
		System.out.println(qNo);
		String result = "Y";
		int r = questionVDao.questionChangeProcess(qNo);
		if(r == 0) {result = "F";}
		return result;
	}
	
	//이메일 페이지 이동
	@GetMapping("/questionVEmail.do")
	public String questionVEmail(Model model, @Param("email") String email, @Param("qNo") int qNo) {
		model.addAttribute("email",email);
		model.addAttribute("qNo",qNo);
		return "admin/question/questionVEmail";
	}
	
	//이메일 처리
	@PostMapping("/questionVSend.do")
	@ResponseBody
	public String questionVSend(@Param("email") String email,@Param("title") String title,@Param("content") String content) {
		String fromEamil = "soyoungbnb@gmail.com";

		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
		
		try {
			mailHelper.setFrom(fromEamil);
			mailHelper.setTo(email);
			mailHelper.setSubject(title);
			mailHelper.setText(content,true);//true는 html을 사용한다는 의미 -> img도 보낼수 있음
			
			mailSender.send(mail);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "Y";
	}
	
	//파일 다운로드
	@GetMapping("/questionDownload.do")
	public void questionDownload(@Param("qPFile") String qPFile,HttpServletResponse response) {
		String filePath = saveDir + qPFile;
		
		File file = new File(filePath);
		
		Tika tika = new Tika();
		String contentType = null;
		try {
			contentType = tika.detect(file);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		long fileLength = file.length();
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + qPFile + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        
        try {
        	FileInputStream fis = new FileInputStream(filePath);
			OutputStream out = response.getOutputStream();
			
			int readCount = 0;
			byte [] buffer = new byte[1024];
			
			while((readCount = fis.read(buffer)) != -1) {
				out.write(buffer,0,readCount);
			}
		} catch (IOException e) {
			throw new RuntimeException("file Save Error");
		}
		
	}

}
