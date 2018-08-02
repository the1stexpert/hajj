-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2018 at 04:54 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hajj`
--

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'رجل'),
(2, 'امرأة');

-- --------------------------------------------------------

--
-- Table structure for table `hamlah`
--

CREATE TABLE `hamlah` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `contact` int(11) NOT NULL,
  `hamlah_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hamlah`
--

INSERT INTO `hamlah` (`id`, `name`, `contact`, `hamlah_type`) VALUES
(1, 'Taqwa', 548752345, 1),
(2, 'Mustajar', 542950460, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hamlah_points`
--

CREATE TABLE `hamlah_points` (
  `id` int(11) NOT NULL,
  `hamlah_id` int(11) NOT NULL,
  `waste_wight` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trashbin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hamlah_points`
--

INSERT INTO `hamlah_points` (`id`, `hamlah_id`, `waste_wight`, `points`, `reference_id`, `time`, `trashbin_id`) VALUES
(1, 1, 1000, 10, 2, '2018-08-02 02:08:13', 456),
(2, 1, 2000, 20, 2, '2018-08-02 02:08:21', 456),
(3, 1, 200, 2, 1, '2018-08-02 02:07:59', 123),
(4, 1, 300, 3, 1, '2018-08-02 02:08:05', 123);

-- --------------------------------------------------------

--
-- Table structure for table `hamlah_type`
--

CREATE TABLE `hamlah_type` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hamlah_type`
--

INSERT INTO `hamlah_type` (`id`, `name`) VALUES
(1, 'حجاج الداخل'),
(2, 'حجاج الخارج');

-- --------------------------------------------------------

--
-- Table structure for table `pilgrim`
--

CREATE TABLE `pilgrim` (
  `id` int(11) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `hamlah_id` int(11) NOT NULL,
  `pilgrim_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilgrim`
--

INSERT INTO `pilgrim` (`id`, `name`, `gender`, `hamlah_id`, `pilgrim_type`) VALUES
(1, 'Ahmed Buholaigah', 1, 1, 2),
(2, 'Yousef AL Ali', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pilgrim_points`
--

CREATE TABLE `pilgrim_points` (
  `id` int(11) NOT NULL,
  `pilgrim_id` int(11) NOT NULL,
  `waste_wight` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `trashbin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilgrim_points`
--

INSERT INTO `pilgrim_points` (`id`, `pilgrim_id`, `waste_wight`, `points`, `trashbin_id`) VALUES
(1, 1, 200, 2, 123),
(2, 1, 300, 3, 123);

-- --------------------------------------------------------

--
-- Table structure for table `pilgrim_type`
--

CREATE TABLE `pilgrim_type` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `pilgrim_type`
--

INSERT INTO `pilgrim_type` (`id`, `name`) VALUES
(1, 'كادر'),
(2, 'حاج');

-- --------------------------------------------------------

--
-- Table structure for table `points_value`
--

CREATE TABLE `points_value` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `points_value`
--

INSERT INTO `points_value` (`id`, `type`, `point`, `value`) VALUES
(1, 1, 100, 1),
(2, 2, 100000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `point_type`
--

CREATE TABLE `point_type` (
  `id` int(11) NOT NULL,
  `name` varchar(256) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `point_type`
--

INSERT INTO `point_type` (`id`, `name`) VALUES
(1, 'individual '),
(2, 'company');

-- --------------------------------------------------------

--
-- Table structure for table `trashbin`
--

CREATE TABLE `trashbin` (
  `id` int(11) NOT NULL,
  `Location` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trashbin`
--

INSERT INTO `trashbin` (`id`, `Location`) VALUES
(123, 'Zone A'),
(456, 'Zone B');

-- --------------------------------------------------------

--
-- Table structure for table `waste_type`
--

CREATE TABLE `waste_type` (
  `id` int(11) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waste_type`
--

INSERT INTO `waste_type` (`id`, `name`) VALUES
(1, 'individual'),
(2, 'company');

-- --------------------------------------------------------

--
-- Table structure for table `weight_points`
--

CREATE TABLE `weight_points` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weight_points`
--

INSERT INTO `weight_points` (`id`, `type`, `weight`, `point`) VALUES
(1, 1, 100, 1),
(2, 2, 1000, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hamlah`
--
ALTER TABLE `hamlah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hamlah_type` (`hamlah_type`);

--
-- Indexes for table `hamlah_points`
--
ALTER TABLE `hamlah_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hamla_ID` (`hamlah_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `trashbin_id` (`trashbin_id`);

--
-- Indexes for table `hamlah_type`
--
ALTER TABLE `hamlah_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pilgrim`
--
ALTER TABLE `pilgrim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hamlah_id` (`hamlah_id`),
  ADD KEY `gender` (`gender`),
  ADD KEY `pilgrim_type` (`pilgrim_type`);

--
-- Indexes for table `pilgrim_points`
--
ALTER TABLE `pilgrim_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pilgrim_id` (`pilgrim_id`),
  ADD KEY `trashbin_id` (`trashbin_id`);

--
-- Indexes for table `pilgrim_type`
--
ALTER TABLE `pilgrim_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `points_value`
--
ALTER TABLE `points_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `point_type`
--
ALTER TABLE `point_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trashbin`
--
ALTER TABLE `trashbin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waste_type`
--
ALTER TABLE `waste_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weight_points`
--
ALTER TABLE `weight_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hamlah`
--
ALTER TABLE `hamlah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hamlah_points`
--
ALTER TABLE `hamlah_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hamlah_type`
--
ALTER TABLE `hamlah_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pilgrim`
--
ALTER TABLE `pilgrim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pilgrim_points`
--
ALTER TABLE `pilgrim_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pilgrim_type`
--
ALTER TABLE `pilgrim_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `points_value`
--
ALTER TABLE `points_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `point_type`
--
ALTER TABLE `point_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trashbin`
--
ALTER TABLE `trashbin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT for table `waste_type`
--
ALTER TABLE `waste_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `weight_points`
--
ALTER TABLE `weight_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hamlah`
--
ALTER TABLE `hamlah`
  ADD CONSTRAINT `hamlah_ibfk_1` FOREIGN KEY (`hamlah_type`) REFERENCES `hamlah_type` (`id`);

--
-- Constraints for table `hamlah_points`
--
ALTER TABLE `hamlah_points`
  ADD CONSTRAINT `hamlah_points_ibfk_1` FOREIGN KEY (`hamla_ID`) REFERENCES `hamlah` (`id`),
  ADD CONSTRAINT `hamlah_points_ibfk_2` FOREIGN KEY (`reference_id`) REFERENCES `pilgrim` (`id`);

--
-- Constraints for table `pilgrim`
--
ALTER TABLE `pilgrim`
  ADD CONSTRAINT `pilgrim_ibfk_1` FOREIGN KEY (`pilgrim_type`) REFERENCES `pilgrim_type` (`id`),
  ADD CONSTRAINT `pilgrim_ibfk_2` FOREIGN KEY (`hamlah_id`) REFERENCES `hamlah` (`id`),
  ADD CONSTRAINT `pilgrim_ibfk_3` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`);

--
-- Constraints for table `pilgrim_points`
--
ALTER TABLE `pilgrim_points`
  ADD CONSTRAINT `pilgrim_points_ibfk_1` FOREIGN KEY (`pilgrim_id`) REFERENCES `pilgrim` (`id`),
  ADD CONSTRAINT `pilgrim_points_ibfk_2` FOREIGN KEY (`trashbin_id`) REFERENCES `trashbin` (`id`);

--
-- Constraints for table `points_value`
--
ALTER TABLE `points_value`
  ADD CONSTRAINT `points_value_ibfk_1` FOREIGN KEY (`type`) REFERENCES `point_type` (`id`);

--
-- Constraints for table `weight_points`
--
ALTER TABLE `weight_points`
  ADD CONSTRAINT `weight_points_ibfk_1` FOREIGN KEY (`type`) REFERENCES `waste_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
