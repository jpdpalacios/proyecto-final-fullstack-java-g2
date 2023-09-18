-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2023 a las 02:45:03
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
(1, 'Juan', 'Manolo', 'juan.manolo@example.com', '30647835'),
(2, 'Laura', 'Gómez', 'laura@example.com', '98765432'),
(3, 'Carlos', 'Martínez', 'carlos@example.com', '87654321'),
(4, 'Ana', 'Rodríguez', 'ana@example.com', '76543210'),
(5, 'Jeremías', 'Palacios', 'jerepala@gmail.com', '45842286'),
(6, 'Arian', 'Peralta', 'elfacherito@gg.com', '12345678'),
(7, 'pepe', 'rocconi', 'chupete@gmail.xom', '56234432'),
(8, 'peperito', 'rocconini', 'chupetetete@gmail.xom', '87654321'),
(9, 'Jeremías Pablo David', 'Palacios', 'jpdpalacios.dev@gmail.com', '45842286'),
(10, 'Jeremías Pablo David', 'Palacios', 'jpdpalacios.dev@gmail.com', '56234432'),
(11, 'Jeremías Pablo David', 'Palacios', 'jpdpalacios.dev@gmail.com', '56234432'),
(12, 'Jeremías Pablo David', 'Palacios', 'jpdpalacios.dev@gmail.com', '56234432'),
(13, 'maga', 'apellidodemaga', 'magarhcp@gmail.com', '56234432'),
(14, 'guiller', 'palumbo', 'guillerpalumbo@example.com', '12345678');

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
(1, 'Pedido de Juan Manolo', 'Descripción del pedido ficticio', 'SIN_INICIAR', '2023-09-20', NULL, 1, 'NOTEBOOK', 'Serial123', 'ALTA', 1, 'Comentarios adicionales', 500.00),
(2, 'Reparación de PC de escritorio', 'Actualización y mantenimiento', 'INICIADO', '2023-09-26', NULL, 2, 'ALTAVOZ_BLUETOOTH', 'Serial789', 'ALTA', 2, 'Reparación urgente', 15000.00),
(3, 'Reparación de Consola de Juegos', 'Problemas de hardware', 'TERMINADO', '2023-09-27', NULL, 3, 'CONSOLA', 'Serial101', 'ALTA', 3, 'Reparación completa', 18000.00),
(4, 'Reparación de Joystick', 'Botones no funcionan', 'ENTREGADO', '2023-09-28', '2023-10-15', 4, 'JOYSTICK', 'Serial202', 'MEDIA', 3, 'Reemplazo de piezas', 8000.00),
(5, 'pepe', 'sdfsfsdf', 'SIN_INICIAR', '2023-08-31', '2023-09-20', 4, 'JOYSTICK', 'sfsdfsdf324234', 'MEDIA', 1, 'werwer', 500.00),
(6, 'noseaaa', 'apaaaa', 'SIN_INICIAR', '2023-09-28', NULL, 6, 'CONSOLA', 'sandwichedemilanesa52', 'MEDIA', 1, 'aeraerereraera', 500.00);

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
(2, 'Juancito', 'juanfacherito', 'usuario_normal', NULL, 1),
(3, 'laura', 'laura123', 'usuario_normal', NULL, 2),
(4, 'carlos', 'carlos123', 'usuario_normal', NULL, 3),
(5, 'ana', 'ana123', 'usuario_normal', NULL, 4),
(6, 'Daniel', 'password123', 'usuario_administrador', 2, NULL),
(7, 'Augusto', 'admin456', 'usuario_administrador', 3, NULL),
(8, 'Jeremías Pablo David', 'password', 'usuario_normal', NULL, NULL),
(9, 'Jeremías Pablo David', '1234567890', 'usuario_normal', NULL, NULL),
(10, 'maga', '12345678', 'usuario_normal', NULL, NULL),
(11, 'guiller', '123', 'usuario_normal', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `trabajo_a_realizar`
--
ALTER TABLE `trabajo_a_realizar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `trabajo_a_realizar`
--
ALTER TABLE `trabajo_a_realizar`
  ADD CONSTRAINT `trabajo_a_realizar_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `trabajo_a_realizar_ibfk_2` FOREIGN KEY (`asignado_a`) REFERENCES `admin` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FKb8tal4hy6y2wuiivwypkpf53k` FOREIGN KEY (`admin_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FKofhxh5wulv64vkbxku5tsny2j` FOREIGN KEY (`cliente_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
