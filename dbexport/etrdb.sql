-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2020 at 04:45 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etrdb`
--
CREATE DATABASE IF NOT EXISTS `etrdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `etrdb`;

-- --------------------------------------------------------

--
-- Table structure for table `felvetel`
--

CREATE TABLE `felvetel` (
  `etr_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `kurzus_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `fevetelek_szama` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `idopont` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gepterem`
--

CREATE TABLE `gepterem` (
  `teremszam` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `ferohel` int(10) UNSIGNED DEFAULT NULL,
  `cim` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `gepek_szama` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hallgato`
--

CREATE TABLE `hallgato` (
  `hallgato_etr_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `lakhely` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `tagozat_forma` char(20) COLLATE utf8_hungarian_ci NOT NULL,
  `koltsegteritesi_forma` char(20) COLLATE utf8_hungarian_ci NOT NULL,
  `vezeteknev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `keresztnev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `titulus` varchar(5) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kurzus`
--

CREATE TABLE `kurzus` (
  `kurzus_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `kreditszam` int(10) UNSIGNED DEFAULT NULL,
  `maximum_letszam` int(10) UNSIGNED DEFAULT NULL,
  `letszam` int(10) UNSIGNED DEFAULT NULL,
  `teremszam` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `targykod` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `oktato_etr_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leadas`
--

CREATE TABLE `leadas` (
  `etr_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `kurzus_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `idopont` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oktato`
--

CREATE TABLE `oktato` (
  `oktato_etr_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `vezeteknev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `keresztnev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `titulus` varchar(5) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `beosztas` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `targy`
--

CREATE TABLE `targy` (
  `targykod` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `ajanlott_felev` int(10) UNSIGNED DEFAULT NULL,
  `nev` varchar(30) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terem`
--

CREATE TABLE `terem` (
  `teremszam` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `ferohely` int(10) UNSIGNED DEFAULT NULL,
  `cim` varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `felvetel`
--
ALTER TABLE `felvetel`
  ADD PRIMARY KEY (`etr_id`,`kurzus_id`),
  ADD UNIQUE KEY `etr_id` (`etr_id`,`kurzus_id`),
  ADD KEY `felvett_kurzus` (`kurzus_id`);

--
-- Indexes for table `gepterem`
--
ALTER TABLE `gepterem`
  ADD PRIMARY KEY (`teremszam`);

--
-- Indexes for table `hallgato`
--
ALTER TABLE `hallgato`
  ADD PRIMARY KEY (`hallgato_etr_id`);

--
-- Indexes for table `kurzus`
--
ALTER TABLE `kurzus`
  ADD PRIMARY KEY (`kurzus_id`),
  ADD KEY `tanitja` (`oktato_etr_id`),
  ADD KEY `kurzusa` (`targykod`),
  ADD KEY `helyszine` (`teremszam`);

--
-- Indexes for table `leadas`
--
ALTER TABLE `leadas`
  ADD PRIMARY KEY (`etr_id`,`kurzus_id`),
  ADD UNIQUE KEY `etr_id` (`etr_id`,`kurzus_id`),
  ADD KEY `leadott_kurzus` (`kurzus_id`);

--
-- Indexes for table `oktato`
--
ALTER TABLE `oktato`
  ADD PRIMARY KEY (`oktato_etr_id`);

--
-- Indexes for table `targy`
--
ALTER TABLE `targy`
  ADD PRIMARY KEY (`targykod`);

--
-- Indexes for table `terem`
--
ALTER TABLE `terem`
  ADD PRIMARY KEY (`teremszam`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `felvetel`
--
ALTER TABLE `felvetel`
  ADD CONSTRAINT `felvett_kurzus` FOREIGN KEY (`kurzus_id`) REFERENCES `kurzus` (`kurzus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `felvevo_hallgato` FOREIGN KEY (`etr_id`) REFERENCES `hallgato` (`hallgato_etr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gepterem`
--
ALTER TABLE `gepterem`
  ADD CONSTRAINT `parent` FOREIGN KEY (`teremszam`) REFERENCES `terem` (`teremszam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kurzus`
--
ALTER TABLE `kurzus`
  ADD CONSTRAINT `helyszine` FOREIGN KEY (`teremszam`) REFERENCES `terem` (`teremszam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kurzusa` FOREIGN KEY (`targykod`) REFERENCES `targy` (`targykod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tanitja` FOREIGN KEY (`oktato_etr_id`) REFERENCES `oktato` (`oktato_etr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leadas`
--
ALTER TABLE `leadas`
  ADD CONSTRAINT `leado_hallgato` FOREIGN KEY (`etr_id`) REFERENCES `hallgato` (`hallgato_etr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leadott_kurzus` FOREIGN KEY (`kurzus_id`) REFERENCES `kurzus` (`kurzus_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
