package upeta.admin.dao;

import java.sql.*;

public class Logindao {
	public static boolean validate(String name,String pass){  
		boolean status=false;  
		try{  
		Class.forName("org.mariadb.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mariadb://207.246.241.5:3306/2000186_upeta\",\"2000186_upeta\",\"Sreyo123");  
		      
		PreparedStatement ps=con.prepareStatement(  
				"select * from User where Email=? and Password=?");  
		ps.setString(1,name);  
		ps.setString(2,pass);  
		      
		ResultSet rs=ps.executeQuery();  
		status=rs.next();  
		          
		}catch(Exception e){System.out.println(e);}  
		return status;  
		}  
		}  


