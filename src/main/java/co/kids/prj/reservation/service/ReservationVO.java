package co.kids.prj.reservation.service;

import java.sql.Date;
import java.util.List;

import co.kids.prj.lodging.service.LodgingVO;
import lombok.Getter;
import lombok.Setter;

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
	public boolean isIspaid() {
		return ispaid;
	}
	public void setIspaid(boolean ispaid) {
		this.ispaid = ispaid;
	}
	public boolean isBookcancel() {
		return bookcancel;
	}
	public void setBookcancel(boolean bookcancel) {
		this.bookcancel = bookcancel;
	}
	public String getBookrefund() {
		return bookrefund;
	}
	public void setBookrefund(String bookrefund) {
		this.bookrefund = bookrefund;
	}
	
}
