-- phpMyAdmin SQL Dump
-- version 4.9.7deb1bionic1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 12. Jan 2021 um 15:41
-- Server-Version: 5.7.32-0ubuntu0.18.04.1
-- PHP-Version: 7.2.24-0ubuntu0.18.04.7

--SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
--SET AUTOCOMMIT = 0;
--START TRANSACTION;
--SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `flightdata`
--

DROP DATABASE IF EXISTS flightdata;
CREATE DATABASE flightdata;
USE flightdata;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airlines`
--

CREATE TABLE `airlines` (
  `id` char(2) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `country` char(2) NOT NULL DEFAULT ''
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airports`
--

CREATE TABLE `airports` (
  `airportcode` char(3) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country` char(2) NOT NULL DEFAULT '',
  `city` varchar(100) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `countries`
--

CREATE TABLE `countries` (
  `code` char(2) NOT NULL,
  `name` varchar(100) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flights`
--

CREATE TABLE `flights` (
  `airline` char(2) NOT NULL DEFAULT '',
  `flightnr` char(3) NOT NULL DEFAULT '',
  `departure_time` datetime DEFAULT NULL,
  `departure_airport` char(3) DEFAULT NULL,
  `destination_time` datetime DEFAULT NULL,
  `destination_airport` char(3) DEFAULT NULL,
  `planetype` int(11) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `passengers`
--

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `airline` char(2) DEFAULT NULL,
  `flightnr` char(4) DEFAULT NULL,
  `rownr` int(11) DEFAULT NULL,
  `seatposition` char(1) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `planes`
--

CREATE TABLE `planes` (
  `id` int(11) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `lengthoverall` double DEFAULT NULL,
  `span` double DEFAULT NULL,
  `maxspeed` int(11) DEFAULT NULL,
  `initialserviceyear` int(11) DEFAULT NULL,
  `maxseats` int(11) DEFAULT NULL,
  `seatsperrow` smallint(4) DEFAULT NULL
);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country`);

--
-- Indizes für die Tabelle `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`airportcode`),
  ADD KEY `country` (`country`);

--
-- Indizes für die Tabelle `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`code`);

--
-- Indizes für die Tabelle `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`airline`,`flightnr`),
  ADD KEY `departure_airport` (`departure_airport`),
  ADD KEY `destination_airport` (`destination_airport`),
  ADD KEY `planetype` (`planetype`);

--
-- Indizes für die Tabelle `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airline` (`airline`,`flightnr`);

--
-- Indizes für die Tabelle `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airline`) REFERENCES `airlines` (`id`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`departure_airport`) REFERENCES `airports` (`airportcode`),
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`destination_airport`) REFERENCES `airports` (`airportcode`),
  ADD CONSTRAINT `flights_ibfk_4` FOREIGN KEY (`planetype`) REFERENCES `planes` (`id`);

--
-- Constraints der Tabelle `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`airline`,`flightnr`) REFERENCES `flights` (`airline`, `flightnr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
