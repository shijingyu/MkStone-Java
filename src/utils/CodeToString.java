package utils;

import java.io.UnsupportedEncodingException;

public class CodeToString {
	// ���������ַ����ĺ���
	public String codeString(String str) {
		String s = str;
		try {
			byte[] temp = s.getBytes("utf-8");
			s = new String(temp);
			return s;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return s;
		}
	}
}
