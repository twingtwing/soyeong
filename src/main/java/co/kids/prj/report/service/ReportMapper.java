package co.kids.prj.report.service;

import java.util.List;

public interface ReportMapper {
	List<ReportVO> reportSelectList();
	ReportVO reportSelect(int rpno);
	int reportClear(int rpno);
}
