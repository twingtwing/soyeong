package co.kids.prj.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewDao")
public class ReviewServiceImpl implements ReviewService {
	@Autowired ReviewMapper map;

	@Override
	public List<ReviewVO> reviewSelectList(int rno) {
		
		return map.reviewSelectList(rno);
	}
	

}
