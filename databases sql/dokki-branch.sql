-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2026 at 11:23 AM
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
-- Database: `dokki-branch`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `username`, `password`, `phone`, `email`, `role`, `salary`) VALUES
(1, 'Jana El Masry', 'jana123', '01084561237', 'jana@medicare.com', 'Pharmacist', 12800),
(2, 'Salma Abdelnour', 'salma123', '01198765432', 'salma@medicare.com', 'Senior Pharmacist', 15800),
(3, 'Lojain Al Hariri', 'lojain123', '09367894521', 'lojain@medicare.com', 'Pharmacy Assistant', 7000),
(4, 'Mahmoud El Barasi', 'mahmoud123', '01033445566', 'mahmoud@medicare.com', 'Branch Manager', 20000),
(5, 'Rital Al Khoury', 'rital123', '09367894521', 'rital@medicare.com', 'Pharmacist', 12500),
(6, 'Youssef El Sayed', 'youssef123', '01122334455', 'youssef@medicare.com', 'Inventory Specialist', 9200),
(7, 'Mira Abdelrahim', 'mira123', '01277889900', 'mira@medicare.com', 'Customer Service', 6800),
(8, 'Ziad Al Nimeiry', 'ziad123', '09155667788', 'ziad@medicare.com', 'Store Keeper', 7600),
(9, 'Reem El Shazly', 'reem123', '01066778899', 'reem@medicare.com', 'Pharmacist', 13200),
(10, 'Laith Al Hamawi', 'laith123', '09399887766', 'laith@medicare.com', 'Delivery Coordinator', 7400),
(11, 'Sondos El Mahdi', 'sondos123', '01155667788', 'sondos@medicare.com', 'Pharmacy Assistant', 6600),
(12, 'Kinan Abdelaziz', 'kinan123', '09311223344', 'kinan@medicare.com', 'Senior Pharmacist', 16200),
(13, 'Farah Al Sudaney', 'farah123', '09177889966', 'farah@medicare.com', 'Cashier', 7200),
(14, 'Malak El Fayed', 'malak123', '01099887755', 'malak@medicare.com', 'Pharmacist', 11800),
(15, 'Rayan Al Shami', 'rayan123', '09344556677', 'rayan@medicare.com', 'Branch Supervisor', 14500);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `image` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `category`, `description`, `price`, `quantity`, `expiration_date`, `image`) VALUES
(1, 'Panadol Extra', 'Pain Relief', 'Provides effective relief from headaches, fever, and common body aches.', 50, 75, '2028-06-20', 'panadol.jpg'),
(2, 'Brufen 400mg', 'Pain Relief', 'Helps reduce pain and swelling caused by inflammation.', 45, 60, '2027-12-15', 'brufen.jpg'),
(3, 'Cataflam 50mg', 'Pain Relief', 'Used for quick relief of muscle, dental, and joint discomfort.', 70, 50, '2028-10-10', 'cataflam.jpg'),
(4, 'Voltaren 50mg', 'Pain Relief', 'Reduces inflammation and eases pain related to joints and muscles.', 65, 85, '2029-01-08', 'voltaren.jpg'),
(5, 'Aspirin Protect', 'Pain Relief', 'Supports cardiovascular health with low-dose aspirin protection.', 42, 120, '2028-09-18', 'aspirin.jpg'),
(6, 'Congestal', 'Cold & Flu', 'Helps manage symptoms of colds including congestion and fever.', 55, 90, '2029-03-22', 'congestal.jpg'),
(7, 'Cold Free', 'Cold & Flu', 'Provides comfort from flu symptoms and seasonal cold problems.', 45, 70, '2028-11-12', 'coldfree.jpg'),
(8, 'Otrivin Spray', 'Cold & Flu', 'Helps open blocked nasal passages and improves breathing.', 95, 40, '2028-07-15', 'otrivin.jpg'),
(9, 'Strepsils', 'Cold & Flu', 'Soothes throat irritation and helps relieve soreness.', 60, 130, '2029-01-30', 'strepsils.jpg'),
(10, 'Tussivan Syrup', 'Cold & Flu', 'Aids in controlling cough and reducing throat discomfort.', 75, 55, '2028-10-05', 'tussivan.jpg'),
(11, 'Augmentin 1g', 'Antibiotics', 'Combination antibiotic used to treat different bacterial infections.', 200, 35, '2028-08-25', 'augmentin.jpg'),
(12, 'Amoxil 500mg', 'Antibiotics', 'Helps fight bacterial infections with amoxicillin treatment.', 110, 65, '2029-03-14', 'amoxil.jpg'),
(13, 'Zithromax', 'Antibiotics', 'Antibiotic medication used for respiratory and other infections.', 150, 45, '2028-12-12', 'zithromax.jpg'),
(14, 'Centrum Adults', 'Vitamins', 'Daily supplement containing essential vitamins and minerals.', 320, 30, '2029-02-15', 'centrum.jpg'),
(15, 'Vitamin C 1000mg', 'Vitamins', 'Boosts vitamin C intake and supports the immune system.', 130, 80, '2028-12-20', 'vitaminc.jpg'),
(16, 'Gaviscon Syrup', 'Digestive Health', 'Helps relieve acid reflux and digestive discomfort.', 160, 45, '2028-05-30', 'gaviscon.jpg'),
(17, 'Bepanthen Cream', 'Skin Care', 'Helps nourish and protect dry and sensitive skin.', 110, 55, '2029-06-09', 'bepanthen.jpg'),
(18, 'Advil 200mg', 'Pain Relief', 'Provides relief from mild pain and reduces fever.', 35, 100, '2028-04-12', 'advil.jpg'),
(19, 'Nurofen Tablets', 'Pain Relief', 'Pain reliever that helps with headaches and body aches.', 60, 80, '2029-02-18', 'nurofen.jpg'),
(20, 'Flu Stop', 'Cold & Flu', 'Designed to reduce cold and flu related symptoms.', 50, 90, '2028-12-05', 'flustop.jpg'),
(21, 'Vicks Syrup', 'Cold & Flu', 'Helps calm cough and provides throat relief.', 85, 60, '2029-01-20', 'vicks.jpg'),
(22, 'Ceftriaxone', 'Antibiotics', 'Powerful antibiotic used under medical supervision for infections.', 250, 25, '2028-07-11', 'ceftriaxone.jpg'),
(23, 'Ciprofloxacin 500mg', 'Antibiotics', 'Treats various bacterial infections with antibiotic action.', 95, 70, '2029-04-16', 'ciprofloxacin.jpg'),
(24, 'Supradyn', 'Vitamins', 'Multivitamin formula that supports energy and wellness.', 280, 40, '2029-05-22', 'supradyn.jpg'),
(25, 'Calcium Plus', 'Vitamins', 'Provides calcium support for healthy bones and muscles.', 170, 75, '2028-10-30', 'calcium.jpg'),
(26, 'Maalox', 'Digestive Health', 'Helps neutralize stomach acid and relieve heartburn.', 90, 85, '2029-03-08', 'maalox.jpg'),
(27, 'Loperamide', 'Digestive Health', 'Used to reduce symptoms of diarrhea and improve digestion.', 55, 110, '2028-11-19', 'loperamide.jpg'),
(28, 'Nizoral Cream', 'Skin Care', 'Antifungal cream for treating skin-related fungal problems.', 130, 50, '2029-02-14', 'nizoral.jpg'),
(29, 'Sudocrem', 'Skin Care', 'Protective cream that helps soothe irritated skin.', 150, 45, '2028-08-27', 'sudocrem.jpg'),
(30, 'Eucerin Cream', 'Skin Care', 'Moisturizing cream that helps maintain healthy skin.', 300, 35, '2029-09-10', 'eucerin.jpg'),
(31, 'Panadol Advance', 'Pain Relief', 'Provides quick relief from headache, fever, toothache, and everyday aches with fast absorption.', 55, 90, '2028-07-20', 'panadoladvance.jpg'),
(32, 'Miswak Toothpaste', 'Skin Care', 'Natural miswak toothpaste that helps clean teeth, protect gums, and maintain fresh breath', 80, 100, '0000-00-00', 'miswak.jpg'),
(33, 'Galvus', 'Diabetes Treatment', 'A medicine prescribed to help improve blood sugar control in adults with diabetes.', 380, 20, '2029-10-18', 'galvus.jpg'),
(34, 'Forxiga', 'Diabetes Treatment', 'A medication that supports blood sugar regulation and diabetes care management.', 500, 25, '2030-02-05', 'forxiga.jpg'),
(35, 'Primperan', 'Digestive Medicine', 'A medicine used for managing nausea and vomiting symptoms.', 50, 80, '2028-08-24', 'primperan.jpg'),
(36, 'Concor', 'Heart Medicine', 'A cardiovascular medicine used to help manage blood pressure and heart-related conditions.', 175, 30, '2029-07-14', 'concor.jpg'),
(37, 'Magnesium', 'Vitamins', 'A magnesium supplement that supports muscle function, energy production, and nervous system health.', 90, 70, '2029-02-10', 'magnesium.jpg'),
(38, 'Green Tea', 'Vitamins', 'A natural green tea supplement containing antioxidants that supports general wellness.', 75, 60, '2028-11-25', 'greentea.jpg'),
(39, 'Zinc', 'Vitamins', 'A supplement that contributes to immune support and helps maintain healthy body functions.', 75, 120, '2030-03-22', 'zinc.jpg'),
(40, 'Spasmodigestin', 'Digestive Medicine', 'A treatment used to relieve stomach discomfort and digestive system disturbances.', 68, 60, '2028-12-11', 'spasmodigestin.jpg'),
(41, 'Vitamin D', 'Vitamins', 'A vitamin D product that supports bone strength and helps maintain normal immune function.', 100, 65, '2029-08-27', 'vitd.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
