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

	@Override
	public int reviewInsert(ReviewVO vo) {
		
		return map.reviewInsert(vo);
	}

	@Override
	public ReviewVO reviewCheckDup(ReviewVO vo) {
		return map.reviewCheckDup(vo);
	}
	

}
