<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$('.mdb-select').materialSelect();
	});

</script>
</head>
<body>
<div class="container">
	<div class="row">
	  <form role="form">
        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4">
           <input type="text" id="fname" name="fname" class="form-control" placeholder="FirstName" required>
        
        </div>
        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4">
			<input type="text" id="lname" name="lname" class="form-control" placeholder="Lastname" required>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4">
                    <input type="email" class="form-control" id="email" placeholder="Enter email">
        
        </div>
        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4">
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
        </div>
        <div class="clearfix"></div>
<!--         <div class="form-group col-xs-10 col-sm-10 col-md-4 col-lg-4">
            <label for="exampleInputFile">File input</label>
            <input type="file" id="exampleInputFile">
            <p class="help-block">Example block-level help text here.</p>
        </div>
 -->        <div class="col-xs-10 col-sm-10 col-md-4 col-lg-4">
			<label class="radio-inline"><input type="radio" name="optradio" checked>Male</label>
			<label class="radio-inline"><input type="radio" name="optradio">Female</label>
			</div>    
		 <div class=" form-group col-xs-10 col-sm-10 col-md-4 col-lg-4">
            <input class="form-control" type="tel" value="1-(555)-555-5555" id="example-tel-input"placeholder="Phone ">
        </div>
           <div class="clearfix"></div>
     	 <div class="form-group col-xs-10 col-sm-10 col-md-4 col-lg-4">
        
        <select class="mdb-select md-form" multiple>
        
		  <option value="" disabled selected>select organization</option>
		  <option value="1">Orgnaization1</option>
		  <option value="2">Germany Orgnaization1</option>
		  <option value="3">France</option>
		  <option value="3">Poland</option>
		  <option value="3">Japan</option>
</select>
        </div>
        <div class="clearfix"></div>
        <div class="col-xs-10 col-sm-4 col-md-4 col-lg-4">
            <button type="submit" class="btn btn-default">Submit</button>
        </div>
    </form>
    <div class="clearfix"></div>

    <br /><br />
	</div>
</div>

</body>
</html>