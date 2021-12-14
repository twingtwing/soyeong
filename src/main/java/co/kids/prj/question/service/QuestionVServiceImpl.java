package co.kids.prj.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("questionVDao")
public class QuestionVServiceImpl implements QuestionVService{
	@Autowired private QuestionVMapper mapper;

	@Override
	public List<QuestionVVO> questionVList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QuestionVVO questionVSelect(QuestionVVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int questionVInsert(QuestionVVO vo) {
		return mapper.questionVInsert(vo);
	}

	@Override
	public int questionChangeProcess(QuestionVVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
