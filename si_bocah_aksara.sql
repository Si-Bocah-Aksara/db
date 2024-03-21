-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 21, 2024 at 05:09 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_bocah_aksara`
--

-- --------------------------------------------------------

--
-- Table structure for table `bm_about_subtema`
--

CREATE TABLE `bm_about_subtema` (
  `id_about` int(2) NOT NULL,
  `id_subtema` int(2) NOT NULL,
  `about_subtema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bm_detail_kalimat`
--

CREATE TABLE `bm_detail_kalimat` (
  `id_about` int(2) NOT NULL,
  `kalimat` varchar(255) NOT NULL,
  `audio_kalimat` varchar(255) NOT NULL,
  `gambar_kalimat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bm_tb_subtema`
--

CREATE TABLE `bm_tb_subtema` (
  `id_subtema` int(2) NOT NULL,
  `id_tema` int(2) NOT NULL,
  `nama_subtema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bm_tb_tema`
--

CREATE TABLE `bm_tb_tema` (
  `id_tema` int(2) NOT NULL,
  `nama_tema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mh_detail_gambar`
--

CREATE TABLE `mh_detail_gambar` (
  `id_detail` int(2) NOT NULL,
  `id_icon_gambar` int(2) NOT NULL,
  `gambar_detail` varchar(255) NOT NULL,
  `kalimat_detail` varchar(255) NOT NULL,
  `audio_detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mh_icon_gambar`
--

CREATE TABLE `mh_icon_gambar` (
  `id_icon_gambar` int(2) NOT NULL,
  `id_alfabet` int(2) NOT NULL,
  `icon_gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mh_tb_alfabet`
--

CREATE TABLE `mh_tb_alfabet` (
  `id_alfabet` int(2) NOT NULL,
  `huruf_kapital` char(1) NOT NULL,
  `huruf_kecil` char(1) NOT NULL,
  `audio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bm_about_subtema`
--
ALTER TABLE `bm_about_subtema`
  ADD PRIMARY KEY (`id_about`),
  ADD KEY `id_subtema` (`id_subtema`);

--
-- Indexes for table `bm_detail_kalimat`
--
ALTER TABLE `bm_detail_kalimat`
  ADD KEY `id_about` (`id_about`);

--
-- Indexes for table `bm_tb_subtema`
--
ALTER TABLE `bm_tb_subtema`
  ADD PRIMARY KEY (`id_subtema`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Indexes for table `bm_tb_tema`
--
ALTER TABLE `bm_tb_tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `mh_detail_gambar`
--
ALTER TABLE `mh_detail_gambar`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_icon_gambar` (`id_icon_gambar`);

--
-- Indexes for table `mh_icon_gambar`
--
ALTER TABLE `mh_icon_gambar`
  ADD PRIMARY KEY (`id_icon_gambar`),
  ADD KEY `id_alfabet` (`id_alfabet`);

--
-- Indexes for table `mh_tb_alfabet`
--
ALTER TABLE `mh_tb_alfabet`
  ADD PRIMARY KEY (`id_alfabet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bm_about_subtema`
--
ALTER TABLE `bm_about_subtema`
  MODIFY `id_about` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bm_tb_subtema`
--
ALTER TABLE `bm_tb_subtema`
  MODIFY `id_subtema` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bm_tb_tema`
--
ALTER TABLE `bm_tb_tema`
  MODIFY `id_tema` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mh_detail_gambar`
--
ALTER TABLE `mh_detail_gambar`
  MODIFY `id_detail` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mh_icon_gambar`
--
ALTER TABLE `mh_icon_gambar`
  MODIFY `id_icon_gambar` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mh_tb_alfabet`
--
ALTER TABLE `mh_tb_alfabet`
  MODIFY `id_alfabet` int(2) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bm_about_subtema`
--
ALTER TABLE `bm_about_subtema`
  ADD CONSTRAINT `bm_about_subtema_ibfk_1` FOREIGN KEY (`id_subtema`) REFERENCES `bm_tb_subtema` (`id_subtema`);

--
-- Constraints for table `bm_detail_kalimat`
--
ALTER TABLE `bm_detail_kalimat`
  ADD CONSTRAINT `bm_detail_kalimat_ibfk_1` FOREIGN KEY (`id_about`) REFERENCES `bm_about_subtema` (`id_about`);

--
-- Constraints for table `bm_tb_subtema`
--
ALTER TABLE `bm_tb_subtema`
  ADD CONSTRAINT `bm_tb_subtema_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `bm_tb_tema` (`id_tema`);

--
-- Constraints for table `mh_detail_gambar`
--
ALTER TABLE `mh_detail_gambar`
  ADD CONSTRAINT `mh_detail_gambar_ibfk_1` FOREIGN KEY (`id_icon_gambar`) REFERENCES `mh_icon_gambar` (`id_icon_gambar`);

--
-- Constraints for table `mh_icon_gambar`
--
ALTER TABLE `mh_icon_gambar`
  ADD CONSTRAINT `mh_icon_gambar_ibfk_1` FOREIGN KEY (`id_alfabet`) REFERENCES `mh_tb_alfabet` (`id_alfabet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
