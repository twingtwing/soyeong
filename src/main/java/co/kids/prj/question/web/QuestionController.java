package co.kids.prj.question.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
	@Autowired
	private QuestionAService questionADao;
	@Autowired
	private QuestionVService questionVDao;

	@Autowired
	private String saveDir;

	// FaQ list 가지고 오는 동시에 페이지 이동
	@GetMapping("/question.do")
	public String question(Model model) {
		List<QuestionAVO> list = questionADao.questionAList();
		model.addAttribute("QnAs", list);
		model.addAttribute("size", Math.floor(list.size() / 10));
		model.addAttribute("extra", list.size() % 10);
		return "question/question";
	}

	// 고객의 소리 투고
	@PostMapping("/ajaxQuestion.do")
	@ResponseBody
	public String userQuestion(QuestionVVO vo, MultipartFile fileQ, HttpSession session) {

		// 작성자
		vo.setId((String) session.getAttribute("id"));

		String result = "Y";

		if (fileQ != null) {
			// 파일
			String fileName = fileQ.getOriginalFilename();
			int comma = fileName.lastIndexOf(".");
			String pFileName = fileName.substring(0, comma) + "_Q_" + UUID.randomUUID().toString()
					+ fileName.substring(comma);

			File target = new File(saveDir, pFileName);

			vo.setqFile(fileName);
			vo.setqPFile(pFileName);

			// 파일 저장
			if (!new File(saveDir).exists()) {
				new File(saveDir).mkdir();
			}

			// 파일 복사
			try {
				FileCopyUtils.copy(fileQ.getBytes(), target);
				int r = questionVDao.questionVInsert(vo);
				if (r == 0) {
					result = "N";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {// {resu}
			int r = questionVDao.questionVInsert(vo);
			if (r == 0) {
				result = "N";
			}
		}

		return result;
	}

}
