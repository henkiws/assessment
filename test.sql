-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 09, 2020 at 08:39 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Samsung'),
(2, 'Nokia'),
(3, 'Canon');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Television'),
(2, 'Mobilephone'),
(3, 'Camera');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `attributes` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand_id`, `category_id`, `attributes`) VALUES
(2, 'Prime', 1, 1, '{\"ports\": {\"usb\": 3, \"hdmi\": 1}, \"screen\": \"50 inch\", \"speakers\": {\"left\": \"10 watt\", \"right\": \"10 watt\"}, \"resolution\": \"2048 x 1152 pixels\"}'),
(3, 'Octoview', 1, 1, '{\"ports\": {\"usb\": 2, \"hdmi\": 1}, \"screen\": \"40 inch\", \"speakers\": {\"left\": \"10 watt\", \"right\": \"10 watt\"}, \"resolution\": \"1920 x 1080 pixels\"}'),
(4, 'Dreamer', 1, 1, '{\"ports\": {\"usb\": 1, \"hdmi\": 1}, \"screen\": \"30 inch\", \"speakers\": {\"left\": \"10 watt\", \"right\": \"10 watt\"}, \"resolution\": \"1600 x 900 pixles\"}'),
(5, 'Bravia', 1, 1, '{\"ports\": {\"usb\": 0, \"hdmi\": 1}, \"screen\": \"25 inch\", \"speakers\": {\"left\": \"5 watt\", \"right\": \"5 watt\"}, \"resolution\": \"1366 x 768 pixels\"}'),
(6, 'Proton', 1, 1, '{\"ports\": {\"usb\": 0, \"hdmi\": 0}, \"screen\": \"20 inch\", \"speakers\": {\"left\": \"5 watt\", \"right\": \"5 watt\"}, \"resolution\": \"1280 x 720 pixels\"}'),
(7, 'Desire', 2, 2, '{\"os\": \"Android Jellybean v4.3\", \"sim\": \"Micro-SIM\", \"body\": \"5.11 x 2.59 x 0.46 inches\", \"weight\": \"143 grams\", \"chipset\": \"Qualcomm Snapdragon\", \"display\": \"4.5 inches\", \"network\": [\"GSM\", \"CDMA\", \"HSPA\", \"EVDO\"], \"resolution\": \"720 x 1280 pixels\"}'),
(8, 'Explorer', 3, 3, '{\"processor\": \"Digic DV III\", \"mount_type\": \"PL\", \"sensor_type\": \"CMOS\", \"monitor_type\": \"LCD\", \"scanning_system\": \"progressive\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CATEGORY_ID` (`category_id`),
  ADD KEY `BRAND_ID` (`brand_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
