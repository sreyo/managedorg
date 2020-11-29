<% if (session.getAttribute("name") != null) { %>
<jsp:include page="dashbheader.jsp" />  
<link href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css" rel="stylesheet" id="bootstrap-css">

<link href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>


<style type="text/css">
td.details-control {
    background: url('details_open.png') no-repeat left center;
    cursor: pointer;
}
tr.details td.details-control {
    background: url('details_close.png') no-repeat right center;
}
</style>
   <script>

$(document).ready(function() {
    $('#example').DataTable( {
        responsive: true,
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "processing": true,
        "serverSide": true,
        "searchable": true,
        "sPaginationType": "full_numbers",
        "ajax": {
        	"url":"${pageContext.request.contextPath}/ViswalokamServlet",
            "type": "GET",
            dataFilter: function(data){
             var json = jQuery.parseJSON( data );alert(data);
             json.draw = json.draw;
             json.recordsTotal = json.iTotalRecords;
             json.recordsFiltered = json.iTotalDisplayRecords;
             json.data = json.aaData;
             return JSON.stringify( json ); // return JSON string
            }
        	},
        "columns": [
        	{"data":"id"},
            { "data": "firstname"},
            { "data": "lastname" },
            { "data": "email" },
            { "data": "phone" },
            { "data": "address"},
            { "data": "yeardob"},
            { "data": "country"},
            { "data": "state" },
            { "data": "relation" },
            { "data": "mal" ,"width": "20%"},
            { "data": "hin","width": "20%" }
        ],

    } );
} );</script>

    
<div class="panel-body  ">

<div class="table-responsive  ">
	<input type="hidden" id="idses"		value="<%= session.getAttribute("name") %>">
<!--     <table id="example" class="display" cellspacing="0" width="100%">
 -->   
  <table id="example" class="table table-striped table-bordered table-condensed display" cellspacing="0" width="100%">
    
        <thead>
            <tr>
                <th>SL</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>DOB</th>
                <th>Country</th>
                <th>State</th>          
                <th>Relation</th>
                <th>Malayalam Skill</th>
                <th>Hindu Skill</th>
                
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>SL</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>DOB</th>
                <th>Country</th>
                <th>State</th>
                <th>Relation</th>
                <th>Malayalam Skill</th>
                <th>Hindu Skill</th>
           </tr>
        </tfoot>
    </table>   			
</div>
</div>

<jsp:include page="footer.jsp" />  
<% } else {%>
<jsp:include page="login.jsp" />  
    
<% } %>

