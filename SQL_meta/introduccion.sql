-- Entrar al mysql local por consola
-- mysql -u root -p

-- Para hacerlo con windows: Buscar la carpeta xammp
-- xa => mysql => bin

-- Listar las bases de datos creadas en mysql
-- SHOW DATABASES;

-- Crear una base de datos
-- CREATE DATABASE nombre_base_datos

-- Comando para usar una base de datos
-- USE base_datos;

-- Crear una tabla 
-- CREATE TABLE nombre_tabla (
  -- -> id INT PRIMARY KEY AUTO_INCREMENT,
  -- -> nombre varchar(40),
  -- -> email varchar(40) UNIQUE NOT NULL
  -- -> );

-- Comando para ver las tablas de la base de datos
-- SHOW TABLES;

-- Comando para ver los detalles de una tabla
-- DESC nombre_tabla;

-- Comando para agregar registros
-- INSERT INTO nombre_tabla (atributo1,atributo2) VALUES (VALOR1, VALOR2);

-- Comando para listar los datos de una tabla
-- SELECT * FROM nombre_tabla
-- SELECT "nombre_atributo" FROM nombre_tabla

-- Comando para alterar tabla
  -- ALTER TABLE nombre_tabla

  -- ALTER TABLE nombre_tabla ADD COLUMN nombre_atributo tipo_dato restricciones;

  -- ALTER TABLE nombre_tabla RENAME TO nuevo_nombre_tabla;

  -- ALTER TABLE nombre_tabla RENAME COLUMN nombre_columna TO nuevo_nombre_columna;

  -- ALTER TABLE nombre_tabla MODIFY COLUMN nombre_atributo tipo reglas;

  -- ALTER TABLE nombre_tabla CHANGE COLUMN nombre_atributo_actual nuevo_nombre tipo restriccion;

  -- DELETE FROM nombre_tabla WHERE nombre_tabla.id = "valor_id";

-- EJEMPLO CON LLAVE FORANEA
  -- CREATE TABLE estudiantes (
    -- 	   id INT PRIMARY KEY AUTO_INCREMENT,
    --     student_name varchar(40) NOT NULL,
    --     student_surname varchar(40) NOT NULL,
    --     date_of_birth DATE,
    --     id_centro_educativo INT,
    --     CONSTRAINT fk_centro_educativo FOREIGN KEY(id_centro_educativo) REFERENCES centros_educativos(id)
--    );
