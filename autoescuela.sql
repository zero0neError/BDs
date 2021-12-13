-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-12-2021 a las 17:20:41
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `autoescuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

DROP TABLE IF EXISTS `examen`;
CREATE TABLE IF NOT EXISTS `examen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `duracion` time NOT NULL,
  `nPreguntas` int(6) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen-preguntas`
--

DROP TABLE IF EXISTS `examen-preguntas`;
CREATE TABLE IF NOT EXISTS `examen-preguntas` (
  `idExamen` int(11) NOT NULL,
  `idPreguntas` int(11) NOT NULL,
  PRIMARY KEY (`idExamen`,`idPreguntas`),
  KEY `idExamen` (`idExamen`),
  KEY `idPreguntas` (`idPreguntas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenhecho`
--

DROP TABLE IF EXISTS `examenhecho`;
CREATE TABLE IF NOT EXISTS `examenhecho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idExamen` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `calificacion` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idExamen` (`idExamen`),
  KEY `idAlumno` (`idAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `respuestaCorrecta` int(11) NOT NULL,
  `recurso` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idTematica` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `respuestaCorrecta` (`respuestaCorrecta`),
  KEY `idTematica` (`idTematica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE IF NOT EXISTS `respuestas` (
  `id` int(11) NOT NULL,
  `enunciado` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `idPregunta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPregunta` (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tematica`
--

DROP TABLE IF EXISTS `tematica`;
CREATE TABLE IF NOT EXISTS `tematica` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tematica`
--

INSERT INTO `tematica` (`Id`, `nombre`) VALUES
(1, 'Normas generales de comportamiento'),
(2, 'Pesos, dimensiones, transporte de personas'),
(3, 'Seguridad vial'),
(4, 'La via'),
(5, 'Velocidad'),
(6, 'Intersecciones'),
(7, 'Maniobras'),
(8, 'Alumbrado'),
(9, 'Señales'),
(10, 'Documentos, mandos y reglaje del vehículo'),
(11, 'Accidentes'),
(12, 'Mecanica y mantenimiento'),
(13, 'Tecnicas de conduccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `rol` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hash` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `nombre`, `apellidos`, `password`, `fechaNacimiento`, `rol`, `foto`, `hash`) VALUES
(2, 'kico@gmail.com', 'Kico', 'de la Tuuur', 'qwerty1_', '2001-06-19', 'Usuario', NULL, NULL),
(3, 'jesusrp@live.com', 'Jesus', 'Perez Rodriguez', '1234', '1991-11-16', 'Usuario', NULL, NULL),
(7, 'aogarod001@g.educaand.es', 'Antonio', 'Cum', NULL, '2021-12-15', 'Usuario', NULL, '4cfddd091dbc35782c0b081a81c95cef'),
(9, 'wwbhty@gmail.com', 'Guillermo', 'Rueda Padilla', '1234', '2001-12-15', 'Usuario', NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `examen-preguntas`
--
ALTER TABLE `examen-preguntas`
  ADD CONSTRAINT `examen-preguntas1` FOREIGN KEY (`idPreguntas`) REFERENCES `preguntas` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `examen-preguntas_ibfk_1` FOREIGN KEY (`idExamen`) REFERENCES `examen` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `examenhecho`
--
ALTER TABLE `examenhecho`
  ADD CONSTRAINT `34` FOREIGN KEY (`idExamen`) REFERENCES `examen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `35` FOREIGN KEY (`idAlumno`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `2` FOREIGN KEY (`respuestaCorrecta`) REFERENCES `respuestas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `3` FOREIGN KEY (`idTematica`) REFERENCES `tematica` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
