package co.kids.prj.reservation.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservLodVO {
	private int rno;
	private String id;
	private String rcategory;
	private String rtype;
	private int rguest;
	private int rbed;
	private int rbath;
	private String raddress;
	private String rcontent;
	private int fee;
	private String am1;
	private String am2;
	private String am3;
	private String rphoto;
	private String ruse;
	private String rcheckin;
	private String rcheckout;
	private String rname;
	private String rtel;
	private int bookno;
	private Date bookdate;
	private Date checkin;
	private Date checkout;
	private int bookadult;
	private int bookkid;
	private boolean ispaid;
	private boolean bookcancel;
	private String bookrefund;
	private String bookrequest;
	private int imgno;
	private String orifile;
	private String pfile;
}
