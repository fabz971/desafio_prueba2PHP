<?php
require_once("Conexion.php");
class Data{
    private $c; //objeto del tipo conexion

    public function __construct(){
        $this->c = new conexion("bd_ejercicio_prueba2");
    }

   
    public function crearJuego($nombre, $categoria){
        $query = "#";

        $this->c->conectar();

        $this->c->ejecutar($query);

        $this->c->desconectar();
    }

}