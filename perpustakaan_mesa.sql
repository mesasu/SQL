-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Jul 2023 pada 06.02
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
-- Database: `perpustakaan_mesa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(10) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `kode_anggota`, `nama_anggota`, `pekerjaan`, `alamat`, `no_telp`) VALUES
(134, 'A0134', 'Fawrass', 'Belum bekerja', 'Wirosaban', '0874261868'),
(219, 'A0121', 'Ian', 'Wirausaha', 'Bantul', '0872352537'),
(221, 'A0221', 'Dayat_Hidayat', 'Wirausaha', 'Kota gede', '0873135663'),
(421, 'A0313', 'Ahmad', 'Pilot', 'Bantul', '0874125151'),
(973, 'A0973', 'AGUS', 'Belum Bekerja', 'Bantul', '0873258998');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(10) NOT NULL,
  `kode_buku` int(10) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `tahun_terbit` text NOT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `kode_buku`, `judul_buku`, `tahun_terbit`, `stock`) VALUES
(2356, 84, 'A_Guide_Book_To_Slow_Down_Your_Life', '2022', 1),
(4234, 67, 'Great_At_Work', '2022', 2),
(4238, 51, 'Detektif_Conan_102', '2023', 1),
(4267, 57, 'Catatan_Kronik', '2022', 1),
(9653, 15, 'The_Power_Of_Thinking_Out_Of_The_Box', '2022', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_anggota` int(10) NOT NULL,
  `Nama_Peminjam` varchar(50) NOT NULL,
  `Masa_Peminjaman` char(10) NOT NULL,
  `Jumlah_Buku` int(5) NOT NULL,
  `Waktu_Peminjaman` text NOT NULL,
  `Waktu_Dikembalikan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_anggota`, `Nama_Peminjam`, `Masa_Peminjaman`, `Jumlah_Buku`, `Waktu_Peminjaman`, `Waktu_Dikembalikan`) VALUES
(134, 'AGUS', '7 Hari', 2, '10 April 2023', '17 April 2023'),
(219, 'ian', '7 Hari', 1, '2 April 2023', '9 April 2023'),
(221, 'Dayat Hidayat', '7 Hari', 2, '13 Maret 2023', '20 Maret 2023'),
(421, 'Fawrass', '7 Hari', 1, '15 Maret 2023', '22 Maret 2023'),
(973, 'Ahmad', '7 Hari', 1, '11 April 2023', '18 April 2023');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `terlambat` char(10) NOT NULL,
  `donatur` text NOT NULL,
  `hilang` int(5) NOT NULL,
  `rusak` int(10) NOT NULL,
  `total` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `nama`, `terlambat`, `donatur`, `hilang`, `rusak`, `total`) VALUES
(134, 'AGUS', '0 HARI', '15000', 0, 0, '15000'),
(219, 'Ian', '1 HARI', '10000', 0, 0, '10500'),
(221, 'Dayat Hidayat', '3 HARI', '2000', 0, 0, '3500'),
(421, 'Fawrass', '3 HARI', '5000', 0, 0, '6500'),
(973, 'Ahmad', '2 HARI', '5000', 0, 0, '6000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` int(5) NOT NULL,
  `nama_petugas` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `nama_petugas`, `alamat`, `no_telp`) VALUES
(29, 'Elang', 'Bantul', '087474787733'),
(32, 'Alvin', 'Bantul', '087080546753'),
(53, 'Syafiq', 'Wonosari', '087967465632'),
(56, 'Dzaky', 'Kota gede', '087563737858'),
(86, 'Torvald', 'Bantul', '087141466889');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=974;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9654;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_anggota` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=974;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=974;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
