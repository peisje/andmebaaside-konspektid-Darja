-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Mai 20, 2026 kell 01:04 PL
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
-- Andmebaas: `kasutajatitpv24`
--
CREATE DATABASE IF NOT EXISTS `kasutajatitpv24` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kasutajatitpv24`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loomad`
--

CREATE TABLE `loomad` (
  `loomId` int(11) NOT NULL,
  `nimi` varchar(30) NOT NULL,
  `vanus` int(11) NOT NULL,
  `chip` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `loomad`
--

INSERT INTO `loomad` (`loomId`, `nimi`, `vanus`, `chip`) VALUES
(1, 'kass elina', 4, 1),
(2, 'kass dasa', 5, 1),
(3, 'nastya koer', 7, 0);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `loomad`
--
ALTER TABLE `loomad`
  ADD PRIMARY KEY (`loomId`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `loomad`
--
ALTER TABLE `loomad`
  MODIFY `loomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Andmebaas: `moviebasa`
--
CREATE DATABASE IF NOT EXISTS `moviebasa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `moviebasa`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `guest`
--

CREATE TABLE `guest` (
  `guestid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `guest`
--

INSERT INTO `guest` (`guestid`, `name`) VALUES
(1, 'dasa'),
(2, 'elina'),
(3, 'nastya'),
(4, 'karina'),
(5, 'polina'),
(6, 'liza'),
(7, 'sasha'),
(8, 'wpodl');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `movies`
--

CREATE TABLE `movies` (
  `movieId` int(11) NOT NULL,
  `movieNimi` varchar(25) NOT NULL,
  `moviesYear` int(11) NOT NULL,
  `movieDir` varchar(30) NOT NULL,
  `movieCost` decimal(15,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `movies`
--

INSERT INTO `movies` (`movieId`, `movieNimi`, `moviesYear`, `movieDir`, `movieCost`) VALUES
(1, 'Inception', 2010, 'Christopher Nolan', 170000000.0),
(2, 'The Matrix', 1999, 'Lana Wachowski', 67000000.0),
(3, 'Interstellar', 2014, 'Christopher Nolan', 111000000.0),
(4, 'Pulp Fiction', 1994, 'Quentin Tarantino', 8000000.0),
(5, 'Avatar', 2009, 'James Cameron', 228000000.0),
(6, 'Gladiator', 2000, 'Ridley Scott', 340000000.0);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guestid`);

--
-- Indeksid tabelile `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieId`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `guest`
--
ALTER TABLE `guest`
  MODIFY `guestid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT tabelile `movies`
--
ALTER TABLE `movies`
  MODIFY `movieId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Andmebaas: `moviesbase`
--
CREATE DATABASE IF NOT EXISTS `moviesbase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `moviesbase`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `guest`
--

CREATE TABLE `guest` (
  `guestId` int(11) NOT NULL,
  `nimi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `guest`
--

INSERT INTO `guest` (`guestId`, `nimi`) VALUES
(0, 'dasa'),
(0, 'elina'),
(0, 'nastya'),
(0, 'karina'),
(0, 'polina'),
(0, 'liza'),
(0, 'sasha'),
(0, 'elina'),
(10, 'elina');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `movies`
--

CREATE TABLE `movies` (
  `moviesId` int(11) NOT NULL,
  `nimi` varchar(40) NOT NULL,
  `year` int(11) NOT NULL,
  `dir` varchar(50) NOT NULL,
  `cost` decimal(15,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `movies`
--

INSERT INTO `movies` (`moviesId`, `nimi`, `year`, `dir`, `cost`) VALUES
(1, 'The Matrix', 1999, 'Lana Wachowski', 67000000.0),
(2, 'Interstellar', 2014, 'Christopher Nolan', 111000000.0),
(3, 'Avatar', 2009, 'James Cameron', 228000000.0);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`moviesId`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `movies`
--
ALTER TABLE `movies`
  MODIFY `moviesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Andmebaas: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Andmete tõmmistamine tabelile `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('directorDasa', '[{\"db\":\"kasutajatitpv24\",\"table\":\"loomad\"}]'),
('producer', '[{\"db\":\"moviesbase\",\"table\":\"guest\"}]'),
('producerr', '[{\"db\":\"moviebasa\",\"table\":\"movies\"},{\"db\":\"moviebasa\",\"table\":\"guest\"}]'),
('root', '[{\"db\":\"moviebasa\",\"table\":\"movies\"},{\"db\":\"moviesbase\",\"table\":\"guest\"},{\"db\":\"moviesbase\",\"table\":\"movies\"},{\"db\":\"kasutajatitpv24\",\"table\":\"loomad\"}]');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Andmete tõmmistamine tabelile `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('directorDasa', '2026-05-20 09:30:52', '{\"lang\":\"et\",\"Console\\/Mode\":\"collapse\"}'),
('kasutajaDasa', '2026-05-20 09:43:10', '{\"lang\":\"et\",\"Console\\/Mode\":\"collapse\"}'),
('producer', '2026-05-20 10:32:10', '{\"lang\":\"et\",\"Console\\/Mode\":\"collapse\"}'),
('producerr', '2026-05-20 10:58:08', '{\"lang\":\"et\",\"Console\\/Mode\":\"collapse\"}'),
('root', '2026-05-20 11:03:38', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"et\",\"NavigationWidth\":181}');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksid tabelile `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksid tabelile `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksid tabelile `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksid tabelile `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksid tabelile `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksid tabelile `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksid tabelile `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksid tabelile `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksid tabelile `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksid tabelile `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksid tabelile `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksid tabelile `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksid tabelile `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksid tabelile `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksid tabelile `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksid tabelile `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksid tabelile `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Andmebaas: `protseduur`
--
CREATE DATABASE IF NOT EXISTS `protseduur` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `protseduur`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `brands`
--
-- Viga tabeli protseduur.brands struktuuri lugemisel: #1932 - Table &#039;protseduur.brands&#039; doesn&#039;t exist in engine
-- Viga tabeli protseduur.brands andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `protseduur`.`brands`&#039; ligidal real 1

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `categories`
--
-- Viga tabeli protseduur.categories struktuuri lugemisel: #1932 - Table &#039;protseduur.categories&#039; doesn&#039;t exist in engine
-- Viga tabeli protseduur.categories andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `protseduur`.`categories`&#039; ligidal real 1

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `klient`
--
-- Viga tabeli protseduur.klient struktuuri lugemisel: #1932 - Table &#039;protseduur.klient&#039; doesn&#039;t exist in engine
-- Viga tabeli protseduur.klient andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `protseduur`.`klient`&#039; ligidal real 1

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `products`
--
-- Viga tabeli protseduur.products struktuuri lugemisel: #1932 - Table &#039;protseduur.products&#039; doesn&#039;t exist in engine
-- Viga tabeli protseduur.products andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `protseduur`.`products`&#039; ligidal real 1
--
-- Andmebaas: `protseduurdasa`
--
CREATE DATABASE IF NOT EXISTS `protseduurdasa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `protseduurdasa`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `klient`
--
-- Viga tabeli protseduurdasa.klient struktuuri lugemisel: #1932 - Table &#039;protseduurdasa.klient&#039; doesn&#039;t exist in engine
-- Viga tabeli protseduurdasa.klient andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `protseduurdasa`.`klient`&#039; ligidal real 1

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loomad`
--
-- Viga tabeli protseduurdasa.loomad struktuuri lugemisel: #1932 - Table &#039;protseduurdasa.loomad&#039; doesn&#039;t exist in engine
-- Viga tabeli protseduurdasa.loomad andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `protseduurdasa`.`loomad`&#039; ligidal real 1
--
-- Andmebaas: `ringokirnmann`
--
CREATE DATABASE IF NOT EXISTS `ringokirnmann` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ringokirnmann`;
--
-- Andmebaas: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `teinetabel`
--
-- Viga tabeli test.teinetabel struktuuri lugemisel: #1932 - Table &#039;test.teinetabel&#039; doesn&#039;t exist in engine
-- Viga tabeli test.teinetabel andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `test`.`teinetabel`&#039; ligidal real 1

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `testtabel`
--
-- Viga tabeli test.testtabel struktuuri lugemisel: #1932 - Table &#039;test.testtabel&#039; doesn&#039;t exist in engine
-- Viga tabeli test.testtabel andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `test`.`testtabel`&#039; ligidal real 1
--
-- Andmebaas: `trigerkasutaja`
--
CREATE DATABASE IF NOT EXISTS `trigerkasutaja` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `trigerkasutaja`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `arved`
--
-- Viga tabeli trigerkasutaja.arved struktuuri lugemisel: #1932 - Table &#039;trigerkasutaja.arved&#039; doesn&#039;t exist in engine
-- Viga tabeli trigerkasutaja.arved andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `trigerkasutaja`.`arved`&#039; ligidal real 1

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `logi`
--
-- Viga tabeli trigerkasutaja.logi struktuuri lugemisel: #1932 - Table &#039;trigerkasutaja.logi&#039; doesn&#039;t exist in engine
-- Viga tabeli trigerkasutaja.logi andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `trigerkasutaja`.`logi`&#039; ligidal real 1

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tellimused`
--
-- Viga tabeli trigerkasutaja.tellimused struktuuri lugemisel: #1932 - Table &#039;trigerkasutaja.tellimused&#039; doesn&#039;t exist in engine
-- Viga tabeli trigerkasutaja.tellimused andmete lugemisel: #1064 - Viga SQL süntaksis &#039;FROM `trigerkasutaja`.`tellimused`&#039; ligidal real 1

--
-- Päästikud `tellimused`
--
DELIMITER $$
CREATE TRIGGER `lisaArve` AFTER INSERT ON `tellimused` FOR EACH ROW BEGIN
    INSERT INTO arved (arve_number, tellimus_id)
    VALUES (CONCAT('arv', NEW.tellimus_id, '-', YEAR(NOW())), NEW.tellimus_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `lisakasutaja` BEFORE INSERT ON `tellimused` FOR EACH ROW BEGIN
    SET NEW.user_nimi = USER();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tellimusKustutamine` BEFORE DELETE ON `tellimused` FOR EACH ROW INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT 
NOW(), CONCAT('Kustutatud: ', OLD.toode, ', Kasutaja: ', OLD.user_nimi, ', Arve number: ', a.arve_number), USER()
FROM arved a
WHERE a.tellimus_id = OLD.tellimus_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tellimusLisamine` AFTER INSERT ON `tellimused` FOR EACH ROW INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT 
NOW(), CONCAT('Lisatud toode: ', t.toode,', Kogus: ', t.kogus,', Arve number: ', a.arve_number), USER()
FROM tellimused t
INNER JOIN arved a ON t.tellimus_id = a.tellimus_id
WHERE t.tellimus_id = NEW.tellimus_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tellimusUuendamine` AFTER UPDATE ON `tellimused` FOR EACH ROW INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT 
NOW(), CONCAT('Vana: ', OLD.toode,', Uus: ', NEW.toode, a.makse_staatus), USER()
FROM tellimused t
INNER JOIN arved a ON t.tellimus_id = a.tellimus_id
WHERE t.tellimus_id = NEW.tellimus_id
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
