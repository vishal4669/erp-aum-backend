-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: sdb-e.hosting.stackcp.net
-- Generation Time: Sep 09, 2021 at 03:02 PM
-- Server version: 10.4.18-MariaDB-log
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aum_research_lab-313833c271`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_banks`
--

CREATE TABLE `mst_banks` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `account_no` varchar(20) NOT NULL,
  `micr_code` int(9) DEFAULT NULL,
  `ifsc_code` varchar(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_banks`
--

INSERT INTO `mst_banks` (`id`, `mst_companies_id`, `bank_name`, `branch_name`, `customer_id`, `account_no`, `micr_code`, `ifsc_code`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'hdfc', 'vadaj', '123456', '12345678913', 123456789, 'HDFC5678901', 1, NULL, '2021-08-05 05:16:20', '2021-08-05 09:41:37', '2019-20', NULL, 1, '2021-08-05 09:41:37'),
(2, 4, 'ICICI Bank1', 'Paldi', '123456789012gggg', '125689ETRGF00', 123456755, '586922ERFGG', 3, 3, '2021-08-05 08:53:34', '2021-08-05 09:40:09', '2019-20', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_branches`
--

CREATE TABLE `mst_branches` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_type` varchar(255) DEFAULT NULL,
  `branch_code` varchar(155) DEFAULT NULL,
  `branch_office_no` varchar(55) DEFAULT NULL,
  `branch_complex_name` varchar(255) DEFAULT NULL,
  `branch_street_name` varchar(255) DEFAULT NULL,
  `branch_land_mark` varchar(255) DEFAULT NULL,
  `branch_area` varchar(255) DEFAULT NULL,
  `branch_city` varchar(155) DEFAULT NULL,
  `branch_state` varchar(155) DEFAULT NULL,
  `branch_country` varchar(155) DEFAULT NULL,
  `branch_pin` int(5) DEFAULT NULL,
  `branch_phone` varchar(55) DEFAULT NULL,
  `branch_fax` varchar(55) DEFAULT NULL,
  `branch_mobile` varchar(55) DEFAULT NULL,
  `branch_email` varchar(255) DEFAULT NULL,
  `branch_establish_year` varchar(55) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all master companies list';

--
-- Dumping data for table `mst_branches`
--

INSERT INTO `mst_branches` (`id`, `mst_companies_id`, `branch_name`, `branch_type`, `branch_code`, `branch_office_no`, `branch_complex_name`, `branch_street_name`, `branch_land_mark`, `branch_area`, `branch_city`, `branch_state`, `branch_country`, `branch_pin`, `branch_phone`, `branch_fax`, `branch_mobile`, `branch_email`, `branch_establish_year`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(10, 1, 'Ahmedabad Branch', 'Chemical Processing', 'AZ12354', 'AX5289P', 'Saphath', 'Ahmedabad', 'Shymal Crossing', 'Satellite', 'Ahmedabad', 'Gujarat', 'India', 380012, '1112223334', '9568dsd8', '1234567895', 'test@gmail.com', '2002', 3, 3, '2019-20', NULL, 1, NULL, '2021-05-25 10:34:50', '2021-05-26 05:56:07'),
(11, 1, 'test', 'Chemical Processing', 'AZ12354', 'AX5289O', 'Saphath', 'test', 'Shymal Crossing', 'Satellite', 'test', 'test', 'India', 380012, 'test', '9568dsd8', '1112223334', 'test@gmail.com', '2002', 3, NULL, '2019-20', NULL, 1, '2021-05-25 11:07:25', '2021-05-25 11:06:47', '2021-05-25 10:07:25'),
(12, 1, 'Test Branch', 'Test', 'AZ12000', 'OO5289O', 'Jinesh', 'Ambawadi', 'Redcross', 'Paldi', 'Ahmedabad', 'Gujarat', 'India', 380007, '8899556220', '9568000', '1234567895', 'tester@gmail.com', '2010', 3, NULL, '2019-20', NULL, 1, NULL, '2021-05-25 11:25:08', '2021-05-25 10:25:08'),
(13, 1, 'Branch 6', 'Home', 'BR06', '1234567890', 'Branch 06', 'Main Street', 'Main Road', 'New York Square', 'New York', 'New York', 'US', 12345, '1234567890', '1234567890', '1234567890', 'branch06@yopmail.com', '2021', 1, NULL, '2019-20', NULL, 1, '2021-06-11 05:49:05', '2021-05-25 11:31:17', '2021-06-11 04:49:05'),
(14, 25, 'test1', 'Chemical Processing', 'AZ123541', '345', 'Saphath1', 'test1', 'Shymal Crossing1', 'Satellite1', 'test1', 'test1', 'India1', 380015, '8899556221', '4567890', '8899556221', 'test1@gmail.com', '2012', 3, 3, '2019-20', NULL, 1, NULL, '2021-05-25 11:34:27', '2021-06-11 04:48:27'),
(15, 14, 'Branch 7ewsfdfdf', 'Home', 'BR07', '1234567890', 'Branch 07', 'Main Street', 'Main Road', 'New York Square', 'New York', 'New York', 'US', 12345, '1234567890', '1234567890', '1234567890', 'branch07@yopmail.com', '2021', 1, 3, '2019-20', NULL, 1, '2021-06-08 13:20:47', '2021-05-25 11:46:07', '2021-06-08 12:20:47'),
(16, 25, 'test', 'Test', 'Test', 'Test', 'Test', 'test', NULL, NULL, 'test', 'test', 'India', 380005, 'test', NULL, '7788996655', 'test@gmail.com', NULL, 3, NULL, '2016-17', NULL, 1, NULL, '2021-05-26 08:49:02', '2021-05-26 07:49:02'),
(17, 2, 'test123', 'test', 'test', 'test', 'test', 'test', 'test', 'ttest', 'test', 'test', 'test', 123456, '9988776655', NULL, '6549872315', '111111@gmail.com', '1232', 3, NULL, '2019-20', NULL, 1, '2021-06-08 08:55:58', '2021-06-08 08:55:39', '2021-06-08 07:55:58'),
(18, 4, 'Mayank Shah123', 'test', 'test', 'test', 'test', 'Paldi', 'test', NULL, 'Ahmedabad', 'Gujarat', NULL, 380012, '1234567890', NULL, '7895642315', 'mayank@gmail.com', NULL, 3, 3, '2019-20', NULL, 1, '2021-06-08 08:57:46', '2021-06-08 08:56:57', '2021-06-08 07:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `mst_categories`
--

CREATE TABLE `mst_categories` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT 0,
  `category_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all master companies list';

--
-- Dumping data for table `mst_categories`
--

INSERT INTO `mst_categories` (`id`, `mst_companies_id`, `parent_category_id`, `category_name`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'category 1', 1, NULL, '2019-20', NULL, 1, NULL, '2021-06-09 11:55:36', '2021-06-09 10:55:36'),
(2, 1, 1, 'Category 2', 3, 3, '2019-20', NULL, 1, NULL, '2021-06-09 11:55:50', '2021-06-11 04:57:45'),
(3, 1, 2, 'category 3', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-09 11:57:09', '2021-08-06 07:05:26'),
(4, 1, 1, 'test', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-09 12:02:48', '2021-08-06 11:49:29'),
(5, 1, NULL, 'test', 3, NULL, '2019-20', NULL, 1, '2021-06-09 12:03:47', '2021-06-09 12:03:43', '2021-06-09 11:03:47'),
(6, 1, 4, 'ABC', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-09 12:04:11', '2021-08-06 13:34:07'),
(7, 1, NULL, 'fgdffgff', 3, NULL, '2019-20', NULL, 1, '2021-06-21 09:22:52', '2021-06-21 09:22:40', '2021-06-21 08:22:52'),
(8, 1, NULL, 'Parent Category', 3, 3, '2019-20', NULL, 1, '2021-08-09 09:35:00', '2021-08-09 09:24:50', '2021-08-09 08:35:00'),
(9, 1, 8, 'Child Category', 3, NULL, '2019-20', NULL, 1, '2021-08-09 09:34:56', '2021-08-09 09:25:03', '2021-08-09 08:34:56'),
(10, 1, NULL, 'None', 3, NULL, '2019-20', NULL, 1, '2021-08-09 09:25:53', '2021-08-09 09:25:43', '2021-08-09 08:25:53'),
(12, 1, 0, 'Parent Category', 3, NULL, '2019-20', NULL, 1, NULL, '2021-08-09 09:35:15', '2021-08-09 08:35:15'),
(13, 1, 12, 'Child Category', 3, NULL, '2019-20', NULL, 1, NULL, '2021-08-09 09:35:37', '2021-08-09 08:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `mst_companies`
--

CREATE TABLE `mst_companies` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all master companies list';

--
-- Dumping data for table `mst_companies`
--

INSERT INTO `mst_companies` (`id`, `company_name`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Aum Research Laboratries', 1, 3, '2017-18', NULL, 1, NULL, '2021-05-18 06:47:45', '2021-05-18 11:45:26'),
(2, 'My Company1', 3, 3, '2018-19', NULL, 1, NULL, '2021-05-18 06:02:36', '2021-05-20 12:42:25'),
(3, 'Divine', 3, NULL, '2017-18', NULL, 1, '2021-05-18 07:24:52', '2021-05-18 06:08:21', '2021-05-18 06:24:52'),
(4, 'Aum Research Labs Pvt Ltd.', 3, 2, '2019-20', NULL, 1, NULL, '2021-05-18 06:10:45', '2021-05-24 12:59:05'),
(5, 'Test Company', 3, NULL, '2017-18', NULL, 1, '2021-05-18 06:46:22', '2021-05-18 06:11:23', '2021-05-18 05:46:22'),
(6, 'test Data1', 3, 3, '2019-20', NULL, 1, '2021-05-24 07:22:32', '2021-05-18 07:11:13', '2021-05-24 06:22:32'),
(7, 'test123', 3, NULL, '2017-18', NULL, 1, '2021-05-18 07:25:47', '2021-05-18 07:25:40', '2021-05-18 06:25:47'),
(8, 'Company Five', 3, NULL, '2017-18', NULL, 1, '2021-05-18 07:30:41', '2021-05-18 07:27:56', '2021-05-18 06:30:41'),
(9, 'test', 3, NULL, '2017-18', NULL, 1, '2021-05-18 07:32:32', '2021-05-18 07:32:20', '2021-05-18 06:32:32'),
(10, 'Test One', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:14:55', '2021-05-18 09:14:40', '2021-05-18 08:14:55'),
(11, 'Test Two', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:15:48', '2021-05-18 09:15:37', '2021-05-18 08:15:48'),
(12, 'Test Test', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:18:29', '2021-05-18 09:18:22', '2021-05-18 08:18:29'),
(13, 'Test Three', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:18:59', '2021-05-18 09:18:52', '2021-05-18 08:18:59'),
(14, 'Test Five', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:20:00', '2021-05-18 09:19:54', '2021-05-18 08:20:00'),
(15, 'Test', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:20:38', '2021-05-18 09:20:31', '2021-05-18 08:20:38'),
(16, 'Testing', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:32:38', '2021-05-18 09:32:26', '2021-05-18 08:32:38'),
(17, 'Test 15', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:33:12', '2021-05-18 09:33:06', '2021-05-18 08:33:12'),
(18, 'Test', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:36:24', '2021-05-18 09:35:36', '2021-05-18 08:36:24'),
(19, 'Testing', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:37:22', '2021-05-18 09:37:15', '2021-05-18 08:37:22'),
(20, 'Test', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:39:01', '2021-05-18 09:38:52', '2021-05-18 08:39:01'),
(21, 'test', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:39:36', '2021-05-18 09:39:30', '2021-05-18 08:39:36'),
(22, 'Test Comp', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:44:29', '2021-05-18 09:44:23', '2021-05-18 08:44:29'),
(23, 'Test', 3, NULL, '2017-18', NULL, 1, '2021-05-18 09:50:41', '2021-05-18 09:50:28', '2021-05-18 08:50:41'),
(24, 'Test 1', 3, 3, '2017-18', NULL, 1, '2021-05-19 12:36:04', '2021-05-18 12:53:37', '2021-05-19 11:36:04'),
(25, 'Aum-Research Labs', 3, 3, '2017-18', NULL, 1, NULL, '2021-05-18 13:51:48', '2021-05-18 12:58:24'),
(26, 'Company Testing One', 3, NULL, '2017-18', NULL, 1, '2021-05-19 12:26:36', '2021-05-18 13:56:13', '2021-05-19 11:26:36'),
(27, 'asfdasdf', 3, NULL, '2017-18', NULL, 1, '2021-05-19 10:32:57', '2021-05-19 10:32:19', '2021-05-19 09:32:57'),
(28, 'asfdasdf', 3, NULL, '2017-18', NULL, 1, '2021-05-19 10:32:48', '2021-05-19 10:32:19', '2021-05-19 09:32:48'),
(29, 'asfdasdf', 3, NULL, '2017-18', NULL, 1, '2021-05-19 10:33:14', '2021-05-19 10:32:19', '2021-05-19 09:33:14'),
(30, 'Edit Comp', 3, 3, '2017-18', NULL, 1, '2021-05-19 12:24:21', '2021-05-19 10:32:19', '2021-05-19 11:24:21'),
(31, 'Test Company', 3, 3, '2017-18', NULL, 1, '2021-05-19 12:24:53', '2021-05-19 12:05:54', '2021-05-19 11:24:53'),
(32, 'test', 3, 3, '2017-18', NULL, 1, '2021-05-20 05:14:36', '2021-05-20 05:10:31', '2021-05-20 04:14:36'),
(33, 'Aum Research Labs', 3, 3, '2019-20', NULL, 1, NULL, '2021-05-24 07:22:43', '2021-06-15 10:24:57'),
(34, 'test', 3, NULL, '2019-20', NULL, 1, '2021-05-28 13:03:41', '2021-05-28 13:03:35', '2021-05-28 12:03:41'),
(35, 'test_comp', 3, 3, '2019-20', NULL, 1, '2021-06-08 07:32:41', '2021-06-08 07:31:53', '2021-06-08 06:32:41'),
(36, 'test12312', 3, 3, '2019-20', NULL, 1, '2021-06-08 13:19:27', '2021-06-08 13:19:01', '2021-06-08 12:19:27'),
(37, 'test1234', 3, 3, '2019-20', NULL, 1, '2021-06-10 10:02:30', '2021-06-10 10:02:06', '2021-06-10 09:02:30'),
(38, 'test', 3, NULL, '2019-20', NULL, 1, '2021-06-10 10:14:15', '2021-06-10 10:14:10', '2021-06-10 09:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `mst_countries`
--

CREATE TABLE `mst_countries` (
  `id` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `ISO` char(2) DEFAULT NULL,
  `ISO3` char(3) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_countries`
--

INSERT INTO `mst_countries` (`id`, `country_name`, `ISO`, `ISO3`, `is_active`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 0),
(2, 'Aland Islands', 'AX', 'ALA', 0),
(3, 'Albania', 'AL', 'ALB', 0),
(4, 'Algeria', 'DZ', 'DZA', 0),
(5, 'American Samoa', 'AS', 'ASM', 0),
(6, 'Andorra', 'AD', 'AND', 0),
(7, 'Angola', 'AO', 'AGO', 0),
(8, 'Anguilla', 'AI', 'AIA', 0),
(9, 'Antarctica', 'AQ', 'ATA', 0),
(10, 'Antigua and Barbuda', 'AG', 'ATG', 0),
(11, 'Argentina', 'AR', 'ARG', 0),
(12, 'Armenia', 'AM', 'ARM', 0),
(13, 'Aruba', 'AW', 'ABW', 0),
(14, 'Australia', 'AU', 'AUS', 0),
(15, 'Austria', 'AT', 'AUT', 0),
(16, 'Azerbaijan', 'AZ', 'AZE', 0),
(17, 'Bahamas', 'BS', 'BHS', 0),
(18, 'Bahrain', 'BH', 'BHR', 0),
(19, 'Bangladesh', 'BD', 'BGD', 0),
(20, 'Barbados', 'BB', 'BRB', 0),
(21, 'Belarus', 'BY', 'BLR', 0),
(22, 'Belgium', 'BE', 'BEL', 0),
(23, 'Belize', 'BZ', 'BLZ', 0),
(24, 'Benin', 'BJ', 'BEN', 0),
(25, 'Bermuda', 'BM', 'BMU', 0),
(26, 'Bhutan', 'BT', 'BTN', 0),
(27, 'Bolivia', 'BO', 'BOL', 0),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 0),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH', 0),
(30, 'Botswana', 'BW', 'BWA', 0),
(31, 'Bouvet Island', 'BV', 'BVT', 0),
(32, 'Brazil', 'BR', 'BRA', 0),
(33, 'British Indian Ocean Territory', 'IO', 'IOT', 0),
(34, 'Brunei', 'BN', 'BRN', 0),
(35, 'Bulgaria', 'BG', 'BGR', 0),
(36, 'Burkina Faso', 'BF', 'BFA', 0),
(37, 'Burundi', 'BI', 'BDI', 0),
(38, 'Cambodia', 'KH', 'KHM', 0),
(39, 'Cameroon', 'CM', 'CMR', 0),
(40, 'Canada', 'CA', 'CAN', 0),
(41, 'Cape Verde', 'CV', 'CPV', 0),
(42, 'Cayman Islands', 'KY', 'CYM', 0),
(43, 'Central African Republic', 'CF', 'CAF', 0),
(44, 'Chad', 'TD', 'TCD', 0),
(45, 'Chile', 'CL', 'CHL', 0),
(46, 'China', 'CN', 'CHN', 0),
(47, 'Christmas Island', 'CX', 'CXR', 0),
(48, 'Cocos (Keeling) Islands', 'CC', 'CCK', 0),
(49, 'Colombia', 'CO', 'COL', 0),
(50, 'Comoros', 'KM', 'COM', 0),
(51, 'Congo', 'CG', 'COG', 0),
(52, 'Cook Islands', 'CK', 'COK', 0),
(53, 'Costa Rica', 'CR', 'CRI', 0),
(54, 'Ivory Coast', 'CI', 'CIV', 0),
(55, 'Croatia', 'HR', 'HRV', 0),
(56, 'Cuba', 'CU', 'CUB', 0),
(57, 'Curacao', 'CW', 'CUW', 0),
(58, 'Cyprus', 'CY', 'CYP', 0),
(59, 'Czech Republic', 'CZ', 'CZE', 0),
(60, 'Democratic Republic of the Congo', 'CD', 'COD', 0),
(61, 'Denmark', 'DK', 'DNK', 0),
(62, 'Djibouti', 'DJ', 'DJI', 0),
(63, 'Dominica', 'DM', 'DMA', 0),
(64, 'Dominican Republic', 'DO', 'DOM', 0),
(65, 'Ecuador', 'EC', 'ECU', 0),
(66, 'Egypt', 'EG', 'EGY', 0),
(67, 'El Salvador', 'SV', 'SLV', 0),
(68, 'Equatorial Guinea', 'GQ', 'GNQ', 0),
(69, 'Eritrea', 'ER', 'ERI', 0),
(70, 'Estonia', 'EE', 'EST', 0),
(71, 'Ethiopia', 'ET', 'ETH', 0),
(72, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 0),
(73, 'Faroe Islands', 'FO', 'FRO', 0),
(74, 'Fiji', 'FJ', 'FJI', 0),
(75, 'Finland', 'FI', 'FIN', 0),
(76, 'France', 'FR', 'FRA', 0),
(77, 'French Guiana', 'GF', 'GUF', 0),
(78, 'French Polynesia', 'PF', 'PYF', 0),
(79, 'French Southern Territories', 'TF', 'ATF', 0),
(80, 'Gabon', 'GA', 'GAB', 0),
(81, 'Gambia', 'GM', 'GMB', 0),
(82, 'Georgia', 'GE', 'GEO', 0),
(83, 'Germany', 'DE', 'DEU', 0),
(84, 'Ghana', 'GH', 'GHA', 0),
(85, 'Gibraltar', 'GI', 'GIB', 0),
(86, 'Greece', 'GR', 'GRC', 0),
(87, 'Greenland', 'GL', 'GRL', 0),
(88, 'Grenada', 'GD', 'GRD', 0),
(89, 'Guadaloupe', 'GP', 'GLP', 0),
(90, 'Guam', 'GU', 'GUM', 0),
(91, 'Guatemala', 'GT', 'GTM', 0),
(92, 'Guernsey', 'GG', 'GGY', 0),
(93, 'Guinea', 'GN', 'GIN', 0),
(94, 'Guinea-Bissau', 'GW', 'GNB', 0),
(95, 'Guyana', 'GY', 'GUY', 0),
(96, 'Haiti', 'HT', 'HTI', 0),
(97, 'Heard Island and McDonald Islands', 'HM', 'HMD', 0),
(98, 'Honduras', 'HN', 'HND', 0),
(99, 'Hong Kong', 'HK', 'HKG', 0),
(100, 'Hungary', 'HU', 'HUN', 0),
(101, 'Iceland', 'IS', 'ISL', 0),
(102, 'India', 'IN', 'IND', 1),
(103, 'Indonesia', 'ID', 'IDN', 0),
(104, 'Iran', 'IR', 'IRN', 0),
(105, 'Iraq', 'IQ', 'IRQ', 0),
(106, 'Ireland', 'IE', 'IRL', 0),
(107, 'Isle of Man', 'IM', 'IMN', 0),
(108, 'Israel', 'IL', 'ISR', 0),
(109, 'Italy', 'IT', 'ITA', 0),
(110, 'Jamaica', 'JM', 'JAM', 0),
(111, 'Japan', 'JP', 'JPN', 0),
(112, 'Jersey', 'JE', 'JEY', 0),
(113, 'Jordan', 'JO', 'JOR', 0),
(114, 'Kazakhstan', 'KZ', 'KAZ', 0),
(115, 'Kenya', 'KE', 'KEN', 0),
(116, 'Kiribati', 'KI', 'KIR', 0),
(117, 'Kosovo', 'XK', '---', 0),
(118, 'Kuwait', 'KW', 'KWT', 0),
(119, 'Kyrgyzstan', 'KG', 'KGZ', 0),
(120, 'Laos', 'LA', 'LAO', 0),
(121, 'Latvia', 'LV', 'LVA', 0),
(122, 'Lebanon', 'LB', 'LBN', 0),
(123, 'Lesotho', 'LS', 'LSO', 0),
(124, 'Liberia', 'LR', 'LBR', 0),
(125, 'Libya', 'LY', 'LBY', 0),
(126, 'Liechtenstein', 'LI', 'LIE', 0),
(127, 'Lithuania', 'LT', 'LTU', 0),
(128, 'Luxembourg', 'LU', 'LUX', 0),
(129, 'Macao', 'MO', 'MAC', 0),
(130, 'Macedonia', 'MK', 'MKD', 0),
(131, 'Madagascar', 'MG', 'MDG', 0),
(132, 'Malawi', 'MW', 'MWI', 0),
(133, 'Malaysia', 'MY', 'MYS', 0),
(134, 'Maldives', 'MV', 'MDV', 0),
(135, 'Mali', 'ML', 'MLI', 0),
(136, 'Malta', 'MT', 'MLT', 0),
(137, 'Marshall Islands', 'MH', 'MHL', 0),
(138, 'Martinique', 'MQ', 'MTQ', 0),
(139, 'Mauritania', 'MR', 'MRT', 0),
(140, 'Mauritius', 'MU', 'MUS', 0),
(141, 'Mayotte', 'YT', 'MYT', 0),
(142, 'Mexico', 'MX', 'MEX', 0),
(143, 'Micronesia', 'FM', 'FSM', 0),
(144, 'Moldava', 'MD', 'MDA', 0),
(145, 'Monaco', 'MC', 'MCO', 0),
(146, 'Mongolia', 'MN', 'MNG', 0),
(147, 'Montenegro', 'ME', 'MNE', 0),
(148, 'Montserrat', 'MS', 'MSR', 0),
(149, 'Morocco', 'MA', 'MAR', 0),
(150, 'Mozambique', 'MZ', 'MOZ', 0),
(151, 'Myanmar (Burma)', 'MM', 'MMR', 0),
(152, 'Namibia', 'NA', 'NAM', 0),
(153, 'Nauru', 'NR', 'NRU', 0),
(154, 'Nepal', 'NP', 'NPL', 0),
(155, 'Netherlands', 'NL', 'NLD', 0),
(156, 'New Caledonia', 'NC', 'NCL', 0),
(157, 'New Zealand', 'NZ', 'NZL', 0),
(158, 'Nicaragua', 'NI', 'NIC', 0),
(159, 'Niger', 'NE', 'NER', 0),
(160, 'Nigeria', 'NG', 'NGA', 0),
(161, 'Niue', 'NU', 'NIU', 0),
(162, 'Norfolk Island', 'NF', 'NFK', 0),
(163, 'North Korea', 'KP', 'PRK', 0),
(164, 'Northern Mariana Islands', 'MP', 'MNP', 0),
(165, 'Norway', 'NO', 'NOR', 0),
(166, 'Oman', 'OM', 'OMN', 0),
(167, 'Pakistan', 'PK', 'PAK', 0),
(168, 'Palau', 'PW', 'PLW', 0),
(169, 'Palestine', 'PS', 'PSE', 0),
(170, 'Panama', 'PA', 'PAN', 0),
(171, 'Papua New Guinea', 'PG', 'PNG', 0),
(172, 'Paraguay', 'PY', 'PRY', 0),
(173, 'Peru', 'PE', 'PER', 0),
(174, 'Phillipines', 'PH', 'PHL', 0),
(175, 'Pitcairn', 'PN', 'PCN', 0),
(176, 'Poland', 'PL', 'POL', 0),
(177, 'Portugal', 'PT', 'PRT', 0),
(178, 'Puerto Rico', 'PR', 'PRI', 0),
(179, 'Qatar', 'QA', 'QAT', 0),
(180, 'Reunion', 'RE', 'REU', 0),
(181, 'Romania', 'RO', 'ROU', 0),
(182, 'Russia', 'RU', 'RUS', 0),
(183, 'Rwanda', 'RW', 'RWA', 0),
(184, 'Saint Barthelemy', 'BL', 'BLM', 0),
(185, 'Saint Helena', 'SH', 'SHN', 0),
(186, 'Saint Kitts and Nevis', 'KN', 'KNA', 0),
(187, 'Saint Lucia', 'LC', 'LCA', 0),
(188, 'Saint Martin', 'MF', 'MAF', 0),
(189, 'Saint Pierre and Miquelon', 'PM', 'SPM', 0),
(190, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 0),
(191, 'Samoa', 'WS', 'WSM', 0),
(192, 'San Marino', 'SM', 'SMR', 0),
(193, 'Sao Tome and Principe', 'ST', 'STP', 0),
(194, 'Saudi Arabia', 'SA', 'SAU', 0),
(195, 'Senegal', 'SN', 'SEN', 0),
(196, 'Serbia', 'RS', 'SRB', 0),
(197, 'Seychelles', 'SC', 'SYC', 0),
(198, 'Sierra Leone', 'SL', 'SLE', 0),
(199, 'Singapore', 'SG', 'SGP', 0),
(200, 'Sint Maarten', 'SX', 'SXM', 0),
(201, 'Slovakia', 'SK', 'SVK', 0),
(202, 'Slovenia', 'SI', 'SVN', 0),
(203, 'Solomon Islands', 'SB', 'SLB', 0),
(204, 'Somalia', 'SO', 'SOM', 0),
(205, 'South Africa', 'ZA', 'ZAF', 0),
(206, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 0),
(207, 'South Korea', 'KR', 'KOR', 0),
(208, 'South Sudan', 'SS', 'SSD', 0),
(209, 'Spain', 'ES', 'ESP', 0),
(210, 'Sri Lanka', 'LK', 'LKA', 0),
(211, 'Sudan', 'SD', 'SDN', 0),
(212, 'Suriname', 'SR', 'SUR', 0),
(213, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 0),
(214, 'Swaziland', 'SZ', 'SWZ', 0),
(215, 'Sweden', 'SE', 'SWE', 0),
(216, 'Switzerland', 'CH', 'CHE', 0),
(217, 'Syria', 'SY', 'SYR', 0),
(218, 'Taiwan', 'TW', 'TWN', 0),
(219, 'Tajikistan', 'TJ', 'TJK', 0),
(220, 'Tanzania', 'TZ', 'TZA', 0),
(221, 'Thailand', 'TH', 'THA', 0),
(222, 'Timor-Leste (East Timor)', 'TL', 'TLS', 0),
(223, 'Togo', 'TG', 'TGO', 0),
(224, 'Tokelau', 'TK', 'TKL', 0),
(225, 'Tonga', 'TO', 'TON', 0),
(226, 'Trinidad and Tobago', 'TT', 'TTO', 0),
(227, 'Tunisia', 'TN', 'TUN', 0),
(228, 'Turkey', 'TR', 'TUR', 0),
(229, 'Turkmenistan', 'TM', 'TKM', 0),
(230, 'Turks and Caicos Islands', 'TC', 'TCA', 0),
(231, 'Tuvalu', 'TV', 'TUV', 0),
(232, 'Uganda', 'UG', 'UGA', 0),
(233, 'Ukraine', 'UA', 'UKR', 0),
(234, 'United Arab Emirates', 'AE', 'ARE', 0),
(235, 'United Kingdom', 'GB', 'GBR', 0),
(236, 'United States', 'US', 'USA', 0),
(237, 'United States Minor Outlying Islands', 'UM', 'UMI', 0),
(238, 'Uruguay', 'UY', 'URY', 0),
(239, 'Uzbekistan', 'UZ', 'UZB', 0),
(240, 'Vanuatu', 'VU', 'VUT', 0),
(241, 'Vatican City', 'VA', 'VAT', 0),
(242, 'Venezuela', 'VE', 'VEN', 0),
(243, 'Vietnam', 'VN', 'VNM', 0),
(244, 'Virgin Islands, British', 'VG', 'VGB', 0),
(245, 'Virgin Islands, US', 'VI', 'VIR', 0),
(246, 'Wallis and Futuna', 'WF', 'WLF', 0),
(247, 'Western Sahara', 'EH', 'ESH', 0),
(248, 'Yemen', 'YE', 'YEM', 0),
(249, 'Zambia', 'ZM', 'ZMB', 0),
(250, 'Zimbabwe', 'ZW', 'ZWE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mst_customers`
--

CREATE TABLE `mst_customers` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `company_name` varchar(512) DEFAULT NULL,
  `gst_number` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(100) DEFAULT NULL,
  `tally_alias_name` varchar(100) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `contact_type` varchar(20) DEFAULT NULL,
  `priority` varchar(10) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `education_details` text DEFAULT NULL,
  `prev_details` text DEFAULT NULL,
  `company_tin_no` varchar(155) DEFAULT NULL,
  `company_service_tax_no` varchar(155) DEFAULT NULL,
  `company_cust_discount` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_customers`
--

INSERT INTO `mst_customers` (`id`, `mst_companies_id`, `company_name`, `gst_number`, `contact_person_name`, `tally_alias_name`, `user_name`, `password`, `birth_date`, `contact_type`, `priority`, `notes`, `logo`, `education_details`, `prev_details`, `company_tin_no`, `company_service_tax_no`, `company_cust_discount`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'Divine infosys', '06AABCU9603R1ZR', 'vishal kotak', 'SUryam', 'preksha.divine@gmail.com', '$2y$10$SCmIeNrRbxeuGoeJY0WcFe926D4q801waQ9gPqs4bwBn8vo1nkxTG', '2021-09-22', NULL, NULL, 'preksha.divine@gmail.com', '20210909135406.jpg', NULL, NULL, NULL, NULL, NULL, 3, 3, '2021-09-09 13:54:06', '2021-09-09 13:54:06', '2019-20', NULL, NULL, NULL),
(2, 1, 'Divine infosys', NULL, 'vishal kotak', NULL, 'preksha.divine@gmail.com', '$2y$10$MtT8iqElE4l07Aa.udZcZeLQrby00SZmcdmRiD1wQ1f3rQd9YZpNC', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 3, 3, '2021-09-09 13:55:11', '2021-09-09 13:55:11', '2019-20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_customers_contact_info`
--

CREATE TABLE `mst_customers_contact_info` (
  `id` int(11) NOT NULL,
  `mst_customer_id` int(11) NOT NULL,
  `street_1` varchar(100) DEFAULT NULL,
  `street_2` varchar(100) DEFAULT NULL,
  `area` varchar(40) DEFAULT NULL,
  `pin` varchar(6) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `home_landline` varchar(55) DEFAULT NULL,
  `other_website` varchar(155) DEFAULT NULL,
  `other_qc_email` varchar(255) DEFAULT NULL,
  `home_pan_card` varchar(10) DEFAULT NULL,
  `other_pan_card_copy` varchar(255) DEFAULT NULL,
  `contact_info_type` int(11) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL COMMENT 'Home(Account/Admin Contact No)/Other Contact No(QA Contact No)',
  `home_qc_contact_no` varchar(55) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'Home email(Account/Admin E-mail)/Other email(QA E-mail)',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_customers_contact_info`
--

INSERT INTO `mst_customers_contact_info` (`id`, `mst_customer_id`, `street_1`, `street_2`, `area`, `pin`, `city`, `state`, `country`, `home_landline`, `other_website`, `other_qc_email`, `home_pan_card`, `other_pan_card_copy`, `contact_info_type`, `contact_no`, `home_qc_contact_no`, `email`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR', 'CG Road Ahmedabad', 'Motera', '380051', 'Ahmedabad', 12, 102, '079-27507178', NULL, NULL, 'ABCTY1234D', NULL, 1, '9408072555', '9408072555', 'vishal@divineinfosys.com', 3, 3, '2021-09-09 13:54:06', '2021-09-09 13:54:06', NULL),
(2, 1, 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR', 'CG Road Ahmedabad', 'Motera', '380051', 'Ahmedabad', 12, 102, NULL, 'snapfinance.com', 'info@divineinfosys.com', NULL, '20210909135406.jpg', 2, '9408072555', NULL, 'darshan@divineinfosys.com', 3, 3, '2021-09-09 13:54:06', '2021-09-09 13:54:06', NULL),
(3, 2, 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR', '', '', '380051', '', 0, 102, '', NULL, NULL, '', NULL, 1, '', '', 'vishal@divineinfosys.com', 3, 3, '2021-09-09 13:55:11', '2021-09-09 13:55:11', NULL),
(4, 2, '', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-09-09 13:55:11', '2021-09-09 13:55:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_customers_contact_person`
--

CREATE TABLE `mst_customers_contact_person` (
  `id` int(11) NOT NULL,
  `mst_customer_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_customers_contact_person`
--

INSERT INTO `mst_customers_contact_person` (`id`, `mst_customer_id`, `name`, `mobile`, `email`, `department`, `position`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Vishal kotak', '0953767131', 'vishalkotak200@gmail.com', 6, 3, 3, 3, '2021-09-09 13:54:06', '2021-09-09 13:54:06', NULL),
(2, 1, 'Nirav Patel', '0942653391', 'Gaurav@jaywater.com', 6, 5, 3, 3, '2021-09-09 13:54:06', '2021-09-09 13:54:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_departments`
--

CREATE TABLE `mst_departments` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `mst_branches_id` int(11) DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all master companies list';

--
-- Dumping data for table `mst_departments`
--

INSERT INTO `mst_departments` (`id`, `mst_companies_id`, `mst_branches_id`, `department_name`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 'Department 1', 1, 1, '2019-20', NULL, 1, '2021-06-11 05:55:17', '2021-05-24 13:19:04', '2021-06-11 04:55:17'),
(2, 1, 14, 'Department 2', 1, NULL, '2019-20', NULL, 1, '2021-05-26 09:07:02', '2021-05-24 13:19:24', '2021-05-26 08:07:02'),
(3, 1, 14, 'Department 3', 1, NULL, '2019-20', NULL, 1, '2021-05-26 09:24:56', '2021-05-24 13:19:30', '2021-05-26 08:24:56'),
(4, 1, 12, 'Department 4', 1, NULL, '2019-20', NULL, 1, '2021-06-18 13:01:33', '2021-05-24 13:19:36', '2021-06-18 12:01:33'),
(5, 1, 12, 'HR', 1, 3, '2019-20', NULL, 1, NULL, '2021-05-24 13:19:42', '2021-07-19 09:49:50'),
(6, 1, 10, 'Department 6', 1, NULL, '2020-21', NULL, 1, NULL, '2021-05-24 13:20:37', '2021-05-26 11:49:41'),
(7, 4, 13, 'Accounts111', 3, 3, '2019-20', NULL, 1, '2021-06-08 13:21:24', '2021-05-26 09:00:59', '2021-06-08 12:21:24'),
(8, 1, 15, 'test', 3, NULL, '2019-20', NULL, 1, '2021-06-08 11:01:03', '2021-06-08 11:00:07', '2021-06-08 10:01:03'),
(9, 1, 10, 'Analysis', 3, 3, '2019-20', NULL, 1, '2021-06-08 11:00:59', '2021-06-08 11:00:29', '2021-06-08 10:00:59'),
(10, 1, 13, 'test1234', 3, 3, '2019-20', NULL, 1, '2021-06-10 10:15:41', '2021-06-10 10:15:17', '2021-06-10 09:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `mst_groups`
--

CREATE TABLE `mst_groups` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_code` varchar(100) DEFAULT NULL,
  `parent_group` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all master companies list';

--
-- Dumping data for table `mst_groups`
--

INSERT INTO `mst_groups` (`id`, `mst_companies_id`, `group_name`, `group_code`, `parent_group`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Current Liabilites', '1234569', 2, 3, 3, '2019-20', NULL, 1, NULL, '2021-05-20 14:08:09', '2021-05-25 09:30:04'),
(2, 1, 'Creditors', '1234569', NULL, 3, NULL, '2019-20', NULL, 1, NULL, '2021-05-20 14:08:27', '2021-05-26 09:08:18'),
(3, 1, 'Sales1234', '85235AO1', NULL, 3, 3, '2019-20', NULL, 1, NULL, '2021-05-20 14:08:46', '2021-08-05 05:51:17'),
(8, 1, 'None', '255', 2, 3, 3, '2019-20', NULL, 1, '2021-06-08 05:50:21', '2021-05-21 04:50:41', '2021-06-08 04:50:21'),
(10, 1, 'test123', '123456', 8, 3, 3, '2019-20', NULL, 1, '2021-05-24 06:16:04', '2021-05-24 06:15:44', '2021-05-24 05:16:04'),
(11, 1, 'sadfas asdf', 'sadfsad fsad', 2, 2, NULL, '2019-20', NULL, 1, '2021-05-24 13:58:10', '2021-05-24 13:58:03', '2021-05-24 12:58:10'),
(12, 1, 'test1', '1234500', 2, 3, 3, '2019-20', NULL, 1, '2021-06-08 06:31:00', '2021-06-08 06:26:34', '2021-06-08 05:31:00'),
(13, 1, 'test', '2445400', 3, 3, 3, '2019-20', NULL, 1, '2021-06-08 13:18:03', '2021-06-08 13:17:35', '2021-06-08 12:18:03'),
(14, 1, 'test test', 'test', 2, 3, 3, '2019-20', NULL, 1, '2021-06-10 09:58:11', '2021-06-10 09:57:45', '2021-06-10 08:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `mst_ledgers`
--

CREATE TABLE `mst_ledgers` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `mst_groups_id` int(11) DEFAULT NULL,
  `ledger_name` varchar(255) DEFAULT NULL,
  `ledger_opening_balance` varchar(255) DEFAULT NULL,
  `ledger_contact_type` varchar(55) DEFAULT NULL,
  `balance_type` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all ledgers records';

--
-- Dumping data for table `mst_ledgers`
--

INSERT INTO `mst_ledgers` (`id`, `mst_companies_id`, `mst_groups_id`, `ledger_name`, `ledger_opening_balance`, `ledger_contact_type`, `balance_type`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 'Ledger T', '100', 'Service Provider', 'Dr', 1, 3, '2018-19', NULL, 1, NULL, '2021-05-26 06:18:15', '2021-08-05 05:29:40'),
(2, 1, NULL, 'Ledger 2', '2', 'NA', 'dr', 1, NULL, '2019-20', NULL, 1, '2021-05-28 04:30:05', '2021-05-27 13:08:51', '2021-05-28 03:30:05'),
(3, 1, 1, 'Test Ledger 2', '2500.50', 'Supplier', 'Cr', 3, 3, '2019-20', NULL, 1, NULL, '2021-05-28 04:53:55', '2021-05-31 10:40:04'),
(4, 1, 2, 'Test Ledger 1', '0', 'Customer', 'Dr', 3, 3, '2019-20', NULL, 1, NULL, '2021-05-28 04:54:24', '2021-05-31 10:39:10'),
(5, 1, 8, 'test', '500', 'Customer', 'Cr', 3, NULL, '2019-20', NULL, 1, '2021-06-08 07:21:16', '2021-05-31 11:42:22', '2021-06-08 06:21:16'),
(6, 1, 2, 'test', '120.50', 'Manufacturer', 'Cr', 3, 3, '2019-20', NULL, 1, NULL, '2021-06-07 13:11:27', '2021-06-11 09:50:43'),
(7, 1, 8, 'test ledger', '152800', 'Ledger', 'Dr', 3, 3, '2019-20', NULL, 1, '2021-06-08 13:18:44', '2021-06-07 13:36:10', '2021-06-08 12:18:44'),
(8, 1, 3, 'test', '1234', 'Ledger', 'Dr', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-21 09:17:56', '2021-06-21 08:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `mst_locations`
--

CREATE TABLE `mst_locations` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_locations`
--

INSERT INTO `mst_locations` (`id`, `mst_companies_id`, `location_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'Baroda', 3, NULL, '2021-08-09 12:22:57', '2021-08-09 12:30:25', '2019-20', NULL, 1, '2021-08-09 12:30:25'),
(2, 1, 'Baroda', 3, NULL, '2021-08-09 12:23:21', '2021-08-09 12:30:30', '2019-20', NULL, 1, '2021-08-09 12:30:30'),
(3, 1, 'Compliments', 3, 3, '2021-08-09 12:23:25', '2021-08-09 12:53:24', '2019-20', NULL, 1, NULL),
(4, 1, 'Chemical Room', 3, NULL, '2021-08-09 12:36:32', '2021-08-09 12:36:32', '2019-20', NULL, 1, NULL),
(5, 1, 'Muzafarabad', 3, 3, '2021-08-09 12:41:05', '2021-08-09 12:51:00', '2019-20', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_machines`
--

CREATE TABLE `mst_machines` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `machine_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_machines`
--

INSERT INTO `mst_machines` (`id`, `mst_companies_id`, `machine_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'MC78952025', 3, 3, '2021-08-09 13:05:37', '2021-08-09 13:10:55', '2019-20', NULL, 1, NULL),
(2, 1, 'Test MAchine', 3, NULL, '2021-08-09 13:06:51', '2021-08-09 13:06:57', '2019-20', NULL, 1, '2021-08-09 13:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `mst_materials`
--

CREATE TABLE `mst_materials` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `material_type` varchar(25) NOT NULL,
  `material_name` varchar(255) NOT NULL,
  `material_purchase_rate` float(10,3) NOT NULL,
  `material_code` varchar(55) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `sub_sub_category_id` int(11) DEFAULT NULL,
  `material_rate` float(10,3) NOT NULL,
  `material_amount` float(15,3) NOT NULL,
  `material_qty` int(5) NOT NULL,
  `mst_units_id` int(11) DEFAULT NULL,
  `material_use_before_date` date DEFAULT NULL,
  `material_case_number` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_materials`
--

INSERT INTO `mst_materials` (`id`, `mst_companies_id`, `material_type`, `material_name`, `material_purchase_rate`, `material_code`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `material_rate`, `material_amount`, `material_qty`, `mst_units_id`, `material_use_before_date`, `material_case_number`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'asfdf', 'sodium sulphur potassium', 1000.000, '1212', 2, 3, 4, 10.000, 10000.000, 1000, 123, '2019-06-01', 321654, 1, NULL, '2021-08-05 07:55:33', '2021-08-06 10:30:45', '2019-20', NULL, 1, '2021-08-06 10:30:45'),
(2, 1, 'Liquid', 'test material', 100.000, '2500AB', 1, 2, 3, 2500.000, 85235.000, 100, 1, '2021-08-19', 5555555, 3, NULL, '2021-08-06 09:16:41', '2021-09-03 09:52:54', '2019-20', NULL, 1, '2021-09-03 09:52:54'),
(3, 1, 'Liquid', 'Sodium Cloride Fosfet1', 300523.000, '582020er', 12, 13, 3, 855545.000, 25689000.000, 100, 1, '2021-08-03', 89952500, 3, 3, '2021-08-06 09:21:28', '2021-08-09 09:36:58', '2019-20', NULL, 1, NULL),
(4, 1, 'Other', 'test material Check', 300.000, '2500AB', 1, 2, 3, 8555.000, 25689000.000, 10, 2, '2021-09-01', 899525, 3, 3, '2021-08-19 10:58:37', '2021-08-19 13:21:28', '2019-20', NULL, 1, '2021-08-19 13:21:28'),
(5, 1, 'Liquid', 'test material123', 100000.000, '582028', 12, 13, NULL, 25000.000, 85235584.000, 101, 1, '2021-08-29', 89952555, 3, NULL, '2021-08-19 10:59:19', '2021-08-19 10:59:19', '2019-20', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_pharmacopeia`
--

CREATE TABLE `mst_pharmacopeia` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `pharmacopeia_name` varchar(255) DEFAULT NULL,
  `vol_no` int(11) DEFAULT NULL,
  `pharmacopeia_year` int(4) DEFAULT NULL,
  `pharmacopeia_edition` varchar(255) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store pharmacopeia details';

--
-- Dumping data for table `mst_pharmacopeia`
--

INSERT INTO `mst_pharmacopeia` (`id`, `mst_companies_id`, `pharmacopeia_name`, `vol_no`, `pharmacopeia_year`, `pharmacopeia_edition`, `selected_year`, `copied_from_year`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'New 1', 1, 2021, '2020', '2019-20', NULL, 1, 1, NULL, '2021-05-21 07:06:35', '2021-05-20 09:09:31', '2021-05-21 07:06:35'),
(2, 1, 'IP', 10, 2018, '2st', '2019-20', NULL, 1, 3, 2, NULL, '2021-05-21 07:01:16', '2021-05-24 13:19:42'),
(3, 1, 'BP', 5, 2021, '1st', '2019-20', NULL, 1, 3, 2, NULL, '2021-05-21 07:01:36', '2021-05-24 13:19:29'),
(4, 1, 'USP', 15, 2021, '2nd', '2019-20', NULL, 1, 3, 3, NULL, '2021-05-21 07:02:01', '2021-06-12 14:55:34'),
(5, 1, 'test1', 12, 21, '5th', '2019-20', NULL, 1, 2, 3, '2021-05-28 12:41:22', '2021-05-24 13:55:03', '2021-05-28 12:41:22'),
(6, 1, 'Pharmacopiea', 2, 5, '01', '2019-20', NULL, 1, 3, 3, '2021-06-08 13:23:07', '2021-05-28 12:41:41', '2021-06-08 13:23:07'),
(7, 1, 'OPMG', 2, 15, 'gfdg', '2019-20', NULL, 1, 3, 3, '2021-06-08 12:48:26', '2021-06-08 12:47:42', '2021-06-08 12:48:26'),
(8, 1, 'test123', 52, 478902, 'test', '2019-20', NULL, 1, 3, 3, '2021-06-11 05:58:29', '2021-06-08 13:23:32', '2021-06-11 05:58:29'),
(9, 1, 'test', 1, 10, '5th', '2019-20', NULL, 1, 3, 3, '2021-06-10 09:52:22', '2021-06-10 09:51:45', '2021-06-10 09:52:22'),
(10, 1, 'EP', 23432, 2021, '1', '2019-20', NULL, 1, 2, NULL, NULL, '2021-06-18 10:05:17', '2021-06-18 10:05:17'),
(11, 1, 'IHS', 1, 2021, '1', '2019-20', NULL, 1, 2, NULL, NULL, '2021-06-18 10:06:44', '2021-06-18 10:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `mst_positions`
--

CREATE TABLE `mst_positions` (
  `id` int(11) NOT NULL,
  `mst_departments_id` int(11) DEFAULT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `position_title` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all master companies list';

--
-- Dumping data for table `mst_positions`
--

INSERT INTO `mst_positions` (`id`, `mst_departments_id`, `mst_companies_id`, `position_title`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'Marketing', 1, 3, '2019-20', NULL, 1, NULL, '2021-05-26 05:06:29', '2021-07-28 07:09:15'),
(2, 2, 1, 'Accounts', 1, NULL, '2019-20', NULL, 1, NULL, '2021-05-26 05:06:35', '2021-07-28 07:09:20'),
(3, 3, 1, 'Finance', 1, NULL, '2019-20', NULL, 1, NULL, '2021-05-26 05:06:38', '2021-07-28 07:09:28'),
(4, 7, 4, 'Accounts Manager', 3, NULL, '2019-20', NULL, 1, NULL, '2021-05-26 11:53:07', '2021-05-26 10:53:07'),
(5, 4, 4, 'QA123', 3, 3, '2019-20', NULL, 1, NULL, '2021-05-26 11:53:59', '2021-07-28 07:08:53'),
(6, 5, 1, 'test position', 3, 3, '2019-20', NULL, 1, NULL, '2021-06-08 11:12:39', '2021-07-28 07:08:57'),
(7, 5, 1, 'QA', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-08 13:22:23', '2021-06-08 12:22:23'),
(8, 5, 1, 'HR Executive', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-11 05:55:58', '2021-06-11 04:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `mst_states`
--

CREATE TABLE `mst_states` (
  `id` int(11) UNSIGNED NOT NULL,
  `mst_countries_id` int(11) DEFAULT 1,
  `state_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_states`
--

INSERT INTO `mst_states` (`id`, `mst_countries_id`, `state_name`, `is_active`) VALUES
(1, 102, 'ANDAMAN AND NICOBAR ISLANDS', 1),
(2, 102, 'ANDHRA PRADESH', 1),
(3, 102, 'ARUNACHAL PRADESH', 1),
(4, 102, 'ASSAM', 1),
(5, 102, 'BIHAR', 1),
(6, 102, 'CHATTISGARH', 1),
(7, 102, 'CHANDIGARH', 1),
(8, 102, 'DAMAN AND DIU', 1),
(9, 102, 'DELHI', 1),
(10, 102, 'DADRA AND NAGAR HAVELI', 1),
(11, 102, 'GOA', 1),
(12, 102, 'GUJARAT', 1),
(13, 102, 'HIMACHAL PRADESH', 1),
(14, 102, 'HARYANA', 1),
(15, 102, 'JAMMU AND KASHMIR', 1),
(16, 102, 'JHARKHAND', 1),
(17, 102, 'KERALA', 1),
(18, 102, 'KARNATAKA', 1),
(19, 102, 'LAKSHADWEEP', 1),
(20, 102, 'MEGHALAYA', 1),
(21, 102, 'MAHARASHTRA', 1),
(22, 102, 'MANIPUR', 1),
(23, 102, 'MADHYA PRADESH', 1),
(24, 102, 'MIZORAM', 1),
(25, 102, 'NAGALAND', 1),
(26, 102, 'ORISSA', 1),
(27, 102, 'PUNJAB', 1),
(28, 102, 'PONDICHERRY', 1),
(29, 102, 'RAJASTHAN', 1),
(30, 102, 'SIKKIM', 1),
(31, 102, 'TAMIL NADU', 1),
(32, 102, 'TRIPURA', 1),
(33, 102, 'UTTARAKHAND', 1),
(34, 102, 'UTTAR PRADESH', 1),
(35, 102, 'WEST BENGAL', 1),
(36, 102, 'TELANGANA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_units`
--

CREATE TABLE `mst_units` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_units`
--

INSERT INTO `mst_units` (`id`, `mst_companies_id`, `unit_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'KG', 3, NULL, '2021-08-06 07:28:52', '2021-08-06 07:28:52', '2019-20', NULL, 1, NULL),
(2, 1, '%', 3, NULL, '2021-08-06 07:29:00', '2021-08-06 07:29:00', '2019-20', NULL, 1, NULL),
(3, 1, 'mtr1', 3, 3, '2021-08-09 13:27:37', '2021-08-09 13:35:15', '2019-20', NULL, 1, '2021-08-09 13:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `title` varchar(55) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birth_date` varchar(50) DEFAULT NULL,
  `marital_status` varchar(40) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `machine_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `attendance` tinyint(1) DEFAULT 0,
  `signature` varchar(255) DEFAULT NULL,
  `booking_action` tinyint(1) DEFAULT 0,
  `booking_sms` tinyint(1) DEFAULT 0,
  `booking_email` tinyint(1) DEFAULT 0,
  `is_resigned` tinyint(1) NOT NULL DEFAULT 0,
  `booking_copy` tinyint(1) DEFAULT 0,
  `nationality` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `caste` varchar(155) DEFAULT NULL,
  `is_reporting_authority` tinyint(1) NOT NULL DEFAULT 0,
  `deposit` tinyint(1) DEFAULT 0,
  `booking_rate` tinyint(4) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this table use to store users information with login data';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `mst_companies_id`, `title`, `first_name`, `middle_name`, `last_name`, `email`, `email_verified_at`, `username`, `password`, `remember_token`, `blood_group`, `gender`, `birth_date`, `marital_status`, `photo`, `machine_code`, `phone`, `mobile`, `notes`, `attendance`, `signature`, `booking_action`, `booking_sms`, `booking_email`, `is_resigned`, `booking_copy`, `nationality`, `religion`, `caste`, `is_reporting_authority`, `deposit`, `booking_rate`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `is_admin`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Manoj', 'Kumar', 'Patel', 'manojp.divine@gmail.com', NULL, 'manojp.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, '2021-05-07 14:40:35', '2021-05-07 09:10:35'),
(2, NULL, NULL, 'Sanjay', 'Kumar', 'Patel', 'sanjayp.divine@gmail.com', NULL, 'sanjayp.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, '2021-05-07 14:40:35', '2021-05-07 09:10:35'),
(3, 1, 'Ms.', 'Prexa', 'S', 'Shah', 'preksha.divine@gmail.com', NULL, 'preksha.divine@gmail.com', '$2y$10$C.DBkJxKGx9d3gd8MG6CNOyHwqQ6siFRJLN4Rad.B/YKor5t5gKgC', NULL, 'B+', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 1, '2019-20', NULL, 1, 0, NULL, '2021-05-07 14:40:35', '2021-07-20 11:29:45'),
(4, 1, NULL, 'Manoj', 'D', 'Patel', 'manojp.divine@gmail.com', NULL, 'manojp.divine@gmail.com', '$2y$10$e6tbMQLOpGtM2pG4fdKAge6GMFCXpCugsNeUq9C8n.5W9h7fyN60W', NULL, 'B+ve', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur1111', 1, 'MSP', 1, 1, 1, 0, 1, 'Indian', 'Hindu', NULL, 1, 100, 0, NULL, 1, '2019-20', NULL, 1, 0, '2021-05-20 10:45:29', '2021-05-20 10:44:45', '2021-05-20 09:45:29'),
(5, 1, 'Mr.', 'Manoj', 'S', 'Patel', 'manojp.divine@yopmail.com', NULL, 'manojp.divine@yopmail.com', '$2y$10$kwX1OommbpMTePmSbCobSurGal2Lhn4z9I5zVQ/jm5QxRa6K7ElPq', NULL, 'B+ve', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 0, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-06-16 10:45:46', '2021-06-18 05:39:30'),
(74, 1, 'Mr.', 'Darshan', 'Pareshbhai', 'Vachhani', NULL, NULL, NULL, '', NULL, 'B+', 'M', '1994-07-01', 'Married', NULL, 'M03505', '1234567890', '7895642315', 'Testing', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Hindu', 1, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-05 11:32:15', '2021-07-05 10:32:15'),
(80, 1, 'Er.', 'Jiten', 'Mahendra', 'Shah', NULL, NULL, NULL, '', NULL, 'O-', 'M', '1990-07-02', 'Single', NULL, 'M05000', '01234567890', '09904545279', 'Testing', 1, NULL, 0, 0, 0, 0, 0, 'Indian', 'Hindu', 'Jain', 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-06 12:56:37', '2021-07-06 11:56:37'),
(81, 1, 'Dr.', 'Shridhar', 'Mohan', 'Acharya', NULL, NULL, NULL, '', NULL, 'B+', 'M', '1990-07-01', 'Married', NULL, 'M012RT5', '09904545000', '1333567890', 'Testing Of Form', 0, NULL, 1, 1, 1, 1, 0, 'Indiana', 'Hindu', 'Brahmin', 0, 0, 1, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 10:43:21', '2021-07-19 09:43:21'),
(82, 1, 'Mr.', 'Mayank', 'Ajit', 'Shah', 'mayank@gmail.com', NULL, 'mayank@gmail.com', '$2y$10$Yh1QDK2eGMmxR8jkeKDfY.S1VjKhZCpwQthJBQMrA9AXz88KoNMdS', NULL, 'None', 'M', NULL, 'Single', NULL, NULL, '1234567890', '6549872315', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 11:07:39', '2021-07-19 10:07:39'),
(84, 1, 'Miss', 'Roohi', 'Raj', 'Sachdeva', 'roohi@gmail.com', NULL, 'roohi@gmail.com', '$2y$10$yhCJ2dYPrZQXcMnwVIN8/Oap941BOymYIvpU3LtskA/1SA2sliAze', NULL, 'O+', 'F', '1990-07-02', 'Single', NULL, NULL, '7895642315', '7895640000', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 11:15:56', '2021-07-19 10:15:56'),
(85, 1, 'Mr.', 'Arnav', 'Mahendra', 'Shah', 'arnav@gmail.com', NULL, 'arnav@gmail.com', '$2y$10$NV46ASPh0Znt0yChq9fqu.v5JTsciVzziLLR4BzroFgwGLUuw4R1m', NULL, 'None', 'M', '1993-07-08', 'Single', NULL, 'M035', '6549872315', '7895642315', 'Test.....', 1, NULL, 0, 0, 0, 0, 0, 'Indian', 'Hindu', 'Hindu', 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 11:19:29', '2021-07-19 10:19:29'),
(86, 1, 'Mr.', 'Siay', 'S', 'Shah', 'manojp123@yopmail.com', NULL, 'manojp123@yopmail.com', '$2y$10$dTZmNtx2Xk3IIRmGXtjAPuYr1eYQ5r3EhPAb3dz1GxQ5TZfKekIxG', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 1, '2019-20', NULL, 1, 0, NULL, '2021-07-20 12:28:54', '2021-07-20 11:28:54'),
(87, 1, 'Mr.', 'Ohbubble', 'Ajit', 'nz', 'test@gmail.com', NULL, 'test@gmail.com', '$2y$10$tTbmCAOTTyHM6827H.FzO.Z4zoPYhSd16himHwjgQKSjUAUb.1Y9m', NULL, 'B+', 'M', '2021-09-03', 'Single', NULL, NULL, '1234567890', '1234567890', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-09-01 06:56:13', '2021-09-01 05:56:13'),
(88, 1, 'Mr.', 'dfhfghfghfgf', 'hfghfgh', 'hgfhfghf', 'preksha111.divine@gmail.com', NULL, 'preksha111.divine@gmail.com', '$2y$10$JXU/CCNuAyGpIx/evC1xjO2Pdm1GcdKG059NkDhhedaHMKFekHyPe', NULL, 'None', 'M', '2021-09-02', 'Single', NULL, NULL, '11122333', '55555533556', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-09-01 06:58:58', '2021-09-01 05:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_address_details`
--

CREATE TABLE `user_address_details` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `mst_countries_id` int(11) DEFAULT 0 COMMENT 'foreign key of countries table',
  `mst_states_id` int(11) DEFAULT 0 COMMENT 'foreign key of states table',
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(155) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_number` varchar(155) DEFAULT NULL,
  `website` text DEFAULT NULL,
  `address_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 : Permanent Address , 2: Correspondence Address',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

--
-- Dumping data for table `user_address_details`
--

INSERT INTO `user_address_details` (`id`, `users_id`, `mst_countries_id`, `mst_states_id`, `street1`, `street2`, `area`, `city`, `pincode`, `email`, `emergency_contact_name`, `emergency_contact_number`, `website`, `address_type`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 102, 7, 'Street 1 Test', 'Street 2 Test', 'Sudama Nagar', 'Indore', '123456', NULL, NULL, '454545554545', NULL, 1, 1, 1, NULL, '2021-06-16 10:47:22', '2021-06-16 10:47:59'),
(2, 4, 102, 7, 'Cor Street 1', 'Cor Street 2', 'Gumasta nagar', 'Indore', '452001', 'email@yopmail.com', NULL, '454545554545', 'test.com', 2, 1, 1, NULL, '2021-06-16 10:47:22', '2021-06-16 10:47:59'),
(3, 5, 102, 7, 'Street 1 Test', 'Street 2 Test', 'Sudama Nagar', 'Indore', '123456', NULL, NULL, '454545554545', NULL, 1, 1, 3, NULL, '2021-06-16 10:48:05', '2021-06-18 06:39:30'),
(4, 5, 102, 7, 'Cor Street 1', 'Cor Street 2', 'Gumasta nagar', 'Indore', '452001', 'email@yopmail.com', NULL, '454545554545', 'test.com', 2, 1, 3, NULL, '2021-06-16 10:48:05', '2021-06-18 06:39:30'),
(92, 74, 102, 12, 'Paldi', 'Ahmedabad', 'ttest', 'Ahmedabad', '380012', 'arnav@gmail.com', 'Vishal Kotak', '', '', 1, 3, NULL, NULL, '2021-07-05 11:32:15', '2021-07-05 11:32:15'),
(93, 74, 102, 12, '509, 5th Floor, Signature-1, Above Parsoli Motors, Prahladnagar, S G Highway', 'Ground Floor, 80 kent terrace Mt Victoria,', 'Mt Victoria', 'Wellington', '380051', '', '', '09904545279', 'divineinfosys.com', 2, 3, NULL, NULL, '2021-07-05 11:32:15', '2021-07-05 11:32:15'),
(104, 80, 102, 12, '509, 5th Floor, Signature-1, Above Parsoli Motors, Prahladnagar, S G Highway', 'Shahpur', 'ttest', 'Ahmedabad', '380051', 'ashit@gmail.com', 'Ashutosh Mehta', '', '', 1, 3, NULL, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37'),
(105, 80, 102, 12, 'Ground Floor, 80 kent terrace Mt Victoria,', 'Ground Floor, 80 kent terrace Mt Victoria,', 'Mt Victoria', 'Wellington', '6011', '', '', '01234567890', 'divineinfosys123.com', 2, 3, NULL, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37'),
(106, 81, 102, 12, '509, 5th Floor, Signature-1, Parsoli Motors, Prahladnagar, S G Highway', 'test', 'Langley', 'test', '380051', 'test@gmail.com', 'Ashutosh Mehta123', '', '', 1, 3, NULL, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(107, 81, 102, 12, 'Satellite', 'Paldi', 'Mt Victoria123', 'Ahmedabad', '380015', '', '', '7895642300', 'divineinfosys123.com', 2, 3, NULL, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(108, 82, 0, 0, '', '', '', '', '', '', 'Mayank Shah', '', '', 1, 3, NULL, NULL, '2021-07-19 11:07:39', '2021-07-19 11:07:39'),
(109, 82, 0, 0, '', '', '', '', '', '', '', '', '', 2, 3, NULL, NULL, '2021-07-19 11:07:39', '2021-07-19 11:07:39'),
(110, 83, 0, 0, 'Satellite', '', '', '', '380015', '', '', '', '', 1, 3, NULL, NULL, '2021-07-19 11:14:32', '2021-07-19 11:14:32'),
(111, 83, 0, 0, '', '', '', '', '', '', '', '', '', 2, 3, NULL, NULL, '2021-07-19 11:14:32', '2021-07-19 11:14:32'),
(112, 84, 0, 0, 'Satellite', '', '', '', '380015', '', '', '', '', 1, 3, NULL, NULL, '2021-07-19 11:15:56', '2021-07-19 11:15:56'),
(113, 84, 0, 0, '', '', '', '', '', '', '', '', '', 2, 3, NULL, NULL, '2021-07-19 11:15:56', '2021-07-19 11:15:56'),
(114, 85, 102, 0, 'Ahmedabad', 'Satellite', 'Langley', 'Ahmedabad', '123456', 'test1234@gmail.com', 'Arnav Shah', '', '', 1, 3, NULL, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29'),
(115, 85, 102, 12, '509, 5th Floor, Signature-1, Above Parsoli Motors, Prahladnagar, S G Highway', 'test', 'Mt Victoria', 'test', '380051', '', '', '09904545279', 'https://koinonia.social/userpage', 2, 3, NULL, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29'),
(116, 3, 102, 7, 'Street 1 Test', 'Street 2 Test', 'Sudama Nagar', 'Indore', '123456', '', 'test', '454545554545', '', 1, 3, 1, NULL, '2021-07-20 12:03:19', '2021-07-20 12:29:45'),
(117, 3, 102, 7, 'Cor Street 1', 'Cor Street 2', 'Gumasta nagar', 'Indore', '452001', 'email@yopmail.com', '', '454545554545', 'test.com', 2, 3, 1, NULL, '2021-07-20 12:03:19', '2021-07-20 12:29:45'),
(118, 86, 102, 12, 'Street 1 Test', 'Street 2 Test', 'Sudama Nagar', 'Indore', '123456', '', 'test', '454545554545', '', 1, 1, NULL, NULL, '2021-07-20 12:28:54', '2021-07-28 10:24:38'),
(119, 86, 102, 12, 'Street 1 Test', 'Street 2 Test', 'Sudama Nagar', 'Indore', '123456', '', '', '454545554545', '', 2, 1, NULL, NULL, '2021-07-20 12:28:54', '2021-07-28 10:24:41'),
(120, 87, 0, 0, 'Paldi', '', '', '', '380012', '', 'Ohbubble nz', '', '', 1, 3, NULL, NULL, '2021-09-01 06:56:13', '2021-09-01 06:56:13'),
(121, 87, 0, 0, '', '', '', '', '', '', '', '', '', 2, 3, NULL, NULL, '2021-09-01 06:56:13', '2021-09-01 06:56:13'),
(122, 88, 0, 0, '', '', '', '', '', '', '', '', '', 1, 3, NULL, NULL, '2021-09-01 06:58:58', '2021-09-01 06:58:58'),
(123, 88, 0, 0, '', '', '', '', '', '', '', '', '', 2, 3, NULL, NULL, '2021-09-01 06:58:58', '2021-09-01 06:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_assign_rights`
--

CREATE TABLE `user_assign_rights` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `software` varchar(55) DEFAULT NULL,
  `modules` varchar(155) DEFAULT NULL,
  `add_module` tinyint(1) NOT NULL DEFAULT 0,
  `edit_module` tinyint(1) NOT NULL DEFAULT 0,
  `delete_module` tinyint(1) NOT NULL DEFAULT 0,
  `view_module` tinyint(1) NOT NULL DEFAULT 0,
  `email_module` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

-- --------------------------------------------------------

--
-- Table structure for table `user_company_info`
--

CREATE TABLE `user_company_info` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `reporting_authority_id` int(11) DEFAULT NULL COMMENT 'Employee ID which is already exist in user table',
  `mst_departments_id` int(11) DEFAULT NULL COMMENT 'foreign key of Master - Department id',
  `mst_positions_id` int(11) DEFAULT NULL COMMENT 'foreign key of Master - Position id',
  `join_date` date DEFAULT NULL,
  `resign_date` date DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_branch_name` varchar(255) DEFAULT NULL,
  `salary_per_month` varchar(155) DEFAULT NULL,
  `bank_acc_number` varchar(155) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

--
-- Dumping data for table `user_company_info`
--

INSERT INTO `user_company_info` (`id`, `mst_companies_id`, `users_id`, `reporting_authority_id`, `mst_departments_id`, `mst_positions_id`, `join_date`, `resign_date`, `bank_name`, `bank_branch_name`, `salary_per_month`, `bank_acc_number`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 4, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, 1, NULL, '2021-06-16 10:37:22', '2021-06-16 10:47:59'),
(2, NULL, 5, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, 3, NULL, '2021-06-16 10:45:46', '2021-06-18 06:39:30'),
(3, NULL, 6, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-18 06:37:10', '2021-06-18 06:37:10'),
(4, 1, 3, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, 1, NULL, '2021-06-21 05:52:49', '2021-07-20 12:29:45'),
(5, NULL, 28, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-22 07:33:08', '2021-06-22 07:33:08'),
(6, NULL, 38, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-22 09:11:34', '2021-06-22 09:11:34'),
(7, NULL, 40, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-22 09:13:07', '2021-06-22 09:13:07'),
(8, NULL, 47, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 3, NULL, NULL, '2021-07-02 10:13:01', '2021-07-02 10:13:01'),
(9, 4, 81, 5, 5, 4, '2018-07-19', '2021-07-19', 'ICICI Bank', 'Thaltej', '25000', '12345678958', 1, 3, NULL, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(10, 2, 85, 3, 3, 8, '2018-07-07', '2021-07-19', 'Kalupur Bank', 'Paldi', '27000', '12345678000', 1, 3, NULL, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29'),
(11, 1, 86, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-07-20 12:28:54', '2021-07-20 12:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_doc_details`
--

CREATE TABLE `user_doc_details` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `aadhar_card_photo` text DEFAULT NULL,
  `aadhar_number` varchar(155) DEFAULT NULL,
  `election_card_photo` text DEFAULT NULL,
  `election_card_number` varchar(155) DEFAULT NULL,
  `pan_card_photo` text DEFAULT NULL,
  `pan_card_number` varchar(155) DEFAULT NULL,
  `passport_photo` text DEFAULT NULL,
  `passport_number` varchar(155) DEFAULT NULL,
  `driving_license_photo` text DEFAULT NULL,
  `driving_license_number` varchar(155) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

-- --------------------------------------------------------

--
-- Table structure for table `user_edu_details`
--

CREATE TABLE `user_edu_details` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `from_year` int(5) DEFAULT NULL,
  `to_year` int(5) DEFAULT NULL,
  `percentage_grade` varchar(5) DEFAULT NULL,
  `specialization` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

--
-- Dumping data for table `user_edu_details`
--

INSERT INTO `user_edu_details` (`id`, `users_id`, `degree`, `university`, `from_year`, `to_year`, `percentage_grade`, `specialization`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 4, 'B Tech', 'Ganpat University', 2008, 2012, '81.20', 'Information Technology', 1, 1, NULL, '2021-06-16 10:47:59', '2021-06-16 10:47:59'),
(4, 4, '10th', 'Gujrat Board', 1992, 1993, '78.50', 'Science', 1, 1, NULL, '2021-06-16 10:47:59', '2021-06-16 10:47:59'),
(9, 5, 'B Tech', 'Ganpat University', 2008, 2012, '81.20', 'Information Technology', 1, 3, NULL, '2021-06-18 06:39:30', '2021-06-18 06:39:30'),
(10, 5, '10th', 'Gujrat Board', 1992, 1993, '78.50', 'Science', 1, 3, NULL, '2021-06-18 06:39:30', '2021-06-18 06:39:30'),
(30, 74, 'BCA', 'GU', 2012, 2015, '80', 'Garduation', 1, 3, NULL, '2021-07-05 11:32:16', '2021-07-05 11:32:16'),
(31, 74, 'MCA', 'GTU', 2015, 2017, '85', 'Post Graduation', 1, 3, NULL, '2021-07-05 11:32:16', '2021-07-05 11:32:16'),
(40, 80, 'BCA-a', 'Gujarat University', 2012, 2015, '80', 'Graduation', 1, 3, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37'),
(41, 80, 'BBA-b', 'Gujarat Tech University', 2012, 2015, '60', 'POST Graduation', 1, 3, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37'),
(42, 81, 'BA', 'Gujarat Uni', 2005, 2008, '60', 'Business Admininstarion', 1, 3, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(43, 81, 'MA', 'Gujarat University', 2008, 2010, '65', 'Masters in BA', 1, 3, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(44, 85, 'BBA', 'Gujarat University', 2012, 2015, '60', 'Graduation', 1, 3, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29'),
(51, 86, 'B Tech', 'Ganpat University', 2008, 2012, '', 'Information Technology', 1, 1, NULL, '2021-07-20 12:28:54', '2021-07-20 12:28:54'),
(52, 86, '10th', 'Gujrat Board', 1992, 1993, '', 'Science', 1, 1, NULL, '2021-07-20 12:28:54', '2021-07-20 12:28:54'),
(55, 3, 'B Tech', 'Ganpat University', 2008, 2012, '81.20', 'Information Technology', 1, 1, NULL, '2021-07-20 12:29:45', '2021-07-20 12:29:45'),
(56, 3, '10th', 'Gujrat Board', 1992, 1993, '78.50', 'Science', 1, 1, NULL, '2021-07-20 12:29:45', '2021-07-20 12:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_emp_details`
--

CREATE TABLE `user_emp_details` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `organisation` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `emp_from_year` int(5) NOT NULL,
  `emp_to_year` int(5) NOT NULL,
  `annual_ctc` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

--
-- Dumping data for table `user_emp_details`
--

INSERT INTO `user_emp_details` (`id`, `users_id`, `organisation`, `designation`, `emp_from_year`, `emp_to_year`, `annual_ctc`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(19, 4, 'Limca Ltd', 'Software Developer', 2019, 2020, '5.5Lac', 1, 1, NULL, NULL, '2021-06-16 10:47:59', '2021-06-16 10:47:59'),
(20, 4, 'Bestech Solutions', 'Team Leader', 2021, 2021, '6.6 Lac', 1, 1, NULL, NULL, '2021-06-16 10:47:59', '2021-06-16 10:47:59'),
(25, 5, 'Limca Ltd', 'Software Developer', 2019, 2020, '5.5Lac', 1, 3, NULL, NULL, '2021-06-18 06:39:30', '2021-06-18 06:39:30'),
(26, 5, 'Bestech Solutions', 'Team Leader', 2021, 2021, '6.6 Lac', 1, 3, NULL, NULL, '2021-06-18 06:39:30', '2021-06-18 06:39:30'),
(39, 80, 'Divine Infosys', 'Assistant Manager', 2016, 2018, '500000', 1, 3, NULL, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37'),
(40, 80, 'Div System', 'Manager', 2018, 2020, '800000', 1, 3, NULL, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37'),
(41, 81, 'Divine Infosys', 'Assistant Manager', 2016, 2018, '500000', 1, 3, NULL, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(42, 81, 'Whole Body Health', 'Manager', 2018, 2020, '600000', 1, 3, NULL, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(43, 85, 'westlineshipping', 'Manager Assistant', 2016, 2018, '450000', 1, 3, NULL, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_banks`
--
ALTER TABLE `mst_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_branches`
--
ALTER TABLE `mst_branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_categories`
--
ALTER TABLE `mst_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_companies`
--
ALTER TABLE `mst_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_countries`
--
ALTER TABLE `mst_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_customers`
--
ALTER TABLE `mst_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_customers_contact_info`
--
ALTER TABLE `mst_customers_contact_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_customers_contact_person`
--
ALTER TABLE `mst_customers_contact_person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_departments`
--
ALTER TABLE `mst_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_groups`
--
ALTER TABLE `mst_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_ledgers`
--
ALTER TABLE `mst_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_locations`
--
ALTER TABLE `mst_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_machines`
--
ALTER TABLE `mst_machines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_materials`
--
ALTER TABLE `mst_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_pharmacopeia`
--
ALTER TABLE `mst_pharmacopeia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_positions`
--
ALTER TABLE `mst_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_states`
--
ALTER TABLE `mst_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_units`
--
ALTER TABLE `mst_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_address_details`
--
ALTER TABLE `user_address_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_assign_rights`
--
ALTER TABLE `user_assign_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_company_info`
--
ALTER TABLE `user_company_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_doc_details`
--
ALTER TABLE `user_doc_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_edu_details`
--
ALTER TABLE `user_edu_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_emp_details`
--
ALTER TABLE `user_emp_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_banks`
--
ALTER TABLE `mst_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_branches`
--
ALTER TABLE `mst_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mst_categories`
--
ALTER TABLE `mst_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mst_companies`
--
ALTER TABLE `mst_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `mst_countries`
--
ALTER TABLE `mst_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `mst_customers`
--
ALTER TABLE `mst_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_customers_contact_info`
--
ALTER TABLE `mst_customers_contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mst_customers_contact_person`
--
ALTER TABLE `mst_customers_contact_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_departments`
--
ALTER TABLE `mst_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mst_groups`
--
ALTER TABLE `mst_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `mst_ledgers`
--
ALTER TABLE `mst_ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mst_locations`
--
ALTER TABLE `mst_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mst_machines`
--
ALTER TABLE `mst_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_materials`
--
ALTER TABLE `mst_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mst_pharmacopeia`
--
ALTER TABLE `mst_pharmacopeia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mst_positions`
--
ALTER TABLE `mst_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mst_states`
--
ALTER TABLE `mst_states`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `mst_units`
--
ALTER TABLE `mst_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user_address_details`
--
ALTER TABLE `user_address_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `user_assign_rights`
--
ALTER TABLE `user_assign_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_company_info`
--
ALTER TABLE `user_company_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_doc_details`
--
ALTER TABLE `user_doc_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_edu_details`
--
ALTER TABLE `user_edu_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user_emp_details`
--
ALTER TABLE `user_emp_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
