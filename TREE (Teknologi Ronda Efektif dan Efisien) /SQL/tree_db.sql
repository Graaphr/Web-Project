-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2026 at 01:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tree_db`
--
CREATE DATABASE IF NOT EXISTS `tree_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tree_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(10) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `ward` varchar(20) NOT NULL,
  `lastEmailChange` datetime NOT NULL DEFAULT current_timestamp(),
  `lastPasswordChange` datetime NOT NULL DEFAULT current_timestamp(),
  `lastPhoneChange` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'Admin',
  `resetToken` varchar(255) DEFAULT NULL,
  `resetExpire` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `nik`, `name`, `email`, `phone`, `password`, `ward`, `lastEmailChange`, `lastPasswordChange`, `lastPhoneChange`, `status`, `resetToken`, `resetExpire`) VALUES
(1, '2171032502070007', 'Terra Faqih Satria Madjid', 'TrueBadLuck146@gmail.com', '082387593452', '2171032502070007', 'Sekupang', '2026-01-04 06:59:28', '2026-01-04 06:59:28', '2026-01-04 06:59:28', 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `attendanceId` int(10) NOT NULL,
  `scheduleId` int(10) NOT NULL,
  `routeId` int(10) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `attendanceStatus` varchar(11) NOT NULL DEFAULT 'Absen'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `envistatus`
--

CREATE TABLE `envistatus` (
  `statusId` int(10) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'AMAN',
  `date` datetime NOT NULL,
  `rw` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inhabitants`
--

CREATE TABLE `inhabitants` (
  `inhabitantId` int(10) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `name` text NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dateBirth` date NOT NULL,
  `password` varchar(1000) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `status` text NOT NULL,
  `rw` int(2) NOT NULL,
  `ward` varchar(20) NOT NULL,
  `lastPasswordChange` datetime NOT NULL DEFAULT current_timestamp(),
  `lastEmailChange` datetime NOT NULL DEFAULT current_timestamp(),
  `lastPhoneChange` datetime NOT NULL DEFAULT current_timestamp(),
  `resetToken` varchar(255) DEFAULT NULL,
  `resetExpire` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `radius`
--

CREATE TABLE `radius` (
  `id` int(11) NOT NULL,
  `rw` int(10) NOT NULL,
  `latitude` float NOT NULL DEFAULT 1,
  `longitude` float NOT NULL DEFAULT 1,
  `radius` int(11) NOT NULL DEFAULT 500,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `reportId` int(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `description` text NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `inhabitantId` int(10) NOT NULL,
  `rw` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `rw` int(2) NOT NULL,
  `minAge` int(2) NOT NULL DEFAULT 18,
  `maxAge` int(2) NOT NULL DEFAULT 50,
  `timeStart` time NOT NULL DEFAULT '22:00:00',
  `timeEnd` time NOT NULL DEFAULT '04:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `routeId` int(10) NOT NULL,
  `routeName` varchar(40) NOT NULL,
  `rw` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleId` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `route` varchar(50) NOT NULL,
  `scheduleStatus` varchar(20) NOT NULL DEFAULT 'Belum',
  `rw` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `submissionId` int(10) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `type` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `submissionStatus` varchar(20) NOT NULL DEFAULT 'Pending',
  `rw` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`),
  ADD UNIQUE KEY `ward` (`ward`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`attendanceId`),
  ADD KEY `NIK` (`nik`),
  ADD KEY `scheduleId` (`scheduleId`),
  ADD KEY `routeId` (`routeId`);

--
-- Indexes for table `envistatus`
--
ALTER TABLE `envistatus`
  ADD PRIMARY KEY (`statusId`),
  ADD KEY `idx_rw` (`rw`);

--
-- Indexes for table `inhabitants`
--
ALTER TABLE `inhabitants`
  ADD PRIMARY KEY (`inhabitantId`),
  ADD UNIQUE KEY `NIK` (`nik`),
  ADD KEY `RW` (`rw`),
  ADD KEY `ward` (`ward`);

--
-- Indexes for table `radius`
--
ALTER TABLE `radius`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_rw` (`rw`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`reportId`),
  ADD KEY `rw` (`rw`),
  ADD KEY `fk_reports_inhabitant` (`inhabitantId`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD UNIQUE KEY `rw` (`rw`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`routeId`),
  ADD KEY `rw` (`rw`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleId`),
  ADD KEY `rw` (`rw`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`submissionId`),
  ADD KEY `NIK` (`nik`),
  ADD KEY `rw` (`rw`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `attendanceId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `envistatus`
--
ALTER TABLE `envistatus`
  MODIFY `statusId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inhabitants`
--
ALTER TABLE `inhabitants`
  MODIFY `inhabitantId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radius`
--
ALTER TABLE `radius`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `reportId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `routeId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `submissionId` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `inhabitants` (`nik`),
  ADD CONSTRAINT `attendances_ibfk_3` FOREIGN KEY (`scheduleId`) REFERENCES `schedule` (`scheduleId`),
  ADD CONSTRAINT `attendances_ibfk_4` FOREIGN KEY (`routeId`) REFERENCES `route` (`routeId`);

--
-- Constraints for table `inhabitants`
--
ALTER TABLE `inhabitants`
  ADD CONSTRAINT `inhabitants_ibfk_1` FOREIGN KEY (`rw`) REFERENCES `envistatus` (`rw`),
  ADD CONSTRAINT `inhabitants_ibfk_2` FOREIGN KEY (`ward`) REFERENCES `admin` (`ward`);

--
-- Constraints for table `radius`
--
ALTER TABLE `radius`
  ADD CONSTRAINT `radius_ibfk_1` FOREIGN KEY (`rw`) REFERENCES `envistatus` (`rw`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_inhabitant` FOREIGN KEY (`inhabitantId`) REFERENCES `inhabitants` (`inhabitantId`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`rw`) REFERENCES `envistatus` (`rw`);

--
-- Constraints for table `requirements`
--
ALTER TABLE `requirements`
  ADD CONSTRAINT `requirements_ibfk_1` FOREIGN KEY (`rw`) REFERENCES `envistatus` (`rw`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`rw`) REFERENCES `envistatus` (`rw`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`rw`) REFERENCES `envistatus` (`rw`);

--
-- Constraints for table `submission`
--
ALTER TABLE `submission`
  ADD CONSTRAINT `submission_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `inhabitants` (`nik`),
  ADD CONSTRAINT `submission_ibfk_2` FOREIGN KEY (`rw`) REFERENCES `inhabitants` (`rw`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
