-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2020 at 03:59 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siball`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_booking`
--

CREATE TABLE `tb_booking` (
  `id_booking` varchar(6) NOT NULL,
  `id_futsal` int(2) NOT NULL,
  `id_lapangan` int(2) NOT NULL,
  `id_cust` int(3) NOT NULL,
  `waktu_mulai` datetime NOT NULL,
  `waktu_berakhir` datetime NOT NULL,
  `total_durasi` int(2) NOT NULL,
  `total_harga` int(7) NOT NULL,
  `status` enum('DP','Lunas','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_cust` int(3) NOT NULL,
  `nama_cust` varchar(15) NOT NULL,
  `alamat_cust` varchar(30) NOT NULL,
  `telp_cust` varchar(15) NOT NULL,
  `username_cust` varchar(10) NOT NULL,
  `email_cust` varchar(35) NOT NULL,
  `password_cust` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`id_cust`, `nama_cust`, `alamat_cust`, `telp_cust`, `username_cust`, `email_cust`, `password_cust`) VALUES
(1, 'Wildhan Eka', 'Perum Tegal Besar Permai 1', '081775105588', 'wildhan04', 'wildhan.simdig04@gmail.com', 'wildhangan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_futsal`
--

CREATE TABLE `tb_futsal` (
  `id_futsal` int(2) NOT NULL,
  `nama_futsal` varchar(20) NOT NULL,
  `alamat_futsal` varchar(30) NOT NULL,
  `telp_futsal` varchar(15) NOT NULL,
  `username_futsal` varchar(15) NOT NULL,
  `email_futsal` varchar(25) NOT NULL,
  `password_futsal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_futsal`
--

INSERT INTO `tb_futsal` (`id_futsal`, `nama_futsal`, `alamat_futsal`, `telp_futsal`, `username_futsal`, `email_futsal`, `password_futsal`) VALUES
(1, 'King Futsal', 'Jl. KH. Shidiq', '08134314123', 'kingfuts01', 'kingfutsaljbr@gmail.com', 'kingfutsal'),
(2, 'Zona Futsal', 'Jl. Tidar No. 17', '08912418714125', 'zonafuts01', 'zonafutsaljbr@gmail.com', 'zonafutsal');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lapangan`
--

CREATE TABLE `tb_lapangan` (
  `id_lapangan` int(2) NOT NULL,
  `id_futsal` int(2) NOT NULL,
  `nama_lapangan` varchar(15) NOT NULL,
  `harga_lapangan` int(7) NOT NULL,
  `foto_lapangan` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengelola`
--

CREATE TABLE `tb_pengelola` (
  `id_pengelola` int(2) NOT NULL,
  `nama_pengelola` varchar(15) NOT NULL,
  `telp_pengelola` varchar(15) NOT NULL,
  `username_pengelola` varchar(10) NOT NULL,
  `email_pengelola` varchar(35) NOT NULL,
  `password_pengelola` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengelola`
--

INSERT INTO `tb_pengelola` (`id_pengelola`, `nama_pengelola`, `telp_pengelola`, `username_pengelola`, `email_pengelola`, `password_pengelola`) VALUES
(1, 'Gabriela', '08891647813476', 'gabri108', 'gabrielacaroline88@gmail.com', 'gabriela00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_booking`
--
ALTER TABLE `tb_booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_cust`);

--
-- Indexes for table `tb_futsal`
--
ALTER TABLE `tb_futsal`
  ADD PRIMARY KEY (`id_futsal`);

--
-- Indexes for table `tb_lapangan`
--
ALTER TABLE `tb_lapangan`
  ADD PRIMARY KEY (`id_lapangan`);

--
-- Indexes for table `tb_pengelola`
--
ALTER TABLE `tb_pengelola`
  ADD PRIMARY KEY (`id_pengelola`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id_cust` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_futsal`
--
ALTER TABLE `tb_futsal`
  MODIFY `id_futsal` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_lapangan`
--
ALTER TABLE `tb_lapangan`
  MODIFY `id_lapangan` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_pengelola`
--
ALTER TABLE `tb_pengelola`
  MODIFY `id_pengelola` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
