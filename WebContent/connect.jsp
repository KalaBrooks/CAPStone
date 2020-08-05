
<%@ page import = "java.sql.*"%>
<%
String name = request.getParameter("name");
String password = request.getParameter("password");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/capstone","root","Kala");
	PreparedStatement statement = connection.prepareStatement("insert into agent(name,password,phone,address)values(?,?,?,?);");
	statement.setString(1,name);
	statement.setString(2,password);
	statement.setString(3,phone);
	statement.setString(4,address);
	int x = statement.executeUpdate();
	if (x> 0){
		System.out.println("Agent Registered...");
		
	}
	else {
		System.out.println("Failed....");
	}
		
	
} catch (Exception e) {
    System.out.println(e);
    
}







%>
