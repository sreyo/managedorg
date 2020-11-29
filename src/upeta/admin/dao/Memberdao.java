package upeta.admin.dao;

import java.sql.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.awt.HeadlessException;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import upeta.admin.dao.DBconnect;
import upeta.admin.bean.member;
import upeta.admin.bean.registration;


public class Memberdao {
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("org.mariadb.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123");
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int save(member m,String hostname){  
        int status=0;  
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement(  
                         "INSERT INTO `upt_member`( `firstname`, `lastname`, `email`,`phone`,`address`,`dob`,`gender`,createdby,city,state,country,zip,address1,referredby,local,password) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);  
			ps.setString(1,m.getFirstname());  
            ps.setString(2,m.getLastname());  
            ps.setString(3,m.getEmail());  
            ps.setString(4,m.getPhone());  
            ps.setString(5,m.getAddress()); 
            ps.setString(6,m.getDob());
            ps.setString(7,m.getGender());  
            ps.setString(8,m.getCreatedby());
            ps.setString(9,m.getCity());
            ps.setString(10,m.getState());
            ps.setString(11,m.getCountry());
            ps.setString(12,m.getZip());
            ps.setString(13,m.getAddress1());
            ps.setString(14,m.getReferredby());
            ps.setString(15,m.getLocal());
            ps.setString(16,m.getPassword());

System.out.println(ps);
            status=ps.executeUpdate();  
    		ResultSet rs = ps.getGeneratedKeys();
    		int generatedKey = 0;
    		if (rs.next()) {
    		generatedKey = rs.getInt(1);
    		}

    		String uname   =m.getPhone()+"+"+m.getFirstname()+"@hindukeralasociety.org";
			String memid   ="MEM-ID-"+generatedKey;
			String group   = m.getPhone()+"@hindukeralasociety.org";
			PreparedStatement up=con.prepareStatement(
			"UPDATE upt_member SET groupid=?,memberid=?,username=? WHERE id=?");
		    up.setString(1,group);
		    up.setString(2,memid);
		    up.setString(3,uname);
			up.setInt(4,generatedKey); 
			status=up.executeUpdate();
			JavaMail jm = new JavaMail(); //Instance of elf class
            String to = m.getEmail();
            String upass = "hindu123";
	        int emailstatus =JavaMail.email(to, upass);  

            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static List<member> getAllmember(String hostname){  
    	
        List<member> list=new ArrayList<member>();  
          
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT  * FROM upt_member ");  
            //SELECT  um.* FROM upt_member um inner join upt_organization uo where um.orgid=uo.orgid and uo.uptgrouptype ='Family'  order by `createdat` limit 1 
            ResultSet rss=ps.executeQuery();  System.out.println(ps);
            while(rss.next()){  
                member n=new member();  
                n.setId(rss.getInt(1));  
                n.setFirstname(rss.getString(2));  
                n.setLastname(rss.getString(3)); 
                n.setEmail(rss.getString(4)); 
                n.setUsername(rss.getString(5));
                n.setPassword(rss.getString(6));
                n.setPhone(rss.getString(7));  
                n.setAddress(rss.getString(8));  
                n.setGender(rss.getString(9));  
                n.setDob(rss.getString(10)); 
                n.setOrgid(rss.getString(11)); 
                n.setGroupid(rss.getString(12)); 
                n.setMemberid(rss.getString(13)); 
                n.setRelation(rss.getString(14)); 
                n.setCity(rss.getString(18)); 
                n.setState(rss.getString(19)); 
                n.setCountry(rss.getString(21)); 
                n.setZip(rss.getString(20)); 

                



                list.add(n);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    public static List<member>getFamilylist(String hostname){  
    	
        List<member> list=new ArrayList<member>();  
          
        try{  
			Connection con = DBconnect.initializeDatabase(hostname);
            PreparedStatement ps=con.prepareStatement("SELECT  * FROM upt_member group by groupid ");  
            //SELECT  um.* FROM upt_member um inner join upt_organization uo where um.orgid=uo.orgid and uo.uptgrouptype ='Family'  order by `createdat` limit 1 
            System.out.println("query"+ps);
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                member m=new member();  
                m.setId(rs.getInt(1));  
                m.setFirstname(rs.getString(2));  
                m.setLastname(rs.getString(3)); 
                m.setEmail(rs.getString(4)); 
                m.setPhone(rs.getString(7));  
                m.setDob(rs.getString(10)); 
                m.setAddress(rs.getString(8)); 
                m.setOrgid(rs.getString(11)); 
                m.setGroupid(rs.getString(12)); 
                m.setMemberid(rs.getString(13)); 
                m.setRelation(rs.getString(14)); 
                

                list.add(m);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    
    public static List<member>getGrouplist(String sesid,String hostname){  
    	
        List<member> list=new ArrayList<member>();  
          
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT  * FROM upt_member where email=? ");  
            ps.setString(1,sesid); 
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                member m=new member();  
                m.setId(rs.getInt(1));  
                m.setOrgid(rs.getString(11)); 
                m.setGroupid(rs.getString(12)); 
                m.setMemberid(rs.getString(13)); 

                list.add(m);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    


	public static List<member> getMemberByEmail(String email,String hostname) {
    	member m=new member();  
        List<member> list=new ArrayList<member>();  
  
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
/*            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_member WHERE createdby=?");  
            ps.setString(1,email);  
            ResultSet rs=ps.executeQuery();
            if(rs.next() == true) {
            	do {        	
            		   member n=new member();  
		                n.setId(rs.getInt(1));  
		                n.setFirstname(rs.getString(2));  
		                n.setLastname(rs.getString(3)); 
		                n.setEmail(rs.getString(4)); 
		                n.setUsername(rs.getString(5));
		                n.setPassword(rs.getString(6));
		                n.setPhone(rs.getString(7));  
		                n.setAddress(rs.getString(8));  
		                n.setGender(rs.getString(9));  
		                n.setDob(rs.getString(10)); 
		                n.setOrgid(rs.getString(11)); 
		                n.setGroupid(rs.getString(12)); 
		                n.setMemberid(rs.getString(13)); 
		                n.setRelation(rs.getString(14)); 

                list.add(n);     
                } while (rs.next());
 
            }else {
             	
*/                PreparedStatement pss=con.prepareStatement("SELECT * FROM upt_member WHERE groupid in(select groupid from upt_member where email=?)");  
                pss.setString(1,email);  
                ResultSet rss=pss.executeQuery();  
                while(rss.next()){      	
                	member n=new member();  
                    n.setId(rss.getInt(1));  
                    n.setFirstname(rss.getString(2));  
                    n.setLastname(rss.getString(3)); 
                    n.setEmail(rss.getString(4)); 
                    n.setUsername(rss.getString(5));
                    n.setPassword(rss.getString(6));
                    n.setPhone(rss.getString(7));  
                    n.setAddress(rss.getString(8));  
                    n.setGender(rss.getString(10));  
                    n.setDob(rss.getString(11)); 
                    n.setOrgid(rss.getString(12)); 
                    n.setGroupid(rss.getString(13)); 
                    n.setMemberid(rss.getString(14)); 
                    n.setRelation(rss.getString(15)); 
                    

                    list.add(n);  


          //  }
                }
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }
	
	public static List<member> getMemberByUser(String id,String hostname) {
    	member m=new member();  
        List<member> list=new ArrayList<member>();  
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_member WHERE email=?");  
            ps.setString(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                member n=new member();  
                n.setId(rs.getInt(1));  
                n.setFirstname(rs.getString(2));  
                n.setLastname(rs.getString(3)); 
                n.setEmail(rs.getString(4)); 
                n.setPhone(rs.getString(7));  
                n.setAddress(rs.getString(8));
                n.setGender(rs.getString(9)); 
                n.setDob(rs.getString(10)); 
                n.setOrgid(rs.getString(11)); 
                n.setGroupid(rs.getString(12)); 
                n.setMemberid(rs.getString(13)); 
                n.setRelation(rs.getString(14)); 
                n.setUsername(rs.getString(5)); 
                n.setCity(rs.getString(18)); 
                n.setState(rs.getString(19)); 
                n.setCountry(rs.getString(21)); 
                n.setZip(rs.getString(20)); 


                list.add(n);  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }
	public static List<member> getMemberBygroupId(String id,String hostname) {
    	member m=new member();  
        List<member> list=new ArrayList<member>();  
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_member WHERE groupid=?");  
            ps.setString(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                member n=new member();  
                n.setId(rs.getInt(1));  
                n.setFirstname(rs.getString(2));  
                n.setLastname(rs.getString(3)); 
                n.setEmail(rs.getString(4)); 
                n.setPhone(rs.getString(7));  
                n.setAddress(rs.getString(8));
                n.setGender(rs.getString(9)); 
                n.setDob(rs.getString(10)); 
                n.setOrgid(rs.getString(11)); 
                n.setGroupid(rs.getString(12)); 
                n.setMemberid(rs.getString(13)); 
                n.setRelation(rs.getString(14)); 
                n.setCity(rs.getString(18)); 
                n.setState(rs.getString(19)); 
                n.setCountry(rs.getString(21)); 
                n.setZip(rs.getString(20)); 

                
                list.add(n);  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }
    



	public static List<member> getMemberById(String id,String hostname) {
    	member m=new member();  
        List<member> list=new ArrayList<member>();  
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_member WHERE createdby=?");  
            ps.setString(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                member n=new member();  
                n.setId(rs.getInt(1));  
                n.setFirstname(rs.getString(2));  
                n.setLastname(rs.getString(3)); 
                n.setEmail(rs.getString(4)); 
                n.setPhone(rs.getString(7));  
                n.setAddress(rs.getString(8));
                n.setGender(rs.getString(9)); 
                n.setDob(rs.getString(10)); 
                n.setOrgid(rs.getString(11)); 
                n.setGroupid(rs.getString(12)); 
                n.setMemberid(rs.getString(13)); 
                n.setRelation(rs.getString(14)); 
                n.setCity(rs.getString(18)); 
                n.setState(rs.getString(19)); 
                n.setCountry(rs.getString(21)); 
                n.setZip(rs.getString(20)); 

                list.add(n);  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }
    
    public static int update(member m,String userid,String hostname){  
	    int status=0;  
	    try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
	        PreparedStatement ps=con.prepareStatement(  
	                     "UPDATE upt_member SET firstname=?,lastname=?,email=?,gender=?,city=?,state=?,country=?,zip=?,password=?,address=? WHERE groupid=? and email=?");  
	        ps.setString(1,m.getFirstname());  
	        ps.setString(2,m.getLastname());  
	        ps.setString(3,m.getEmail());  
	        ps.setString(4,m.getGender()); 
	        ps.setString(5,m.getCity());  
	        ps.setString(6,m.getState());  
	        ps.setString(7,m.getCountry());  
	        ps.setString(8,m.getZip());  
	        ps.setString(9,m.getPassword()); 
	        ps.setString(10,m.getAddress()); 

	        ps.setString(11,m.getGroupid());  
	        ps.setString(12,userid);  
          
	        status=ps.executeUpdate();  
	          
	        con.close();  
	    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  
 }  
    public static int adminupdate(member m,String id,String hostname){  
	    int status=0;  
	    try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
	        PreparedStatement ps=con.prepareStatement(  
	                     "UPDATE upt_member SET firstname=?,lastname=?,email=?,gender=?,city=?,state=?,country=?,zip=?,password=?,address=? ,phone=? WHERE id=?");  
	        ps.setString(1,m.getFirstname());  
	        ps.setString(2,m.getLastname());  
	        ps.setString(3,m.getEmail());  
	        ps.setString(4,m.getGender()); 
	        ps.setString(5,m.getCity());  
	        ps.setString(6,m.getState());  
	        ps.setString(7,m.getCountry());  
	        ps.setString(8,m.getZip());  
	        ps.setString(9,m.getPassword()); 
	        ps.setString(10,m.getAddress()); 
	        ps.setString(11,m.getPhone()); 

	        ps.setString(12,id);  
          
	        status=ps.executeUpdate();System.out.println(ps);  
	          
	        con.close();  
	    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  
 }  

	public static int delete(int id,String hostname){  
	    int status=0;  
	    try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
	        PreparedStatement ps=con.prepareStatement("DELETE FROM upt_member WHERE id=?");  
	        ps.setInt(1,id);  
	        status=ps.executeUpdate();  
	          
	        con.close();  
	    }catch(Exception e){e.printStackTrace();}  
	      
	    return status;  
	}  
	public static int insertMyEntity(String hostname,String sesid,String fname,
			  String lname,
			  String email,String phone,String relation, String dob,String gender, String address, String address1, String orgid,String city,String state,String country,String zip) throws SQLException {
	          int status =0;  try {
	            Connection con = DBconnect.initializeDatabase(hostname); 
			  PreparedStatement insertStatement = null;
			
				  
				    insertStatement = con.prepareStatement("INSERT INTO `upt_member`( `firstname`, `lastname`, `email`,`phone`,`relation`,`dob`,`gender`,`orgid`,`createdby`,`city`,`state`,`country`,`zip`,`address`,address1) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS );
				    insertStatement.setString(1, fname);
				    insertStatement.setString(2, lname);
				    insertStatement.setString(3, email);
				    insertStatement.setString(4, phone);
				    insertStatement.setString(5, relation);
				    insertStatement.setString(6, dob);
					insertStatement.setString(7, gender);
				    insertStatement.setString(8, orgid);
				    insertStatement.setString(9, sesid);
		            insertStatement.setString(10,city);
		            insertStatement.setString(11,state);
		            insertStatement.setString(12,country);
		            insertStatement.setString(13,zip);
		            insertStatement.setString(14,address);
		            insertStatement.setString(15,address1);

				    status = insertStatement.executeUpdate();
		    		ResultSet rs = insertStatement.getGeneratedKeys();
		    		int generatedKey = 0;
		    		if (rs.next()) {
		    		generatedKey = rs.getInt(1);
		    		}
		    		String phonemem = null;
		    		String groupiduser = null;
                    String Query = "SELECT phone FROM upt_member WHERE groupid in(SELECT groupid FROM upt_member WHERE email =?) ORDER BY id ASC LIMIT 1";
		            PreparedStatement ps=con.prepareStatement(Query);  
		            ps.setString(1,sesid);           //         SELECT phone FROM upt_member WHERE createdby=? order by id ASC limit 1
		            ResultSet ses=ps.executeQuery(); 
		            while(ses.next()){  
		            	
		                phonemem =ses.getString(1);  
					}System.out.println("phone"+phonemem);System.out.println("phone find");
		            PreparedStatement usps=con.prepareStatement("SELECT groupid FROM upt_member WHERE email=?");  
		            usps.setString(1,sesid);  
		            ResultSet usses=usps.executeQuery();  
		            while(usses.next()){ 
		            	  groupiduser=usses.getString(1);
		               // phonememus =usses.getString(1);  
					}
		            String familyid = new String("New Family");
				    String group;
		            if(orgid.equals(familyid)) 
                  {
						 group   =  phonemem +"@hindukeralasociety.org";
						 
		            }else if((orgid.length()==0 || orgid.isEmpty())){
		            	
						 //group   =  phonememus +"@hindukeralasociety.org";
		            	 group = groupiduser;
						 
		            }else {
		            	
		            	 group   =  orgid;
		            }
		    		String uname   =  phonemem+"+"+fname+"@hindukeralasociety.org";
					String memid   ="MEM-ID-"+generatedKey;
					PreparedStatement up=con.prepareStatement(
					"UPDATE upt_member SET groupid=?,memberid=?,username=? WHERE id=?");
					up.setString(1,group);
				    up.setString(2,memid);
				    up.setString(3,uname);
					up.setInt(4,generatedKey); 
					status=up.executeUpdate();
		            con.close();  
	
	
			    } catch (SQLException e ) {
			      System.out.println(e.getMessage());
			    } catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			return status;    
	
			}
	public static String checkmob(String mobile, String hostname) {
	    String msg = "no" ;

	    try{  
		    ResultSet status ; 
            Connection con = DBconnect.initializeDatabase(hostname); 
	        PreparedStatement ps=con.prepareStatement("select count(*) FROM upt_registration WHERE phone=?");  
	        ps.setString(1,mobile);  
	        status=ps.executeQuery();  
	        status.next();
	        int count = status.getInt(1);
	        System.out.println(count);
			/*
			 * msg = "yes"; }else { msg = "no";
			 * 
			 * }
			 */	  
	        if(count>0)
	        {
	        	 msg = "yes";
	        }
	        else {
	        	msg = "no";
	        }
	        con.close();  
	    }catch(Exception e){e.printStackTrace();}  
	      
	    return msg;  
		
	}
	public static int insertregMyEntity(String hostname,String sesid,String fname,
			  String lname,
			  String email,String phone,String relation, String dob,String gender, String address, String address1,String city,String state,String country,String zip,String khometown,String monthdob,String password,String mal,String hin) throws SQLException {
	          int status =0; 
	          try {
	            Connection con = DBconnect.initializeDatabase(hostname); 
			  PreparedStatement insertStatement = null;
			
				  
				    insertStatement = con.prepareStatement("INSERT INTO `upt_registration`( `firstname`, `lastname`, `email`,`phone`,`relation`,`yeardob`,`gender`,`createdby`,`city`,`state`,`country`,`zip`,`address`,`address1`,`monthdob`,`hometown`,`username`,`password`,`malayalamskill`,`hinduskill`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				    insertStatement.setString(1, fname);
				    insertStatement.setString(2, lname);
				    insertStatement.setString(3, email);
				    insertStatement.setString(4, phone);
				    insertStatement.setString(5, relation);
				    insertStatement.setString(6, dob);
					insertStatement.setString(7, gender);
				    insertStatement.setString(8, sesid);
		            insertStatement.setString(9,city);
		            insertStatement.setString(10,state);
		            insertStatement.setString(11,country);
		            insertStatement.setString(12,zip);
		            insertStatement.setString(13,address);
		            insertStatement.setString(14,address1);
		            insertStatement.setString(15,monthdob);
		            insertStatement.setString(16,khometown);
		            insertStatement.setString(17,email);
		            insertStatement.setString(18,password);
		            insertStatement.setString(19,mal);
		            insertStatement.setString(20,hin);

				    status = insertStatement.executeUpdate();
		            con.close();  
				      System.out.println(status);
	
			    } catch (SQLException e ) {
			      System.out.println(e.getMessage());
			    } catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			return status;    
	}
	public static String checkemail(String email, String hostname) {
		// TODO Auto-generated method stub
	    String msg = "no" ;

	    try{  
		    ResultSet status ; 
            Connection con = DBconnect.initializeDatabase(hostname); 
	        PreparedStatement ps=con.prepareStatement("select count(*) FROM upt_registration WHERE email=?");  
	        ps.setString(1,email);  
	        status=ps.executeQuery();  
	        status.next();
	        int count = status.getInt(1);
	        if(count>0)
	        {
	        	 msg = "yes";
	        }
	        else {
	        	msg = "no";
	        }
	        con.close();  
	    }catch(Exception e){e.printStackTrace();}  
	      
	    return msg;  
		
	}
	public static int insertkalregMyEntity(String hostname,String sesid,String fname,
			  String lname,
			  String email,String phone,String relation, String dob,String gender, String address, String address1,String city,String state,String country,String zip,String khometown,String monthdob,String password,String item) throws SQLException {
	          int status =0; 
	          try {
	            Connection con = DBconnect.initializeDatabase(hostname); 
			  PreparedStatement insertStatement = null;
			
				  
				    insertStatement = con.prepareStatement("INSERT INTO `upt_registration`( `firstname`, `lastname`, `email`,`phone`,`relation`,`yeardob`,`gender`,`createdby`,`city`,`state`,`country`,`zip`,`address`,`address1`,`monthdob`,`hometown`,`username`,`password`,`item`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				    insertStatement.setString(1, fname);
				    insertStatement.setString(2, lname);
				    insertStatement.setString(3, email);
				    insertStatement.setString(4, phone);
				    insertStatement.setString(5, relation);
				    insertStatement.setString(6, dob);
					insertStatement.setString(7, gender);
				    insertStatement.setString(8, email);
		            insertStatement.setString(9,city);
		            insertStatement.setString(10,state);
		            insertStatement.setString(11,country);
		            insertStatement.setString(12,zip);
		            insertStatement.setString(13,address);
		            insertStatement.setString(14,address1);
		            insertStatement.setString(15,monthdob);
		            insertStatement.setString(16,khometown);
		            insertStatement.setString(17,email);
		            insertStatement.setString(18,password);
		            insertStatement.setString(19,item);

				    status = insertStatement.executeUpdate();
		            con.close();  
	
			    } catch (SQLException e ) {
			      System.out.println(e.getMessage());
			    } catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			return status;    

	}
	public static List getViswMember(String hostname) {
			String apid = null;
			List jlist = new ArrayList();

			try {
				Connection con = DBconnect.initializeDatabase(hostname);

	            PreparedStatement ps=con.prepareStatement("SELECT * FROM upt_registration	");  
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					registration s = new registration();
					s.setId(rs.getString(1));
					s.setFirstname(rs.getString(2));
					s.setLastname(rs.getString(3));					
					s.setEmail(rs.getString(4));
					s.setPhone(rs.getString(7));
					s.setAddress(rs.getString(8));
					s.setYeardob(rs.getString(12));
					s.setCountry(rs.getString(23));
					s.setState(rs.getString(21));
					s.setRelation(rs.getString(16));
					s.setMal(rs.getString(25));
					s.setHin(rs.getString(26));
					jlist.add(s);
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
System.out.println(jlist);
			return jlist;
		
	}
	
	
	}
