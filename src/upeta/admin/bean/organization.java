package upeta.admin.bean;

public class organization {
	private int id,status;  
	private String name,address,createdby;
	private String orgid;
	private String parentid;
	private String uptgrouptype;  
	public int getId() {  
	    return id;  
	}  
	public void setId(int id) {  
	    this.id = id;  
	}  
	public String getName() {  
	    return name;  
	}  
	public void setName(String name) {  
	    this.name = name;  
	}  
	public String getAddress() {  
	    return address;  
	}  
	public void setAddress(String address) {  
	    this.address = address;  
	}  
	public int getStatus() {  
	    return status;  
	}  
	public void setStatus(int status) {  
	    this.status = status;  
	}  

	public String getCreatedby() {  
	    return createdby;  
	}  
	public void setCreatedby(String createdby) {  
	    this.createdby = createdby;  
	}
	public void setOrgid(String orgid) {
	    this.orgid = orgid;  
		
	}  
	public String getOrgid() {  
	    return orgid;  
	}  
	public void setParentid(String parentid) {
	    this.parentid = parentid;  
		
	}  
	public String getParentid() {  
	    return parentid;  
	}  
	public void setUptgrouptype(String uptgrouptype) {
	    this.uptgrouptype = uptgrouptype;  
		
	}  
	public String getUptgrouptype() {  
	    return uptgrouptype;  
	}  

	  
	}  
