package co.kids.prj.question.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuestionController {
	
	@GetMapping("/question.do")
	public String question() {
		return "question/question";
	}
	

}
