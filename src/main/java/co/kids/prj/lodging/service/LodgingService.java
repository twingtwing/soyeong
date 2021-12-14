package co.kids.prj.lodging.service;

import java.util.List;

public interface LodgingService {
	List<LodgingVO> LodgingSelectList(LodgingVO vo);
	LodgingVO LodgingSelect(LodgingVO vo);
	int LodgingUpdateState(String ruse); // 사용중인지 아닌지 Y, N으로
	int LodgingUpdateInfo(LodgingVO vo);
	int LodgingDelete(int rno);
	int LodgingInsert(LodgingVO vo);
	List<LodgingVO> LodgingListByTag(LodgingVO vo);
}
