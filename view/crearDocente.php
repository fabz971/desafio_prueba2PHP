<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Crear Docente</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>

<br>
<br>

<div class="container">
    <h1>Crear Docente</h1> 
  
  <form action="" method="">
    <div class="form-group">
    <fieldset class="form-rut form-group">
        <div class="form-control-label col-md-4 col-xs-10">
            <label class="" for="rut">Rut</label>
            <input type="text" class="input-rut form-control" name="rut" id="rut" placeholder="14.569.484-1" required>
            <label for="usr">Nombre:</label>
      <input type="text" class="input-rut form-control" palceholder="Nombre:">
        </div>
      </fieldset>
      
      <br>
      <div class="container">
  <input type="submit" class="btn btn-danger" value="Crear Curso">
  <a class="btn btn-success" href="">Volver</a>
</div>
      
    </div>
  </form>

    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script type="text/javascript">
      $(function() {
        $("#rut").rut({formatOn: 'keyup', 
        validateOn: 'keyup'
        }).on('rutInvalido', 
        function(){
            rut.setCustomValidity("RUT Inválido");
            $(".form-rut").addClass("has-danger")
            $(".input-rut").addClass("form-control-danger")  
        }).on('rutValido', 
        function(){ 
            $(".form-rut").removeClass("has-danger")
            $(".form-rut").addClass("has-success")
            $(".input-rut").removeClass("form-control-danger")
            $(".input-rut").addClass("form-control-success")
            rut.setCustomValidity('')
        });
      });
            $('#nom').on('input', function() {
                var value = $(this).val();
                if(value.length >= 5){
                    $(".form-nom").removeClass("has-danger")
                    $(".form-nom").addClass("has-success")
                    $(".input-nom").removeClass("form-control-danger")
                    $(".input-nom").addClass("form-control-success")
                    nom.setCustomValidity('')
                }
                if(value.length >= 0 && value.length < 5){
                    nom.setCustomValidity("El Nombre debe tener mas de 5 caracteres");
                    $(".form-nom").addClass("has-danger")
                    $(".input-nom").addClass("form-control-danger")    
                }
        });
    </script>
    </body>
</html>