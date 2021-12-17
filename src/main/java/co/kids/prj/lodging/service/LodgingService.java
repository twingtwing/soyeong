package co.kids.prj.lodging.service;

import java.util.List;

public interface LodgingService {
	List<LodgingVO> LodgingSelectList(LodgingVO vo);
	List<LodgingVO> LodgingSelectMyList(LodgingVO vo);
	LodgingVO LodgingSelect(LodgingVO vo);
	int LodgingUpdateState(LodgingVO vo); // 사용중인지 아닌지 Y, N으로
	int LodgingUpdateInfo(LodgingVO vo);
	int LodgingDelete(int rno);
	int LodgingInsert(LodgingVO vo);
	List<LodgingVO> LodgingSearchList(LodgingVO vo); // 메인화면에서 검색
	LodgingVO LodgingNum();
}
