-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-07-2014 a las 05:50:23
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `smeagol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `node`
--

CREATE TABLE IF NOT EXISTS `node` (
`id` int(11) NOT NULL,
  `node_type_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `node`
--

INSERT INTO `node` (`id`, `node_type_id`, `title`, `content`, `url`, `user_id`, `created`, `modified`) VALUES
(1, 1, 'Smeagol CMS', '<p>Smeagol CMS, un demo de desarrolado en Zend Framework 3</p>\r\n', 'page/nosotros', 1, '2014-07-02 01:10:41', '2014-07-12 05:37:55'),
(2, 2, 'Smeagol primer CMS en ZF2', 'haber si funca', 'noticias/smeagol-primer-cms-en-zf2', 1, '2014-07-02 01:10:45', NULL),
(3, 2, 'El mundial Brasil 2014 esta que quema', 'ELl mundial esta super emocionante', 'noticias/mundialsuper-emocionante', 1, '2014-07-02 01:10:52', NULL),
(4, 1, 'Programación Web', '<p><strong>Programaci&oacute;n Web</strong></p>\r\n\r\n<p>Ejemplo de creaci&oacute;n de p&aacute;ginas 2</p>\r\n', 'page/programacion-web', 1, '2014-07-12 04:50:32', '2014-07-12 05:42:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `node_type`
--

CREATE TABLE IF NOT EXISTS `node_type` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `node_type`
--

INSERT INTO `node_type` (`id`, `name`) VALUES
(1, 'page'),
(2, 'notice');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `type` varchar(30) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`type`, `description`) VALUES
('admin', 'Admin User'),
('editor', 'User with rol of editor'),
('user', 'Every Authenticate User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `role_type` varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `surname`, `email`, `active`, `last_login`, `modified`, `role_type`) VALUES
(1, 'admin', 'c6865cf98b133f1f3de596a4a2894630', 'Admin', 'of Universe', 'tucorreo@gmail.com', 1, NULL, '2014-07-02 01:10:19', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_menu_node1_idx` (`node_id`);

--
-- Indices de la tabla `node`
--
ALTER TABLE `node`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_node_node_type1_idx` (`node_type_id`), ADD KEY `fk_node_user1_idx` (`user_id`);

--
-- Indices de la tabla `node_type`
--
ALTER TABLE `node_type`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`type`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_user_role_idx` (`role_type`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `node`
--
ALTER TABLE `node`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `node_type`
--
ALTER TABLE `node_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
ADD CONSTRAINT `fk_menu_node1` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `node`
--
ALTER TABLE `node`
ADD CONSTRAINT `fk_node_node_type1` FOREIGN KEY (`node_type_id`) REFERENCES `node_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_node_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_type`) REFERENCES `role` (`type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
