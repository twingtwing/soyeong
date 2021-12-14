package co.kids.prj.question.service;

import java.util.List;

public interface QuestionVMapper {
	List<QuestionVVO> questionVList();
	QuestionVVO questionVSelect(int qNo);
	int questionVInsert(QuestionVVO vo);
	//처리여부 수정
	int questionChangeProcess(QuestionVVO vo);
}
