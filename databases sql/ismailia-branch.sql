-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2026 at 03:38 AM
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
-- Database: `ismailia-branch`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `password`, `phone`, `email`, `role`, `salary`) VALUES
(1, 'Ahmed Hassan', 'ahmed123', '01012345678', 'ahmed.hassan@medicare.com', 'Pharmacist', 12000),
(2, 'Sara Mohamed', 'sara123', '01123456789', 'sara.mohamed@medicare.com', 'Senior Pharmacist', 15000),
(3, 'Omar Ali', 'omar123', '01234567890', 'omar.ali@medicare.com', 'Cashier', 7000),
(4, 'Mariam Adel', 'mariam123', '01512345678', 'mariam.adel@medicare.com', 'Pharmacy Assistant', 6500),
(5, 'Youssef Ibrahim', 'youssef123', '01087654321', 'youssef.ibrahim@medicare.com', 'Store Keeper', 7500),
(6, 'Nour El Din', 'nour123', '01198765432', 'nour.eldin@medicare.com', 'Pharmacist', 12500),
(7, 'Salma Tarek', 'salma123', '01211223344', 'salma.tarek@medicare.com', 'Customer Service', 6800),
(8, 'Mostafa Mahmoud', 'mostafa123', '01555667788', 'mostafa.mahmoud@medicare.com', 'Branch Manager', 18000),
(9, 'Reem Ashraf', 'reem123', '01099887766', 'reem.ashraf@medicare.com', 'Pharmacist', 11800),
(10, 'Karim Samy', 'karim123', '01144556677', 'karim.samy@medicare.com', 'Inventory Specialist', 9000),
(11, 'Aya Gamal', 'aya123', '01222334455', 'aya.gamal@medicare.com', 'Pharmacy Assistant', 6400),
(12, 'Mahmoud Fathy', 'mahmoud123', '01533445566', 'mahmoud.fathy@medicare.com', 'Delivery Coordinator', 7200),
(13, 'Heba Nabil', 'heba123', '01055667788', 'heba.nabil@medicare.com', 'Senior Pharmacist', 15500),
(14, 'Mohamed Adel', 'mohamed123', '01166778899', 'mohamed.adel@medicare.com', 'Cashier', 7100),
(15, 'Dina Wael', 'dina123', '01277889900', 'dina.wael@medicare.com', 'Pharmacist', 12200);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiration_date` date NOT NULL,
  `image` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `category`, `description`, `price`, `quantity`, `expiration_date`, `image`) VALUES
(1, 'Panadol Extra', 'Pain Relief', 'Relieves headache, fever and body pain.', 45, 120, '2028-05-20', 'panadol.jpg'),
(2, 'Brufen 400mg', 'Pain Relief', 'Anti-inflammatory pain reliever.', 52, 80, '2028-01-15', 'brufen.jpg'),
(3, 'Cataflam 50mg', 'Pain Relief', 'Fast relief for muscle and dental pain.', 60, 95, '2027-12-10', 'cataflam.jpg'),
(4, 'Voltaren 50mg', 'Pain Relief', 'Relieves inflammation and joint pain.', 58, 70, '2028-03-08', 'voltaren.jpg'),
(5, 'Aspirin Protect', 'Pain Relief', 'Low-dose aspirin for heart protection.', 39, 100, '2028-06-18', 'aspirin.jpg'),
(6, 'Congestal', 'Cold & Flu', 'Treats cold symptoms and congestion.', 42, 110, '2028-02-22', 'congestal.jpg'),
(7, 'Cold Free', 'Cold & Flu', 'Relieves flu and fever symptoms.', 38, 90, '2027-11-12', 'coldfree.jpg'),
(8, 'Otrivin Spray', 'Cold & Flu', 'Nasal spray for blocked nose relief.', 85, 65, '2028-04-15', 'otrivin.jpg'),
(9, 'Strepsils', 'Cold & Flu', 'Soothes sore throat irritation.', 55, 150, '2028-01-30', 'strepsils.jpg'),
(10, 'Tussivan Syrup', 'Cold & Flu', 'Cough suppressant syrup.', 68, 60, '2027-10-05', 'tussivan.jpg'),
(11, 'Augmentin 1g', 'Antibiotics', 'Antibiotic for bacterial infections.', 180, 50, '2028-05-25', 'augmentin.jpg'),
(12, 'Amoxil 500mg', 'Antibiotics', 'Penicillin antibiotic.', 90, 75, '2028-03-14', 'amoxil.jpg'),
(13, 'Zithromax', 'Antibiotics', 'Treats respiratory infections.', 135, 55, '2028-07-12', 'zithromax.jpg'),
(14, 'Klacid 500mg', 'Antibiotics', 'Broad-spectrum antibiotic.', 220, 40, '2028-02-28', 'klacid.jpg'),
(15, 'Flagyl 500mg', 'Antibiotics', 'Used for bacterial infections.', 55, 80, '2027-12-18', 'flagyl.jpg'),
(16, 'Centrum Adults', 'Vitamins', 'Daily multivitamin supplement.', 295, 45, '2029-01-15', 'centrum.jpg'),
(17, 'Vitamin C 1000mg', 'Vitamins', 'Supports immune health.', 115, 100, '2028-11-20', 'vitaminc.jpg'),
(18, 'Omega 3', 'Vitamins', 'Supports heart and brain health.', 235, 70, '2029-03-01', 'omega3.jpg'),
(19, 'Vitamin D3', 'Vitamins', 'Supports healthy bones.', 150, 95, '2028-10-25', 'vitamind.jpg'),
(20, 'Feroglobin', 'Vitamins', 'Iron supplement.', 165, 60, '2028-09-12', 'feroglobin.jpg'),
(21, 'Gaviscon Syrup', 'Digestive Health', 'Relieves heartburn and acid reflux.', 145, 55, '2028-04-30', 'gaviscon.jpg'),
(22, 'Antinal', 'Digestive Health', 'Treats diarrhea.', 48, 120, '2028-01-08', 'antinal.jpg'),
(23, 'Imodium', 'Digestive Health', 'Controls diarrhea symptoms.', 62, 75, '2027-11-19', 'imodium.jpg'),
(24, 'Omeprazole 20mg', 'Digestive Health', 'Reduces stomach acid.', 78, 80, '2028-08-18', 'omeprazole.jpg'),
(25, 'Dulcolax', 'Digestive Health', 'Helps with constipation.', 58, 90, '2028-06-05', 'dulcolax.jpg'),
(26, 'Bepanthen Cream', 'Skin Care', 'Moisturizes dry skin.', 95, 70, '2028-05-09', 'bepanthen.jpg'),
(27, 'Fucidin Cream', 'Skin Care', 'Cream for skin infections.', 70, 60, '2028-03-17', 'fucidin.jpg'),
(28, 'CeraVe Cream', 'Skin Care', 'Hydrating moisturizer.', 390, 40, '2029-02-10', 'cerave.jpg'),
(29, 'Betadine Ointment', 'Skin Care', 'Antiseptic for wounds.', 52, 85, '2028-07-27', 'betadine.jpg'),
(30, 'Panthenol Cream', 'Skin Care', 'Helps repair irritated skin.', 65, 75, '2028-10-11', 'panthenol.jpg'),
(31, 'Nivea Soft Cream', 'Skin Care ', 'Moisturizing cream for soft and hydrated skin.', 85, 90, '0000-00-00', 'nivea.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
