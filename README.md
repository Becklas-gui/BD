CREATE DATABASE atv_clinica_veterinaria;

USE atv_clinica_veterinaria;

CREATE TABLE veterinario (
  crvVeterinario VARCHAR(5) NOT NULL PRIMARY KEY,
  Nome_veterinario VARCHAR(100) NOT NULL,
  endVeterinario VARCHAR(100) NOT NULL,
  celVeterinario VARCHAR(9) NOT NULL,
  cpfVeterinario CHAR(11) NOT NULL
);

CREATE TABLE consulta (
  idConsulta INT(11) AUTO_INCREMENT PRIMARY KEY,
  dataConsulta DATE NOT NULL,
  horarioConsulta TIME NOT NULL,
  valorConsulta DECIMAL(8,2) NOT NULL,
  diagnosticoConsulta VARCHAR(150) NOT NULL,
  FK_CRV_veterinario VARCHAR(6) NOT NULL,

  crvVeterinario_pk VARCHAR(5) NOT NULL
  FOREIGN KEY (crvVeterinario_pk) REFERENCES veterinario(crvVeterinario),
  FOREIGN KEY (FK_Id_animal) REFERENCES animal(ID_animal)
);

CREATE TABLE animal (
  ID_animal INT(6) NOT NULL PRIMARY KEY,
  Nome_animal VARCHAR(20),
  Tipo_animal VARCHAR(10) NOT NULL,
  Raca_animal VARCHAR(15),
  Idade_animal INT(3),
  Alergia_animal BOOL NOT NULL
);

CREATE TABLE cliente (
  CPF_cliente VARCHAR(11) NOT NULL PRIMARY KEY,
  Nome_cliente VARCHAR(30) NOT NULL,
  Endereco_cliente VARCHAR(50),
  Telefone_cliente INT(13),
  Celular_cliente INT(13) NOT NULL,
  FK_Id_animal INT(6) NOT NULL,
  FOREIGN KEY (FK_Id_animal) REFERENCES animal(ID_animal)
);


CREATE TABLE Herbivoro (
  ID_animal_herbivoro INT(6) AUTO_INCREMENT,
  Peso_herbivoro FLOAT(6,2) NOT NULL,
  Altura_herbivoro FLOAT(4,2) NOT NULL,
  FK_ID_animal INT(6) NOT NULL,
  FOREIGN KEY (FK_ID_animal) REFERENCES animal(ID_animal)
);

CREATE TABLE Carnivoro (
  ID_animal_carnivoro INT(6) AUTO_INCREMENT,
  Peso_carnivoro FLOAT(6,2) NOT NULL,
  Altura_carnivoro FLOAT(4,2) NOT NULL,
  FK_ID_animal INT(6) NOT NULL,
  FOREIGN KEY (FK_ID_animal) REFERENCES animal(ID_animal)
);

CREATE TABLE Onivoro (
  ID_animal_onivoro INT(6) AUTO_INCREMENT,
  Peso_onivoro FLOAT(6,2) NOT NULL,
  Altura_onivoro FLOAT(4,2) NOT NULL,
  FK_ID_animal INT(6) NOT NULL,
  FOREIGN KEY (FK_ID_animal) REFERENCES animal(ID_animal)
);
