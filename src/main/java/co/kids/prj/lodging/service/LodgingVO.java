package co.kids.prj.lodging.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LodgingVO {
	private int rno;
	private String id;
	private String rcategory;
	private String rtype;
	private int rguest;
	private int rbed;
	private int rbath;
	private String rcontent;
	private int fee;
	private String am1;
	private String am2;
	private String am3;
	private String rphoto;
	private String ruse;
	private Date checkin;
	private Date checkout;
}
