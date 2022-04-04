--Creación de la base de datos.
CREATE DATABASE IF NOT EXISTS aerolinea;
-- Creación de tablas.
CREATE TABLE `aerolinea`.`aerolineas` (
  `ID_AEROLINEA` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_AEROLINEA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_AEROLINEA`));

CREATE TABLE `aerolinea`.`aeropuertos` (
  `ID_AEROPUERTO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_AEROLINEA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_AEROPUERTO`));

CREATE TABLE `aerolinea`.`movimientos` (
  `ID_MOVIMIENTO` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_MOVIMIENTO`));

CREATE TABLE `aerolinea`.`vuelos` (
  `ID_AEROLINEA` INT NOT NULL,
  `ID_AEROPUERTO` INT NOT NULL,
  `ID_MOVIMIENTO` INT NOT NULL,
  `DIA` DATE NOT NULL);

-- Registros de las tablas.

INSERT INTO `aerolinea`.`aerolineas` (`ID_AEROLINEA`, `NOMBRE_AEROLINEA`) VALUES ('1', 'Volaris');
INSERT INTO `aerolinea`.`aerolineas` (`ID_AEROLINEA`, `NOMBRE_AEROLINEA`) VALUES ('2', 'Aeromar');
INSERT INTO `aerolinea`.`aerolineas` (`ID_AEROLINEA`, `NOMBRE_AEROLINEA`) VALUES ('3', 'Interjet');
INSERT INTO `aerolinea`.`aerolineas` (`ID_AEROLINEA`, `NOMBRE_AEROLINEA`) VALUES ('4', 'Aeromexico');

INSERT INTO `aerolinea`.`aeropuertos` (`ID_AEROPUERTO`, `NOMBRE_AEROLINEA`) VALUES ('1', 'Benito Juarez');
INSERT INTO `aerolinea`.`aeropuertos` (`ID_AEROPUERTO`, `NOMBRE_AEROLINEA`) VALUES ('2', 'Guanajuato');
INSERT INTO `aerolinea`.`aeropuertos` (`ID_AEROPUERTO`, `NOMBRE_AEROLINEA`) VALUES ('3', 'La paz');
INSERT INTO `aerolinea`.`aeropuertos` (`ID_AEROPUERTO`, `NOMBRE_AEROLINEA`) VALUES ('4', 'Oaxaca');

INSERT INTO `aerolinea`.`movimientos` (`ID_MOVIMIENTO`, `DESCRIPCION`) VALUES ('1', 'Salida');
INSERT INTO `aerolinea`.`movimientos` (`ID_MOVIMIENTO`, `DESCRIPCION`) VALUES ('2', 'LLegada');

INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('1', '1', '1', '2021-05-02');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('2', '1', '1', '2021-05-02');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('3', '2', '2', '2021-05-02');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('4', '3', '2', '2021-05-02');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('1', '3', '2', '2021-05-02');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('2', '1', '1', '2021-05-02');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('2', '3', '1', '2021-05-04');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('3', '4', '1', '2021-05-04');
INSERT INTO `aerolinea`.`vuelos` (`ID_AEROLINEA`, `ID_AEROPUERTO`, `ID_MOVIMIENTO`, `DIA`) VALUES ('3', '4', '1', '2021-05-04');
