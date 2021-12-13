package co.kids.prj.notice.service;

import java.sql.Date;

public class NoticeVO {
	private int bno;
	private String id;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private String bstatus;
	private Date blastdate;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBstatus() {
		return bstatus;
	}
	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}
	public Date getBlastdate() {
		return blastdate;
	}
	public void setBlastdate(Date blastdate) {
		this.blastdate = blastdate;
	}
	
	
}
