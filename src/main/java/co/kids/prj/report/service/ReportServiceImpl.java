package co.kids.prj.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reportDao")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportMapper map;
	
	@Override
	public List<ReportVO> reportSelectList() {
		return map.reportSelectList();
	}

	@Override
	public ReportVO reportSelect(int rpno) {
		return map.reportSelect(rpno);
	}

	@Override
	public int reportClear(int rpno) {
		return map.reportClear(rpno);
	}

	@Override
	public List<ReportVO> reportSearch(ReportVO vo) {
		return map.reportSearch(vo);
	}

	@Override
	public int reportInsert(ReportVO vo) {
		return map.reportInsert(vo);
	}

}
