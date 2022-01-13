-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: sdb-e.hosting.stackcp.net
-- Generation Time: Jan 13, 2022 at 01:52 PM
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
-- Table structure for table `methods`
--

CREATE TABLE `methods` (
  `id` int(11) NOT NULL COMMENT 'Primary Key, Auto Increment',
  `mst_companies_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT 'pharmacopeia name',
  `date` date DEFAULT NULL,
  `file_1` text DEFAULT NULL,
  `file_2` text DEFAULT NULL,
  `file_3` text DEFAULT NULL,
  `file_4` text DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `methods`
--

INSERT INTO `methods` (`id`, `mst_companies_id`, `name`, `type`, `date`, `file_1`, `file_2`, `file_3`, `file_4`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 0, 'method1', 0, '1999-10-08', 'file_1', 'file_2', 'file_3', 'file_4', 'desciption', 1, NULL, '2022-01-10 12:44:24', '2022-01-10 15:45:56', '2019-20', NULL, 1, '2022-01-10 15:45:56'),
(2, 0, 'method1', 0, '1999-10-08', 'file_1', 'file_2', 'file_3', 'file_4', 'desciption', 1, NULL, '2022-01-10 12:44:46', NULL, '2019-20', NULL, 1, NULL),
(3, 0, 'method1', 0, '1999-10-08', 'file_1_To5ir.jpeg', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 13:12:32', NULL, '2019-20', NULL, 1, NULL),
(4, 0, 'method1', 0, '1999-10-08', 'file_1_hTrBj.jpeg', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 13:16:47', NULL, '2019-20', NULL, 1, NULL),
(5, 0, 'method1', 0, '1999-10-08', '', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 13:17:00', NULL, '2019-20', NULL, 1, NULL),
(6, 0, 'method1', 0, '1999-10-08', NULL, NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 13:17:29', NULL, '2019-20', NULL, 1, NULL),
(7, 0, 'method1', 0, '1999-10-08', 'file_1_JWJ3L.jpeg', 'file_2_nnXLJ.jpeg', 'file_3_HiBKL.jpeg', 'file_4_q2xrS.jpeg', 'desciption', 1, NULL, '2022-01-10 13:26:59', NULL, '2019-20', NULL, 1, NULL),
(8, 0, 'method1', 0, '1999-10-08', 'file_1_IZj6h.jpeg', 'file_2_VK94D.jpeg', 'file_3_220cA.jpeg', 'file_4_v11iR.jpeg', 'desciption', 1, NULL, '2022-01-10 13:27:23', NULL, '2019-20', NULL, 1, NULL),
(9, 0, 'method1', 0, '1999-10-08', NULL, NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 13:28:20', NULL, '2019-20', NULL, 1, NULL),
(10, 0, 'method1', 0, '1999-10-08', 'file_1_p0qqJ.jpeg', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 14:59:08', NULL, '2019-20', NULL, 1, NULL),
(11, 0, 'method1', 0, '1999-10-08', 'file_1_BWRQW.jpeg', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 15:08:24', '2022-01-10 15:08:34', '2019-20', NULL, 1, NULL),
(12, 0, 'method1', 0, '1999-10-08', 'file_1_Ccfrh.jpeg', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-10 15:08:58', NULL, '2019-20', NULL, 1, NULL),
(13, 0, 'method7', 0, '1998-10-08', 'file_1_dJfUi.jpeg', 'file_2_IAbj8.jpeg', 'file_3_slQVN.jpeg', 'file_4_cM1Sw.jpeg', 'desciption7', 1, 1, '2022-01-10 15:18:09', '2022-01-10 15:22:32', '2020-20', NULL, 1, NULL),
(14, 2, 'method1', 0, '1999-10-08', 'file_1_uiOW6.jpeg', 'file_2_8FhQF.jpeg', 'file_3_yHUi6.jpeg', 'file_4_PaD4I.jpeg', 'desciption', 1, NULL, '2022-01-10 15:38:14', NULL, '2020-21', NULL, 1, NULL),
(15, 4, 'method1', 1, '1999-10-08', 'file_1_FpcIs.jpeg', 'file_2_YklnX.jpeg', 'file_3_4kpVS.jpeg', 'file_4_QU9hU.jpeg', 'desciption', 1, NULL, '2022-01-10 16:13:49', NULL, '2019-20', NULL, 1, NULL),
(16, 4, 'method1', 1, '1999-10-08', 'file_1_OMdUU.jpeg', 'file_2_uAnvj.jpeg', 'file_3_bbm3E.jpeg', 'file_4_bEWm2.jpeg', 'desciption', 1, NULL, '2022-01-10 16:13:50', NULL, '2019-20', NULL, 1, NULL),
(17, 4, 'method1', 5, '1999-10-08', 'file_1_wQlGO.jpeg', 'file_2_ZdNu2.jpeg', 'file_3_oUyHe.jpeg', 'file_4_yD8CN.jpeg', 'desciption', 1, NULL, '2022-01-11 10:54:36', '2022-01-11 19:11:50', '2019-20', NULL, 1, '2022-01-11 19:11:50'),
(18, 4, 'method1', 1, '1999-10-08', 'file_1_Ihp93.jpeg', 'file_2_dMf3o.jpeg', 'file_3_1NmR0.jpeg', 'file_4_BmSbs.jpeg', 'desciption', 1, NULL, '2022-01-11 15:05:37', '2022-01-11 15:06:59', '2019-20', NULL, 1, '2022-01-11 15:06:59'),
(19, 4, 'method1', 1, '1999-10-08', NULL, NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-11 19:01:34', '2022-01-11 19:12:00', '2019-20', NULL, 1, '2022-01-11 19:12:00'),
(20, 4, 'method2', 2, '1999-10-08', NULL, NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-11 19:02:30', NULL, '2019-20', NULL, 1, NULL),
(21, 4, 'method1', 1, '1999-10-08', 'file_1_364gr.jpeg', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-11 19:03:19', NULL, '2019-20', NULL, 1, NULL),
(22, 4, 'method2', 2, '1999-10-08', 'file_1_s1wtn.png', NULL, NULL, NULL, 'desciption', 1, NULL, '2022-01-11 19:03:26', NULL, '2019-20', NULL, 1, NULL),
(23, 4, 'Assay Method', 1, '2022-01-12', NULL, NULL, NULL, NULL, '<p><span class=\"ql-formula\" data-value=\"e=pi/2\">﻿<span contenteditable=\"false\"><span class=\"katex\"><span class=\"katex-mathml\"><math xmlns=\"http://www.w3.org/1998/Math/MathML\"><semantics><mrow><mi>e</mi><mo>=</mo><mi>p</mi><mi>i</mi><mi mathvariant=\"normal\">/</mi><mn>2</mn></mrow><annotation encoding=\"application/x-tex\">e=pi/2</annotation></semantics></math></span><span class=\"katex-html\" aria-hidden=\"true\"><span class=\"base\"><span class=\"strut\" style=\"height: 0.4306em;\"></span><span class=\"mord mathnormal\">e</span><span class=\"mspace\" style=\"margin-right: 0.2778em;\"></span><span class=\"mrel\">=</span><span class=\"mspace\" style=\"margin-right: 0.2778em;\"></span></span><span class=\"base\"><span class=\"strut\" style=\"height: 1em; vertical-align: -0.25em;\"></span><span class=\"mord mathnormal\">p</span><span class=\"mord mathnormal\">i</span><span class=\"mord\">/2</span></span></span></span></span>﻿</span>﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2﻿e=pi/2</p><p>e=pi/2</p>', 1, 1, '2022-01-12 18:47:39', '2022-01-13 17:38:49', '2019-20', NULL, 1, NULL);

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
('1', '+93', 'Afghanistan', 'AF', 1),
('2', '+355', 'Albania', 'AL', 1),
('3', '+213', 'Algeria', 'DZ', 1),
('4', '+1684', 'American Samoa', 'AS', 1),
('5', '+376', 'Andorra', 'AD', 1),
('6', '+244', 'Angola', 'AO', 1),
('7', '+1264', 'Anguilla', 'AI', 1),
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
('35', '+1345', 'Cayman Islands', 'KY', 1),
('36', '+236', 'Central African Republic', 'CF', 1),
('37', '+235', 'Chad', 'TD', 1),
('38', '+56', 'Chile', 'CL', 1),
('39', '+86', 'China', 'CN', 1),
('40', '+57', 'Colombia', 'CO', 1),
('41', '+269', 'Comoros', 'KM', 1),
('42', '+242', 'Congo (DRC)', 'CD', 1),
('43', '+242', 'Congo', 'CG', 1),
('44', '+682', 'Cook Islands', 'CK', 1),
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
('63', '+500', 'Falkland Islands (Malvinas)', 'FK', 1),
('64', '+298', 'Faroe Islands', 'FO', 1),
('65', '+679', 'Fiji', 'FJ', 1),
('66', '+358', 'Finland', 'FI', 1),
('67', '+33', 'France', 'FR', 1),
('68', '+241', 'Gabon', 'GA', 1),
('69', '+220', 'Gambia', 'GM', 1),
('70', '+995', 'Georgia', 'GE', 1),
('71', '+49', 'Germany', 'DE', 1),
('72', '+233', 'Ghana', 'GH', 1),
('73', '+350', 'Gibraltar', 'GI', 1),
('74', '+30', 'Greece', 'GR', 1),
('75', '+299', 'Greenland', 'GL', 1),
('76', '+1473', 'Grenada', 'GD', 1),
('77', '+590', 'Guadeloupe', 'GP', 1),
('78', '+1671', 'Guam', 'GU', 1),
('79', '+502', 'Guatemala', 'GT', 1),
('80', '+224', 'Guinea', 'GN', 1),
('81', '+245', 'Guinea-Bissau', 'GW', 1),
('82', '+592', 'Guyana', 'GY', 1),
('83', '+509', 'Haiti', 'HT', 1),
('84', '+39', 'Holy See (Vatican City State)', 'VA', 1),
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
('115', '+853', 'Macao', 'MO', 1),
('116', '+389', 'Macedonia', 'MK', 1),
('117', '+261', 'Madagascar', 'MG', 1),
('118', '+265', 'Malawi', 'MW', 1),
('119', '+60', 'Malaysia', 'MY', 1),
('120', '+960', 'Maldives', 'MV', 1),
('121', '+223', 'Mali', 'ML', 1),
('122', '+356', 'Malta', 'MT', 1),
('123', '+596', 'Martinique', 'MQ', 1),
('124', '+222', 'Mauritania', 'MR', 1),
('125', '+230', 'Mauritius', 'MU', 1),
('126', '+269', 'Mayotte', 'YT', 1),
('127', '+52', 'Mexico', 'MX', 1),
('128', '+691', 'Micronesia', 'FM', 1),
('129', '+373', 'Moldova', 'MD', 1),
('130', '+377', 'Monaco', 'MC', 1),
('131', '+976', 'Mongolia', 'MN', 1),
('132', '+1664', 'Montserrat', 'MS', 1),
('133', '+212', 'Morocco', 'MA', 1),
('134', '+258', 'Mozambique', 'MZ', 1),
('135', '+95', 'Myanmar', 'MM', 1),
('136', '+264', 'Namibia', 'NA', 1),
('137', '+674', 'Nauru', 'NR', 1),
('138', '+977', 'Nepal', 'NP', 1),
('139', '+31', 'Netherlands', 'NL', 1),
('140', '+599', 'Netherlands Antilles', 'AN', 1),
('141', '+687', 'New Caledonia', 'NC', 1),
('142', '+64', 'New Zealand', 'NZ', 1),
('143', '+505', 'Nicaragua', 'NI', 1),
('144', '+227', 'Niger', 'NE', 1),
('145', '+234', 'Nigeria', 'NG', 1),
('146', '+683', 'Niue', 'NU', 1),
('147', '+672', 'Norfolk Island', 'NF', 1),
('148', '+47', 'Norway', 'NO', 1),
('149', '+968', 'Oman', 'OM', 1),
('150', '+92', 'Pakistan', 'PK', 1),
('151', '+507', 'Panama', 'PA', 1),
('152', '+675', 'Papua New Guinea', 'PG', 1),
('153', '+595', 'Paraguay', 'PY', 1),
('154', '+51', 'Peru', 'PE', 1),
('155', '+63', 'Philippines', 'PH', 1),
('156', '+0', 'Pitcairn Islands', 'PN', 1),
('157', '+48', 'Poland', 'PL', 1),
('158', '+351', 'Portugal', 'PT', 1),
('159', '+1787', 'Puerto Rico', 'PR', 1),
('160', '+974', 'Qatar', 'QA', 1),
('161', '+262', 'Reunion', 'RE', 1),
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
('181', '+290', 'St. Helena', 'SH', 1),
('182', '+1869', 'St. Kitts & Nevis', 'KN', 1),
('183', '+1758', 'St. Lucia', 'LC', 1),
('184', '+508', 'St. Pierre and Miquelon', 'PM', 1),
('185', '+1784', 'St. Vincent & Grenadines', 'VC', 1),
('186', '+249', 'Sudan', 'SD', 1),
('187', '+597', 'Suriname', 'SR', 1),
('188', '+268', 'Swaziland', 'SZ', 1),
('189', '+46', 'Sweden', 'SE', 1),
('190', '+41', 'Switzerland', 'CH', 1),
('191', '+963', 'Syria', 'SY', 1),
('192', '+886', 'Taiwan', 'TW', 1),
('193', '+992', 'Tajikistan', 'TJ', 1),
('194', '+255', 'Tanzania', 'TZ', 1),
('195', '+66', 'Thailand', 'TH', 1),
('196', '+228', 'Togo', 'TG', 1),
('197', '+690', 'Tokelau', 'TK', 1),
('198', '+676', 'Tonga', 'TO', 1),
('199', '+1868', 'Trinidad and Tobago', 'TT', 1),
('200', '+216', 'Tunisia', 'TN', 1),
('201', '+90', 'Turkey', 'TR', 1),
('202', '+7370', 'Turkmenistan', 'TM', 1),
('203', '+1649', 'Turks and Caicos Islands', 'TC', 1),
('204', '+688', 'Tuvalu', 'TV', 1),
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
('217', '+681', 'Wallis and Futuna', 'WF', 1),
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
  `company_cst_no` varchar(100) DEFAULT NULL,
  `company_vat_no` varchar(100) DEFAULT NULL,
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

INSERT INTO `mst_customers` (`id`, `mst_companies_id`, `company_name`, `gst_number`, `contact_person_name`, `tally_alias_name`, `user_name`, `password`, `birth_date`, `contact_type`, `priority`, `notes`, `logo`, `education_details`, `prev_details`, `company_tin_no`, `company_service_tax_no`, `company_cust_discount`, `company_cst_no`, `company_vat_no`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 4, 'Reliance Formulation Pvt Ltd.', '24AABCR3233L1ZI', 'kushal', NULL, 'qcreliancepharma@gmail.com', '$2y$10$0fECFjhpAByskh5haH4HK.4Xu8BTx88cSEVM3n7GVSYn6Q5aUaZ.a', NULL, 'Customer', 'High', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 150, '2021-12-15 11:07:56', '2021-12-23 14:57:51', '2019-20', NULL, 0, NULL),
(2, 4, 'Reliance', NULL, NULL, NULL, NULL, NULL, NULL, 'Manufacturer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-15 11:12:12', NULL, '2019-20', NULL, 1, NULL),
(3, 4, 'Reliance', NULL, NULL, NULL, NULL, NULL, NULL, 'Supplier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-15 11:12:12', NULL, '2019-20', NULL, 1, NULL),
(4, 4, 'Divine Infosys', NULL, 'Vishal Kotak', 'Bhavesh Gajjar', 'wordpress.divine@gmail.com', '$2y$10$bTDQSZW2my.A7NDThk7NaONMebSIUOKPrJWFj67oKAeJ4NdUq8Ap2', '2016-09-14', 'Service Provider', 'High', 'We believe design is the essence of any website that showcases the core strength of the business and reaches out to innumerable people.', '20211215154052.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '900700000', '1234567890', '5', NULL, NULL, 3, NULL, '2021-12-15 15:40:52', NULL, '2019-20', NULL, 1, NULL),
(5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Manufacturer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-16 14:29:26', NULL, '2019-20', NULL, 1, NULL),
(6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Supplier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-12-16 14:29:26', NULL, '2019-20', NULL, 1, NULL),
(7, 4, 'Test Company', '18AABCU9603R1ZM', 'test company name', 'test@test', 'testcompany123', 'VGVzdCFAIzEyMzQ=', NULL, 'Customer', 'High', NULL, NULL, NULL, NULL, NULL, 'dfgfd', '6', 'QWET1234', '1234568', 1, 1, '2022-01-07 16:14:44', '2022-01-10 17:44:31', '2019-20', NULL, 1, NULL),
(8, 4, 'test', '10AABCU9603R1Z2', NULL, NULL, 'test123', 'VGVzdCFAIzEyMzQ1Ng==', NULL, 'Customer', 'High', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2022-01-07 18:45:39', '2022-01-10 17:56:12', '2019-20', NULL, 1, NULL),
(9, 4, 'test123', '18AABCU9603R1ZM', NULL, NULL, 'jayshah123', 'VGVzdEAxMjM0', NULL, 'Customer', 'High', NULL, '20220110172357.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-01-10 17:14:00', '2022-01-10 17:14:41', '2019-20', NULL, 1, '2022-01-10 17:14:41'),
(10, 4, 'Test Company', '18AABCU9603R1ZM', NULL, NULL, 'abc@xyz', 'VGVzdEAxMjM0NQ==', NULL, 'Customer', 'High', NULL, '20220110175657.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2022-01-10 17:43:47', '2022-01-10 17:56:57', '2019-20', NULL, 1, NULL);

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
(4, 4, 'Palladium, 511-512, Corporate Rd, Makarba, Ahmedabad, Gujarat 380051', 'Weybridge Brooklands Business Park, Wellington Way', 'Makarba', '380015', 'Warwickshire', 12, 102, NULL, '', 'wordpress.divine@gmail.com', NULL, '20211215154052.png', 2, '9408072555', NULL, 'wordpress.divine@gmail.com', 3, 3, '2021-12-15 15:40:52', '2021-12-15 15:40:52', NULL),
(5, 7, '', '', '', '', '', 193, 0, '', NULL, NULL, '', NULL, 1, '', '', '', 1, 1, '2022-01-07 16:14:44', '2022-01-10 17:44:31', NULL),
(6, 7, 'undefined', '', '', '', '', 124, 0, NULL, '', '', NULL, '20220110143654.pdf', 2, '', NULL, '', 1, 1, '2022-01-07 16:14:44', '2022-01-10 17:44:31', NULL),
(7, 8, '', '', '', '', '', 125, 15, '', NULL, NULL, '', NULL, 1, '', '', '', 1, 1, '2022-01-07 18:45:39', '2022-01-10 17:56:12', NULL),
(8, 8, 'undefined', '', '', '', '', 287, 15, NULL, '', '', NULL, NULL, 2, '', NULL, '', 1, 1, '2022-01-07 18:45:39', '2022-01-10 17:56:12', NULL),
(9, 9, '', '', '', '', '', 160, 0, '', NULL, NULL, '', NULL, 1, '', '', '', 1, 1, '2022-01-10 17:14:00', '2022-01-10 17:14:41', '2022-01-10 17:14:41'),
(10, 9, '', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 1, 1, '2022-01-10 17:14:00', '2022-01-10 17:14:41', '2022-01-10 17:14:41'),
(11, 10, '', '', '', '', '', 12, 1, '', NULL, NULL, '', NULL, 1, '1234567890', '', '', 1, 1, '2022-01-10 17:43:47', '2022-01-11 11:41:19', NULL),
(12, 10, 'undefined', '', '', '', '', 0, 0, NULL, '', '', NULL, '20220111111910.jpg', 2, '1234567855', NULL, '', 1, 1, '2022-01-10 17:43:47', '2022-01-11 11:41:19', NULL);

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
(1, 4, 'IP', 1, 2019, '1', '2019-20', NULL, 1, 3, NULL, NULL, '2021-12-15 11:10:12', '2021-12-15 11:10:12'),
(2, 4, 'IHS', 1, 1111, 'test', '2019-20', NULL, 1, 1, NULL, NULL, '2022-01-11 18:44:51', '2022-01-11 13:16:27');

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
  `generic_product_name` varchar(255) DEFAULT NULL,
  `packing_detail` varchar(255) DEFAULT NULL,
  `sample_description` text DEFAULT NULL,
  `hsn_Code` varchar(55) DEFAULT NULL,
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

INSERT INTO `mst_products` (`id`, `mst_companies_id`, `product_name`, `product_generic`, `marker_specification`, `pharmacopeia_id`, `generic_product_name`, `packing_detail`, `sample_description`, `hsn_Code`, `selected_year`, `copied_from_year`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'Acenol Tablet', 'Finished Product', 'IHS', 1, '0', '', 'White to almost white tablet', '', '2019-20', NULL, 1, 3, 3, '2021-12-15 11:00:05', '2021-12-16 13:01:32', NULL),
(2, 4, 'Paracitamol Tablet', 'Finished Product', '', 1, '0', '', 'sample description for paracitamol tablet', '', '2019-20', NULL, 1, 3, 3, '2021-12-16 14:41:01', '2021-12-16 18:36:26', NULL),
(3, 4, 'NEW PRODUCT1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-20', NULL, 1, 1, NULL, '2021-12-16 15:00:50', NULL, NULL),
(4, 4, 'Viksss', 'Raw Metriall', 'motion sicknesss', 5, '3', 'Shipped', 'motion sickness', '342356', '2019-20', NULL, 1, 1, NULL, '2021-12-16 15:00:50', NULL, NULL),
(5, 4, 'Viksss', 'Raw Metriall', 'motion sicknesss', 5, '3', 'Shipped', 'motion sickness', '342356', '2019-20', NULL, 1, 1, NULL, '2021-12-16 15:01:04', NULL, NULL);

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

--
-- Dumping data for table `mst_states`
--

INSERT INTO `mst_states` (`id`, `state_name`, `mst_countries_id`, `is_active`) VALUES
('1', 'Badakhshan', '1', 1),
('2', 'Badghis', '1', 1),
('3', 'Baghlan', '1', 1),
('4', 'Balkh', '1', 1),
('5', 'Bamian', '1', 1),
('6', 'Daykondi', '1', 1),
('7', 'Farah', '1', 1),
('8', 'Faryab', '1', 1),
('9', 'Ghazni', '1', 1),
('10', 'Ghowr', '1', 1),
('11', 'Helmand', '1', 1),
('12', 'Herat', '1', 1),
('13', 'Jowzjan', '1', 1),
('14', 'Kabul', '1', 1),
('15', 'Kandahar', '1', 1),
('16', 'Kapisa', '1', 1),
('17', 'Khost', '1', 1),
('18', 'Konar', '1', 1),
('19', 'Kondoz', '1', 1),
('20', 'Laghman', '1', 1),
('21', 'Lowgar', '1', 1),
('22', 'Nangarhar', '1', 1),
('23', 'Nimruz', '1', 1),
('24', 'Nurestan', '1', 1),
('25', 'Oruzgan', '1', 1),
('26', 'Paktia', '1', 1),
('27', 'Paktika', '1', 1),
('28', 'Panjshir', '1', 1),
('29', 'Parvan', '1', 1),
('30', 'Samangan', '1', 1),
('31', 'Sar-e Pol', '1', 1),
('32', 'Takhar', '1', 1),
('33', 'Vardak', '1', 1),
('34', 'Zabol', '1', 1),
('35', 'Berat', '2', 1),
('36', 'Dibres', '2', 1),
('37', 'Durres', '2', 1),
('38', 'Elbasan', '2', 1),
('39', 'Fier', '2', 1),
('40', 'Gjirokastre', '2', 1),
('41', 'Korce', '2', 1),
('42', 'Kukes', '2', 1),
('43', 'Lezhe', '2', 1),
('44', 'Shkoder', '2', 1),
('45', 'Tirane', '2', 1),
('46', 'Vlore', '2', 1),
('47', 'Adrar', '3', 1),
('48', 'Ain Defla', '3', 1),
('49', 'Ain Temouchent', '3', 1),
('50', 'Alger', '3', 1),
('51', 'Annaba', '3', 1),
('52', 'Batna', '3', 1),
('53', 'Bechar', '3', 1),
('54', 'Bejaia', '3', 1),
('55', 'Biskra', '3', 1),
('56', 'Blida', '3', 1),
('57', 'Bordj Bou Arreridj', '3', 1),
('58', 'Bouira', '3', 1),
('59', 'Boumerdes', '3', 1),
('60', 'Chlef', '3', 1),
('61', 'Constantine', '3', 1),
('62', 'Djelfa', '3', 1),
('63', 'El Bayadh', '3', 1),
('64', 'El Oued', '3', 1),
('65', 'El Tarf', '3', 1),
('66', 'Ghardaia', '3', 1),
('67', 'Guelma', '3', 1),
('68', 'Illizi', '3', 1),
('69', 'Jijel', '3', 1),
('70', 'Khenchela', '3', 1),
('71', 'Laghouat', '3', 1),
('72', 'Muaskar', '3', 1),
('73', 'Medea', '3', 1),
('74', 'Mila', '3', 1),
('75', 'Mostaganem', '3', 1),
('76', 'M\'Sila', '3', 1),
('77', 'Naama', '3', 1),
('78', 'Oran', '3', 1),
('79', 'Ouargla', '3', 1),
('80', 'Oum el Bouaghi', '3', 1),
('81', 'Relizane', '3', 1),
('82', 'Saida', '3', 1),
('83', 'Setif', '3', 1),
('84', 'Sidi Bel Abbes', '3', 1),
('85', 'Skikda', '3', 1),
('86', 'Souk Ahras', '3', 1),
('87', 'Tamanghasset', '3', 1),
('88', 'Tebessa', '3', 1),
('89', 'Tiaret', '3', 1),
('90', 'Tindouf', '3', 1),
('91', 'Tipaza', '3', 1),
('92', 'Tissemsilt', '3', 1),
('93', 'Tizi Ouzou', '3', 1),
('94', 'Tlemcen', '3', 1),
('95', 'Tutuila', '4', 1),
('96', 'Other', '4', 1),
('97', 'Other', '5', 1),
('98', 'Bengo', '6', 1),
('99', 'Benguela', '6', 1),
('100', 'Bie', '6', 1),
('101', 'Cabinda', '6', 1),
('102', 'Cuando Cubango', '6', 1),
('103', 'Cuanza Norte', '6', 1),
('104', 'Cuanza Sul', '6', 1),
('105', 'Cunene', '6', 1),
('106', 'Huambo', '6', 1),
('107', 'Huila', '6', 1),
('108', 'Luanda', '6', 1),
('109', 'Lunda Norte', '6', 1),
('110', 'Lunda Sul', '6', 1),
('111', 'Malanje', '6', 1),
('112', 'Moxico', '6', 1),
('113', 'Namibe', '6', 1),
('114', 'Uige', '6', 1),
('115', 'Zaire', '6', 1),
('116', 'Other', '6', 1),
('117', 'Anguilla (General)', '7', 1),
('118', 'Lesser Antilles', '7', 1),
('119', 'Other', '7', 1),
('120', 'Barbuda', '8', 1),
('121', 'Redonda', '8', 1),
('122', 'Saint George', '8', 1),
('123', 'Saint John', '8', 1),
('124', 'Saint Mary', '8', 1),
('125', 'Saint Paul', '8', 1),
('126', 'Saint Peter', '8', 1),
('127', 'Saint Philip', '8', 1),
('128', 'Other', '8', 1),
('129', 'Buenos Aires', '9', 1),
('130', 'Buenos Aires Capital', '9', 1),
('131', 'Catamarca', '9', 1),
('132', 'Chaco', '9', 1),
('133', 'Chubut', '9', 1),
('134', 'Cordoba', '9', 1),
('135', 'Corrientes', '9', 1),
('136', 'Entre Rios', '9', 1),
('137', 'Formosa', '9', 1),
('138', 'Jujuy', '9', 1),
('139', 'La Pampa', '9', 1),
('140', 'La Rioja', '9', 1),
('141', 'Mendoza', '9', 1),
('142', 'Misiones', '9', 1),
('143', 'Neuquen', '9', 1),
('144', 'Rio Negro', '9', 1),
('145', 'Salta', '9', 1),
('146', 'San Juan', '9', 1),
('147', 'San Luis', '9', 1),
('148', 'Santa Cruz', '9', 1),
('149', 'Santa Fe', '9', 1),
('150', 'Santiago del Estero', '9', 1),
('151', 'Tierra del Fuego', '9', 1),
('152', 'Tucuman', '9', 1),
('153', 'Other', '9', 1),
('154', 'Aragatsotn', '10', 1),
('155', 'Ararat', '10', 1),
('156', 'Armavir', '10', 1),
('157', 'Geghark\'unik\'', '10', 1),
('158', 'Kotayk\'', '10', 1),
('159', 'Lorri', '10', 1),
('160', 'Shirak', '10', 1),
('161', 'Syunik\'', '10', 1),
('162', 'Tavush', '10', 1),
('163', 'Vayots\' Dzor', '10', 1),
('164', 'Yerevan', '10', 1),
('165', 'Other', '10', 1),
('166', 'Australian Capital Territory', '11', 1),
('167', 'Jervis Bay Territory', '11', 1),
('168', 'New South Wales', '11', 1),
('169', 'Northern Territory', '11', 1),
('170', 'Queensland', '11', 1),
('171', 'South Australia', '11', 1),
('172', 'Tasmania', '11', 1),
('173', 'Victoria', '11', 1),
('174', 'Western Australia', '11', 1),
('175', 'Other', '11', 1),
('176', 'Burgenland', '12', 1),
('177', 'Kaernten', '12', 1),
('178', 'Niederoesterreich', '12', 1),
('179', 'Oberoesterreich', '12', 1),
('180', 'Salzburg', '12', 1),
('181', 'Steiermark', '12', 1),
('182', 'Tirol', '12', 1),
('183', 'Vorarlberg', '12', 1),
('184', 'Wien', '12', 1),
('185', 'Other', '12', 1),
('186', 'Abseron Rayonu', '13', 1),
('187', 'Agcabadi Rayonu', '13', 1),
('188', 'Agdam Rayonu', '13', 1),
('189', 'Agdas Rayonu', '13', 1),
('190', 'Agstafa Rayonu', '13', 1),
('191', 'Agsu Rayonu', '13', 1),
('192', 'Astara Rayonu', '13', 1),
('193', 'Balakan Rayonu', '13', 1),
('194', 'Barda Rayonu', '13', 1),
('195', 'Beylaqan Rayonu', '13', 1),
('196', 'Bilasuvar Rayonu', '13', 1),
('197', 'Cabrayil Rayonu', '13', 1),
('198', 'Calilabad Rayonu', '13', 1),
('199', 'Daskasan Rayonu', '13', 1),
('200', 'Davaci Rayonu', '13', 1),
('201', 'Fuzuli Rayonu', '13', 1),
('202', 'Gadabay Rayonu', '13', 1),
('203', 'Goranboy Rayonu', '13', 1),
('204', 'Goycay Rayonu', '13', 1),
('205', 'Haciqabul Rayonu', '13', 1),
('206', 'Imisli Rayonu', '13', 1),
('207', 'Ismayilli Rayonu', '13', 1),
('208', 'Kalbacar Rayonu', '13', 1),
('209', 'Kurdamir Rayonu', '13', 1),
('210', 'Lacin Rayonu', '13', 1),
('211', 'Lankaran Rayonu', '13', 1),
('212', 'Lerik Rayonu', '13', 1),
('213', 'Masalli Rayonu', '13', 1),
('214', 'Neftcala Rayonu', '13', 1),
('215', 'Oguz Rayonu', '13', 1),
('216', 'Qabala Rayonu', '13', 1),
('217', 'Qax Rayonu', '13', 1),
('218', 'Qazax Rayonu', '13', 1),
('219', 'Qobustan Rayonu', '13', 1),
('220', 'Quba Rayonu', '13', 1),
('221', 'Qubadli Rayonu', '13', 1),
('222', 'Qusar Rayonu', '13', 1),
('223', 'Saatli Rayonu', '13', 1),
('224', 'Sabirabad Rayonu', '13', 1),
('225', 'Saki Rayonu', '13', 1),
('226', 'Salyan Rayonu', '13', 1),
('227', 'Samaxi Rayonu', '13', 1),
('228', 'Samkir Rayonu', '13', 1),
('229', 'Samux Rayonu', '13', 1),
('230', 'Siyazan Rayonu', '13', 1),
('231', 'Susa Rayonu', '13', 1),
('232', 'Tartar Rayonu', '13', 1),
('233', 'Tovuz Rayonu', '13', 1),
('234', 'Ucar Rayonu', '13', 1),
('235', 'Xacmaz Rayonu', '13', 1),
('236', 'Xanlar Rayonu', '13', 1),
('237', 'Xizi Rayonu', '13', 1),
('238', 'Xocali Rayonu', '13', 1),
('239', 'Xocavand Rayonu', '13', 1),
('240', 'Yardimli Rayonu', '13', 1),
('241', 'Yevlax Rayonu', '13', 1),
('242', 'Zangilan Rayonu', '13', 1),
('243', 'Zaqatala Rayonu', '13', 1),
('244', 'Zardab Rayonu', '13', 1),
('245', 'Ali Bayramli Sahari', '13', 1),
('246', 'Baki Sahari', '13', 1),
('247', 'Ganca Sahari', '13', 1),
('248', 'Lankaran Sahari', '13', 1),
('249', 'Mingacevir Sahari', '13', 1),
('250', 'Naftalan Sahari', '13', 1),
('251', 'Saki Sahari', '13', 1),
('252', 'Sumqayit Sahari', '13', 1),
('253', 'Susa Sahari', '13', 1),
('254', 'Xankandi Sahari', '13', 1),
('255', 'Yevlax Sahari', '13', 1),
('256', 'Naxcivan Muxtar', '13', 1),
('257', 'Other', '13', 1),
('258', 'Acklins and Crooked Islands', '14', 1),
('259', 'Bimini', '14', 1),
('260', 'Cat Island', '14', 1),
('261', 'Exuma', '14', 1),
('262', 'Freeport', '14', 1),
('263', 'Fresh Creek', '14', 1),
('264', 'Governor\'s Harbour', '14', 1),
('265', 'Green Turtle Cay', '14', 1),
('266', 'Harbour Island', '14', 1),
('267', 'High Rock', '14', 1),
('268', 'Inagua', '14', 1),
('269', 'Kemps Bay', '14', 1),
('270', 'Long Island', '14', 1),
('271', 'Marsh Harbour', '14', 1),
('272', 'Mayaguana', '14', 1),
('273', 'New Providence', '14', 1),
('274', 'Nichollstown and Berry Islands', '14', 1),
('275', 'Ragged Island', '14', 1),
('276', 'Rock Sound', '14', 1),
('277', 'Sandy Point', '14', 1),
('278', 'San Salvador and Rum Cay', '14', 1),
('279', 'Other', '14', 1),
('280', 'Al Hadd', '15', 1),
('281', 'Al Manamah', '15', 1),
('282', 'Al Mintaqah al Gharbiyah', '15', 1),
('283', 'Al Mintaqah al Wusta', '15', 1),
('284', 'Al Mintaqah ash Shamaliyah', '15', 1),
('285', 'Al Muharraq', '15', 1),
('286', 'Ar Rifa\' wa al Mintaqah al Janubiyah', '15', 1),
('287', 'Jidd Hafs', '15', 1),
('288', 'Madinat Hamad', '15', 1),
('289', 'Madinat \'Isa', '15', 1),
('290', 'Juzur Hawar', '15', 1),
('291', 'Sitrah', '15', 1),
('292', 'Other', '15', 1),
('293', 'Barisal', '16', 1),
('294', 'Chittagong', '16', 1),
('295', 'Dhaka', '16', 1),
('296', 'Khulna', '16', 1),
('297', 'Rajshahi', '16', 1),
('298', 'Sylhet', '16', 1),
('299', 'Other', '16', 1),
('300', 'Christ Church', '17', 1),
('301', 'Saint Andrew', '17', 1),
('302', 'Saint George', '17', 1),
('303', 'Saint James', '17', 1),
('304', 'Saint John', '17', 1),
('305', 'Saint Joseph', '17', 1),
('306', 'Saint Lucy', '17', 1),
('307', 'Saint Michael', '17', 1),
('308', 'Saint Peter', '17', 1),
('309', 'Saint Philip', '17', 1),
('310', 'Saint Thomas', '17', 1),
('311', 'Other', '17', 1),
('312', 'Brest', '18', 1),
('313', 'Homyel', '18', 1),
('314', 'Horad Minsk', '18', 1),
('315', 'Hrodna', '18', 1),
('316', 'Mahilyow', '18', 1),
('317', 'Minsk', '18', 1),
('318', 'Vitsyebsk', '18', 1),
('319', 'Other', '18', 1),
('320', 'Antwerpen', '19', 1),
('321', 'Brabant Wallon', '19', 1),
('322', 'Brussels', '19', 1),
('323', 'Flanders', '19', 1),
('324', 'Hainaut', '19', 1),
('325', 'Liege', '19', 1),
('326', 'Limburg', '19', 1),
('327', 'Luxembourg', '19', 1),
('328', 'Namur', '19', 1),
('329', 'Oost-Vlaanderen', '19', 1),
('330', 'Vlaams-Brabant', '19', 1),
('331', 'Wallonia', '19', 1),
('332', 'West-Vlaanderen', '19', 1),
('333', 'Other', '19', 1),
('334', 'Belize', '20', 1),
('335', 'Cayo', '20', 1),
('336', 'Corozal', '20', 1),
('337', 'Orange Walk', '20', 1),
('338', 'Stann Creek', '20', 1),
('339', 'Toledo', '20', 1),
('340', 'Other', '20', 1),
('341', 'Devonshire', '21', 1),
('342', 'Hamilton', '21', 1),
('343', 'Hamilton', '21', 1),
('344', 'Paget', '21', 1),
('345', 'Pembroke', '21', 1),
('346', 'Saint George', '21', 1),
('347', 'Saint George\'s', '21', 1),
('348', 'Sandys', '21', 1),
('349', 'Smith\'s', '21', 1),
('350', 'Southampton', '21', 1),
('351', 'Warwick', '21', 1),
('352', 'Other', '21', 1),
('353', 'Bumthang', '22', 1),
('354', 'Chukha', '22', 1),
('355', 'Dagana', '22', 1),
('356', 'Gasa', '22', 1),
('357', 'Haa', '22', 1),
('358', 'Lhuntse', '22', 1),
('359', 'Mongar', '22', 1),
('360', 'Paro', '22', 1),
('361', 'Pemagatshel', '22', 1),
('362', 'Punakha', '22', 1),
('363', 'Samdrup Jongkhar', '22', 1),
('364', 'Samtse', '22', 1),
('365', 'Sarpang', '22', 1),
('366', 'Thimphu', '22', 1),
('367', 'Trashigang', '22', 1),
('368', 'Trashiyangste', '22', 1),
('369', 'Trongsa', '22', 1),
('370', 'Tsirang', '22', 1),
('371', 'Wangdue Phodrang', '22', 1),
('372', 'Zhemgang', '22', 1),
('373', 'Other', '22', 1),
('374', 'Chuquisaca', '23', 1),
('375', 'Cochabamba', '23', 1),
('376', 'Beni', '23', 1),
('377', 'La Paz', '23', 1),
('378', 'Oruro', '23', 1),
('379', 'Pando', '23', 1),
('380', 'Potosi', '23', 1),
('381', 'Santa Cruz', '23', 1),
('382', 'Tarija', '23', 1),
('383', 'Other', '23', 1),
('384', 'Canton Sarajevo', '24', 1),
('385', 'Central Bosnia Canton', '24', 1),
('386', 'Herzegovina-Neretva Canton', '24', 1),
('387', 'Republika Srpska', '24', 1),
('388', 'Tuzla Canton', '24', 1),
('389', 'Una-Sana Canton', '24', 1),
('390', 'West Bosnia', '24', 1),
('391', 'West Bosnia Canton', '24', 1),
('392', 'Zenica-Doboj Canton', '24', 1),
('393', 'Other', '24', 1),
('394', 'Central', '25', 1),
('395', 'Ghanzi', '25', 1),
('396', 'Kgalagadi', '25', 1),
('397', 'Kgatleng', '25', 1),
('398', 'Kweneng', '25', 1),
('399', 'North East', '25', 1),
('400', 'North West', '25', 1),
('401', 'South East', '25', 1),
('402', 'Southern', '25', 1),
('403', 'Other', '25', 1),
('404', 'Acre', '26', 1),
('405', 'Alagoas', '26', 1),
('406', 'Amapa', '26', 1),
('407', 'Amazonas', '26', 1),
('408', 'Bahia', '26', 1),
('409', 'Ceara', '26', 1),
('410', 'Distrito Federal', '26', 1),
('411', 'Espirito Santo', '26', 1),
('412', 'Goias', '26', 1),
('413', 'Maranhao', '26', 1),
('414', 'Mato Grosso', '26', 1),
('415', 'Mato Grosso do Sul', '26', 1),
('416', 'Minas Gerais', '26', 1),
('417', 'Minas Gerais (MG)', '26', 1),
('418', 'Para', '26', 1),
('419', 'Paraiba', '26', 1),
('420', 'Parana', '26', 1),
('421', 'Pernambuco', '26', 1),
('422', 'Piaui', '26', 1),
('423', 'Rio de Janeiro', '26', 1),
('424', 'Rio de Janeiro (RJ)', '26', 1),
('425', 'Rio Grande do Norte', '26', 1),
('426', 'Rio Grande do Sul', '26', 1),
('427', 'Rio Grande do Sul (RS)', '26', 1),
('428', 'Rondonia', '26', 1),
('429', 'Roraima', '26', 1),
('430', 'Santa Catarina', '26', 1),
('431', 'Santa Catarina (SC)', '26', 1),
('432', 'Sao Paulo', '26', 1),
('433', 'Sao Paulo (SP)', '26', 1),
('434', 'Sergipe', '26', 1),
('435', 'Other', '26', 1),
('436', 'Belait', '27', 1),
('437', 'Brunei and Muara', '27', 1),
('438', 'Temburong', '27', 1),
('439', 'Tutong', '27', 1),
('440', 'Other', '27', 1),
('441', 'Burgas Province', '28', 1),
('442', 'Grad Sofiya', '28', 1),
('443', 'Khaskovo', '28', 1),
('444', 'Oblast Pleven', '28', 1),
('445', 'Oblast Sliven', '28', 1),
('446', 'Plovdiv', '28', 1),
('447', 'Ruse', '28', 1),
('448', 'Varna', '28', 1),
('449', 'Other', '28', 1),
('450', 'Kadiogo', '29', 1),
('451', 'Other', '29', 1),
('452', 'Burundi', '30', 1),
('453', 'Other', '30', 1),
('454', 'Phnum Penh', '31', 1),
('455', 'Other', '31', 1),
('456', 'Centre', '32', 1),
('457', 'Cote', '32', 1),
('458', 'Nord Extreme', '32', 1),
('459', 'Other', '32', 1),
('460', 'Alberta', '33', 1),
('461', 'British Columbia', '33', 1),
('462', 'Manitoba', '33', 1),
('463', 'Ontario', '33', 1),
('464', 'Quebec', '33', 1),
('465', 'Alberta', '33', 1),
('466', 'British Columbia', '33', 1),
('467', 'Manitoba', '33', 1),
('468', 'New Brunswick', '33', 1),
('469', 'Newfoundland and Labrador', '33', 1),
('470', 'Northwest Territories', '33', 1),
('471', 'Nova Scotia', '33', 1),
('472', 'Nunavut', '33', 1),
('473', 'Ontario', '33', 1),
('474', 'Prince Edward Island', '33', 1),
('475', 'Quebec', '33', 1),
('476', 'Saskatchewan', '33', 1),
('477', 'Yukon', '33', 1),
('478', 'Other', '33', 1),
('479', 'Praia', '34', 1),
('480', 'Other', '34', 1),
('481', 'Other', '35', 1),
('482', 'Bangui', '36', 1),
('483', 'Other', '36', 1),
('484', 'Chari-Baguirmi', '37', 1),
('485', 'Other', '37', 1),
('486', 'Antofagasta', '38', 1),
('487', 'Araucania', '38', 1),
('488', 'Biobio', '38', 1),
('489', 'Coquimbo', '38', 1),
('490', 'General Bernardo O\'Higgins', '38', 1),
('491', 'Los Lagos', '38', 1),
('492', 'Magallanes y Antartica', '38', 1),
('493', 'Maule', '38', 1),
('494', 'Region Metropolitana', '38', 1),
('495', 'Tarapaca', '38', 1),
('496', 'Valparaiso', '38', 1),
('497', 'Other', '38', 1),
('498', 'Anhui', '39', 1),
('499', 'Anhui (Anhwei)', '39', 1),
('500', 'Beijing Shi (Peking)', '39', 1),
('501', 'Fujian', '39', 1),
('502', 'Fujian (Fukien)', '39', 1),
('503', 'Gansu', '39', 1),
('504', 'Gansu (Kansu)', '39', 1),
('505', 'Guangdong', '39', 1),
('506', 'Guangdong (Kwangtung)', '39', 1),
('507', 'Guangdong Sheng', '39', 1),
('508', 'Guangxi Zhuangzu Zizhiqu (Kwangsi Chu)', '39', 1),
('509', 'Guizhou (Kweichow)', '39', 1),
('510', 'Hebei', '39', 1),
('511', 'Hebei (Hopeh)', '39', 1),
('512', 'Heilongjiang', '39', 1),
('513', 'Heilongjiang (Heilungkiang)', '39', 1),
('514', 'Henan (Honan)', '39', 1),
('515', 'Hubei', '39', 1),
('516', 'Hubei (Hupei)', '39', 1),
('517', 'Hunan', '39', 1),
('518', 'Jiangsu', '39', 1),
('519', 'Jiangsu (Kiangsu)', '39', 1),
('520', 'Jiangxi', '39', 1),
('521', 'Jiangxi (Kiangsi)', '39', 1),
('522', 'Jilin (Kirin)', '39', 1),
('523', 'Liaoning', '39', 1),
('524', 'Nei Menggu Autonomous Region', '39', 1),
('525', 'Nei Mongol Zizhiqu (Inner Mongolia)', '39', 1),
('526', 'Ningxia Huizu Zizhiqu (Nigsia Hui)', '39', 1),
('527', 'Qinghai (Tsinghai)', '39', 1),
('528', 'Shaanxi', '39', 1),
('529', 'Shaanxi (Shensi)', '39', 1),
('530', 'Shandong', '39', 1),
('531', 'Shandong (Shantung)', '39', 1),
('532', 'Shanghai Shi (Shanghai)', '39', 1),
('533', 'Shanxi', '39', 1),
('534', 'Shanxi (Shansi)', '39', 1),
('535', 'Sichuan', '39', 1),
('536', 'Sichuan (Szechwan)', '39', 1),
('537', 'Taiwan', '39', 1),
('538', 'Tianjin Shi (Tientsin)', '39', 1),
('539', 'Xinjiang', '39', 1),
('540', 'Yunnan', '39', 1),
('541', 'Zhejiang', '39', 1),
('542', 'Zhejiang (Chekiang)', '39', 1),
('543', 'Other', '39', 1),
('544', 'Amazonas', '40', 1),
('545', 'Antioquia', '40', 1),
('546', 'Arauca', '40', 1),
('547', 'Atlantico', '40', 1),
('548', 'Bolivar', '40', 1),
('549', 'Boyaca', '40', 1),
('550', 'Caldas', '40', 1),
('551', 'Caqueta', '40', 1),
('552', 'Casanare', '40', 1),
('553', 'Cauca', '40', 1),
('554', 'Cesar', '40', 1),
('555', 'Choco', '40', 1),
('556', 'Cordoba', '40', 1),
('557', 'Cundinamarca', '40', 1),
('558', 'Distrito Especial', '40', 1),
('559', 'Guainia', '40', 1),
('560', 'Guajira', '40', 1),
('561', 'Guaviare', '40', 1),
('562', 'Huila', '40', 1),
('563', 'La Guajira', '40', 1),
('564', 'Magdalena', '40', 1),
('565', 'Meta', '40', 1),
('566', 'Narino', '40', 1),
('567', 'Norte de Santander', '40', 1),
('568', 'Putumayo', '40', 1),
('569', 'Quindio', '40', 1),
('570', 'Risaralda', '40', 1),
('571', 'San Andres y Providencia', '40', 1),
('572', 'Santander', '40', 1),
('573', 'Sucre', '40', 1),
('574', 'Tolima', '40', 1),
('575', 'Valle del Cauca', '40', 1),
('576', 'Vaupes', '40', 1),
('577', 'Vichada', '40', 1),
('578', 'Other', '40', 1),
('579', 'Anjouan Island', '41', 1),
('580', 'Comoros (general)', '41', 1),
('581', 'Grande Comore Island', '41', 1),
('582', 'Mahore', '41', 1),
('583', 'Moheli Island', '41', 1),
('584', 'Other', '41', 1),
('585', 'Bandundu', '42', 1),
('586', 'Bas-Congo', '42', 1),
('587', 'Katanga', '42', 1),
('588', 'Orientale', '42', 1),
('589', 'Other', '42', 1),
('590', 'Bouenza', '43', 1),
('591', 'Brazzaville', '43', 1),
('592', 'Cuvette', '43', 1),
('593', 'Kouilou', '43', 1),
('594', 'Lekoumou', '43', 1),
('595', 'Likouala', '43', 1),
('596', 'Niari', '43', 1),
('597', 'Plateaux', '43', 1),
('598', 'Pool', '43', 1),
('599', 'Sangha', '43', 1),
('600', 'Other', '43', 1),
('601', 'Rarotonga', '44', 1),
('602', 'Other', '44', 1),
('603', 'Alajuela', '45', 1),
('604', 'Cartago', '45', 1),
('605', 'Other', '45', 1),
('606', 'Abidjan', '46', 1),
('607', 'Bouake', '46', 1),
('608', 'Yamoussoukro', '46', 1),
('609', 'Other', '46', 1),
('610', 'Bjelovarsko-Bilogorska', '47', 1),
('611', 'Brodsko-Posavska', '47', 1),
('612', 'Dubrovacko-Neretvanska', '47', 1),
('613', 'Istarska', '47', 1),
('614', 'Karlovacka', '47', 1),
('615', 'Koprivnicko-Krizevacka', '47', 1),
('616', 'Krapinsko-Zagorska', '47', 1),
('617', 'Licko-Senjska', '47', 1),
('618', 'Medimurska', '47', 1),
('619', 'Osjecko-Baranjska', '47', 1),
('620', 'Pozesko-Slavonska', '47', 1),
('621', 'Primorsko-Goranska', '47', 1),
('622', 'Sibensko-Kninska', '47', 1),
('623', 'Sisacko-Moslavacka', '47', 1),
('624', 'Splitsko-Dalmatinska', '47', 1),
('625', 'Varazdinska', '47', 1),
('626', 'Viroviticko-Podravska', '47', 1),
('627', 'Vukovarsko-Srijemska', '47', 1),
('628', 'Zadarska', '47', 1),
('629', 'Zagreb', '47', 1),
('630', 'Zagrebacka', '47', 1),
('631', 'Other', '47', 1),
('632', 'Camaguey', '48', 1),
('633', 'Ciego de Avila', '48', 1),
('634', 'Cienfuegos', '48', 1),
('635', 'Ciudad de La Habana', '48', 1),
('636', 'Granma', '48', 1),
('637', 'Guantanamo', '48', 1),
('638', 'Holguin', '48', 1),
('639', 'Isla de la Juventud', '48', 1),
('640', 'La Habana', '48', 1),
('641', 'Las Tunas', '48', 1),
('642', 'Matanzas', '48', 1),
('643', 'Pinar del Rio', '48', 1),
('644', 'Sancti Spiritus', '48', 1),
('645', 'Santiago de Cuba', '48', 1),
('646', 'Villa Clara', '48', 1),
('647', 'Other', '48', 1),
('648', 'Famagusta', '49', 1),
('649', 'Kyrenia', '49', 1),
('650', 'Larnaca', '49', 1),
('651', 'Limassol', '49', 1),
('652', 'Nicosia', '49', 1),
('653', 'Paphos', '49', 1),
('654', 'Other', '49', 1),
('655', 'Jihocesky Kraj', '50', 1),
('656', 'Jihomoravsky Kraj', '50', 1),
('657', 'Karlovarsky Kraj', '50', 1),
('658', 'Kralovehradecky Kraj', '50', 1),
('659', 'Liberecky Kraj', '50', 1),
('660', 'Moravskoslezsky Kraj', '50', 1),
('661', 'Olomoucky Kraj', '50', 1),
('662', 'Pardubicky Kraj', '50', 1),
('663', 'Plzensky Kraj', '50', 1),
('664', 'Praha', '50', 1),
('665', 'Stredocesky Kraj', '50', 1),
('666', 'Ustecky Kraj', '50', 1),
('667', 'Vysocina', '50', 1),
('668', 'Zlinsky Kraj', '50', 1),
('669', 'Other', '50', 1),
('670', 'Arhus', '51', 1),
('671', 'Bornholm', '51', 1),
('672', 'Frederiksberg', '51', 1),
('673', 'Frederiksborg', '51', 1),
('674', 'Fyn', '51', 1),
('675', 'Kobenhavn', '51', 1),
('676', 'Kobenhavns', '51', 1),
('677', 'Nordjylland', '51', 1),
('678', 'Ribe', '51', 1),
('679', 'Ringkobing', '51', 1),
('680', 'Roskilde', '51', 1),
('681', 'Sonderjylland', '51', 1),
('682', 'Storstrom', '51', 1),
('683', 'Vejle', '51', 1),
('684', 'Vestsjalland', '51', 1),
('685', 'Viborg', '51', 1),
('686', 'Other', '51', 1),
('687', 'Ali Sabih', '52', 1),
('688', 'Dikhil', '52', 1),
('689', 'Djibouti', '52', 1),
('690', 'Obock', '52', 1),
('691', 'Tadjoura', '52', 1),
('692', 'Other', '52', 1),
('693', 'Saint Andrew', '53', 1),
('694', 'Saint David', '53', 1),
('695', 'Saint George', '53', 1),
('696', 'Saint John', '53', 1),
('697', 'Saint Joseph', '53', 1),
('698', 'Saint Luke', '53', 1),
('699', 'Saint Mark', '53', 1),
('700', 'Saint Patrick', '53', 1),
('701', 'Saint Paul', '53', 1),
('702', 'Saint Peter', '53', 1),
('703', 'Other', '53', 1),
('704', 'Azua', '54', 1),
('705', 'Baoruco', '54', 1),
('706', 'Barahona', '54', 1),
('707', 'Dajabon', '54', 1),
('708', 'Distrito Nacional', '54', 1),
('709', 'Duarte', '54', 1),
('710', 'Elias Pina', '54', 1),
('711', 'El Seibo', '54', 1),
('712', 'Espaillat', '54', 1),
('713', 'Hato Mayor', '54', 1),
('714', 'Independencia', '54', 1),
('715', 'La Altagracia', '54', 1),
('716', 'La Romana', '54', 1),
('717', 'La Vega', '54', 1),
('718', 'Maria Trinidad Sanchez', '54', 1),
('719', 'Monsenor Nouel', '54', 1),
('720', 'Monte Cristi', '54', 1),
('721', 'Monte Plata', '54', 1),
('722', 'Pedernales', '54', 1),
('723', 'Peravia', '54', 1),
('724', 'Puerto Plata', '54', 1),
('725', 'Salcedo', '54', 1),
('726', 'Samana', '54', 1),
('727', 'Sanchez Ramirez', '54', 1),
('728', 'San Cristobal', '54', 1),
('729', 'San Jose de Ocoa', '54', 1),
('730', 'San Juan', '54', 1),
('731', 'San Pedro de Macoris', '54', 1),
('732', 'Santiago', '54', 1),
('733', 'Santiago Rodriguez', '54', 1),
('734', 'Santo Domingo', '54', 1),
('735', 'Valverde', '54', 1),
('736', 'Other', '54', 1),
('737', 'Aileu', '55', 1),
('738', 'Ainaro', '55', 1),
('739', 'Baucau', '55', 1),
('740', 'Bobonaro', '55', 1),
('741', 'Cova-Lima', '55', 1),
('742', 'Dili', '55', 1),
('743', 'Ermera', '55', 1),
('744', 'Lautem', '55', 1),
('745', 'Liquica', '55', 1),
('746', 'Manatuto', '55', 1),
('747', 'Manufahi', '55', 1),
('748', 'Oecussi', '55', 1),
('749', 'Viqueque', '55', 1),
('750', 'Other', '55', 1),
('751', 'Azuay', '56', 1),
('752', 'Bolivar', '56', 1),
('753', 'Canar', '56', 1),
('754', 'Carchi', '56', 1),
('755', 'Chimborazo', '56', 1),
('756', 'Cotopaxi', '56', 1),
('757', 'El Oro', '56', 1),
('758', 'Esmeraldas', '56', 1),
('759', 'Galapagos', '56', 1),
('760', 'Guayas', '56', 1),
('761', 'Imbabura', '56', 1),
('762', 'Loja', '56', 1),
('763', 'Los Rios', '56', 1),
('764', 'Manabi', '56', 1),
('765', 'Morona-Santiago', '56', 1),
('766', 'Napo', '56', 1),
('767', 'Orellana', '56', 1),
('768', 'Pastaza', '56', 1),
('769', 'Pichincha', '56', 1),
('770', 'Sucumbios', '56', 1),
('771', 'Tungurahua', '56', 1),
('772', 'Zamora-Chinchipe', '56', 1),
('773', 'Other', '56', 1),
('774', 'Ad Daqahliyah', '57', 1),
('775', 'Al Bahr al Ahmar', '57', 1),
('776', 'Al Buhayrah', '57', 1),
('777', 'Al Fayyum', '57', 1),
('778', 'Al Gharbiyah', '57', 1),
('779', 'Al Iskandariyah', '57', 1),
('780', 'Al Isma\'iliyah', '57', 1),
('781', 'Al Jizah', '57', 1),
('782', 'Al Minufiyah', '57', 1),
('783', 'Al Minya', '57', 1),
('784', 'Al Qahirah', '57', 1),
('785', 'Al Qalyubiyah', '57', 1),
('786', 'Al Wadi al Jadid', '57', 1),
('787', 'Ash Sharqiyah', '57', 1),
('788', 'As Suways', '57', 1),
('789', 'Aswan', '57', 1),
('790', 'Asyut', '57', 1),
('791', 'Bani Suwayf', '57', 1),
('792', 'Bur Sa\'id', '57', 1),
('793', 'Dumyat', '57', 1),
('794', 'Janub Sina\'', '57', 1),
('795', 'Kafr ash Shaykh', '57', 1),
('796', 'Matruh', '57', 1),
('797', 'Qina', '57', 1),
('798', 'Shamal Sina\'', '57', 1),
('799', 'Suhaj', '57', 1),
('800', 'Other', '57', 1),
('801', 'Ahuachapan', '58', 1),
('802', 'Cabanas', '58', 1),
('803', 'Chalatenango', '58', 1),
('804', 'Cuscatlan', '58', 1),
('805', 'La Libertad', '58', 1),
('806', 'La Paz', '58', 1),
('807', 'La Union', '58', 1),
('808', 'Morazan', '58', 1),
('809', 'San Miguel', '58', 1),
('810', 'San Salvador', '58', 1),
('811', 'Santa Ana', '58', 1),
('812', 'San Vicente', '58', 1),
('813', 'Sonsonate', '58', 1),
('814', 'Usulutan', '58', 1),
('815', 'Other', '58', 1),
('816', 'Annobon', '59', 1),
('817', 'Bioko Norte', '59', 1),
('818', 'Bioko Sur', '59', 1),
('819', 'Centro Sur', '59', 1),
('820', 'Kie-Ntem', '59', 1),
('821', 'Litoral', '59', 1),
('822', 'Wele-Nzas', '59', 1),
('823', 'Other', '59', 1),
('824', 'Anseba', '60', 1),
('825', 'Debub', '60', 1),
('826', 'Debubawi K\'eyih Bahri', '60', 1),
('827', 'Gash Barka', '60', 1),
('828', 'Ma\'akel', '60', 1),
('829', 'Semenawi Keyih Bahri', '60', 1),
('830', 'Other', '60', 1),
('831', 'Harjumaa (Tallinn)', '61', 1),
('832', 'Hiiumaa (Kardla)', '61', 1),
('833', 'Ida-Virumaa (Johvi)', '61', 1),
('834', 'Jarvamaa (Paide)', '61', 1),
('835', 'Jogevamaa (Jogeva)', '61', 1),
('836', 'Laanemaa (Haapsalu)', '61', 1),
('837', 'Laane-Virumaa (Rakvere)', '61', 1),
('838', 'Parnumaa (Parnu)', '61', 1),
('839', 'Polvamaa (Polva)', '61', 1),
('840', 'Raplamaa (Rapla)', '61', 1),
('841', 'Saaremaa (Kuressaare)', '61', 1),
('842', 'Tartumaa (Tartu)', '61', 1),
('843', 'Valgamaa (Valga)', '61', 1),
('844', 'Viljandimaa (Viljandi)', '61', 1),
('845', 'Vorumaa (Voru)', '61', 1),
('846', 'Other', '61', 1),
('847', 'Addis Ababa', '62', 1),
('848', 'Afar', '62', 1),
('849', 'Amhara', '62', 1),
('850', 'Binshangul Gumuz', '62', 1),
('851', 'Dire Dawa', '62', 1),
('852', 'Gambela Hizboch', '62', 1),
('853', 'Harari', '62', 1),
('854', 'Oromia', '62', 1),
('855', 'Somali', '62', 1),
('856', 'Tigray', '62', 1),
('857', 'Southern Nations, Nationalities, and Peoples Region', '62', 1),
('858', 'Other', '63', 1),
('859', 'Other', '64', 1),
('860', 'Central (Suva)', '65', 1),
('861', 'Eastern (Levuka)', '65', 1),
('862', 'Northern (Labasa)', '65', 1),
('863', 'Rotuma', '65', 1),
('864', 'Western (Lautoka)', '65', 1),
('865', 'Other', '65', 1),
('866', 'Aland', '66', 1),
('867', 'Etela-Suomen Laani', '66', 1),
('868', 'Ita-Suomen Laani', '66', 1),
('869', 'Lansi-Suomen Laani', '66', 1),
('870', 'Lappi', '66', 1),
('871', 'Oulun Laani', '66', 1),
('872', 'Other', '66', 1),
('873', 'Alsace', '67', 1),
('874', 'Aquitaine', '67', 1),
('875', 'Auvergne', '67', 1),
('876', 'Basse-Normandie', '67', 1),
('877', 'Bourgogne', '67', 1),
('878', 'Bretagne', '67', 1),
('879', 'Centre', '67', 1),
('880', 'Champagne-Ardenne', '67', 1),
('881', 'Corse', '67', 1),
('882', 'Franche-Comte', '67', 1),
('883', 'Haute-Normandie', '67', 1),
('884', 'Ile-de-France', '67', 1),
('885', 'Languedoc-Roussillon', '67', 1),
('886', 'Limousin', '67', 1),
('887', 'Lorraine', '67', 1),
('888', 'Midi-Pyrenees', '67', 1),
('889', 'Nord-Pas-de-Calais', '67', 1),
('890', 'Pays de la Loire', '67', 1),
('891', 'Picardie', '67', 1),
('892', 'Poitou-Charentes', '67', 1),
('893', 'Provence-Alpes-Cote d\'Azur', '67', 1),
('894', 'Rhone-Alpes', '67', 1),
('895', 'Other', '67', 1),
('896', 'Estuaire', '68', 1),
('897', 'Haut-Ogooue', '68', 1),
('898', 'Moyen-Ogooue', '68', 1),
('899', 'Ngounie', '68', 1),
('900', 'Nyanga', '68', 1),
('901', 'Ogooue-Ivindo', '68', 1),
('902', 'Ogooue-Lolo', '68', 1),
('903', 'Ogooue-Maritime', '68', 1),
('904', 'Woleu-Ntem', '68', 1),
('905', 'Other', '68', 1),
('906', 'Banjul', '69', 1),
('907', 'Central River', '69', 1),
('908', 'Lower River', '69', 1),
('909', 'North Bank', '69', 1),
('910', 'Upper River', '69', 1),
('911', 'Western', '69', 1),
('912', 'Other', '69', 1),
('913', 'Abkhazia', '70', 1),
('914', 'Adjara', '70', 1),
('915', 'Guria', '70', 1),
('916', 'Imereti', '70', 1),
('917', 'Kakheti', '70', 1),
('918', 'Kvemo Kartli', '70', 1),
('919', 'Mtskheta-Mtianeti', '70', 1),
('920', 'Racha-Lechkhumi and Kvemo Svaneti', '70', 1),
('921', 'Samegrelo-Zemo', '70', 1),
('922', 'Svaneti', '70', 1),
('923', 'Samtskhe', '70', 1),
('924', 'Javakheti', '70', 1),
('925', 'Shida Kartli', '70', 1),
('926', 'Tbilisi', '70', 1),
('927', 'Other', '70', 1),
('928', 'Baden-Wuerttemberg', '71', 1),
('929', 'Bayern', '71', 1),
('930', 'Berlin', '71', 1),
('931', 'Brandenburg', '71', 1),
('932', 'Bremen', '71', 1),
('933', 'Hamburg', '71', 1),
('934', 'Hessen', '71', 1),
('935', 'Mecklenburg-Vorpommern', '71', 1),
('936', 'Niedersachsen', '71', 1),
('937', 'Nordrhein-Westfalen', '71', 1),
('938', 'Rheinland-Pfalz', '71', 1),
('939', 'Saarland', '71', 1),
('940', 'Sachsen', '71', 1),
('941', 'Sachsen-Anhalt', '71', 1),
('942', 'Schleswig-Holstein', '71', 1),
('943', 'Thueringen', '71', 1),
('944', 'Other', '71', 1),
('945', 'Ashanti', '72', 1),
('946', 'Brong-Ahafo', '72', 1),
('947', 'Central', '72', 1),
('948', 'Eastern', '72', 1),
('949', 'Greater Accra', '72', 1),
('950', 'Northern', '72', 1),
('951', 'Upper East', '72', 1),
('952', 'Upper West', '72', 1),
('953', 'Volta', '72', 1),
('954', 'Western', '72', 1),
('955', 'Other', '72', 1),
('956', 'Gibraltar', '73', 1),
('957', 'Other', '73', 1),
('958', 'Agion Oros', '74', 1),
('959', 'Achaia', '74', 1),
('960', 'Aitolia kai Akarmania', '74', 1),
('961', 'Argolis', '74', 1),
('962', 'Arkadia', '74', 1),
('963', 'Arta', '74', 1),
('964', 'Attiki', '74', 1),
('965', 'Chalkidiki', '74', 1),
('966', 'Chanion', '74', 1),
('967', 'Chios', '74', 1),
('968', 'Dodekanisos', '74', 1),
('969', 'Drama', '74', 1),
('970', 'Evros', '74', 1),
('971', 'Evrytania', '74', 1),
('972', 'Evvoia', '74', 1),
('973', 'Florina', '74', 1),
('974', 'Fokidos', '74', 1),
('975', 'Fthiotis', '74', 1),
('976', 'Grevena', '74', 1),
('977', 'Ileia', '74', 1),
('978', 'Imathia', '74', 1),
('979', 'Ioannina', '74', 1),
('980', 'Irakleion', '74', 1),
('981', 'Karditsa', '74', 1),
('982', 'Kastoria', '74', 1),
('983', 'Kavala', '74', 1),
('984', 'Kefallinia', '74', 1),
('985', 'Kerkyra', '74', 1),
('986', 'Kilkis', '74', 1),
('987', 'Korinthia', '74', 1),
('988', 'Kozani', '74', 1),
('989', 'Kyklades', '74', 1),
('990', 'Lakonia', '74', 1),
('991', 'Larisa', '74', 1),
('992', 'Lasithi', '74', 1),
('993', 'Lefkas', '74', 1),
('994', 'Lesvos', '74', 1),
('995', 'Magnisia', '74', 1),
('996', 'Messinia', '74', 1),
('997', 'Pella', '74', 1),
('998', 'Pieria', '74', 1),
('999', 'Preveza', '74', 1),
('1000', 'Rethynnis', '74', 1),
('1001', 'Rodopi', '74', 1),
('1002', 'Samos', '74', 1),
('1003', 'Serrai', '74', 1),
('1004', 'Thesprotia', '74', 1),
('1005', 'Thessaloniki', '74', 1),
('1006', 'Trikala', '74', 1),
('1007', 'Voiotia', '74', 1),
('1008', 'Xanthi', '74', 1),
('1009', 'Zakynthos', '74', 1),
('1010', 'Other', '74', 1),
('1011', 'Avannaa (Nordgronland)', '75', 1),
('1012', 'Tunu (Ostgronland)', '75', 1),
('1013', 'Kitaa (Vestgronland)', '75', 1),
('1014', 'Other', '75', 1),
('1015', 'Carriacou and Petit Martinique', '76', 1),
('1016', 'Saint Andrew', '76', 1),
('1017', 'Saint David', '76', 1),
('1018', 'Saint George', '76', 1),
('1019', 'Saint John', '76', 1),
('1020', 'Saint Mark', '76', 1),
('1021', 'Saint Patrick', '76', 1),
('1022', 'Other', '76', 1),
('1023', 'Guadeloupe (General)', '77', 1),
('1024', 'Other', '77', 1),
('1025', 'Northern Mariana', '78', 1),
('1026', 'Other', '78', 1),
('1027', 'Alta Verapaz', '79', 1),
('1028', 'Baja Verapaz', '79', 1),
('1029', 'Chimaltenango', '79', 1),
('1030', 'Chiquimula', '79', 1),
('1031', 'El Progreso', '79', 1),
('1032', 'Escuintla', '79', 1),
('1033', 'Guatemala', '79', 1),
('1034', 'Huehuetenango', '79', 1),
('1035', 'Izabal', '79', 1),
('1036', 'Jalapa', '79', 1),
('1037', 'Jutiapa', '79', 1),
('1038', 'Peten', '79', 1),
('1039', 'Quetzaltenango', '79', 1),
('1040', 'Quiche', '79', 1),
('1041', 'Retalhuleu', '79', 1),
('1042', 'Sacatepequez', '79', 1),
('1043', 'San Marcos', '79', 1),
('1044', 'Santa Rosa', '79', 1),
('1045', 'Solola', '79', 1),
('1046', 'Suchitepequez', '79', 1),
('1047', 'Totonicapan', '79', 1),
('1048', 'Zacapa', '79', 1),
('1049', 'Other', '79', 1),
('1050', 'Beyla', '80', 1),
('1051', 'Boffa', '80', 1),
('1052', 'Boke', '80', 1),
('1053', 'Conakry', '80', 1),
('1054', 'Coyah', '80', 1),
('1055', 'Dabola', '80', 1),
('1056', 'Dalaba', '80', 1),
('1057', 'Dinguiraye', '80', 1),
('1058', 'Dubreka', '80', 1),
('1059', 'Faranah', '80', 1),
('1060', 'Forecariah', '80', 1),
('1061', 'Fria', '80', 1),
('1062', 'Gaoual', '80', 1),
('1063', 'Gueckedou', '80', 1),
('1064', 'Kankan', '80', 1),
('1065', 'Kerouane', '80', 1),
('1066', 'Kindia', '80', 1),
('1067', 'Kissidougou', '80', 1),
('1068', 'Koubia', '80', 1),
('1069', 'Koundara', '80', 1),
('1070', 'Kouroussa', '80', 1),
('1071', 'Labe', '80', 1),
('1072', 'Lelouma', '80', 1),
('1073', 'Lola', '80', 1),
('1074', 'Macenta', '80', 1),
('1075', 'Mali', '80', 1),
('1076', 'Mamou', '80', 1),
('1077', 'Mandiana', '80', 1),
('1078', 'Nzerekore', '80', 1),
('1079', 'Pita', '80', 1),
('1080', 'Siguiri', '80', 1),
('1081', 'Telimele', '80', 1),
('1082', 'Tougue', '80', 1),
('1083', 'Yomou', '80', 1),
('1084', 'Other', '80', 1),
('1085', 'Bafata', '81', 1),
('1086', 'Biombo', '81', 1),
('1087', 'Bissau', '81', 1),
('1088', 'Bolama', '81', 1),
('1089', 'Cacheu', '81', 1),
('1090', 'Gabu', '81', 1),
('1091', 'Oio', '81', 1),
('1092', 'Quinara', '81', 1),
('1093', 'Tombali', '81', 1),
('1094', 'Other', '81', 1),
('1095', 'Barima-Waini', '82', 1),
('1096', 'Cuyuni-Mazaruni', '82', 1),
('1097', 'Demerara-Mahaica', '82', 1),
('1098', 'East Berbice-Corentyne', '82', 1),
('1099', 'Essequibo Islands-West Demerara', '82', 1),
('1100', 'Mahaica-Berbice', '82', 1),
('1101', 'Pomeroon-Supenaam', '82', 1),
('1102', 'Potaro-Siparuni', '82', 1),
('1103', 'Upper Demerara-Berbice', '82', 1),
('1104', 'Upper Takutu-Upper Essequibo', '82', 1),
('1105', 'Other', '82', 1),
('1106', 'Artibonite', '83', 1),
('1107', 'Centre', '83', 1),
('1108', 'Grand \'Anse', '83', 1),
('1109', 'Nord', '83', 1),
('1110', 'Nord-Est', '83', 1),
('1111', 'Nord-Ouest', '83', 1),
('1112', 'Ouest', '83', 1),
('1113', 'Sud', '83', 1),
('1114', 'Sud-Est', '83', 1),
('1115', 'Other', '83', 1),
('1116', 'Vatican City State', '84', 1),
('1117', 'Other', '84', 1),
('1118', 'Atlantida', '85', 1),
('1119', 'Choluteca', '85', 1),
('1120', 'Colon', '85', 1),
('1121', 'Comayagua', '85', 1),
('1122', 'Copan', '85', 1),
('1123', 'Cortes', '85', 1),
('1124', 'El Paraiso', '85', 1),
('1125', 'Francisco Morazan', '85', 1),
('1126', 'Gracias a Dios', '85', 1),
('1127', 'Intibuca', '85', 1),
('1128', 'Islas de la Bahia', '85', 1),
('1129', 'La Paz', '85', 1),
('1130', 'Lempira', '85', 1),
('1131', 'Ocotepeque', '85', 1),
('1132', 'Olancho', '85', 1),
('1133', 'Santa Barbara', '85', 1),
('1134', 'Valle', '85', 1),
('1135', 'Yoro', '85', 1),
('1136', 'Other', '85', 1),
('1137', 'Hong Kong (general)', '86', 1),
('1138', 'Kowloon', '86', 1),
('1139', 'Lantau Island', '86', 1),
('1140', 'Yuen Long', '86', 1),
('1141', 'Other', '86', 1),
('1142', 'Bacs-Kiskun', '87', 1),
('1143', 'Baranya', '87', 1),
('1144', 'Bekes', '87', 1),
('1145', 'Borsod-Abauj-Zemplen', '87', 1),
('1146', 'Csongrad', '87', 1),
('1147', 'Fejer', '87', 1),
('1148', 'Gyor-Moson-Sopron', '87', 1),
('1149', 'Hajdu-Bihar', '87', 1),
('1150', 'Heves', '87', 1),
('1151', 'Jasz-Nagykun-Szolnok', '87', 1),
('1152', 'Komarom-Esztergom', '87', 1),
('1153', 'Nograd', '87', 1),
('1154', 'Pest', '87', 1),
('1155', 'Somogy', '87', 1),
('1156', 'Szabolcs-Szatmar-Bereg', '87', 1),
('1157', 'Tolna', '87', 1),
('1158', 'Vas', '87', 1),
('1159', 'Veszprem', '87', 1),
('1160', 'Zala', '87', 1),
('1161', 'Bekescsaba', '87', 1),
('1162', 'Debrecen', '87', 1),
('1163', 'Dunaujvaros', '87', 1),
('1164', 'Eger', '87', 1),
('1165', 'Gyor', '87', 1),
('1166', 'Hodmezovasarhely', '87', 1),
('1167', 'Kaposvar', '87', 1),
('1168', 'Kecskemet', '87', 1),
('1169', 'Miskolc', '87', 1),
('1170', 'Nagykanizsa', '87', 1),
('1171', 'Nyiregyhaza', '87', 1),
('1172', 'Pecs', '87', 1),
('1173', 'Sopron', '87', 1),
('1174', 'Szeged', '87', 1),
('1175', 'Szekesfehervar', '87', 1),
('1176', 'Szolnok', '87', 1),
('1177', 'Szombathely', '87', 1),
('1178', 'Tatabanya', '87', 1),
('1179', 'Veszprem', '87', 1),
('1180', 'Zalaegerszeg', '87', 1),
('1181', 'Other', '87', 1),
('1182', 'Austurland', '88', 1),
('1183', 'Hofudhborgarsvaedhi', '88', 1),
('1184', 'Nordhurland Eystra', '88', 1),
('1185', 'Nordhurland Vestra', '88', 1),
('1186', 'Sudhurland', '88', 1),
('1187', 'Sudhurnes', '88', 1),
('1188', 'Vestfirdhir', '88', 1),
('1189', 'Vesturland', '88', 1),
('1190', 'Other', '88', 1),
('1191', 'Andaman and Nicobar Islands', '89', 1),
('1192', 'Andhra Pradesh', '89', 1),
('1193', 'Arunachal Pradesh', '89', 1),
('1194', 'Assam', '89', 1),
('1195', 'Bihar', '89', 1),
('1196', 'Chandigarh', '89', 1),
('1197', 'Chhattisgarh', '89', 1),
('1198', 'Dadra and Nagar Haveli', '89', 1),
('1199', 'Daman and Diu', '89', 1),
('1200', 'Delhi', '89', 1),
('1201', 'Goa', '89', 1),
('1202', 'Gujarat', '89', 1),
('1203', 'Haryana', '89', 1),
('1204', 'Himachal Pradesh', '89', 1),
('1205', 'Jammu and Kashmir', '89', 1),
('1206', 'Jharkhand', '89', 1),
('1207', 'Karnataka', '89', 1),
('1208', 'Kerala', '89', 1),
('1209', 'Lakshadweep', '89', 1),
('1210', 'Madhya Pradesh', '89', 1),
('1211', 'Maharashtra', '89', 1),
('1212', 'Manipur', '89', 1),
('1213', 'Meghalaya', '89', 1),
('1214', 'Mizoram', '89', 1),
('1215', 'Nagaland', '89', 1),
('1216', 'Orissa', '89', 1),
('1217', 'Pondicherry', '89', 1),
('1218', 'Punjab', '89', 1),
('1219', 'Rajasthan', '89', 1),
('1220', 'Sikkim', '89', 1),
('1221', 'Tamil Nadu', '89', 1),
('1222', 'Tripura', '89', 1),
('1223', 'Uttaranchal', '89', 1),
('1224', 'Uttar Pradesh', '89', 1),
('1225', 'West Bengal', '89', 1),
('1226', 'Other', '89', 1),
('1227', 'Aceh', '90', 1),
('1228', 'Bali', '90', 1),
('1229', 'Banten', '90', 1),
('1230', 'Bengkulu', '90', 1),
('1231', 'Gorontalo', '90', 1),
('1232', 'Irian Jaya Barat', '90', 1),
('1233', 'Jakarta Raya', '90', 1),
('1234', 'Jambi', '90', 1),
('1235', 'Jawa Barat', '90', 1),
('1236', 'Jawa Tengah', '90', 1),
('1237', 'Jawa Timur', '90', 1),
('1238', 'Kalimantan Barat', '90', 1),
('1239', 'Kalimantan Selatan', '90', 1),
('1240', 'Kalimantan Tengah', '90', 1),
('1241', 'Kalimantan Timur', '90', 1),
('1242', 'Kepulauan Bangka Belitung', '90', 1),
('1243', 'Kepulauan Riau', '90', 1),
('1244', 'Lampung', '90', 1),
('1245', 'Maluku', '90', 1),
('1246', 'Maluku Utara', '90', 1),
('1247', 'Nusa Tenggara Barat', '90', 1),
('1248', 'Nusa Tenggara Timur', '90', 1),
('1249', 'Papua', '90', 1),
('1250', 'Riau', '90', 1),
('1251', 'Sulawesi Barat', '90', 1),
('1252', 'Sulawesi Selatan', '90', 1),
('1253', 'Sulawesi Tengah', '90', 1),
('1254', 'Sulawesi Tenggara', '90', 1),
('1255', 'Sulawesi Utara', '90', 1),
('1256', 'Sumatera Barat', '90', 1),
('1257', 'Sumatera Selatan', '90', 1),
('1258', 'Sumatera Utara', '90', 1),
('1259', 'Yogyakarta', '90', 1),
('1260', 'Other', '90', 1),
('1261', 'Ardabil', '91', 1),
('1262', 'Azarbayjan-e Gharbi', '91', 1),
('1263', 'Azarbayjan-e Sharqi', '91', 1),
('1264', 'Bushehr', '91', 1),
('1265', 'Chahar Mahall va Bakhtiari', '91', 1),
('1266', 'Esfahan', '91', 1),
('1267', 'Fars', '91', 1),
('1268', 'Gilan', '91', 1),
('1269', 'Golestan', '91', 1),
('1270', 'Hamadan', '91', 1),
('1271', 'Hormozgan', '91', 1),
('1272', 'Ilam', '91', 1),
('1273', 'Kerman', '91', 1),
('1274', 'Kermanshah', '91', 1),
('1275', 'Khorasan-e Janubi', '91', 1),
('1276', 'Khorasan-e Razavi', '91', 1),
('1277', 'Khorasan-e Shemali', '91', 1),
('1278', 'Khuzestan', '91', 1),
('1279', 'Kohgiluyeh va Buyer Ahmad', '91', 1),
('1280', 'Kordestan', '91', 1),
('1281', 'Lorestan', '91', 1),
('1282', 'Markazi', '91', 1),
('1283', 'Mazandaran', '91', 1),
('1284', 'Qazvin', '91', 1),
('1285', 'Qom', '91', 1),
('1286', 'Semnan', '91', 1),
('1287', 'Sistan va Baluchestan', '91', 1),
('1288', 'Tehran', '91', 1),
('1289', 'Yazd', '91', 1),
('1290', 'Zanjan', '91', 1),
('1291', 'Other', '91', 1),
('1292', 'Al Anbar', '92', 1),
('1293', 'Al Basrah', '92', 1),
('1294', 'Al Muthanna', '92', 1),
('1295', 'Al Qadisiyah', '92', 1),
('1296', 'An Najaf', '92', 1),
('1297', 'Arbil', '92', 1),
('1298', 'As Sulaymaniyah', '92', 1),
('1299', 'At Ta\'mim', '92', 1),
('1300', 'Babil', '92', 1),
('1301', 'Baghdad', '92', 1),
('1302', 'Dahuk', '92', 1),
('1303', 'Dhi Qar', '92', 1),
('1304', 'Diyala', '92', 1),
('1305', 'Karbala\'', '92', 1),
('1306', 'Maysan', '92', 1),
('1307', 'Ninawa', '92', 1),
('1308', 'Salah ad Din', '92', 1),
('1309', 'Wasit', '92', 1),
('1310', 'Other', '92', 1),
('1311', 'Carlow', '93', 1),
('1312', 'Cavan', '93', 1),
('1313', 'Clare', '93', 1),
('1314', 'Cork', '93', 1),
('1315', 'Donegal', '93', 1),
('1316', 'Dublin', '93', 1),
('1317', 'Galway', '93', 1),
('1318', 'Kerry', '93', 1),
('1319', 'Kildare', '93', 1),
('1320', 'Kilkenny', '93', 1),
('1321', 'Laois', '93', 1),
('1322', 'Leitrim', '93', 1),
('1323', 'Limerick', '93', 1),
('1324', 'Longford', '93', 1),
('1325', 'Louth', '93', 1),
('1326', 'Mayo', '93', 1),
('1327', 'Meath', '93', 1),
('1328', 'Monaghan', '93', 1),
('1329', 'Offaly', '93', 1),
('1330', 'Roscommon', '93', 1),
('1331', 'Sligo', '93', 1),
('1332', 'Tipperary', '93', 1),
('1333', 'Waterford', '93', 1),
('1334', 'Westmeath', '93', 1),
('1335', 'Wexford', '93', 1),
('1336', 'Wicklow', '93', 1),
('1337', 'Other', '93', 1),
('1338', 'Central', '94', 1),
('1339', 'Haifa', '94', 1),
('1340', 'Jerusalem', '94', 1),
('1341', 'Northern', '94', 1),
('1342', 'Southern', '94', 1),
('1343', 'Tel Aviv', '94', 1),
('1344', 'Other', '94', 1),
('1345', 'Abruzzo', '95', 1),
('1346', 'Basilicata', '95', 1),
('1347', 'Calabria', '95', 1),
('1348', 'Campania', '95', 1),
('1349', 'Emilia-Romagna', '95', 1),
('1350', 'Friuli-Venezia Giulia', '95', 1),
('1351', 'Lazio', '95', 1),
('1352', 'Liguria', '95', 1),
('1353', 'Lombardia', '95', 1),
('1354', 'Marche', '95', 1),
('1355', 'Molise', '95', 1),
('1356', 'Piemonte', '95', 1),
('1357', 'Puglia', '95', 1),
('1358', 'Sardegna', '95', 1),
('1359', 'Sicilia', '95', 1),
('1360', 'Toscana', '95', 1),
('1361', 'Trentino-Alto Adige', '95', 1),
('1362', 'Umbria', '95', 1),
('1363', 'Valle d\'Aosta', '95', 1),
('1364', 'Veneto', '95', 1),
('1365', 'Other', '95', 1),
('1366', 'Clarendon', '96', 1),
('1367', 'Hanover', '96', 1),
('1368', 'Kingston', '96', 1),
('1369', 'Manchester', '96', 1),
('1370', 'Portland', '96', 1),
('1371', 'Saint Andrew', '96', 1),
('1372', 'Saint Ann', '96', 1),
('1373', 'Saint Catherine', '96', 1),
('1374', 'Saint Elizabeth', '96', 1),
('1375', 'Saint James', '96', 1),
('1376', 'Saint Mary', '96', 1),
('1377', 'Saint Thomas', '96', 1),
('1378', 'Trelawny', '96', 1),
('1379', 'Westmoreland', '96', 1),
('1380', 'Other', '96', 1),
('1381', 'Aichi', '97', 1),
('1382', 'Akita', '97', 1),
('1383', 'Aomori', '97', 1),
('1384', 'Chiba', '97', 1),
('1385', 'Ehime', '97', 1),
('1386', 'Fukui', '97', 1),
('1387', 'Fukuoka', '97', 1),
('1388', 'Fukushima', '97', 1),
('1389', 'Gifu', '97', 1),
('1390', 'Gumma', '97', 1),
('1391', 'Hiroshima', '97', 1),
('1392', 'Hokkaido', '97', 1),
('1393', 'Hyogo', '97', 1),
('1394', 'Ibaraki', '97', 1),
('1395', 'Ishikawa', '97', 1),
('1396', 'Iwate', '97', 1),
('1397', 'Kagawa', '97', 1),
('1398', 'Kagoshima', '97', 1),
('1399', 'Kanagawa', '97', 1),
('1400', 'Kochi', '97', 1),
('1401', 'Kumamoto', '97', 1),
('1402', 'Kyoto', '97', 1),
('1403', 'Mie', '97', 1),
('1404', 'Miyagi', '97', 1),
('1405', 'Miyazaki', '97', 1),
('1406', 'Nagano', '97', 1),
('1407', 'Nagasaki', '97', 1),
('1408', 'Nara', '97', 1),
('1409', 'Niigata', '97', 1),
('1410', 'Oita', '97', 1),
('1411', 'Okayama', '97', 1),
('1412', 'Okinawa', '97', 1),
('1413', 'Osaka', '97', 1),
('1414', 'Saga', '97', 1),
('1415', 'Saitama', '97', 1),
('1416', 'Shiga', '97', 1),
('1417', 'Shimane', '97', 1),
('1418', 'Shizuoka', '97', 1),
('1419', 'Tochigi', '97', 1),
('1420', 'Tokushima', '97', 1),
('1421', 'Tokyo', '97', 1),
('1422', 'Tottori', '97', 1),
('1423', 'Toyama', '97', 1),
('1424', 'Wakayama', '97', 1),
('1425', 'Yamagata', '97', 1),
('1426', 'Yamaguchi', '97', 1),
('1427', 'Yamanashi', '97', 1),
('1428', 'Other', '97', 1),
('1429', 'Ajlun', '98', 1),
('1430', 'Al \'Aqabah', '98', 1),
('1431', 'Al Balqa\'', '98', 1),
('1432', 'Al Karak', '98', 1),
('1433', 'Al Mafraq', '98', 1),
('1434', '\'Amman', '98', 1),
('1435', 'At Tafilah', '98', 1),
('1436', 'Az Zarqa\'', '98', 1),
('1437', 'Irbid', '98', 1),
('1438', 'Jarash', '98', 1),
('1439', 'Ma\'an', '98', 1),
('1440', 'Madaba', '98', 1),
('1441', 'Other', '98', 1),
('1442', 'Almaty Oblysy', '99', 1),
('1443', 'Almaty Qalasy', '99', 1),
('1444', 'Aqmola Oblysy', '99', 1),
('1445', 'Aqtobe Oblysy', '99', 1),
('1446', 'Astana Qalasy', '99', 1),
('1447', 'Atyrau Oblysy', '99', 1),
('1448', 'Batys Qazaqstan Oblysy', '99', 1),
('1449', 'Bayqongyr Qalasy', '99', 1),
('1450', 'Mangghystau Oblysy', '99', 1),
('1451', 'Ongtustik Qazaqstan Oblysy', '99', 1),
('1452', 'Pavlodar Oblysy', '99', 1),
('1453', 'Qaraghandy Oblysy', '99', 1),
('1454', 'Qostanay Oblysy', '99', 1),
('1455', 'Qyzylorda Oblysy', '99', 1),
('1456', 'Shyghys Qazaqstan Oblysy', '99', 1),
('1457', 'Soltustik Qazaqstan Oblysy', '99', 1),
('1458', 'Zhambyl Oblysy', '99', 1),
('1459', 'Other', '99', 1),
('1460', 'Central', '100', 1),
('1461', 'Coast', '100', 1),
('1462', 'Eastern', '100', 1),
('1463', 'Nairobi Area', '100', 1),
('1464', 'North Eastern', '100', 1),
('1465', 'Nyanza', '100', 1),
('1466', 'Rift Valley', '100', 1),
('1467', 'Western', '100', 1),
('1468', 'Other', '100', 1),
('1469', 'Tarawa Island', '101', 1),
('1470', 'Other', '101', 1),
('1471', 'Chagang', '102', 1),
('1472', 'North Hamgyong', '102', 1),
('1473', 'South Hamgyong', '102', 1),
('1474', 'North Hwanghae', '102', 1),
('1475', 'South Hwanghae', '102', 1),
('1476', 'Kangwon', '102', 1),
('1477', 'North P\'yongan', '102', 1),
('1478', 'South P\'yongan', '102', 1),
('1479', 'Yanggang', '102', 1),
('1480', 'Kaesong', '102', 1),
('1481', 'Najin', '102', 1),
('1482', 'Namp\'o', '102', 1),
('1483', 'Pyongyang', '102', 1),
('1484', 'Other', '102', 1),
('1485', 'Seoul', '103', 1),
('1486', 'Busan City', '103', 1),
('1487', 'Daegu City', '103', 1),
('1488', 'Incheon City', '103', 1),
('1489', 'Gwangju City', '103', 1),
('1490', 'Daejeon City', '103', 1),
('1491', 'Ulsan', '103', 1),
('1492', 'Gyeonggi Province', '103', 1),
('1493', 'Gangwon Province', '103', 1),
('1494', 'North Chungcheong Province', '103', 1),
('1495', 'South Chungcheong Province', '103', 1),
('1496', 'North Jeolla Province', '103', 1),
('1497', 'South Jeolla Province', '103', 1),
('1498', 'North Gyeongsang Province', '103', 1),
('1499', 'South Gyeongsang Province', '103', 1),
('1500', 'Jeju', '103', 1),
('1501', 'Other', '103', 1),
('1502', 'Al Ahmadi', '104', 1),
('1503', 'Al Farwaniyah', '104', 1),
('1504', 'Al Asimah', '104', 1),
('1505', 'Al Jahra', '104', 1),
('1506', 'Hawalli', '104', 1),
('1507', 'Mubarak Al-Kabeer', '104', 1),
('1508', 'Other', '104', 1),
('1509', 'Batken Oblasty', '105', 1),
('1510', 'Bishkek Shaary', '105', 1),
('1511', 'Chuy Oblasty', '105', 1),
('1512', 'Jalal-Abad Oblasty', '105', 1),
('1513', 'Naryn Oblasty', '105', 1),
('1514', 'Osh Oblasty', '105', 1),
('1515', 'Talas Oblasty', '105', 1),
('1516', 'Ysyk-Kol Oblasty', '105', 1),
('1517', 'Other', '105', 1),
('1518', 'Attapu', '106', 1),
('1519', 'Bokeo', '106', 1),
('1520', 'Bolikhamxai', '106', 1),
('1521', 'Champasak', '106', 1),
('1522', 'Houaphan', '106', 1),
('1523', 'Khammouan', '106', 1),
('1524', 'Louangnamtha', '106', 1),
('1525', 'Louangphrabang', '106', 1),
('1526', 'Oudomxai', '106', 1),
('1527', 'Phongsali', '106', 1),
('1528', 'Salavan', '106', 1),
('1529', 'Savannakhet', '106', 1),
('1530', 'Viangchan', '106', 1),
('1531', 'Viangchan', '106', 1),
('1532', 'Xaignabouli', '106', 1),
('1533', 'Xaisomboun', '106', 1),
('1534', 'Xekong', '106', 1),
('1535', 'Xiangkhoang', '106', 1),
('1536', 'Other', '106', 1),
('1537', 'Aizkraukles Rajons', '107', 1),
('1538', 'Aluksnes Rajons', '107', 1),
('1539', 'Balvu Rajons', '107', 1),
('1540', 'Bauskas Rajons', '107', 1),
('1541', 'Cesu Rajons', '107', 1),
('1542', 'Daugavpils', '107', 1),
('1543', 'Daugavpils Rajons', '107', 1),
('1544', 'Dobeles Rajons', '107', 1),
('1545', 'Gulbenes Rajons', '107', 1),
('1546', 'Jekabpils Rajons', '107', 1),
('1547', 'Jelgava', '107', 1),
('1548', 'Jelgavas Rajons', '107', 1),
('1549', 'Jurmala', '107', 1),
('1550', 'Kraslavas Rajons', '107', 1),
('1551', 'Kuldigas Rajons', '107', 1),
('1552', 'Liepaja', '107', 1),
('1553', 'Liepajas Rajons', '107', 1),
('1554', 'Limbazu Rajons', '107', 1),
('1555', 'Ludzas Rajons', '107', 1),
('1556', 'Madonas Rajons', '107', 1),
('1557', 'Ogres Rajons', '107', 1),
('1558', 'Preilu Rajons', '107', 1),
('1559', 'Rezekne', '107', 1),
('1560', 'Rezeknes Rajons', '107', 1),
('1561', 'Riga', '107', 1),
('1562', 'Rigas Rajons', '107', 1),
('1563', 'Saldus Rajons', '107', 1),
('1564', 'Talsu Rajons', '107', 1),
('1565', 'Tukuma Rajons', '107', 1),
('1566', 'Valkas Rajons', '107', 1),
('1567', 'Valmieras Rajons', '107', 1),
('1568', 'Ventspils', '107', 1),
('1569', 'Ventspils Rajons', '107', 1),
('1570', 'Other', '107', 1),
('1571', 'Beyrouth', '108', 1),
('1572', 'Beqaa', '108', 1),
('1573', 'Liban-Nord', '108', 1),
('1574', 'Liban-Sud', '108', 1),
('1575', 'Mont-Liban', '108', 1),
('1576', 'Nabatiye', '108', 1),
('1577', 'Other', '108', 1),
('1578', 'Berea', '109', 1),
('1579', 'Butha-Buthe', '109', 1),
('1580', 'Leribe', '109', 1),
('1581', 'Mafeteng', '109', 1),
('1582', 'Maseru', '109', 1),
('1583', 'Mohale\'s Hoek', '109', 1),
('1584', 'Mokhotlong', '109', 1),
('1585', 'Qacha\'s Nek', '109', 1),
('1586', 'Quthing', '109', 1),
('1587', 'Thaba-Tseka', '109', 1),
('1588', 'Other', '109', 1),
('1589', 'Bomi', '110', 1),
('1590', 'Bong', '110', 1),
('1591', 'Gbarpolu', '110', 1),
('1592', 'Grand Bassa', '110', 1),
('1593', 'Grand Cape Mount', '110', 1),
('1594', 'Grand Gedeh', '110', 1),
('1595', 'Grand Kru', '110', 1),
('1596', 'Lofa', '110', 1),
('1597', 'Margibi', '110', 1),
('1598', 'Maryland', '110', 1),
('1599', 'Montserrado', '110', 1),
('1600', 'Nimba', '110', 1),
('1601', 'River Cess', '110', 1),
('1602', 'River Gee', '110', 1),
('1603', 'Sinoe', '110', 1),
('1604', 'Other', '110', 1),
('1605', 'Ajdabiya', '111', 1),
('1606', 'Al \'Aziziyah', '111', 1),
('1607', 'Al Fatih', '111', 1),
('1608', 'Al Jabal al Akhdar', '111', 1),
('1609', 'Al Jufrah', '111', 1),
('1610', 'Al Khums', '111', 1),
('1611', 'Al Kufrah', '111', 1),
('1612', 'An Nuqat al Khams', '111', 1),
('1613', 'Ash Shati\'', '111', 1),
('1614', 'Awbari', '111', 1),
('1615', 'Az Zawiyah', '111', 1),
('1616', 'Banghazi', '111', 1),
('1617', 'Darnah', '111', 1),
('1618', 'Ghadamis', '111', 1),
('1619', 'Gharyan', '111', 1),
('1620', 'Misratah', '111', 1),
('1621', 'Murzuq', '111', 1),
('1622', 'Sabha', '111', 1),
('1623', 'Sawfajjin', '111', 1),
('1624', 'Surt', '111', 1),
('1625', 'Tarabulus', '111', 1),
('1626', 'Tarhunah', '111', 1),
('1627', 'Tubruq', '111', 1),
('1628', 'Yafran', '111', 1),
('1629', 'Zlitan', '111', 1),
('1630', 'Other', '111', 1),
('1631', 'Balzers', '112', 1),
('1632', 'Eschen', '112', 1),
('1633', 'Gamprin', '112', 1),
('1634', 'Mauren', '112', 1),
('1635', 'Planken', '112', 1),
('1636', 'Ruggell', '112', 1),
('1637', 'Schaan', '112', 1),
('1638', 'Schellenberg', '112', 1),
('1639', 'Triesen', '112', 1),
('1640', 'Triesenberg', '112', 1),
('1641', 'Vaduz', '112', 1),
('1642', 'Other', '112', 1),
('1643', 'Alytaus', '113', 1),
('1644', 'Kauno', '113', 1),
('1645', 'Klaipedos', '113', 1),
('1646', 'Marijampoles', '113', 1),
('1647', 'Panevezio', '113', 1),
('1648', 'Siauliu', '113', 1),
('1649', 'Taurages', '113', 1),
('1650', 'Telsiu', '113', 1),
('1651', 'Utenos', '113', 1),
('1652', 'Vilniaus', '113', 1),
('1653', 'Other', '113', 1);
INSERT INTO `mst_states` (`id`, `state_name`, `mst_countries_id`, `is_active`) VALUES
('1654', 'Diekirch', '114', 1),
('1655', 'Grevenmacher', '114', 1),
('1656', 'Luxembourg', '114', 1),
('1657', 'Other', '114', 1),
('1658', 'Other', '115', 1),
('1659', 'Aerodrom', '116', 1),
('1660', 'Aracinovo', '116', 1),
('1661', 'Berovo', '116', 1),
('1662', 'Bitola', '116', 1),
('1663', 'Bogdanci', '116', 1),
('1664', 'Bogovinje', '116', 1),
('1665', 'Bosilovo', '116', 1),
('1666', 'Brvenica', '116', 1),
('1667', 'Butel', '116', 1),
('1668', 'Cair', '116', 1),
('1669', 'Caska', '116', 1),
('1670', 'Centar', '116', 1),
('1671', 'Centar Zupa', '116', 1),
('1672', 'Cesinovo', '116', 1),
('1673', 'Cucer-Sandevo', '116', 1),
('1674', 'Debar', '116', 1),
('1675', 'Debartsa', '116', 1),
('1676', 'Delcevo', '116', 1),
('1677', 'Demir Hisar', '116', 1),
('1678', 'Demir Kapija', '116', 1),
('1679', 'Dojran', '116', 1),
('1680', 'Dolneni', '116', 1),
('1681', 'Drugovo', '116', 1),
('1682', 'Gazi Baba', '116', 1),
('1683', 'Gevgelija', '116', 1),
('1684', 'Gjorce Petrov', '116', 1),
('1685', 'Gostivar', '116', 1),
('1686', 'Gradsko', '116', 1),
('1687', 'Ilinden', '116', 1),
('1688', 'Jegunovce', '116', 1),
('1689', 'Karbinci', '116', 1),
('1690', 'Karpos', '116', 1),
('1691', 'Kavadarci', '116', 1),
('1692', 'Kicevo', '116', 1),
('1693', 'Kisela Voda', '116', 1),
('1694', 'Kocani', '116', 1),
('1695', 'Konce', '116', 1),
('1696', 'Kratovo', '116', 1),
('1697', 'Kriva Palanka', '116', 1),
('1698', 'Krivogastani', '116', 1),
('1699', 'Krusevo', '116', 1),
('1700', 'Kumanovo', '116', 1),
('1701', 'Lipkovo', '116', 1),
('1702', 'Lozovo', '116', 1),
('1703', 'Makedonska Kamenica', '116', 1),
('1704', 'Makedonski Brod', '116', 1),
('1705', 'Mavrovo i Rastusa', '116', 1),
('1706', 'Mogila', '116', 1),
('1707', 'Negotino', '116', 1),
('1708', 'Novaci', '116', 1),
('1709', 'Novo Selo', '116', 1),
('1710', 'Ohrid', '116', 1),
('1711', 'Oslomej', '116', 1),
('1712', 'Pehcevo', '116', 1),
('1713', 'Petrovec', '116', 1),
('1714', 'Plasnica', '116', 1),
('1715', 'Prilep', '116', 1),
('1716', 'Probistip', '116', 1),
('1717', 'Radovis', '116', 1),
('1718', 'Rankovce', '116', 1),
('1719', 'Resen', '116', 1),
('1720', 'Rosoman', '116', 1),
('1721', 'Saraj', '116', 1),
('1722', 'Skopje', '116', 1),
('1723', 'Sopiste', '116', 1),
('1724', 'Staro Nagoricane', '116', 1),
('1725', 'Stip', '116', 1),
('1726', 'Struga', '116', 1),
('1727', 'Strumica', '116', 1),
('1728', 'Studenicani', '116', 1),
('1729', 'Suto Orizari', '116', 1),
('1730', 'Sveti Nikole', '116', 1),
('1731', 'Tearce', '116', 1),
('1732', 'Tetovo', '116', 1),
('1733', 'Valandovo', '116', 1),
('1734', 'Vasilevo', '116', 1),
('1735', 'Veles', '116', 1),
('1736', 'Vevcani', '116', 1),
('1737', 'Vinica', '116', 1),
('1738', 'Vranestica', '116', 1),
('1739', 'Vrapciste', '116', 1),
('1740', 'Zajas', '116', 1),
('1741', 'Zelenikovo', '116', 1),
('1742', 'Zelino', '116', 1),
('1743', 'Zrnovci', '116', 1),
('1744', 'Other', '116', 1),
('1745', 'Antananarivo', '117', 1),
('1746', 'Antsiranana', '117', 1),
('1747', 'Fianarantsoa', '117', 1),
('1748', 'Mahajanga', '117', 1),
('1749', 'Toamasina', '117', 1),
('1750', 'Toliara', '117', 1),
('1751', 'Other', '117', 1),
('1752', 'Balaka', '118', 1),
('1753', 'Blantyre', '118', 1),
('1754', 'Chikwawa', '118', 1),
('1755', 'Chiradzulu', '118', 1),
('1756', 'Chitipa', '118', 1),
('1757', 'Dedza', '118', 1),
('1758', 'Dowa', '118', 1),
('1759', 'Karonga', '118', 1),
('1760', 'Kasungu', '118', 1),
('1761', 'Likoma', '118', 1),
('1762', 'Lilongwe', '118', 1),
('1763', 'Machinga', '118', 1),
('1764', 'Mangochi', '118', 1),
('1765', 'Mchinji', '118', 1),
('1766', 'Mulanje', '118', 1),
('1767', 'Mwanza', '118', 1),
('1768', 'Mzimba', '118', 1),
('1769', 'Ntcheu', '118', 1),
('1770', 'Nkhata Bay', '118', 1),
('1771', 'Nkhotakota', '118', 1),
('1772', 'Nsanje', '118', 1),
('1773', 'Ntchisi', '118', 1),
('1774', 'Phalombe', '118', 1),
('1775', 'Rumphi', '118', 1),
('1776', 'Salima', '118', 1),
('1777', 'Thyolo', '118', 1),
('1778', 'Zomba', '118', 1),
('1779', 'Other', '118', 1),
('1780', 'Johor', '119', 1),
('1781', 'Kedah', '119', 1),
('1782', 'Kelantan', '119', 1),
('1783', 'Kuala Lumpur', '119', 1),
('1784', 'Labuan', '119', 1),
('1785', 'Malacca', '119', 1),
('1786', 'Negeri Sembilan', '119', 1),
('1787', 'Pahang', '119', 1),
('1788', 'Perak', '119', 1),
('1789', 'Perlis', '119', 1),
('1790', 'Penang', '119', 1),
('1791', 'Sabah', '119', 1),
('1792', 'Sarawak', '119', 1),
('1793', 'Selangor', '119', 1),
('1794', 'Terengganu', '119', 1),
('1795', 'Other', '119', 1),
('1796', 'Alifu', '120', 1),
('1797', 'Baa', '120', 1),
('1798', 'Dhaalu', '120', 1),
('1799', 'Faafu', '120', 1),
('1800', 'Gaafu Alifu', '120', 1),
('1801', 'Gaafu Dhaalu', '120', 1),
('1802', 'Gnaviyani', '120', 1),
('1803', 'Haa Alifu', '120', 1),
('1804', 'Haa Dhaalu', '120', 1),
('1805', 'Kaafu', '120', 1),
('1806', 'Laamu', '120', 1),
('1807', 'Lhaviyani', '120', 1),
('1808', 'Maale', '120', 1),
('1809', 'Meemu', '120', 1),
('1810', 'Noonu', '120', 1),
('1811', 'Raa', '120', 1),
('1812', 'Seenu', '120', 1),
('1813', 'Shaviyani', '120', 1),
('1814', 'Thaa', '120', 1),
('1815', 'Vaavu', '120', 1),
('1816', 'Other', '120', 1),
('1817', 'Bamako (Capital)', '121', 1),
('1818', 'Gao', '121', 1),
('1819', 'Kayes', '121', 1),
('1820', 'Kidal', '121', 1),
('1821', 'Koulikoro', '121', 1),
('1822', 'Mopti', '121', 1),
('1823', 'Segou', '121', 1),
('1824', 'Sikasso', '121', 1),
('1825', 'Tombouctou', '121', 1),
('1826', 'Other', '121', 1),
('1827', 'Malta (General)', '122', 1),
('1828', 'Other', '122', 1),
('1829', 'Martinique (General)', '123', 1),
('1830', 'Other', '123', 1),
('1831', 'Adrar', '124', 1),
('1832', 'Assaba', '124', 1),
('1833', 'Brakna', '124', 1),
('1834', 'Dakhlet Nouadhibou', '124', 1),
('1835', 'Gorgol', '124', 1),
('1836', 'Guidimaka', '124', 1),
('1837', 'Hodh Ech Chargui', '124', 1),
('1838', 'Hodh El Gharbi', '124', 1),
('1839', 'Inchiri', '124', 1),
('1840', 'Nouakchott', '124', 1),
('1841', 'Tagant', '124', 1),
('1842', 'Tiris Zemmour', '124', 1),
('1843', 'Trarza', '124', 1),
('1844', 'Other', '124', 1),
('1845', 'Agalega Islands', '125', 1),
('1846', 'Black River', '125', 1),
('1847', 'Cargados Carajos Shoals', '125', 1),
('1848', 'Flacq', '125', 1),
('1849', 'Grand Port', '125', 1),
('1850', 'Moka', '125', 1),
('1851', 'Pamplemousses', '125', 1),
('1852', 'Plaines Wilhems', '125', 1),
('1853', 'Port Louis', '125', 1),
('1854', 'Riviere du Rempart', '125', 1),
('1855', 'Rodrigues', '125', 1),
('1856', 'Savanne', '125', 1),
('1857', 'Other', '125', 1),
('1858', 'Other', '126', 1),
('1859', 'Aguascalientes', '127', 1),
('1860', 'Baja California', '127', 1),
('1861', 'Baja California Sur', '127', 1),
('1862', 'Campeche', '127', 1),
('1863', 'Chiapas', '127', 1),
('1864', 'Chihuahua', '127', 1),
('1865', 'Coahuila de Zaragoza', '127', 1),
('1866', 'Colima', '127', 1),
('1867', 'Distrito Federal', '127', 1),
('1868', 'Durango', '127', 1),
('1869', 'Guanajuato', '127', 1),
('1870', 'Guerrero', '127', 1),
('1871', 'Hidalgo', '127', 1),
('1872', 'Jalisco', '127', 1),
('1873', 'Mexico', '127', 1),
('1874', 'Michoacan de Ocampo', '127', 1),
('1875', 'Morelos', '127', 1),
('1876', 'Nayarit', '127', 1),
('1877', 'Nuevo Leon', '127', 1),
('1878', 'Oaxaca', '127', 1),
('1879', 'Puebla', '127', 1),
('1880', 'Queretaro de Arteaga', '127', 1),
('1881', 'Quintana Roo', '127', 1),
('1882', 'San Luis Potosi', '127', 1),
('1883', 'Sinaloa', '127', 1),
('1884', 'Sonora', '127', 1),
('1885', 'Tabasco', '127', 1),
('1886', 'Tamaulipas', '127', 1),
('1887', 'Tlaxcala', '127', 1),
('1888', 'Veracruz-Llave', '127', 1),
('1889', 'Yucatan', '127', 1),
('1890', 'Zacatecas', '127', 1),
('1891', 'Other', '127', 1),
('1892', 'Pohnpoe', '128', 1),
('1893', 'Other', '128', 1),
('1894', 'Anenii Noi', '129', 1),
('1895', 'Basarabeasca', '129', 1),
('1896', 'Briceni', '129', 1),
('1897', 'Cahul', '129', 1),
('1898', 'Cantemir', '129', 1),
('1899', 'Calarasi', '129', 1),
('1900', 'Causeni', '129', 1),
('1901', 'Cimislia', '129', 1),
('1902', 'Criuleni', '129', 1),
('1903', 'Donduseni', '129', 1),
('1904', 'Drochia', '129', 1),
('1905', 'Dubasari', '129', 1),
('1906', 'Edinet', '129', 1),
('1907', 'Falesti', '129', 1),
('1908', 'Floresti', '129', 1),
('1909', 'Glodeni', '129', 1),
('1910', 'Hincesti', '129', 1),
('1911', 'Ialoveni', '129', 1),
('1912', 'Leova', '129', 1),
('1913', 'Nisporeni', '129', 1),
('1914', 'Ocnita', '129', 1),
('1915', 'Orhei', '129', 1),
('1916', 'Rezina', '129', 1),
('1917', 'Riscani', '129', 1),
('1918', 'Singerei', '129', 1),
('1919', 'Soldanesti', '129', 1),
('1920', 'Soroca', '129', 1),
('1921', 'Stefan-Voda', '129', 1),
('1922', 'Straseni', '129', 1),
('1923', 'Taraclia', '129', 1),
('1924', 'Telenesti', '129', 1),
('1925', 'Ungheni', '129', 1),
('1926', 'Balti', '129', 1),
('1927', 'Bender', '129', 1),
('1928', 'Chisinau', '129', 1),
('1929', 'Gagauzia', '129', 1),
('1930', 'Stinga Nistrului', '129', 1),
('1931', 'Other', '129', 1),
('1932', 'Monaco (General)', '130', 1),
('1933', 'Other', '130', 1),
('1934', 'Arhangay', '131', 1),
('1935', 'Bayanhongor', '131', 1),
('1936', 'Bayan-Olgiy', '131', 1),
('1937', 'Bulgan', '131', 1),
('1938', 'Darhan Uul', '131', 1),
('1939', 'Dornod', '131', 1),
('1940', 'Dornogovi', '131', 1),
('1941', 'Dundgovi', '131', 1),
('1942', 'Dzavhan', '131', 1),
('1943', 'Govi-Altay', '131', 1),
('1944', 'Govi-Sumber', '131', 1),
('1945', 'Hentiy', '131', 1),
('1946', 'Hovd', '131', 1),
('1947', 'Hovsgol', '131', 1),
('1948', 'Omnogovi', '131', 1),
('1949', 'Orhon', '131', 1),
('1950', 'Ovorhangay', '131', 1),
('1951', 'Selenge', '131', 1),
('1952', 'Suhbaatar', '131', 1),
('1953', 'Tov', '131', 1),
('1954', 'Ulaanbaatar', '131', 1),
('1955', 'Uvs', '131', 1),
('1956', 'Other', '131', 1),
('1957', 'Parish of Saint Anthony', '132', 1),
('1958', 'Other', '132', 1),
('1959', 'Agadir', '133', 1),
('1960', 'Al Hoceima', '133', 1),
('1961', 'Azilal', '133', 1),
('1962', 'Beni Mellal', '133', 1),
('1963', 'Ben Slimane', '133', 1),
('1964', 'Boulemane', '133', 1),
('1965', 'Casablanca', '133', 1),
('1966', 'Chaouen', '133', 1),
('1967', 'El Jadida', '133', 1),
('1968', 'El Kelaa des Sraghna', '133', 1),
('1969', 'Er Rachidia', '133', 1),
('1970', 'Essaouira', '133', 1),
('1971', 'Fes', '133', 1),
('1972', 'Figuig', '133', 1),
('1973', 'Guelmim', '133', 1),
('1974', 'Ifrane', '133', 1),
('1975', 'Kenitra', '133', 1),
('1976', 'Khemisset', '133', 1),
('1977', 'Khenifra', '133', 1),
('1978', 'Khouribga', '133', 1),
('1979', 'Laayoune', '133', 1),
('1980', 'Larache', '133', 1),
('1981', 'Marrakech', '133', 1),
('1982', 'Meknes', '133', 1),
('1983', 'Nador', '133', 1),
('1984', 'Ouarzazate', '133', 1),
('1985', 'Oujda', '133', 1),
('1986', 'Rabat-Sale', '133', 1),
('1987', 'Safi', '133', 1),
('1988', 'Settat', '133', 1),
('1989', 'Sidi Kacem', '133', 1),
('1990', 'Tangier', '133', 1),
('1991', 'Tan-Tan', '133', 1),
('1992', 'Taounate', '133', 1),
('1993', 'Taroudannt', '133', 1),
('1994', 'Tata', '133', 1),
('1995', 'Taza', '133', 1),
('1996', 'Tetouan', '133', 1),
('1997', 'Tiznit', '133', 1),
('1998', 'Other', '133', 1),
('1999', 'Cabo Delgado', '134', 1),
('2000', 'Gaza', '134', 1),
('2001', 'Inhambane', '134', 1),
('2002', 'Manica', '134', 1),
('2003', 'Maputo', '134', 1),
('2004', 'Cidade de Maputo', '134', 1),
('2005', 'Nampula', '134', 1),
('2006', 'Niassa', '134', 1),
('2007', 'Sofala', '134', 1),
('2008', 'Tete', '134', 1),
('2009', 'Zambezia', '134', 1),
('2010', 'Other', '134', 1),
('2011', 'Irrawaddy', '135', 1),
('2012', 'Mandalay', '135', 1),
('2013', 'Mon', '135', 1),
('2014', 'Rakhine', '135', 1),
('2015', 'Rangoon', '135', 1),
('2016', 'Sagaing', '135', 1),
('2017', 'Shan', '135', 1),
('2018', 'Other', '135', 1),
('2019', 'Caprivi', '136', 1),
('2020', 'Erongo', '136', 1),
('2021', 'Hardap', '136', 1),
('2022', 'Karas', '136', 1),
('2023', 'Khomas', '136', 1),
('2024', 'Kunene', '136', 1),
('2025', 'Ohangwena', '136', 1),
('2026', 'Okavango', '136', 1),
('2027', 'Omaheke', '136', 1),
('2028', 'Omusati', '136', 1),
('2029', 'Oshana', '136', 1),
('2030', 'Oshikoto', '136', 1),
('2031', 'Otjozondjupa', '136', 1),
('2032', 'Other', '136', 1),
('2033', 'Nauru (General)', '137', 1),
('2034', 'Other', '137', 1),
('2035', 'Bagmati', '138', 1),
('2036', 'Bheri', '138', 1),
('2037', 'Dhawalagiri', '138', 1),
('2038', 'Gandaki', '138', 1),
('2039', 'Janakpur', '138', 1),
('2040', 'Karnali', '138', 1),
('2041', 'Kosi', '138', 1),
('2042', 'Lumbini', '138', 1),
('2043', 'Mahakali', '138', 1),
('2044', 'Mechi', '138', 1),
('2045', 'Narayani', '138', 1),
('2046', 'Rapti', '138', 1),
('2047', 'Sagarmatha', '138', 1),
('2048', 'Seti', '138', 1),
('2049', 'Other', '138', 1),
('2050', 'Drenthe', '139', 1),
('2051', 'Flevoland', '139', 1),
('2052', 'Friesland', '139', 1),
('2053', 'Gelderland', '139', 1),
('2054', 'Groningen', '139', 1),
('2055', 'Limburg', '139', 1),
('2056', 'Noord-Brabant', '139', 1),
('2057', 'Noord-Holland', '139', 1),
('2058', 'Overijssel', '139', 1),
('2059', 'Utrecht', '139', 1),
('2060', 'Zeeland', '139', 1),
('2061', 'Zuid-Holland', '139', 1),
('2062', 'Other', '139', 1),
('2063', 'Curacao Island', '140', 1),
('2064', 'Other', '140', 1),
('2065', 'New Caledonia Island', '141', 1),
('2066', 'Other', '141', 1),
('2067', 'Auckland', '142', 1),
('2068', 'Bay of Plenty', '142', 1),
('2069', 'Canterbury', '142', 1),
('2070', 'Chatham Islands', '142', 1),
('2071', 'Gisborne', '142', 1),
('2072', 'Hawke\'s Bay', '142', 1),
('2073', 'Manawatu-Wanganui', '142', 1),
('2074', 'Marlborough', '142', 1),
('2075', 'Nelson', '142', 1),
('2076', 'Northland', '142', 1),
('2077', 'Otago', '142', 1),
('2078', 'Southland', '142', 1),
('2079', 'Taranaki', '142', 1),
('2080', 'Tasman', '142', 1),
('2081', 'Waikato', '142', 1),
('2082', 'Wellington', '142', 1),
('2083', 'West Coast', '142', 1),
('2084', 'Other', '142', 1),
('2085', 'Atlantico Norte', '143', 1),
('2086', 'Atlantico Sur', '143', 1),
('2087', 'Boaco', '143', 1),
('2088', 'Carazo', '143', 1),
('2089', 'Chinandega', '143', 1),
('2090', 'Chontales', '143', 1),
('2091', 'Esteli', '143', 1),
('2092', 'Granada', '143', 1),
('2093', 'Jinotega', '143', 1),
('2094', 'Leon', '143', 1),
('2095', 'Madriz', '143', 1),
('2096', 'Managua', '143', 1),
('2097', 'Masaya', '143', 1),
('2098', 'Matagalpa', '143', 1),
('2099', 'Nueva Segovia', '143', 1),
('2100', 'Rio San Juan', '143', 1),
('2101', 'Rivas', '143', 1),
('2102', 'Other', '143', 1),
('2103', 'Agadez', '144', 1),
('2104', 'Diffa', '144', 1),
('2105', 'Dosso', '144', 1),
('2106', 'Maradi', '144', 1),
('2107', 'Niamey', '144', 1),
('2108', 'Tahoua', '144', 1),
('2109', 'Tillaberi', '144', 1),
('2110', 'Zinder', '144', 1),
('2111', 'Other', '144', 1),
('2112', 'Abia', '145', 1),
('2113', 'Abuja Federal Capital', '145', 1),
('2114', 'Adamawa', '145', 1),
('2115', 'Akwa Ibom', '145', 1),
('2116', 'Anambra', '145', 1),
('2117', 'Bauchi', '145', 1),
('2118', 'Bayelsa', '145', 1),
('2119', 'Benue', '145', 1),
('2120', 'Borno', '145', 1),
('2121', 'Cross River', '145', 1),
('2122', 'Delta', '145', 1),
('2123', 'Ebonyi', '145', 1),
('2124', 'Edo', '145', 1),
('2125', 'Ekiti', '145', 1),
('2126', 'Enugu', '145', 1),
('2127', 'Gombe', '145', 1),
('2128', 'Imo', '145', 1),
('2129', 'Jigawa', '145', 1),
('2130', 'Kaduna', '145', 1),
('2131', 'Kano', '145', 1),
('2132', 'Katsina', '145', 1),
('2133', 'Kebbi', '145', 1),
('2134', 'Kogi', '145', 1),
('2135', 'Kwara', '145', 1),
('2136', 'Lagos', '145', 1),
('2137', 'Nassarawa', '145', 1),
('2138', 'Niger', '145', 1),
('2139', 'Ogun', '145', 1),
('2140', 'Ondo', '145', 1),
('2141', 'Osun', '145', 1),
('2142', 'Oyo', '145', 1),
('2143', 'Plateau', '145', 1),
('2144', 'Rivers', '145', 1),
('2145', 'Sokoto', '145', 1),
('2146', 'Taraba', '145', 1),
('2147', 'Yobe', '145', 1),
('2148', 'Zamfara', '145', 1),
('2149', 'Other', '145', 1),
('2150', 'Niue (General)', '146', 1),
('2151', 'Other', '146', 1),
('2152', 'Other', '147', 1),
('2153', 'Akershus', '148', 1),
('2154', 'Aust-Agder', '148', 1),
('2155', 'Buskerud', '148', 1),
('2156', 'Finnmark', '148', 1),
('2157', 'Hedmark', '148', 1),
('2158', 'Hordaland', '148', 1),
('2159', 'More og Romsdal', '148', 1),
('2160', 'Nordland', '148', 1),
('2161', 'Nord-Trondelag', '148', 1),
('2162', 'Oppland', '148', 1),
('2163', 'Oslo', '148', 1),
('2164', 'Ostfold', '148', 1),
('2165', 'Rogaland', '148', 1),
('2166', 'Sogn og Fjordane', '148', 1),
('2167', 'Sor-Trondelag', '148', 1),
('2168', 'Telemark', '148', 1),
('2169', 'Troms', '148', 1),
('2170', 'Vest-Agder', '148', 1),
('2171', 'Vestfold', '148', 1),
('2172', 'Other', '148', 1),
('2173', 'Ad Dakhiliyah', '149', 1),
('2174', 'Al Batinah', '149', 1),
('2175', 'Al Wusta', '149', 1),
('2176', 'Ash Sharqiyah', '149', 1),
('2177', 'Az Zahirah', '149', 1),
('2178', 'Masqat', '149', 1),
('2179', 'Musandam', '149', 1),
('2180', 'Dhofar', '149', 1),
('2181', 'Other', '149', 1),
('2182', 'Balochistan', '150', 1),
('2183', 'North-West Frontier Province', '150', 1),
('2184', 'Punjab', '150', 1),
('2185', 'Sindh', '150', 1),
('2186', 'Islamabad Capital Territory', '150', 1),
('2187', 'Federally Administered Tribal Areas', '150', 1),
('2188', 'Other', '150', 1),
('2189', 'Bocas del Toro', '151', 1),
('2190', 'Chiriqui', '151', 1),
('2191', 'Cocle', '151', 1),
('2192', 'Colon', '151', 1),
('2193', 'Darien', '151', 1),
('2194', 'Herrera', '151', 1),
('2195', 'Los Santos', '151', 1),
('2196', 'Panama', '151', 1),
('2197', 'San Blas', '151', 1),
('2198', 'Veraguas', '151', 1),
('2199', 'Other', '151', 1),
('2200', 'Bougainville', '152', 1),
('2201', 'Central', '152', 1),
('2202', 'Chimbu', '152', 1),
('2203', 'Eastern Highlands', '152', 1),
('2204', 'East New Britain', '152', 1),
('2205', 'East Sepik', '152', 1),
('2206', 'Enga', '152', 1),
('2207', 'Gulf', '152', 1),
('2208', 'Madang', '152', 1),
('2209', 'Manus', '152', 1),
('2210', 'Milne Bay', '152', 1),
('2211', 'Morobe', '152', 1),
('2212', 'National Capital', '152', 1),
('2213', 'New Ireland', '152', 1),
('2214', 'Northern', '152', 1),
('2215', 'Sandaun', '152', 1),
('2216', 'Southern Highlands', '152', 1),
('2217', 'Western', '152', 1),
('2218', 'Western Highlands', '152', 1),
('2219', 'West New Britain', '152', 1),
('2220', 'Other', '152', 1),
('2221', 'Alto Paraguay', '153', 1),
('2222', 'Alto Parana', '153', 1),
('2223', 'Amambay', '153', 1),
('2224', 'Asuncion', '153', 1),
('2225', 'Boqueron', '153', 1),
('2226', 'Caaguazu', '153', 1),
('2227', 'Caazapa', '153', 1),
('2228', 'Canindeyu', '153', 1),
('2229', 'Central', '153', 1),
('2230', 'Concepcion', '153', 1),
('2231', 'Cordillera', '153', 1),
('2232', 'Guaira', '153', 1),
('2233', 'Itapua', '153', 1),
('2234', 'Misiones', '153', 1),
('2235', 'Neembucu', '153', 1),
('2236', 'Paraguari', '153', 1),
('2237', 'Presidente Hayes', '153', 1),
('2238', 'San Pedro', '153', 1),
('2239', 'Other', '153', 1),
('2240', 'Amazonas', '154', 1),
('2241', 'Ancash', '154', 1),
('2242', 'Apurimac', '154', 1),
('2243', 'Arequipa', '154', 1),
('2244', 'Ayacucho', '154', 1),
('2245', 'Cajamarca', '154', 1),
('2246', 'Callao', '154', 1),
('2247', 'Cusco', '154', 1),
('2248', 'Huancavelica', '154', 1),
('2249', 'Huanuco', '154', 1),
('2250', 'Ica', '154', 1),
('2251', 'Junin', '154', 1),
('2252', 'La Libertad', '154', 1),
('2253', 'Lambayeque', '154', 1),
('2254', 'Lima', '154', 1),
('2255', 'Loreto', '154', 1),
('2256', 'Madre de Dios', '154', 1),
('2257', 'Moquegua', '154', 1),
('2258', 'Pasco', '154', 1),
('2259', 'Piura', '154', 1),
('2260', 'Puno', '154', 1),
('2261', 'San Martin', '154', 1),
('2262', 'Tacna', '154', 1),
('2263', 'Tumbes', '154', 1),
('2264', 'Ucayali', '154', 1),
('2265', 'Other', '154', 1),
('2266', 'Abra', '155', 1),
('2267', 'Agusan del Norte', '155', 1),
('2268', 'Agusan del Sur', '155', 1),
('2269', 'Aklan', '155', 1),
('2270', 'Albay', '155', 1),
('2271', 'Antique', '155', 1),
('2272', 'Apayao', '155', 1),
('2273', 'Aurora', '155', 1),
('2274', 'Basilan', '155', 1),
('2275', 'Bataan', '155', 1),
('2276', 'Batanes', '155', 1),
('2277', 'Batangas', '155', 1),
('2278', 'Biliran', '155', 1),
('2279', 'Benguet', '155', 1),
('2280', 'Bohol', '155', 1),
('2281', 'Bukidnon', '155', 1),
('2282', 'Bulacan', '155', 1),
('2283', 'Cagayan', '155', 1),
('2284', 'Camarines Norte', '155', 1),
('2285', 'Camarines Sur', '155', 1),
('2286', 'Camiguin', '155', 1),
('2287', 'Capiz', '155', 1),
('2288', 'Catanduanes', '155', 1),
('2289', 'Cavite', '155', 1),
('2290', 'Cebu', '155', 1),
('2291', 'Compostela', '155', 1),
('2292', 'Davao del Norte', '155', 1),
('2293', 'Davao del Sur', '155', 1),
('2294', 'Davao Oriental', '155', 1),
('2295', 'Eastern Samar', '155', 1),
('2296', 'Guimaras', '155', 1),
('2297', 'Ifugao', '155', 1),
('2298', 'Ilocos Norte', '155', 1),
('2299', 'Ilocos Sur', '155', 1),
('2300', 'Iloilo', '155', 1),
('2301', 'Isabela', '155', 1),
('2302', 'Kalinga', '155', 1),
('2303', 'Laguna', '155', 1),
('2304', 'Lanao del Norte', '155', 1),
('2305', 'Lanao del Sur', '155', 1),
('2306', 'La Union', '155', 1),
('2307', 'Leyte', '155', 1),
('2308', 'Maguindanao', '155', 1),
('2309', 'Marinduque', '155', 1),
('2310', 'Masbate', '155', 1),
('2311', 'Mindoro Occidental', '155', 1),
('2312', 'Mindoro Oriental', '155', 1),
('2313', 'Misamis Occidental', '155', 1),
('2314', 'Misamis Oriental', '155', 1),
('2315', 'Mountain Province', '155', 1),
('2316', 'Negros Occidental', '155', 1),
('2317', 'Negros Oriental', '155', 1),
('2318', 'North Cotabato', '155', 1),
('2319', 'Northern Samar', '155', 1),
('2320', 'Nueva Ecija', '155', 1),
('2321', 'Nueva Vizcaya', '155', 1),
('2322', 'Palawan', '155', 1),
('2323', 'Pampanga', '155', 1),
('2324', 'Pangasinan', '155', 1),
('2325', 'Quezon', '155', 1),
('2326', 'Quirino', '155', 1),
('2327', 'Rizal', '155', 1),
('2328', 'Romblon', '155', 1),
('2329', 'Samar', '155', 1),
('2330', 'Sarangani', '155', 1),
('2331', 'Siquijor', '155', 1),
('2332', 'Sorsogon', '155', 1),
('2333', 'South Cotabato', '155', 1),
('2334', 'Southern Leyte', '155', 1),
('2335', 'Sultan Kudarat', '155', 1),
('2336', 'Sulu', '155', 1),
('2337', 'Surigao del Norte', '155', 1),
('2338', 'Surigao del Sur', '155', 1),
('2339', 'Tarlac', '155', 1),
('2340', 'Tawi-Tawi', '155', 1),
('2341', 'Zambales', '155', 1),
('2342', 'Zamboanga del Norte', '155', 1),
('2343', 'Zamboanga del Sur', '155', 1),
('2344', 'Zamboanga Sibugay', '155', 1),
('2345', 'Other', '155', 1),
('2346', 'Other', '156', 1),
('2347', 'Greater Poland (Wielkopolskie)', '157', 1),
('2348', 'Kuyavian-Pomeranian (Kujawsko-Pomorskie)', '157', 1),
('2349', 'Lesser Poland (Malopolskie)', '157', 1),
('2350', 'Lodz (Lodzkie)', '157', 1),
('2351', 'Lower Silesian (Dolnoslaskie)', '157', 1),
('2352', 'Lublin (Lubelskie)', '157', 1),
('2353', 'Lubusz (Lubuskie)', '157', 1),
('2354', 'Masovian (Mazowieckie)', '157', 1),
('2355', 'Opole (Opolskie)', '157', 1),
('2356', 'Podlasie (Podlaskie)', '157', 1),
('2357', 'Pomeranian (Pomorskie)', '157', 1),
('2358', 'Silesian (Slaskie)', '157', 1),
('2359', 'Subcarpathian (Podkarpackie)', '157', 1),
('2360', 'Swietokrzyskie (Swietokrzyskie)', '157', 1),
('2361', 'Warmian-Masurian (Warminsko-Mazurskie)', '157', 1),
('2362', 'West Pomeranian (Zachodniopomorskie)', '157', 1),
('2363', 'Other', '157', 1),
('2364', 'Aveiro', '158', 1),
('2365', 'Acores', '158', 1),
('2366', 'Beja', '158', 1),
('2367', 'Braga', '158', 1),
('2368', 'Braganca', '158', 1),
('2369', 'Castelo Branco', '158', 1),
('2370', 'Coimbra', '158', 1),
('2371', 'Evora', '158', 1),
('2372', 'Faro', '158', 1),
('2373', 'Guarda', '158', 1),
('2374', 'Leiria', '158', 1),
('2375', 'Lisboa', '158', 1),
('2376', 'Madeira', '158', 1),
('2377', 'Portalegre', '158', 1),
('2378', 'Porto', '158', 1),
('2379', 'Santarem', '158', 1),
('2380', 'Setubal', '158', 1),
('2381', 'Viana do Castelo', '158', 1),
('2382', 'Vila Real', '158', 1),
('2383', 'Viseu', '158', 1),
('2384', 'Other', '158', 1),
('2385', 'Aguadilla', '159', 1),
('2386', 'Arecibo', '159', 1),
('2387', 'Bayamon', '159', 1),
('2388', 'Caguas', '159', 1),
('2389', 'Carolina', '159', 1),
('2390', 'Ponce', '159', 1),
('2391', 'San Juan', '159', 1),
('2392', 'Other', '159', 1),
('2393', 'Ad Dawhah', '160', 1),
('2394', 'Al Ghuwayriyah', '160', 1),
('2395', 'Al Jumayliyah', '160', 1),
('2396', 'Al Khawr', '160', 1),
('2397', 'Al Wakrah', '160', 1),
('2398', 'Ar Rayyan', '160', 1),
('2399', 'Jarayan al Batinah', '160', 1),
('2400', 'Madinat ash Shamal', '160', 1),
('2401', 'Umm Sa\'id', '160', 1),
('2402', 'Umm Salal', '160', 1),
('2403', 'Other', '160', 1),
('2404', 'Reunion (General)', '161', 1),
('2405', 'Other', '161', 1),
('2406', 'Alba', '162', 1),
('2407', 'Arad', '162', 1),
('2408', 'Arges', '162', 1),
('2409', 'Bacau', '162', 1),
('2410', 'Bihor', '162', 1),
('2411', 'Bistrita-Nasaud', '162', 1),
('2412', 'Botosani', '162', 1),
('2413', 'Braila', '162', 1),
('2414', 'Brasov', '162', 1),
('2415', 'Bucuresti', '162', 1),
('2416', 'Buzau', '162', 1),
('2417', 'Calarasi', '162', 1),
('2418', 'Caras-Severin', '162', 1),
('2419', 'Cluj', '162', 1),
('2420', 'Constanta', '162', 1),
('2421', 'Covasna', '162', 1),
('2422', 'Dimbovita', '162', 1),
('2423', 'Dolj', '162', 1),
('2424', 'Galati', '162', 1),
('2425', 'Gorj', '162', 1),
('2426', 'Giurgiu', '162', 1),
('2427', 'Harghita', '162', 1),
('2428', 'Hunedoara', '162', 1),
('2429', 'Ialomita', '162', 1),
('2430', 'Iasi', '162', 1),
('2431', 'Ilfov', '162', 1),
('2432', 'Maramures', '162', 1),
('2433', 'Mehedinti', '162', 1),
('2434', 'Mures', '162', 1),
('2435', 'Neamt', '162', 1),
('2436', 'Olt', '162', 1),
('2437', 'Prahova', '162', 1),
('2438', 'Salaj', '162', 1),
('2439', 'Satu Mare', '162', 1),
('2440', 'Sibiu', '162', 1),
('2441', 'Suceava', '162', 1),
('2442', 'Teleorman', '162', 1),
('2443', 'Timis', '162', 1),
('2444', 'Tulcea', '162', 1),
('2445', 'Vaslui', '162', 1),
('2446', 'Vilcea', '162', 1),
('2447', 'Vrancea', '162', 1),
('2448', 'Other', '162', 1),
('2449', 'Amur', '163', 1),
('2450', 'Arkhangel\'sk', '163', 1),
('2451', 'Astrakhan\'', '163', 1),
('2452', 'Belgorod', '163', 1),
('2453', 'Bryansk', '163', 1),
('2454', 'Chelyabinsk', '163', 1),
('2455', 'Chita', '163', 1),
('2456', 'Irkutsk', '163', 1),
('2457', 'Ivanovo', '163', 1),
('2458', 'Kaliningrad', '163', 1),
('2459', 'Kaluga', '163', 1),
('2460', 'Kamchatka', '163', 1),
('2461', 'Kemerovo', '163', 1),
('2462', 'Kirov', '163', 1),
('2463', 'Kostroma', '163', 1),
('2464', 'Kurgan', '163', 1),
('2465', 'Kursk', '163', 1),
('2466', 'Leningrad', '163', 1),
('2467', 'Lipetsk', '163', 1),
('2468', 'Magadan', '163', 1),
('2469', 'Moscow', '163', 1),
('2470', 'Murmansk', '163', 1),
('2471', 'Nizhniy Novgorod', '163', 1),
('2472', 'Novgorod', '163', 1),
('2473', 'Novosibirsk', '163', 1),
('2474', 'Omsk', '163', 1),
('2475', 'Orenburg', '163', 1),
('2476', 'Orel', '163', 1),
('2477', 'Penza', '163', 1),
('2478', 'Perm\'', '163', 1),
('2479', 'Pskov', '163', 1),
('2480', 'Rostov', '163', 1),
('2481', 'Ryazan\'', '163', 1),
('2482', 'Sakhalin', '163', 1),
('2483', 'Samara', '163', 1),
('2484', 'Saratov', '163', 1),
('2485', 'Smolensk', '163', 1),
('2486', 'Sverdlovsk', '163', 1),
('2487', 'Tambov', '163', 1),
('2488', 'Tomsk', '163', 1),
('2489', 'Tula', '163', 1),
('2490', 'Tver\'', '163', 1),
('2491', 'Tyumen\'', '163', 1),
('2492', 'Ul\'yanovsk', '163', 1),
('2493', 'Vladimir', '163', 1),
('2494', 'Volgograd', '163', 1),
('2495', 'Vologda', '163', 1),
('2496', 'Voronezh', '163', 1),
('2497', 'Yaroslavl\'', '163', 1),
('2498', 'Adygeya', '163', 1),
('2499', 'Altay', '163', 1),
('2500', 'Bashkortostan', '163', 1),
('2501', 'Buryatiya', '163', 1),
('2502', 'Chechnya', '163', 1),
('2503', 'Chuvashiya', '163', 1),
('2504', 'Dagestan', '163', 1),
('2505', 'Ingushetiya', '163', 1),
('2506', 'Kabardino-Balkariya', '163', 1),
('2507', 'Kalmykiya', '163', 1),
('2508', 'Karachayevo-Cherkesiya', '163', 1),
('2509', 'Kareliya', '163', 1),
('2510', 'Khakasiya', '163', 1),
('2511', 'Komi', '163', 1),
('2512', 'Mariy-El', '163', 1),
('2513', 'Mordoviya', '163', 1),
('2514', 'Sakha', '163', 1),
('2515', 'North Ossetia', '163', 1),
('2516', 'Tatarstan', '163', 1),
('2517', 'Tyva', '163', 1),
('2518', 'Udmurtiya', '163', 1),
('2519', 'Aga Buryat', '163', 1),
('2520', 'Chukotka', '163', 1),
('2521', 'Evenk', '163', 1),
('2522', 'Khanty-Mansi', '163', 1),
('2523', 'Komi-Permyak', '163', 1),
('2524', 'Koryak', '163', 1),
('2525', 'Nenets', '163', 1),
('2526', 'Taymyr', '163', 1),
('2527', 'Ust\'-Orda Buryat', '163', 1),
('2528', 'Yamalo-Nenets', '163', 1),
('2529', 'Altay', '163', 1),
('2530', 'Khabarovsk', '163', 1),
('2531', 'Krasnodar', '163', 1),
('2532', 'Krasnoyarsk', '163', 1),
('2533', 'Primorskiy', '163', 1),
('2534', 'Stavropol\'', '163', 1),
('2535', 'Moscow', '163', 1),
('2536', 'St. Petersburg', '163', 1),
('2537', 'Yevrey', '163', 1),
('2538', 'Other', '163', 1),
('2539', 'Butare', '164', 1),
('2540', 'Byumba', '164', 1),
('2541', 'Cyangugu', '164', 1),
('2542', 'Gikongoro', '164', 1),
('2543', 'Gisenyi', '164', 1),
('2544', 'Gitarama', '164', 1),
('2545', 'Kibungo', '164', 1),
('2546', 'Kibuye', '164', 1),
('2547', 'Kigali Rurale', '164', 1),
('2548', 'Kigali-ville', '164', 1),
('2549', 'Umutara', '164', 1),
('2550', 'Ruhengeri', '164', 1),
('2551', 'Other', '164', 1),
('2552', 'A\'ana', '165', 1),
('2553', 'Aiga-i-le-Tai', '165', 1),
('2554', 'Atua', '165', 1),
('2555', 'Fa\'asaleleaga', '165', 1),
('2556', 'Gaga\'emauga', '165', 1),
('2557', 'Gagaifomauga', '165', 1),
('2558', 'Palauli', '165', 1),
('2559', 'Satupa\'itea', '165', 1),
('2560', 'Tuamasaga', '165', 1),
('2561', 'Va\'a-o-Fonoti', '165', 1),
('2562', 'Vaisigano', '165', 1),
('2563', 'Other', '165', 1),
('2564', 'Acquaviva', '166', 1),
('2565', 'Borgo Maggiore', '166', 1),
('2566', 'Chiesanuova', '166', 1),
('2567', 'Domagnano', '166', 1),
('2568', 'Faetano', '166', 1),
('2569', 'Fiorentino', '166', 1),
('2570', 'Montegiardino', '166', 1),
('2571', 'San Marino Citta', '166', 1),
('2572', 'Serravalle', '166', 1),
('2573', 'Other', '166', 1),
('2574', 'Principe', '167', 1),
('2575', 'Principes', '167', 1),
('2576', 'Sao Tome', '167', 1),
('2577', 'Other', '167', 1),
('2578', 'Al Bahah', '168', 1),
('2579', 'Al Hudud ash Shamaliyah', '168', 1),
('2580', 'Al Jawf', '168', 1),
('2581', 'Al Madinah', '168', 1),
('2582', 'Al Qasim', '168', 1),
('2583', 'Ar Riyad', '168', 1),
('2584', 'Ash Sharqiyah', '168', 1),
('2585', '\'Asir', '168', 1),
('2586', 'Ha\'il', '168', 1),
('2587', 'Jizan', '168', 1),
('2588', 'Makkah', '168', 1),
('2589', 'Najran', '168', 1),
('2590', 'Tabuk', '168', 1),
('2591', 'Other', '168', 1),
('2592', 'Dakar', '169', 1),
('2593', 'Diourbel', '169', 1),
('2594', 'Fatick', '169', 1),
('2595', 'Kaolack', '169', 1),
('2596', 'Kolda', '169', 1),
('2597', 'Louga', '169', 1),
('2598', 'Matam', '169', 1),
('2599', 'Saint-Louis', '169', 1),
('2600', 'Tambacounda', '169', 1),
('2601', 'Thies', '169', 1),
('2602', 'Ziguinchor', '169', 1),
('2603', 'Other', '169', 1),
('2604', 'Kosovo', '170', 1),
('2605', 'Montenegro', '170', 1),
('2606', 'Serbia', '170', 1),
('2607', 'Vojvodina', '170', 1),
('2608', 'Other', '170', 1),
('2609', 'Anse aux Pins', '171', 1),
('2610', 'Anse Boileau', '171', 1),
('2611', 'Anse Etoile', '171', 1),
('2612', 'Anse Louis', '171', 1),
('2613', 'Anse Royale', '171', 1),
('2614', 'Baie Lazare', '171', 1),
('2615', 'Baie Sainte Anne', '171', 1),
('2616', 'Beau Vallon', '171', 1),
('2617', 'Bel Air', '171', 1),
('2618', 'Bel Ombre', '171', 1),
('2619', 'Cascade', '171', 1),
('2620', 'Glacis', '171', 1),
('2621', 'Grand\' Anse', '171', 1),
('2622', 'Grand\' Anse', '171', 1),
('2623', 'La Digue', '171', 1),
('2624', 'La Riviere Anglaise', '171', 1),
('2625', 'Mont Buxton', '171', 1),
('2626', 'Mont Fleuri', '171', 1),
('2627', 'Plaisance', '171', 1),
('2628', 'Pointe La Rue', '171', 1),
('2629', 'Port Glaud', '171', 1),
('2630', 'Saint Louis', '171', 1),
('2631', 'Takamaka', '171', 1),
('2632', 'Other', '171', 1),
('2633', 'Western Area', '172', 1),
('2634', 'Other', '172', 1),
('2635', 'Singapore (General)', '173', 1),
('2636', 'Other', '173', 1),
('2637', 'Banskobystricky', '174', 1),
('2638', 'Bratislavsky', '174', 1),
('2639', 'Kosicky', '174', 1),
('2640', 'Nitriansky', '174', 1),
('2641', 'Presovsky', '174', 1),
('2642', 'Trenciansky', '174', 1),
('2643', 'Trnavsky', '174', 1),
('2644', 'Zilinsky', '174', 1),
('2645', 'Other', '174', 1),
('2646', 'Ajdovscina', '175', 1),
('2647', 'Beltinci', '175', 1),
('2648', 'Benedikt', '175', 1),
('2649', 'Bistrica ob Sotli', '175', 1),
('2650', 'Bled', '175', 1),
('2651', 'Bloke', '175', 1),
('2652', 'Bohinj', '175', 1),
('2653', 'Borovnica', '175', 1),
('2654', 'Bovec', '175', 1),
('2655', 'Braslovce', '175', 1),
('2656', 'Brda', '175', 1),
('2657', 'Brezice', '175', 1),
('2658', 'Brezovica', '175', 1),
('2659', 'Cankova', '175', 1),
('2660', 'Celje', '175', 1),
('2661', 'Cerklje na Gorenjskem', '175', 1),
('2662', 'Cerknica', '175', 1),
('2663', 'Cerkno', '175', 1),
('2664', 'Cerkvenjak', '175', 1),
('2665', 'Crensovci', '175', 1),
('2666', 'Crna na Koroskem', '175', 1),
('2667', 'Crnomelj', '175', 1),
('2668', 'Destrnik', '175', 1),
('2669', 'Divaca', '175', 1),
('2670', 'Dobje', '175', 1),
('2671', 'Dobrepolje', '175', 1),
('2672', 'Dobrna', '175', 1),
('2673', 'Dobrova-Horjul-Polhov Gradec', '175', 1),
('2674', 'Dobrovnik-Dobronak', '175', 1),
('2675', 'Dolenjske Toplice', '175', 1),
('2676', 'Dol pri Ljubljani', '175', 1),
('2677', 'Domzale', '175', 1),
('2678', 'Dornava', '175', 1),
('2679', 'Dravograd', '175', 1),
('2680', 'Duplek', '175', 1),
('2681', 'Gorenja Vas-Poljane', '175', 1),
('2682', 'Gorisnica', '175', 1),
('2683', 'Gornja Radgona', '175', 1),
('2684', 'Gornji Grad', '175', 1),
('2685', 'Gornji Petrovci', '175', 1),
('2686', 'Grad', '175', 1),
('2687', 'Grosuplje', '175', 1),
('2688', 'Hajdina', '175', 1),
('2689', 'Hoce-Slivnica', '175', 1),
('2690', 'Hodos-Hodos', '175', 1),
('2691', 'Horjul', '175', 1),
('2692', 'Hrastnik', '175', 1),
('2693', 'Hrpelje-Kozina', '175', 1),
('2694', 'Idrija', '175', 1),
('2695', 'Ig', '175', 1),
('2696', 'Ilirska Bistrica', '175', 1),
('2697', 'Ivancna Gorica', '175', 1),
('2698', 'Izola-Isola', '175', 1),
('2699', 'Jesenice', '175', 1),
('2700', 'Jezersko', '175', 1),
('2701', 'Jursinci', '175', 1),
('2702', 'Kamnik', '175', 1),
('2703', 'Kanal', '175', 1),
('2704', 'Kidricevo', '175', 1),
('2705', 'Kobarid', '175', 1),
('2706', 'Kobilje', '175', 1),
('2707', 'Kocevje', '175', 1),
('2708', 'Komen', '175', 1),
('2709', 'Komenda', '175', 1),
('2710', 'Koper-Capodistria', '175', 1),
('2711', 'Kostel', '175', 1),
('2712', 'Kozje', '175', 1),
('2713', 'Kranj', '175', 1),
('2714', 'Kranjska Gora', '175', 1),
('2715', 'Krizevci', '175', 1),
('2716', 'Krsko', '175', 1),
('2717', 'Kungota', '175', 1),
('2718', 'Kuzma', '175', 1),
('2719', 'Lasko', '175', 1),
('2720', 'Lenart', '175', 1),
('2721', 'Lendava-Lendva', '175', 1),
('2722', 'Litija', '175', 1),
('2723', 'Ljubljana', '175', 1),
('2724', 'Ljubno', '175', 1),
('2725', 'Ljutomer', '175', 1),
('2726', 'Logatec', '175', 1),
('2727', 'Loska Dolina', '175', 1),
('2728', 'Loski Potok', '175', 1),
('2729', 'Lovrenc na Pohorju', '175', 1),
('2730', 'Luce', '175', 1),
('2731', 'Lukovica', '175', 1),
('2732', 'Majsperk', '175', 1),
('2733', 'Maribor', '175', 1),
('2734', 'Markovci', '175', 1),
('2735', 'Medvode', '175', 1),
('2736', 'Menges', '175', 1),
('2737', 'Metlika', '175', 1),
('2738', 'Mezica', '175', 1),
('2739', 'Miklavz na Dravskem Polju', '175', 1),
('2740', 'Miren-Kostanjevica', '175', 1),
('2741', 'Mirna Pec', '175', 1),
('2742', 'Mislinja', '175', 1),
('2743', 'Moravce', '175', 1),
('2744', 'Moravske Toplice', '175', 1),
('2745', 'Mozirje', '175', 1),
('2746', 'Murska Sobota', '175', 1),
('2747', 'Muta', '175', 1),
('2748', 'Naklo', '175', 1),
('2749', 'Nazarje', '175', 1),
('2750', 'Nova Gorica', '175', 1),
('2751', 'Novo Mesto', '175', 1),
('2752', 'Odranci', '175', 1),
('2753', 'Oplotnica', '175', 1),
('2754', 'Ormoz', '175', 1),
('2755', 'Osilnica', '175', 1),
('2756', 'Pesnica', '175', 1),
('2757', 'Piran-Pirano', '175', 1),
('2758', 'Pivka', '175', 1),
('2759', 'Podcetrtek', '175', 1),
('2760', 'Podlehnik', '175', 1),
('2761', 'Podvelka', '175', 1),
('2762', 'Polzela', '175', 1),
('2763', 'Postojna', '175', 1),
('2764', 'Prebold', '175', 1),
('2765', 'Preddvor', '175', 1),
('2766', 'Prevalje', '175', 1),
('2767', 'Ptuj', '175', 1),
('2768', 'Puconci', '175', 1),
('2769', 'Race-Fram', '175', 1),
('2770', 'Radece', '175', 1),
('2771', 'Radenci', '175', 1),
('2772', 'Radlje ob Dravi', '175', 1),
('2773', 'Radovljica', '175', 1),
('2774', 'Ravne na Koroskem', '175', 1),
('2775', 'Razkrizje', '175', 1),
('2776', 'Ribnica', '175', 1),
('2777', 'Ribnica na Pohorju', '175', 1),
('2778', 'Rogasovci', '175', 1),
('2779', 'Rogaska Slatina', '175', 1),
('2780', 'Rogatec', '175', 1),
('2781', 'Ruse', '175', 1),
('2782', 'Salovci', '175', 1),
('2783', 'Selnica ob Dravi', '175', 1),
('2784', 'Semic', '175', 1),
('2785', 'Sempeter-Vrtojba', '175', 1),
('2786', 'Sencur', '175', 1),
('2787', 'Sentilj', '175', 1),
('2788', 'Sentjernej', '175', 1),
('2789', 'Sentjur pri Celju', '175', 1),
('2790', 'Sevnica', '175', 1),
('2791', 'Sezana', '175', 1),
('2792', 'Skocjan', '175', 1),
('2793', 'Skofja Loka', '175', 1),
('2794', 'Skofljica', '175', 1),
('2795', 'Slovenj Gradec', '175', 1),
('2796', 'Slovenska Bistrica', '175', 1),
('2797', 'Slovenske Konjice', '175', 1),
('2798', 'Smarje pri Jelsah', '175', 1),
('2799', 'Smartno ob Paki', '175', 1),
('2800', 'Smartno pri Litiji', '175', 1),
('2801', 'Sodrazica', '175', 1),
('2802', 'Solcava', '175', 1),
('2803', 'Sostanj', '175', 1),
('2804', 'Starse', '175', 1),
('2805', 'Store', '175', 1),
('2806', 'Sveta Ana', '175', 1),
('2807', 'Sveti Andraz v Slovenskih Goricah', '175', 1),
('2808', 'Sveti Jurij', '175', 1),
('2809', 'Tabor', '175', 1),
('2810', 'Tisina', '175', 1),
('2811', 'Tolmin', '175', 1),
('2812', 'Trbovlje', '175', 1),
('2813', 'Trebnje', '175', 1),
('2814', 'Trnovska Vas', '175', 1),
('2815', 'Trzic', '175', 1),
('2816', 'Trzin', '175', 1),
('2817', 'Turnisce', '175', 1),
('2818', 'Velenje', '175', 1),
('2819', 'Velika Polana', '175', 1),
('2820', 'Velike Lasce', '175', 1),
('2821', 'Verzej', '175', 1),
('2822', 'Videm', '175', 1),
('2823', 'Vipava', '175', 1),
('2824', 'Vitanje', '175', 1),
('2825', 'Vodice', '175', 1),
('2826', 'Vojnik', '175', 1),
('2827', 'Vransko', '175', 1),
('2828', 'Vrhnika', '175', 1),
('2829', 'Vuzenica', '175', 1),
('2830', 'Zagorje ob Savi', '175', 1),
('2831', 'Zalec', '175', 1),
('2832', 'Zavrc', '175', 1),
('2833', 'Zelezniki', '175', 1),
('2834', 'Zetale', '175', 1),
('2835', 'Ziri', '175', 1),
('2836', 'Zirovnica', '175', 1),
('2837', 'Zuzemberk', '175', 1),
('2838', 'Zrece', '175', 1),
('2839', 'Other', '175', 1),
('2840', 'Central', '176', 1),
('2841', 'Choiseul', '176', 1),
('2842', 'Guadalcanal', '176', 1),
('2843', 'Honiara', '176', 1),
('2844', 'Isabel', '176', 1),
('2845', 'Makira', '176', 1),
('2846', 'Malaita', '176', 1),
('2847', 'Rennell and Bellona', '176', 1),
('2848', 'Temotu', '176', 1),
('2849', 'Western', '176', 1),
('2850', 'Other', '176', 1),
('2851', 'Awdal', '177', 1),
('2852', 'Bakool', '177', 1),
('2853', 'Banaadir', '177', 1),
('2854', 'Bari', '177', 1),
('2855', 'Bay', '177', 1),
('2856', 'Galguduud', '177', 1),
('2857', 'Gedo', '177', 1),
('2858', 'Hiiraan', '177', 1),
('2859', 'Jubbada Dhexe', '177', 1),
('2860', 'Jubbada Hoose', '177', 1),
('2861', 'Mudug', '177', 1),
('2862', 'Nugaal', '177', 1),
('2863', 'Sanaag', '177', 1),
('2864', 'Shabeellaha Dhexe', '177', 1),
('2865', 'Shabeellaha Hoose', '177', 1),
('2866', 'Sool', '177', 1),
('2867', 'Togdheer', '177', 1),
('2868', 'Woqooyi Galbeed', '177', 1),
('2869', 'Other', '177', 1),
('2870', 'Eastern Cape', '178', 1),
('2871', 'Free State', '178', 1),
('2872', 'Gauteng', '178', 1),
('2873', 'KwaZulu-Natal', '178', 1),
('2874', 'Limpopo', '178', 1),
('2875', 'Mpumalanga', '178', 1),
('2876', 'North-West', '178', 1),
('2877', 'Northern Cape', '178', 1),
('2878', 'Western Cape', '178', 1),
('2879', 'Other', '178', 1),
('2880', 'Andalucia', '179', 1),
('2881', 'Aragon', '179', 1),
('2882', 'Asturias', '179', 1),
('2883', 'Baleares', '179', 1),
('2884', 'Ceuta', '179', 1),
('2885', 'Canarias', '179', 1),
('2886', 'Cantabria', '179', 1),
('2887', 'Castilla-La Mancha', '179', 1),
('2888', 'Castilla y Leon', '179', 1),
('2889', 'Cataluna', '179', 1),
('2890', 'Comunidad Valenciana', '179', 1),
('2891', 'Extremadura', '179', 1),
('2892', 'Galicia', '179', 1),
('2893', 'La Rioja', '179', 1),
('2894', 'Madrid', '179', 1),
('2895', 'Melilla', '179', 1),
('2896', 'Murcia', '179', 1),
('2897', 'Navarra', '179', 1),
('2898', 'Pais Vasco', '179', 1),
('2899', 'Other', '179', 1),
('2900', 'Central', '180', 1),
('2901', 'North Central', '180', 1),
('2902', 'North Eastern', '180', 1),
('2903', 'North Western', '180', 1),
('2904', 'Sabaragamuwa', '180', 1),
('2905', 'Northen', '180', 1),
('2906', 'Southern', '180', 1),
('2907', 'Uva', '180', 1),
('2908', 'Western', '180', 1),
('2909', 'Other', '181', 1),
('2910', 'Other', '182', 1),
('2911', 'Other', '183', 1),
('2912', 'Other', '184', 1),
('2913', 'Saint Vincent', '185', 1),
('2914', 'Other', '185', 1),
('2915', 'A\'ali an Nil', '186', 1),
('2916', 'Al Bahr al Ahmar', '186', 1),
('2917', 'Al Buhayrat', '186', 1),
('2918', 'Al Jazirah', '186', 1),
('2919', 'Al Khartum', '186', 1),
('2920', 'Al Qadarif', '186', 1),
('2921', 'Al Wahdah', '186', 1),
('2922', 'An Nil al Abyad', '186', 1),
('2923', 'An Nil al Azraq', '186', 1),
('2924', 'Ash Shamaliyah', '186', 1),
('2925', 'Bahr al Jabal', '186', 1),
('2926', 'Gharb al Istiwa\'iyah', '186', 1),
('2927', 'Gharb Bahr al Ghazal', '186', 1),
('2928', 'Gharb Darfur', '186', 1),
('2929', 'Gharb Kurdufan', '186', 1),
('2930', 'Janub Darfur', '186', 1),
('2931', 'Janub Kurdufan', '186', 1),
('2932', 'Junqali', '186', 1),
('2933', 'Kassala', '186', 1),
('2934', 'Nahr an Nil', '186', 1),
('2935', 'Shamal Bahr al Ghazal', '186', 1),
('2936', 'Shamal Darfur', '186', 1),
('2937', 'Shamal Kurdufan', '186', 1),
('2938', 'Sharq al Istiwa\'iyah', '186', 1),
('2939', 'Sinnar', '186', 1),
('2940', 'Warab', '186', 1),
('2941', 'Other', '186', 1),
('2942', 'Brokopondo', '187', 1),
('2943', 'Commewijne', '187', 1),
('2944', 'Coronie', '187', 1),
('2945', 'Marowijne', '187', 1),
('2946', 'Nickerie', '187', 1),
('2947', 'Para', '187', 1),
('2948', 'Paramaribo', '187', 1),
('2949', 'Saramacca', '187', 1),
('2950', 'Sipaliwini', '187', 1),
('2951', 'Wanica', '187', 1),
('2952', 'Other', '187', 1),
('2953', 'Hhohho', '188', 1),
('2954', 'Lubombo', '188', 1),
('2955', 'Manzini', '188', 1),
('2956', 'Shiselweni', '188', 1),
('2957', 'Other', '188', 1),
('2958', 'Blekinge', '189', 1),
('2959', 'Dalarnas', '189', 1),
('2960', 'Gavleborgs', '189', 1),
('2961', 'Gotlands', '189', 1),
('2962', 'Hallands', '189', 1),
('2963', 'Jamtlands', '189', 1),
('2964', 'Jonkopings', '189', 1),
('2965', 'Kalmar', '189', 1),
('2966', 'Kronobergs', '189', 1),
('2967', 'Norrbottens', '189', 1),
('2968', 'Orebro', '189', 1),
('2969', 'Ostergotlands', '189', 1),
('2970', 'Skane', '189', 1),
('2971', 'Sodermanlands', '189', 1),
('2972', 'Stockholms', '189', 1),
('2973', 'Uppsala', '189', 1),
('2974', 'Varmlands', '189', 1),
('2975', 'Vasterbottens', '189', 1),
('2976', 'Vasternorrlands', '189', 1),
('2977', 'Vastmanlands', '189', 1),
('2978', 'Vastra Gotalands', '189', 1),
('2979', 'Other', '189', 1),
('2980', 'Aargau', '190', 1),
('2981', 'Appenzell Ausser-Rhoden', '190', 1),
('2982', 'Appenzell Inner-Rhoden', '190', 1),
('2983', 'Basel-Landschaft', '190', 1),
('2984', 'Basel-Stadt', '190', 1),
('2985', 'Bern', '190', 1),
('2986', 'Fribourg', '190', 1),
('2987', 'Geneve', '190', 1),
('2988', 'Glarus', '190', 1),
('2989', 'Graubunden', '190', 1),
('2990', 'Jura', '190', 1),
('2991', 'Luzern', '190', 1),
('2992', 'Neuchatel', '190', 1),
('2993', 'Nidwalden', '190', 1),
('2994', 'Obwalden', '190', 1),
('2995', 'Sankt Gallen', '190', 1),
('2996', 'Schaffhausen', '190', 1),
('2997', 'Schwyz', '190', 1),
('2998', 'Solothurn', '190', 1),
('2999', 'Thurgau', '190', 1),
('3000', 'Ticino', '190', 1),
('3001', 'Uri', '190', 1),
('3002', 'Valais', '190', 1),
('3003', 'Vaud', '190', 1),
('3004', 'Zug', '190', 1),
('3005', 'Zurich', '190', 1),
('3006', 'Other', '190', 1),
('3007', 'Al Hasakah', '191', 1),
('3008', 'Al Ladhiqiyah', '191', 1),
('3009', 'Al Qunaytirah', '191', 1),
('3010', 'Ar Raqqah', '191', 1),
('3011', 'As Suwayda\'', '191', 1),
('3012', 'Dar\'a', '191', 1),
('3013', 'Dayr az Zawr', '191', 1),
('3014', 'Dimashq', '191', 1),
('3015', 'Halab', '191', 1),
('3016', 'Hamah', '191', 1),
('3017', 'Hims', '191', 1),
('3018', 'Idlib', '191', 1),
('3019', 'Rif Dimashq', '191', 1),
('3020', 'Tartus', '191', 1),
('3021', 'Other', '191', 1),
('3022', 'Chang-hua', '192', 1),
('3023', 'Chia-i', '192', 1),
('3024', 'Hsin-chu', '192', 1),
('3025', 'Hua-lien', '192', 1),
('3026', 'I-lan', '192', 1),
('3027', 'Kao-hsiung', '192', 1),
('3028', 'Kin-men', '192', 1),
('3029', 'Lien-chiang', '192', 1),
('3030', 'Miao-li', '192', 1),
('3031', 'Nan-t\'ou', '192', 1),
('3032', 'P\'eng-hu', '192', 1),
('3033', 'P\'ing-tung', '192', 1),
('3034', 'T\'ai-chung', '192', 1),
('3035', 'T\'ai-nan', '192', 1),
('3036', 'T\'ai-pei', '192', 1),
('3037', 'T\'ai-tung', '192', 1),
('3038', 'T\'ao-yuan', '192', 1),
('3039', 'Yun-lin', '192', 1),
('3040', 'Chia-i', '192', 1),
('3041', 'Chi-lung', '192', 1),
('3042', 'Hsin-chu', '192', 1),
('3043', 'T\'ai-chung', '192', 1),
('3044', 'T\'ai-nan', '192', 1),
('3045', 'Kao-hsiung city', '192', 1),
('3046', 'T\'ai-pei city', '192', 1),
('3047', 'Other', '192', 1),
('3048', 'Other', '193', 1),
('3049', 'Arusha', '194', 1),
('3050', 'Dar es Salaam', '194', 1),
('3051', 'Dodoma', '194', 1),
('3052', 'Iringa', '194', 1),
('3053', 'Kagera', '194', 1),
('3054', 'Kigoma', '194', 1),
('3055', 'Kilimanjaro', '194', 1),
('3056', 'Lindi', '194', 1),
('3057', 'Manyara', '194', 1),
('3058', 'Mara', '194', 1),
('3059', 'Mbeya', '194', 1),
('3060', 'Morogoro', '194', 1),
('3061', 'Mtwara', '194', 1),
('3062', 'Mwanza', '194', 1),
('3063', 'Pemba North', '194', 1),
('3064', 'Pemba South', '194', 1),
('3065', 'Pwani', '194', 1),
('3066', 'Rukwa', '194', 1),
('3067', 'Ruvuma', '194', 1),
('3068', 'Shinyanga', '194', 1),
('3069', 'Singida', '194', 1),
('3070', 'Tabora', '194', 1),
('3071', 'Tanga', '194', 1),
('3072', 'Zanzibar Central/South', '194', 1),
('3073', 'Zanzibar North', '194', 1),
('3074', 'Zanzibar Urban/West', '194', 1),
('3075', 'Other', '194', 1),
('3076', 'Amnat Charoen', '195', 1),
('3077', 'Ang Thong', '195', 1),
('3078', 'Buriram', '195', 1),
('3079', 'Chachoengsao', '195', 1),
('3080', 'Chai Nat', '195', 1),
('3081', 'Chaiyaphum', '195', 1),
('3082', 'Chanthaburi', '195', 1),
('3083', 'Chiang Mai', '195', 1),
('3084', 'Chiang Rai', '195', 1),
('3085', 'Chon Buri', '195', 1),
('3086', 'Chumphon', '195', 1),
('3087', 'Kalasin', '195', 1),
('3088', 'Kamphaeng Phet', '195', 1),
('3089', 'Kanchanaburi', '195', 1),
('3090', 'Khon Kaen', '195', 1),
('3091', 'Krabi', '195', 1),
('3092', 'Krung Thep Mahanakhon', '195', 1),
('3093', 'Lampang', '195', 1),
('3094', 'Lamphun', '195', 1),
('3095', 'Loei', '195', 1),
('3096', 'Lop Buri', '195', 1),
('3097', 'Mae Hong Son', '195', 1),
('3098', 'Maha Sarakham', '195', 1),
('3099', 'Mukdahan', '195', 1),
('3100', 'Nakhon Nayok', '195', 1),
('3101', 'Nakhon Pathom', '195', 1),
('3102', 'Nakhon Phanom', '195', 1),
('3103', 'Nakhon Ratchasima', '195', 1),
('3104', 'Nakhon Sawan', '195', 1),
('3105', 'Nakhon Si Thammarat', '195', 1),
('3106', 'Nan', '195', 1),
('3107', 'Narathiwat', '195', 1),
('3108', 'Nong Bua Lamphu', '195', 1),
('3109', 'Nong Khai', '195', 1),
('3110', 'Nonthaburi', '195', 1),
('3111', 'Pathum Thani', '195', 1),
('3112', 'Pattani', '195', 1),
('3113', 'Phangnga', '195', 1),
('3114', 'Phatthalung', '195', 1),
('3115', 'Phayao', '195', 1),
('3116', 'Phetchabun', '195', 1),
('3117', 'Phetchaburi', '195', 1),
('3118', 'Phichit', '195', 1),
('3119', 'Phitsanulok', '195', 1),
('3120', 'Phra Nakhon Si Ayutthaya', '195', 1),
('3121', 'Phrae', '195', 1),
('3122', 'Phuket', '195', 1),
('3123', 'Prachin Buri', '195', 1),
('3124', 'Prachuap Khiri Khan', '195', 1),
('3125', 'Ranong', '195', 1),
('3126', 'Ratchaburi', '195', 1),
('3127', 'Rayong', '195', 1),
('3128', 'Roi Et', '195', 1),
('3129', 'Sa Kaeo', '195', 1),
('3130', 'Sakon Nakhon', '195', 1),
('3131', 'Samut Prakan', '195', 1),
('3132', 'Samut Sakhon', '195', 1),
('3133', 'Samut Songkhram', '195', 1),
('3134', 'Sara Buri', '195', 1),
('3135', 'Satun', '195', 1),
('3136', 'Sing Buri', '195', 1),
('3137', 'Sisaket', '195', 1),
('3138', 'Songkhla', '195', 1),
('3139', 'Sukhothai', '195', 1),
('3140', 'Suphan Buri', '195', 1),
('3141', 'Surat Thani', '195', 1),
('3142', 'Surin', '195', 1),
('3143', 'Tak', '195', 1),
('3144', 'Trang', '195', 1),
('3145', 'Trat', '195', 1),
('3146', 'Ubon Ratchathani', '195', 1),
('3147', 'Udon Thani', '195', 1),
('3148', 'Uthai Thani', '195', 1),
('3149', 'Uttaradit', '195', 1),
('3150', 'Yala', '195', 1),
('3151', 'Yasothon', '195', 1),
('3152', 'Other', '195', 1),
('3153', 'Kara', '196', 1),
('3154', 'Plateaux', '196', 1),
('3155', 'Savanes', '196', 1),
('3156', 'Centrale', '196', 1),
('3157', 'Maritime', '196', 1),
('3158', 'Other', '196', 1),
('3159', 'Other', '197', 1),
('3160', 'Ata Island', '198', 1),
('3161', 'Eua Island', '198', 1),
('3162', 'Tafahi Island', '198', 1),
('3163', 'Toku Island', '198', 1),
('3164', 'Tongatapu Islands', '198', 1),
('3165', 'Vava\'u Islands', '198', 1),
('3166', 'Other', '198', 1),
('3167', 'Couva', '199', 1),
('3168', 'Diego Martin', '199', 1),
('3169', 'Mayaro', '199', 1),
('3170', 'Penal', '199', 1),
('3171', 'Princes Town', '199', 1),
('3172', 'Sangre Grande', '199', 1),
('3173', 'San Juan', '199', 1),
('3174', 'Siparia', '199', 1),
('3175', 'Tunapuna', '199', 1),
('3176', 'Port-of-Spain', '199', 1),
('3177', 'San Fernando', '199', 1),
('3178', 'Arima', '199', 1),
('3179', 'Point Fortin', '199', 1),
('3180', 'Chaguanas', '199', 1),
('3181', 'Tobago', '199', 1),
('3182', 'Other', '199', 1),
('3183', 'Ariana (Aryanah)', '200', 1),
('3184', 'Beja (Bajah)', '200', 1),
('3185', 'Ben Arous (Bin \'Arus)', '200', 1),
('3186', 'Bizerte (Banzart)', '200', 1),
('3187', 'Gabes (Qabis)', '200', 1),
('3188', 'Gafsa (Qafsah)', '200', 1),
('3189', 'Jendouba (Jundubah)', '200', 1),
('3190', 'Kairouan (Al Qayrawan)', '200', 1),
('3191', 'Kasserine (Al Qasrayn)', '200', 1),
('3192', 'Kebili (Qibili)', '200', 1),
('3193', 'Kef (Al Kaf)', '200', 1),
('3194', 'Mahdia (Al Mahdiyah)', '200', 1),
('3195', 'Manouba (Manubah)', '200', 1),
('3196', 'Medenine (Madanin)', '200', 1),
('3197', 'Monastir (Al Munastir)', '200', 1),
('3198', 'Nabeul (Nabul)', '200', 1),
('3199', 'Sfax (Safaqis)', '200', 1),
('3200', 'Sidi Bou Zid (Sidi Bu Zayd)', '200', 1),
('3201', 'Siliana (Silyanah)', '200', 1),
('3202', 'Sousse (Susah)', '200', 1),
('3203', 'Tataouine (Tatawin)', '200', 1),
('3204', 'Tozeur (Tawzar)', '200', 1),
('3205', 'Tunis', '200', 1),
('3206', 'Zaghouan (Zaghwan)', '200', 1),
('3207', 'Other', '200', 1),
('3208', 'Adana', '201', 1),
('3209', 'Adiyaman', '201', 1),
('3210', 'Afyonkarahisar', '201', 1),
('3211', 'Agri', '201', 1),
('3212', 'Aksaray', '201', 1),
('3213', 'Amasya', '201', 1),
('3214', 'Ankara', '201', 1),
('3215', 'Antalya', '201', 1),
('3216', 'Ardahan', '201', 1),
('3217', 'Artvin', '201', 1),
('3218', 'Aydin', '201', 1),
('3219', 'Balikesir', '201', 1),
('3220', 'Bartin', '201', 1),
('3221', 'Batman', '201', 1),
('3222', 'Bayburt', '201', 1),
('3223', 'Bilecik', '201', 1),
('3224', 'Bingol', '201', 1),
('3225', 'Bitlis', '201', 1),
('3226', 'Bolu', '201', 1),
('3227', 'Burdur', '201', 1),
('3228', 'Bursa', '201', 1),
('3229', 'Canakkale', '201', 1),
('3230', 'Cankiri', '201', 1),
('3231', 'Corum', '201', 1),
('3232', 'Denizli', '201', 1),
('3233', 'Diyarbakir', '201', 1),
('3234', 'Duzce', '201', 1),
('3235', 'Edirne', '201', 1),
('3236', 'Elazig', '201', 1),
('3237', 'Erzincan', '201', 1),
('3238', 'Erzurum', '201', 1),
('3239', 'Eskisehir', '201', 1),
('3240', 'Gaziantep', '201', 1),
('3241', 'Giresun', '201', 1),
('3242', 'Gumushane', '201', 1),
('3243', 'Hakkari', '201', 1),
('3244', 'Hatay', '201', 1),
('3245', 'Igdir', '201', 1),
('3246', 'Isparta', '201', 1),
('3247', 'Istanbul', '201', 1),
('3248', 'Izmir', '201', 1),
('3249', 'Kahramanmaras', '201', 1),
('3250', 'Karabuk', '201', 1),
('3251', 'Karaman', '201', 1),
('3252', 'Kars', '201', 1),
('3253', 'Kastamonu', '201', 1),
('3254', 'Kayseri', '201', 1),
('3255', 'Kilis', '201', 1),
('3256', 'Kirikkale', '201', 1),
('3257', 'Kirklareli', '201', 1),
('3258', 'Kirsehir', '201', 1),
('3259', 'Kocaeli', '201', 1),
('3260', 'Konya', '201', 1),
('3261', 'Kutahya', '201', 1),
('3262', 'Malatya', '201', 1),
('3263', 'Manisa', '201', 1),
('3264', 'Mardin', '201', 1),
('3265', 'Mersin', '201', 1),
('3266', 'Mugla', '201', 1),
('3267', 'Mus', '201', 1),
('3268', 'Nevsehir', '201', 1),
('3269', 'Nigde', '201', 1),
('3270', 'Ordu', '201', 1),
('3271', 'Osmaniye', '201', 1),
('3272', 'Rize', '201', 1);
INSERT INTO `mst_states` (`id`, `state_name`, `mst_countries_id`, `is_active`) VALUES
('3273', 'Sakarya', '201', 1),
('3274', 'Samsun', '201', 1),
('3275', 'Sanliurfa', '201', 1),
('3276', 'Siirt', '201', 1),
('3277', 'Sinop', '201', 1),
('3278', 'Sirnak', '201', 1),
('3279', 'Sivas', '201', 1),
('3280', 'Tekirdag', '201', 1),
('3281', 'Tokat', '201', 1),
('3282', 'Trabzon', '201', 1),
('3283', 'Tunceli', '201', 1),
('3284', 'Usak', '201', 1),
('3285', 'Van', '201', 1),
('3286', 'Yalova', '201', 1),
('3287', 'Yozgat', '201', 1),
('3288', 'Zonguldak', '201', 1),
('3289', 'Other', '201', 1),
('3290', 'Ahal Welayaty (Ashgabat)', '202', 1),
('3291', 'Balkan Welayaty (Balkanabat)', '202', 1),
('3292', 'Dashoguz Welayaty', '202', 1),
('3293', 'Lebap Welayaty (Turkmenabat)', '202', 1),
('3294', 'Mary Welayaty', '202', 1),
('3295', 'Other', '202', 1),
('3296', 'Other', '203', 1),
('3297', 'Other', '204', 1),
('3298', 'Adjumani', '205', 1),
('3299', 'Apac', '205', 1),
('3300', 'Arua', '205', 1),
('3301', 'Bugiri', '205', 1),
('3302', 'Bundibugyo', '205', 1),
('3303', 'Bushenyi', '205', 1),
('3304', 'Busia', '205', 1),
('3305', 'Gulu', '205', 1),
('3306', 'Hoima', '205', 1),
('3307', 'Iganga', '205', 1),
('3308', 'Jinja', '205', 1),
('3309', 'Kabale', '205', 1),
('3310', 'Kabarole', '205', 1),
('3311', 'Kaberamaido', '205', 1),
('3312', 'Kalangala', '205', 1),
('3313', 'Kampala', '205', 1),
('3314', 'Kamuli', '205', 1),
('3315', 'Kamwenge', '205', 1),
('3316', 'Kanungu', '205', 1),
('3317', 'Kapchorwa', '205', 1),
('3318', 'Kasese', '205', 1),
('3319', 'Katakwi', '205', 1),
('3320', 'Kayunga', '205', 1),
('3321', 'Kibale', '205', 1),
('3322', 'Kiboga', '205', 1),
('3323', 'Kisoro', '205', 1),
('3324', 'Kitgum', '205', 1),
('3325', 'Kotido', '205', 1),
('3326', 'Kumi', '205', 1),
('3327', 'Kyenjojo', '205', 1),
('3328', 'Lira', '205', 1),
('3329', 'Luwero', '205', 1),
('3330', 'Masaka', '205', 1),
('3331', 'Masindi', '205', 1),
('3332', 'Mayuge', '205', 1),
('3333', 'Mbale', '205', 1),
('3334', 'Mbarara', '205', 1),
('3335', 'Moroto', '205', 1),
('3336', 'Moyo', '205', 1),
('3337', 'Mpigi', '205', 1),
('3338', 'Mubende', '205', 1),
('3339', 'Mukono', '205', 1),
('3340', 'Nakapiripirit', '205', 1),
('3341', 'Nakasongola', '205', 1),
('3342', 'Nebbi', '205', 1),
('3343', 'Ntungamo', '205', 1),
('3344', 'Pader', '205', 1),
('3345', 'Pallisa', '205', 1),
('3346', 'Rakai', '205', 1),
('3347', 'Rukungiri', '205', 1),
('3348', 'Sembabule', '205', 1),
('3349', 'Sironko', '205', 1),
('3350', 'Soroti', '205', 1),
('3351', 'Tororo', '205', 1),
('3352', 'Wakiso', '205', 1),
('3353', 'Yumbe', '205', 1),
('3354', 'Other', '205', 1),
('3355', 'Cherkasy', '206', 1),
('3356', 'Chernihiv', '206', 1),
('3357', 'Chernivtsi', '206', 1),
('3358', 'Crimea', '206', 1),
('3359', 'Dnipropetrovs\'k', '206', 1),
('3360', 'Donets\'k', '206', 1),
('3361', 'Ivano-Frankivs\'k', '206', 1),
('3362', 'Kharkiv', '206', 1),
('3363', 'Kherson', '206', 1),
('3364', 'Khmel\'nyts\'kyy', '206', 1),
('3365', 'Kirovohrad', '206', 1),
('3366', 'Kiev', '206', 1),
('3367', 'Kyyiv', '206', 1),
('3368', 'Luhans\'k', '206', 1),
('3369', 'L\'viv', '206', 1),
('3370', 'Mykolayiv', '206', 1),
('3371', 'Odesa', '206', 1),
('3372', 'Poltava', '206', 1),
('3373', 'Rivne', '206', 1),
('3374', 'Sevastopol\'', '206', 1),
('3375', 'Sumy', '206', 1),
('3376', 'Ternopil\'', '206', 1),
('3377', 'Vinnytsya', '206', 1),
('3378', 'Volyn\'', '206', 1),
('3379', 'Zakarpattya', '206', 1),
('3380', 'Zaporizhzhya', '206', 1),
('3381', 'Zhytomyr', '206', 1),
('3382', 'Other', '206', 1),
('3383', 'Abu Dhabi', '207', 1),
('3384', '\'Ajman', '207', 1),
('3385', 'Al Fujayrah', '207', 1),
('3386', 'Sharjah', '207', 1),
('3387', 'Dubai', '207', 1),
('3388', 'Ra\'s al Khaymah', '207', 1),
('3389', 'Umm al Qaywayn', '207', 1),
('3390', 'Other', '207', 1),
('3391', 'Aberdeenshire', '208', 1),
('3392', 'Bedfordshire', '208', 1),
('3393', 'Berkshire', '208', 1),
('3394', 'Buckinghamshire', '208', 1),
('3395', 'Cambridgeshire', '208', 1),
('3396', 'Cardiff', '208', 1),
('3397', 'City of Edinburgh', '208', 1),
('3398', 'Derbyshire', '208', 1),
('3399', 'Essex', '208', 1),
('3400', 'Glasgow', '208', 1),
('3401', 'Greater London / Middlesex', '208', 1),
('3402', 'Greater Manchester', '208', 1),
('3403', 'Hampshire', '208', 1),
('3404', 'Hertfordshire', '208', 1),
('3405', 'Kent', '208', 1),
('3406', 'Lanarkshire', '208', 1),
('3407', 'Lancashire', '208', 1),
('3408', 'Leicestershire', '208', 1),
('3409', 'Nottinghamshire', '208', 1),
('3410', 'Oxfordshire', '208', 1),
('3411', 'Surrey', '208', 1),
('3412', 'Sussex', '208', 1),
('3413', 'Warwickshire', '208', 1),
('3414', 'West Midlands', '208', 1),
('3415', 'Yorkshire', '208', 1),
('3416', 'Aberdeenshire', '208', 1),
('3417', 'Angus', '208', 1),
('3418', 'Antrim', '208', 1),
('3419', 'Argyll and Bute', '208', 1),
('3420', 'Armagh', '208', 1),
('3421', 'Ayrshire', '208', 1),
('3422', 'Bedfordshire', '208', 1),
('3423', 'Berkshire', '208', 1),
('3424', 'Blaenau Gwent', '208', 1),
('3425', 'Bridgend', '208', 1),
('3426', 'Buckinghamshire', '208', 1),
('3427', 'Caerphilly', '208', 1),
('3428', 'Cambridgeshire', '208', 1),
('3429', 'Cardiff', '208', 1),
('3430', 'Carmarthenshire', '208', 1),
('3431', 'Ceredigion', '208', 1),
('3432', 'Cheshire', '208', 1),
('3433', 'City of Edinburgh', '208', 1),
('3434', 'Clackmannanshire', '208', 1),
('3435', 'Conwy', '208', 1),
('3436', 'Cornwall', '208', 1),
('3437', 'Cumbria', '208', 1),
('3438', 'Denbighshire', '208', 1),
('3439', 'Derbyshire', '208', 1),
('3440', 'Derry', '208', 1),
('3441', 'Devon', '208', 1),
('3442', 'Dorset', '208', 1),
('3443', 'Down', '208', 1),
('3444', 'Dumfries and Galloway', '208', 1),
('3445', 'Dunbartonshire', '208', 1),
('3446', 'Durham', '208', 1),
('3447', 'East Lothian', '208', 1),
('3448', 'Essex', '208', 1),
('3449', 'Falkirk', '208', 1),
('3450', 'Fermanagh', '208', 1),
('3451', 'Fife', '208', 1),
('3452', 'Flintshire', '208', 1),
('3453', 'Glasgow', '208', 1),
('3454', 'Gloucestershire', '208', 1),
('3455', 'Greater London / Middlesex', '208', 1),
('3456', 'Greater Manchester', '208', 1),
('3457', 'Gwynedd', '208', 1),
('3458', 'Hampshire', '208', 1),
('3459', 'Herefordshire', '208', 1),
('3460', 'Hertfordshire', '208', 1),
('3461', 'Highland', '208', 1),
('3462', 'Inverclyde', '208', 1),
('3463', 'Isle of Anglesey', '208', 1),
('3464', 'Isle of Mann', '208', 1),
('3465', 'Isle of Wight', '208', 1),
('3466', 'Kent', '208', 1),
('3467', 'Lanarkshire', '208', 1),
('3468', 'Lancashire', '208', 1),
('3469', 'Leicestershire', '208', 1),
('3470', 'Lincolnshire', '208', 1),
('3471', 'Merseyside', '208', 1),
('3472', 'Merthyr Tydfil', '208', 1),
('3473', 'Midlothian', '208', 1),
('3474', 'Monmouthshire', '208', 1),
('3475', 'Moray', '208', 1),
('3476', 'Neath Port Talbot', '208', 1),
('3477', 'Newport', '208', 1),
('3478', 'Norfolk', '208', 1),
('3479', 'Northamptonshire', '208', 1),
('3480', 'Northumberland', '208', 1),
('3481', 'Nottinghamshire', '208', 1),
('3482', 'Oxfordshire', '208', 1),
('3483', 'Pembrokeshire', '208', 1),
('3484', 'Perth and Kinross', '208', 1),
('3485', 'Powys', '208', 1),
('3486', 'Renfrewshire', '208', 1),
('3487', 'Rhondda Cynon Taff', '208', 1),
('3488', 'Rutland', '208', 1),
('3489', 'Scottish Borders', '208', 1),
('3490', 'Shropshire', '208', 1),
('3491', 'Somerset', '208', 1),
('3492', 'Staffordshire', '208', 1),
('3493', 'Stirlingshire', '208', 1),
('3494', 'Suffolk', '208', 1),
('3495', 'Surrey', '208', 1),
('3496', 'Sussex', '208', 1),
('3497', 'Swansea', '208', 1),
('3498', 'Torfaen', '208', 1),
('3499', 'Tyne and Wear', '208', 1),
('3500', 'Tyrone', '208', 1),
('3501', 'Vale of Glamorgan', '208', 1),
('3502', 'Warwickshire', '208', 1),
('3503', 'West Lothain', '208', 1),
('3504', 'West Midlands', '208', 1),
('3505', 'Western Isles', '208', 1),
('3506', 'Wiltshire', '208', 1),
('3507', 'Worcestershire', '208', 1),
('3508', 'Wrexham', '208', 1),
('3509', 'Yorkshire', '208', 1),
('3510', 'Other', '208', 1),
('3511', 'Alabama', '209', 1),
('3512', 'Alaska', '209', 1),
('3513', 'Arizona', '209', 1),
('3514', 'Arkansas', '209', 1),
('3515', 'California', '209', 1),
('3516', 'Colorado', '209', 1),
('3517', 'Connecticut', '209', 1),
('3518', 'Delaware', '209', 1),
('3519', 'District of Columbia', '209', 1),
('3520', 'Florida', '209', 1),
('3521', 'Georgia', '209', 1),
('3522', 'Hawaii', '209', 1),
('3523', 'Idaho', '209', 1),
('3524', 'Illinois', '209', 1),
('3525', 'Indiana', '209', 1),
('3526', 'Iowa', '209', 1),
('3527', 'Kansas', '209', 1),
('3528', 'Kentucky', '209', 1),
('3529', 'Louisiana', '209', 1),
('3530', 'Maine', '209', 1),
('3531', 'Maryland', '209', 1),
('3532', 'Massachusetts', '209', 1),
('3533', 'Michigan', '209', 1),
('3534', 'Minnesota', '209', 1),
('3535', 'Mississippi', '209', 1),
('3536', 'Missouri', '209', 1),
('3537', 'Montana', '209', 1),
('3538', 'Nebraska', '209', 1),
('3539', 'Nevada', '209', 1),
('3540', 'New Hampshire', '209', 1),
('3541', 'New Jersey', '209', 1),
('3542', 'New Mexico', '209', 1),
('3543', 'New York', '209', 1),
('3544', 'North Carolina', '209', 1),
('3545', 'North Dakota', '209', 1),
('3546', 'Ohio', '209', 1),
('3547', 'Oklahoma', '209', 1),
('3548', 'Oregon', '209', 1),
('3549', 'Pennsylvania', '209', 1),
('3550', 'Rhode Island', '209', 1),
('3551', 'South Carolina', '209', 1),
('3552', 'South Dakota', '209', 1),
('3553', 'Tennessee', '209', 1),
('3554', 'Texas', '209', 1),
('3555', 'Utah', '209', 1),
('3556', 'Vermont', '209', 1),
('3557', 'Virginia', '209', 1),
('3558', 'Washington', '209', 1),
('3559', 'West Virginia', '209', 1),
('3560', 'Wisconsin', '209', 1),
('3561', 'Wyoming', '209', 1),
('3562', 'Other', '209', 1),
('3563', 'Artigas', '210', 1),
('3564', 'Canelones', '210', 1),
('3565', 'Cerro Largo', '210', 1),
('3566', 'Colonia', '210', 1),
('3567', 'Durazno', '210', 1),
('3568', 'Flores', '210', 1),
('3569', 'Florida', '210', 1),
('3570', 'Lavalleja', '210', 1),
('3571', 'Maldonado', '210', 1),
('3572', 'Montevideo', '210', 1),
('3573', 'Paysandu', '210', 1),
('3574', 'Rio Negro', '210', 1),
('3575', 'Rivera', '210', 1),
('3576', 'Rocha', '210', 1),
('3577', 'Salto', '210', 1),
('3578', 'San Jose', '210', 1),
('3579', 'Soriano', '210', 1),
('3580', 'Tacuarembo', '210', 1),
('3581', 'Treinta y Tres', '210', 1),
('3582', 'Other', '210', 1),
('3583', 'Andijon Viloyati', '211', 1),
('3584', 'Buxoro Viloyati', '211', 1),
('3585', 'Farg\'ona Viloyati', '211', 1),
('3586', 'Jizzax Viloyati', '211', 1),
('3587', 'Namangan Viloyati', '211', 1),
('3588', 'Navoiy Viloyati', '211', 1),
('3589', 'Qashqadaryo Viloyati', '211', 1),
('3590', 'Qaraqalpog\'iston Respublikasi', '211', 1),
('3591', 'Samarqand Viloyati', '211', 1),
('3592', 'Sirdaryo Viloyati', '211', 1),
('3593', 'Surxondaryo Viloyati', '211', 1),
('3594', 'Toshkent Shahri', '211', 1),
('3595', 'Toshkent Viloyati', '211', 1),
('3596', 'Xorazm Viloyati', '211', 1),
('3597', 'Other', '211', 1),
('3598', 'Malampa', '212', 1),
('3599', 'Penama', '212', 1),
('3600', 'Sanma', '212', 1),
('3601', 'Shefa', '212', 1),
('3602', 'Tafea', '212', 1),
('3603', 'Torba', '212', 1),
('3604', 'Other', '212', 1),
('3605', 'Amazonas', '213', 1),
('3606', 'Anzoategui', '213', 1),
('3607', 'Apure', '213', 1),
('3608', 'Aragua', '213', 1),
('3609', 'Barinas', '213', 1),
('3610', 'Bolivar', '213', 1),
('3611', 'Carabobo', '213', 1),
('3612', 'Cojedes', '213', 1),
('3613', 'Delta Amacuro', '213', 1),
('3614', 'Dependencias Federales', '213', 1),
('3615', 'Distrito Federal', '213', 1),
('3616', 'Falcon', '213', 1),
('3617', 'Guarico', '213', 1),
('3618', 'Lara', '213', 1),
('3619', 'Merida', '213', 1),
('3620', 'Miranda', '213', 1),
('3621', 'Monagas', '213', 1),
('3622', 'Nueva Esparta', '213', 1),
('3623', 'Portuguesa', '213', 1),
('3624', 'Sucre', '213', 1),
('3625', 'Tachira', '213', 1),
('3626', 'Trujillo', '213', 1),
('3627', 'Vargas', '213', 1),
('3628', 'Yaracuy', '213', 1),
('3629', 'Zulia', '213', 1),
('3630', 'Other', '213', 1),
('3631', 'An Giang', '214', 1),
('3632', 'Bac Giang', '214', 1),
('3633', 'Bac Kan', '214', 1),
('3634', 'Bac Lieu', '214', 1),
('3635', 'Bac Ninh', '214', 1),
('3636', 'Ba Ria-Vung Tau', '214', 1),
('3637', 'Ben Tre', '214', 1),
('3638', 'Binh Dinh', '214', 1),
('3639', 'Binh Duong', '214', 1),
('3640', 'Binh Phuoc', '214', 1),
('3641', 'Binh Thuan', '214', 1),
('3642', 'Ca Mau', '214', 1),
('3643', 'Cao Bang', '214', 1),
('3644', 'Dac Lak', '214', 1),
('3645', 'Dac Nong', '214', 1),
('3646', 'Dien Bien', '214', 1),
('3647', 'Dong Nai', '214', 1),
('3648', 'Dong Thap', '214', 1),
('3649', 'Gia Lai', '214', 1),
('3650', 'Ha Giang', '214', 1),
('3651', 'Hai Duong', '214', 1),
('3652', 'Ha Nam', '214', 1),
('3653', 'Ha Tay', '214', 1),
('3654', 'Ha Tinh', '214', 1),
('3655', 'Hau Giang', '214', 1),
('3656', 'Hoa Binh', '214', 1),
('3657', 'Hung Yen', '214', 1),
('3658', 'Khanh Hoa', '214', 1),
('3659', 'Kien Giang', '214', 1),
('3660', 'Kon Tum', '214', 1),
('3661', 'Lai Chau', '214', 1),
('3662', 'Lam Dong', '214', 1),
('3663', 'Lang Son', '214', 1),
('3664', 'Lao Cai', '214', 1),
('3665', 'Long An', '214', 1),
('3666', 'Nam Dinh', '214', 1),
('3667', 'Nghe An', '214', 1),
('3668', 'Ninh Binh', '214', 1),
('3669', 'Ninh Thuan', '214', 1),
('3670', 'Phu Tho', '214', 1),
('3671', 'Phu Yen', '214', 1),
('3672', 'Quang Binh', '214', 1),
('3673', 'Quang Nam', '214', 1),
('3674', 'Quang Ngai', '214', 1),
('3675', 'Quang Ninh', '214', 1),
('3676', 'Quang Tri', '214', 1),
('3677', 'Soc Trang', '214', 1),
('3678', 'Son La', '214', 1),
('3679', 'Tay Ninh', '214', 1),
('3680', 'Thai Binh', '214', 1),
('3681', 'Thai Nguyen', '214', 1),
('3682', 'Thanh Hoa', '214', 1),
('3683', 'Thua Thien-Hue', '214', 1),
('3684', 'Tien Giang', '214', 1),
('3685', 'Tra Vinh', '214', 1),
('3686', 'Tuyen Quang', '214', 1),
('3687', 'Vinh Long', '214', 1),
('3688', 'Vinh Phuc', '214', 1),
('3689', 'Yen Bai', '214', 1),
('3690', 'Can Tho', '214', 1),
('3691', 'Da Nang', '214', 1),
('3692', 'Hai Phong', '214', 1),
('3693', 'Hanoi', '214', 1),
('3694', 'Ho Chi Minh', '214', 1),
('3695', 'Other', '214', 1),
('3696', 'Tortola', '215', 1),
('3697', 'Other', '215', 1),
('3698', 'U.S. Virgins', '216', 1),
('3699', 'Other', '216', 1),
('3700', 'Other', '217', 1),
('3701', 'Abyan', '218', 1),
('3702', '\'Adan', '218', 1),
('3703', 'Ad Dali\'', '218', 1),
('3704', 'Al Bayda\'', '218', 1),
('3705', 'Al Hudaydah', '218', 1),
('3706', 'Al Jawf', '218', 1),
('3707', 'Al Mahrah', '218', 1),
('3708', 'Al Mahwit', '218', 1),
('3709', '\'Amran', '218', 1),
('3710', 'Dhamar', '218', 1),
('3711', 'Hadramawt', '218', 1),
('3712', 'Hajjah', '218', 1),
('3713', 'Ibb', '218', 1),
('3714', 'Lahij', '218', 1),
('3715', 'Ma\'rib', '218', 1),
('3716', 'Sa\'dah', '218', 1),
('3717', 'San\'a\'', '218', 1),
('3718', 'Shabwah', '218', 1),
('3719', 'Ta\'izz', '218', 1),
('3720', 'Other', '218', 1),
('3721', 'Central', '219', 1),
('3722', 'Copperbelt', '219', 1),
('3723', 'Eastern', '219', 1),
('3724', 'Luapula', '219', 1),
('3725', 'Lusaka', '219', 1),
('3726', 'Northern', '219', 1),
('3727', 'North-Western', '219', 1),
('3728', 'Southern', '219', 1),
('3729', 'Western', '219', 1),
('3730', 'Other', '219', 1),
('3731', 'Bulawayo', '220', 1),
('3732', 'Harare', '220', 1),
('3733', 'Manicaland', '220', 1),
('3734', 'Mashonaland Central', '220', 1),
('3735', 'Mashonaland East', '220', 1),
('3736', 'Mashonaland West', '220', 1),
('3737', 'Masvingo', '220', 1),
('3738', 'Matabeleland North', '220', 1),
('3739', 'Matabeleland South', '220', 1),
('3740', 'Midlands', '220', 1),
('3741', 'Other', '220', 1);

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
(4, 1, NULL, 'Manoj', 'D', 'Patel', 'manojp.divine@gmail.com', NULL, 'manoj123', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B+ve', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur1111', 1, 'MSP', 1, 1, 1, 0, 1, 'Indian', 'Hindu', NULL, 1, 100, 0, NULL, 1, '2019-20', NULL, 'Pending', 1, 0, '2021-05-20 10:45:29', '2021-05-20 10:44:45', '2022-01-06 13:59:13'),
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
(151, 4, 'Mr.', 'Mihir', 'Jay', 'Aahuja', NULL, NULL, NULL, '', NULL, 'None', 'M', '2021-12-16', 'Single', NULL, NULL, NULL, '1234567890', 'null', 1, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL, 0, 0, 0, 3, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-22 14:33:36', '2022-01-07 05:35:35'),
(152, 4, 'Mr.', 'Mihir', 'Jay', 'Aahuja', NULL, NULL, 'mhir123', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'None', 'M', '2021-12-03', 'Single', NULL, NULL, NULL, '1234567890', NULL, 1, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL, 0, 0, 0, 3, NULL, '2019-20', NULL, 'Pending', 0, 0, '2021-12-22 14:33:45', '2021-12-22 14:36:49', '2022-01-07 05:35:39'),
(153, 4, 'Mr.', 'Mihir', 'Jay', 'Aahuja', NULL, NULL, NULL, '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'A+', 'M', '2021-12-22', 'Single', NULL, 'null', NULL, '1234567890', 'null', 1, NULL, 0, 0, 0, 1, 0, 'null', 'null', 'null', 0, 0, 0, 3, 150, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-22 15:04:19', '2021-12-23 10:17:20'),
(162, 4, 'Mr.', 'Mihir jay', 'Jay', 'Mehta', NULL, NULL, NULL, '$2y$10$rUSlfTg2egmG91ZAojIjj.AviPT5v7aIfd5BMA69o.bIKe4BkwOA.', NULL, 'None', 'M', '2021-12-11', 'Single', '/images/employee/documents/photo_162_HU1ok.pdf', 'null', '+44744393081', '1234567890', 'null', 1, NULL, 0, 0, 0, 1, 0, 'null', 'null', 'null', 0, 0, 0, 150, 1, '2019-20', NULL, 'Rejected', 0, 0, NULL, '2021-12-22 18:43:55', '2021-12-23 19:24:41'),
(181, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:09:40', '2021-12-23 10:17:20'),
(184, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:13:19', '2021-12-23 10:17:20'),
(185, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:13:48', '2021-12-23 10:17:20'),
(186, 4, 'Er.', 'Visakha', 'Mohan', 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:14:22', '2021-12-23 10:17:20'),
(187, 4, 'Er.', 'Visakha', NULL, 'Patnayak', NULL, NULL, 'Visakha90', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, NULL, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:15:24', '2021-12-23 10:17:20'),
(188, 4, 'Er.', 'Visakha', 'Mohanbhai', 'Patnayak', NULL, NULL, NULL, '$2y$10$UGhEuJhRHGgA5lXpv4PkIuqtx3v1G.qa0gDUaXUniyP6TkDdKs0JO', NULL, 'B-', 'F', '1990-12-18', 'Married', NULL, '5080', '4400558890', '1234789045', 'Employee Add is Working Properly or not checking add form flow', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Darbar', 1, 0, 0, 150, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-23 13:16:06', '2021-12-23 19:15:04'),
(190, 4, 'Mr.', 'Mihir', 'Ajit', 'Aahuja', NULL, NULL, 'mihir21', 'YjF4bGMwcTNwM3I=', NULL, 'None', 'M', '2021-12-16', 'Single', NULL, NULL, NULL, '1234567890', NULL, 1, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, NULL, '2019-20', NULL, 'Pending', 0, 0, '2021-12-28 11:00:58', '2021-12-28 11:00:44', '2022-01-07 05:35:42'),
(204, 4, 'Mr.', 'Siya', 'Jay', 'Aahuja', NULL, NULL, 'test', 'eWNlbzhjYWxlMQ==', NULL, 'None', 'M', '2021-12-17', 'Single', NULL, NULL, NULL, '1234567890', 'null', 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22'),
(210, 4, 'Miss', 'Jiya', 'S', 'M', NULL, NULL, 'jiya91', 'aDY3c3Q3eXd1Yw==', NULL, 'None', 'M', '1991-12-31', 'Single', '/images/employee/documents/photo_210_zsugJ.png', NULL, NULL, '1234567890', NULL, 1, '/images/employee/documents/signature_210_zsugJ.jpg', 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1, 1, '2019-20', NULL, 'Approved', 1, 0, NULL, '2022-01-06 17:04:33', '2022-01-07 12:43:34'),
(211, 4, 'Mr.', 'Pragnesh7', 'A', 'Chauhan7', NULL, NULL, 'pragnesh22', 'dno2Mzd6eXN3cTk=', NULL, 'B+', 'M', '2022-01-08', 'Married', '/images/employee/documents/photo_211_2udHq.png', 'M077', '9408072557', '9408072557', 'Notes Notes Notes7', 0, NULL, 0, 0, 0, 0, 0, 'Indian7', 'Hindu7', 'Hindu7', 1, 0, 0, 1, 1, '2019-20', NULL, 'Pending', 0, 0, NULL, '2022-01-07 18:47:36', '2022-01-13 16:15:40');

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
(241, 204, 0, 0, '', '', '', '', '', '', '', '1234567890', '', 2, 1, 1, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22'),
(244, 210, 4, 95, 'test', 'test 12', '', '', '', '', 'test 12', '', '', 1, 1, 1, NULL, '2022-01-06 17:04:33', '2022-01-07 12:43:34'),
(245, 210, 89, 1212, 'ret', 'rewf', '', '', '', '', '', '1234567890', '', 2, 1, 1, NULL, '2022-01-06 17:04:33', '2022-01-07 12:43:34'),
(246, 211, 88, 1187, 'White Oak Ave7', 'White Oak Ave7', 'Langley7', 'Los Angles7', '917307', 'jane@doe.com7', 'Jane Doe7', '', '', 1, 1, 1, NULL, '2022-01-07 18:47:36', '2022-01-13 16:15:40'),
(247, 211, 87, 1159, 'White Oak Ave7', 'White Oak Ave7', 'Motera7', 'Los Angles7', '917307', '', '', '9408072557', 'https://www.matthewrufh.com7/', 2, 1, 1, NULL, '2022-01-07 18:47:36', '2022-01-13 16:15:40');

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
(33, 4, 204, NULL, 2, 4, NULL, NULL, '', '', '', '', 'test', 'eWNlbzhjYWxlMQ==', '', '', '', '', 'IMAP', '', '', '', '', 1, 1, 1, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22'),
(34, 4, 210, NULL, 1, 8, NULL, NULL, '', '', '', '', 'jiya91', 'aDY3c3Q3eXd1Yw==', '', '', '', '', 'IMAP', '', '', '', '', 1, 1, 1, NULL, '2022-01-06 17:04:33', '2022-01-07 12:43:34'),
(35, 4, 211, 211, 1, 8, '2022-01-09', NULL, 'Bank Name Ltd7', 'Vijay Nagar7', '50007', '454545554545', 'pragnesh22', 'dno2Mzd6eXN3cTk=', '18:46', '18:46', 'jane7@doe.com', 'jane@doe.com', 'POP', 'server7', '33067', 'server7', '33077', 1, 1, 1, NULL, '2022-01-07 18:47:36', '2022-01-13 16:15:40');

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
(22, 204, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 1, 1, 1, NULL, '2021-12-28 11:26:57', '2021-12-28 11:27:22'),
(23, 210, 'aadhar_card_210_ZmahL.jpg', '', 'election_card_210_ZmahL.png', '', 'pan_card_210_ZmahL.pdf', '', 'passport_210_ZmahL.pdf', '', 'driving_license_210_ZmahL.png', '', 1, 1, 1, NULL, '2022-01-06 17:04:33', '2022-01-07 12:43:34'),
(24, 211, NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'MP05855555557', 1, 1, 1, NULL, '2022-01-07 18:47:36', '2022-01-13 16:15:40');

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
(193, 204, 'test', '', 1204, NULL, '', '', 1, 1, NULL, '2021-12-28 11:27:22', '2021-12-28 11:27:22', NULL),
(206, 211, 'B Tech7', 'Ganpat University7', 2007, 2017, '97', 'B.Ed (Running)7', 1, 1, NULL, '2022-01-13 16:15:40', '2022-01-13 16:15:40', NULL),
(207, 211, 'MBA7', 'Ganpat University7', 2007, 2017, '97', 'B.Ed (Running)7', 1, 1, NULL, '2022-01-13 16:15:40', '2022-01-13 16:15:40', NULL);

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
(165, 150, 'Research Lab 2', 'Junior Traniee 1', 2019, 2021, '6000000', 1, 1, NULL, NULL, '2021-12-27 10:55:40', '2021-12-27 10:55:40'),
(179, 211, 'Business services7', 'Director7', 2017, 2027, '25007', 1, 1, NULL, NULL, '2022-01-13 16:15:40', '2022-01-13 16:15:40'),
(180, 211, 'Business services7', 'Director7', 2027, 2027, '25007', 1, 1, NULL, NULL, '2022-01-13 16:15:40', '2022-01-13 16:15:40');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_formulas`
-- (See below for the actual view)
--
CREATE TABLE `view_formulas` (
`id` int(11)
,`mst_companies_id` int(11)
,`formula_name` text
,`formula_type` varchar(155)
,`created_by` int(11)
,`updated_by` int(11)
,`created_at` datetime
,`updated_at` datetime
,`selected_year` varchar(25)
,`copied_from_year` int(4)
,`is_active` tinyint(1)
,`deleted_at` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_methods`
-- (See below for the actual view)
--
CREATE TABLE `view_methods` (
`id` int(11)
,`mst_companies_id` int(11)
,`name` varchar(255)
,`type` int(11)
,`date` date
,`file_1` text
,`file_2` text
,`file_3` text
,`file_4` text
,`description` text
,`created_by` int(11)
,`updated_by` int(11)
,`created_at` datetime
,`updated_at` datetime
,`selected_year` varchar(50)
,`copied_from_year` varchar(50)
,`is_active` tinyint(4)
,`deleted_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_pharmacopeia`
-- (See below for the actual view)
--
CREATE TABLE `view_pharmacopeia` (
`id` int(11)
,`mst_companies_id` int(11)
,`pharmacopeia_name` varchar(255)
,`vol_no` int(11)
,`pharmacopeia_year` int(4)
,`pharmacopeia_edition` varchar(255)
,`selected_year` varchar(50)
,`copied_from_year` int(11)
,`is_active` tinyint(1)
,`created_by` int(11)
,`updated_by` int(11)
,`deleted_at` datetime
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_products`
-- (See below for the actual view)
--
CREATE TABLE `view_products` (
`id` int(23)
,`mst_companies_id` int(11)
,`product_name` varchar(255)
,`product_generic` varchar(55)
,`marker_specification` varchar(255)
,`pharmacopeia_id` int(5)
,`generic_product_name` varchar(255)
,`packing_detail` varchar(255)
,`sample_description` text
,`hsn_Code` varchar(55)
,`selected_year` varchar(25)
,`copied_from_year` int(4)
,`is_active` tinyint(1)
,`created_by` int(11)
,`updated_by` int(11)
,`created_at` datetime
,`updated_at` datetime
,`deleted_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tests`
-- (See below for the actual view)
--
CREATE TABLE `view_tests` (
`id` int(11)
,`mst_companies_id` int(11)
,`procedure_name` varchar(255)
,`price` varchar(50)
,`test_code` varchar(50)
,`test_category` varchar(255)
,`test_procedure` text
,`parent_id` int(11)
,`created_by` int(11)
,`updated_by` int(11)
,`created_at` datetime
,`updated_at` datetime
,`selected_year` varchar(25)
,`copied_from_year` int(4)
,`is_active` tinyint(1)
,`deleted_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_users`
-- (See below for the actual view)
--
CREATE TABLE `view_users` (
`id` int(11)
,`mst_companies_id` int(11)
,`is_approved` varchar(55)
,`first_name` varchar(255)
,`middle_name` varchar(255)
,`last_name` varchar(255)
,`username` varchar(255)
,`machine_code` varchar(255)
,`mobile` varchar(255)
,`phone` varchar(255)
,`attendance` tinyint(1)
,`is_resigned` tinyint(1)
,`is_active` tinyint(1)
,`company` int(11)
,`mst_positions_id` int(11)
,`mst_departments_id` int(11)
,`reporting_authority_id` int(11)
,`email` text
,`street1` varchar(255)
,`street2` varchar(255)
,`area` varchar(255)
,`city` varchar(255)
,`position_title` varchar(255)
,`department_name` varchar(255)
,`reporting_authority` text
,`company_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `view_formulas`
--
DROP TABLE IF EXISTS `view_formulas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`aumresearch`@`%` SQL SECURITY DEFINER VIEW `view_formulas`  AS  select `formulas`.`id` AS `id`,`formulas`.`mst_companies_id` AS `mst_companies_id`,`formulas`.`formula_name` AS `formula_name`,`formulas`.`formula_type` AS `formula_type`,`formulas`.`created_by` AS `created_by`,`formulas`.`updated_by` AS `updated_by`,`formulas`.`created_at` AS `created_at`,`formulas`.`updated_at` AS `updated_at`,`formulas`.`selected_year` AS `selected_year`,`formulas`.`copied_from_year` AS `copied_from_year`,`formulas`.`is_active` AS `is_active`,`formulas`.`deleted_at` AS `deleted_at` from `formulas` ;

-- --------------------------------------------------------

--
-- Structure for view `view_methods`
--
DROP TABLE IF EXISTS `view_methods`;

CREATE ALGORITHM=UNDEFINED DEFINER=`aumresearch`@`%` SQL SECURITY DEFINER VIEW `view_methods`  AS  select `methods`.`id` AS `id`,`methods`.`mst_companies_id` AS `mst_companies_id`,`methods`.`name` AS `name`,`methods`.`type` AS `type`,`methods`.`date` AS `date`,`methods`.`file_1` AS `file_1`,`methods`.`file_2` AS `file_2`,`methods`.`file_3` AS `file_3`,`methods`.`file_4` AS `file_4`,`methods`.`description` AS `description`,`methods`.`created_by` AS `created_by`,`methods`.`updated_by` AS `updated_by`,`methods`.`created_at` AS `created_at`,`methods`.`updated_at` AS `updated_at`,`methods`.`selected_year` AS `selected_year`,`methods`.`copied_from_year` AS `copied_from_year`,`methods`.`is_active` AS `is_active`,`methods`.`deleted_at` AS `deleted_at` from `methods` ;

-- --------------------------------------------------------

--
-- Structure for view `view_pharmacopeia`
--
DROP TABLE IF EXISTS `view_pharmacopeia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`aumresearch`@`%` SQL SECURITY DEFINER VIEW `view_pharmacopeia`  AS  select `mst_pharmacopeia`.`id` AS `id`,`mst_pharmacopeia`.`mst_companies_id` AS `mst_companies_id`,`mst_pharmacopeia`.`pharmacopeia_name` AS `pharmacopeia_name`,`mst_pharmacopeia`.`vol_no` AS `vol_no`,`mst_pharmacopeia`.`pharmacopeia_year` AS `pharmacopeia_year`,`mst_pharmacopeia`.`pharmacopeia_edition` AS `pharmacopeia_edition`,`mst_pharmacopeia`.`selected_year` AS `selected_year`,`mst_pharmacopeia`.`copied_from_year` AS `copied_from_year`,`mst_pharmacopeia`.`is_active` AS `is_active`,`mst_pharmacopeia`.`created_by` AS `created_by`,`mst_pharmacopeia`.`updated_by` AS `updated_by`,`mst_pharmacopeia`.`deleted_at` AS `deleted_at`,`mst_pharmacopeia`.`created_at` AS `created_at`,`mst_pharmacopeia`.`updated_at` AS `updated_at` from `mst_pharmacopeia` ;

-- --------------------------------------------------------

--
-- Structure for view `view_products`
--
DROP TABLE IF EXISTS `view_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`aumresearch`@`%` SQL SECURITY DEFINER VIEW `view_products`  AS  select `mst_products`.`id` AS `id`,`mst_products`.`mst_companies_id` AS `mst_companies_id`,`mst_products`.`product_name` AS `product_name`,`mst_products`.`product_generic` AS `product_generic`,`mst_products`.`marker_specification` AS `marker_specification`,`mst_products`.`pharmacopeia_id` AS `pharmacopeia_id`,`mst_products`.`generic_product_name` AS `generic_product_name`,`mst_products`.`packing_detail` AS `packing_detail`,`mst_products`.`sample_description` AS `sample_description`,`mst_products`.`hsn_Code` AS `hsn_Code`,`mst_products`.`selected_year` AS `selected_year`,`mst_products`.`copied_from_year` AS `copied_from_year`,`mst_products`.`is_active` AS `is_active`,`mst_products`.`created_by` AS `created_by`,`mst_products`.`updated_by` AS `updated_by`,`mst_products`.`created_at` AS `created_at`,`mst_products`.`updated_at` AS `updated_at`,`mst_products`.`deleted_at` AS `deleted_at` from `mst_products` ;

-- --------------------------------------------------------

--
-- Structure for view `view_tests`
--
DROP TABLE IF EXISTS `view_tests`;

CREATE ALGORITHM=UNDEFINED DEFINER=`aumresearch`@`%` SQL SECURITY DEFINER VIEW `view_tests`  AS  select `mst_tests`.`id` AS `id`,`mst_tests`.`mst_companies_id` AS `mst_companies_id`,`mst_tests`.`procedure_name` AS `procedure_name`,`mst_tests`.`price` AS `price`,`mst_tests`.`test_code` AS `test_code`,`mst_tests`.`test_category` AS `test_category`,`mst_tests`.`test_procedure` AS `test_procedure`,`mst_tests`.`parent_id` AS `parent_id`,`mst_tests`.`created_by` AS `created_by`,`mst_tests`.`updated_by` AS `updated_by`,`mst_tests`.`created_at` AS `created_at`,`mst_tests`.`updated_at` AS `updated_at`,`mst_tests`.`selected_year` AS `selected_year`,`mst_tests`.`copied_from_year` AS `copied_from_year`,`mst_tests`.`is_active` AS `is_active`,`mst_tests`.`deleted_at` AS `deleted_at` from `mst_tests` ;

-- --------------------------------------------------------

--
-- Structure for view `view_users`
--
DROP TABLE IF EXISTS `view_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`aumresearch`@`%` SQL SECURITY DEFINER VIEW `view_users`  AS  select `users`.`id` AS `id`,`users`.`mst_companies_id` AS `mst_companies_id`,`users`.`is_approved` AS `is_approved`,`users`.`first_name` AS `first_name`,`users`.`middle_name` AS `middle_name`,`users`.`last_name` AS `last_name`,`users`.`username` AS `username`,`users`.`machine_code` AS `machine_code`,`users`.`mobile` AS `mobile`,`users`.`phone` AS `phone`,`users`.`attendance` AS `attendance`,`users`.`is_resigned` AS `is_resigned`,`users`.`is_active` AS `is_active`,`user_company_info`.`mst_companies_id` AS `company`,`user_company_info`.`mst_positions_id` AS `mst_positions_id`,`user_company_info`.`mst_departments_id` AS `mst_departments_id`,`user_company_info`.`reporting_authority_id` AS `reporting_authority_id`,`address`.`email` AS `email`,`address`.`street1` AS `street1`,`address`.`street2` AS `street2`,`address`.`area` AS `area`,`address`.`city` AS `city`,`positions`.`position_title` AS `position_title`,`department`.`department_name` AS `department_name`,concat(`rpAuth`.`first_name`,' ',`rpAuth`.`middle_name`,' ',`rpAuth`.`last_name`) AS `reporting_authority`,`company_name`.`company_name` AS `company_name` from ((((((`users` left join `user_company_info` on(`users`.`id` = `user_company_info`.`users_id`)) left join (select `mst_positions`.`id` AS `id`,`mst_positions`.`position_title` AS `position_title` from `mst_positions`) `positions` on(`user_company_info`.`mst_positions_id` = `positions`.`id`)) left join (select `mst_departments`.`id` AS `id`,`mst_departments`.`department_name` AS `department_name` from `mst_departments`) `department` on(`user_company_info`.`mst_departments_id` = `department`.`id`)) left join (select `users`.`id` AS `id`,`users`.`first_name` AS `first_name`,`users`.`middle_name` AS `middle_name`,`users`.`last_name` AS `last_name` from `users`) `rpAuth` on(`user_company_info`.`reporting_authority_id` = `rpAuth`.`id`)) left join (select `mst_companies`.`id` AS `id`,`mst_companies`.`company_name` AS `company_name` from `mst_companies`) `company_name` on(`user_company_info`.`mst_companies_id` = `company_name`.`id`)) left join (select `user_address_details`.`id` AS `id`,`user_address_details`.`users_id` AS `users_id`,`user_address_details`.`mst_countries_id` AS `mst_countries_id`,`user_address_details`.`mst_states_id` AS `mst_states_id`,`user_address_details`.`street1` AS `street1`,`user_address_details`.`street2` AS `street2`,`user_address_details`.`area` AS `area`,`user_address_details`.`city` AS `city`,`user_address_details`.`pincode` AS `pincode`,`user_address_details`.`email` AS `email`,`user_address_details`.`emergency_contact_name` AS `emergency_contact_name`,`user_address_details`.`emergency_contact_number` AS `emergency_contact_number`,`user_address_details`.`website` AS `website`,`user_address_details`.`address_type` AS `address_type`,`user_address_details`.`created_by` AS `created_by`,`user_address_details`.`updated_by` AS `updated_by`,`user_address_details`.`deleted_at` AS `deleted_at`,`user_address_details`.`created_at` AS `created_at`,`user_address_details`.`updated_at` AS `updated_at` from `user_address_details` order by `user_address_details`.`users_id` limit 1) `address` on(`users`.`id` = `address`.`users_id`)) ;

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
-- Indexes for table `methods`
--
ALTER TABLE `methods`
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
-- AUTO_INCREMENT for table `methods`
--
ALTER TABLE `methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key, Auto Increment', AUTO_INCREMENT=24;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mst_customers_contact_info`
--
ALTER TABLE `mst_customers_contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `user_address_details`
--
ALTER TABLE `user_address_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `user_assign_rights`
--
ALTER TABLE `user_assign_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_company_info`
--
ALTER TABLE `user_company_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user_doc_details`
--
ALTER TABLE `user_doc_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_edu_details`
--
ALTER TABLE `user_edu_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `user_emp_details`
--
ALTER TABLE `user_emp_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
