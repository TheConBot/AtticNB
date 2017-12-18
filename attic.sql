-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2017 at 11:03 AM
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
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `House ID` int(11) NOT NULL,
  `State` varchar(2) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Zip Code` int(5) NOT NULL,
  `Street Name` varchar(30) NOT NULL,
  `Street Suffix` enum('Road','Street','Way','Avenue','Drive','Lane') NOT NULL,
  `House Number` int(4) NOT NULL,
  `Garbage Day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`House ID`, `State`, `City`, `Zip Code`, `Street Name`, `Street Suffix`, `House Number`, `Garbage Day`) VALUES
(1, 'MA', 'Fitchburg', 1420, 'Blossom', 'Street', 315, 'Friday'),
(2, 'RI', 'Providence', 19220, 'Elm', 'Street', 33, 'Monday'),
(3, 'MA', 'Worcester', 24920, 'Brown', 'Road', 99, 'Monday'),
(4, 'VA', 'Burbank', 22655, 'Merry', 'Lane', 18, 'Tuesday'),
(5, 'FL', 'Miami', 21078, 'Rocker', 'Avenue', 111, 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `doors`
--

CREATE TABLE `doors` (
  `Door ID` int(11) NOT NULL,
  `Room ID` int(11) NOT NULL,
  `Door Type` enum('Front Door','Back Door','Interior Door') NOT NULL,
  `Door Height` int(11) NOT NULL,
  `Door Width` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doors`
--

INSERT INTO `doors` (`Door ID`, `Room ID`, `Door Type`, `Door Height`, `Door Width`) VALUES
(1, 1, 'Front Door', 72, 32),
(2, 1, 'Back Door', 68, 24);

-- --------------------------------------------------------

--
-- Table structure for table `keycodes`
--

CREATE TABLE `keycodes` (
  `Door ID` int(11) NOT NULL,
  `Keycode` int(11) DEFAULT NULL,
  `Has Key` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keycodes`
--

INSERT INTO `keycodes` (`Door ID`, `Keycode`, `Has Key`) VALUES
(1, 2699, 1),
(2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lights`
--

CREATE TABLE `lights` (
  `Room ID` int(11) NOT NULL,
  `Serial Number` bigint(20) NOT NULL,
  `Bulbs` int(11) NOT NULL,
  `Has Fan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `House ID` int(11) NOT NULL,
  `Nickname` varchar(30) NOT NULL,
  `Floors` int(11) NOT NULL,
  `Has Driveway` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`House ID`, `Nickname`, `Floors`, `Has Driveway`) VALUES
(1, 'Blossom House', 2, 0),
(2, 'The Loft', 3, 1),
(3, 'Congress', 3, 1),
(4, 'The Rose', 1, 1),
(5, 'Daytona Beach', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `House ID` int(11) NOT NULL,
  `Room ID` int(11) NOT NULL,
  `Room Type` enum('Bedroom','Kitchen','Bathroom','Living Room','Dining Room','Hallway') NOT NULL,
  `Floor` int(11) NOT NULL,
  `Smoke Alarms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`House ID`, `Room ID`, `Room Type`, `Floor`, `Smoke Alarms`) VALUES
(1, 1, 'Living Room', 1, 1),
(1, 2, 'Kitchen', 1, 0),
(1, 3, 'Dining Room', 1, 0),
(1, 4, 'Bathroom', 1, 0),
(1, 5, 'Bedroom', 2, 0),
(1, 6, 'Bedroom', 2, 0),
(1, 7, 'Bedroom', 2, 0),
(1, 8, 'Bathroom', 2, 0),
(1, 9, 'Hallway', 2, 1);

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
('Bob', 'Brown', 'heck@heck.org', 'heck', 'Admin', 'Man', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `windows`
--

CREATE TABLE `windows` (
  `Room ID` int(11) NOT NULL,
  `Window Height` int(11) NOT NULL,
  `Window Width` int(11) NOT NULL,
  `Has Blinds` tinyint(1) NOT NULL,
  `Has Alarm` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD UNIQUE KEY `house_id` (`House ID`) USING BTREE;

--
-- Indexes for table `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`Door ID`),
  ADD KEY `room_id` (`Room ID`);

--
-- Indexes for table `keycodes`
--
ALTER TABLE `keycodes`
  ADD KEY `door_id` (`Door ID`);

--
-- Indexes for table `lights`
--
ALTER TABLE `lights`
  ADD KEY `room_id` (`Room ID`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`House ID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Room ID`),
  ADD KEY `house_id` (`House ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `windows`
--
ALTER TABLE `windows`
  ADD KEY `room_id` (`Room ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doors`
--
ALTER TABLE `doors`
  MODIFY `Door ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `House ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `Room ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`House ID`) REFERENCES `properties` (`House ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doors`
--
ALTER TABLE `doors`
  ADD CONSTRAINT `doors_ibfk_1` FOREIGN KEY (`Room ID`) REFERENCES `rooms` (`Room ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keycodes`
--
ALTER TABLE `keycodes`
  ADD CONSTRAINT `keycodes_ibfk_1` FOREIGN KEY (`Door ID`) REFERENCES `doors` (`Door ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lights`
--
ALTER TABLE `lights`
  ADD CONSTRAINT `lights_ibfk_1` FOREIGN KEY (`Room ID`) REFERENCES `rooms` (`Room ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`House ID`) REFERENCES `properties` (`House ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `windows`
--
ALTER TABLE `windows`
  ADD CONSTRAINT `windows_ibfk_1` FOREIGN KEY (`Room ID`) REFERENCES `rooms` (`Room ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
