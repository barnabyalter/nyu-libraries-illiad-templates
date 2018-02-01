<%@Language=VBScript CodePage = 65001%>
<%
Session.CodePage = 65001
Response.charset ="utf-8"
Session.LCID     = 1033 'en-US
%>
<%
	'setup variables
	dim errorType, fileBase, absolutePath
	'The error type 404, 403, 500 and 422 (in some occasions)
	if not IsEmpty(Request.QueryString("error")) then
		errorType = Request.QueryString("error")
	end if

	'Prepend this absolute path to links and images
	'for when page is called from non-local server
	absolutePath = "https://library.nyu.edu"

	'The file base for the error page wrapper
	If not IsEmpty(errorType) and errorType = 500 Then
	  fileBase = absolutePath & "/500.html"
	ElseIf not IsEmpty(errorType) and errorType = 403 Then
	  fileBase = absolutePath & "/403.html"
	Else
	  fileBase = absolutePath & Request.ServerVariables("script_name")
	End If

	'Setup http call to get file contents
	set xmlhttp = CreateObject("MSXML2.ServerXMLHTTP")
	xmlhttp.open "GET", fileBase, false
	xmlhttp.send ""

	'Print error if URL couldnt be found
	if err.number <> 0 then
		response.write "URL not found."
	else
	'Make links absolute for attributes: link, src, action, href
		Dim regEx, printText
		Set regEx = New RegExp
		regEx.Global = True
		regEx.IgnoreCase = True
		regEx.Pattern = "<head>"
		printText = regEx.Replace(xmlhttp.responseText, "<head><base href=""" & absolutePath & """ />")
		response.write printText
	end if

	set xmlhttp = nothing
%>
