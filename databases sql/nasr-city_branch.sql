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
-- Database: `nasr-city_branch`
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
(1, 'Judy El Husseini', 'judy123', '01076543218', 'judy@medicare.com', 'Pharmacist', 12700),
(2, 'Jury Abdelaziz', 'jury123', '01145678921', 'jury@medicare.com', 'Senior Pharmacist', 15700),
(3, 'Ahmed El Kady', 'ahmed123', '01022334456', 'ahmed@medicare.com', 'Cashier', 7200),
(4, 'Mahmoud El Sherif', 'mahmoud123', '01133445567', 'mahmoud@medicare.com', 'Branch Manager', 19500),
(5, 'Yara Al Nasser', 'yara123', '09355667788', 'yara@medicare.com', 'Pharmacy Assistant', 6800),
(6, 'Omar Abdelrahman', 'omar123', '01088776655', 'omar@medicare.com', 'Store Keeper', 7700),
(7, 'Nour El Din', 'nour123', '01199887766', 'nour@medicare.com', 'Pharmacist', 13000),
(8, 'Maya El Saad', 'maya123', '01233445566', 'maya@medicare.com', 'Customer Service', 6900),
(9, 'Karim Al Shami', 'karim123', '09366778899', 'karim@medicare.com', 'Inventory Specialist', 9500),
(10, 'Layan Mostafa', 'layan123', '01055667788', 'layan@medicare.com', 'Pharmacist', 12200),
(11, 'Tala Abdelgawad', 'tala123', '01122335566', 'tala@medicare.com', 'Pharmacy Assistant', 6500),
(12, 'Fares El Amin', 'fares123', '09377889911', 'fares@medicare.com', 'Delivery Coordinator', 7400),
(13, 'Rana El Masry', 'rana123', '01099886655', 'rana@medicare.com', 'Senior Pharmacist', 16000),
(14, 'Sami Al Hassan', 'sami123', '09344556677', 'sami@medicare.com', 'Branch Supervisor', 14500),
(15, 'Hana El Fayed', 'hana123', '01277889955', 'hana@medicare.com', 'Pharmacist', 11800);

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
(1, 'Panadol Extra', 'Pain Relief', 'Fast pain relief for headaches and muscle pain.', 47, 65, '2028-09-14', 'panadol.jpg'),
(2, 'Brufen 600mg', 'Pain Relief', 'Provides effective relief from strong pain and helps reduce inflammation.', 55, 70, '2028-11-20', 'brufen.jpg'),
(3, 'Augmentin', 'Antibiotics', 'An antibiotic used to treat various bacterial infections and respiratory infections.', 120, 40, '2028-07-15', 'augmentin.jpg'),
(4, 'Omeprazole 10mg', 'Digestive Health', 'Helps control heartburn and protects the stomach from excess acid.', 82, 60, '2029-01-10', 'omeprazole.jpg'),
(5, 'Dulcolax', 'Digestive Health', 'Provides gentle relief from constipation and supports regular bowel movement.', 62, 75, '2028-09-22', 'dulcolax.jpg'),
(6, 'Bepanthen Cream', 'Skin Care', 'Soothes irritated skin and helps maintain skin moisture.', 100, 55, '2028-06-14', 'bepanthen.jpg'),
(7, 'Fucidin Cream', 'Skin Care', 'Used for treating bacterial skin infections and minor wounds.', 75, 45, '2029-03-25', 'fucidin.jpg'),
(8, 'CeraVe Cream', 'Skin Care', 'Deeply hydrates skin and restores the protective skin barrier.', 410, 35, '2029-05-18', 'cerave.jpg'),
(9, 'Nivea Soft Cream', 'Skin Care', 'Light moisturizing cream that nourishes the skin and keeps it smooth and refreshed.', 92, 65, '2029-04-12', 'nivea.jpg'),
(10, 'Flagyl 500mg', 'Antibiotics', 'An antibacterial medicine used to treat various infections and digestive system problems.', 60, 65, '2028-05-20', 'flagyl.jpg'),
(11, 'Advil', 'Pain Relief', 'Contains ibuprofen to help manage minor aches, muscle discomfort, and temporary fever.', 38, 85, '2028-08-22', 'advil.jpg'),
(12, 'Nurofen Tablets', 'Pain Relief', 'A trusted pain management option that works on headaches, back pain, and daily discomfort.', 65, 70, '2029-06-10', 'nurofen.jpg'),
(13, 'Flu Stop', 'Cold & Flu', 'Combination formula that helps ease symptoms associated with seasonal colds and flu conditions.', 55, 60, '2028-11-14', 'flustop.jpg'),
(14, 'Calcium Plus', 'Vitamins', 'Dietary supplement that contributes to stronger bones and supports daily calcium needs.', 180, 55, '2029-03-08', 'calcium.jpg'),
(15, 'Otrivin Spray', 'Cold & Flu', 'Nasal solution designed to quickly reduce stuffiness and provide easier breathing.', 100, 35, '2028-09-25', 'otrivin.jpg'),
(16, 'Strepsils', 'Cold & Flu', 'Soothing lozenges formulated to calm throat irritation and provide refreshing relief.', 65, 110, '2029-05-17', 'strepsils.jpg'),
(17, 'Vitamin C ', 'Vitamins', 'High-strength vitamin supplement that helps maintain immune system function and overall wellness.', 125, 85, '2029-02-14', 'vitaminc.jpg'),
(18, 'Antinal', 'Digestive Health', 'Helps restore digestive balance and provides relief from symptoms of intestinal discomfort.', 52, 100, '2028-06-25', 'antinal.jpg'),
(19, 'Imodium', 'Digestive Health', 'A fast-acting treatment that helps reduce frequent bowel movements and manage diarrhea symptoms.', 68, 60, '2028-03-12', 'imodium.jpg'),
(20, 'Omega 3', 'Vitamins', 'Nutritional supplement containing essential fatty acids that support cardiovascular health and normal brain function.', 245, 55, '2029-06-18', 'omega3.jpg'),
(21, 'Panadol Advance', 'Pain Relief', 'Fast dissolving tablets designed to provide quick relief from headaches, fever, and everyday pain.', 58, 85, '2028-08-15', 'panadoladvance.jpg'),
(22, 'Paracetamol 500mg', 'Pain Relief', 'A commonly used pain reliever that helps reduce mild pain and control fever.', 25, 120, '2029-01-18', 'paracetamol.jpg'),
(23, 'Deep Heat Cream', 'Pain Relief', 'Topical cream that helps ease muscle stiffness and minor body discomfort.', 75, 60, '2028-11-05', 'deepheat.jpg'),
(24, 'Colgate Total Toothpaste', 'Skin Care', 'Daily toothpaste that helps protect teeth and maintain fresh breath.', 95, 100, '2029-04-20', 'colgate.jpg'),
(25, 'Parodontax Toothpaste', 'Skin Care', 'Specialized toothpaste that helps maintain healthy gums and supports daily oral hygiene.', 110, 65, '2029-07-15', 'parodontax.jpg'),
(26, 'Mucosolvan Syrup', 'Cold & Flu', 'Helps loosen mucus and provides relief from productive coughs.', 90, 55, '2028-12-25', 'mucosolvan.jpg'),
(27, 'Benadryl Syrup', 'Cold & Flu', 'Provides soothing relief from cough and throat irritation.', 65, 80, '2029-02-08', 'benadryl.jpg'),
(28, 'Loratadine 10mg', 'Cold & Flu', 'Antihistamine medicine used to relieve allergy symptoms such as sneezing and itching.', 35, 90, '2028-10-14', 'loratadine.jpg'),
(29, 'Buscopan Tablets', 'Digestive Health', 'Helps reduce stomach cramps and abdominal discomfort.', 45, 75, '2029-03-30', 'buscopan.jpg'),
(30, 'Hydrocortisone Cream', 'Skin Care', 'Mild topical cream used to calm skin irritation and itching.', 60, 50, '2028-09-22', 'hydrocortisone.jpg'),
(31, 'Galvus', 'Chronic Medication', 'A prescribed medicine that assists in managing blood sugar levels for diabetic patients.', 350, 35, '2029-01-30', 'galvus.jpg'),
(32, 'Forxiga', 'Chronic Medication', 'A medicine that helps regulate blood glucose and supports diabetes management.', 480, 40, '2029-04-12', 'forxiga.jpg'),
(33, 'Primperan', 'Anti-Nausea Medicine', 'A medication used to reduce nausea and help improve digestive movement.', 45, 70, '2028-11-23', 'primperan.jpg'),
(34, 'Concor', 'Cardiovascular Medicine', 'A medicine used for controlling blood pressure and supporting heart function.', 160, 50, '2029-09-06', 'concor.jpg'),
(35, 'Multilem', 'Health Supplement', 'A daily supplement formulated to support energy levels and improve general body wellness.', 135, 65, '2029-02-14', 'mutilem.jpg'),
(36, 'Chromax', 'Vitamins', 'A supplement that helps maintain normal metabolism and supports healthy glucose balance.', 175, 55, '2028-12-08', 'chromax.jpg'),
(37, 'Zinc', 'Vitamins', 'A zinc-based supplement that helps support immune system function and cell protection.', 70, 100, '2029-08-11', 'zinc.jpg'),
(38, 'Spasmodigestin', 'Stomach Medicine', 'A medication used for relieving digestive discomfort and abdominal cramps.', 60, 45, '2028-09-19', 'spasmodigestin.jpg'),
(39, 'Vitamin D', 'Vitamins', 'A vitamin D supplement that helps support bone health and immune system function.', 85, 90, '2029-04-18', 'vitd.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
