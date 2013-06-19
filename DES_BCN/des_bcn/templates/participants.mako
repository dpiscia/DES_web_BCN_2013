<%inherit file="base.mako"/>
<%block name="main_container">
  



<table id="table_part" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" >
    <thead>
        <tr>
            
            <th class="rounded">Id</th>
            <th class="rounded">Surname</th>
            <th class="rounded">Name</th>
            <th class="rounded">Institution</th>
            
        </tr>
    </thead>
    <tbody style="color : rgb(0,0,0);">
        <!-- table jobs -->
        % for part in participants:
        <tr>
        
   <td >${part.id}</td> 


            
            <td >${part.surname}</td>
            <td >${part.name}</td>
            <td >${part.institution}</td>
            
        
        </tr>
        % endfor
    </tbody>
    <tfoot>
        <tr>
            <th> </th> 
            <th> </th>
            <th> </th> 
            <th> </th>
            
        </tr>
    </tfoot>
</table>



</%block>
