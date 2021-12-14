package co.kids.prj.lodging.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("LodgingDao")
public class LodgingServiceImpl implements LodgingService {
	@Autowired LodgingMapper map;
	
	@Override
	public List<LodgingVO> LodgingSelectList(LodgingVO vo) {
		return map.LodgingSelectList(vo);
	}

	@Override
	public LodgingVO LodgingSelect(LodgingVO vo) {
		return null;
	}

	@Override
	public int LodgingUpdateState(String state) {
		return 0;
	}

	@Override
	public int LodgingUpdateInfo(LodgingVO vo) {
		return 0;
	}

	@Override
	public int LodgingDelete(int rno) {
		return 0;
	}

	@Override
	public int LodgingInsert(LodgingVO vo) {
		// TODO Auto-generated method stub
		return map.LodgingInsert(vo);
	}

}
