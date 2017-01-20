-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 20, 2017 at 12:30 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gitapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE IF NOT EXISTS `orderitems` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `itemname` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`itemid`, `orderid`, `itemname`, `qty`, `price`) VALUES
(1, NULL, 'Product1', 50, 5),
(2, NULL, 'Product1', 60, 10),
(3, NULL, 'Product1', 50, 5),
(4, NULL, 'Product1', 60, 10),
(5, NULL, 'Product1', 50, 5),
(6, NULL, 'Product1', 50, 5),
(7, 3, 'Product1', 50, 5),
(8, 3, 'Product1', 60, 10),
(9, 4, 'Product1', 50, 5),
(10, 4, 'Product1', 60, 10),
(11, 5, 'Product1', 50, 5),
(12, 5, 'Product1', 60, 10),
(13, 6, 'Product4', 80, 5),
(14, 6, 'Product8', 20, 10),
(15, 7, 'Product4', 80, 5),
(16, 7, 'Product8', 20, 10),
(17, 8, 'Product4', 80, 5),
(18, 8, 'Product8', 20, 10),
(19, 9, 'Product4', 80, 5),
(20, 9, 'Product8', 20, 10),
(21, 10, '', 0, 0),
(22, 11, 'Product4', 80, 5),
(23, 11, 'Product8', 20, 10),
(24, 12, 'Product4', 80, 5),
(25, 12, 'Product8', 20, 10),
(26, 13, 'Product4', 80, 5),
(27, 13, 'Product8', 20, 10),
(28, 14, '', 0, 0),
(29, 15, 'Test 4', 250, 5),
(30, 15, 'Test5', 50, 2),
(31, 16, 'Test 4', 250, 5),
(32, 16, 'Test5', 50, 2),
(33, 17, 'Test 4', 250, 5),
(34, 17, 'Test5', 50, 2),
(35, 18, 'Product4', 80, 5),
(36, 18, 'Product8', 20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` datetime NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `user` varchar(11) DEFAULT NULL,
  `orderdateid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderdate`, `total`, `user`, `orderdateid`) VALUES
(3, '2017-01-13 01:03:00', '850', '', '20170113010300'),
(4, '2017-01-16 06:25:01', '850', '', '20170116062501'),
(5, '2017-01-16 06:25:55', '850', '', '20170116062555'),
(6, '2017-01-16 06:27:21', '600', '', '20170116062721'),
(7, '2017-01-16 06:38:11', '600', '', '20170116063811'),
(8, '2017-01-16 06:39:20', '600', '', '20170116063920'),
(9, '2017-01-16 06:40:12', '600', '', '20170116064012'),
(10, '2017-01-16 06:40:54', '0', '', '20170116064054'),
(11, '2017-01-16 06:41:14', '600', '', '20170116064114'),
(12, '2017-01-16 06:42:33', '600', '', '20170116064233'),
(13, '2017-01-16 06:43:22', '600', '', '20170116064322'),
(14, '2017-01-16 06:47:50', '0', '', '20170116064750'),
(15, '2017-01-16 06:48:14', '1350', '', '20170116064814'),
(16, '2017-01-16 06:50:23', '1350', '', '20170116065023'),
(17, '2017-01-16 06:51:42', '1350', '', '20170116065142'),
(18, '2017-01-16 06:56:32', '600', '', '20170116065632');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
