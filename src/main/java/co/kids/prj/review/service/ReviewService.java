package co.kids.prj.review.service;

import java.util.List;

public interface ReviewService {
	List<ReviewVO> reviewSelectList(int rno);
	int reviewInsert(ReviewVO vo);
	ReviewVO reviewCheckDup(ReviewVO vo);
	ReviewVO totalReview(String id);
}
