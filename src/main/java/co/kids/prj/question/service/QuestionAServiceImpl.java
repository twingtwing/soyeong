package co.kids.prj.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("questionADao")
public class QuestionAServiceImpl implements QuestionAService {
	@Autowired private QuestionAMapper mapper;

	@Override
	public List<QuestionAVO> questionAList() {
		return mapper.questionAList();
	}

	@Override
	public QuestionAVO questionASelect(int fNo) {
		return mapper.questionASelect(fNo);
	}

	@Override
	public int questionAInsert(QuestionAVO vo) {
		return mapper.questionAInsert(vo);
	}

	@Override
	public int questionAUpdate(QuestionAVO vo) {
		return mapper.questionAUpdate(vo);
	}

	@Override
	public int questionADelete(int fNo) {
		return mapper.questionADelete(fNo);
	}

}
