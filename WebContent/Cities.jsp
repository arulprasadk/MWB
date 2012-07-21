<%
String query = request.getParameter("queryText");
String responseforQuery = new StringBuilder("{ \"responseforQuery\" : \"").append(query.toUpperCase()).append("\"}").toString();
out.println(responseforQuery);
System.out.println(responseforQuery);
%>
