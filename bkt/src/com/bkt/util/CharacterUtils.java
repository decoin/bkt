package com.bkt.util;

import java.util.Random;

public class CharacterUtils {
	
	public static String getRandomString(int length)
	{
		String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i < length;  i ++)
		{
			int number = random.nextInt(36);
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}

}
