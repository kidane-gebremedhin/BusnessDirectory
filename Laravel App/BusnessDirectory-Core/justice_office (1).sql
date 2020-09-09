-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2019 at 09:44 AM
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
-- Database: `justice_office`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `accountTitle` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountNumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` double NOT NULL,
  `debit` double NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `accountTitle`, `accountNumber`, `credit`, `debit`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'Title2', '1234', 0, 0, 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name`, `description`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'Type1', NULL, 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accusal_categories`
--

CREATE TABLE `accusal_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accusal_categories`
--

INSERT INTO `accusal_categories` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 'ገብን', NULL, 14, 'active', 'false', '2019-06-27 04:43:15', '2019-06-27 04:43:15'),
(3, 'ፍታብሄር', NULL, 14, 'active', 'false', '2019-06-27 04:44:14', '2019-06-27 04:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `accuser_types`
--

CREATE TABLE `accuser_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accuser_types`
--

INSERT INTO `accuser_types` (`id`, `name`, `keyWord`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 'ቤት-ዕዮ ፌዴራል', 'Federal_Organization', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39'),
(1, 'ቤት-ዕዮ ክልል', 'Regional_Organization', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39'),
(3, 'ትካል ልምዓት ክልል', 'Developmental_Regional_Organization', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39'),
(4, 'ትካል ልምዓት ፌዴራል', 'Developmental_Federal_Organization', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39'),
(5, 'ውልቀ ትካል', 'Private_Organization', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39'),
(6, 'ውልቀ ሰብ', 'Individual', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39'),
(7, 'ሕጊ', 'Law', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39'),
(8, 'ካልእ', 'Other', NULL, 'active', 'false', '2019-06-04 15:15:39', '2019-06-04 15:15:39');

-- --------------------------------------------------------

--
-- Table structure for table `archive_kdme_ksi_geben_mezgeb`
--

CREATE TABLE `archive_kdme_ksi_geben_mezgeb` (
  `crimeTypeId` int(11) NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `subWeredaId` int(11) DEFAULT NULL,
  `aynetMezgebId` int(11) NOT NULL,
  `entryDate` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endDate` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akabiHgi_decisionTypeId` int(11) NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(255) NOT NULL,
  `masterId` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `archive_kesesti_kdme_ksi_geben_mezgeb`
--

CREATE TABLE `archive_kesesti_kdme_ksi_geben_mezgeb` (
  `id` int(255) NOT NULL,
  `masterId` int(255) NOT NULL,
  `kdme_ksi_geben_mezgebId` int(11) NOT NULL,
  `fullName` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `archive_tekesesti_kdme_ksi_geben_mezgeb`
--

CREATE TABLE `archive_tekesesti_kdme_ksi_geben_mezgeb` (
  `id` int(255) NOT NULL,
  `masterId` int(255) NOT NULL,
  `kdme_ksi_geben_mezgebId` int(11) NOT NULL,
  `fullName` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) NOT NULL,
  `decision` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awde_srah`
--

CREATE TABLE `awde_srah` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awde_srah`
--

INSERT INTO `awde_srah` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ዓውደ ስራሕ 1', NULL, 1, 'active', 'false', '2018-11-27 05:27:06', '2018-11-27 05:27:06'),
(2, 'ዓውደ ስራሕ 2', NULL, 1, 'active', 'false', '2019-04-19 10:42:49', '2019-04-19 10:42:49'),
(3, 'ዓውደ ስራሕ 3', NULL, 1, 'active', 'false', '2019-04-19 10:42:59', '2019-04-19 10:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `aynetat_geben`
--

CREATE TABLE `aynetat_geben` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crimeCategoryId` int(11) DEFAULT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(255) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aynetat_geben`
--

INSERT INTO `aynetat_geben` (`id`, `name`, `crimeCategoryId`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(3, 'ኣገዲድካ ምድፋር', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(2, 'ፈተነ ቅትለት ሰብ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(1, 'ቅትለት ሰብ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(4, 'ፈተነ ኣገዲድካ ምድፋር', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(5, 'ደፍረት/ርክብ ግብረ ስጋ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(6, 'ኣብ ህፃናት ዝበፅሕ ጥቅዓት', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(7, 'ስ/ብ/ኣ ግዕዝይና', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(8, 'ሓላፍነትካ ዘይምውፃእ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(9, 'ሓዊ ቃፀሎን ብርሰት ደንን', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(10, 'ክትራን\\ምምንጣል', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(11, 'ከቢድ ስርቂ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(12, 'ቀሊል ስርቂ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(13, 'ምሕባእ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(14, 'ምትላል', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(15, 'እምነት ምጉዳል', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(16, 'ሃረፃ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(17, 'ሓሰት ምስክር/ንፍትሒ ምስሕሓት', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(18, 'ሓሶት ሰነድ ምድላው/ምጥቃም', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(19, 'ጉድኣት መሰረተ ልምዓት', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(20, 'መሬት ውራን ህውከት ምፍጣርን', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(21, 'ዘይሕጋዊ ህንፅት ኣባይቲ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(22, 'ዘይሕጋዊ ዝውውር ኣፅዋር', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(23, 'ምምራዝ/ምብካል ምግቢ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(24, 'ዘይሕጋዊ ንግዲ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(25, 'ፀርፊ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(26, 'መፅለምታ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(27, 'ቀሊል ኣካል ጉድኣት (መውቃዕቲ)', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(28, 'ከቢድ ኣካል ምጉዳል', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(29, 'ትራፊክ ደንቢ ምትሕልላፍ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13'),
(30, 'ካልእ', NULL, NULL, 0, NULL, 'active', 'false', '2019-08-05 18:59:13', '2019-08-05 18:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `aynetat_rkb`
--

CREATE TABLE `aynetat_rkb` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aynetat_rkb`
--

INSERT INTO `aynetat_rkb` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Child', 'ውላድ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Brother/Sister', 'ሓው/ሓፍቲ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(3, 'Father/Mother', 'ኣቦ/ኣደ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(4, 'Familly', 'ዘመድ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(5, 'Other', 'ካልእ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `aynetat_trean`
--

CREATE TABLE `aynetat_trean` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `by_whom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aynetat_trean`
--

INSERT INTO `aynetat_trean` (`id`, `keyWord`, `name`, `by_whom`, `created_at`, `updated_at`) VALUES
(1, 'Shortage_Of_Food', 'ሕፅረት ቀረብ ምግቢ', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(2, 'Shortage_Of_Water', 'ሕፅረት ቀረብ ማይ', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(3, 'Width_Place', 'ፅበት ቦታ', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(4, 'Quality_Place', 'ፅሬት ቦታ', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(5, 'Investigation_Delay', 'ምጉታት ምፅራይ/ክሲ', 'Susp/Accused', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(6, 'Court_Delay', 'ናብ ቤት ፍርዲ ዘይምቕራብ', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(7, 'Familly_Relation_Denied', 'ምስ ቤተሰብ ርክብ ምክልካል', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(8, 'Challenge', 'ተፅዕኖ ምፍጣር', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(9, 'Shock', 'መውቃዕቲ', 'Prisoned', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(10, 'Other', 'ካልእ', 'Both', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(11, 'Accusal_Decision_Delay', 'ምጉታት ከይዲ ክሲ/ፍርዲ', 'Susp/Accused', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(12, 'Shock_When_Prisoned', 'ኣብ እሱር እናሃለወ መውቃዕቲ', 'Susp/Accused', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(13, 'Shock_When_Arrested', 'ክተሓዝ ከሎ ኣብ ደገ እናሃለወ መውቃዕቲ', 'Susp/Accused', '2019-07-28 11:13:08', '2019-07-28 11:13:08'),
(14, 'Appeal_Delay', 'ምጉታት ከይዲ ፍርዲ ይግበኣኒ/ሰበር', 'Prisoned', '2019-07-28 11:13:08', '2019-07-28 11:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `aynetat_wsane_akabihgi`
--

CREATE TABLE `aynetat_wsane_akabihgi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aynetat_wsane_akabihgi`
--

INSERT INTO `aynetat_wsane_akabihgi` (`id`, `name`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ናብ ስልጣን ዝተመርሐ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(2, 'ብሞት ተጠርጣሪ ዝተዓፀወ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(3, 'ንተወሳኺ ምፅራይ ዝተመለሰ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(4, 'መምርሒ ዝሓተተሉ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(5, 'ብዕርቂ ዝተወደአ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(6, 'መረዳእታ ብዘይምርካብ ዝተዓፀወ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(7, 'ተጠርጣሪ ብምስኣን ዝተዓፀወ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(8, 'ብትእዛዝ ዝተዓፀወ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(9, 'ንጥቅሚ ህዝቢ ዝተዓፀወ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(10, 'ክሲ ዝተመስረቶ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47'),
(11, 'ካልእ', NULL, NULL, NULL, 'active', 'false', '2019-05-31 16:04:47', '2019-05-31 16:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `aynetat_wsane_betfrdi`
--

CREATE TABLE `aynetat_wsane_betfrdi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aynetat_wsane_betfrdi`
--

INSERT INTO `aynetat_wsane_betfrdi` (`id`, `name`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ነፃ', NULL, NULL, NULL, 'active', 'false', '2019-06-08 17:47:52', '2019-06-08 17:47:52'),
(2, 'ጥፍኣት', NULL, NULL, NULL, 'active', 'false', '2019-06-08 17:47:52', '2019-06-08 17:47:52'),
(3, 'ብነጥቢ ዝተመለሰ', NULL, NULL, NULL, 'active', 'false', '2019-06-08 17:47:52', '2019-06-08 17:47:52'),
(4, 'ዝተልዓለ', NULL, NULL, NULL, 'active', 'false', '2019-06-08 17:47:52', '2019-06-08 17:47:52'),
(5, 'ካልእ', NULL, NULL, NULL, 'active', 'false', '2019-06-08 17:47:52', '2019-06-08 17:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `aynet_glgalot`
--

CREATE TABLE `aynet_glgalot` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aynet_ngdi`
--

CREATE TABLE `aynet_ngdi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aynet_tekli`
--

CREATE TABLE `aynet_tekli` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aynet_teshkerkerti`
--

CREATE TABLE `aynet_teshkerkerti` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aynet_thset`
--

CREATE TABLE `aynet_thset` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aynet_thset`
--

INSERT INTO `aynet_thset` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'In_Treatment_And_Human_Right', 'ኣብ ኣተሓሕዛን ሰብኣዊ መሰልን ተከሰሲ/ት/ቲ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'In_Information_Gathering', 'ኣብ ኣተኣካኽባ መረዳእታ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(3, 'Other', 'ካልእ ስራሕቲ ምፅራይ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `aynet_wdabe`
--

CREATE TABLE `aynet_wdabe` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`id`, `memberId`, `categoryId`, `amount`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, '14', '2', 110, 'active', 'false', '2018-11-29 10:50:12', '2018-11-30 16:08:23'),
(2, '14', '1', 40000, 'active', 'false', '2018-11-29 10:59:31', '2018-11-30 05:42:24'),
(3, '14', '3', 485, 'active', 'false', '2018-11-29 13:06:45', '2018-11-30 16:05:56');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `createdByUserId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'CBE', NULL, '', 'active', 'false', NULL, NULL),
(2, 'ዓለምለኻዊ ባንኪ ኣንበሳ', NULL, '', 'active', 'false', '2018-11-30 06:56:51', '2018-11-30 06:57:18'),
(3, 'ወጋገን ባንክ', NULL, '1', 'active', 'false', '2018-12-01 08:28:47', '2018-12-01 08:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `bankId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankAccountName` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankAccountNumber` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bankId`, `branchId`, `bankAccountName`, `bankAccountNumber`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, '1', '1', 'Fana Bank Account 1', '123456', '', 'active', 'false', NULL, NULL),
(2, '1', '1', 'Fana Bank Account 2', '2345678', '', 'active', 'false', NULL, NULL),
(3, '1', '1', 'Fana CBE 3', '12341234', '1', 'active', 'false', '2018-11-30 06:10:31', '2018-11-30 06:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `bank_branchs`
--

CREATE TABLE `bank_branchs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_branchs`
--

INSERT INTO `bank_branchs` (`id`, `name`, `bankId`, `address`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ዋና ቅርንጫፍ', '1', 'Mekelle', 'aaaa', 1, 'active', 'false', NULL, '2018-11-30 07:48:41'),
(2, 'ቅርንጫፍ 1', '2', 'መቐለ ዓዲሓቂ', NULL, 1, 'active', 'false', '2018-11-30 07:54:10', '2018-11-30 08:01:22'),
(3, 'ዓዲግራት', '1', 'ዓዲግራት', NULL, 1, 'active', 'false', '2018-11-30 08:02:08', '2018-11-30 08:02:08'),
(4, 'ውቅሮ', '2', 'ውቅሮ ኣደባባይ', NULL, 1, 'active', 'false', '2018-11-30 08:05:15', '2018-11-30 08:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `bher`
--

CREATE TABLE `bher` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branchs`
--

CREATE TABLE `branchs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branchs`
--

INSERT INTO `branchs` (`id`, `name`, `address`, `description`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'Branch1', 'Mekelle', NULL, 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brkitat`
--

CREATE TABLE `brkitat` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brkitat`
--

INSERT INTO `brkitat` (`id`, `name`, `keyWord`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(3, 'ላዕለዋይ ቤት ፍርዲ ክልል', 'Region', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33'),
(4, 'ሰበር ክልል', 'Breaking_Region', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33'),
(5, 'ላዕለዋይ ቤት ፍርዲ ፌዴራል', 'Federal', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33'),
(6, 'ሰበር ፌዴራል', 'Breaking_Federal', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33'),
(7, 'ቤት ምኽሪ ክልል', 'HF_Region', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33'),
(2, 'ዞባ ቤት ፍርዲ', 'Zone', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33'),
(1, 'ወረዳ', 'Wereda', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33'),
(8, 'ቤት ምኽሪ ፌዴራል', 'HF_Federal', NULL, 'active', 'false', '2019-05-15 03:22:33', '2019-05-15 03:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_categories`
--

CREATE TABLE `charge_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charge_categories`
--

INSERT INTO `charge_categories` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'መመዝገቢ', '', '', 'active', 'false', NULL, NULL),
(2, 'ደብተር ሽይጣት', '', '', 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `charge_fee_registration`
--

CREATE TABLE `charge_fee_registration` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` int(11) NOT NULL,
  `charge_categoryId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankAccountId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transactionCode` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargeFeeAmount` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentModeId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chequeNo` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currencyId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documentPaper` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargeFeeDate` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charge_fee_registration`
--

INSERT INTO `charge_fee_registration` (`id`, `memberId`, `charge_categoryId`, `bankId`, `branchId`, `bankAccountId`, `transactionCode`, `chargeFeeAmount`, `paymentModeId`, `chequeNo`, `currencyId`, `documentPaper`, `chargeFeeDate`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(17, 17, '1', '1', '4', '3', '22', '3000', '3', '33', '1', 'C:\\xampp\\tmp\\php3338.tmp', '20/03/2011', 1, 'active', 'false', '2018-12-01 13:50:55', '2018-12-01 13:50:55'),
(16, 16, '1', '1', '3', '2', '22', '3000', '3', '33', '1', 'C:\\xampp\\tmp\\php5EBE.tmp', '20/03/2011', 1, 'active', 'false', '2018-12-01 10:36:39', '2018-12-01 10:36:39'),
(15, 15, '1', '1', '2', '3', '22', '3000', '2', '33', '1', '1543665379.PNG', '20/03/2011', 1, 'active', 'false', '2018-12-01 08:34:41', '2018-12-01 08:56:19'),
(14, 14, '1', '1', '1', '1', '22', '3000', '1', NULL, '1', '1543399050.PNG', '18/03/2011', 1, 'active', 'false', '2018-11-28 04:31:49', '2018-11-28 06:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `compensation_types`
--

CREATE TABLE `compensation_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compensation_types`
--

INSERT INTO `compensation_types` (`id`, `name`, `keyWord`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ገንዘብ', 'Money', 1, NULL, 'active', 'false', '2019-06-01 19:30:57', '2019-06-01 19:30:57'),
(2, 'ንብረት', 'Property', 1, NULL, 'active', 'false', '2019-06-01 19:31:17', '2019-06-01 19:31:17'),
(3, 'ካልእ', 'Other', 14, 14, 'active', 'false', '2019-06-27 04:50:07', '2019-06-27 04:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `complains_by_customer`
--

CREATE TABLE `complains_by_customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `created_a_brki` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestedTo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `respondedBy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `canComplainTo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complained_to_party` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complain_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crime_weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `efficiency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satisfaction` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_satisfied_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complains_by_customer`
--

INSERT INTO `complains_by_customer` (`id`, `regionId`, `zoneId`, `weredaId`, `created_a_brki`, `entryDate`, `brkiId`, `requestNumber`, `requestedTo`, `complain`, `respondedBy`, `response`, `canComplainTo`, `name`, `gender`, `complained_to_party`, `complain_type`, `response_type`, `crime_weight`, `efficiency`, `quality`, `satisfaction`, `not_satisfied_reason`, `phoneNumber`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 3, 'Region', '1/12/2011', '3', '1234', 'abc', 'ttt', 'req by', 'mmm', 'ccto', 'cmp nam', 'Male', 'In_Justice_Office', 'Document_Closed', 'Partially_Accepted', 'Heavy', 'Decided_In_Above_7_Days', 'Not_Approved_By_Higher_Level', '2', NULL, NULL, 14, NULL, 'active', 'false', '2019-08-07 17:16:40', '2019-08-07 17:16:40'),
(2, 2, 3, 3, 'Region', '2/12/2011', '3', '123', 'rtadgadfh', 'aaa', 'fdhgaj', 'bbb', 'dfhsh', 'bbbb', 'Male', 'In_Police', 'Human_Right_Voilence', 'Fully_Rejected', 'Easy', 'Decided_In_Less_Than_45_Minutes', 'Approved_By_Higher_Level', '2', 'Hospitality', '0945735838', 14, NULL, 'active', 'false', '2019-08-07 17:24:34', '2019-08-07 17:24:34'),
(3, 2, 9, 16, 'Zone', '3/12/2011', '2', 'ff', 'dd', 'czdffdhdhadrhaerhaerh', 'dfshs', 'dhf drha drharha errh', 'fjtjw', 'eryywrtu', 'Male', 'Other', 'Unethical', 'Fully_Rejected', 'Easy', 'Decided_In_Less_Than_45_Minutes', 'Approved_By_Higher_Level', '2', 'Quality', '0945735838', 33, NULL, 'active', 'false', '2019-08-07 19:58:14', '2019-08-07 19:58:14'),
(4, 2, 3, 3, 'Breaking_Region', '7/12/2011', '4', '11/22/44', 'rtadgadfh', 'fhsfhsf', 'fdhgaj', 'dfgharh\r\nhhhh\r\njjjj', 'dfhsh', 'checker1', 'Male', 'In_Justice_Office', 'Investigation_Request', 'Partially_Accepted', 'Heavy', 'Decided_In_Above_7_Days', 'Approved_By_Higher_Level', '1', 'Hospitality', '0945735838', 34, NULL, 'active', 'false', '2019-08-13 16:37:53', '2019-08-26 16:25:35'),
(5, 2, 9, 16, 'Zone', '20/12/2011 22:37:25', '2', '352', 'rtwrt', 'dgsdgsgs', 'fdhshs', 'rgdfgdfgfg', 'dhaha', 'essh', 'Female', 'In_Police', 'Service_Complain', 'Partially_Accepted', 'Heavy', 'Decided_In_Above_7_Days', 'Not_Approved_By_Higher_Level', '2', 'Hospitality', '468468468', 33, NULL, 'active', 'false', '2019-08-26 16:37:25', '2019-08-26 18:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(5, 'ኢትዮጵያ', NULL, 0, 'active', 'false', '2019-07-30 13:29:39', '2019-07-30 13:29:39'),
(6, 'ኤርትራ', NULL, 14, 'active', 'false', '2019-07-30 13:30:08', '2019-07-30 13:30:08'),
(7, 'ካልእ', NULL, 14, 'active', 'false', '2019-07-30 13:30:20', '2019-07-30 13:30:20'),
(8, 'ሱዳን', NULL, 34, 'active', 'false', '2019-08-05 12:29:52', '2019-08-05 12:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `crime_record_akabi_hgi_decision_history`
--

CREATE TABLE `crime_record_akabi_hgi_decision_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `crime_recordId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `akabiHgi_decisionTypeId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deactivatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crime_record_akabi_hgi_decision_history`
--

INSERT INTO `crime_record_akabi_hgi_decision_history` (`id`, `crime_recordId`, `akabiHgi_decisionTypeId`, `deactivatedDate`, `activatedDate`, `created_at`, `updated_at`) VALUES
(100, '227', '3', '29/11/2011', '30/11/2011', '2019-08-05 05:14:32', '2019-08-05 05:14:32'),
(101, '228', '3', '29/11/2011', '30/11/2011', '2019-08-05 05:14:59', '2019-08-05 05:14:59'),
(102, '227', '3', '29/11/2011', '29/11/2011', '2019-08-05 05:34:17', '2019-08-05 05:34:17'),
(103, '228', '3', '29/11/2011', '29/11/2011', '2019-08-05 05:34:34', '2019-08-05 05:34:34'),
(104, '249', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:25:57', '2019-08-05 10:25:57'),
(105, '249', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:27:39', '2019-08-05 10:27:39'),
(106, '251', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:29:33', '2019-08-05 10:29:33'),
(107, '250', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:29:33', '2019-08-05 10:29:33'),
(108, '249', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:29:33', '2019-08-05 10:29:33'),
(109, '251', '6', '29/11/2011', '30/11/2011', '2019-08-05 10:30:14', '2019-08-05 10:30:14'),
(110, '251', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:30:56', '2019-08-05 10:30:56'),
(111, '250', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:30:56', '2019-08-05 10:30:56'),
(112, '249', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:30:56', '2019-08-05 10:30:56'),
(113, '249', '6', '29/11/2011', '30/11/2011', '2019-08-05 10:31:53', '2019-08-05 10:31:53'),
(114, '251', '6', '29/11/2011', '30/11/2011', '2019-08-05 10:32:03', '2019-08-05 10:32:03'),
(115, '250', '6', '29/11/2011', '30/11/2011', '2019-08-05 10:32:14', '2019-08-05 10:32:14'),
(116, '251', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:33:06', '2019-08-05 10:33:06'),
(117, '250', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:33:06', '2019-08-05 10:33:06'),
(118, '249', '3', '29/11/2011', '30/11/2011', '2019-08-05 10:33:06', '2019-08-05 10:33:06'),
(119, '258', '6', '29/11/2011', '30/11/2011', '2019-08-05 17:46:42', '2019-08-05 17:46:42'),
(120, '245', '3', '23/11/2011', '30/11/2011', '2019-08-05 18:37:05', '2019-08-05 18:37:05'),
(121, '266', '6', '01/12/2011', '01/12/2011', '2019-08-07 05:35:33', '2019-08-07 05:35:33'),
(122, '293', '8', '11/12/2011 6:58:0', '11/12/2011', '2019-08-17 05:17:56', '2019-08-17 05:17:56'),
(123, '7', '3', '14/12/2011 1:2:0', '05/13/2011', '2019-08-20 16:03:12', '2019-08-20 16:03:12'),
(124, '6', '3', '14/12/2011 1:2:0', '05/13/2011', '2019-08-20 16:03:12', '2019-08-20 16:03:12'),
(125, '6', '6', '14/12/2011 1:2:0', '15/12/2011', '2019-08-20 16:19:29', '2019-08-20 16:19:29'),
(126, '7', '7', '14/12/2011 1:2:0', '15/12/2011', '2019-08-20 16:43:21', '2019-08-20 16:43:21'),
(127, '7', '9', '14/12/2011 1:2:0', '16/12/2011', '2019-08-20 18:51:26', '2019-08-20 18:51:26'),
(128, '8', '9', '15/12/2011 4:30:0', '15/12/2011', '2019-08-20 19:00:15', '2019-08-20 19:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `crime_record_bet_frdi_decision_history`
--

CREATE TABLE `crime_record_bet_frdi_decision_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `crime_recordId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `betFrdi_decisionTypeId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deactivatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crime_record_bet_frdi_decision_history`
--

INSERT INTO `crime_record_bet_frdi_decision_history` (`id`, `crime_recordId`, `betFrdi_decisionTypeId`, `deactivatedDate`, `activatedDate`, `created_at`, `updated_at`) VALUES
(12, '4', '4', '14/12/2011 14:30:0', '16/12/2011', '2019-08-20 18:25:16', '2019-08-20 18:25:16'),
(11, '4', '4', '14/12/2011 14:30:0', '16/12/2011', '2019-08-20 18:24:24', '2019-08-20 18:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `currencytypes`
--

CREATE TABLE `currencytypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencytypes`
--

INSERT INTO `currencytypes` (`id`, `icon`, `name`, `description`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'Br', 'Birr', NULL, 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 'ፍታብሄር', NULL, 1, 24, 'active', 'false', '2019-04-20 10:32:43', '2019-07-11 07:43:19'),
(3, 'ገበን', NULL, 1, 24, 'active', 'false', '2019-04-20 10:32:49', '2019-07-11 07:43:02'),
(4, 'ገበንን ፍታብሄርን', NULL, 28, NULL, 'active', 'false', '2019-08-04 07:07:39', '2019-08-04 07:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `dgafn_given_party_types`
--

CREATE TABLE `dgafn_given_party_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dgafn_given_party_types`
--

INSERT INTO `dgafn_given_party_types` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Child', 'ህፃን', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Female', 'ጓል-ኣነስተይቲ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(3, 'Elders', 'ኣረጋውያን', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(4, 'Disabled', 'ኣካል ጉዱእ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(5, 'Refugee', 'ስደተኛ/ተፈናቐል', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(6, 'Minority_Nation', 'ንእሽተይ ቁፅሪ ዘለዎ ብሄር', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(7, 'Ancient_Human', 'ጥንታዊ ሰብ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(8, 'Global_Nationality', 'ዜግነት/ዓዲ ዘይብሉ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(9, 'Crime_Victim', 'ጉዱእ ገበን', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(10, 'Other', 'ካልእ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `disability_types`
--

CREATE TABLE `disability_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disability_types`
--

INSERT INTO `disability_types` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(3, 'ምርእይ ዝተስኣኖ', NULL, 0, 'active', 'false', '2019-06-10 16:20:35', '2019-06-10 16:20:35'),
(4, 'ምስማዕ ዝተስኣኖ', NULL, 0, 'active', 'false', '2019-06-10 16:20:35', '2019-06-10 16:20:35'),
(5, 'ጉድእ ኢድ', NULL, 0, 'active', 'false', '2019-06-10 16:20:35', '2019-06-10 16:20:35'),
(6, 'ጉድእ እግሪ', NULL, 0, 'active', 'false', '2019-06-10 16:20:35', '2019-06-10 16:20:35'),
(7, 'ካልእ', NULL, 14, 'active', 'false', '2019-06-10 16:20:35', '2019-06-28 04:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` int(11) NOT NULL,
  `photo` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `memberId`, `photo`, `signature`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(17, 17, 'C:\\xampp\\tmp\\php3307.tmp', 'C:\\xampp\\tmp\\php3327.tmp', 1, 'active', 'false', '2018-12-01 13:50:55', '2018-12-01 13:50:55'),
(16, 16, 'C:\\xampp\\tmp\\php5E8E.tmp', 'C:\\xampp\\tmp\\php5EAE.tmp', 1, 'active', 'false', '2018-12-01 10:36:39', '2018-12-01 10:36:39'),
(15, 15, '1543665379.jpg', '1543665344.PNG', 1, 'active', 'false', '2018-12-01 08:34:41', '2018-12-01 08:56:19'),
(14, 14, '1543391595.jpg', '1543391595.PNG', 1, 'active', 'false', '2018-11-28 04:31:49', '2018-11-28 04:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `name`, `description`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'Type1', NULL, 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `educational_levels`
--

CREATE TABLE `educational_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educational_levels`
--

INSERT INTO `educational_levels` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'Digree', NULL, 1, 'active', 'false', '2018-11-27 05:38:20', '2018-11-27 05:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `educational_skills`
--

CREATE TABLE `educational_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educational_skills`
--

INSERT INTO `educational_skills` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'Teacher', NULL, 1, 'active', 'false', '2018-11-27 05:38:42', '2018-11-27 05:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `effectiveness_statuses`
--

CREATE TABLE `effectiveness_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `effectiveness_statuses`
--

INSERT INTO `effectiveness_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Effective', 'ውፅኢታዊ/ተግባራዊ ዝኮነ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Effective', 'ውፅኢታዊ/ተግባራዊ ዘይኮነ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_akabi_hgi_decision_history`
--

CREATE TABLE `ftabher_akabi_hgi_decision_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `crime_recordId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `akabiHgi_decisionTypeId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deactivatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_akabi_hgi_decision_history`
--

INSERT INTO `ftabher_akabi_hgi_decision_history` (`id`, `crime_recordId`, `akabiHgi_decisionTypeId`, `deactivatedDate`, `activatedDate`, `created_at`, `updated_at`) VALUES
(1, '6', '2', '13/12/2011 23:17:0', '17/12/2011', '2019-08-23 04:41:34', '2019-08-23 04:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_bet_frdi_decision_history`
--

CREATE TABLE `ftabher_bet_frdi_decision_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `crime_recordId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `betFrdi_decisionTypeId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deactivatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activatedDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_kesasi_health_status`
--

CREATE TABLE `ftabher_kesasi_health_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `personId` int(11) NOT NULL,
  `healthStatusId` int(11) DEFAULT NULL,
  `disabilityTypeId` int(11) DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_kesasi_health_status`
--

INSERT INTO `ftabher_kesasi_health_status` (`id`, `personId`, `healthStatusId`, `disabilityTypeId`, `createdByUserId`, `created_at`, `updated_at`) VALUES
(223, 409, 2, 3, 34, '2019-08-14 17:23:42', '2019-08-14 17:23:42'),
(225, 419, 2, 4, 34, '2019-08-17 19:05:16', '2019-08-17 19:05:16'),
(224, 419, 2, 3, 34, '2019-08-17 19:05:16', '2019-08-17 19:05:16'),
(211, 407, 2, 6, 34, '2019-08-14 14:14:39', '2019-08-14 14:14:39'),
(210, 407, 2, 4, 34, '2019-08-14 14:14:39', '2019-08-14 14:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_kesesti_mezgeb`
--

CREATE TABLE `ftabher_kesesti_mezgeb` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `isAccuserALawOfficer` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `isAccuserAVictim` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `kesasi_fullName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_gender` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_regionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_zoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_weredaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_tabyaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_regionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_zoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_weredaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_tabyaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_age` int(11) DEFAULT NULL,
  `kesasi_nationalityId` int(11) DEFAULT NULL,
  `kesasi_religionId` int(11) DEFAULT NULL,
  `kesasi_merriage_statusId` int(11) DEFAULT NULL,
  `kesasi_pob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_healthStatusId` int(255) DEFAULT NULL,
  `tebedali_pob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_fullName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_gender` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_age` int(11) DEFAULT NULL,
  `tebedali_nationalityId` int(11) DEFAULT NULL,
  `tebedali_religionId` int(11) DEFAULT NULL,
  `tebedali_merriage_statusId` int(11) DEFAULT NULL,
  `date` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `agentType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_kesesti_mezgeb`
--

INSERT INTO `ftabher_kesesti_mezgeb` (`id`, `ksi_mezgeb_brkiId`, `isAccuserALawOfficer`, `isAccuserAVictim`, `kesasi_fullName`, `kesasi_phoneNumber`, `kesasi_gender`, `kesasi_regionId`, `kesasi_zoneId`, `kesasi_weredaId`, `kesasi_tabyaId`, `tebedali_regionId`, `tebedali_zoneId`, `tebedali_weredaId`, `tebedali_tabyaId`, `kesasi_age`, `kesasi_nationalityId`, `kesasi_religionId`, `kesasi_merriage_statusId`, `kesasi_pob`, `kesasi_fax`, `kesasi_email`, `kesasi_healthStatusId`, `tebedali_pob`, `tebedali_fax`, `tebedali_email`, `tebedali_fullName`, `tebedali_phoneNumber`, `tebedali_gender`, `tebedali_age`, `tebedali_nationalityId`, `tebedali_religionId`, `tebedali_merriage_statusId`, `date`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`, `agentType`) VALUES
(2, 2, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1232', '2343', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011/12/13 10:1:31', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:01:31', '2019-08-19 10:01:31', NULL),
(3, 3, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 18, 5, 1, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011/12/13 10:24:7', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:24:07', '2019-08-19 10:24:07', NULL),
(4, 5, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 18, 5, 1, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13/12/2011 17:35:30', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:35:30', '2019-08-19 11:35:30', NULL),
(5, 5, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 18, 5, 1, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13/12/2011 17:36:25', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:36:25', '2019-08-19 11:36:25', NULL),
(6, 6, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Female', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 23, 5, 1, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 10:36:5', NULL, 34, NULL, 'active', 'false', '2019-08-23 04:36:05', '2019-08-23 04:36:05', NULL),
(7, 7, 'false', 'true', 'adg dgad dg', '462575737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '346', '464', '464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 15:17:58', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:16:36', '2019-08-23 09:17:58', NULL),
(8, 8, 'false', 'true', 'adg dgad dg', '452738449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '346', '464', 'fdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 15:21:28', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:21:28', '2019-08-23 09:21:28', NULL),
(9, 9, 'false', 'true', 'qewt', '4527384499', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'a@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 15:41:38', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:41:38', '2019-08-23 09:41:38', NULL),
(10, 10, 'false', 'true', 'adg dgad dg', '452738449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '346', '464', 'a@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 16:27:2', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:59:16', '2019-08-23 10:27:02', NULL),
(11, 11, 'false', 'true', 'adg dgad dg', '452738449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '346', '464', 'a@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 16:53:7', NULL, 33, NULL, 'active', 'false', '2019-08-23 10:53:07', '2019-08-23 10:53:07', NULL),
(12, 12, 'false', 'true', 'adg dgad dg', '452738449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '346', '464', 'a@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 17:4:41', NULL, 34, NULL, 'active', 'false', '2019-08-23 11:04:41', '2019-08-23 11:04:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_kesesti_tekesasi`
--

CREATE TABLE `ftabher_kesesti_tekesasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `brkiId` int(11) NOT NULL,
  `kesasiId` int(11) NOT NULL,
  `tekesasiId` int(11) NOT NULL,
  `date` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_kesesti_tekesasi`
--

INSERT INTO `ftabher_kesesti_tekesasi` (`id`, `brkiId`, `kesasiId`, `tekesasiId`, `date`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 2, '2011/12/13 10:1:56', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:01:56', '2019-08-19 10:01:56'),
(3, 3, 3, 3, '2011/12/13 10:24:51', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:24:51', '2019-08-19 10:24:51'),
(4, 5, 4, 4, '13/12/2011 17:35:30', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:35:30', '2019-08-19 11:35:30'),
(5, 5, 5, 5, '13/12/2011 17:36:25', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:36:25', '2019-08-19 11:36:25'),
(6, 6, 6, 6, '17/12/2011 10:36:39', NULL, 34, NULL, 'active', 'false', '2019-08-23 04:36:39', '2019-08-23 04:36:39'),
(7, 9, 9, 7, '17/12/2011 15:44:50', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:44:50', '2019-08-23 09:44:50'),
(9, 10, 10, 8, '17/12/2011 16:27:6', NULL, 33, NULL, 'active', 'false', '2019-08-23 10:27:06', '2019-08-23 10:27:06'),
(10, 11, 11, 9, '17/12/2011 16:53:7', NULL, 33, NULL, 'active', 'false', '2019-08-23 10:53:07', '2019-08-23 10:53:07'),
(11, 12, 12, 10, '17/12/2011 17:4:41', NULL, 34, NULL, 'active', 'false', '2019-08-23 11:04:41', '2019-08-23 11:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_ksi_kotsorotat`
--

CREATE TABLE `ftabher_ksi_kotsorotat` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgebId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ksi_mezgeb_brkiId` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_mezgeb`
--

CREATE TABLE `ftabher_mezgeb` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_number` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modification_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not_Modified',
  `accuser_typeId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defendant_typeId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regionId` int(11) DEFAULT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `sub_weredaId` int(11) DEFAULT NULL,
  `tabyaId` int(11) DEFAULT NULL,
  `kebelleId` int(11) DEFAULT NULL,
  `date` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentBrkiId` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_a_brki` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_mezgeb`
--

INSERT INTO `ftabher_mezgeb` (`id`, `ksi_mezgeb_number`, `modification_status`, `accuser_typeId`, `defendant_typeId`, `regionId`, `zoneId`, `weredaId`, `sub_weredaId`, `tabyaId`, `kebelleId`, `date`, `currentBrkiId`, `remark`, `created_a_brki`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 'ፍ/መ/ቁ/2011-0000006', 'Not_Modified', '7', '1', 2, NULL, NULL, NULL, NULL, NULL, '2011/12/13 10:0:49', NULL, NULL, 'Breaking_Region', 34, 34, 'active', 'false', '2019-08-19 10:00:49', '2019-08-19 10:01:17'),
(3, 'ፍ/መ/ቁ/2011-0000007', 'Not_Modified', '6', '6', 2, NULL, NULL, NULL, NULL, NULL, '2011/12/13 10:22:32', '5', NULL, 'Breaking_Region', 34, NULL, 'active', 'false', '2019-08-19 10:22:32', '2019-08-19 11:13:42'),
(4, 'ፍ/መ/ቁ/2011-0000008', 'Not_Modified', '6', '6', 2, NULL, NULL, NULL, NULL, NULL, '17/12/2011 10:35:27', NULL, NULL, 'Breaking_Region', 34, NULL, 'active', 'false', '2019-08-23 04:35:27', '2019-08-23 04:35:27'),
(5, 'ፍ/መ/ቁ/2011-0000009', 'Not_Modified', '2', '2', 2, 9, NULL, NULL, NULL, NULL, '17/12/2011 15:16:19', NULL, NULL, 'Zone', 33, 33, 'active', 'false', '2019-08-23 09:16:19', '2019-08-23 09:17:54'),
(6, 'ፍ/መ/ቁ/2011-0000010', 'Not_Modified', '2', '3', 2, 9, NULL, NULL, NULL, NULL, '17/12/2011 15:20:3', NULL, NULL, 'Zone', 33, NULL, 'active', 'false', '2019-08-23 09:20:03', '2019-08-23 09:20:03'),
(7, 'ፍ/መ/ቁ/2011-0000011', 'Not_Modified', '2', '2', 2, 9, NULL, NULL, NULL, NULL, '17/12/2011 15:41:10', NULL, NULL, 'Zone', 33, NULL, 'active', 'false', '2019-08-23 09:41:10', '2019-08-23 09:41:10'),
(8, 'ፍ/መ/ቁ/2011-0000012', 'Not_Modified', '1', '4', 2, 9, NULL, NULL, NULL, NULL, '17/12/2011 15:58:54', '4', NULL, 'Zone', 33, NULL, 'active', 'false', '2019-08-23 09:58:54', '2019-08-23 11:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_mezgeb_brki`
--

CREATE TABLE `ftabher_mezgeb_brki` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgebId` int(11) NOT NULL,
  `brkiId` int(11) NOT NULL,
  `CR_policeMezgebKutsri` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akabiHgiMezgebKutsri` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdiMezgebKutsri` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exitDate` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealedToBrkiId` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isOpponentDecisionMaker_akabiHgi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `oppenent_akabiHgi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oppenent_akabiHgi_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akabiHgi_decisionMaker` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decisionMaker_akabiHgi_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyerPoliceDocumentReturnDate` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_decisionMaker` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_akabiHgi_decision` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_betFrdi_decision` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isCompleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `quality` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `isViewed` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_mezgeb_brki`
--

INSERT INTO `ftabher_mezgeb_brki` (`id`, `ksi_mezgebId`, `brkiId`, `CR_policeMezgebKutsri`, `akabiHgiMezgebKutsri`, `betFrdiMezgebKutsri`, `entryDate`, `exitDate`, `appealedToBrkiId`, `isOpponentDecisionMaker_akabiHgi`, `oppenent_akabiHgi`, `oppenent_akabiHgi_phoneNumber`, `akabiHgi_decisionMaker`, `decisionMaker_akabiHgi_phoneNumber`, `lawyerPoliceDocumentReturnDate`, `betFrdi_decisionMaker`, `date_of_akabiHgi_decision`, `date_of_betFrdi_decision`, `isCompleted`, `quality`, `isViewed`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 2, 4, NULL, '2', '2', '01/12/2011 21:32:0', NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '13/12/2011 23:17:0', '15/12/2011 0:0:0', 'true', 'true', 'false', NULL, 34, 34, 'active', 'false', '2019-08-19 10:00:49', '2019-08-19 10:11:57'),
(3, 3, 4, NULL, '3', '3', '13/12/2011 4:29:0', '13/12/2011 17:36:25', '5', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '13/12/2011 0:0:0', '13/12/2011 0:0:0', 'true', 'true', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:22:32', '2019-08-19 11:36:25'),
(5, 3, 5, NULL, '2', '3', '13/12/2011 17:36:25', NULL, NULL, 'true', NULL, NULL, 'tue teu eu', NULL, NULL, NULL, '16/12/2011 6:5:0', '13/12/2011 9:5:0', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:26:41', '2019-08-19 11:48:41'),
(6, 4, 4, NULL, '2', '3', '17/12/2011 3:6:0', NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '17/12/2011 1:1:0', '17/12/2011 6:5:0', 'true', 'true', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-23 04:35:27', '2019-08-23 04:50:41'),
(7, 5, 2, NULL, '1', '1', '17/12/2011 3:4:0', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'true', 'false', NULL, 33, 33, 'active', 'false', '2019-08-23 09:16:19', '2019-08-23 09:17:54'),
(8, 6, 2, NULL, '1', '1', '17/12/2011 2:2:0', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'true', 'false', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:20:03', '2019-08-23 09:20:03'),
(9, 7, 2, NULL, '1', '1', '09/12/2011 2:4:0', NULL, NULL, 'true', NULL, NULL, 'gnxcvnxnxmn', NULL, NULL, NULL, '17/12/2011 1:1:0', '17/12/2011 2:3:0', 'true', 'true', 'false', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:41:10', '2019-08-23 09:48:47'),
(10, 8, 2, NULL, '1', '2', '17/12/2011 3:3:0', '17/12/2011 16:53:7', '3', 'true', NULL, NULL, 'rr', NULL, NULL, NULL, '17/12/2011 0:0:0', '17/12/2011 1:1:0', 'true', 'true', 'false', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:58:54', '2019-08-23 10:53:07'),
(11, 8, 3, NULL, '1', '2', '17/12/2011 16:53:7', '17/12/2011 17:4:41', '4', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '17/12/2011 3:4:0', '17/12/2011 1:2:0', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-23 10:53:07', '2019-08-23 11:04:41'),
(12, 8, 4, NULL, '345', '345', '17/12/2011 17:4:41', NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '17/12/2011 0:0:0', '17/12/2011 0:0:0', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-23 11:04:41', '2019-08-23 11:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_mezgeb_brki_wsane_zhabu_dayanu`
--

CREATE TABLE `ftabher_mezgeb_brki_wsane_zhabu_dayanu` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `fullName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_mezgeb_brki_wsane_zhabu_dayanu`
--

INSERT INTO `ftabher_mezgeb_brki_wsane_zhabu_dayanu` (`id`, `ksi_mezgeb_brkiId`, `fullName`, `phoneNumber`, `created_at`, `updated_at`) VALUES
(1, 1, 'Asgedom Dagnew', '09123456', '2019-08-19 09:18:14', '2019-08-19 09:18:14'),
(2, 2, 'ሃይላይ ገብሩ', '09123456', '2019-08-19 10:11:57', '2019-08-19 10:11:57'),
(3, 3, 'ሃይላይ ገብሩ', '09123456', '2019-08-19 11:11:24', '2019-08-19 11:11:24'),
(4, 5, 'Asgedom Dagnew', '25476789', '2019-08-19 11:48:41', '2019-08-19 11:48:41'),
(5, 6, 'Asgedom Dagnew', '2547678990', '2019-08-23 04:50:41', '2019-08-23 04:50:41'),
(6, 9, 'fghgsgjj', NULL, '2019-08-23 09:48:47', '2019-08-23 09:48:47'),
(7, 10, 'dsadga dg rg', NULL, '2019-08-23 10:52:50', '2019-08-23 10:52:50'),
(8, 11, 'Asgedom Dagnew', NULL, '2019-08-23 11:00:21', '2019-08-23 11:00:21'),
(9, 12, 'fhsg', NULL, '2019-08-23 11:06:34', '2019-08-23 11:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_mezgeb_waninat`
--

CREATE TABLE `ftabher_mezgeb_waninat` (
  `id` int(10) UNSIGNED NOT NULL,
  `ftabher_mezgebId` int(11) NOT NULL,
  `waninId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_mezgeb_waninat`
--

INSERT INTO `ftabher_mezgeb_waninat` (`id`, `ftabher_mezgebId`, `waninId`, `created_at`, `updated_at`) VALUES
(54, 192, 11, '2019-07-26 10:41:41', '2019-07-26 10:41:41'),
(53, 192, 8, '2019-07-26 10:41:41', '2019-07-26 10:41:41'),
(52, 192, 7, '2019-07-26 10:41:41', '2019-07-26 10:41:41'),
(51, 192, 10, '2019-07-26 10:41:41', '2019-07-26 10:41:41'),
(50, 191, 11, '2019-07-26 09:41:46', '2019-07-26 09:41:46'),
(49, 191, 9, '2019-07-26 09:41:46', '2019-07-26 09:41:46'),
(48, 191, 7, '2019-07-26 09:41:46', '2019-07-26 09:41:46'),
(47, 191, 10, '2019-07-26 09:41:46', '2019-07-26 09:41:46'),
(46, 190, 11, '2019-07-26 08:30:21', '2019-07-26 08:30:21'),
(45, 190, 8, '2019-07-26 08:30:21', '2019-07-26 08:30:21'),
(44, 190, 7, '2019-07-26 08:30:21', '2019-07-26 08:30:21'),
(43, 190, 10, '2019-07-26 08:30:21', '2019-07-26 08:30:21'),
(42, 189, 11, '2019-07-26 08:12:11', '2019-07-26 08:12:11'),
(41, 189, 8, '2019-07-26 08:12:11', '2019-07-26 08:12:11'),
(40, 189, 7, '2019-07-26 08:12:11', '2019-07-26 08:12:11'),
(39, 189, 10, '2019-07-26 08:12:11', '2019-07-26 08:12:11'),
(38, 188, 11, '2019-07-26 08:06:49', '2019-07-26 08:06:49'),
(37, 188, 8, '2019-07-26 08:06:49', '2019-07-26 08:06:49'),
(36, 188, 7, '2019-07-26 08:06:49', '2019-07-26 08:06:49'),
(35, 188, 10, '2019-07-26 08:06:49', '2019-07-26 08:06:49'),
(34, 187, 11, '2019-07-26 06:16:46', '2019-07-26 06:16:46'),
(33, 187, 8, '2019-07-26 06:16:46', '2019-07-26 06:16:46'),
(32, 187, 7, '2019-07-26 06:16:46', '2019-07-26 06:16:46'),
(31, 187, 10, '2019-07-26 06:16:46', '2019-07-26 06:16:46'),
(30, 186, 8, '2019-07-26 06:15:08', '2019-07-26 06:15:08'),
(29, 186, 7, '2019-07-26 06:15:08', '2019-07-26 06:15:08'),
(28, 186, 10, '2019-07-26 06:15:08', '2019-07-26 06:15:08'),
(55, 193, 11, '2019-07-26 17:45:15', '2019-07-26 17:45:15'),
(56, 194, 10, '2019-07-26 18:22:33', '2019-07-26 18:22:33'),
(57, 195, 11, '2019-07-26 19:45:38', '2019-07-26 19:45:38'),
(58, 196, 7, '2019-07-26 20:18:01', '2019-07-26 20:18:01'),
(59, 197, 10, '2019-07-26 20:19:24', '2019-07-26 20:19:24'),
(60, 198, 7, '2019-07-27 13:53:21', '2019-07-27 13:53:21'),
(61, 199, 10, '2019-07-28 06:33:14', '2019-07-28 06:33:14'),
(62, 199, 7, '2019-07-28 06:33:14', '2019-07-28 06:33:14'),
(82, 200, 8, '2019-07-29 17:43:52', '2019-07-29 17:43:52'),
(81, 200, 7, '2019-07-29 17:43:52', '2019-07-29 17:43:52'),
(80, 200, 10, '2019-07-29 17:43:52', '2019-07-29 17:43:52'),
(83, 200, 11, '2019-07-29 17:43:52', '2019-07-29 17:43:52'),
(84, 201, 10, '2019-07-30 06:15:40', '2019-07-30 06:15:40'),
(85, 201, 7, '2019-07-30 06:15:40', '2019-07-30 06:15:40'),
(86, 202, 10, '2019-07-30 06:16:53', '2019-07-30 06:16:53'),
(87, 202, 7, '2019-07-30 06:16:53', '2019-07-30 06:16:53'),
(110, 203, 11, '2019-07-30 07:30:18', '2019-07-30 07:30:18'),
(109, 203, 6, '2019-07-30 07:30:18', '2019-07-30 07:30:18'),
(108, 203, 7, '2019-07-30 07:30:18', '2019-07-30 07:30:18'),
(91, 204, 10, '2019-07-30 07:15:40', '2019-07-30 07:15:40'),
(92, 204, 7, '2019-07-30 07:15:40', '2019-07-30 07:15:40'),
(93, 205, 10, '2019-07-30 07:20:19', '2019-07-30 07:20:19'),
(94, 205, 7, '2019-07-30 07:20:19', '2019-07-30 07:20:19'),
(95, 205, 9, '2019-07-30 07:20:19', '2019-07-30 07:20:19'),
(111, 206, 7, '2019-07-30 07:42:20', '2019-07-30 07:42:20'),
(112, 206, 11, '2019-07-30 07:42:20', '2019-07-30 07:42:20'),
(113, 207, 10, '2019-07-31 02:09:15', '2019-07-31 02:09:15'),
(114, 207, 9, '2019-07-31 02:09:15', '2019-07-31 02:09:15'),
(115, 207, 2, '2019-07-31 02:09:15', '2019-07-31 02:09:15'),
(116, 207, 11, '2019-07-31 02:09:15', '2019-07-31 02:09:15'),
(117, 208, 10, '2019-08-05 07:59:11', '2019-08-05 07:59:11'),
(118, 208, 7, '2019-08-05 07:59:11', '2019-08-05 07:59:11'),
(119, 209, 6, '2019-08-05 08:02:35', '2019-08-05 08:02:35'),
(120, 210, 2, '2019-08-05 08:03:55', '2019-08-05 08:03:55'),
(123, 211, 2, '2019-08-05 08:14:44', '2019-08-05 08:14:44'),
(148, 213, 8, '2019-08-05 11:11:37', '2019-08-05 11:11:37'),
(128, 212, 8, '2019-08-05 08:18:20', '2019-08-05 08:18:20'),
(130, 214, 3, '2019-08-05 08:23:28', '2019-08-05 08:23:28'),
(131, 214, 1, '2019-08-05 08:23:28', '2019-08-05 08:23:28'),
(132, 215, 1, '2019-08-05 08:37:56', '2019-08-05 08:37:56'),
(140, 216, 10, '2019-08-05 09:17:20', '2019-08-05 09:17:20'),
(141, 217, 10, '2019-08-05 09:33:40', '2019-08-05 09:33:40'),
(144, 218, 7, '2019-08-05 09:49:13', '2019-08-05 09:49:13'),
(145, 219, 7, '2019-08-05 10:00:53', '2019-08-05 10:00:53'),
(146, 220, 3, '2019-08-05 10:07:10', '2019-08-05 10:07:10'),
(147, 220, 1, '2019-08-05 10:07:10', '2019-08-05 10:07:10'),
(149, 221, 10, '2019-08-11 08:04:45', '2019-08-11 08:04:45'),
(150, 221, 11, '2019-08-11 08:04:45', '2019-08-11 08:04:45'),
(151, 222, 7, '2019-08-11 17:01:35', '2019-08-11 17:01:35'),
(152, 223, 7, '2019-08-11 19:03:17', '2019-08-11 19:03:17'),
(153, 223, 9, '2019-08-11 19:03:17', '2019-08-11 19:03:17'),
(154, 224, 8, '2019-08-11 19:05:43', '2019-08-11 19:05:43'),
(155, 224, 3, '2019-08-11 19:05:43', '2019-08-11 19:05:43'),
(156, 224, 11, '2019-08-11 19:05:43', '2019-08-11 19:05:43'),
(193, 225, 10, '2019-08-14 14:14:33', '2019-08-14 14:14:33'),
(158, 226, 7, '2019-08-12 07:42:36', '2019-08-12 07:42:36'),
(230, 227, 11, '2019-08-14 17:23:38', '2019-08-14 17:23:38'),
(229, 227, 9, '2019-08-14 17:23:38', '2019-08-14 17:23:38'),
(210, 228, 9, '2019-08-14 15:41:13', '2019-08-14 15:41:13'),
(201, 229, 11, '2019-08-14 15:02:48', '2019-08-14 15:02:48'),
(200, 229, 7, '2019-08-14 15:02:48', '2019-08-14 15:02:48'),
(209, 228, 8, '2019-08-14 15:41:13', '2019-08-14 15:41:13'),
(208, 228, 7, '2019-08-14 15:41:13', '2019-08-14 15:41:13'),
(232, 230, 10, '2019-08-14 17:33:14', '2019-08-14 17:33:14'),
(238, 231, 10, '2019-08-14 17:40:06', '2019-08-14 17:40:06'),
(237, 232, 7, '2019-08-14 17:37:03', '2019-08-14 17:37:03'),
(239, 231, 7, '2019-08-14 17:40:06', '2019-08-14 17:40:06'),
(240, 231, 8, '2019-08-14 17:40:06', '2019-08-14 17:40:06'),
(241, 231, 9, '2019-08-14 17:40:06', '2019-08-14 17:40:06'),
(242, 233, 7, '2019-08-16 18:07:14', '2019-08-16 18:07:14'),
(243, 234, 8, '2019-08-16 18:33:11', '2019-08-16 18:33:11'),
(244, 234, 11, '2019-08-16 18:33:11', '2019-08-16 18:33:11'),
(247, 235, 10, '2019-08-16 19:20:29', '2019-08-16 19:20:29'),
(248, 236, 10, '2019-08-17 18:26:18', '2019-08-17 18:26:18'),
(249, 237, 10, '2019-08-17 18:35:42', '2019-08-17 18:35:42'),
(250, 238, 11, '2019-08-17 19:04:01', '2019-08-17 19:04:01'),
(251, 239, 11, '2019-08-17 19:04:04', '2019-08-17 19:04:04'),
(252, 240, 3, '2019-08-17 19:09:42', '2019-08-17 19:09:42'),
(253, 240, 2, '2019-08-17 19:09:42', '2019-08-17 19:09:42'),
(268, 241, 11, '2019-08-18 18:25:23', '2019-08-18 18:25:23'),
(267, 241, 9, '2019-08-18 18:25:23', '2019-08-18 18:25:23'),
(266, 241, 8, '2019-08-18 18:25:23', '2019-08-18 18:25:23'),
(276, 1, 7, '2019-08-19 09:15:18', '2019-08-19 09:15:18'),
(275, 1, 10, '2019-08-19 09:15:18', '2019-08-19 09:15:18'),
(284, 2, 7, '2019-08-19 10:08:53', '2019-08-19 10:08:53'),
(283, 2, 10, '2019-08-19 10:08:53', '2019-08-19 10:08:53'),
(285, 3, 11, '2019-08-19 10:22:32', '2019-08-19 10:22:32'),
(286, 4, 9, '2019-08-23 04:35:27', '2019-08-23 04:35:27'),
(288, 5, 8, '2019-08-23 09:17:54', '2019-08-23 09:17:54'),
(289, 6, 8, '2019-08-23 09:20:03', '2019-08-23 09:20:03'),
(290, 7, 8, '2019-08-23 09:41:10', '2019-08-23 09:41:10'),
(291, 8, 7, '2019-08-23 09:58:54', '2019-08-23 09:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_tekesasi_crime_type`
--

CREATE TABLE `ftabher_tekesasi_crime_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `kesasiId` int(11) NOT NULL,
  `isAccuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `tekesasiId` int(11) DEFAULT NULL,
  `waninId` int(255) NOT NULL,
  `inherit_typeId` int(255) DEFAULT NULL,
  `property_typeId` int(11) DEFAULT NULL,
  `numericValue` float DEFAULT NULL,
  `accuser_numericValue` float DEFAULT NULL,
  `akabiHgi_numericValue` float DEFAULT NULL,
  `akabiHgi_decisionTypeId` int(11) DEFAULT NULL,
  `betFrdi_compensationTypeId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_propertyTypeId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_numericValue` float DEFAULT NULL,
  `lawyerSupportStatus` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `afterCrimeCommited` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isOpponentDecisionMaker_akabiHgi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `oppenent_akabiHgi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oppenent_akabiHgi_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akabiHgi_decisionMaker` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decisionMaker_akabiHgi_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_akabiHgi_decision` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyerPoliceDocumentReturnDate` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyerPoliceDocumentReturnedDate` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_decisionMaker` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_betFrdi_decision` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modification_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_decisionTypeId` int(11) DEFAULT NULL,
  `afterDefended` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `punishmentType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amountOfMoney` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfRestriction` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfRestriction_unit` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfPrison` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfPrison_unit` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDefendantAvaliable` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `arguementType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickedOverReason` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAppealerLawyer` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `appealRequestedBy` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealRequestedBy_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealRespondedBy` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealRespondedBy_phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyer_appealReason` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrant_Status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrant_Execution_Status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canAppeal` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `execution_accusal_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_lawyer_decision_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_court_decision_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_ablility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unable_to_execute_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_accusal_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_court_decision_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_court_decision_arguementType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `not_executed_court_decision_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_akabiHgiFullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_arbiterFullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_tekesasi_crime_type`
--

INSERT INTO `ftabher_tekesasi_crime_type` (`id`, `ksi_mezgeb_brkiId`, `kesasiId`, `isAccuser`, `tekesasiId`, `waninId`, `inherit_typeId`, `property_typeId`, `numericValue`, `accuser_numericValue`, `akabiHgi_numericValue`, `akabiHgi_decisionTypeId`, `betFrdi_compensationTypeId`, `betFrdi_propertyTypeId`, `betFrdi_numericValue`, `lawyerSupportStatus`, `afterCrimeCommited`, `isOpponentDecisionMaker_akabiHgi`, `oppenent_akabiHgi`, `oppenent_akabiHgi_phoneNumber`, `akabiHgi_decisionMaker`, `decisionMaker_akabiHgi_phoneNumber`, `date_of_akabiHgi_decision`, `lawyerPoliceDocumentReturnDate`, `lawyerPoliceDocumentReturnedDate`, `betFrdi_decisionMaker`, `date_of_betFrdi_decision`, `modification_status`, `betFrdi_decisionTypeId`, `afterDefended`, `punishmentType`, `amountOfMoney`, `lengthOfRestriction`, `lengthOfRestriction_unit`, `lengthOfPrison`, `lengthOfPrison_unit`, `isDefendantAvaliable`, `arguementType`, `pickedOverReason`, `date`, `isAppealerLawyer`, `appealRequestedBy`, `appealRequestedBy_phoneNumber`, `appealRespondedBy`, `appealRespondedBy_phoneNumber`, `lawyer_appealReason`, `warrant_Status`, `warrant_Execution_Status`, `canAppeal`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`, `execution_accusal_date`, `execution_lawyer_decision_date`, `execution_court_decision_date`, `execution_ablility`, `unable_to_execute_reason`, `execution_accusal_status`, `execution_court_decision_type`, `execution_court_decision_arguementType`, `not_executed_court_decision_reason`, `execution_akabiHgiFullName`, `execution_arbiterFullName`) VALUES
(4, 2, 2, 'true', 2, 7, NULL, NULL, 1000, 1000, 800, 1, NULL, NULL, 750, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '13/12/2011 23:17:0', NULL, NULL, NULL, '15/12/2011 0:0:0', 'Not_Modified', 2, 'Not_Defended', '3', NULL, NULL, NULL, NULL, NULL, 'false', 'Debate', NULL, '2011/12/13 10:2:12', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:02:12', '2019-08-24 08:04:43', '18/12/2011', NULL, NULL, 'Able_To_Execute', NULL, 'Accused_On_Execution', 'Not_Executed', NULL, 'fyui', NULL, NULL),
(5, 2, 2, 'true', 2, 10, NULL, 1, 1, 400, 400, 1, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '13/12/2011 23:17:0', NULL, NULL, NULL, '15/12/2011 0:0:0', 'Not_Modified', 1, 'Not_Defended', '3', NULL, NULL, NULL, NULL, NULL, 'false', 'Debate', NULL, '2011/12/13 10:2:12', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:02:12', '2019-08-24 09:05:11', NULL, NULL, NULL, 'Able_To_Execute', NULL, 'Accused_On_Execution', 'Not_Executed', NULL, 'fyui', NULL, NULL),
(6, 2, 2, 'true', 2, 10, NULL, 2, 2, 600, 600, 1, NULL, NULL, 500, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '13/12/2011 23:17:0', NULL, '17/12/2011', NULL, '15/12/2011 0:0:0', 'Not_Modified', 2, 'Not_Defended', '3', NULL, NULL, NULL, NULL, NULL, 'false', 'Debate', NULL, '2011/12/13 10:2:12', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:02:12', '2019-08-23 04:42:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, 3, 'true', 3, 11, 2, 1, 3, 3000, 680, 1, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '13/12/2011 0:0:0', NULL, NULL, NULL, '13/12/2011 0:0:0', 'Not_Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2011/12/13 10:25:1', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:25:01', '2019-08-19 11:35:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 3, 3, 'true', 3, 11, 2, 2, 2, 1500, 600, 1, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '13/12/2011 0:0:0', NULL, NULL, NULL, '13/12/2011 0:0:0', 'Not_Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2011/12/13 10:25:1', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:25:01', '2019-08-19 11:36:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 5, 4, 'true', 4, 11, 2, 1, 3, 3000, 680, NULL, NULL, NULL, NULL, 'Supported', NULL, 'true', NULL, NULL, 'tue teu eu', NULL, '16/12/2011 6:5:0', NULL, NULL, NULL, '13/12/2011 9:5:0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'Debate', NULL, '13/12/2011 17:35:30', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Free', NULL, NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:35:30', '2019-08-24 08:33:35', NULL, NULL, NULL, 'Unable_To_Execute', 'fjdjggjd', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 5, 5, 'true', 5, 11, 2, 2, 2, 1500, 600, NULL, NULL, NULL, 1234570000, 'Supported', NULL, 'true', NULL, NULL, 'tue teu eu', NULL, '16/12/2011 6:5:0', NULL, NULL, NULL, '13/12/2011 9:5:0', NULL, 2, NULL, '3', NULL, NULL, NULL, NULL, NULL, 'false', 'Debate', NULL, '13/12/2011 17:36:25', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Free', NULL, NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:36:25', '2019-08-24 08:03:18', '18/12/2011', NULL, '18/12/2011', 'Able_To_Execute', NULL, 'Accused_On_Execution', 'Executed', 'Debate', 'dfzhsdhf', NULL, NULL),
(11, 6, 6, 'true', 6, 9, NULL, NULL, 1500, 1500, 600, 1, NULL, NULL, 4500, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '17/12/2011 1:1:0', NULL, NULL, NULL, '17/12/2011 6:5:0', 'Not_Modified', 2, 'Not_Defended', '5', NULL, NULL, NULL, NULL, NULL, 'false', 'Agreement', NULL, '17/12/2011 10:36:51', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-23 04:36:51', '2019-08-24 08:00:04', '18/12/2011', NULL, '18/12/2011', 'Able_To_Execute', NULL, 'Accused_On_Execution', 'Executed', 'Debate', NULL, NULL, NULL),
(12, 9, 9, 'true', 7, 8, NULL, NULL, 4000, 4000, 3500, 1, '2', NULL, 3200, NULL, NULL, 'true', NULL, NULL, 'gnxcvnxnxmn', NULL, '17/12/2011 1:1:0', NULL, NULL, NULL, '17/12/2011 2:3:0', 'Not_Modified', 2, 'Not_Defended', '3', NULL, NULL, NULL, NULL, NULL, 'false', 'Debate', NULL, '17/12/2011 15:44:55', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:44:55', '2019-08-23 09:48:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 10, 10, 'true', 8, 7, NULL, NULL, 500, 500, 500, 1, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 'rr', NULL, '17/12/2011 0:0:0', NULL, NULL, NULL, '17/12/2011 1:1:0', 'Not_Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '17/12/2011 16:27:11', 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, 33, NULL, 'active', 'false', '2019-08-23 10:27:11', '2019-08-23 10:53:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 11, 11, 'true', 9, 7, NULL, NULL, 500, 500, 500, NULL, NULL, NULL, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '17/12/2011 3:4:0', NULL, NULL, NULL, '17/12/2011 1:2:0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '17/12/2011 16:53:7', 'true', '568487n 65 86', NULL, NULL, NULL, 'On_Free', NULL, NULL, 'false', NULL, 33, NULL, 'active', 'false', '2019-08-23 10:53:07', '2019-08-23 11:04:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 12, 12, 'true', 10, 7, NULL, NULL, 500, 500, 500, NULL, '3', NULL, 230, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '17/12/2011 0:0:0', NULL, NULL, NULL, '17/12/2011 0:0:0', NULL, 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'false', 'Agreement', NULL, '17/12/2011 17:4:41', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Free', NULL, NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-23 11:04:41', '2019-08-23 16:52:34', '17/12/2011', NULL, '17/12/2011', 'Able_To_Execute', NULL, 'Accused_On_Execution', 'Executed', 'Debate', 'ምክንያት የብሉን', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_tekesasi_health_status`
--

CREATE TABLE `ftabher_tekesasi_health_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `personId` int(11) NOT NULL,
  `healthStatusId` int(11) DEFAULT NULL,
  `disabilityTypeId` int(11) DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_tekesasi_health_status`
--

INSERT INTO `ftabher_tekesasi_health_status` (`id`, `personId`, `healthStatusId`, `disabilityTypeId`, `createdByUserId`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 34, '2019-08-19 09:11:16', '2019-08-19 09:11:16'),
(2, 2, NULL, NULL, 34, '2019-08-19 10:01:56', '2019-08-19 10:01:56'),
(3, 3, 1, NULL, 34, '2019-08-19 10:24:51', '2019-08-19 10:24:51'),
(4, 6, 1, NULL, 34, '2019-08-23 04:36:39', '2019-08-23 04:36:39'),
(5, 7, NULL, NULL, 33, '2019-08-23 09:44:50', '2019-08-23 09:44:50'),
(6, 8, NULL, NULL, 33, '2019-08-23 10:26:50', '2019-08-23 10:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_tekesesti_mezgeb`
--

CREATE TABLE `ftabher_tekesesti_mezgeb` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `fullName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weredaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabyaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_regionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_zoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_weredaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_tabyaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `nationalityId` int(11) DEFAULT NULL,
  `religionId` int(11) DEFAULT NULL,
  `merriage_statusId` int(11) DEFAULT NULL,
  `pob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tekesasi_healthStatusId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isAccuserAVictim` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agentType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_age` int(255) DEFAULT NULL,
  `tebedali_nationalityId` int(255) DEFAULT NULL,
  `tebedali_religionId` int(255) DEFAULT NULL,
  `tebedali_merriage_statusId` int(255) DEFAULT NULL,
  `tebedali_pob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_tekesesti_mezgeb`
--

INSERT INTO `ftabher_tekesesti_mezgeb` (`id`, `ksi_mezgeb_brkiId`, `fullName`, `phoneNumber`, `gender`, `regionId`, `zoneId`, `weredaId`, `tabyaId`, `tebedali_regionId`, `tebedali_zoneId`, `tebedali_weredaId`, `tebedali_tabyaId`, `age`, `nationalityId`, `religionId`, `merriage_statusId`, `pob`, `fax`, `email`, `tekesasi_healthStatusId`, `isAccuserAVictim`, `agentType`, `tebedali_fullName`, `tebedali_phoneNumber`, `tebedali_gender`, `tebedali_age`, `tebedali_nationalityId`, `tebedali_religionId`, `tebedali_merriage_statusId`, `tebedali_pob`, `tebedali_fax`, `tebedali_email`, `date`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 2, 'በርሀ ኪሮስ ገብሩ', '342344560', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011/12/13 10:1:56', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:01:56', '2019-08-19 10:01:56'),
(3, 3, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 34, 5, 1, 1, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011/12/13 10:24:51', NULL, 34, NULL, 'active', 'false', '2019-08-19 10:24:51', '2019-08-19 10:24:51'),
(4, 5, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 34, 5, 1, 1, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13/12/2011 17:35:30', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:35:30', '2019-08-19 11:35:30'),
(5, 5, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 34, 5, 1, 1, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13/12/2011 17:36:25', NULL, 34, NULL, 'active', 'false', '2019-08-19 11:36:25', '2019-08-19 11:36:25'),
(6, 6, 'በርሀ ኪሮስ ገብሩ', NULL, 'Male', '2', '3', '3', '2', NULL, NULL, NULL, NULL, 4, 5, 1, 1, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 10:36:39', NULL, 34, NULL, 'active', 'false', '2019-08-23 04:36:39', '2019-08-23 04:36:39'),
(7, 9, 'qtettt', '3465737737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '3', 'r@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 15:44:49', NULL, 33, NULL, 'active', 'false', '2019-08-23 09:44:49', '2019-08-23 09:44:49'),
(8, 10, 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a@gmail.com', NULL, 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 16:27:6', NULL, 33, NULL, 'active', 'false', '2019-08-23 10:26:50', '2019-08-23 10:27:06'),
(9, 11, 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a@gmail.com', NULL, 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 16:53:7', NULL, 33, NULL, 'active', 'false', '2019-08-23 10:53:07', '2019-08-23 10:53:07'),
(10, 12, 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a@gmail.com', NULL, 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17/12/2011 17:4:41', NULL, 34, NULL, 'active', 'false', '2019-08-23 11:04:41', '2019-08-23 11:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_wsanetat_akabihgi`
--

CREATE TABLE `ftabher_wsanetat_akabihgi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_wsanetat_akabihgi`
--

INSERT INTO `ftabher_wsanetat_akabihgi` (`id`, `name`, `keyWord`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ክሲ ዝተመስረቶ', 'Accused', NULL, NULL, 'active', 'false', '2019-06-01 04:52:06', '2019-06-01 04:52:06'),
(2, 'ዘየክስስ', 'Insufficient_To_Accuse', NULL, NULL, 'active', 'false', '2019-06-01 04:52:06', '2019-06-01 04:52:06'),
(3, 'ዝተመልሰ', 'Returned', NULL, NULL, 'active', 'false', '2019-06-01 04:52:06', '2019-06-01 04:52:06'),
(4, 'ካልእ', 'Other', NULL, NULL, 'active', 'false', '2019-06-01 04:52:06', '2019-06-01 04:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_wsanetat_betfrdi`
--

CREATE TABLE `ftabher_wsanetat_betfrdi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_wsanetat_betfrdi`
--

INSERT INTO `ftabher_wsanetat_betfrdi` (`id`, `name`, `keyWord`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ነፃ', 'Free', NULL, NULL, 'active', 'false', '2019-06-10 19:57:36', '2019-06-10 19:57:36'),
(2, 'ጥፍኣተኛ/በዓል ዕዳ', 'Guilty', NULL, NULL, 'active', 'false', '2019-06-10 19:57:36', '2019-06-10 19:57:36'),
(3, 'ብነጥቢ ዝተመለሰ', 'By_Point', NULL, NULL, 'active', 'false', '2019-06-10 19:57:36', '2019-06-10 19:57:36'),
(4, 'ዝተልዓለ', 'Picked_Over', NULL, NULL, 'active', 'false', '2019-06-10 19:57:36', '2019-06-10 19:57:36'),
(5, 'ካልእ', 'Other', NULL, NULL, 'active', 'false', '2019-06-10 19:57:36', '2019-06-10 19:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `ftabher_wsanetat_tfeat_betfrdi`
--

CREATE TABLE `ftabher_wsanetat_tfeat_betfrdi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ftabher_wsanetat_tfeat_betfrdi`
--

INSERT INTO `ftabher_wsanetat_tfeat_betfrdi` (`id`, `name`, `keyWord`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(3, 'ገንዘብ ክፍሊት', 'Money', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(2, 'ብውዕሊ ምስራዝ', 'Cancel_Deal', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(1, 'ብውዕሊ ምፍፃም', 'Execute_Deal', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(4, 'ካሕሳ', 'Compensation', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(5, 'ንብረት ምምላስ', 'Return_Of_Property', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(6, 'ምፅዳቕ ውርሲ', 'Approve_Inherit', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(7, 'ምፅዳቕ ኣቦነት', 'Approve_Father', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(8, 'ምፅዳቕ ሞግዚትነት', 'Approve_Caretaker', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(9, 'ናብ ስራሕ ምምላስ', 'Return_To_Job', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14'),
(10, 'ካልእ', 'Other', NULL, NULL, 'active', 'false', '2019-06-04 16:14:14', '2019-06-04 16:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `generals`
--

CREATE TABLE `generals` (
  `id` int(10) UNSIGNED NOT NULL,
  `logoImage` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'logoImage.jpg',
  `logoText` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'E-Commerce',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generals`
--

INSERT INTO `generals` (`id`, `logoImage`, `logoText`, `created_at`, `updated_at`) VALUES
(1, 'logoImage.jpg', 'E-Commerce', '2018-11-27 04:54:46', '2018-11-27 04:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `glgalot_ntsadgaf_hgi`
--

CREATE TABLE `glgalot_ntsadgaf_hgi` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `created_a_brki` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_given_party_typeId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalityId` int(11) NOT NULL,
  `merriage_statusId` int(11) NOT NULL,
  `aynet_glgalotId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_request_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_given_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality_glgalotId` int(11) NOT NULL,
  `not_quality_glgalot_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `effective_glgalotId` int(11) NOT NULL,
  `not_effective_glgalot_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satisfaction_statusId` int(11) NOT NULL,
  `not_satisfied_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_of_glgalot_request_and_given` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_given_by_lawyer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_given_by_lawyer_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_approved_by_leader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_approved_by_leader_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_given` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_not_given_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `glgalot_ntsadgaf_hgi`
--

INSERT INTO `glgalot_ntsadgaf_hgi` (`id`, `regionId`, `zoneId`, `weredaId`, `created_a_brki`, `entryDate`, `brkiId`, `glgalot_given_party_typeId`, `name`, `age`, `gender`, `nationalityId`, `merriage_statusId`, `aynet_glgalotId`, `glgalot_request_date`, `glgalot_given_date`, `quality_glgalotId`, `not_quality_glgalot_reason`, `effective_glgalotId`, `not_effective_glgalot_reason`, `satisfaction_statusId`, `not_satisfied_reason`, `detail_of_glgalot_request_and_given`, `glgalot_given_by_lawyer`, `glgalot_given_by_lawyer_date`, `glgalot_approved_by_leader`, `glgalot_approved_by_leader_date`, `priority_status`, `priority_given`, `priority_not_given_reason`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 3, 'Region', '2/12/2011', '3', '2', 'auditer1', '61', 'Male', 5, 1, '4', '02/12/2011', '02/12/2011', 1, NULL, 1, NULL, 1, NULL, 'dfgdfg', 'dgdfg', '02/12/2011', 'zdgdfhahf', '02/12/2011', 'ዝግበኦ', 'ዝተውሃበ', NULL, 14, NULL, 'active', 'false', '2019-08-08 12:08:32', '2019-08-26 15:39:53'),
(2, 2, 3, 4, 'Wereda', '2/12/2011', '1', '4', 'aaqw', '34', 'Male', 5, 1, '3', '02/12/2011', '02/12/2011', 1, NULL, 2, 'dfdfhahd', 1, NULL, 'fdhsfhsdh', 'dfhhwrth', '02/12/2011', 'dfahadf', '02/12/2011', 'ዝግበኦ', 'ዝተውሃበ', NULL, 30, NULL, 'active', 'false', '2019-08-08 12:13:09', '2019-08-08 12:13:09'),
(3, 2, 3, 4, 'Wereda', '2/12/2011', '1', '5', 'fdbsf', '34', 'Male', 5, 2, '2', '03/12/2011', '02/12/2011', 2, NULL, 2, NULL, 2, NULL, 'fdhsfhsdh', 'rehwhtwht', '02/12/2011', 'fsgnsgmsm', '02/12/2011', 'ዘይግበኦ', 'ዝተውሃበ', NULL, 30, NULL, 'active', 'false', '2019-08-08 12:14:25', '2019-08-26 18:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `glgalot_types`
--

CREATE TABLE `glgalot_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `glgalot_types`
--

INSERT INTO `glgalot_types` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Advice_Of_Law', 'ምኽሪ ሕጊ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Document_Preparation', 'ምድላው ፅሑፍ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(3, 'Accusal_Preparation', 'ምድላው ክሲ/መልሲ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(4, 'Argument', 'ምክያድ ክርክር', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(5, 'Other', 'ካልእ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'group 1\r\n', NULL, 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `habereta_nebari_tabya`
--

CREATE TABLE `habereta_nebari_tabya` (
  `id` int(10) UNSIGNED NOT NULL,
  `tabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twldiZoneId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twldiWeredaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twldiTabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twldiKebelleId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kunetatHadarId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bherId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religionId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zegnetId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metawekyaCard` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zteadeleluElet` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentKebelleId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lmeatGujleId` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `educationalLevelId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skillId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `awdeSrahId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wannetMenberiId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiModelnetId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kunetatMgbiWhsnaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hafeshawi_habereta_tabya`
--

CREATE TABLE `hafeshawi_habereta_tabya` (
  `id` int(10) UNSIGNED NOT NULL,
  `tabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distanceFromMekelle_In_KM` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `north` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `south` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `east` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `west` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotness` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coldness` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rainfall` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `humidity` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elevation_max` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elevation_min` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `farmland_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grassland_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocky_mountains_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `irrigatable_land_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unirrigatable_land_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tkmi_zeyhb_guhmitat_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tsedaf_meret_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meda_meret_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maekelay_meret_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bden_zteshefene_meret_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kewemti_tekli_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_area_In_Hectar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_statuses`
--

CREATE TABLE `health_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_statuses`
--

INSERT INTO `health_statuses` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ሙሉእ ኣካል', NULL, 0, 'active', 'false', '2019-06-10 16:19:08', '2019-06-10 16:19:08'),
(2, 'ኣካል ጉድእ', NULL, 0, 'active', 'false', '2019-06-10 16:19:08', '2019-06-10 16:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `human_right`
--

CREATE TABLE `human_right` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `tabyaId` int(11) DEFAULT NULL,
  `created_a_brki` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crime_typeId` int(11) NOT NULL,
  `crime_weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kunetat_tekesestiId` int(11) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_of_lawyer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_lawyer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merriage_statusId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waited_time_in_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentator_police_or_other` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_of_leader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_approval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `human_right`
--

INSERT INTO `human_right` (`id`, `regionId`, `zoneId`, `weredaId`, `tabyaId`, `created_a_brki`, `entryDate`, `brkiId`, `name`, `address`, `age`, `gender`, `crime_typeId`, `crime_weight`, `kunetat_tekesestiId`, `comment`, `name_of_lawyer`, `date_of_lawyer`, `merriage_statusId`, `waited_time_in_days`, `nationality`, `commentator_police_or_other`, `name_of_leader`, `date_of_approval`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 4, 4, 'Breaking_Region', '7/12/2011', '4', 'checker1', NULL, '54', 'Male', 4, 'Light_Weight_Crimes', 3, 'fhsj', 'gsdfgg', '07/12/2011', '1', '5', '5', 'fghs', 'gfdj', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 15:21:17', '2019-08-13 15:28:12'),
(2, 2, 3, 3, NULL, 'Breaking_Region', '7/12/2011', '4', 'checker1', NULL, '54', 'Male', 2, 'Light_Weight_Crimes', 2, 'fds', 'fdh', '07/12/2011', '1', '6', '5', 'hh', 'fhsdfsj', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 15:22:12', '2019-08-13 15:22:12'),
(3, 2, 3, 3, NULL, 'Breaking_Region', '7/12/2011', '4', 'checker1', NULL, '54', 'Male', 1, 'Light_Weight_Crimes', 2, 'fgjdgj', 'dgahadh', '07/12/2011', '2', '5', '5', 'rrtueru', 'fgjgd', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 15:29:26', '2019-08-13 15:29:26'),
(4, 2, 3, 3, 4, 'Breaking_Region', '7/12/2011', '4', 'treut', NULL, '45', 'Female', 5, 'Light_Weight_Crimes', 2, 'dfhs', 'etwe', '07/12/2011', '2', '6', '5', 'etwyr', 'fjsrjr', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 15:34:02', '2019-08-13 16:02:08'),
(5, 2, 6, 48, NULL, 'Breaking_Region', '7/12/2011', '4', 'checker1', NULL, '5', 'Male', 2, 'Light_Weight_Crimes', 4, 'fghsjsfj', 'dhshrw', '07/12/2011', '1', '5', '5', 'wrywu', 'dfhsdfh', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 17:56:15', '2019-08-13 17:56:15');

-- --------------------------------------------------------

--
-- Table structure for table `human_right_complain_record`
--

CREATE TABLE `human_right_complain_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `truthness_statusId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aynet_treanId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `human_rightId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `solution_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `human_right_complain_record`
--

INSERT INTO `human_right_complain_record` (`id`, `truthness_statusId`, `aynet_treanId`, `human_rightId`, `solution_status`, `created_at`, `updated_at`) VALUES
(5, '1', '5', '3', 'Not_Solved', '2019-08-08 07:10:14', '2019-08-08 07:10:14'),
(6, '1', '7', '3', 'Solved', '2019-08-08 07:10:14', '2019-08-08 07:10:14'),
(7, '1', '8', '3', 'Solved', '2019-08-08 07:10:14', '2019-08-08 07:10:14'),
(8, '1', '12', '3', 'Not_Solved', '2019-08-08 07:10:14', '2019-08-08 07:10:14'),
(17, '1', '1', '6', 'Solved', '2019-08-13 13:47:46', '2019-08-13 13:47:46'),
(18, '1', '3', '6', 'Solved', '2019-08-13 13:47:46', '2019-08-13 13:47:46'),
(23, '1', '1', '3', 'Solved', '2019-08-13 15:29:26', '2019-08-13 15:29:26'),
(79, '1', '1', '5', 'Not_Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(80, '2', '4', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(81, '1', '5', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(82, '1', '6', '5', 'Not_Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(83, '1', '7', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(84, '1', '8', '5', 'Not_Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(85, '1', '9', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(86, '1', '10', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(87, '2', '11', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(88, '2', '12', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(89, '2', '13', '5', 'Not_Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58'),
(90, '2', '14', '5', 'Solved', '2019-08-14 05:36:58', '2019-08-14 05:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `human_right_prison`
--

CREATE TABLE `human_right_prison` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `tabyaId` int(255) DEFAULT NULL,
  `created_a_brki` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crime_typeId` int(11) NOT NULL,
  `crime_weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meten_frdi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_decision` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prison_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentator_police_or_other` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_of_lawyer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_follow_up` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_of_leader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_approval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `human_right_prison`
--

INSERT INTO `human_right_prison` (`id`, `regionId`, `zoneId`, `weredaId`, `tabyaId`, `created_a_brki`, `entryDate`, `brkiId`, `crime_typeId`, `crime_weight`, `meten_frdi`, `date_of_decision`, `name`, `age`, `gender`, `prison_address`, `nationality`, `comment`, `commentator_police_or_other`, `name_of_lawyer`, `date_of_follow_up`, `name_of_leader`, `date_of_approval`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 3, NULL, 'Breaking_Region', '7/12/2011', '4', 2, 'Light_Weight_Crimes', '1', '02/12/2011', 'ንኡስ ወረዳ', '34', 'Male', 'ttt te t', '5', 'dfbadfns', 'dfbdfsn', 'dgsdh', '02/12/2011', 'fhdj', '02/12/2011', 34, NULL, 'active', 'false', '2019-08-08 07:40:02', '2019-08-13 14:26:47'),
(3, 2, 3, 4, NULL, 'Wereda', '2/12/2011', '1', 2, 'Light_Weight_Crimes', '6', '02/12/2011', 'aaa', '2', 'Male', 'ttt te t', '5', 'dfhs', 'rwetey', 'ee', '02/12/2011', 'fh', '02/12/2011', 30, NULL, 'active', 'false', '2019-08-08 10:21:56', '2019-08-08 10:21:56'),
(4, 2, 3, 3, NULL, 'Breaking_Region', '7/12/2011', '4', 9, 'Light_Weight_Crimes', '3', '07/12/2011', 'ንኡስ ወረዳ', '60', 'Male', 'ttt te t', '5', 'fgsfj', 'hsh', 'sga', '07/12/2011', 'fjdj', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 16:04:52', '2019-08-13 16:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `human_right_prison_complain_record`
--

CREATE TABLE `human_right_prison_complain_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `truthness_statusId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aynet_treanId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `human_rightId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `solution_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `human_right_prison_complain_record`
--

INSERT INTO `human_right_prison_complain_record` (`id`, `truthness_statusId`, `aynet_treanId`, `human_rightId`, `solution_status`, `created_at`, `updated_at`) VALUES
(11, '1', '1', '3', 'Solved', '2019-08-08 10:21:56', '2019-08-08 10:21:56'),
(12, '1', '2', '3', 'Not_Solved', '2019-08-08 10:21:56', '2019-08-08 10:21:56'),
(13, '1', '6', '3', 'Not_Solved', '2019-08-08 10:21:57', '2019-08-08 10:21:57'),
(14, '2', '7', '3', 'Solved', '2019-08-08 10:21:57', '2019-08-08 10:21:57'),
(15, '1', '8', '3', 'Solved', '2019-08-08 10:21:57', '2019-08-08 10:21:57'),
(52, '2', '1', '4', 'Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45'),
(53, '1', '2', '4', 'Not_Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45'),
(54, '2', '4', '4', 'Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45'),
(55, '2', '6', '4', 'Not_Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45'),
(56, '2', '7', '4', 'Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45'),
(57, '1', '8', '4', 'Not_Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45'),
(58, '1', '10', '4', 'Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45'),
(59, '1', '14', '4', 'Not_Solved', '2019-08-14 05:31:45', '2019-08-14 05:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `inherit_types`
--

CREATE TABLE `inherit_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inherit_types`
--

INSERT INTO `inherit_types` (`id`, `name`, `keyWord`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ገንዘብ', 'Money', 1, NULL, 'active', 'false', '2019-06-01 19:35:34', '2019-06-01 19:35:34'),
(2, 'ንብረት', 'Property', 1, NULL, 'active', 'false', '2019-06-01 19:35:55', '2019-06-01 19:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `kebelles`
--

CREATE TABLE `kebelles` (
  `id` int(10) UNSIGNED NOT NULL,
  `tabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `weredaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `zoneId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `regionId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kebelles`
--

INSERT INTO `kebelles` (`id`, `tabyaId`, `weredaId`, `zoneId`, `regionId`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, '1', '3', '3', '2', 'ንሕቢ', NULL, 1, 'active', 'false', '2019-04-18 19:54:02', '2019-04-18 19:54:02'),
(2, '1', '3', '3', '2', 'ማይ ኣብዓ', NULL, 1, 'active', 'false', '2019-04-18 19:54:53', '2019-04-18 19:55:21'),
(3, '4', '52', '6', '2', 'ሴሜን ምዕራብ 11', NULL, 14, 'active', 'false', '2019-07-13 11:44:26', '2019-07-13 11:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `kebelle_form_1p1`
--

CREATE TABLE `kebelle_form_1p1` (
  `id` int(10) UNSIGNED NOT NULL,
  `one_ሽምመሓውር` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `one_በዝሒሓይሊሰብ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `one_በዝሒመደብስራሕ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `one_ዝለዓለ_ደት` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `one_ዝተሓተ_ደት` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_ሽምመሓውር` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_በዝሒሓይሊሰብ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_በዝሒመደብስራሕ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_ዝለዓለ_ደት` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_ዝተሓተ_ደት` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kebelle_form_1p2`
--

CREATE TABLE `kebelle_form_1p2` (
  `id` int(10) UNSIGNED NOT NULL,
  `ሽምቤትዕዮ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ተባ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ኣነ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ዘድሊዝርዝርስራሕቲ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ብርኪስራሕ` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kebelle_form_1p2_joblist`
--

CREATE TABLE `kebelle_form_1p2_joblist` (
  `id` int(10) UNSIGNED NOT NULL,
  `kebelle_form_1p2Id` int(11) NOT NULL,
  `jobId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kesesti_ksi_mezgeb`
--

CREATE TABLE `kesesti_ksi_mezgeb` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `isAccuserALawOfficer` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `isAccuserAVictim` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `kesasi_fullName` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_phoneNumber` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_gender` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_regionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_zoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_weredaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_tabyaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_regionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_zoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_weredaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_tabyaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kesasi_age` int(11) DEFAULT NULL,
  `kesasi_nationalityId` int(11) DEFAULT NULL,
  `kesasi_religionId` int(11) DEFAULT NULL,
  `kesasi_merriage_statusId` int(11) DEFAULT NULL,
  `tebedali_fullName` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_phoneNumber` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_gender` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tebedali_age` int(11) DEFAULT NULL,
  `tebedali_nationalityId` int(11) DEFAULT NULL,
  `tebedali_religionId` int(11) DEFAULT NULL,
  `tebedali_merriage_statusId` int(11) DEFAULT NULL,
  `date` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kesesti_ksi_mezgeb`
--

INSERT INTO `kesesti_ksi_mezgeb` (`id`, `ksi_mezgeb_brkiId`, `isAccuserALawOfficer`, `isAccuserAVictim`, `kesasi_fullName`, `kesasi_phoneNumber`, `kesasi_gender`, `kesasi_regionId`, `kesasi_zoneId`, `kesasi_weredaId`, `kesasi_tabyaId`, `tebedali_regionId`, `tebedali_zoneId`, `tebedali_weredaId`, `tebedali_tabyaId`, `kesasi_age`, `kesasi_nationalityId`, `kesasi_religionId`, `kesasi_merriage_statusId`, `tebedali_fullName`, `tebedali_phoneNumber`, `tebedali_gender`, `tebedali_age`, `tebedali_nationalityId`, `tebedali_religionId`, `tebedali_merriage_statusId`, `date`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'false', 'false', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Male', '2', '3', '3', '1', '2', '3', '3', '1', 34, 5, 1, 2, 'rtryryr rtyrutr rurtur', '6879608090', 'Male', 5, 5, 1, 2, '14/12/2011 10:20:37', NULL, 34, NULL, 'active', 'false', '2019-08-20 04:19:09', '2019-08-20 04:20:37'),
(2, 2, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Female', '2', '3', '3', NULL, NULL, NULL, NULL, NULL, 19, 5, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14/12/2011 21:2:18', NULL, 34, NULL, 'active', 'false', '2019-08-20 14:56:49', '2019-08-20 15:02:18'),
(3, 3, 'true', 'false', 'ኣበበ ዳዊት ሃይላይ', '0123456789', NULL, NULL, NULL, NULL, NULL, '2', '3', '4', '3', NULL, NULL, NULL, NULL, 'dgadg sga dga', NULL, 'Female', 27, 5, 1, 2, '14/12/2011 21:27:29', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:11:57', '2019-08-20 15:27:29'),
(4, 3, 'true', 'false', 'ከበደ ዳዊት ሃይላይ', NULL, NULL, NULL, NULL, NULL, NULL, '2', '3', '3', '2', NULL, NULL, NULL, NULL, 'fgnfd fgf', NULL, 'Male', 8, 5, 1, NULL, '14/12/2011 21:27:29', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:17:26', '2019-08-20 15:27:29'),
(5, 4, 'true', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 0:57:50', NULL, 34, NULL, 'active', 'false', '2019-08-20 18:57:50', '2019-08-20 18:57:50'),
(6, 5, 'true', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 1:12:34', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:12:34', '2019-08-20 19:12:34'),
(7, 6, 'true', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 1:19:0', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:19:00', '2019-08-20 19:19:00'),
(8, 7, 'true', 'false', 'ኣበበ ዳዊት ሃይላይ', '0123456789', NULL, NULL, NULL, NULL, NULL, '2', '3', '4', '3', NULL, NULL, NULL, NULL, 'dgadg sga dga', NULL, 'Female', 27, 5, 1, 2, '15/12/2011 1:33:2', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:33:02', '2019-08-20 19:33:02'),
(9, 7, 'true', 'false', 'ከበደ ዳዊት ሃይላይ', NULL, NULL, NULL, NULL, NULL, NULL, '2', '3', '3', '2', NULL, NULL, NULL, NULL, 'fgnfd fgf', NULL, 'Male', 8, 5, 1, NULL, '15/12/2011 1:41:35', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:41:35', '2019-08-20 19:41:35'),
(10, 8, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', NULL, 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 25, 5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 1:50:24', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:50:24', '2019-08-20 19:50:24'),
(11, 9, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', NULL, 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 25, 5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 1:52:23', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:52:23', '2019-08-20 19:52:23'),
(12, 10, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', NULL, 'Male', '2', '3', '3', '1', NULL, NULL, NULL, NULL, 25, 5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 1:56:43', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:56:43', '2019-08-20 19:56:43'),
(13, 11, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Female', '2', '3', '3', NULL, NULL, NULL, NULL, NULL, 19, 5, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 1:59:3', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:59:03', '2019-08-20 19:59:03'),
(14, 12, 'false', 'true', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Female', '2', '3', '3', NULL, NULL, NULL, NULL, NULL, 19, 5, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 2:3:2', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:03:02', '2019-08-20 20:03:02'),
(15, 13, 'false', 'false', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Male', '2', '3', '3', '1', '2', '3', '3', '1', 34, 5, 1, 2, 'rtryryr rtyrutr rurtur', '6879608090', 'Male', 5, 5, 1, 2, '15/12/2011 2:5:15', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:05:15', '2019-08-20 20:05:15'),
(16, 14, 'false', 'false', 'ኣበበ ዳዊት ሃይላይ', '0123456789', 'Male', '2', '3', '3', '1', '2', '3', '3', '1', 34, 5, 1, 2, 'rtryryr rtyrutr rurtur', '6879608090', 'Male', 5, 5, 1, 2, '15/12/2011 2:7:13', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:07:13', '2019-08-20 20:07:13'),
(17, 15, 'true', 'true', 'gag adga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 14:11:56', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:11:56', '2019-08-21 08:11:56'),
(18, 16, 'true', 'true', 'gag adga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 14:14:57', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:14:57', '2019-08-21 08:14:57'),
(19, 17, 'true', 'true', 'a s d', '452738449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 14:25:18', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:25:18', '2019-08-21 08:25:18'),
(20, 17, 'true', 'true', 'sdga dgadg', '435673477', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 14:25:18', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:25:18', '2019-08-21 08:25:18'),
(21, 18, 'true', 'true', 'sdga dgadg', '435673477', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 14:28:18', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:28:18', '2019-08-21 08:28:18'),
(22, 18, 'true', 'true', 'a s d', '452738449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 14:29:33', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:29:33', '2019-08-21 08:29:33'),
(23, 19, 'true', 'true', 'sdga dgadg', '435673477', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15/12/2011 18:7:17', NULL, 34, NULL, 'active', 'false', '2019-08-21 12:07:17', '2019-08-21 12:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `kesesti_tekesasi`
--

CREATE TABLE `kesesti_tekesasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `brkiId` int(11) NOT NULL,
  `kesasiId` int(11) NOT NULL,
  `tekesasiId` int(11) NOT NULL,
  `date` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kesesti_tekesasi`
--

INSERT INTO `kesesti_tekesasi` (`id`, `brkiId`, `kesasiId`, `tekesasiId`, `date`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '14/12/2011 10:19:52', NULL, 34, NULL, 'active', 'false', '2019-08-20 04:19:52', '2019-08-20 04:19:52'),
(2, 2, 2, 2, '14/12/2011 20:58:3', NULL, 34, NULL, 'active', 'false', '2019-08-20 14:58:03', '2019-08-20 14:58:03'),
(3, 2, 2, 2, '14/12/2011 21:0:59', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:00:59', '2019-08-20 15:00:59'),
(4, 3, 3, 3, '14/12/2011 21:12:33', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:12:33', '2019-08-20 15:12:33'),
(5, 3, 4, 3, '14/12/2011 21:17:35', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:17:35', '2019-08-20 15:17:35'),
(6, 3, 3, 3, '14/12/2011 21:17:35', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:17:35', '2019-08-20 15:17:35'),
(7, 3, 4, 3, '14/12/2011 21:28:9', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:28:09', '2019-08-20 15:28:09'),
(8, 3, 3, 3, '14/12/2011 21:28:9', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:28:09', '2019-08-20 15:28:09'),
(9, 4, 5, 4, '15/12/2011 0:58:21', NULL, 34, NULL, 'active', 'false', '2019-08-20 18:58:21', '2019-08-20 18:58:21'),
(10, 5, 6, 5, '15/12/2011 1:12:34', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:12:34', '2019-08-20 19:12:34'),
(11, 6, 7, 6, '15/12/2011 1:19:0', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:19:00', '2019-08-20 19:19:00'),
(12, 7, 8, 7, '15/12/2011 1:33:2', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:33:02', '2019-08-20 19:33:02'),
(13, 7, 9, 8, '15/12/2011 1:41:35', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:41:35', '2019-08-20 19:41:35'),
(14, 8, 10, 9, '15/12/2011 1:51:1', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:51:01', '2019-08-20 19:51:01'),
(15, 9, 11, 10, '15/12/2011 1:52:23', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:52:23', '2019-08-20 19:52:23'),
(16, 10, 12, 11, '15/12/2011 1:56:43', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:56:43', '2019-08-20 19:56:43'),
(17, 11, 13, 12, '15/12/2011 1:59:3', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:59:03', '2019-08-20 19:59:03'),
(18, 12, 14, 13, '15/12/2011 2:3:2', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:03:02', '2019-08-20 20:03:02'),
(19, 13, 15, 14, '15/12/2011 2:5:15', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:05:15', '2019-08-20 20:05:15'),
(20, 14, 16, 15, '15/12/2011 2:7:13', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:07:13', '2019-08-20 20:07:13'),
(21, 15, 17, 16, '15/12/2011 14:12:34', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:12:34', '2019-08-21 08:12:34'),
(22, 15, 17, 16, '15/12/2011 14:12:52', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:12:52', '2019-08-21 08:12:52'),
(23, 16, 18, 17, '15/12/2011 14:14:57', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:14:57', '2019-08-21 08:14:57'),
(24, 17, 19, 18, '15/12/2011 14:25:57', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:25:57', '2019-08-21 08:25:57'),
(25, 17, 20, 18, '15/12/2011 14:25:57', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:25:57', '2019-08-21 08:25:57'),
(26, 18, 21, 19, '15/12/2011 14:28:18', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:28:18', '2019-08-21 08:28:18'),
(27, 18, 22, 20, '15/12/2011 14:29:33', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:29:33', '2019-08-21 08:29:33'),
(28, 19, 23, 21, '15/12/2011 18:7:17', NULL, 34, NULL, 'active', 'false', '2019-08-21 12:07:17', '2019-08-21 12:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `ksi_kotsorotat`
--

CREATE TABLE `ksi_kotsorotat` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgebId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ksi_mezgeb_brkiId` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ksi_mezgeb`
--

CREATE TABLE `ksi_mezgeb` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crimeWeight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modification_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not_Modified',
  `regionId` int(11) DEFAULT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `sub_weredaId` int(255) DEFAULT NULL,
  `tabyaId` int(11) DEFAULT NULL,
  `kebelleId` int(11) DEFAULT NULL,
  `is_followed_up` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'false',
  `followed_up_by_lawyer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentBrkiId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_a_brki` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ksi_mezgeb`
--

INSERT INTO `ksi_mezgeb` (`id`, `ksi_mezgeb_number`, `crimeWeight`, `modification_status`, `regionId`, `zoneId`, `weredaId`, `sub_weredaId`, `tabyaId`, `kebelleId`, `is_followed_up`, `followed_up_by_lawyer`, `date`, `remark`, `currentBrkiId`, `created_a_brki`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ገ/መ/ቁ/2011-0000001', 'Medium_And_Havy', 'Not_Modified', 2, NULL, NULL, NULL, NULL, NULL, 'Followed_Up', 'rywty rtetu trueu', '14/12/2011 10:17:51', NULL, '7', 'Breaking_Region', 34, 34, 'active', 'false', '2019-08-20 04:17:51', '2019-08-20 20:07:13'),
(2, 'ገ/መ/ቁ/2011-0000002', 'Red_Handed', 'Not_Modified', 2, NULL, NULL, NULL, NULL, NULL, 'false', NULL, '14/12/2011 20:56:32', NULL, '8', 'Breaking_Region', 34, 34, 'active', 'false', '2019-08-20 14:56:32', '2019-08-20 20:03:02'),
(3, 'ገ/መ/ቁ/2011-0000003', 'Light_Weight_Crimes', 'Not_Modified', 2, NULL, NULL, NULL, NULL, NULL, 'false', NULL, '14/12/2011 21:11:41', NULL, '3', 'Breaking_Region', 34, 34, 'active', 'false', '2019-08-20 15:11:41', '2019-08-20 19:41:35'),
(4, 'ገ/መ/ቁ/2011-0000004', 'Red_Handed', 'Not_Modified', 2, NULL, NULL, NULL, NULL, NULL, 'false', NULL, '15/12/2011 0:57:36', NULL, '5', 'Breaking_Region', 34, NULL, 'active', 'false', '2019-08-20 18:57:36', '2019-08-20 19:12:34'),
(5, 'ገ/መ/ቁ/2011-0000005', 'Light_Weight_Crimes', 'Not_Modified', 2, NULL, NULL, NULL, NULL, NULL, 'false', NULL, '15/12/2011 1:49:51', NULL, '5', 'Breaking_Region', 34, NULL, 'active', 'false', '2019-08-20 19:49:51', '2019-08-20 19:56:43'),
(6, 'ገ/መ/ቁ/2011-0000006', 'Red_Handed', 'Not_Modified', 2, 9, NULL, NULL, NULL, NULL, 'false', NULL, '15/12/2011 14:10:57', NULL, '3', 'Zone', 33, NULL, 'active', 'false', '2019-08-21 08:10:57', '2019-08-21 08:14:57'),
(7, 'ገ/መ/ቁ/2011-0000007', 'Red_Handed', 'Modified', 2, 9, NULL, NULL, NULL, NULL, 'false', NULL, '15/12/2011 14:24:38', NULL, '3', 'Zone', 33, NULL, 'active', 'false', '2019-08-21 08:24:38', '2019-08-21 12:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `ksi_mezgeb_brki`
--

CREATE TABLE `ksi_mezgeb_brki` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgebId` int(11) NOT NULL,
  `brkiId` int(11) NOT NULL,
  `CR_policeMezgebKutsri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akabiHgiMezgebKutsri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdiMezgebKutsri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryDate` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exitDate` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealedToBrkiId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isCompleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `quality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `quality_of_return` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `quality_of_42_a` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `quality_of_42_b` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `quality_of_defendant_not_found` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `quality_of_pick_over` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `isViewed` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isOpponentDecisionMaker_akabiHgi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `oppenent_akabiHgi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oppenent_akabiHgi_phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akabiHgi_decisionMaker` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decisionMaker_akabiHgi_phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyerPoliceDocumentReturnDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_decisionMaker` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_akabiHgi_decision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_betFrdi_decision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modification_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ksi_mezgeb_brki`
--

INSERT INTO `ksi_mezgeb_brki` (`id`, `ksi_mezgebId`, `brkiId`, `CR_policeMezgebKutsri`, `akabiHgiMezgebKutsri`, `betFrdiMezgebKutsri`, `entryDate`, `exitDate`, `appealedToBrkiId`, `isCompleted`, `quality`, `quality_of_return`, `quality_of_42_a`, `quality_of_42_b`, `quality_of_defendant_not_found`, `quality_of_pick_over`, `isViewed`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`, `isOpponentDecisionMaker_akabiHgi`, `oppenent_akabiHgi`, `oppenent_akabiHgi_phoneNumber`, `akabiHgi_decisionMaker`, `decisionMaker_akabiHgi_phoneNumber`, `lawyerPoliceDocumentReturnDate`, `betFrdi_decisionMaker`, `date_of_akabiHgi_decision`, `date_of_betFrdi_decision`, `modification_status`) VALUES
(1, 1, 4, '1', '1', '1', '14/12/2011 5:34:0', '15/12/2011 2:5:15', '3', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', NULL, 34, 34, 'active', 'false', '2019-08-20 04:17:51', '2019-08-20 20:05:15', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', '12344567891', NULL, NULL, '14/12/2011 1:12:0', '14/12/2011 1:40:0', NULL),
(2, 2, 4, '2', '2', '2', '14/12/2011 10:30:0', '15/12/2011 1:59:3', '3', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', NULL, 34, 34, 'active', 'false', '2019-08-20 14:56:32', '2019-08-20 19:59:03', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '14/12/2011 15:41:0', '14/12/2011 1:10:0', NULL),
(3, 3, 4, '2', '2', '2', '14/12/2011 10:30:0', '15/12/2011 1:41:35', '3', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', NULL, 34, 34, 'active', 'false', '2019-08-20 15:11:41', '2019-08-20 19:41:35', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '06/13/2011', NULL, '14/12/2011 1:2:0', '16/12/2011 1:4:0', NULL),
(4, 4, 4, '3', '3', '3', '15/12/2011 4:20:0', '15/12/2011 1:12:34', '3', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 18:57:36', '2019-08-20 19:12:34', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '15/12/2011 4:30:0', '15/12/2011 3:30:0', NULL),
(5, 4, 3, NULL, '345', '345', '15/12/2011 1:12:34', '15/12/2011 1:19:0', '3', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:12:34', '2019-08-20 19:19:00', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', '12344567891', NULL, NULL, '16/12/2011 1:1:0', '16/12/2011 1:8:0', NULL),
(6, 4, 5, NULL, '2', '3452', '15/12/2011 1:19:0', NULL, NULL, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:19:00', '2019-08-20 19:21:07', 'false', 'ርርር ርርር ርርር', NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '16/12/2011 5:7:0', '16/12/2011 5:45:0', NULL),
(7, 3, 3, NULL, '1', '2', '15/12/2011 1:41:35', NULL, NULL, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:33:02', '2019-08-20 19:45:31', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '15/12/2011 4:5:0', '16/12/2011 5:6:0', NULL),
(8, 5, 4, '2', '3', '4', '16/12/2011 4:5:0', '15/12/2011 1:52:23', '3', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:49:51', '2019-08-20 19:52:23', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '16/12/2011 2:4:0', '16/12/2011 4:6:0', NULL),
(9, 5, 3, NULL, '1', '2', '15/12/2011 1:52:23', '15/12/2011 1:56:43', '5', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:52:23', '2019-08-20 19:56:43', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '15/12/2011 4:6:0', '16/12/2011 3:6:0', NULL),
(10, 5, 5, NULL, '1', '2', '15/12/2011 1:56:43', NULL, NULL, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:56:43', '2019-08-20 19:57:58', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '16/12/2011 3:5:0', '16/12/2011 4:4:0', NULL),
(11, 2, 3, NULL, '1', '3', '15/12/2011 1:59:3', '15/12/2011 2:3:2', '8', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:59:03', '2019-08-20 20:03:02', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '16/12/2011 3:5:0', '16/12/2011 3:7:0', NULL),
(12, 2, 8, NULL, '2', '3', '15/12/2011 2:3:2', NULL, NULL, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:03:02', '2019-08-20 20:04:28', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '18/12/2011 2:4:0', '16/12/2011 4:6:0', NULL),
(13, 1, 3, NULL, '2', '4', '15/12/2011 2:5:15', '15/12/2011 2:7:13', '7', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:05:15', '2019-08-20 20:07:13', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '18/12/2011 3:5:0', '16/12/2011 5:7:0', NULL),
(14, 1, 7, NULL, '2', '4', '15/12/2011 2:7:13', NULL, NULL, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:07:13', '2019-08-20 20:08:39', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '17/12/2011 4:6:0', '23/12/2011 4:2:0', NULL),
(15, 6, 2, '1', '2', '3', '15/12/2011 1:1:0', '15/12/2011 14:14:57', '4', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:10:57', '2019-08-21 08:14:57', 'true', NULL, NULL, 'sdg sd gsdg', NULL, NULL, NULL, '15/12/2011 4:7:0', '16/12/2011 4:7:0', NULL),
(16, 6, 4, NULL, '1', '3', '15/12/2011 14:14:57', NULL, NULL, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-21 08:14:57', '2019-08-21 08:22:33', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '15/12/2011 3:6:0', '15/12/2011 4:6:0', NULL),
(17, 7, 2, '2', '2', '3', '15/12/2011 1:1:0', '15/12/2011 14:29:33', '4', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:24:38', '2019-08-21 08:29:33', 'true', NULL, NULL, 'dfdsfhwh', NULL, NULL, NULL, '16/12/2011 3:4:0', '15/12/2011 2:5:0', NULL),
(18, 7, 4, NULL, '2', '4', '15/12/2011 14:29:33', '15/12/2011 18:7:17', '3', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-21 08:28:18', '2019-08-21 12:07:17', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, NULL, NULL, '15/12/2011 3:7:0', '15/12/2011 3:59:0', NULL),
(19, 7, 3, NULL, '3', '4', '15/12/2011 18:7:17', NULL, NULL, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-21 12:07:17', '2019-08-21 12:08:54', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', '12344567891', NULL, NULL, '15/12/2011 0:1:0', '15/12/2011 23:28:0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ksi_mezgeb_brki_wsane_zhabu_dayanu`
--

CREATE TABLE `ksi_mezgeb_brki_wsane_zhabu_dayanu` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `fullName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ksi_mezgeb_brki_wsane_zhabu_dayanu`
--

INSERT INTO `ksi_mezgeb_brki_wsane_zhabu_dayanu` (`id`, `ksi_mezgeb_brkiId`, `fullName`, `phoneNumber`, `created_at`, `updated_at`) VALUES
(1, 1, 'Asgedom Dagnew', '0912345689', '2019-08-20 06:40:55', '2019-08-20 06:40:55'),
(2, 2, 'ሃይላይ ገብሩ', '09123456', '2019-08-20 16:44:17', '2019-08-20 16:44:17'),
(3, 3, 'Asgedom Dagnew', '0912345689', '2019-08-20 18:47:32', '2019-08-20 18:47:32'),
(4, 4, 'Asgedom Dagnew', '25476789', '2019-08-20 19:00:58', '2019-08-20 19:00:58'),
(5, 5, 'Asgedom Dagnew', '0912345689', '2019-08-20 19:18:23', '2019-08-20 19:18:23'),
(6, 6, 'Asgedom Dagnew', '0912345689', '2019-08-20 19:21:07', '2019-08-20 19:21:07'),
(7, 7, 'Asgedom Dagnew', '2547678990', '2019-08-20 19:45:31', '2019-08-20 19:45:31'),
(8, 8, 'Asgedom Dagnew', '2547678990', '2019-08-20 19:52:05', '2019-08-20 19:52:05'),
(9, 9, 'Asgedom Dagnew', '2547678990', '2019-08-20 19:55:57', '2019-08-20 19:55:57'),
(10, 10, 'Asgedom Dagnew', '0912345689', '2019-08-20 19:57:58', '2019-08-20 19:57:58'),
(11, 11, 'Asgedom Dagnew', '2547678990', '2019-08-20 20:01:08', '2019-08-20 20:01:08'),
(12, 12, 'Asgedom Dagnew', NULL, '2019-08-20 20:04:28', '2019-08-20 20:04:28'),
(13, 13, 'Asgedom Dagnew', NULL, '2019-08-20 20:06:38', '2019-08-20 20:06:38'),
(14, 14, 'Asgedom Dagnew', '2547678990', '2019-08-20 20:08:39', '2019-08-20 20:08:39'),
(15, 15, 'trufrt tyu tyu', '567568', '2019-08-21 08:14:19', '2019-08-21 08:14:19'),
(16, 16, 'Asgedom Dagnew', NULL, '2019-08-21 08:22:33', '2019-08-21 08:22:33'),
(17, 17, 'dsadga dg rg', '54356848', '2019-08-21 08:27:14', '2019-08-21 08:27:14'),
(18, 18, 'Asgedom Dagnew', NULL, '2019-08-21 12:05:53', '2019-08-21 12:05:53'),
(19, 19, 'Asgedom Dagnew', NULL, '2019-08-21 12:08:54', '2019-08-21 12:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `kttln_dgafn_abyate_eyo`
--

CREATE TABLE `kttln_dgafn_abyate_eyo` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `created_a_brki` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dgaf_given_organization_typeId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_typeId` int(11) NOT NULL,
  `glgalot_request_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_given_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality_glgalotId` int(11) NOT NULL,
  `not_quality_glgalot_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `effective_glgalotId` int(11) NOT NULL,
  `not_effective_glgalot_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satisfaction_statusId` int(11) NOT NULL,
  `not_satisfied_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_of_glgalot_request_and_given` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_given_by_lawyer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_given_by_lawyer_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_approved_by_leader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glgalot_approved_by_leader_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kttln_dgafn_abyate_eyo`
--

INSERT INTO `kttln_dgafn_abyate_eyo` (`id`, `regionId`, `zoneId`, `weredaId`, `created_a_brki`, `entryDate`, `brkiId`, `dgaf_given_organization_typeId`, `name`, `glgalot_typeId`, `glgalot_request_date`, `glgalot_given_date`, `quality_glgalotId`, `not_quality_glgalot_reason`, `effective_glgalotId`, `not_effective_glgalot_reason`, `satisfaction_statusId`, `not_satisfied_reason`, `detail_of_glgalot_request_and_given`, `glgalot_given_by_lawyer`, `glgalot_given_by_lawyer_date`, `glgalot_approved_by_leader`, `glgalot_approved_by_leader_date`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 3, 'Region', '2/12/2011', '3', '1', 'admin', 3, '02/12/2011', '02/12/2011', 1, NULL, 1, NULL, 1, NULL, 'dfhfhaj', 'dgdfg', '02/12/2011', 'zdgdfhahf', '02/12/2011', 14, NULL, 'active', 'false', '2019-08-08 12:07:27', '2019-08-08 12:07:27'),
(4, 2, 3, 4, 'Wereda', '2/12/2011', '1', '2', 'erqrey', 1, '02/12/2011', '02/12/2011', 1, NULL, 1, NULL, 1, NULL, 'hwthqthwthwrth', 'sdfsfgjj', '02/12/2011', 'erhwthth', '02/12/2011', 30, NULL, 'active', 'false', '2019-08-08 12:11:59', '2019-08-08 12:11:59'),
(5, 2, 3, 4, 'Breaking_Region', '7/12/2011', '4', '1', 'fdbafn', 2, '08/12/2011', '07/12/2011', 2, 'Full_Information_Not_Found', 2, 'Is_Unable_To_Be_Executed', 2, 'Remembering', 'fgjdfgjdgj', 'aa', '07/12/2011', 'bb', '09/12/2011', 34, NULL, 'active', 'false', '2019-08-13 16:58:18', '2019-08-13 17:06:26'),
(6, 2, 3, 3, 'Breaking_Region', '7/12/2011', '4', '4', 'checker1', 2, '07/12/2011', '07/12/2011', 2, 'New_Situation_Happened', 2, 'Not_Done_Right', 2, 'Payment_Of_Allowance', 'gfndgmdmdm', 'ww', '07/12/2011', 'yy', '09/12/2011', 34, NULL, 'active', 'false', '2019-08-13 17:07:47', '2019-08-13 17:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `kunetat_hadar`
--

CREATE TABLE `kunetat_hadar` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kunetat_hadar`
--

INSERT INTO `kunetat_hadar` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ዘለዎ', NULL, 1, 'active', 'false', '2018-11-27 05:31:46', '2019-04-27 17:39:12'),
(2, 'ዘይብሉ', NULL, 1, 'active', 'false', '2019-04-27 17:39:23', '2019-04-27 17:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `kunetat_mezagbti`
--

CREATE TABLE `kunetat_mezagbti` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kunetat_mezagbti`
--

INSERT INTO `kunetat_mezagbti` (`id`, `name`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ኩነታት መዝገብ 3', NULL, 1, 1, 'active', 'false', '2019-04-20 10:25:45', '2019-04-20 10:31:28'),
(2, 'ኩነታት መዝገብ 2', NULL, 1, 1, 'active', 'false', '2019-04-20 10:26:28', '2019-04-20 10:31:16'),
(3, 'ኩነታት መዝገብ 1', NULL, 1, 1, 'active', 'false', '2019-04-20 10:26:42', '2019-04-20 10:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `kunetat_tekesesti`
--

CREATE TABLE `kunetat_tekesesti` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kunetat_tekesesti`
--

INSERT INTO `kunetat_tekesesti` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'In_Prison_By_Appointment', 'ኣብ እሱር ብግዘ ቆፀሮ', '2019-08-08 17:32:17', '2019-08-08 17:32:17'),
(2, 'Outside_By_Warranty', 'ኣብ ደገ ብውሕስና', '2019-08-08 17:32:17', '2019-08-08 17:32:17'),
(3, 'Not_Reached', 'ዘይተትሓዘ', '2019-08-08 17:32:17', '2019-08-08 17:32:17'),
(4, 'Other', 'ካልእ', '2019-08-08 17:32:17', '2019-08-08 17:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `kunetat_tekesesti_human_right`
--

CREATE TABLE `kunetat_tekesesti_human_right` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kunetat_tekesesti_human_right`
--

INSERT INTO `kunetat_tekesesti_human_right` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(2, 'In_Court_Process', 'ኣብ ከይዲ ፍርዲ(ክስን ክርክርን) ዘሎ', '2019-08-08 07:02:54', '2019-08-08 07:02:54'),
(1, 'In_Investigation', 'ኣብ ምፅራይ ዘሎ', '2019-08-08 07:02:54', '2019-08-08 07:02:54'),
(4, 'Unreached', 'ዘይተትሓዘ', '2019-08-08 07:02:54', '2019-08-08 07:02:54'),
(5, 'Other', 'ካልእ', '2019-08-08 07:02:54', '2019-08-08 07:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `language_strings`
--

CREATE TABLE `language_strings` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eng` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amh` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tig` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_strings`
--

INSERT INTO `language_strings` (`id`, `keyWord`, `eng`, `amh`, `tig`, `created_at`, `updated_at`) VALUES
(1842, 'Winning_Status_Of_Breaking_Civil_Case_Documents_Appealed_By_Lawyer', 'Winning Status Of Breaking Civil Case Documents Appealed By Lawyer', 'በኣቃቢ ህግ የቀረበ ፍታብሄር ሰበር ይግባኝ ኣሸናፊነት ሁኔታ', 'ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ሰበር  ፍታብሔር መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1841, 'Winning_Status_Of_Civil_Case_Documents_Appealed_By_Individual', 'Winning Status Of Civil Case Documents Appealed By Individual', 'በግል ተከሳሽ የቀረበ የፍታብሄር ይግባኝ ኣሸናፊነት ሁኔታ', 'ብውልቀ ተኸሳሲ ዝቐረበ ምርታዕ ይግባኣኒ ጉዳያት ፍትሃብሄር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1840, 'Winning_Status_Of_Civil_Case_Documents_Appealed_By_Lawyer', 'Winning Status Of Civil Case Documents Appealed By Lawyer', 'በኣቃቢ ህግ የቀረበ የፍታብሄር ይግባኝ ኣሸናፊነት ሁኔታ', 'ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ይግባኣኒ ጉዳያት ፍትሃብሄር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1839, 'Court_Process_Of_Direct_Civil_Case_Documents', 'Court Process Of Direct Civil Case Documents', 'ቀጥተኛ የፍታብሄር መዛግብት የፍርድ ሂደት', 'ከይዲ ፍርዲ ቀጥታ ጉዳያት ፍትሃብሄር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1838, 'Individual_Winning_Status_Of_Civil_Cases', 'Individual Winning Status Of Civil Cases', 'በግል ከሳሽ የቀረበ ቀጥተኛ መዝገብ ሁኔታ', 'ብውልቀ ከሳሲ ዝቐረበ ምርታዕ ቀጥታ ፍታብሔር መዝገብ', '2019-06-27 19:32:23', '2019-08-18 18:31:05'),
(1835, 'Support_And_Follow_Up_Count', 'Support And Follow Up Count', 'የካሄደው ደገፍና ክትትል ብዛት', 'በዝሒ ዝተካየደ ደገፍን ክትትልን', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1836, 'Organizations_Count', 'Organizations Count', 'የተቋማት ብዛት', 'በዝሒ ኣብያተ ዕዮ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1837, 'Lawyer_Winning_Status_Of_Civil_Cases', 'Lawyer Winning Status Of Civil Cases', 'በኣቃቢ ህግ የቀረበ የቀጥተኛ ጉዳዮች ኣሸናፊነት ሁኔታ', 'ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ቀጥታ ጉዳያት ፍትሃብሄር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1834, 'Assesed_Organizations_Count', 'Assesed Organizations Count', 'ዳሰሳ የተደረገላቸው ተቋማት ብዛት', 'በዝሒ ዳህሳስ ዝተገበረሎም ኣብያተ ዕዮ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1833, 'Governmental', 'Governmental', 'የመንግስት ተቋማት', 'መንግስታዊ ትካላት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1829, 'Execution_Count', 'Execution Count', 'የኣፈፃፀም ብዛት', 'በዝሒ ኣፈፃፀም', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1832, 'Developmental', 'Developmental', 'የልማት ተቋማት', 'ትካላት ልምዓት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1830, 'Execution', 'Execution', 'ኣፈፃፀም', 'ኣፈፃፅማ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1831, 'Annual_Plan', 'Annual Plan', 'የኣመት እቅድ', 'ዓመታዊ ትልሚ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1825, 'Amount_In_Birr', 'Amount In Birr', 'የገንዘብ መጠን በብር', 'መጠን ገንዘብ ብብር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1826, 'Natural_Human', 'Natural Human', 'የተፈጥሮ ሰው', 'ተፈጥራዊ ሰብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1827, 'Institution', 'Institution', 'ተቋም', 'ትካል', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1828, 'Research', 'Research', 'ጥናት የተካሄደላቸው ተቋማት ብዛት', 'በዝሒ ዳህሳስ/ፅንዓት ዝተካየደለን ኣብያተ ዕዮ ክልል/ዞባ/ወረዳ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1824, 'Area_In_M2', 'Area In M2', 'ስፋት በካ/ሜ', 'መጠን ስፍሓት መሬትብካ/ሜ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1822, 'Free_Law_Support_For_Organizations', 'Free Law Support For Organizations', 'ለመስሪኣ ቤቶች የህግ ድጋፍ መስጠት', 'ንኣብያተ ዕዮ ድጋፍ ሕጊ ምሃብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1823, 'Civil_Case_Lawyer_Decision_Time_Efficiency', 'Civil Case Lawyer Decision Time Efficiency', 'ኣቃቢ ህግ የፍታብሄር መዝገብ ውሳኔ ቅልጥፍና', 'ዓቃቢ ሕጊ ሰለጤን ውሳነ ፍታብሔር መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1821, 'Planned_Needy_Parties_Count', 'Planned Needy Parties Count', 'ልዩ ድጋፍ ሊደረግላቸው የታቀዱ የህብረተሰብ ክፍሎች ብዛት', 'ትልሚ በዝሒ ፍሉይ ድጋፍ ዘድልዮም ኣካላት ክልል/ዞባ/ወረዳ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1819, 'Giving_Priority', 'Giving Priority', 'ቅድምያ መስጠት', 'ቀዳምነት ምሃብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1820, 'Supported_Needy_Parties_Count', 'Supported Needy Parties Count', 'ልዩ ድጋፍ የተደረገላቸው የህብረተሰብ ክፍሎች ብዛት', 'በዝሒ ፍሉይ ድጋፍ ዝተገበረሎም ኣካላት ሕ/ሰብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1818, 'Type_Of_Special_Support', 'Type Of Special Support', 'የልዩ ድጋፍ ኣይነት', 'ዓይነት ፍሉይ ድጋፍ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1817, 'Efficiency', 'Efficiency', 'ቅልጥፍና', 'ሰለጤን', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1816, 'Quality/Effectiveness_Of_Support', 'Quality/Effectiveness Of Support', 'የድጋፍ ጥራት/ውጤታማነት', 'ፅሬት/ውፅኢታውነት ደገፍ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1815, 'Disabled', 'Disabled', 'የኣካል ጉዳተኞች', 'ኣካል ጉድኣት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1814, 'Elders', 'Elders', 'ሽማግሌዎች', 'ኣረጋውያን', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1812, 'Advice', 'Advice', 'ምክር', 'ምኽሪ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1813, 'Others', 'Others', 'ሌሎች', 'ካልኦት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1810, 'Arguement', 'Arguement', 'ክርክር', 'ክርክር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1811, 'Accuse_Response', 'Accuse Response', 'ክስ/መልስ', 'ክሲ/መልሲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1809, 'Free_Law_Support_For_Needy', 'Free Law Support For Needy', 'ነፃ የህግ ድጋፍ ኣቅም ለሌላቸው', 'ነፃ ድጋፍ ሕጊ ዓቕሚ ንዘይብሎም', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1808, 'Defendants_Human_Rights_Protection', 'Defendants Human Rights Protection', 'የተከሳሾች ሰብኣዊ መብት መጠበቅ', 'ሰብኣዊ መሰል ተጠርጠርቲ/ተኸሰስቲ/ተሃነፅቲ ምኽባር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1807, 'Leading_Investigation_Of_Heavy_Weight_Crimes', 'Leading Investigation Of Heavy Weight Crimes', 'በፖሊስ የካሄደው የከባድ ወንጀሎች ማጣራት በመምራት ህጋዊነቱ ማረጋገጥ', 'ብፖሊስ ዝካየድ ምፅራይ ከበድቲ ገበን ብምምራሕ/ብምክትታል ሕጋዉነቱ ምርግጋፅ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1806, 'Legality_Of_Investigation', 'Legality Of Investigation', 'ወንጀል የማጣራት ህጋዊነት', 'ሕጋውነት ምፅራይ ገበን', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1805, 'Violated_Law_Type', 'Violated Law Type', 'የህግ ጥሰት ኣይነት', 'ዓይነት ጥሕሰት ሕጊ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1804, 'Total_Document_Count', 'Total Document Count', 'ጠቅላላ የገባ መዝገብ', 'ጠቅላላ ዝኣተወ መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1803, 'Heavy_Weight_Doucuments', 'Heavy Weight Doucuments', 'ከባድ መዝገብ', 'ከቢድ መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1802, 'Followed_For_Legality', 'Followed For Legality', 'በህጋዊነቱ ክትትል የተደረገለት', 'ኣብ ሕጋውነቱ ክትትል ዝተገበረሉ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1801, 'Investigated_Legally', 'Investigated Legally', 'ክትትል ከተደረገላቸው ህጋዊነታቸው ጠብቀው የተጣሩ', 'ክትትል ካብ ዝተገበረሉ በዝሒ ሕጋውነቱ ሓልዩ ዝተፃረየ መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1800, 'Not_Investigated_Legally', 'Not Investigated Legally', 'ክትትል ከተደረገላቸው ህጋዊነታቸው ጠብቀው ያልተጣሩ', 'ክትትል ካብ ዝተገበረሉ በዝሒ ሕጋውነቱ ሓልዩ ዘይተፃረየ መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1798, 'Related_To_Information_Gathering', 'Related To Information Gathering', 'ከመረጃ ኣሰባሰብ የተያያዘ', 'ምስ ኣተኣካክባ መረዳእታ ዝተትሓሓዘ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1799, 'Related_To_Human_Right_Of_Defendant', 'Related To Human Right Of Defendant', 'ከሰብኣዊ መሰል ጥሰት የተያያዘ', 'ምስ ሰብኣዊ መሰል ተጠርጣሪ ዝተትሓሓዘ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1795, 'Defendants_Count', 'Defendants Count', 'የተያዙ ተከሳሾች ብዛት', 'በዝሒ ዝተተሓዙ', '2019-06-27 19:32:23', '2019-07-25 04:10:29'),
(1796, 'Prisons_Count', 'Prisons Count', 'የማረምያ ቤት ብዛት', 'በዝሒ መዕረፊ/መህነፂ ቦታ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1797, 'In_Follow_Up', 'In Follow Up', 'በክትትል/ደጋፍ', 'ብክትትል/ድጋፍ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1794, 'Defendant_Complains_Count', 'Defendant Complains Count', 'በተያዙ ተከሳሾች የቀረቡ ቅሬታዎች ብዛት', 'በዝሒ ብዝተትሓዙ ሰባት ዝቐረቡ ጉዳያት/ጥርዓናት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1793, 'Solved_Complain', 'Solved Complain', 'የተፈቱ ኣቤቱታዎች', 'ዝተፈትሑ ጥርዓናት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1792, 'Solved_On_Time', 'Solved On Time', 'በጊዜ የተፈቱ', 'ኣብ ግዚኡ ዝተፈትሐ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1791, 'Supervised', 'Supervised', 'የተፈተሹ', 'ዝተፈተሹ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1788, 'Zone_1_In_3_Month', 'Zone 1 In 3 Months', 'ዞን (3 ወር ኣንዴ)', 'ዞባ (ኣብ 3 ወርሒ 1 ግዘ)', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1789, 'Wereda_2_In_Week', 'Wereda 2 In Weeks', 'ወረዳ በሁለት ሳምንት ኣንዴ', 'ወረዳ (ኣብሰሙን 2 ግዘ)', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1790, 'Supervised_Defendants_Count', 'Supervised Defendants Count', 'የተፈተሹ ተከሳሾች ብዛት', 'በዝሒ ዝተፈተሹ ተጠርጠርቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1787, 'Shortage_Of_Food_And_Water', 'Shortage Of Food And Water', 'የምግብና ውሃ እጥረት', 'ሕፅረት ቀረብ ምግብን ማይን', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1786, 'Width_And_Quality', 'Width And Quality', 'የቤት ጥራትና ስፋት', 'ፅበትን ፅሬትን ቦታ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1785, 'Investigation_Delay', 'Investigation Delay', 'የማጣራት መዘግየት', 'ምጉታት ምፅራይ/ክሲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1784, 'Court_Delay', 'Court Delay', 'ፍርድቤት ያለመቅረብ', 'ናብቤት ፍርዲ ዘይምቕራብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1780, 'True_Count', 'True Count', 'እውነት የሆነ', 'ሓቂዝኮነ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1781, 'Shock', 'Shock', 'መምታት', 'መውቃዕቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1782, 'Challenge', 'Challenge', 'ጫና መፍጠር', 'ተፅዕኖ ምፍጣር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1783, 'Familly_Relation_Denied', 'Familly Relation Denied', 'የቤተሰብ ግኑኝነት መከልከል', 'ምስ ቤተሰብ ርክብ ምክልካል', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1777, 'Deny_All', 'Deny All', 'ሁሉንም ከልክል', 'ኩሎም ይከልከሉ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1778, 'Crud_Resources', 'Crud Resources', 'መረጃዎች', 'መረዳእታታት/ንብረታት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1779, 'Action_Resources', 'Action Resources', 'ክንውኖች/ስራዎች', 'ተግባራት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1776, 'Allow_All', 'Allow All', 'ሁሉንም ይፈቀዱ', 'ኩሎም ፍቐድ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1774, 'P_O_B', 'Post Office Box', 'የፖስታ ሳንዱቕ ቀጥር', 'ፖስታ ሳንዱቕ ቁፅሪ', '2019-06-27 19:32:23', '2019-08-05 08:34:04'),
(1775, 'Language_Strings_File', 'Language Strings File', 'የቋንቋ ሃረጋት የያዘው ፋይል', 'ሓረጋት ቋንቋ ዝሓዘ መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1772, 'Civil_Cases', 'Civil Cases', 'የፍትሓብሄ ጉዳዮች', 'ዋኒናት ፍታብሔር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1773, 'Crime_Cases', 'Crime Cases', 'የወንጀል ጉዳዮች', 'ዋኒናት ገበን', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1770, 'Search', 'Search', 'ፈልግ', 'ኣልሽ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1771, 'Search_by_Document_Number', 'Search by Document Number', 'በመዝገብ ቁጥር ፈልግ', 'ብመዝገብ ቁፅሪ አልሽ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1769, 'Legality_Of_Other_Types_Of_Investigation', 'Legality Of Other Types Of Investigation', 'ሌላ የማጣራት ስራዎች ሕጋውነት', 'ሕጋውነት ካልእ ስራሕቲ ምፅራይ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1768, 'Legality_Of_Information_Gathering', 'Legality Of Information Gathering', 'የመረጃ ኣሰባሰብ ሕጋውነት', 'ሕጋውነት ምእካብ መረዳእታ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1767, 'Legality_Of_Human_Right_Protection', 'Legality Of Human Right Protection', 'የተከሳሽ ሰብኣዊ መብት ኣያያዝና ሕጋውነት', 'ሕጋውነት ኣታሓሕዛን ሰብኣዊ መሰላትን ተከሰስቲ ገበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1766, 'Human_Right_Protection', 'Human Right Protection', 'የሰብኣዊ መብት ጥበቃ', 'ምሕላው ሰብኣዊ መሰል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1765, 'Date_Of_Lawyer', 'Date Of Lawyer', 'የዓቃቤ ሕግ ቀን', 'ናይ ዓቃቢ ሕጊ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1762, 'Comment', 'Comment', 'መግለጫ', 'ርኢቶ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1763, 'Name_Of_Lawyer', 'Name Of Lawyer', 'ክትትል ያደረገ ዓቃቤ ሕግ', 'ክትትል ዝገበረ ዓቃቢ ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1764, 'Date_Of_Follow_Up', 'Date Of Follow Up', 'የክትትል ቀን', 'ናይ ክትትል ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1758, 'Witness_Avaliability', 'Witness Avaliability', 'የምስክር መቅረብ', 'ምስክር ምቅራብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1759, 'Witness_Sucurity_Status', 'Witness Sucurity Status', 'የምስክር ድህንነት ሁኔታ', 'ናይ ምስክር ድሕንነት ኩነታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1756, 'Remember_Status', 'Remember Status', 'የምስክር ማስታወስ ሁኔታ', 'ኩነታት ምስትዋስ/ምዝክካር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1761, 'Leading_Investigation_Of_Heavy_Crimes', 'Leading Investigation Of Heavy Crimes', 'የከባድ ወንጀል ማጣራት መምራት', 'ምምራሕ ምፅራይ ከበድቲ ገበናት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1760, 'Defendant_Status', 'Defendant Status', 'የተከሳሽ ሁኔታ', 'ኩነታት ተከሳሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1757, 'Witness Sucurity Status', 'Witness Sucurity Status', 'የምስክር ድህንነት ሁኔታ', 'ናይ ምስክር ድሕንነት ኩነታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1750, 'Organization_Follow_Up_And_Support', 'Organization Follow Up And Support', 'የተቋማት ክትትልና ድጋፍ', 'ክትትልን ድጋፍን ኣብያተ ዕዮ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1751, 'Glgalot_Netsadgaf_Hgi', 'Glgalot Netsadgaf Hgi', 'የሕግ ነፃ ኣገልግሎት', 'ግልጋሎት ነፃ ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1752, 'Free_Law_Service', 'Free Law Service', 'የሕግ ነፃ ኣገልግሎት', 'ግልጋሎት ነፃ ሕጊ', '2019-06-27 19:31:34', '2019-07-18 18:41:12'),
(1753, 'Witness_Follow_Up', 'Witness Follow Up', 'ክትትል ምስክር', 'ክትትል ምስክር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1754, 'Witness_Safety_Status', 'Witness Safety Status', 'የምስክር ደህንነት ሁኔታ', 'ኩነታት ድሕንነት ምስክር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1755, 'Witness Avaliability', 'Witness Avaliability', 'ምስክር መቅረብ', 'ምስክር ምቅራብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1749, 'Satisfaction_Status', 'Satisfaction Status', 'የእርካታ ሁኔታ', 'ኩነታት ዕግበት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1748, 'Effectiveness', 'Effectiveness', 'ውጤታማነት', 'ውፅኢታዊነት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1747, 'Organization_Name', 'Organization Name', 'የተቋሙ ስም', 'ሽም ትካል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1745, 'Woreda', 'Wereda', 'ወረዳ', 'ወረዳ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1746, 'Sub_Woreda', 'Sub Wereda', 'ንኡስ ወረዳ', 'ንኡስ ወረዳ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1741, 'Language', 'Language', 'ቋንቋ', 'ቛንቋ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1742, 'System_Configuration', 'System Configuration', 'ሲስተም ማስተካክያዎች', 'ሲስተም መዐረይታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1744, 'Human_Rights', 'Human Rights', 'ሰብኣዊ መብት', 'ሰብኣዊ መሰል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1743, 'Organizational_Structure', 'Organizational Structure', 'ተቋማዊ ኣወቃቀር', 'ትካላዊ መዋቅር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1735, 'Old', 'Old', 'የነበረ', 'ዝነበረ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1736, 'New', 'New', 'ኣዲስ', 'ሓድሽ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1737, 'Accusal_Documents', 'Accusal Documents', 'የወንጀል መዝገብ ብዛት', 'በዝሒ ገበን መዝገብ', '2019-06-27 19:31:34', '2019-08-05 17:34:42'),
(1738, 'Services', 'Services', 'ኣገልግሎት', 'ግልጋሎት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1739, 'Reports', 'Reports', 'ሪፖርት', 'ፀብፃብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1740, 'Settings', 'Settings', 'ማስተካከያ', 'መስተኻከሊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1734, 'Update_System_Settings', 'Update System Settings', 'የመተግበሪያ መቼት ኣስተካክል', 'ቁልፊታት መተግበሪ ኣስተኻኽል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1733, 'Report_Interval_In_Months', 'Report Interval In Months', 'በሪፖርት የሚካተቱ ወራት ብዛት', 'ፀብፃብ ዝወፀሎም ኣዋርሕ በዝሒ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1732, 'Report_Generation_Date', 'Report Generation Date', 'ሪፖርት የሚዘጋጅበት ቀን', 'ፀብፃብ ዝወፀሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1729, 'Allow_Destroy', 'Allow Delete', 'ማጥፋት', 'ምስራዝ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1730, 'Allow_Show', 'Allow Show', 'ጥልቅ መረጃ ማየት', 'ዕሙቕ መረዳእታ ምርኣይ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1731, 'Pagination_Size', 'Pagination Size', 'የመስመር ብዛት በኣንድ ገጽ', 'በዝሒ መስመር ኣብ ሓደ ገፅ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1727, 'Allow_Store', 'Allow Create', 'ኣዲስ መመዝገብ', 'ሓድሽ ምምዝጋብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1728, 'Allow_Update', 'Allow Update', 'ማስተካከል', 'ምስትኽኻል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1726, 'Allow_Index', 'Index', 'ዝርዝር/ማውጫ ማየት', 'ዝርዝር/ጠቋሚ ምርኣይ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1724, 'Resource_Name', 'Resource Name', 'መተግበሪያ መረጃ ኣይነት', 'ዓይነት መረዳእታ መተግበሪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1725, 'Uncheck_All', 'Uncheck All', 'ሁሉንም ክልክል ይሁኑ', 'ኩሎም ይከልከሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1722, 'Assign_Role_Permissions', 'Assign Role Permissions', 'የሃላፊነት ደረጃ ፈቃድ መስጫ', 'ፍቓዳት ደረጃ ሓላፍነት መውሃቢ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1723, 'Permissions_Will_Be_Saved_Automatically', 'Permissions Will Be Saved Automatically', 'ፈቃድ በቀጥታ ይቀመጣሉ', 'ፍቓዳት ብቀጥታ ክምዝገቡ እዮም', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1719, 'Disability_Type', 'Disability Type', 'የኣካል ጉዳት ኣይነት', 'ዓይነት ጉድኣት ኣካል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1720, 'Disability_Types', 'Disability Types', 'የኣካል ጉዳት ኣይነቶች', 'ዓይነታት ጉድኣት ኣካል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1721, 'Health_Status', 'Health Status', 'የጤና ሁኔታ', 'ኩነታት ጥዕና', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1718, 'Create_New_Disability_Type', 'Create New Disability Type', 'ኣዲስ የኣካል ጉዳት ኣይነት ይመዝግቡ', 'ሓድሽ ዓይነት ጉድኣት ኣካል መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1717, 'Death', 'Death', 'ሞት', 'ሞት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1714, 'Activation_Date', 'Activation Date', 'የተንቀሳቀሰበት ቀን', 'ዝተንቀሳቀሰሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1715, 'Deactivation_Decision', 'Deactivation Decision', 'ያቋረጠው ውሳኔ', 'ዘቋረፆ ውሳነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1716, 'Last_Appointment', 'Last Appointment', 'የመጨረሻ ቆጠሮ', 'ናይ መወዳእታ ቆፅሮ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1712, 'History', 'History', 'ሂደት', 'ከይዲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1713, 'Deactivation_Date', 'Deactivation Date', 'የተቋረጠበት ቀን', 'ዝተቋረፀሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1711, 'Logged_User', 'Logged User', 'ተጠቃሚ', 'ተጠቃሚ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1709, 'Execution_Lawyer_Decision', 'Execution Lawyer Decision', 'ኣፈፃፀም ክስ የኣቃቢህግ ውሳኔ', 'ውሳነ ዓቃቢሕጊ ኣፈፃፅማ ክሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1710, 'Unable_To_Execute_Reason', 'Unable To Execute Reason', 'ማስፈፀሚያ ያለመኖር ምክንያት', 'ምኽንያት መፈፅሚ ዘይምህላው', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1708, 'Execution_Arguement_Type', 'Execution Arguement Type', 'የምጉት ኣይነት', 'ዓይነት ምጉት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1706, 'Create_New_Crime_Type', 'Create New Crime Type', 'ኣዲስ የወንጀል ኣይነት መዝግብ', 'ሓድሽ ዓይነት ገበን መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1707, 'Court_Decision_Date', 'Court Decision Date', 'ፍርድቤት የወሰነበት ቀን', 'ቤትፍርዲ ዝወሰነሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1705, 'Edit_Crime_Type', 'Edit Crime Type', 'የወንጀል ኣይነት ኣስተካክል', 'ዓይነት ገበን ኣስተኻክል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1703, 'Remark', 'Remark', 'ማብራሪያ', 'መብርሂ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1704, 'Name', 'Name', 'ስም', 'ሽም', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1702, 'Category', 'Category', 'ክፍል', 'ምድብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1699, 'Update', 'Update', 'መዝገብ ኣሳድስ', 'መዝገብ ኣሐድስ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1700, 'Confirm_Delete', 'Confirm Delete', 'ለማጥፋት ያረጋግጡ', 'ንክስረዝ የረጋግፁ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1701, 'Save', 'Save', 'በመዝገብ ኣስቀምጥ', 'ኣብ መዝገብ ኣቐምጥ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1697, 'Edit', 'Edit', 'ኣስተካክል', 'ኣስተኻኻል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1698, 'Delete', 'Delete', 'ኣጥፋ', 'ሰርዝ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1693, 'Crime_Types', 'Crime Types', 'የወንጀል ኣይነቶች', 'ዓይነታት ገበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1694, 'Duplicate_Entry', 'Duplicate Entry', 'ተመዝግቦ ነበር', 'ተመዝጊቡ ፀኒሑ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1695, 'Add', 'Add', 'ጨምር', 'ወስኽ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1696, 'Create', 'Create', 'ፍጠር', 'ፍጠር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1690, 'List_Not_Found', 'List Not Found', 'የተመዘገቡ ዝርዝሮች የሉም', 'ዝተመዝገቡ ዝርዝራት የለውን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1691, 'View', 'View', 'በዝርዝር ተመልከት', 'ብዝርዝር ተመልከት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1692, 'Actions', 'Actions', 'የርምጃ ኣዝራር', 'ተግባራት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1688, 'Tigrigna', 'Tigrigna', 'ትግርኛ', 'ትግርኛ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1689, 'Select_Language', 'Select Language', 'ቋንቋ ይምረጡ', 'ቋንቋ ምረፅ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1685, 'English', 'English', 'እንግሊዘኛ', 'እንግሊዘኛ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1686, 'Amharic', 'Amharic', 'ኣማርኛ', 'ኣምሓርኛ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1687, 'Create_New_String', 'Create New String', 'ኣዲስ ሀረግ መዝግብ', 'ሓድሽ ሓረግ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1684, 'Keyword_Already_Taken', 'Keyword Already Taken', 'ሀረግ ተመዝግቦ ነበር', 'ሓረግ ተመዝጊቡ ፀኒሑ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1683, 'Operation_Successful', 'Operation Successful', 'ስራው በትክክል ተሰርተዋል', 'ስራሕ ብትክክል ተፈፂሙ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1680, 'Dashboard', 'Dashboard', 'መግቢያ', 'መእተዊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1681, 'Control_Panel', 'Control Panel', 'መቆጣጠሪያ ፓነል', 'መቆፃፅሪ ፓናል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1682, 'Operation_Failed', 'Operation Failed', 'ስራው በትክክል ኣልተሰራም', 'ስራሕ ብትክክል ኣይተፈፀመን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1674, 'List', 'List', 'ዝርዝር', 'ዝርዝር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1675, 'Crime_Type', 'Crime Type', 'የወንጀል ኣይነት', 'ዓይነት ገበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1676, 'List_Of_Crime_Types', 'List Of Crime Types', 'የወንጀል ኣይነቶች ዝርዝር', 'ዝርዝር ዓይነታት ገበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1677, 'Edit_Language_Strings', 'Edit Language Strings', 'የቋንቋ ሃረጋት ኣስተካክል', 'ሓረጋት ቋንቋ ኣስተኻኽል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1678, 'Back', 'Back', 'ተመለስ', 'ተመለስ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1679, 'Page_Not_Found', 'Page Not Found', 'የመርጃ ገፅ ኣልተገኘም', 'ገፅ መረዳእታ ኣይተረኸበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1672, 'Created_By', 'Created By', 'የመዘገበው ተጠቃሚ', 'ዝመዝገቦ ተጠቃሚ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1673, 'Detail', 'Detail', 'ዝርዝር መረጃ', 'ዝርዝር መረዳእታ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1671, 'Created_At', 'Created At', 'የተመዘገበበት ቀን', 'ዝተመዝገበሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1670, 'Updated_By', 'Updated By', 'ያስተካከለው ተጠቃሚ', 'ዘስተኻኸሎ ተጠቃሚ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1668, 'Registration', 'Registration', 'መመዝገቢያ', 'መመዝገቢ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1669, 'Updated_At', 'Updated At', 'የታደሰበት ቀን', 'ዝተሓደሰሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1667, 'App_Name', 'Tigray Region Justice Office', 'የትግራይ ክልል ፍትህ ቢሮ', 'ፍትሒ ቢሮ ክልል ትግራይ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1666, 'No', 'No', 'ኣይ! ተመለስ', 'ኣይ! ተመለስ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1665, 'Yes', 'Yes', 'ኣዎን', 'እወ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1664, 'System_Settings', 'System Settings', 'የመተግበሪያ መቼት', 'ቁልፍታት መተግበሪያ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1663, 'Create_New_Accusal_Category', 'Create New Accusal Category', 'ኣዲስ የክስ ኣይነት መዝግብ', 'ሓድሽ ዓይነት ክሲ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1657, 'Log_Out', 'Log Out', 'ከመተግበርያ ውጣ', 'ካብ መተግበሪ ውፃእ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1658, 'Profile', 'Profile', 'የተጠቃሚ ማንነት', 'መንነት ተጠቃሚ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1659, 'User_Interface', 'User Interface', 'የመተግበሪያ ኢንተርፌስ', 'ኢንተርፌስ መተግበሪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1660, 'Permissions', 'Permissions', 'ፈቃድ ስጥ/ከልክል', 'ፍቓዳት መውሃቢ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1661, 'Admin', 'Admin', 'ከፍተኛ ኣስተዳደር', 'ዋና ኣማሓዳሪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1662, 'Accusal_Categories', 'Accusal Categories', 'የክስ ኣይነቶች', 'ዓይነታት ክሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1655, 'Log_In', 'Log In', 'ይግቡ', 'ይእተው', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1656, 'Profile_Settings', 'Profile Settings', 'የማንነት ተጠቃሚ መቼት', 'ቁልፊ መንነት ተጠቃሚ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1654, 'Intro', 'Welcome', 'እንኳን ደህና መጡ', 'እንቋዕ ብደሓን መፃእኹም', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1653, 'Forgot_Password', 'Forgot Password?', 'የይለፍ ቃል ጠፋቦት?', 'መሕለፊ ቃል ተረሲዑ ድዩ?', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1652, 'User_Name', 'User Name', 'የተጠቃሚ መለያ', 'መለለይ ተጠቃሚ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1650, 'Create_New_Region', 'Create New Region', 'ኣዲስ ክልል ይመዝግቡ', 'ሓድሽ ክልል መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1651, 'Password', 'Password', 'የይለፍ ቃል', 'መሕለፊ ቃል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1649, 'Regions', 'Regions', 'ክልሎች', 'ክልላት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1646, 'Region', 'Region', 'ክልል', 'ክልል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1647, 'Create_New_Zone', 'Create New Zone', 'ኣዲስ ዞን ይመዝግቡ', 'ሓድሽ ዞባ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1648, 'Country', 'Country', 'ሀገር', 'ሃገር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1640, 'Invalid_Format', 'Invalid Format', 'የተሳሳተ ፎርማት', 'ዝተሰሓሓተ ፎርማት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1641, 'Wereda', 'Wereda', 'ወረዳ', 'ወረዳ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1642, 'Weredas', 'Weredas', 'ወረዳዎች', 'ወረዳታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1643, 'Zone', 'Zone', 'ዞን', 'ዞባ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1644, 'Zones', 'Zones', 'ዞባዎች', 'ዞባታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1645, 'Create_New_Wereda', 'Create New Wereda', 'ኣዲስ ወረዳ ይመዝግቡ', 'ሓድሽ ወረዳ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1635, 'Download', 'Download', 'ኣውርድ', 'ኣውርድ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1636, 'Create_New_Tabya', 'Create New Tabya', 'ኣዲስ ጣብያ ይመዝግቡ', 'ሓድሽ ጣብያ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1637, 'Export_To_Excel', 'Export To Excel/CSV', 'ወደ Excel ይቀየር', 'ናብ Excel ቀይር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1638, 'Upload_Logo_Image', 'Upload Logo Image', 'የድርጅት ኣርማ', 'ናይ ትካል ኣርማ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1639, 'Company_Name', 'Company Name', 'የድርጅት ስም', 'ሽም ትካል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1634, 'Tabya', 'Tabya/Kebelle', 'ጣብያ/ቀበሌ', 'ጣብያ/ቀበሌ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1633, 'Create_New_Kebelle', 'Create New Kebelle', 'ኣዲስ ቀበሌ ይመዝግቡ', 'ሓድሽ ቀበሌ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1631, 'Kebelle', 'Kushet', 'ቁሸት/ቀጠና', 'ቁሸት/ቀጠና', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1632, 'Tabyas', 'Tabyas/Kebelles', 'ጣብያዎች/ቀበሌዎች', 'ጣብያታት/ቀበሌታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1630, 'Kebelles', 'Kushets/Ketenas', 'ቁሸቶች/ቀጠናዎች', 'ቁሸታት/ቀጠናታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1629, 'Create_New_Job', 'Create New Job', 'ኣዲስ የስራ ዘርፍ ይመዝግቡ', 'ሓድሽ ዓውደ ስራሕ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1627, 'Job', 'Job', 'የስራ ዘርፍ', 'ዓውደ ስራሕ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1628, 'Jobs', 'Jobs', 'የስራ ዘርፎች', 'ዓውደ ስራሕቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1625, 'Decision_Type', 'Decision Type', 'የውሳኔ ዓይነት', 'ዓይነት ውሳነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1626, 'Create_New_Decision_Types', 'Create New Decision Types', 'ኣዲስ የውሳኔ ኣይነት ይመዝግቡ', 'ሓድሽ ዓይነት ውሳነ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1624, 'Decision_Types', 'Decision Types', 'የውሳኔ ኣይነቶች', 'ዓይነታት ውሳነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1623, 'Create_New_Department', 'Create New Department', 'ኣዲስ የውሳኔ  ኣይነት ይመዝግቡ', 'ሓድሽ ዓይነት ውሳነ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1619, 'Document_Status', 'Document Status', 'የፋይል ሁኔታ', 'ኩነታት መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1620, 'Departments', 'Departments', 'የስራ መደቦች', 'መደባት ስራሕ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1621, 'Create_New_Document_Statuses', 'Create New Document Statuses', 'የፋይል ሁኔታዎች', 'ኩነታት መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1622, 'Department', 'Department', 'የስራ ምድብ', 'መደብ ስራሕ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1617, 'Create_New_Sub_Wereda', 'Create New Sub Wereda', 'ኣዲስ ንኡስ ወረዳ ይመዝግቡ', 'ሓድሽ ንኡስ ወረዳ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1618, 'Document_Statuses', 'Document Statuses', 'የፋይል ሁኔታዎች', 'ኩነታት መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1614, 'Document_Type', 'document type', 'document type', 'document type', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1615, 'Sub_Weredas', 'Sub Weredas', 'ንኡሳን ወረዳዎች', 'ንኡስ ወረዳታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1616, 'Sub_Wereda', 'Sub Wereda', 'ንኡስ ወረዳ', 'ንኡስ ወረዳ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1613, 'Create_New_Document_Status', 'Create New Document Status', 'ኣዲስ የፋይል ሁኔታ ይመዝግቡ', 'ሓድሽ ኩነታት መዝገብ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1611, 'Pre_Accusal_Document', 'Accusal Document', 'የክስ ፋይል', 'ናይ ክሲ መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1612, 'Create_New_Pre_Accusal_Document', 'Create New Accusal Document', 'ኣዲስ ክስ ይመስርቱ', 'ሓድሽ ክሲ መስርት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1607, 'End_Date', 'End Date', 'የወጣበት ቀን', 'ዝወፀሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1608, 'Entry_Date', 'Entry Date', 'የገባበት ቀን', 'ዝኣተወሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1609, 'Law_Officer_Decision', 'Law Officer Decision Type', 'የኣቃቢ ህግ ውሳኔ', 'ውሳነ ዓቃቢ ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1610, 'Pre_Accusal_Documents', 'Accusal Documents', 'የክስ ፋይሎች', 'ናይ ክሲ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1606, 'Accusal_Category', 'Accusal Category', 'የክስ ኣይነት', 'ዓይነት ክሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1603, 'Defendants', 'Defendants', 'ተከሳሾች', 'ተኸሰስቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1604, 'Accusers', 'Accusers', 'ከሳሾች', 'ከሰስቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1605, 'Accuser', 'Accuser', 'ከሳሽ', 'ከሳሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1601, 'Full_Name', 'Full Name', 'ሙሉ ስም', 'ሙሉእ ሽም', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1602, 'Defendant', 'Defendant', 'ተከሳሽ', 'ተኸሳሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1600, 'Phone_Number', 'Phone Number', 'ስልክ ቁጥር', 'ቁፅሪ ስልኪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1598, 'Address', 'Address', 'ኣድራሻ', 'ኣድራሻ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1599, 'Gender', 'Gender', 'ፆታ', 'ፆታ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1597, 'Accusation', 'Accusation', 'ክስ', 'ክሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1596, 'Age', 'Age', 'እድሜ', 'ዕድመ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1595, 'Language_Strings', 'Language Strings', 'የቋንቋ ሃረጋት', 'ሓረጋት ቋንቋ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1593, 'Documents', 'Document', 'ፋይል', 'መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1594, 'Is_Accuser_A_Victim', 'Victim', 'የግል ተበዳይ', 'ውልቀ ተበዳሊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1592, 'Document', 'Document', 'ፋይል', 'መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1590, 'Female', 'Female', 'ሴት', 'ኣነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1591, 'Is_Accuser_A_Law_Officer', 'Law Officer', 'ህግ', 'ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1588, 'Next', 'Next', 'ወደ ቀጣይ ሂድ', 'ናብ ዝቕፅል ሕለፍ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1589, 'Male', 'Male', 'ወንድ', 'ተባ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1587, 'Adminstrative_Level', 'Adminstrative Level', 'የሃላፊነት ደረጃ', 'ብርኪ ሓላፍነት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1586, 'Create_New_Country', 'Create New Country', 'ኣዲስ ኣገር ይመዝግቡ', 'ሓድሽ ሃገር መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1583, 'Brkitat', 'Levels', 'ደረጃዎች', 'ብርክታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1584, 'Create_New_Brki', 'Create New Level', 'ኣዲስ ደረጃ ይመዝግቡ', 'ሓድሽ ብርኪ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1585, 'Countries', 'Countries', 'ኣገሮች', 'ሃገራት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1582, 'Brki', 'Level', 'ደረጃ', 'ብርኪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1581, 'Religion', 'Religion', 'ሃይማኖት', 'ሃይማኖት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1579, 'Federal', 'Federal', 'ፌዴራል', 'ፌዴራል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1580, 'Create_New_Religion', 'Create New Religion', 'ኣዲስ ሃይማኖት ይመዝግቡ', 'ሓድሽ ሃይማኖት መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1577, 'Create_New_Merriage_Status', 'Create_New Merriage Status', 'ኣዲስ የትዳር ሁኔታ ይመዝግቡ', 'ሓድሽ ኩነታት ሓዳር መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1578, 'Merriage_Status', 'Merriage Status', 'የትዳር ሁኔታ', 'ኩነታት ሓዳር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1576, 'Religions', 'Religions', 'ሃይማኖቶች', 'ሃይማኖታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1575, 'Merriage_Statuses', 'Merriage Statuses', 'የትዳር ሁኔታዎች', 'ኩነታት ሓዳር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1571, 'LO_File_Number', 'Law Officer File Number', 'የኣቃቤ ህግ መዝገብ ቁጥር', 'ዓቃቢ ሕጊ መዝገብ ቁፅሪ', '2019-06-27 19:31:34', '2019-08-05 08:36:17'),
(1572, 'Nationalities', 'Nationalities', 'ዜግነቶች', 'ዜግነታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1573, 'Nationality', 'Nationality', 'ዜግነት', 'ዜግነት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1574, 'Create_New_Nationality', 'Create New Nationality', 'ኣዲስ ዜግነት ይመዝግቡ', 'ሓድሽ ዜግነት መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1569, 'Create_New_Complain', 'Create New Complain', 'ኣዲስ ቅሬታ ይመዝግቡ', 'ሓድሽ ጥርዓን መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1570, 'Court_File_Number', 'Court File Number', 'የፍርድ ቤት መዝገብ ቁጥር', 'ቤት ፍርዲ መዝገብ ቑፅሪ', '2019-06-27 19:31:34', '2019-08-05 08:35:25'),
(1567, 'Complains', 'Complains', 'ኣቤቱታዎች', 'ጥርዓናት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1568, 'Users', 'Users', 'ተጠቃሚዎች', 'ተጠቀምቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1566, 'Complain', 'Complain', 'ኣቤቱታ', 'ጥርዓን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1564, 'User', 'User', 'ተጠቃሚ', 'ተጠቃሚ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1565, 'Create_New_User', 'Create New User', 'ኣዲስ ተጠቃሚ ይመዝግቡ', 'ሓድሽ ተጠቃሚ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1560, 'Crime_Commited', 'After Crime Commited', 'ተጨባጭ ወንጀል ከተፈፀመ በኋላ', 'ጭቡጥ ገበን ተፈፂሙ እናሃለወ', '2019-06-27 19:31:34', '2019-07-29 12:19:01'),
(1561, 'Exit_Date', 'Exit Date', 'የወጣበት ቀን', 'ዝወፀሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1562, 'First_Level', 'First Level', 'የተመሰረተለት ደረጃ', 'ዝተመስረተሉ ብርኪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1563, 'Last_Level', 'Last Level', 'የቆመበት ደረጃ', 'ዝርከበሉ ብርኪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1559, 'Appeal', 'Appeal', 'ይግባኝ ይጠይቁ', 'ይግባይ ሕተት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1558, 'Court_Decision', 'Court Decision', 'የፍርድ ቤት ውሳኔ', 'ውሳነ ቤት ፍርዲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1556, 'Check_All', 'Check All', 'ሁሉንም ይምረጡ', 'ኩሎም ምረፅ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1557, 'Crime_Not_Commited', 'Crime Not Commited', 'ተጨባጭ ወንጀል መፈፀሙ ኣጠራጣሪ', 'ጭቡጥ ገበን ምፍፃሙ ዘጠራጥር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1555, 'Appointment_Date', 'Appointment Date', 'የቆጠሮ ቀን', 'ዕለት ቆፀሮ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1554, 'Document_Number', 'Document Number', 'የፋይል ቁጥር', 'መዝገብ ቁፅሪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1553, 'Appointment_Count', 'Appointments Count', 'የቆጠሮ ብዛት', 'በዝሒ ቆፀሮ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1551, 'Arbiter', 'Arbiter', 'ዳኛ', 'ዳኛ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1552, 'Decision', 'Decision', 'ውሳኔ', 'ውሳነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1548, 'Defence_Case', 'Defence Case', 'የመከላከል ሁኔታ', 'ኩነታት ምክልኻል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1549, 'Decision_Maker', 'Decision Maker', 'ውሳኔ የሰጠ', 'ውሳነ ዝሃበ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1550, 'Law_Officer', 'Law Officer', 'ኣቃቢ ህግ', 'ዓቃቢ ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1547, 'Punishment_Type', 'Punishment Type', 'የቅጣት ኣይነት', 'ዓይነት ቅፅዓት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1546, 'Amount_Of_Money', 'Amount Of Money', 'የብር መጠን', 'መጠን ገንዘብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1545, 'Length_Of_Restriction', 'Length Of Restriction', 'የገደብ ርዝመት', 'ንውሓት ገደብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1543, 'Direct_Accusal_Documents', 'Direct Accusal Documents', 'ቀጥታ የወንጀል ክስ ብመዝገብ', 'ቀጥታ ክሲ ገበን ብመዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1544, 'Length_Of_Prison', 'Length Of Prison', 'የእስራት ርዝመት', 'ንውሓት ማእሰርቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1538, 'Role', 'Role', 'የሃላፊነት ኣይነት', 'ዓይነት ሓላፍነት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1539, 'Optional', 'Optional', 'ግዴታ ኣደለም', 'ናይ ግድን ኣይኮነን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1540, 'Email', 'Email', 'ኢሜይል', 'ኢሜይል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1541, 'Life_Sentence', 'Life Sentence', 'የእድሜ ልክ', 'ዕድመ ልክዕ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1542, 'Appeal_Is_Allowed_By', 'Appeal Is Allowed By', 'ይግባኝ የሰጠ ሃላፊ', 'ይግባይ ዝሃበ ኣካል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1536, 'Confirm_Password', 'Confirm Password', 'የይለፍ ቃል ያረጋግጡ', 'መሕለፊ ቃል ኣረጋግፅ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1537, 'Status', 'Status', 'ሁኔታ', 'ኩነታት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1534, 'Activate', 'Activate', 'Activate', 'Activate', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1535, 'Deactivate', 'Deactivate', 'Deactivate', 'Deactivate', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1531, 'Prison', 'Prison', 'እስራት', 'ማእሰርቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1533, 'Date', 'Date', 'ቀን', 'ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1532, 'Crime_Case', 'Crime_Case', 'የወንጀል ሁኔታ', 'ኩነታት ገበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1529, 'Oppenent_Law_Officer', 'Oppenent Law Officer', 'ተከራካሪ ኣቃቢ ህግ', 'ዝተኸራኸረ ዓቃቢ ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1530, 'Confirm_Document_Entered', 'Confirm Document Entered', 'ፋይል ተረክበነዋል', 'መዝገብ ተረኪብና', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1528, 'Decision_Maker_Is_Opponent_Lawyer', 'Opponent Lawyer', 'የተካራከረ ኣቃቢ ህግ', 'ዝተከራከረ ዓቃቢ ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1526, 'Victum_Info', 'Victum Info', 'የግል ተበዳይ መረጃ', 'መረዳእታ ውልቀ ተበዳሊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1527, 'Appealer_Is_Acuser', 'Appealer Is Acuser', 'ይግባኝ ባይ ከሳሽ ነው', 'ይግባይ በሃሊ ከሳሲ እዩ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1525, 'Lawyer_Decision_Time_Efficiency', 'Lawyer Decision Time Efficiency', 'የመዝገብ ኣፈፃፀም', 'ሰለጤን መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1524, 'Appeal_Is_Requested_By', 'Appeal Requester', 'ይግባኝ ባይ', 'ይግባይ በሃሊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1523, 'Not_Accused_Due_To_Lack_Of_Information', 'Not Accused Due To Lack Of Information', 'በቂ መረጃ ባለመገኘቱ ያልተከሰሱም', 'ብቁዕ መረዳእታ ስለዘይብሎም ኣየክስስን ዝተብሃሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1522, 'Returned_For_Further_Investigation', 'Returned For Further Investigation', 'ለተጨማሪ ማጣራት ለፖሊስ ተመልሰው የተሰጡ', 'ንተወሳኺ ምፅራይ ናብ ፖሊስ ዝመለሱ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1520, 'Appeal_To_Level', 'Appeal To Level', 'ይግባኝ ወደ', 'ይግባእኒ ናብ ብርኪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1521, 'Picked_Over_Documents', 'Picked Over Documents', 'የተነሱ መዝግብት', 'ዝተልዓሉ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1519, 'Lawyer_Support_Status', 'Lawyer Support Status', 'የኣቃቢ ህግ ድጋፍ ሁኔታ', 'ኩነታት ድጋፍ ዕቃቢ ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1517, 'Picked_Over_Reason', 'Picked Over Reason', 'የተነሳለት ምክንያት', 'ዝተልዓለሉ ምኽንያት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1518, 'Is_Defendant_Avaliable', 'Is Defendant Avaliable?', 'ተከሳሽ ባለበት ነው?', 'ተከሳሲ ኣብ ዘለወሉ ድዩ?', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1512, 'Debate', 'Debate', 'ክርክር', 'ክርክር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1513, 'Negotiation', 'Negotiation', 'ድርድር', 'ድርድር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1514, 'Not_Supported', 'Not Supported', 'ሳይደግፈው', 'ከይደገፈ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1515, 'Supported', 'Supported', 'ደግፎ', 'ደጊፉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1516, 'Arguement_Type', 'Arguement Type', 'የምጉት ኣይነት', 'ዓይነት ሞጎት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1510, 'Day', 'Day', 'ቀን', 'መዓልቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1511, 'Year', 'Year', 'ኣመት', 'ዓመት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1509, 'Month', 'Month', 'ወር', 'ወርሒ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1508, 'Defendant_Not_Avaliable', 'Defendant Not Avaliable', 'ተከሳሽ ኣልተገኘም', 'ተኸሳሲ ኣይተረኸበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1505, 'Other', 'Other', 'ሌላ', 'ካልእ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1506, 'Red_Handed', 'Red Handed', 'እጅ ከ ፈንጅ', 'ኢድ ብ ኢድ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1507, 'Witness_Not_Avaliable', 'Witness Not Avaliable', 'ምስክር ኣልተገኘም', 'ምስክር ኣይተረኸበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1504, 'Medium_And_Havy', 'Medium And Havy', 'መካከለኛ እና ከባባድ', 'ማእኸለዎትን ከበድትን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1502, 'Defendant_Avaliable', 'Defendant Avaliable', 'ተከሳሽ ባለበት', 'ተከሳሲ ኣብ ዘለወሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1503, 'Document_Return_Date', 'Document Return Date', 'መዝገቡ የሚመለስበት ቀን', 'መዝገብ ዝምለሰሉ ዕለት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1499, 'Reason_To_Appeal', 'Reason To Appeal', 'ይግባኝ የተጠየቀበት ምክንያት', 'ይግባይ መሕተቲ ምኽንያት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1501, 'Appealer_Is_Lawyer', 'Appealer Is Lawyer', 'ይግባኝ ጠያቂ ኣቃቢ ህግ ነው', 'ይግባይ በሃሊ ዓቃቢ ሕጊ እዩ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1500, 'Appeal_Is_Responded_By', 'Appeal Is Responded By', 'ይግባኝ መልስ ሰጪ', 'ይግባይ መልሲ ወሃቢ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1497, 'Warrant_Execution_Status', 'Warrant Execution Status', 'የዋስ ኣፈፃፀም', 'ኣፈፃፅማ ግቡእ ውሕስና', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1498, 'Warrant_Status', 'Warrant Status', 'የዋስ ሁኔታ', 'ኩነታት ውሕስና', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1491, 'Both', 'Both', 'ሁለቱንም', 'ክልቲኦም', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1492, 'Allowed', 'Allowed', 'ተፈቅደዋል', 'ተፈቂዱ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1493, 'Not_Allowed', 'Not Allowed', 'ኣልተፈቀደም', 'ኣይተፈቐደን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1494, 'Amount', 'Amount', 'መጠን', 'መጠን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1495, 'Activate_Record', 'Activate', 'ኣንቀሳቅስ', 'ኣንቀሳቅስ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1496, 'Court_Process', 'Court Process', 'የፍርድ ሂደት', 'ከይዲ ፍርዲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1490, 'Executed', 'Executed', 'በኣግባኡ ተፈፅመዋል', 'ብኣግባቡ ተፈፂሙ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1488, 'Level', 'Level', 'ብርኪ', 'ብርኪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1489, 'Not_Executed', 'Not Executed', 'በኣግባኡ ኣልተፈፀመም', 'ብኣግባቡ ኣይተፈፀመን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1486, 'Document_Efficiency', 'Document Efficiency', 'የመዝገብ ኣፈፃፀም', 'ሰለጤን መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1487, 'New_Document_Count', 'New Document Count', 'ኣዳዲስ መዝገቦች ብዛት', 'በዝሒ ሓድሽ መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1484, 'Sequecing', 'Sequecing', 'ደረጃ', 'ስርርዕ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1485, 'Undecided_Lawyer_Documents', 'Undecided Lawyer Documents', 'ገና ውሳኔ ያልተሰጣቸው ኣቃቢ ህግ የያዛቸው መዝገቦች', 'ገናዘይተወሰኑ ኣብ ኢድ ኣቃቢ ሕጊ ዘለዉ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1482, 'Light_Weight_Crimes', 'Light Weight Crimes', 'ቀላል ወንጀሎች', 'ቀለልቲ ገበናት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1483, 'Red_Handed_Crimes', 'Red Handed Crimes', 'እጅ ከፈንጅ ወንጀሎች', 'ኢድ ብ ኢድ ገበናት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1481, 'Medium_And_Havy_Crimes', 'Medium And Havy Crimes', 'መካከለኛ ና ከባባድ ወንጀሎች', 'ማእኸለዎትን ከበድትን ገበናት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1479, 'Sum', 'Sum', 'ድምር', 'ድምር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1480, 'Sum_Of_Efficient_Docs', 'Sum Of Efficient Docs', 'በጊዘያቸው ውሳኔ ያገኙ መዛግንት ብዛት', 'ድምር ኣብ ሰዓቱ ዝተወሰነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1478, 'Quantity', 'Quantity', 'ብዛት', 'በዝሒ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1476, 'Decided_In_5_Hours', 'Decided In 5 Hours', 'በ 5 ሰኣት ውስጥ ውሳኔ ያገኙ', 'ኣብ ውሽጢ  5  ሰዓት ዝተወሰነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1477, 'Child', 'Child', 'ህፃን', 'ህፃን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1475, 'Decided_In_3_Days', 'Decided In 3 Days', 'በ 3 ቀናት ውስጥ ውሳኔ ያገኙ', 'ኣብ ውሽጢ 3 መዓልቲ ዝተወሰነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1474, 'Decided_In_15_Days', 'Decided In 15 Days', 'በ 15 ቀናት ውስጥ ውሳኔ ያገኙ', 'ኣብ ውሽጢ 15 መዓልቲ ዝተወሰነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1472, 'Decision_Quality', 'Decision Quality', 'የውሳኔ ጥራት', 'ኣግባብነት ፅሬት ውሳነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1473, 'Returned_For_Investigation', 'Returned For Investigation', 'ለማጣራት የተመለሱ መዛግብት', 'ንምፅራይ ዝተመለሰ መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1471, 'Time_Set_Status', 'Time Set Status', 'ግዜ የተለየለት', 'ምንፃር ግዘ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1470, 'Document_Return_Status', 'Document Return Status', 'መዝገብ የመመለስ ሁኔታ', 'ኩነታት ምምላስ ዝተፃረየ መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1469, 'Return_Was_Correct', 'Return Was Correct', 'መመለስ የነበረበት', 'ክምለስ ዝግቦኦ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1466, 'Returned_On_Time', 'Returned On Time', 'በግዜው የተመለሰ', 'ብግዚኡ ዝተመለሰ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1467, 'Time_Was_Set', 'Time Was Set', 'ግዜ የተለየለት', 'ግዘ ዝተነፀረሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1468, 'Return_Was_Not_Correct', 'Return Was Not Correct', 'መመለስ ያልነበረበት', 'ክምለስ ዘይግቦኦ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1465, 'Time_Was_Not_Set', 'Time Was Not Set', 'ግዜ ያልተለየት', 'ግዘ ዘይተነፀረሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1464, 'Not_Returned_Yet', 'Not Returned Yet', 'ገና ያልተመለሰ', 'ገና ዘይተመለሰ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1462, 'By_Quality', 'By Quality', 'በጥራት', 'ብፅሬት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1463, 'Returned_After_Time', 'Returned After Time', 'ግዜው ኣልፎ የተመለሰ', 'ግዚኡ ምስ ሓለፈ ዝተመለሰ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1461, 'By_Returning', 'By Returning', 'በመመለስ', 'ብምምላስ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1459, 'In_%', 'In %', 'በ  %', 'ብ %', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1460, 'Closed_Due_To_Lack_Of_Information', 'Closed_Due_To Lack Of Information', 'በቂ መረጃ ባለመገኘቱ ያልተከሰሱም', 'ብቁዕ መረዳእታ ስለዘይብሎም ኣየክስስን ዝተብሃሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1458, 'Quality_Of_Decision', 'Quality Of Decision', 'የውሳኔ ጥራት', 'ፅሬት ውሳነ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1457, 'Information_Not_Found', 'Information Not Found', 'መረጃ ኣልተገኘም', 'መረዳእታ ኣይተረኸበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1456, 'Defendant_Not_Found', 'Defendant Not Found', 'ተከሳሽ ኣልተገኘም', 'ተከሳሲ ኣይተረኸበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1455, 'Activation', 'Activation', 'በእንቅስቃሴ', 'ብምንቅስቃስ', '2019-06-27 19:31:34', '2019-07-29 12:19:02'),
(1454, 'Winning_Status_Of_Regional_Breaking_Crime_Documents_Appealed_By_Individual', 'Winning Status Of Regional Breaking Crime Documents Appealed By Individual', 'ብግለ ሰው የቀረበ ሰበር ክልል ይግባኝ የኣሸናፊነት ሁኔታ', 'ብውልቀ ሰብ ዝቐረበ ምርታዕ ሰበር ክልል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1453, 'Winning_Status_Of_Regional_Breaking_Crime_Documents_Appealed_By_Lawyer', 'Winning Status Of Regional Breaking Crime Documents Appealed By Lawyer', 'በኣቃቢ ህግ የቀረበ ሰበር ክልል ይግባኝ ኣሸናፊነት ሁኔታ', 'ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ሰበር ክልል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1452, 'Winning_Status_Of_Crime_Documents_Appealed_By_Individual_On_Free', 'Winning Status Of Crime Documents Appealed By Individual On Free', 'በነፃ በግለሰብ የቀረበ ይግባኝ ኣሸናፊነት ሁኔታ', 'ኣብ ነፃ ብውልቀ ዝቐረበ ምርታዕ ይግባኣኒገበን መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1451, 'Winning_Status_Of_Crime_Documents_Appealed_By_Lawyer_On_Free', 'Winning Status Of Crime Documents Appealed By Lawyer On Free', 'በነፃ በኣቃቢ ህግ የቀረበ ይግባኝ ኣሸናፊነት ሁኔታ', 'ኣብ ነፃ ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ይግባኣኒገበን መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1450, 'Court_Process_Of_Direct_Crime_Documents', 'Court Process Of Direct Crime Documents', 'ቀጥታ መዛግብት የፍርድ ሁኔታ', 'ከይዲ ፍርዲ ቀጥታ ገበን መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1446, 'Decided', 'Decided', 'ውሳኔ ያገኙ', 'ውሳነ ዝረኸቡ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1447, 'Quality', 'Quality', 'ጥራት', 'ፅሬት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1448, 'Person', 'Person', 'ሰው', 'ሰብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1449, 'Number_Of_Picked_Over_Documents', 'Number Of Picked Over Documents', 'የተነሱ መዝግብት ብዛት', 'በዝሒ ዝተልዓሉ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1445, 'Lawyer_Won', 'Lawyer Won', 'ኣቃቢ ህግ ያሸነፈበት', 'ዓቃቢ ሕጊ ዝረትዓሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1443, 'Above_10', 'Above 10', 'ከ10 በላይ', 'ልዕሊ 10', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1444, 'Lawyer_Lost', 'Lawyer Lost', 'ኣቃቢ ህግ የተሸነፈበት', 'ዓቃቢ ሕጊ ዝተረትዐሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1441, 'Decided_Document_Count', 'Decided Document Count', 'ውሳኔ የተሰጣቸው መዛግብት', 'በዝሒ ውሳነ ዝረኸቡ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1442, 'Below_5', 'Below 5', 'ከ5 በታች', 'ትሕቲ 5', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1440, 'Defendant_Avaliable_Or_Not_In_Decision', 'Defendant Avaliable Or Not In Decision', 'ተከሳሽ ባለበት እና በሌለበት ውሳኔ የተሰጣቸው', 'ተከሳሲ ኣብ ዘለሉን ዘይለሉን ዝተወሰኑ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1439, 'Decided_With_In_3_Months', 'Decided With In 3 Months', 'በ3 ወር ውሳኔ የተሰጣቸው', 'ትሕቲ 3 ወርሒ ዝተወሰኑ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1438, 'Decided_With_In_3_to_6_Months', 'Decided With In 3 to 6 Months', 'በ3-6 ወራት ውሳኔ የተሰጣቸው', 'ካብ 3 – 6 ወርሒ ዝተወሰኑ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1437, 'Decided_In_6_Month_1_Year', 'Decided In 6 Month 1 Year', 'በ6 ወር እስከ 1 ዓመት ጊዜ ውስጥ ውሳኔ የተሰጣቸው', 'ካብ 6 ወርሒ 1 ዓመት ዝተወሰኑ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1436, 'Decided_In_Above_1_Year', 'Decided In Above 1 Year', 'ከ1 ኣመት በላይ በሆነ ግዜ ውሳኔ የተሰጣቸው', 'ልዕሊ 1 ዓመት  ዝተወሰኑ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1433, 'Above_10_Times', 'Above 10 Times', 'ከ10 ግዜ በላይ', 'ልዕሊ 10 ግዘ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1434, 'In_1_Time', 'In 1 Time', 'በ 1 ቆጠሮ', 'ኣብ 1 ቆፀሮ', '2019-06-27 19:31:34', '2019-06-27 19:31:34');
INSERT INTO `language_strings` (`id`, `keyWord`, `eng`, `amh`, `tig`, `created_at`, `updated_at`) VALUES
(1435, 'Below_4_Times', 'Below 4 Times', 'ክ4 ግዜ በታች', 'ትሕቲ 4 ግዘ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1431, 'In_4_to_10_Times', 'In 4 to 10 Times', 'ከ4 - 10 ግዜ', 'ካብ 4 – 10 ግዘ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1432, 'Executed_Decision', 'Executed Decision', 'የተፈፀመ ፍርድ', 'ዝተፈፀመ ፍርዲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1430, 'Appealed_Dos_Count_(Recycled_and_News)', 'Appealed Dos Count(Recycled and News)', 'ይግባኝ የተጠየቀላቸው መዛግብት ብዛት(ኣዲስና የዞሩ)', 'በዝሒ ይግባኣኒ ዝተሓተተሉ (ዝዞረን ሓዱሽን)', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1429, 'Supported_By_Lawyer', 'Supported By Lawyer', 'በኣቃቢ ሕጊ የተደገፉ', 'ብዓቃቢ ሕጊ ዝተደገፈ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1428, 'Not_Supported_By_Lawyer', 'Not Supported By Lawyer', 'በኣቃቢ ሕጊ ያልተደገፉ', 'ብዓቃቢ ሕጊ ዘይተደገፈ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1427, 'Decided_Documents_Count', 'Decided Documents Count', 'ውሳኔ የተሰጣቸው መዛግብት ብዛት', 'በዝሒ ውሳነ ዝረኸቡ መዛግብቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1426, 'Lawyer_Appealed_And_Won', 'Lawyer Appealed And Won', 'ኣቃቢ ህግ ይግባኝ ከተየቀላቸው ያሸነፈው', 'ዓቃቢ ሕጊ ይግባኣኒ ካብ ዝሓተተሉ ዝረትዐሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1424, 'Supported_By_Lawyer_And_Won', 'Supported By Lawyer And Won', 'ኣቃቢ ህግ ደግፎ ያሸነፈላቸው', 'ዓቃቢ ሕጊ ካብ ዝደገፎ ዝረትዐሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1425, 'Lawyer_Lost_And_Appealed', 'Lawyer Lost And Appealed', 'ኣቃቢ ህግ ከተሸነፈባቸው ይግባኝ የጠየቀላቸው', 'ዓቃቢ ሕጊ ካብ ዝተረትዐሉ ይግባኣኒ ዝሓተተሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1423, 'Appealed_On_Free', 'Appealed On Free', 'በነፃ ይግባኝ የተጠየቁ', 'ኣብ ነፃ ይግባኣኒ ዝተብሃለ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1422, 'Appealed_On_Punishment/Other', 'Appealed On Punishment/Other', 'በቅጣት ማነስ/ሌላ ይግባኝ የተጠየቀለት', 'ኣብ ቅፅዓት/ካልእ ይግባኣኒ ዝተብሃለ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1421, 'Not_Accepted_By_Lawyer', 'Not Accepted By Lawyer', 'ኣቃቢ ህግ የተቃወማቸው', 'ዓቃቢ ሕጊ ዝተቃዎሞ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1420, 'Accepted_By_Lawyer', 'Accepted By Lawyer', 'ኣቃቢ ህግ ያልተቃወማቸው', 'ብዓቃቢ ሕጊ ዘይተቃዎሞ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1419, 'Not_Accepted_By_Lawyer_And_Won', 'Not Accepted By Lawyer And Won', 'ኣቃቢ ህግ ከተቃወማቸው ያሸነፈበት', 'ዓቃቢ ሕጊ ካብ ዝተቃዎሞ ዝረትዐሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1418, 'Not_Accepted_By_Lawyer_Appealed', 'Not Accepted By Lawyer Appealed', 'ኣቃቢ ህግ ከተቃወማቸው ይግባኝ የጠየቀላቸው', 'ዓቃቢ ሕጊ ካብ ዝተቃዎሞ ይግባኣኒ ዝሓተተሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1417, 'Appilicant', 'Appilicant', 'ኣመልካች', 'ኣመልካቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1416, 'Nominal', 'Nominal', 'ተጠሪ', 'ተፀዋዒ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1415, 'Not_Modified', 'Not Modified', 'ያልተሻሻለ', 'ዘይተመሓየሸ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1413, 'Modification_Status', 'Modification Status', 'የማሻሻል ሁኔታ', 'ኩነታት ምምሕያሽ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1414, 'Modified', 'Modified', 'የተሻሻለ', 'ዝተመሓየሸ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1411, 'Direct', 'Direct', 'ቀጥታ', 'ቀጥታ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1412, 'Indirect', 'Indirect', 'ይግባይ', 'ይግባይ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1410, 'Police_Document_Number', 'Police Document Number', 'ፖሊስ መዝገብ ቁጥር', 'ፖሊስ መዝገብ ቁፅሪ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1408, 'Positive', 'Positive', 'ትክክል', 'ትክክል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1409, 'Crime_Weight', 'Crime Weight', 'የወንጀል ክብደት', 'ክብደት ገበን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1407, 'Winning_Status_Of_Federal_Breaking_Crime_Documents_Appealed_By_Lawyer', 'Winning Status Of Federal Breaking Crime Documents Appealed By Lawyer', 'በኣቃቢ ህግ የቀረበ ሰበር ፌዴራል ይግባኝ ኣሸናፊነት ሁኔታ', 'ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ሰበር ፌዴራል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1406, 'Easy', 'Easy', 'ቀላል', 'ቀሊል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1403, 'Decision_Makers', 'Decision Makers', 'ውሳኔ የሰጡ', 'ውሳነ ዝሃቡ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1404, 'Report', 'Report', 'ሪፖርት', 'ፀብፃብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1405, 'Winning_Status_Of_Federal_Breaking_Crime_Documents_Appealed_By_Individual', 'Winning Status Of Federal Breaking Crime Documents Appealed By Individual', 'ብግለ ሰው የቀረበ ሰበር ፌዴራል ይግባኝ የኣሸናፊነት ሁኔታ', 'ብውልቀ ሰብ ዝቐረበ ምርታዕ ሰበር ፌዴራል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1399, 'Money', 'Money', 'ገንዘብ', 'ገንዘብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1400, 'Not_Defended', 'Not Defended', 'ገና ሳይከላከል', 'ከይተኸላኸለ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1401, 'Restriction', 'Restriction', 'አገዳ', 'ገደብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1402, 'Arbiters', 'Arbiters', 'ዳኞች', 'ዳያኑ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1397, 'Civil_Court_Documents', 'Civil Court Documents', 'የፍትሐ ብሔር መዝገብ', 'ፍታብሄር መዝገብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1398, 'Defended', 'Defended', 'ከተከላከለ በሃላ', 'ምስተኸላኸለ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1395, 'Key_Word', 'Key Word', 'መለያ ቃል', 'መፍለይ ቃል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1396, 'Create_New_Civil_Court_Document', 'Create New Civil Court Document', 'የፍትሐ ብሔር መዝገብ ይመዝግቡ', 'ፍታብሄር መዝገብ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1394, 'Civil_Court_Arbiter_Decisions', 'Civil Court Arbiter Decisions', 'ፍትሓብሄር ፍርድቤት የውሳኔ ኣይነቶች', 'ዓይነት ውሳነ ፍታብሄር ቤት ፍርዲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1392, 'Accuser_Types', 'Accuser Types', 'የከሳሽ ኣይነቶች', 'ዓይነት ከሰስቲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1393, 'Civil_Court_Lawyer_Decisions', 'Civil Court Lawyer Decisions', 'ፍትሓብሄር ኣቃቢህግ የውሳኔ ኣይነቶች', 'ፍታብሄር ዓይነታት ውሳነ ዓቃቢሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1390, 'Property_Types', 'Property Types', 'የቁስ ኣይነቶት', 'ዓይነታት ንብረት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1391, 'Accuser_Type', 'Accuser Type', 'የከሳሽ ኣይነት', 'ዓይነት ከሳሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1389, 'Property_Type', 'Property Type', 'የንብረት ኣይነት', 'ዓይነት ንበረት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1388, 'Civil_Court_Cases', 'Civil Court Cases', 'የፍትሓብሄር ጉዳዮች', 'ዋኒናት ፍታብሄር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1387, 'Civil_Court_Case', 'Civil Court Case', 'የፍትሓብሄ ጉዳይ', 'ዋኒን ፍታብሄር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1386, 'Civil_Court', 'Civil Court', 'ፍትሐብሄር', 'ፍታብሄር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1385, 'Create_New_Property_Type', 'Create New Property Type', 'የቁስ ኣይነት ይመዝግቡ', 'ዓይነት ንብረት መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1384, 'Create_New_Case', 'Create New Case', 'ጉዳይ ይመዝግቡ', 'ዋኒን መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1381, 'In_Birr', 'In Birr', 'በብር', 'ብብር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1382, 'In_M2', 'In M2', 'ብካሬ', 'ብካሬ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1383, 'Create_New_Accuser_Type', 'Create New Accuser Type', 'የከሳሽ ኣይነት ይመዝግቡ', 'ዓይነት ከሳሲ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1380, 'Lawyer_Amount', 'Lawyer Amount', 'ኣቃቢ ህግ ያሻላላው መጠን', 'ኣቃቢ ዘመሓየሾ መጠን', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1378, 'Able_To_Execute', 'Able To Execute', 'ማስፈፀሚያ ያለው', 'መፈፅሚ ዘለዎ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1379, 'Area', 'Area', 'ስፋት', 'ስፍሓት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1376, 'Accused_On_Execution', 'Accused On Execution', 'የኣፈፃፀም ክስ የተመሰረተበት', 'ኣፈፃፅማ ክሲ ዝተመስረቶ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1377, 'Unable_To_Execute', 'Unable To Execute', 'ማስፈፀሚያ የሌለው', 'መፈፀሚ ዘይብሉ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1374, 'Agreement', 'Agreement', 'ስምምነት', 'ስምምዕ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1375, 'Agreed_On_Execution', 'Agreed On Execution', 'በእርቅ/ስምምነት የተፈፀመ', 'ብዕርቂ/ስምምዕ ዝተፈፀመ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1373, 'Agent_Type', 'Agent Type', 'የወኪል ኣይነት', 'ዓይነት ወኪል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1372, 'Justice_Office', 'Justice Office', 'ፍትህ/ህግ', 'ፍትሒ/ሕጊ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1371, 'Task_Finisher', 'Task Finisher', 'የጉዳይ ኣስፈፃሚ', 'ወዳኢ ነገር', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1370, 'Accuser_Info', 'Accuser Info', 'የከሳሽ መረጃ', 'መረዳእታ ከሳሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1369, 'Attorney', 'Attorney', 'ጠበቃ', 'ጠበቓ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1368, 'Agent_Info', 'Agent Info', 'የወኪል መረጃ', 'መረዳእታ ወኪል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1367, 'Defendant_Type', 'Defendant Type', 'የተከሳሽ ኣይነት', 'ዓይነት ተከሳሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1366, 'Agent', 'Agent', 'ወኪል', 'ወኪል', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1365, 'Amount_Of_Property', 'Amount Of Property', 'የንብረት ብዛት', 'በዝሒ ንብረት', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1364, 'Create_New_Inherit_Type', 'Create New Inherit Type', 'የውርስ ኣይነት ይመዝግቡ', 'ሓድሽ ዓይነት ውርሲ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1363, 'Inherit_Types', 'Inherit Types', 'የውርስ ኣይነቶች', 'ዓይነታት ውርሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1362, 'Inherit_Type', 'Inherit Type', 'የውርስ ኣይነት', 'ዓይነት ውርሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1360, 'Compensation_Types', 'Compensation Types', 'የካሳ ኣይነቶች', 'ዓይነታት ካሕሳ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1361, 'Create_New_Compensation_Type', 'Create New Compensation Type', 'የካሳ ኣይነት ይመዝግቡ', 'ሓድሽ ዓይነት ካሕሳ መዝግብ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1359, 'Compensation_Type', 'Compensation Type', 'የካሳ ኣይነት', 'ዓይነት ካሕሳ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1358, 'Execution_Status', 'Execution Status', 'የኣፈፃፀም ሁኔታ', 'ኩነታት ኣፈፃፅማ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1357, 'Execution_Accusal_Status', 'Execution Accusal Status', 'የኣፈፃፀም ክስ ሁኔታ', 'ኩነታት ኣፈፃፅማ ክሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1356, 'Accusal_Date', 'Accusal Date', 'የተከሰሰበት ቀን', 'ዝተከሰሰሉ ዕለት', '2019-06-27 19:31:34', '2019-07-29 12:25:58'),
(1355, 'Execution_Court_Decision_Type', 'Execution Court Decision Type', 'ኣፈፃፀም ክስ የፍርድቤት ውሳኔ', 'ውሳነ ቤትፍርዲ ኣፈፃፅማ ክሲ', '2019-06-27 19:31:34', '2019-06-27 19:31:34'),
(1354, 'Not_Executed_Court_Decision_Reason', 'Not Executed Court Decision Reason', 'የፍርድቤት ውሳኔ ያልተፈፅመበት ምክንያት', 'ውሳነ ቤትፍርዲ ዘይተፈፀመሉ ምክንያት', '2019-06-27 19:31:34', '2019-07-29 12:23:45'),
(1843, 'Winning_Status_Of_Breaking_Civil_Case_Documents_Appealed_By_Individual', 'Winning Status Of Breaking Civil Case Documents Appealed By Individual', 'በግል ተከሳሽ የቀረበ ፍታብሄር ሰበር ይግባኝ ኣሸናፊነት ሁኔታ', 'ብውልቀ ተኸሳሲ ዝቐረበ ምርታዕ ሰበር  ፍታብሔር መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1844, 'Execution_Status_Of_Civil_Case_Documents', 'Execution Status Of Civil Case Documents', 'የፍታብሄር መዝገቦች የኣፈፃፀም ሁኔታ', 'ኰነታት ኣፈፃፅማ ፍታብሔር መዝገባት', '2019-06-27 19:32:23', '2019-07-18 18:23:13'),
(1845, 'Witness_Services_And_Protection', 'Witness Services And Protection', 'የወንጀል ተጎጂ እና መሰካክር ግልጋሎት ማሻሻል', 'ምምሕያሽ ንጉድኣት ገበንን መሰኻኽርን ዝወሃብ ግልጋሎት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1846, 'Not_Executed_Civil_Cases', 'Not Executed Civil Cases', 'የልተፈፀሙ የፍታብሔር መዝገቦች', 'ዘይተፈፀሙ ጉዳያት ፍትሃብሄር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1847, 'Execution_Process_Of_Civil_Cases', 'Execution Process Of Civil Cases', 'የፍታብሄር መዝገቦች የኣፈፃፀም ሂደት', 'ከይዲ ኣፈፃፀም ጉዳያት ፍትሃብሄር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1848, 'True_Witness', 'True Witness', 'እውነት የመሰከሩ', 'ሓቂ ዝመስከሩ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1849, 'Witness', 'Witness', 'ምስክር', 'ምስክር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1850, 'Remember', 'Remember', 'ማስታወስ/መጎብኘት', 'ምዝክካር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1851, 'Security', 'Security', 'ድህንነት', 'ድሕንነት', '2019-06-27 19:32:23', '2019-07-18 18:25:08'),
(1852, 'Above_3_Times', 'Above 3 Times', 'ከ3 ጊዜ በላይ', 'ልዕሊ 3 ግዘ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1853, '3_Times', '3 Times', '3 ግዜ', '3 ግዘ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1854, '2_Times', '2 Times', '2 ግዜ', '2 ግዘ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1855, '1_Time', '1 Time', '1 ግዜ', '1 ግዘ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1856, 'Should_Be_Paid', 'Should To Be Paid', 'መከፈል የነበራቸው', 'ክኽፈሉ ዝግቦኦም', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1857, 'Payment_Of_Allowance', 'Payment Of Allowance', 'የኣበል ክፍያ', 'ክፍሊት ኣበል', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1858, 'Witnessed_A_Lie_And_Accused', 'Witnessed A Lie And Accused', 'ዋሽተው ከመሰከሩ የተጠየቁ', 'ሓስዮም ካብ ዝተመስከሩ ዝተሓተቱ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1859, 'Witnessed_As_Is', 'Witnessed As Is', 'እንደ ክሱ የመሰከሩ', 'ከም ክሱ ዝመስከሩ', '2019-06-27 19:32:23', '2019-08-26 11:12:50'),
(1860, 'Challenged_Witnesses_Supported', 'Challenged And Supported Witnesses', 'ጫና ከደረሰባቸው ድጋፍ የተደረገላቸው', 'ተፅዕኖ ካብ ዝበፅሖም ድጋፍ ዝተገበረሎም', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1861, 'From_All_Witnesses_Secured_By_Follow_Up', 'From All Witnesses Secured By Follow Up', 'ከጠቅላላ ምስክሮች ድህንነታቸው በክትትል የተጠበቀ', 'ካበ ጠቅላላ መሰካክር ብክትትል ድሕንነቶም ዝተሓለወ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1862, 'Witnessed_Count', 'Witnessed Count', 'ቀርበው የመሰከሩ', 'ቀሪቦም ዝመስከሩ መሰካክር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1863, 'Needed_Witness_Count', 'Needed Witness Count', 'መቅረብ የነበረባቸው ምስክሮች', 'ክቐርቡ ዝግበኦም መሰካኽር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1864, 'Support', 'Support', 'ድጋፍ', 'ድጋፍ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1865, 'Type_Of_Support', 'Type Of Support', 'የድጋፍ ኣይነት', 'ዓይነት ድጋፍ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1866, 'Compensation', 'Compensation', 'ካሳ', 'ካሕሳ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1867, 'Money_Punishment', 'Money Punishment', 'የገንዘብ ቅጣት', 'ቅፅዓት ገንዘብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1868, 'Cancel_Deal', 'Cancel Deal', 'ውል እንዲሰረዝ', 'ውዕሊ ክስረዝ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1869, 'Execute_Deal', 'Execute Deal', 'ውል እንዲፈፀም', 'ውዕሊ ንክፍፀም', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1870, 'By_Arguement', 'By Arguement', 'በክርክር', 'ብክርክር', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1871, 'By_Negotiation', 'By Negotiation', 'በድርድር', 'ብድርድር', '2019-06-27 19:32:23', '2019-07-18 18:37:16'),
(1872, 'Rounded', 'Rounded', 'የዞረ', 'ዝዞረ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1873, 'Court_Decision_Type', 'Court Decision Type', 'የፍርድቤት የውሳኔ ኣይነት', 'ዓይነት ውሳነ  ቤትፍርዲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1874, 'Documents_Count', 'Documents Count', 'የመዝገብ ብዛት', 'በዝሒ  መዝገብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1875, 'Below_2_Times', 'Below 2 Times', 'ከ2 ግዜ በታች', 'ትሕቲ 2 ግዘ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1876, 'Below_1_Month', 'Below 1 Month', 'ከ 1 ወር በታች', 'ትሕቲ 1 ወርሒ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1877, 'Response', 'Response', 'መልስ', 'መልሲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1878, 'Accusal', 'Accusal', 'ክስ', 'ክሲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1879, 'Individual', 'Individual', 'ግለ ሰብ', 'ውልቀ ሰብ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1880, 'Lawyer', 'Lawyer', 'ኣቃቢ ህግ', 'ዓቃቢ ሕጊ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1881, 'Cases_In_Appointment', 'Cases In Appointment', 'በቆጠሮ ያለው', 'ኣብ ከይዲ ቆፀሮ ዘሎ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1882, 'Unable_To_Execute_And_Closed', 'Unable To Execute And Closed', 'መስፈፅሚያ ባለመገኘቱ የተዘጋ(ድህረ ክስ)', 'መፈፀሚተሳኢንዎተባሂሎምዝተዓፀወ (ድሕረክሲ)', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1883, 'Able_To_Execute_And_Executed', 'Able To Execute And Executed', 'ማስፈፀሚያ ንበረት ከተገኘላቸው የተፈፀሙ', 'መፈፀሚ ንብረት ካብ ዝተረኸቦ ዝተፈፀሙ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1884, 'Second_5_Years', 'Second 5 Years', 'የመጨረሻዎቹ 5 ኣመታት', 'ዳሕረዎት 5 ዓመታት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1885, 'First_5_Years', 'First 5 Years', 'የመጀመሪያዎቹ 5 ኣመታት', 'ቀዳሞት 5 ዓመታት', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1886, 'Executed_Civil_Case_Documents_Count', 'Executed Civil Case Documents Count', 'የተፈፀሙ ፍታብሄር መዛግብት ብዛት', 'በዝሒ ዝተፈፀሙ ፍታብሔር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1887, 'Allow_Action', 'Allow Action', 'ተግባር/ክንውን መፍቀጃ', 'ተግባር/ስራሕ መፍቀዲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1888, 'Not_Executed_Civil_Case_Documents_Count', 'Not Executed Civil Case Documents Count', 'ያልተፈፀሙ የፍታብሄር ጉዳይ መዝገቦች', 'ዘይተፈፀሙ ጉዳያት ፍትሃብሄር መዛግብቲ', '2019-06-27 19:32:23', '2019-06-27 19:32:23'),
(1889, 'Accusal_Document', 'Accusal Document', 'ክስ መዝገብ', 'ክሲ መዝገብ', '2019-06-27 20:20:17', '2019-06-27 20:20:17'),
(1890, 'Applicants', 'Applicants', 'ኣመልካቲ', 'ኣመልከትቲ', '2019-06-27 21:03:58', '2019-06-27 21:03:58'),
(1891, 'Applicant', 'Applicant', 'ኣመልከትቲ', 'ኣመልካቲ', '2019-06-27 21:04:38', '2019-06-27 21:04:38'),
(1892, 'Follow_Up_Approval_Lawyer_Date', 'Approval Date', 'የፀደቀበት ቀን', 'ዝፀደቐሉ ዕለት', '2019-06-27 21:05:59', '2019-06-27 21:05:59'),
(1893, 'Follow_Up_Approval_Lawyer_Name', 'Lawyer Name', 'የኣቃቢ ህግ ስም', 'ስም ዓቃቢ ሕጊ', '2019-06-27 21:07:31', '2019-06-27 21:07:31'),
(1894, 'Witness_Followed_Up_Date', 'Follow Up Date', 'የክትትል ቀን', 'ዕለት ክትትል', '2019-06-27 21:09:38', '2019-06-27 21:09:38'),
(1895, 'Tigray_Region_Justice_Bureau', 'Tigray Region Justice Bureau', 'የትግራይ ክልል ፍትህ ቢሮ', 'ቢሮ ፍትሒ ክልል ትግራይ', '2019-06-27 21:09:46', '2019-06-27 21:09:46'),
(1896, 'All_Rights_Reserved', 'All Rights Reserved', 'የቅጂ መብቱ በህገ የተጠበቀ ነው', 'ናይ ቅዳሕ መሰሉ ብሕጊ ዝተሓለወ እዩ', '2019-06-27 21:11:51', '2019-06-27 21:11:51'),
(1897, 'Developed_by_Pilasa_Technologies', 'Developed by Pilasa Technologies', 'በፒላሳ ቴክኖኖጂስ የተሰራ', 'ብፒላሳ ቴክኖሎጂስ ዝተሰርሐ', '2019-06-27 21:14:42', '2019-06-27 21:14:42'),
(1898, 'Followed_Up_Witness_Name', 'Witness Name', 'የምስክር ክትትል ስም', 'ሽም ክትትል ምስክር', '2019-06-27 21:21:42', '2019-06-27 21:21:42'),
(1899, 'Additional_Remark', 'Additional Remark', 'ተጨማሪ ማብራሪያ', 'ተወሳኺ መብርሂ', '2019-06-27 21:29:32', '2019-06-27 21:29:32'),
(1900, 'Witness_Not_Satisfied_Reason', 'Witness Not Satisfied Reason', 'ደስተኛ ያልሆነበት ምክንያት', 'ዘይዓገበሉ ምክንያት', '2019-06-27 21:33:15', '2019-06-27 21:33:15'),
(1901, 'In_Treatment_And_Human_Right', 'In Treatment And Human Right', 'የተጠርጣሪዎች/ተከሳሾች/ታራሚዎች ሰብአዊ መብት መከታተያ', 'ሰብኣዊ መሰላት ተጠርጠርቲ/ተኸሰስቲ/ተሃነፅቲ ምኽባር መከታተሊ', '2019-06-27 21:34:17', '2019-06-27 21:34:17'),
(1902, 'Witness_Satisfaction_Status', 'Satisfaction Status', 'የእርካታ ሁኔታ', 'ኩነታት ዕግበት', '2019-06-27 21:35:54', '2019-07-08 02:42:59'),
(1903, 'Witness_Not_Paid_Reason', 'Not Paid Reason', 'ያልተከፈለበት ምክንያት', 'ዘይተከፈለሉ ምክንያት', '2019-06-27 21:37:47', '2019-06-27 21:37:47'),
(1904, 'In_Information_Gathering', 'In Information Gathering', 'በመረጃ አሰባሰብ', 'ኣብ ኣተኣኻኽባ መረዳእታ', '2019-06-27 21:39:35', '2019-06-27 21:39:35'),
(1905, 'Refugee', 'Refugee', 'ስደተኛ', 'ስደተኛ/ተፈናቐል', '2019-06-27 21:41:02', '2019-06-27 21:45:48'),
(1906, 'Minority_Nation', 'Minority Nation', 'አናሳ ብሄር', 'ንእሽተይ ቁፅሪ ዘለዎ ብሄር', '2019-06-27 21:43:51', '2019-06-27 21:43:51'),
(1907, 'Ancient_Human', 'Ancient Human', 'የጥንት ሰው', 'ጥንታዊ ሰብ', '2019-06-27 21:47:27', '2019-06-27 21:47:27'),
(1908, 'Global_Nationality', 'Global Nationality', 'ዜግነት/አገር የሌለው', 'ዜግነት/ዓዲ ዘይብሉ', '2019-06-27 21:49:30', '2019-06-27 21:49:30'),
(1909, 'Crime_Victim', 'Crime Victim', 'የወንጀል ተጎጂ', 'ጉዱእ ገበን', '2019-06-27 21:50:31', '2019-06-27 21:50:31'),
(1910, 'Effective', 'Effective', 'ውጤታማ', 'ውፅኢታዊ/ተግባራዊ ዝኾነ', '2019-06-27 21:51:28', '2019-06-27 21:55:43'),
(1911, 'Not_Effective', 'Not Effective', 'ውጤታማ ያልሆነ', 'ውፅኢታዊ/ተግባራዊ ዘይኮነ', '2019-06-27 21:55:28', '2019-06-27 21:55:28'),
(1912, 'Advice_Of_Law', 'Advice Of Law', 'የህግ ምክር', 'ምኽሪ ሕጊ', '2019-06-27 21:57:29', '2019-06-27 21:57:29'),
(1913, 'Document_Preparation', 'Document Preparation', 'ፅሁፍ ማዘጋጀት', 'ምድላው ፅሑፍ', '2019-06-27 21:59:20', '2019-06-27 21:59:20'),
(1914, 'Accusal_Preparation', 'Accusal Preparation', 'ክስ/መልስ ማዘጋጀት', 'ምድላው ክሲ/መልሲ', '2019-06-27 22:00:14', '2019-06-27 22:00:14'),
(1915, 'Argument', 'Argument', 'ክርክር ማካሄድ', 'ምክያድ ክርክር', '2019-06-27 22:01:36', '2019-06-27 22:01:36'),
(1916, 'Search_by_Tekesasi_Name', 'Search by Tekesasi Name', 'በተከሳሽ ስም ፈልግ', 'ብሽም ተኸሳሲ ኣልሽ', '2019-07-03 18:52:07', '2019-07-03 18:52:07'),
(1917, 'New_Free_Law_Service', 'New Free Law Service', 'የህግ ነፃ እገዛ አገልግሎት', 'ግልጋሎት ነፃ ድጋፍ ሕጊ', '2019-07-03 21:28:42', '2019-07-03 21:28:42'),
(1918, 'New_Organization_Follow_Up_And_Support', 'New Organization Follow Up And Support', 'የመንግስታዊ ተቋማት  ክትትልና ድጋፍና', 'ክትትልን ድጋፍን ኣብያተ ዕዮ', '2019-07-03 21:51:14', '2019-07-03 21:51:14'),
(1919, 'Service_Type', 'Service Type', 'የኣገልግሎት ዓይነት', 'ዓይነት ግልጋሎት', '2019-07-03 21:52:32', '2019-07-03 21:52:32'),
(1920, 'Service_Requested_Date', 'Service Requested Date', 'የአገልግሎት ጥያቄ የቀረበበት ቀን', 'ሕቶ ግልጋሎት ዝቐረበሉ ዕለት', '2019-07-03 21:55:36', '2019-07-03 21:55:36'),
(1921, 'Service_Given_Date', 'Service Given Date', 'አገልግሎት የተሰጠበት ቀን', 'ግልጋሎት ዝተውሃበሉ ዕለት', '2019-07-03 21:56:33', '2019-07-03 21:56:33'),
(1922, 'Not_Quality_Service_Reason', 'Not Quality Service Reason', 'የጥራት ማነስ ምክንያት', 'ምኽንያት ጉድለት ፅሬት', '2019-07-03 21:58:05', '2019-07-03 21:58:05'),
(1923, 'Not_Effective_Service_Reason', 'Not Effective Service Reason', 'የውጤታማነት ማነስ ምክንያት', 'ምኽንያት ጉድለት ውፅኢታውነት', '2019-07-03 21:59:26', '2019-07-03 21:59:26'),
(1924, 'Not_Satisfied_Reason', 'Not Satisfied Reason', 'ያልረካበት ምክንያት', 'ዘይዓገበሉ ምኽንያት', '2019-07-03 22:01:39', '2019-07-03 22:01:39'),
(1925, 'Detail_Of_Glgalot_Request_And_Given', 'Detail Of Service Request And Given', 'ዝርዝር የተጠየቀ እና  የተሰጠ ይዘት አገልግሎት', 'ዝርዝር ትሕዝቶ ዝተሓተተን ዝተውሃበን ግልጋሎት', '2019-07-03 22:04:56', '2019-07-03 22:06:04'),
(1926, 'Glgalot_Given_By_Lawyer', 'Service Given By Lawyer', 'አገልግሎት የሰጠ ዓቃቤ ህግ ስም', 'ግልጋሎት ዝሃበ ዓቃቢ ሕጊ ሽም', '2019-07-03 22:07:59', '2019-07-03 22:07:59'),
(1927, 'Service_Given_By_Lawyer_Date', 'Service Given By Lawyer Date', 'አገልግሎት የሰጠበት ቀን', 'ግልጋሎት ዝሃበሉ ዕለት', '2019-07-03 22:16:03', '2019-07-03 22:16:03'),
(1928, 'Service_Approved_By_Leader', 'Service Approved By Leader', 'ያረጋገጠው ሃላፊ ስም', 'ዘረጋገፀ ቀረባ ሓላፊ ሽም', '2019-07-03 22:18:07', '2019-07-03 22:18:07'),
(1929, 'Service_Approved_By_Leader_Date', 'Service Approved By Leader Date', 'ያረጋገጠበት ቀን', 'ዘረጋገፀሉ ዕለት', '2019-07-03 22:35:30', '2019-07-03 22:35:30'),
(1930, 'Witness_Name', 'Witness Name', 'የምስክር ስም', 'ሽም ምስክር', '2019-07-04 18:32:04', '2019-07-04 18:32:04'),
(1931, 'Witness_Address', 'Witness Address', 'የምስክር አድራሻ', 'ምስክር ኣድራሻ', '2019-07-04 18:32:55', '2019-07-04 18:32:55'),
(1932, 'Witness_Age', 'Witness Age', 'የምስክር ዕድሜ', 'ናይ ምስክር ዕድመ', '2019-07-04 18:33:41', '2019-07-04 18:33:41'),
(1933, 'Witness_Gender', 'Witness Gender', 'የምስክር ፆታ', 'ናይ ምስክር ፆታ', '2019-07-04 18:34:23', '2019-07-04 18:34:23'),
(1934, 'Accuser_Relation', 'Accuser Relation', 'ከተበዳይ/ከሳሽ ጋር ያለው ግኑኝነት/ዝምድና', 'ምስ ተበዳሊ/ከሳሲ ዘለዎ ርክብ/ዝምድና', '2019-07-04 18:36:24', '2019-07-04 18:36:24'),
(1935, 'Defendant_Relation', 'Defendant Relation', 'ከተከሳሽ ጋር ያለው ግኑኝነት/ዝምድና', 'ምስ ተኸሳሲ/ት/ቲ ዘለዎ ርክብ/ዝምድና', '2019-07-04 18:38:10', '2019-07-04 18:38:10'),
(1936, 'Not_Remembered_Reason', 'Not Remembered Reason', 'ያልተስታወሰበት ምክንያት', 'ዘይተስታወሰሉ/ዘይተዘኻኸረሉ ምክንያት', '2019-07-04 18:39:37', '2019-07-04 18:39:37'),
(1937, 'Witness_Security_Types', 'Witness Security Types', 'የምስከር ደህንነት ጥበቃ ሁኔታ', 'ኩነታት ምሕላው ድሕንነት ምስክር', '2019-07-04 18:42:21', '2019-07-04 18:42:21'),
(1938, 'Not_Followed_Up_Reason', 'Not Followed Up Reason', 'ክትትል ያልተደረገበት ምክንያት', 'ክትትል ዘይተገበረሉ ምኽንያት', '2019-07-04 18:43:26', '2019-07-04 18:43:26'),
(1939, 'Witness_Not_Safe_Reason', 'Witness Not Safe Reason', 'ደህንነቱ ያልተጠበቀበት ምክንያት', 'ድሕንነቱ ዘይተሓለወሉ ምኽንያት', '2019-07-04 18:45:29', '2019-07-04 18:45:29'),
(1940, 'Date_For_Witness_Hearing', 'Date For Witness Hearing', 'የምስክር ቃል ለመስማት የተቀጠረበት ቀን', 'ምስክር ንምስማዕ ዝተቆፀረሉ ዕለት', '2019-07-04 18:47:11', '2019-07-04 18:47:11'),
(1941, 'Witness_Heared_Date', 'Witness Heared Date', 'ምስክር የመሰከረበት ቀን', 'ምስክር ዝመስከረሉ ዕለት', '2019-07-04 18:48:23', '2019-07-04 18:48:23'),
(1942, 'Witness_Appointment_Count', 'Witness Appointment Count', 'የምስክር መመላለስ ብዛት', 'በዝሒ ምልልስ ምስክር', '2019-07-04 18:49:54', '2019-07-04 18:49:54'),
(1943, 'Witness_Payment_Statuses', 'Witness Payment Statuses', 'የምስክር የክፍያ ሁኔታ', 'ኩነታት ክፍሊት ምስክር', '2019-07-04 18:51:08', '2019-07-04 18:51:08'),
(1944, 'Witness_Paid_Amount', 'Witness Paid Amount', 'የብር መጠን', 'መጠን ገንዘብ', '2019-07-04 18:52:49', '2019-07-04 18:52:49'),
(1945, 'Priority_Status', 'Priority Status', 'የቅድሚያ መስጠት ሁኔታ', 'ኩነታት ቀዳምነት ምሃብ', '2019-07-04 19:45:12', '2019-07-04 19:45:12'),
(1946, 'Priority_Deserved', 'Priority Deserved', 'ቅድሚያ መስጠት የሚገባው', 'ቀዳምነት ክወሃብ ዝግበኦ', '2019-07-04 19:47:39', '2019-07-04 19:47:39'),
(1947, 'Priority Not Given Reason', 'Priority Not Given Reason', 'ቅድሚያ ያልተሰጠበት ምክንያት', 'ቀዳምነት ዘይተውሃበሉ ምኽንያት', '2019-07-04 19:48:43', '2019-07-04 19:48:43'),
(1948, 'Priority_Not_Given_Reason', 'Priority Not Given Reason', 'ቅድሚያ ያልተሰጠበት ምክንያት', 'ቀዳምነት ዘይተውሃበሉ ምኽንያት', '2019-07-04 19:51:44', '2019-07-04 19:51:44'),
(1949, 'Service_Given_Party_Type', 'Service Given Party Type', 'ኣገልግሎት የተሰጠው አካል', 'ግልጋሎት ዝተውሃቦ ኣካል/ሰብ', '2019-07-04 19:54:31', '2019-07-04 19:54:31'),
(1950, 'Appeals', 'Appeals', 'ይግባይ ፋይሎች', 'ይግበኣኒ መዛግብቲ', '2019-07-04 20:41:53', '2019-07-04 20:41:53'),
(1951, 'Not_Supported_Reason', 'Not Supported Reason', 'እገዛ ያተደረገበት ምክንያት', 'ድጋፍ ዘይተገበረሉ ምኽንያት', '2019-07-04 21:07:20', '2019-07-04 21:07:20'),
(1952, 'Support_Status', 'Support Status', 'የእገዛ ሁኔታ', 'ኩነታት ድጋፍ', '2019-07-04 21:07:52', '2019-07-04 21:07:52'),
(1953, 'Impact_Status', 'Impact Status', 'የጫና ሁኔታ', 'ኩነታት ፅዕንቶ', '2019-07-04 21:08:31', '2019-07-04 21:08:31'),
(1954, 'Witness_Payablity', 'Witness Payablity', 'የምስክር ክፍያ ሁኔታ', 'ኩነታት ምኽፋል ምስክር', '2019-07-04 21:10:44', '2019-07-04 21:10:44'),
(1955, 'Witness_Not_Payable', 'Witness Not Payable', 'ሊከፈለው የማይገባው ምክንያት', 'ክኽፈሎ ዘይግበኦ ምኽንያት', '2019-07-04 21:12:31', '2019-07-04 21:12:31'),
(1956, 'Witness_Follow_Up_Name', 'Witness Follow Up Name', 'የምስክር ክትትል ስም', 'ክትትል ምስክር ሽም', '2019-07-04 21:57:57', '2019-07-04 21:57:57'),
(1957, 'Witness_Follow_Up_Date', 'Witness Follow Up Date', 'ቀን', 'ዕለት', '2019-07-04 21:58:30', '2019-07-04 21:58:30'),
(1958, 'Follow_Up_Approved_Lawyer_Name', 'Follow Up Approved Lawyer Name', 'ያረጋገጠው ዓቃቤ ህግ ስም', 'ዘረጋገፀ ዓቃቢ ሕጊ ሽም', '2019-07-04 21:59:37', '2019-07-04 21:59:37'),
(1959, 'Follow_Up_Approved_Lawyer_Date', 'Follow Up Approved Lawyer Date', 'ያረጋገጠበት ቀን', 'ዘረጋገፀሉ ዕለት', '2019-07-04 22:00:26', '2019-07-04 22:00:26'),
(1960, 'Witness_Not_Payable_Reason', 'Witness Not Payable Reason', 'ያልተከፈለው ምክንያት', 'ዘይተኽፈሎ ምኽንያት', '2019-07-04 22:01:54', '2019-07-04 22:01:54'),
(1961, 'Witness_Payment_Status', 'Witness Payment Status', 'የምስክር የክፍያ ሁኔታ', 'ኩነታት ክፍሊት ምስክር', '2019-07-04 22:02:52', '2019-07-04 22:02:52'),
(1962, 'Defendant_name', 'Defendant name', 'የተከሳሽ ስም', 'ሽም ተኸሳሲ', '2019-07-04 22:04:56', '2019-07-04 22:04:56'),
(1963, 'Unseen_Appeal', 'Unseen Appeal', 'ያልታየ ይግባኝ', 'ዘይተርኣየ ይግባይ', '2019-07-05 08:20:52', '2019-07-05 08:20:52'),
(1964, 'New_Appeals', 'New Appeals', 'ይግባኝ', 'ይግበኣኒ', '2019-07-05 08:24:42', '2019-07-05 08:24:42'),
(1965, 'Search_by_Defendant_Name', 'Search by Defendant Name', 'በተከሳሽ ስም ፈልግ', 'ብሽም ተኸሳሲ ኣልሽ', '2019-07-05 08:36:43', '2019-07-05 08:36:43'),
(1966, 'Search_By_Level', 'Search By Level', 'በደረጃ ፈልግ', 'ብብርኪ ኣልሽ', '2019-07-05 20:29:22', '2019-07-18 18:41:12'),
(1967, 'Total_Accusal_Documents', 'Total Accusal Documents', 'የወንጀል መዛግብት ብዛት', 'በዝሒ ገበን መዛግብቲ', '2019-07-11 17:39:47', '2019-08-05 17:39:06'),
(1968, 'Not_Decided_Documents', 'Not Decided Documents', 'ውሳኔ ያላገኙ መዛግብት', 'ውሳነ ዘይረከቡ መዛግብቲ', '2019-07-11 17:51:17', '2019-07-11 17:51:17'),
(1969, 'Total_Not_Decided_Accusal_Documents', 'Total Not Decided Accusal Documents', 'ውሳኔ ያላገኙ የወንጀል መዛግብት ብዛት', 'በዝሒ ውሳነ ዘይረኸቡ ገበን መዛግብቲ', '2019-07-11 17:52:55', '2019-08-05 17:39:06'),
(1970, 'Appeal_Accusal_Documents', 'Appeal Accusal Documents', 'ይግባኝ የወንጀል መዛግብት', 'ይግበኣኒ ገበን መዛግብቲ', '2019-07-11 17:59:14', '2019-08-05 17:39:06'),
(1971, 'Total_Appeal_Accusal_Documents', 'Total Appeal Accusal Documents', 'ይግባኝ የወንጀል መዛግብት ብዛት', 'በዝሒ ይግበኣኒ ገበን መዛግብቲ', '2019-07-11 18:00:39', '2019-08-05 17:39:06'),
(1972, 'Closed_Accusal_Documents', 'Closed Accusal Documents', 'የተዘጉ የወንጀል መዛግብት', 'ዝተዓፀው ገበን መዛግብቲ', '2019-07-11 18:02:20', '2019-07-11 18:02:20'),
(1973, 'Total_Closed_Accusal_Documents', 'Total Closed Accusal Documents', 'የተዘጉ የወንጀል መዛግብት ብዛት', 'በዝሒ ዝተዓፀው ገበን መዛግብቲ', '2019-07-11 18:03:17', '2019-08-05 17:39:06'),
(1974, 'September', 'September', 'መስከረም', 'መስከረም', '2019-07-11 18:18:13', '2019-07-11 18:18:13'),
(1975, 'October', 'October', 'ጥቅምት', 'ጥቅምቲ', '2019-07-11 18:18:40', '2019-07-11 18:18:40'),
(1976, 'November', 'November', 'ህዳር', 'ሕዳር', '2019-07-11 18:19:00', '2019-07-11 18:19:00'),
(1977, 'December', 'December', 'ታህሳስ', 'ታሕሳስ', '2019-07-11 18:19:19', '2019-07-11 18:19:19'),
(1978, 'January', 'January', 'ጥር', 'ጥሪ', '2019-07-11 18:19:34', '2019-07-11 18:19:34'),
(1979, 'February', 'February', 'የካቲት', 'ለካቲት', '2019-07-11 18:19:51', '2019-07-11 18:19:51'),
(1980, 'March', 'March', 'መጋቢት', 'መጋቢት', '2019-07-11 18:20:14', '2019-07-11 18:20:14'),
(1981, 'April', 'April', 'ሚያዝያ', 'ሜያዚያ', '2019-07-11 18:20:40', '2019-07-11 18:20:40'),
(1982, 'May', 'May', 'ጉንበት', 'ጉንበት', '2019-07-11 18:21:32', '2019-07-11 18:21:32'),
(1983, 'June', 'June', 'ሰኔ', 'ሰነ', '2019-07-11 18:21:51', '2019-07-11 18:21:51'),
(1984, 'July', 'July', 'ሐምሌ', 'ሓምለ', '2019-07-11 18:25:27', '2019-07-11 18:25:27'),
(1985, 'August', 'August', 'ነሐሴ', 'ነሓሰ', '2019-07-11 18:25:56', '2019-07-11 18:25:56'),
(1986, 'Crime_Commited_Date', 'Crime Commited Date', 'ወንጀል የተፈፀመለት ቀን', 'ገበን ዝተፈፀመሉ ዕለት', '2019-07-15 12:37:07', '2019-07-15 12:37:07'),
(1987, 'Crime_Location', 'Crime Location', 'ወንጀል የተፈፀመለት ቦታ', 'ገበን ዝተፈፀመሉ ቦታ', '2019-07-15 12:39:19', '2019-07-15 12:39:19'),
(1988, 'Civil_Case_Documents', 'Civil Case Documents', 'የፍታብሄር መዛግብት ብዛት', 'በዝሒ ፍታብሄር መዝገብ', '2019-07-15 16:48:07', '2019-08-05 17:39:06'),
(1989, 'Total_Not_Decided_Civil_Case_Documents', 'Total Not Decided Civil Case Documents', 'ውሳኔ ያልተሰጣቸው የፍሓብሄር መዛግብት', 'ውሳነ ዘይረኸቡ ፍታብሄር መዛግብቲ', '2019-07-15 16:49:30', '2019-07-15 16:49:30'),
(1990, 'Total_Appeal_Civil_Case_Documents', 'Total Appeal Civil Case Documents', 'ይግባኝ ፍትሓብሄር መዛግብት ብዛት', 'በዝሒ ይግበኣኒ ፍታብሄር መዛግብቲ', '2019-07-15 16:50:51', '2019-08-05 17:40:52'),
(1991, 'Closed_Civil_Case_Documents', 'Closed Civil Case Documents', 'የተዘጉ የፍትሓብሄር መዛግብት', 'ዝተዓፀዉ ፍታብሄር መዛግብቲ', '2019-07-15 16:52:13', '2019-07-15 16:52:13'),
(1992, 'Directorate', 'Directorate', 'ዳይሬክቶሬት', 'ዳይሬክቶሬት', '2019-07-18 18:05:49', '2019-07-18 18:05:49'),
(1993, 'On_Punishment', 'On Punishment', 'በ ቅጣት', 'ኣብ ቅፅዓት', '2019-07-22 09:46:17', '2019-07-22 10:20:38'),
(1994, 'On_Free', 'On Free', 'በ ነፃ', 'ኣብ ነፃ', '2019-07-22 09:46:47', '2019-07-22 10:19:53'),
(1995, 'Winning_Status_Of_Crime_Documents_Appealed_By_Individual_On_Punishment', 'Winning Status Of Crime Documents Appealed By Individual On Punishment', 'በጥፋት/ሌሎች በግለሰብ የቀረበ ይግባኝ ኣሸናፊነት ሁኔታ', 'ኣብ ጥፍኣት/ካልእ ብውልቀ ዝቐረበ ምርታዕ ይግባኣኒገበን መዝገብ', '2019-07-25 05:07:00', '2019-07-25 05:07:00'),
(1996, 'Winning_Status_Of_Crime_Documents_Appealed_By_Lawyer_On_Punishment', 'Winning Status Of Crime Documents Appealed By Lawyer On Punishment', 'በጥፋት/ሌሎች በኣቃቢ ህግ የቀረበ ይግባኝ ኣሸናፊነት ሁኔታ', 'ኣብ ጥፍኣት/ካልእ ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ይግባኣኒ ገበን መዝገብ', '2019-07-25 05:11:08', '2019-07-25 05:11:08'),
(1997, 'Court_Amount', 'Court Amount', 'ፍርድቤት የወሰነው ብዛት', 'ቤትፍርዲ ዝወሰኖ መጠን', '2019-07-26 10:34:50', '2019-07-26 10:34:50'),
(1998, 'Accuser_Value_In_Money', 'Accuser Value In Money', 'የከሳሽ ግምት መጠን', 'ከሳሲ ዝገመቶ መጠን', '2019-07-26 10:37:11', '2019-07-26 10:37:11'),
(1999, 'House', 'House', 'ቤት', 'ገዛ', '2019-07-26 10:37:28', '2019-07-26 10:37:28'),
(2000, 'Land', 'Land', 'መሬት', 'መሬት', '2019-07-26 10:37:47', '2019-07-26 10:37:47'),
(2001, 'Property', 'Property', 'ንብረት', 'ንብረት', '2019-07-26 10:38:07', '2019-07-26 10:38:07'),
(2002, 'Inherit', 'Inherit', 'የውርስ ክርክር', 'ውርሲ ክርክር', '2019-07-26 10:38:46', '2019-07-26 10:38:46'),
(2003, 'Punishments', 'Punishments', 'ቅጣት', 'ቅፅዓት', '2019-07-27 20:05:22', '2019-07-27 20:05:22'),
(2004, 'Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Lawyer_On_Free', 'Winning Status Of Breaking Crime Documents Appealed By Lawyer On Free', 'በነፃ በኣቃቢ ሕግ የቀረበ ሰበር የወንጀል መዝገብ ኣሸናፊነት ሁኔታ', 'ኣብ ነፃ ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ሰበር ገበን መዝገብ', '2019-07-28 05:58:35', '2019-07-28 05:58:35'),
(2005, 'Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Lawyer_On_Punishment', 'Winning Status Of Breaking Crime Documents Appealed By Lawyer On Punishment', 'በጥፋት/ሌሎች በኣቃቢ ህግ የቀረበ ሰበር ኣሸናፊነት ሁኔታ', 'ኣብ ጥፍኣት/ካልእ ብዓቃቢ ሕጊ ዝቐረበ ምርታዕ ሰበር ገበን መዝገብ', '2019-07-28 06:01:35', '2019-07-28 06:01:35'),
(2006, 'Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Individual_On_Free', 'Winning Status Of Breaking Crime Documents Appealed By Individual On Free', 'በነፃ በግለሰብ የቀረበ ሰበር የወንጀል መዝገብ ኣሸናፊነት ሁኔታ', 'ኣብ ነፃ ብውልቀ ዝቐረበ ምርታዕ ሰበር ገበን መዝገብ', '2019-07-28 06:05:22', '2019-07-28 06:05:22'),
(2007, 'Winning_Status_Of_Breaking_Crime_Documents_Appealed_By_Individual_On_Punishment', 'Winning_Status_Of_BreakingCrime Documents Appealed By Individual On Punishment', 'በጥፋት/ሌሎች በግለሰብ የቀረበ ሰበር የወንጀል መዝገብ ኣሸናፊነት ሁኔታ', 'ኣብ ጥፍኣት/ካልእ ብውልቀ ዝቐረበ ምርታዕ ሰበር ገበን መዝገብ', '2019-07-28 06:07:12', '2019-07-28 06:07:12'),
(2008, 'From_Total_Heavy_Weight_Doucuments', 'From Total Heavy Weight Doucuments', 'ከአጠቃላይ ከባድ መዛግብት ብዛት', 'ካብ ጠቅላላ በዝሒ ከቢድ መዝገብ', '2019-07-28 12:24:18', '2019-07-28 12:24:18'),
(2009, 'From_Heavy_Weight_Document_Followed_For_Legality', 'From Heavy Weight Document Followed For Legality', 'ከከባድ መዝገብ ህጋዊነቱ ክትትል የተደረገበት', 'ካብ ከቢድ መዝገብ ሕጋውነቱ ክትትል ዝተገበረሉ', '2019-07-28 12:32:02', '2019-07-28 12:32:02'),
(2010, 'Accuser/Victim', 'Accuser/Victim', 'ከሳሽ/ተበዳይ', 'ከሳሲ/ተበዳሊ', '2019-07-28 13:02:50', '2019-07-28 13:02:50'),
(2011, 'Total_Accused_Document_Count', 'Total Accused Document Count', 'ክስ የተመሰረተበት መዝገብ ብዛት', 'በዝሒ ክሲ ዝተመስረተሉ መዝገብ', '2019-07-28 13:30:54', '2019-07-28 13:30:54'),
(2012, 'Compensation_Decision', 'Compensation Decision', 'የካሳ ውሳኔ', 'ካሕሳ ውሳነ', '2019-07-28 13:38:44', '2019-07-28 13:38:44'),
(2013, 'Total_Accused_Documents_and_Decided_Document', 'Total Accused Documents and Decided Document', 'ክስ የተመሰረተባቸውና መልስ የተሰጠባቸውና የተወሰኑ መዛግብት', 'በዝሒ ክሲ ዝተመስረተሎምን መልሲ ዝተውሃበሎምን ዝተወሰኑ መዛግብቲ', '2019-07-28 13:54:43', '2019-07-28 13:54:43'),
(2014, 'Decided_Above_1_to_3_Months', 'Decided Above 1 to 3 Months', 'ከ 1 - 3 ወር የተወሰኑ', 'ልዕሊ 1 - 3 ወርሒ ዝተወሰኑ', '2019-07-28 14:39:43', '2019-07-28 14:39:43'),
(2015, 'Unable_To_Execute(Pre_Accusal)', 'Unable To Execute(Pre Accusal)', 'ማስፈፀሚያ ንብረት የሌለው(ከክስ በፊት)', 'መፈፀሚንብረትዘይብሉ (ቅድመክሲ)', '2019-07-28 17:40:55', '2019-07-28 17:40:55'),
(2016, 'Closed_Due_To_Lack_Of_Full_Information', 'Closed Due To Lack Of Full Information', 'ብቁ መረጃ ስለሌላቸው የተዘጉ', 'ብቁዕ መረዳእታ ስለዘይብሎም ዝተዓፀው', '2019-07-28 18:37:24', '2019-07-28 18:37:24'),
(2017, 'Closed_Wile_Crime_Commited', 'Closed_Wile_Crime_Commited', 'ተጨባጭ ወንጀል ተፈፅማ እያለ የተዘጋ', 'ጭቡጥ ገበን ተፈፂሙ እናሃለወ ዝተዓፀወ', '2019-07-28 18:50:41', '2019-07-28 18:50:41'),
(2018, 'Closed_While_Crime_Not_Commited_or_Suspected', 'Closed While Crime Not Commited or Suspected', 'ተጨባጭ ወንጀል ያልተፈፀመበት ወይም የሚያጠራጥር ሆኖ የተዘጋ', 'ጭቡጥ ገበን ዘይተፈፀመሉ ወይ ዘጠራጥር ኮይኑ ዝተዓፀወ', '2019-07-28 18:54:11', '2019-07-28 18:54:11'),
(2019, 'From_Closed_Activated_Record', 'From Closed Activated Record', 'ከተዘጋ የተንቀሳቀሰ', 'ካብ ዝተዓፀወ ዝተንቀሳቀሰ', '2019-07-28 18:55:46', '2019-07-28 18:55:46'),
(2020, 'Total_Document_New_and_Recycled', 'Total Document New and Recycled', 'የመዝገብ ብዛት(የዞረና አዲስ)', 'በዝሒ መዝገብ (ዝዞረን ሓዱሽን)', '2019-07-28 19:34:43', '2019-07-28 19:34:43'),
(2021, 'Quality_Of_Idea_or_Decision', 'Quality Of Idea or Decision', 'ጥራት መንሻ ሃሳብ/ውሳኔ', 'ፅሬት ምልዓል ሓሳብ/ውሳነ', '2019-07-28 19:35:59', '2019-07-28 19:35:59'),
(2022, 'Decided_Document_by_Other_Reason', 'Decided Document by Other Reason', 'በሌላ ምክንያት ተንስቶ ውሳኔ የተሰጠው መዝገብ', 'ብካልእ ምኽንያት ተላዒሉ ውሳነ ዝተውሃበሉ መዝገብ', '2019-07-28 19:38:23', '2019-07-28 19:38:23'),
(2023, 'No_Defendant', 'No Defendant', 'ተከሳሽ በማጣት', 'ተኸሳሲ ብምስኣን', '2019-07-28 19:39:17', '2019-07-28 19:39:17'),
(2024, 'No_Witness', 'No Witness', 'ምስክር በማጣት', 'ምስክር ብምስኣን', '2019-07-28 19:39:59', '2019-07-28 19:39:59'),
(2025, 'by_Other_Reason', 'by Other Reason', 'በሌላ ምክንያት', 'ብካልእ ምኽንያት', '2019-07-28 19:40:55', '2019-07-28 19:40:55'),
(2026, 'Total_Accused_Document_Recycled_and_New', 'Total Accused Document Recycled and New', 'ክስ የተመሰረተበት ብዛት(የዞረና አዲስ)', 'በዝሒ ክሲ ዝተመስረተሉ (ዝዞረን ሓዱሽን)', '2019-07-28 19:51:50', '2019-07-28 19:51:50'),
(2027, 'From_Allowed_Not_Presented', 'From Allowed Not Presented', 'ከተፈቀደ ያልቀረቡ', 'ካብ ዝተፈቀደ ዘይቀረቡ', '2019-07-28 20:14:34', '2019-07-28 20:14:34'),
(2028, 'Human_Rights_of_Suspected/Accused', 'Human Rights of Suspected/Accused', 'የተጠርጣሪዎች/ተከሳሾች  የሰብኣዊ መብት ኣያያዝ', 'ሰብኣዊ መሰል ተጠርጠርቲ/ተኸሰስቲ ምኽባር', '2019-07-29 02:38:58', '2019-07-29 02:38:58'),
(2029, 'Human_Rights_in_Prison', 'Human Rights in Prison', 'የታራሚዎች የሰብኣዊ መብት ኣያያዝ', 'ሰብኣዊ መሰል ተሃነፅቲ ምኽባር', '2019-07-29 02:40:34', '2019-07-29 02:40:34'),
(2030, 'Defendant_Not_Presented', 'Defendant Not Presented', 'ተከሳሽ በሌለበት', 'ተኸሳሲ ብዘየለሉ', '2019-07-29 08:17:38', '2019-07-29 08:17:38'),
(2031, 'Recognition', 'Recognition', 'የምስክርነት እውቅና(የምስጋና ወረቀት)', 'ኣፍልጦ ምስክርነት (ወረቐት ምስጋና)', '2019-07-29 10:06:48', '2019-07-29 10:06:48'),
(2032, 'Not_Available_Reason', 'Not Available Reason', 'ያልቀረበበት ምክንያት', 'ዘይቀረበሉ ምኽንያት', '2019-07-29 10:11:07', '2019-07-29 10:11:07'),
(2033, 'Waited_Time_In_Days', 'Waited Time In Days', 'የቆየበት ጊዜ በቀን', 'ዝፀንሐሉ ግዜ ብመዓልቲ', '2019-07-29 10:15:31', '2019-07-29 10:15:31'),
(2034, 'Commentator_Police_Name_or_Other', 'Commentator Police Name or Other', 'አስተያየት የተሰጠው ስም ፖሊስ/ሌላ', 'ርኢቶ ዝተውሃቦ ሽም ፖሊስ/ካልእ', '2019-07-29 10:39:29', '2019-07-29 10:39:29'),
(2035, 'Witness_Back_Forth_Count', 'Witness Back Forth Count', 'የመዝገብ ቀጠሮ ጊዜ ብዛት', 'በዝሒ ግዜ ቆፀሮ መዝገብ', '2019-07-29 11:48:45', '2019-07-29 11:48:45'),
(2036, 'Date_Of_Decision', 'Date Of Decision', 'ፍርድ የተሰጠበት ቀን', 'ፍርዲ ዝተውሃበሉ ዕለት', '2019-07-29 11:53:32', '2019-07-29 11:53:32'),
(2037, 'Address_of_Prison', 'Address of Prison', 'የማረሚያ ቤት አድራሻ (ስም)', 'ኣድራሻ (ሽም) ቤት ህንፀት', '2019-07-29 11:54:53', '2019-07-29 11:54:53'),
(2038, 'End_Of_Investigation_Date', 'End Of Investigation Date', 'ማጣራት ያለቀበት ቀን', 'ምፅራይ ዝተወደአሉ ዕለት', '2019-07-29 12:17:40', '2019-07-29 12:20:46'),
(2043, 'Voilence_Type', 'Voilence Type', 'የተፈፀመ ጥሰት ካላ የጥሰቱ አይነት (በምልክት)', 'ጥሕሰት ዝተፈፀመ እንተሃልዩ ዓይነት እቲ ጥሕሰት (ብምልክት)', '2019-07-29 12:29:01', '2019-07-29 12:29:01'),
(2039, 'Followed_Up_Lawyer', 'Followed Up Lawyer', 'ክትትል ያደረገ አቃቤ ህግ ስም', 'ክትትል ዝገበረ ዓቃቢ ሕጊ ሽም', '2019-07-29 12:20:51', '2019-07-29 12:20:51'),
(2040, 'Approved_By_Officer', 'Approved By Officer', 'ያረጋገጠ የቅርብ ሃላፊ ስም', 'ዘረጋገፀ ቀረባ ሓላፊ ሽም', '2019-07-29 12:22:09', '2019-07-29 12:22:09'),
(2041, 'Date_Of_Appoval', 'Date Of Appoval', 'ያረጋገጠበት ቀን', 'ዘረጋገፀሉ ዕለት', '2019-07-29 12:23:11', '2019-07-29 12:23:11'),
(2042, 'Comment_On_Legality(Quality)_Of_Investigation', 'Comment On Legality(Quality) Of Investigation', 'አስተያየት ህጋዊነት (ጥራት) ማጣራት', 'ርኢቶ ሕጋዊነት (ፅሬት) ምፅራይ', '2019-07-29 12:25:28', '2019-07-29 12:25:28'),
(2044, 'Voilence_Of_Human_Right_Protection', 'Voilence Of Human Right Protection', 'በአያያዝና ሰብአዊ መብት ተከሳሽ', 'ኣብ ኣተሓሕዛ ምኽባር ሰብኣዊ መሰላትን ተኸሳሲ/ት/ቲ', '2019-07-29 12:38:07', '2019-07-29 12:38:07'),
(2045, 'Voilence_Of_Information_Gathering', 'Voilence Of Information Gathering', 'በመረጃ አሰባሰብ/አያያዝ', 'ኣብ ኣተኣኻኽባ/ኣተሓሕዛ መረዳእታ', '2019-07-29 12:39:24', '2019-07-29 12:39:24'),
(2046, 'Voilence_Of_Other_Types_Of_Investigation', 'Voilence Of Other Types Of Investigation', 'በሌላ ስራዎች ማጣራት', 'ኣብ ካልእ ስራሕቲ ምፅራይ', '2019-07-29 12:40:53', '2019-07-29 12:40:53'),
(2047, 'Satisfaction', 'Satisfaction', 'እርካታ', 'ዕግበት', '2019-07-29 12:42:17', '2019-07-29 12:42:17'),
(2048, 'Followed_Up', 'Followed Up', 'ክትትል የተደረገለት', 'ክትትል ዝተገበረሉ', '2019-07-29 16:01:40', '2019-07-29 16:01:40'),
(2049, 'Not_Followed_Up', 'Not Followed Up', 'ክትትል ያልተደረገለት', 'ክትትል ዘይተገበረሉ', '2019-07-29 16:02:22', '2019-07-29 16:02:22'),
(2050, 'Followed_Up_Status', 'Followed Up Status', 'የኣቃቢ ህግ ክትትል ሁኔታ', 'ኩነታት ዓቃቢ ሕጊ ክትትል', '2019-07-29 16:03:38', '2019-07-29 16:03:38'),
(2051, 'Followed_Lawyer_Name', 'Followed Lawyer Name', 'ክትትል ያደረገ ዓቃቤ ሕግ', 'ክትትል ዝገበረ ዓቃቢ ሕጊ', '2019-07-29 16:06:32', '2019-07-29 16:06:32'),
(2052, 'Documents_Counter_In_Graph', 'Documents Counter In Graph', 'የመዛግብት ብዛት የሚያሳይ ግራፍ', 'በዝሒ መዛግብቲ ዘርኢ ግራፍ', '2019-07-30 13:14:06', '2019-07-30 13:14:06'),
(2053, 'Not_Avaliable', 'Not Avaliable', 'ብሌለበት', 'ኣብ ዘየለሉ', '2019-08-04 08:04:24', '2019-08-04 08:13:17'),
(2054, 'Court_Number', 'Court Number', 'የፍርድ ቤት መዝገብ ቁጥር', 'ቤት ፍርዲ መዝገብ ቑፅሪ', '2019-08-04 08:27:27', '2019-08-04 08:27:27'),
(2055, 'Fax', 'Fax', 'ፋክስ', 'ፋክስ', '2019-08-05 08:31:51', '2019-08-05 08:31:51'),
(2056, 'Auto_Generated_Document_Number', 'Auto Generated Document Number', 'የተሰጠ የመዝገብ ቁጥር', 'ዝተውሃበ ቁፅሪ መዝገብ', '2019-08-05 09:21:57', '2019-08-05 09:21:57'),
(2057, 'Lawyer_Won_Crime_Documents', 'Lawyer Won Crime Documents', 'ኣቃቤ ህግ ያሸነፈባቸው የወንጀል መዛግብት', 'በዝሒ ዓቃቢ ሕጊ ዝረትዐሎም ገበን መዛግብቲ', '2019-08-05 17:15:51', '2019-08-05 17:15:51'),
(2058, 'Lawyer_Won_Civil_Case_Documents', 'Lawyer Won Civil Case Documents', 'ኣቃቤ ህግ ያሸነፈባቸው የፍታብሄር መዛግብት', 'በዝሒ ዓቃቢ ሕጊ ዝረትዐሎም ፍታብሄር መዛግብቲ', '2019-08-05 17:17:29', '2019-08-05 17:17:29'),
(2059, 'Lawyer_Accused_Crime_Documents', 'Lawyer Accused Crime Documents', 'ክስ የተመሰረተባቸው የወንጀል መዛግብት ብዛት', 'በዝሒ ክሲ ዝተመስረተሎም ገበን መዛግብቲ', '2019-08-05 17:25:44', '2019-08-05 17:25:44'),
(2060, 'Lawyer_Accused_Civil_Case_Documents', 'Lawyer Accused Civil Case Documents', 'ክስ የተመሰረተባቸው የፍታብሄር መዛግብት ብዛት', 'በዝሒ ክሲ ዝተመስረተሎም ፍታብሄር መዛግብቲ', '2019-08-05 17:26:47', '2019-08-05 17:26:47'),
(2061, 'Supported_Appeal_Crime_Documents', 'Supported Appeal Crime Documents', 'በኣቃቤ ህግ የተደገፉ ይግባኝ ፍታብሄር መዛግብት', 'ብዓቃቢ ሕጊ ዝተደገፉ ይግበኣኒ ገበን መዛግብቲ', '2019-08-05 17:28:24', '2019-08-05 17:32:55'),
(2062, 'Supported_Appeal_Civil_Case_Documents', 'Supported Appeal Civil Case Documents', 'በኣቃቤ ህግ የተደገፉ ይግባኝ ፍታብሄር መዛግብት', 'ብዓቃቢ ሕጊ ዝተደገፉ ይግበኣኒ ፍታብሄር መዛግብቲ', '2019-08-05 17:29:22', '2019-08-05 17:29:22'),
(2063, 'Lawyer_Won_Appeal_Crime_Documents', 'Lawyer Won Appeal Crime Documents', 'ኣቃቤ ህግ ያሸነፈባቸው ይግባኝ የወንጀል መዛግብት', 'ዓቃቢ ሕጊ ዝረትዐሎም ይግበኣኒ ገበን መዛግብቲ', '2019-08-05 17:30:47', '2019-08-05 17:32:55'),
(2064, 'Lawyer_Won_Appeal_Civil_Case_Documents', 'Lawyer Won Appeal Civil Case Documents', 'ኣቃቤ ህግ ያሸነፈባቸው ይግባኝ የፍታብሄር መዛግብት', 'ዓቃቢ ሕጊ ዝረትዐሎም ይግበኣኒ ፍታብሄር መዛግብቲ', '2019-08-05 17:31:59', '2019-08-05 17:31:59'),
(2065, 'Document_Activation_Date', 'Document Activation Date', 'መዝገብ የተንቀሳቀሰበት ቀን', 'መዝገብ ዝተንቀሳቀሰሉ ዕለት', '2019-08-05 17:52:26', '2019-08-05 17:52:26'),
(2066, 'New_Customer_Complain', 'New Customer Complain', 'ኣዲስ ኣቤቱታ', 'ሓድሽ ጥርዓን', '2019-08-09 14:18:09', '2019-08-09 14:21:44'),
(2067, 'Customer_Complains', 'Customer Complains', 'በተገልጋዮች የሚቀርብ ኣቤቱታ', 'ብተገልገልቲ ዝቐርብ ጥርዓን', '2019-08-09 14:20:17', '2019-08-09 14:21:44'),
(2068, 'Request_Number', 'Request Number', 'የኣቤቱታ ቁጥር', 'ቁፅሪ ጥርዓን', '2019-08-09 14:28:36', '2019-08-09 14:28:36'),
(2069, 'Requested_To', 'Requested To', 'ወድ', 'ናብ', '2019-08-09 14:28:56', '2019-08-09 14:28:56'),
(2070, 'Responded_By', 'Responded By', 'መልስ የሰጠ ኣካል', 'ምላሽ ዝሃበ ኣካል', '2019-08-09 14:30:34', '2019-08-09 14:30:34'),
(2071, 'Can_Complain_To', 'Can Complain To', 'በምላሽ ካልተደሰቱ ኣቤቱታ የሚያቀርቡለት ኣካል', 'ብምላሽ ተዘይዓጊቡ ጥርዓን ከቅርበሉ ዝክእል ኣካል', '2019-08-09 14:34:24', '2019-08-09 16:22:59'),
(2072, 'Compaint_Name', 'Compaint Name', 'ኣቤቱታ ኣቅራቢ ስም', 'ሽም ጠራዒ', '2019-08-09 14:35:09', '2019-08-09 14:35:09'),
(2073, 'Complained_To_Party', 'Complained To Party', 'ኣቤቱታ የቀረበበት ኣካል', 'ጥርዓን ዝቐረበሉ ኣካል', '2019-08-09 14:37:30', '2019-08-09 14:37:30'),
(2074, 'Complain_Type', 'Complain Type', 'የኣቤቱታ ኣይነት', 'ዓይነት ጥርዓን', '2019-08-09 14:38:02', '2019-08-09 14:38:02'),
(2075, 'Response_Type', 'Response Type', 'የምላሽ ኣይነት', 'ዓይነት ምላሽ', '2019-08-09 14:38:47', '2019-08-09 14:38:47'),
(2076, 'Efficiency_In_Time', 'Efficiency In Time', 'ቅልጥፍና', 'ሰለጤን ብግዘ', '2019-08-09 14:41:01', '2019-08-09 15:05:27'),
(2077, 'Full_Information_Not_Found', 'Full Information Not Found', 'የተሟላ መረጃ ባለመቅረቡ', 'ዝተማልአ ሓበሬታ/መረዳእታ ስለዘይቀረበ', '2019-08-09 14:46:49', '2019-08-09 14:46:49'),
(2078, 'Not_Done_Right', 'Not Done Right', 'በትክክል ስላልተሰራ', 'ብትኽኽል ስለዘይተሰርሐ', '2019-08-09 14:48:00', '2019-08-09 14:48:00'),
(2079, 'New_Situation_Happened', 'New Situation Happened', 'ኣዲስ ሁኔታ ስለተፈጠረ', 'ሓድሽ ኩነታት ስለዘጋጠመ', '2019-08-09 14:49:09', '2019-08-09 14:49:09'),
(2080, 'In_Progress', 'In Progress', 'በሂደት ላይ ያለው', 'ኣብ ከይዲ ዘሎ', '2019-08-09 14:49:51', '2019-08-09 14:49:51'),
(2081, 'Is_Unable_To_Be_Executed', 'Is Unable To Be Executed', 'ሊፈፀም የማይችል በመሆኑ', 'ክፍፀም ዘይክእል ብምዃኑ', '2019-08-09 14:51:09', '2019-08-09 14:51:09'),
(2082, 'Not_Reached', 'Not Reached', 'ስላልተገኘ', 'ስለዝተስኣነ', '2019-08-09 14:52:06', '2019-08-09 14:52:06'),
(2083, 'Not_Ordered', 'Not Ordered', 'ስላልታዘዘ', 'ስለዘይተኣዘዘ', '2019-08-09 14:52:58', '2019-08-09 14:52:58'),
(2084, 'Came_Delayed', 'Came Delayed', 'ዘግይቶ ስለመጣ', 'ደንጉዩ ስለዝመፀ', '2019-08-09 14:54:28', '2019-08-09 14:54:28'),
(2085, 'Not_Voluntary', 'Not Voluntary', 'ኣሻፈረኝ ስላለ', 'ስለዝኣበየ', '2019-08-09 14:56:10', '2019-08-09 14:56:10'),
(2086, 'No_Need_To_Follow_Up', 'No Need To Follow Up', 'ክትትል ስለማያስፈልገው', 'ክትትል ስለዘየድልዮ', '2019-08-09 14:57:11', '2019-08-09 14:57:11'),
(2087, 'Not_Avaliable_In_Court', 'Not Avaliable In Court', 'ስላልቀረበ', 'ስለዘይቐረበ', '2019-08-09 14:58:03', '2019-08-09 14:58:03'),
(2088, 'Shortage_Of_Budget', 'Shortage Of Budget', 'በጀት ስለሌለ', 'በጀት ስለዘየለ', '2019-08-09 14:58:44', '2019-08-09 14:58:44'),
(2089, 'Not_Given', 'Not Given', 'ስላልተሰጠ', 'ስለዘይተውሃበ', '2019-08-09 14:59:39', '2019-08-09 15:01:30'),
(2090, 'Given', 'Given', 'የተሰጠ', 'ዝተውሃበ', '2019-08-09 15:00:06', '2019-08-09 15:00:06'),
(2091, 'Efficiency/Back_Forth', 'Efficiency/Back Forth', 'ቅልጥፍና/መመላለስ', 'ሰለጤን/ምልልስ', '2019-08-09 15:04:49', '2019-08-09 15:04:49'),
(2092, 'In_Securiry', 'In Securiry', 'ድህንነት በመጠበቅ', 'ድሕንነት ምሕላው', '2019-08-09 15:06:18', '2019-08-09 15:06:18'),
(2093, 'Remembering', 'Remembering', 'የቃል ማስታወስ', 'ምዝክካር ቃል', '2019-08-09 15:08:16', '2019-08-09 15:08:16'),
(2094, 'In_Justice_Office', 'In Justice Office', 'በፍትህ', 'ኣብ ፍትሒ', '2019-08-09 15:08:55', '2019-08-09 15:08:55'),
(2095, 'In_Police', 'In Police', 'በፖሊስ', 'ኣብ ፖሊስ', '2019-08-09 15:09:41', '2019-08-09 15:09:41'),
(2096, 'Case_Delayed', 'Case Delayed', 'ጉዳይ ተጓተተ', 'ጉዳይ ተጎቲቱ', '2019-08-09 16:00:23', '2019-08-09 16:00:23'),
(2097, 'Investigation_Request', 'Investigation Request', 'ክስ ይጣራልኝ', 'ክሲ ይፃረየለይ', '2019-08-09 16:01:05', '2019-08-09 16:01:05'),
(2098, 'Document_Closed', 'Document Closed', 'መዝገቤ ተዘግተዋል', 'መዝገበይ ተዓፅዩ', '2019-08-09 16:01:46', '2019-08-09 16:01:46'),
(2099, 'Appeal_Request', 'Appeal Request', 'ይግባኝ ይባልሊኝ', 'ይግበኣኒ ይበሃለለይ', '2019-08-09 16:02:29', '2019-08-09 16:02:29'),
(2100, 'Service_Complain', 'Service Complain', 'በኣግባቡ ኣልተስተናገድኩም', 'ብኣግባቡ ኣይተስተኣናገድኩን', '2019-08-09 16:03:24', '2019-08-09 16:03:24'),
(2101, 'Human_Right_Voilence', 'Human Right Voilence', 'የሰብኣዊ መብት ጥሰት', 'ጥሕሰት ሰብኣዊ መሰል', '2019-08-09 16:04:32', '2019-08-09 16:04:32'),
(2102, 'Unethical', 'Unethical', 'የስነ-ምግባር ጉድለት', 'ጉድለት ስነ-ምግባር', '2019-08-09 16:05:10', '2019-08-09 16:05:10'),
(2103, 'Fully_Accepted', 'Fully Accepted', 'ሙሉ በሙሉ ተቀባይነት ያገኘ', 'ብሙሉእ ቅቡል ዝተገበረ', '2019-08-09 16:06:08', '2019-08-09 16:06:08'),
(2104, 'Partially_Accepted', 'Partially Accepted', 'በከፊል ተቀባይነት ያገኘ', 'ብክፋል ቅቡል ዝተገበረ', '2019-08-09 16:06:50', '2019-08-09 16:06:50'),
(2105, 'Fully_Rejected', 'Fully Rejected', 'ሙሉ በሙሉ ተቀባይነት ያላገኘ', 'ብሙሉእ ቅቡል ዘይተገበረ', '2019-08-09 16:07:25', '2019-08-09 16:07:25'),
(2106, 'Heavy', 'Heavy', 'ከባድ', 'ከቢድ', '2019-08-09 16:07:53', '2019-08-09 16:07:53'),
(2107, 'Decided_In_Less_Than_45_Minutes', 'Decided In Less Than 45 Minutes', 'ከ45 ደቂቃ በታች የተወሰነ', 'ትሕቲ 45 ደቒቓ ዝተወሰነ', '2019-08-09 16:10:54', '2019-08-09 16:10:54'),
(2108, 'Decided_In_Above_45_Minutes', 'Decided In Above 45 Minutes', 'ከ45 ደቂቃ በላይ የተወሰነ', 'ልዕሊ 45 ደቒቓ ዝተወሰነ', '2019-08-09 16:11:47', '2019-08-09 16:11:47'),
(2109, 'Decided_In_Less_Than_7_Days', 'Decided In Less Than 7 Days', 'ከ 7 ቀናት በታች የተወሰነ', 'ትሕቲ 7 መዓልቲ ዝተወሰነ', '2019-08-09 16:13:47', '2019-08-09 16:13:47'),
(2110, 'Decided_In_Above_7_Days', 'Decided In Above 7 Days', 'ከ 7 ቀናት በላይ የተወሰነ', 'ልዕሊ 7 መዓልቲ ዝተወሰነ', '2019-08-09 16:14:42', '2019-08-09 16:14:42'),
(2111, 'Approved_By_Higher_Level', 'Approved By Higher Level', 'በላይ የፀና', 'ብላዕሊ ዝተፀንዐ', '2019-08-09 16:16:29', '2019-08-09 16:16:29'),
(2112, 'Not_Approved_By_Higher_Level', 'Not Approved By Higher Level', 'ከላይ የተቀለበሰ', 'ብላዕሉ ዝተስዓረ', '2019-08-09 16:17:24', '2019-08-09 16:17:24'),
(2113, 'Hospitality', 'Hospitality', 'መስተንግዶ', 'ምስትእንጋድ', '2019-08-09 16:20:00', '2019-08-09 16:20:00'),
(2114, 'Additional_Care_Punishments', 'Additional Care Punishments', 'ተጨማሪ የጥንቃቄ ቅጣቶች', 'ተወሰኽቲ ቅፅዓት ጥንቃቐ', '2019-08-11 06:57:21', '2019-08-11 06:57:21'),
(2115, 'Modified_Documents_Count', 'Modified Documents Count', 'የተሻሻሉ መዝገቦች ብዛት', 'በዝሒ ዝተመሓየሹ መዛግብቲ', '2019-08-11 08:14:31', '2019-08-11 08:14:31'),
(2116, 'Accuser_Information', 'Accuser Information', 'የከሳሽ መረጃ', 'መረዳእታ ከሳሲ', '2019-08-12 18:04:14', '2019-08-12 18:04:14'),
(2117, 'Defendant_Information', 'Defendant Information', 'የተከሳሽ መረጃ', 'መረዳእታ ተኸሳሲ', '2019-08-12 18:04:54', '2019-08-12 18:04:54'),
(2118, 'From_Date', 'From Date', 'ከቀን', 'ካብ ዕለት', '2019-08-12 18:05:29', '2019-08-12 18:05:29'),
(2119, 'To_Date', 'To Date', 'እስከ ቀን', 'ክሳብ ዕለት', '2019-08-12 18:06:38', '2019-08-12 18:06:38'),
(2120, 'Generate_Report', 'Generate Report', 'ሪፖርት ይመልከቱ', 'ፀብፃብ ኣውፅእ', '2019-08-12 18:08:41', '2019-08-12 18:08:41'),
(2121, 'Region_Staff', 'Region Staff', 'ክልል ስታፍ', 'ክልል ስታፍ', '2019-08-12 18:19:42', '2019-08-12 18:19:42'),
(2122, 'Zone_Staff', 'Zone Staff', 'ዞን ስታፍ', 'ዞባ ስታፍ', '2019-08-12 18:20:05', '2019-08-12 18:20:05'),
(2123, 'Wereda_Staff', 'Wereda Staff', 'ወረዳ ስታፍ', 'ወረዳ ስታፍ', '2019-08-12 18:20:32', '2019-08-12 18:20:32'),
(2124, 'Complains_By_Customer', 'Complains By Customer', 'በተገልጋዮች የሚቀርብ ቅሬታ', 'ብተገልገልቲ ዝቐርብ ጥርዓን', '2019-08-13 08:47:13', '2019-08-13 08:47:13'),
(2125, 'Not_Solved', 'Not Solved', 'ያልተፈታ', 'ዘይተፈትሐ', '2019-08-13 19:15:44', '2019-08-13 19:15:44'),
(2126, 'Solved', 'Solved', 'የተፈታ', 'ዝተፈትሐ', '2019-08-13 19:16:12', '2019-08-13 19:16:12'),
(2127, 'Voilence_Records', 'Voilence Records', 'የፈፀሙ ጥሰቶች', 'ዝተፈፀመ ጥሕሰት', '2019-08-13 19:44:41', '2019-08-13 19:44:41'),
(2128, 'quality_of_return', 'Quality Of Return', 'የመመለስ ትክክለኛነት', 'ኣግባብነት ምምላስ', '2019-08-17 17:41:08', '2019-08-17 17:41:08'),
(2129, 'quality_of_42_a', 'Quality of 42/1-A/', 'የ42/1-ሀ/ ጥራት', 'ፅሬት 42/1-ሀ/', '2019-08-17 17:43:34', '2019-08-17 17:51:03'),
(2130, 'quality_of_42_b', 'Quality of 42/1-B/', 'የ42/1-ለ/ ጥራት', 'ፅሬት 42/1-ለ/', '2019-08-17 17:44:10', '2019-08-17 17:51:03'),
(2131, 'Hour', 'Hour', 'ሰኣት', 'ሰዓት', '2019-08-17 18:29:32', '2019-08-17 18:29:32'),
(2132, 'Minute', 'Minute', 'ደቂቃ', 'ደቒቓ', '2019-08-17 18:30:12', '2019-08-17 18:30:12'),
(2133, 'quality_of_defendant_not_found', 'Defendant Not Found', 'የተከሳሽ ኣለመገኘት ጥራት', 'ፅሬት ተጠርጣሪ ዘይምርካብ', '2019-08-20 16:15:55', '2019-08-20 16:15:55'),
(2134, 'quality_of_pick_over', 'Pick Over Quality', 'የመነሳት ጥራት', 'ፅሬት ምልዓል', '2019-08-20 18:31:22', '2019-08-20 18:31:22'),
(2135, 'Paid', 'Paid', 'የተከፈለው', 'ዝተኸፈሎ', '2019-08-26 09:51:33', '2019-08-26 09:51:33');
INSERT INTO `language_strings` (`id`, `keyWord`, `eng`, `amh`, `tig`, `created_at`, `updated_at`) VALUES
(2136, 'Witnessed_A_Lie', 'Witnessed A Lie', 'ቃሉን የቀየረ', 'ቃሉ ዝቐየረ', '2019-08-26 11:07:33', '2019-08-26 11:07:33'),
(2137, 'Accused_For_Lie', 'Accused For Lie', 'በወንጀል የተጠየቀ', 'ብገበን ዝተሓተተ', '2019-08-26 11:08:07', '2019-08-26 11:08:07'),
(2138, 'Not_Accused_For_Lie', 'Not Accused For Lie', 'በወንጀል የልተጠየቀ', 'ብገበን ዘይተሓተተ', '2019-08-26 11:08:53', '2019-08-26 11:08:53'),
(2139, 'Accusal_Status', 'Accusal Status', 'የተጠያቂነት ሁኔታ', 'ኩነታት ተጠያቅነት', '2019-08-26 11:10:18', '2019-08-26 11:10:18'),
(2140, 'Witness_Truthness_Status', 'Witness Truthness Status', 'የምስክር ቃል ትክክለኛነት', 'ኩነታት ትሕዝቶ ምስክርነት ቃል', '2019-08-26 11:11:30', '2019-08-26 11:11:30'),
(2141, 'Efficiency_(Done_With_In_30_Minutes)', 'Efficiency (Done With In 30 Minutes)', 'ቅልጥፍና (በ30 ደቂቃ ውስጥ የተሰራ)', 'ሰለጤን (ኣብ ውሽጢ 30 ደቒቓ ዝተሰርሐ)', '2019-08-26 16:16:21', '2019-08-26 16:16:21'),
(2142, 'Quality (Approved_By_Higher_Level)', 'Quality (Approved By Higher Level)', 'ጥራት (ከላይ የፀና)', 'ፅሬት (ብላዕሊ ዝፀንዐ)', '2019-08-26 16:17:56', '2019-08-26 16:17:56'),
(2143, 'Satisfaction (Satisfied_Count)', 'Satisfaction (Satisfied Count)', 'እርካታ (መርካት የቻሉ ብዛት)', 'ዕግበት (በዝሒ ዝዓገቡ)', '2019-08-26 16:20:11', '2019-08-26 16:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `leading_investigation_of_heavy_crimes`
--

CREATE TABLE `leading_investigation_of_heavy_crimes` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crime_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crime_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kunetat_tekesestiId` int(11) NOT NULL,
  `police_accusal_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_of_investigation_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_a_brki` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `legality_of_human_right_protection` text COLLATE utf8mb4_unicode_ci,
  `legality_of_information_gathering` text COLLATE utf8mb4_unicode_ci,
  `legality_of_other_types_of_investigation` text COLLATE utf8mb4_unicode_ci,
  `voilence_of_human_right_protection` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voilence_of_information_gathering` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voilence_of_other_types_of_investigation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `followed_up_lawyer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_follow_up` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_by_officer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_appoval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leading_investigation_of_heavy_crimes`
--

INSERT INTO `leading_investigation_of_heavy_crimes` (`id`, `ksi_mezgeb_number`, `crime_date`, `crime_location`, `kunetat_tekesestiId`, `police_accusal_date`, `end_of_investigation_date`, `created_a_brki`, `entryDate`, `brkiId`, `legality_of_human_right_protection`, `legality_of_information_gathering`, `legality_of_other_types_of_investigation`, `voilence_of_human_right_protection`, `voilence_of_information_gathering`, `voilence_of_other_types_of_investigation`, `comment`, `followed_up_lawyer`, `date_of_follow_up`, `approved_by_officer`, `date_of_appoval`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(3, 'ገ/መ/ቑ/2011-0000014', '02/12/2011', 'sagah', 3, '02/12/2011', '02/12/2011', 'Region', '2/12/2011', '3', 'asgahah', 'fgdfjg', 'sersrtuj', 'on', NULL, 'on', 'dfhsdjsjfsj', 'dh', '02/12/2011', 'hardh', '02/12/2011', 14, NULL, 'active', 'false', '2019-08-08 17:36:01', '2019-08-08 17:36:01'),
(4, 'ገ/መ/ቑ/2011-0000007', '03/12/2011', 'sagah', 2, '03/12/2011', '24/12/2011', 'Region', '2/12/2011', '3', 'asgahah', 'fgdfjg', 'sersrtuj', 'on', 'on', NULL, 'dfhsdjsjfsj', 'dhfb', '16/12/2011', 'hardh', '08/12/2011', 14, NULL, 'active', 'false', '2019-08-08 18:14:13', '2019-08-08 18:14:13'),
(5, 'ገ/መ/ቑ/2011-0000018', '09/12/2011', 'g g t', 1, '07/12/2011', '07/12/2011', 'Breaking_Region', '7/12/2011', '4', 'asgahah', 'fgdfjg', 'sersrtuj', 'on', NULL, 'on', 'dfhsdjsjfsj', 'dh', '07/12/2011', 'hardh', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 16:08:50', '2019-08-13 16:21:22'),
(6, 'ገ/መ/ቑ/2011-0000004', '08/12/2011', 'sagah', 1, '07/12/2011', '07/12/2011', 'Breaking_Region', '7/12/2011', '4', 'a', 'b', 'c', 'on', 'on', 'on', 'dfhsdjsjfsj', 'dh', '07/12/2011', 'hardh', '08/12/2011', 34, NULL, 'active', 'false', '2019-08-13 16:35:44', '2019-08-13 16:36:35'),
(7, 'ገ/መ/ቑ/2011-0000008', '10/12/2011', 'g g t', 2, '08/12/2011', '09/12/2011', 'Breaking_Region', '7/12/2011', '4', 'asgahah', 'fgdfjg', 'c', 'on', NULL, 'on', 'dfhsdjsjfsj', 'dhfb', '24/12/2011', 'hardh', '08/12/2011', 34, NULL, 'active', 'false', '2019-08-13 19:41:20', '2019-08-13 19:53:33'),
(8, 'ገ/መ/ቁ/2011-0000005', '22/12/2011', 'fsfhs', 2, '21/12/2011', '21/12/2011', 'Region', '21/12/2011 1:21:38', '3', 'fdgaf', 'gadhadfh', 'fhshj', 'on', NULL, 'on', 'gfhsfj', 'dfhsjf', '21/12/2011', 'fdhdhsdf', '21/12/2011', 14, NULL, 'active', 'false', '2019-08-26 19:21:38', '2019-08-26 19:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `id` int(10) UNSIGNED NOT NULL,
  `logoText` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `logoImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logo`
--

INSERT INTO `logo` (`id`, `logoText`, `logoImage`, `created_at`, `updated_at`) VALUES
(1, 'ቢሮ ፍትሒ ክልል ትግራይ', 'logoImage.png', '2018-11-27 04:54:46', '2019-04-25 10:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `logoimage`
--

CREATE TABLE `logoimage` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'logo.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logoimage`
--

INSERT INTO `logoimage` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, '1543671859.png', '2018-11-27 04:54:46', '2018-12-01 10:44:20');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberNo` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthDate` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postalAddress` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regionId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `officeeCell` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membershipDate` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terminationDate` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `memberNo`, `firstName`, `lastName`, `middleName`, `birthDate`, `gender`, `location`, `postalAddress`, `countryId`, `regionId`, `phoneNumber`, `officeeCell`, `email`, `membershipDate`, `terminationDate`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:32:17', '2018-11-27 18:32:17'),
(2, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:33:48', '2018-11-27 18:33:48'),
(3, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:34:42', '2018-11-27 18:34:42'),
(4, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:35:43', '2018-11-27 18:35:43'),
(5, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:37:13', '2018-11-27 18:37:13'),
(6, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:37:58', '2018-11-27 18:37:58'),
(7, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:41:00', '2018-11-27 18:41:00'),
(8, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:41:30', '2018-11-27 18:41:30'),
(9, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:43:20', '2018-11-27 18:43:20'),
(10, '1', 'ኣኣ', 'ኣ', 'ኣ', '19/03/2011', 'male', 'ኣኣ', '34', '1', '1', '0919054078', '2', 'admin@pilasa.com', '29/03/2011', NULL, 1, 'active', 'false', '2018-11-27 18:45:55', '2018-11-27 18:45:55'),
(11, '00004', 'we', 'w', 'w', '19/03/2011', 'female', 'ddd', '456', '1', '1', '2', '2', 'system@gmail.com', '07/03/2011', NULL, 1, 'active', 'false', '2018-11-27 19:44:53', '2018-11-27 19:44:53'),
(12, '00003', 'we', 'w', 'w', '19/03/2011', 'female', 'ddd', '456', '1', '1', '2', '2', 'system@gmail.com', '07/03/2011', NULL, 1, 'active', 'false', '2018-11-27 19:50:06', '2018-11-27 19:50:06'),
(13, '00002', 'we', 'w', 'w', '19/03/2011', 'female', 'ddd', '456', '1', '1', '2', '2', 'system@gmail.com', '07/03/2011', NULL, 1, 'active', 'false', '2018-11-27 19:53:26', '2018-11-27 19:53:26'),
(14, '00008', 'we', 'w', 'w', '10/31/2018', 'female', 'eee', '3', '1', '1', '0919054098', '2', NULL, '05/03/2011', NULL, 1, 'active', 'false', '2018-11-27 20:14:42', '2018-11-27 20:14:42'),
(15, '00009', 'ዳዊት', 'ታደሰ', 'ሃይሉ', '19/03/2011', 'male', '45', '3', '1', '2', '0919054078', '2', 'admin@pilasa.com', '05/03/2011', NULL, 1, 'active', 'false', '2018-12-01 08:34:41', '2018-12-01 08:34:41'),
(16, '442', 'a', 'a', 'a', '27/03/2011', 'male', '45', '3', '1', '1', '3333333', '2', 'admin@pilasa.com', '25/03/2011', NULL, 1, 'active', 'false', '2018-12-01 10:36:39', '2018-12-01 10:36:39'),
(17, 'a', 'a', 'a', 'a', '05/03/2011', 'male', 'tt', '3', '1', '1', '3333333', '2', 'admin@pilasa.com', '19/03/2011', NULL, 1, 'active', 'false', '2018-12-01 13:50:55', '2018-12-01 13:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `member_account`
--

CREATE TABLE `member_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` int(11) NOT NULL,
  `groupId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_accountTypeId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_accountName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_accountNumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `openingDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_account`
--

INSERT INTO `member_account` (`id`, `memberId`, `groupId`, `member_accountTypeId`, `member_accountName`, `member_accountNumber`, `openingDate`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'gg', '1', '345', '23', 'a', 1, 'active', 'false', '2018-11-27 05:58:16', '2018-11-27 05:58:16'),
(2, 1, 'gg', '1', '345', '23', 'a', 1, 'active', 'false', '2018-11-27 05:59:02', '2018-11-27 05:59:02'),
(3, 1, 'gg', '1', '345', '23', 'a', 1, 'active', 'false', '2018-11-27 05:59:50', '2018-11-27 05:59:50'),
(4, 1, 'gg', '1', '345', '23', 'a', 1, 'active', 'false', '2018-11-27 06:00:42', '2018-11-27 06:00:42'),
(5, 1, 'gg', '1', '345', '23', 'a', 1, 'active', 'false', '2018-11-27 06:32:27', '2018-11-27 06:32:27'),
(6, 1, 'gg', '1', '345', '23', 'a', 1, 'active', 'false', '2018-11-27 06:33:14', '2018-11-27 06:33:14'),
(7, 10, 'a', '1', '345', '23', 'a', 1, 'active', 'false', '2018-11-27 07:00:09', '2018-11-27 07:00:09'),
(8, 4, '1', '1', 'ኣባል 1', '23', '20/03/2011', 1, 'active', 'false', '2018-11-27 18:35:43', '2018-11-27 18:35:43'),
(9, 5, '1', '1', 'ኣባል 1', '23', '20/03/2011', 1, 'active', 'false', '2018-11-27 18:37:13', '2018-11-27 18:37:13'),
(10, 6, '1', '1', 'ኣባል 1', '23', '20/03/2011', 1, 'active', 'false', '2018-11-27 18:37:58', '2018-11-27 18:37:58'),
(11, 7, '1', '1', 'ኣባል 1', '23', '20/03/2011', 1, 'active', 'false', '2018-11-27 18:41:01', '2018-11-27 18:41:01'),
(12, 8, '1', '1', 'ኣባል 1', '23', '20/03/2011', 1, 'active', 'false', '2018-11-27 18:41:30', '2018-11-27 18:41:30'),
(13, 9, '1', '1', 'ኣባል 1', '23', '20/03/2011', 1, 'active', 'false', '2018-11-27 18:43:20', '2018-11-27 18:43:20'),
(14, 10, '1', '1', 'ኣባል 1', '23', '20/03/2011', 1, 'active', 'false', '2018-11-27 18:45:55', '2018-11-27 18:45:55'),
(15, 11, '1', '1', '345', '23', '27/03/2011', 1, 'active', 'false', '2018-11-27 19:44:53', '2018-11-27 19:44:53'),
(16, 12, '1', '1', '345', '23', '27/03/2011', 1, 'active', 'false', '2018-11-27 19:50:06', '2018-11-27 19:50:06'),
(17, 13, '1', '1', '345', '23', '27/03/2011', 1, 'active', 'false', '2018-11-27 19:53:26', '2018-11-27 19:53:26'),
(18, 14, '1', '1', '345', '3445', '07/03/2011', 1, 'active', 'false', '2018-11-27 20:14:42', '2018-11-27 20:14:42'),
(19, 14, '1', '1', '345', '3445', '07/03/2011', 1, 'active', 'false', '2018-11-28 04:15:05', '2018-11-28 04:15:05'),
(20, 14, '1', '1', '345', '3445', '07/03/2011', 1, 'active', 'false', '2018-11-28 04:21:21', '2018-11-28 04:21:21'),
(21, 15, '1', '1', '345', '23', '26/03/2011', 1, 'active', 'false', '2018-12-01 08:34:41', '2018-12-01 08:34:41'),
(22, 16, '1', '1', '3', '3', '04/03/2011', 1, 'active', 'false', '2018-12-01 10:36:39', '2018-12-01 10:36:39'),
(23, 17, '1', '1', 'a', '23', '26/03/2011', 1, 'active', 'false', '2018-12-01 13:50:55', '2018-12-01 13:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_000001_create_user_zone_wereda_kebelles_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2017_08_23_122102_create_logoImage_table', 1),
(5, '2017_08_23_122135_create_logo_table', 1),
(6, '2017_11_06_220534_create_roles_table', 1),
(7, '2017_11_11_180110_create_educational_skills_table', 1),
(8, '2017_11_12_151824_create_about_table', 1),
(9, '2017_11_12_162040_create_users_purchases_table', 1),
(10, '2017_11_12_162155_create_user_details_table', 1),
(11, '2017_11_12_162223_create_generals_table', 1),
(12, '2017_11_19_163541_create_resources_table', 1),
(13, '2017_11_19_182539_create_user_resource_table', 1),
(14, '2017_11_19_214926_create_role_resource_table', 1),
(15, '2017_12_04_115319_create_settings_table', 1),
(16, '2017_12_04_115321_create_kebelle_form_1p1_table', 1),
(17, '2017_12_04_115322_create_kebelle_form_1p2_table', 1),
(18, '2017_12_04_115323_create_kebelle_form_1p2_joblist_table', 1),
(19, '2017_12_04_115329_create_zones_table', 1),
(20, '2017_12_04_115331_create_weredas_table', 1),
(21, '2017_12_04_115332_create_tabyas_table', 1),
(22, '2017_12_04_115333_create_kebelles_table', 1),
(23, '2017_12_04_115335_create_religion_table', 1),
(24, '2017_12_04_115345_create_bher_table', 1),
(25, '2017_12_04_115349_create_kunetat_hadar_table', 1),
(26, '2017_12_04_115351_create_wannet_menberi_table', 1),
(27, '2017_12_04_115353_create_awde_srah_table', 1),
(28, '2017_12_04_115355_create_aynetteshkerkerti_table', 1),
(29, '2017_12_04_115357_create_aynet_glgalot_table', 1),
(30, '2017_12_04_115357_create_aynet_ngdi_table', 1),
(31, '2017_12_04_115359_create_zraeti_table', 1),
(32, '2017_12_04_115361_create_educational_levels_table', 1),
(33, '2017_12_04_115362_create_hafeshawi_habereta_tabya_table', 1),
(34, '2017_12_04_115367_create_tabya_tkalat_table', 1),
(35, '2017_12_04_115368_create_tabya_mahberat_table', 1),
(36, '2017_12_04_115369_create_tabya_hafti_tefetro_table', 1),
(37, '2017_12_04_115370_create_aynet_wdabe_table', 1),
(38, '2017_12_04_115371_create_aynet_tekli_table', 1),
(39, '2017_12_04_115376_create_habereta_nebari_tabya_table', 1),
(40, '2017_12_04_115380_create_countries_table', 1),
(41, '2017_12_04_115383_create_rkb_beteseb_table', 1),
(42, '2017_12_04_115384_create_aynetat_rkb_table', 1),
(43, '2017_12_04_115390_create_members_table', 1),
(44, '2017_12_04_115395_create_Member_account_table', 1),
(45, '2017_12_04_115396_create_Bank_table', 1),
(46, '2017_12_04_115397_create_Bank_account_table', 1),
(47, '2017_12_04_115398_create_Charge_fee_registration_table', 1),
(48, '2017_12_04_115399_create_Document_table', 1),
(49, '2017_12_04_115400_create_Social_info_table', 1),
(50, '2017_12_04_115401_create_Work_detail_table', 1),
(51, '2017_12_04_115402_create_accounts_table', 1),
(52, '2017_12_04_115403_create_branchs_table', 1),
(53, '2017_12_04_115404_create_currencyTypes_table', 1),
(54, '2017_12_04_115405_create_bank_branchs_table', 1),
(55, '2017_12_04_115406_create_account_types_table', 1),
(56, '2017_12_04_115407_create_groups_table', 1),
(57, '2017_12_04_115408_create_payment_modes_table', 1),
(58, '2017_12_04_115409_create_document_types_table', 1),
(59, '2017_12_04_115410_create_banks_table', 1),
(60, '2017_12_04_115411_create_termsOfPayment_table', 1),
(61, '2017_12_04_115412_create_file_types_table', 2),
(62, '2017_12_04_115381_create_regions_table', 3),
(63, '2017_12_04_115415_create_trainig_status_table', 4),
(65, '2017_12_04_115416_create_charge_categories_table', 5),
(66, '2017_12_04_115417_create_bank_accounts_table', 6),
(70, '2017_12_04_115391_create_members_table', 7),
(72, '2017_12_04_115393_create_Document_table', 8),
(73, '2017_12_04_115394_create_Charge_fee_registration_table', 8),
(74, '2017_12_04_115399_create_Social_info_table', 9),
(75, '2017_12_04_115400_create_Work_detail_table', 9),
(76, '2017_12_04_115398_create_Social_info_table', 10),
(77, '2017_12_04_115418_create_saving_categories_table', 11),
(78, '2017_12_04_115419_create_saving_table', 11),
(79, '2017_12_04_115420_create_withdrawal_table', 12),
(100, '2017_12_04_115417_create_saving_categories_table', 13),
(101, '2017_12_04_115419_create_savings_table', 13),
(102, '2017_12_04_115420_create_withdrawals_table', 13),
(103, '2017_12_04_115421_create_bank_accounts_table', 13),
(104, '2017_12_04_115422_create_Balance_table', 14),
(105, '2017_12_04_115423_create_withdrawals_table', 15),
(109, '2017_12_04_115425_create_language_strings_table', 16),
(110, '2017_12_04_115427_create_aynetat_geben_table', 16),
(111, '2017_12_04_115428_create_crime_categories_table', 17),
(112, '2017_12_04_115430_create_aynetat_wsane_table', 18),
(113, '2017_12_04_115432_create_departments_table', 18),
(114, '2017_12_04_115434_create_kunetat_mezagbti_table', 18),
(115, '2017_12_04_115436_create_akabi_hgi_trean_meketateli_table', 19),
(116, '2017_12_04_115438_create_kdme_ksi_geben_mezgeb_table', 19),
(117, '2017_12_04_115439_create_archive_kdme_ksi_geben_mezgeb_table', 19),
(118, '2017_12_04_115440_create_kesesti_kdme_ksi_geben_mezgeb_table', 19),
(119, '2017_12_04_115441_create_archive_kesesti_kdme_ksi_geben_mezgeb_table', 19),
(120, '2017_12_04_115442_create_tekesesti_kdme_ksi_geben_mezgeb_table', 19),
(121, '2017_12_04_115443_create_archive_tekesesti_kdme_ksi_geben_mezgeb_table', 19),
(122, '2017_12_04_115447_create_sub_weredas_table', 20),
(247, '2017_12_04_115460_create_ksi_mezgeb_table', 21),
(248, '2017_12_04_115461_create_ksi_mezgeb_brki_table', 21),
(249, '2017_12_04_115462_create_kesesti_ksi_mezgeb_table', 21),
(250, '2017_12_04_115463_create_tekesesti_ksi_mezgeb_table', 21),
(659, '2017_12_04_115464_create_tekesasi_crime_type_table', 37),
(252, '2017_12_04_115466_create_kesesti_tekesasi_table', 21),
(253, '2017_12_04_115490_create_brkitat_table', 21),
(254, '2017_12_04_115496_create_ksi_kotsorotat_table', 22),
(255, '2014_10_12_000002_create_users_Bkp_table', 23),
(351, '2014_10_12_000000_create_users_table', 24),
(352, '2017_12_04_1154100_create_crime_record_bet_frdi_decision_history_table', 24),
(353, '2017_12_04_1154110_create_waninat_table', 25),
(354, '2017_12_04_1154112_create_property_types_table', 26),
(355, '2017_12_04_1154114_create_ftabher_mezgeb_table', 26),
(356, '2017_12_04_1154116_create_ftabher_kesesti_mezgeb_table', 26),
(357, '2017_12_04_1154118_create_ftabher_tekesesti_mezgeb_table', 26),
(358, '2017_12_04_1154120_create_ftabher_kesesti_tekesasi_table', 26),
(359, '2017_12_04_1154122_create_ftabher_wsanetat_akabiHgi_table', 26),
(360, '2017_12_04_1154124_create_ftabher_wsanetat_betFrdi_table', 26),
(361, '2017_12_04_1154126_create_ftabher_akabi_hgi_decision_history_table', 26),
(362, '2017_12_04_1154128_create_ftabher_bet_frdi_decision_history_table', 26),
(363, '2017_12_04_1154130_create_ftabher_tekesasi_crime_type_table', 26),
(364, '2017_12_04_1154132_create_ftabher_mezgeb_brki_table', 26),
(365, '2017_12_04_1154134_create_accuser_types_table', 26),
(366, '2017_12_04_115430_create_aynetat_wsane_akabiHgi_table', 26),
(367, '2017_12_04_115431_create_aynetat_wsane_betFrdi_table', 26),
(368, '2017_12_04_115465_create_ksi_mezgeb_brki_wsane_zhabu_dayanu_table', 26),
(369, '2017_12_04_115499_create_crime_record_akabi_hgi_decision_history_table', 26),
(371, '2017_12_04_1154136_create_ftabher_tekesasi_property_types_table', 27),
(372, '2017_12_04_1154138_create_ftabher_wsanetat_tfeat_betFrdi_table', 27),
(373, '2017_12_04_1154140_create_compensation_types_table', 28),
(374, '2017_12_04_1154142_create_inherit_types_table', 28),
(375, '2017_11_19_163542_create_resources_table', 29),
(376, '2017_11_19_214927_create_role_resource_table', 29),
(377, '2017_12_04_1154129_create_ftabher_ksi_kotsorotat_table', 30),
(378, '2017_12_04_1154154_create_health_statuses_table', 31),
(379, '2017_12_04_1154156_create_person_health_status_table', 31),
(380, '2017_12_04_1154158_create_disability_types_table', 32),
(381, '2017_12_04_1154156_create_ftabher_kesasi_health_status_table', 33),
(382, '2017_12_04_1154157_create_ftabher_tekesasi_health_status_table', 33),
(383, '2017_11_19_214929_create_role_actions_table', 34),
(636, '2017_12_04_1154160_create_accusal_categories_table', 35),
(637, '2019_06_15_085780_create_truthness_statuses_table', 35),
(638, '2019_06_15_085782_create_effectiveness_statuses_table', 35),
(639, '2019_06_15_085784_create_quality_statuses_table', 35),
(640, '2019_06_15_085792_create_glgalot_types_table', 35),
(641, '2019_06_15_085794_create_dgafn_given_party_types_table', 35),
(642, '2019_06_15_085796_create_satisfaction_statuses_table', 35),
(643, '2019_06_15_085798_create_witness_payment_statuses_table', 35),
(644, '2019_06_15_085800_create_witness_security_types_table', 35),
(645, '2019_06_15_085802_create_witness_follow_up_security_statuses_table', 35),
(646, '2019_06_15_085804_create_witness_remember_statuses_table', 35),
(647, '2019_06_15_085806_create_witness_avaliability_statuses_table', 35),
(648, '2019_06_15_085808_create_aynetat_rkb_table', 35),
(685, '2019_06_15_103208_create_kttln_dgafn_abyate_eyo_table', 43),
(660, '2019_06_15_085812_create_leading_investigation_of_heavy_crimes_table', 38),
(652, '2019_06_15_090346_create_kunetat_tekesesti_human_right_table', 35),
(696, '2019_06_15_090347_create_kunetat_tekesesti_table', 48),
(654, '2019_06_15_090348_create_aynet_thset_table', 35),
(668, '2019_06_15_090349_create_aynetat_trean_table', 42),
(697, '2019_06_15_085810_create_human_right_table', 49),
(682, '2019_06_15_085811_create_human_right_prison_table', 43),
(658, '2019_06_15_103210_create_human_right_complain_record_table', 36),
(661, '2017_12_04_115467_create_ftabher_mezgeb_brki_wsane_zhabu_dayanu_table', 39),
(662, '2017_12_04_1154116_create_ftabher_mezgeb_waninat_table', 40),
(698, '2019_06_15_085814_create_witness_follow_up_table', 50),
(684, '2019_06_15_101058_create_glgalot_ntsadgaf_hgi_table', 43),
(686, '2019_06_15_085814_create_leading_investigation_of_heavy_crimes_table', 44),
(691, '2019_06_15_101059_create_complains_by_customer_table', 46),
(688, '2019_06_15_101061_create_complains_response_history_table', 45),
(694, '2019_06_15_085812_create_human_right_complain_record_table', 47),
(695, '2019_06_15_085813_create_human_right_prison_complain_record_table', 47);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_modes`
--

INSERT INTO `payment_modes` (`id`, `name`, `description`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'payment mode 1', NULL, 'active', 'false', NULL, NULL),
(2, 'ቼክ', NULL, 'active', 'false', NULL, NULL),
(3, 'ካሽ', NULL, 'active', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `name`, `keyWord`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ተሽከርካሪ', 'Vehicle', NULL, 'active', 'false', '2019-06-11 16:29:51', '2019-06-11 16:29:51'),
(2, 'ኣቕሓ ኤሌክትሮኒክስ', 'Electronics', NULL, 'active', 'false', '2019-06-11 16:29:51', '2019-06-11 16:29:51'),
(3, 'ካልእ', 'Other', NULL, 'active', 'false', '2019-06-11 16:29:51', '2019-06-11 16:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `quality_statuses`
--

CREATE TABLE `quality_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quality_statuses`
--

INSERT INTO `quality_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Quality', 'ፅሬቱ ዝሓለወ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Quality', 'ፅሬቱ ዘይሓለወ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countryId` int(11) NOT NULL DEFAULT '1',
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `countryId`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 'ትግራይ', 1, NULL, 0, 'active', 'false', '2019-06-10 19:39:37', '2019-06-10 19:39:37'),
(8, 'ዓፋር', 1, NULL, 14, 'active', 'false', '2019-06-27 04:34:52', '2019-06-27 04:34:52'),
(9, 'አምሓራ', 1, NULL, 14, 'active', 'false', '2019-07-08 01:23:42', '2019-07-08 01:23:42'),
(10, 'ካልእ', 1, NULL, 14, 'active', 'false', '2019-07-08 01:24:06', '2019-07-08 01:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `religion`
--

INSERT INTO `religion` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 'ክርስትና', NULL, 28, 'active', 'false', '2018-11-27 05:31:11', '2019-07-30 06:44:33'),
(2, 'እስልምና', NULL, 1, 'active', 'false', '2019-04-27 18:29:05', '2019-04-27 18:29:05'),
(3, 'ካልእ', NULL, 28, 'active', 'false', '2019-07-30 06:44:46', '2019-07-30 06:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `entityName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_crud` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `menuLevel` int(11) NOT NULL DEFAULT '1',
  `routeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `entityName`, `is_crud`, `menuLevel`, `routeName`, `created_at`, `updated_at`) VALUES
(2, 'change_user_status', 'false', 2, 'users.changeStatus', '2019-06-25 09:24:33', '2019-06-25 09:24:33'),
(1, 'users', 'true', 2, 'users', '2019-06-25 09:24:33', '2019-06-25 09:24:33'),
(3, 'permissions_save', 'false', 2, 'permissions.save', '2019-06-25 09:24:33', '2019-06-25 09:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `rkb_beteseb`
--

CREATE TABLE `rkb_beteseb` (
  `id` int(10) UNSIGNED NOT NULL,
  `personId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aynetRkbId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educationalLevelId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kunetatMetawekiyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthDate` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `roleName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `roleName`, `description`, `created_at`, `updated_at`) VALUES
(2, 'database', 'Employee who enters data to the system', '2019-08-26 19:34:31', '2019-08-26 19:34:31'),
(1, 'superadmin', 'Admin who manages the system', '2019-08-26 19:34:31', '2019-08-26 19:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_actions`
--

CREATE TABLE `role_actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `roleId` int(10) UNSIGNED NOT NULL,
  `resourceId` int(11) NOT NULL,
  `allow_action` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_actions`
--

INSERT INTO `role_actions` (`id`, `roleId`, `resourceId`, `allow_action`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 0, '2019-06-16 16:17:27', '2019-06-27 06:34:48'),
(3, 2, 3, 0, '2019-06-16 16:17:33', '2019-06-27 06:34:48'),
(4, 3, 2, 0, '2019-06-16 16:21:21', '2019-06-18 05:05:47'),
(5, 3, 3, 1, '2019-06-16 16:21:23', '2019-06-18 05:14:28'),
(6, 1, 2, 1, '2019-06-17 16:56:51', '2019-06-17 16:56:51'),
(7, 1, 3, 1, '2019-06-17 16:56:53', '2019-06-17 16:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `role_resource`
--

CREATE TABLE `role_resource` (
  `id` int(10) UNSIGNED NOT NULL,
  `roleId` int(10) UNSIGNED NOT NULL,
  `resourceId` int(11) NOT NULL,
  `show` int(11) NOT NULL DEFAULT '0',
  `index` int(11) NOT NULL DEFAULT '0',
  `store` int(11) NOT NULL DEFAULT '0',
  `update` int(11) NOT NULL DEFAULT '0',
  `destroy` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_resource`
--

INSERT INTO `role_resource` (`id`, `roleId`, `resourceId`, `show`, `index`, `store`, `update`, `destroy`, `created_at`, `updated_at`) VALUES
(6, 3, 1, 1, 1, 1, 0, 1, '2019-06-16 16:17:48', '2019-06-18 05:24:11'),
(5, 2, 1, 0, 0, 0, 0, 0, '2019-06-16 16:12:12', '2019-08-26 19:42:44');

-- --------------------------------------------------------

--
-- Table structure for table `satisfaction_statuses`
--

CREATE TABLE `satisfaction_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `satisfaction_statuses`
--

INSERT INTO `satisfaction_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Satisfied', 'ዝዓገበ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Satisfied', 'ዘይዓገበ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weledInPercent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `bankId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankAccountNumber` double NOT NULL,
  `transactionCode` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentModeId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chequeNo` double DEFAULT NULL,
  `currencyId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documentPaper` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`id`, `memberId`, `categoryId`, `date`, `toDate`, `weledInPercent`, `amount`, `bankId`, `branchId`, `bankAccountNumber`, `transactionCode`, `paymentModeId`, `chequeNo`, `currencyId`, `documentPaper`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(4, '14', '1', '11/03/2011', NULL, NULL, 67, '1', '1', 4, '22', '2', 4, '1', '', '1', 'active', 'false', '2018-11-29 09:03:54', '2018-11-29 09:17:38'),
(5, '14', '1', '11/03/2011', NULL, NULL, 56, '1', '1', 4, '22', '2', 4, '1', '', '1', 'active', 'false', '2018-11-29 09:13:08', '2018-11-29 09:24:09'),
(6, '14', '1', '18/03/2011', NULL, NULL, 56, '1', '1', 1, '22', '2', NULL, '1', '', '1', 'active', 'false', '2018-11-29 09:38:55', '2018-11-29 09:38:55'),
(7, '14', '2', '04/03/2011', NULL, NULL, 200, '1', '1', 4, '22', '2', 55, '1', '', '1', 'active', 'false', '2018-11-29 10:49:33', '2018-11-29 10:49:33'),
(8, '14', '2', '04/03/2011', NULL, NULL, 200, '1', '1', 4, '22', '2', 55, '1', '', '1', 'active', 'false', '2018-11-29 10:50:12', '2018-11-29 10:50:12'),
(9, '14', '1', '03/03/2011', NULL, NULL, 69, '1', '1', 444, '22', '3', NULL, '1', '', '1', 'active', 'false', '2018-11-29 10:59:31', '2018-11-29 11:35:24'),
(10, '14', '3', '11/03/2011', NULL, NULL, 1000, '1', '1', 444, '22', '2', 55, '1', '', '1', 'active', 'false', '2018-11-29 13:06:45', '2018-11-29 13:06:45'),
(11, '14', '1', '11/03/2011', NULL, NULL, 3, '1', '1', 1, '22', '2', 33, '1', '1543511929.PNG', '1', 'active', 'false', '2018-11-29 14:18:50', '2018-11-29 14:18:50'),
(12, '14', '1', '04/03/2011', NULL, NULL, 10005, '1', '1', 4, '22', '3', NULL, '1', '1543512575.jpg', '1', 'active', 'false', '2018-11-29 14:23:01', '2018-11-29 14:29:36'),
(13, '14', '1', '04/03/2011', '05/03/2016', '6', 3, '1', '1', 4, '22', '2', 55, '1', '1543532670.PNG', '1', 'active', 'false', '2018-11-29 20:04:31', '2018-11-29 20:43:31'),
(14, '14', '1', '11/03/2011', '13/03/2011', '6', 10005, '1', '1', 4, '22', '3', NULL, '1', '1543563963.PNG', '1', 'active', 'false', '2018-11-30 04:46:04', '2018-11-30 04:46:04'),
(15, '14', '1', '11/03/2011', '13/03/2011', '6', 10005, '1', '1', 4, '22', '2', 4, '1', '1543564009.PNG', '1', 'active', 'false', '2018-11-30 04:46:49', '2018-11-30 04:46:49'),
(16, '14', '1', '04/03/2011', '07/03/2012', '6', 56, '1', '1', 4, '22', '3', NULL, '1', '1543564075.PNG', '1', 'active', 'false', '2018-11-30 04:47:55', '2018-11-30 04:47:55'),
(17, '14', '1', '04/03/2011', '07/03/2011', '6', 67, '1', '1', 45, '22', '2', 55, '1', '1543565073.PNG', '1', 'active', 'false', '2018-11-30 05:04:33', '2018-11-30 05:04:33'),
(18, '14', '1', '04/03/2011', '05/03/2016', '10', 10005, '1', '1', 444, '22', '3', NULL, '1', '1543565156.PNG', '1', 'active', 'false', '2018-11-30 05:05:57', '2018-11-30 05:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `saving_categories`
--

CREATE TABLE `saving_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saving_categories`
--

INSERT INTO `saving_categories` (`id`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 'ድሌት ዕቋር', NULL, '0', 'active', 'false', '2018-12-01 08:17:43', '2018-12-01 08:17:43'),
(1, 'ጊዜ ገደብ ዕቋር', NULL, '0', 'active', 'false', '2018-12-01 08:17:43', '2018-12-01 08:17:43'),
(3, 'ወርሓዊ ዕቋር', NULL, '0', 'active', 'false', '2018-12-01 08:17:43', '2018-12-01 08:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `reportGenerationDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `paginationSize` int(11) NOT NULL DEFAULT '10',
  `reportIntervalInMonths` int(11) NOT NULL DEFAULT '6',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `reportGenerationDate`, `paginationSize`, `reportIntervalInMonths`, `created_at`, `updated_at`) VALUES
(1, '11/10/2011', 10, 6, '2018-11-27 04:54:46', '2019-06-14 20:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `social_info`
--

CREATE TABLE `social_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` int(11) NOT NULL,
  `maritalStatusId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religionId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOf_femaleChildren` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOf_maleChildren` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professionId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educationalLevelId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOf_femaleDependents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOf_maleDependents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `housing` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `readAndWrite` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ageCategory` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `abHadegaEwanTetsewaeId` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_info`
--

INSERT INTO `social_info` (`id`, `memberId`, `maritalStatusId`, `religionId`, `numberOf_femaleChildren`, `numberOf_maleChildren`, `professionId`, `educationalLevelId`, `numberOf_femaleDependents`, `numberOf_maleDependents`, `housing`, `readAndWrite`, `ageCategory`, `abHadegaEwanTetsewaeId`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(11, 17, '1', '1', '2', '4', '1', '1', '6', '3', 'ኣለዎ', 'ኣለዎ', 'ህፃናት', '5', 1, 'active', 'false', '2018-12-01 13:50:55', '2018-12-01 13:50:55'),
(10, 16, '1', '1', '2', '4', '1', '1', '6', '5', 'ኣለዎ', 'ኣለዎ', 'ህፃናት', '4', 1, 'active', 'false', '2018-12-01 10:36:39', '2018-12-01 10:36:39'),
(9, 15, '1', '1', '2', '4', '1', '1', '6', '3', 'ኣለዎ', 'ኣለዎ', 'ህፃናት', '2', 1, 'active', 'false', '2018-12-01 08:34:41', '2018-12-01 08:34:41'),
(8, 14, '1', '1', '2', '4', '1', '1', '6', '3', 'ኣለዎ', 'ኣለዎ', 'ኣባፅሕ', '4', 1, 'active', 'false', '2018-11-28 04:33:03', '2018-11-28 04:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `sub_weredas`
--

CREATE TABLE `sub_weredas` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) NOT NULL,
  `weredaId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_weredas`
--

INSERT INTO `sub_weredas` (`id`, `regionId`, `zoneId`, `weredaId`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '3', 'ንኡስ ወረዳ 1', NULL, 1, 'active', 'false', '2019-04-21 16:05:36', '2019-04-21 16:05:36'),
(2, 2, 3, '3', 'ንኡስ ወረዳ 2', NULL, 1, 'active', 'false', '2019-04-21 16:05:53', '2019-04-21 16:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `tabyas`
--

CREATE TABLE `tabyas` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00001',
  `weredaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `zoneId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `regionId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tabyas`
--

INSERT INTO `tabyas` (`id`, `code`, `weredaId`, `zoneId`, `regionId`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, '00001', '3', '3', '2', 'ብኮት', NULL, 1, 'active', 'false', '2019-04-18 19:44:43', '2019-04-18 19:44:43'),
(2, '00001', '3', '3', '2', 'ብዘት', NULL, 1, 'active', 'false', '2019-04-18 19:46:07', '2019-04-18 19:46:46'),
(3, '00001', '4', '3', '2', '01', NULL, 1, 'active', 'false', '2019-04-18 19:58:06', '2019-04-18 19:58:06'),
(4, '00001', '52', '6', '2', 'ሴሜን ምዕራብ 1', NULL, 14, 'active', 'false', '2019-07-13 11:43:56', '2019-07-13 11:43:56'),
(5, '00001', '12', '2', '2', 'ጣብያ1', NULL, 28, 'active', 'false', '2019-07-30 14:58:15', '2019-07-30 14:58:15'),
(6, '00001', '13', '2', '2', 'ጣብያ1', NULL, 28, 'active', 'false', '2019-07-30 14:58:37', '2019-07-30 14:58:37'),
(7, '00001', '14', '2', '2', 'ጣብያ1', NULL, 28, 'active', 'false', '2019-07-30 14:58:53', '2019-07-30 14:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `tabya_hafti_tefetro`
--

CREATE TABLE `tabya_hafti_tefetro` (
  `id` int(10) UNSIGNED NOT NULL,
  `tabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aynetMeadnId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_In_Kg` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabya_mahberat`
--

CREATE TABLE `tabya_mahberat` (
  `id` int(10) UNSIGNED NOT NULL,
  `tabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOfMembers` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aynetWdabeId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabya_tkalat`
--

CREATE TABLE `tabya_tkalat` (
  `id` int(10) UNSIGNED NOT NULL,
  `tabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOfClasses` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_In_Care` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isGovermentalOrg` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `numberOf_male_employees` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `numberOf_female_employees` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `createdByUserId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tekesasi_crime_type`
--

CREATE TABLE `tekesasi_crime_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `kesasiId` int(11) NOT NULL,
  `tekesasiId` int(11) NOT NULL,
  `crimeTypeId` int(11) NOT NULL,
  `akabiHgi_decisionTypeId` int(11) DEFAULT NULL,
  `lawyerSupportStatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `afterCrimeCommited` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isOpponentDecisionMaker_akabiHgi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `oppenent_akabiHgi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oppenent_akabiHgi_phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akabiHgi_decisionMaker` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decisionMaker_akabiHgi_phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_akabiHgi_decision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyerPoliceDocumentReturnDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyerPoliceDocumentReturnedDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_decisionMaker` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_betFrdi_decision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modification_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `betFrdi_decisionTypeId` int(11) DEFAULT NULL,
  `afterDefended` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amountOfMoney` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfRestriction_Year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfRestriction_Month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfRestriction_Day` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfPrison_Year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfPrison_Month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lengthOfPrison_Day` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDefendantAvaliable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `arguementType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickedOverReason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAppealerLawyer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `appealRequestedBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealRequestedBy_phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealRespondedBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appealRespondedBy_phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lawyer_appealReason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrant_Status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrant_Execution_Status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canAppeal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `punishmentType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lifeSentence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tekesasi_crime_type`
--

INSERT INTO `tekesasi_crime_type` (`id`, `ksi_mezgeb_brkiId`, `kesasiId`, `tekesasiId`, `crimeTypeId`, `akabiHgi_decisionTypeId`, `lawyerSupportStatus`, `afterCrimeCommited`, `isOpponentDecisionMaker_akabiHgi`, `oppenent_akabiHgi`, `oppenent_akabiHgi_phoneNumber`, `akabiHgi_decisionMaker`, `decisionMaker_akabiHgi_phoneNumber`, `date_of_akabiHgi_decision`, `lawyerPoliceDocumentReturnDate`, `lawyerPoliceDocumentReturnedDate`, `betFrdi_decisionMaker`, `date_of_betFrdi_decision`, `modification_status`, `betFrdi_decisionTypeId`, `afterDefended`, `amountOfMoney`, `lengthOfRestriction_Year`, `lengthOfRestriction_Month`, `lengthOfRestriction_Day`, `lengthOfPrison_Year`, `lengthOfPrison_Month`, `lengthOfPrison_Day`, `isDefendantAvaliable`, `arguementType`, `pickedOverReason`, `date`, `isAppealerLawyer`, `appealRequestedBy`, `appealRequestedBy_phoneNumber`, `appealRespondedBy`, `appealRespondedBy_phoneNumber`, `lawyer_appealReason`, `warrant_Status`, `warrant_Execution_Status`, `canAppeal`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`, `punishmentType`, `lifeSentence`) VALUES
(1, 1, 1, 1, 3, 10, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', '12344567891', '14/12/2011 1:12:0', NULL, NULL, NULL, '14/12/2011 1:40:0', 'Not_Modified', 2, 'Not_Defended', '456', NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Debate', NULL, '14/12/2011 10:20:4', 'false', NULL, NULL, NULL, NULL, NULL, 'Allowed', 'Executed', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 04:20:04', '2019-08-20 20:05:15', 'Money', NULL),
(2, 1, 1, 1, 2, 10, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', '12344567891', '14/12/2011 1:12:0', NULL, NULL, NULL, '14/12/2011 1:40:0', 'Not_Modified', 2, 'Not_Defended', NULL, '4', '5', '5', NULL, NULL, NULL, 'true', 'Debate', NULL, '14/12/2011 10:20:4', 'false', NULL, NULL, NULL, NULL, NULL, 'Allowed', 'Executed', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 04:20:04', '2019-08-20 06:41:37', 'Restriction', NULL),
(4, 2, 2, 2, 3, 10, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '14/12/2011 14:30:0', NULL, NULL, NULL, '14/12/2011 1:10:0', 'Not_Modified', 2, 'Not_Defended', '456', NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Debate', 'Other', '14/12/2011 21:1:2', 'false', NULL, NULL, NULL, NULL, NULL, 'Allowed', 'Executed', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:01:02', '2019-08-20 19:59:03', 'Money', NULL),
(7, 3, 3, 3, 2, 10, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '14/12/2011 1:2:0', '06/13/2011', '16/12/2011', NULL, '16/12/2011 1:4:0', 'Not_Modified', 2, 'Not_Defended', NULL, NULL, NULL, NULL, '8', '6', NULL, 'true', 'Negotiation', NULL, '14/12/2011 21:17:44', 'false', NULL, NULL, NULL, NULL, NULL, 'Allowed', 'Executed', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:17:44', '2019-08-20 19:33:02', 'Prison', NULL),
(6, 3, 4, 3, 1, 10, NULL, 'Crime_Commited', 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '14/12/2011 1:2:0', '06/13/2011', '15/12/2011', NULL, '16/12/2011 1:4:0', 'Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Negotiation', NULL, '14/12/2011 21:17:44', 'false', NULL, NULL, NULL, NULL, NULL, 'Allowed', 'Executed', 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:17:44', '2019-08-20 19:41:35', NULL, NULL),
(8, 4, 5, 4, 3, 10, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '15/12/2011 4:30:0', NULL, '15/12/2011', NULL, '15/12/2011 3:30:0', 'Not_Modified', 1, 'Defended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 0:58:26', 'false', NULL, NULL, NULL, NULL, NULL, 'Not_Allowed', NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 18:58:26', '2019-08-20 19:12:34', NULL, NULL),
(9, 5, 6, 5, 3, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', '12344567891', '16/12/2011 1:1:0', NULL, NULL, NULL, '16/12/2011 1:8:0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 1:12:34', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Free', 'Not_Allowed', NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:12:34', '2019-08-20 19:19:00', NULL, NULL),
(10, 6, 7, 6, 3, NULL, 'Supported', NULL, 'false', 'ርርር ርርር ርርር', NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '16/12/2011 5:7:0', NULL, NULL, NULL, '16/12/2011 5:45:0', NULL, 2, NULL, NULL, '3', '5', '5', NULL, NULL, NULL, 'true', 'Debate', NULL, '15/12/2011 1:19:0', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Free', 'Allowed', 'Executed', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:19:00', '2019-08-20 19:21:07', 'Restriction', NULL),
(11, 7, 8, 7, 2, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '15/12/2011 4:5:0', NULL, NULL, NULL, '16/12/2011 5:6:0', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, '5', NULL, 'true', 'Debate', NULL, '15/12/2011 1:33:2', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Punishment', 'Not_Allowed', NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:33:02', '2019-08-20 19:45:31', 'Prison', NULL),
(12, 7, 9, 8, 1, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '15/12/2011 4:5:0', NULL, NULL, NULL, '16/12/2011 5:6:0', NULL, 2, NULL, '500', NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Negotiation', NULL, '15/12/2011 1:41:35', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Punishment', 'Allowed', 'Executed', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:41:35', '2019-08-20 19:46:57', 'Money', NULL),
(13, 8, 10, 9, 4, 10, NULL, NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '16/12/2011 2:4:0', NULL, NULL, NULL, '16/12/2011 4:6:0', 'Not_Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 1:51:9', 'false', NULL, NULL, NULL, NULL, NULL, 'Not_Allowed', NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:51:09', '2019-08-20 19:52:23', NULL, NULL),
(14, 9, 11, 10, 4, NULL, 'Not_Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '15/12/2011 4:6:0', NULL, NULL, NULL, '16/12/2011 3:6:0', NULL, 2, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, 'true', 'Debate', NULL, '15/12/2011 1:52:23', 'false', NULL, NULL, 'ከበደ ኣበበ ሃይሉ', NULL, 'On_Free', 'Not_Allowed', NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:52:23', '2019-08-20 19:56:43', 'Restriction', NULL),
(15, 10, 12, 11, 4, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '16/12/2011 3:5:0', NULL, NULL, NULL, '16/12/2011 4:4:0', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Debate', NULL, '15/12/2011 1:56:43', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Punishment', 'Allowed', 'Executed', 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:56:43', '2019-08-20 19:57:58', 'Additional_Care_Punishments', NULL),
(16, 11, 13, 12, 3, NULL, 'Not_Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '16/12/2011 3:5:0', NULL, NULL, NULL, '16/12/2011 3:7:0', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Debate', NULL, '15/12/2011 1:59:3', 'false', 'ተክላይ ገብሩ ሓድጉ', NULL, 'ተክላይ ገብሩ ሓድጉ', NULL, 'On_Punishment', 'Not_Allowed', NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:59:03', '2019-08-20 20:03:02', 'Additional_Care_Punishments', NULL),
(17, 12, 14, 13, 3, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '18/12/2011 2:4:0', NULL, NULL, NULL, '16/12/2011 4:6:0', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Debate', NULL, '15/12/2011 2:3:2', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Punishment', 'Not_Allowed', NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:03:02', '2019-08-20 20:04:28', 'Additional_Care_Punishments', NULL),
(18, 13, 15, 14, 3, NULL, 'Not_Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '18/12/2011 3:5:0', NULL, NULL, NULL, '16/12/2011 5:7:0', NULL, 2, NULL, NULL, '4', '5', '5', NULL, NULL, NULL, 'true', 'Debate', NULL, '15/12/2011 2:5:15', 'false', NULL, NULL, 'ከበደ ኣበበ ሃይሉ', NULL, 'On_Punishment', 'Not_Allowed', NULL, 'false', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:05:15', '2019-08-20 20:07:13', 'Restriction', NULL),
(19, 14, 16, 15, 3, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '17/12/2011 4:6:0', NULL, NULL, NULL, '23/12/2011 4:2:0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 2:7:13', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Punishment', 'Not_Allowed', NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:07:13', '2019-08-20 20:08:39', NULL, NULL),
(20, 15, 17, 16, 2, 10, NULL, NULL, 'true', NULL, NULL, 'sdg sd gsdg', NULL, '15/12/2011 4:7:0', NULL, NULL, NULL, '16/12/2011 4:7:0', 'Not_Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 14:13:2', 'false', NULL, NULL, NULL, NULL, NULL, 'Allowed', 'Not_Executed', 'false', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:13:02', '2019-08-21 08:14:57', NULL, NULL),
(21, 16, 18, 17, 2, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '15/12/2011 3:6:0', NULL, NULL, NULL, '15/12/2011 4:6:0', NULL, 2, NULL, '456', NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Debate', NULL, '15/12/2011 14:14:57', 'true', 'sdg saeg asg', NULL, NULL, NULL, 'On_Free', 'Not_Allowed', NULL, 'true', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:14:57', '2019-08-21 08:22:33', 'Money', NULL),
(22, 17, 19, 18, 3, 10, NULL, NULL, 'true', NULL, NULL, 'dfdsfhwh', NULL, '16/12/2011 3:4:0', NULL, NULL, NULL, '15/12/2011 2:5:0', 'Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 14:26:4', 'false', NULL, NULL, NULL, NULL, NULL, 'Not_Allowed', NULL, 'false', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:26:04', '2019-08-21 08:29:33', NULL, NULL),
(23, 17, 20, 18, 2, 10, NULL, NULL, 'true', NULL, NULL, 'dfdsfhwh', NULL, '16/12/2011 3:4:0', NULL, NULL, NULL, '15/12/2011 2:5:0', 'Modified', 1, 'Not_Defended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 14:26:4', 'false', NULL, NULL, NULL, NULL, NULL, 'Not_Allowed', NULL, 'false', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:26:04', '2019-08-21 08:28:18', NULL, NULL),
(24, 18, 21, 19, 2, NULL, 'Not_Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '15/12/2011 3:7:0', NULL, NULL, NULL, '15/12/2011 3:59:0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 14:28:18', 'true', '568487n 65 86', NULL, NULL, NULL, 'On_Free', 'Allowed', 'Not_Executed', 'false', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:28:18', '2019-08-21 12:07:17', NULL, NULL),
(25, 18, 22, 20, 3, NULL, 'Not_Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', NULL, '15/12/2011 3:7:0', NULL, NULL, NULL, '15/12/2011 3:59:0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, '15/12/2011 14:29:33', 'false', NULL, NULL, 'adg ergery ert', '437345738', 'On_Free', 'Allowed', 'Not_Executed', 'true', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:29:33', '2019-08-21 12:05:53', NULL, NULL),
(26, 19, 23, 21, 2, NULL, 'Supported', NULL, 'true', NULL, NULL, 'ግርማይ በርሀ ኣብርሃ', '12344567891', '15/12/2011 0:1:0', NULL, NULL, NULL, '15/12/2011 23:28:0', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', 'Negotiation', NULL, '15/12/2011 18:7:17', 'true', 'ተክላይ ገብሩ ሓድጉ', NULL, NULL, NULL, 'On_Free', 'Not_Allowed', NULL, 'true', NULL, 34, NULL, 'active', 'false', '2019-08-21 12:07:17', '2019-08-21 12:08:54', 'Additional_Care_Punishments', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tekesesti_ksi_mezgeb`
--

CREATE TABLE `tekesesti_ksi_mezgeb` (
  `id` int(10) UNSIGNED NOT NULL,
  `ksi_mezgeb_brkiId` int(11) NOT NULL,
  `fullName` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weredaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabyaId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) NOT NULL,
  `nationalityId` int(11) NOT NULL,
  `religionId` int(11) NOT NULL,
  `merriage_statusId` int(11) NOT NULL,
  `date` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tekesesti_ksi_mezgeb`
--

INSERT INTO `tekesesti_ksi_mezgeb` (`id`, `ksi_mezgeb_brkiId`, `fullName`, `phoneNumber`, `gender`, `address`, `regionId`, `zoneId`, `weredaId`, `tabyaId`, `age`, `nationalityId`, `religionId`, `merriage_statusId`, `date`, `remark`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', NULL, '2', '3', '3', '1', 67, 5, 1, 2, '14/12/2011 10:19:52', NULL, 34, NULL, 'active', 'false', '2019-08-20 04:19:52', '2019-08-20 04:19:52'),
(2, 2, 'በርሀ ኪሮስ ገብሩ', '3423445680', 'Male', NULL, '2', '3', '3', '1', 55, 5, 1, 1, '14/12/2011 21:0:59', NULL, 34, NULL, 'active', 'false', '2019-08-20 14:58:03', '2019-08-20 15:00:59'),
(3, 3, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Female', NULL, '2', '3', '3', '1', 55, 5, 1, 1, '14/12/2011 21:28:9', NULL, 34, NULL, 'active', 'false', '2019-08-20 15:12:33', '2019-08-20 15:28:09'),
(4, 4, 'በርሀ ኪሮስ ገብሩ', NULL, 'Male', NULL, '2', '3', '3', NULL, 21, 5, 1, 1, '15/12/2011 0:58:21', NULL, 34, NULL, 'active', 'false', '2019-08-20 18:58:21', '2019-08-20 18:58:21'),
(5, 5, 'በርሀ ኪሮስ ገብሩ', NULL, 'Male', NULL, '2', '3', '3', NULL, 21, 5, 1, 1, '15/12/2011 1:12:34', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:12:34', '2019-08-20 19:12:34'),
(6, 6, 'በርሀ ኪሮስ ገብሩ', NULL, 'Male', NULL, '2', '3', '3', NULL, 21, 5, 1, 1, '15/12/2011 1:19:0', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:19:00', '2019-08-20 19:19:00'),
(7, 7, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Female', NULL, '2', '3', '3', '1', 55, 5, 1, 1, '15/12/2011 1:33:2', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:33:02', '2019-08-20 19:33:02'),
(8, 7, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Female', NULL, '2', '3', '3', '1', 55, 5, 1, 1, '15/12/2011 1:41:35', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:41:35', '2019-08-20 19:41:35'),
(9, 8, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', NULL, '2', '3', '3', '1', 23, 5, 1, 1, '15/12/2011 1:51:1', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:51:01', '2019-08-20 19:51:01'),
(10, 9, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', NULL, '2', '3', '3', '1', 23, 5, 1, 1, '15/12/2011 1:52:23', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:52:23', '2019-08-20 19:52:23'),
(11, 10, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', NULL, '2', '3', '3', '1', 23, 5, 1, 1, '15/12/2011 1:56:43', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:56:43', '2019-08-20 19:56:43'),
(12, 11, 'በርሀ ኪሮስ ገብሩ', '3423445680', 'Male', NULL, '2', '3', '3', '1', 55, 5, 1, 1, '15/12/2011 1:59:3', NULL, 34, NULL, 'active', 'false', '2019-08-20 19:59:03', '2019-08-20 19:59:03'),
(13, 12, 'በርሀ ኪሮስ ገብሩ', '3423445680', 'Male', NULL, '2', '3', '3', '1', 55, 5, 1, 1, '15/12/2011 2:3:2', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:03:02', '2019-08-20 20:03:02'),
(14, 13, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', NULL, '2', '3', '3', '1', 67, 5, 1, 2, '15/12/2011 2:5:15', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:05:15', '2019-08-20 20:05:15'),
(15, 14, 'በርሀ ኪሮስ ገብሩ', '3423445690', 'Male', NULL, '2', '3', '3', '1', 67, 5, 1, 2, '15/12/2011 2:7:13', NULL, 34, NULL, 'active', 'false', '2019-08-20 20:07:13', '2019-08-20 20:07:13'),
(16, 15, 'sdga dga', NULL, 'Male', NULL, '2', '3', '3', NULL, 2, 5, 1, 1, '15/12/2011 14:12:51', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:12:34', '2019-08-21 08:12:51'),
(17, 16, 'sdga dga', NULL, 'Male', NULL, '2', '3', '3', NULL, 2, 5, 1, 1, '15/12/2011 14:14:57', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:14:57', '2019-08-21 08:14:57'),
(18, 17, 'agarg', '345767859', 'Male', NULL, '2', '3', '3', '1', 4, 5, 1, 1, '15/12/2011 14:25:57', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:25:57', '2019-08-21 08:25:57'),
(19, 18, 'agarg', '345767859', 'Male', NULL, '2', '3', '3', '1', 4, 5, 1, 1, '15/12/2011 14:28:18', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:28:18', '2019-08-21 08:28:18'),
(20, 18, 'agarg', '345767859', 'Male', NULL, '2', '3', '3', '1', 4, 5, 1, 1, '15/12/2011 14:29:33', NULL, 33, NULL, 'active', 'false', '2019-08-21 08:29:33', '2019-08-21 08:29:33'),
(21, 19, 'agarg', '345767859', 'Male', NULL, '2', '3', '3', '1', 4, 5, 1, 1, '15/12/2011 18:7:17', NULL, 34, NULL, 'active', 'false', '2019-08-21 12:07:17', '2019-08-21 12:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `termsofpayment`
--

CREATE TABLE `termsofpayment` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainig_status`
--

CREATE TABLE `trainig_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasTrained` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satisfactionLevel` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trainingDate` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trainig_status`
--

INSERT INTO `trainig_status` (`id`, `memberId`, `hasTrained`, `satisfactionLevel`, `trainingDate`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, '8', 'ወሲዱ', 'ዓጊቡ', '07/03/2011', 'active', 'false', '2018-11-27 18:41:30', '2018-11-27 18:41:30'),
(2, '9', 'ወሲዱ', 'ዓጊቡ', '07/03/2011', 'active', 'false', '2018-11-27 18:43:20', '2018-11-27 18:43:20'),
(3, '10', 'ወሲዱ', 'ዓጊቡ', '07/03/2011', 'active', 'false', '2018-11-27 18:45:55', '2018-11-27 18:45:55'),
(4, '11', 'ወሲዱ', 'ዓጊቡ', '12/03/2011', 'active', 'false', '2018-11-27 19:44:53', '2018-11-27 19:44:53'),
(5, '12', 'ወሲዱ', 'ዓጊቡ', '12/03/2011', 'active', 'false', '2018-11-27 19:50:06', '2018-11-27 19:50:06'),
(6, '13', 'ወሲዱ', 'ዓጊቡ', '12/03/2011', 'active', 'false', '2018-11-27 19:53:26', '2018-11-27 19:53:26'),
(7, '14', 'ወሲዱ', 'ዓጊቡ', '25/03/2011', 'active', 'false', '2018-11-27 20:14:42', '2018-11-29 22:53:18'),
(8, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 04:15:05', '2018-11-28 04:15:05'),
(9, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 04:21:21', '2018-11-28 04:21:21'),
(10, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 04:33:03', '2018-11-28 04:33:03'),
(11, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 04:43:17', '2018-11-28 04:43:17'),
(12, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 04:53:15', '2018-11-28 04:53:15'),
(13, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 05:09:35', '2018-11-28 05:09:35'),
(14, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 05:11:34', '2018-11-28 05:11:34'),
(15, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-28 06:57:31', '2018-11-28 06:57:31'),
(16, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-29 21:52:49', '2018-11-29 21:52:49'),
(17, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-29 21:52:58', '2018-11-29 21:52:58'),
(18, '14', 'ወሲዱ', 'ዓጊቡ', '11/03/2011', 'active', 'false', '2018-11-29 22:30:59', '2018-11-29 22:30:59'),
(19, '14', 'ኣይወሰደን', NULL, NULL, 'active', 'false', '2018-11-29 22:33:19', '2018-11-29 22:33:19'),
(20, '14', 'ኣይወሰደን', NULL, NULL, 'active', 'false', '2018-11-29 22:33:38', '2018-11-29 22:33:38'),
(21, '14', 'ኣይወሰደን', NULL, NULL, 'active', 'false', '2018-11-29 22:35:44', '2018-11-29 22:35:44'),
(22, '14', 'ኣይወሰደን', NULL, NULL, 'active', 'false', '2018-11-29 22:38:16', '2018-11-29 22:38:16'),
(23, '14', 'ኣይወሰደን', NULL, NULL, 'active', 'false', '2018-11-29 22:38:49', '2018-11-29 22:38:49'),
(24, '15', 'ወሲዱ', 'ዓጊቡ', '12/03/2011', 'active', 'false', '2018-12-01 08:34:41', '2018-12-01 08:34:41'),
(25, '16', 'ወሲዱ', 'ዓጊቡ', '12/03/2011', 'active', 'false', '2018-12-01 10:36:39', '2018-12-01 10:36:39'),
(26, '17', 'ወሲዱ', 'ዓጊቡ', '12/03/2011', 'active', 'false', '2018-12-01 13:50:55', '2018-12-01 13:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `truthness_statuses`
--

CREATE TABLE `truthness_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `truthness_statuses`
--

INSERT INTO `truthness_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'true', 'ሓቂ ዝኮነ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'not_true', 'ሓቂ ዘይኮነ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `brkiId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `regionId` int(11) DEFAULT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `subWeredaId` int(11) DEFAULT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `brkiId`, `roleId`, `departmentId`, `regionId`, `zoneId`, `weredaId`, `subWeredaId`, `name`, `phoneNumber`, `email`, `password`, `remember_token`, `createdByUserId`, `updatedByUserId`, `status`, `created_at`, `updated_at`) VALUES
(14, 3, 1, 3, 2, NULL, NULL, NULL, 'admin', NULL, 'admin@gmail.com', '$2y$10$IgC2SJWNy9Si5LOV8IFlnu3HCz2kCed7kXGvax6fS1hgArFdLdjIG', 'yb0W03AjDgDk2ISTyq7dSvwrv3eTr4hM2K5pJ3tgc4wUyUltjaosn38nqcCK', 0, 14, 'active', '2019-06-10 19:42:21', '2019-07-30 13:27:39'),
(24, 2, 2, 3, 2, 3, NULL, NULL, 'zone1', NULL, NULL, '$2y$10$pm7iMQC59.qj7b80e.5gcuTUmVlIDbCvtfsRBFeZuXLBJb5AiHT.2', '9BkA74E7EnkYBcdLqNIfxzb4lTB1GZvpIo07vgmmaORQTZu3LXoImbnje7wy', 14, 14, 'active', '2019-06-28 01:54:46', '2019-07-31 06:00:55'),
(25, 2, 2, 3, 2, 2, NULL, NULL, 'ዞባ ምዕራብ1', '46869798798', NULL, '$2y$10$pyS4EtrhJUm61dMZu3Wwaue1pheAos4fRpZwvV5hTJiwPa/VY2nBW', 'E5GoXTsIaa5D8Xwxr2CyVE60vEpOvoXE4rI8C46ZkVLbjO2KMffD5Lx3Pduf', 14, 14, 'active', '2019-06-28 01:56:35', '2019-06-28 04:41:40'),
(26, 4, 2, 3, 2, NULL, NULL, NULL, 'ሰበር ክልል1', '12123546', NULL, '$2y$10$cuLk13MMpdKRKT32hY8Ya.lHTgcojeR5ENF3cBaoM5LeTlqb1g8xi', 'IB30qR5iSP1DazMpTIw9i3H433LMIFIhdsEw0yELhVphn7mpTD0UUyPklzxT', 14, 14, 'active', '2019-06-28 05:52:41', '2019-06-28 05:54:03'),
(27, 1, 2, 3, 2, 3, 3, NULL, 'wereda1', NULL, 'yibrahg1@gmail.com', '$2y$10$znEpK3T49.nNVMoW6mIjnOQzxXpN.6Z097MlZ1myo.FH5eqqanL4W', 'hnjngnUADyWBTtLxOn7mEIWWZr4z43BuwoJW6nPwpTlhLEEqGylBBucT1dTc', 14, 14, 'active', '2019-07-05 06:00:16', '2019-08-12 18:25:51'),
(28, 3, 2, 3, 2, NULL, NULL, NULL, 'ክልል 1', '0945735838', NULL, '$2y$10$5kFq.h/YXdmIP6l26uytkO0MjrTPwMcEz1p1XUV7Xbx/En5aY.UmG', 'g0i9ggaBUpAuMphaPGrPkbb57hWW8vShMa3hfECduTTZ9ZB3JiykF7eR89Yq', 24, NULL, 'active', '2019-07-11 07:44:12', '2019-07-11 07:44:12'),
(29, 4, 2, 2, 2, NULL, NULL, NULL, 'ክልል ፍታብሄር 1', NULL, NULL, '$2y$10$D4oBx9W1QbvDlibbEUm.hO/6j8qOvFsJHqYzSmRJejOT8Fy2gLf5e', 'NkqaBX3TDj0MbtJgGzNFpfnzWeey6GzCoBKVQM2dC38bHPLKirLPKCdJCcTL', 24, NULL, 'active', '2019-07-15 16:56:36', '2019-07-15 16:56:36'),
(30, 1, 2, 4, 2, 3, 4, NULL, 'ወረዳ2', '0945735838', NULL, '$2y$10$gMN0jt/lS0gqv56Jbc6R4OgvPf0jZZQFpUmD.i1H4yyqC3BvM0eHe', 'Q31OiaOFtzLwa9TrHx4FK28FUUEccSCUA4rbYWrK3yuIs9uUNU2Vyi71LENI', 14, 14, 'active', '2019-07-16 04:11:57', '2019-08-12 18:27:52'),
(31, 4, 2, 3, 2, NULL, NULL, NULL, 'ሰበር ክልል2', '0945735838', NULL, '$2y$10$gDoYPWz3.4L8irO671/GAOOAJTRXyiYajzulON.g7oKKjfgwLmRwO', 'sGAtMb4oF5mCdHHgxJ4tPYIIilJePAHO64fbrGPKTKEFnQgPGNhlfwait8Cn', 14, 14, 'active', '2019-07-17 05:27:32', '2019-07-31 05:07:44'),
(32, 2, 1, 3, 2, 3, NULL, NULL, 'ዞባ ምብራቅ ሓላፊ', NULL, NULL, '$2y$10$geWLP0ett/887onjOE6/I.pQmTacu4Rdqm3EyAFQpvEnDfHbiWly6', 'EGVeriUy7vl9Gvb0MvUFw1ZYauHWY47XwRNXcsUbcXRWMXbPzFEKz17hEqnr', 14, 33, 'active', '2019-07-23 06:03:19', '2019-08-26 19:35:10'),
(33, 2, 2, 2, 2, 9, NULL, NULL, 'መቀለ1', NULL, NULL, '$2y$10$wdi1QsVlnThXHeKTzcEFme/lYqr2fXwUWQFwAZGzFjmIu0CIHLh9i', 'qMuHUwFAJ5hCl6guvjTim7vjSdVOyPDsJcjIPvW3lu4TmZkkEQs8lAA08kZT', 28, 33, 'active', '2019-08-04 07:15:51', '2019-08-26 19:31:56'),
(34, 4, 2, 4, 2, NULL, NULL, NULL, 'ክልል 12', NULL, NULL, '$2y$10$7Qr8T8LVBun7jsLor4IcDu94TbzVc8GgjVCGrQ3RXtErnN0Mnnvu.', 'ozWDdXRZ1DPo5Rkg0g7X7CHiYtkWULCcXQ80vwlL2PSYmaJooFFWavC9tgWA', 28, 33, 'active', '2019-08-05 07:03:40', '2019-08-26 19:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `users_bkp`
--

CREATE TABLE `users_bkp` (
  `id` int(10) UNSIGNED NOT NULL,
  `brkiId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_purchases`
--

CREATE TABLE `users_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `inCartQuantity` int(11) NOT NULL DEFAULT '0',
  `orderedQuantity` int(11) NOT NULL DEFAULT '0',
  `purchasedQuantity` int(11) NOT NULL DEFAULT '0',
  `inCartDeletedQuantity` int(11) NOT NULL DEFAULT '0',
  `orderedDeletedQuantity` int(11) NOT NULL DEFAULT '0',
  `purchasedDeletedQuantity` int(11) NOT NULL DEFAULT '0',
  `approvedByUserId` int(11) NOT NULL DEFAULT '0',
  `ordered_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `fullName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postalCode` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountNumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_zone_wereda_kebelles`
--

CREATE TABLE `user_zone_wereda_kebelles` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `regionId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `zoneId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weredaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tabyaId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kebelleId` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `waninat`
--

CREATE TABLE `waninat` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waninat`
--

INSERT INTO `waninat` (`id`, `name`, `keyWord`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(10, 'ንብረት', 'Property', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(7, 'ገንዘብ', 'Money', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(8, 'ገዛ', 'House', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(9, 'መሬት', 'Land', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(6, 'መስርሕን ሰራሕተኛን', 'Employer_Employee', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(4, 'ውዕሊ', 'Deal', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(5, 'ካብ ውዕሊ ወፃኢ', 'Out_Of_Deal', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(3, 'ኣቦነት ምርግጋፅ', 'Father_Approval', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(2, 'ሞግዚትነት ምርግጋፅ', 'Caretaker_Approval', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(1, 'ውርሲ ምልክታ', 'Inherit_Application', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(11, 'ውርሲ ክርክር', 'Inherit', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14'),
(12, 'ካልእ', 'Other', NULL, 'active', 'false', '2019-06-11 16:23:14', '2019-06-11 16:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `wannet_menberi`
--

CREATE TABLE `wannet_menberi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weredas`
--

CREATE TABLE `weredas` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL DEFAULT '1',
  `zoneId` int(11) NOT NULL DEFAULT '1',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weredas`
--

INSERT INTO `weredas` (`id`, `regionId`, `zoneId`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 'ጋንታ ኣፈሹም', NULL, 1, 'active', 'false', '2019-04-18 19:42:07', '2019-04-18 19:42:07'),
(4, 2, 3, 'ዓዲግራት', NULL, 1, 'active', 'false', '2019-04-18 19:42:56', '2019-04-18 19:43:22'),
(5, 2, 3, 'ኣፅቢ ወንበርታ', NULL, 14, 'active', 'false', '2019-07-08 01:31:16', '2019-07-08 01:31:16'),
(6, 2, 3, 'ኢሮብ', NULL, 14, 'active', 'false', '2019-07-08 01:31:41', '2019-07-08 01:31:41'),
(7, 2, 3, 'ጉሎመኸዳ', NULL, 14, 'active', 'false', '2019-07-08 01:32:06', '2019-07-08 01:32:06'),
(8, 2, 3, 'ሓውዜን', NULL, 14, 'active', 'false', '2019-07-08 01:32:33', '2019-07-08 01:32:33'),
(9, 2, 3, 'ሳ/ፃፅዳእምባ', NULL, 14, 'active', 'false', '2019-07-08 01:32:55', '2019-07-08 01:32:55'),
(10, 2, 3, 'ክልተ ኣውላዕሎ', NULL, 14, 'active', 'false', '2019-07-08 01:33:18', '2019-07-08 01:33:18'),
(11, 2, 3, 'ውቕሮ', NULL, 14, 'active', 'false', '2019-07-08 01:33:54', '2019-07-08 01:33:54'),
(12, 2, 2, 'ቓፍታ ሑመራ', NULL, 14, 'active', 'false', '2019-07-08 01:34:31', '2019-07-08 01:34:31'),
(13, 2, 2, 'ፀገዴ', NULL, 14, 'active', 'false', '2019-07-08 01:34:50', '2019-07-08 01:34:50'),
(14, 2, 2, 'ወልቃይት', NULL, 14, 'active', 'false', '2019-07-08 01:35:23', '2019-07-08 01:35:23'),
(15, 2, 2, 'ከተማ ሑመራ', NULL, 14, 'active', 'false', '2019-07-08 01:35:49', '2019-07-08 01:35:49'),
(16, 2, 9, 'መቐለ ክ/ከተማ ዓዲ-ሓቂ', NULL, 14, 'active', 'false', '2019-07-08 01:36:40', '2019-07-08 01:36:40'),
(17, 2, 9, 'መቐለ ክ/ከተማ ዓይደር', NULL, 14, 'active', 'false', '2019-07-08 01:37:15', '2019-07-08 01:37:15'),
(18, 2, 9, 'መቐለ ክ/ከተማ ሓድነት', NULL, 14, 'active', 'false', '2019-07-08 01:37:42', '2019-07-08 01:37:42'),
(19, 2, 9, 'መቐለ ክ/ከተማ ሓወልቲ', NULL, 14, 'active', 'false', '2019-07-08 01:38:10', '2019-07-08 01:38:10'),
(20, 2, 9, 'መቐለ ክ/ከተማ ዂሓ', NULL, 14, 'active', 'false', '2019-07-08 01:38:38', '2019-07-08 01:38:38'),
(21, 2, 9, 'መቐለ ክ/ከተማ ሰሜን', NULL, 14, 'active', 'false', '2019-07-08 01:39:03', '2019-07-08 01:39:03'),
(22, 2, 9, 'መቐለ ክ/ከተማ ቀዳማይ ወያነ', NULL, 14, 'active', 'false', '2019-07-08 01:39:40', '2019-07-08 01:39:40'),
(23, 2, 8, 'ኣበርገለ', NULL, 14, 'active', 'false', '2019-07-08 01:40:12', '2019-07-08 01:40:12'),
(24, 2, 8, 'ገፀር ኣድዋ', NULL, 14, 'active', 'false', '2019-07-08 01:40:38', '2019-07-08 01:40:38'),
(25, 2, 8, 'ኣሕፈሮም', NULL, 14, 'active', 'false', '2019-07-08 01:41:00', '2019-07-08 01:41:00'),
(26, 2, 8, 'ቆላ ተምቤን', NULL, 14, 'active', 'false', '2019-07-08 01:41:39', '2019-07-08 01:41:39'),
(27, 2, 8, 'ላ/ማይጨው', NULL, 14, 'active', 'false', '2019-07-08 01:42:02', '2019-07-08 01:42:02'),
(28, 2, 8, 'መረብ ለኸ', NULL, 14, 'active', 'false', '2019-07-08 01:42:24', '2019-07-08 01:42:24'),
(29, 2, 8, 'ናዕዴር ዓዴት', NULL, 14, 'active', 'false', '2019-07-08 01:42:46', '2019-07-08 01:42:46'),
(30, 2, 8, 'ታ/ማይጨው', NULL, 14, 'active', 'false', '2019-07-08 01:43:09', '2019-07-08 01:43:09'),
(31, 2, 8, 'ወርዒ ለኸ', NULL, 14, 'active', 'false', '2019-07-08 01:43:33', '2019-07-08 01:43:33'),
(32, 2, 8, 'ከተማ ዓድዋ', NULL, 14, 'active', 'false', '2019-07-08 01:43:57', '2019-07-08 01:43:57'),
(33, 2, 8, 'ዓብይ ዓዲ', NULL, 14, 'active', 'false', '2019-07-08 01:44:25', '2019-07-08 01:44:25'),
(34, 2, 8, 'ከተማ ኣክሱም', NULL, 14, 'active', 'false', '2019-07-08 01:44:46', '2019-07-08 01:44:46'),
(35, 2, 7, 'እንደርታ', NULL, 14, 'active', 'false', '2019-07-08 01:45:44', '2019-07-08 01:45:44'),
(36, 2, 7, 'ሕ/ወጅራት', NULL, 14, 'active', 'false', '2019-07-08 01:46:03', '2019-07-08 01:46:03'),
(37, 2, 7, 'ሳ/ሳምረ', NULL, 14, 'active', 'false', '2019-07-08 01:46:24', '2019-07-08 01:46:24'),
(38, 2, 7, 'ደጉዓ ተምቤን', NULL, 14, 'active', 'false', '2019-07-08 01:47:09', '2019-07-08 01:47:09'),
(39, 2, 4, 'ኣላጀ', NULL, 14, 'active', 'false', '2019-07-08 01:48:12', '2019-07-08 01:48:12'),
(40, 2, 4, 'ራያ ኣላማጣ', NULL, 14, 'active', 'false', '2019-07-08 01:48:34', '2019-07-08 01:48:34'),
(41, 2, 4, 'እንዳ መኾኒ', NULL, 14, 'active', 'false', '2019-07-08 01:48:59', '2019-07-08 01:48:59'),
(42, 2, 4, 'ኦፍላ', NULL, 14, 'active', 'false', '2019-07-08 01:49:32', '2019-07-08 01:49:32'),
(43, 2, 4, 'ራያ ዓዘቦ', NULL, 14, 'active', 'false', '2019-07-08 01:49:54', '2019-07-08 01:49:54'),
(44, 2, 4, 'ከተማ ኣላማጣ', NULL, 14, 'active', 'false', '2019-07-08 01:50:20', '2019-07-08 01:50:20'),
(45, 2, 4, 'ከተማ ማይጨው', NULL, 14, 'active', 'false', '2019-07-08 01:50:42', '2019-07-08 01:50:42'),
(46, 2, 4, 'ከተማ ኮረም', NULL, 14, 'active', 'false', '2019-07-08 01:51:07', '2019-07-08 01:51:07'),
(47, 2, 6, 'ኣሰገደ ፅምብላ', NULL, 14, 'active', 'false', '2019-07-08 01:52:47', '2019-07-08 01:52:47'),
(48, 2, 6, 'ላዕላይ ኣድያቦ', NULL, 14, 'active', 'false', '2019-07-08 01:53:07', '2019-07-08 01:53:07'),
(49, 2, 6, 'መደባይ ዛና', NULL, 14, 'active', 'false', '2019-07-08 01:53:26', '2019-07-08 01:53:26'),
(50, 2, 6, 'ታሕታይ ኣድያቦ', NULL, 14, 'active', 'false', '2019-07-08 01:53:46', '2019-07-08 01:53:46'),
(51, 2, 6, 'ታሕታይ ቆራሮ', NULL, 14, 'active', 'false', '2019-07-08 01:54:10', '2019-07-08 01:54:10'),
(52, 2, 6, 'ፀለምቲ', NULL, 14, 'active', 'false', '2019-07-08 01:54:32', '2019-07-08 01:54:32'),
(53, 2, 6, 'ከተማ ሸራሮ', NULL, 14, 'active', 'false', '2019-07-08 01:54:53', '2019-07-08 01:54:53'),
(54, 2, 6, 'ሽረ እንዳስላሴ', NULL, 14, 'active', 'false', '2019-07-08 01:55:17', '2019-07-08 01:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `currencyId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `memberId`, `categoryId`, `date`, `amount`, `currencyId`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, '14', '1', '06/03/2011', 10, '1', '1', 'active', 'false', '2018-11-29 12:42:02', '2018-11-29 12:42:02'),
(2, '14', '1', '06/03/2011', 10, '1', '1', 'active', 'false', '2018-11-29 12:42:39', '2018-11-29 12:42:39'),
(3, '14', '3', '27/03/2011', 500, '1', '1', 'active', 'false', '2018-11-29 13:07:19', '2018-11-29 13:07:19'),
(4, '14', '1', '01/03/2011', 178, '1', '1', 'active', 'false', '2018-11-30 05:42:24', '2018-11-30 05:42:24'),
(5, '14', '2', '05/03/2011', 45, '1', '1', 'active', 'false', '2018-11-30 05:43:48', '2018-11-30 05:43:48'),
(6, '14', '3', '04/03/2011', 15, '1', '1', 'active', 'false', '2018-11-30 05:44:28', '2018-11-30 16:05:56'),
(7, '14', '2', '2011/3/21', 45, '1', '1', 'active', 'false', '2018-11-30 16:07:41', '2018-11-30 16:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `witness_avaliability_statuses`
--

CREATE TABLE `witness_avaliability_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `witness_avaliability_statuses`
--

INSERT INTO `witness_avaliability_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Avaliable_In_Court', 'ናብ ቤትፍርዲ ዝቐረበ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Avaliable_In_Court', 'ናብ ቤትፍርዲ ዘይቐረበ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `witness_follow_up`
--

CREATE TABLE `witness_follow_up` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `weredaId` int(11) DEFAULT NULL,
  `tabyaId` int(11) DEFAULT NULL,
  `akabiHgiMezgebKutsri` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_a_brki` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brkiId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defendant_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crime_typeId` int(11) NOT NULL,
  `crime_weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness_gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalityId` int(11) NOT NULL,
  `merriage_statusId` int(11) NOT NULL,
  `accuser_relationId` int(11) NOT NULL,
  `defendant_relationId` int(11) NOT NULL,
  `witness_avaliabilityId` int(11) NOT NULL,
  `not_available_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_statusId` int(11) NOT NULL,
  `not_remembered_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_correctness_statusId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness_not_correct_accused` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_sucurity_statusId` int(11) NOT NULL,
  `not_followed_up_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_safety_statusId` int(11) DEFAULT NULL,
  `witness_not_safe_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_for_witness_hearing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness_heared_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness_appointment_count` int(11) NOT NULL,
  `witness_back_forth_count` int(11) NOT NULL,
  `witness_payment_statusId` int(11) NOT NULL,
  `witness_paid_amount` double(8,2) DEFAULT NULL,
  `witness_not_paid_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recognition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_payablity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_not_payable_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kunetat_tetseno_mftar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kunetat_dgaf` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dgaf_zeytegeberelu_mknyat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_satisfaction_statusId` int(11) NOT NULL,
  `witness_not_satisfied_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_follow_up_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness_follow_up_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `follow_up_approved_lawyer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `follow_up_approved_lawyer_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdByUserId` int(11) NOT NULL,
  `updatedByUserId` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `witness_follow_up`
--

INSERT INTO `witness_follow_up` (`id`, `regionId`, `zoneId`, `weredaId`, `tabyaId`, `akabiHgiMezgebKutsri`, `phoneNumber`, `created_a_brki`, `entryDate`, `brkiId`, `defendant_name`, `crime_typeId`, `crime_weight`, `witness_name`, `witness_address`, `witness_age`, `witness_gender`, `nationalityId`, `merriage_statusId`, `accuser_relationId`, `defendant_relationId`, `witness_avaliabilityId`, `not_available_reason`, `remember_statusId`, `not_remembered_reason`, `witness_correctness_statusId`, `witness_not_correct_accused`, `witness_sucurity_statusId`, `not_followed_up_reason`, `witness_safety_statusId`, `witness_not_safe_reason`, `date_for_witness_hearing`, `witness_heared_date`, `witness_appointment_count`, `witness_back_forth_count`, `witness_payment_statusId`, `witness_paid_amount`, `witness_not_paid_reason`, `recognition`, `witness_payablity`, `witness_not_payable_reason`, `kunetat_tetseno_mftar`, `kunetat_dgaf`, `dgaf_zeytegeberelu_mknyat`, `witness_satisfaction_statusId`, `witness_not_satisfied_reason`, `additional_remark`, `witness_follow_up_name`, `witness_follow_up_date`, `follow_up_approved_lawyer_name`, `follow_up_approved_lawyer_date`, `createdByUserId`, `updatedByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 3, 1, 'aa dd dd', '0945735838', 'Breaking_Region', '7/12/2011', '4', 'abebe dawit haftu', 12, 'Light_Weight_Crimes', 'sghg dgdfg', NULL, '6', 'Female', 5, 2, 2, 1, 2, 'Not_Ordered', 2, 'Not_Done_Right', 'Witnessed_A_Lie', 'Accused_For_Lie', 2, 'Not_Done_Right', 2, 'No_Need_To_Follow_Up', '24/12/2011', '23/12/2011', 6, 4, 2, NULL, 'Not_Given', 'ዘይተውሃቦ', NULL, NULL, 'ዝበፅሖ', 'ድጋፍ ዘይተገበረሉ', NULL, 2, 'In_Securiry', 'dfhsfhsh', 'sfjrtjwrtj', '07/12/2011', 'ዓኣ ርህድፍህ', '14/12/2011', 34, NULL, 'active', 'false', '2019-08-13 17:52:59', '2019-08-26 11:24:30'),
(2, 2, 3, 3, 1, '57', '0945735838', 'Breaking_Region', '7/12/2011', '4', 'sdf dsgdg', 4, 'Light_Weight_Crimes', 'bsdfhasht', NULL, '567', 'Male', 5, 2, 3, 4, 2, 'Not_Followed_Up', 2, 'Not_Done_Right', 'Witnessed_A_Lie', 'Not_Accused_For_Lie', 2, 'Not_Done_Right', 2, 'Not_Done_Right', '07/12/2011', '07/12/2011', 6, 4, 2, NULL, 'Shortage_Of_Budget', 'ዘይተውሃቦ', NULL, NULL, 'ዝበፅሖ', 'ድጋፍ ዘይተገበረሉ', NULL, 2, 'Remembering', 'fghs', 'dfhsh', '14/12/2011', 'ዓኣ ርህድፍህ', '07/12/2011', 34, NULL, 'active', 'false', '2019-08-13 17:58:35', '2019-08-26 11:24:17'),
(3, 2, 3, 3, 1, '345', '094573590', 'Breaking_Region', '7/12/2011', '4', 'dfshsdh', 1, 'Medium_And_Havy', 'bsdfhasht', NULL, '50', 'Female', 5, 2, 2, 5, 1, NULL, 2, 'Not_Done_Right', 'Witnessed_As_Is', NULL, 1, NULL, 1, NULL, '08/12/2011', '08/12/2011', 3, 4, 2, NULL, 'Not_Given', 'ዘይተውሃቦ', NULL, NULL, 'ዝበፅሖ', 'ድጋፍ ዘይተገበረሉ', NULL, 2, 'Remembering', 'dfhshs', 'dfshsh', '08/12/2011', 'fgdfjdfj', '08/12/2011', 34, NULL, 'active', 'false', '2019-08-13 18:07:57', '2019-08-26 11:37:56'),
(4, 2, 3, 3, 1, 'q', '0945735838', 'Breaking_Region', '20/12/2011 16:59:54', '4', 'q', 2, 'Light_Weight_Crimes', 'bsdfhasht', NULL, '45', 'Male', 5, 1, 2, 5, 2, 'Not_Followed_Up', 2, 'Not_Done_Right', 'Witnessed_A_Lie', 'Accused_For_Lie', 2, 'No_Need_To_Follow_Up', 2, 'No_Need_To_Follow_Up', '20/12/2011', '21/12/2011', 6, 4, 2, NULL, 'Shortage_Of_Budget', 'ዘይተውሃቦ', NULL, NULL, 'ዝበፅሖ', 'ድጋፍ ዝተገበረሉ', NULL, 2, 'Remembering', NULL, 'sfjrtjwrtj', '20/12/2011', 'ዓኣ ርህድፍህ', '20/12/2011', 34, NULL, 'active', 'false', '2019-08-26 10:59:54', '2019-08-26 19:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `witness_follow_up_security_statuses`
--

CREATE TABLE `witness_follow_up_security_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `witness_follow_up_security_statuses`
--

INSERT INTO `witness_follow_up_security_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Secured', 'ድሕንነቱ ዝተሓለወ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Secured', 'ድሕንነቱ ዘይተሓለወ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `witness_payment_statuses`
--

CREATE TABLE `witness_payment_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `witness_payment_statuses`
--

INSERT INTO `witness_payment_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Paid', 'ዝተከፈሎ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Paid', 'ዘይተከፈሎ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `witness_remember_statuses`
--

CREATE TABLE `witness_remember_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `witness_remember_statuses`
--

INSERT INTO `witness_remember_statuses` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Remembered', 'ዝተስታወሰ/ዝተዘካከረ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Remembered', 'ዘይተስታወሰ/ዘይተዘካከረ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `witness_security_types`
--

CREATE TABLE `witness_security_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyWord` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `witness_security_types`
--

INSERT INTO `witness_security_types` (`id`, `keyWord`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Followed_Up', 'ክትትል ዝተገበረሉ', '2019-06-23 19:53:22', '2019-06-23 19:53:22'),
(2, 'Not_Followed_Up', 'ክትትል ዘይተገበረሉ', '2019-06-23 19:53:22', '2019-06-23 19:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `work_detail`
--

CREATE TABLE `work_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `memberId` int(11) NOT NULL,
  `officialDesignation` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateOfEmployment` text COLLATE utf8mb4_unicode_ci,
  `contractExpiryDate` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basicSalary` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grossSalary` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `netSalary` double DEFAULT NULL,
  `nonCurrentIncome` double DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_detail`
--

INSERT INTO `work_detail` (`id`, `memberId`, `officialDesignation`, `employer`, `dateOfEmployment`, `contractExpiryDate`, `basicSalary`, `grossSalary`, `netSalary`, `nonCurrentIncome`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, 10, '1', '2', '13/03/2011', '20/03/2011', '10000', '45', 45, 2000, 1, 'active', 'false', '2018-11-27 18:45:55', '2018-11-27 18:45:55'),
(2, 11, '3', '4', '4', '4', '4', '4', 4, 4, 1, 'active', 'false', '2018-11-27 19:44:53', '2018-11-27 19:44:53'),
(3, 12, '3', '4', '4', '4', '4', '4', 4, 4, 1, 'active', 'false', '2018-11-27 19:50:06', '2018-11-27 19:50:06'),
(4, 13, '3', '4', '4', '4', '4', '4', 4, 4, 1, 'active', 'false', '2018-11-27 19:53:26', '2018-11-27 19:53:26'),
(5, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-27 20:14:42', '2018-11-27 20:14:42'),
(6, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 04:15:05', '2018-11-28 04:15:05'),
(7, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 04:21:21', '2018-11-28 04:21:21'),
(8, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 04:33:03', '2018-11-28 04:33:03'),
(9, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 04:43:17', '2018-11-28 04:43:17'),
(10, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 04:53:15', '2018-11-28 04:53:15'),
(11, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 05:09:35', '2018-11-28 05:09:35'),
(12, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 05:11:34', '2018-11-28 05:11:34'),
(13, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-28 06:57:31', '2018-11-28 06:57:31'),
(14, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 21:52:49', '2018-11-29 21:52:49'),
(15, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 21:52:58', '2018-11-29 21:52:58'),
(16, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:30:59', '2018-11-29 22:30:59'),
(17, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:33:19', '2018-11-29 22:33:19'),
(18, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:33:38', '2018-11-29 22:33:38'),
(19, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:35:44', '2018-11-29 22:35:44'),
(20, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:38:16', '2018-11-29 22:38:16'),
(21, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:38:49', '2018-11-29 22:38:49'),
(22, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:42:09', '2018-11-29 22:42:09'),
(23, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:44:44', '2018-11-29 22:44:44'),
(24, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:45:03', '2018-11-29 22:45:03'),
(25, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:49:43', '2018-11-29 22:49:43'),
(26, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:51:15', '2018-11-29 22:51:15'),
(27, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:51:39', '2018-11-29 22:51:39'),
(28, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:52:13', '2018-11-29 22:52:13'),
(29, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:52:34', '2018-11-29 22:52:34'),
(30, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:52:57', '2018-11-29 22:52:57'),
(31, 14, '1', 'tkal 1', '05/03/2011', '05/03/2011', '100', '45', 45, 2000, 1, 'active', 'false', '2018-11-29 22:53:18', '2018-11-29 22:53:18'),
(32, 15, '1', 'tkal 1', '06/03/2011', '05/03/2011', '10000', '45', 45, 2000, 1, 'active', 'false', '2018-12-01 08:34:41', '2018-12-01 08:34:41'),
(33, 15, '1', 'tkal 1', '06/03/2011', '05/03/2011', '10000', '45', 45, 2000, 1, 'active', 'false', '2018-12-01 08:55:44', '2018-12-01 08:55:44'),
(34, 15, '1', 'tkal 1', '06/03/2011', '05/03/2011', '10000', '45', 45, 2000, 1, 'active', 'false', '2018-12-01 08:56:19', '2018-12-01 08:56:19'),
(35, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 'false', '2018-12-01 10:36:39', '2018-12-01 10:36:39'),
(36, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 'false', '2018-12-01 13:50:55', '2018-12-01 13:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionId` int(11) NOT NULL DEFAULT '1',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `regionId`, `name`, `remark`, `createdByUserId`, `status`, `isDeleted`, `created_at`, `updated_at`) VALUES
(2, 2, 'ዞባ ምዕራብ', NULL, 14, 'active', 'false', '2019-04-18 19:29:40', '2019-07-08 01:26:40'),
(3, 2, 'ዞባ ምብራቕ', NULL, 14, 'active', 'false', '2019-04-18 19:29:59', '2019-07-30 13:27:28'),
(4, 2, 'ዞባ ደቡብ', NULL, 14, 'active', 'false', '2019-04-18 19:30:28', '2019-07-08 01:26:07'),
(6, 2, 'ዞባ ሰሜን ምዕራብ', NULL, 14, 'active', 'false', '2019-07-08 01:27:21', '2019-07-08 01:27:21'),
(7, 2, 'ዞባ ደቡብ ምብራቕ', NULL, 14, 'active', 'false', '2019-07-08 01:27:46', '2019-07-08 01:27:46'),
(8, 2, 'ዞባ ማእኸል', NULL, 14, 'active', 'false', '2019-07-08 01:28:31', '2019-07-08 01:28:31'),
(9, 2, 'ዞባ መቐለ', NULL, 14, 'active', 'false', '2019-07-08 01:29:03', '2019-07-08 01:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `zraeti`
--

CREATE TABLE `zraeti` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdByUserId` int(11) NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `isDeleted` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_types_name_unique` (`name`);

--
-- Indexes for table `accusal_categories`
--
ALTER TABLE `accusal_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accusal_categories_name_unique` (`name`);

--
-- Indexes for table `accuser_types`
--
ALTER TABLE `accuser_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accuser_types_name_unique` (`name`);

--
-- Indexes for table `archive_kdme_ksi_geben_mezgeb`
--
ALTER TABLE `archive_kdme_ksi_geben_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archive_kesesti_kdme_ksi_geben_mezgeb`
--
ALTER TABLE `archive_kesesti_kdme_ksi_geben_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archive_tekesesti_kdme_ksi_geben_mezgeb`
--
ALTER TABLE `archive_tekesesti_kdme_ksi_geben_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `awde_srah`
--
ALTER TABLE `awde_srah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `awde_srah_name_unique` (`name`);

--
-- Indexes for table `aynetat_geben`
--
ALTER TABLE `aynetat_geben`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynetat_geben_name_unique` (`name`);

--
-- Indexes for table `aynetat_rkb`
--
ALTER TABLE `aynetat_rkb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynetat_rkb_keyword_unique` (`keyWord`);

--
-- Indexes for table `aynetat_trean`
--
ALTER TABLE `aynetat_trean`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynetat_trean_keyword_unique` (`keyWord`);

--
-- Indexes for table `aynetat_wsane_akabihgi`
--
ALTER TABLE `aynetat_wsane_akabihgi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynetat_wsane_akabihgi_name_unique` (`name`);

--
-- Indexes for table `aynetat_wsane_betfrdi`
--
ALTER TABLE `aynetat_wsane_betfrdi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynetat_wsane_betfrdi_name_unique` (`name`);

--
-- Indexes for table `aynet_glgalot`
--
ALTER TABLE `aynet_glgalot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynet_glgalot_name_unique` (`name`);

--
-- Indexes for table `aynet_ngdi`
--
ALTER TABLE `aynet_ngdi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynet_ngdi_name_unique` (`name`);

--
-- Indexes for table `aynet_tekli`
--
ALTER TABLE `aynet_tekli`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynet_tekli_name_unique` (`name`);

--
-- Indexes for table `aynet_teshkerkerti`
--
ALTER TABLE `aynet_teshkerkerti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynet_teshkerkerti_name_unique` (`name`);

--
-- Indexes for table `aynet_thset`
--
ALTER TABLE `aynet_thset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynet_thset_keyword_unique` (`keyWord`);

--
-- Indexes for table `aynet_wdabe`
--
ALTER TABLE `aynet_wdabe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aynet_wdabe_name_unique` (`name`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banks_name_unique` (`name`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_branchs`
--
ALTER TABLE `bank_branchs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bank_branchs_name_unique` (`name`);

--
-- Indexes for table `bher`
--
ALTER TABLE `bher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bher_name_unique` (`name`);

--
-- Indexes for table `branchs`
--
ALTER TABLE `branchs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branchs_name_unique` (`name`);

--
-- Indexes for table `brkitat`
--
ALTER TABLE `brkitat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brkitat_name_unique` (`name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_categories`
--
ALTER TABLE `charge_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_fee_registration`
--
ALTER TABLE `charge_fee_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compensation_types`
--
ALTER TABLE `compensation_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `compensation_types_name_unique` (`name`);

--
-- Indexes for table `complains_by_customer`
--
ALTER TABLE `complains_by_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_name_unique` (`name`);

--
-- Indexes for table `crime_record_akabi_hgi_decision_history`
--
ALTER TABLE `crime_record_akabi_hgi_decision_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crime_record_bet_frdi_decision_history`
--
ALTER TABLE `crime_record_bet_frdi_decision_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencytypes`
--
ALTER TABLE `currencytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencytypes_icon_unique` (`icon`),
  ADD UNIQUE KEY `currencytypes_name_unique` (`name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `dgafn_given_party_types`
--
ALTER TABLE `dgafn_given_party_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dgafn_given_party_types_keyword_unique` (`keyWord`);

--
-- Indexes for table `disability_types`
--
ALTER TABLE `disability_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `disability_types_name_unique` (`name`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_types_name_unique` (`name`);

--
-- Indexes for table `educational_levels`
--
ALTER TABLE `educational_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `educational_levels_name_unique` (`name`);

--
-- Indexes for table `educational_skills`
--
ALTER TABLE `educational_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `educational_skills_name_unique` (`name`);

--
-- Indexes for table `effectiveness_statuses`
--
ALTER TABLE `effectiveness_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `effectiveness_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `ftabher_akabi_hgi_decision_history`
--
ALTER TABLE `ftabher_akabi_hgi_decision_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_bet_frdi_decision_history`
--
ALTER TABLE `ftabher_bet_frdi_decision_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_kesasi_health_status`
--
ALTER TABLE `ftabher_kesasi_health_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_kesesti_mezgeb`
--
ALTER TABLE `ftabher_kesesti_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_kesesti_tekesasi`
--
ALTER TABLE `ftabher_kesesti_tekesasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_ksi_kotsorotat`
--
ALTER TABLE `ftabher_ksi_kotsorotat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_mezgeb`
--
ALTER TABLE `ftabher_mezgeb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ftabher_mezgeb_ksi_mezgeb_number_unique` (`ksi_mezgeb_number`);

--
-- Indexes for table `ftabher_mezgeb_brki`
--
ALTER TABLE `ftabher_mezgeb_brki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_mezgeb_brki_wsane_zhabu_dayanu`
--
ALTER TABLE `ftabher_mezgeb_brki_wsane_zhabu_dayanu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_mezgeb_waninat`
--
ALTER TABLE `ftabher_mezgeb_waninat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_tekesasi_crime_type`
--
ALTER TABLE `ftabher_tekesasi_crime_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_tekesasi_health_status`
--
ALTER TABLE `ftabher_tekesasi_health_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_tekesesti_mezgeb`
--
ALTER TABLE `ftabher_tekesesti_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ftabher_wsanetat_akabihgi`
--
ALTER TABLE `ftabher_wsanetat_akabihgi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ftabher_wsanetat_akabihgi_name_unique` (`name`);

--
-- Indexes for table `ftabher_wsanetat_betfrdi`
--
ALTER TABLE `ftabher_wsanetat_betfrdi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ftabher_wsanetat_betfrdi_name_unique` (`name`);

--
-- Indexes for table `ftabher_wsanetat_tfeat_betfrdi`
--
ALTER TABLE `ftabher_wsanetat_tfeat_betfrdi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ftabher_wsanetat_tfeat_betfrdi_name_unique` (`name`);

--
-- Indexes for table `generals`
--
ALTER TABLE `generals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `glgalot_ntsadgaf_hgi`
--
ALTER TABLE `glgalot_ntsadgaf_hgi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `glgalot_types`
--
ALTER TABLE `glgalot_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `glgalot_types_keyword_unique` (`keyWord`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`);

--
-- Indexes for table `habereta_nebari_tabya`
--
ALTER TABLE `habereta_nebari_tabya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hafeshawi_habereta_tabya`
--
ALTER TABLE `hafeshawi_habereta_tabya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_statuses`
--
ALTER TABLE `health_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `health_statuses_name_unique` (`name`);

--
-- Indexes for table `human_right`
--
ALTER TABLE `human_right`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `human_right_complain_record`
--
ALTER TABLE `human_right_complain_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `human_right_prison`
--
ALTER TABLE `human_right_prison`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `human_right_prison_complain_record`
--
ALTER TABLE `human_right_prison_complain_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inherit_types`
--
ALTER TABLE `inherit_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inherit_types_name_unique` (`name`);

--
-- Indexes for table `kebelles`
--
ALTER TABLE `kebelles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kebelle_form_1p1`
--
ALTER TABLE `kebelle_form_1p1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kebelle_form_1p1_one_ሽምመሓውር_unique` (`one_ሽምመሓውር`),
  ADD UNIQUE KEY `kebelle_form_1p1_two_ሽምመሓውር_unique` (`two_ሽምመሓውር`);

--
-- Indexes for table `kebelle_form_1p2`
--
ALTER TABLE `kebelle_form_1p2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kebelle_form_1p2_ሽምቤትዕዮ_unique` (`ሽምቤትዕዮ`);

--
-- Indexes for table `kebelle_form_1p2_joblist`
--
ALTER TABLE `kebelle_form_1p2_joblist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kesesti_ksi_mezgeb`
--
ALTER TABLE `kesesti_ksi_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kesesti_tekesasi`
--
ALTER TABLE `kesesti_tekesasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksi_kotsorotat`
--
ALTER TABLE `ksi_kotsorotat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksi_mezgeb`
--
ALTER TABLE `ksi_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksi_mezgeb_brki`
--
ALTER TABLE `ksi_mezgeb_brki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksi_mezgeb_brki_wsane_zhabu_dayanu`
--
ALTER TABLE `ksi_mezgeb_brki_wsane_zhabu_dayanu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kttln_dgafn_abyate_eyo`
--
ALTER TABLE `kttln_dgafn_abyate_eyo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kunetat_hadar`
--
ALTER TABLE `kunetat_hadar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kunetat_hadar_name_unique` (`name`);

--
-- Indexes for table `kunetat_mezagbti`
--
ALTER TABLE `kunetat_mezagbti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kunetat_mezagbti_name_unique` (`name`);

--
-- Indexes for table `kunetat_tekesesti`
--
ALTER TABLE `kunetat_tekesesti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kunetat_tekesesti_keyword_unique` (`keyWord`);

--
-- Indexes for table `kunetat_tekesesti_human_right`
--
ALTER TABLE `kunetat_tekesesti_human_right`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kunetat_tekesesti_human_right_keyword_unique` (`keyWord`);

--
-- Indexes for table `language_strings`
--
ALTER TABLE `language_strings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leading_investigation_of_heavy_crimes`
--
ALTER TABLE `leading_investigation_of_heavy_crimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logoimage`
--
ALTER TABLE `logoimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_account`
--
ALTER TABLE `member_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_modes_name_unique` (`name`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `property_types_name_unique` (`name`);

--
-- Indexes for table `quality_statuses`
--
ALTER TABLE `quality_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quality_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `regions_name_unique` (`name`);

--
-- Indexes for table `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `religion_name_unique` (`name`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rkb_beteseb`
--
ALTER TABLE `rkb_beteseb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_rolename_unique` (`roleName`);

--
-- Indexes for table `role_actions`
--
ALTER TABLE `role_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_resource`
--
ALTER TABLE `role_resource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satisfaction_statuses`
--
ALTER TABLE `satisfaction_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `satisfaction_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saving_categories`
--
ALTER TABLE `saving_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_info`
--
ALTER TABLE `social_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_weredas`
--
ALTER TABLE `sub_weredas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabyas`
--
ALTER TABLE `tabyas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabya_hafti_tefetro`
--
ALTER TABLE `tabya_hafti_tefetro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabya_mahberat`
--
ALTER TABLE `tabya_mahberat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabya_tkalat`
--
ALTER TABLE `tabya_tkalat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tekesasi_crime_type`
--
ALTER TABLE `tekesasi_crime_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tekesesti_ksi_mezgeb`
--
ALTER TABLE `tekesesti_ksi_mezgeb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `termsofpayment`
--
ALTER TABLE `termsofpayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainig_status`
--
ALTER TABLE `trainig_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truthness_statuses`
--
ALTER TABLE `truthness_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `truthness_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_bkp`
--
ALTER TABLE `users_bkp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_purchases`
--
ALTER TABLE `users_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_details_userid_unique` (`userId`);

--
-- Indexes for table `user_zone_wereda_kebelles`
--
ALTER TABLE `user_zone_wereda_kebelles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waninat`
--
ALTER TABLE `waninat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `waninat_name_unique` (`name`);

--
-- Indexes for table `wannet_menberi`
--
ALTER TABLE `wannet_menberi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wannet_menberi_name_unique` (`name`);

--
-- Indexes for table `weredas`
--
ALTER TABLE `weredas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weredas_name_unique` (`name`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `witness_avaliability_statuses`
--
ALTER TABLE `witness_avaliability_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `witness_avaliability_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `witness_follow_up`
--
ALTER TABLE `witness_follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `witness_follow_up_security_statuses`
--
ALTER TABLE `witness_follow_up_security_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `witness_follow_up_security_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `witness_payment_statuses`
--
ALTER TABLE `witness_payment_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `witness_payment_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `witness_remember_statuses`
--
ALTER TABLE `witness_remember_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `witness_remember_statuses_keyword_unique` (`keyWord`);

--
-- Indexes for table `witness_security_types`
--
ALTER TABLE `witness_security_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `witness_security_types_keyword_unique` (`keyWord`);

--
-- Indexes for table `work_detail`
--
ALTER TABLE `work_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- Indexes for table `zraeti`
--
ALTER TABLE `zraeti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zraeti_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accusal_categories`
--
ALTER TABLE `accusal_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `accuser_types`
--
ALTER TABLE `accuser_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `archive_kdme_ksi_geben_mezgeb`
--
ALTER TABLE `archive_kdme_ksi_geben_mezgeb`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `archive_kesesti_kdme_ksi_geben_mezgeb`
--
ALTER TABLE `archive_kesesti_kdme_ksi_geben_mezgeb`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `archive_tekesesti_kdme_ksi_geben_mezgeb`
--
ALTER TABLE `archive_tekesesti_kdme_ksi_geben_mezgeb`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `awde_srah`
--
ALTER TABLE `awde_srah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `aynetat_geben`
--
ALTER TABLE `aynetat_geben`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `aynetat_rkb`
--
ALTER TABLE `aynetat_rkb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `aynetat_trean`
--
ALTER TABLE `aynetat_trean`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `aynetat_wsane_akabihgi`
--
ALTER TABLE `aynetat_wsane_akabihgi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `aynetat_wsane_betfrdi`
--
ALTER TABLE `aynetat_wsane_betfrdi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `aynet_glgalot`
--
ALTER TABLE `aynet_glgalot`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aynet_ngdi`
--
ALTER TABLE `aynet_ngdi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aynet_tekli`
--
ALTER TABLE `aynet_tekli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aynet_teshkerkerti`
--
ALTER TABLE `aynet_teshkerkerti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aynet_thset`
--
ALTER TABLE `aynet_thset`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `aynet_wdabe`
--
ALTER TABLE `aynet_wdabe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_branchs`
--
ALTER TABLE `bank_branchs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bher`
--
ALTER TABLE `bher`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branchs`
--
ALTER TABLE `branchs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brkitat`
--
ALTER TABLE `brkitat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_categories`
--
ALTER TABLE `charge_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `charge_fee_registration`
--
ALTER TABLE `charge_fee_registration`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `compensation_types`
--
ALTER TABLE `compensation_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complains_by_customer`
--
ALTER TABLE `complains_by_customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `crime_record_akabi_hgi_decision_history`
--
ALTER TABLE `crime_record_akabi_hgi_decision_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `crime_record_bet_frdi_decision_history`
--
ALTER TABLE `crime_record_bet_frdi_decision_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `currencytypes`
--
ALTER TABLE `currencytypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dgafn_given_party_types`
--
ALTER TABLE `dgafn_given_party_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `disability_types`
--
ALTER TABLE `disability_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `educational_levels`
--
ALTER TABLE `educational_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `educational_skills`
--
ALTER TABLE `educational_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `effectiveness_statuses`
--
ALTER TABLE `effectiveness_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ftabher_akabi_hgi_decision_history`
--
ALTER TABLE `ftabher_akabi_hgi_decision_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ftabher_bet_frdi_decision_history`
--
ALTER TABLE `ftabher_bet_frdi_decision_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ftabher_kesasi_health_status`
--
ALTER TABLE `ftabher_kesasi_health_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `ftabher_kesesti_mezgeb`
--
ALTER TABLE `ftabher_kesesti_mezgeb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ftabher_kesesti_tekesasi`
--
ALTER TABLE `ftabher_kesesti_tekesasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ftabher_ksi_kotsorotat`
--
ALTER TABLE `ftabher_ksi_kotsorotat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ftabher_mezgeb`
--
ALTER TABLE `ftabher_mezgeb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ftabher_mezgeb_brki`
--
ALTER TABLE `ftabher_mezgeb_brki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ftabher_mezgeb_brki_wsane_zhabu_dayanu`
--
ALTER TABLE `ftabher_mezgeb_brki_wsane_zhabu_dayanu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ftabher_mezgeb_waninat`
--
ALTER TABLE `ftabher_mezgeb_waninat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `ftabher_tekesasi_crime_type`
--
ALTER TABLE `ftabher_tekesasi_crime_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ftabher_tekesasi_health_status`
--
ALTER TABLE `ftabher_tekesasi_health_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ftabher_tekesesti_mezgeb`
--
ALTER TABLE `ftabher_tekesesti_mezgeb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ftabher_wsanetat_akabihgi`
--
ALTER TABLE `ftabher_wsanetat_akabihgi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ftabher_wsanetat_betfrdi`
--
ALTER TABLE `ftabher_wsanetat_betfrdi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ftabher_wsanetat_tfeat_betfrdi`
--
ALTER TABLE `ftabher_wsanetat_tfeat_betfrdi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `generals`
--
ALTER TABLE `generals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `glgalot_ntsadgaf_hgi`
--
ALTER TABLE `glgalot_ntsadgaf_hgi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `glgalot_types`
--
ALTER TABLE `glgalot_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `habereta_nebari_tabya`
--
ALTER TABLE `habereta_nebari_tabya`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hafeshawi_habereta_tabya`
--
ALTER TABLE `hafeshawi_habereta_tabya`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_statuses`
--
ALTER TABLE `health_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `human_right`
--
ALTER TABLE `human_right`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `human_right_complain_record`
--
ALTER TABLE `human_right_complain_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `human_right_prison`
--
ALTER TABLE `human_right_prison`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `human_right_prison_complain_record`
--
ALTER TABLE `human_right_prison_complain_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `inherit_types`
--
ALTER TABLE `inherit_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kebelles`
--
ALTER TABLE `kebelles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kebelle_form_1p1`
--
ALTER TABLE `kebelle_form_1p1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kebelle_form_1p2`
--
ALTER TABLE `kebelle_form_1p2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kebelle_form_1p2_joblist`
--
ALTER TABLE `kebelle_form_1p2_joblist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesesti_ksi_mezgeb`
--
ALTER TABLE `kesesti_ksi_mezgeb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kesesti_tekesasi`
--
ALTER TABLE `kesesti_tekesasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ksi_kotsorotat`
--
ALTER TABLE `ksi_kotsorotat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ksi_mezgeb`
--
ALTER TABLE `ksi_mezgeb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ksi_mezgeb_brki`
--
ALTER TABLE `ksi_mezgeb_brki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ksi_mezgeb_brki_wsane_zhabu_dayanu`
--
ALTER TABLE `ksi_mezgeb_brki_wsane_zhabu_dayanu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kttln_dgafn_abyate_eyo`
--
ALTER TABLE `kttln_dgafn_abyate_eyo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kunetat_hadar`
--
ALTER TABLE `kunetat_hadar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kunetat_mezagbti`
--
ALTER TABLE `kunetat_mezagbti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kunetat_tekesesti`
--
ALTER TABLE `kunetat_tekesesti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kunetat_tekesesti_human_right`
--
ALTER TABLE `kunetat_tekesesti_human_right`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `language_strings`
--
ALTER TABLE `language_strings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2144;

--
-- AUTO_INCREMENT for table `leading_investigation_of_heavy_crimes`
--
ALTER TABLE `leading_investigation_of_heavy_crimes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logoimage`
--
ALTER TABLE `logoimage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `member_account`
--
ALTER TABLE `member_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=699;

--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quality_statuses`
--
ALTER TABLE `quality_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `religion`
--
ALTER TABLE `religion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rkb_beteseb`
--
ALTER TABLE `rkb_beteseb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_actions`
--
ALTER TABLE `role_actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_resource`
--
ALTER TABLE `role_resource`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `satisfaction_statuses`
--
ALTER TABLE `satisfaction_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `saving_categories`
--
ALTER TABLE `saving_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_info`
--
ALTER TABLE `social_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_weredas`
--
ALTER TABLE `sub_weredas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tabyas`
--
ALTER TABLE `tabyas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tabya_hafti_tefetro`
--
ALTER TABLE `tabya_hafti_tefetro`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabya_mahberat`
--
ALTER TABLE `tabya_mahberat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabya_tkalat`
--
ALTER TABLE `tabya_tkalat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tekesasi_crime_type`
--
ALTER TABLE `tekesasi_crime_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tekesesti_ksi_mezgeb`
--
ALTER TABLE `tekesesti_ksi_mezgeb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `termsofpayment`
--
ALTER TABLE `termsofpayment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainig_status`
--
ALTER TABLE `trainig_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `truthness_statuses`
--
ALTER TABLE `truthness_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users_bkp`
--
ALTER TABLE `users_bkp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_purchases`
--
ALTER TABLE `users_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_zone_wereda_kebelles`
--
ALTER TABLE `user_zone_wereda_kebelles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waninat`
--
ALTER TABLE `waninat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wannet_menberi`
--
ALTER TABLE `wannet_menberi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weredas`
--
ALTER TABLE `weredas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `witness_avaliability_statuses`
--
ALTER TABLE `witness_avaliability_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `witness_follow_up`
--
ALTER TABLE `witness_follow_up`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `witness_follow_up_security_statuses`
--
ALTER TABLE `witness_follow_up_security_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `witness_payment_statuses`
--
ALTER TABLE `witness_payment_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `witness_remember_statuses`
--
ALTER TABLE `witness_remember_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `witness_security_types`
--
ALTER TABLE `witness_security_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `work_detail`
--
ALTER TABLE `work_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `zraeti`
--
ALTER TABLE `zraeti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
