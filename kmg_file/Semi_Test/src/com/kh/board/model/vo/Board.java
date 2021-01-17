package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	
	private String boardTitle;
	
	private String boardContent;
	
	private String boardImageFile;

	private Date boardCreateDate;
	
	private Date boardModifyDate;
	
	private String veganlist;
	
	private String situation;
	
	private int boardReadCount;
	
	private String status;
	
	private String imagefile1;
	
	private String imagefile2;
	
	private String imagefile3;
	
	public Board() {
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardImageFile() {
		return boardImageFile;
	}

	public void setBoardImageFile(String boardImageFile) {
		this.boardImageFile = boardImageFile;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public Date getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}

	
	public String getVeganlist() {
		return veganlist;
	}

	public void setVeganlist(String veganlist) {
		this.veganlist = veganlist;
	}

	public String getSituaion() {
		return situation;
	}

	public void setSituaion(String situaion) {
		this.situation = situaion;
	}

	
	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

	public String getImagefile1() {
		return imagefile1;
	}

	public void setImagefile1(String imagefile1) {
		this.imagefile1 = imagefile1;
	}

	public String getImagefile2() {
		return imagefile2;
	}

	public void setImagefile2(String imagefile2) {
		this.imagefile2 = imagefile2;
	}

	public String getImagefile3() {
		return imagefile3;
	}

	public void setImagefile3(String imagefile3) {
		this.imagefile3 = imagefile3;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardImageFile=" + boardImageFile + ", boardCreateDate=" + boardCreateDate + ", boardModifyDate="
				+ boardModifyDate + ", veganlist=" + veganlist + ", situation=" + situation + ", boardReadCount="
				+ boardReadCount + ", status=" + status + ", imagefile1=" + imagefile1 + ", imagefile2=" + imagefile2
				+ ", imagefile3=" + imagefile3 + "]";
	}

	public Board(int boardNo, String boardTitle, String boardContent, String boardImageFile, Date boardCreateDate,
			Date boardModifyDate, String veganlist, String situation, int boardReadCount, String status,
			String imagefile1, String imagefile2, String imagefile3) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardImageFile = boardImageFile;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.veganlist = veganlist;
		this.situation = situation;
		this.boardReadCount = boardReadCount;
		this.status = status;
		this.imagefile1 = imagefile1;
		this.imagefile2 = imagefile2;
		this.imagefile3 = imagefile3;
	}

	
	
	
	
}