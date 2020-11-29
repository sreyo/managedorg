<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <style> 
    .placeholder{
  color: white;
  position: relative;
  top: -30px;
}

.placeholder:after{
  content: '*';
  color: red;
  
}

    
        table th,  tr, td { 
            padding: 10px; 
            text-align: center;
            width:100px; 
            background-color:#ffffff;
            border: 1px solid; 
            table-layout: fixed;
                word-wrap: break-word;
            
            
        } 
    
        p,h3{
        color:white;
        }
        ui-datepicker-calendar {
    display: none;
    }
    #hidden_div {
    display: none;
}
    .hide{

visibility: hidden

}
    </style> 

 <script>
 $( window ).load(function() {
     $("#pass1").val('');
     $(".info").hide(); 
     var sesid = $('#createdby').val();
/* 		$.ajax({
			url: "ListgroupidServlet",
			type: "POST",
			data:{ sesid : sesid },
			cache: false,
			success: function(dataResult){ 

				var data = JSON.parse(JSON.stringify(dataResult));//alert(data);
			    var len = data.length;
 			    for (var i = 0; i < len; i++) {
				   var id = data[i].id;
				   var memberid = data[i].memberid;
				   var groupid = data[i].groupid;}	    
 			    $('#org_selectmem').val(groupid);

				   
 			    }

	    	}) ; 	
 */
	});    	



$(document).ready( function() {
   var domain = $(location).attr('hostname');  
	 var part = location.hostname.split('.');
	 var subdomains = part.shift();
	 var upperleveldomains = part.join('.');
	 alert(domain);
	 $('#hostname').val(domain);

	 $("#relation option[value='Spouse']").hide();
	 $("#relation option[value='Child']").hide();
	 $("#relation option[value='Parent']").hide();

/*    $("select option:contains('Head of Household')").attr("disabled","disabled")
 */
	$("#phone").blur(function() {
	        var setmobile = $("#phone").val();
	        var filter = /^\d*(?:\.\d{1,2})?$/;
	        if (filter.test(setmobile)) {
		        if(setmobile.length==10){
		        $.ajax({
		            url: "CheckMobileServlet",
		            data:{ mobile : setmobile ,host: domain},
		            type: "POST",
					cache: false,
		            success:function(getResponse) {
		                if(getResponse == "yes") {
							alert("Number already in use.Register with another");	        
						}
		            }
		        });}
		        else{             
		        	alert('Please put 10  digit mobile number');
		            return false;
	      			}
		      }else{
	              alert('Not a valid number');
	              return false;
	          }
	});

	$("#email").blur(function() {
        var setemail = $("#email").val();
        var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
        if (pattern.test(setemail)) 
        {
	        $.ajax({
	            url: "CheckEmailServlet",
	            data:{ email : setemail ,host: domain},
	            type: "POST",
				cache: false,
	            success:function(getResponse) {
	                if(getResponse == "yes") {
						alert("Email already in use.Register with another");	        
					}
	            }
	        });
        }else{
        	alert("Please enter valid email ID");
        }
	});
	var sesid = $('#createdby').val();
	var id = 1; 
    /*Assigning id and class for tr and td tags for separation.*/
    
	$("#btn-add_more").click(function(e) {
	
	 $("#relation option[value='Head of Household']").hide();
	 $("#relation option[value='Spouse']").show();
	 $("#relation option[value='Child']").show();
	 $("#relation option[value='Parent']").show();
     var home =  $("#khometown").val();
     var year =  $("#yearpicker").val();  alert(year); 
     var setmobile = $("#phone").val();
     var rel =  $("input[name=gender]:checked").val();
     var setemail = $("#email").val();

     var form = this;
      if( $("#fname").val()==''||$("#lname").val()==''){
         alert('Name required');		        		
         e.preventDefault();
         return false;
	  }
     //KERALA hometown only if age greather than 21
      if(year =='')
      {   alert('Year required');		        		
      	  e.preventDefault();
          return false;
	  }
	  var gne = $("input[name=gender]:checked").val();
	  if(typeof gne === 'undefined'){
          alert('Gender required');
          e.preventDefault();
          return false;
      }
	  var sel =  $('#relation option:selected').val() ;
      if(sel == ''){
          alert('Relation required');
          e.preventDefault();
          return false;
      }
      if( (setmobile == '')&&(year <=2000)){
          alert('Phone number required');
          e.preventDefault();
          return false;
       }
      if( (setemail == '')&&(year <=2000)){
          alert('Email required');
          e.preventDefault();
          return false;
       }
      if( (home == '')&&(year <=2000)){
          alert('Kerala Hometown required');
          e.preventDefault();
          return false;
       }
      if(address =='')
      {   alert('Address required');		        		
      	  e.preventDefault();
          return false;
	  }
      if(zip =='')
      {   alert('Zip required');		        		
      	  e.preventDefault();
          return false;
	  }
      if(country =='')
      {   alert('Year required');		        		
      	  e.preventDefault();
          return false;
	  }
      if(state =='')
      {   alert('State required');		        		
      	  e.preventDefault();
          return false;
	  }
      if(city =='')
      {   alert('City required');		        		
      	  e.preventDefault();
          return false;
	  }

      // Check Passwords are the same
	  if( $('#pass1').val()!=$('#pass2').val() ) {
	          // Submit Form
	      
	          alert('Password Mismatch');
	          e.preventDefault();
	          return false;
	      }
      
	   $(".info").show(); 
		
	    var newid = id++; 
 		$("#table1").append('<tr valign="top" id="'+newid+'">\n\
		<td  >' + newid + '</td>\n\
		<td  class="fname'+newid+'">' + $("#fname").val() + '</td>\n\
		<td  class="lname'+newid+'">' + $("#lname").val() + '</td>\n\
		<td  class="relation'+newid+'">' + $("#relation option:selected").val()  + '</td>\n\
		<td  class="hide yearpicker'+newid+'">' + $("#yearpicker").val() + '</td>\n\
		<td  class="hide monthpicker'+newid+'">' + $("#monthpicker").val() + '</td>\n\
		<td  class="hide gender'+newid+'">' + $("input[name=gender]:checked").val() + '</td>\n\
		<td  class="hide phone'+newid+'">' + $("#phone").val() + '</td>\n\
		<td  class="hide email'+newid+'">' + $("#email").val() + '</td>\n\
		<td  class="hide khometown'+newid+'">' + $("#khometown").val() + '</td>\n\
		<td  class="hide address'+newid+'">' + $("#address").val() + '</td>\n\
		<td  class="hide address1'+newid+'">' + $("#address1").val() + '</td>\n\
		<td  class="zip'+newid+'">' + $("#zip").val() + '</td>\n\
		<td  class="country'+newid+'">' + $("#country").val() + '</td>\n\
		<td  class="state'+newid+'">' + $("#state").val() + '</td>\n\
		<td  class="city'+newid+'">' + $("#city").val() + '</td>\n\
		<td  class="hide password'+newid+'">' + $("#pass1").val() + '</td>\n\
		<td  class="hide malrating'+newid+'">' + $("input[name=malrating]:checked").val()+ '</td>\n\
		<td  class="hide hinrating'+newid+'">' +$("input[name=hinrating]:checked").val()+ '</td>\n\
		<td width="100px" id="'+newid+'"><a href="javascript:void(0);"  id="'+newid+'"class="remCF btn btn-warning">Remove</a></td>\n\ </tr>');

 		
		$('#member_form').find('input, select, textarea, checkbox,radio,password').not("#org_selectmem").val('');
        $("input[name='password']").val('');
        $('input[name="gender"]').prop('checked', false);
        $('input[name="malrating"]').prop('checked', false);
        $('input[name="hinrating"]').prop('checked', false);


 		$('#gender :checked').removeAttr('checked');
		$("#table1").on('click', '.remCF', function() {
/* 		      var idhref = $(this).attr('id');
			$('#table1 tr#'+idhref).remove();
 */			$(this).parent().parent().remove();
 			$(".info").hide(); 
		});		

		});		
		/*crating new click event for save button*/
		$("#butsave").click(function() {

		var lastRowId = $('#table1 tr:last').attr("id");
		
		/*finds id of the last row inside table*/
		var fname = new Array(); 
		var lname = new Array();
		var relation = new Array();
		var dob = new Array();
		var monthdob = new Array();
		var gender = new Array();
		var phone = new Array();
		var email = new Array();
		var khometown = new Array();
		var address = new Array();
		var address1 = new Array();
		var organization = new Array();
		var monthdob = new Array();
		var zip = new Array();
		var country = new Array();
		var state = new Array();
		var city = new Array();
		var password = new Array();
		var mal = new Array();
		var hin = new Array();
		
		for ( var i = 1; i <= lastRowId; i++) {

			fname.push($("#"+i+" .fname"+i).html()); 
			lname.push($("#"+i+" .lname"+i).html()); /*pushing all the names listed in the table*/
			relation.push($("#"+i+" .relation"+i).html()); /*pushing all the relation listed in the table*/
			dob.push($("#"+i+" .yearpicker"+i).html()); /*pushing all the dob listed in the table*/
			monthdob.push($("#"+i+" .monthpicker"+i).html()); /*pushing all the dob listed in the table*/
			gender.push($("#"+i+" .gender"+i).html());
			phone.push($("#"+i+" .phone"+i).html()); /*pushing all the phone listed in the table*/
			email.push($("#"+i+" .email"+i).html()); /*pushing all the emails listed in the table*/
			khometown.push($("#"+i+" .khometown"+i).html()); /*pushing all the relation listed in the table*/
			address.push($("#"+i+" .address"+i).html()); /*pushing all the address listed in the table*/
			address1.push($("#"+i+" .address"+i).html()); /*pushing all the address listed in the table*/
			zip.push($("#"+i+" .zip"+i).html()); 
			country.push($("#"+i+" .country"+i).html()); 
			state.push($("#"+i+" .state"+i).html()); 
			city.push($("#"+i+" .city"+i).html()); 
			password.push($("#"+i+" .password"+i).html()); 
			mal.push($("#"+i+ " .malrating"+i).html());
			hin.push($("#"+i+ " .hinrating"+i).html());

        }

		$.ajax({
			url: "AddregmemServlet",
			type: "POST",
			data: {hostname:domain,sesid:sesid,fname:fname, lname:lname, email:email, phone:phone, khometown:khometown, gender:gender,relation:relation, address:address,address1:address1, dob:dob,monthdob:monthdob, city:city, state:state, country:country, zip:zip, password:password,mal:mal,hin:hin,id:lastRowId },		
		    cache : false,
			success : function(data){
                if(data == "success") {
					alert("Registered Successfully");	
	                window.location.reload();						
				}else{
					alert("Something went wrong"); }
			}
			});
		});
		});


    
    </script>
    
<div class="card " style="background-image: url('mmsbg1.jpeg');background-size: 100% 100%;background-repeat: no-repeat;">
<form id="member_form" >

<div class="container-fluid">
	<div class="row">
 
 
 
				<div class="form-group">
									<input type="hidden" id="hostname" name="hostname"
										class="form-control">
				
					<input type="hidden" id="createdby"
					value="<%= session.getAttribute("name") %>">
				</div>

								<div class="form-group col-sm-4" >
					<input type="text" id="fname" name="fname" class="form-control"
						placeholder="FirstName" required>
				</div>
								<div class="form-group col-sm-4" >
					<input type="text" id="lname" name="lname" class="form-control"
						placeholder="LastName" required>
				</div>
								<div class="form-group col-sm-4" >
				<select  id="relation" class="form-control" >
						<option  value="Head of Household"  > Head of Household</option>
						<option  value="Spouse">Spouse</option>
						<option  value="Child">Child</option>
						<option  value="Parent">Parent</option>
					    </select>
    						
								
		    </div>
		     <div class=clearfix></div>
			    <div class="form-group  col-sm-4">
			    					<label style="color:white">Date Of Birth:</label>
				
				    <label style="color:white">Month</label>
				    <select name="monthpicker" id="monthpicker"></select>
				    <script type="text/javascript">
				    let startMonth = 1;
				    for (i = 1; i <= 12; i++)
				    {
				      $('#monthpicker').append($('<option />').val(i).html(i));
				    }
				    </script>
					
				    <label style="color:white">Year</label>
				    <select name="yearpicker" id="yearpicker" onchange="showDiv('hidden_div', this)"></select>
				    <script type="text/javascript">
				    let startYear = 1900;
				    let endYear = new Date().getFullYear();
				    for (i = endYear; i > startYear; i--)
				    {
				      $('#yearpicker').append($('<option />').val(i).html(i));
				    }
				    function showDiv(divId, element)
				    {
				        document.getElementById(divId).style.display = element.value <= 2000 ? 'block' : 'none';
				    }

				    </script>
				    
			    
			    </div>
			    <div class="form-group  col-sm-8">
			    			    <div class="form-group  col-sm-2">
			    
			    <left><label style="color:white;" >Gender:</label></left></div>
			    <div class="radio-item col-sm-2" style="color:white;diplay:inline">
			        <label for="ritema">Male</label>
				    <input type="radio"  name="gender" value="M">
			    </div>
				
				<div class="radio-item col-sm-4" style="color:white;diplay:inline;">
				    <label for="ritemb">Female</label>
				    <input type="radio"  name="gender" value="F">
				    </div>
			    
			    </div>
			    
		    
			    <div class=clearfix></div>
			    <div id="hidden_div">
			    <div class="form-group  col-sm-4">
				   <input type="phone" id="phone" name="phone" class="form-control" placeholder="Phone" minlength="10" maxlength="10" required>
				</div>		
				<div class="form-group col-sm-4" >
				    <input type="email" id="email" name="email" class="form-control"
					placeholder="Email " required>
         		</div>
			    
				<div class="form-group col-sm-4" >
				
    <input type="text" name="khometown" id="khometown" placeholder="Kerala Hometown" class="form-control" >
</div>                </div>

			   <div class=clearfix></div>
			   <div class="form-group col-sm-4" >
					<textarea id="address" rows="4" cols="50" placeholder="Address" class="form-control"></textarea>
				</div>
				<div class="form-group col-sm-4" >
                    <input type=text id="address1" placeholder="Address 1" class="form-control" required>
                               
                </div>
				<div class="form-group col-sm-4" >
				<input type="text" id="zip" name="zip" class="form-control"
										placeholder="Zip" required>
								
					
				     </div>
			<div class=clearfix></div>
						<div class="form-group  col-sm-4">
				            <select id="country" name="country" class="form-control">
				               <option value="1">---Select Country---</option>
				               
				                <option value="USA">USA</option>
				                <option value="UK">UK</option>
				                <option value="UAE">UAE</option>
				                <option value="INDIA">INDIA</option>
							</select>							
							</div>
							<div class="form-group  col-sm-4">
								<input type="text" id="state" name="state" class="form-control"
										placeholder="State"  required>
								<span class="placeholder"></span>
								
							
							</div>
			
							<div class="form-group  col-sm-4">
								<input type="text" id="city" name="city" class="form-control"
										placeholder="City" required>
							
							</div>
			
							
			<div class=clearfix></div>
			
			
								<div class="form-group col-sm-4" >
    <input type="password" name="password" id="pass1" placeholder="Password" class="form-control" required>
								
			</div>
								<div class="form-group col-sm-4" >
    <input type="password" name="password" id="pass2" placeholder="Repeat Password" class="form-control" required>
								
			</div>
			
		<div class="form-group col-sm-4" >
								
			
		</div>
					<div class=clearfix></div>
	 <div class="form-group col-sm-12">			<h4 style="color:white;">Proficiency Levels</h4>
			<p><bold>0 = None. 	1 = Know basics (for conversation, letters, slokas, stories).	2 = Can do basic covering writing and basic reading.	 3 = Can do some intermediate writing and reading.	4 = Can converse fluently, read extensively.  5 = Expert, Can Teach.</bold></p>
	 </div>
		<div class="form-group col-sm-12" id="mal">
		<div class="form-group col-sm-4"> <left><label style="color:white;" >Malayalam Proficiency  :</label></left></div>
        <div class="form-group col-sm-8" style="color:white;diplay:inline;">
         <input type="radio" name="malrating" value="0" /><label>0</label>
         <input type="radio" name="malrating" value="1" /><label>1</label>
         <input type="radio" name="malrating" value="2" /><label>2</label>
         <input type="radio" name="malrating" value="3" /><label>3</label>
         <input type="radio" name="malrating" value="4" /><label>4</label>
         <input type="radio" name="malrating" value="5" /><label>5</label>
      
		</div>	</div>
		<div class="form-group col-sm-12" id="hin">
		<div class="form-group col-sm-4"> 
		<left><label style="color:white;" >HinduDharma Proficiency  :</label></left>
		</div>
        <div class="form-group col-sm-8" style="color:white;diplay:inline;">
         <input type="radio" name="hinrating" value="0" />0
         <input type="radio" name="hinrating" value="1" />1
         <input type="radio" name="hinrating" value="2" />2
         <input type="radio" name="hinrating" value="3" />3
         <input type="radio" name="hinrating" value="4" />4
         <input type="radio" name="hinrating" value="5" />5
      
		</div>	
		</div>
		<div class="row">
<div class="form-group  col-sm-4"></div>
<div class="form-group  col-sm-4"></div>

<div class="form-group  col-sm-4">
				<center><button type="button" class="btn btn-info" id="btn-add_more">Add Relative</button></center>

</div></div>
		
		<div class="container-fluid">
		
			<table id="table1" name="table1" class="table table-responsive table-striped   ">
				<tbody>
					<tr class="info ">
						<th>ID</th>
						<th>Name</th>
						<th>LastName</th>
						<th>Relation</th>
						<th>Zip</th>
						<th>Country</th>
						<th>State</th>
						<th>City</th>
						<th>Action</th>
						
					<tr>
				</tbody>
			</table> 
</div>				
<div class="row info">
<div class="form-group  col-sm-4"></div>
<div class="form-group  col-sm-4"></div>

<div class="form-group  col-sm-4">
				<button type="button" class="btn btn-info" id="butsave" name="save">Submit</button>

</div></div>
</div></form>	</div>

