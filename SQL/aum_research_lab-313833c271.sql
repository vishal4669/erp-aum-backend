-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: sdb-e.hosting.stackcp.net
-- Generation Time: Jan 04, 2022 at 02:01 PM
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
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `booking_type` varchar(55) NOT NULL,
  `invoice_no` varchar(55) DEFAULT NULL,
  `report_type` varchar(55) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `receipte_date` date DEFAULT NULL,
  `booking_no` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `mfg_date` date DEFAULT NULL,
  `mfg_options` char(7) NOT NULL,
  `exp_date` date DEFAULT NULL,
  `exp_options` char(7) NOT NULL,
  `analysis_date` date DEFAULT NULL,
  `aum_serial_no` int(55) NOT NULL,
  `d_format` varchar(255) NOT NULL,
  `d_format_options` char(7) NOT NULL,
  `grade` varchar(55) NOT NULL,
  `grade_options` char(7) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_options` char(7) NOT NULL,
  `mfg_lic_no` varchar(155) NOT NULL,
  `is_report_dispacthed` tinyint(1) NOT NULL,
  `dispatch_date_time` varchar(100) DEFAULT NULL,
  `dispatch_mode` varchar(155) DEFAULT NULL,
  `dispatch_details` varchar(255) DEFAULT NULL,
  `signature` tinyint(1) NOT NULL,
  `verified_by` varchar(10) NOT NULL,
  `nabl_scope` tinyint(1) NOT NULL,
  `cancel` varchar(7) NOT NULL,
  `cancel_remarks` text NOT NULL,
  `priority` varchar(10) NOT NULL,
  `discipline` varchar(20) NOT NULL,
  `booking_group` varchar(55) NOT NULL,
  `statement_ofconformity` varchar(20) NOT NULL,
  `coa_print` varchar(255) DEFAULT NULL COMMENT 'COA & NABL & Ayush Print Max 3 types of Print',
  `roa_print` varchar(255) DEFAULT NULL,
  `coa_print_count` tinyint(4) DEFAULT 0,
  `roa_print_count` tinyint(4) DEFAULT 0 COMMENT 'Max 1 Print Of ROA',
  `coa_release_date` date DEFAULT NULL,
  `block` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `copied_from_company` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `mst_companies_id`, `booking_type`, `invoice_no`, `report_type`, `invoice_date`, `receipte_date`, `booking_no`, `customer_id`, `reference_no`, `remarks`, `manufacturer_id`, `supplier_id`, `mfg_date`, `mfg_options`, `exp_date`, `exp_options`, `analysis_date`, `aum_serial_no`, `d_format`, `d_format_options`, `grade`, `grade_options`, `project_name`, `project_options`, `mfg_lic_no`, `is_report_dispacthed`, `dispatch_date_time`, `dispatch_mode`, `dispatch_details`, `signature`, `verified_by`, `nabl_scope`, `cancel`, `cancel_remarks`, `priority`, `discipline`, `booking_group`, `statement_ofconformity`, `coa_print`, `roa_print`, `coa_print_count`, `roa_print_count`, `coa_release_date`, `block`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `copied_from_company`, `is_active`, `deleted_at`) VALUES
(1, 4, 'Entry', NULL, 'FP', '2021-12-16', '2021-12-02', 'ARL/COA/FP/211202/001', 1, 'Reliance Formulations', '', 2, 3, '2021-12-02', 'N/S', '2021-12-03', 'N/S', '2021-12-01', 1, '', 'N/S', '', 'N/S', '', 'N/S', '45/7894', 0, 'Invalid date', NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, 'ROA_PRINT_1', 0, 1, NULL, NULL, 3, 3, '2021-12-15 11:12:12', '2021-12-16 15:04:09', '2019-20', NULL, NULL, 1, NULL),
(2, 4, 'Entry', NULL, 'TP', '2021-12-16', '2021-12-25', 'ARL/COA/TP/211225/001', 1, '', '', 5, 6, '2021-12-16', 'N/S', '2021-12-31', 'N/S', '2021-12-16', 2, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, 'Invalid date', NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 0, 0, NULL, NULL, 3, 3, '2021-12-16 14:29:26', '2021-12-16 15:02:14', '2019-20', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_audit_details`
--

CREATE TABLE `booking_audit_details` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `audit_remarks` text NOT NULL,
  `reason` text NOT NULL,
  `comments` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_audit_details`
--

INSERT INTO `booking_audit_details` (`id`, `booking_id`, `audit_remarks`, `reason`, `comments`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, '', '', '', 3, NULL, '2021-12-15 19:18:45', NULL, '2019-20', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_sample_details`
--

CREATE TABLE `booking_sample_details` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `packsize` varchar(55) NOT NULL,
  `request_quantity` varchar(100) NOT NULL,
  `sample_code` varchar(100) NOT NULL,
  `sample_description` text NOT NULL,
  `sample_quantity` varchar(100) NOT NULL,
  `sample_location` varchar(150) NOT NULL,
  `sample_packaging` varchar(255) NOT NULL,
  `sample_type` varchar(60) NOT NULL,
  `sampling_date_from` date DEFAULT NULL,
  `sampling_date_from_options` char(7) NOT NULL,
  `sampling_date_to` date DEFAULT NULL,
  `sampling_date_to_options` char(7) NOT NULL,
  `sample_received_through` varchar(25) NOT NULL,
  `chemist` tinyint(1) NOT NULL,
  `sample_condition` text NOT NULL,
  `is_sample_condition` tinyint(1) NOT NULL,
  `batch_size_qty_rec` varchar(100) NOT NULL,
  `notes` text NOT NULL,
  `sample_drawn_by` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_sample_details`
--

INSERT INTO `booking_sample_details` (`id`, `booking_id`, `product_id`, `batch_no`, `packsize`, `request_quantity`, `sample_code`, `sample_description`, `sample_quantity`, `sample_location`, `sample_packaging`, `sample_type`, `sampling_date_from`, `sampling_date_from_options`, `sampling_date_to`, `sampling_date_to_options`, `sample_received_through`, `chemist`, `sample_condition`, `is_sample_condition`, `batch_size_qty_rec`, `notes`, `sample_drawn_by`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 1, '1248', '', '', '', 'White powder', '10', '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, '', '', '', 3, 3, '2021-12-15 11:12:12', '2021-12-16 18:41:27', '2019-20', NULL, 1, NULL),
(2, 2, 1, '', '', '', '', '', '', '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, '', '', '', 3, 3, '2021-12-16 14:29:26', '2021-12-16 15:02:13', '2019-20', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_tests`
--

CREATE TABLE `booking_tests` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `parent_child` char(10) NOT NULL,
  `p_sr_no` varchar(10) NOT NULL,
  `by_pass` tinyint(1) NOT NULL,
  `parent` int(11) NOT NULL,
  `product_details` text NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `label_claim` varchar(155) NOT NULL,
  `min_limit` text NOT NULL,
  `max_limit` text NOT NULL,
  `result` text DEFAULT NULL,
  `label_claim_result` varchar(255) DEFAULT NULL,
  `label_claim_unit` varchar(60) DEFAULT NULL,
  `mean` varchar(150) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `test_date_time` varchar(255) DEFAULT NULL,
  `assigned_date` datetime DEFAULT NULL COMMENT 'when tests is assigned',
  `approval_date_time` varchar(255) DEFAULT NULL,
  `approved` varchar(20) DEFAULT 'Pending',
  `chemist_name` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_tests`
--

INSERT INTO `booking_tests` (`id`, `booking_id`, `parent_child`, `p_sr_no`, `by_pass`, `parent`, `product_details`, `test_name`, `label_claim`, `min_limit`, `max_limit`, `result`, `label_claim_result`, `label_claim_unit`, `mean`, `unit`, `amount`, `method`, `test_date_time`, `assigned_date`, `approval_date_time`, `approved`, `chemist_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(25, 2, 'Parent', '1', 2, 0, 'White to almost white tablet medicine', 'Description', '500 mg', 'NLT 90.0 %to', 'NMT 110.0 %', '', '', 'mg', '', NULL, '0.00', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-12-16 15:02:14', '2021-12-16 15:02:14', '2019-20', NULL, 1, NULL),
(26, 2, 'Parent', '2', 2, 0, 'test', '', '10.0 mg', 'NLT 90.0 %to', 'NMT 110.0 %', '', '', '', '', NULL, '0.00', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-12-16 15:02:14', '2021-12-16 15:02:14', '2019-20', NULL, 1, NULL),
(27, 2, 'Parent', '3', 2, 0, '', '', '', '', '', '', '', '', '', NULL, '0.00', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-12-16 15:02:14', '2021-12-16 15:02:14', '2019-20', NULL, 1, NULL),
(46, 1, 'Parent', '1', 2, 0, 'White to almost white tablet', 'Description', '500 mg', 'NLT 90.0 %to', 'NMT 110.0 %', '50.20', '251', 'mg', '25.1', 1, '0.00', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-12-16 18:41:27', '2021-12-16 18:41:27', '2019-20', NULL, 1, NULL),
(47, 1, 'Parent', '2', 2, 0, 'test', '', '10.0 mg', 'NLT 90.0 %to', 'NMT 110.0 %', '', '', 'mg', '', NULL, '0.00', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-12-16 18:41:27', '2021-12-16 18:41:27', '2019-20', NULL, 1, NULL),
(48, 1, 'Parent', '3', 2, 0, '', '', '200 mg', '', '', '', '', 'mg', '', NULL, '0.00', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-12-16 18:41:27', '2021-12-16 18:41:27', '2019-20', NULL, 1, NULL);

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
-- Table structure for table `formulas`
--

CREATE TABLE `formulas` (
  `id` int(11) NOT NULL COMMENT 'Primary Key, Auto Increment',
  `mst_companies_id` int(11) NOT NULL COMMENT 'Foreign key - Company Master',
  `formula_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `formula_type` varchar(155) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'created user id\r\n',
  `updated_by` int(11) DEFAULT NULL COMMENT 'updated user id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1 COMMENT 'default 1',
  `deleted_at` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formulas`
--

INSERT INTO `formulas` (`id`, `mst_companies_id`, `formula_name`, `formula_type`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 4, '[AAI×Φ]÷[Φ- W]=100± [EAAI+EW]', 'Assay', 1, NULL, '2021-12-28 15:57:26', NULL, '2019-20', NULL, 1, NULL),
(2, 4, '(CI)=(t×SD)÷ (n)1/2', 'Assay Chemical', 1, 1, '2021-12-28 15:58:06', '2021-12-28 16:26:40', '2019-20', NULL, 1, NULL);

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
(1, 4, 'Ahmedabad Branch', 'Lab', '9192', '25', 'Aum Research', NULL, NULL, NULL, 'Ahemedabad', 'Gujarat', 'India', 380015, '1234567890', NULL, '1234567890', 'aumresearch@gmail.com', '2000', 3, NULL, '2019-20', NULL, 1, NULL, '2021-12-21 12:08:47', '2021-12-21 12:08:47');

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
(1, 'Aum Research Laboratries', 1, 2, '2017-18', NULL, 1, '2021-12-02 12:40:35', '2021-05-18 06:47:45', '2021-12-21 06:27:29'),
(4, 'Aum Research Labs Pvt Ltd', 3, 2, '2019-20', NULL, 1, NULL, '2021-05-18 06:10:45', '2021-10-28 10:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `mst_countries`
--

CREATE TABLE `mst_countries` (
  `id` varchar(3) DEFAULT NULL,
  `phone_code` varchar(10) DEFAULT NULL,
  `country_name` varchar(29) DEFAULT NULL,
  `iso` varchar(3) DEFAULT NULL,
  `is_active` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mst_countries`
--

INSERT INTO `mst_countries` (`id`, `phone_code`, `country_name`, `iso`, `is_active`) VALUES
('id', 'phone_code', 'name', 'iso', 0),
('1', '+93', 'Afghanistan', 'AF', 1),
('2', '+355', 'Albania', 'AL', 1),
('3', '+213', 'Algeria', 'DZ', 1),
('4', '+1684', 'American Samoa', 'AS', 0),
('5', '+376', 'Andorra', 'AD', 1),
('6', '+244', 'Angola', 'AO', 1),
('7', '+1264', 'Anguilla', 'AI', 0),
('8', '+1268', 'Antigua and Barbuda', 'AG', 1),
('9', '+54', 'Argentina', 'AR', 1),
('10', '+374', 'Armenia', 'AM', 1),
('11', '+61', 'Australia', 'AU', 1),
('12', '+43', 'Austria', 'AT', 1),
('13', '+994', 'Azerbaijan', 'AZ', 1),
('14', '+1242', 'Bahamas', 'BS', 1),
('15', '+973', 'Bahrain', 'BH', 1),
('16', '+880', 'Bangladesh', 'BD', 1),
('17', '+1246', 'Barbados', 'BB', 1),
('18', '+375', 'Belarus', 'BY', 1),
('19', '+32', 'Belgium', 'BE', 1),
('20', '+501', 'Belize', 'BZ', 1),
('21', '+1441', 'Bermuda', 'BM', 1),
('22', '+975', 'Bhutan', 'BT', 1),
('23', '+591', 'Bolivia', 'BO', 1),
('24', '+387', 'Bosnia and Herzegovina', 'BA', 1),
('25', '+267', 'Botswana', 'BW', 1),
('26', '+55', 'Brazil', 'BR', 1),
('27', '+673', 'Brunei Darussalam', 'BN', 1),
('28', '+359', 'Bulgaria', 'BG', 1),
('29', '+226', 'Burkina Faso', 'BF', 1),
('30', '+257', 'Burundi', 'BI', 1),
('31', '+855', 'Cambodia', 'KH', 1),
('32', '+237', 'Cameroon', 'CM', 1),
('33', '+1', 'Canada', 'CA', 1),
('34', '+238', 'Cape Verde', 'CV', 1),
('35', '+1345', 'Cayman Islands', 'KY', 0),
('36', '+236', 'Central African Republic', 'CF', 1),
('37', '+235', 'Chad', 'TD', 1),
('38', '+56', 'Chile', 'CL', 1),
('39', '+86', 'China', 'CN', 1),
('40', '+57', 'Colombia', 'CO', 1),
('41', '+269', 'Comoros', 'KM', 1),
('42', '+242', 'Congo (DRC)', 'CD', 1),
('43', '+242', 'Congo', 'CG', 1),
('44', '+682', 'Cook Islands', 'CK', 0),
('45', '+506', 'Costa Rica', 'CR', 1),
('46', '+225', 'Cote D\'Ivoire', 'CI', 1),
('47', '+385', 'Croatia', 'HR', 1),
('48', '+53', 'Cuba', 'CU', 1),
('49', '+357', 'Cyprus', 'CY', 1),
('50', '+420', 'Czech Republic', 'CZ', 1),
('51', '+45', 'Denmark', 'DK', 1),
('52', '+253', 'Djibouti', 'DJ', 1),
('53', '+1767', 'Dominica', 'DM', 1),
('54', '+1809', 'Dominican Republic', 'DO', 1),
('55', '+670', 'East Timor', 'TL', 1),
('56', '+593', 'Ecuador', 'EC', 1),
('57', '+20', 'Egypt', 'EG', 1),
('58', '+503', 'El Salvador', 'SV', 1),
('59', '+240', 'Equatorial Guinea', 'GQ', 1),
('60', '+291', 'Eritrea', 'ER', 1),
('61', '+372', 'Estonia', 'EE', 1),
('62', '+251', 'Ethiopia', 'ET', 1),
('63', '+500', 'Falkland Islands (Malvinas)', 'FK', 0),
('64', '+298', 'Faroe Islands', 'FO', 0),
('65', '+679', 'Fiji', 'FJ', 1),
('66', '+358', 'Finland', 'FI', 1),
('67', '+33', 'France', 'FR', 1),
('68', '+241', 'Gabon', 'GA', 1),
('69', '+220', 'Gambia', 'GM', 1),
('70', '+995', 'Georgia', 'GE', 1),
('71', '+49', 'Germany', 'DE', 1),
('72', '+233', 'Ghana', 'GH', 1),
('73', '+350', 'Gibraltar', 'GI', 0),
('74', '+30', 'Greece', 'GR', 1),
('75', '+299', 'Greenland', 'GL', 1),
('76', '+1473', 'Grenada', 'GD', 1),
('77', '+590', 'Guadeloupe', 'GP', 0),
('78', '+1671', 'Guam', 'GU', 0),
('79', '+502', 'Guatemala', 'GT', 1),
('80', '+224', 'Guinea', 'GN', 1),
('81', '+245', 'Guinea-Bissau', 'GW', 1),
('82', '+592', 'Guyana', 'GY', 1),
('83', '+509', 'Haiti', 'HT', 1),
('84', '+39', 'Holy See (Vatican City State)', 'VA', 0),
('85', '+504', 'Honduras', 'HN', 1),
('86', '+852', 'Hong Kong', 'HK', 1),
('87', '+36', 'Hungary', 'HU', 1),
('88', '+354', 'Iceland', 'IS', 1),
('89', '+91', 'India', 'IN', 1),
('90', '+62', 'Indonesia', 'ID', 1),
('91', '+98', 'Iran', 'IR', 1),
('92', '+964', 'Iraq', 'IQ', 1),
('93', '+353', 'Ireland', 'IE', 1),
('94', '+972', 'Israel', 'IL', 1),
('95', '+39', 'Italy', 'IT', 1),
('96', '+1876', 'Jamaica', 'JM', 1),
('97', '+81', 'Japan', 'JP', 1),
('98', '+962', 'Jordan', 'JO', 1),
('99', '+7', 'Kazakhstan', 'KZ', 1),
('100', '+254', 'Kenya', 'KE', 1),
('101', '+686', 'Kiribati', 'KI', 1),
('102', '+850', 'North Korea', 'KP', 1),
('103', '+82', 'South Korea', 'KR', 1),
('104', '+965', 'Kuwait', 'KW', 1),
('105', '+996', 'Kyrgyzstan', 'KG', 1),
('106', '+856', 'Laos', 'LA', 1),
('107', '+371', 'Latvia', 'LV', 1),
('108', '+961', 'Lebanon', 'LB', 1),
('109', '+266', 'Lesotho', 'LS', 1),
('110', '+231', 'Liberia', 'LR', 1),
('111', '+218', 'Libyan', 'LY', 1),
('112', '+423', 'Liechtenstein', 'LI', 1),
('113', '+370', 'Lithuania', 'LT', 1),
('114', '+352', 'Luxembourg', 'LU', 1),
('115', '+853', 'Macao', 'MO', 0),
('116', '+389', 'Macedonia', 'MK', 1),
('117', '+261', 'Madagascar', 'MG', 1),
('118', '+265', 'Malawi', 'MW', 1),
('119', '+60', 'Malaysia', 'MY', 1),
('120', '+960', 'Maldives', 'MV', 1),
('121', '+223', 'Mali', 'ML', 1),
('122', '+356', 'Malta', 'MT', 0),
('123', '+596', 'Martinique', 'MQ', 0),
('124', '+222', 'Mauritania', 'MR', 1),
('125', '+230', 'Mauritius', 'MU', 1),
('126', '+269', 'Mayotte', 'YT', 0),
('127', '+52', 'Mexico', 'MX', 1),
('128', '+691', 'Micronesia', 'FM', 1),
('129', '+373', 'Moldova', 'MD', 1),
('130', '+377', 'Monaco', 'MC', 0),
('131', '+976', 'Mongolia', 'MN', 1),
('132', '+1664', 'Montserrat', 'MS', 0),
('133', '+212', 'Morocco', 'MA', 1),
('134', '+258', 'Mozambique', 'MZ', 1),
('135', '+95', 'Myanmar', 'MM', 1),
('136', '+264', 'Namibia', 'NA', 1),
('137', '+674', 'Nauru', 'NR', 0),
('138', '+977', 'Nepal', 'NP', 1),
('139', '+31', 'Netherlands', 'NL', 1),
('140', '+599', 'Netherlands Antilles', 'AN', 1),
('141', '+687', 'New Caledonia', 'NC', 0),
('142', '+64', 'New Zealand', 'NZ', 1),
('143', '+505', 'Nicaragua', 'NI', 1),
('144', '+227', 'Niger', 'NE', 1),
('145', '+234', 'Nigeria', 'NG', 1),
('146', '+683', 'Niue', 'NU', 0),
('147', '+672', 'Norfolk Island', 'NF', 0),
('148', '+47', 'Norway', 'NO', 1),
('149', '+968', 'Oman', 'OM', 1),
('150', '+92', 'Pakistan', 'PK', 1),
('151', '+507', 'Panama', 'PA', 1),
('152', '+675', 'Papua New Guinea', 'PG', 1),
('153', '+595', 'Paraguay', 'PY', 1),
('154', '+51', 'Peru', 'PE', 1),
('155', '+63', 'Philippines', 'PH', 1),
('156', '+0', 'Pitcairn Islands', 'PN', 0),
('157', '+48', 'Poland', 'PL', 1),
('158', '+351', 'Portugal', 'PT', 1),
('159', '+1787', 'Puerto Rico', 'PR', 1),
('160', '+974', 'Qatar', 'QA', 1),
('161', '+262', 'Reunion', 'RE', 0),
('162', '+40', 'Romania', 'RO', 1),
('163', '+70', 'Russia', 'RU', 1),
('164', '+250', 'Rwanda', 'RW', 1),
('165', '+684', 'Samoa', 'WS', 1),
('166', '+378', 'San Marino', 'SM', 1),
('167', '+239', 'Sao Tome and Principe', 'ST', 1),
('168', '+966', 'Saudi Arabia', 'SA', 1),
('169', '+221', 'Senegal', 'SN', 1),
('170', '+381', 'Serbia and Montenegro', 'CS', 1),
('171', '+248', 'Seychelles', 'SC', 1),
('172', '+232', 'Sierra Leone', 'SL', 1),
('173', '+65', 'Singapore', 'SG', 1),
('174', '+421', 'Slovakia', 'SK', 1),
('175', '+386', 'Slovenia', 'SI', 1),
('176', '+677', 'Solomon Islands', 'SB', 1),
('177', '+252', 'Somalia', 'SO', 1),
('178', '+27', 'South Africa', 'ZA', 1),
('179', '+34', 'Spain', 'ES', 1),
('180', '+94', 'Sri Lanka', 'LK', 1),
('181', '+290', 'St. Helena', 'SH', 0),
('182', '+1869', 'St. Kitts & Nevis', 'KN', 0),
('183', '+1758', 'St. Lucia', 'LC', 0),
('184', '+508', 'St. Pierre and Miquelon', 'PM', 0),
('185', '+1784', 'St. Vincent & Grenadines', 'VC', 1),
('186', '+249', 'Sudan', 'SD', 1),
('187', '+597', 'Suriname', 'SR', 0),
('188', '+268', 'Swaziland', 'SZ', 1),
('189', '+46', 'Sweden', 'SE', 1),
('190', '+41', 'Switzerland', 'CH', 1),
('191', '+963', 'Syria', 'SY', 1),
('192', '+886', 'Taiwan', 'TW', 1),
('193', '+992', 'Tajikistan', 'TJ', 0),
('194', '+255', 'Tanzania', 'TZ', 1),
('195', '+66', 'Thailand', 'TH', 1),
('196', '+228', 'Togo', 'TG', 1),
('197', '+690', 'Tokelau', 'TK', 0),
('198', '+676', 'Tonga', 'TO', 1),
('199', '+1868', 'Trinidad and Tobago', 'TT', 1),
('200', '+216', 'Tunisia', 'TN', 1),
('201', '+90', 'Turkey', 'TR', 1),
('202', '+7370', 'Turkmenistan', 'TM', 1),
('203', '+1649', 'Turks and Caicos Islands', 'TC', 0),
('204', '+688', 'Tuvalu', 'TV', 0),
('205', '+256', 'Uganda', 'UG', 1),
('206', '+380', 'Ukraine', 'UA', 1),
('207', '+971', 'United Arab Emirates', 'AE', 1),
('208', '+44', 'United Kingdom', 'GB', 1),
('209', '+1', 'United States', 'US', 1),
('210', '+598', 'Uruguay', 'UY', 1),
('211', '+998', 'Uzbekistan', 'UZ', 1),
('212', '+678', 'Vanuatu', 'VU', 1),
('213', '+58', 'Venezuela', 'VE', 1),
('214', '+84', 'Vietnam', 'VN', 1),
('215', '+1284', 'Virgin Islands, British', 'VG', 1),
('216', '+1340', 'Virgin Islands, U.s.', 'VI', 1),
('217', '+681', 'Wallis and Futuna', 'WF', 0),
('218', '+967', 'Yemen', 'YE', 1),
('219', '+260', 'Zambia', 'ZM', 1),
('220', '+263', 'Zimbabwe', 'ZW', 1);

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
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_customers`
--

INSERT INTO `mst_customers` (`id`, `mst_companies_id`, `company_name`, `gst_number`, `contact_person_name`, `tally_alias_name`, `user_name`, `password`, `birth_date`, `contact_type`, `priority`, `notes`, `logo`, `education_details`, `prev_details`, `company_tin_no`, `company_service_tax_no`, `company_cust_discount`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 4, 'Reliance Formulation Pvt Ltd.', '24AABCR3233L1ZI', 'kushal', NULL, 'qcreliancepharma@gmail.com', '$2y$10$0fECFjhpAByskh5haH4HK.4Xu8BTx88cSEVM3n7GVSYn6Q5aUaZ.a', NULL, 'Customer', 'High', NULL, 'null', NULL, NULL, NULL, NULL, NULL, 3, 150, '2021-12-15 11:07:56', '2021-12-23 14:57:51', '2019-20', NULL, 0, NULL),
(2, 4, 'Reliance', NULL, NULL, NULL, NULL, NULL, NULL, 'Manufacturer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-15 11:12:12', NULL, '2019-20', NULL, 1, NULL),
(3, 4, 'Reliance', NULL, NULL, NULL, NULL, NULL, NULL, 'Supplier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-15 11:12:12', NULL, '2019-20', NULL, 1, NULL),
(4, 4, 'Divine Infosys', NULL, 'Vishal Kotak', 'Bhavesh Gajjar', 'wordpress.divine@gmail.com', '$2y$10$bTDQSZW2my.A7NDThk7NaONMebSIUOKPrJWFj67oKAeJ4NdUq8Ap2', '2016-09-14', 'Service Provider', 'High', 'We believe design is the essence of any website that showcases the core strength of the business and reaches out to innumerable people.', '20211215154052.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '900700000', '1234567890', '5', 3, NULL, '2021-12-15 15:40:52', NULL, '2019-20', NULL, 1, NULL),
(5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Manufacturer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-16 14:29:26', NULL, '2019-20', NULL, 1, NULL),
(6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Supplier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-16 14:29:26', NULL, '2019-20', NULL, 1, NULL);

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
(1, 1, '', '', '', '', '', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', '', 150, 150, '2021-12-15 11:07:56', '2021-12-23 14:57:51', NULL),
(2, 1, 'undefined', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 150, 150, '2021-12-15 11:07:56', '2021-12-23 14:57:51', NULL),
(3, 4, 'Palladium, 511-512, Corporate Rd, Makarba, Ahmedabad, Gujarat 380051', 'Palladium, 511-512, Corporate Rd, Makarba, Ahmedabad, Gujarat 380051', 'Makarba', '380015', 'Ahmedabad', 12, 102, '079-27507178', NULL, NULL, '', NULL, 1, '9408072555', '9408072555', 'wordpress.divine@gmail.com', 3, 3, '2021-12-15 15:40:52', '2021-12-15 15:40:52', NULL),
(4, 4, 'Palladium, 511-512, Corporate Rd, Makarba, Ahmedabad, Gujarat 380051', 'Weybridge Brooklands Business Park, Wellington Way', 'Makarba', '380015', 'Warwickshire', 12, 102, NULL, '', 'wordpress.divine@gmail.com', NULL, '20211215154052.png', 2, '9408072555', NULL, 'wordpress.divine@gmail.com', 3, 3, '2021-12-15 15:40:52', '2021-12-15 15:40:52', NULL);

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
(1, 4, 'Vishal Kotak', '4474439308', 'wordpress.divine@gmail.com', 0, 8, 3, 3, '2021-12-15 15:40:52', '2021-12-15 15:40:52', NULL);

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
(1, 4, 1, 'QC', 3, NULL, '2019-20', NULL, 1, NULL, '2021-12-21 12:09:00', '2021-12-21 12:09:00'),
(2, 4, 1, 'QA', 3, NULL, '2019-20', NULL, 1, NULL, '2021-12-21 12:09:09', '2021-12-21 12:09:09');

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

-- --------------------------------------------------------

--
-- Table structure for table `mst_instruments`
--

CREATE TABLE `mst_instruments` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `make` varchar(255) DEFAULT NULL COMMENT 'Make',
  `instrument_name` varchar(255) NOT NULL,
  `instrument_code` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `last_service_date` date DEFAULT NULL,
  `service_due_date` date DEFAULT NULL,
  `last_calibration_date` date DEFAULT NULL,
  `calibration_due_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 4, 'IP', 1, 2019, '1', '2019-20', NULL, 1, 3, NULL, NULL, '2021-12-15 11:10:12', '2021-12-15 11:10:12');

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
(5, 4, 4, 'QA123', 3, 3, '2019-20', NULL, 1, NULL, '2021-05-26 11:53:59', '2021-11-15 06:34:47'),
(6, 5, 4, 'test position', 3, 2, '2019-20', NULL, 1, NULL, '2021-06-08 11:12:39', '2021-12-13 11:31:20'),
(7, 5, 1, 'QA', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-08 13:22:23', '2021-06-08 12:22:23'),
(8, 5, 4, 'Chemist', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-11 05:55:58', '2021-12-02 07:22:03'),
(9, 11, 1, 'Junior QA Analytics', 3, NULL, '2019-20', NULL, 1, NULL, '2021-11-16 12:51:44', '2021-11-16 12:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `mst_products`
--

CREATE TABLE `mst_products` (
  `id` int(23) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_generic` varchar(55) DEFAULT NULL,
  `marker_specification` varchar(255) DEFAULT NULL,
  `pharmacopeia_id` int(5) DEFAULT NULL,
  `generic_product_id` int(23) DEFAULT NULL,
  `packing_detail` varchar(255) DEFAULT NULL,
  `sample_description` text DEFAULT NULL,
  `hsn_Code` varchar(55) DEFAULT NULL,
  `is_generic` tinyint(1) DEFAULT NULL COMMENT 'Default 0',
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL COMMENT 'Default 1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_products`
--

INSERT INTO `mst_products` (`id`, `mst_companies_id`, `product_name`, `product_generic`, `marker_specification`, `pharmacopeia_id`, `generic_product_id`, `packing_detail`, `sample_description`, `hsn_Code`, `is_generic`, `selected_year`, `copied_from_year`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'Acenol Tablet', 'Finished Product', 'IHS', 1, 0, '', 'White to almost white tablet', '', 0, '2019-20', NULL, 1, 3, 3, '2021-12-15 11:00:05', '2021-12-16 13:01:32', NULL),
(2, 4, 'Paracitamol Tablet', 'Finished Product', '', 1, 0, '', 'sample description for paracitamol tablet', '', 1, '2019-20', NULL, 1, 3, 3, '2021-12-16 14:41:01', '2021-12-16 18:36:26', NULL),
(3, 4, 'NEW PRODUCT1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-20', NULL, 1, 1, NULL, '2021-12-16 15:00:50', NULL, NULL),
(4, 4, 'Viksss', 'Raw Metriall', 'motion sicknesss', 5, 3, 'Shipped', 'motion sickness', '342356', 1, '2019-20', NULL, 1, 1, NULL, '2021-12-16 15:00:50', NULL, NULL),
(5, 4, 'Viksss', 'Raw Metriall', 'motion sicknesss', 5, 3, 'Shipped', 'motion sickness', '342356', 1, '2019-20', NULL, 1, 1, NULL, '2021-12-16 15:01:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_product_samples`
--

CREATE TABLE `mst_product_samples` (
  `id` int(11) NOT NULL,
  `mst_product_id` int(11) NOT NULL,
  `by_pass` tinyint(1) NOT NULL COMMENT 'Default 2',
  `parent` int(11) DEFAULT NULL,
  `mst_sample_parameter_id` int(11) DEFAULT NULL,
  `label_claim` varchar(155) NOT NULL,
  `min_limit` varchar(155) NOT NULL,
  `max_limit` varchar(155) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `method` varchar(155) NOT NULL,
  `description` varchar(255) NOT NULL,
  `division` varchar(155) NOT NULL,
  `nabl` varchar(155) NOT NULL,
  `formula` varchar(155) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_product_samples`
--

INSERT INTO `mst_product_samples` (`id`, `mst_product_id`, `by_pass`, `parent`, `mst_sample_parameter_id`, `label_claim`, `min_limit`, `max_limit`, `amount`, `method`, `description`, `division`, `nabl`, `formula`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, 1, 2, 0, 5, '', 'NLT 90.0 %to', 'NMT 110.0 %', '0.00', '', '', '', '', '', 3, 3, '2021-12-16 13:01:32', '2021-12-16 13:01:32', NULL),
(16, 1, 2, 0, 0, '10.0 mg', 'NLT 90.0 %to', 'NMT 110.0 %', '0.00', '', '', '', '', '', 3, 3, '2021-12-16 13:01:32', '2021-12-16 13:01:32', NULL),
(17, 1, 2, 0, 0, '', '', '', '0.00', '', '', '', '', '', 3, 3, '2021-12-16 13:01:32', '2021-12-16 13:01:32', NULL),
(24, 4, 1, 22, 0, 'label claim', '10', '100', '500.00', 'method', 'description', 'A', 'nabl', 'formula', 1, 1, '2021-12-16 15:00:50', '2021-12-16 15:00:50', NULL),
(25, 4, 1, 13, 69, 'label claim1', '20', '200', '700.00', 'method1', 'description1', 'A1', 'nabl1', 'formula1', 1, 1, '2021-12-16 15:00:50', '2021-12-16 15:00:50', NULL),
(26, 5, 1, 22, 0, 'label claim', '10', '100', '500.00', 'method', 'description', 'A', 'nabl', 'formula', 1, 1, '2021-12-16 15:01:04', '2021-12-16 15:01:04', NULL),
(27, 5, 1, 13, 69, 'label claim1', '20', '200', '700.00', 'method1', 'description1', 'A1', 'nabl1', 'formula1', 1, 1, '2021-12-16 15:01:04', '2021-12-16 15:01:04', NULL),
(32, 2, 2, 0, 5, '200 mg', '25', '60', '0.00', 'test', '', '', '', '', 3, 3, '2021-12-16 18:36:26', '2021-12-16 18:36:26', NULL),
(33, 2, 2, 0, 0, '', 'NLT 90.0 %to', 'NMT 110.0 %', '0.00', '', '', '', '', '', 3, 3, '2021-12-16 18:36:26', '2021-12-16 18:36:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_states`
--

CREATE TABLE `mst_states` (
  `id` varchar(4) DEFAULT NULL,
  `state_name` varchar(51) DEFAULT NULL,
  `mst_countries_id` varchar(10) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mst_tests`
--

CREATE TABLE `mst_tests` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `procedure_name` varchar(255) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `test_code` varchar(50) DEFAULT NULL,
  `test_category` varchar(255) DEFAULT NULL,
  `test_procedure` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
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
-- Dumping data for table `mst_tests`
--

INSERT INTO `mst_tests` (`id`, `mst_companies_id`, `procedure_name`, `price`, `test_code`, `test_category`, `test_procedure`, `parent_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'Test 01', '10.20', 'TEST01', 'Cate 01', 'Test 01', 0, 1, 1, '2021-11-09 12:26:27', '2021-11-09 12:27:16', '2019-20', NULL, 1, '2021-11-09 12:27:16'),
(2, 1, 'Test 02', '10', 'TEST01', 'Cate 1', 'Test', 0, 1, NULL, '2021-11-09 12:27:22', '2021-11-09 12:27:22', '2019-20', NULL, 1, '2021-11-09 12:27:16'),
(3, 1, 'Test 03', '10.50', 'TEST02', 'Cate 1', 'Test', 0, 1, NULL, '2021-11-09 12:27:31', '2021-11-09 12:27:31', '2019-20', NULL, 1, NULL),
(4, 1, 'Test 04', '10.50', 'TEST020', 'Cate 1', 'Test', 0, 1, NULL, '2021-11-09 12:27:31', '2021-11-09 12:27:31', '2019-20', NULL, 1, '2021-11-09 12:27:16'),
(5, 4, 'Description', 'price', 'test_code', 'test_category', 'test_procedure', 1, 1, NULL, '2021-12-16 13:01:11', '2021-12-16 13:01:11', '2019-20', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_test_parameters`
--

CREATE TABLE `mst_test_parameters` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) DEFAULT NULL,
  `test_by_pass` tinyint(1) DEFAULT NULL,
  `test_parameter_name` varchar(155) DEFAULT NULL,
  `test_alpha` varchar(155) NOT NULL,
  `formula` varchar(155) DEFAULT NULL,
  `type` varchar(155) DEFAULT NULL,
  `unit` varchar(155) DEFAULT NULL,
  `value` char(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_test_parameters`
--

INSERT INTO `mst_test_parameters` (`id`, `mst_companies_id`, `test_by_pass`, `test_parameter_name`, `test_alpha`, `formula`, `type`, `unit`, `value`, `sort`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 4, 1, 'test_parameter_name', 'test_alpha', 'formula', 'type', 'unit', 'y', 'sort', 1, NULL, '2021-12-16 13:01:11', '2021-12-16 13:01:11', '2019-20', NULL, 1, NULL),
(2, 4, 1, 'test_parameter_name', 'test_alpha', 'formula', 'type', 'unit', 'y', 'sort', 1, NULL, '2021-12-16 13:01:11', '2021-12-16 13:01:11', '2019-20', NULL, 1, NULL);

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
(1, 4, 'mg', 3, NULL, '2021-12-15 11:51:18', '2021-12-15 11:51:18', '2019-20', NULL, 1, NULL),
(2, 4, '%w/w', 3, NULL, '2021-12-15 11:56:58', '2021-12-15 11:56:58', '2019-20', NULL, 1, NULL);

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
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL COMMENT 'Primary Key, Auto Increment',
  `quotation_no` varchar(155) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `quotation_date` date DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  `kind_attention` varchar(155) DEFAULT NULL,
  `turn_around_time` varchar(30) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `currency_type` varchar(5) DEFAULT NULL,
  `grand_total` tinyint(1) DEFAULT NULL COMMENT 'default 1 and 1= yes, 0=No',
  `payment_terms` varchar(155) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'created user id',
  `updated_by` int(11) DEFAULT NULL COMMENT 'updated user id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL COMMENT 'default 1',
  `deleted_at` datetime DEFAULT NULL COMMENT 'default NULL'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_product_info`
--

CREATE TABLE `quotation_product_info` (
  `id` int(11) NOT NULL COMMENT 'Primary Key, Auto Increment',
  `quotation_id` int(11) NOT NULL COMMENT 'foreign key for quotation table',
  `sample_name` varchar(255) DEFAULT NULL,
  `test_required` varchar(255) DEFAULT NULL,
  `method_technique` varchar(255) DEFAULT NULL,
  `sample_qty` int(11) DEFAULT NULL,
  `first_sample` int(11) DEFAULT NULL,
  `sample_in_row` int(11) DEFAULT NULL,
  `sample_preperation` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_rights`
--

CREATE TABLE `role_rights` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Fk of users table',
  `roll_rights` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_rights`
--

INSERT INTO `role_rights` (`id`, `user_id`, `roll_rights`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '{\"section\":\"booking\"}', NULL, NULL, '2021-11-23 14:54:47', '2021-11-23 14:54:47', NULL),
(2, 2, '{\"section\":\"booking1\"}', NULL, NULL, '2021-11-23 15:13:36', '2021-11-23 15:24:50', NULL),
(3, 2, '{\"section\":\"booking\"}', NULL, NULL, '2021-11-23 15:14:07', '2021-11-23 15:14:07', NULL),
(4, 2, '{\"section\":\"booking\"}', NULL, NULL, '2021-11-23 15:15:46', NULL, NULL),
(5, 2, '{\"section\":\"booking\"}', NULL, NULL, '2021-11-23 15:18:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_right_designs`
--

CREATE TABLE `role_right_designs` (
  `id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `modules` varchar(255) NOT NULL,
  `can_add` int(11) NOT NULL,
  `can_delete` int(11) NOT NULL,
  `can_view` int(11) NOT NULL,
  `can_email` int(11) NOT NULL,
  `can_print` int(11) NOT NULL,
  `can_quick_access_tabs` int(11) NOT NULL,
  `can_sms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_right_designs`
--

INSERT INTO `role_right_designs` (`id`, `section`, `modules`, `can_add`, `can_delete`, `can_view`, `can_email`, `can_print`, `can_quick_access_tabs`, `can_sms`) VALUES
(1, 'HR', 'Employee', 0, 0, 0, 0, 0, 0, 0),
(2, 'HR', 'Holiday', 0, 0, 0, 0, 0, 0, 0),
(3, 'HR', 'Leaves', 0, 0, 0, 0, 0, 0, 0),
(4, 'HR', 'Task', 0, 0, 0, 0, 0, 0, 0),
(5, 'HR', 'HR Documents', 0, 0, 0, 0, 0, 0, 0),
(6, 'HR', 'Attendence', 0, 0, 0, 0, 0, 0, 0),
(7, 'HR', 'Opening Leave Balance', 0, 0, 0, 0, 0, 0, 0),
(8, 'HR', 'Salary', 0, 0, 0, 0, 0, 0, 0),
(9, 'Accounts', 'Sales GST', 0, 0, 0, 0, 0, 0, 0),
(10, 'Accounts', 'Other Sales GST', 0, 0, 0, 0, 0, 0, 0),
(11, 'Accounts', 'Purchase Bill', 0, 0, 0, 0, 0, 0, 0),
(12, 'Accounts', 'Bank & Cash', 0, 0, 0, 0, 0, 0, 0),
(13, 'Accounts', 'Voucher', 0, 0, 0, 0, 0, 0, 0),
(14, 'Accounts', 'Credit Note', 0, 0, 0, 0, 0, 0, 0),
(15, 'Accounts', 'Debit Note', 0, 0, 0, 0, 0, 0, 0),
(16, 'Accounts', 'Other Purchase', 0, 0, 0, 0, 0, 0, 0),
(17, 'Sales', 'Customers', 0, 0, 0, 0, 0, 0, 0),
(18, 'Sales', 'Quotation', 0, 0, 0, 0, 0, 0, 0),
(19, 'Sales', 'Customer Price List', 0, 0, 0, 0, 0, 0, 0),
(20, 'Masters', 'Groups', 0, 0, 0, 0, 0, 0, 0),
(21, 'Masters', 'Ledger', 0, 0, 0, 0, 0, 0, 0),
(22, 'Masters', 'Company', 0, 0, 0, 0, 0, 0, 0),
(23, 'Masters', 'Branch', 0, 0, 0, 0, 0, 0, 0),
(24, 'Masters', 'Department', 0, 0, 0, 0, 0, 0, 0),
(25, 'Masters', 'Position Master', 0, 0, 0, 0, 0, 0, 0),
(26, 'Masters', 'Bank Account Master', 0, 0, 0, 0, 0, 0, 0),
(27, 'Masters', 'Material', 0, 0, 0, 0, 0, 0, 0),
(28, 'Masters', 'Location', 0, 0, 0, 0, 0, 0, 0),
(29, 'Masters', 'Machine', 0, 0, 0, 0, 0, 0, 0),
(30, 'Masters', 'Unit Master', 0, 0, 0, 0, 0, 0, 0),
(31, 'Masters', 'Category Master', 0, 0, 0, 0, 0, 0, 0),
(32, 'Stock', 'Manage Indent', 0, 0, 0, 0, 0, 0, 0),
(33, 'Stock', 'Purchase Order', 0, 0, 0, 0, 0, 0, 0),
(34, 'Stock', 'Material Issue', 0, 0, 0, 0, 0, 0, 0),
(35, 'Stock', 'GRN', 0, 0, 0, 0, 0, 0, 0),
(36, 'Stock', 'Stock', 0, 0, 0, 0, 0, 0, 0),
(37, 'Stock', 'Material Use', 0, 0, 0, 0, 0, 0, 0),
(38, 'Manufacturing', 'Stock Transfer', 0, 0, 0, 0, 0, 0, 0),
(39, 'Manufacturing', 'BOM', 0, 0, 0, 0, 0, 0, 0),
(40, 'Manufacturing', 'Work Orders', 0, 0, 0, 0, 0, 0, 0),
(41, 'Manufacturing', 'Material Wastage', 0, 0, 0, 0, 0, 0, 0),
(42, 'Manufacturing', 'Daily Production', 0, 0, 0, 0, 0, 0, 0),
(43, 'Manufacturing', 'Stock Audit', 0, 0, 0, 0, 0, 0, 0),
(44, 'Manufacturing', 'Part Concession Note', 0, 0, 0, 0, 0, 0, 0),
(45, 'Manufacturing', 'SOP', 0, 0, 0, 0, 0, 0, 0),
(46, 'Analytics', 'Pharmacopiea', 0, 0, 0, 0, 0, 0, 0),
(47, 'Analytics', 'Products', 0, 0, 0, 0, 0, 0, 0),
(48, 'Analytics', 'Bookings', 0, 0, 0, 0, 0, 0, 0),
(49, 'Analytics', 'Test', 0, 0, 0, 0, 0, 0, 0),
(50, 'Analytics', 'Instruments', 0, 0, 0, 0, 0, 0, 0),
(51, 'Reports\\Analytics', 'Pending Report', 0, 0, 0, 0, 0, 0, 0),
(52, 'Reports\\Analytics', 'Summary Report', 0, 0, 0, 0, 0, 0, 0),
(53, 'Reports\\Analytics', 'Test Summary', 0, 0, 0, 0, 0, 0, 0),
(54, 'Reports\\Analytics', 'Chemist Test', 0, 0, 0, 0, 0, 0, 0),
(55, 'Reports\\Analytics', 'User Activity', 0, 0, 0, 0, 0, 0, 0),
(56, 'Reports\\Analytics', 'COA Release Report', 0, 0, 0, 0, 0, 0, 0),
(57, 'Reports\\Analytics', 'Block Report', 0, 0, 0, 0, 0, 0, 0),
(58, 'Reports\\Analytics', 'Analysis Report', 0, 0, 0, 0, 0, 0, 0),
(59, 'Reports\\Accounts', 'Balance Sheet', 0, 0, 0, 0, 0, 0, 0),
(60, 'Reports\\Accounts', 'Profit & Loss Statement', 0, 0, 0, 0, 0, 0, 0),
(61, 'Reports\\Accounts', 'Outstanding Report', 0, 0, 0, 0, 0, 0, 0),
(62, 'Reports\\Accounts', 'Trial Balance', 0, 0, 0, 0, 0, 0, 0),
(63, 'Reports\\Accounts', 'Ledger Statement', 0, 0, 0, 0, 0, 0, 0),
(64, 'Reports\\Accounts', 'Service Tax Report', 0, 0, 0, 0, 0, 0, 0),
(65, 'Reports\\Accounts', 'Bank Book', 0, 0, 0, 0, 0, 0, 0),
(66, 'Reports\\Accounts', 'Cash Book', 0, 0, 0, 0, 0, 0, 0),
(67, 'Reports\\Accounts', 'Bank Reconsilation', 0, 0, 0, 0, 0, 0, 0),
(68, 'Reports\\Accounts', 'P and I', 0, 0, 0, 0, 0, 0, 0),
(69, 'Reports\\Accounts', 'Day Book', 0, 0, 0, 0, 0, 0, 0),
(70, 'Reports\\Accounts', 'Sales Report', 0, 0, 0, 0, 0, 0, 0),
(71, 'Reports\\Accounts', 'Purchase Report', 0, 0, 0, 0, 0, 0, 0),
(72, 'Reports\\Accounts', 'GST Report', 0, 0, 0, 0, 0, 0, 0),
(73, 'Reports\\Accounts', 'Without GST Report', 0, 0, 0, 0, 0, 0, 0),
(74, 'Reports\\Stock', 'Stock Register', 0, 0, 0, 0, 0, 0, 0),
(75, 'Reports\\Stock', 'Old Stock', 0, 0, 0, 0, 0, 0, 0),
(76, 'Reports\\Stock', 'Purchase Report', 0, 0, 0, 0, 0, 0, 0),
(77, 'Reports\\Stock', 'Material Issue Report', 0, 0, 0, 0, 0, 0, 0),
(78, 'Reports\\Stock', 'Pending Indent Report', 0, 0, 0, 0, 0, 0, 0),
(79, 'Reports\\Stock', 'Pending PO Report', 0, 0, 0, 0, 0, 0, 0),
(80, 'Reports\\Stock', 'Pending GRN Report', 0, 0, 0, 0, 0, 0, 0),
(81, 'Reports\\Sale', 'Sales Report', 0, 0, 0, 0, 0, 0, 0),
(82, 'QA', 'Document', 0, 0, 0, 0, 0, 0, 0),
(83, 'QA', 'Notification', 0, 0, 0, 0, 0, 0, 0),
(84, 'QA', 'Method', 0, 0, 0, 0, 0, 0, 0),
(85, 'QA', 'Audit Trial', 0, 0, 0, 0, 0, 0, 0),
(86, 'QA', 'Working of Standard', 0, 0, 0, 0, 0, 0, 0),
(87, 'QA', 'Expiry Date Working Standard', 0, 0, 0, 0, 0, 0, 0);

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
  `is_approved` varchar(55) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this table use to store users information with login data';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `mst_companies_id`, `title`, `first_name`, `middle_name`, `last_name`, `email`, `email_verified_at`, `username`, `password`, `remember_token`, `blood_group`, `gender`, `birth_date`, `marital_status`, `photo`, `machine_code`, `phone`, `mobile`, `notes`, `attendance`, `signature`, `booking_action`, `booking_sms`, `booking_email`, `is_resigned`, `booking_copy`, `nationality`, `religion`, `caste`, `is_reporting_authority`, `deposit`, `booking_rate`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_approved`, `is_active`, `is_admin`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Manoj', 'Kumar', 'Patel', 'manojp.divine@gmail.com', NULL, 'manojp.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, 'Pending', 1, 0, NULL, '2021-05-07 14:40:35', '2021-11-30 05:11:11'),
(2, 1, NULL, 'Sanjay', 'Kumar', 'Patel', 'sanjayp.divine@gmail.com', NULL, 'sanjayp.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-05-07 14:40:35', '2021-12-23 10:17:20'),
(3, 1, 'Ms.', 'Prexa', 'S', 'Shah', 'preksha.divine@gmail.com', NULL, 'preksha.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B+', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 1, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-05-07 14:40:35', '2021-12-23 10:17:20'),
(4, 1, NULL, 'Manoj', 'D', 'Patel', 'manojp.divine@gmail.com', NULL, 'manojp.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B+ve', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur1111', 1, 'MSP', 1, 1, 1, 0, 1, 'Indian', 'Hindu', NULL, 1, 100, 0, NULL, 1, '2019-20', NULL, 'Pending', 1, 0, '2021-05-20 10:45:29', '2021-05-20 10:44:45', '2021-12-23 10:17:20'),
(5, 1, 'Mr.', 'Manoj', 'S', 'Patel', 'manojp.divine@yopmail.com', NULL, 'manojp.divine@yopmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B+ve', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 0, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 3, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-06-16 10:45:46', '2021-12-23 10:17:20'),
(74, 1, 'Mr.', 'Darshan', 'Pareshbhai', 'Vachhani', NULL, NULL, NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B+', 'M', '1994-07-01', 'Married', NULL, 'M03505', '1234567890', '7895642315', 'Testing', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Hindu', 1, 0, 0, NULL, 3, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-07-05 11:32:15', '2021-12-23 10:17:20'),
(80, 1, 'Er.', 'Jiten', 'Mahendra', 'Shah', NULL, NULL, NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'O-', 'M', '1990-07-02', 'Single', NULL, 'M05000', '01234567890', '09904545279', 'Testing', 1, NULL, 0, 0, 0, 0, 0, 'Indian', 'Hindu', 'Jain', 0, 0, 0, NULL, 3, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-07-06 12:56:37', '2021-12-23 10:17:20'),
(81, 1, 'Dr.', 'Shridhar', 'Mohan', 'Acharya', NULL, NULL, NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B+', 'M', '1990-07-01', 'Married', NULL, 'M012RT5', '09904545000', '1333567890', 'Testing Of Form', 0, NULL, 1, 1, 1, 1, 0, 'Indiana', 'Hindu', 'Brahmin', 0, 0, 1, NULL, 3, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-07-19 10:43:21', '2021-12-23 10:17:20'),
(82, 1, 'Mr.', 'Mayank', 'Ajit', 'Shah', 'mayank@gmail.com', NULL, 'mayank@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'None', 'M', NULL, 'Single', NULL, NULL, '1234567890', '6549872315', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-07-19 11:07:39', '2021-12-23 10:17:20'),
(84, 1, 'Miss', 'Roohi', 'Raj', 'Sachdeva', 'roohi@gmail.com', NULL, 'roohi@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'O+', 'F', '1990-07-02', 'Single', NULL, NULL, '7895642315', '7895640000', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-07-19 11:15:56', '2021-12-23 10:17:20'),
(85, 1, 'Mr.', 'Arnav', 'Mahendra', 'Shah', 'arnav@gmail.com', NULL, 'arnav@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'None', 'M', '1993-07-08', 'Single', NULL, 'M035', '6549872315', '7895642315', 'Test.....', 1, NULL, 0, 0, 0, 0, 0, 'Indian', 'Hindu', 'Hindu', 0, 0, 0, NULL, 3, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-07-19 11:19:29', '2021-12-23 10:17:20'),
(89, 4, 'Mr.', 'Sanjay', 'c', 'Patel', 'sanjayp.d@gmail.com', NULL, 'sanjayp.d@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', 'M', '1991-02-01', 'Married', NULL, '1222', '9377876363', '9377876363', 'notes', 1, 'C:\\fakepath\\16339507951195078173531-1.pdf', 1, 1, 1, 1, 0, NULL, NULL, NULL, 1, 1, 1, 2, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-10-28 09:21:31', '2021-12-23 10:17:20'),
(90, 4, 'Mr.', 'Sanjay', 'c', 'Patel', 'sanjayp.d@gmail.com', NULL, 'sanjayp.d@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', 'M', '1991-02-01', 'Married', NULL, '1222', '9377876363', '9377876363', 'notes', 1, 'C:\\fakepath\\16339507951195078173531-1.pdf', 1, 1, 1, 1, 0, NULL, NULL, NULL, 1, 1, 1, 2, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-10-28 09:23:46', '2021-12-23 10:17:20'),
(100, 1, 'Mr.', 'Pragnesh', 'A', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9537671314', '9408072555', NULL, 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-15 08:45:31', '2021-12-23 10:17:20'),
(101, 1, 'Mr.', 'Pragnesh', 'A', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9537671314', '9408072555', NULL, 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-15 08:46:29', '2021-12-23 10:17:20'),
(102, 1, 'Mr.', 'Pragnesh', 'A', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9537671314', '9408072555', NULL, 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-15 08:47:30', '2021-12-23 10:17:20'),
(103, 1, 'Mr.', 'test', 'ddd', 'Shah', 'preksha1.divine@gmail.com', NULL, 'preksha1.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'None', NULL, '2021-11-20', 'Single', NULL, NULL, '1112223334', '1234567895', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-16 09:53:42', '2021-12-23 10:17:20'),
(108, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:17:40', '2021-12-23 10:17:20'),
(109, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:18:55', '2021-12-23 10:17:20'),
(110, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:20:55', '2021-12-23 10:17:20'),
(111, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:21:59', '2021-12-23 10:17:20'),
(112, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:23:28', '2021-12-23 10:17:20'),
(113, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:25:53', '2021-12-23 10:17:20'),
(114, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:27:33', '2021-12-23 10:17:20'),
(115, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 11:56:49', '2021-12-23 10:17:20'),
(116, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:09:42', '2021-12-23 10:17:20'),
(117, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:10:56', '2021-12-23 10:17:20'),
(118, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:11:24', '2021-12-23 10:17:20'),
(119, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:12:11', '2021-12-23 10:17:20'),
(120, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:12:34', '2021-12-23 10:17:20'),
(121, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:13:05', '2021-12-23 10:17:20'),
(122, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:13:40', '2021-12-23 10:17:20'),
(123, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:14:23', '2021-12-23 10:17:20'),
(124, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:14:49', '2021-12-23 10:17:20'),
(125, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-31', 'Single', NULL, 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:15:10', '2021-12-23 10:17:20'),
(126, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:34:34', '2021-12-23 10:17:20'),
(127, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:34:46', '2021-12-23 10:17:20'),
(128, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:35:11', '2021-12-23 10:17:20'),
(129, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:37:05', '2021-12-23 10:17:20'),
(130, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:39:14', '2021-12-23 10:17:20'),
(131, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:41:11', '2021-12-23 10:17:20'),
(132, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:44:02', '2021-12-23 10:17:20'),
(133, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:44:50', '2021-12-23 10:17:20'),
(134, 1, 'Mr.', 'vishal', 'GOPIKA', 'kotak', 'Pragnesh@gmail.com', NULL, 'Pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A-', NULL, '2021-11-23', 'Single', NULL, 'M07', '9537671314', '9537671314', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 12:45:23', '2021-12-23 10:17:20'),
(135, 1, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh@gmail.com', NULL, 'pragnesh@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '2021-12-01', 'Single', 'photo_136_xl4nA.png', 'M07', '9408072555', '9408072555', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper enim id erat tempor sodales. In hac habitasse platea dictumst. Praesent ac convallis odio. Fusce malesuada lorem ante, ac elementum libero rutrum id. Donec ullamcorper mauris eu massa lacinia, sed volutpat dui tempus. Praesent venenatis ornare libero, quis posuere odio vestibulum non. Integer venenatis sem augue, sed tincidunt turpis aliquam sed. Suspendisse sit amet ultrices libero. Nulla facilisi. Integer vulputate rhoncus diam sed rhoncus. Aliquam vestibulum turpis purus, eget vestibulum mi rhoncus ut. Etiam tortor augue, pulvinar et quam eget, rhoncus tempus augue.', 1, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Pending', 1, 0, NULL, '2021-11-22 14:18:23', '2021-12-23 10:17:20'),
(137, 1, 'Mr.', 'Manoj', 'S', 'Patel', 'mp.inviable_1243@yopmail.com', NULL, 'mp.inviable_1243@yopmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '2582582588', '2582582588', 'lorem Ipsum dor simit de nur', 2, NULL, 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 3, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-11-29 18:10:25', '2021-12-23 10:17:20'),
(141, 4, 'Mr.', 'Pragnesh', 'A.', 'Chauhan', 'pragnesh.divineinfosys@gmail.com', NULL, 'pragnesh.divineinfosys@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', NULL, '1999-10-08', 'Single', '/images/employee/documents/photo_141_8GHNe.jpg', 'M07', '9537671314', '9537671314', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, '/images/employee/documents/signature_141_8GHNe.jpg', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 1, 1, 3, NULL, '2019-20', NULL, 'Approved', 1, 0, NULL, '2021-12-02 15:34:01', '2021-12-15 07:04:44'),
(143, 4, 'Miss', 'Siya', 'Ajit', 'Shah', NULL, NULL, NULL, '$2y$10$EQm7ZdKBh3iW2pZwmv6GZOxYhLXRtqAzs3BlYC8Ju7u95paE4VD5q', NULL, 'None', 'null', '2021-12-25', 'Single', NULL, 'null', NULL, '1234567890', 'null', 1, NULL, 0, 0, 0, 1, 0, 'null', 'null', 'null', 1, 0, 0, 3, 1, '2019-20', NULL, 'Approved', 1, 0, NULL, '2021-12-09 16:13:49', '2021-12-23 16:49:08'),
(144, 4, 'Mr.', 'Samay', 'Sujit', 'Shah', NULL, NULL, NULL, '$2y$10$TMBg3YjUvpT5PvnqQh7rJeKItJutcc0CcFGfGIU6tWhsFCtMdBiI2', NULL, 'O+', 'null', '2021-12-03', 'Single', '/images/employee/documents/photo_144_Pk9bB.png', '856681', '7777895642', '8888888888', 'Testing Employee With Validation and File Upload', 1, '/images/employee/documents/signature_144_Pk9bB.png', 0, 0, 0, 1, 0, 'null', 'Hindu', 'Hinduisam', 0, 0, 0, 3, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-13 15:29:35', '2021-12-23 19:15:34'),
(145, 4, 'Dr.', 'Sasha', 'Chinmay', 'Shekhavat', NULL, NULL, NULL, '$2y$10$5DJIwPAJucdPawhXlbTdn.rzytSZtm1rnFVJwLiGxGZ2R4ssnx/DW', NULL, 'None', 'null', '2021-12-25', 'Single', NULL, 'null', NULL, '1234567855', 'null', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'null', 'null', 0, 0, 0, 3, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-14 10:43:00', '2021-12-23 16:56:47'),
(146, 4, 'Mr.', 'Dhiraj', 'Srish', 'Sekhavt', NULL, NULL, 'dhiraj80', '$2y$10$Xuk3SK3byYQl0hhNjybUiu8bXCWwsg3VRPPP8dsrgU3uZ7o9mJjva', NULL, 'B+', 'null', '1980-05-02', 'Single', '/images/employee/documents/photo_146_D9hVG.png', '8525', '2222222222', '1111111111', 'Testing For Add Employee', 1, '/images/employee/documents/signature_146_D9hVG.png', 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Bramhin', 0, 0, 0, 3, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-14 14:58:12', '2021-12-24 19:16:07'),
(147, 4, 'Mr.', 'dfdfd', 'mbsdfjd', 'kfhjkdsfkj', 'om.divine@gmail.com', NULL, 'om.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'None', NULL, '2021-12-15', 'Single', NULL, NULL, NULL, '1111111111', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 3, NULL, '2019-20', NULL, 'Pending', 0, 0, '2021-12-14 15:51:56', '2021-12-14 15:46:52', '2021-12-23 10:17:20'),
(150, 4, 'Er.', 'Visakha', 'Mohanbhai', 'Patnayak', NULL, NULL, 'Visakha9', 'bG9naW4xMio=', NULL, 'B-', 'F', '1990-12-18', 'Married', '/images/employee/documents/photo_150_BP1dl.png', '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, '/images/employee/documents/signature_150_BP1dl.png', 0, 0, 0, 0, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 3, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-22 13:22:22', '2021-12-27 07:36:32'),
(151, 4, 'Mr.', 'Mihir', 'Jay', 'Aahuja', NULL, NULL, NULL, '', NULL, 'None', 'M', '2021-12-16', 'Single', NULL, NULL, NULL, '1234567890', 'null', 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 3, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-22 14:33:36', '2021-12-28 11:06:52'),
(152, 4, 'Mr.', 'Mihir', 'Jay', 'Aahuja', NULL, NULL, 'mhir123', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'None', 'M', '2021-12-03', 'Single', NULL, NULL, NULL, '1234567890', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 3, NULL, '2019-20', NULL, 'Pending', 0, 0, '2021-12-22 14:33:45', '2021-12-22 14:36:49', '2021-12-23 10:17:20'),
(153, 4, 'Mr.', 'Mihir', 'Jay', 'Aahuja', NULL, NULL, NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', 'M', '2021-12-22', 'Single', NULL, 'null', NULL, '1234567890', 'null', 1, NULL, 0, 0, 0, 1, 0, 'null', 'null', 'null', 0, 0, 0, 3, 150, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-22 15:04:19', '2021-12-23 10:17:20'),
(162, 4, 'Mr.', 'Mihir jay', 'Jay', 'Mehta', NULL, NULL, NULL, '$2y$10$rUSlfTg2egmG91ZAojIjj.AviPT5v7aIfd5BMA69o.bIKe4BkwOA.', NULL, 'None', 'M', '2021-12-11', 'Single', '/images/employee/documents/photo_162_HU1ok.pdf', 'null', '+44744393081', '1234567890', 'null', 1, NULL, 0, 0, 0, 1, 0, 'null', 'null', 'null', 0, 0, 0, 150, 1, '2019-20', NULL, 'Rejected', 0, 0, NULL, '2021-12-22 18:43:55', '2021-12-23 19:24:41'),
(181, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:09:40', '2021-12-23 10:17:20'),
(184, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:13:19', '2021-12-23 10:17:20'),
(185, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:13:48', '2021-12-23 10:17:20'),
(186, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:14:22', '2021-12-23 10:17:20'),
(187, 4, 'Er.', 'Visakha', NULL, 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:15:24', '2021-12-23 10:17:20'),
(188, 4, 'Er.', 'Visakha', 'Mohanbhai', 'Patnayak', NULL, NULL, NULL, '$2y$10$UGhEuJhRHGgA5lXpv4PkIuqtx3v1G.qa0gDUaXUniyP6TkDdKs0JO', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:16:06', '2021-12-23 19:15:04'),
(190, 4, 'Mr.', 'Mihir', 'Ajit', 'Aahuja', NULL, NULL, 'mihir21', 'YjF4bGMwcTNwM3I=', NULL, 'None', 'M', '2021-12-16', 'Single', NULL, NULL, NULL, '1234567890', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1, NULL, '2019-20', NULL, 'Pending', 0, 0, '2021-12-28 11:00:58', '2021-12-28 11:00:44', '2021-12-28 11:00:58'),
(204, 4, 'Mr.', 'Siya', 'Jay', 'Aahuja', NULL, NULL, 'test', 'eWNlbzhjYWxlMQ==', NULL, 'None', 'M', '2021-12-17', 'Single', NULL, NULL, NULL, '1234567890', 'null', 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22');

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
(123, 88, 0, 0, '', '', '', '', '', '', '', '', '', 2, 3, NULL, NULL, '2021-09-01 06:58:58', '2021-09-01 06:58:58'),
(124, 89, 102, 12, '1711  Centennial Farm Road, aassss', '1711  Centennial Farm Road', '', 'Harlan', '07036', 'sanjayp@net4nuts.com', 'sanjay patel', '', '', 1, 2, NULL, NULL, '2021-10-28 09:21:31', '2021-10-28 09:21:31'),
(125, 89, 0, 0, '1711  Centennial Farm Road', '', '', '', '07036', '', '', '8652425262', '', 2, 2, NULL, NULL, '2021-10-28 09:21:31', '2021-10-28 09:21:31'),
(126, 90, 102, 12, '1711  Centennial Farm Road, aassss', '1711  Centennial Farm Road', '', 'Harlan', '07036', 'sanjayp@net4nuts.com', 'sanjay patel', '', '', 1, 2, NULL, NULL, '2021-10-28 09:23:46', '2021-10-28 09:23:46'),
(127, 90, 0, 0, '1711  Centennial Farm Road', '', '', '', '07036', '', '', '8652425262', '', 2, 2, NULL, NULL, '2021-10-28 09:23:46', '2021-10-28 09:23:46'),
(128, 94, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 3, NULL, NULL, '2021-11-15 07:39:58', '2021-11-15 07:39:58'),
(129, 94, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 3, NULL, NULL, '2021-11-15 07:39:58', '2021-11-15 07:39:58'),
(130, 96, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 3, NULL, NULL, '2021-11-15 07:43:05', '2021-11-15 07:43:05'),
(131, 96, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 3, NULL, NULL, '2021-11-15 07:43:05', '2021-11-15 07:43:05'),
(132, 103, 102, 12, 'Ahmedabad', 'Ahmedabad', '', 'Ahmedabad', '380012', 'bhaveshgajjar@gmail.com', 'Mayank Shah', '1112223334', '', 2, 3, NULL, NULL, '2021-11-16 09:53:42', '2021-11-16 09:53:42'),
(133, 104, 102, 12, 'Ahmedabad', 'Ahmedabad', '', 'Ahmedabad', '380012', 'bhaveshgajjar@gmail.com', 'Mayank Shah', '1112223334', '', 2, 3, NULL, NULL, '2021-11-16 09:54:03', '2021-11-16 09:54:03'),
(134, 105, 102, 12, 'Ahmedabad', 'Ahmedabad', '', 'Ahmedabad', '380012', 'bhaveshgajjar@gmail.com', 'Mayank Shah', '1112223334', '', 2, 3, NULL, NULL, '2021-11-16 09:56:13', '2021-11-16 09:56:13'),
(135, 106, 102, 12, 'Ahmedabad', 'Ahmedabad', '', 'Ahmedabad', '380012', 'bhaveshgajjar@gmail.com', 'Mayank Shah', '1112223334', '', 2, 3, NULL, NULL, '2021-11-16 09:57:11', '2021-11-16 09:57:11'),
(136, 107, 102, 12, 'Ahmedabad', 'Ahmedabad', '', 'Ahmedabad', '380012', 'bhaveshgajjar@gmail.com', 'Mayank Shah', '1112223334', '', 2, 3, NULL, NULL, '2021-11-16 09:57:24', '2021-11-16 09:57:24'),
(138, 137, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 3, NULL, NULL, '2021-11-29 18:10:25', '2021-11-29 18:10:25'),
(139, 137, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 3, NULL, NULL, '2021-11-29 18:10:25', '2021-11-29 18:10:25'),
(143, 141, 102, 12, '507 Indraprasth Corporate opp venus antlantis', '507 Indraprasth Corporate opp venus antlantis', 'Sudama Nagar', 'Ahmedabad', '380015', 'pragnesh.divineinfosys@gmail.com', '0987654321', '9537671314', 'divineinfosys.com', 2, 3, NULL, NULL, '2021-12-02 15:34:01', '2021-12-02 15:34:01'),
(146, 143, 102, 17, 'Weybridge Brooklands Business Park, Wellington Way', 'test', '', 'test', 'KT130TT', '', 'test', '', '', 1, 3, 1, NULL, '2021-12-09 16:13:49', '2021-12-23 16:49:08'),
(147, 143, 0, 0, '', '', '', '', '', '', '', '1234567890', '', 2, 3, 1, NULL, '2021-12-09 16:13:49', '2021-12-23 16:49:08'),
(148, 144, 102, 19, 'Home Street', 'Home Street2', 'Area', 'City', 'Pincode', 'test123@gmail.com', 'Sikha Shah', '', '', 1, 3, 1, NULL, '2021-12-13 15:29:35', '2021-12-23 19:15:34'),
(149, 144, 102, 17, 'Street', 'Street2', 'Area 1', 'City 1', 'Pincode123', '', '', '1234567895', 'abc@.com', 2, 3, 1, NULL, '2021-12-13 15:29:35', '2021-12-23 19:15:34'),
(150, 145, 102, 12, 'Street 1 Test', 'Street 12 Test', '', '', '', '', 'Mihir', '', '', 1, 3, 1, NULL, '2021-12-14 10:43:00', '2021-12-23 16:56:47'),
(151, 145, 0, 0, '', '', '', '', '', '', '', '8888969652', '', 2, 3, 1, NULL, '2021-12-14 10:43:00', '2021-12-23 16:56:47'),
(152, 146, 102, 18, 'Home Street', 'Home Street2', 'Area', 'City', 'Pincode', 'dhiraj1@gmail.com', 'Sirsih Sekhvat', '', '', 1, 3, 1, NULL, '2021-12-14 14:58:12', '2021-12-24 19:16:07'),
(153, 146, 102, 13, 'Street', 'Street2', 'Area12', 'Cityq12', 'Pincode13', '', '', '8888825632', 'dhirajchemicals.com', 2, 3, 1, NULL, '2021-12-14 14:58:12', '2021-12-24 19:16:07'),
(154, 147, 102, 18, 'dfsfdf', 'dgdfgfd', '', '', '', '', 'fdfd', '', '', 1, 3, NULL, NULL, '2021-12-14 15:46:52', '2021-12-14 15:46:52'),
(155, 147, 0, 0, '', '', '', '', '', '', '', '1234567890', '', 2, 3, NULL, NULL, '2021-12-14 15:46:52', '2021-12-14 15:46:52'),
(160, 150, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', 'visakha@gmail.com', 'Mohan Patnayak', '', '', 1, 3, 1, NULL, '2021-12-22 13:22:22', '2021-12-27 10:55:40'),
(161, 150, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', '', '', '5823145230', 'No Website', 2, 3, 1, NULL, '2021-12-22 13:22:22', '2021-12-27 10:55:40'),
(162, 151, 102, 14, 'Weybridge Brooklands Business Park, Wellington Way', 'Weybridge Brooklands Business Park, Wellington Way', '', 'Warwickshire', 'KT130TT', '', 'fsd', '', '', 1, 3, 1, NULL, '2021-12-22 14:33:36', '2021-12-28 11:06:59'),
(163, 151, 0, 0, 'Weybridge Brooklands Business Park, Wellington Way', '', '', '', 'KT130TT', '', '', '1234567890', '', 2, 3, 1, NULL, '2021-12-22 14:33:36', '2021-12-28 11:06:59'),
(164, 152, 102, 17, 'fsdf', 'fsdfs', '', '', '', '', 'dfsdf', '', '', 1, 3, NULL, NULL, '2021-12-22 14:36:49', '2021-12-22 14:36:49'),
(165, 152, 0, 0, '', '', '', '', '', '', '', '1234566789', '', 2, 3, NULL, NULL, '2021-12-22 14:36:49', '2021-12-22 14:36:49'),
(166, 153, 102, 19, 'Weybridge Brooklands Business Park, Wellington Way', 'gdfgfg', '', '', 'KT130TT', '', 'ghjhgjghjg', '', '', 1, 3, 150, NULL, '2021-12-22 15:04:19', '2021-12-23 15:30:12'),
(167, 153, 0, 0, '', '', '', '', '', '', '', '1234567890', '', 2, 3, 150, NULL, '2021-12-22 15:04:19', '2021-12-23 15:30:12'),
(168, 162, 102, 1, 'Weybridge Brooklands Business Park, Wellington Way', 'Weybridge Brooklands Business Park, Wellington Way', '', 'Warwickshire', 'KT130TT', '', '1123', '', '', 1, 150, 1, NULL, '2021-12-22 18:43:55', '2021-12-23 19:24:41'),
(169, 162, 0, 0, '', '', '', '', '', '', '', '1234567890', '', 2, 150, 1, NULL, '2021-12-22 18:43:55', '2021-12-23 19:24:41'),
(194, 181, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', 'visakha@gmail.com', 'Mohan Patnayak', '', '', 1, 150, NULL, NULL, '2021-12-23 13:09:40', '2021-12-23 13:09:40'),
(195, 181, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', '', '', '5823145230', 'No Website', 2, 150, NULL, NULL, '2021-12-23 13:09:40', '2021-12-23 13:09:40'),
(200, 184, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', 'visakha@gmail.com', 'Mohan Patnayak', '', '', 1, 150, NULL, NULL, '2021-12-23 13:13:19', '2021-12-23 13:13:19'),
(201, 184, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', '', '', '5823145230', 'No Website', 2, 150, NULL, NULL, '2021-12-23 13:13:19', '2021-12-23 13:13:19'),
(202, 185, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', 'visakha@gmail.com', 'Mohan Patnayak', '', '', 1, 150, NULL, NULL, '2021-12-23 13:13:48', '2021-12-23 13:13:48'),
(203, 185, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', '', '', '5823145230', 'No Website', 2, 150, NULL, NULL, '2021-12-23 13:13:48', '2021-12-23 13:13:48'),
(204, 186, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', 'visakha@gmail.com', 'Mohan Patnayak', '', '', 1, 150, NULL, NULL, '2021-12-23 13:14:22', '2021-12-23 13:14:22'),
(205, 186, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', '', '', '5823145230', 'No Website', 2, 150, NULL, NULL, '2021-12-23 13:14:22', '2021-12-23 13:14:22'),
(206, 187, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', 'visakha@gmail.com', 'Mohan Patnayak', '', '', 1, 150, NULL, NULL, '2021-12-23 13:15:24', '2021-12-23 13:15:24'),
(207, 187, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', '', '', '5823145230', 'No Website', 2, 150, NULL, NULL, '2021-12-23 13:15:24', '2021-12-23 13:15:24'),
(208, 188, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', 'visakha@gmail.com', 'Mohan Patnayak', '', '', 1, 150, 1, NULL, '2021-12-23 13:16:06', '2021-12-23 19:15:04'),
(209, 188, 102, 12, '2.Sivans Flats', 'Near Smita Flats, Opposite of shyam Mall', 'Maneknagar', 'Ahmedabad', '380012', '', '', '5823145230', 'No Website', 2, 150, 1, NULL, '2021-12-23 13:16:06', '2021-12-23 19:15:04'),
(212, 190, 0, 0, '', '', '', '', '', '', '', '', '', 1, 1, NULL, '2021-12-28 11:00:58', '2021-12-28 11:00:44', '2021-12-28 11:00:58'),
(213, 190, 0, 0, '', '', '', '', '', '', '', '', '', 2, 1, NULL, '2021-12-28 11:00:58', '2021-12-28 11:00:44', '2021-12-28 11:00:58'),
(240, 204, 102, 5, 'Weybridge Brooklands Business Park, Wellington Way', 'test', '', 'test', 'KT130TT', '', '1234567890', '', '', 1, 1, 1, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22'),
(241, 204, 0, 0, '', '', '', '', '', '', '', '1234567890', '', 2, 1, 1, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22');

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
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `in_time` varchar(255) DEFAULT NULL,
  `out_time` varchar(255) DEFAULT NULL,
  `email_username` varchar(255) DEFAULT NULL,
  `email_password` varchar(255) DEFAULT NULL,
  `incoming_mail_type` varchar(255) DEFAULT NULL,
  `incoming_mail_server` text DEFAULT NULL,
  `incoming_mail_server_port` varchar(155) DEFAULT NULL,
  `outgoing_mail_server` varchar(255) DEFAULT NULL,
  `outgoing_mail_server_port` varchar(155) DEFAULT NULL,
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

INSERT INTO `user_company_info` (`id`, `mst_companies_id`, `users_id`, `reporting_authority_id`, `mst_departments_id`, `mst_positions_id`, `join_date`, `resign_date`, `bank_name`, `bank_branch_name`, `salary_per_month`, `bank_acc_number`, `username`, `password`, `in_time`, `out_time`, `email_username`, `email_password`, `incoming_mail_type`, `incoming_mail_server`, `incoming_mail_server_port`, `outgoing_mail_server`, `outgoing_mail_server_port`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 2, 1, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 'preksha.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, '2021-06-16 10:37:22', '2021-12-23 10:16:18'),
(2, 1, 5, 2, 1, 4, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, NULL, '2021-06-16 10:45:46', '2021-12-23 10:16:18'),
(3, 4, 6, 2, 1, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2021-06-18 06:37:10', '2021-12-23 10:16:18'),
(4, 4, 3, 2, 2, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, '2021-06-21 05:52:49', '2021-12-23 10:16:18'),
(5, 1, 28, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2021-06-22 07:33:08', '2021-12-23 10:16:18'),
(6, 1, 38, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2021-06-22 09:11:34', '2021-12-23 10:16:18'),
(7, 4, 40, 2, 1, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2021-06-22 09:13:07', '2021-12-23 10:16:18'),
(8, 4, 47, 2, 2, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-07-02 10:13:01', '2021-12-23 10:16:18'),
(9, 4, 81, 5, 5, 8, '2018-07-19', '2021-07-19', 'ICICI Bank', 'Thaltej', '25000', '12345678958', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-07-19 10:43:21', '2021-12-23 10:16:18'),
(10, 2, 85, 3, 3, 1, '2018-07-07', '2021-07-19', 'Kalupur Bank', 'Paldi', '27000', '12345678000', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-07-19 11:19:29', '2021-12-23 10:16:18'),
(11, 1, 86, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2021-07-20 12:28:54', '2021-12-23 10:16:18'),
(12, 1, 94, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-11-15 07:39:58', '2021-12-23 10:16:18'),
(13, 1, 96, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-11-15 07:43:05', '2021-12-23 10:16:18'),
(14, 1, 137, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-11-29 18:10:25', '2021-12-23 10:16:18'),
(15, 4, 141, 1, 1, 8, '2021-12-08', NULL, 'ICICI Bank', 'Vijay Nagar', '500000', '454545554545', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-12-02 15:34:01', '2021-12-23 10:16:18'),
(16, 4, 143, NULL, 1, 8, NULL, NULL, '', '', '', 'undefined', 'siya21', '$2y$10$xgEpIf6WJQYSroFv1j3TzeCT2M181yRSbXqgG1FCUDCrwEBNQ7Q3O', 'null', 'null', '', '', 'null', '', '', '', '', 1, 3, 1, NULL, '2021-12-09 16:13:49', '2021-12-23 16:16:00'),
(17, 4, 144, 84, 9, 4, '2021-12-09', '2021-11-18', 'Vijya Bank', 'Ahemdabad', '50000000', 'undefined', 'samay21', '$2y$10$fMrM9scMUamlJ3NMjVy3aebgv6uySieYfUbDp7xX78svwTPJajU9u', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 1, 3, 1, NULL, '2021-12-13 15:29:35', '2021-12-23 19:15:35'),
(18, 4, 145, 143, 2, 6, NULL, NULL, '', '', '', 'undefined', 'sasha21', '$2y$10$JvTbW8xTdQGzjpGDsjG4X.JvbHsfeiclrxPZaCNdzL8aA1jVG7mwu', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 1, 3, 1, NULL, '2021-12-14 10:43:00', '2021-12-23 16:56:47'),
(19, 4, 146, 144, 9, 4, '2021-12-25', NULL, 'HDFC', 'Satellite', '8000000', '78945612325', 'dhiraj80', '$2y$10$8tZMar3KEEE4PAk6HfEz4ufg/mdWxasyQdN70fgJdwUZaA6IzaVYS', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 1, 3, 1, NULL, '2021-12-14 14:58:12', '2021-12-24 19:10:15'),
(20, 4, 147, NULL, 9, 6, NULL, NULL, '', '', '', '', NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2021-12-14 15:46:52', '2021-12-23 10:16:18'),
(21, 4, 150, 143, 1, 8, '2021-12-10', NULL, 'Nutan Bank', 'Bagodra', '25000', '123444', 'Visakha9', 'bG9naW4xMio=', '13:24', '13:23', 'visakha@gmail.com', 'visakha@gmail.com', 'POP', 'Incoming Mail Server', '8080', 'Outgoing Mail Server', '80', 1, 3, 1, NULL, '2021-12-22 13:22:22', '2021-12-27 06:12:24'),
(22, 4, 151, NULL, 2, 6, NULL, NULL, '', '', '', NULL, 'mihir21', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '', '', '', '', '', '', '', '', '', 1, 3, NULL, '2021-12-22 14:33:45', '2021-12-22 14:33:36', '2021-12-23 10:16:18'),
(23, 4, 152, NULL, 2, 6, NULL, NULL, '', '', '', NULL, 'mhir123', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '', '', '', '', '', '', '', '', '', 1, 3, NULL, '2021-12-22 14:33:45', '2021-12-22 14:36:49', '2021-12-23 10:16:18'),
(24, 4, 153, NULL, 2, 8, NULL, NULL, '', '', '', NULL, 'mihir21', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '', '', '', '', '', '', '', '', '', 1, 3, NULL, NULL, '2021-12-22 15:04:19', '2021-12-23 10:16:18'),
(25, 4, 181, 143, 1, 8, '2021-12-10', NULL, 'Nutan Bank', 'Bagodra', '25000', NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '13:24', '13:23', 'visakha@gmail.com', 'visakha@gmail.com', '', 'Incoming Mail Server', '8080', 'Outgoing Mail Server', '80', 1, 150, NULL, NULL, '2021-12-23 13:09:40', '2021-12-23 10:16:18'),
(26, 4, 184, 143, 1, 8, '2021-12-10', NULL, 'Nutan Bank', 'Bagodra', '25000', NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '13:24', '13:23', 'visakha@gmail.com', 'visakha@gmail.com', '', 'Incoming Mail Server', '8080', 'Outgoing Mail Server', '80', 1, 150, NULL, NULL, '2021-12-23 13:13:19', '2021-12-23 10:16:18'),
(27, 4, 185, 143, 1, 8, '2021-12-10', NULL, 'Nutan Bank', 'Bagodra', '25000', NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '13:24', '13:23', 'visakha@gmail.com', 'visakha@gmail.com', '', 'Incoming Mail Server', '8080', 'Outgoing Mail Server', '80', 1, 150, NULL, NULL, '2021-12-23 13:13:48', '2021-12-23 10:16:18'),
(28, 4, 186, 143, 1, 8, '2021-12-10', NULL, 'Nutan Bank', 'Bagodra', '25000', NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '13:24', '13:23', 'visakha@gmail.com', 'visakha@gmail.com', '', 'Incoming Mail Server', '8080', 'Outgoing Mail Server', '80', 1, 150, NULL, NULL, '2021-12-23 13:14:22', '2021-12-23 10:16:18'),
(29, 4, 187, 143, 1, 8, '2021-12-10', NULL, 'Nutan Bank', 'Bagodra', '25000', NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', '13:24', '13:23', 'visakha@gmail.com', 'visakha@gmail.com', '', 'Incoming Mail Server', '8080', 'Outgoing Mail Server', '80', 1, 150, NULL, NULL, '2021-12-23 13:15:24', '2021-12-23 10:16:18'),
(30, 4, 188, 143, 1, 8, '2021-12-10', NULL, 'Nutan Bank', 'Bagodra', '25000', '2213123', 'Visakha90', '$2y$10$JCzBkdpam.tMmly7tWsWo.qfUDBJ5lxZAZPZyyp.VI6o4116WgLIG', '13:24', '13:23', 'visakha@gmail.com', 'visakha@gmail.com', 'POP', 'Incoming Mail Server', '8080', 'Outgoing Mail Server', '80', 1, 150, 1, NULL, '2021-12-23 13:16:06', '2021-12-23 19:15:04'),
(31, 4, 162, NULL, 2, 6, NULL, '2021-12-16', '', '', '', 'undefined', 'mihir jay21', '$2y$10$RMQ8pbWAS4ToGAx6z3DtoeiLGPXBkGBXsMs33/txGGVxTesUKNKSq', '', '', '', '', '', '', '', '', '', 1, 1, NULL, NULL, '2021-12-23 19:24:41', '2021-12-23 19:24:41'),
(32, 4, 151, NULL, 1, 4, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 1, NULL, '2021-12-28 11:03:52', '2021-12-28 11:06:59'),
(33, 4, 204, NULL, 2, 4, NULL, NULL, '', '', '', '', 'test', 'eWNlbzhjYWxlMQ==', '', '', '', '', 'IMAP', '', '', '', '', 1, 1, 1, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22');

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

--
-- Dumping data for table `user_doc_details`
--

INSERT INTO `user_doc_details` (`id`, `users_id`, `aadhar_card_photo`, `aadhar_number`, `election_card_photo`, `election_card_number`, `pan_card_photo`, `pan_card_number`, `passport_photo`, `passport_number`, `driving_license_photo`, `driving_license_number`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 94, NULL, '1234123412341234', NULL, '1234567890', NULL, 'ABCDE1234E', NULL, 'M4584585', NULL, 'MP0585555555', 1, 3, NULL, NULL, '2021-11-15 07:39:58', '2021-11-15 07:39:58'),
(2, 96, NULL, '1234123412341234', NULL, '1234567890', NULL, 'ABCDE1234E', NULL, 'M4584585', NULL, 'MP0585555555', 1, 3, NULL, NULL, '2021-11-15 07:43:05', '2021-11-15 07:43:05'),
(3, 137, NULL, '1234123412341234', NULL, '1234567890', NULL, 'ABCDE1234E', NULL, 'M4584585', NULL, 'MP0585555555', 1, 3, NULL, NULL, '2021-11-29 18:10:25', '2021-11-29 18:10:25'),
(4, 141, 'aadhar_card_141_IesxJ.jpg', '12324278', 'election_card_141_IesxJ.jpg', '9876543217', 'pan_card_141_IesxJ.jpg', '98765433210', 'passport_141_IesxJ.jpg', '98765433210', 'driving_license_141_IesxJ.jpg', '98765433210', 1, 3, NULL, NULL, '2021-12-02 15:34:01', '2021-12-02 15:34:01'),
(5, 143, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 3, 1, NULL, '2021-12-09 16:13:49', '2021-12-23 16:16:00'),
(6, 144, 'aadhar_card_144_ieZb5.png', '1234567890', 'election_card_144_ieZb5.png', '124rt78u', 'pan_card_144_ieZb5.png', '7895238263', 'passport_144_ieZb5.pdf', '12345678888', 'driving_license_144_ieZb5.png', '23455678993', 1, 3, 1, NULL, '2021-12-13 15:29:35', '2021-12-23 19:15:35'),
(7, 145, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 3, 1, NULL, '2021-12-14 10:43:00', '2021-12-23 16:56:47'),
(8, 146, 'aadhar_card_146_4kNvY.png', '123456789', 'election_card_146_4kNvY.pdf', '45454fdf', 'pan_card_146_4kNvY.png', '1234r5666', 'passport_146_4kNvY.png', 'fytry54tr', 'driving_license_146_4kNvY.pdf', 'eret4tert54', 1, 3, 1, NULL, '2021-12-14 14:58:12', '2021-12-24 19:10:15'),
(9, 147, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 3, NULL, NULL, '2021-12-14 15:46:52', '2021-12-14 15:46:52'),
(10, 150, 'aadhar_card_150_WHiTE.pdf', '1234-5678-9123', 'election_card_150_WHiTE.pdf', 'ABC1234566', 'pan_card_150_WHiTE.png', 'ABCDE7190K', 'passport_150_WHiTE.png', 'A2190457', 'driving_license_150_WHiTE.png', 'GJ011234567890', 1, 3, 1, NULL, '2021-12-22 13:22:22', '2021-12-27 10:55:40'),
(11, 151, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 3, 1, NULL, '2021-12-22 14:33:36', '2021-12-28 11:06:59'),
(12, 152, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 3, NULL, NULL, '2021-12-22 14:36:49', '2021-12-22 14:36:49'),
(13, 153, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 3, NULL, NULL, '2021-12-22 15:04:19', '2021-12-22 15:04:19'),
(14, 162, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 150, 1, NULL, '2021-12-22 18:43:55', '2021-12-23 19:24:41'),
(15, 181, NULL, '1234-5678-9123', NULL, 'ABC1234566', NULL, 'ABCDE7190K', NULL, 'A2190457', NULL, 'GJ011234567890', 1, 150, NULL, NULL, '2021-12-23 13:09:40', '2021-12-23 13:09:40'),
(16, 184, NULL, '1234-5678-9123', NULL, 'ABC1234566', NULL, 'ABCDE7190K', NULL, 'A2190457', NULL, 'GJ011234567890', 1, 150, NULL, NULL, '2021-12-23 13:13:19', '2021-12-23 13:13:19'),
(17, 185, NULL, '1234-5678-9123', NULL, 'ABC1234566', NULL, 'ABCDE7190K', NULL, 'A2190457', NULL, 'GJ011234567890', 1, 150, NULL, NULL, '2021-12-23 13:13:48', '2021-12-23 13:13:48'),
(18, 186, NULL, '1234-5678-9123', NULL, 'ABC1234566', NULL, 'ABCDE7190K', NULL, 'A2190457', NULL, 'GJ011234567890', 1, 150, NULL, NULL, '2021-12-23 13:14:22', '2021-12-23 13:14:22'),
(19, 187, NULL, '1234-5678-9123', NULL, 'ABC1234566', NULL, 'ABCDE7190K', NULL, 'A2190457', NULL, 'GJ011234567890', 1, 150, NULL, NULL, '2021-12-23 13:15:24', '2021-12-23 13:15:24'),
(20, 188, NULL, '1234-5678-9123', NULL, 'ABC1234566', NULL, 'ABCDE7190K', NULL, 'A2190457', NULL, 'GJ011234567890', 1, 150, 1, NULL, '2021-12-23 13:16:06', '2021-12-23 19:15:04'),
(21, 190, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 1, NULL, '2021-12-28 11:00:58', '2021-12-28 11:00:44', '2021-12-28 11:00:58'),
(22, 204, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 1, 1, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22');

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
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

--
-- Dumping data for table `user_edu_details`
--

INSERT INTO `user_edu_details` (`id`, `users_id`, `degree`, `university`, `from_year`, `to_year`, `percentage_grade`, `specialization`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 4, 'B Tech', 'Ganpat University', 2008, 2012, '81.20', 'Information Technology', 1, 1, NULL, '2021-06-16 10:47:59', '2021-06-16 10:47:59', NULL),
(4, 4, '10th', 'Gujrat Board', 1992, 1993, '78.50', 'Science', 1, 1, NULL, '2021-06-16 10:47:59', '2021-06-16 10:47:59', NULL),
(9, 5, 'B Tech', 'Ganpat University', 2008, 2012, '81.20', 'Information Technology', 1, 3, NULL, '2021-06-18 06:39:30', '2021-06-18 06:39:30', NULL),
(10, 5, '10th', 'Gujrat Board', 1992, 1993, '78.50', 'Science', 1, 3, NULL, '2021-06-18 06:39:30', '2021-06-18 06:39:30', NULL),
(30, 74, 'BCA', 'GU', 2012, 2015, '80', 'Garduation', 1, 3, NULL, '2021-07-05 11:32:16', '2021-07-05 11:32:16', NULL),
(31, 74, 'MCA', 'GTU', 2015, 2017, '85', 'Post Graduation', 1, 3, NULL, '2021-07-05 11:32:16', '2021-07-05 11:32:16', NULL),
(40, 80, 'BCA-a', 'Gujarat University', 2012, 2015, '80', 'Graduation', 1, 3, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37', NULL),
(41, 80, 'BBA-b', 'Gujarat Tech University', 2012, 2015, '60', 'POST Graduation', 1, 3, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37', NULL),
(42, 81, 'BA', 'Gujarat Uni', 2005, 2008, '60', 'Business Admininstarion', 1, 3, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21', NULL),
(43, 81, 'MA', 'Gujarat University', 2008, 2010, '65', 'Masters in BA', 1, 3, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21', NULL),
(44, 85, 'BBA', 'Gujarat University', 2012, 2015, '60', 'Graduation', 1, 3, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29', NULL),
(51, 86, 'B Tech', 'Ganpat University', 2008, 2012, '', 'Information Technology', 1, 1, NULL, '2021-07-20 12:28:54', '2021-07-20 12:28:54', NULL),
(52, 86, '10th', 'Gujrat Board', 1992, 1993, '', 'Science', 1, 1, NULL, '2021-07-20 12:28:54', '2021-07-20 12:28:54', NULL),
(55, 3, 'B Tech', 'Ganpat University', 2008, 2012, '81.20', 'Information Technology', 1, 1, NULL, '2021-07-20 12:29:45', '2021-07-20 12:29:45', NULL),
(56, 3, '10th', 'Gujrat Board', 1992, 1993, '78.50', 'Science', 1, 1, NULL, '2021-07-20 12:29:45', '2021-07-20 12:29:45', NULL),
(57, 94, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'Information Technology', 1, 3, NULL, '2021-11-15 07:39:58', '2021-11-15 07:39:58', NULL),
(58, 94, '10th', 'Gujrat Board', 1992, 1993, NULL, 'Science', 1, 3, NULL, '2021-11-15 07:39:58', '2021-11-15 07:39:58', NULL),
(59, 96, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'Information Technology', 1, 3, NULL, '2021-11-15 07:43:05', '2021-11-15 07:43:05', NULL),
(60, 96, '10th', 'Gujrat Board', 1992, 1993, NULL, 'Science', 1, 3, NULL, '2021-11-15 07:43:05', '2021-11-15 07:43:05', NULL),
(61, 137, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'Information Technology', 1, 3, NULL, '2021-11-29 18:10:25', '2021-11-29 18:10:25', NULL),
(62, 137, '10th', 'Gujrat Board', 1992, 1993, NULL, 'Science', 1, 3, NULL, '2021-11-29 18:10:25', '2021-11-29 18:10:25', NULL),
(66, 141, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'B.Ed (Running)', 1, 3, NULL, '2021-12-02 15:34:01', '2021-12-02 15:34:01', NULL),
(97, 181, 'Micoro Biology', 'GU', 2010, 2013, '60', 'Biology', 1, 150, NULL, '2021-12-23 13:09:40', '2021-12-23 13:09:40', NULL),
(98, 181, 'BSc', 'GTU', 2013, 2017, '65', 'Chemicals', 1, 150, NULL, '2021-12-23 13:09:40', '2021-12-23 13:09:40', NULL),
(103, 184, 'Micoro Biology', 'GU', 2010, 2013, '60', 'Biology', 1, 150, NULL, '2021-12-23 13:13:19', '2021-12-23 13:13:19', NULL),
(104, 184, 'BSc', 'GTU', 2013, 2017, '65', 'Chemicals', 1, 150, NULL, '2021-12-23 13:13:19', '2021-12-23 13:13:19', NULL),
(105, 185, 'Micoro Biology', 'GU', 2010, 2013, '60', 'Biology', 1, 150, NULL, '2021-12-23 13:13:48', '2021-12-23 13:13:48', NULL),
(106, 185, 'BSc', 'GTU', 2013, 2017, '65', 'Chemicals', 1, 150, NULL, '2021-12-23 13:13:48', '2021-12-23 13:13:48', NULL),
(107, 186, 'Micoro Biology', 'GU', 2010, 2013, '60', 'Biology', 1, 150, NULL, '2021-12-23 13:14:22', '2021-12-23 13:14:22', NULL),
(108, 186, 'BSc', 'GTU', 2013, 2017, '65', 'Chemicals', 1, 150, NULL, '2021-12-23 13:14:22', '2021-12-23 13:14:22', NULL),
(109, 187, 'Micoro Biology', 'GU', 2010, 2013, '60', 'Biology', 1, 150, NULL, '2021-12-23 13:15:24', '2021-12-23 13:15:24', NULL),
(110, 187, 'BSc', 'GTU', 2013, 2017, '65', 'Chemicals', 1, 150, NULL, '2021-12-23 13:15:24', '2021-12-23 13:15:24', NULL),
(113, 145, 'MBA', 'Saurashat', 2020, 2021, '', 'MBA', 1, 1, NULL, '2021-12-23 16:56:47', '2021-12-23 16:56:47', NULL),
(114, 188, 'Micoro Biology', 'GU', 2010, 2013, '60', 'Biology', 1, 1, NULL, '2021-12-23 19:15:04', '2021-12-23 19:15:04', NULL),
(115, 188, 'BSc', 'GTU', 2013, 2017, '65', 'Chemicals', 1, 1, NULL, '2021-12-23 19:15:04', '2021-12-23 19:15:04', NULL),
(116, 144, 'BCA', 'GU', 2012, 2015, '', 'Computer Science', 1, 1, NULL, '2021-12-23 19:15:34', '2021-12-23 19:15:34', NULL),
(117, 144, 'MCA', 'GTU', 2015, 2017, '', 'CS', 1, 1, NULL, '2021-12-23 19:15:34', '2021-12-23 19:15:34', NULL),
(175, 146, 'MBA', 'GU', 2010, 2014, '60%', 'Masters', 1, 1, NULL, '2021-12-24 19:16:07', '2021-12-24 19:16:07', NULL),
(188, 150, 'BE', 'GU', 2008, 2012, '60', 'Instrumentation', 1, 1, NULL, '2021-12-27 10:55:40', '2021-12-27 10:55:40', NULL),
(189, 150, 'ME', 'GTU', 2012, 2016, '80', 'Instrumentation 1', 1, 1, NULL, '2021-12-27 10:55:40', '2021-12-27 10:55:40', NULL),
(193, 204, 'test', '', 1204, NULL, '', '', 1, 1, NULL, '2021-12-28 11:27:22', '2021-12-28 11:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_emp_details`
--

CREATE TABLE `user_emp_details` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `organisation` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `emp_from_year` int(5) DEFAULT NULL,
  `emp_to_year` int(5) DEFAULT NULL,
  `annual_ctc` varchar(50) DEFAULT NULL,
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
(43, 85, 'westlineshipping', 'Manager Assistant', 2016, 2018, '450000', 1, 3, NULL, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29'),
(47, 141, 'Div Systems LLP', 'Director', 2019, 2020, '25000', 1, 3, NULL, NULL, '2021-12-02 15:34:01', '2021-12-02 15:34:01'),
(52, 152, 'tt', 'ttttttttttttttt', 1234, 5678, '123', 1, 3, NULL, NULL, '2021-12-22 14:36:49', '2021-12-22 14:36:49'),
(53, 153, 'gdfgdf', 'trdgdfg', 1234, 1234, '54645', 1, 3, NULL, NULL, '2021-12-22 15:04:19', '2021-12-22 15:04:19'),
(66, 181, 'Research Lab 1', 'Junior Traniee', 2017, 2019, '5000000', 1, 150, NULL, NULL, '2021-12-23 13:09:40', '2021-12-23 13:09:40'),
(69, 184, 'Research Lab 1', 'Junior Traniee', 2017, 2019, '5000000', 1, 150, NULL, NULL, '2021-12-23 13:13:19', '2021-12-23 13:13:19'),
(70, 185, 'Research Lab 1', 'Junior Traniee', 2017, 2019, '5000000', 1, 150, NULL, NULL, '2021-12-23 13:13:48', '2021-12-23 13:13:48'),
(71, 186, 'Research Lab 1', 'Junior Traniee', 2017, 2019, '5000000', 1, 150, NULL, NULL, '2021-12-23 13:14:22', '2021-12-23 13:14:22'),
(72, 186, 'Research Lab 2', 'Manager', 2019, 2021, '6000000', 1, 150, NULL, NULL, '2021-12-23 13:14:22', '2021-12-23 13:14:22'),
(73, 187, 'Research Lab 1', 'Junior Traniee', 2017, 2019, '5000000', 1, 150, NULL, NULL, '2021-12-23 13:15:24', '2021-12-23 13:15:24'),
(76, 188, 'Research Lab 1', 'Junior Traniee', 2017, 2019, '5000000', 1, 1, NULL, NULL, '2021-12-23 19:15:04', '2021-12-23 19:15:04'),
(77, 144, 'Test', 'Test Des', 2017, 2020, '2500000', 1, 1, NULL, NULL, '2021-12-23 19:15:34', '2021-12-23 19:15:34'),
(78, 144, 'Test 1', 'Test 1 Desc', 2020, 2021, '40000000', 1, 1, NULL, NULL, '2021-12-23 19:15:34', '2021-12-23 19:15:34'),
(151, 146, 'Om Deltas', 'Marketing Manager', 2014, 2020, '6000000', 1, 1, NULL, NULL, '2021-12-24 19:16:07', '2021-12-24 19:16:07'),
(164, 150, 'Research Lab 1', 'Junior Traniee', 2017, 2019, '5000000', 1, 1, NULL, NULL, '2021-12-27 10:55:40', '2021-12-27 10:55:40'),
(165, 150, 'Research Lab 2', 'Junior Traniee 1', 2019, 2021, '6000000', 1, 1, NULL, NULL, '2021-12-27 10:55:40', '2021-12-27 10:55:40');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_bookings`
-- (See below for the actual view)
--
CREATE TABLE `view_bookings` (
`id` int(11)
,`booking_type` varchar(55)
,`booking_no` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `view_bookings`
--
DROP TABLE IF EXISTS `view_bookings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`aumresearch`@`%` SQL SECURITY DEFINER VIEW `view_bookings`  AS  select `bookings`.`id` AS `id`,`bookings`.`booking_type` AS `booking_type`,`bookings`.`booking_no` AS `booking_no` from `bookings` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_audit_details`
--
ALTER TABLE `booking_audit_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_sample_details`
--
ALTER TABLE `booking_sample_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_tests`
--
ALTER TABLE `booking_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `formulas`
--
ALTER TABLE `formulas`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `mst_instruments`
--
ALTER TABLE `mst_instruments`
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
-- Indexes for table `mst_products`
--
ALTER TABLE `mst_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_product_samples`
--
ALTER TABLE `mst_product_samples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_tests`
--
ALTER TABLE `mst_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_test_parameters`
--
ALTER TABLE `mst_test_parameters`
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
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_product_info`
--
ALTER TABLE `quotation_product_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_rights`
--
ALTER TABLE `role_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_right_designs`
--
ALTER TABLE `role_right_designs`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_audit_details`
--
ALTER TABLE `booking_audit_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_sample_details`
--
ALTER TABLE `booking_sample_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_tests`
--
ALTER TABLE `booking_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formulas`
--
ALTER TABLE `formulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key, Auto Increment', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_banks`
--
ALTER TABLE `mst_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_branches`
--
ALTER TABLE `mst_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mst_categories`
--
ALTER TABLE `mst_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_companies`
--
ALTER TABLE `mst_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `mst_customers`
--
ALTER TABLE `mst_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mst_customers_contact_info`
--
ALTER TABLE `mst_customers_contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mst_customers_contact_person`
--
ALTER TABLE `mst_customers_contact_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mst_departments`
--
ALTER TABLE `mst_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_groups`
--
ALTER TABLE `mst_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_instruments`
--
ALTER TABLE `mst_instruments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_ledgers`
--
ALTER TABLE `mst_ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_locations`
--
ALTER TABLE `mst_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_machines`
--
ALTER TABLE `mst_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_materials`
--
ALTER TABLE `mst_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_pharmacopeia`
--
ALTER TABLE `mst_pharmacopeia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mst_positions`
--
ALTER TABLE `mst_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mst_products`
--
ALTER TABLE `mst_products`
  MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mst_product_samples`
--
ALTER TABLE `mst_product_samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `mst_tests`
--
ALTER TABLE `mst_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mst_test_parameters`
--
ALTER TABLE `mst_test_parameters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_units`
--
ALTER TABLE `mst_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key, Auto Increment';

--
-- AUTO_INCREMENT for table `quotation_product_info`
--
ALTER TABLE `quotation_product_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key, Auto Increment';

--
-- AUTO_INCREMENT for table `role_rights`
--
ALTER TABLE `role_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_right_designs`
--
ALTER TABLE `role_right_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `user_address_details`
--
ALTER TABLE `user_address_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `user_assign_rights`
--
ALTER TABLE `user_assign_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_company_info`
--
ALTER TABLE `user_company_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_doc_details`
--
ALTER TABLE `user_doc_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_edu_details`
--
ALTER TABLE `user_edu_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `user_emp_details`
--
ALTER TABLE `user_emp_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
