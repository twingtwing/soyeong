package co.kids.prj.review.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.kids.prj.review.service.ReviewServiceImpl;

@Controller
public class ReviewController {
	@Autowired private ReviewServiceImpl reviewDao;
	
	@GetMapping(value="/reviewList.do", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String reviewList(int rno) {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(reviewDao.reviewSelectList(rno));
	}

}
