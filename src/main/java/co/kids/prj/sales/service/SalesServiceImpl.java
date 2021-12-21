package co.kids.prj.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("salesDao")
public class SalesServiceImpl implements SalesService{
	@Autowired SalesMapper map;

	@Override
	public List<SalesVO> totalSales(SalesVO vo) {
		return map.totalSales(vo);
	}

}
