package co.kids.prj.question.service;

import java.util.List;

public interface QuestionVService {
	List<QuestionVVO> questionVList();
	QuestionVVO questionVSelect(int qNo);
	int questionVInsert(QuestionVVO vo);
	int questionChangeProcess(int qNo);
	List<QuestionVVO> questionVSearch(QuestionVVO vo);
}
