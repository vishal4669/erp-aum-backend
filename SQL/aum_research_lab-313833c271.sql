-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2021 at 07:30 PM
-- Server version: 5.7.36-0ubuntu0.18.04.1
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp-aum-backend`
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
  `receipte_date` date NOT NULL,
  `booking_no` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `remarks` text NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `mfg_date` date NOT NULL,
  `mfg_options` char(7) NOT NULL,
  `exp_date` date NOT NULL,
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

INSERT INTO `bookings` (`id`, `mst_companies_id`, `booking_type`, `invoice_no`, `report_type`, `invoice_date`, `receipte_date`, `booking_no`, `customer_id`, `reference_no`, `remarks`, `manufacturer_id`, `supplier_id`, `mfg_date`, `mfg_options`, `exp_date`, `exp_options`, `analysis_date`, `aum_serial_no`, `d_format`, `d_format_options`, `grade`, `grade_options`, `project_name`, `project_options`, `mfg_lic_no`, `is_report_dispacthed`, `dispatch_date_time`, `dispatch_mode`, `dispatch_details`, `signature`, `verified_by`, `nabl_scope`, `cancel`, `cancel_remarks`, `priority`, `discipline`, `booking_group`, `statement_ofconformity`, `coa_release_date`, `block`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `copied_from_company`, `is_active`, `deleted_at`) VALUES
(1, 1, 'Temp', NULL, 'FP', '2021-10-23', '2021-10-07', 'ARL/COA/hth/210420/0015', 7, '2389239', 'remarks details', 11, 1, '2021-09-25', 'N/A', '2021-09-29', 'None', '2021-09-27', 1, 'D Format', 'none', 'A+', 'N/A', 'Aum research', 'None', '25LA775', 0, 'Invalid date', NULL, NULL, 1, 'QA', 1, 'yes', 'cancel remarks detail', 'high', 'Chemical', 'Drugs and Pharmaceuticals', 'Pass', '2021-10-10', 0, 3, 3, '2021-10-18 09:52:35', '2021-10-25 06:20:58', '2019-20', NULL, NULL, 1, NULL),
(2, 1, 'Received', NULL, 'FP', '2021-10-26', '2021-10-18', 'ARL/COA/FP/211018/002', 6, '9408072111', 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 11, 1, '2021-10-18', 'N/A', '2021-10-21', 'N/S', '2021-10-21', 2, 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'N/A', 'A+', 'N/A', 'Newproject', 'N/A', '00765100', 1, '2021-10-17T19:37', 'Collect by Party', 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 1, 'QA', 1, 'Yes', 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'High', 'Biological', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, 3, '2021-10-18 10:12:22', '2021-10-26 06:37:16', '2019-20', NULL, NULL, 1, NULL),
(3, 4, 'Received', NULL, 'RM', '2021-10-29', '2021-10-22', 'ARL/COA/RM/211019/001', 5, '878373387', 'This is new booking for business service', 11, 1, '2021-10-12', 'N/S', '2021-12-30', 'N/S', '2021-10-18', 3, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, 'Invalid date', NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 2, 2, '2021-10-19 09:07:13', '2021-10-29 07:30:26', '2019-20', NULL, NULL, 1, NULL),
(4, 1, 'Report', NULL, 'OT', NULL, '2021-10-20', 'ARL/COA/OT/700101/001', 13, '', '', 0, 0, '2021-10-20', 'N/S', '2021-10-21', 'N/S', NULL, 4, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, NULL, NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-19 13:40:39', NULL, '2019-20', NULL, NULL, 1, NULL),
(5, 1, 'Invoice', '059jcnni', 'FP', '2021-10-08', '2021-10-07', 'ARL/COA/hth/210420/0015', 7, '2389239', 'remarks details', 1, 8, '2021-09-25', 'N/A', '2021-09-29', 'None', '2021-09-27', 1, 'D Format', 'none', 'A+', 'N/A', 'Aum research', 'None', '25LA775', 1, '2021-10-08T10:07', 'dispatch_mode', 'dispatch_details', 1, 'QA', 1, 'yes', 'cancel remarks detail', 'high', 'Chemical', 'Drugs and Pharmaceuticals', 'Pass', '2021-10-10', 0, 3, 3, '2021-10-20 06:11:01', '2021-10-23 10:54:00', '2019-20', NULL, NULL, 1, NULL),
(6, 1, 'Report', NULL, 'TP', NULL, '2021-10-27', 'ARL/COA/TP/211027/001', 2, 'test123', '', 8, 1, '2021-10-01', 'None', '2022-04-30', 'N/A', NULL, 6, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, NULL, NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-20 06:38:02', NULL, '2019-20', NULL, NULL, 1, NULL),
(18, 1, 'Entry', NULL, 'RM', NULL, '2021-10-16', 'ARL/COA/RM/700101/001', 13, '', '', 0, 0, '2021-10-20', 'N/S', '2021-10-23', 'N/S', '2021-10-20', 7, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, NULL, NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-20 07:20:41', NULL, '2019-20', NULL, NULL, 1, NULL),
(24, 1, 'Data Fillup', NULL, 'AYUSH', NULL, '2021-10-15', 'ARL/COA/AYUSH/211015/001', 7, '', '', 0, 0, '2021-10-01', 'N/S', '2021-10-30', 'N/S', NULL, 8, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, NULL, NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-20 07:33:33', NULL, '2019-20', NULL, NULL, 1, NULL),
(25, 1, 'Data Fillup', NULL, 'AYUSH', NULL, '2021-10-22', 'ARL/COA/AYUSH/211022/001', 13, '', '', 0, 0, '2021-10-15', 'N/S', '2021-11-04', 'N/S', NULL, 9, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, NULL, NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-20 11:20:57', NULL, '2019-20', NULL, NULL, 1, NULL),
(26, 1, 'Dispatched', NULL, 'RM', NULL, '2021-10-09', 'ARL/COA/RM/211009/001', 2, '', '', 0, 0, '2021-10-07', 'N/S', '2021-10-29', 'N/S', NULL, 10, '', 'N/S', '', 'N/S', '', 'N/S', '', 0, NULL, NULL, NULL, 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-20 11:21:59', NULL, '2019-20', NULL, NULL, 1, NULL),
(27, 1, 'Temp', NULL, 'ADL', NULL, '2021-10-02', 'ARL/COA/ADL/211002/001', 4, '9408072555', '', 11, 1, '2021-10-01', 'N/S', '2021-10-30', 'N/S', NULL, 11, '', 'N/S', '', 'N/S', '', 'N/S', '', 1, '2021-10-29 05:10:00 PM', 'By Hand Delivery', 'testdetails', 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-21 11:40:55', '2021-10-21 11:45:05', '2019-20', NULL, NULL, 1, '2021-10-21 11:45:05'),
(28, 1, 'Dispatched', NULL, 'OT', NULL, '2021-10-08', 'ARL/COA/OT/211008/002', 5, 'test123', '', 0, 0, '2021-10-01', 'N/S', '2021-10-30', 'N/S', NULL, 12, '', 'N/S', '', 'N/S', '', 'N/S', '', 1, '2021-10-23 05:15:00 PM', 'By Courier', 'rertrtytyututyuy', 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-21 11:44:33', '2021-10-21 11:45:01', '2019-20', NULL, NULL, 1, '2021-10-21 11:45:01'),
(29, 1, 'Temp', NULL, 'OT', NULL, '2021-10-08', 'ARL/COA/OT/211008/002', 13, '', '', 0, 0, '2021-10-16', 'N/S', '2021-11-05', 'N/S', NULL, 11, '', 'N/S', '', 'N/S', '', 'N/S', '', 1, '2021-10-22T21:21', 'By Hand Delivery', 'Courier by Preksha', 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-21 11:47:37', NULL, '2019-20', NULL, NULL, 1, NULL),
(30, 1, 'Dispatched', NULL, 'FP', NULL, '2021-10-22', 'ARL/COA/FP/211022/005', 2, '9408072555', '', 0, 0, '2021-10-21', 'None', '2021-10-22', 'None', NULL, 12, '', 'N/S', '', 'N/S', '', 'N/S', '', 1, '2021-10-22T17:54', 'By Courier', 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 'QA', 1, 'Yes', 'Cancel Remarks', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-21 12:27:37', NULL, '2019-20', NULL, NULL, 1, NULL),
(31, 1, 'Invoice', '34543554654', 'ADL', '2021-10-22', '2021-10-23', 'ARL/COA/ADL/211023/001', 12, '', '', 0, 0, '2021-10-01', 'N/S', '2021-10-30', 'N/S', NULL, 13, '', 'N/S', '', 'N/S', '', 'N/S', '', 1, '2021-10-16T18:17', 'By Hand Delivery', 'Courier by Preksha', 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-21 12:45:06', NULL, '2019-20', NULL, NULL, 1, NULL),
(32, 1, 'Invoice', '6529', 'AYUSH', '2021-10-15', '2021-10-22', 'ARL/COA/AYUSH/211022/002', 14, '9408072555', 'test', 8, 1, '2021-10-15', 'None', '2021-10-28', 'None', '2021-10-16', 14, 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'None', 'A+', 'N/A', 'Newproject', 'None', '00765100', 1, '2021-10-03T10:15', 'By Hand Delivery', 'Courier by Preksha', 1, 'QA', 1, 'Yes', 'report', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-21 13:47:01', NULL, '2019-20', NULL, NULL, 1, NULL),
(33, 1, 'Report', NULL, 'OT', '2021-10-23', '2021-10-22', 'ARL/COA/OT/211022/003', 13, '', '', 8, 1, '2021-10-21', 'N/S', '2021-10-24', 'N/S', '2021-10-24', 15, '', 'N/S', '', 'N/S', '', 'N/S', '', 1, '2021-10-24T23:10', 'By Hand Delivery', 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 'None', 0, 'None', '', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, 3, '2021-10-21 13:47:42', '2021-10-23 06:09:07', '2019-20', NULL, NULL, 1, NULL),
(38, 1, 'Invoice', '1234567890', 'AYUSH', '2021-10-23', '2021-10-30', 'ARL/COA/AYUSH/211030/003', 6, '2389239', 'Remarks', 11, 4, '2021-10-07', 'None', '2021-10-30', 'N/A', '2021-10-22', 16, 'D Format', 'None', 'C+', 'N/S', 'Aum research', 'N/S', '25LA775', 1, '2021-10-23T12:57', 'Collect by Party', 'Dispatch Details', 0, 'None', 0, 'None', 'Cancel Remarks', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, 3, '2021-10-23 07:29:27', '2021-10-23 09:01:30', '2019-20', NULL, NULL, 1, NULL),
(39, 1, 'Invoice', '00006913', 'OT', '2021-10-28', '2021-10-28', 'ARL/COA/OT/211028/004', 13, '9408072555', 'Remarks', 14, 4, '2021-10-28', 'N/A', '2021-10-31', 'N/S', '2021-10-28', 17, 'D Format1', 'N/S', 'A+', 'N/S', 'Aum research', 'N/S', '25LA775', 1, '2021-10-28T18:30', 'By Courier', 'Courier by Preksha', 1, 'QA', 1, 'Yes', 'Cancel Remarks', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 3, NULL, '2021-10-27 13:06:39', NULL, '2019-20', NULL, NULL, 1, NULL),
(42, 4, 'Entry', NULL, 'RM', NULL, '2021-10-22', 'ARL/COA/RM/211022/002', 12, '8762', 'this is remark', 11, 4, '2021-10-29', 'N/S', '2021-10-30', 'N/S', '2021-10-29', 18, '12', 'N/S', 'Male', 'N/S', 'P', 'N/S', 'Not Specified', 1, '2021-10-29T12:50', 'By Hand Delivery', 'Despatch detail', 0, 'QA', 1, 'Yes', 'cancel', 'High', 'Chemical', 'Drugs and Pharmaceuticals', 'PASS', NULL, NULL, 2, NULL, '2021-10-29 07:23:38', NULL, '2019-20', NULL, NULL, 1, NULL);

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
(1, 4, 'Audit Remarks', 'Audit Remarks\nReason', 'Comments', 3, NULL, '2021-10-19 13:40:39', NULL, '2019-20', NULL, 1, NULL),
(2, 6, 'test', 'test123', 'test123456', 3, NULL, '2021-10-20 06:38:02', NULL, '2019-20', NULL, 1, NULL),
(3, 33, 'Audit Remarks', 'Reason', 'Comments', 3, 3, '2021-10-21 13:47:42', '2021-10-23 07:05:42', '2019-20', NULL, 1, NULL),
(4, 1, '', '', '', 3, 3, '2021-10-22 08:56:17', '2021-10-23 07:29:03', '2019-20', NULL, 1, NULL),
(5, 5, 'audit remarks1', 'reasons behind it1', 'comments1', 3, 3, '2021-10-22 10:45:46', '2021-10-22 11:10:01', '2019-20', NULL, 1, NULL),
(6, 38, '', '', '', 3, 3, '2021-10-23 09:00:28', '2021-10-23 09:02:28', '2019-20', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_sample_details`
--

CREATE TABLE `booking_sample_details` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` int(25) NOT NULL,
  `packsize` varchar(55) NOT NULL,
  `request_quantity` int(11) NOT NULL,
  `sample_code` varchar(100) NOT NULL,
  `sample_description` text NOT NULL,
  `sample_quantity` int(11) NOT NULL,
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
  `batch_size_qty_rec` int(11) NOT NULL,
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
(1, 1, 6, 0, '', 0, '', '', 0, '', '', '', '2021-10-22', '', '2021-10-30', '', '', 1, '', 0, 0, 'test', '', 3, 3, '2021-10-18 09:52:35', '2021-10-26 06:36:45', '2019-20', NULL, 1, NULL),
(2, 2, 4, 10, '57', 77, 'EASPORTS6914', 'EASPORTS6914', 14, 'Keas 69 Str. 15234, Chalandri Athens, Greece', 'Keas 69 Str. 15234, Chalandri Athens, Greece', 'Sample Type', '2021-10-19', 'N/A', '2021-10-21', 'N/A', 'By Hand', 1, 'Secured seal with label', 1, 14, 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Sample Drawn By', 3, 3, '2021-10-18 10:12:22', '2021-10-26 06:37:16', '2019-20', NULL, 1, NULL),
(3, 3, 2, 1, '1', 2, '121', 'desc', 1, '', '', '', '2021-10-29', 'N/S', '2021-11-05', 'N/S', 'By Courier', 1, '', 0, 0, '', '', 2, 2, '2021-10-19 09:07:13', '2021-10-29 07:30:26', '2019-20', NULL, 1, NULL),
(4, 4, 2, 12, '', 0, '', '', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-19 13:40:39', NULL, '2019-20', NULL, 1, NULL),
(5, 5, 2, 0, '', 0, '', '', 0, '', '', '', '2021-10-23', '', '2021-10-30', '', '', 1, '', 0, 0, '', '', 3, 3, '2021-10-20 06:11:01', '2021-10-23 10:54:00', '2019-20', NULL, 1, NULL),
(6, 6, 3, 656, '5', 6, '10', 'test desc', 50, 'test loc', 'test package', 'test type', '2021-10-01', 'N/S', '2022-09-30', 'N/A', 'By Hand', 1, 'Secured seal with label123', 1, 45, '* Marking test analysis are  not under  NABL scope123', 'Darshan Vacchani', 3, NULL, '2021-10-20 06:38:02', NULL, '2019-20', NULL, 1, NULL),
(7, 18, 2, 123, '', 0, '', '', 0, '', '', '', '2021-10-20', 'N/S', '2021-10-24', 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-20 07:20:41', NULL, '2019-20', NULL, 1, NULL),
(8, 24, 4, 1000000000, '', 0, '', '', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-20 07:33:33', NULL, '2019-20', NULL, 1, NULL),
(9, 25, 6, 0, '', 0, '', '', 0, '', '', '', '2021-10-20', 'N/S', '2021-10-29', 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-20 11:20:57', NULL, '2019-20', NULL, 1, NULL),
(10, 26, 3, 0, '', 0, '', '', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-20 11:21:59', NULL, '2019-20', NULL, 1, NULL),
(11, 27, 4, 0, '', 0, '', '', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-21 11:40:55', '2021-10-21 11:45:05', '2019-20', NULL, 1, '2021-10-21 11:45:05'),
(12, 28, 4, 0, '', 0, '', '', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-21 11:44:33', '2021-10-21 11:45:01', '2019-20', NULL, 1, '2021-10-21 11:45:01'),
(13, 29, 4, 0, '', 0, '', '', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-21 11:47:37', NULL, '2019-20', NULL, 1, NULL),
(14, 30, 2, 26, '55', 77, 'EASPORTS6913', 'EASPORTS6913', 0, '', '', '', '2021-10-22', 'N/S', '2021-10-24', 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-21 12:27:37', NULL, '2019-20', NULL, 1, NULL),
(15, 31, 3, 0, '', 0, '', '', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 3, NULL, '2021-10-21 12:45:06', NULL, '2019-20', NULL, 1, NULL),
(16, 32, 1, 1, '55', 77, 'EASPORTS6913', 'EASPORTS6913', 13, 'Keas 69 Str. 15234, Chalandri Athens, Greece', 'Keas 69 Str. 15234, Chalandri Athens, Greece', 'Sample Type', '2021-10-01', 'N/S', '2021-10-30', 'N/S', 'By Courier', 1, 'Secured seal with label', 0, 13, 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Darshan Vacchani', 3, NULL, '2021-10-21 13:47:01', NULL, '2019-20', NULL, 1, NULL),
(17, 33, 2, 54322, '55', 77, 'EASPORTS6913', 'EASPORTS6913', 13, 'Keas 69 Str. 15234, Chalandri Athens, Greece', 'Packaging', 'sample type', '2021-10-22', 'N/S', '2021-10-24', 'N/S', 'By Courier', 1, '', 0, 13, 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '', 3, 3, '2021-10-21 13:47:42', '2021-10-23 07:05:42', '2019-20', NULL, 1, NULL),
(18, 38, 3, 123456789, '123', 23, '234467', 'Sample Desc', 12, 'Sample Location', 'Sample Packaging', 'Sample Type', '2021-10-01', 'N/S', '2021-10-30', 'N/S', 'By Courier', 1, 'Sample Condition', 0, 50, 'Notes', 'Sample Drawn By', 3, 3, '2021-10-23 07:29:27', '2021-10-23 09:02:28', '2019-20', NULL, 1, NULL),
(19, 39, 2, 1, '32', 777, 'EASPORTS6913', 'EASPORTS6913', 13, 'Keas 69 Str. 15234, Chalandri Athens, Greece', 'Keas 69 Str. 15234, Chalandri Athens, Greece', 'Sample Type', '2021-10-28', 'N/S', '2021-10-31', 'N/S', 'By Courier', 1, 'Secured seal with label', 1, 13, 'Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Sample Drawn By', 3, NULL, '2021-10-27 13:06:39', NULL, '2019-20', NULL, 1, NULL),
(20, 42, 7, 72727, '87', 1, '2', '2', 0, '', '', '', NULL, 'N/S', NULL, 'N/S', 'By Courier', 1, '', 0, 0, '', '', 2, NULL, '2021-10-29 07:23:38', NULL, '2019-20', NULL, 1, NULL);

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
  `percentage_of_label_claim` decimal(15,2) DEFAULT NULL,
  `min_limit` varchar(55) NOT NULL,
  `max_limit` varchar(55) NOT NULL,
  `result` text,
  `label_claim_result` varchar(255) DEFAULT NULL,
  `label_claim_unit` varchar(60) DEFAULT NULL,
  `result2` text,
  `mean` varchar(150) DEFAULT NULL,
  `na_content` text,
  `final_na_content` text,
  `unit` varchar(60) DEFAULT NULL,
  `expanded_uncertanity` text,
  `amount` decimal(15,2) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `test_time` varchar(255) DEFAULT NULL,
  `test_date_time` varchar(255) DEFAULT NULL,
  `approval_date_time` varchar(255) DEFAULT NULL,
  `approved` varchar(20) DEFAULT NULL,
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

INSERT INTO `booking_tests` (`id`, `booking_id`, `parent_child`, `p_sr_no`, `by_pass`, `parent`, `product_details`, `test_name`, `label_claim`, `percentage_of_label_claim`, `min_limit`, `max_limit`, `result`, `label_claim_result`, `label_claim_unit`, `result2`, `mean`, `na_content`, `final_na_content`, `unit`, `expanded_uncertanity`, `amount`, `division`, `method`, `test_time`, `test_date_time`, `approval_date_time`, `approved`, `chemist_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(5, 4, 'Parent', '', 1, 20, 'testing here', 'dgfdg', '202', NULL, '33', '101', '', '', '', '', '', '', '', '', '', '1111.00', '', '', NULL, NULL, NULL, '', 85, 3, 3, '2021-10-19 13:40:39', '2021-10-19 13:40:39', '2019-20', NULL, 1, NULL),
(8, 6, 'Parent', '', 2, 15, '', 'Assay123', '1000', NULL, '7852', '', '', '', '', '', '', '', '', '', '', '0.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-20 06:38:02', '2021-10-20 06:38:02', '2019-20', NULL, 1, NULL),
(9, 6, 'Parent', '', 2, 14, '', 'test parameter', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '5000.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-20 06:38:02', '2021-10-20 06:38:02', '2019-20', NULL, 1, NULL),
(10, 18, 'Parent', '', 1, 20, 'testing here', 'dgfdg', '202', NULL, '33', '101', '', '', '', '', '', '', '', '', '', '1111.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-20 07:20:41', '2021-10-20 07:20:41', '2019-20', NULL, 1, NULL),
(11, 25, 'Parent', '', 1, 22, 'description', 'newparams022', 'labe', NULL, '10', '100', '', '', '', '', '', '', '', '', '', '500.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-20 11:20:57', '2021-10-20 11:20:57', '2019-20', NULL, 1, NULL),
(12, 25, 'Parent', '', 1, 13, 'description1', 'newparams122', 'lab1', NULL, '20', '200', '', '', '', '', '', '', '', '', '', '700.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-20 11:20:57', '2021-10-20 11:20:57', '2019-20', NULL, 1, NULL),
(13, 26, 'Parent', '', 2, 15, '', 'Assay123', '1000', NULL, '7852', '', '', '', '', '', '', '', '', '', '', '0.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-20 11:21:59', '2021-10-20 11:21:59', '2019-20', NULL, 1, NULL),
(14, 26, 'Parent', '', 2, 0, '', 'test parameter', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '5000.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-20 11:21:59', '2021-10-20 11:21:59', '2019-20', NULL, 1, NULL),
(15, 30, 'Parent', '', 1, 20, 'testing here', 'dgfdg', '202', NULL, '33', '101', '', '', '', '', '', '', '', '', '', '1111.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-21 12:27:37', '2021-10-21 12:27:37', '2019-20', NULL, 1, NULL),
(16, 31, 'Parent', '', 2, 15, '', 'Assay123', '1000', NULL, '7852', '', '', '', '', '', '', '', '', '', '', '0.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-21 12:45:06', '2021-10-21 12:45:06', '2019-20', NULL, 1, NULL),
(17, 31, 'Parent', '', 2, 0, '', 'test parameter', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '5000.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-21 12:45:06', '2021-10-21 12:45:06', '2019-20', NULL, 1, NULL),
(18, 32, 'Child', '1', 2, 16, 'test', 'test', '1', NULL, '2', '3', '', '', '', '', '', '', '', '', '', '44.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-21 13:47:01', '2021-10-21 13:47:01', '2019-20', NULL, 1, NULL),
(106, 33, 'Parent', '865', 1, 14, 'Product Details', 'testname1', '201', '99.00', '', '', '', '', '', '', '', '', '', '', '', '0.00', '', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-10-23 07:05:42', '2021-10-23 07:05:42', '2019-20', NULL, 1, NULL),
(132, 38, 'Parent', '1', 2, 15, 'Product Details1', 'Assay1232', '10001', NULL, '7853', '7856', '', '', '', '', '', '', '', '', '', '2500.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-23 09:02:28', '2021-10-23 09:02:28', '2019-20', NULL, 1, NULL),
(133, 38, 'Child', '1.1', 2, 2, 'Product Details2', 'test parameter1', '10002', NULL, '7854', '7880', '', '', '', '', '', '', '', '', '', '5000.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-23 09:02:28', '2021-10-23 09:02:28', '2019-20', NULL, 1, NULL),
(134, 5, 'Parent', '', 1, 20, 'testing here', 'dgfdg', '202', NULL, '33', '101', '', '', '', '', '', '', '', '', '', '1111.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-23 10:54:00', '2021-10-23 10:54:00', '2019-20', NULL, 1, NULL),
(139, 1, 'Child', '866', 2, 15, 'Product Details1', 'Test Name1', 'Label Claim1', '11.00', '50', '101', 'Result', 'Label Claim Result', '70', '70', '70', '70', '70', 'Unit', 'Expanded Uncertainty', '120.00', 'division', 'method', '160', '2021-10-09T15:14', '2021-11-21T06:16', 'Pending', 3, 3, 3, '2021-10-26 06:36:45', '2021-10-26 06:36:45', '2019-20', NULL, 1, NULL),
(140, 1, 'Child', '867', 1, 21, 'Product Details', 'Test Name', '48', '99.00', '501', '333', 'Result', '', '', '', '', '', '', '', '', '0.00', '', '', NULL, NULL, NULL, 'Pending', NULL, 3, 3, '2021-10-26 06:36:45', '2021-10-26 06:36:45', '2019-20', NULL, 1, NULL),
(141, 39, 'Parent', '1', 1, 20, 'testing here', 'dgfdg', '202', NULL, '33', '101', '', '', '', '', '', '', '', '', '', '1111.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-27 13:06:39', '2021-10-27 13:06:39', '2019-20', NULL, 1, NULL),
(142, 39, 'Child', '1.NaN', 1, 13, 'testing here', 'child node', '203', NULL, '50', '100', '', '', '', '', '', '', '', '', '', '5078.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-27 13:06:39', '2021-10-27 13:06:39', '2019-20', NULL, 1, NULL),
(143, 39, 'Parent', '2', 1, 31, 'testing here', 'Parent node', '204', NULL, '50', '100', '', '', '', '', '', '', '', '', '', '70092.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-27 13:06:39', '2021-10-27 13:06:39', '2019-20', NULL, 1, NULL),
(144, 39, 'Child', '2.1', 1, 14, 'testing here', 'Child node', '205', NULL, '50', '100', '', '', '', '', '', '', '', '', '', '1111.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-27 13:06:39', '2021-10-27 13:06:39', '2019-20', NULL, 1, NULL),
(145, 39, 'Child', '2.2', 1, 14, 'testing here', 'Child node', '206', NULL, '50', '100', '', '', '', '', '', '', '', '', '', '500.00', '', '', NULL, NULL, NULL, '', NULL, 3, 3, '2021-10-27 13:06:39', '2021-10-27 13:06:39', '2019-20', NULL, 1, NULL),
(146, 42, 'Parent', '1', 2, 0, 'White to off white colored round shape tablet with one side break line and other side plain.', 'Average weight', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '0.00', '', '', NULL, NULL, NULL, '', NULL, 2, 2, '2021-10-29 07:23:38', '2021-10-29 07:23:38', '2019-20', NULL, 1, NULL),
(147, 42, 'Parent', '2', 2, 32, '', 'Average weight', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '0.00', '', '', NULL, NULL, NULL, '', NULL, 2, 2, '2021-10-29 07:23:38', '2021-10-29 07:23:38', '2019-20', NULL, 1, NULL),
(148, 42, 'Parent', '3', 2, 0, '', 'Identification', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '200.00', '', '', NULL, NULL, NULL, '', NULL, 2, 2, '2021-10-29 07:23:38', '2021-10-29 07:23:38', '2019-20', NULL, 1, NULL),
(149, 3, 'Parent', '1', 1, 20, 'testing here', 'dgfdg', '202', NULL, '33', '101', '', '', '', '', '', '', '', '', '', '1111.00', '', '', NULL, NULL, NULL, '', 3, 2, 2, '2021-10-29 07:30:26', '2021-10-29 07:30:26', '2019-20', NULL, 1, NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_banks`
--

INSERT INTO `mst_banks` (`id`, `mst_companies_id`, `bank_name`, `branch_name`, `customer_id`, `account_no`, `micr_code`, `ifsc_code`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'hdfc', 'vadaj', '123456', '12345678913', 123456789, 'HDFC5678901', 1, NULL, '2021-08-05 05:16:20', '2021-08-05 09:41:37', '2019-20', NULL, 1, '2021-08-05 09:41:37'),
(2, 1, 'ICICI Bank1', 'Paldi', '123456789012gggg', '125689ETRGF00', 123456755, '586922ERFGG', 3, 3, '2021-08-05 08:53:34', '2021-08-05 09:40:09', '2019-20', NULL, 1, NULL),
(3, 1, 'Kotak Mahindra', 'test123', '123456', '1234456576', 123456899, '11111111111', 3, NULL, '2021-10-19 05:58:14', '2021-10-19 05:58:14', '2019-20', NULL, 1, NULL);

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
  `parent_category_id` int(11) DEFAULT '0',
  `category_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store all master companies list';

--
-- Dumping data for table `mst_companies`
--

INSERT INTO `mst_companies` (`id`, `company_name`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Aum Research Laboratries', 1, 2, '2017-18', NULL, 1, NULL, '2021-05-18 06:47:45', '2021-10-28 10:55:51'),
(4, 'Aum Research Labs Pvt Ltd', 3, 2, '2019-20', NULL, 1, NULL, '2021-05-18 06:10:45', '2021-10-28 10:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `mst_countries`
--

CREATE TABLE `mst_countries` (
  `id` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `ISO` char(2) DEFAULT NULL,
  `ISO3` char(3) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
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
  `notes` text,
  `logo` varchar(255) DEFAULT NULL,
  `education_details` text,
  `prev_details` text,
  `company_tin_no` varchar(155) DEFAULT NULL,
  `company_service_tax_no` varchar(155) DEFAULT NULL,
  `company_cust_discount` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_customers`
--

INSERT INTO `mst_customers` (`id`, `mst_companies_id`, `company_name`, `gst_number`, `contact_person_name`, `tally_alias_name`, `user_name`, `password`, `birth_date`, `contact_type`, `priority`, `notes`, `logo`, `education_details`, `prev_details`, `company_tin_no`, `company_service_tax_no`, `company_cust_discount`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'TCSS', '06AABCU9603R1ZQ', 'HRR', 'RHH', 'HR1@gmail.com', '$2y$10$y7Q7tZ0f7HJIQ69Hoccq2e0CSPfxbzeaPPizCfW3lSMX7LuLvM.c.', '2021-10-10', 'Supplier', 'Medium', 'TCSS TCSS TCSS', '20210913072137.png', 'BCA MCA', 'BCA MCA', '900-70-0000', '89563235683', 'null', 3, 3, '2021-09-13 07:10:43', '2021-10-25 06:58:46', '2019-20', NULL, 1, '2021-10-25 06:58:46'),
(2, 1, 'Divine infosys', NULL, 'vishal kotak', 'null', 'preksha.divine@gmail.com', '$2y$10$lrSNQtLTuLrsogMpjrsAteGnEkad9C90AitD4jtvPknj6zFGnAdxu', NULL, 'Customer', 'High', 'null', NULL, 'null', 'null', NULL, 'null', 'null', 3, 3, '2021-09-13 07:34:50', '2021-10-21 12:48:30', '2019-20', NULL, 1, '2021-10-21 12:48:30'),
(3, 1, 'Riya Chemicals1', '06AABCU9603R1ZQ', 'Jiten Roy1', 'riya_chemicals56891', 'preksha.divine@gmail.com', '$2y$10$ztxES1cZKSzPgTlsXARbB./KdOAz71b.LL42X0UMVkWHGFea4.qaK', '2021-09-02', 'Service Provider', 'Medium', 'Customer Add Testing123', '20210914073629.png', 'Lora ipsum Education Details', 'Lora ipsum Previous Education Details or Work Details', NULL, 'Div Systems LLP', 'Div Systems LLP', 3, 3, '2021-09-14 07:19:28', '2021-10-01 12:56:15', '2019-20', NULL, 1, NULL),
(4, 1, 'Business services', NULL, 'Jane Doe', NULL, 'preksha.divin', '$2y$10$8x1UnHxq/LTAk2dhDjhSRO1y7GEfj3ur9RpxIJYpX8qBQzLNdsqJq', NULL, 'Supplier', 'High', NULL, '', NULL, NULL, NULL, NULL, NULL, 3, 3, '2021-09-14 07:30:13', '2021-09-14 07:30:13', '2019-20', NULL, 1, NULL),
(5, 1, 'Business services', NULL, 'Jane Doe', NULL, 'preksha.divine@gmail.com', '$2y$10$L/4WiSRm7zCUzURWEp7XwOHZvdZKuAUGIzi6O1wd/3WU7XUzcTbZG', NULL, 'Customer', 'High', NULL, '', NULL, NULL, NULL, NULL, NULL, 3, 3, '2021-09-14 08:52:46', '2021-09-14 08:52:46', '2019-20', NULL, 1, NULL),
(6, 1, 'Divine infosys', '06AABCU9603R1ZR', 'D V', NULL, 'preksha.divine@gmail.com', '$2y$10$6DFdy0iqErFeFh5VP.8dbeYSaF4bnFDstPMkYzgygWCL/KLVinhRC', NULL, 'Customer', 'High', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, '2021-09-14 08:54:16', '2021-09-21 12:22:12', '2019-20', NULL, 1, NULL),
(7, 1, 'Test', NULL, 'null', 'null', 'preksha@gmail.com', '$2y$10$Ir5Te0LV7tHEUsllS3Gv0er/MR8nt/CGCRdMJ6GqQwpiA6VLZWMpm', NULL, 'Customer', 'High', 'null', '20210914092004.png', 'null', 'null', NULL, NULL, NULL, 3, 3, '2021-09-14 09:20:04', '2021-10-25 06:26:52', '2019-20', NULL, 1, '2021-10-25 06:26:52'),
(8, 1, 'jjghjgh', NULL, NULL, NULL, 'preksha.divine@gmail.com', '$2y$10$WaqfeAdLkmly4uZ4ie2Mp.o3.Hq3a95oJKOuYlvv9FwNTW1xSx.Ru', NULL, 'Manufacturer', 'High', NULL, '', NULL, NULL, NULL, NULL, NULL, 3, 3, '2021-09-14 09:50:30', '2021-09-14 09:50:35', '2019-20', NULL, 1, NULL),
(9, 1, 'westlineshipping', '06BZAHM6385P6Z2', 'Ohbubble nz', 'arnav@shah', 'preksha.divine@gmail.com', '$2y$10$7CB6aEqGT.xW5ZtgUrTBhOnIDBtE3tv/J0Liejc9S47bGBNEIKZNS', '2021-09-01', 'Other', 'Medium', 'testing', '20210914100808.png', 'testing', 'previous details testing', '900700000', 'Whole Body Health', '10', 2, 3, '2021-09-14 09:54:53', '2021-09-24 08:59:58', '2019-20', NULL, 1, NULL),
(10, 1, 'Divine Info sys', '06BZAHM6385P6Z3', 'Sanjay Patel', 'Sanjay Patel', 'sanjayp.divine@gmail.com', '$2y$10$uFTl.J80cIJEq.lllDX3..RuFW/McITL4LFo2wyLQHP9TMOPrGhde', '2010-02-03', 'Service Provider', 'Medium', 'This is note', '20210914112951.jpg', 'Education Detqails', 'Prev Details', '900700000', 'test', 'test', 2, 3, '2021-09-14 11:29:51', '2021-10-01 12:47:22', '2019-20', NULL, 1, NULL),
(11, 1, 'Business services', '06AABCU9603R1ZR', 'Jane Doe', 'SUryam', 'preksha.divine@gmail.com', '$2y$10$61HNSuEz.J34lLEuJIilouJBtXoaTKYh6os9a44Y7dhUT3L0w2fXS', '2021-09-03', 'Manufacturer', 'Medium', NULL, '20210924093849.jpg', NULL, NULL, NULL, NULL, NULL, 3, 3, '2021-09-24 09:38:49', '2021-10-01 12:24:41', '2019-20', NULL, 1, NULL),
(12, 1, 'Divine infosys', '06AABCU9603R1ZR', 'vishal kotak', 'SUryam', 'preksha.divine@gmail.com', '$2y$10$aOGZgEsH9xj.2zgdmbtYXesyoFgJZGh2K14PgaBJtUNaWiyRMovka', '2021-10-07', 'Customer', 'High', NULL, '', NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-10-07 09:32:59', NULL, '2019-20', NULL, 1, NULL),
(13, 1, 'Business services', NULL, 'Jane Doe', NULL, 'preksha.divine@gmail.com', '$2y$10$UW7BSaKr30GmknNhGPejH.KRReAkgajlJpLn4LycQaEeLO9Tm93Li', '2021-10-07', 'Customer', 'High', NULL, '', NULL, NULL, NULL, NULL, NULL, 3, NULL, '2021-10-07 09:34:12', NULL, '2019-20', NULL, 1, NULL),
(14, 1, 'Divine infosys', '06AABCU9603R1ZR', 'vishal kotak', 'SUryam', 'preksha.divine@gmail.com', '$2y$10$nydoKr2xJutVPVnVTmQ6.eAEigK2HHh0YWsAMqPA5fld3J0Yu84ua', '2021-10-22', 'Manufacturer', 'High', 'Notes', '20211014112803.jpg', 'Education Details', 'Education Details\nPrev. Details', '900-70-0000', '89563235683', '50', 3, 3, '2021-10-14 11:28:03', '2021-10-14 11:28:27', '2019-20', NULL, 1, NULL);

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
(1, 1, 'CG Road Ahmedabad', 'CG Road Ahmedabad', 'Motera', '380015', 'Ahmedabad', 13, 102, '079-27507178', NULL, NULL, 'ABCTY1234D', NULL, 1, '9408072555', '9408072555', 'info@divineinfosys.com', 3, 3, '2021-09-13 07:10:43', '2021-09-13 07:31:48', '2021-09-13 07:31:48'),
(2, 1, 'White Oak Ave', 'White Oak Ave', 'Motera', '91730', 'Los Angles', 13, 102, NULL, 'https://www.matthewrufh.com/', 'jane@doe.com', NULL, NULL, 2, '9408072555', NULL, 'jane@doe.com', 3, 3, '2021-09-13 07:10:43', '2021-09-13 07:31:48', '2021-09-13 07:31:48'),
(3, 2, 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR', '', '', '380051', '', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', 'vishal@divineinfosys.com', 3, 3, '2021-09-13 07:34:50', '2021-09-13 07:35:58', '2021-09-13 07:35:58'),
(4, 2, '', 'CG Road Ahmedabad', '', '', 'Ahmedabad', 12, 0, NULL, '', 'info@divineinfosys.com', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-09-13 07:34:50', '2021-09-13 07:35:58', '2021-09-13 07:35:58'),
(5, 3, '509, 5th Floor, Signature-1, Above Parsoli Motors, Prahladnagar, S G Highway', 'Ground Floor, 80 kent terrace Mt Victoria,', 'Langley', '380051', 'Wellington', 12, 102, '079-12345678', NULL, NULL, 'ABCDE1234A', NULL, 1, '9876543210', '9408072555', 'ashit@gmail.com', 3, 3, '2021-09-14 07:19:28', '2021-10-01 12:56:15', NULL),
(6, 3, 'Paldi', '507 Indraprasth Corporate opp venus antlantis', 'Langley', '380012', 'Ahmedabad', 12, 102, NULL, 'divineinfosys.com', 'divsystemsllp@gmail.com', NULL, '20210914100428.pdf', 2, '7778882255', NULL, 'test1234@gmail.com', 3, 3, '2021-09-14 07:19:28', '2021-10-01 12:56:15', NULL),
(7, 4, 'White Oak Ave', '', '', '91730', '', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', 'jane@doe.com', 3, 3, '2021-09-14 07:30:13', '2021-09-14 07:30:13', NULL),
(8, 4, '', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-09-14 07:30:13', '2021-09-14 07:30:13', NULL),
(9, 5, 'White Oak Ave', '', '', '91730', '', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', 'jane@doe.com', 3, 3, '2021-09-14 08:52:46', '2021-09-14 08:52:46', NULL),
(10, 5, '', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-09-14 08:52:46', '2021-09-14 08:52:46', NULL),
(11, 6, 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR', '', '', '380051', '', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', 'darshan@divineinfosys.com', 3, 3, '2021-09-14 08:54:16', '2021-09-21 12:22:12', NULL),
(12, 6, '', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-09-14 08:54:16', '2021-09-21 12:22:12', NULL),
(13, 7, 'Paldi', '', '', '380012', '', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', 'testing@gmail.com', 3, 3, '2021-09-14 09:20:04', '2021-10-25 06:26:52', '2021-10-25 06:26:52'),
(14, 7, '', '', '', '', '', 0, 0, NULL, '', 'shippingwestline@gmail.com', NULL, '20210914100119.png', 2, '', NULL, '', 3, 3, '2021-09-14 09:20:04', '2021-10-25 06:26:52', '2021-10-25 06:26:52'),
(15, 8, '', '', '', '', '', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', '', 3, 3, '2021-09-14 09:50:30', '2021-09-14 09:50:35', '2021-09-14 09:50:35'),
(16, 8, '', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-09-14 09:50:30', '2021-09-14 09:50:35', '2021-09-14 09:50:35'),
(17, 9, 'Ground Floor, 80 kent terrace Mt Victoria,', '509, 5th Floor, Signature-1, Above Parsoli Motors, Prahladnagar, S G Highway', 'Motera', '6011', 'Ahmedabad', 18, 102, '079-27507178', NULL, NULL, 'ABCDE1234A', NULL, 1, '9408072555', '1234567890', 'shippingwestline@gmail.com', 3, 3, '2021-09-14 09:54:53', '2021-10-01 12:51:07', NULL),
(18, 9, '1009, Parshwanath Business Park, Nr. Auda Gardan, Prahaladnagar, Ahmedabad – 380015', '4483 Weymouth Rd.', 'Motera', '380015', 'Medina', 12, 102, NULL, 'divineinfosys.com', 'ashit@gmail.com', NULL, '20210914101015.png', 2, '7777888882', NULL, 'cafeuppercrust01@gmail.com', 3, 3, '2021-09-14 09:54:53', '2021-10-01 12:51:07', NULL),
(19, 10, '1711  Centennial Farm Road', '', 'Prahalad Nagar', '07036', 'ahmedabad', 12, 102, '', NULL, NULL, '', NULL, 1, '', '', 'sanjayp@net4nuts.com', 3, 3, '2021-09-14 11:29:51', '2021-10-01 12:51:49', NULL),
(20, 10, '1711  Centennial Farm Road', 'Paldi', 'Prahalad Nagar', '07036', 'Ahmedabad', 12, 102, NULL, '', 'mayank@gmail.com', NULL, '20210914112951.png', 2, '', NULL, '', 3, 3, '2021-09-14 11:29:51', '2021-10-01 12:51:49', NULL),
(21, 11, 'White Oak Ave', 'White Oak Ave', 'Motera', '91730', 'Los Angles', 2, 102, '079-27507178', NULL, NULL, '', NULL, 1, '9408072555', '', 'jane@doe.com', 3, 3, '2021-09-24 09:38:49', '2021-10-01 12:24:41', NULL),
(22, 11, 'White Oak Ave', 'White Oak Ave', 'Motera', '91730', 'Los Angles', 2, 102, NULL, '', '', NULL, '20210924093849.jpg', 2, '', NULL, '', 3, 3, '2021-09-24 09:38:49', '2021-10-01 12:24:41', NULL),
(23, 12, 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR, c 201', 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR', '', '380051', 'Ahmedabad', 0, NULL, '', NULL, NULL, '', NULL, 1, '', '', 'vishal@divineinfosys.com', 3, 3, '2021-10-07 09:32:59', '2021-10-07 09:32:59', NULL),
(24, 12, '', '', '', '', '', 0, 0, NULL, '', '', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-10-07 09:32:59', '2021-10-07 09:32:59', NULL),
(25, 13, 'White Oak Ave', 'White Oak Ave', '', '91730', 'Los Angles', 0, 0, '', NULL, NULL, '', NULL, 1, '', '', 'jane@doe.com', 3, 3, '2021-10-07 09:34:12', '2021-10-07 09:34:12', NULL),
(26, 13, '', '509 signature 1 above parsoli motors, PRAHLADNAGAR', '', '', 'Ahmedabad', 12, 0, NULL, '', 'vishalkotak200@gmail.com', NULL, NULL, 2, '', NULL, '', 3, 3, '2021-10-07 09:34:12', '2021-10-07 09:34:12', NULL),
(27, 14, 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR, c 201', 'C/201, SWATI GARDENIA,NEAR TORRENT POWER SUBSTATION,MAKARBA ROAD, VEJALPUR', 'Motera', '380051', 'Ahmedabad', 3, 102, '079-27507178', NULL, NULL, 'ABCTY1234D', NULL, 1, '9408072555', '9408072555', 'vishal@divineinfosys.com', 3, 3, '2021-10-14 11:28:03', '2021-10-14 11:28:27', NULL),
(28, 14, 'CG Road Ahmedabad', 'White Oak Ave', 'Motera', '380015', 'Los Angles', 3, 102, NULL, '', 'jane@doe.com', NULL, '20211014112803.jpg', 2, '9408072555', NULL, 'info@divineinfosys.com', 3, 3, '2021-10-14 11:28:03', '2021-10-14 11:28:27', NULL);

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
(85, 2, 'Vishal kotakk', '0953767131', 'darshan@divineinfosys.com', 6, 6, 3, 3, '2021-09-13 07:35:41', '2021-09-13 07:35:58', '2021-09-13 07:35:58'),
(86, 2, 'D Vv', '0953767131', 'divsystemsllp@gmail.com', 5, 2, 3, 3, '2021-09-13 07:35:41', '2021-09-13 07:35:58', '2021-09-13 07:35:58'),
(125, 7, 'Westline Shipping', '', 'ashit@gmail.com', 6, 8, 3, 3, '2021-09-14 10:01:19', '2021-10-25 06:26:52', '2021-10-25 06:26:52'),
(126, 7, 'Ashit Pancholee', '9988776655', 'shippingwestline@gmail.com', 5, 6, 3, 3, '2021-09-14 10:01:19', '2021-10-25 06:26:52', '2021-10-25 06:26:52'),
(164, 9, 'Pragnesh', '', 'p123@gmail.com', 0, 0, 3, 3, '2021-10-01 12:51:07', '2021-10-01 12:51:07', NULL),
(165, 9, 'sgd', '', '', 0, 0, 3, 3, '2021-10-01 12:51:07', '2021-10-01 12:51:07', NULL),
(166, 9, 'Ashit Pancholee', '9988776655', 'arnav@gmail.com', 6, 0, 3, 3, '2021-10-01 12:51:07', '2021-10-01 12:51:07', NULL),
(167, 9, 'Arnav Shah', '6549872315', 'test@gmail.com', 0, 5, 3, 3, '2021-10-01 12:51:07', '2021-10-01 12:51:07', NULL),
(170, 3, 'vishal kotak', '9537671314', 'pancholee256@gmail.com', 6, 7, 3, 3, '2021-10-01 12:56:15', '2021-10-01 12:56:15', NULL),
(171, 13, 'Ashutosh Mehta', '9876543210', 'divsystemsllp@gmail.com', 6, 0, 3, 3, '2021-10-07 09:34:12', '2021-10-07 09:34:12', NULL),
(174, 14, 'Jane Doe', '1555555555', 'vishalkotak200@gmail.com', 6, 7, 3, 3, '2021-10-14 11:28:27', '2021-10-14 11:28:27', NULL),
(175, 14, 'Ashutosh Mehta', '9824934567', 'jane@doe.com', 6, 6, 3, 3, '2021-10-14 11:28:27', '2021-10-14 11:28:27', NULL);

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
(14, 1, 'test test', 'test', 2, 3, 3, '2019-20', NULL, 1, '2021-06-10 09:58:11', '2021-06-10 09:57:45', '2021-06-10 08:58:11'),
(15, 4, 'Group', '12OI', 2, 2, 2, '2019-20', NULL, 1, NULL, '2021-10-28 11:49:52', '2021-10-28 10:50:04');

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_instruments`
--

INSERT INTO `mst_instruments` (`id`, `mst_companies_id`, `make`, `instrument_name`, `instrument_code`, `model`, `last_service_date`, `service_due_date`, `last_calibration_date`, `calibration_due_date`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, '1', 'Instrument 1', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-11-08 10:58:25', '2021-11-08 10:58:25', '2019-20', NULL, 1, NULL),
(2, 1, '1', 'Instrument 2', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-11-08 10:58:47', '2021-11-08 10:58:47', '2019-20', NULL, 1, NULL),
(3, 1, '1', 'Instrument 3', 'INS3', '2020', '2021-10-20', '2021-10-22', '2021-10-20', '2021-10-28', 1, NULL, '2021-11-08 11:01:57', '2021-11-08 11:01:57', '2019-20', NULL, 1, NULL),
(4, 1, 'GMP-SC6600L(serial Number 547-10/18)', 'Instrument 66', 'INS66', '2019', '2021-10-02', '2021-10-02', '2021-10-02', '2021-10-08', 1, 1, '2021-11-08 12:09:29', '2021-11-08 12:58:57', '2019-20', NULL, 1, '2021-11-08 12:58:57'),
(5, 1, NULL, 'Instrument 5', 'INS5', '2019', '2021-10-02', '2021-10-02', '2021-10-02', '2021-10-08', 1, NULL, '2021-11-08 12:57:04', '2021-11-08 12:57:04', '2019-20', NULL, 1, NULL),
(6, 1, 'GMP-SC6600L(serial Number 547-10/18)', 'Instrument 66', 'INS66', '2019', '2021-10-02', '2021-10-02', '2021-10-02', '2021-10-08', 1, 1, '2021-11-08 12:57:39', '2021-11-08 12:58:35', '2019-20', NULL, 1, NULL);

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
(8, 1, 3, 'test', '1234', 'Ledger', 'Dr', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-21 09:17:56', '2021-06-21 08:17:56'),
(9, 4, 2, 'Ledger', '1000', 'Customer', 'Cr', 2, 2, '2019-20', NULL, 1, NULL, '2021-10-28 11:54:34', '2021-10-28 10:54:48');

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_locations`
--

INSERT INTO `mst_locations` (`id`, `mst_companies_id`, `location_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'Baroda', 3, NULL, '2021-08-09 12:22:57', '2021-08-09 12:30:25', '2019-20', NULL, 1, '2021-08-09 12:30:25'),
(2, 1, 'Baroda', 3, NULL, '2021-08-09 12:23:21', '2021-08-09 12:30:30', '2019-20', NULL, 1, '2021-08-09 12:30:30'),
(3, 1, 'Compliments', 3, 3, '2021-08-09 12:23:25', '2021-09-14 06:55:39', '2019-20', NULL, 1, '2021-09-14 06:55:39'),
(4, 1, 'Chemical Room', 3, NULL, '2021-08-09 12:36:32', '2021-09-14 06:55:35', '2019-20', NULL, 1, '2021-09-14 06:55:35'),
(5, 1, 'Muzafarabad', 3, 3, '2021-08-09 12:41:05', '2021-09-14 06:55:32', '2019-20', NULL, 1, '2021-09-14 06:55:32'),
(6, 1, 'Satelite12', 2, 3, '2021-09-14 12:05:22', '2021-09-27 07:23:08', '2019-20', NULL, 1, NULL),
(7, 4, 'Ahmedabad', 2, NULL, '2021-10-29 06:33:36', '2021-10-29 06:33:36', '2019-20', NULL, 1, NULL);

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_materials`
--

INSERT INTO `mst_materials` (`id`, `mst_companies_id`, `material_type`, `material_name`, `material_purchase_rate`, `material_code`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `material_rate`, `material_amount`, `material_qty`, `mst_units_id`, `material_use_before_date`, `material_case_number`, `created_by`, `updated_by`, `created_at`, `updated_at`, `selected_year`, `copied_from_year`, `is_active`, `deleted_at`) VALUES
(1, 1, 'asfdf', 'sodium sulphur potassium', 1000.000, '1212', 2, 3, 4, 10.000, 10000.000, 1000, 123, '2019-06-01', 321654, 1, NULL, '2021-08-05 07:55:33', '2021-10-29 06:33:06', '2019-20', NULL, 1, '2021-10-29 06:33:06'),
(2, 1, 'Liquid', 'test material', 100.000, '2500AB', 1, 2, 3, 2500.000, 85235.000, 100, 1, '2021-08-19', 5555555, 3, NULL, '2021-08-06 09:16:41', '2021-09-03 09:52:54', '2019-20', NULL, 1, '2021-09-03 09:52:54'),
(3, 1, 'Liquid', 'Sodium Cloride Fosfet1', 300523.000, '582020er', 12, 13, 3, 855545.000, 25689000.000, 100, 1, '2021-08-03', 89952500, 3, 3, '2021-08-06 09:21:28', '2021-08-09 09:36:58', '2019-20', NULL, 1, NULL),
(4, 1, 'Other', 'test material Check', 300.000, '2500AB', 1, 2, 3, 8555.000, 25689000.000, 10, 2, '2021-09-01', 899525, 3, 3, '2021-08-19 10:58:37', '2021-08-19 13:21:28', '2019-20', NULL, 1, '2021-08-19 13:21:28'),
(5, 1, 'Liquid', 'test material123', 100000.000, '582028', 12, 13, NULL, 25000.000, 85235584.000, 101, 1, '2021-08-29', 89952555, 3, 3, '2021-08-19 10:59:19', '2021-10-23 05:14:58', '2019-20', NULL, 1, NULL);

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
(10, 1, 'EP', 21, 2021, '1', '2019-20', NULL, 1, 2, 2, NULL, '2021-06-18 10:05:17', '2021-09-14 11:53:50'),
(11, 1, 'IHS', 1, 2021, '1', '2019-20', NULL, 1, 2, NULL, NULL, '2021-06-18 10:06:44', '2021-06-18 10:06:44'),
(12, 4, 'Ip', 1, 2014, 'First', '2019-20', NULL, 1, 2, NULL, NULL, '2021-10-29 06:43:41', '2021-10-29 06:43:41');

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
(6, 5, 1, 'test position', 3, 2, '2019-20', NULL, 1, NULL, '2021-06-08 11:12:39', '2021-10-29 05:24:31'),
(7, 5, 1, 'QA', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-08 13:22:23', '2021-06-08 12:22:23'),
(8, 5, 1, 'Chemist', 3, NULL, '2019-20', NULL, 1, NULL, '2021-06-11 05:55:58', '2021-10-19 12:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `mst_products`
--

CREATE TABLE `mst_products` (
  `id` int(23) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_generic` varchar(55) NOT NULL,
  `marker_specification` varchar(255) NOT NULL,
  `pharmacopeia_id` int(5) NOT NULL,
  `generic_product_id` int(23) DEFAULT NULL,
  `packing_detail` varchar(255) NOT NULL,
  `sample_description` text NOT NULL,
  `hsn_Code` varchar(55) NOT NULL,
  `is_generic` tinyint(1) NOT NULL COMMENT 'Default 0',
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT 'Default 1',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_products`
--

INSERT INTO `mst_products` (`id`, `mst_companies_id`, `product_name`, `product_generic`, `marker_specification`, `pharmacopeia_id`, `generic_product_id`, `packing_detail`, `sample_description`, `hsn_Code`, `is_generic`, `selected_year`, `copied_from_year`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Dolo', 'Raw Material', 'for cold', 10, 0, 'Don\'t put in sunlight', 'Dolo', '', 1, '2019-20', NULL, 1, 3, 3, '2021-09-28 07:18:44', '2021-10-01 12:58:36', NULL),
(2, 1, 'AJINO MOTTO1', 'Raw Material', 'for fever1', 10, 1, '', '', '', 1, '2020-20', NULL, 1, 3, 3, '2021-09-28 07:26:10', '2021-10-01 10:49:42', NULL),
(3, 1, 'test product3', 'Finished Product', 'test', 10, 0, '', '', '', 0, '2019-20', NULL, 1, 3, 3, '2021-09-28 08:46:54', '2021-10-05 06:39:45', NULL),
(4, 1, 'peracitamol', 'Other', '', 4, 0, '', '', '', 0, '2019-20', NULL, 1, 3, 3, '2021-10-01 11:22:38', '2021-10-01 12:17:10', NULL),
(5, 1, 'test', 'Other', 'For Fever123', 4, 0, '', '', '', 0, '2019-20', NULL, 1, 3, 3, '2021-10-06 08:03:02', '2021-10-22 10:33:46', NULL),
(6, 1, 'Viksss', 'Raw Metriall', 'motion sicknesss', 3, 2, 'Shipped', 'motion sickness', '', 1, '2019-20', NULL, 1, 3, 3, '2021-10-14 11:17:48', '2021-10-23 06:17:42', '2021-10-23 06:17:42'),
(7, 4, 'Kitcat Tablets', 'Finished Product', 'NA', 12, 0, 'NA', 'White to off white colored round shape tablet with one side break line and other side plain.', '998346', 1, '2019-20', NULL, 1, 2, NULL, '2021-10-29 06:53:49', NULL, NULL),
(8, 4, 'Health life Black Seed Oil Capsules', 'Finished Product', '', 11, 0, '', 'Black coloured soft gelatin capsules.', '998346', 1, '2019-20', NULL, 1, 2, NULL, '2021-10-29 06:57:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_product_parents`
--

CREATE TABLE `mst_product_parents` (
  `id` int(11) NOT NULL,
  `parent_name` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_product_parents`
--

INSERT INTO `mst_product_parents` (`id`, `parent_name`) VALUES
(2, 'Related'),
(13, 'By KFR'),
(14, 'By IC'),
(15, 'By ELSD DETECTOR'),
(16, 'By FLD DETECTOR'),
(17, 'By GCMS'),
(18, 'By RID DETECTOR'),
(19, 'By ICPMS'),
(20, 'By GC'),
(21, 'By MPAES'),
(22, 'By UV'),
(23, 'By HPLC'),
(24, 'By I.R.'),
(25, 'BY CHEMICAL'),
(26, 'By Microbiological Assay'),
(27, 'By Potentiometric Titration'),
(28, 'By RT'),
(29, 'BY TLC'),
(30, 'By Titration'),
(31, 'By microbiology'),
(32, 'By AES');

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
(11, 2, 1, 20, 3, '202', '33', '101', '1111.00', '', 'testing here', '', '', '', 3, 3, '2021-10-01 10:49:42', '2021-10-01 10:49:42', NULL),
(23, 3, 2, 15, 6, '1000', '7852', '', '0.00', '', '', '', '', '', 3, 3, '2021-10-05 06:39:45', '2021-10-05 06:39:45', NULL),
(24, 3, 2, 0, 7, '', '', '', '5000.00', '', '', '', '', '', 3, 3, '2021-10-05 06:39:45', '2021-10-05 06:39:45', NULL),
(27, 23, 1, 22, 4, 'label claim', '10', '100', '500.00', 'method', 'description', 'A', 'nabl', 'formula', 3, 3, '2021-10-14 11:18:37', '2021-10-14 11:18:37', NULL),
(28, 23, 1, 13, 8, 'label claim1', '20', '200', '700.00', 'method1', 'description1', 'A1', 'nabl1', 'formula1', 3, 3, '2021-10-14 11:18:37', '2021-10-14 11:18:37', NULL),
(39, 6, 1, 24, 4, 'label claim', '10', '100', '500.00', 'method', 'description', 'A', 'nabl', 'formula', 3, 3, '2021-10-23 06:17:42', '2021-10-23 06:17:42', NULL),
(40, 6, 1, 13, 8, 'label claim1', '20', '200', '700.00', 'method1', 'description1', 'A1', 'nabl1', 'formula1', 3, 3, '2021-10-23 06:17:42', '2021-10-23 06:17:42', NULL),
(41, 7, 2, 0, 9, '', '', '', '0.00', '', 'White to off white colored round shape tablet with one side break line and other side plain.', '', '', '', 2, 2, '2021-10-29 06:53:49', '2021-10-29 06:53:49', NULL),
(42, 7, 2, 32, 9, '', '', '', '0.00', '', '', '', '', '', 2, 2, '2021-10-29 06:53:49', '2021-10-29 06:53:49', NULL),
(43, 7, 2, 0, 10, '', '', 'The principal spot in the chromatogram obtained with the test solution corresponds to that obtained with reference solution.', '200.00', '', '', '', '', '', 2, 2, '2021-10-29 06:53:49', '2021-10-29 06:53:49', NULL),
(44, 8, 2, 0, 11, '', '', '', '0.00', '', 'Black coloured soft gelatin capsules.', '', '', '', 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL),
(45, 8, 2, 0, 12, '', '', 'NMT 10 ppm', '0.00', '', '', '', '', '', 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL),
(46, 8, 2, 0, 13, '', '', 'NMT 0.30 ppm', '0.00', '', '', '', '', '', 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL),
(47, 8, 2, 0, 14, '', '', 'NMT 3.0 ppm', '0.00', '', '', '', '', '', 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_sample_parameters`
--

CREATE TABLE `mst_sample_parameters` (
  `id` int(11) NOT NULL,
  `parameter_name` varchar(255) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `selected_year` varchar(25) NOT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_sample_parameters`
--

INSERT INTO `mst_sample_parameters` (`id`, `parameter_name`, `mst_companies_id`, `is_active`, `selected_year`, `copied_from_year`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MyParam', 1, 1, '2019-20', NULL, 3, 3, '2021-09-28 07:18:44', '2021-09-28 07:18:44', NULL),
(2, 'My Para1m', 1, 1, '2019-20', NULL, 3, 3, '2021-10-01 10:48:39', '2021-10-01 10:48:39', NULL),
(3, 'dgfdg', 1, 1, '2019-20', NULL, 3, 3, '2021-10-01 10:49:42', '2021-10-01 10:49:42', NULL),
(4, 'newparams022', 1, 1, '2019-20', NULL, 3, 3, '2021-10-01 11:08:11', '2021-10-01 11:08:11', NULL),
(5, 'Assay', 1, 1, '2019-20', NULL, 3, 3, '2021-10-01 11:10:35', '2021-10-01 11:10:35', NULL),
(6, 'Assay123', 1, 1, '2019-20', NULL, 3, 3, '2021-10-05 06:39:45', '2021-10-05 06:39:45', NULL),
(7, 'test parameter', 1, 1, '2019-20', NULL, 3, 3, '2021-10-05 06:39:45', '2021-10-05 06:39:45', NULL),
(8, 'newparams122', 1, 1, '2019-20', NULL, 3, 3, '2021-10-14 11:17:48', '2021-10-14 11:17:48', NULL),
(9, 'Average weight', 4, 1, '2019-20', NULL, 2, 2, '2021-10-29 06:53:49', '2021-10-29 06:53:49', NULL),
(10, 'Identification', 4, 1, '2019-20', NULL, 2, 2, '2021-10-29 06:53:49', '2021-10-29 06:53:49', NULL),
(11, 'Description', 4, 1, '2019-20', NULL, 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL),
(12, 'Lead', 4, 1, '2019-20', NULL, 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL),
(13, 'Cadmium', 4, 1, '2019-20', NULL, 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL),
(14, 'Arsenic', 4, 1, '2019-20', NULL, 2, 2, '2021-10-29 06:57:07', '2021-10-29 06:57:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mst_states`
--

CREATE TABLE `mst_states` (
  `id` int(11) UNSIGNED NOT NULL,
  `mst_countries_id` int(11) DEFAULT '1',
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
-- Table structure for table `mst_tests`
--

CREATE TABLE `mst_tests` (
  `id` int(11) NOT NULL,
  `mst_companies_id` int(11) NOT NULL,
  `procedure_name` varchar(255) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `test_code` varchar(50) DEFAULT NULL,
  `test_category` varchar(255) DEFAULT NULL,
  `test_procedure` text,
  `parent_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected_year` varchar(25) DEFAULT NULL,
  `copied_from_year` int(4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
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
  `notes` text,
  `attendance` tinyint(1) DEFAULT '0',
  `signature` varchar(255) DEFAULT NULL,
  `booking_action` tinyint(1) DEFAULT '0',
  `booking_sms` tinyint(1) DEFAULT '0',
  `booking_email` tinyint(1) DEFAULT '0',
  `is_resigned` tinyint(1) NOT NULL DEFAULT '0',
  `booking_copy` tinyint(1) DEFAULT '0',
  `nationality` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `caste` varchar(155) DEFAULT NULL,
  `is_reporting_authority` tinyint(1) NOT NULL DEFAULT '0',
  `deposit` tinyint(1) DEFAULT '0',
  `booking_rate` tinyint(4) DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `selected_year` varchar(50) DEFAULT NULL,
  `copied_from_year` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this table use to store users information with login data';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `mst_companies_id`, `title`, `first_name`, `middle_name`, `last_name`, `email`, `email_verified_at`, `username`, `password`, `remember_token`, `blood_group`, `gender`, `birth_date`, `marital_status`, `photo`, `machine_code`, `phone`, `mobile`, `notes`, `attendance`, `signature`, `booking_action`, `booking_sms`, `booking_email`, `is_resigned`, `booking_copy`, `nationality`, `religion`, `caste`, `is_reporting_authority`, `deposit`, `booking_rate`, `created_by`, `updated_by`, `selected_year`, `copied_from_year`, `is_active`, `is_admin`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Manoj', 'Kumar', 'Patel', 'manojp.divine@gmail.com', NULL, 'manojp.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, '2021-05-07 14:40:35', '2021-10-11 08:24:55'),
(2, 1, NULL, 'Sanjay', 'Kumar', 'Patel', 'sanjayp.divine@gmail.com', NULL, 'sanjayp.divine@gmail.com', '$2y$10$4PhhTLKUvtTNSeYODq1w6e/jbFPErnGKXXLtLngZKnQUnPGBn1TCu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, '2021-05-07 14:40:35', '2021-10-11 08:25:10'),
(3, 1, 'Ms.', 'Prexa', 'S', 'Shah', 'preksha.divine@gmail.com', NULL, 'preksha.divine@gmail.com', '$2y$10$C.DBkJxKGx9d3gd8MG6CNOyHwqQ6siFRJLN4Rad.B/YKor5t5gKgC', NULL, 'B+', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 1, '2019-20', NULL, 1, 0, NULL, '2021-05-07 14:40:35', '2021-07-20 12:29:45'),
(4, 1, NULL, 'Manoj', 'D', 'Patel', 'manojp.divine@gmail.com', NULL, 'manojp.divine@gmail.com', '$2y$10$e6tbMQLOpGtM2pG4fdKAge6GMFCXpCugsNeUq9C8n.5W9h7fyN60W', NULL, 'B+ve', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur1111', 1, 'MSP', 1, 1, 1, 0, 1, 'Indian', 'Hindu', NULL, 1, 100, 0, NULL, 1, '2019-20', NULL, 1, 0, '2021-05-20 10:45:29', '2021-05-20 10:44:45', '2021-05-20 10:45:29'),
(5, 1, 'Mr.', 'Manoj', 'S', 'Patel', 'manojp.divine@yopmail.com', NULL, 'manojp.divine@yopmail.com', '$2y$10$kwX1OommbpMTePmSbCobSurGal2Lhn4z9I5zVQ/jm5QxRa6K7ElPq', NULL, 'B+ve', 'M', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 0, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-06-16 10:45:46', '2021-06-18 06:39:30'),
(74, 1, 'Mr.', 'Darshan', 'Pareshbhai', 'Vachhani', NULL, NULL, NULL, '', NULL, 'B+', 'M', '1994-07-01', 'Married', NULL, 'M03505', '1234567890', '7895642315', 'Testing', 1, NULL, 0, 0, 0, 1, 0, 'Indian', 'Hindu', 'Hindu', 1, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-05 11:32:15', '2021-07-05 11:32:15'),
(80, 1, 'Er.', 'Jiten', 'Mahendra', 'Shah', NULL, NULL, NULL, '', NULL, 'O-', 'M', '1990-07-02', 'Single', NULL, 'M05000', '01234567890', '09904545279', 'Testing', 1, NULL, 0, 0, 0, 0, 0, 'Indian', 'Hindu', 'Jain', 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-06 12:56:37', '2021-07-06 12:56:37'),
(81, 1, 'Dr.', 'Shridhar', 'Mohan', 'Acharya', NULL, NULL, NULL, '', NULL, 'B+', 'M', '1990-07-01', 'Married', NULL, 'M012RT5', '09904545000', '1333567890', 'Testing Of Form', 0, NULL, 1, 1, 1, 1, 0, 'Indiana', 'Hindu', 'Brahmin', 0, 0, 1, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(82, 1, 'Mr.', 'Mayank', 'Ajit', 'Shah', 'mayank@gmail.com', NULL, 'mayank@gmail.com', '$2y$10$Yh1QDK2eGMmxR8jkeKDfY.S1VjKhZCpwQthJBQMrA9AXz88KoNMdS', NULL, 'None', 'M', NULL, 'Single', NULL, NULL, '1234567890', '6549872315', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 11:07:39', '2021-07-19 11:07:39'),
(84, 1, 'Miss', 'Roohi', 'Raj', 'Sachdeva', 'roohi@gmail.com', NULL, 'roohi@gmail.com', '$2y$10$yhCJ2dYPrZQXcMnwVIN8/Oap941BOymYIvpU3LtskA/1SA2sliAze', NULL, 'O+', 'F', '1990-07-02', 'Single', NULL, NULL, '7895642315', '7895640000', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 11:15:56', '2021-07-19 11:15:56'),
(85, 1, 'Mr.', 'Arnav', 'Mahendra', 'Shah', 'arnav@gmail.com', NULL, 'arnav@gmail.com', '$2y$10$NV46ASPh0Znt0yChq9fqu.v5JTsciVzziLLR4BzroFgwGLUuw4R1m', NULL, 'None', 'M', '1993-07-08', 'Single', NULL, 'M035', '6549872315', '7895642315', 'Test.....', 1, NULL, 0, 0, 0, 0, 0, 'Indian', 'Hindu', 'Hindu', 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-07-19 11:19:29', '2021-07-19 11:19:29'),
(86, 1, 'Mr.', 'Siay', 'S', 'Shah', 'manojp123@yopmail.com', NULL, 'manojp123@yopmail.com', '$2y$10$dTZmNtx2Xk3IIRmGXtjAPuYr1eYQ5r3EhPAb3dz1GxQ5TZfKekIxG', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 1, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, NULL, 1, '2019-20', NULL, 1, 0, NULL, '2021-07-20 12:28:54', '2021-07-20 12:28:54'),
(87, 4, 'Mr.', 'Ohbubble', 'Ajit', 'nz', 'test@gmail.com', NULL, 'test@gmail.com', '$2y$10$tTbmCAOTTyHM6827H.FzO.Z4zoPYhSd16himHwjgQKSjUAUb.1Y9m', NULL, 'B+', 'M', '2021-09-03', 'Single', NULL, NULL, '1234567890', '1234567890', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2019-20', NULL, 1, 0, NULL, '2021-09-01 06:56:13', '2021-10-18 12:58:19'),
(88, 1, 'Mr.', 'dfhfghfghfgf', 'hfghfgh', 'hgfhfghf', 'preksha111.divine@gmail.com', NULL, 'preksha111.divine@gmail.com', '$2y$10$JXU/CCNuAyGpIx/evC1xjO2Pdm1GcdKG059NkDhhedaHMKFekHyPe', NULL, 'None', 'M', '2021-09-02', 'Single', NULL, NULL, '11122333', '55555533556', NULL, 1, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 3, '2020-20', NULL, 1, 0, NULL, '2021-09-01 06:58:58', '2021-10-18 12:58:03'),
(89, 4, 'Mr.', 'Sanjay', 'c', 'Patel', 'sanjayp.d@gmail.com', NULL, 'sanjayp.d@gmail.com', '$2y$10$uG9Y5GydiHpAtuQV7Q7buOFK8C/Skzzb.Ol2Cy/CAsdS4PvC7aqT.', NULL, 'A+', 'M', '1991-02-01', 'Married', NULL, '1222', '9377876363', '9377876363', 'notes', 1, 'C:\\fakepath\\16339507951195078173531-1.pdf', 1, 1, 1, 1, 0, NULL, NULL, NULL, 1, 1, 1, 2, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-28 09:21:31', NULL),
(90, 4, 'Mr.', 'Sanjay', 'c', 'Patel', 'sanjayp.d@gmail.com', NULL, 'sanjayp.d@gmail.com', '$2y$10$aOSEvfve.3.qh.eNGwATvOkkrwfaZV1DZMHGWc/uD2it6Ns56r5o6', NULL, 'A+', 'M', '1991-02-01', 'Married', NULL, '1222', '9377876363', '9377876363', 'notes', 1, 'C:\\fakepath\\16339507951195078173531-1.pdf', 1, 1, 1, 1, 0, NULL, NULL, NULL, 1, 1, 1, 2, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-28 09:23:46', NULL),
(91, 1, 'Mr.', 'Siay', 'S', 'Shah', 'manojp13@yopmail.com', NULL, 'manojp13@yopmail.com', '$2y$10$iqmZ3rQRdQYCegvLZtzK7uZBD6Ekyk7wcmFcHnoewEMUd52itBH.W', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 10:22:27', NULL),
(92, 1, 'Mr.', 'Siay', 'S', 'Shah', 'manojp13@yopmail.com', NULL, 'manojp13@yopmail.com', '$2y$10$5NFchUPQpKnXyUh5EQjR4OI8RzZd6izWHIGBvyCdz3r8wk.39aGae', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 10:23:20', NULL),
(93, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_11@yopmail.com', NULL, 'mp.inviable_11@yopmail.com', '$2y$10$147pEQNdf/ll9TEygvO.y.e1RF/68ukYI8p1J.4MKMoL12sNi/YU.', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 10:24:04', NULL),
(94, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_11@yopmail.com', NULL, 'mp.inviable_11@yopmail.com', '$2y$10$4WXIg4qHCWG7uyyXLi3EnuywbatJmcKPcKlq195fI0Lee1vy.zl7m', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 11:22:26', NULL),
(95, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_11@yopmail.com', NULL, 'mp.inviable_11@yopmail.com', '$2y$10$959RU9lbErkv3PwiDpen2uYR2x.wOxCsf.pQ6fGhL5n.n5Vx9yh0C', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 11:23:16', NULL),
(96, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_11@yopmail.com', NULL, 'mp.inviable_11@yopmail.com', '$2y$10$zXb1hEqfXroF1Y6UkvpqouPeSoHQSS5kI6QpjRK9bx7rQPsE6STwO', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 11:23:58', NULL),
(97, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_11@yopmail.com', NULL, 'mp.inviable_11@yopmail.com', '$2y$10$ioAti4MSS6kGQjnsdz6ZuOj2rgprmf30HR0snHiplSiyarvMBjFxW', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 11:24:16', NULL),
(98, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_11@yopmail.com', NULL, 'mp.inviable_11@yopmail.com', '$2y$10$WuQZ5S7MJ.hL1Fdzn7w9QennEcP9RrZcpyAcUCYeRQG4rT5wh4yz6', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 12:18:29', NULL),
(99, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_11@yopmail.com', NULL, 'mp.inviable_11@yopmail.com', '$2y$10$6KM/0nr53y6.OGkVsh1nfeNTGZSI4diGwaTqHcFwGwCmn9IFuvmWa', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 12:34:53', NULL),
(100, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_111@yopmail.com', NULL, 'mp.inviable_111@yopmail.com', '$2y$10$HWAfi.9sLVjK.85sFh/icu76RINoRqmqPP1Equ9pxdfRaEycFumUO', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 12:35:23', NULL),
(101, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_111@yopmail.com', NULL, 'mp.inviable_111@yopmail.com', '$2y$10$Lf08uPIj3a0BjKWhRvOf3.VHkmeZnnwjkNQGS6Z7obOT6Fcd52xw2', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 12:39:00', NULL),
(102, 1, 'Mr.', 'Siay', 'S', 'Shah', 'mp.inviable_1111@yopmail.com', NULL, 'mp.inviable_1111@yopmail.com', '$2y$10$j.DTrUbHC2OolPjlbW2rO.vZX4rtZiJ4rFnyJiXlOf0IKNUZtn/CK', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '4545454545554', '4545454545554', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-10-29 12:39:29', NULL),
(103, 1, 'Mr.', 'Siya', 'S', 'Shah', 'mp.inviable_1111@yopmail.com', NULL, 'mp.inviable_1111@yopmail.com', '$2y$10$xyK5jM4aWQKkEsWW5/tXsedz8NGXwcWcLKGYJtB7yxGRh3w2Yltia', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '2582582588', '2582582588', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-11-01 09:27:30', NULL),
(104, 1, 'Mr.', 'Siya', 'S', 'Shah', 'mp.inviable_11121@yopmail.com', NULL, 'mp.inviable_11121@yopmail.com', '$2y$10$jDEsJRWcYjdprWp4hLQCX.ws5DQiMsSq2JteAu7hjHkF5TGD1nYeu', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '2582582588', '2582582588', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-11-01 10:31:52', NULL),
(105, 1, 'Mr.', 'Siya', 'S', 'Shah', 'mp.inviable_111221@yopmail.com', NULL, 'mp.inviable_111221@yopmail.com', '$2y$10$M1TV4SMemCl4M9mHTPts9uOhnvHftDGEL5JkV/wtvfX41uaTMT.Va', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '2582582588', '2582582588', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-11-01 10:32:41', NULL),
(106, 1, 'Mr.', 'Siya', 'S', 'Shah', 'mp.123@yopmail.com', NULL, 'mp.123@yopmail.com', '$2y$10$nPwxcabBh6t4624kcbKN2.t0ltRZ/uJL0KhX1lYtbHGmf6UJn9i7C', NULL, 'B+ve', 'F', '1988-07-11', 'Married', NULL, 'M01', '2582582588', '2582582588', 'lorem Ipsum dor simit de nur', 2, 'MSP', 1, 1, 1, 1, 1, 'Indian', 'Hindu', 'Hindu', 1, 100, 1, 1, NULL, '2019-20', NULL, 1, 0, NULL, '2021-11-01 10:34:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_address_details`
--

CREATE TABLE `user_address_details` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `mst_countries_id` int(11) DEFAULT '0' COMMENT 'foreign key of countries table',
  `mst_states_id` int(11) DEFAULT '0' COMMENT 'foreign key of states table',
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(155) DEFAULT NULL,
  `email` text,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_number` varchar(155) DEFAULT NULL,
  `website` text,
  `address_type` int(11) NOT NULL DEFAULT '1' COMMENT '1 : Permanent Address , 2: Correspondence Address',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
(128, 91, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 1, NULL, NULL, '2021-10-29 10:22:27', '2021-10-29 10:22:27'),
(129, 91, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 1, NULL, NULL, '2021-10-29 10:22:27', '2021-10-29 10:22:27'),
(130, 92, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 1, NULL, NULL, '2021-10-29 10:23:20', '2021-10-29 10:23:20'),
(131, 92, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 1, NULL, NULL, '2021-10-29 10:23:20', '2021-10-29 10:23:20'),
(132, 93, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 1, NULL, NULL, '2021-10-29 10:24:04', '2021-10-29 10:24:04'),
(133, 93, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 1, NULL, NULL, '2021-10-29 10:24:04', '2021-10-29 10:24:04'),
(134, 94, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 1, NULL, NULL, '2021-10-29 11:22:26', '2021-10-29 11:22:26'),
(135, 94, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 1, NULL, NULL, '2021-10-29 11:22:26', '2021-10-29 11:22:26'),
(136, 106, 102, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 1, 1, NULL, NULL, '2021-11-01 10:34:11', '2021-11-01 10:34:11'),
(137, 106, 0, 50, 'Sabermati', 'Street 2 Test', 'Sudama Nagar', 'Indore', '452001', '', 'Manish', '1234567890', '', 2, 1, NULL, NULL, '2021-11-01 10:34:11', '2021-11-01 10:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_assign_rights`
--

CREATE TABLE `user_assign_rights` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `software` varchar(55) DEFAULT NULL,
  `modules` varchar(155) DEFAULT NULL,
  `add_module` tinyint(1) NOT NULL DEFAULT '0',
  `edit_module` tinyint(1) NOT NULL DEFAULT '0',
  `delete_module` tinyint(1) NOT NULL DEFAULT '0',
  `view_module` tinyint(1) NOT NULL DEFAULT '0',
  `email_module` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

--
-- Dumping data for table `user_company_info`
--

INSERT INTO `user_company_info` (`id`, `mst_companies_id`, `users_id`, `reporting_authority_id`, `mst_departments_id`, `mst_positions_id`, `join_date`, `resign_date`, `bank_name`, `bank_branch_name`, `salary_per_month`, `bank_acc_number`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 4, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, 1, NULL, '2021-06-16 10:37:22', '2021-06-16 10:47:59'),
(2, NULL, 5, 2, 1, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, 3, NULL, '2021-06-16 10:45:46', '2021-10-19 13:20:34'),
(3, NULL, 6, 2, 1, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-18 06:37:10', '2021-10-29 11:14:44'),
(4, 1, 3, 2, 2, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, 1, NULL, '2021-06-21 05:52:49', '2021-10-29 11:00:06'),
(5, NULL, 28, 2, 1, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-22 07:33:08', '2021-10-19 13:20:31'),
(6, NULL, 38, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-22 09:11:34', '2021-06-22 09:11:34'),
(7, NULL, 40, 2, 1, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-06-22 09:13:07', '2021-06-22 09:13:07'),
(8, NULL, 47, 2, 2, 8, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 3, NULL, NULL, '2021-07-02 10:13:01', '2021-10-19 13:20:28'),
(9, 4, 81, 5, 5, 4, '2018-07-19', '2021-07-19', 'ICICI Bank', 'Thaltej', '25000', '12345678958', 1, 3, NULL, NULL, '2021-07-19 10:43:21', '2021-07-19 10:43:21'),
(10, 2, 85, 3, 3, 8, '2018-07-07', '2021-07-19', 'Kalupur Bank', 'Paldi', '27000', '12345678000', 1, 3, NULL, NULL, '2021-07-19 11:19:29', '2021-10-29 10:53:40'),
(11, 1, 86, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-07-20 12:28:54', '2021-07-20 12:28:54'),
(12, 1, 92, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-10-29 10:23:21', '2021-10-29 10:23:21'),
(13, 1, 93, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-10-29 10:24:04', '2021-10-29 10:24:04'),
(14, 1, 94, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-10-29 11:22:26', '2021-10-29 11:22:26'),
(15, NULL, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2021-10-29 12:35:23', '2021-10-29 12:35:23'),
(16, NULL, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2021-10-29 12:39:00', '2021-10-29 12:39:00'),
(17, 1, 106, 2, 2, 1, '2020-05-20', '2021-06-20', 'Bank Name Ltd', 'Vijay Nagar', '5000', '454545554545', 1, 1, NULL, NULL, '2021-11-01 10:34:11', '2021-11-01 10:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_doc_details`
--

CREATE TABLE `user_doc_details` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `aadhar_card_photo` text,
  `aadhar_number` varchar(155) DEFAULT NULL,
  `election_card_photo` text,
  `election_card_number` varchar(155) DEFAULT NULL,
  `pan_card_photo` text,
  `pan_card_number` varchar(155) DEFAULT NULL,
  `passport_photo` text,
  `passport_number` varchar(155) DEFAULT NULL,
  `driving_license_photo` text,
  `driving_license_number` varchar(155) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is used to store user education details';

--
-- Dumping data for table `user_doc_details`
--

INSERT INTO `user_doc_details` (`id`, `users_id`, `aadhar_card_photo`, `aadhar_number`, `election_card_photo`, `election_card_number`, `pan_card_photo`, `pan_card_number`, `passport_photo`, `passport_number`, `driving_license_photo`, `driving_license_number`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 102, 'aadhar_card_102_sEsRk.jpg', '1234123412341234', 'election_card_102_sEsRk.jpg', '1234567890', 'pan_card_102_sEsRk.jpeg', 'ABCDE1234E', 'passport_102_sEsRk.jpg', 'M4584585', 'driving_license_102_sEsRk.jpg', 'MP0585555555', 1, 1, 1, NULL, '2021-10-29 13:58:24', '2021-10-29 13:58:34'),
(2, 106, 'aadhar_card_106_WnKK5.jpg', '1234123412341234', 'election_card_106_WnKK5.jpg', '1234567890', 'pan_card_106_WnKK5.jpeg', 'ABCDE1234E', 'passport_106_WnKK5.jpg', 'M4584585', 'driving_license_106_WnKK5.jpg', 'MP0585555555', 1, 1, NULL, NULL, '2021-11-01 10:34:11', '2021-11-01 10:34:11');

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
  `specialization` text,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
(56, 3, '10th', 'Gujrat Board', 1992, 1993, '78.50', 'Science', 1, 1, NULL, '2021-07-20 12:29:45', '2021-07-20 12:29:45'),
(57, 92, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'Information Technology', 1, 1, NULL, '2021-10-29 10:23:20', '2021-10-29 10:23:20'),
(58, 92, '10th', 'Gujrat Board', 1992, 1993, NULL, 'Science', 1, 1, NULL, '2021-10-29 10:23:20', '2021-10-29 10:23:20'),
(59, 93, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'Information Technology', 1, 1, NULL, '2021-10-29 10:24:04', '2021-10-29 10:24:04'),
(60, 93, '10th', 'Gujrat Board', 1992, 1993, NULL, 'Science', 1, 1, NULL, '2021-10-29 10:24:04', '2021-10-29 10:24:04'),
(61, 94, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'Information Technology', 1, 1, NULL, '2021-10-29 11:22:26', '2021-10-29 11:22:26'),
(62, 94, '10th', 'Gujrat Board', 1992, 1993, NULL, 'Science', 1, 1, NULL, '2021-10-29 11:22:26', '2021-10-29 11:22:26'),
(63, 106, 'B Tech', 'Ganpat University', 2008, 2012, NULL, 'Information Technology', 1, 1, NULL, '2021-11-01 10:34:11', '2021-11-01 10:34:11'),
(64, 106, '10th', 'Gujrat Board', 1992, 1993, NULL, 'Science', 1, 1, NULL, '2021-11-01 10:34:11', '2021-11-01 10:34:11');

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
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
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
-- Indexes for table `mst_product_parents`
--
ALTER TABLE `mst_product_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_product_samples`
--
ALTER TABLE `mst_product_samples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_sample_parameters`
--
ALTER TABLE `mst_sample_parameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_states`
--
ALTER TABLE `mst_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_tests`
--
ALTER TABLE `mst_tests`
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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `booking_audit_details`
--
ALTER TABLE `booking_audit_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `booking_sample_details`
--
ALTER TABLE `booking_sample_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `booking_tests`
--
ALTER TABLE `booking_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mst_countries`
--
ALTER TABLE `mst_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;
--
-- AUTO_INCREMENT for table `mst_customers`
--
ALTER TABLE `mst_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `mst_customers_contact_info`
--
ALTER TABLE `mst_customers_contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `mst_customers_contact_person`
--
ALTER TABLE `mst_customers_contact_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT for table `mst_departments`
--
ALTER TABLE `mst_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mst_groups`
--
ALTER TABLE `mst_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mst_instruments`
--
ALTER TABLE `mst_instruments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mst_ledgers`
--
ALTER TABLE `mst_ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mst_locations`
--
ALTER TABLE `mst_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `mst_positions`
--
ALTER TABLE `mst_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mst_products`
--
ALTER TABLE `mst_products`
  MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mst_product_parents`
--
ALTER TABLE `mst_product_parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `mst_product_samples`
--
ALTER TABLE `mst_product_samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `mst_sample_parameters`
--
ALTER TABLE `mst_sample_parameters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `mst_states`
--
ALTER TABLE `mst_states`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `mst_tests`
--
ALTER TABLE `mst_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mst_units`
--
ALTER TABLE `mst_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `user_address_details`
--
ALTER TABLE `user_address_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `user_assign_rights`
--
ALTER TABLE `user_assign_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_company_info`
--
ALTER TABLE `user_company_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user_doc_details`
--
ALTER TABLE `user_doc_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_edu_details`
--
ALTER TABLE `user_edu_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `user_emp_details`
--
ALTER TABLE `user_emp_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
