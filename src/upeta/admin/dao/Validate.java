package upeta.admin.dao;

import java.sql.*;

import upeta.admin.dao.DBconnect;

public class Validate {
    public static boolean checkUser(String email,String hostname,String pass) 
    {  
        boolean st =false;
        try {

            Connection con = DBconnect.initializeDatabase(hostname);
			String newh = new String("viswagokulam.org");
			String kala = new String("kalakendram.org");
			String hks = new String("hindukeralasociety.managedorg.com");


			if(hostname.equals(newh)) {
				String admin = new String("admin@sreyo.com");
	            if(email.equals(admin)) {

	            PreparedStatement ps = con.prepareStatement("select * from upt_registration where email=? and password=?");
	            ps.setString(1, email);
	            ps.setString(2, pass);
	            ResultSet rs =ps.executeQuery();System.out.println(ps);
	            st = rs.next();}else {
		            PreparedStatement ps = con.prepareStatement("select * from upt_registration where email=? and password=?");
		            ps.setString(1, email);
		            ps.setString(2, pass);
		            ResultSet rs =ps.executeQuery();System.out.println(ps);
		            st = rs.next();
	            }

			}else if(hostname.equals(kala)) {
				String admin = new String("admin@sreyo.com");
	            if(email.equals(admin)) {

	            PreparedStatement ps = con.prepareStatement("select * from upt_registration where email=? and password=?");
	            ps.setString(1, email);
	            ps.setString(2, pass);
	            ResultSet rs =ps.executeQuery();System.out.println(ps);
	            st = rs.next();}else {
		            PreparedStatement ps = con.prepareStatement("select * from upt_registration where email=? and password=?");
		            ps.setString(1, email);
		            ps.setString(2, pass);
		            ResultSet rs =ps.executeQuery();System.out.println(ps);
		            st = rs.next();
	            }
			}else if(hostname.equals(hks)) {System.out.println("hks");
				String admin = new String("admin@sreyo.com");
	            if(email.equals(admin)) {

	            PreparedStatement ps = con.prepareStatement("select * from upt_registration where email=? and password=?");
	            ps.setString(1, email);
	            ps.setString(2, pass);
	            ResultSet rs =ps.executeQuery();System.out.println(ps);
	            st = rs.next();}else {
		            PreparedStatement ps = con.prepareStatement("select * from upt_registration where email=? and password=?");
		            ps.setString(1, email);
		            ps.setString(2, pass);
		            ResultSet rs =ps.executeQuery();System.out.println(ps);
		            st = rs.next();
	            }

			}else {
				String admin = new String("admin@sreyo.com");
	            if(email.equals(admin)) {
		            PreparedStatement ps = con.prepareStatement("select * from User where Email=? and Password=?");
		            ps.setString(1, email);
		            ps.setString(2, pass);
		            ResultSet rs =ps.executeQuery();
		            st = rs.next();
	            }else{
	                PreparedStatement ps = con.prepareStatement("select * from upt_member where email=? and password=?");
	                ps.setString(1, email);
	                ps.setString(2, pass);
	                ResultSet rs =ps.executeQuery();
	                st = rs.next();
	            }		}

	            con.close();  
			}
        catch(Exception e) {
            e.printStackTrace();
        }
        return st;                 
    }   
}
