-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2017 at 05:39 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attic`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `first` varchar(20) NOT NULL,
  `last` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(99) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `notifications` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`first`, `last`, `email`, `password`, `usertype`, `gender`, `notifications`) VALUES
('null', 'null', 'null', 'null', 'null', 'null', 'no'),
('John', 'Doe', 'heck@heck.org', 'heck', 'Admin', 'Man', 'no'),
('Bob', 'Brown', 'heck@heck.org', 'heck', 'Admin', 'Man', 'yes');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
