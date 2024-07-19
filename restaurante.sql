-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2024 a las 18:33:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `direccion` text NOT NULL,
  `mensaje` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`id`, `nombre`, `telefono`, `email`, `direccion`, `mensaje`) VALUES
(1, 'sistema de Restaurante', '89556519', 'emarti07@gmail.com', 'escríbanos al wasap whatsapp ', 'Gracias por la compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `nombre`, `precio`, `cantidad`, `id_pedido`) VALUES
(1, 'AJI DE GALLINA', 10.00, 1, 1),
(2, 'CEBICHE', 25.00, 1, 1),
(3, 'ARROZ CON POLLO', 8.00, 3, 1),
(4, 'CEBICHE', 25.00, 1, 2),
(5, 'ARROZ CON POLLO', 8.00, 1, 2),
(6, 'AJI DE GALLINA', 10.00, 1, 3),
(7, 'CEBICHE', 25.00, 1, 4),
(8, 'ALITAS DE POLLO ', 200.00, 2, 5),
(9, 'ALITAS DE POLLO ', 200.00, 2, 6),
(10, 'FILETE DE POLLO ', 300.00, 3, 7),
(11, 'ARROZ CON POLLO', 8.00, 2, 8),
(12, 'CEBICHE', 25.00, 1, 9),
(13, 'ARROZ CON POLLO', 8.00, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `num_mesa` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `observacion` text DEFAULT NULL,
  `estado` enum('PENDIENTE','FINALIZADO') NOT NULL DEFAULT 'PENDIENTE',
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_sala`, `num_mesa`, `fecha`, `total`, `observacion`, `estado`, `id_usuario`) VALUES
(1, 1, 1, '2023-05-25 20:03:27', 59.00, '', 'FINALIZADO', 1),
(2, 3, 3, '2023-05-25 20:03:43', 33.00, '', 'FINALIZADO', 1),
(3, 3, 5, '2023-05-25 20:04:17', 10.00, '', 'FINALIZADO', 1),
(4, 2, 10, '2023-05-25 20:03:11', 25.00, '', 'PENDIENTE', 1),
(5, 1, 1, '2024-07-19 16:06:26', 400.00, 'BUEN CLIENTE ', 'FINALIZADO', 1),
(6, 1, 1, '2024-07-19 16:13:31', 400.00, 'buen cliente ', 'FINALIZADO', 4),
(7, 1, 3, '2024-07-19 16:14:01', 900.00, '', 'FINALIZADO', 4),
(8, 3, 3, '2024-07-19 16:14:42', 16.00, '', 'PENDIENTE', 4),
(9, 3, 7, '2024-07-19 16:15:11', 33.00, '', 'FINALIZADO', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`id`, `nombre`, `precio`, `imagen`, `fecha`, `estado`) VALUES
(1, 'FILETE DE POLLO ', 300.00, '', NULL, 1),
(2, 'CEBICHE', 25.00, '', NULL, 1),
(3, 'ARROZ CON POLLO', 8.00, '', NULL, 1),
(4, 'ALITAS DE POLLO ', 200.00, '', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `mesas` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`id`, `nombre`, `mesas`, `estado`) VALUES
(1, 'ENTRADA PRINCIPAL', 5, 1),
(2, 'SEGUNDO PISO', 10, 1),
(3, 'FRENTE COCINA', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_pedidos`
--

CREATE TABLE `temp_pedidos` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `rol` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `pass`, `rol`, `estado`) VALUES
(1, 'SISTEMAS FREE', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(4, 'cafe', 'cafe@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1),
(5, 'Mozo', 'mesero@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temp_pedidos`
--
ALTER TABLE `temp_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `temp_pedidos`
--
ALTER TABLE `temp_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
