CREATE DATABASE bd_ejercicio;-- DROP DATABASE bd_ejercicio;

USE bd_ejercicio;

CREATE TABLE docente(
	id INT AUTO_INCREMENT,
    rut VARCHAR(12),
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);-- SELECT * FROM docente;

CREATE TABLE curso(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);-- SELECT * FROM curso;

CREATE TABLE docente_curso(
	id INT AUTO_INCREMENT,
    fk_docente INT,
    fk_curso INT,
    anio DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_docente) REFERENCES docente(id),
    FOREIGN KEY(fk_curso) REFERENCES curso(id)
);-- SELECT * FROM docente_curso;