DROP DATABASE Practica4;
CREATE DATABASE Practica4;
USE Practica4;

CREATE TABLE Usuario(
ID_Usuario INT NOT NULL AUTO_INCREMENT,
Nombre_U VARCHAR(40),
Rango ENUM('Novato','Medio','Experto'),
PRIMARY KEY (ID_Usuario));

CREATE TABLE Categoria(
ID_Categoria INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(40),
PRIMARY KEY(ID_Categoria));

CREATE TABLE Tema(
ID_Tema INT NOT NULL AUTO_INCREMENT,
Nombre_T VARCHAR(40),
ID_Categoria INT,
PRIMARY KEY(ID_Tema),
INDEX(ID_Categoria),
FOREIGN KEY(ID_Categoria) REFERENCES Categoria (ID_Categoria));

CREATE TABLE Comentario(
ID_Comentario INT NOT NULL AUTO_INCREMENT,
Titulo VARCHAR(20),
Comentario VARCHAR(50),
ID_Tema INT,
ID_Usuario INT,
PRIMARY KEY(ID_Comentario),
INDEX(ID_Tema),
FOREIGN KEY(ID_Tema) REFERENCES Tema(ID_Tema),
INDEX(ID_Usuario),
FOREIGN KEY(ID_Usuario) REFERENCES Usuario(ID_Usuario));

INSERT INTO Usuario VALUES (null,"Alex",'Novato');
INSERT INTO Usuario VALUES(null,"Lorena",'Medio');
INSERT INTO Usuario VALUES (null, "Javier", 'Experto');
INSERT INTO Categoria VALUES (null, "Bases de datos");
INSERT INTO Categoria VALUES (null,"'Programación");
INSERT INTO Categoria VALUES (null, "Servidores");
INSERT INTO Tema VALUES (null, "PostgreSQL", 1);
INSERT INTO Tema VALUES (null, "BDOO", 1);
INSERT INTO Tema VALUES (null, "Método constructor", 2);
INSERT INTO Tema VALUES (null, "Setters", 2);
INSERT INTO Tema VALUES (null, "Almacenamiento", 3);
INSERT INTO Tema VALUES (null, "Acceso concurrente", 3);
INSERT INTO Comentario VALUES (null,"titulo 1","comentario 1",1,3);
INSERT INTO Comentario VALUES (null,"titulo 2","comentario 2",2,2);
INSERT INTO Comentario VALUES (null,"titulo 3","comentario 3",3,1);

CREATE VIEW Usuario_comentario AS SELECT usuario.ID_Usuario, Nombre_U, Rango, Titulo,Comentario FROM Usuario INNER JOIN Comentario ON Usuario.ID_Usuario=comentario.ID_Usuario;
SELECT*FROM Usuario_comentario;
SELECT*FROM Usuario_comentario WHERE ID_Usuario=2;
SELECT*FROM Usuario_comentario ORDER BY Rango;