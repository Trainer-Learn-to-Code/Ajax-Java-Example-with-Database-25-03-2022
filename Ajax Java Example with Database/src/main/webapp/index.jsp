<%@ page import="java.sql.*"%>
<%
String s = request.getParameter("val");
if (s == null || s.trim().equals("")) {
	out.print("Please enter id");
} else {
	int id = Integer.parseInt(s);
	out.print(id);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_160", "javadb_160",
		"fdefedweed");
		PreparedStatement ps = con.prepareStatement("select * from emp where id=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
	out.print(" "+ rs.getString(2)+"  "+rs.getInt(3));
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>