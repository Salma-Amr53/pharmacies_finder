-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2026 at 11:24 AM
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
(5, 1, 'Panadol Extra', 'Nasr City', 47.00, 1, '2026-07-30 13:46:53', 'panadol.jpg'),
(6, 1, 'Panadol Extra', 'Nasr City', 47.00, 1, '2026-08-04 11:51:13', 'panadol.jpg'),
(7, 23, 'Panadol Extra', 'Dokki', 46.00, 1, '2026-08-04 11:52:01', 'panadol.jpg'),
(8, 16, 'Cataflam 50mg', 'Ismailia', 60.00, 1, '2026-08-05 01:20:46', 'cataflam.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `review`, `created_at`) VALUES
(4, 23, 'The medicine was available, and the service was excellent.', '2026-08-04 12:44:39'),
(5, 6, 'Good experience. I found the medicine easily.', '2026-08-04 13:07:45'),
(6, 10, 'The medicine was available and the price was reasonable.', '2026-08-04 13:08:18'),
(7, 14, 'This is a cool website', '2026-08-05 01:11:45');

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
(1, 'lojain', 'lojain@gmail.com', 'lojain123', '0000-00-00 00:00:00', '01000000000', 'user_1_1785411528.webp', 'Lojain Yasser Nouh', 'Cairo, Egypt', '2005-09-13'),
(2, 'Ahmed Hassan', 'ahmedhassan@gmail.com', 'ahmed123', '0000-00-00 00:00:00', '01012345678', NULL, 'Ahmed Hassan Ali', 'Giza, Egypt', '2004-02-21'),
(3, 'Sara Mohamed', 'sara.mohamed@gmail.com', 'sara123', '0000-00-00 00:00:00', '01123456789', NULL, 'Sara Mohamed Adel', 'Cairo, Egypt', '2005-06-18'),
(4, 'Omar Ali', 'omar.ali@gmail.com', 'omar123', '0000-00-00 00:00:00', '01234567890', NULL, 'Omar Ali Hassan', 'Alexandria, Egypt', '2004-11-03'),
(5, 'Nour Eldin', 'noureldin@gmail.com', 'noureldin123', '0000-00-00 00:00:00', '01098765432', NULL, 'Nour Eldin Mahmoud', 'Mansoura, Egypt', '2006-01-27'),
(6, 'Mariam Samir', 'mariam.samir@gmail.com', 'mariam123', '0000-00-00 00:00:00', '01155667788', NULL, 'Mariam Samir Ahmed', 'Cairo, Egypt', '2005-04-15'),
(7, 'Youssef Adel', 'youssef.adel@gmail.com', 'youssef123', '0000-00-00 00:00:00', '01266778899', NULL, 'Youssef Adel Ibrahim', 'Tanta, Egypt', '2004-08-30'),
(8, 'Fatma Khaled', 'fatma.khaled@gmail.com', 'fatma123', '0000-00-00 00:00:00', '01077889966', NULL, 'Fatma Khaled Ali', 'Zagazig, Egypt', '2006-03-12'),
(9, 'Karim Ibrahim', 'karim.ibrahim@gmail.com', 'karim123', '0000-00-00 00:00:00', '01188990011', NULL, 'Karim Ibrahim Hassan', 'Cairo, Egypt', '2005-12-05'),
(10, 'Salma Tarek', 'salma.tarek@gmail.com', 'salma123', '0000-00-00 00:00:00', '01299887766', NULL, 'Salma Tarek Mohamed', 'Damietta, Egypt', '2004-07-22'),
(11, 'Mostafa Nabil', 'mostafa.nabil@gmail.com', 'mostafa123', '0000-00-00 00:00:00', '01033445566', NULL, 'Mostafa Nabil Ali', 'Port Said, Egypt', '2006-05-09'),
(12, 'Dina Hossam', 'dina.hossam@gmail.com', 'dina123', '0000-00-00 00:00:00', '01144556677', NULL, 'Dina Hossam Ahmed', 'Cairo, Egypt', '2005-10-14'),
(13, 'Mahmoud Fathy', 'mahmoud.fathy@gmail.com', 'mahmoud123', '0000-00-00 00:00:00', '01255667788', NULL, 'Mahmoud Fathy Ali', 'Sohag, Egypt', '2004-09-26'),
(14, 'Jana Wael', 'jana.wael@gmail.com', 'jana123', '0000-00-00 00:00:00', '01066778899', NULL, 'Jana Wael Hassan', 'Alexandria, Egypt', '2006-02-08'),
(15, 'Hassan Magdy', 'hassan.magdy@gmail.com', 'hassan123', '0000-00-00 00:00:00', '01177889900', NULL, 'Hassan Magdy Ali', 'Cairo, Egypt', '2005-11-19'),
(16, 'Reem Osama', 'reem.osama@gmail.com', 'reem123', '0000-00-00 00:00:00', '01288990011', NULL, 'Reem Osama Adel', 'Giza, Egypt', '2004-12-28'),
(17, 'Mohamed Atef', 'mohamed.atef@gmail.com', 'mohamed123', '0000-00-00 00:00:00', '01099887766', NULL, 'Mohamed Atef Hassan', 'Cairo, Egypt', '2006-07-06'),
(18, 'Laila Amr', 'laila.amr@gmail.com', 'laila123', '0000-00-00 00:00:00', '01122334455', NULL, 'Laila Amr Mohamed', 'Fayoum, Egypt', '2005-05-31'),
(19, 'Ziad Sherif', 'ziad.sherif@gmail.com', 'ziad123', '0000-00-00 00:00:00', '01233445566', NULL, 'Ziad Sherif Ali', 'Cairo, Egypt', '2004-04-17'),
(20, 'Hoda Essam', 'hoda.essam@gmail.com', 'hoda123', '0000-00-00 00:00:00', '01044556677', NULL, 'Hoda Essam Ahmed', 'Ismailia, Egypt', '2006-09-24'),
(21, 'Amr Yasser', 'amr.yasser@gmail.com', 'amr123', '0000-00-00 00:00:00', '01155667799', NULL, 'Amr Yasser Ali', 'Cairo, Egypt', '2005-01-11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
