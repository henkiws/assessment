-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 11, 2020 at 08:25 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

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
  `ass_result_id` int(11) NOT NULL,
  `ass_question_id` int(11) NOT NULL,
  `ass_answer` json NOT NULL,
  `ass_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `param_category`
--

CREATE TABLE `param_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '1: true; 0:false'
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
  `quest_instrument` json NOT NULL,
  `quest_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `param_cat_id`, `quest_title`, `quest_type`, `quest_instrument`, `quest_status`) VALUES
(1, 1, 'Tanda tanda vital', 'text', '[{\"name\": \"td\", \"unit\": \"mm/hg\", \"question\": \"TD\"}, {\"name\": \"s\", \"unit\": \"\", \"question\": \"S\"}, {\"name\": \"c\", \"unit\": \"\", \"question\": \"C\"}, {\"name\": \"p\", \"unit\": \"x/mnt\", \"question\": \"P\"}, {\"name\": \"nadi\", \"unit\": \"x/mnt\", \"question\": \"Nadi\"}]', 1),
(2, 1, 'Neonatus Problem', 'text', '[{\"name\": \"abgar_score\", \"unit\": \"\", \"question\": \"ABGAR SCORE\"}, {\"name\": \"mekonium\", \"unit\": \"\", \"question\": \"Mekonium\"}, {\"name\": \"ikterus\", \"unit\": \"\", \"question\": \"Ikterus\"}]', 1),
(3, 2, 'Gol Darah', 'radio', '{\"name\": \"gol_darah\", \"options\": [\"O\", \"A\", \"B\", \"AB\"]}', 1),
(4, 3, 'Riwayat IMunisasi', 'checkbox', '{\"name\": \"riwayat_imunisasi\", \"options\": [\"BCG\", \"CAMPAK\", \"POLIO\", \"DPT\"]}', 1),
(5, 3, 'Pengkajian Nyeri Children’s Hospital of Eastern Ontario Pain Scale (CHEOPS)', 'table', '{\"row\": [[\"menangis\", \"Tidak menangis (1) Menangis (2) Merengek (2) Menjerit (3)\", \"\"], [\"vasial\", \"Tersenyum (0) Tenang (1) Meringis (2)\", \"\"], [\"verbal\", \"Positif (0) Tidak ada (1) Keluhan non nyeri (2) keluhan nyeri dan non nyeri (2)\", \"\"], [\"sikap tubuh\", \"Netral (1) Terus menerus berubah posisi (2) Kaku (2) Menggigil (2) duduk tegak (2) Tidak mau berubah posisi (2)\", \"\"], [\"Menyentuh bagian yang nyeri\", \"Tidak menyentuh bagian yang nyeri (1) Menyentuh dan memegang erat bagian yang nyeri (2) Tangan tidak mau berubah posisi (2)\", \"\"], [\"Tungkai Bawah\", \"Netral (1) Menendang sambal menjerit (2) Kaku dan ditarik (2) Berdiri (2) Tidak mau mengubah posisi (2)\", \"\"]], \"name\": \"gejala\", \"header\": [\"parameter\", \"sub parameter\", \"skala\"]}', 1),
(6, 4, 'Pendidikan', 'radio', '{\"name\": \"pendidikan\", \"options\": [\"SD\", \"SMP\", \"SMA\", \"S1\"]}', 1),
(7, 4, 'Kemampuan Kognitif', 'radio', '{\"name\": \"kemampuan_kognitif\", \"options\": [\"Tidak ada masalah\", \"Ada masalah\"]}', 1),
(8, 4, 'Motivasi menerima edukasi', 'radio', '{\"name\": \"motovasi_menerima_edukasi\", \"options\": [\"Tidak ada masalah\", \"Ada masalah\"]}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `res_code` char(50) NOT NULL,
  `res_usr_id` int(1) NOT NULL,
  `res_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `usr_name` varchar(255) NOT NULL,
  `usr_alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `usr_name`, `usr_alamat`) VALUES
(1, 'henki', 'boyolali'),
(2, 'wisnu', 'boyolali');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
