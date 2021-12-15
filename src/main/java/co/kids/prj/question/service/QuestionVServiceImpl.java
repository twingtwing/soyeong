package co.kids.prj.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("questionVDao")
public class QuestionVServiceImpl implements QuestionVService{
	@Autowired private QuestionVMapper mapper;

	@Override
	public List<QuestionVVO> questionVList() {
		return mapper.questionVList();
	}

	@Override
	public QuestionVVO questionVSelect(int qNo) {
		return mapper.questionVSelect(qNo);
	}

	@Override
	public int questionVInsert(QuestionVVO vo) {
		return mapper.questionVInsert(vo);
	}

	@Override
	public int questionChangeProcess(int qNo) {
		return mapper.questionChangeProcess(qNo);
	}

	@Override
	public List<QuestionVVO> questionVSearch(QuestionVVO vo) {
		return mapper.questionVSearch(vo);
	}


}
