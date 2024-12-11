-- Crear la base de datos
CREATE DATABASE ControlMigracion;
GO

-- Usar la base de datos recién creada
USE ControlMigracion;
GO

-- Crear la tabla Viajeros
CREATE TABLE Viajeros (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Pasaporte VARCHAR(50) UNIQUE NOT NULL,
    Sexo VARCHAR(10) NOT NULL,
    NumeroTelefono VARCHAR(15) NULL
);
GO

-- Crear la tabla Paises
CREATE TABLE Paises (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE,
    Codigo VARCHAR(10) NOT NULL UNIQUE
);
GO

-- Crear la tabla Entradas
CREATE TABLE Entradas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdViajero INT NOT NULL,
    IdPais INT NOT NULL,
    FechaEntrada DATETIME NOT NULL,
    Motivo VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdViajero) REFERENCES Viajeros(Id),
    FOREIGN KEY (IdPais) REFERENCES Paises(Id)
);
GO

-- Crear la tabla Salidas
CREATE TABLE Salidas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdViajero INT NOT NULL,
    IdPais INT NOT NULL,
    FechaSalida DATETIME NOT NULL,
    Motivo VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdViajero) REFERENCES Viajeros(Id),
    FOREIGN KEY (IdPais) REFERENCES Paises(Id)
);
GO

-- Crear la tabla Visas
CREATE TABLE Visas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdViajero INT NOT NULL,
    IdPais INT NOT NULL,
    FechaEmision DATETIME NOT NULL,
    FechaExpiracion DATETIME NOT NULL,
    FOREIGN KEY (IdViajero) REFERENCES Viajeros(Id),
    FOREIGN KEY (IdPais) REFERENCES Paises(Id)
);
GO

-- Crear la tabla Roles
CREATE TABLE Roles (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);
GO

-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
    Contraseña VARCHAR(255) NOT NULL,
    IdRol INT NOT NULL,
    FOREIGN KEY (IdRol) REFERENCES Roles(Id)
);
GO

