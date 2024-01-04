-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2024 pada 03.24
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
-- Database: `hokben`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas_toko`
--

CREATE TABLE `identitas_toko` (
  `id_toko` int(11) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `alamat_toko` varchar(255) NOT NULL,
  `no_telp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `identitas_toko`
--

INSERT INTO `identitas_toko` (`id_toko`, `nama_toko`, `alamat_toko`, `no_telp`) VALUES
(1, 'HokBen', 'Galaxy Mall', '1-500-505');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(255) NOT NULL,
  `alamat_karyawan` varchar(255) NOT NULL,
  `no_telp` text NOT NULL,
  `Shift` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `alamat_karyawan`, `no_telp`, `Shift`) VALUES
(1, 'Joko', 'Calukan', '08547421894', '09.00 - 13.00'),
(2, 'Dayat', 'Rajan', '08721673814', '13.00 - 18.00'),
(3, 'Agus', 'Sudimoro', '08437618921', '18.00 - 21.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `makanan`
--

CREATE TABLE `makanan` (
  `id_makanan` int(11) NOT NULL,
  `nama_makanan` varchar(255) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `harga_makanan` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `makanan`
--

INSERT INTO `makanan` (`id_makanan`, `nama_makanan`, `id_toko`, `harga_makanan`) VALUES
(1, 'Chicken Tofu', 1, '16000'),
(2, 'Shrimp Dumpling', 1, '16000'),
(3, 'Aqua Pet', 1, '7000'),
(4, 'Chicken Teriyaki', 1, '42000'),
(5, 'Paket B', 1, '39000'),
(6, 'Super Bowl Beef Teriyaki + Tori Ball', 1, '38000'),
(7, 'CHICKEN KATSU', 1, '20000'),
(8, 'SPICY RAMEN REGULER', 1, '38000'),
(9, 'Paket Blackpepper Miso Chicken', 1, '38000'),
(10, 'TORI PAITAN RAMEN LARGE', 1, '45000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `Pajak_restoran` text NOT NULL,
  `sub_total` decimal(11,0) NOT NULL,
  `total_harga` decimal(10,0) NOT NULL,
  `bayar` decimal(10,0) NOT NULL,
  `Kembalian` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `Pajak_restoran`, `sub_total`, `total_harga`, `bayar`, `Kembalian`) VALUES
(1, '10%', '130457', '143500', '143500', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `Id_makanan` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `tanggal_tranksaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_transaksi`, `id_toko`, `Id_makanan`, `id_karyawan`, `tanggal_tranksaksi`) VALUES
(1, 1, 1, 1, 1, '2024-02-17'),
(2, 1, 1, 2, 1, '2024-02-17'),
(3, 1, 1, 3, 1, '2024-02-17'),
(4, 1, 1, 4, 1, '2024-02-17'),
(5, 1, 1, 5, 1, '2024-02-17');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `identitas_toko`
--
ALTER TABLE `identitas_toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id_makanan`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `Id_makanan` (`Id_makanan`),
  ADD KEY `id_toko` (`id_toko`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `identitas_toko`
--
ALTER TABLE `identitas_toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id_makanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `makanan`
--
ALTER TABLE `makanan`
  ADD CONSTRAINT `makanan_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `identitas_toko` (`id_toko`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`Id_makanan`) REFERENCES `makanan` (`id_makanan`),
  ADD CONSTRAINT `penjualan_ibfk_5` FOREIGN KEY (`id_toko`) REFERENCES `identitas_toko` (`id_toko`),
  ADD CONSTRAINT `penjualan_ibfk_6` FOREIGN KEY (`id_transaksi`) REFERENCES `pembayaran` (`id_pembayaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
