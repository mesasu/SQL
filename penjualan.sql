-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2024 pada 03.34
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
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `stok` smallint(6) NOT NULL,
  `harga` float NOT NULL,
  `persen_laba` float NOT NULL DEFAULT 5,
  `diskon` float NOT NULL DEFAULT 0,
  `id_jenis_brg` tinyint(4) NOT NULL,
  `id_suplier` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama`, `stok`, `harga`, `persen_laba`, `diskon`, `id_jenis_brg`, `id_suplier`) VALUES
('B001', 'Chitato', 201, 3500, 5, 10, 1, 'S001'),
('B002', 'Cheetos', 101, 2850, 3, 10, 1, 'S001'),
('B003', 'Sprite', 126, 1650, 7, 8, 2, 'S003'),
('B004', 'Taro', 121, 2300, 6, 10, 1, 'S001'),
('B005', 'Fanta', 81, 1450, 6, 7, 2, 'S003'),
('B006', 'Sapu', 51, 2375, 0, 0, 4, 'S006'),
('B007', 'Kain Pel', 61, 2800, 0, 0, 4, 'S007'),
('B008', 'Coca Cola', 57, 1575, 3, 8, 2, 'S008'),
('B009', 'Seven Up', 66, 1850, 4, 8, 2, 'S008'),
('B010', 'Pepsi', 90, 1750, 6, 8, 2, 'S001'),
('B011', 'Telepon Panasonic', 76, 230000, 8, 0, 3, 'S004'),
('B012', 'Televisi Sharp', 31, 1400120, 7, 0, 3, 'S005'),
('B013', 'Ember', 84, 13750, 0, 0, 4, 'S006');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `kode_transaksi` char(4) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jumlah` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`kode_transaksi`, `id_barang`, `jumlah`) VALUES
('J001', 'B001', 5),
('J001', 'B002', 2),
('J001', 'B003', 3),
('J002', 'B001', 2),
('J003', 'B001', 3),
('J003', 'B005', 2),
('J004', 'B004', 5),
('J004', 'B007', 4),
('J004', 'B008', 2),
('J005', 'B011', 1),
('J005', 'B013', 4),
('J006', 'B006', 3),
('J007', 'B001', 3),
('J007', 'B008', 2),
('J008', 'B001', 2),
('J008', 'B004', 2),
('J008', 'B008', 5),
('J009', 'B001', 3),
('J009', 'B006', 4),
('J010', 'B013', 2),
('J011', 'B001', 2),
('J011', 'B002', 4),
('J013', 'B002', 4),
('J013', 'B008', 4),
('J014', 'B002', 2),
('J014', 'B006', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis_brg` tinyint(4) NOT NULL,
  `nama_jenis_brg` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis_brg`, `nama_jenis_brg`) VALUES
(1, 'Snack'),
(2, 'Minuman'),
(3, 'Elektronik'),
(4, 'Alat Pembersih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis_kelamin` enum('P','W') NOT NULL DEFAULT 'P',
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `gaji` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `jenis_kelamin`, `alamat`, `telepon`, `tgl_lahir`, `gaji`) VALUES
('K001', 'Tuti', 'W', 'Jl. Kenanga No.8', '08155601135', '1984-02-13', 725069),
('K002', 'Siti', 'W', 'Jl. Mawar No.36B', '085868426728', '1983-08-29', 900269),
('K003', 'Endang', 'W', 'Jl. Anggrek No.1', '087811121097', '1982-11-02', 525000),
('K004', 'Yuli', 'W', 'Jl. Melati No.19', '081327934634', '1980-06-03', 622349),
('K005', 'Yola', 'W', 'Jl. Melati No. 80', '081328305938', '1983-09-11', 425600),
('K006', 'Lisa', 'W', 'Jl. Kamboja No. 11', '081572244100', '1980-05-02', 731000),
('K007', 'Hasan', 'P', 'Jl. Bungaku No. 7', '08123476772', '1978-10-06', 725800),
('K008', 'Herry', 'P', 'Jl. Bungamu No. 8B', '08125434789', '1982-03-26', 715100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis_kelamin` enum('P','W') NOT NULL DEFAULT 'P',
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_pelanggan` enum('G','S') NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `jenis_kelamin`, `alamat`, `telepon`, `tgl_lahir`, `jenis_pelanggan`) VALUES
('P001', 'Andi', 'P', 'Jl. Sukarno Hatta No.80', '08159132629', '1984-07-16', 'S'),
('P002', 'Susanto', 'P', 'Jl. P. Sudirman No 9', '08189596566', '1983-07-11', 'G'),
('P003', 'Susanti', 'P', 'Jl. Hayam Wuruk No.9A', '08171122222', '1982-08-02', 'G'),
('P004', 'Anton', 'P', 'Jl. Kebon Jeruk No.9B', '08171122223', '1980-06-12', 'S'),
('P005', 'Bobby', 'P', 'Jl. Kebon Sirih No. 80', '081310202326', '1983-05-01', 'G'),
('P006', 'Charles', 'P', 'Jl. P. Diponegoro No. 89', '081399919232', '1980-04-12', 'G'),
('P007', 'Merry', 'W', 'Jl. Kaliurang KM. 6 No. 80', '08125656989', '1978-05-16', 'G'),
('P009', 'Andi Ikhsan', 'P', 'Jl. Makasar 13', '08164228112', '1969-07-19', 'G'),
('P011', 'Debimpri', 'P', 'Jl. Balikpapan No.8', '0858732620', '1975-03-11', 'G'),
('P012', 'Hardiansyah', 'P', 'Jl. Bondowoso No.95', NULL, '1970-12-08', 'G'),
('P013', 'Ibrahim', 'P', 'Jl. Kacer 2 No.19', NULL, '1974-06-05', 'S'),
('P015', 'Adita Putri', 'P', ' Jl. Giri Loka 3 No.28', '08164622383', '1988-02-02', 'S');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplier`
--

CREATE TABLE `suplier` (
  `id_suplier` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `suplier`
--

INSERT INTO `suplier` (`id_suplier`, `nama`, `alamat`, `telepon`, `email`) VALUES
('S001', 'Pungkas Mandiri', 'Jl. Merapi No.212', '08122848418', 'pt_puma@puma.com'),
('S002', 'Djati Internusa', 'Jl. Semeru No.44', '081328139050', ''),
('S003', 'Sabar Subur', 'Jl. Galunggung No.66', '08157984898', ''),
('S004', 'Kiat Sejahtera', 'Jl. Sutami No.545', '081931771735', 'sejahtera.kiat@yahoo.co.id'),
('S005', 'Bersemi Kembali', 'Jl. Sigura-gura No. 7A', '081328171718', ''),
('S006', 'Isaku Niki', 'Jl. Kawi No. 27', '08126702381', 'yoiki_isakudab@gmail.com'),
('S007', 'Indo Mandiri', 'Jl. Muria No. 34B', '081914057581', 'mandirindo@gomandiri.org'),
('S008', 'Karya Indah', 'Jl. Merapi No. 35B', '081328084248', ''),
('S009', 'Dapur Ngepul', 'Jl. Dapurmu No.666', '08122855666', ''),
('S010', 'Patmo', 'Jl. Perjuangan No.45', '08122954545', ''),
('S011', 'Sridewi', 'Jl. Goa Selarong No.2', '0817565656', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` char(4) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `id_pelanggan` char(4) NOT NULL,
  `id_karyawan` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `tgl_transaksi`, `id_pelanggan`, `id_karyawan`) VALUES
('J001', '2006-05-05 11:30:55', 'P001', 'K001'),
('J002', '2006-05-08 10:10:05', 'P002', 'K002'),
('J003', '2006-05-12 10:45:12', 'P001', 'K002'),
('J004', '2006-05-15 17:57:09', 'P003', 'K004'),
('J005', '2006-05-16 18:01:31', 'P004', 'K005'),
('J006', '2006-05-18 16:42:41', 'P002', 'K001'),
('J007', '2006-05-20 11:31:13', 'P005', 'K002'),
('J008', '2006-05-22 10:30:05', 'P006', 'K003'),
('J009', '2006-05-24 20:19:19', 'P006', 'K004'),
('J010', '2006-05-29 20:39:46', 'P007', 'K005'),
('J011', '2006-06-02 19:16:01', 'P006', 'K001'),
('J013', '2006-06-10 14:38:11', 'P007', 'K003'),
('J014', '2006-06-12 13:10:52', 'P006', 'K004'),
('J017', '2022-10-04 08:32:14', 'P001', 'K003'),
('J018', '2022-10-04 08:32:14', 'P001', 'K003');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_jenis_brg` (`id_jenis_brg`),
  ADD KEY `id_suplier` (`id_suplier`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`kode_transaksi`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis_brg`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis_brg` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_jenis_brg`) REFERENCES `jenis_barang` (`id_jenis_brg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_suplier`) REFERENCES `suplier` (`id_suplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
