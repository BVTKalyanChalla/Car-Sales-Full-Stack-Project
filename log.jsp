<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("mail");
String password = request.getParameter("pass");

try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	PreparedStatement pst = con.prepareStatement("select fname from car where email='"+email+"' and password='"+password+"'");
    ResultSet rs= pst.executeQuery();
    if(rs.next())
	{
		response.sendRedirect("index.html");
	}
    else
	{
		out.print("<BR><BR><BR><center> <p style='color: red;'>INCORRECT EMAIL/PASSWORD</p> </center>");
		
	}
	
}
catch(Exception e)
	{
		out.println(e);
	
	}
	
%>

