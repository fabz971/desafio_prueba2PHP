CREATE DATABASE bd_ejercicio_prueba2;-- DROP DATABASE bd_ejercicio_prueba2;

USE bd_ejercicio_prueba2;

CREATE TABLE docente(-- DROP TABLE  docente
	id INT AUTO_INCREMENT,
    rut VARCHAR(12),
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);-- SELECT * FROM docente;

INSERT INTO docente VALUES(NULL,'11-1','Roberto');
INSERT INTO docente VALUES(NULL,'22-2','Andres');
INSERT INTO docente VALUES(NULL,'33-3','Jose');
INSERT INTO docente VALUES(NULL,'44-4','Franco');
INSERT INTO docente VALUES(NULL,'55-5','Alexis');

CREATE TABLE curso(-- DROP TABLE curso
	id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);-- SELECT * FROM curso;

INSERT INTO curso VALUES(NULL,'Twerk');
INSERT INTO curso VALUES(NULL,'Trap');
INSERT INTO curso VALUES(NULL,'K-pop');
INSERT INTO curso VALUES(NULL,'Calculo');
INSERT INTO curso VALUES(NULL,'Lenguaje');
INSERT INTO curso VALUES(NULL,'Php');
INSERT INTO curso VALUES(NULL,'Base datos');
INSERT INTO curso VALUES(NULL,'Electricidad');

CREATE TABLE docente_curso(-- DROP TABLE docente_curso
	id INT AUTO_INCREMENT,
    fk_docente INT,
    fk_curso INT,
    anio DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_docente) REFERENCES docente(id),
    FOREIGN KEY(fk_curso) REFERENCES curso(id)
);-- SELECT * FROM docente_curso;
SELECT DISTINCT fk_curso FROM docente_curso WHERE fk_docente != 1


DELIMITER $$
CREATE PROCEDURE relacionar_curso (id_docente INT,id_curso INT) -- DROP PROCEDURE relacionar_curso
BEGIN
	DECLARE existe_relacion BOOLEAN;
	SET existe_relacion = (SELECT COUNT(*) FROM docente_curso WHERE fk_docente = id_docente AND fk_curso = id_curso);
     
	IF existe_relacion = 0 THEN
		INSERT INTO docente_curso VALUES (NULL,id_docente,id_curso,CURDATE());
	END IF;

END $$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE cursos_tomados (entrada VARCHAR(50)) -- DROP PROCEDURE cursos_tomados
BEGIN
 -- DECLARE es_rut BOOLEAN;
 --   SET es_rut = (SELECT COUNT(*) FROM entrada WHERE entrada LIKE'%-%');
	IF (entrada LIKE '%-%') THEN
    SELECT 'SE LEE CON GUION, ENTONCES ES RUT';
	SELECT 
		c.nombre
	FROM
		curso c
        INNER JOIN docente_curso dc ON dc.fk_curso = c.id
        INNER JOIN docente d ON d.id = dc.fk_docente
	WHERE
		d.rut = entrada;
	ELSE
    SELECT 'NO TIENE GUION, ENTONCES ES NOMBRE';
	SELECT DISTINCT 
		c.nombre
	FROM
		curso c
        INNER JOIN docente_curso dc ON dc.fk_curso = c.id
        INNER JOIN docente d ON d.id = dc.fk_docente
	WHERE
		d.nombre = entrada;
	END IF;
END $$
DELIMITER ;


SELECT DISTINCT
		c.nombre
	FROM
		curso c
        INNER JOIN docente_curso dc ON dc.fk_curso = c.id
        INNER JOIN docente d ON d.id != dc.fk_docente
	WHERE
		d.nombre = 'Roberto'

DELIMITER $$
CREATE PROCEDURE ver_no_realizados (entrada VARCHAR(50)) -- DROP PROCEDURE ver_no_realizados
BEGIN
 -- DECLARE es_rut BOOLEAN;
 --   SET es_rut = (SELECT COUNT(*) FROM entrada WHERE entrada LIKE'%-%');
  CALL cursos_tomados(entrada);
 
 
	IF (entrada LIKE '%-%') THEN
    SELECT 'SE LEE CON GUION, ENTONCES ES RUT';
    CREATE VIEW tmp AS
    SELECT 
		c.nombre
	FROM
		curso c
        INNER JOIN docente_curso dc ON dc.fk_curso = c.id
        INNER JOIN docente d ON d.id = dc.fk_docente
	WHERE
		d.rut = entrada;
	SELECT DISTINCT 
		c.nombre
	FROM
		curso c
        INNER JOIN docente_curso dc ON dc.fk_curso != c.id
        INNER JOIN docente d ON d.id != dc.fk_docente
	WHERE
		d.rut = entrada AND c.nombre != tmp;
	ELSE
    CREATE VIEW tmp AS
    SELECT 
		c.nombre
	FROM
		curso c
        INNER JOIN docente_curso dc ON dc.fk_curso = c.id
        INNER JOIN docente d ON d.id = dc.fk_docente
	WHERE
		d.nombre LIKE entrada;
    SELECT 'NO TIENE GUION, ENTONCES ES NOMBRE';
	SELECT DISTINCT 
		c.nombre,
        dc.anio
	FROM
		curso c
        INNER JOIN docente_curso dc ON dc.fk_curso != c.id
        INNER JOIN docente d ON d.id != dc.fk_docente
	WHERE
		d. = entrada;
	END IF;
END $$
DELIMITER ;

CALL relacionar_curso(1,1);
CALL relacionar_curso(1,2);
CALL relacionar_curso(1,3);
CALL relacionar_curso(1,5);
CALL relacionar_curso(1,6);
CALL relacionar_curso(2,2);
CALL relacionar_curso(2,3);
CALL relacionar_curso(3,3);
CALL relacionar_curso(4,1);
CALL relacionar_curso(5,7);
CALL relacionar_curso(5,8);