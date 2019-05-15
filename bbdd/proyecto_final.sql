-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2019 a las 10:45:52
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_linea` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `Nombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Telefono` int(12) NOT NULL,
  `Direccion` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tarjetaCredito` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `id_linea` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_Marca` int(11) NOT NULL,
  `Nombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_Marca`, `Nombre`) VALUES
(1, 'Adidas'),
(2, 'Nike'),
(3, 'Jordan'),
(4, 'Champion'),
(5, 'Yeezy'),
(6, 'Puma'),
(7, 'Rebook');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `Nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `precio` double DEFAULT NULL,
  `id_marca` int(11) NOT NULL,
  `imagen` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `Nombre`, `precio`, `id_marca`, `imagen`) VALUES
(1, 'Jordan 1s', 110, 3, 'https://stockx.imgix.net/Air-Jordan-1-Retro-High-Shadow-2018-1.jpg?fit=fill&bg=FFFFFF&w=700&h=500&au'),
(2, 'Superstar ', 80, 1, 'https://assets.adidas.com/images/w_600,f_auto,q_auto/d285610e30664900b857a7fa00ed0201_9366/Zapatilla'),
(3, 'Cortes ', 80, 2, 'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/zsdadsgdquownvmcmt3q/classic-cortez-zapatill'),
(4, 'Eighteen classic', 110, 4, 'https://imagescdn.simons.ca/images/14699/195/10/A1_2.jpg?__=3'),
(5, 'yeezy 700', 220, 5, 'http://lojadobigode.com.br/wp-content/uploads/2019/01/yeezy-700.jpg'),
(6, 'Suede classic', 80, 6, 'https://throwback-sneakers.com/15679-large_default/puma-suede-classic-black.jpg'),
(7, 'Classic Leather', 80, 7, 'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201812/07/00117731101667____11__640x640.jpg'),
(8, 'Jordan 5s', 180, 3, 'https://basketcountry.es/1905-large_default/air-jordan-5-retro.jpg'),
(9, 'UltraBoost 4.0', 180, 1, 'https://chemasport.es/13727-thickbox_default/zapatillas-adidas-ultraboost-blanco.jpg'),
(10, 'Vapormax Flyknit', 180, 2, 'https://image.tfgmedia.co.za/image/1/process/486x486?source=http://cdn.tfgmedia.co.za/06/ProductImages/31702964.jpg'),
(11, 'Rally pro', 80, 4, 'https://i1.adis.ws/i/hibbett/M0388_0201_right?w=580&h=580&fmt=jpg&bg=rgb(255,255,255)&img404=404&v=0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_linea` (`id_linea`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`id_linea`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_Marca`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_filtros` (`id_marca`),
  ADD KEY `Marca` (`id_marca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id_linea` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_Marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_linea`) REFERENCES `linea` (`id_linea`);

--
-- Filtros para la tabla `linea`
--
ALTER TABLE `linea`
  ADD CONSTRAINT `linea_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_Marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;