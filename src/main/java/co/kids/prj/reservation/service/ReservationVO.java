package co.kids.prj.reservation.service;

import java.sql.Date;

public class ReservationVO {
	private int bookno;
	private int rno;
	private String id;
	private Date bookdate;
	private Date checkin;
	private Date checkout;
	private int bookadult;
	private int bookkid;
	private String ispaid;
	private String bookcancel;
	private String bookrefund;
	private String bookrequest;
	
	private int fee;
	private String name;
	private String rname;
	private String startDate;
	private String endDate;
	
	public String getBookrequest() {
		return bookrequest;
	}
	public void setBookrequest(String bookrequest) {
		this.bookrequest = bookrequest;
	}
	@Override
	public String toString() {
		return "ReservationVO [bookno=" + bookno + ", rno=" + rno + ", id=" + id + ", bookdate=" + bookdate
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", bookadult=" + bookadult + ", bookkid="
				+ bookkid + ", ispaid=" + ispaid + ", bookcancel=" + bookcancel + ", bookrefund=" + bookrefund + "]";
	}
	public int getBookno() {
		return bookno;
	}
	public void setBookno(int bookno) {
		this.bookno = bookno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getBookdate() {
		return bookdate;
	}
	public void setBookdate(Date bookdate) {
		this.bookdate = bookdate;
	}
	public Date getCheckin() {
		return checkin;
	}
	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}
	public Date getCheckout() {
		return checkout;
	}
	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	public int getBookadult() {
		return bookadult;
	}
	public void setBookadult(int bookadult) {
		this.bookadult = bookadult;
	}
	public int getBookkid() {
		return bookkid;
	}
	public void setBookkid(int bookkid) {
		this.bookkid = bookkid;
	}

	public String getIspaid() {
		return ispaid;
	}
	public void setIspaid(String ispaid) {
		this.ispaid = ispaid;
	}
	public String getBookcancel() {
		return bookcancel;
	}
	public void setBookcancel(String bookcancel) {
		this.bookcancel = bookcancel;
	}
	public String getBookrefund() {
		return bookrefund;
	}
	public void setBookrefund(String bookrefund) {
		this.bookrefund = bookrefund;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	
}
