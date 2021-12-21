package co.kids.prj.admin.service;

import java.sql.Date;

public class AdminVO {
	private int rank;
	private int lnum;
	private String id;
	private String gender;
	private Date joindate;
	private int monthsales;
	private String monthdate;
	
	public int getMonthsales() {
		return monthsales;
	}
	public void setMonthsales(int monthsales) {
		this.monthsales = monthsales;
	}
	public String getMonthdate() {
		return monthdate;
	}
	public void setMonthdate(String monthdate) {
		this.monthdate = monthdate;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getLnum() {
		return lnum;
	}
	public void setLnum(int lnum) {
		this.lnum = lnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	} 
}
