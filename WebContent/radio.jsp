<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
$(document).ready( function() {

var array = []; 
/* $('input:checked').each(function(){alert("hai");alert($(this).val());
    array.push($(this).val());
});
 */
$("input[name=s_0]:radio").click(function(){alert("in");
let name= $(this).val();alert(name);});

});
</script>
</head>
<body>

<table>
<tr>
   <td align="left" style="width: 300px">
      <div id="div_s_0">
         <input type="radio" name="s_0" value="1" />Public
         <input type="radio" name="s_0" value="2" />Not Public
         <input type="radio" name="s_0" value="3" />Confidential
      </div>
   </td>
</tr>
<tr>
   <td align="left" style="width: 300px">
      <div id="div_s_1">
         <input type="radio" name="s_1" value="1" />Public
         <input type="radio" name="s_1" value="2" />Not Public
         <input type="radio" name="s_1" value="3" />Confidential
      </div>
   </td>
</tr>

</table>
</body>
</html>