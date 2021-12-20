package co.kids.prj.report.service;

import java.sql.Date;


public class ReportVO {
	private int rpno;
	private String rptype;
	private String rptitle;
	private String rpcontent;
	private Date rpdate;
	private String iscleared;
	private String reporter;
	private String blackuser;
	public int getRpno() {
		return rpno;
	}
	public void setRpno(int rpno) {
		this.rpno = rpno;
	}
	public String getRptype() {
		return rptype;
	}
	public void setRptype(String rptype) {
		this.rptype = rptype;
	}
	public String getRptitle() {
		return rptitle;
	}
	public void setRptitle(String rptitle) {
		this.rptitle = rptitle;
	}
	public String getRpcontent() {
		return rpcontent;
	}
	public void setRpcontent(String rpcontent) {
		this.rpcontent = rpcontent;
	}
	public Date getRpdate() {
		return rpdate;
	}
	public void setRpdate(Date rpdate) {
		this.rpdate = rpdate;
	}
	public String getIscleared() {
		return iscleared;
	}
	public void setIscleared(String iscleared) {
		this.iscleared = iscleared;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getBlackuser() {
		return blackuser;
	}
	public void setBlackuser(String blackuser) {
		this.blackuser = blackuser;
	}
	
	
	
}
