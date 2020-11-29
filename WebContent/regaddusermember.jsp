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
	 
     $("input[type='password']").val('');
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
/*    $("select option:contains('Head of Household')").attr("disabled","disabled")
 */
   alert(domain);
   $('#hostname').val(domain);
   

	 $("#phone").blur(function() {
	        var setmobile = $("#phone").val();
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
	        });
	});

		var sesid = $('#createdby').val();

		var id = 1; 
      	/*Assigning id and class for tr and td tags for separation.*/
		$("#btn-add_more").click(function(e) {
			
		      var form = this;
		      if( $("#fname").val()==''||$("#lname").val()==''){
	          alert('Name required');		        		
	          e.preventDefault();
              return false;

		  }
		         //KERALA hometown only if age greather than 21
       		 var home =  $("#khometown").val();
		     var year =  $("#yearpicker").val();   
		      if( (home == '')&&(year <=2000)){

		          alert('Fill Kerala Hometown');
		          e.preventDefault();

		          return false;

		      }
		        var setmobile = $("#phone").val();
			      if( (setmobile == '')&&(year <=2000)){

			          alert('Phone number mandatory');
			          e.preventDefault();

			          return false;

			      }
			      if(year <=2000){
			    		 $("#phone").blur(function() {
			    		        var setmobile = $("#phone").val();
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
			    		        });
			    		});}

		      // Check Passwords are the same
		  if( $('#pass1').val()==$('#pass2').val() ) {
		          // Submit Form
		      } else {
		          // Complain bitterly
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
		<td  class="hide email'+newid+'">' + $("#email").val() + '</td>\n\
		<td  class="phone'+newid+'">' + $("#phone").val() + '</td>\n\
		<td  class="gender'+newid+'">' + $("input[name=gender]:radio:checked").val() + '</td>\n\
		<td  class="dob'+newid+'">' + $("#dob").val() + '</td>\n\
		<td  class="address'+newid+'">' + $("#address").val() + '</td>\n\
		<td  class="address1'+newid+'">' + $("#address1").val() + '</td>\n\
		<td  class="relation'+newid+'">' + $("#relation option:selected").val()  + '</td>\n\
		<td  class="city'+newid+'">' + $("#city").val() + '</td>\n\
		<td  class="state'+newid+'">' + $("#state").val() + '</td>\n\
		<td  class="country'+newid+'">' + $("#country").val() + '</td>\n\
		<td  class="zip'+newid+'">' + $("#zip").val() + '</td>\n\</tr>');
 		
/* 		<td width="100px" class="organization'+newid+'">' + $("#org_selectmem").val()  + '</td>\n\
 */ 	
 
 		$("#skilltable").append('<tr valign="top" id="'+newid+'">'+
				'<td width="100px" class="fname'+newid+'">' + $("#fname").val() + '</td>'+
				'<td width="100px" class="malayalam'+newid+'"> <input type="radio" value="0" name="rating'+newid+'" />  0<input type="radio"  value="1" name="rating'+newid+'"/> 1<input type="radio"  name="rating'+newid+'" value="2" />  2<input type="radio"  name="rating'+newid+'" value="3" />  3<input type="radio"  name="rating'+newid+'" value="4" />  4 <input type="radio"  name="rating'+newid+'" value="5" /> 5</td>'+
				'<td width="100px" class="sanskrit'+newid+'">  <input type="radio" id="sanstar0'+newid+'" name="sanrating'+newid+'" value="0" >  <label for="sanstar0">0</label><input type="radio" id="sanstar1'+newid+'" name="sanrating'+newid+'" value="1" >  <label for="sanstar1">1</label><input type="radio" id="sanstar2'+newid+'" name="sanrating'+newid+'" value="2" >  <label for="sanstar3">2</label><input type="radio" id="sanstar3'+newid+'" name="sanrating'+newid+'" value="3" >  <label for="sanstar3">3</label><input type="radio" id="sanstar4'+newid+'" name="sanrating'+newid+'" value="4" >  <label for="sanstar4">4</label> <input type="radio" id="sanstar5'+newid+'" name="sanrating'+newid+'" value="5" >  <label for="sanstar5">5</label></td>'+
				'<td width="100px" id="'+newid+'"><a href="javascript:void(0);"  id="'+newid+'"class="remCF btn btn-warning">Remove</a></td>\n\ </tr>');
				/* 				<td width="100px" class="malayalam'+newid+'"><input type="radio" id="sanstar1" name="sanrating" value="1" >  <label for="sanstar1">1</label><input type="radio" id="sanstar2" name="rating" value="2" >  <label for="star2">2</label><input type="radio" id="star3" name="rating" value="3" >  <label for="star4">4</label><input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label> <input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label></td>\n\
				<td width="100px" class="malayalam'+newid+'"><input type="radio" id="star1" name="rating" value="1" >  <label for="star1">1</label><input type="radio" id="star2" name="rating" value="2" >  <label for="star2">2</label><input type="radio" id="star3" name="rating" value="3" >  <label for="star4">4</label><input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label> <input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label></td>\n\
				<td width="100px" class="malayalam'+newid+'"><input type="radio" id="star1" name="rating" value="1" >  <label for="star1">1</label><input type="radio" id="star2" name="rating" value="2" >  <label for="star2">2</label><input type="radio" id="star3" name="rating" value="3" >  <label for="star4">4</label><input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label> <input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label></td>\n\
				<td width="100px" class="malayalam'+newid+'"><input type="radio" id="star1" name="rating" value="1" >  <label for="star1">1</label><input type="radio" id="star2" name="rating" value="2" >  <label for="star2">2</label><input type="radio" id="star3" name="rating" value="3" >  <label for="star4">4</label><input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label> <input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label></td>\n\
				<td width="100px" class="malayalam'+newid+'"><input type="radio" id="star1" name="rating" value="1" >  <label for="star1">1</label><input type="radio" id="star2" name="rating" value="2" >  <label for="star2">2</label><input type="radio" id="star3" name="rating" value="3" >  <label for="star4">4</label><input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label> <input type="radio" id="star5" name="rating" value="5" >  <label for="star5">5</label></td>\n\</tr>');
 */				         

		$('#member_form').find('input, select, textarea, checkbox').not("#org_selectmem").val('');
        $("input[type='password']").val('');

 		$('#gender :checked').removeAttr('checked');
		$("#skilltable").on('click', '.remCF', function() {
		      var idhref = $(this).attr('id');
			$('#table1 tr#'+idhref).remove();
			$(this).parent().parent().remove();


		});		

		});		
		/*crating new click event for save button*/
		$("#butsave").click(function() {

		var lastRowId = $('#skilltable tr:last').attr("id");
		
		/*finds id of the last row inside table*/
		var fname = new Array(); 
		var lname = new Array(); 
		var email = new Array();
		var phone = new Array();
		var relation = new Array();
		var organization = new Array();
		var dob = new Array();
		var monthdob = new Array();
		var address = new Array();
		var address1 = new Array();
		var gender = new Array();
		var city = new Array();
		var state = new Array();
		var country = new Array();
		var zip = new Array();
		var mal = new Array();
		var san = new Array();

		
		for ( var i = 1; i <= lastRowId; i++) {

		     let malval =  $("input[name='rating"+i+"']:checked").val();
                  alert(malval);
		
			$('input[name="rating'+i+'"]:radio').click(function(){
		        let name= $(this).attr('name');
			
		    mal.push(malval);
		});


			fname.push($("#"+i+" .fname"+i).html()); /*pushing all the names listed in the table*/
			lname.push($("#"+i+" .lname"+i).html()); /*pushing all the names listed in the table*/
			email.push($("#"+i+" .email"+i).html()); /*pushing all the emails listed in the table*/
			phone.push($("#"+i+" .phone"+i).html()); /*pushing all the phone listed in the table*/
			relation.push($("#"+i+" .relation"+i).html()); /*pushing all the relation listed in the table*/
			organization.push($("#"+i+" .organization"+i).html()); /*pushing all the relation listed in the table*/
			address.push($("#"+i+" .address"+i).html()); /*pushing all the address listed in the table*/
			address1.push($("#"+i+" .address"+i).html()); /*pushing all the address listed in the table*/
			dob.push($("#"+i+" .dob"+i).html()); /*pushing all the dob listed in the table*/
			gender.push($("#"+i+" .gender"+i).html());
			city.push($("#"+i+" .city"+i).html()); 
			state.push($("#"+i+" .state"+i).html()); 
			country.push($("#"+i+" .country"+i).html()); 
			zip.push($("#"+i+" .zip"+i).html()); 
			//mal.push($("#"+i+ ".mal"+i).html());
			san.push($("#"+i+ ".san"+i).html());
			//$("input:radio[name=theme]").click(function() {
            alert(mal);alert(city);
/* 			mal.push($("#"+i+ "$('input[name='ratings']:checked').val()"+i).html());
 */			//san.push($("#"+i+"$('input[name='ratings']:checked').val()"+i).html());

        }


		$.ajax({
			url: "AddregmemServlet",
			type: "POST",
			data: {hostname: domain,sesid:sesid, fname : fname, lname: lname, email : email, phone : phone, gender:gender,relation:relation, address:address,address1:address1, dob:dob, city:city, state:state, country:country, zip:zip, id:lastRowId },		
			success : function(data){
				alert("Data Added Successfully"); 
                window.location.reload();						
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
						<option value="Head of Household" selected > Head of Household</option>
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
								
				<center><button type="button" class="btn btn-info" id="btn-add_more">Add Relative</button></center>
			
		</div>
					<div class=clearfix></div>
			
		<div class="container-fluid">
		
			<table id="table1" name="table1" class="table table-responsive table-striped   ">
				<tbody>
					<tr class="info ">
						<th>ID</th>
						<th>Name</th>
						<th>LastName</th>
						<th>email</th>			
						<th>Phone</th>
						<th>Gender</th>
						<th>DOB</th>	
						<th>Address</th>					
						<th>Relation</th>
						<th>City</th>
						<th>State</th>
						<th>Country</th>
						<th>Zip</th>
					<tr>
				</tbody>
			</table> 
			<h3>Proficiency Levels</h3>
			<p>0 = None. 	1 = Know basics (for conversation, letters, slokas, stories).	2 = Can do basic covering writing and basic reading.	 3 = Can do some intermediate writing and reading.	4 = Can converse fluently, read extensively.  5 = Expert, Can Teach.</p>
<!-- 			<p>1 = Know basics (for conversation, letters, slokas, stories)			 </p>
			<p>2 = Can do basic covering writing and basic reading		</p>
			<p>3 = Can do some intermediate writing and reading </p>
            <p>4 = Can converse fluently, read extensively</p>
            <p>5 = Expert, Can Teach			</p>
 -->			
			<table id="skilltable" name="skilltable" class="table table-responsive table-striped   ">
				<tbody>
					<tr class="info ">
						<th>Name</th>
						<th>Malayalam Proficiency </th>
<!-- 						<th>Samskritam Proficiency </th>
						<th>GITASlokas, GeethamsBhajans </th>			
 -->						<th>Hindu Dharma Proficiency </th>
<!-- 						<th>Legendary Indians History</th>
						<th>YOGA</th>	
 -->					
 						<th>Action</th>	
 <tr>
				</tbody>
			</table>
			</div>
</div>				
<div class="row">
<div class="form-group  col-sm-4"></div>
<div class="form-group  col-sm-4"></div>

<div class="form-group  col-sm-4">
				<button type="button" class="btn btn-info" id="butsave" name="save">Submit</button>

<!-- <input type="button"  name="save" class="btn btn-info" value="Submit" id="butsave">
 --></div></div>
</div></form>	</div>

