-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2023 a las 22:18:39
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestor_grupo2_polo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `nombre`) VALUES
(1, 'Matias'),
(2, 'Daniel'),
(3, 'Augusto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dni` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `email`, `dni`) VALUES
(1, 'Jeremías Pablo David', 'Palacios', 'jpdpalacios.dev@gmail.com', '45842286'),
(2, 'Matias Gabriel', 'Patzer', 'matipatzer@gmail.com', '56234432'),
(3, 'Maga', 'Lila', 'magalila@gmail.com', '27809453'),
(4, 'Tatiana', 'Krayeski', 'tatifacha2@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo_a_realizar`
--

CREATE TABLE `trabajo_a_realizar` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('ENTREGADO','INICIADO','SIN_INICIAR','TERMINADO') DEFAULT NULL,
  `fecha_recibo` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `tipo_equipo` enum('ALTAVOZ','ALTAVOZ_BLUETOOTH','CONSOLA','JOYSTICK','NOTEBOOK','PC_DE_ESCRITORIO') DEFAULT NULL,
  `modelo_equipo` varchar(255) DEFAULT NULL,
  `prioridad` enum('ALTA','BAJA','MEDIA') DEFAULT NULL,
  `asignado_a` int(11) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `ganancia` decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajo_a_realizar`
--

INSERT INTO `trabajo_a_realizar` (`id`, `nombre`, `descripcion`, `estado`, `fecha_recibo`, `fecha_entrega`, `cliente_id`, `tipo_equipo`, `modelo_equipo`, `prioridad`, `asignado_a`, `comentarios`, `ganancia`) VALUES
(2, 'Reparación PS5', 'No anda nose', 'INICIADO', '2023-09-18', NULL, 1, 'CONSOLA', 'sandwichedemilanesa52', 'MEDIA', 1, 'sin comentarios', 5320.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` enum('usuario_administrador','usuario_normal') NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `contraseña`, `rol`, `admin_id`, `cliente_id`) VALUES
(1, 'Matias', 'admin123', 'usuario_administrador', 1, NULL),
(6, 'Daniel', 'password123', 'usuario_administrador', 2, NULL),
(7, 'Augusto', 'admin456', 'usuario_administrador', 3, NULL),
(12, 'Jeremías Pablo David', '123', 'usuario_normal', NULL, NULL),
(13, 'Matias', '123', 'usuario_normal', NULL, NULL),
(14, 'Maga', '123', 'usuario_normal', NULL, NULL),
(15, 'Tatiana', '123', 'usuario_normal', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajo_a_realizar`
--
ALTER TABLE `trabajo_a_realizar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `asignado_a` (`asignado_a`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `FKofhxh5wulv64vkbxku5tsny2j` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `trabajo_a_realizar`
--
ALTER TABLE `trabajo_a_realizar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `trabajo_a_realizar`
--
ALTER TABLE `trabajo_a_realizar`
  ADD CONSTRAINT `trabajo_a_realizar_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `trabajo_a_realizar_ibfk_2` FOREIGN KEY (`asignado_a`) REFERENCES `admin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
