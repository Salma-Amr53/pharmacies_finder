-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2026 at 02:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `medicine_name` varchar(150) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `purchase_date` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `medicine_name`, `branch`, `price`, `quantity`, `purchase_date`, `image`) VALUES
(3, 1, 'Panadol Advance 500mg', 'Dokki', 49.00, 1, '2026-07-30 11:02:06', 'panadoladvance.jpg'),
(4, 1, 'Panadol Extra', 'Ismailia', 45.00, 1, '2026-07-30 11:02:53', 'panadol.jpg'),
(5, 1, 'Panadol Extra', 'Nasr City', 47.00, 1, '2026-07-30 13:46:53', 'panadol.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `phone` varchar(20) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `date`, `phone`, `profile_pic`, `full_name`, `address`, `date_of_birth`) VALUES
(1, 'lojain', 'lojain@yasser', '123', '2026-07-30 08:07:26', '01000000000', 'user_1_1785411528.webp', 'lojain yasser nou', 'Cairo, Egypt', '2005-09-13'),
(2, 'Ahmed Hassan', 'ahmed.hassan@example.com', 'Ahmed@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(3, 'Sara Mohamed', 'sara.mohamed@example.com', 'Sara@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(4, 'Omar Ali', 'omar.ali@example.com', 'Omar@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(5, 'Nour Eldin', 'nour.eldin@example.com', 'Nour@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(6, 'Mariam Samir', 'mariam.samir@example.com', 'Mariam@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(7, 'Youssef Adel', 'youssef.adel@example.com', 'Youssef@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(8, 'Fatma Khaled', 'fatma.khaled@example.com', 'Fatma@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(9, 'Karim Ibrahim', 'karim.ibrahim@example.com', 'Karim@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(10, 'Salma Tarek', 'salma.tarek@example.com', 'Salma@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(11, 'Mostafa Nabil', 'mostafa.nabil@example.com', 'Mostafa@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(12, 'Dina Hossam', 'dina.hossam@example.com', 'Dina@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(13, 'Mahmoud Fathy', 'mahmoud.fathy@example.com', 'Mahmoud@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(14, 'Jana Wael', 'jana.wael@example.com', 'Jana@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(15, 'Hassan Magdy', 'hassan.magdy@example.com', 'Hassan@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(16, 'Reem Osama', 'reem.osama@example.com', 'Reem@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(17, 'Mohamed Atef', 'mohamed.atef@example.com', 'Mohamed@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(18, 'Laila Amr', 'laila.amr@example.com', 'Laila@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(19, 'Ziad Sherif', 'ziad.sherif@example.com', 'Ziad@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(20, 'Hoda Essam', 'hoda.essam@example.com', 'Hoda@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL),
(21, 'Amr Yasser', 'amr.yasser@example.com', 'Amr@123', '0000-00-00 00:00:00', '', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
