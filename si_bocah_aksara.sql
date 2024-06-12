-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 12 Jun 2024 pada 09.59
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siBocahAksara`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bm_about_subtema`
--

CREATE TABLE `bm_about_subtema` (
  `id_about` int(2) NOT NULL,
  `id_subtema` int(2) NOT NULL,
  `about_subtema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bm_detail_kalimat`
--

CREATE TABLE `bm_detail_kalimat` (
  `id_about` int(2) NOT NULL,
  `kalimat` varchar(255) NOT NULL,
  `audio_kalimat` varchar(255) NOT NULL,
  `gambar_kalimat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bm_tb_subtema`
--

CREATE TABLE `bm_tb_subtema` (
  `id_subtema` int(2) NOT NULL,
  `id_tema` int(2) NOT NULL,
  `nama_subtema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bm_tb_tema`
--

CREATE TABLE `bm_tb_tema` (
  `id_tema` int(2) NOT NULL,
  `nama_tema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_detail_gambar`
--

CREATE TABLE `mh_detail_gambar` (
  `id_detail` int(2) NOT NULL,
  `id_icon_gambar` int(2) NOT NULL,
  `gambar_detail` varchar(255) NOT NULL,
  `kalimat_detail` varchar(255) NOT NULL,
  `audio_detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_icon_gambar`
--

CREATE TABLE `mh_icon_gambar` (
  `id_icon_gambar` int(2) NOT NULL,
  `id_alfabet` int(2) NOT NULL,
  `icon_gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_tb_alfabet`
--

CREATE TABLE `mh_tb_alfabet` (
  `id_alfabet` int(2) NOT NULL,
  `huruf_kapital` char(1) NOT NULL,
  `huruf_kecil` char(1) NOT NULL,
  `audio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rk_nilai_siswa`
--

CREATE TABLE `rk_nilai_siswa` (
  `UUID` varchar(36) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `skor` int(3) NOT NULL,
  `fk_id_tema` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `u_akun`
--

CREATE TABLE `u_akun` (
  `UUID` varchar(36) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `fk_data_anak` int(11) DEFAULT NULL,
  `isAdmin` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `u_akun`
--

INSERT INTO `u_akun` (`UUID`, `nama_lengkap`, `username`, `pass`, `fk_data_anak`, `isAdmin`) VALUES
('11cd3a4c-41ce-459b-a389-c739cc799629', 'Muhammad Yaqdhan Taqy Ariana', 'dhan14', '$2a$10$U6Kzl1iAFmjQndJCLKaOBejofEyU5o9nfo9apcJO8UFA7RDio4.Ri', NULL, 0),
('6a5ab23a-5437-4459-bbb3-ad033f8a90e6', 'Setyawati Putri Nugraha', 'tyatiatiya', '$2a$10$IeMhjWFcMgf/.NdAEJXlJOSBo1ksUG2DhBFcUi.FRKSlWfABFwyYW', NULL, 0),
('d73da09c-c955-4702-81b2-fe2ba1bc337e', 'Administrator', 'admin', '$2a$10$pzMhinZCpehTlyDzCNvBi.QFnp94puYOtaeIoIKk9i5oF.NZC1MVC', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `u_data_anak`
--

CREATE TABLE `u_data_anak` (
  `ID` int(11) NOT NULL,
  `nama_anak` varchar(50) NOT NULL,
  `membaca` int(1) NOT NULL,
  `foto` blob NOT NULL,
  `UUID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bm_about_subtema`
--
ALTER TABLE `bm_about_subtema`
  ADD PRIMARY KEY (`id_about`),
  ADD KEY `id_subtema` (`id_subtema`);

--
-- Indeks untuk tabel `bm_detail_kalimat`
--
ALTER TABLE `bm_detail_kalimat`
  ADD KEY `id_about` (`id_about`);

--
-- Indeks untuk tabel `bm_tb_subtema`
--
ALTER TABLE `bm_tb_subtema`
  ADD PRIMARY KEY (`id_subtema`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Indeks untuk tabel `bm_tb_tema`
--
ALTER TABLE `bm_tb_tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indeks untuk tabel `mh_detail_gambar`
--
ALTER TABLE `mh_detail_gambar`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_icon_gambar` (`id_icon_gambar`);

--
-- Indeks untuk tabel `mh_icon_gambar`
--
ALTER TABLE `mh_icon_gambar`
  ADD PRIMARY KEY (`id_icon_gambar`),
  ADD KEY `id_alfabet` (`id_alfabet`);

--
-- Indeks untuk tabel `mh_tb_alfabet`
--
ALTER TABLE `mh_tb_alfabet`
  ADD PRIMARY KEY (`id_alfabet`);

--
-- Indeks untuk tabel `u_akun`
--
ALTER TABLE `u_akun`
  ADD PRIMARY KEY (`UUID`),
  ADD KEY `fk_data_anak` (`fk_data_anak`);

--
-- Indeks untuk tabel `u_data_anak`
--
ALTER TABLE `u_data_anak`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bm_about_subtema`
--
ALTER TABLE `bm_about_subtema`
  MODIFY `id_about` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bm_tb_subtema`
--
ALTER TABLE `bm_tb_subtema`
  MODIFY `id_subtema` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bm_tb_tema`
--
ALTER TABLE `bm_tb_tema`
  MODIFY `id_tema` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mh_detail_gambar`
--
ALTER TABLE `mh_detail_gambar`
  MODIFY `id_detail` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mh_icon_gambar`
--
ALTER TABLE `mh_icon_gambar`
  MODIFY `id_icon_gambar` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mh_tb_alfabet`
--
ALTER TABLE `mh_tb_alfabet`
  MODIFY `id_alfabet` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `u_data_anak`
--
ALTER TABLE `u_data_anak`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bm_about_subtema`
--
ALTER TABLE `bm_about_subtema`
  ADD CONSTRAINT `bm_about_subtema_ibfk_1` FOREIGN KEY (`id_subtema`) REFERENCES `bm_tb_subtema` (`id_subtema`);

--
-- Ketidakleluasaan untuk tabel `bm_detail_kalimat`
--
ALTER TABLE `bm_detail_kalimat`
  ADD CONSTRAINT `bm_detail_kalimat_ibfk_1` FOREIGN KEY (`id_about`) REFERENCES `bm_about_subtema` (`id_about`);

--
-- Ketidakleluasaan untuk tabel `bm_tb_subtema`
--
ALTER TABLE `bm_tb_subtema`
  ADD CONSTRAINT `bm_tb_subtema_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `bm_tb_tema` (`id_tema`);

--
-- Ketidakleluasaan untuk tabel `mh_detail_gambar`
--
ALTER TABLE `mh_detail_gambar`
  ADD CONSTRAINT `mh_detail_gambar_ibfk_1` FOREIGN KEY (`id_icon_gambar`) REFERENCES `mh_icon_gambar` (`id_icon_gambar`);

--
-- Ketidakleluasaan untuk tabel `mh_icon_gambar`
--
ALTER TABLE `mh_icon_gambar`
  ADD CONSTRAINT `mh_icon_gambar_ibfk_1` FOREIGN KEY (`id_alfabet`) REFERENCES `mh_tb_alfabet` (`id_alfabet`);

--
-- Ketidakleluasaan untuk tabel `u_akun`
--
ALTER TABLE `u_akun`
  ADD CONSTRAINT `u_akun_ibfk_1` FOREIGN KEY (`fk_data_anak`) REFERENCES `u_data_anak` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
