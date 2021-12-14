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
	public QuestionAVO questionASelect(QuestionAVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int questionAInsert(QuestionAVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int questionAUpdate(QuestionAVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int questionADelete(QuestionAVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
