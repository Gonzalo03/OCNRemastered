-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2020 a las 07:44:17
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sys_ocn`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `CargoID` int(11) NOT NULL,
  `Solicitud` varchar(50) DEFAULT NULL,
  `TipoMantenimiento` varchar(50) DEFAULT NULL,
  `FechaEmision` datetime DEFAULT NULL,
  `LugarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`CargoID`, `Solicitud`, `TipoMantenimiento`, `FechaEmision`, `LugarID`) VALUES
(1, 'Oficio N° 073-2020-UNAP-FE', 'Fisico/Logico', '2020-05-21 00:30:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docdatos`
--

CREATE TABLE `docdatos` (
  `DocID` int(11) NOT NULL,
  `NombreTecnico` varchar(50) DEFAULT NULL,
  `Descrpción` varchar(200) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `CargoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docdatos`
--

INSERT INTO `docdatos` (`DocID`, `NombreTecnico`, `Descrpción`, `FechaInicio`, `FechaFin`, `CargoID`) VALUES
(1, 'Gonzalo Mauricio Da Silva Torres', 'Probando xD', '2020-05-21', '2020-05-21', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impresoras`
--

CREATE TABLE `impresoras` (
  `CodPtr` varchar(25) NOT NULL,
  `Serie` varchar(25) NOT NULL,
  `Marca` varchar(25) DEFAULT NULL,
  `Modelo` varchar(25) DEFAULT NULL,
  `OfiArea` varchar(25) DEFAULT NULL,
  `ObserAnota` varchar(25) DEFAULT NULL,
  `LugarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laptop`
--

CREATE TABLE `laptop` (
  `CodPtr` varchar(25) NOT NULL,
  `Serie` varchar(25) NOT NULL,
  `Marca` varchar(25) DEFAULT NULL,
  `Modelo` varchar(25) DEFAULT NULL,
  `OfiArea` varchar(25) DEFAULT NULL,
  `ObserAnota` varchar(25) DEFAULT NULL,
  `LugarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `LugarID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `TipoLugar` varchar(50) NOT NULL,
  `CantPC` int(11) NOT NULL,
  `CantMonitores` int(11) NOT NULL,
  `CantImpresoras` int(11) NOT NULL,
  `CantLaptop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lugares`
--

INSERT INTO `lugares` (`LugarID`, `Nombre`, `TipoLugar`, `CantPC`, `CantMonitores`, `CantImpresoras`, `CantLaptop`) VALUES
(1, 'Enfermeria', 'Facultad', 8, 8, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitores`
--

CREATE TABLE `monitores` (
  `CodPtr` varchar(25) NOT NULL,
  `Serie` varchar(25) NOT NULL,
  `Marca` varchar(25) DEFAULT NULL,
  `Modelo` varchar(25) DEFAULT NULL,
  `OfiArea` varchar(25) DEFAULT NULL,
  `ObserAnota` varchar(25) DEFAULT NULL,
  `LugarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `monitores`
--

INSERT INTO `monitores` (`CodPtr`, `Serie`, `Marca`, `Modelo`, `OfiArea`, `ObserAnota`, `LugarID`) VALUES
('', '507NTFA9B867', 'LG', '19M37A', 'Biblioteca', 'Operativa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pc`
--

CREATE TABLE `pc` (
  `CodPtr` varchar(25) NOT NULL,
  `Serie` varchar(25) NOT NULL,
  `Marca` varchar(25) DEFAULT NULL,
  `Modelo` varchar(25) DEFAULT NULL,
  `OfiArea` varchar(25) DEFAULT NULL,
  `ObserAnota` varchar(25) DEFAULT NULL,
  `LugarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pc`
--

INSERT INTO `pc` (`CodPtr`, `Serie`, `Marca`, `Modelo`, `OfiArea`, `ObserAnota`, `LugarID`) VALUES
('74089950-2354', '', 'ALTRON', NULL, 'Biblioteca', 'Operativa', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`CargoID`),
  ADD KEY `fkLugares_Cargo` (`LugarID`);

--
-- Indices de la tabla `docdatos`
--
ALTER TABLE `docdatos`
  ADD PRIMARY KEY (`DocID`),
  ADD KEY `fkCargo_DocDatos` (`CargoID`);

--
-- Indices de la tabla `impresoras`
--
ALTER TABLE `impresoras`
  ADD PRIMARY KEY (`CodPtr`,`Serie`),
  ADD KEY `fkLugares_Impresoras` (`LugarID`);

--
-- Indices de la tabla `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`CodPtr`,`Serie`),
  ADD KEY `fkLugares_Laptop` (`LugarID`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`LugarID`);

--
-- Indices de la tabla `monitores`
--
ALTER TABLE `monitores`
  ADD PRIMARY KEY (`CodPtr`,`Serie`),
  ADD KEY `fkLugares_Monitores` (`LugarID`);

--
-- Indices de la tabla `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`CodPtr`,`Serie`),
  ADD KEY `fkLugares_PC` (`LugarID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `CargoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `docdatos`
--
ALTER TABLE `docdatos`
  MODIFY `DocID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `LugarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `fkLugares_Cargo` FOREIGN KEY (`LugarID`) REFERENCES `lugares` (`LugarID`);

--
-- Filtros para la tabla `docdatos`
--
ALTER TABLE `docdatos`
  ADD CONSTRAINT `fkCargo_DocDatos` FOREIGN KEY (`CargoID`) REFERENCES `cargo` (`CargoID`);

--
-- Filtros para la tabla `impresoras`
--
ALTER TABLE `impresoras`
  ADD CONSTRAINT `fkLugares_Impresoras` FOREIGN KEY (`LugarID`) REFERENCES `lugares` (`LugarID`);

--
-- Filtros para la tabla `laptop`
--
ALTER TABLE `laptop`
  ADD CONSTRAINT `fkLugares_Laptop` FOREIGN KEY (`LugarID`) REFERENCES `lugares` (`LugarID`);

--
-- Filtros para la tabla `monitores`
--
ALTER TABLE `monitores`
  ADD CONSTRAINT `fkLugares_Monitores` FOREIGN KEY (`LugarID`) REFERENCES `lugares` (`LugarID`);

--
-- Filtros para la tabla `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `fkLugares_PC` FOREIGN KEY (`LugarID`) REFERENCES `lugares` (`LugarID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
