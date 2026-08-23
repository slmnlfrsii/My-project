-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 23, 2026 at 04:44 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_semar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `password`, `created_at`, `foto`) VALUES
(5, 'Admin Toko', 'admin@gmail.com', '$2y$10$sLUuMDImnjpSAW/UDocwq.j3G5BqSS1vnCx13.0Zo/eQ8F9.hFBY6', '2025-05-27 14:42:16', 'admin_6a8a453348b39.png');

-- --------------------------------------------------------

--
-- Table structure for table `alat`
--

CREATE TABLE `alat` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text,
  `stok_awal` int NOT NULL DEFAULT '0',
  `sisa_stok` int NOT NULL DEFAULT '0',
  `harga_per_hari` int NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `alat`
--

INSERT INTO `alat` (`id`, `nama`, `deskripsi`, `stok_awal`, `sisa_stok`, `harga_per_hari`, `gambar`) VALUES
(2, 'Sepatu', 'Rady size 38-42', 20, 20, 25000, 'alat_6833d88d21beb3.67567373.jpg'),
(3, 'Tenda', 'Kapasitas 4-5 orang', 15, 14, 35000, 'alat_6833d882104f95.69314576.jpg'),
(4, 'Kompor portable', 'kompor saja', 10, 10, 10000, 'alat_6833d859125067.64690111.jpg'),
(5, 'Sleeping Bag', 'nyaman dan hangat ketika di suhu yang dingin', 10, 9, 10000, 'alat_6833d9b58a82e7.72761150.jpg'),
(6, 'Jaket ', 'nyaman di segala cuaca', 10, 10, 15000, 'alat_6833da70c0be82.39220847.jpg'),
(7, 'Gas portabel', 'isi ulang', 50, 50, 10000, 'alat_6833dbe50e61e6.98844109.jpg'),
(8, 'Kursi Lipat', 'bisa dibawa kemana saja tanpa ribet ', 10, 10, 10000, 'alat_683dd474eda5f2.74398306.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int NOT NULL,
  `id_users` int NOT NULL,
  `id_alat` int NOT NULL,
  `jumlah` int NOT NULL,
  `total_harga` int NOT NULL,
  `tanggal_ditambahkan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id`, `id_users`, `id_alat`, `jumlah`, `total_harga`, `tanggal_ditambahkan`, `nama`) VALUES
(110, 36, 8, 1, 10000, '2026-08-22 01:29:59', NULL),
(147, 30, 6, 1, 15000, '2026-08-23 20:06:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int NOT NULL,
  `id_users` int NOT NULL,
  `id_sewa` varchar(255) NOT NULL,
  `metode` varchar(50) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL,
  `jumlah_bayar` decimal(15,2) NOT NULL,
  `total_tagihan` decimal(15,2) NOT NULL,
  `status` enum('Menunggu konfirmasi','Lunas','Belum lunas','ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Menunggu konfirmasi',
  `tanggal_bayar` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_users`, `id_sewa`, `metode`, `bukti_pembayaran`, `jumlah_bayar`, `total_tagihan`, `status`, `tanggal_bayar`) VALUES
(83, 42, '151', 'Tunai', '', '10000.00', '10000.00', 'ditolak', '2026-08-23 17:13:00'),
(84, 30, '152,153,154', 'bank_bca', '1787480451_6a8ac98331a33.jpg', '10000.00', '70000.00', 'ditolak', '2026-08-23 17:20:51'),
(85, 30, '155', 'Tunai', '', '10000.00', '10000.00', 'Lunas', '2026-08-23 17:28:00'),
(86, 36, '161', 'Tunai', '', '10000.00', '35000.00', 'Belum lunas', '2026-08-23 17:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `id` int NOT NULL,
  `no_tagihan` varchar(50) DEFAULT NULL,
  `id_users` int DEFAULT NULL,
  `id_alat` int DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `total_harga` int DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `tanggal_sewa` date DEFAULT NULL,
  `durasi` int DEFAULT NULL,
  `tanggal_buat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `metode_pengambilan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Ambil Ke toko',
  `biaya_pengambilan` int NOT NULL DEFAULT '0',
  `status` enum('Menunggu pembayaran','Berlangsung','Siap di ambil','di antar','Dibatalkan','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Menunggu pembayaran',
  `tanggal_dikembalikan` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`id`, `no_tagihan`, `id_users`, `id_alat`, `nama_produk`, `total_harga`, `gambar`, `qty`, `tanggal_sewa`, `durasi`, `tanggal_buat`, `metode_pengambilan`, `biaya_pengambilan`, `status`, `tanggal_dikembalikan`) VALUES
(151, 'INV-20260823-0151', 42, 5, 'Sleeping Bag', 10000, 'alat_6833d9b58a82e7.72761150.jpg', 1, '2026-08-23', 1, '2026-08-23 10:13:31', 'Ambil Ke toko', 0, 'Dibatalkan', NULL),
(152, 'INV-20260823-0152', 30, 2, 'Sepatu', 25000, 'alat_6833d88d21beb3.67567373.jpg', 1, '2026-08-23', 1, '2026-08-23 10:19:36', 'Ambil Ke toko', 0, 'Dibatalkan', NULL),
(155, 'INV-20260823-0153', 30, 7, 'Gas portabel', 10000, 'alat_6833dbe50e61e6.98844109.jpg', 1, '2026-08-23', 1, '2026-08-23 10:28:46', 'Ambil Ke toko', 0, 'selesai', '2026-08-23 19:05:22'),
(156, 'INV-20260823-0153', 30, 6, 'Jaket ', 15000, 'alat_6833da70c0be82.39220847.jpg', 1, '2026-08-23', 1, '2026-08-23 10:28:46', 'Ambil Ke toko', 0, 'selesai', '2026-08-23 19:05:22'),
(157, 'INV-20260823-0153', 30, 4, 'Kompor portable', 10000, 'alat_6833d859125067.64690111.jpg', 1, '2026-08-23', 1, '2026-08-23 10:28:46', 'Ambil Ke toko', 0, 'selesai', '2026-08-23 19:05:22'),
(158, 'INV-20260823-0153', 30, 8, 'Kursi Lipat', 10000, 'alat_683dd474eda5f2.74398306.jpg', 1, '2026-08-23', 1, '2026-08-23 10:28:46', 'Ambil Ke toko', 0, 'selesai', '2026-08-23 19:05:22'),
(159, 'INV-20260823-0153', 30, 2, 'Sepatu', 25000, 'alat_6833d88d21beb3.67567373.jpg', 1, '2026-08-23', 1, '2026-08-23 10:28:46', 'Ambil Ke toko', 0, 'selesai', '2026-08-23 19:05:22'),
(160, 'INV-20260823-0160', 36, 5, 'Sleeping Bag', 10000, 'alat_6833d9b58a82e7.72761150.jpg', 1, '2026-08-23', 1, '2026-08-23 10:45:18', 'Ambil Ke toko', 0, 'Siap di ambil', '2026-08-23 19:01:26'),
(161, 'INV-20260823-0160', 36, 3, 'Tenda', 35000, 'alat_6833d882104f95.69314576.jpg', 1, '2026-08-23', 1, '2026-08-23 10:45:18', 'Ambil Ke toko', 0, 'Siap di ambil', '2026-08-23 19:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `sewa_dibatalkan`
--

CREATE TABLE `sewa_dibatalkan` (
  `id` int NOT NULL,
  `no_tagihan` varchar(50) DEFAULT NULL,
  `id_users` int DEFAULT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `durasi` int DEFAULT NULL,
  `total_harga` int DEFAULT NULL,
  `biaya_pengambilan` int DEFAULT NULL,
  `metode_pengambilan` varchar(50) DEFAULT 'Ambil Ke toko',
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal_sewa` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `dibatalkan_pada` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sewa_dibatalkan`
--

INSERT INTO `sewa_dibatalkan` (`id`, `no_tagihan`, `id_users`, `nama_produk`, `qty`, `durasi`, `total_harga`, `biaya_pengambilan`, `metode_pengambilan`, `gambar`, `tanggal_sewa`, `status`, `dibatalkan_pada`) VALUES
(54, 'INV-BATAL-0054', 3, 'Gas portabel', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833dbe50e61e6.98844109.jpg', '2025-06-06', 'Dibatalkan', '2025-06-02 08:05:06'),
(56, 'INV-BATAL-0056', 3, 'Jaket 3 layer', 1, 1, 15000, 0, 'Ambil Ke toko', 'alat_6833da70c0be82.39220847.jpg', '2025-06-13', 'Dibatalkan', '2025-06-02 11:14:44'),
(58, 'INV-BATAL-0058', 3, 'Sleeping Bag', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833d9b58a82e7.72761150.jpg', '2025-06-02', 'Dibatalkan', '2025-06-02 11:35:18'),
(59, 'INV-BATAL-0059', 9, 'Gas portabel', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833dbe50e61e6.98844109.jpg', '2025-06-05', 'Dibatalkan', '2025-06-03 10:11:19'),
(61, 'INV-BATAL-0061', 3, 'Kursi Lipat', 2, 1, 20000, 10000, 'COD', 'alat_683dd474eda5f2.74398306.jpg', '2025-06-30', 'Dibatalkan', '2025-06-30 10:57:11'),
(62, 'INV-BATAL-0062', 3, 'Gas portabel', 2, 2, 40000, 10000, 'COD', 'alat_6833dbe50e61e6.98844109.jpg', '2025-06-30', 'Dibatalkan', '2025-07-04 10:13:41'),
(68, 'INV-BATAL-0068', 42, 'Jaket ', 2, 1, 40000, 10000, 'COD', 'alat_6833da70c0be82.39220847.jpg', '2026-11-22', 'Dibatalkan', '2026-08-22 05:39:31'),
(69, NULL, 30, 'Sepatu', 1, 1, 25000, 10000, 'COD', 'alat_6833d88d21beb3.67567373.jpg', '2026-08-22', 'Dibatalkan', '2026-08-22 14:16:09'),
(70, NULL, 30, 'Gas portabel', 1, 2, 20000, 10000, 'COD', 'alat_6833dbe50e61e6.98844109.jpg', '2026-08-22', 'Dibatalkan', '2026-08-22 14:56:22'),
(71, NULL, 30, 'Kompor portable', 10, 2, 200000, 0, 'COD', 'alat_6833d859125067.64690111.jpg', '2026-08-22', 'Dibatalkan', '2026-08-22 14:56:22'),
(72, NULL, 30, 'Kursi Lipat', 1, 2, 30000, 10000, 'COD', 'alat_683dd474eda5f2.74398306.jpg', '2026-08-22', 'Dibatalkan', '2026-08-22 16:18:41'),
(73, NULL, 30, 'Sleeping Bag', 1, 2, 20000, 0, 'COD', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-22', 'Dibatalkan', '2026-08-22 16:18:41'),
(74, 'INV-20260822-0110', 42, 'Sleeping Bag', 1, 2, 10000, 0, 'COD', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-22', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 00:05:03'),
(75, NULL, 30, 'Kursi Lipat', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_683dd474eda5f2.74398306.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 00:25:27'),
(76, NULL, 30, 'Sepatu', 1, 1, 25000, 0, 'Ambil Ke toko', 'alat_6833d88d21beb3.67567373.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 00:25:27'),
(77, 'INV-20260823-0117', 36, 'Jaket ', 1, 1, 15000, 0, 'Ambil Ke toko', 'alat_6833da70c0be82.39220847.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 00:36:05'),
(78, 'INV-20260823-0118', 36, 'Kompor portable', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833d859125067.64690111.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 00:36:05'),
(79, 'INV-20260823-0119', 36, 'Kursi Lipat', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_683dd474eda5f2.74398306.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 00:36:05'),
(80, 'INV-20260823-0120', 36, 'Sepatu', 1, 1, 25000, 0, 'Ambil Ke toko', 'alat_6833d88d21beb3.67567373.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 00:36:05'),
(81, 'INV-20260823-0121', 36, 'Sleeping Bag', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 00:36:06'),
(82, 'INV-20260823-0122', 36, 'Tenda', 1, 1, 35000, 0, 'Ambil Ke toko', 'alat_6833d882104f95.69314576.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 00:36:06'),
(83, 'INV-20260823-0125', 30, 'Kursi Lipat', 4, 1, 50000, 10000, 'COD', 'alat_683dd474eda5f2.74398306.jpg', '2026-09-11', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 04:08:30'),
(84, 'INV-20260823-0126', 30, 'Gas portabel', 11, 1, 110000, 0, 'COD', 'alat_6833dbe50e61e6.98844109.jpg', '2026-09-11', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 04:08:30'),
(88, 'INV-20260823-0131', 30, 'Sepatu', 1, 2, 50000, 0, 'COD', 'alat_6833d88d21beb3.67567373.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 05:04:03'),
(89, 'INV-20260823-0130', 30, 'Sleeping Bag', 2, 2, 40000, 0, 'COD', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 05:04:25'),
(90, 'INV-20260823-0129', 30, 'Jaket ', 1, 2, 40000, 10000, 'COD', 'alat_6833da70c0be82.39220847.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 05:04:30'),
(91, 'INV-20260823-0133', 42, 'Kompor portable', 2, 2, 40000, 0, 'COD', 'alat_6833d859125067.64690111.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 05:20:23'),
(92, NULL, 42, 'Tenda', 2, 2, 150000, 10000, 'COD', 'alat_6833d882104f95.69314576.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 05:20:23'),
(93, 'INV-20260823-0134', 42, 'Gas portabel', 1, 1, 20000, 10000, 'COD', 'alat_6833dbe50e61e6.98844109.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 05:29:28'),
(94, 'INV-20260823-0136', 42, 'Kompor portable', 1, 1, 10000, 0, 'COD', 'alat_6833d859125067.64690111.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 05:45:53'),
(95, 'INV-20260823-0137', 42, 'Sepatu', 1, 1, 25000, 0, 'COD', 'alat_6833d88d21beb3.67567373.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 05:45:53'),
(96, 'INV-20260823-0135', 42, 'Sleeping Bag', 2, 1, 30000, 10000, 'COD', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 05:46:25'),
(97, 'INV-20260823-0139', 42, 'Gas portabel', 1, 2, 10000, 0, 'Ambil Ke toko', 'alat_6833dbe50e61e6.98844109.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 06:12:27'),
(98, 'INV-20260823-0140', 42, 'Sleeping Bag', 1, 2, 20000, 0, 'Ambil Ke toko', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 06:12:27'),
(99, 'INV-20260823-0138', 42, 'Kursi Lipat', 1, 2, 20000, 0, 'Ambil Ke toko', 'alat_683dd474eda5f2.74398306.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 06:12:40'),
(109, 'INV-20260823-0150', 42, 'Gas portabel', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833dbe50e61e6.98844109.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 10:18:34'),
(110, 'INV-20260823-0151', 42, 'Sleeping Bag', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 10:18:57'),
(111, 'INV-20260823-0152', 30, 'Sleeping Bag', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 10:21:37'),
(112, 'INV-20260823-0152', 30, 'Tenda', 1, 1, 35000, 0, 'Ambil Ke toko', 'alat_6833d882104f95.69314576.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 10:21:37'),
(113, 'INV-20260823-0152', 30, 'Sepatu', 1, 1, 25000, 0, 'Ambil Ke toko', 'alat_6833d88d21beb3.67567373.jpg', '2026-08-23', 'Dibatalkan', '2026-08-23 10:28:24'),
(120, 'INV-20260823-0162', 30, 'Gas portabel', 1, 1, 10000, 0, 'Ambil Ke toko', 'alat_6833dbe50e61e6.98844109.jpg', '2026-08-23', 'Dibatalkan (Otomatis Kadaluarsa)', '2026-08-23 13:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `alamat` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `no_hp`, `created_at`, `alamat`, `foto`) VALUES
(30, 'cek', 'cek@gmail.com', '$2y$10$SXddxjJRAdmaS07fcKyEFOtUVx74am4RWRpiLLMCDlEpE0CyAKrLG', '098766554', '2026-05-02 23:36:35', 'kp.cibagogog', 'Screenshot 2026-05-02 220210.png'),
(36, 'armagedhon', 'armagedhon@gmail.com', '$2y$10$Yi/oNSQh4mAzMaKwYxcydODZsoHAYb41u2Nv1zV.D2onmi47CDA.K', '086796546', '2026-05-02 23:36:13', 'kp.kubang koak', NULL),
(42, 'Salman_Af', 'salmanaf083@gmail.com', '$2y$10$nN.SUn4DgUKppRfOJK91..9cA5gOJzw13i2rSoexo716IPlCLqTuO', '+62885672231', '2026-08-21 22:29:33', 'jnhbgvfdsw', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_alat` (`id_alat`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pembayaran_users` (`id_users`),
  ADD KEY `fk_pembayaran_sewa` (`id_sewa`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sewa_dibatalkan`
--
ALTER TABLE `sewa_dibatalkan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `alat`
--
ALTER TABLE `alat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `sewa_dibatalkan`
--
ALTER TABLE `sewa_dibatalkan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_alat`) REFERENCES `alat` (`id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_users` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
