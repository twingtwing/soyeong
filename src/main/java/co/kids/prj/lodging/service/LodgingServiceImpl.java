package co.kids.prj.lodging.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("LodgingDao")
public class LodgingServiceImpl implements LodgingService {
	@Autowired LodgingMapper map;
	
	@Override
	public List<LodgingVO> LodgingSelectList() {
		return map.LodgingSelectList();
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

}
