-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 �?06 �?07 �?08:27
-- 服务器版本: 5.5.53
-- PHP 版本: 5.6.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `arukas`
--

-- --------------------------------------------------------

--
-- 表的结构 `containers`
--

CREATE TABLE IF NOT EXISTS `containers` (
  `app_id` varchar(64) NOT NULL,
  `arukas_domain` varchar(32) DEFAULT NULL,
  `status_text` varchar(16) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `ss_port` int(5) unsigned DEFAULT NULL,
  `kcp_port` int(5) unsigned NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
