<%inherit file="base.mako"/>
<%block name="main_container">
  

<script type="text/javascript" charset="utf-8" src="/static/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/static/DT_bootstrap.js"    "></script>
 <script type="text/javascript">
/* Default class modification */


$(document).ready( function () {
    $('#table_part').dataTable({
        "aaSorting": [[ 0, "desc" ]],
        "aoColumns": [ 
         { "sType": "num-html"  },
         null,
         null,
         null,
         null
       ] 
        } );
} );
jQuery.extend( jQuery.fn.dataTableExt.oSort, {
    "num-html-pre": function ( a ) {
        var x = String(a).replace( /<[\s\S]*?>/g, "" );
        return parseFloat( x );
    },
 
    "num-html-asc": function ( a, b ) {
        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
    },
 
    "num-html-desc": function ( a, b ) {
        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
    }
} );
</script>   
<table id="table_part" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" >
    <thead>
        <tr>
            
            <th class="rounded">Id</th>
            <th class="rounded">Surname</th>
            <th class="rounded">Name</th>
            <th class="rounded">email</th>
            <th class="rounded">Registered</th>
        </tr>
    </thead>
    <tbody>
        <!-- table jobs -->
        % for part in participants:
        <tr>
        
   <td >${part.id}</td> 


            
            <td >${part.surname}</td>
            <td >${part.name}</td>
            <td >${part.email}</td>
            <td > to be implemented</td>
        
        </tr>
        % endfor
    </tbody>
    <tfoot>
        <tr>
            <th> </th> 
            <th> </th>
            <th> </th> 
            <th> </th>
            <th> </th> 
        </tr>
    </tfoot>
</table>



</%block>
