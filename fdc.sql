-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2023 at 05:43 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `family_dental_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointmentid` varchar(50) NOT NULL,
  `doctorid` varchar(50) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `appointmentfees` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`appointmentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `doctorid`, `patientid`, `date`, `time`, `appointmentfees`, `status`) VALUES
('A001', 'D002', 'P001', '2022-12-12', '09:30 AM', 450, 'pending'),
('A002', 'D004', 'P002', '2022-12-12', '10:30 AM', 450, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctorid` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `doctoraddress` varchar(50) NOT NULL,
  `doctorcontactno` varchar(50) NOT NULL,
  `doctor_mailaddress` varchar(50) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `yearofexperiance` varchar(50) NOT NULL,
  `doctortype` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  PRIMARY KEY (`doctorid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `doctoraddress`, `doctorcontactno`, `doctor_mailaddress`, `qualification`, `yearofexperiance`, `doctortype`, `gender`) VALUES
('D002', 'esaiperiyan', 'navaly', '0772538606', 'esai2001@gmail.com', 'Bsc,Msc in Dental science', '3', 'Ordinary', 'Male'),
('D001', 'thomars', 'manipay', '0761164638', 'thomars@gamil.com', 'Bsc,Msc in fissure sealents', '4', 'Consultant', 'Male'),
('D003', 'abinayan jesuthasan', 'navaly', '0775937309', 'abi2001@gmail.com', 'Bsc in Mouth Cardinality,Msc', '2', 'Ordinary', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `user_type` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`,`password`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_type`, `username`, `password`) VALUES
('Manager', 'thuvaa12', '2001347Tt'),
('Receiptionist', 'abi2001', '102685Aa');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patientid` varchar(50) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `patientaddress` varchar(50) NOT NULL,
  `patientmobilenumber` int(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `registerfees` varchar(50) NOT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `patientaddress`, `patientmobilenumber`, `gender`, `registerfees`) VALUES
('P001', 'thuvarangan', 'navaly', 761164638, 'Male', '450'),
('P002', 'sangerthana', 'Jaffna', 354654, 'Female', '450'),
('P004', 'Thavasuntharam', 'manipay', 772538606, 'Male', '450'),
('P005', 'freddy', 'manipay', 772345978, 'Male', '450'),
('P006', 'nithiyananthan', 'kokuvil', 775937309, 'Male', '450');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentid` varchar(50) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `treatmentbookid` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `treatmentfees` int(50) NOT NULL,
  `roomfees` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `patientid`, `treatmentbookid`, `description`, `treatmentfees`, `roomfees`, `total`) VALUES
('M001', 'P001', 'TB001', 'Teeth cleaning', 450, '500', 950),
('M002', 'P002', 'TB002', 'Fissure sealants', 600, 'null', 1050),
('M003', 'P001', 'TB001', 'Tooth removal', 450, '450', 900);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `roomid` varchar(50) NOT NULL,
  `roomtype` varchar(50) NOT NULL,
  `staffid` varchar(50) NOT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `roomtype`, `staffid`) VALUES
('R001', 'Scan', 'S002'),
('R002', 'Surgery', 'S003');

-- --------------------------------------------------------

--
-- Table structure for table `room_book`
--

DROP TABLE IF EXISTS `room_book`;
CREATE TABLE IF NOT EXISTS `room_book` (
  `roombookid` varchar(50) NOT NULL,
  `roomid` varchar(50) NOT NULL,
  `doctorid` varchar(50) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`roombookid`),
  KEY `doctorid` (`doctorid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_book`
--

INSERT INTO `room_book` (`roombookid`, `roomid`, `doctorid`, `patientid`, `date`, `time`, `status`) VALUES
('RB001', 'R001', 'D002', 'P001', '2022-11-08', '10:11 AM', 'pending'),
('RB002', 'R002', 'D003', 'P004', '2022-11-10', '10:29 PM', 'done'),
('RB003', 'R001', 'D002', 'P001', '2022-12-08', '11:34 AM', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffid` varchar(50) NOT NULL,
  `staffname` varchar(50) NOT NULL,
  `staffaddress` varchar(50) NOT NULL,
  `staffnic` varchar(50) NOT NULL,
  `contactno` varchar(50) NOT NULL,
  `stafftype` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  PRIMARY KEY (`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffid`, `staffname`, `staffaddress`, `staffnic`, `contactno`, `stafftype`, `gender`) VALUES
('S001', 'thomars thuvaa', 'navaly', '200134702209', '0761164638', 'Nurse', 'Male'),
('S002', 'kopikan thavam', 'suthumalai', '200123145592', '0761164638', 'Manager', 'Male'),
('S004', 'jesuthasan abicayan', 'navaly', '200134702209', '0761164638', 'Nurse', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `treatmentid` varchar(50) NOT NULL,
  `treatmenttype` varchar(50) NOT NULL,
  `roomtype` varchar(50) NOT NULL,
  PRIMARY KEY (`treatmentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `roomtype`) VALUES
('T001', 'Tooth removal', 'Scan'),
('T002', 'Fissure sealants', 'Surgery'),
('T003', 'Dental fillings', 'Surgery');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_book`
--

DROP TABLE IF EXISTS `treatment_book`;
CREATE TABLE IF NOT EXISTS `treatment_book` (
  `treatmentbookid` varchar(50) NOT NULL,
  `treatmentid` varchar(50) NOT NULL,
  `patientid` varchar(50) NOT NULL,
  `doctorid` varchar(50) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `end_date` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`treatmentbookid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_book`
--

INSERT INTO `treatment_book` (`treatmentbookid`, `treatmentid`, `patientid`, `doctorid`, `start_date`, `end_date`, `status`) VALUES
('TB001', 'T001', 'P001', 'D003', 'Dec 2, 2022', 'Dec 5, 2022', 'pending'),
('TB002', 'T002', 'P002', 'D002', 'Dec 2, 2022', 'Dec 16, 2022', 'pending');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
