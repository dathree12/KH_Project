package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNum;
	private String userId;
	private String userPwd;
	private String email;
	private Date enrollDate;
	private String vegType;
	private String userRole;
	private String status;

	public Member() {
	}

	public Member(int userNum, String userId, String userPwd, String email, Date enrollDate,
			String vegType, String userRole, String status) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.enrollDate = enrollDate;
		this.vegType = vegType;
		this.userRole = userRole;
		this.status = status;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getVegType() {
		return vegType;
	}

	public void setVegType(String vegType) {
		this.vegType = vegType;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNum=" + userNum + ", userId=" + userId + ", userPwd=" + userPwd + ", email=" + email
				+ ", userName=" + enrollDate + ", vegType=" + vegType + ", userRole="
				+ userRole + ", status=" + status + "]";
	}

}
