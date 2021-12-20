package co.kids.prj.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper map;

	@Override
	public String yearAgoSelect() {
		// TODO Auto-generated method stub
		return map.yearAgoSelect();
	}

	@Override
	public int yearUsers() {
		// TODO Auto-generated method stub
		return map.yearUsers();
	}

	@Override
	public int yearSales() {
		// TODO Auto-generated method stub
		return map.yearSales();
	}

	@Override
	public int yearReservations() {
		// TODO Auto-generated method stub
		return map.yearReservations();
	}

	@Override
	public int yearReviews() {
		// TODO Auto-generated method stub
		return map.yearReviews();
	}

	@Override
	public List<AdminVO> hostTop10() {
		// TODO Auto-generated method stub
		return map.hostTop10();
	}

	@Override
	public List<AdminVO> monthSelect() {
		// TODO Auto-generated method stub
		return map.monthSelect();
	}

}
