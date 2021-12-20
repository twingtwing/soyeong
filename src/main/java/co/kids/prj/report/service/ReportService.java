package co.kids.prj.report.service;

import java.util.List;

public interface ReportService {
	List<ReportVO> reportSelectList();
	ReportVO reportSelect(int rpno);
	int reportClear(int rpno);
	List<ReportVO> reportSearch(ReportVO vo);
	int reportInsert(ReportVO vo);
}