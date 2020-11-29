package upeta.admin.dao;
import upeta.admin.bean.organization;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import upeta.admin.dao.DBconnect;




public class Organizationdao {

    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("org.mariadb.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123");
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int save(organization o,String hostname){  
        int status=0;  
        try{  
			Connection con = DBconnect.initializeDatabase(hostname);
             PreparedStatement ps=con.prepareStatement(  
                         "INSERT INTO `upt_organization`( `orgid`,`parentid`, `name`, `uptgrouptype`,`address`,`createdby`) VALUES (?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS); 
            ps.setString(1,o.getOrgid());  
            ps.setString(2,o.getParentid());  
            ps.setString(3,o.getName());  
            ps.setString(4,o.getUptgrouptype());  
            ps.setString(5,o.getAddress());  
            ps.setString(6,o.getCreatedby());  
            status=ps.executeUpdate();  
            
    		ResultSet rs = ps.getGeneratedKeys();
    		int generatedKey = 0;
    		if (rs.next()) {
    		generatedKey = rs.getInt(1);
    		}
    		String neworgid ="ORG-ID-"+generatedKey ;
			
			PreparedStatement up=con.prepareStatement( "UPDATE upt_organization SET orgid=?,parentid=? WHERE id=?");
	        up.setString(1,neworgid);  
	        up.setString(2,neworgid);  
	        up.setInt(3,generatedKey);  
	        status=up.executeUpdate();  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
        
        
          
        return status;  
    }  
    public static List<organization> getAllorganization(String hostname){  
    	
        List<organization> list=new ArrayList<organization>();  
          
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_organization");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                organization o=new organization();  
                o.setId(rs.getInt(1));
				o.setParentid(rs.getString(3));
				o.setName(rs.getString(4));  
                o.setAddress(rs.getString(5));  
                list.add(o);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    public static organization getOrganizationeById(int id, String hostname){  
        organization o=new organization();  
          
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_organization WHERE id=?");  
            ps.setInt(1,id);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
                o.setId(rs.getInt(1));  
                o.setName(rs.getString(2));  
                o.setAddress(rs.getString(3));  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return o;  
    	}

	/*
	 * public static organization getOrganizationeByName(int id){ organization o=new
	 * organization();
	 * 
	 * try{ Connection con=Organizationdao.getConnection(); PreparedStatement
	 * ps=con.prepareStatement("SELECT * FROM upt_organization WHERE id=?");
	 * ps.setInt(1,id); ResultSet rs=ps.executeQuery(); if(rs.next()){
	 * o.setId(rs.getInt(1)); o.setName(rs.getString(2));
	 * o.setAddress(rs.getString(3)); } con.close(); }catch(Exception
	 * ex){ex.printStackTrace();}
	 * 
	 * return o; }
	 * 
	 * 
	 */
    public static int update(organization o, String hostname){  
    int status=0;  
    try{  
        Connection con = DBconnect.initializeDatabase(hostname); 
        PreparedStatement ps=con.prepareStatement(  
                     "UPDATE upt_organization SET name=?,address=? WHERE id=?");  
        ps.setString(1,o.getName());  
        ps.setString(2,o.getAddress());  
        ps.setInt(3,o.getId());  
          
        status=ps.executeUpdate();  
          
        con.close();  
    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  
 }  
public static int delete(int id, String hostname){  
    int status=0;  
    try{  
        Connection con = DBconnect.initializeDatabase(hostname); 
        PreparedStatement ps=con.prepareStatement("DELETE FROM upt_organization WHERE id=?");  
        ps.setInt(1,id);  
        status=ps.executeUpdate();  
          
        con.close();  
    }catch(Exception e){e.printStackTrace();}  
      
    return status;  
}  


}