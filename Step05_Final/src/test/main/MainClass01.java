package test.main;

import java.net.URLDecoder;
import java.net.URLEncoder;

public class MainClass01 {
	public static void main(String[] args) {
		String str="abcd1234";
		String str2="가";
		String str3="?";
		String str4="가나다abc?=&";
		
		String result=URLEncoder.encode(str);
		String result2=URLEncoder.encode(str2);
		String result3=URLEncoder.encode(str3);
		String result4=URLEncoder.encode(str4);
		
		System.out.println(result);
		System.out.println(result2);
		System.out.println(result3);
		System.out.println(result4);
		
		String result5=URLDecoder.decode(result);
		String result6=URLDecoder.decode(result2);
		String result7=URLDecoder.decode(result3);
		String result8=URLDecoder.decode(result4);
		
		System.out.println(result5);
		System.out.println(result6);
		System.out.println(result7);
		System.out.println(result8);
	}
}
