package co.kids.prj.review.service;

public class ReviewVO {
	private int rvno;
	private int rno;
	private String id;
	private double rvstar;
	private String rvcontent;
	public int getRvno() {
		return rvno;
	}
	public void setRvno(int rvno) {
		this.rvno = rvno;
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
	public double getRvstar() {
		return rvstar;
	}
	public void setRvstar(double rvstar) {
		this.rvstar = rvstar;
	}
	public String getRvcontent() {
		return rvcontent;
	}
	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}
	
}
