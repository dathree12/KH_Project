package com.kh.vef.common.util;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class EncryptUtil {

	public static String oneWayEnc(String message, String algorithm) {
		String encMessage = "";
		
		try {
			// 메시지 다이제스트란, 입력 값의 길이에 상관없이 수학적인 연산을 항상 동일한 길이의 해시 값을 만들어 낸다.
			MessageDigest md = MessageDigest.getInstance(algorithm);
			// 임시 소금 MD-5 "VeganFriends"
			String saltedMessage = message + "458F4AB5A034BCEE62D7000A2C1DBA92";
			System.out.println(message);
			System.out.println(saltedMessage);
			byte[] bytes = saltedMessage.getBytes(Charset.forName("UTF-8"));
			
			// 평문을 byte[] 변환하여 메시지 다이제스트로 전달한다.
			md.update(bytes);
			
			// 암호화 형식에 맞게 변경하여 byte[]로 돌려받은 후 Base64를 사용하여 byte 형식의 데이터를 문자열로 Encoding 한다.
			//  - Base64란 Binary Data를 Text로 바꾸는 Encoding(binary-to-text encoding schemes)의 하나로써 
			//    Binary Data를 Character set에 영향을 받지 않는 공통 ASCII 영역의 문자로만 이루어진 문자열로 바꾸는 Encoding이다.
			//  - Binary Data를 6 bit 씩 자른 뒤 6 bit에 해당하는 문자를 아래 Base64 색인표에서 찾아 치환한다. 
			encMessage = Base64.getEncoder().encodeToString(md.digest());
			
			System.out.println("Original Message : " + message + " >>>>> " + saltedMessage + " >>>>> " + algorithm +" Encoding Message : " + encMessage);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encMessage;
	}
}
