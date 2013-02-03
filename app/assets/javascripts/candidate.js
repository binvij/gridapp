
  
   $(document).ready(function() {
    var oTable = $('#candidates').dataTable( {
         "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bProcessing": false,
        "bServerSide": true,
        "sAjaxSource": "/candidate/index",
        "fnDrawCallback": function () {
            $('#candidates tbody td').editable( '/candidate/update', {
                "callback": function( sValue, y ) {
                    /* Redraw the table from the new data on the server */
                   /* oTable.fnUpdate( sValue, aPos[0], 0 );*/
                    /*alert("fndraw called");*/
                    oTable.fnDestroy();
                    oTable.fnDraw();
                },



                "submitdata": function ( value, settings ) {
                 return {
                    
                    "column": oTable.fnGetPosition( this )[2],
                    "aData": oTable.fnGetData( (oTable.fnGetPosition( this )[0]))
                };
                 },
                "height": "14px"
            } );
        }
    } );
} );