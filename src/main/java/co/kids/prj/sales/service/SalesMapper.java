package co.kids.prj.sales.service;

import java.util.List;

public interface SalesMapper {
	List<SalesVO> totalSales(SalesVO vo);
	int insertSales(SalesVO vo);
}
