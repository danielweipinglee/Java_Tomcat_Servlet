-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2017 at 06:48 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CS3365`
--

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `PublisherName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`BookID`, `Title`, `PublisherName`) VALUES
(1, 'The Three Musketeers', 'Dorrance Publishing Co. Inc'),
(2, 'Identity and Violence:The illusion of Destiny', 'Hachette Book Group'),
(3, 'The Argumentative Indian', 'HarperCollins Publishers'),
(4, 'Development as Freedom', 'Macmillan Publishers'),
(5, 'River of Smoke', 'Hachette Book Group');

-- --------------------------------------------------------

--
-- Table structure for table `Book_Authors`
--

CREATE TABLE `Book_Authors` (
  `AuthorID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `AuthorName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Book_Authors`
--

INSERT INTO `Book_Authors` (`AuthorID`, `BookID`, `AuthorName`) VALUES
(1, 1, 'Alexander Dumas'),
(2, 2, 'Amartya Sen'),
(3, 3, 'Amartya Sen'),
(4, 4, 'Amartya Sen'),
(5, 5, 'Amitav Ghose'),
(6, 2, 'Alexander Dumas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `Book_Authors`
--
ALTER TABLE `Book_Authors`
  ADD PRIMARY KEY (`AuthorID`),
  ADD KEY `BookID` (`BookID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Book_Authors`
--
ALTER TABLE `Book_Authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
