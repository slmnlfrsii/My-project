-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 25, 2026 at 03:28 PM
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
(5, 'Admin semar', 'admin@gmail.com', '$2y$10$sLUuMDImnjpSAW/UDocwq.j3G5BqSS1vnCx13.0Zo/eQ8F9.hFBY6', '2025-05-27 14:42:16', 'admin_6a8a453348b39.png');

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
(3, 'Tenda', 'Kapasitas 4-5 orang', 15, 15, 35000, 'alat_6833d882104f95.69314576.jpg'),
(4, 'Kompor portable', 'kompor saja', 10, 10, 10000, 'alat_6833d859125067.64690111.jpg'),
(5, 'Sleeping Bag', 'nyaman dan hangat ketika di suhu yang dingin', 10, 10, 10000, 'alat_6833d9b58a82e7.72761150.jpg'),
(6, 'Jaket ', 'nyaman di segala cuaca', 10, 10, 15000, 'alat_6833da70c0be82.39220847.jpg'),
(7, 'Gas portabel', 'isi ulang', 50, 49, 10000, 'alat_6833dbe50e61e6.98844109.jpg'),
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

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(100) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `otp`, `created_at`, `expires_at`) VALUES
(7, 'salmanaf083@gmail.com', 'b9593086ba4d0f438c62c4f1e5baff8004b68ddb4c490efc4f7aee66fc36a12c', '888008', '2026-08-25 13:36:21', '2026-08-25 13:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int NOT NULL,
  `id_users` int NOT NULL,
  `id_admin` int DEFAULT NULL,
  `id_sewa` varchar(255) NOT NULL,
  `metode` varchar(50) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL,
  `jumlah_bayar` decimal(15,2) NOT NULL,
  `total_tagihan` decimal(15,2) NOT NULL,
  `status` enum('Menunggu konfirmasi','Lunas','Belum lunas','ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Menunggu konfirmasi',
  `tanggal_bayar` datetime DEFAULT CURRENT_TIMESTAMP,
  `tanggal_konfirmasi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_users`, `id_admin`, `id_sewa`, `metode`, `bukti_pembayaran`, `jumlah_bayar`, `total_tagihan`, `status`, `tanggal_bayar`, `tanggal_konfirmasi`) VALUES
(362, 100002, 5, '516,517,518,519,520', 'bank_bca', '1787660103_6a8d874787a6c.png', '70000.00', '70000.00', 'Lunas', '2026-08-25 19:15:03', '2026-08-25 19:15:23'),
(363, 100003, 5, '521', 'bank_bri', '1787660391_6a8d8867c04c1.png', '10000.00', '20000.00', 'Belum lunas', '2026-08-25 19:19:51', '2026-08-25 19:20:37'),
(364, 100002, NULL, '522,523,524,525', 'ewallet_dana', '1787668511_6a8da81f99718.png', '10000.00', '120000.00', 'ditolak', '2026-08-25 21:35:11', NULL);

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
(516, 'INV-20260825-0001', 100002, 2, 'Sepatu', 25000, 'alat_6833d88d21beb3.67567373.jpg', 1, '2026-08-25', 1, '2026-08-25 12:14:40', 'Ambil Ke toko', 0, 'selesai', '2026-08-25 21:09:07'),
(517, 'INV-20260825-0001', 100002, 5, 'Sleeping Bag', 10000, 'alat_6833d9b58a82e7.72761150.jpg', 1, '2026-08-25', 1, '2026-08-25 12:14:40', 'Ambil Ke toko', 0, 'selesai', '2026-08-25 21:09:07'),
(518, 'INV-20260825-0001', 100002, 6, 'Jaket ', 15000, 'alat_6833da70c0be82.39220847.jpg', 1, '2026-08-25', 1, '2026-08-25 12:14:40', 'Ambil Ke toko', 0, 'selesai', '2026-08-25 21:09:07'),
(519, 'INV-20260825-0001', 100002, 7, 'Gas portabel', 10000, 'alat_6833dbe50e61e6.98844109.jpg', 1, '2026-08-25', 1, '2026-08-25 12:14:40', 'Ambil Ke toko', 0, 'selesai', '2026-08-25 21:09:07'),
(520, 'INV-20260825-0001', 100002, 8, 'Kursi Lipat', 10000, 'alat_683dd474eda5f2.74398306.jpg', 1, '2026-08-25', 1, '2026-08-25 12:14:40', 'Ambil Ke toko', 0, 'selesai', '2026-08-25 21:09:07'),
(521, 'INV-20260825-0521', 100003, 7, 'Gas portabel', 20000, 'alat_6833dbe50e61e6.98844109.jpg', 1, '2026-08-25', 1, '2026-08-25 12:19:09', 'COD', 10000, 'di antar', NULL);

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
(288, 'INV-20260825-0522', 100002, 'Kursi Lipat', 1, 2, 20000, 0, 'Ambil Ke toko', 'alat_683dd474eda5f2.74398306.jpg', '2026-08-25', 'Batal Otomatis', '2026-08-25 15:23:10'),
(289, 'INV-20260825-0522', 100002, 'Jaket ', 1, 2, 30000, 0, 'Ambil Ke toko', 'alat_6833da70c0be82.39220847.jpg', '2026-08-25', 'Batal Otomatis', '2026-08-25 15:23:10'),
(290, 'INV-20260825-0522', 100002, 'Sleeping Bag', 1, 2, 20000, 0, 'Ambil Ke toko', 'alat_6833d9b58a82e7.72761150.jpg', '2026-08-25', 'Batal Otomatis', '2026-08-25 15:23:10'),
(291, 'INV-20260825-0522', 100002, 'Sepatu', 1, 2, 50000, 0, 'Ambil Ke toko', 'alat_6833d88d21beb3.67567373.jpg', '2026-08-25', 'Batal Otomatis', '2026-08-25 15:23:10');

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
(100000, 'Salman_Af', 'salmanaf083@gmail.com', '$2y$10$eNPjsOcrT0nfObJ3uBJnNOhCSvzCCvkmt7t6RVoKlDccKqvQWpmfy', '+62885672231', '2026-08-24 12:27:59', 'salmanaf083@gmail.com', NULL),
(100001, 'cek', 'cek@gmail.com', '$2y$10$mvMFe7W3Ml029TVeJripWeQYoRTvLq3dvF7BgaW7mbLfnybSXa4gm', '876543234567', '2026-08-24 18:05:48', 'kolilll7', NULL),
(100002, 'fiqri', 'fiqri@gmail.com', '$2y$10$KXFa65qrD.YiK7AO61fWXuHiqjh48TINdPGMH4NcgFasBtBOYlunO', '098765434567', '2026-08-25 06:39:09', 'kp.serang', NULL),
(100003, 'muhammad miftah khoirul mukharom', 'mif@gmail.com', '$2y$10$PuWbjmMf4QmbVBIqJSgBOOqdhZ/k9HERK7wYiBiGGxHobgjGE4Ed6', '098765434567', '2026-08-25 12:18:28', 'kp.jareged', NULL);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `token` (`token`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=526;

--
-- AUTO_INCREMENT for table `sewa_dibatalkan`
--
ALTER TABLE `sewa_dibatalkan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100004;

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
