<%

String [] loginInfo = new String[] { (String) request.getParameter("userName"), (String)request.getParameter("password")};
boolean isAuthenticated = false;
for(String loginData :loginInfo)
{
	isAuthenticated = "admin".equals(loginData);
	if(!isAuthenticated) break;
}
String msg = !isAuthenticated ? "Login or password is worng" : "";
String responseStr = "{ \"authenticated\" : " + "\"" + isAuthenticated + "\"" + 
					", \"msg\" : " + "\"" + msg + "\" }";
System.out.println(responseStr);
out.println(responseStr);
%>