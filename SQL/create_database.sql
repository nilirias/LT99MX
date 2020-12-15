-- CREATE DATABASE tetris_test;

-- USE tetris_test;

CREATE TABLE Insignias (
    insigniaID varchar(15) NOT NULL UNIQUE,
    titulo varchar(20) NOT NULL,
    descripcion varchar (100),

    PRIMARY KEY (insigniaID)
);

CREATE TABLE Usuarios (
    userID varchar(15) NOT NULL UNIQUE,
    soiAdmin boolean NOT NULL,
    username varchar(20) NOT NULL,
    correo varchar(50) NOT NULL,
    contrasenia varchar(50) NOT NULL,
    nombre varchar(50) NOT NULL,
    estado varchar(20) NOT NULL,
    foto varchar(100),
    descripcion varchar(140),
    insigniaFavorita varchar(15),

    PRIMARY KEY (userID),
    FOREIGN KEY (insigniaFavorita) references Insignias(insigniaID) 
);

CREATE TABLE InsigniaObtenida (
    userID varchar(15) NOT NULL UNIQUE,
    insigniaID varchar(15) NOT NULL,
    fechaDeObtencion date NOT NULL,

    PRIMARY KEY (userID, insigniaID),
    FOREIGN KEY (userID) references Usuarios(userID),
    FOREIGN KEY (insigniaID) references Insignias(insigniaID)
);

CREATE TABLE Noticias (
    noticiaID varchar(15) NOT NULL UNIQUE,
    titulo varchar(50) NOT NULL,
    descripcion varchar (500) NOT NULL,
    adminID varchar(15) NOT NULL,

    PRIMARY KEY (noticiaID),
    FOREIGN KEY (adminID) references Usuarios(userID)
);

CREATE TABLE Partidas (
    fechaDeJugacion date NOT NULL UNIQUE,
    jornada int NOT NULL,
    partida int NOT NULL,

    PRIMARY KEY (fechaDeJugacion)
);

CREATE TABLE Participaciones (
    fechaDeJugacion date NOT NULL,
    userID varchar(15) NOT NULL,
    posicion int,

    PRIMARY KEY (fechaDeJugacion, userID),
    FOREIGN KEY (fechaDeJugacion) references Partidas(fechaDeJugacion),
    FOREIGN KEY (userID) references Usuarios(userID)
);