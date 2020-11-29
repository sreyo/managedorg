<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script type="text/javascript">

$(document).ready(function() {

    var userid = $('#userid').val();
		$.ajax({
			url: "ViewuserServlet",
			data:{ userid : userid },
			type: "GET",
			cache: false,
			success: function(dataResult){ 
				var data = JSON.parse(JSON.stringify(dataResult));
				
			    var len = data.length;
			    for (var i = 0; i < len; i++) {
				   var id = data[i].id;
				   var memberid = data[i].memberid;
				   var firstname  = data[i].firstname;
				   var lastname  = data[i].lastname;
				   var email = data[i].email;
				   var phone = data[i].phone;
				   var gender = data[i].gender;
				   var orgid = data[i].orgid;
				   var address = data[i].address;
				   var relation = data[i].relation;
				   var username = data[i].username;
				   var group = data[i].groupid;
                   var city = data[i].city;
                   var state = data[i].state;
                   var country = data[i].country;
                   var zip = data[i].zip;
				 
				 //$('#table_viewmember').append('<tr><td>'+memberid+'</td><td>'+firstname+" "+lastname+'</td><td>'+email+'</td><td>'+phone+'</td><td>'+gender+'</td><td>'+gender+'</td><td>'+gender+'</td><td>'+relation+'</td><td>'+orgid+'</td><td><a href="#editMemberModal"  data-toggle="modal"><button class="btn glyphicon glyphicon-check" data-toggle="tooltip" data-id="'+id+'"  title="Approve"></button></td></tr>');
				  
				   $('#fname').val(firstname);
				   $('#lname').val(lastname);
				   $('#email').val(email);
				   $('#phone').val(phone);
				   //$('#gender').val(gender);
				   $('#address').val(address);
				   $('#username').val(username);
				   $('#groupid').val(group);
				   $('#city').val(city);
				   $('#state').val(state);
/* 				   $('#country').val(country);
 */				   $('#zip').val(zip);
				   $("[name=gender]").val([gender]);
				   $('[name=country]').val(country);


			    }
	      }
			
		});
		
	});
	 $(document).on('click','#update',function(e) {
		var pswd = $("#password").val() ;
		var group =  $("#groupid").val();
		var username =  $("#username").val();
		var address = $("#address").val();
        var userid= $("#userid").val();
		
		var data = $("#update_form").serialize() + "&pswd=" + pswd + "&group=" + group + "&username=" + username + "&address=" + address + "&userid=" + userid;
		$.ajax({
			data: data,
			type: "POST",
			cache:false,
			url: "UpdatememberServlet",
			success: function(data){alert(data);
				  if($.trim(data) == "success") {
						alert('Data updated successfully !'); 
					    
						window.location.replace="/familymembers.jsp";

				}else{
					 alert("Something went wrong.");
				}
		           
					
			}
		});
	}); 


	
	

</script>
  <div class="card bg-info text-info">

<div class="container-fluid">
<form id="update_form">
	<div class="row">
        <div class="form-group col-sm-6" >
           <input type="text" id="fname" name="fname" class="form-control" placeholder="FirstName" required>
        
        </div>
        <div class="form-group col-sm-6" >
			<input type="text" id="lname" name="lname" class="form-control" placeholder="Lastname" required>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-sm-6" >
                    <input type="email" class="form-control" id="email" placeholder="Enter email">
        
        </div>
        <div class="form-group col-sm-6" >
            <input type="password" class="form-control" id="password" placeholder="Confirm Password">
        </div>
        <div class="clearfix"></div>
           <div class="form-group col-sm-6" >
			<label class="radio-inline"><input type="radio" name="gender" value="M" >Male</label>
			<label class="radio-inline"><input type="radio" name="gender" value="F">Female</label>
			</div>    
		 <div class=" form-group col-sm-6 ">
            <input class="form-control" type="phone" value="" id="phone" placeholder="Phone ">
        </div>
           <div class="clearfix"></div>
                   <div class="form-group col-sm-6" >
                 <input type="text" class="form-control" id="username" placeholder="Username" disabled>
        
        </div>
           
          <div class="form-group col-sm-6" >
         <input type="hidden" id="userid" name="userid" value="<%= session.getAttribute("name") %>">
                 <input type="text" class="form-control" id="groupid" placeholder="Groupid" disabled>
        
        </div>
  
        <div class="clearfix"></div>
       	 <div class="form-group col-sm-6">
        
		    <textarea class="form-control" id=address rows="3">Address</textarea>
 
  		</div>
        
        <div class="form-group  col-sm-6">
			<input type="text" id="city" name="city" class="form-control"
										placeholder="City" required>
							
		</div>
		<div class="form-group  col-sm-6">
			<input type="text" id="state" name="state" class="form-control"
					placeholder="State" required>
		
		</div>
		
		<div class="form-group  col-sm-6">
           <select id="country" name="country" class="form-control">
              <option value="1">---Select Country---</option>
              
               <option value="USA">USA</option>
               <option value="UK">UK</option>
               <option value="UAE">UAE</option>
               <option value="INDIA">INDIA</option>
		</select>							
		</div>
        		<div class="form-group  col-sm-6">
			<input type="text" id="zip" name="zip" class="form-control"
					placeholder="Zip" required>
		
		</div>
        
        <div class="form-group col-sm-4" >
        
        </div>
         <div class="form-group col-sm-4" >
        
        </div>
        
        <div class="form-group col-sm-4" >
            <button type="submit" class="btn btn-info" id="update">Update</button>
        </div>
    <div class="clearfix"></div>

    <br /><br />
	</div>
	</form>
</div>
</div>
</body>
</html>




