package upeta.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import upeta.admin.bean.registration;

public class Registrationdao {
	public static List<registration> getMemberByEmail(String email,String hostname) {
	    registration m=new registration();  
        List<registration> list=new ArrayList<registration>();  
  
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_registration WHERE createdby in(select createdby from upt_registration where email=? )");  
            ps.setString(1,email);  
            ResultSet rs=ps.executeQuery();
            if(rs.next() == true) {
            	do {        	
            		    registration n=new registration();  
            		    n.setId(rs.getString(1));
		                n.setFirstname(rs.getString(2));  
		                n.setLastname(rs.getString(3)); 
					    n.setEmail(rs.getString(4));
					    n.setUsername(rs.getString(5));
					    n.setPassword(rs.getString(6));
					    n.setPhone(rs.getString(7));
					    n.setAddress(rs.getString(8));
					    n.setGender(rs.getString(10));
					    n.setYeardob(rs.getString(12));
					    n.setRelation(rs.getString(16));
					    n.setKhometown(rs.getString(24));
					    n.setMal(rs.getString(25));
					    n.setHin(rs.getString(26));
					 
                list.add(n);     
                } while (rs.next());
 
                }
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }


}
