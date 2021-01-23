package com.kh.mvc.ServiceCenter.model.vo;

import java.sql.Date;

public class QnA {
	
	private int Que_Num;
	private int rowNum;
	private int User_Num;
	private String Que_Title;
	private String Que_Content;
	private Date Que_Date;
	private int HIT;
	private int QGROUP;
	private int STEP;
	private int QINDENT;
	
	public QnA() {
	}

	public QnA(int que_Num, int rowNum, int user_Num, String que_Title, String que_Content, Date que_Date, int hIT,
			int qGROUP, int sTEP, int qINDENT) {
		super();
		Que_Num = que_Num;
		this.rowNum = rowNum;
		User_Num = user_Num;
		Que_Title = que_Title;
		Que_Content = que_Content;
		Que_Date = que_Date;
		HIT = hIT;
		QGROUP = qGROUP;
		STEP = sTEP;
		QINDENT = qINDENT;
	}
	
	public int getQue_Num() {
		return Que_Num;
	}

	public void setQue_Num(int que_Num) {
		Que_Num = que_Num;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getUser_Num() {
		return User_Num;
	}

	public void setUser_Num(int user_Num) {
		User_Num = user_Num;
	}

	public String getQue_Title() {
		return Que_Title;
	}

	public void setQue_Title(String que_Title) {
		Que_Title = que_Title;
	}

	public String getQue_Content() {
		return Que_Content;
	}

	public void setQue_Content(String que_Content) {
		Que_Content = que_Content;
	}

	public Date getQue_Date() {
		return Que_Date;
	}

	public void setQue_Date(Date que_Date) {
		Que_Date = que_Date;
	}

	public int getHIT() {
		return HIT;
	}

	public void setHIT(int hIT) {
		HIT = hIT;
	}

	public int getQGROUP() {
		return QGROUP;
	}

	public void setQGROUP(int qGROUP) {
		QGROUP = qGROUP;
	}

	public int getSTEP() {
		return STEP;
	}

	public void setSTEP(int sTEP) {
		STEP = sTEP;
	}

	public int getQINDENT() {
		return QINDENT;
	}

	public void setQINDENT(int qINDENT) {
		QINDENT = qINDENT;
	}

	@Override
	public String toString() {
		return "QnA [Que_Num=" + Que_Num + ", rowNum=" + rowNum + ", User_Num=" + User_Num + ", Que_Title=" + Que_Title
				+ ", Que_Content=" + Que_Content + ", Que_Date=" + Que_Date + ", HIT=" + HIT + ", QGROUP=" + QGROUP
				+ ", STEP=" + STEP + ", QINDENT=" + QINDENT + "]";
	}
}



