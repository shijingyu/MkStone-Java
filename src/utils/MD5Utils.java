package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
	public static String toMD5(String password) {
		StringBuffer sb;
		try {
			MessageDigest MD5 = MessageDigest.getInstance("MD5");
			byte[] digest = MD5.digest(password.getBytes());
			sb = new StringBuffer();

			for (byte b : digest) {
				int a = b & 0xFF;
				String hexString = Integer.toHexString(a);
				if (hexString.length() < 2) {
					hexString = "0" + hexString;
				}

				sb.append(hexString);
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return "";
	}

}
