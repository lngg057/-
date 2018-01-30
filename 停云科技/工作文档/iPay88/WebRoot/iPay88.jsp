<%@ page language="java" import="java.util.*,java.security.*,sun.misc.BASE64Encoder" pageEncoding="utf-8"%>
<%
	  String MerchantKey = "GoodsPh@1";//商户Key
	  String RefNo = Long.toString(new Date().getTime());//订单号
	  String MerchantCode = "paypalpayments@ehao-online.com.ph";
	  String Amount = "15.00";
	  String Currency = "PHP";
	  
	  String str = MerchantKey + MerchantCode + RefNo + Amount.replaceAll("[.]", "") + Currency;	         
	  
	  String Signature = "";	  
	  try {
		  MessageDigest md = MessageDigest.getInstance("SHA");
		  md.update(str.getBytes("UTF-8")); 
		  byte raw[] = md.digest(); 
		  Signature = (new BASE64Encoder()).encode(raw);
	   } catch (Exception e) {
			
	   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>Virtual Payment Client Request Details</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<style type='text/css'>
    <!--
    body     { font-family:Verdana,Arial,sans-serif,Microsoft YaHei; font-size:10pt; color:#08185A background-color:#FFFFFF }
    input    { font-family:Verdana,Arial,sans-serif; font-size:8pt; color:#08185A; background-color:#E1E1E1; font-weight:bold }
    textarea { font-family:Verdana,Arial,sans-serif; font-size:8pt; color:#08185A; background-color:#E1E1E1; font-weight:normal; scrollbar-arrow-color:#08185A; scrollbar-base-color:#E1E1E1 }
    -->
</style></head>
<body>
<center>
<h1>iPay88 Online Payment</H1></center>
<p>kevin:<INPUT type="text" name="str" value="<%=str %>" width="60"> </p>
<form method="post" action="https://sandbox.ipay88.com.ph/epayment/entry.asp">
<p>商户Code:<INPUT type="text" name="MerchantCode" value="<%=MerchantCode %>"> </p>
<p>支付ID:<INPUT type="text" name="PaymentId" value="1"> </p>
<p>订单号:<INPUT type="text" name="RefNo" value="<%=RefNo %>"> </p>
<p>订单金额:<INPUT type="text" name="Amount" value="<%=Amount %>"> </p>
<p>货币:<INPUT type="text" name="Currency" value="PHP"> </p>
<p>订单描述:<INPUT type="text" name="ProdDesc" value="Photo Print"> </p>
<p>用户名:<INPUT type="text" name="UserName" value="Kevin Han"> </p>
<p>E-mail:<INPUT type="text" name="UserEmail" value="445251442@qq.com"> </p>
<p>联系电话"<INPUT type="text" name="UserContact" value="09171234567"> </p>
<p>备注:<INPUT type="text" name="Remark" value="Kevin Test iPay88"> </p>
<p>编码:<INPUT type="text" name="Lang" value="UTF-8"> </p>
<p>加密串:<INPUT type="text" name="Signature" value="<%=Signature %>"> </p>
<p>返回地址:<INPUT type="text" name="ResponseURL" value="http://127.0.0.1:8080/iPay88/ipay88_response.jsp"> </p>
<p>银行返回地址:<INPUT type="text" name="BackendURL" value="http://127.0.0.1:8080/iPay88/backend_response.html"> </p>
<p> 
	<input type="submit" name="SubButL" value="Pay Now!"> 
</p> 
</form>
</body>
</html>

