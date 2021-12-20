package co.kids.prj.admin.service;

import java.util.List;

public interface AdminMapper {
	String yearAgoSelect();
	int yearUsers();
	int yearSales();
	int yearReservations();
	int yearReviews();
	List<AdminVO> hostTop10();
	List<AdminVO> monthSelect();
	
}
