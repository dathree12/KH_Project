package com.kh.common.util;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class EncryptUtil {

	public static String oneWayEnc(String msg, String salt) {
		String encMsg = "";
		String saltedPwd = salt + msg;
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			byte[] bytes = saltedPwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			encMsg = Base64.getEncoder().encodeToString(md.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return encMsg;
	}
}
