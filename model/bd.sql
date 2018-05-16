CREATE DATABASE bd_ejercicio_prueba2;-- DROP DATABASE bd_ejercicio;

USE bd_ejercicio;

CREATE TABLE docente(
	id INT AUTO_INCREMENT,
    rut VARCHAR(12),
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);-- SELECT * FROM docente;

INSERT INTO docente VALUES(NULL,'A1A11A','jkaja');
INSERT INTO docente VALUES(NULL,'haha','ewr');

CREATE TABLE curso(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);-- SELECT * FROM curso;

INSERT INTO curso VALUES(NULL,'ly');
INSERT INTO curso VALUES(NULL,'yl');

CREATE TABLE docente_curso(
	id INT AUTO_INCREMENT,
    fk_docente INT,
    fk_curso INT,
    anio DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_docente) REFERENCES docente(id),
    FOREIGN KEY(fk_curso) REFERENCES curso(id)
);-- SELECT * FROM docente_curso;

INSERT INTO docente_curso VALUES(NULL,1,2,"2017-06-15");
INSERT INTO docente_curso VALUES(NULL,2,1,"2012-01-10");

CREATE VIEW getCursos AS -- DROP VIEW getCursos
SELECT 
    d.nombre AS 'Docente',
    c.nombre AS 'Curso'
FROM
    docente_curso dc
    INNER JOIN docente d
    ON fk_docente = d.id
    INNER JOIN curso c
    ON fk_curso = c.id
WHERE
    dc.fk_docente LIKE '%%'; 
    
    select * from getCursos;