-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2023 a las 02:39:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbproyec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `nombre`, `cedula`, `direccion`, `username`, `password`, `tipo`) VALUES
(15, 'Ronald Tandazo', '0123456789', 'Samanes 7', 'admin', '$2a$08$UNyoPP/.0ghICqPCFrFZiuWQPghJDy5E2FqjeCWWhpRKeVRuX29OO', 0),
(19, 'Sergio Vera', '0123456789', 'Entrada de la 8', 'SVera1999', '$2y$10$xQ/rZSk8bgAROCCHoYxz2uADuw5v.2eeB8uM4kgkwvbLZixryI3zS', 1),
(20, 'Gutavo Granados', '9876543210', 'Villa EspaÃ±a', 'GGranados25', '$2y$10$m4jg2r5fSoD1nf4DpgHKA.2.PZERmqzUthck0KRqjTQU/RxNM34hO', 3),
(21, 'Joel Tito', '1236547890', 'Sauces 9', 'JTito28', '$2y$10$atKzxrylGeCzUSmjUnDtuuTHcJGippXolQJzc.5Mqqukt5tidOM7S', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peso`
--

CREATE TABLE `peso` (
  `id` int(250) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `peso` int(100) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peso`
--

INSERT INTO `peso` (`id`, `usuario`, `peso`, `fecha`) VALUES
(1, 'Juan Sosa', 65, '2022-12-20'),
(2, 'Alex Garcia', 70, '2022-12-30'),
(3, 'Lorena Lopez', 70, '2023-01-01'),
(4, 'Paola Parra', 75, '2023-01-02'),
(5, 'Juan Granados', 75, '2023-01-04'),
(6, 'Ronald Tandazo', 75, '2023-01-19'),
(7, 'Sergio Vera', 65, '2023-01-19'),
(8, 'David Vera', 80, '2023-01-20'),
(9, 'Daniel Sanchez', 75, '2023-01-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL,
  `solicitud` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `bloque` varchar(100) NOT NULL,
  `aula` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `solicitud`, `estado`, `fecha`, `bloque`, `aula`) VALUES
(1, 'Abrir Puerta', 'Completado', '2023-02-20', 'B', '106'),
(2, 'Cerrar Puerta', 'Completado', '2023-02-20', 'A', '206'),
(3, '', '', '0000-00-00', 'b', '123'),
(4, '', '', '0000-00-00', 'B', '431'),
(5, '', '', '0000-00-00', 'B', '675'),
(6, '', '', '0000-00-00', 'Q', '098'),
(7, '', '', '0000-00-00', 'A', '109'),
(8, '', '', '0000-00-00', 'E', '768'),
(9, '', '', '0000-00-00', 'S', '435'),
(10, '', '', '0000-00-00', 'W', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte`
--

CREATE TABLE `soporte` (
  `id` int(100) NOT NULL,
  `bloque` varchar(100) NOT NULL,
  `aula` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `detalle` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(1) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`) VALUES
(1, 'Mantenimiento'),
(2, 'Cliente'),
(3, 'Laboratorista');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peso`
--
ALTER TABLE `peso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `soporte`
--
ALTER TABLE `soporte`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `peso`
--
ALTER TABLE `peso`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
