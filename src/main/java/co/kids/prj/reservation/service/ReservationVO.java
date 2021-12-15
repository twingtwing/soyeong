package co.kids.prj.reservation.service;

import java.sql.Date;
import java.util.List;

import co.kids.prj.lodging.service.LodgingVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationVO {
	private int bookno;
	private int rno;
	private String id;
	private Date bookdate;
	private Date checkin;
	private Date checkout;
	private int bookadult;
	private int bookkid;
	private boolean ispaid;
	private boolean bookcancel;
	private String bookrefund;
	private String bookrequest;
	
}
