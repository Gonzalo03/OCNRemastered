#Creamos la base de datos
CREATE DATABASE IF NOT EXISTS sys_ocn;

#Seleccionamos la bd a trabajar
USE sys_ocn;

#creamos las tablas
CREATE TABLE IF NOT EXISTS Lugares(
	LugarID INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    TipoLugar VARCHAR(50) NOT NULL,
    CantPC INT NOT NULL,
    CantMonitores INT NOT NULL,
    CantImpresoras INT NOT NULL,
    CantLaptop INT NOT NULL,
    PRIMARY KEY(LugarID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS PC(
	CodPtr VARCHAR(25) NOT NULL,
    Serie VARCHAR(25) NOT NULL,
    Marca VARCHAR(25),
    Modelo VARCHAR(25),
    OfiArea VARCHAR(25),
    ObserAnota VARCHAR(25),
    PRIMARY KEY(CodPtr, Serie),
    LugarID INT NOT NULL,
    CONSTRAINT fkLugares_PC
    FOREIGN KEY(LugarID)
    REFERENCES Lugares(LugarID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Monitores(
	CodPtr VARCHAR(25) NOT NULL,
    Serie VARCHAR(25) NOT NULL,
    Marca VARCHAR(25),
    Modelo VARCHAR(25),
    OfiArea VARCHAR(25),
    ObserAnota VARCHAR(25),
    PRIMARY KEY(CodPtr, Serie),
    LugarID INT NOT NULL,
    CONSTRAINT fkLugares_Monitores
    FOREIGN KEY(LugarID)
    REFERENCES Lugares(LugarID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Laptop(
	CodPtr VARCHAR(25) NOT NULL,
    Serie VARCHAR(25) NOT NULL,
    Marca VARCHAR(25),
    Modelo VARCHAR(25),
    OfiArea VARCHAR(25),
    ObserAnota VARCHAR(25),
    PRIMARY KEY(CodPtr, Serie),
    LugarID INT NOT NULL,
    CONSTRAINT fkLugares_Laptop
    FOREIGN KEY(LugarID)
    REFERENCES Lugares(LugarID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Impresoras(
	CodPtr VARCHAR(25) NOT NULL,
    Serie VARCHAR(25) NOT NULL,
    Marca VARCHAR(25),
    Modelo VARCHAR(25),
    OfiArea VARCHAR(25),
    ObserAnota VARCHAR(25),
    PRIMARY KEY(CodPtr, Serie),
    LugarID INT NOT NULL,
    CONSTRAINT fkLugares_Impresoras
    FOREIGN KEY(LugarID)
    REFERENCES Lugares(LugarID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Cargo(
	CargoID INT NOT NULL,
	Solicitud VARCHAR(200),
	TipoMantenimiento VARCHAR(200),
	FechaEmision VARCHAR(200),
	PRIMARY KEY(CargoID),
    LugarID INT NOT NULL,
    CONSTRAINT fkLugares_Cargo
    FOREIGN KEY(LugarID)
    REFERENCES Lugares(LugarID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS DocDatos(
	DocID INT NOT NULL,
    NombreTecnico VARCHAR(50),
    Descrpción VARCHAR(400),
    FechaInicio DATE,
    FechaFin DATE,
    PRIMARY KEY(DocID),
    CargoID INT NOT NULL,
    CONSTRAINT fkCargo_DocDatos
    FOREIGN KEY(CargoID)
    REFERENCES Cargo(CargoID)
)ENGINE=INNODB;