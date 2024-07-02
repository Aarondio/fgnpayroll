-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 22, 2022 at 02:19 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fgnpayroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `allawance`
--

DROP TABLE IF EXISTS `allawance`;
CREATE TABLE IF NOT EXISTS `allawance` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allawance`
--

INSERT INTO `allawance` (`id`, `name`, `category`, `amount`, `level`) VALUES
(2, 'Basic Salary', 'Monthly remuneration', 1000, 13),
(3, 'Welfare', 'Monthly remuneration', 10000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `approval_list`
--

DROP TABLE IF EXISTS `approval_list`;
CREATE TABLE IF NOT EXISTS `approval_list` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `emp_id` int(255) NOT NULL,
  `responsibility` varchar(1000) NOT NULL,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approval_list`
--

INSERT INTO `approval_list` (`id`, `emp_id`, `responsibility`, `level`) VALUES
(2, 6, 'Balance account', 10);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `assetID` varchar(255) NOT NULL,
  `purchase_date` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `sn` varchar(11) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `name`, `assetID`, `purchase_date`, `amount`, `condition`, `manufacturer`, `sn`, `supplier`, `user`, `status`) VALUES
(3, 'Printers', 'AST-2359-FGN', '2021-12-31', '200000', 'New', 'Hp', '123456', 'Azure', 'FGN1023', 'Approved'),
(4, 'Computer', 'AST-1238-FGN', '2012-12-11', '1000000', 'New', 'Motorola', '1232324', 'Makazu and sons', 'FGN3821', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) NOT NULL,
  `time_in` varchar(255) NOT NULL,
  `time_out` varchar(255) NOT NULL,
  `time_spend` varchar(255) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL,
  `month` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `emp_id`, `time_in`, `time_out`, `time_spend`, `date`, `month`) VALUES
(1, '7', '11:09:19', 'NULL', '0', '2022-03-02 22:09:19', 3),
(2, '7', '18:40:47', 'NULL', '0', '2022-03-04 05:40:47', 3),
(3, '7', '06:51:58', 'NULL', '0', '2022-03-08 17:51:58', 3),
(4, '7', '02:57:01', 'NULL', '0', '2022-03-11 13:57:01', 3),
(5, '6', '14:33:50', 'NULL', '0', '2022-03-23 01:33:50', 3),
(6, '7', '09:27:13', 'NULL', '0', '2022-03-23 20:27:13', 3),
(7, '6', '15:57:09', '2022-03-24 17:31:59', '1 hour', '2022-03-24 22:57:09', 3),
(8, '7', '17:34:41', '2022-03-24 18:14:18', '39 minutes', '2022-03-25 00:34:41', 3),
(9, '6', '13:13:15', '2022-03-27 13:22:59', '9 minutes', '2022-03-27 20:13:15', 3),
(10, '6', '02:44:44', '2022-03-28 14:45:07', '12 hours', '2022-03-28 09:44:44', 3),
(11, '6', '04:11:21', '2022-04-02 11:11:38', '7 hours', '2022-04-02 11:11:21', 4),
(12, '6', '14:54:41', 'NULL', '0', '2022-04-19 21:54:41', 4),
(13, '6', '02:27:12', 'NULL', '0', '2022-04-20 09:27:12', 4);

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
CREATE TABLE IF NOT EXISTS `deductions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) NOT NULL,
  `deduction_id` int(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `month` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `emp_id`, `deduction_id`, `amount`, `month`) VALUES
(1, '6', 1, '8000', 3),
(2, '8', 1, '1000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `deduction_list`
--

DROP TABLE IF EXISTS `deduction_list`;
CREATE TABLE IF NOT EXISTS `deduction_list` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `deduction_name` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deduction_list`
--

INSERT INTO `deduction_list` (`id`, `deduction_name`, `date`, `amount`) VALUES
(1, 'Late task submission', '2022-03-23 09:15:59', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(43, 'Administrative Department'),
(36, 'IT Department'),
(41, 'Finance Department'),
(42, 'Human Resource');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE IF NOT EXISTS `designation` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  `emp_id` varchar(255) NOT NULL,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `designation`, `emp_id`, `level`) VALUES
(3, 'Chief Account Officer', '8', 13),
(4, 'Managing Director', '6', 13);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `empID` varchar(255) NOT NULL,
  `joiningDate` varchar(255) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `department` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `isAdmin` int(6) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `account` int(15) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `empID`, `joiningDate`, `phone`, `department`, `address`, `Gender`, `dob`, `isAdmin`, `password`, `account`, `bank`, `picture`) VALUES
(3, 'Amina Adamu', 'amina@gmail.com', 'FGN3821', '20-12-2020', '+2349101013370', 'Hr Department', '', '', '', 1, '123456', 0, '', NULL),
(6, 'Aaron Dikko Iliya', 'stud@gmail.com', 'FGN7147', '11/01/2022', '+2348101013370', 'IT department', '', '', '', 1, 'e10adc3949ba59abbe56e057f20f883e', 0, '', '74023-ballerinas-gad9110500_1920.jpg'),
(7, 'James Bulus', 'james@gmail.com', 'FGN7120', '13/01/2022', '09017172598', 'IT department', '', '', '', 0, 'e10adc3949ba59abbe56e057f20f883e', 0, '', NULL),
(8, 'Nyen Ogar', 'nyen@gmail.com', 'FGN8326', '17/01/2022', '+2348101013370', 'Finance Department', '', '', '', 0, 'e10adc3949ba59abbe56e057f20f883e', 0, '', NULL),
(9, 'Yaro Almas Mairiga', 'yaro@gmail.com', 'FGN8260', '24/03/2022', '09017172598', 'IT Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 14388261, 'stanbic', NULL),
(10, 'Aminu Sambo', 'aminu@gmail.com', 'FGN2361', '24/03/2022', '08101013370', 'Human Resource', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 353454654, 'citibank', NULL),
(11, 'Victor Jasra', 'victor@gmail.com', 'FGN6518', '24/03/2022', '09232333', 'Human Resource', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 232343435, 'ecobank', NULL),
(12, 'Domaro Ali Dogo', 'domaro@gmail.com', 'FGN7979', '24/03/2022', '09017172598', 'Administrative Department', NULL, NULL, NULL, 1, 'e10adc3949ba59abbe56e057f20f883e', 543545465, 'ecobank', NULL),
(13, 'jamil Jasham', 'jamil@gmail.com', 'FGN3152', '24/03/2022', '+2348101013370', 'Administrative Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 1323446667, 'wema', NULL),
(14, 'Lukuman Mano', 'lukuman@gmail.com', 'FGN925', '24/03/2022', '08101013370', 'Finance Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 132433545, 'union', NULL),
(15, 'Dayo Ukan', 'dayo@gmail.com', 'FGN632', '24/03/2022', '09017172598', 'Finance Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 23273732, 'heritage', NULL),
(16, 'Aliyu Mohammed', 'aliyu@gmail.com', 'FGN7382', '24/03/2022', '+2348101013370', 'Administrative Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 9887655, 'gtb', NULL),
(17, 'Hassan Maigari', 'maigari@gmail.com', 'FGN6669', '27/03/2022', '08101013370', 'Finance Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 139343293, 'union', NULL),
(18, 'Kamal Adams', 'adams@gmail.com', 'FGN5188', '21/04/2022', '09012345678', 'Finance Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 92727321, 'diamond', NULL),
(19, 'Maiwondo Kanja', 'kanja@gmail.com', 'FGN2663', '23/04/2022', '09012345678', 'IT Department', NULL, NULL, NULL, 0, 'e10adc3949ba59abbe56e057f20f883e', 94950321, 'diamond', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) NOT NULL,
  `no_of_days` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL,
  `leave_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `emp_id`, `no_of_days`, `status`, `reason`, `leave_type`) VALUES
(1, '', '', '0', '', ''),
(2, '', '', '0', '', ''),
(3, '', '', '0', '', ''),
(4, '8', '20', '0', '15', 'Medical Leave');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
CREATE TABLE IF NOT EXISTS `level` (
  `sn` int(255) NOT NULL AUTO_INCREMENT,
  `level` int(255) NOT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`sn`, `level`) VALUES
(1, 7),
(2, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12),
(7, 13),
(8, 14),
(9, 15),
(10, 16);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
CREATE TABLE IF NOT EXISTS `salaries` (
  `sn` int(255) NOT NULL AUTO_INCREMENT,
  `level` int(255) NOT NULL,
  `salary` int(255) NOT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`sn`, `level`, `salary`) VALUES
(1, 7, 50000),
(2, 8, 60000),
(3, 9, 70000),
(4, 10, 90000),
(5, 11, 120000),
(6, 12, 170000),
(7, 13, 200000),
(8, 14, 250000),
(9, 15, 350000),
(10, 16, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `empID` varchar(255) NOT NULL,
  `level` int(6) NOT NULL,
  `basic` int(255) NOT NULL,
  `hra` int(255) NOT NULL,
  `loan` int(255) NOT NULL,
  `salary` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `empID`, `level`, `basic`, `hra`, `loan`, `salary`) VALUES
(3, 'FGN3821', 16, 2000000, 200000, 0, 400000),
(6, 'FGN7147', 12, 50000, 50000, 0, 70000),
(14, 'FGN925', 13, 102000, 68000, 20000, 170000),
(17, 'FGN2361', 12, 102000, 68000, 20000, 170000);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `assigned_by` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `task_title` varchar(255) NOT NULL,
  `complete_status` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `assigned_by`, `assigned_to`, `duration`, `task_title`, `complete_status`, `date`) VALUES
(1, '6', '7', '10', 'Sales and recording', 0, '2022-02-16 11:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
