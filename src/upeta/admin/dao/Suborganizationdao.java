package upeta.admin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import upeta.admin.bean.organization;
import upeta.admin.bean.suborganization;

public class Suborganizationdao {
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("org.mariadb.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123");
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int save(suborganization o){  
        int status=0;  
        try{  
            Connection con=Suborganizationdao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "INSERT INTO `upt_suborganization`( `name`, `address`, `createdby`) VALUES (?,?,?)");  
            ps.setString(1,o.getName());  
            ps.setString(2,o.getAddress());  
            ps.setString(3,o.getCreatedby());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static List<suborganization> getAllsuborganization(){  
    	
        List<suborganization> list=new ArrayList<suborganization>();  
          
        try{  
            Connection con=Suborganizationdao.getConnection();  
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_suborganization");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                suborganization s=new suborganization();  
                s.setId(rs.getInt(1));
				s.setOrgid(rs.getString(3));
                s.setName(rs.getString(4));  
                s.setAddress(rs.getString(5));  
                list.add(s);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    public static suborganization getSuborganizationById(int id){  
        suborganization o=new suborganization();  
          
        try{  
            Connection con=Suborganizationdao.getConnection();  
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_suborganization WHERE id=?");  
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
    
public static int update(suborganization o){  
    int status=0;  
    try{  
        Connection con=Suborganizationdao.getConnection();  System.out.println("in db");
        PreparedStatement ps=con.prepareStatement(  
                     "UPDATE upt_suborganization SET name=?,address=? WHERE id=?");  
        ps.setString(1,o.getName());  
        ps.setString(2,o.getAddress());  
        ps.setInt(3,o.getId());  
          
        status=ps.executeUpdate();  
          
        con.close();  
    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  
 }  
public static int delete(int id){  
    int status=0;  
    try{  
        Connection con=Suborganizationdao.getConnection();  
        PreparedStatement ps=con.prepareStatement("DELETE FROM upt_suborganization WHERE id=?");  
        ps.setInt(1,id);  
        status=ps.executeUpdate();  
          
        con.close();  
    }catch(Exception e){e.printStackTrace();}  
      
    return status;  
}  


}
