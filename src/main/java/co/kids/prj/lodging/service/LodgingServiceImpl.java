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
		return map.LodgingSelect(vo);
	}

	@Override
	public int LodgingUpdateState(String ruse) {
		return map.LodgingUpdateState(ruse);
	}

	@Override
	public int LodgingUpdateInfo(LodgingVO vo) {
		return map.LodgingUpdateInfo(vo);
	}

	@Override
	public int LodgingDelete(int rno) {
		return map.LodgingDelete(rno);
	}


	@Override
	public int LodgingInsert(LodgingVO vo) {
		return map.LodgingInsert(vo);
	}

	@Override
	public LodgingVO LodgingNum() {
		// TODO Auto-generated method stub
		return map.LodgingNum();
	}


}
