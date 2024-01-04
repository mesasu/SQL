-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2024 pada 03.29
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman_mobil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_peminjam`
--

CREATE TABLE `data_peminjam` (
  `id_peminjam` int(10) NOT NULL,
  `nama_peminjam` varchar(120) NOT NULL,
  `alamat_peminjam` text NOT NULL,
  `jk_peminjam` enum('laki','cewek') NOT NULL,
  `no_peminjam` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_peminjam`
--

INSERT INTO `data_peminjam` (`id_peminjam`, `nama_peminjam`, `alamat_peminjam`, `jk_peminjam`, `no_peminjam`) VALUES
(235436273, 'Evan', 'bantul', 'cewek', 812376123),
(289375098, 'Melvin', 'bantul', 'laki', 823472462),
(298347534, 'Rodolfo', 'sleman', 'laki', 898982342),
(352567435, 'Ali', 'bantul', 'laki', 823485234),
(435345241, 'Eliseo', 'sleman', 'cewek', 867342342),
(463402950, 'Angel', 'jogja', 'cewek', 898983423),
(534524346, 'Alex', 'bantul', 'laki', 823472365),
(698234242, 'Yahya', 'jogja', 'laki', 867342342),
(1231253452, 'Caleb', 'jogja', 'cewek', 812313542),
(2123412342, 'Damon', 'jogja', 'laki', 812472832);

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga`
--

CREATE TABLE `harga` (
  `id_mobil` int(8) NOT NULL,
  `harga_peminjaman` int(10) NOT NULL,
  `nama_mobil` varchar(30) NOT NULL,
  `tipe_mobil` varchar(30) NOT NULL,
  `jenis_mobil` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `harga`
--

INSERT INTO `harga` (`id_mobil`, `harga_peminjaman`, `nama_mobil`, `tipe_mobil`, `jenis_mobil`) VALUES
(12812308, 200000000, 'Suzuki Grand Vitara.', 'JLX 2.0', 'SUV'),
(23248204, 100000000, 'Daihatsu Sigra', '1.0 D MT 2022', 'LCGC'),
(26453563, 300000000, 'BMW E30', 'E30', 'STATION WAGON'),
(42342341, 100000000, 'Nissan Livina', '1.5 SV', 'MPV'),
(45734654, 100000000, 'Toyota Vios', 'All New Vios 1.5 G CVT', 'SEDAN'),
(52354124, 300000000, 'Honda BRV', 'All New Honda BR-V S M/T', 'CROSSOVER'),
(63452321, 100000000, 'Honda city hatchback', 'Honda City 1.5 New City E MT ', 'HATCHBACK'),
(74564721, 100000000, 'Suzuki Jimny', 'Kotrik LJ50', 'OFF ROAD'),
(74568432, 300000000, 'Toyota supra', 'Supra A40', 'SPORT '),
(90824103, 100000000, 'Ford Ranger', 'XL 2.2L MT', 'DOUBLE CABIN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(8) NOT NULL,
  `jenis_mobil` varchar(30) NOT NULL,
  `nama_mobil` varchar(30) NOT NULL,
  `tipe_mobil` varchar(30) NOT NULL,
  `kode_mobil` char(5) NOT NULL,
  `merk_mobil` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `jenis_mobil`, `nama_mobil`, `tipe_mobil`, `kode_mobil`, `merk_mobil`) VALUES
(23248204, 'LCGC', 'Daihatsu Sigra', '1.0 D MT 2022', 'A9254', 'Daihatsu'),
(42342341, 'MPV', 'Nissan Livina', '1.5 SV', 'A3123', 'Nissan'),
(52354124, 'CROSSOVER', 'Honda BRV', 'All New Honda BR-V S M/T', 'A4235', 'Honda'),
(45734654, 'SEDAN', 'Toyota Vios', 'All New Vios 1.5 G CVT', 'A2464', 'Toyota'),
(26453563, 'STATION WAGON', 'BMW E30', 'E30', 'A8642', 'BMW'),
(63452321, 'HATCHBACK', 'Honda city hatchback', 'Honda City 1.5 New City E MT', 'A2341', 'Honda'),
(12812308, 'SUV', 'Suzuki Grand Vitara', 'JLX 2.0', 'A6319', 'Suzuki'),
(74564721, 'OFF ROAD', 'Suzuki Jimny', 'Kotrik LJ50', 'A6754', 'Suzuki'),
(74568432, 'SPORT ', 'Toyota supra', 'Supra A40', 'A6452', 'Toyota'),
(90824103, 'DOUBLE CABIN', 'Ford Ranger', 'XL 2.2L MT', 'A4568', 'Ford');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjam`
--

CREATE TABLE `peminjam` (
  `no` int(11) NOT NULL,
  `id_mobil` int(8) NOT NULL,
  `merk_mobil` varchar(30) NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `tipe_mobil` varchar(30) NOT NULL,
  `kode_mobil` char(5) NOT NULL,
  `id_peminjam` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjam`
--

INSERT INTO `peminjam` (`no`, `id_mobil`, `merk_mobil`, `tanggal_peminjaman`, `tipe_mobil`, `kode_mobil`, `id_peminjam`) VALUES
(1, 12812308, 'Suzuki', '2020-01-01', 'JLX 2.0', 'A6319', 212341234),
(2, 42342341, 'Nissan', '2020-01-03', '1.5 SV', 'A3123', 123125345),
(3, 63452321, 'Honda', '2020-02-01', 'Honda City 1.5 New City E MT ', 'A2341', 435345241),
(4, 45734654, 'Toyota', '2020-03-19', 'All New Vios 1.5 G CVT', 'A2464', 235436273),
(5, 74568432, 'Toyota', '2020-03-22', 'Supra A40', 'A6452', 289375098),
(6, 26453563, 'BMW', '2020-04-13', 'E30', 'A8642', 298347534),
(7, 23248204, 'Daihatsu', '2020-04-14', '1.0 D MT 2022', 'A9254', 698234242),
(8, 90824103, 'Ford', '2020-05-25', 'XL 2.2L MT', 'A4568', 352567435),
(9, 74564721, 'Suzuki', '2020-05-22', 'Kotrik LJ50', 'A6754', 534524346),
(10, 12812308, 'Suzuki', '2020-08-25', 'JLX 2.0', 'A6319', 463402950);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `no` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `jenis_mobil` varchar(30) NOT NULL,
  `merk_mobil` varchar(30) NOT NULL,
  `tipe_mobil` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengembalian`
--

INSERT INTO `pengembalian` (`no`, `tanggal_pengembalian`, `jenis_mobil`, `merk_mobil`, `tipe_mobil`) VALUES
(1, '2020-01-02', 'SUV', 'Suzuki', 'JLX 2.0'),
(2, '2020-01-04', 'MPV', 'Nissan', '1.5 SV'),
(3, '2023-02-02', 'HATCHBACK', 'Honda', 'Honda City 1.5 New City E MT'),
(4, '2020-03-21', 'SEDAN', 'Toyota', 'All New Vios 1.5 G CVT'),
(5, '2020-03-24', 'SPORT ', 'Toyota', 'Supra A40'),
(6, '2020-04-15', 'STATION WAGON', 'BMW', 'E30'),
(7, '2020-04-16', 'LCGC', 'Daihatsu', '1.0 D MT 2022'),
(8, '2020-05-27', 'DOUBLE CABIN', 'Ford', 'XL 2.2L MT'),
(9, '2020-05-25', 'OFF ROAD', 'Suzuki', 'Kotrik LJ50'),
(10, '2020-08-27', 'SUV', 'Suzuki', 'JLX 2.0');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_peminjam`
--
ALTER TABLE `data_peminjam`
  ADD PRIMARY KEY (`id_peminjam`);

--
-- Indeks untuk tabel `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `id_mobil` (`id_mobil`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`tipe_mobil`),
  ADD KEY `id_mobil` (`id_mobil`);

--
-- Indeks untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`no`),
  ADD KEY `id_peminjam` (`id_peminjam`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
