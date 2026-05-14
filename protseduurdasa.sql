-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Mai 14, 2026 kell 10:36 EL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `protseduurdasa`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `klientStatus` ()   BEGIN
	SELECT klientNimi, saldo, 
    IF(saldo>100, 'hea klient', 'tavaklient')AS hinnang
    FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutaKlient` (IN `kustataID` INT)   BEGIN
	SELECT * FROM klient;
	DELETE FROM klient WHERE klientID=kustataID;
    SELECT * FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutaLoom` (IN `kustataID` INT)   BEGIN
	SELECT * FROM loomad;
	DELETE FROM loomad WHERE loomID=kustataID;
    SELECT * FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaKlient` (IN `uusNimi` VARCHAR(20), IN `uusLinn` VARCHAR(20), IN `uusVanus` INT, IN `uusSaldo` DECIMAL(10,2))   BEGIN
	INSERT INTO klient(klientNimi, linn, vanus, saldo)
    VALUES (uusNimi, uusLinn, uusVanus, uusSaldo);
    SELECT * FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaloom` (IN `uusNimi` VARCHAR(20), IN `uusKaal` INT, IN `uusAasta` INT)   BEGIN
	INSERT INTO loomad(loomNimi, kaal, synniAasta)
    VALUES (uusNimi, uusKaal, uusAasta);
    SELECT * FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LoomaHinnang` ()   BEGIN
	SELECT loomNimi, kaal, 
    IF(kaal>10, 'suur loom', 'väike loom')AS hinnang
    FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `minmaxKaal` (OUT `minKaal` INT, OUT `maxKaal` INT, OUT `avgKaal` DECIMAL(6,2), OUT `sumKaal` INT, OUT `countLoom` INT)   BEGIN
	SELECT MIN(kaal), MAX(kaal), AVG(kaal), SUM(kaal), COUNT(*)
    INTO minKaal, maxKaal, avgKaal, sumKaal, countLoom
    FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `minmaxSaldo` (OUT `minSaldo` INT, OUT `maxSaldo` INT, OUT `avgSaldo` DECIMAL(6.2), OUT `sumSaldo` INT, OUT `countKlient` INT)   BEGIN
	SELECT MIN(saldo), MAX(saldo), AVG(saldo), SUM(saldo), COUNT(*)
    INTO minSaldo, maxSaldo, avgSaldo, sumSaldo, countKlient
    FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `naitaKlient` ()   BEGIN
	SELECT klientNimi FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `naitaLoomad` ()   BEGIN
	SELECT loomNimi FROM loomad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otsing1taht` (IN `taht` CHAR(1))   BEGIN
	SELECT * FROM loomad
    WHERE loomNimi LIKE Concat(taht, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otsing1tahtt` (IN `taht` CHAR)   BEGIN
	SELECT * FROM klient
    WHERE klientNimi LIKE Concat(taht, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uuendaSaldo` (IN `klientID` INT, IN `uusSaldo` DECIMAL(10.2))   BEGIN
	SELECT * FROM klient;
    UPDATE klient 
    SET saldo = uusSaldo 
    WHERE klient.klientID = klientID;
    SELECT * FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uusVeeru` (IN `valik` VARCHAR(10), IN `tabelinimi` VARCHAR(25), IN `veerunimi` VARCHAR(25), IN `tyyp` VARCHAR(25))   BEGIN
    SET @sql = CASE 
        WHEN valik LIKE 'add' THEN 
            CONCAT('ALTER TABLE ', tabelinimi, ' ADD ', veerunimi, ' ', tyyp)
        WHEN valik LIKE 'drop' THEN 
            CONCAT('ALTER TABLE ', tabelinimi, ' DROP COLUMN ', veerunimi)
    END;


    PREPARE stmt FROM @sql;

    EXECUTE stmt;
    
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `klient`
--

CREATE TABLE `klient` (
  `klientID` int(11) NOT NULL,
  `klientNimi` varchar(20) NOT NULL,
  `linn` varchar(20) DEFAULT NULL,
  `vanus` int(11) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `klient`
--

INSERT INTO `klient` (`klientID`, `klientNimi`, `linn`, `vanus`, `saldo`, `email`) VALUES
(1, 'elina', 'tallinn', 18, 120.00, NULL),
(2, 'nastya', 'narva', 19, 67.00, NULL),
(5, 'dasa', 'Tallinn', 17, 150.00, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loomad`
--

CREATE TABLE `loomad` (
  `loomID` int(11) NOT NULL,
  `loomNimi` varchar(20) NOT NULL,
  `kaal` int(11) DEFAULT NULL,
  `synniAasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `loomad`
--

INSERT INTO `loomad` (`loomID`, `loomNimi`, `kaal`, `synniAasta`) VALUES
(3, 'kass Kija', 6, 2017),
(5, 'papagoi', 1, 2021),
(6, 'test loom', 20, 2024);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`klientID`);

--
-- Indeksid tabelile `loomad`
--
ALTER TABLE `loomad`
  ADD PRIMARY KEY (`loomID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `klient`
--
ALTER TABLE `klient`
  MODIFY `klientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `loomad`
--
ALTER TABLE `loomad`
  MODIFY `loomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
