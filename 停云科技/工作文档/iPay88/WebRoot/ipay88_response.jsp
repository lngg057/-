<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String MerchantCode = request.getParameter("MerchantCode");
	String PaymentId = request.getParameter("PaymentId");
	String RefNo = request.getParameter("RefNo");
	String Amount = request.getParameter("Amount");
	String eCurrency = request.getParameter("Currency");
	String Remark = request.getParameter("Remark");
	String TransId = request.getParameter("TransId");
	String AuthCode = request.getParameter("AuthCode");
	String eStatus = request.getParameter("Status");
	String ErrDesc = request.getParameter("ErrDesc");
	String Signature = request.getParameter("Signature");
	out.println("MerchantCode:"+MerchantCode +"<hr>");
	out.println("PaymentId:"+PaymentId +"<hr>");
	out.println("RefNo:"+RefNo +"<hr>");
	out.println("Amount:"+Amount +"<hr>");
	out.println("eCurrency:"+eCurrency +"<hr>");
	out.println("Remark:"+Remark +"<hr>");
	out.println("TransId:"+TransId +"<hr>");
	out.println("AuthCode:"+AuthCode +"<hr>");
	out.println("ErrDesc:"+ErrDesc +"<hr>");
	out.println("eStatus:"+eStatus +"<hr>");
	out.println("Signature:"+Signature +"<hr>");
%>
