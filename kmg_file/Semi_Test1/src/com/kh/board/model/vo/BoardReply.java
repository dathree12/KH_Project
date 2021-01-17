package com.kh.board.model.vo;

import java.sql.Date;

public class BoardReply {
	private int replyNo;
	
	private int boardNo;
	
	private int replyWriterNo;
	
	private String userId;
	
	private String replyContent;	
	
	private Date replyCreateDate;
	
	private Date replyModifyDate;

	private String status;
	
	public BoardReply() {
		// TODO Auto-generated constructor stub
	}
	
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReplyWriterNo() {
		return replyWriterNo;
	}

	public void setReplyWriterNo(int replyWriterNo) {
		this.replyWriterNo = replyWriterNo;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public Date getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Date replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BoardReply(int replyNo, int boardNo, int replyWriterNo, String userId, String replyContent,
			Date replyCreateDate, Date replyModifyDate, String status) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.replyWriterNo = replyWriterNo;
		this.userId = userId;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.status = status;
	}

	@Override
	public String toString() {
		return "BoardReply [replyNO=" + replyNo + ", boardNo=" + boardNo + ", replyWriterNo=" + replyWriterNo
				+ ", userId=" + userId + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", status=" + status + "]";
	}

	
}
