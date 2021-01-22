package com.kh.ServiceCenter.model.vo;

import java.sql.Date;

public class NOTICE {
	private int NNUM;
	private int User_Num;
	private String NTITLE;
	private String NCONTENT;
	private Date NDATE;
	private int NHIT;
	
	public NOTICE() {
	}

	public NOTICE(int nNUM, int user_Num, String nTITLE, String nCONTENT, Date nDATE, int nHIT) {
		super();
		NNUM = nNUM;
		User_Num = user_Num;
		NTITLE = nTITLE;
		NCONTENT = nCONTENT;
		NDATE = nDATE;
		NHIT = nHIT;
	}

	public int getNNUM() {
		return NNUM;
	}

	public void setNNUM(int nNUM) {
		NNUM = nNUM;
	}

	public int getUser_Num() {
		return User_Num;
	}

	public void setUser_Num(int user_Num) {
		User_Num = user_Num;
	}

	public String getNTITLE() {
		return NTITLE;
	}

	public void setNTITLE(String nTITLE) {
		NTITLE = nTITLE;
	}

	public String getNCONTENT() {
		return NCONTENT;
	}

	public void setNCONTENT(String nCONTENT) {
		NCONTENT = nCONTENT;
	}

	public Date getNDATE() {
		return NDATE;
	}

	public void setNDATE(Date nDATE) {
		NDATE = nDATE;
	}

	public int getNHIT() {
		return NHIT;
	}

	public void setNHIT(int nHIT) {
		NHIT = nHIT;
	}

	@Override
	public String toString() {
		return "NOTICE [NNUM=" + NNUM + ", User_Num=" + User_Num + ", NTITLE=" + NTITLE + ", NCONTENT=" + NCONTENT
				+ ", NDATE=" + NDATE + ", NHIT=" + NHIT + "]";
	}
}



































