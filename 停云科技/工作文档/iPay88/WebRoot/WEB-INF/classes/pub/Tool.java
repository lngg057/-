// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Tool.java

package pub;

import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import sun.misc.BASE64Encoder;

public class Tool
{

	public Tool()
	{
	}

	public static String iPay88Encoder(String str)
	{
		String hash;
		MessageDigest md = MessageDigest.getInstance("SHA");
		md.update(str.getBytes("UTF-8"));
		byte raw[] = md.digest();
		hash = (new BASE64Encoder()).encode(raw);
		return hash;
		Object obj;
		obj;
		break MISSING_BLOCK_LABEL_40;
		obj;
		return null;
	}

	public static String StringFilter(String str)
		throws Exception
	{
		String regEx = "[^\\w ]*";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		return m.replaceAll("").trim();
	}

	public static void main(String args[])
		throws Exception
	{
		String Amount = "12.,,.15.00";
		System.out.println(Amount.replaceAll("[,.]", ""));
		String str = "O+ 8.15 Air Shuffle Androi[][][][][],./!@#$%^&*()_+d 4.2 8/GB (White)";
		str = str.replaceAll("[^\\w ]*", "").trim();
		str = str.replaceAll(" ", "_");
		System.out.println(str);
	}
}
