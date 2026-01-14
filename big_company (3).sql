-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2026 at 11:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `big_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `date` datetime(3) NOT NULL,
  `checkIn` datetime(3) NOT NULL,
  `checkOut` datetime(3) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `location` varchar(191) DEFAULT NULL,
  `workHours` double NOT NULL DEFAULT 0,
  `notes` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billpayment`
--

CREATE TABLE `billpayment` (
  `id` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `companyName` varchar(191) NOT NULL,
  `companyType` varchar(191) NOT NULL,
  `accountNumber` varchar(191) NOT NULL,
  `accountHolderName` varchar(191) DEFAULT NULL,
  `monthlyAmount` double NOT NULL,
  `paymentDay` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) DEFAULT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `location` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `name`, `description`, `isActive`, `createdAt`, `updatedAt`) VALUES
(2, 'A121', 'redmi', 'asdfghjk', 1, '2026-01-13 09:21:46.111', '2026-01-13 09:21:46.111'),
(3, 'A122', 'test', 'demo', 1, '2026-01-13 10:01:08.619', '2026-01-13 10:01:08.619');

-- --------------------------------------------------------

--
-- Table structure for table `consumerprofile`
--

CREATE TABLE `consumerprofile` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `walletBalance` double NOT NULL DEFAULT 0,
  `rewardsPoints` double NOT NULL DEFAULT 0,
  `address` varchar(191) DEFAULT NULL,
  `fullName` varchar(191) DEFAULT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT 0,
  `landmark` varchar(191) DEFAULT NULL,
  `membershipType` varchar(191) NOT NULL DEFAULT 'standard'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumerprofile`
--

INSERT INTO `consumerprofile` (`id`, `userId`, `walletBalance`, `rewardsPoints`, `address`, `fullName`, `isVerified`, `landmark`, `membershipType`) VALUES
(1, 5, 25000, 150, NULL, NULL, 0, NULL, 'standard'),
(2, 6, 9600, 50, 'qq, qq, Nyarugenge', NULL, 0, NULL, 'standard'),
(3, 7, 0, 0, NULL, NULL, 1, NULL, 'standard'),
(4, 8, 0, 0, NULL, NULL, 1, NULL, 'standard'),
(5, 9, 0, 0, NULL, 'Test User', 0, NULL, 'standard'),
(6, 10, 0, 0, NULL, NULL, 1, NULL, 'standard'),
(7, 11, 0, 0, NULL, NULL, 1, NULL, 'standard'),
(8, 12, 0, 0, NULL, 'undefined undefined', 1, NULL, 'standard');

-- --------------------------------------------------------

--
-- Table structure for table `consumersettings`
--

CREATE TABLE `consumersettings` (
  `id` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `pushNotifications` tinyint(1) NOT NULL DEFAULT 1,
  `emailNotifications` tinyint(1) NOT NULL DEFAULT 1,
  `smsNotifications` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumersettings`
--

INSERT INTO `consumersettings` (`id`, `consumerId`, `pushNotifications`, `emailNotifications`, `smsNotifications`, `createdAt`, `updatedAt`) VALUES
(1, 2, 1, 1, 0, '2026-01-13 10:28:37.035', '2026-01-13 10:28:37.035');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(191) NOT NULL,
  `level` enum('BEGINNER','INTERMEDIATE','ADVANCED') NOT NULL DEFAULT 'BEGINNER',
  `duration` int(11) NOT NULL,
  `instructor` varchar(191) NOT NULL,
  `totalLessons` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courseenrollment`
--

CREATE TABLE `courseenrollment` (
  `id` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `status` enum('NOT_STARTED','IN_PROGRESS','COMPLETED') NOT NULL DEFAULT 'NOT_STARTED',
  `progress` int(11) NOT NULL DEFAULT 0,
  `enrolledAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `completedAt` datetime(3) DEFAULT NULL,
  `certificateUrl` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `creditrequest`
--

CREATE TABLE `creditrequest` (
  `id` int(11) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `reason` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `reviewedAt` datetime(3) DEFAULT NULL,
  `reviewNotes` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customerorder`
--

CREATE TABLE `customerorder` (
  `id` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `orderType` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `currency` varchar(191) NOT NULL DEFAULT 'RWF',
  `items` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customerorder`
--

INSERT INTO `customerorder` (`id`, `consumerId`, `orderType`, `status`, `amount`, `currency`, `items`, `metadata`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'gas', 'completed', 300, 'RWF', '[{\"meterNumber\":\"MTR-399703\",\"units\":0.33,\"amount\":300}]', '{\"paymentMethod\":\"nfc_card\"}', '2026-01-14 07:04:48.860', '2026-01-14 07:04:48.860'),
(2, 2, 'gas', 'completed', 300, 'RWF', '[{\"meterNumber\":\"MTR-399703\",\"units\":0.33,\"amount\":300}]', '{\"paymentMethod\":\"nfc_card\"}', '2026-01-14 07:20:10.188', '2026-01-14 07:20:10.188'),
(3, 2, 'gas', 'completed', 300, 'RWF', '[{\"meterNumber\":\"MTR-399703\",\"units\":0.33,\"amount\":300}]', '{\"paymentMethod\":\"nfc_card\"}', '2026-01-14 07:22:07.597', '2026-01-14 07:22:07.597'),
(4, 2, 'gas', 'completed', 300, 'RWF', '[{\"meterNumber\":\"MTR-399703\",\"units\":1,\"amount\":300}]', '{\"paymentMethod\":\"nfc_card\"}', '2026-01-14 07:24:59.322', '2026-01-14 07:24:59.322'),
(5, 2, 'gas', 'completed', 300, 'RWF', '[{\"meterNumber\":\"MTR-399703\",\"units\":0.2,\"amount\":300}]', '{\"paymentMethod\":\"nfc_card\"}', '2026-01-14 07:33:04.748', '2026-01-14 07:33:04.748');

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

CREATE TABLE `deal` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `clientName` varchar(191) NOT NULL,
  `value` double NOT NULL,
  `stage` varchar(191) NOT NULL,
  `probability` double NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expectedCloseDate` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employeeprofile`
--

CREATE TABLE `employeeprofile` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `employeeNumber` varchar(191) NOT NULL,
  `department` varchar(191) NOT NULL,
  `position` varchar(191) NOT NULL,
  `bankAccount` varchar(191) DEFAULT NULL,
  `joiningDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `salary` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employeeprofile`
--

INSERT INTO `employeeprofile` (`id`, `userId`, `employeeNumber`, `department`, `position`, `bankAccount`, `joiningDate`, `salary`, `status`, `updatedAt`) VALUES
(1, 2, 'EMP001', 'Sales', 'Sales Representative', NULL, '2026-01-13 07:37:19.928', 0, 'active', '2026-01-13 07:37:19.928');

-- --------------------------------------------------------

--
-- Table structure for table `gasmeter`
--

CREATE TABLE `gasmeter` (
  `id` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `meterNumber` varchar(191) NOT NULL,
  `aliasName` varchar(191) DEFAULT NULL,
  `ownerName` varchar(191) DEFAULT NULL,
  `ownerPhone` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `currentUnits` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gasmeter`
--

INSERT INTO `gasmeter` (`id`, `consumerId`, `meterNumber`, `aliasName`, `ownerName`, `ownerPhone`, `status`, `createdAt`, `updatedAt`, `currentUnits`) VALUES
(1, 2, 'MTR-399703', 'kk', 'kapil', '250788100001', 'active', '2026-01-14 06:43:46.454', '2026-01-14 06:43:46.454', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gasreward`
--

CREATE TABLE `gasreward` (
  `id` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `units` double NOT NULL,
  `source` varchar(191) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gasreward`
--

INSERT INTO `gasreward` (`id`, `consumerId`, `units`, `source`, `reference`, `createdAt`, `updatedAt`) VALUES
(1, 2, 0.033, 'purchase', '1', '2026-01-14 07:04:48.891', '2026-01-14 07:04:48.891'),
(2, 2, 0.033, 'purchase', '2', '2026-01-14 07:20:10.217', '2026-01-14 07:20:10.217'),
(3, 2, 0.033, 'purchase', '3', '2026-01-14 07:22:07.627', '2026-01-14 07:22:07.627'),
(4, 2, 0.1, 'purchase', '4', '2026-01-14 07:24:59.333', '2026-01-14 07:24:59.333'),
(5, 2, 0.02, 'purchase', '5', '2026-01-14 07:33:04.779', '2026-01-14 07:33:04.779');

-- --------------------------------------------------------

--
-- Table structure for table `gastopup`
--

CREATE TABLE `gastopup` (
  `id` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `meterId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `units` double NOT NULL,
  `currency` varchar(191) NOT NULL DEFAULT 'RWF',
  `status` varchar(191) NOT NULL DEFAULT 'completed',
  `orderId` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gastopup`
--

INSERT INTO `gastopup` (`id`, `consumerId`, `meterId`, `amount`, `units`, `currency`, `status`, `orderId`, `createdAt`, `updatedAt`) VALUES
(1, 2, 1, 300, 0.33, 'RWF', 'completed', NULL, '2026-01-14 07:04:48.825', '2026-01-14 07:04:48.825'),
(2, 2, 1, 300, 0.33, 'RWF', 'completed', NULL, '2026-01-14 07:20:10.166', '2026-01-14 07:20:10.166'),
(3, 2, 1, 300, 0.33, 'RWF', 'completed', NULL, '2026-01-14 07:22:07.587', '2026-01-14 07:22:07.587'),
(4, 2, 1, 300, 1, 'RWF', 'completed', NULL, '2026-01-14 07:24:59.310', '2026-01-14 07:24:59.310'),
(5, 2, 1, 300, 0.2, 'RWF', 'completed', NULL, '2026-01-14 07:33:04.742', '2026-01-14 07:33:04.742'),
(6, 2, 1, 0, -0.1, 'RWF', 'consumed', 'Cooking Session', '2026-01-14 07:41:12.687', '2026-01-14 07:41:12.687');

-- --------------------------------------------------------

--
-- Table structure for table `jobapplication`
--

CREATE TABLE `jobapplication` (
  `id` int(11) NOT NULL,
  `jobId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `resumeUrl` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'applied',
  `appliedDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobposting`
--

CREATE TABLE `jobposting` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `department` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `salaryMin` double NOT NULL,
  `salaryMax` double NOT NULL,
  `location` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'open',
  `postedDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaverequest`
--

CREATE TABLE `leaverequest` (
  `id` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) NOT NULL,
  `reason` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `approvedBy` varchar(191) DEFAULT NULL,
  `rejectionReason` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessonprogress`
--

CREATE TABLE `lessonprogress` (
  `id` int(11) NOT NULL,
  `enrollmentId` int(11) NOT NULL,
  `lessonId` int(11) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(191) NOT NULL,
  `dueDate` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `consumerId`, `amount`, `status`, `dueDate`, `createdAt`, `updatedAt`) VALUES
(1, 2, 100, 'repaid', '2026-02-12 10:04:04.509', '2026-01-13 09:08:51.787', '2026-01-13 12:17:11.956'),
(2, 2, 80, 'repaid', '2026-02-12 10:10:22.469', '2026-01-13 10:09:50.035', '2026-01-13 12:07:26.689'),
(3, 2, 10000, 'approved', '2026-02-12 11:33:50.264', '2026-01-13 11:33:32.551', '2026-01-13 11:33:50.266');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `content` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nfccard`
--

CREATE TABLE `nfccard` (
  `id` int(11) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `pin` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `consumerId` int(11) DEFAULT NULL,
  `retailerId` int(11) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `cardType` varchar(191) DEFAULT NULL,
  `cardholderName` varchar(191) DEFAULT NULL,
  `nationalId` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `province` varchar(191) DEFAULT NULL,
  `district` varchar(191) DEFAULT NULL,
  `sector` varchar(191) DEFAULT NULL,
  `cell` varchar(191) DEFAULT NULL,
  `streetAddress` varchar(191) DEFAULT NULL,
  `landmark` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nfccard`
--

INSERT INTO `nfccard` (`id`, `uid`, `pin`, `status`, `consumerId`, `retailerId`, `balance`, `cardType`, `cardholderName`, `nationalId`, `phone`, `email`, `province`, `district`, `sector`, `cell`, `streetAddress`, `landmark`, `createdAt`, `updatedAt`) VALUES
(1, '122344445', '1234', 'available', NULL, NULL, 0, 'Premium Card', 'kjkbhi', '522', '252952', 'superadmin@society.com', 'Kigali', 'mp', 'dfvdgf', '0', 'Nvodaya library', NULL, '2026-01-13 10:14:01.903', '2026-01-13 10:51:40.363'),
(2, 'NFC-2026-944739', '0000', 'active', 2, NULL, 0, 'Personal', 'Demo Consumer', 'IN9505151234', '250788100001', 'superadmin@society.com', 'Kigali', 'mp', 'qw', 's', 'Nvodaya library', NULL, '2026-01-13 10:54:51.828', '2026-01-14 07:33:04.771');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `wholesalerId` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `totalAmount` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `category` varchar(191) NOT NULL,
  `price` double NOT NULL,
  `costPrice` double DEFAULT NULL,
  `retailerPrice` double DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `retailerId` int(11) DEFAULT NULL,
  `wholesalerId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `barcode` varchar(191) DEFAULT NULL,
  `invoiceNumber` varchar(191) DEFAULT NULL,
  `lowStockThreshold` int(11) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `supplierId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `sku`, `category`, `price`, `costPrice`, `retailerPrice`, `stock`, `retailerId`, `wholesalerId`, `createdAt`, `updatedAt`, `barcode`, `invoiceNumber`, `lowStockThreshold`, `unit`, `status`, `supplierId`) VALUES
(1, 'Rice 25kg', NULL, NULL, 'Grains', 35000, 12, NULL, 100, NULL, 1, '2026-01-13 07:37:20.805', '2026-01-13 09:22:31.134', NULL, NULL, NULL, NULL, 'active', NULL),
(2, 'Cooking Oil 5L', NULL, NULL, 'Oils', 12000, NULL, 0, 49, NULL, 1, '2026-01-13 07:37:20.815', '2026-01-13 07:40:13.077', NULL, NULL, NULL, NULL, 'active', NULL),
(3, 'Sugar 1kg', NULL, NULL, 'Sweeteners', 1500, NULL, 0, 200, NULL, 1, '2026-01-13 07:37:20.822', '2026-01-13 09:22:47.465', NULL, NULL, NULL, NULL, 'inactive', NULL),
(4, 'Beans 1kg', NULL, NULL, 'Grains', 1200, NULL, 0, 149, NULL, 1, '2026-01-13 07:37:20.826', '2026-01-13 08:50:06.119', NULL, NULL, NULL, NULL, 'active', NULL),
(5, 'Maize Flour 1kg', NULL, NULL, 'Flour', 800, NULL, 0, 300, NULL, 1, '2026-01-13 07:37:20.829', '2026-01-13 07:37:20.829', NULL, NULL, NULL, NULL, 'active', NULL),
(6, 'Bread', NULL, NULL, 'Bakery', 500, NULL, 0, 50, 1, NULL, '2026-01-13 07:37:20.834', '2026-01-13 07:37:20.834', NULL, NULL, NULL, NULL, 'active', NULL),
(7, 'Milk 1L', NULL, NULL, 'Dairy', 1000, NULL, 0, 30, 1, NULL, '2026-01-13 07:37:20.839', '2026-01-13 07:37:20.839', NULL, NULL, NULL, NULL, 'active', NULL),
(8, 'Eggs (12)', NULL, NULL, 'Dairy', 3000, NULL, 0, 20, 1, NULL, '2026-01-13 07:37:20.843', '2026-01-13 07:37:20.843', NULL, NULL, NULL, NULL, 'active', NULL),
(9, 'Soap', NULL, NULL, 'Hygiene', 800, NULL, 0, 40, 1, NULL, '2026-01-13 07:37:20.847', '2026-01-13 07:37:20.847', NULL, NULL, NULL, NULL, 'active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profitinvoice`
--

CREATE TABLE `profitinvoice` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `profitAmount` double NOT NULL,
  `invoiceNumber` varchar(191) NOT NULL,
  `generatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('NOT_STARTED','IN_PROGRESS','ON_HOLD','COMPLETED','CANCELLED') NOT NULL DEFAULT 'NOT_STARTED',
  `priority` enum('LOW','MEDIUM','HIGH','URGENT') NOT NULL DEFAULT 'MEDIUM',
  `progress` int(11) NOT NULL DEFAULT 0,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) DEFAULT NULL,
  `dueDate` datetime(3) NOT NULL,
  `client` varchar(191) DEFAULT NULL,
  `managerId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectmember`
--

CREATE TABLE `projectmember` (
  `id` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `role` varchar(191) NOT NULL,
  `joinedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retailercredit`
--

CREATE TABLE `retailercredit` (
  `id` int(11) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `creditLimit` double NOT NULL DEFAULT 0,
  `usedCredit` double NOT NULL DEFAULT 0,
  `availableCredit` double NOT NULL DEFAULT 0,
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `retailercredit`
--

INSERT INTO `retailercredit` (`id`, `retailerId`, `creditLimit`, `usedCredit`, `availableCredit`, `updatedAt`) VALUES
(1, 1, 0, 0, 0, '2026-01-13 07:40:45.918');

-- --------------------------------------------------------

--
-- Table structure for table `retailerprofile`
--

CREATE TABLE `retailerprofile` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `shopName` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `creditLimit` double NOT NULL DEFAULT 0,
  `walletBalance` double NOT NULL DEFAULT 0,
  `isVerified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `retailerprofile`
--

INSERT INTO `retailerprofile` (`id`, `userId`, `shopName`, `address`, `creditLimit`, `walletBalance`, `isVerified`) VALUES
(1, 4, 'Corner Shop111', 'Kigali, Rwanda', 1000000, 50100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `consumerId` int(11) DEFAULT NULL,
  `branchId` int(11) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `totalAmount` double NOT NULL,
  `paymentMethod` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `retailerId`, `consumerId`, `branchId`, `status`, `totalAmount`, `paymentMethod`, `createdAt`, `updatedAt`) VALUES
(1, 1, NULL, NULL, 'completed', 14160, 'dashboard_wallet', '2026-01-13 07:40:13.072', '2026-01-13 07:40:13.072'),
(2, 1, NULL, NULL, 'completed', 1416, 'dashboard_wallet', '2026-01-13 08:50:06.105', '2026-01-13 08:50:06.105'),
(3, 1, 2, NULL, 'pending', 1500, 'mobile_money', '2026-01-13 11:27:44.218', '2026-01-13 11:27:44.218'),
(4, 1, 2, NULL, 'pending', 500, 'nfc_card', '2026-01-13 11:37:48.942', '2026-01-13 11:37:48.942'),
(5, 1, 2, NULL, 'pending', 500, 'nfc_card', '2026-01-13 11:49:19.087', '2026-01-13 11:49:19.087');

-- --------------------------------------------------------

--
-- Table structure for table `saleitem`
--

CREATE TABLE `saleitem` (
  `id` int(11) NOT NULL,
  `saleId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saleitem`
--

INSERT INTO `saleitem` (`id`, `saleId`, `productId`, `quantity`, `price`) VALUES
(1, 1, 2, 1, 12000),
(2, 2, 4, 1, 1200),
(3, 3, 7, 1, 1000),
(4, 3, 6, 1, 500),
(5, 4, 6, 1, 500),
(6, 5, 6, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `contactPerson` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `wholesalerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `contactPerson`, `phone`, `email`, `address`, `status`, `createdAt`, `updatedAt`, `wholesalerId`) VALUES
(1, 'redmi12', 'kapil', '07354598628', 'kapilpatidarkapil0812@gmail.com', 'Nvodaya library\nkhandawa naka', 'active', '2026-01-13 07:53:25.888', '2026-01-13 08:43:03.229', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplierpayment`
--

CREATE TABLE `supplierpayment` (
  `id` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paymentDate` datetime(3) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'completed',
  `notes` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `wholesalerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemconfig`
--

CREATE TABLE `systemconfig` (
  `id` int(11) NOT NULL,
  `retailerShare` double NOT NULL DEFAULT 60,
  `companyShare` double NOT NULL DEFAULT 28,
  `gasRewardShare` double NOT NULL DEFAULT 12,
  `gasPricePerM3` double NOT NULL DEFAULT 850,
  `minGasTopup` double NOT NULL DEFAULT 500,
  `maxGasTopup` double NOT NULL DEFAULT 100000,
  `minWalletTopup` double NOT NULL DEFAULT 500,
  `maxWalletTopup` double NOT NULL DEFAULT 500000,
  `maxDailyTransaction` double NOT NULL DEFAULT 1000000,
  `maxCreditLimit` double NOT NULL DEFAULT 500000,
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `systemconfig`
--

INSERT INTO `systemconfig` (`id`, `retailerShare`, `companyShare`, `gasRewardShare`, `gasPricePerM3`, `minGasTopup`, `maxGasTopup`, `minWalletTopup`, `maxWalletTopup`, `maxDailyTransaction`, `maxCreditLimit`, `updatedAt`, `createdAt`) VALUES
(1, 60, 30, 12, 850, 500, 100000, 500, 500000, 1000000, 500000, '2026-01-13 09:13:37.758', '2026-01-13 09:13:19.478');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('TODO','IN_PROGRESS','IN_REVIEW','COMPLETED','CANCELLED') NOT NULL DEFAULT 'TODO',
  `assignedToId` int(11) DEFAULT NULL,
  `dueDate` datetime(3) DEFAULT NULL,
  `estimatedHours` double DEFAULT NULL,
  `actualHours` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminal`
--

CREATE TABLE `terminal` (
  `id` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `serialNumber` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `pin` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `role` enum('consumer','retailer','wholesaler','employee','admin') NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `phone`, `password`, `pin`, `name`, `role`, `isActive`, `createdAt`, `updatedAt`) VALUES
(1, 'admin@bigcompany.rw', NULL, '$2b$10$hXaVMFiob2pfx1mBJxft4e.xHdJqQNNWShKwNJpNs5dmmrtZCX/oa', NULL, 'System Administrator', 'admin', 1, '2026-01-13 07:37:19.742', '2026-01-13 07:37:19.742'),
(2, 'employee@bigcompany.rw', '250788200001', '$2b$10$l9nNSDKOmOtxnD.pmfHVXOwL7igHcoJBUkkDR3HoUGEW4GCk.KwPe', NULL, 'John Employee', 'employee', 1, '2026-01-13 07:37:19.928', '2026-01-13 07:37:19.928'),
(3, 'wholesaler@bigcompany.rw', '250788300001', '$2b$10$FSk/rwBhTClaIKoOiLZSWOrQt/21rWKOgZssXGyX5hXF/nltej0eW', NULL, 'Big Wholesale Co.', 'wholesaler', 1, '2026-01-13 07:37:20.097', '2026-01-13 09:17:54.229'),
(4, 'retailer@bigcompany.rw', '250788400001', '$2b$10$0mQgiG7Cb8eJomOgcUUR2.n5DollS1QWwd.AnEh1updMLYvVFCUru', NULL, 'Corner Shop111', 'retailer', 1, '2026-01-13 07:37:20.247', '2026-01-14 06:47:10.195'),
(5, 'consumer@bigcompany.rw', '250788123456', '$2b$10$DlQOCpNdqT2b73tLCTpPC.p2xwDWt.aZoDYr80HF9wcvdYDQv.AFm', '$2b$10$VMCnYKYmf2rCVTTUqLZDSeZE9FMsy6OU96o5NGIoPpsVpzOyQokVu', 'Jane Consumer', 'consumer', 1, '2026-01-13 07:37:20.519', '2026-01-13 09:25:27.219'),
(6, 'consumer2@bigcompany.rw', '250788100001', '$2b$10$tCkFM8JwvQz1avZdp3eEqeLycMdVXRWAzRyGyY8Zv67w6q3JAZUVy', '$2b$10$/B0bwGghy.VlFkbhTe5XlukaVTu5N7SNMsK0otWwwD.CXxHZAGfbK', 'Demo Consumer', 'consumer', 1, '2026-01-13 07:37:20.788', '2026-01-13 09:25:28.864'),
(7, 'jhon1@gmail.com', '7314598628', '$2b$10$88WaqCwTyBNZft0UNxDpBeyESMluFnpHPqDG0nZlABZwK2VeG0Nrq', NULL, 'Jhon1', 'consumer', 1, '2026-01-14 08:37:02.522', '2026-01-14 08:49:19.905'),
(8, 'kapilpatidarkapil0812@gmail.com', '+917354598628', '$2b$10$NlKgr2tmfDKkm4GotdKkdO4BsLXN/njo8jZfWQOJWtTRUutln4Szm', NULL, 'Kapilpatidarkapil0812', 'consumer', 1, '2026-01-14 08:41:11.682', '2026-01-14 08:49:19.918'),
(9, 'testuser@example.com', '+250788999888', '$2b$10$CUpg9j7Cs9pKixXyy7U.B.ZTrojEABlyww5UbgD0FnAbsZmD9zdrG', NULL, 'Test User', 'consumer', 1, '2026-01-14 08:45:41.955', '2026-01-14 08:45:41.955'),
(10, 'kapilpatidarkapi0812@gmail.com', '+91735459862', '$2b$10$1oYp/sOL3qejlMMpbGaTz.8G5LkHj8d3vK5/ZtxTV10lFRzgORQfa', NULL, 'Kapilpatidarkapi0812', 'consumer', 1, '2026-01-14 08:47:09.917', '2026-01-14 08:49:19.927'),
(11, 'kapilpatpil0812@gmail.com', '12345345678', '$2b$10$P41u4/BKPMKyaAD4gY2lJ.n2yX8ejcc.UT9Pa9cR8U8eyO2BxsTKm', NULL, 'Kapilpatpil0812', 'consumer', 1, '2026-01-14 08:50:48.471', '2026-01-14 08:53:20.666'),
(12, 'superadmin@society.com', '34567896', '$2b$10$4dSRKP1q4ddZGRsYWxoQA.CnC8xdKcJo2xqOfcda66qyv3zfBh5e.', NULL, 'undefined undefined', 'consumer', 1, '2026-01-14 08:55:06.064', '2026-01-14 08:55:06.064');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `consumerId` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `currency` varchar(191) NOT NULL DEFAULT 'RWF',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `consumerId`, `type`, `balance`, `currency`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'credit_wallet', 8000, 'RWF', '2026-01-13 10:04:04.538', '2026-01-14 07:14:01.037'),
(2, 2, 'dashboard_wallet', 9600, 'RWF', '2026-01-13 11:11:40.047', '2026-01-14 07:19:19.613');

-- --------------------------------------------------------

--
-- Table structure for table `wallettransaction`
--

CREATE TABLE `wallettransaction` (
  `id` int(11) NOT NULL,
  `walletId` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'completed',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallettransaction`
--

INSERT INTO `wallettransaction` (`id`, `walletId`, `type`, `amount`, `description`, `reference`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'loan_disbursement', 100, 'Loan Approved by Admin', '1', 'completed', '2026-01-13 10:04:04.557', '2026-01-13 10:04:04.557'),
(2, 1, 'loan_disbursement', 80, 'Loan Approved by Admin', '2', 'completed', '2026-01-13 10:10:22.477', '2026-01-13 10:10:22.477'),
(3, 2, 'topup', 100, 'Wallet topup via mobile_money', NULL, 'completed', '2026-01-13 11:11:40.111', '2026-01-13 11:11:40.111'),
(4, 2, 'refund', 33, 'a', NULL, 'pending', '2026-01-13 11:12:13.671', '2026-01-13 11:12:13.671'),
(5, 2, 'nfc_topup', -100, 'Top-up NFC Card 4739', 'NFC-2026-944739', 'completed', '2026-01-13 11:19:35.671', '2026-01-13 11:19:35.671'),
(6, 2, 'nfc_topup', -100, 'Top-up NFC Card 4739', 'NFC-2026-944739', 'completed', '2026-01-13 11:21:03.671', '2026-01-13 11:21:03.671'),
(7, 2, 'nfc_topup', -100, 'Top-up NFC Card 4739', 'NFC-2026-944739', 'completed', '2026-01-13 11:21:14.061', '2026-01-13 11:21:14.061'),
(8, 2, 'nfc_topup', -100, 'Top-up NFC Card 4739', 'NFC-2026-944739', 'completed', '2026-01-13 11:21:45.437', '2026-01-13 11:21:45.437'),
(9, 2, 'nfc_topup', -100, 'Top-up NFC Card 4739', 'NFC-2026-944739', 'completed', '2026-01-13 11:25:37.281', '2026-01-13 11:25:37.281'),
(10, 1, 'loan_disbursement', 10000, 'Loan Approved by Admin', '3', 'completed', '2026-01-13 11:33:50.288', '2026-01-13 11:33:50.288'),
(11, 1, 'nfc_topup', -1000, 'Top-up NFC Card 4739 (Credit)', 'NFC-2026-944739', 'completed', '2026-01-13 11:48:36.393', '2026-01-13 11:48:36.393'),
(12, 1, 'debit', -80, 'Loan Repayment (via Unused Credit)', '2', 'completed', '2026-01-13 12:07:26.660', '2026-01-13 12:07:26.660'),
(13, 1, 'debit', -100, 'Loan Repayment (via Unused Credit)', '1', 'completed', '2026-01-13 12:17:11.939', '2026-01-13 12:17:11.939'),
(14, 1, 'nfc_topup', -1000, 'Top-up NFC Card 4739 (Credit)', 'NFC-2026-944739', 'completed', '2026-01-14 07:14:01.073', '2026-01-14 07:14:01.073');

-- --------------------------------------------------------

--
-- Table structure for table `wholesalerprofile`
--

CREATE TABLE `wholesalerprofile` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `companyName` varchar(191) NOT NULL,
  `contactPerson` varchar(191) DEFAULT NULL,
  `tinNumber` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wholesalerprofile`
--

INSERT INTO `wholesalerprofile` (`id`, `userId`, `companyName`, `contactPerson`, `tinNumber`, `address`, `isVerified`) VALUES
(1, 3, 'Big Wholesale Co.', NULL, NULL, 'Kigali, Rwanda', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wholesalersettings`
--

CREATE TABLE `wholesalersettings` (
  `id` int(11) NOT NULL,
  `wholesalerId` int(11) NOT NULL,
  `pushNotifications` tinyint(1) NOT NULL DEFAULT 1,
  `emailNotifications` tinyint(1) NOT NULL DEFAULT 1,
  `smsNotifications` tinyint(1) NOT NULL DEFAULT 1,
  `ussdAlerts` tinyint(1) NOT NULL DEFAULT 0,
  `ussdBusinessCode` varchar(191) NOT NULL DEFAULT 'WHL001',
  `ussdLanguage` varchar(191) NOT NULL DEFAULT 'en',
  `ussdAutoResponse` tinyint(1) NOT NULL DEFAULT 1,
  `paymentTerms` varchar(191) NOT NULL DEFAULT 'net30',
  `defaultCreditLimit` double NOT NULL DEFAULT 50000,
  `acceptedPayments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`acceptedPayments`)),
  `receiptPrinter` varchar(191) NOT NULL DEFAULT 'bluetooth',
  `barcodeScanner` varchar(191) NOT NULL DEFAULT 'camera',
  `nfcEnabled` tinyint(1) NOT NULL DEFAULT 1,
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wholesalersettings`
--

INSERT INTO `wholesalersettings` (`id`, `wholesalerId`, `pushNotifications`, `emailNotifications`, `smsNotifications`, `ussdAlerts`, `ussdBusinessCode`, `ussdLanguage`, `ussdAutoResponse`, `paymentTerms`, `defaultCreditLimit`, `acceptedPayments`, `receiptPrinter`, `barcodeScanner`, `nfcEnabled`, `updatedAt`) VALUES
(1, 1, 1, 1, 1, 0, 'WHL001', 'en', 1, 'net30', 50000, NULL, 'bluetooth', 'camera', 1, '2026-01-13 08:46:31.261');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Attendance_employeeId_fkey` (`employeeId`);

--
-- Indexes for table `billpayment`
--
ALTER TABLE `billpayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BillPayment_employeeId_fkey` (`employeeId`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Branch_retailerId_fkey` (`retailerId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Category_code_key` (`code`);

--
-- Indexes for table `consumerprofile`
--
ALTER TABLE `consumerprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ConsumerProfile_userId_key` (`userId`);

--
-- Indexes for table `consumersettings`
--
ALTER TABLE `consumersettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `consumerSettings_consumerId_unique` (`consumerId`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courseenrollment`
--
ALTER TABLE `courseenrollment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CourseEnrollment_courseId_employeeId_key` (`courseId`,`employeeId`),
  ADD KEY `CourseEnrollment_courseId_fkey` (`courseId`),
  ADD KEY `CourseEnrollment_employeeId_fkey` (`employeeId`);

--
-- Indexes for table `creditrequest`
--
ALTER TABLE `creditrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CreditRequest_retailerId_fkey` (`retailerId`);

--
-- Indexes for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CustomerOrder_consumerId_fkey` (`consumerId`);

--
-- Indexes for table `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeeprofile`
--
ALTER TABLE `employeeprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EmployeeProfile_userId_key` (`userId`),
  ADD UNIQUE KEY `EmployeeProfile_employeeNumber_key` (`employeeNumber`);

--
-- Indexes for table `gasmeter`
--
ALTER TABLE `gasmeter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GasMeter_meterNumber_key` (`meterNumber`),
  ADD KEY `GasMeter_consumerId_fkey` (`consumerId`);

--
-- Indexes for table `gasreward`
--
ALTER TABLE `gasreward`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GasReward_consumerId_fkey` (`consumerId`);

--
-- Indexes for table `gastopup`
--
ALTER TABLE `gastopup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GasTopup_consumerId_fkey` (`consumerId`),
  ADD KEY `GasTopup_meterId_fkey` (`meterId`);

--
-- Indexes for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `JobApplication_jobId_fkey` (`jobId`);

--
-- Indexes for table `jobposting`
--
ALTER TABLE `jobposting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaverequest`
--
ALTER TABLE `leaverequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `LeaveRequest_employeeId_fkey` (`employeeId`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Lesson_courseId_fkey` (`courseId`);

--
-- Indexes for table `lessonprogress`
--
ALTER TABLE `lessonprogress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `LessonProgress_enrollmentId_lessonId_key` (`enrollmentId`,`lessonId`),
  ADD KEY `LessonProgress_enrollmentId_fkey` (`enrollmentId`),
  ADD KEY `LessonProgress_lessonId_fkey` (`lessonId`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Loan_consumerId_fkey` (`consumerId`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Message_receiverId_fkey` (`receiverId`),
  ADD KEY `Message_senderId_fkey` (`senderId`);

--
-- Indexes for table `nfccard`
--
ALTER TABLE `nfccard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NfcCard_uid_key` (`uid`),
  ADD KEY `NfcCard_consumerId_fkey` (`consumerId`),
  ADD KEY `NfcCard_retailerId_fkey` (`retailerId`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Notification_userId_fkey` (`userId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_retailerId_fkey` (`retailerId`),
  ADD KEY `Order_wholesalerId_fkey` (`wholesalerId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderItem_orderId_fkey` (`orderId`),
  ADD KEY `OrderItem_productId_fkey` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Product_retailerId_fkey` (`retailerId`),
  ADD KEY `Product_supplierId_fkey` (`supplierId`),
  ADD KEY `Product_wholesalerId_fkey` (`wholesalerId`);

--
-- Indexes for table `profitinvoice`
--
ALTER TABLE `profitinvoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ProfitInvoice_orderId_key` (`orderId`),
  ADD UNIQUE KEY `ProfitInvoice_invoiceNumber_key` (`invoiceNumber`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Project_managerId_fkey` (`managerId`);

--
-- Indexes for table `projectmember`
--
ALTER TABLE `projectmember`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ProjectMember_projectId_employeeId_key` (`projectId`,`employeeId`),
  ADD KEY `ProjectMember_projectId_fkey` (`projectId`),
  ADD KEY `ProjectMember_employeeId_fkey` (`employeeId`);

--
-- Indexes for table `retailercredit`
--
ALTER TABLE `retailercredit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `RetailerCredit_retailerId_key` (`retailerId`);

--
-- Indexes for table `retailerprofile`
--
ALTER TABLE `retailerprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `retailerProfile_userId_key` (`userId`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Sale_branchId_fkey` (`branchId`),
  ADD KEY `Sale_consumerId_fkey` (`consumerId`),
  ADD KEY `Sale_retailerId_fkey` (`retailerId`);

--
-- Indexes for table `saleitem`
--
ALTER TABLE `saleitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SaleItem_productId_fkey` (`productId`),
  ADD KEY `SaleItem_saleId_fkey` (`saleId`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Supplier_wholesalerId_fkey` (`wholesalerId`);

--
-- Indexes for table `supplierpayment`
--
ALTER TABLE `supplierpayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SupplierPayment_supplierId_fkey` (`supplierId`),
  ADD KEY `SupplierPayment_wholesalerId_fkey` (`wholesalerId`);

--
-- Indexes for table `systemconfig`
--
ALTER TABLE `systemconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Task_projectId_fkey` (`projectId`),
  ADD KEY `Task_assignedToId_fkey` (`assignedToId`);

--
-- Indexes for table `terminal`
--
ALTER TABLE `terminal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Terminal_serialNumber_key` (`serialNumber`),
  ADD KEY `Terminal_branchId_fkey` (`branchId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_key` (`email`),
  ADD UNIQUE KEY `user_phone_key` (`phone`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Wallet_consumerId_type_key` (`consumerId`,`type`);

--
-- Indexes for table `wallettransaction`
--
ALTER TABLE `wallettransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `WalletTransaction_walletId_fkey` (`walletId`);

--
-- Indexes for table `wholesalerprofile`
--
ALTER TABLE `wholesalerprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wholesalerProfile_userId_key` (`userId`);

--
-- Indexes for table `wholesalersettings`
--
ALTER TABLE `wholesalersettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wholesalerSettings_wholesalerId_key` (`wholesalerId`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billpayment`
--
ALTER TABLE `billpayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `consumerprofile`
--
ALTER TABLE `consumerprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `consumersettings`
--
ALTER TABLE `consumersettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courseenrollment`
--
ALTER TABLE `courseenrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `creditrequest`
--
ALTER TABLE `creditrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customerorder`
--
ALTER TABLE `customerorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deal`
--
ALTER TABLE `deal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employeeprofile`
--
ALTER TABLE `employeeprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gasmeter`
--
ALTER TABLE `gasmeter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gasreward`
--
ALTER TABLE `gasreward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gastopup`
--
ALTER TABLE `gastopup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobapplication`
--
ALTER TABLE `jobapplication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobposting`
--
ALTER TABLE `jobposting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaverequest`
--
ALTER TABLE `leaverequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessonprogress`
--
ALTER TABLE `lessonprogress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nfccard`
--
ALTER TABLE `nfccard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profitinvoice`
--
ALTER TABLE `profitinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projectmember`
--
ALTER TABLE `projectmember`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retailercredit`
--
ALTER TABLE `retailercredit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `retailerprofile`
--
ALTER TABLE `retailerprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `saleitem`
--
ALTER TABLE `saleitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplierpayment`
--
ALTER TABLE `supplierpayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemconfig`
--
ALTER TABLE `systemconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terminal`
--
ALTER TABLE `terminal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallettransaction`
--
ALTER TABLE `wallettransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wholesalerprofile`
--
ALTER TABLE `wholesalerprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wholesalersettings`
--
ALTER TABLE `wholesalersettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `Attendance_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employeeprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `billpayment`
--
ALTER TABLE `billpayment`
  ADD CONSTRAINT `BillPayment_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employeeprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `Branch_retailerId_fkey` FOREIGN KEY (`retailerId`) REFERENCES `retailerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `consumerprofile`
--
ALTER TABLE `consumerprofile`
  ADD CONSTRAINT `ConsumerProfile_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `consumersettings`
--
ALTER TABLE `consumersettings`
  ADD CONSTRAINT `consumerSettings_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `courseenrollment`
--
ALTER TABLE `courseenrollment`
  ADD CONSTRAINT `CourseEnrollment_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CourseEnrollment_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employeeprofile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditrequest`
--
ALTER TABLE `creditrequest`
  ADD CONSTRAINT `CreditRequest_retailerId_fkey` FOREIGN KEY (`retailerId`) REFERENCES `retailerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD CONSTRAINT `CustomerOrder_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `employeeprofile`
--
ALTER TABLE `employeeprofile`
  ADD CONSTRAINT `EmployeeProfile_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gasmeter`
--
ALTER TABLE `gasmeter`
  ADD CONSTRAINT `GasMeter_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `gasreward`
--
ALTER TABLE `gasreward`
  ADD CONSTRAINT `GasReward_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `gastopup`
--
ALTER TABLE `gastopup`
  ADD CONSTRAINT `GasTopup_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `GasTopup_meterId_fkey` FOREIGN KEY (`meterId`) REFERENCES `gasmeter` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD CONSTRAINT `JobApplication_jobId_fkey` FOREIGN KEY (`jobId`) REFERENCES `jobposting` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `leaverequest`
--
ALTER TABLE `leaverequest`
  ADD CONSTRAINT `LeaveRequest_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employeeprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `Lesson_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lessonprogress`
--
ALTER TABLE `lessonprogress`
  ADD CONSTRAINT `LessonProgress_enrollmentId_fkey` FOREIGN KEY (`enrollmentId`) REFERENCES `courseenrollment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `LessonProgress_lessonId_fkey` FOREIGN KEY (`lessonId`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `Loan_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `Message_receiverId_fkey` FOREIGN KEY (`receiverId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Message_senderId_fkey` FOREIGN KEY (`senderId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `nfccard`
--
ALTER TABLE `nfccard`
  ADD CONSTRAINT `NfcCard_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `NfcCard_retailerId_fkey` FOREIGN KEY (`retailerId`) REFERENCES `retailerprofile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_retailerId_fkey` FOREIGN KEY (`retailerId`) REFERENCES `retailerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_wholesalerId_fkey` FOREIGN KEY (`wholesalerId`) REFERENCES `wholesalerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `OrderItem_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_retailerId_fkey` FOREIGN KEY (`retailerId`) REFERENCES `retailerprofile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_wholesalerId_fkey` FOREIGN KEY (`wholesalerId`) REFERENCES `wholesalerprofile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `profitinvoice`
--
ALTER TABLE `profitinvoice`
  ADD CONSTRAINT `ProfitInvoice_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `Project_managerId_fkey` FOREIGN KEY (`managerId`) REFERENCES `employeeprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `projectmember`
--
ALTER TABLE `projectmember`
  ADD CONSTRAINT `ProjectMember_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employeeprofile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ProjectMember_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retailercredit`
--
ALTER TABLE `retailercredit`
  ADD CONSTRAINT `RetailerCredit_retailerId_fkey` FOREIGN KEY (`retailerId`) REFERENCES `retailerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `retailerprofile`
--
ALTER TABLE `retailerprofile`
  ADD CONSTRAINT `retailerProfile_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `Sale_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Sale_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Sale_retailerId_fkey` FOREIGN KEY (`retailerId`) REFERENCES `retailerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `saleitem`
--
ALTER TABLE `saleitem`
  ADD CONSTRAINT `SaleItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `SaleItem_saleId_fkey` FOREIGN KEY (`saleId`) REFERENCES `sale` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `Supplier_wholesalerId_fkey` FOREIGN KEY (`wholesalerId`) REFERENCES `wholesalerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `supplierpayment`
--
ALTER TABLE `supplierpayment`
  ADD CONSTRAINT `SupplierPayment_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `SupplierPayment_wholesalerId_fkey` FOREIGN KEY (`wholesalerId`) REFERENCES `wholesalerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `Task_assignedToId_fkey` FOREIGN KEY (`assignedToId`) REFERENCES `employeeprofile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Task_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `terminal`
--
ALTER TABLE `terminal`
  ADD CONSTRAINT `Terminal_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `Wallet_consumerId_fkey` FOREIGN KEY (`consumerId`) REFERENCES `consumerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `wallettransaction`
--
ALTER TABLE `wallettransaction`
  ADD CONSTRAINT `WalletTransaction_walletId_fkey` FOREIGN KEY (`walletId`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `wholesalerprofile`
--
ALTER TABLE `wholesalerprofile`
  ADD CONSTRAINT `wholesalerProfile_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `wholesalersettings`
--
ALTER TABLE `wholesalersettings`
  ADD CONSTRAINT `wholesalerSettings_wholesalerId_fkey` FOREIGN KEY (`wholesalerId`) REFERENCES `wholesalerprofile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
