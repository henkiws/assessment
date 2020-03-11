-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2020 at 01:03 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `formulir`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `id` int(11) NOT NULL,
  `ass_name` varchar(255) NOT NULL,
  `ass_gender` char(50) NOT NULL,
  `ass_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `param_category`
--

CREATE TABLE `param_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT 0 COMMENT '1: true; 0:false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `param_category`
--

INSERT INTO `param_category` (`id`, `name`, `status`) VALUES
(1, 'riwayat alergi', 1),
(2, 'golongan darah', 1),
(3, 'IMunisasi', 1),
(4, 'Kebutuhan Edukasi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `param_cat_id` int(11) NOT NULL,
  `quest_title` varchar(255) NOT NULL,
  `quest_type` char(50) NOT NULL,
  `quest_instrument` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `param_cat_id`, `quest_title`, `quest_type`, `quest_instrument`, `quest_status`) VALUES
(1, 1, 'Tanda tanda vital', 'text', '[{\r\n		\"question\": \"TD\",\r\n		\"unit\": \"mm/hg\"\r\n	},\r\n	{\r\n		\"question\": \"S\",\r\n		\"unit\": \"\"\r\n	},\r\n	{\r\n		\"question\": \"C\",\r\n		\"unit\": \"\"\r\n	},\r\n	{\r\n		\"question\": \"P\",\r\n		\"unit\": \"x/mnt\"\r\n	},\r\n	{\r\n		\"question\": \"Nadi\",\r\n		\"unit\": \"x/mnt\"\r\n	}\r\n]', 1),
(2, 1, 'Neonatus Problem', 'text', '[{\r\n		\"question\": \"ABGAR SCORE\",\r\n		\"unit\": \"\"\r\n	},\r\n	{\r\n		\"question\": \"Mekonium\",\r\n		\"unit\": \"\"\r\n	},\r\n	{\r\n		\"question\": \"Ikterus\",\r\n		\"unit\": \"\"\r\n	}\r\n]', 1),
(3, 2, 'Gol Darah', 'radio', '{\r\n	\"options\": [\r\n		\"O\", \"A\", \"B\", \"AB\"\r\n	]\r\n}', 1),
(4, 3, 'Riwayat IMunisasi', 'checkbox', '{\r\n	\"options\": [\r\n		\"BCG\", \"CAMPAK\", \"POLIO\", \"DPT\"\r\n	]\r\n}', 1),
(5, 3, 'Pengkajian Nyeri Children’s Hospital of Eastern Ontario Pain Scale (CHEOPS)', 'table', '{\r\n	\"header\": [\"parameter\", \"sub parameter\", \"skala\"],\r\n	\"row\": [\r\n		[\"menangis\", \"Tidak menangis (1) Menangis (2) Merengek (2) Menjerit (3)\", \"\"],\r\n		[\"vasial\", \"Tersenyum (0) Tenang (1) Meringis (2)\", \"\"],\r\n		[\"verbal\", \"Positif (0) Tidak ada (1) Keluhan non nyeri (2) keluhan nyeri dan non nyeri (2)\", \"\"],\r\n		[\"sikap tubuh\", \"Netral (1) Terus menerus berubah posisi (2) Kaku (2) Menggigil (2) duduk tegak (2) Tidak mau berubah posisi (2)\", \"\"],\r\n		[\"Menyentuh bagian yang nyeri\", \"Tidak menyentuh bagian yang nyeri (1) Menyentuh dan memegang erat bagian yang nyeri (2) Tangan tidak mau berubah posisi (2)\", \"\"],\r\n		[\"Tungkai Bawah\", \"Netral (1) Menendang sambal menjerit (2) Kaku dan ditarik (2) Berdiri (2) Tidak mau mengubah posisi (2)\", \"\"]\r\n	]\r\n}', 1),
(6, 4, 'Pendidikan', 'radio', '{\r\n	\"options\": [\r\n		\"SD\", \"SMP\", \"SMA\", \"S1\"\r\n	]\r\n}', 1),
(7, 4, 'Kemampuan Kognitif', 'radio', '{\r\n	\"options\": [\r\n		\"Tidak ada masalah\", \"Ada masalah\"\r\n	]\r\n}', 1),
(8, 4, 'Motivasi menerima edukasi', 'radio', '{\r\n	\"options\": [\r\n		\"Tidak ada masalah\", \"Ada masalah\"\r\n	]\r\n}', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `param_category`
--
ALTER TABLE `param_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment`
--
ALTER TABLE `assessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `param_category`
--
ALTER TABLE `param_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
