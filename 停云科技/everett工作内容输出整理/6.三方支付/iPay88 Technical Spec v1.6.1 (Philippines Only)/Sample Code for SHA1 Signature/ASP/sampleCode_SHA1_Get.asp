<%
Response.write "<br>Hash : " & GetSHA1("applePH00001A000000011500PHP")

'=================================== Start HTTP Get =================================================
Function GetSHA1(strKey)
	Dim returnString, SoapPara, SoapURL
	
	Set SoapRequest = Server.CreateObject("MSXML2.XMLHTTP.3.0") 
	Set myXML =Server.CreateObject("MSXML.DOMDocument")

	myXML.Async=False

	SoapPara = "Key=" & strKey


	If SoapPara <> "" Then

		SoapURL = "https://payment.ipay88.com.ph/ePayment/Security/Security.asmx/Signature?" & SoapPara
		SoapRequest.Open "GET",SoapURL , False 
		SoapRequest.Send()
		if Not myXML.load(SoapRequest.responseXML) then 'an Error loading XML 
		    GetSHA1 = "" 
		Else  
		    Set nodesDecimal=myXML.documentElement.selectNodes("//string") 
		    GetSHA1 = nodesDecimal(0).text
		end if
	
		Set SoapRequest = Nothing 
		Set myXML = Nothing
	End If
	
	
End Function


'===================================== End HTTP POST =================================================
%>