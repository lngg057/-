package pub;

import java.security.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import sun.misc.BASE64Encoder;

	public class Tool {
		public static String iPay88Encoder(String str) {
			MessageDigest md;
			try {
				md = MessageDigest.getInstance("SHA");
				md.update(str.getBytes("UTF-8")); 
				byte raw[] = md.digest(); 
				String hash = (new BASE64Encoder()).encode(raw);
				return hash; 
			} catch (NoSuchAlgorithmException e) {
				
			} catch (java.io.UnsupportedEncodingException e) {
				
			}
			return null;
		}
		
	  public   static   String StringFilter(String   str)   throws   Exception   {     
           // 只允许字母和数字       
           // String   regEx  =  "[^a-zA-Z0-9]";                     
           // 清除掉所有特殊字符  
	       String regEx="[^\\w ]*";  
	       Pattern   p   =   Pattern.compile(regEx);     
	       Matcher   m   =   p.matcher(str);     
	       return   m.replaceAll("").trim();     
       }	

	public static void main(String[] args) throws   Exception{
	  String Amount = "12.,,.15.00";
	  System.out.println(Amount.replaceAll("[,.]", ""));	// string to hash is here 
	  
	  String   str   =   "O+ 8.15 Air Shuffle Androi[][][][][],./!@#$%^&*()_+d 4.2 8/GB (White)"; 
      str = str.replaceAll("[^\\w ]*", "").trim();
      str = str.replaceAll(" ", "_");
      System.out.println(str); 
	}
}