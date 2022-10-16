-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 16, 2022 at 09:37 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `custom_form`
--

-- --------------------------------------------------------

--
-- Table structure for table `custom_forms`
--

CREATE TABLE `custom_forms` (
  `id` int(11) NOT NULL,
  `creatorId` varchar(255) NOT NULL,
  `formName` varchar(255) NOT NULL,
  `localization` varchar(2) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_fields_choices`
--

CREATE TABLE `form_fields_choices` (
  `id` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `queueNumber` int(3) NOT NULL,
  `fieldType` int(2) NOT NULL,
  `value` text NOT NULL,
  `placeholder` text NOT NULL,
  `localization` varchar(2) NOT NULL,
  `active` int(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_fields_questions`
--

CREATE TABLE `form_fields_questions` (
  `id` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `queueNumber` int(3) NOT NULL,
  `question` text NOT NULL,
  `localization` varchar(2) NOT NULL,
  `active` int(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `custom_forms`
--
ALTER TABLE `custom_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creatorId` (`creatorId`);

--
-- Indexes for table `form_fields_choices`
--
ALTER TABLE `form_fields_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formId` (`formId`);

--
-- Indexes for table `form_fields_questions`
--
ALTER TABLE `form_fields_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formId` (`formId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `custom_forms`
--
ALTER TABLE `custom_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_fields_choices`
--
ALTER TABLE `form_fields_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_fields_questions`
--
ALTER TABLE `form_fields_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custom_forms`
--
ALTER TABLE `custom_forms`
  ADD CONSTRAINT `custom_forms_ibfk_1` FOREIGN KEY (`id`) REFERENCES `form_fields_choices` (`formId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_fields_choices`
--
ALTER TABLE `form_fields_choices`
  ADD CONSTRAINT `form_fields_choices_ibfk_1` FOREIGN KEY (`formId`) REFERENCES `custom_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_fields_questions`
--
ALTER TABLE `form_fields_questions`
  ADD CONSTRAINT `form_fields_questions_ibfk_1` FOREIGN KEY (`formId`) REFERENCES `custom_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
