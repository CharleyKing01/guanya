package org.charley.util;

import java.util.Random;

/**
 * 验证码获取工具
 * @author xi.yang
 *
 */
public class VerifyCodeUtils {
	
	/**
	 * 获取4位验证码
	 * @return
	 */
	public static String getIdCode() { //length表示生成字符串的长度
	    String base = "0123456789";   
	    Random random = new Random();   
	    StringBuffer sb = new StringBuffer();   
	    for (int i = 0; i < 4; i++) {   
	        int number = random.nextInt(base.length());   
	        sb.append(base.charAt(number));   
	    }   
	    return sb.toString();   
	 }   
	
	public static void main(String[] args) {
		System.out.println(VerifyCodeUtils.getIdCode());
		
	}
}