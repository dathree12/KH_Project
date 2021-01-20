package com.kh.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.kh.common.util.EncryptUtil;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}

	// 재 정의 하고싶은 메소드를 작성한다.
	@Override
	public String getParameter(String name) {
		// client가 전달하는 값중에 비밀번호 name값만 암호화를 처리하고 나머지는 정상적으로 리턴하도록 처리
		System.out.println("name: " + name + ", super.getParameter(name) : " + super.getParameter(name));
		if (name.equals("userPwd")) {
			// 기존 비밀번호 name값 암호화 처리 후 반환
			return EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
		} else if (name.equals("newPwd")) {
			// 새 비밀번호 name값 암호화 처리 후 반환
			return EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
		} else {
			// 정상적으로 반환
			return super.getParameter(name);
		}
	}
}