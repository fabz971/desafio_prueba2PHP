<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
  <script src="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css"></script>
</head>
<body>

<div class="container">
  <h2>Inscripcion de los Cursos</h2>
  <table class="table">
    <thead>
      <tr>
        <th>Rut</th>
        <th>Nombre</th>
      </tr>
    </thead>
    <tbody>
      
    </tbody>
  </table>
</div>

<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>ID</th>
                <th>Rut</th>
                <th>Nombre</th>
            </tr>
        </thead>
        
    </table>


</body>
</html>



    <script>
    $(document).ready(function() {
    $('#example').DataTable();
    } );
    </script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

    </body>
</html>