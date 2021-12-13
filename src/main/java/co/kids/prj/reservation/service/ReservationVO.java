package co.kids.prj.reservation.service;

import java.sql.Date;

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
	
}
