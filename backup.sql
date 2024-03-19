-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 05, 2023 at 02:38 PM
-- Server version: 8.0.35-0ubuntu0.22.04.1
-- PHP Version: 8.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zaisub`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_configs`
--

DROP TABLE IF EXISTS `affiliate_configs`;
CREATE TABLE `affiliate_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `plans` text COLLATE utf8mb4_unicode_ci,
  `affiliates` text COLLATE utf8mb4_unicode_ci,
  `commission_type` tinyint NOT NULL DEFAULT '1',
  `commission_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `recurring_commission_type` tinyint NOT NULL DEFAULT '1',
  `recurring_commission_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliate_configs`
--

INSERT INTO `affiliate_configs` (`id`, `user_id`, `title`, `products`, `plans`, `affiliates`, `commission_type`, `commission_amount`, `recurring_commission_type`, `recurring_commission_amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Commission', '[\"all\"]', '[\"all\"]', '[\"16\"]', 1, 5.00, 1, 2.00, '2023-11-20 11:09:52', '2023-11-20 11:09:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_histories`
--

DROP TABLE IF EXISTS `affiliate_histories`;
CREATE TABLE `affiliate_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliate_histories`
--

INSERT INTO `affiliate_histories` (`id`, `user_id`, `product_id`, `plan_id`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 16, 1, 1, 5.00, '2023-11-20 14:12:47', '2023-11-20 14:12:47', NULL),
(2, 16, 1, 1, 5.00, '2023-11-20 14:13:39', '2023-11-20 14:13:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authentication_log`
--

DROP TABLE IF EXISTS `authentication_log`;
CREATE TABLE `authentication_log` (
  `id` bigint UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login_at` timestamp NULL DEFAULT NULL,
  `login_successful` tinyint(1) NOT NULL DEFAULT '0',
  `logout_at` timestamp NULL DEFAULT NULL,
  `cleared_by_user` tinyint(1) NOT NULL DEFAULT '0',
  `location` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authentication_log`
--

INSERT INTO `authentication_log` (`id`, `authenticatable_type`, `authenticatable_id`, `ip_address`, `user_agent`, `login_at`, `login_successful`, `logout_at`, `cleared_by_user`, `location`) VALUES
(1, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-16 13:29:19', 1, '2023-10-16 13:45:35', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(2, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0', '2023-10-16 13:31:20', 1, '2023-10-16 13:35:17', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(3, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0', '2023-10-16 13:35:22', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(4, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-16 13:45:41', 1, '2023-10-16 13:46:09', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(5, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-16 13:46:12', 1, '2023-10-16 13:46:15', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(6, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-16 13:48:20', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(7, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-16 13:49:18', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(8, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-16 14:01:09', 1, '2023-10-16 14:03:38', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(9, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-16 14:18:28', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(10, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-16 14:20:00', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(11, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 05:05:07', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(12, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 06:34:24', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(13, 'App\\Models\\User', 2, '103.150.7.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 07:02:37', 1, NULL, 0, '{\"ip\": \"103.150.7.17\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(14, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 10:20:27', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(15, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 10:41:36', 1, '2023-10-17 12:17:47', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(16, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 10:43:09', 1, '2023-10-17 12:00:08', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(17, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 12:00:18', 1, '2023-10-17 12:16:47', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(18, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 12:22:30', 1, '2023-10-17 12:58:05', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(19, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 12:27:13', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(20, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 12:32:32', 1, '2023-10-17 12:37:17', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(21, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 12:37:24', 1, '2023-10-17 12:41:55', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(22, 'App\\Models\\User', 1, '103.150.7.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 12:38:29', 1, '2023-10-17 12:38:41', 0, '{\"ip\": \"103.150.7.17\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(23, 'App\\Models\\User', 2, '103.150.7.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 12:38:44', 1, '2023-10-17 15:01:59', 0, '{\"ip\": \"103.150.7.17\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(24, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 12:44:28', 1, '2023-10-17 13:13:31', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(25, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 12:46:00', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(26, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 12:58:07', 1, '2023-10-17 12:58:46', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(27, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 12:58:50', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(28, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 13:13:35', 1, '2023-10-17 13:15:05', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(29, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-17 13:15:08', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(30, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 13:19:48', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(31, 'App\\Models\\User', 1, '103.96.105.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 14:07:36', 1, '2023-10-17 14:07:48', 0, '{\"ip\": \"103.96.105.172\", \"lat\": 23.7167, \"lon\": 90.349, \"city\": \"Dhaka\", \"state\": \"C\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Dhaka Division\", \"postal_code\": \"1312\"}'),
(32, 'App\\Models\\User', 2, '103.96.105.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 14:07:52', 1, NULL, 0, '{\"ip\": \"103.96.105.172\", \"lat\": 23.7167, \"lon\": 90.349, \"city\": \"Dhaka\", \"state\": \"C\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Dhaka Division\", \"postal_code\": \"1312\"}'),
(33, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 14:16:13', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(34, 'App\\Models\\User', 2, '103.150.7.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-17 15:02:04', 1, NULL, 0, '{\"ip\": \"103.150.7.17\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(35, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 05:09:54', 1, '2023-10-18 05:11:50', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(36, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 05:14:45', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(37, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-18 05:31:53', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(38, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-18 05:50:41', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(39, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 05:55:19', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(40, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 07:53:07', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(41, 'App\\Models\\User', 2, '103.150.7.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-18 08:00:06', 1, NULL, 0, '{\"ip\": \"103.150.7.17\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(42, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 11:26:16', 1, '2023-10-18 11:40:27', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(43, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-18 11:29:16', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(44, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 11:40:31', 1, '2023-10-18 12:14:24', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(45, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 12:14:27', 1, '2023-10-18 12:27:40', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(46, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 12:27:43', 1, '2023-10-18 12:35:06', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(47, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 12:35:10', 1, '2023-10-18 13:37:36', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(48, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 12:38:28', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(49, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0', '2023-10-18 13:27:53', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(50, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-18 13:37:55', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(51, 'App\\Models\\User', 2, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-19 17:48:23', 1, NULL, 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(52, 'App\\Models\\User', 1, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-20 18:20:18', 1, NULL, 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(53, 'App\\Models\\User', 1, '2a02:c7c:4488:ac00:9105:733d:6e9e:4116', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-10-21 05:55:13', 1, NULL, 0, '{\"ip\": \"2a02:c7c:4488:ac00:9105:733d:6e9e:4116\", \"lat\": 52.808, \"lon\": -2.1118, \"city\": \"Stafford\", \"state\": \"ENG\", \"country\": \"United Kingdom\", \"default\": false, \"currency\": \"GBP\", \"iso_code\": \"GB\", \"timezone\": \"Europe/London\", \"continent\": \"Unknown\", \"state_name\": \"England\", \"postal_code\": \"ST16\"}'),
(54, 'App\\Models\\User', 1, '103.149.142.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 08:21:34', 1, NULL, 0, '{\"ip\": \"103.149.142.222\", \"lat\": 23.7908, \"lon\": 90.4109, \"city\": \"Dhaka\", \"state\": \"C\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Dhaka Division\", \"postal_code\": \"1212\"}'),
(55, 'App\\Models\\User', 2, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 09:45:07', 1, NULL, 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(56, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-21 09:55:50', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(57, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 09:59:24', 1, '2023-10-21 12:30:01', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(58, 'App\\Models\\User', 1, '103.135.90.89', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 10:15:17', 1, NULL, 0, '{\"ip\": \"103.135.90.89\", \"lat\": 23.7272, \"lon\": 90.4093, \"city\": \"Dhaka\", \"state\": \"C\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Dhaka Division\", \"postal_code\": \"1000\"}'),
(59, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-21 12:14:33', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(60, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-21 12:15:03', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(61, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 12:30:05', 1, '2023-10-21 13:04:29', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(62, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-21 12:36:50', 1, '2023-10-21 13:06:32', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(63, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 13:04:32', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(64, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-21 13:06:35', 1, '2023-10-21 13:24:26', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(65, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0', '2023-10-21 13:12:27', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(66, 'App\\Models\\User', 2, '103.143.0.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '2023-10-21 13:24:29', 1, NULL, 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(67, 'App\\Models\\User', 1, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 14:14:44', 1, '2023-10-21 14:15:10', 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(68, 'App\\Models\\User', 2, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 14:15:14', 1, NULL, 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(69, 'App\\Models\\User', 1, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 18:25:51', 1, '2023-10-21 18:27:54', 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(70, 'App\\Models\\User', 2, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 18:27:56', 1, '2023-10-21 18:28:37', 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(71, 'App\\Models\\User', 2, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 18:28:40', 1, '2023-10-21 18:28:43', 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(72, 'App\\Models\\User', 1, '103.16.226.96', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-21 18:28:46', 1, NULL, 0, '{\"ip\": \"103.16.226.96\", \"lat\": 22.8098, \"lon\": 89.5644, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}'),
(73, 'App\\Models\\User', 2, '2a02:c7c:4488:ac00:9105:733d:6e9e:4116', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-10-22 04:04:10', 1, NULL, 0, '{\"ip\": \"2a02:c7c:4488:ac00:9105:733d:6e9e:4116\", \"lat\": 52.808, \"lon\": -2.1118, \"city\": \"Stafford\", \"state\": \"ENG\", \"country\": \"United Kingdom\", \"default\": false, \"currency\": \"GBP\", \"iso_code\": \"GB\", \"timezone\": \"Europe/London\", \"continent\": \"Unknown\", \"state_name\": \"England\", \"postal_code\": \"ST16\"}'),
(74, 'App\\Models\\User', 2, '160.177.75.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 04:38:39', 1, NULL, 0, '{\"ip\": \"160.177.75.203\", \"lat\": 34.0368, \"lon\": -5.0008, \"city\": \"Fes\", \"state\": \"03\", \"country\": \"Morocco\", \"default\": false, \"currency\": \"MAD\", \"iso_code\": \"MA\", \"timezone\": \"Africa/Casablanca\", \"continent\": \"Unknown\", \"state_name\": \"Fes-Meknes\", \"postal_code\": \"\"}'),
(75, 'App\\Models\\User', 1, '197.186.15.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 04:49:50', 1, '2023-10-22 04:51:01', 0, '{\"ip\": \"197.186.15.118\", \"lat\": -6.77781, \"lon\": 39.2648, \"city\": \"Dar es Salaam\", \"state\": \"02\", \"country\": \"Tanzania\", \"default\": false, \"currency\": \"TZS\", \"iso_code\": \"TZ\", \"timezone\": \"Africa/Dar_es_Salaam\", \"continent\": \"Unknown\", \"state_name\": \"Dar es Salaam Region\", \"postal_code\": \"\"}'),
(76, 'App\\Models\\User', 1, '142.82.0.134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 04:52:30', 1, NULL, 0, '{\"ip\": \"142.82.0.134\", \"lat\": 45.5362, \"lon\": -73.5754, \"city\": \"Montreal\", \"state\": \"QC\", \"country\": \"Canada\", \"default\": false, \"currency\": \"CAD\", \"iso_code\": \"CA\", \"timezone\": \"America/Toronto\", \"continent\": \"Unknown\", \"state_name\": \"Quebec\", \"postal_code\": \"H2H\"}'),
(77, 'App\\Models\\User', 2, '18.235.55.247', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Mobile Safari/537.36', '2023-10-22 04:57:16', 1, NULL, 0, '{\"ip\": \"18.235.55.247\", \"lat\": 39.0438, \"lon\": -77.4874, \"city\": \"Ashburn\", \"state\": \"VA\", \"country\": \"United States\", \"default\": false, \"currency\": \"USD\", \"iso_code\": \"US\", \"timezone\": \"America/New_York\", \"continent\": \"Unknown\", \"state_name\": \"Virginia\", \"postal_code\": \"20149\"}'),
(78, 'App\\Models\\User', 1, '5.197.254.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 04:58:44', 1, NULL, 0, '{\"ip\": \"5.197.254.132\", \"lat\": 40.3771, \"lon\": 49.8875, \"city\": \"Baku\", \"state\": \"BA\", \"country\": \"Azerbaijan\", \"default\": false, \"currency\": \"AZN\", \"iso_code\": \"AZ\", \"timezone\": \"Asia/Baku\", \"continent\": \"Unknown\", \"state_name\": \"Baku City\", \"postal_code\": \"\"}'),
(79, 'App\\Models\\User', 1, '2a02:587:4d03:a75c:201e:7a7e:84b8:f26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Safari/605.1.15', '2023-10-22 05:09:48', 1, '2023-10-22 05:10:25', 0, '{\"ip\": \"2a02:587:4d03:a75c:201e:7a7e:84b8:f26\", \"lat\": 40.6439, \"lon\": 22.9358, \"city\": \"Thessaloniki\", \"state\": \"B\", \"country\": \"Greece\", \"default\": false, \"currency\": \"EUR\", \"iso_code\": \"GR\", \"timezone\": \"Europe/Athens\", \"continent\": \"Unknown\", \"state_name\": \"Central Macedonia\", \"postal_code\": \"\"}'),
(80, 'App\\Models\\User', 2, '109.252.118.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 05:15:28', 1, NULL, 0, '{\"ip\": \"109.252.118.182\", \"lat\": 55.7483, \"lon\": 37.6171, \"city\": \"Moscow\", \"state\": \"MOW\", \"country\": \"Russia\", \"default\": false, \"currency\": \"RUB\", \"iso_code\": \"RU\", \"timezone\": \"Europe/Moscow\", \"continent\": \"Unknown\", \"state_name\": \"Moscow\", \"postal_code\": \"125466\"}'),
(81, 'App\\Models\\User', 1, '103.177.203.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 05:18:39', 1, '2023-10-22 05:20:14', 0, '{\"ip\": \"103.177.203.184\", \"lat\": 28.4927, \"lon\": 77.5358, \"city\": \"Greater Noida\", \"state\": \"UP\", \"country\": \"India\", \"default\": false, \"currency\": \"INR\", \"iso_code\": \"IN\", \"timezone\": \"Asia/Kolkata\", \"continent\": \"Unknown\", \"state_name\": \"Uttar Pradesh\", \"postal_code\": \"201310\"}'),
(82, 'App\\Models\\User', 2, '103.177.203.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 05:20:18', 1, '2023-10-22 05:21:16', 0, '{\"ip\": \"103.177.203.184\", \"lat\": 28.4927, \"lon\": 77.5358, \"city\": \"Greater Noida\", \"state\": \"UP\", \"country\": \"India\", \"default\": false, \"currency\": \"INR\", \"iso_code\": \"IN\", \"timezone\": \"Asia/Kolkata\", \"continent\": \"Unknown\", \"state_name\": \"Uttar Pradesh\", \"postal_code\": \"201310\"}'),
(83, 'App\\Models\\User', 1, '2409:40e3:4b:4cea:cfc1:9edc:a0ce:c624', 'Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36', '2023-10-22 05:21:01', 1, NULL, 0, '{\"ip\": \"2409:40e3:4b:4cea:cfc1:9edc:a0ce:c624\", \"lat\": 26.8756, \"lon\": 80.9115, \"city\": \"Lucknow\", \"state\": \"UP\", \"country\": \"India\", \"default\": false, \"currency\": \"INR\", \"iso_code\": \"IN\", \"timezone\": \"Asia/Kolkata\", \"continent\": \"Unknown\", \"state_name\": \"Uttar Pradesh\", \"postal_code\": \"226003\"}'),
(84, 'App\\Models\\User', 1, '103.177.203.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 05:21:20', 1, '2023-10-22 05:21:31', 0, '{\"ip\": \"103.177.203.184\", \"lat\": 28.4927, \"lon\": 77.5358, \"city\": \"Greater Noida\", \"state\": \"UP\", \"country\": \"India\", \"default\": false, \"currency\": \"INR\", \"iso_code\": \"IN\", \"timezone\": \"Asia/Kolkata\", \"continent\": \"Unknown\", \"state_name\": \"Uttar Pradesh\", \"postal_code\": \"201310\"}'),
(85, 'App\\Models\\User', 2, '103.177.203.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 05:21:34', 1, NULL, 0, '{\"ip\": \"103.177.203.184\", \"lat\": 28.4927, \"lon\": 77.5358, \"city\": \"Greater Noida\", \"state\": \"UP\", \"country\": \"India\", \"default\": false, \"currency\": \"INR\", \"iso_code\": \"IN\", \"timezone\": \"Asia/Kolkata\", \"continent\": \"Unknown\", \"state_name\": \"Uttar Pradesh\", \"postal_code\": \"201310\"}'),
(86, 'App\\Models\\User', 1, '185.94.188.134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 05:36:43', 1, '2023-10-22 05:36:59', 0, '{\"ip\": \"185.94.188.134\", \"lat\": 52.3744, \"lon\": 4.88971, \"city\": \"Amsterdam\", \"state\": \"NH\", \"country\": \"Netherlands\", \"default\": false, \"currency\": \"EUR\", \"iso_code\": \"NL\", \"timezone\": \"Europe/Amsterdam\", \"continent\": \"Unknown\", \"state_name\": \"North Holland\", \"postal_code\": \"1109\"}'),
(87, 'App\\Models\\User', 2, '185.94.188.134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-10-22 05:37:04', 1, NULL, 0, '{\"ip\": \"185.94.188.134\", \"lat\": 52.3744, \"lon\": 4.88971, \"city\": \"Amsterdam\", \"state\": \"NH\", \"country\": \"Netherlands\", \"default\": false, \"currency\": \"EUR\", \"iso_code\": \"NL\", \"timezone\": \"Europe/Amsterdam\", \"continent\": \"Unknown\", \"state_name\": \"North Holland\", \"postal_code\": \"1109\"}'),
(88, 'App\\Models\\User', 1, '178.162.222.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', NULL, 0, '2023-11-05 13:52:51', 0, NULL),
(89, 'App\\Models\\User', 1, '178.162.222.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-11-05 13:53:34', 1, NULL, 0, '{\"ip\": \"178.162.222.161\", \"lat\": 50.097, \"lon\": 8.63006, \"city\": \"Frankfurt am Main\", \"state\": \"HE\", \"country\": \"Germany\", \"default\": false, \"currency\": \"EUR\", \"iso_code\": \"DE\", \"timezone\": \"Europe/Berlin\", \"continent\": \"Unknown\", \"state_name\": \"Hesse\", \"postal_code\": \"60326\"}'),
(90, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', NULL, 0, '2023-11-05 14:16:00', 0, NULL),
(91, 'App\\Models\\User', 1, '103.143.0.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '2023-11-05 14:31:16', 1, '2023-11-05 14:33:14', 0, '{\"ip\": \"103.143.0.72\", \"lat\": 22.8159, \"lon\": 89.566, \"city\": \"Khulna\", \"state\": \"D\", \"country\": \"Bangladesh\", \"default\": false, \"currency\": \"BDT\", \"iso_code\": \"BD\", \"timezone\": \"Asia/Dhaka\", \"continent\": \"Unknown\", \"state_name\": \"Khulna Division\", \"postal_code\": \"9100\"}');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `gateway_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `user_id`, `gateway_id`, `name`, `details`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 10, 'Santander Bank', 'AC: 12345678\r\nAC Name: Jon Bellion', 1, '2023-10-17 12:40:35', '2023-10-17 12:40:35', NULL),
(2, 2, 21, 'United Bank', 'account : mr john\r\nnumber: 6546465', 1, '2023-11-20 14:08:27', '2023-11-20 14:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

DROP TABLE IF EXISTS `beneficiaries`;
CREATE TABLE `beneficiaries` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `beneficiary_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint NOT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_routing_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiaries`
--

INSERT INTO `beneficiaries` (`id`, `user_id`, `beneficiary_name`, `type`, `card_number`, `card_holder_name`, `expire_month`, `expire_year`, `bank_name`, `bank_account_number`, `bank_account_name`, `bank_routing_number`, `paypal_email`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 16, 'Bank', 1, NULL, NULL, NULL, NULL, 'testing bank', '665464', NULL, '65464', NULL, 1, NULL, '2023-11-20 14:14:27', '2023-11-20 14:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `best_features_settings`
--

DROP TABLE IF EXISTS `best_features_settings`;
CREATE TABLE `best_features_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `best_features_settings`
--

INSERT INTO `best_features_settings` (`id`, `name`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Webhook events', 'Webhook events', 'The \"Webhook Events\" feature in our Subscription and Billing Management script allows real-time notifications and updates on subscription activity, enhancing transparency and efficiency.', 42, 1, '2023-11-01 14:24:52', '2023-11-02 14:31:35', NULL),
(2, 'Reporting & Analytics', 'Reporting & Analytics', 'The \"Reports & Analytics\" feature in our Subscription and Billing Management script offers insightful data visualisation and comprehensive reporting tools to monitor subscription metrics and financial performance efficiently.', 65, 1, '2023-11-01 14:53:44', '2023-11-02 08:42:23', NULL),
(3, 'Customer Management:', 'Customer Management:', 'The \"Customer Management\" feature in our Subscription and Billing Management script streamlines customer data, enhancing user interactions and simplifying billing processes for improved subscription management.', 69, 1, '2023-11-01 14:54:34', '2023-11-02 09:32:36', NULL),
(4, 'Notifications & Alerts', 'Notifications & Alerts', 'The Notification & Alert feature in our Subscription and Billing Management script provides real-time updates and reminders, ensuring seamless communication and proactive billing management for your subscriptions.', 67, 1, '2023-11-01 14:55:05', '2023-11-02 08:49:55', NULL),
(5, 'Subscription Management', 'Subscription Management', 'The Subscription Management feature in our script simplifies user subscription tracking and billing, ensuring effortless management and renewal, enhancing customer satisfaction and revenue stability.', 70, 1, '2023-11-02 07:21:30', '2023-11-02 09:33:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_page_settings`
--

DROP TABLE IF EXISTS `checkout_page_settings`;
CREATE TABLE `checkout_page_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `image` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `basic_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `billing_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_first_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_last_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_zip_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_city` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_country` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_method` tinyint DEFAULT NULL,
  `payment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkout_page_settings`
--

INSERT INTO `checkout_page_settings` (`id`, `user_id`, `image`, `title`, `text_size`, `text_color`, `basic_info`, `basic_first_name`, `basic_last_name`, `basic_phone`, `basic_email`, `basic_company`, `billing_info`, `billing_first_name`, `billing_last_name`, `billing_email`, `billing_phone`, `billing_zip_code`, `billing_address`, `billing_city`, `billing_state`, `billing_country`, `shipping_info`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_phone`, `shipping_zip_code`, `shipping_address`, `shipping_city`, `shipping_state`, `shipping_country`, `shipping_method`, `payment`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 8, 'Payment Information', '2rem', '#ffffff', '[]', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '[\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]', 1, '2023-10-17 12:29:59', '2023-11-20 14:07:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE `contact_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `short_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` tinyint NOT NULL DEFAULT '0',
  `discount` int NOT NULL DEFAULT '0',
  `redemption_type` int NOT NULL DEFAULT '0',
  `product_plan` int NOT NULL DEFAULT '0',
  `valid_date` date NOT NULL,
  `maximum_redemption` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `user_id` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `product_id`, `name`, `code`, `discount_type`, `discount`, `redemption_type`, `product_plan`, `valid_date`, `maximum_redemption`, `status`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'SYNC20OFF (20% off discount)', 'MHL970', 1, 21, 1, 3, '2023-10-18', 0, 1, 2, NULL, '2023-10-16 14:24:23', '2023-10-16 14:24:23'),
(2, 3, 'TechWave-(15% off Pro plan)', 'GHT568', 2, 15, 1, 4, '2023-10-28', 0, 1, 2, NULL, '2023-10-16 14:26:33', '2023-10-16 14:26:33'),
(3, 4, 'InnovaSync-(10% off Pro Plus plan)', 'INN098', 2, 10, 3, 5, '2023-10-23', 12, 1, 2, NULL, '2023-10-16 14:29:07', '2023-10-16 14:29:07'),
(4, 5, 'NexaPulse-(Save $10)', 'KJ9872', 1, 10, 1, 6, '2023-10-28', 2, 1, 2, NULL, '2023-10-16 14:30:43', '2023-10-16 14:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_placement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `current_currency` smallint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_code`, `symbol`, `currency_placement`, `current_currency`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'before', 1, NULL, '2023-10-16 06:33:46', '2023-10-16 06:33:46'),
(2, 'BDT', '৳', 'before', 0, NULL, '2023-10-16 06:33:46', '2023-10-16 06:33:46'),
(3, 'INR', '₹', 'before', 0, NULL, '2023-10-16 06:33:46', '2023-10-16 06:33:46'),
(4, 'GBP', '£', 'after', 0, NULL, '2023-10-16 06:33:46', '2023-10-16 06:33:46'),
(5, 'MXN', '$', 'before', 0, NULL, '2023-10-16 06:33:46', '2023-10-16 06:33:46'),
(6, 'SAR', 'SR', 'before', 0, NULL, '2023-10-16 06:33:46', '2023-10-16 06:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

DROP TABLE IF EXISTS `database_backups`;
CREATE TABLE `database_backups` (
  `id` bigint UNSIGNED NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `database_backup_cron_settings`
--

DROP TABLE IF EXISTS `database_backup_cron_settings`;
CREATE TABLE `database_backup_cron_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour_of_day` time NOT NULL DEFAULT '00:00:00',
  `backup_after_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_backup_after_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category` tinyint DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `user_id`, `category`, `subject`, `body`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Payment Successful', '<div>Subject: Payment Successful - Order #{{invoice_id}}</div><div><br></div><div>Here are the details of your order:</div><div><br></div><div>Order Number: #{{invoice_id}}</div><div>Payment Amount: {{total}}</div><div>Payment Method: {{gateway_name}}</div><div>Download Link: {{link}}</div><div><br></div>', 1, NULL, '2023-10-17 12:40:10', '2023-10-17 12:50:43'),
(2, 2, 2, 'Payment Failure', '<div>Subject: Payment Failure - Order #{{invoice_id}}</div><div><br></div><div>Here are the details of your order:</div><div><br></div><div>Order Number: #{{invoice_id}}</div><div>Payment Amount: {{total}}</div><div>Payment Method: {{gateway_name}}</div><div><br></div>', 1, NULL, '2023-10-17 12:40:15', '2023-10-17 12:50:44'),
(3, 2, 3, 'Invoice', '<div><span style=\"background-color: var(--bs-modal-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Order Number: #{{invoice_id}}</span><br></div><div>Payment Amount: {{total}}</div><div>Payment Method: {{gateway_name}}</div><div>Download Link:{{link}}</div><div><br></div>', 0, NULL, '2023-10-17 12:47:38', '2023-10-17 12:50:45'),
(4, 2, 4, 'Payment Cancelation', '<div>Subject: Subscription Cancellation - Order #{{invoice_id}}</div><div><br></div><div>Here are the details of your order:</div><div><br></div><div>Order Number: #{{invoice_id}}</div><div>Payment Amount: {{total}}</div><div>Payment Method: {{gateway_name}}</div><div><br></div>', 0, NULL, '2023-10-17 12:48:50', '2023-10-17 12:50:46'),
(5, 2, 6, 'Payment Cancelation', '<div>Subject: Payment Cancellation - Order #{{invoice_id}}</div><div><br></div><div>Here are the details of your order:</div><div><br></div><div>Order Number: #{{invoice_id}}</div><div>Payment Amount: {{total}}</div><div>Payment Method: {{gateway_name}}</div><div><br></div>', 0, NULL, '2023-10-17 12:50:00', '2023-10-17 12:50:47'),
(6, 1, 7, 'Verify Your Email', '<span style=\"color: rgb(112, 112, 112); font-family: &quot;Inter Tight&quot;, sans-serif;\">Verify Link : {{link}}</span>', 0, NULL, '2023-10-18 05:50:53', '2023-10-18 05:52:06'),
(7, 1, 5, 'New password', 'New password : {{link}}', 0, NULL, '2023-10-18 05:52:19', '2023-10-18 05:54:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'What is subscription and billing management software?', 'Subscription and billing management software is a tool designed to help businesses manage their subscription-based services, recurring billing, and payment processes. It automates tasks such as billing, invoicing, payment processing, and customer management.', 1, '2023-11-01 14:28:07', '2023-11-01 14:28:07', NULL),
(2, 'Why do I need subscription and billing management software?', 'Subscription and billing management software streamlines your subscription business operations, reducing manual tasks and errors. It helps you manage subscriptions, collect payments, and provide a better customer experience.', 1, '2023-11-01 14:28:22', '2023-11-01 14:28:22', NULL),
(3, 'What features should I look for in subscription and billing management software?', 'Key features to consider include subscription creation and management, automated billing, invoicing, payment processing, dunning management (handling failed payments), revenue recognition, and reporting/analytics.', 1, '2023-11-01 14:28:38', '2023-11-01 14:28:38', NULL),
(4, 'Can I integrate this software with my existing tools and systems?', 'Many subscription and billing management software solutions offer integrations with popular platforms, like CRM systems, accounting software, and payment gateways. Check for compatibility with your current software stack.', 1, '2023-11-01 14:28:54', '2023-11-01 14:28:54', NULL),
(5, 'Can I customize the billing and invoicing process?', 'Most subscription management software allows for customization of billing and invoicing templates, enabling you to add your branding and tailor them to your company\'s needs.', 1, '2023-11-01 14:29:13', '2023-11-01 14:29:13', NULL),
(6, 'How does the software handle recurring billing and payment processing?', 'The software automates recurring billing by setting up billing cycles and collecting payments from customers through various payment methods, such as credit cards, ACH, or digital wallets.', 1, '2023-11-01 14:29:39', '2023-11-01 14:29:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `features_settings`
--

DROP TABLE IF EXISTS `features_settings`;
CREATE TABLE `features_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` int DEFAULT NULL,
  `icon` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features_settings`
--

INSERT INTO `features_settings` (`id`, `title`, `description`, `image`, `icon`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'One-Time and Recurring Billing Solution.', 'Our Subscription and Billing Management Script offers a versatile One-Time and Recurring Billing Solution, streamlining payment processes for businesses with flexibility and ease. Efficiently handle both single transactions and recurring revenue streams.', 27, 28, 1, '2023-11-01 14:13:55', '2023-11-02 06:44:52', NULL),
(2, 'Dynamic product, managemet,plan and license.', 'The \"Dynamic Product Management, Plan, and License\" feature in our Subscription and Billing Management script offers real-time adaptability and control over product offerings, pricing plans, and licensing configurations, ensuring seamless scalability and customization.', 29, 33, 1, '2023-11-01 14:15:03', '2023-11-02 06:45:17', NULL),
(3, 'Dynamic payment gateway integration', 'Seamlessly incorporate dynamic payment gateways into your Subscription and Billing Management script for flexible and secure transactions, catering to diverse customer preferences', 31, 32, 1, '2023-11-01 14:16:14', '2023-11-02 06:45:37', NULL),
(4, 'Customisable Checkout', 'The \"Customisable Checkout\" feature in our Subscription and Billing Management script allows businesses to tailor their payment process, enhancing user experience and branding consistency.', 56, 57, 1, '2023-11-02 06:48:05', '2023-11-02 06:48:05', NULL),
(5, 'Customisable Invoicing', 'Tailor your invoices with ease using the Customisable Invoicing feature in our Subscription and Billing Management script. Personalize branding, fields, and templates for a professional touch', 58, 59, 1, '2023-11-02 07:18:46', '2023-11-02 07:18:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_managers`
--

DROP TABLE IF EXISTS `file_managers`;
CREATE TABLE `file_managers` (
  `id` bigint UNSIGNED NOT NULL,
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_managers`
--

INSERT INTO `file_managers` (`id`, `file_type`, `storage_type`, `original_name`, `file_name`, `user_id`, `path`, `extension`, `size`, `external_link`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'image/png', 'public', 'logo-black.png', '3591697463183.png', 1, 'uploads/Setting/3591697463183.png', 'png', '2886', NULL, NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(2, 'image/png', 'public', 'zaisub-white-logo-2.png', '7381697463183.png', 1, 'uploads/Setting/7381697463183.png', 'png', '2376', NULL, NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(3, 'image/png', 'public', 'favicon.png', '5581697463183.png', 1, 'uploads/Setting/5581697463183.png', 'png', '988', NULL, NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(4, 'image/png', 'public', 'logo-black.png', '9671697463183.png', 1, 'uploads/Setting/9671697463183.png', 'png', '2886', NULL, NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(5, 'image/jpeg', 'public', '9ea47674f7fbcd761ecf9eb71d31e87e.jpg', '9031697950795.jpg', 1, 'uploads/User/9031697950795.jpg', 'jpg', '99105', NULL, NULL, '2023-10-16 13:34:02', '2023-10-22 04:59:55'),
(6, 'image/png', 'public', 'user.png', '3061697464847.png', 2, 'uploads/User/3061697464847.png', 'png', '33969', NULL, NULL, '2023-10-16 14:00:47', '2023-10-16 14:00:47'),
(7, 'image/png', 'public', 'logo-black.png', 'invoice-setting-1697547183.png', 2, 'uploads/InvoiceSetting/invoice-setting-1697547183.png', 'png', '2886', NULL, NULL, '2023-10-16 14:03:57', '2023-10-17 12:53:03'),
(8, 'image/jpeg', 'public', '2304x1440-palatinate-blue-solid-color-background.jpg', '1721697546184.jpg', 2, 'uploads/CheckoutPageSetting/1721697546184.jpg', 'jpg', '52532', NULL, NULL, '2023-10-17 12:36:24', '2023-10-17 12:36:24'),
(9, 'image/png', 'public', 'Flag_of_the_United_Kingdom_(1-2).svg.png', '7351697548441.png', 1, 'uploads/Language/7351697548441.png', 'png', '2977', NULL, NULL, '2023-10-17 13:14:01', '2023-10-17 13:14:01'),
(10, 'image/png', 'public', 'Flag_of_Bangladesh.svg (1).png', '5641697548468.png', 1, 'uploads/language/5641697548468.png', 'png', '11133', NULL, NULL, '2023-10-17 13:14:28', '2023-10-17 13:14:28'),
(11, 'image/jpeg', 'public', 'no-image.jpg', '2101697552397.jpg', 2, 'uploads/Order/2101697552397.jpg', 'jpg', '9380', NULL, NULL, '2023-10-17 14:19:57', '2023-10-17 14:19:57'),
(12, 'application/zip', 'public', 'Bank-Account-Statement-.zip', '5311697553785.zip', 2, 'uploads/Order/5311697553785.zip', 'zip', '78009', NULL, NULL, '2023-10-17 14:43:05', '2023-10-17 14:43:05'),
(13, 'application/zip', 'public', 'Bank-Account-Statement-.zip', '3881697554484.zip', 2, 'uploads/Order/3881697554484.zip', 'zip', '78009', NULL, NULL, '2023-10-17 14:54:44', '2023-10-17 14:54:44'),
(14, 'image/jpeg', 'public', 'download.jpeg', '911697608908.jpeg', 2, 'uploads/Order/911697608908.jpeg', 'jpeg', '8119', NULL, NULL, '2023-10-18 06:01:48', '2023-10-18 06:01:48'),
(15, 'image/jpeg', 'public', 'download.jpeg', '8181697609496.jpeg', 2, 'uploads/Order/8181697609496.jpeg', 'jpeg', '8119', NULL, NULL, '2023-10-18 06:11:36', '2023-10-18 06:11:36'),
(16, 'image/jpeg', 'public', 'Deposit-Slip-Template-64f.jpg', '9811697628671.jpg', 2, 'uploads/Order/9811697628671.jpg', 'jpg', '81681', NULL, NULL, '2023-10-18 11:31:11', '2023-10-18 11:31:11'),
(17, 'image/jpeg', 'public', 'Deposit-Slip-Template-64f.jpg', '2711697628956.jpg', 2, 'uploads/Order/2711697628956.jpg', 'jpg', '81681', NULL, NULL, '2023-10-18 11:35:56', '2023-10-18 11:35:56'),
(18, 'image/jpeg', 'public', 'Deposit-Slip-Template-64f.jpg', '7781697629075.jpg', 2, 'uploads/Order/7781697629075.jpg', 'jpg', '81681', NULL, NULL, '2023-10-18 11:37:55', '2023-10-18 11:37:55'),
(19, 'image/jpeg', 'public', 'Deposit-Slip-Template-64f.jpg', '3231697629326.jpg', 2, 'uploads/Order/3231697629326.jpg', 'jpg', '81681', NULL, NULL, '2023-10-18 11:42:07', '2023-10-18 11:42:07'),
(20, 'image/png', 'public', 'Flag_of_the_United_Kingdom_(1-2).svg.png', '4881697549014.png', 1, 'uploads/Language/4881697549014.png', 'png', '2977', NULL, NULL, '2023-10-17 13:23:34', '2023-10-17 13:23:34'),
(21, 'image/png', 'public', 'sum.png', '2121698846000.png', 1, 'uploads/Package/2121698846000.png', 'png', '3298', NULL, NULL, '2023-11-01 13:40:00', '2023-11-01 13:40:00'),
(22, 'image/png', 'public', 'hero-banner-1.png', '3841698847439.png', 1, 'uploads/frontend-section/3841698847439.png', 'png', '19910', NULL, NULL, '2023-11-01 14:03:59', '2023-11-01 14:03:59'),
(23, 'text/html', 'public', 'authentication.html', '7051698847439.html', 1, 'uploads/frontend-section/7051698847439.html', 'html', '2849', NULL, NULL, '2023-11-01 14:03:59', '2023-11-01 14:03:59'),
(24, 'image/png', 'public', 'hero-banner-1.png', '2801698847454.png', 1, 'uploads/frontend-section/2801698847454.png', 'png', '19910', NULL, NULL, '2023-11-01 14:04:14', '2023-11-01 14:04:14'),
(25, 'image/jpeg', 'public', 'banner-img-1.jpg', '6341698847747.jpg', 1, 'uploads/frontend-section/6341698847747.jpg', 'jpg', '423622', NULL, NULL, '2023-11-01 14:09:07', '2023-11-01 14:09:07'),
(26, 'image/png', 'public', 'logo-black.png', '2171698847866.png', 1, 'uploads/Setting/2171698847866.png', 'png', '2886', NULL, NULL, '2023-11-01 14:11:06', '2023-11-01 14:11:06'),
(27, 'image/png', 'public', 'features-img-1.png', '6661698848035.png', 1, 'uploads/featuresSetting/6661698848035.png', 'png', '740295', NULL, NULL, '2023-11-01 14:13:55', '2023-11-01 14:13:55'),
(28, 'image/png', 'public', 'features-1.png', '5771698848035.png', 1, 'uploads/featuresSetting/5771698848035.png', 'png', '1515', NULL, NULL, '2023-11-01 14:13:55', '2023-11-01 14:13:55'),
(29, 'image/png', 'public', 'features-img-2.png', '9611698848103.png', 1, 'uploads/featuresSetting/9611698848103.png', 'png', '227755', NULL, NULL, '2023-11-01 14:15:03', '2023-11-01 14:15:03'),
(30, 'image/png', 'public', 'features-2.png', '9431698848103.png', 1, 'uploads/featuresSetting/9431698848103.png', 'png', '1601', NULL, NULL, '2023-11-01 14:15:03', '2023-11-01 14:15:03'),
(31, 'image/png', 'public', 'features-img-3.png', '151698848174.png', 1, 'uploads/featuresSetting/151698848174.png', 'png', '74806', NULL, NULL, '2023-11-01 14:16:14', '2023-11-01 14:16:14'),
(32, 'image/png', 'public', 'features-2.png', '211698848174.png', 1, 'uploads/featuresSetting/211698848174.png', 'png', '1601', NULL, NULL, '2023-11-01 14:16:14', '2023-11-01 14:16:14'),
(33, 'image/png', 'public', 'features-4.png', '21698848209.png', 1, 'uploads/featuresSetting/21698848209.png', 'png', '1155', NULL, NULL, '2023-11-01 14:16:49', '2023-11-01 14:16:49'),
(34, 'image/png', 'public', 'logo-black.png', '6571698848451.png', 1, 'uploads/Setting/6571698848451.png', 'png', '2886', NULL, NULL, '2023-11-01 14:20:51', '2023-11-01 14:20:51'),
(35, 'image/png', 'public', 'favicon.png', '2561698848469.png', 1, 'uploads/Setting/2561698848469.png', 'png', '988', NULL, NULL, '2023-11-01 14:21:09', '2023-11-01 14:21:09'),
(36, 'image/png', 'public', 'price-essential-plan.png', '1171698848475.png', 1, 'uploads/Package/1171698848475.png', 'png', '4467', NULL, NULL, '2023-11-01 14:21:15', '2023-11-01 14:21:15'),
(37, 'image/png', 'public', 'logo.png', '6111698848489.png', 1, 'uploads/Setting/6111698848489.png', 'png', '2376', NULL, NULL, '2023-11-01 14:21:29', '2023-11-01 14:21:29'),
(38, 'image/png', 'public', 'logo-black.png', '9281698848541.png', 1, 'uploads/Setting/9281698848541.png', 'png', '2886', NULL, NULL, '2023-11-01 14:22:21', '2023-11-01 14:22:21'),
(39, 'image/png', 'public', 'price-enterprise-plan.png', '31698848550.png', 1, 'uploads/Package/31698848550.png', 'png', '4324', NULL, NULL, '2023-11-01 14:22:30', '2023-11-01 14:22:30'),
(40, 'image/png', 'public', 'price-business-plan.png', '9281698848626.png', 1, 'uploads/Package/9281698848626.png', 'png', '4357', NULL, NULL, '2023-11-01 14:23:46', '2023-11-01 14:23:46'),
(41, 'image/png', 'public', 'price-enterprise-plan.png', '8821698848640.png', 1, 'uploads/Package/8821698848640.png', 'png', '4324', NULL, NULL, '2023-11-01 14:24:00', '2023-11-01 14:24:00'),
(42, 'image/png', 'public', 'features-img-1.png', '6961698848692.png', 1, 'uploads/featuresSetting/6961698848692.png', 'png', '740295', NULL, NULL, '2023-11-01 14:24:52', '2023-11-01 14:24:52'),
(43, 'image/png', 'public', 'Group 1000008897.png', '271698849209.png', 1, 'uploads/frontend-section/271698849209.png', 'png', '408559', NULL, NULL, '2023-11-01 14:33:29', '2023-11-01 14:33:29'),
(44, 'image/png', 'public', 'integrations-img.png', '6121698849241.png', 1, 'uploads/frontend-section/6121698849241.png', 'png', '106249', NULL, NULL, '2023-11-01 14:34:01', '2023-11-01 14:34:01'),
(45, 'image/png', 'public', 'user.png', '7541698849345.png', 1, 'uploads/testimonial/7541698849345.png', 'png', '33969', NULL, NULL, '2023-11-01 14:35:45', '2023-11-01 14:35:45'),
(46, 'image/png', 'public', 'testi-img-1.png', '351698849592.png', 1, 'uploads/testimonial/351698849592.png', 'png', '199215', NULL, NULL, '2023-11-01 14:39:52', '2023-11-01 14:39:52'),
(47, 'image/png', 'public', 'logo-white.png', '3861698849753.png', 1, 'uploads/Setting/3861698849753.png', 'png', '2376', NULL, NULL, '2023-11-01 20:43:15', '2023-11-05 20:43:19'),
(48, 'image/png', 'public', 'portrait-handsome-young-man-with-crossed-arms (1) 1.png', '6641698849663.png', 1, 'uploads/testimonial/6641698849663.png', 'png', '188102', NULL, NULL, '2023-11-01 14:41:03', '2023-11-01 14:41:03'),
(49, 'image/png', 'public', 'logo-white.png', 'logo-white.png', 1, 'uploads/Setting/3861698849753.png', 'png', '2376', NULL, NULL, '2023-11-01 14:42:33', '2023-11-01 14:42:33'),
(50, 'image/png', 'public', 'logo-black.png', '9001698849808.png', 1, 'uploads/Setting/9001698849808.png', 'png', '2886', NULL, NULL, '2023-11-01 14:43:28', '2023-11-01 14:43:28'),
(51, 'image/png', 'public', 'logo-black.png', '5961698849823.png', 1, 'uploads/Setting/5961698849823.png', 'png', '2886', NULL, NULL, '2023-11-01 14:43:43', '2023-11-01 14:43:43'),
(52, 'image/png', 'public', 'features-img-1.png', '9631698850424.png', 1, 'uploads/featuresSetting/9631698850424.png', 'png', '740295', NULL, NULL, '2023-11-01 14:53:44', '2023-11-01 14:53:44'),
(53, 'image/png', 'public', 'features-img-2.png', '6271698850474.png', 1, 'uploads/featuresSetting/6271698850474.png', 'png', '227755', NULL, NULL, '2023-11-01 14:54:34', '2023-11-01 14:54:34'),
(54, 'image/png', 'public', 'features-img-1.png', '4661698850505.png', 1, 'uploads/featuresSetting/4661698850505.png', 'png', '740295', NULL, NULL, '2023-11-01 14:55:05', '2023-11-01 14:55:05'),
(55, 'image/png', 'public', 'logo.png', '2361698904254.png', 1, 'uploads/Setting/2361698904254.png', 'png', '2376', NULL, NULL, '2023-11-02 05:50:54', '2023-11-02 05:50:54'),
(56, 'image/png', 'public', 'features-img-1.png', '8351698907685.png', 1, 'uploads/featuresSetting/8351698907685.png', 'png', '740295', NULL, NULL, '2023-11-02 06:48:05', '2023-11-02 06:48:05'),
(57, 'image/png', 'public', 'features-5.png', '5571698907685.png', 1, 'uploads/featuresSetting/5571698907685.png', 'png', '1088', NULL, NULL, '2023-11-02 06:48:05', '2023-11-02 06:48:05'),
(58, 'image/png', 'public', 'Group 1000008083 (1).png', '3361698909526.png', 1, 'uploads/featuresSetting/3361698909526.png', 'png', '87589', NULL, NULL, '2023-11-02 07:18:46', '2023-11-02 07:18:46'),
(59, 'image/png', 'public', 'features-3.png', '9251698909526.png', 1, 'uploads/featuresSetting/9251698909526.png', 'png', '1362', NULL, NULL, '2023-11-02 07:18:46', '2023-11-02 07:18:46'),
(60, 'image/png', 'public', 'Best-Features-Card-Image2.png', '2151698909625.png', 1, 'uploads/featuresSetting/2151698909625.png', 'png', '53720', NULL, NULL, '2023-11-02 07:20:25', '2023-11-02 07:20:25'),
(61, 'image/png', 'public', 'Best-Features-Card-Image3.png', '1741698909649.png', 1, 'uploads/featuresSetting/1741698909649.png', 'png', '80972', NULL, NULL, '2023-11-02 07:20:49', '2023-11-02 07:20:49'),
(62, 'image/png', 'public', 'Best-Features-Card-Image4.png', '7891698909671.png', 1, 'uploads/featuresSetting/7891698909671.png', 'png', '59341', NULL, NULL, '2023-11-02 07:21:11', '2023-11-02 07:21:11'),
(63, 'image/png', 'public', 'Best-Features-Card-Image5.png', '6521698909690.png', 1, 'uploads/featuresSetting/6521698909690.png', 'png', '73332', NULL, NULL, '2023-11-02 07:21:30', '2023-11-02 07:21:30'),
(64, 'image/png', 'public', 'Group 1000008088.png', '8281698914541.png', 1, 'uploads/featuresSetting/8281698914541.png', 'png', '440040', NULL, NULL, '2023-11-02 08:42:21', '2023-11-02 08:42:21'),
(65, 'image/png', 'public', 'Group 1000008088.png', '7441698914543.png', 1, 'uploads/featuresSetting/7441698914543.png', 'png', '440040', NULL, NULL, '2023-11-02 08:42:23', '2023-11-02 08:42:23'),
(66, 'image/png', 'public', 'Group 1000008088 (1).png', '1911698914898.png', 1, 'uploads/featuresSetting/1911698914898.png', 'png', '504479', NULL, NULL, '2023-11-02 08:48:18', '2023-11-02 08:48:18'),
(67, 'image/png', 'public', 'Group 1000008088 (1).png', '1311698914995.png', 1, 'uploads/featuresSetting/1311698914995.png', 'png', '504479', NULL, NULL, '2023-11-02 08:49:55', '2023-11-02 08:49:55'),
(68, 'image/png', 'public', 'Group 1000008088.png', '1091698917528.png', 1, 'uploads/featuresSetting/1091698917528.png', 'png', '440040', NULL, NULL, '2023-11-02 09:32:08', '2023-11-02 09:32:08'),
(69, 'image/png', 'public', 'Group 1000008088 (4).png', '3781698917556.png', 1, 'uploads/featuresSetting/3781698917556.png', 'png', '719002', NULL, NULL, '2023-11-02 09:32:36', '2023-11-02 09:32:36'),
(70, 'image/png', 'public', 'Group 1000008088 (2).png', '8131698917587.png', 1, 'uploads/featuresSetting/8131698917587.png', 'png', '764491', NULL, NULL, '2023-11-02 09:33:07', '2023-11-02 09:33:07'),
(71, 'image/png', 'public', '4441697360583.png', '631698921829.png', 1, 'uploads/Setting/631698921829.png', 'png', '2886', NULL, NULL, '2023-11-02 10:43:49', '2023-11-02 10:43:49'),
(72, 'image/png', 'public', 'user.png', '3941698922897.png', 1, 'uploads/testimonial/3941698922897.png', 'png', '33969', NULL, NULL, '2023-11-02 11:01:37', '2023-11-02 11:01:37'),
(73, 'image/png', 'public', 'men.png', '3591698922949.png', 1, 'uploads/testimonial/3591698922949.png', 'png', '70131', NULL, NULL, '2023-11-02 11:02:29', '2023-11-02 11:02:29'),
(74, 'image/jpeg', 'public', 'user.jpg', '6751698923089.jpg', 1, 'uploads/testimonial/6751698923089.jpg', 'jpg', '871660', NULL, NULL, '2023-11-02 11:04:49', '2023-11-02 11:04:49'),
(75, 'image/jpeg', 'public', 'user (2).jpg', '5231698923182.jpg', 1, 'uploads/testimonial/5231698923182.jpg', 'jpg', '70986', NULL, NULL, '2023-11-02 11:06:22', '2023-11-02 11:06:22'),
(76, 'image/jpeg', 'public', 'user (4).jpg', '4231698924624.jpg', 1, 'uploads/testimonial/4231698924624.jpg', 'jpg', '12278', NULL, NULL, '2023-11-02 11:30:24', '2023-11-02 11:30:24'),
(77, 'image/png', 'public', 'user-removebg-preview.png', '4321698924757.png', 1, 'uploads/testimonial/4321698924757.png', 'png', '236080', NULL, NULL, '2023-11-02 11:32:37', '2023-11-02 11:32:37'),
(78, 'image/jpeg', 'public', 'user (5).jpg', '1351698924895.jpg', 1, 'uploads/testimonial/1351698924895.jpg', 'jpg', '15607', NULL, NULL, '2023-11-02 11:34:55', '2023-11-02 11:34:55'),
(79, 'image/png', 'public', 'happy-pleased-guy-pointing-fingers-sideways-two-variants 1.png', '6311698925055.png', 1, 'uploads/testimonial/6311698925055.png', 'png', '199313', NULL, NULL, '2023-11-02 11:37:35', '2023-11-02 11:37:35'),
(80, 'image/png', 'public', 'happy-pleased-guy-pointing-fingers-sideways-two-variants 1 (1).png', '7141698925192.png', 1, 'uploads/testimonial/7141698925192.png', 'png', '31336', NULL, NULL, '2023-11-02 11:39:52', '2023-11-02 11:39:52'),
(81, 'image/png', 'public', 'happy-pleased-guy-pointing-fingers-sideways-two-variants 1 (2).png', '7841698925249.png', 1, 'uploads/testimonial/7841698925249.png', 'png', '32045', NULL, NULL, '2023-11-02 11:40:49', '2023-11-02 11:40:49'),
(82, 'image/png', 'public', 'happy-pleased-guy-pointing-fingers-sideways-two-variants_1__2_-removebg-preview.png', '6021698925313.png', 1, 'uploads/testimonial/6021698925313.png', 'png', '83253', NULL, NULL, '2023-11-02 11:41:53', '2023-11-02 11:41:53'),
(83, 'image/png', 'public', 'Group 1000008102 (1).png', '7701699161237.png', 1, 'uploads/frontend-section/7701699161237.png', 'png', '944791', NULL, NULL, '2023-11-05 05:13:57', '2023-11-05 05:13:57'),
(84, 'image/png', 'public', 'Group_1000008102-removebg-preview.png', '7681699185051.png', 1, 'uploads/frontend-section/7681699185051.png', 'png', '80481', NULL, NULL, '2023-11-05 11:50:51', '2023-11-05 11:50:51'),
(85, 'image/png', 'public', 'Group 1000008102 (1).png', '3091699185077.png', 1, 'uploads/frontend-section/3091699185077.png', 'png', '944791', NULL, NULL, '2023-11-05 11:51:17', '2023-11-05 11:51:17'),
(86, 'image/png', 'public', '631698921829.png', '1501699194785.png', 1, 'uploads/Setting/1501699194785.png', 'png', '2886', NULL, NULL, '2023-11-05 14:33:05', '2023-11-05 14:33:05'),
(87, 'image/png', 'public', '2361698904254.png', '2641699194785.png', 1, 'uploads/Setting/2641699194785.png', 'png', '2376', NULL, NULL, '2023-11-05 14:33:05', '2023-11-05 14:33:05'),
(88, 'image/png', 'public', '7701699161237.png', '2741699194882.png', 1, 'uploads/frontend-section/2741699194882.png', 'png', '944791', NULL, NULL, '2023-11-05 14:34:42', '2023-11-05 14:34:42'),
(89, 'image/png', 'public', '7701699161237.png', '271699194884.png', 1, 'uploads/frontend-section/271699194884.png', 'png', '944791', NULL, NULL, '2023-11-05 14:34:44', '2023-11-05 14:34:44'),
(90, 'image/png', 'public', '7701699161237.png', '7581699194886.png', 1, 'uploads/frontend-section/7581699194886.png', 'png', '944791', NULL, NULL, '2023-11-05 14:34:46', '2023-11-05 14:34:46'),
(91, 'image/png', 'public', '1171698848475.png', '2471699194958.png', 1, 'uploads/Package/2471699194958.png', 'png', '4467', NULL, NULL, '2023-11-05 14:35:58', '2023-11-05 14:35:58'),
(93, 'image/png', 'public', 'features-img-1.png', '2231700489547.png', 16, 'uploads/Order/2231700489547.png', 'png', '740295', NULL, NULL, '2023-11-20 14:12:27', '2023-11-20 14:12:27'),
(94, 'image/png', 'public', 'features-img-1.png', '1631700489610.png', 16, 'uploads/Order/1631700489610.png', 'png', '740295', NULL, NULL, '2023-11-20 14:13:30', '2023-11-20 14:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_sections`
--

DROP TABLE IF EXISTS `frontend_sections`;
CREATE TABLE `frontend_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_title` text COLLATE utf8mb4_unicode_ci,
  `title` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_page_title` tinyint DEFAULT NULL,
  `has_banner_image` tinyint NOT NULL DEFAULT '0',
  `has_image` tinyint NOT NULL DEFAULT '0',
  `has_description` tinyint NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `banner_image` int DEFAULT NULL,
  `image` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontend_sections`
--

INSERT INTO `frontend_sections` (`id`, `name`, `page_title`, `title`, `slug`, `has_page_title`, `has_banner_image`, `has_image`, `has_description`, `description`, `banner_image`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hero Banner', '', 'Business Potential with Subscription & Billing management Laravel Script.', 'hero_banner', 0, 1, 1, 1, 'Our Subscription and Billing Management Script simplifies the management of recurring payments, automates invoicing, tracks customer subscriptions, and ensures seamless financial control for businesses of all sizes.', 24, 90, 1, '2023-11-01 13:13:43', '2023-11-05 14:34:46', NULL),
(2, 'Core Features', 'Core Features', 'Feature fusion: your all-in-one solution', 'core_features', 1, 0, 0, 0, NULL, NULL, NULL, 1, '2023-11-01 13:13:43', '2023-11-02 06:44:13', NULL),
(3, 'Best Features', 'Best Features', 'features that you will get after getting started.', 'best_features', 1, 0, 0, 0, 'Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque. Ante in nibh mauris cursus mattis molestie. Sagittis vitae et leo duis ut. Lobortis scelerisque fermentum.', NULL, NULL, 1, '2023-11-01 13:13:43', '2023-11-01 13:13:43', NULL),
(4, 'Pricing Plan', 'Pricing Plan', 'Pick the plan that\'s right for your business.', 'pricing_plan', 1, 0, 0, 0, 'Welcome to the future of revenue management! Our subscription billing software is here to transform the way you handle billing and drive your future business to new heights.', NULL, NULL, 1, '2023-11-01 13:13:43', '2023-11-01 13:13:43', NULL),
(5, 'Product Services', 'Product Services', 'Collect Payments for Your Products and Services.', 'product_services', 1, 0, 1, 0, NULL, NULL, 43, 1, '2023-11-01 13:13:43', '2023-11-01 14:33:29', NULL),
(6, 'Integrations Menu', 'Integrations', 'make Seamless Integration with some of best apps.', 'integrations_menu', 1, 0, 1, 1, 'Zaisub\'s subscription management software is a game-changer, streamlining our subscription processes with its user-friendly interface. Its scalability ensures it can grow with our business, making it an invaluable asset.', NULL, 44, 1, '2023-11-01 13:13:43', '2023-11-02 11:00:46', NULL),
(7, 'Testimonials Area', 'Testimonials', 'What Our Clients have Saying About Us.', 'testimonials_area', 1, 0, 0, 1, 'Zaisub\'s subscription management software is a game-changer, streamlining our subscription processes with its user-friendly interface. Its scalability ensures it can grow with our business, making it an invaluable asset.', NULL, NULL, 1, '2023-11-01 13:13:43', '2023-11-02 11:00:37', NULL),
(8, 'Faq\'s Area', 'FAQ\'S', 'Most common question about saas services.', 'faqs_area', 1, 0, 0, 1, 'Zaisub\'s subscription management software is a game-changer, streamlining our subscription processes with its user-friendly interface. Its scalability ensures it can grow with our business, making it an invaluable asset.', NULL, NULL, 1, '2023-11-01 13:13:43', '2023-11-02 11:00:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=Active,0=Disable',
  `mode` tinyint NOT NULL DEFAULT '2' COMMENT '1=live,2=sandbox',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'client id, public key, key, store id, api key',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'client secret, secret, store password, auth token',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `user_id`, `title`, `slug`, `image`, `status`, `mode`, `url`, `key`, `secret`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Paypal', 'paypal', 'assets/images/gateway-icon/paypal.png', 1, 2, '', '', '', NULL, NULL, NULL),
(2, 1, 'Stripe', 'stripe', 'assets/images/gateway-icon/stripe.png', 1, 2, '', '', '', NULL, NULL, NULL),
(3, 1, 'Razorpay', 'razorpay', 'assets/images/gateway-icon/razorpay.png', 1, 2, '', '', '', NULL, NULL, NULL),
(4, 1, 'Instamojo', 'instamojo', 'assets/images/gateway-icon/instamojo.png', 1, 2, '', '', '', NULL, NULL, NULL),
(5, 1, 'Mollie', 'mollie', 'assets/images/gateway-icon/mollie.png', 1, 2, '', '', '', NULL, NULL, NULL),
(6, 1, 'Paystack', 'paystack', 'assets/images/gateway-icon/paystack.png', 1, 2, '', '', '', NULL, NULL, NULL),
(7, 1, 'Sslcommerz', 'sslcommerz', 'assets/images/gateway-icon/sslcommerz.png', 1, 2, '', '', '', NULL, NULL, NULL),
(8, 1, 'Flutterwave', 'flutterwave', 'assets/images/gateway-icon/flutterwave.png', 1, 2, '', '', '', NULL, NULL, NULL),
(9, 1, 'Mercadopago', 'mercadopago', 'assets/images/gateway-icon/mercadopago.png', 1, 2, '', '', '', NULL, NULL, NULL),
(10, 1, 'Bank', 'bank', 'assets/images/gateway-icon/bank.png', 1, 2, '', '', '', NULL, NULL, NULL),
(11, 1, 'Cash', 'cash', 'assets/images/gateway-icon/cash.png', 1, 2, '', '', '', NULL, NULL, NULL),
(12, 2, 'Paypal', 'paypal', 'assets/images/gateway-icon/paypal.png', 1, 2, '', '', '', NULL, NULL, NULL),
(13, 2, 'Stripe', 'stripe', 'assets/images/gateway-icon/stripe.png', 1, 2, '', '', '', NULL, NULL, NULL),
(14, 2, 'Razorpay', 'razorpay', 'assets/images/gateway-icon/razorpay.png', 1, 2, '', '', '', NULL, NULL, NULL),
(15, 2, 'Instamojo', 'instamojo', 'assets/images/gateway-icon/instamojo.png', 1, 2, '', '', '', NULL, NULL, NULL),
(16, 2, 'Mollie', 'mollie', 'assets/images/gateway-icon/mollie.png', 1, 2, '', '', '', NULL, NULL, NULL),
(17, 2, 'Paystack', 'paystack', 'assets/images/gateway-icon/paystack.png', 1, 2, '', '', '', NULL, NULL, NULL),
(18, 2, 'Sslcommerz', 'sslcommerz', 'assets/images/gateway-icon/sslcommerz.png', 1, 2, '', '', '', NULL, NULL, NULL),
(19, 2, 'Flutterwave', 'flutterwave', 'assets/images/gateway-icon/flutterwave.png', 1, 2, '', '', '', NULL, NULL, NULL),
(20, 2, 'Mercadopago', 'mercadopago', 'assets/images/gateway-icon/mercadopago.png', 1, 2, '', '', '', NULL, NULL, NULL),
(21, 2, 'Bank', 'bank', 'assets/images/gateway-icon/bank.png', 1, 2, '', '', '', NULL, NULL, NULL),
(22, 2, 'Cash', 'cash', 'assets/images/gateway-icon/cash.png', 1, 2, '', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

DROP TABLE IF EXISTS `gateway_currencies`;
CREATE TABLE `gateway_currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `gateway_id` bigint UNSIGNED NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `conversion_rate` decimal(8,2) NOT NULL DEFAULT '1.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `user_id`, `gateway_id`, `currency`, `conversion_rate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'USD', 1.00, NULL, NULL, NULL),
(2, 1, 2, 'USD', 1.00, NULL, NULL, NULL),
(3, 1, 3, 'INR', 80.00, NULL, NULL, NULL),
(4, 1, 4, 'INR', 80.00, NULL, NULL, NULL),
(5, 1, 5, 'USD', 1.00, NULL, NULL, NULL),
(6, 1, 6, 'NGN', 464.00, NULL, NULL, NULL),
(7, 1, 7, 'BDT', 100.00, NULL, NULL, NULL),
(8, 1, 8, 'NGN', 464.00, NULL, NULL, NULL),
(9, 1, 9, 'BRL', 5.00, NULL, NULL, NULL),
(10, 1, 10, 'USD', 1.00, NULL, NULL, NULL),
(11, 1, 11, 'USD', 1.00, NULL, NULL, NULL),
(12, 2, 1, 'USD', 1.00, NULL, NULL, NULL),
(13, 2, 2, 'USD', 1.00, NULL, NULL, NULL),
(14, 2, 3, 'INR', 80.00, NULL, NULL, NULL),
(15, 2, 4, 'INR', 80.00, NULL, NULL, NULL),
(16, 2, 5, 'USD', 1.00, NULL, NULL, NULL),
(17, 2, 6, 'NGN', 464.00, NULL, NULL, NULL),
(18, 2, 7, 'BDT', 100.00, NULL, NULL, NULL),
(19, 2, 8, 'NGN', 464.00, NULL, NULL, NULL),
(20, 2, 9, 'BRL', 5.00, NULL, NULL, NULL),
(21, 2, 10, 'USD', 1.00, NULL, NULL, NULL),
(22, 2, 11, 'USD', 1.00, NULL, NULL, NULL),
(23, 2, 21, 'AFA', 1.00, '2023-11-20 14:08:27', '2023-11-20 14:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `customer_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `invoice_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `plan_id` int NOT NULL DEFAULT '0',
  `coupon_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_id` int NOT NULL DEFAULT '0',
  `due_date` datetime NOT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) NOT NULL DEFAULT '0.00',
  `setup_fees` decimal(12,2) NOT NULL DEFAULT '0.00',
  `shipping_charge` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_mailed` tinyint NOT NULL DEFAULT '0',
  `is_recurring` tinyint NOT NULL DEFAULT '0',
  `payment_status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `customer_id`, `invoice_id`, `product_id`, `plan_id`, `coupon_id`, `subscription_id`, `due_date`, `coupon_code`, `amount`, `tax`, `setup_fees`, `shipping_charge`, `is_mailed`, `is_recurring`, `payment_status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Inv-000001', 1, 1, NULL, 1, '2023-11-16 00:00:00', NULL, 60.00, 0.00, 0.00, 0.00, 0, 0, 1, NULL, '2023-10-17 14:19:57', '2023-10-17 14:20:56'),
(2, 2, 4, 'Inv-000002', 1, 1, NULL, 2, '2023-11-16 00:00:00', NULL, 60.00, 0.00, 0.00, 0.00, 0, 0, 1, NULL, '2023-10-17 14:43:05', '2023-10-17 14:55:54'),
(3, 2, 5, 'Inv-000003', 5, 16, NULL, 3, '2023-10-19 00:00:00', NULL, 380.00, 0.00, 0.00, 11.00, 0, 0, 1, NULL, '2023-10-17 14:54:44', '2023-10-17 14:55:04'),
(4, 2, 6, 'Inv-000004', 5, 16, NULL, 4, '2023-10-20 00:00:00', NULL, 380.00, 0.00, 0.00, 11.00, 0, 0, 2, NULL, '2023-10-18 06:01:48', '2023-10-18 06:12:09'),
(5, 2, 7, 'Inv-000005', 5, 16, NULL, 5, '2023-10-20 00:00:00', NULL, 380.00, 0.00, 0.00, 11.00, 0, 0, 0, NULL, '2023-10-18 06:11:36', '2023-10-18 06:11:36'),
(6, 2, 8, 'Inv-000006', 1, 2, NULL, 6, '2023-12-17 00:00:00', NULL, 120.00, 0.00, 0.00, 0.00, 0, 0, 1, NULL, '2023-10-18 11:31:11', '2023-10-18 11:43:14'),
(8, 2, 10, 'Inv-000008', 1, 2, NULL, 8, '2023-12-17 00:00:00', NULL, 120.00, 0.00, 0.00, 0.00, 0, 0, 1, NULL, '2023-10-18 11:35:56', '2023-10-18 11:36:42'),
(9, 2, 11, 'Inv-000009', 1, 7, NULL, 9, '2023-10-20 00:00:00', NULL, 180.00, 0.00, 0.00, 3.00, 0, 1, 1, NULL, '2023-10-18 11:37:55', '2023-10-18 11:43:02'),
(10, 2, 12, 'Inv-000010', 4, 14, NULL, 10, '2023-11-12 00:00:00', NULL, 350.00, 0.00, 0.00, 21.00, 0, 0, 1, NULL, '2023-10-18 11:42:06', '2023-10-18 11:42:51'),
(11, 2, 13, 'Inv-000011', 5, 16, NULL, 11, '2023-10-23 00:00:00', NULL, 380.00, 0.00, 0.00, 11.00, 0, 0, 0, NULL, '2023-10-21 12:06:07', '2023-10-21 12:06:07'),
(12, 2, 14, 'Inv-000012', 5, 15, NULL, 12, '2023-11-14 00:00:00', NULL, 250.00, 0.00, 0.00, 2.00, 0, 0, 1, NULL, '2023-10-21 12:11:31', '2023-10-21 12:11:49'),
(13, 2, 15, 'Inv-000013', 5, 6, NULL, 13, '2024-02-21 00:00:00', NULL, 120.00, 0.00, 0.00, 32.00, 0, 1, 2, NULL, '2023-10-21 12:15:04', '2023-10-21 12:15:37'),
(14, 2, 17, 'Inv-000014', 1, 1, NULL, 14, '2023-12-20 00:00:00', NULL, 60.00, 0.00, 0.00, 0.00, 0, 0, 1, NULL, '2023-11-20 14:12:27', '2023-11-20 14:12:47'),
(15, 2, 18, 'Inv-000015', 1, 1, NULL, 15, '2023-12-20 00:00:00', NULL, 60.00, 0.00, 0.00, 0.00, 0, 0, 1, NULL, '2023-11-20 14:13:30', '2023-11-20 14:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_settings`
--

DROP TABLE IF EXISTS `invoice_settings`;
CREATE TABLE `invoice_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `type` tinyint NOT NULL DEFAULT '1',
  `logo` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_one` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `info_two` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `info_three` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `column` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_settings`
--

INSERT INTO `invoice_settings` (`id`, `user_id`, `type`, `logo`, `title`, `company_info`, `prefix`, `info_one`, `info_two`, `info_three`, `footer_text`, `column`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 7, 'Invoice', '<p style=\"color: rgb(89, 102, 128); font-family: &quot;inter tight&quot;, sans-serif; text-align: justify;\"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Zaisub Company</span></font></p><p style=\"color: rgb(89, 102, 128); font-family: &quot;inter tight&quot;, sans-serif; text-align: justify;\"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">379, Attorney Express</span></font></p><p style=\"color: rgb(89, 102, 128); font-family: &quot;inter tight&quot;, sans-serif; text-align: justify;\"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">West Lilliana, Bilzen.</span></font></p><p style=\"color: rgb(89, 102, 128); font-family: &quot;inter tight&quot;, sans-serif; text-align: justify;\"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Phone: 01234567890</span></font></p>', 'Inv-', '<div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><strong>Billing</strong></div><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">{{customer_name}}</div><div style=\"\"><font face=\"Verdana, Arial, Helvetica, sans-serif\">{{customer_email}}</font><br></div><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">Address : {{billing_address}}</div><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">{{billing_city}}, {{billing_state}} {{billing_zip}}</div><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">{{billing_country}}</div>', '<div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><br></div>', '<p><b>Shipping</b></p><p>{{customer_name}}</p><p>{{customer_email}}</p><p>Address : {{shipping_address}}</p><p>{{shipping_city}}, {{shipping_state}} {{shipping_zip}}</p><p>{{shipping_country}}</p>', '<p><font face=\"Verdana, Arial, Helvetica, sans-serif\">{{total}} was paid on {{payment_date}}</font><br></p>', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', '2023-10-16 13:56:27', '2023-10-17 14:36:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_id` bigint UNSIGNED DEFAULT NULL,
  `font` bigint UNSIGNED DEFAULT NULL,
  `rtl` tinyint DEFAULT '4',
  `status` tinyint NOT NULL DEFAULT '1',
  `default` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `iso_code`, `flag_id`, `font`, `rtl`, `status`, `default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'en', 9, NULL, 0, 1, 0, '2023-10-16 06:33:46', '2023-10-17 13:14:01', NULL),
(2, 'Bangla', 'bn', 10, NULL, 0, 1, 6, '2023-10-17 13:14:28', '2023-10-17 13:14:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_plan` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `user_id` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `licence` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `product_id`, `name`, `code`, `product_plan`, `status`, `user_id`, `deleted_at`, `created_at`, `updated_at`, `licence`) VALUES
(1, 1, 'SHSS-1', 'SHSS-89', 1, 1, 2, NULL, '2023-10-17 12:47:45', '2023-10-17 12:47:45', NULL),
(2, 1, 'SHSS-2', 'SHS-98', 2, 1, 2, NULL, '2023-10-17 12:48:41', '2023-10-17 12:50:01', NULL),
(3, 1, 'SHSS-3', 'SHSS-123', 7, 1, 2, NULL, '2023-10-17 12:49:38', '2023-10-17 12:49:38', NULL),
(4, 2, 'HIS-1', 'HIS-11', 8, 1, 2, NULL, '2023-10-17 12:50:43', '2023-10-17 12:50:43', NULL),
(5, 2, 'HIS-2', 'HIS-22', 9, 1, 2, NULL, '2023-10-17 12:51:07', '2023-10-17 12:51:07', NULL),
(6, 2, 'HIS-3', 'HIS-33', 11, 1, 2, NULL, '2023-10-17 12:51:27', '2023-10-17 12:51:27', NULL),
(7, 3, 'MKDS-1', 'MKDS-11', 4, 1, 2, NULL, '2023-10-17 12:52:10', '2023-10-17 12:52:10', NULL),
(8, 3, 'MKDS-2', 'MKDS-22', 10, 1, 2, NULL, '2023-10-17 12:52:34', '2023-10-17 12:52:34', NULL),
(9, 3, 'MKDS-3', 'MKDS-33', 12, 1, 2, NULL, '2023-10-17 12:52:55', '2023-10-17 12:52:55', NULL),
(10, 4, 'FSA-1', 'FSA-11', 5, 1, 2, NULL, '2023-10-17 12:53:30', '2023-10-17 12:53:30', NULL),
(11, 4, 'FSA-2', 'FSA-22', 14, 1, 2, NULL, '2023-10-17 12:53:52', '2023-10-17 12:53:52', NULL),
(12, 5, 'WHS-1', 'WHS-86', 6, 1, 2, NULL, '2023-10-17 12:57:27', '2023-10-17 12:57:27', NULL),
(13, 5, 'WHS-3', 'WHS-76', 16, 1, 2, NULL, '2023-10-17 12:58:25', '2023-10-17 12:58:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mail_histories`
--

DROP TABLE IF EXISTS `mail_histories`;
CREATE TABLE `mail_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `error` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
CREATE TABLE `metas` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keyword` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_06_23_121213_create_settings_table', 1),
(7, '2022_06_25_104329_create_countries_table', 1),
(8, '2022_06_25_110824_create_currencies_table', 1),
(9, '2022_06_25_111037_create_languages_table', 1),
(10, '2022_11_30_040739_create_gateways_table', 1),
(11, '2023_01_03_075827_create_gateway_currencies_table', 1),
(12, '2023_01_05_092212_create_file_managers_table', 1),
(13, '2023_01_07_120244_create_banks_table', 1),
(14, '2023_01_30_071830_create_payments_table', 1),
(15, '2023_05_29_125747_create_contact_messages_table', 1),
(16, '2023_07_09_100721_create_notifications_table', 1),
(17, '2023_07_20_052653_create_email_templates_table', 1),
(18, '2023_07_22_111528_database_backups_table', 1),
(19, '2023_07_22_111738_database_backup_cron_settings_table', 1),
(20, '2023_08_07_062359_create_authentication_log_table', 1),
(21, '2023_08_26_075204_create_metas_table', 1),
(22, '2023_09_05_090819_create_notification_seens_table', 1),
(23, '2023_09_26_055112_create_products_table', 1),
(24, '2023_09_26_093327_create_subscriptions_table', 1),
(25, '2023_09_26_112059_create_user_details_table', 1),
(26, '2023_09_26_132437_create_plans_table', 1),
(27, '2023_09_27_071617_create_mail_histories_table', 1),
(28, '2023_09_27_114312_create_checkout_page_settings_table', 1),
(29, '2023_10_01_093154_create_coupons_table', 1),
(30, '2023_10_01_110337_create_orders_table', 1),
(31, '2023_10_02_055452_create_invoices_table', 1),
(32, '2023_10_02_070636_create_licenses_table', 1),
(33, '2023_10_04_065739_create_tax_settings_table', 1),
(34, '2023_10_05_105255_create_webhooks_table', 1),
(35, '2023_10_08_074534_create_webhook_events_table', 1),
(36, '2023_10_10_160043_create_invoice_settings_table', 1),
(37, '2023_10_23_093637_create_packages_table', 2),
(38, '2023_10_23_094232_create_user_packages_table', 2),
(39, '2023_10_23_105532_create_subscription_orders_table', 2),
(40, '2023_10_25_075216_create_frontend_sections_table', 2),
(41, '2023_10_25_125314_create_features_settings_table', 2),
(42, '2023_10_26_110108_create_best_features_settings_table', 2),
(43, '2023_10_26_122659_create_testimonials_table', 2),
(44, '2023_10_26_124142_create_faqs_table', 2),
(45, '2023_10_31_063626_add_dependency_field_for_saas', 2),
(46, '2023_11_13_130122_add_dependency_field_for_affiliate', 3),
(47, '2023_11_15_054606_create_affiliate_configs_table', 3),
(48, '2023_11_18_112911_create_affiliate_histories_table', 3),
(49, '2023_11_19_061425_create_beneficiaries_table', 3),
(50, '2023_11_19_061522_create_withdraws_table', 3),
(51, '2023_11_19_062635_create_transactions_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `view_status` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `body`, `link`, `view_status`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Have a new checkout', 'Order Id: 652e980dd5d11', NULL, 0, 1, NULL, '2023-10-17 14:20:56', '2023-10-17 14:20:56'),
(2, 2, 'Have a new checkout', 'Order Id: 652ea034e2276', NULL, 0, 1, NULL, '2023-10-17 14:55:04', '2023-10-17 14:55:04'),
(3, 2, 'Have a new checkout', 'Order Id: 652e9d79464c8', NULL, 0, 1, NULL, '2023-10-17 14:55:54', '2023-10-17 14:55:54'),
(4, 2, 'Have a new checkout', 'Order Id: 652fc31c1297e', NULL, 0, 1, NULL, '2023-10-18 11:36:42', '2023-10-18 11:36:42'),
(5, 2, 'Have a new checkout', 'Order Id: 652fc48eeeb31', NULL, 0, 1, NULL, '2023-10-18 11:42:51', '2023-10-18 11:42:51'),
(6, 2, 'Have a new checkout', 'Order Id: 652fc3932cd80', NULL, 0, 1, NULL, '2023-10-18 11:43:02', '2023-10-18 11:43:02'),
(7, 2, 'Have a new checkout', 'Order Id: 652fc1ffe49dd', NULL, 0, 1, NULL, '2023-10-18 11:43:14', '2023-10-18 11:43:14'),
(8, 2, 'Have a new checkout', 'Order Id: 6533bff33a388', NULL, 0, 1, NULL, '2023-10-21 12:11:49', '2023-10-21 12:11:49'),
(9, 2, 'Have a new checkout', 'Order Id: 655b694be9f26', NULL, 0, 1, NULL, '2023-11-20 14:12:47', '2023-11-20 14:12:47'),
(10, 2, 'Have a new checkout', 'Order Id: 655b698a4b7ee', NULL, 0, 1, NULL, '2023-11-20 14:13:39', '2023-11-20 14:13:39'),
(11, 16, 'New Withdraw Request Received', 'Withdrawal via beneficiary Bank', NULL, 0, 1, NULL, '2023-11-20 14:14:45', '2023-11-20 14:14:45'),
(12, 16, 'New Withdraw Request Received', 'Withdrawal via beneficiary Bank', NULL, 0, 1, NULL, '2023-11-20 14:14:54', '2023-11-20 14:14:54'),
(13, 16, 'Withdrawal request approved', 'Withdrawal request approved Bank', NULL, 0, 1, NULL, '2023-11-20 14:15:13', '2023-11-20 14:15:13'),
(14, 16, 'Withdrawal disbursed', 'Withdrawal disbursed Bank', NULL, 0, 1, NULL, '2023-11-20 14:15:18', '2023-11-20 14:15:18'),
(15, 16, 'New Withdraw Request Received', 'Withdrawal via beneficiary Bank', NULL, 0, 1, NULL, '2023-11-20 14:15:35', '2023-11-20 14:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `notification_seens`
--

DROP TABLE IF EXISTS `notification_seens`;
CREATE TABLE `notification_seens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `notification_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_seens`
--

INSERT INTO `notification_seens` (`id`, `user_id`, `notification_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 3, NULL, '2023-10-18 05:32:08', '2023-10-18 05:32:08'),
(2, 2, 2, NULL, '2023-10-18 05:32:08', '2023-10-18 05:32:08'),
(3, 2, 1, NULL, '2023-10-18 05:32:08', '2023-10-18 05:32:08'),
(4, 2, 4, NULL, '2023-10-18 11:38:51', '2023-10-18 11:38:51'),
(5, 2, 7, NULL, '2023-10-19 17:49:52', '2023-10-19 17:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` tinyint DEFAULT NULL,
  `plan_id` bigint DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `gateway_id` bigint DEFAULT NULL,
  `subscription_id` bigint DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint NOT NULL DEFAULT '0',
  `shipping_cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `setup_fees` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_type` int NOT NULL DEFAULT '0',
  `conversion_rate` decimal(12,2) NOT NULL DEFAULT '0.00',
  `platform_charge` decimal(12,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `transaction_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '1',
  `delivery_status` tinyint NOT NULL DEFAULT '1',
  `system_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_deposit_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_deposit_slip_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `customer_id`, `product_id`, `transaction_id`, `payment_id`, `bank_id`, `plan_id`, `invoice_id`, `gateway_id`, `subscription_id`, `order_id`, `amount`, `discount`, `discount_type`, `shipping_cost`, `setup_fees`, `tax_amount`, `tax_type`, `conversion_rate`, `platform_charge`, `subtotal`, `total`, `transaction_amount`, `order_number`, `payment_status`, `delivery_status`, `system_currency`, `gateway_currency`, `bank_deposit_by`, `bank_deposit_slip_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, NULL, 'BNK652e980ddd676', 1, 1, 1, 10, 1, '652e980dd5d11', 60.00, 0.00, 1, 0.00, 0.00, 5.00, 1, 1.00, 0.00, 65.00, 65.00, 65.00, NULL, 1, 1, 'BDT', 'USD', 'Man joe', '11', NULL, '2023-10-17 14:19:57', '2023-10-17 14:20:56'),
(2, 2, 4, 1, NULL, 'BNK652e9d794f83f', 1, 1, 2, 10, 2, '652e9d79464c8', 60.00, 0.00, 1, 0.00, 0.00, 5.00, 1, 1.00, 0.00, 65.00, 65.00, 65.00, NULL, 1, 1, 'BDT', 'USD', 'Deo Cleveland', '12', NULL, '2023-10-17 14:43:05', '2023-10-17 14:55:54'),
(3, 2, 5, 5, NULL, 'BNK652ea034e6375', 1, 16, 3, 10, 3, '652ea034e2276', 380.00, 0.00, 1, 11.00, 0.00, 19.00, 2, 1.00, 0.00, 410.00, 410.00, 410.00, NULL, 1, 1, 'BDT', 'USD', 'Sarah Johnson', '13', NULL, '2023-10-17 14:54:44', '2023-10-17 14:55:04'),
(4, 2, 6, 5, NULL, 'BNK652f74cc75551', 1, 16, 4, 10, 4, '652f74cc6e84e', 380.00, 0.00, 1, 11.00, 0.00, 19.00, 2, 1.00, 0.00, 410.00, 410.00, 410.00, NULL, 2, 1, 'BDT', 'USD', 'Alma Burns', '14', NULL, '2023-10-18 06:01:48', '2023-10-18 06:12:09'),
(5, 2, 7, 5, NULL, 'BNK652f77186830c', 1, 16, 5, 10, 5, '652f771865ac8', 380.00, 0.00, 1, 11.00, 0.00, 19.00, 2, 1.00, 0.00, 410.00, 410.00, 410.00, NULL, 0, 1, 'BDT', 'USD', 'Nichole Rich', '15', NULL, '2023-10-18 06:11:36', '2023-10-18 06:11:36'),
(6, 2, 8, 1, NULL, 'BNK652fc1ffeb733', 1, 2, 6, 10, 6, '652fc1ffe49dd', 120.00, 0.00, 1, 0.00, 0.00, 6.00, 2, 1.00, 0.00, 126.00, 126.00, 126.00, NULL, 1, 1, 'BDT', 'USD', 'Nita Paul', '16', NULL, '2023-10-18 11:31:11', '2023-10-18 11:43:14'),
(8, 2, 10, 1, NULL, 'BNK652fc31c18eb5', 1, 2, 8, 10, 8, '652fc31c1297e', 120.00, 0.00, 1, 0.00, 0.00, 6.00, 2, 1.00, 0.00, 126.00, 126.00, 126.00, NULL, 1, 1, 'BDT', 'USD', 'James Mary', '17', NULL, '2023-10-18 11:35:56', '2023-10-18 11:36:42'),
(9, 2, 11, 1, NULL, 'BNK652fc3933410c', 1, 7, 9, 10, 9, '652fc3932cd80', 180.00, 0.00, 1, 3.00, 0.00, 5.00, 1, 1.00, 0.00, 188.00, 188.00, 188.00, NULL, 1, 1, 'BDT', 'USD', 'Ciara Byrd', '18', NULL, '2023-10-18 11:37:55', '2023-10-18 11:43:02'),
(10, 2, 12, 4, NULL, 'BNK652fc48f00996', 1, 14, 10, 10, 10, '652fc48eeeb31', 350.00, 0.00, 1, 21.00, 0.00, 17.50, 2, 1.00, 0.00, 388.50, 388.50, 388.50, NULL, 1, 1, 'BDT', 'USD', 'Mr John', '19', NULL, '2023-10-18 11:42:06', '2023-10-18 11:42:51'),
(11, 2, 13, 5, NULL, 'CAS6533beaf2beb9', NULL, 16, 11, 11, 11, '6533beaf2a7f7', 380.00, 0.00, 1, 11.00, 0.00, 19.00, 2, 1.00, 0.00, 410.00, 410.00, 410.00, NULL, 0, 1, 'BDT', 'USD', NULL, NULL, NULL, '2023-10-21 12:06:07', '2023-10-21 12:06:07'),
(12, 2, 14, 5, NULL, 'CAS6533bff33ba7e', NULL, 15, 12, 11, 12, '6533bff33a388', 250.00, 0.00, 1, 2.00, 0.00, 12.50, 2, 1.00, 0.00, 264.50, 264.50, 264.50, NULL, 1, 1, 'BDT', 'USD', NULL, NULL, NULL, '2023-10-21 12:11:31', '2023-10-21 12:11:49'),
(13, 2, 15, 5, NULL, 'CAS6533c0c85c949', NULL, 6, 13, 11, 13, '6533c0c85bd76', 120.00, 0.00, 1, 32.00, 0.00, 0.00, 1, 1.00, 0.00, 152.00, 152.00, 152.00, NULL, 2, 1, 'BDT', 'USD', NULL, NULL, NULL, '2023-10-21 12:15:04', '2023-10-21 12:15:37'),
(14, 2, 17, 1, NULL, 'BNK655b694beb9b4', 2, 1, 14, 21, 14, '655b694be9f26', 60.00, 0.00, 1, 0.00, 0.00, 5.00, 1, 1.00, 0.00, 65.00, 65.00, 65.00, NULL, 1, 1, 'BDT', 'AFA', 'sadik khan', '93', NULL, '2023-11-20 14:12:27', '2023-11-20 14:12:47'),
(15, 2, 18, 1, NULL, 'BNK655b698a4d335', 2, 1, 15, 21, 15, '655b698a4b7ee', 60.00, 0.00, 1, 0.00, 0.00, 5.00, 1, 1.00, 0.00, 65.00, 65.00, 65.00, NULL, 1, 1, 'BDT', 'AFA', 'Addurs Salam', '94', NULL, '2023-11-20 14:13:30', '2023-11-20 14:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_limit` int NOT NULL DEFAULT '-1',
  `product_limit` int NOT NULL DEFAULT '-1',
  `subscription_limit` int NOT NULL DEFAULT '-1',
  `icon_id` int DEFAULT NULL,
  `others` text COLLATE utf8mb4_unicode_ci,
  `monthly_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `yearly_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'active for 1 , deactivate for 0',
  `is_default` tinyint NOT NULL DEFAULT '0' COMMENT 'active for 1 , deactivate for 0',
  `is_trail` tinyint NOT NULL DEFAULT '0' COMMENT 'active for 1 , deactivate for 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `slug`, `customer_limit`, `product_limit`, `subscription_limit`, `icon_id`, `others`, `monthly_price`, `yearly_price`, `status`, `is_default`, `is_trail`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Basic plan', 'Basic-plan', 10, 10, 10, 91, '[\"24\\/7 Support\",\"0% Processing Fees\"]', 9.00, 90.00, 1, 0, 0, '2023-11-01 13:40:00', '2023-11-05 14:35:58', NULL),
(2, 'Standard plan', 'Standard-plan', 10, 10, 10, 41, '[\"24\\/7 Support\",\"0% Processing Fees\"]', 10.00, 100.00, 1, 1, 0, '2023-11-01 14:21:15', '2023-11-01 14:33:11', NULL),
(3, 'Premium plan', 'Premium-plan', -1, -1, -1, 40, '[\"24\\/7 Support\",\"0% Processing Fees\"]', 15.00, 150.00, 1, 0, 0, '2023-11-01 14:23:46', '2023-11-01 14:33:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentable_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_id` bigint UNSIGNED NOT NULL,
  `paymentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tnxId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `bank_id` bigint UNSIGNED DEFAULT NULL,
  `deposit_slip` int DEFAULT NULL,
  `sub_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) NOT NULL DEFAULT '0.00',
  `system_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `grand_total_with_conversation_rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `grand_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `payment_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gateway_callback_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_time` datetime DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_day` int NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `billing_cycle` tinyint NOT NULL DEFAULT '0',
  `shipping_charge` bigint UNSIGNED NOT NULL DEFAULT '0',
  `bill` int NOT NULL DEFAULT '0',
  `duration` tinyint NOT NULL DEFAULT '0',
  `number_of_recurring_cycle` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `free_trail` int NOT NULL DEFAULT '0',
  `setup_fee` decimal(9,2) NOT NULL DEFAULT '0.00',
  `user_id` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `product_id`, `name`, `code`, `due_day`, `price`, `billing_cycle`, `shipping_charge`, `bill`, `duration`, `number_of_recurring_cycle`, `status`, `free_trail`, `setup_fee`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basic Plan', 'X Pro', 30, 60.00, 1, 0, 0, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-16 14:07:40', '2023-10-17 12:31:21'),
(2, 1, 'Premium Plan', 'Elite Plan', 60, 120.00, 1, 0, 1, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-16 14:10:31', '2023-10-17 13:08:21'),
(3, 2, 'Fiber Gigabit Plan', '131331', 45, 22.00, 1, 21, 0, 1, 0, 1, 0, 0.00, 2, '2023-10-17 12:39:49', '2023-10-16 14:23:27', '2023-10-17 12:39:49'),
(4, 3, 'Starter Plan', 'OIU904', 199, 90.00, 1, 21, 0, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-16 14:25:44', '2023-10-17 13:10:52'),
(5, 4, 'Budget Plan', 'INN786', 233, 150.00, 3, 12, 3, 1, 6, 1, 0, 0.00, 2, NULL, '2023-10-16 14:27:43', '2023-10-17 13:11:42'),
(6, 5, 'Shared Hosting Plan', 'NEX765', 123, 120.00, 2, 32, 2, 2, 0, 1, 0, 0.00, 2, NULL, '2023-10-16 14:29:56', '2023-10-17 13:12:27'),
(7, 1, 'Ultimate Plan', 'Ultimate Plan', 2, 180.00, 3, 3, 0, 1, 805, 1, 0, 0.00, 2, NULL, '2023-10-17 12:32:13', '2023-10-17 13:08:34'),
(8, 2, 'Basic Plan', 'INNO-89', 15, 120.00, 2, 13, 0, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-17 12:36:29', '2023-10-17 13:09:15'),
(9, 2, 'High-Speed Plan', 'KKOR_90', 10, 180.00, 2, 23, 1, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-17 12:37:06', '2023-10-17 13:09:26'),
(10, 3, 'Gourmet Plan', 'OORC-1', 18, 140.00, 3, 2, 0, 2, 479, 1, 0, 0.00, 2, NULL, '2023-10-17 12:38:35', '2023-10-17 13:11:03'),
(11, 2, 'Vegetarian Plan', 'TTER-28', 1, 240.00, 2, 18, 0, 2, 0, 1, 0, 0.00, 2, NULL, '2023-10-17 12:38:57', '2023-10-17 13:09:34'),
(12, 3, 'Vegetarian Plan', 'URYR-69', 22, 200.00, 3, 27, 0, 1, 270, 1, 0, 0.00, 2, NULL, '2023-10-17 12:42:03', '2023-10-17 13:11:08'),
(13, 4, 'Mid-Range Plan', 'HFHDU-21', 5, 250.00, 3, 6, 0, 2, 584, 1, 0, 0.00, 2, NULL, '2023-10-17 12:43:25', '2023-10-17 13:11:52'),
(14, 4, 'Flagship Plan', 'TEHSK-65', 25, 350.00, 1, 21, 0, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-17 12:43:50', '2023-10-17 13:11:59'),
(15, 5, 'VPS Hosting Plan', 'GHEDJHD-90', 24, 250.00, 1, 2, 0, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-17 12:46:16', '2023-10-17 13:12:36'),
(16, 5, 'Dedicated Server Plan', 'URIS-43', 2, 380.00, 1, 11, 0, 1, 0, 1, 0, 0.00, 2, NULL, '2023-10-17 12:46:43', '2023-10-17 13:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `status`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Smart Home Security System', 'Additionally, the name should reflect the nature and branding of your specific product or service.', 1, 2, NULL, '2023-10-16 14:05:52', '2023-10-17 12:29:19'),
(2, 'Home Internet Service', 'Feel free to provide more information about your product or the type of name you\'re looking for, and I can offer additional suggestions based on your specific needs.', 1, 2, NULL, '2023-10-16 14:12:19', '2023-10-17 12:34:55'),
(3, 'Meal Kit Delivery Service', 'Feel free to provide more information about your product or the type of name you\'re looking for, and I can offer additional suggestions based on your specific needs.', 1, 2, NULL, '2023-10-16 14:12:47', '2023-10-17 12:29:51'),
(4, 'Fitness Subscription App', 'Feel free to provide more information about your product or the type of name you\'re looking for, and I can offer additional suggestions based on your specific needs.', 1, 2, NULL, '2023-10-16 14:13:16', '2023-10-17 12:30:04'),
(5, 'Web Hosting Service', 'Feel free to provide more information about your product or the type of name you\'re looking for, and I can offer additional suggestions based on your specific needs.', 1, 2, NULL, '2023-10-16 14:13:40', '2023-10-17 12:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `option_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `option_key`, `option_value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'build_version', '5', NULL, '2023-10-16 06:33:46', '2023-11-20 11:06:58'),
(2, 'current_version', '3.1', NULL, '2023-10-16 06:33:46', '2023-11-20 11:06:58'),
(3, 'app_color_design_type', '1', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(4, 'app_primary_color', '#ff671b', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(5, 'app_secondary_color', '#111111', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(6, 'app_text_color', '#585858', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(7, 'app_section_bg_color', '#fffaf7', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(8, 'app_hero_bg_color1', '#000000', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(9, 'app_hero_bg_color2', '#000000', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(10, 'app_hero_bg_color', NULL, NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(11, 'app_preloader', '1', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(12, 'app_logo', '86', NULL, '2023-10-16 13:33:03', '2023-11-05 14:33:05'),
(13, 'app_fav_icon', '3', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(14, 'login_left_image', '4', NULL, '2023-10-16 13:33:03', '2023-10-16 13:33:03'),
(15, 'app_name', 'Zaisub', NULL, '2023-10-17 12:03:37', '2023-10-17 12:03:37'),
(16, 'app_email', 'zaisub@zainikthemes.com', NULL, '2023-10-17 12:03:37', '2023-10-17 12:03:37'),
(17, 'app_contact_number', '12345678', NULL, '2023-10-17 12:03:37', '2023-10-17 12:03:37'),
(18, 'app_location', '123 Main St, New York, NY 10001', NULL, '2023-10-17 12:03:37', '2023-10-17 12:03:37'),
(19, 'app_copyright', '© 2023 Zaisub. All Rights Reserved', NULL, '2023-10-17 12:03:37', '2023-10-17 12:03:37'),
(20, 'app_developed', 'Zainik Lab', NULL, '2023-10-17 12:03:37', '2023-10-17 12:03:37'),
(21, 'app_timezone', 'UTC', NULL, '2023-10-17 12:03:37', '2023-10-17 12:03:37'),
(22, 'google_analytics_status', '1', NULL, '2023-10-17 12:04:02', '2023-10-17 12:04:02'),
(23, 'google_analytics_tracking_id', 'G-V0Y0S2JTPL', NULL, '2023-10-17 12:15:39', '2023-10-17 12:15:39'),
(24, 'show_language_switcher', '1', NULL, '2023-10-17 13:14:42', '2023-10-17 13:14:42'),
(25, 'cookie_status', '1', NULL, '2023-10-18 13:40:55', '2023-10-21 13:06:48'),
(26, 'cookie_consent_text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', NULL, '2023-10-21 13:05:20', '2023-10-21 13:05:20'),
(27, 'app_preloader_status', '1', NULL, '2023-10-21 13:20:58', '2023-10-21 13:20:58'),
(28, 'app_debug', '1', NULL, '2023-10-21 13:21:36', '2023-10-21 13:21:36'),
(29, 'SUBSAAS_build_version', '1', NULL, '2023-11-05 13:52:51', '2023-11-05 13:52:51'),
(30, 'SUBSAAS_current_version', '1.0', NULL, '2023-11-05 13:52:51', '2023-11-05 13:52:51'),
(31, 'app_logo_white', '87', NULL, '2023-11-05 14:33:05', '2023-11-05 14:33:05'),
(32, 'frontend_status', '1', NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(33, 'registration_status', '1', NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(34, 'meta_keyword', NULL, NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(35, 'meta_author', NULL, NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(36, 'meta_description', NULL, NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(37, 'social_media_facebook', NULL, NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(38, 'social_media_twitter', NULL, NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(39, 'social_media_linkedin', NULL, NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(40, 'social_media_skype', NULL, NULL, '2023-11-05 14:34:02', '2023-11-05 14:34:02'),
(41, 'app_footer_text', 'Our subscription and billing management software project aimed to streamline our business operations. The software offers comprehensive features, including automated billing, customization, and seamless integration with existing systems.', NULL, '2023-11-05 14:37:44', '2023-11-05 14:37:44'),
(42, 'develop_by', 'zainiklab', NULL, '2023-11-05 14:37:44', '2023-11-05 14:38:06'),
(43, 'affiliate_status', '1', NULL, '2023-11-20 11:07:43', '2023-11-20 11:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `subscription_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `due_day` int NOT NULL DEFAULT '0',
  `amount` decimal(12,2) NOT NULL,
  `free_trail` int NOT NULL DEFAULT '0',
  `setup_fee` decimal(9,2) NOT NULL DEFAULT '0.00',
  `billing_cycle` tinyint NOT NULL DEFAULT '0',
  `bill` int NOT NULL DEFAULT '1',
  `duration` tinyint NOT NULL DEFAULT '0',
  `number_of_recurring_cycle` int NOT NULL DEFAULT '0',
  `shipping_charge` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affiliate_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `product_id`, `plan_id`, `subscription_id`, `user_id`, `customer_id`, `start_date`, `end_date`, `due_day`, `amount`, `free_trail`, `setup_fee`, `billing_cycle`, `bill`, `duration`, `number_of_recurring_cycle`, `shipping_charge`, `status`, `deleted_at`, `created_at`, `updated_at`, `affiliate_code`) VALUES
(1, 1, 1, '652e980dd2d97', 2, 3, '2023-10-17', '2024-10-16', 30, 60.00, 0, 0.00, 1, 0, 1, 0, 0.00, 1, NULL, '2023-10-17 14:19:57', '2023-10-17 14:20:56', NULL),
(2, 1, 1, '652e9d79439e4', 2, 4, '2023-10-17', '2024-10-16', 30, 60.00, 0, 0.00, 1, 0, 1, 0, 0.00, 1, NULL, '2023-10-17 14:43:05', '2023-10-17 14:55:54', NULL),
(3, 5, 16, '652ea034dfa70', 2, 5, '2023-10-17', '2024-10-16', 2, 380.00, 0, 0.00, 1, 0, 1, 0, 11.00, 1, NULL, '2023-10-17 14:54:44', '2023-10-17 14:55:04', NULL),
(4, 5, 16, '652f74cc66a90', 2, 6, '2023-10-18', NULL, 2, 380.00, 0, 0.00, 1, 0, 1, 0, 11.00, 2, NULL, '2023-10-18 06:01:48', '2023-10-18 06:12:09', NULL),
(5, 5, 16, '652f771862fd7', 2, 7, '2023-10-18', NULL, 2, 380.00, 0, 0.00, 1, 0, 1, 0, 11.00, 0, NULL, '2023-10-18 06:11:36', '2023-10-18 06:11:36', NULL),
(6, 1, 2, '652fc1ffe002b', 2, 8, '2023-10-18', '2024-10-17', 60, 120.00, 0, 0.00, 1, 1, 1, 0, 0.00, 1, NULL, '2023-10-18 11:31:11', '2023-10-18 11:43:14', NULL),
(8, 1, 2, '652fc31c0d35b', 2, 10, '2023-10-18', '2024-10-17', 60, 120.00, 0, 0.00, 1, 1, 1, 0, 0.00, 1, NULL, '2023-10-18 11:35:56', '2023-10-18 11:36:42', NULL),
(9, 1, 7, '652fc3932a82d', 2, 11, '2023-10-18', '2024-10-17', 2, 180.00, 0, 0.00, 3, 0, 1, 805, 3.00, 1, NULL, '2023-10-18 11:37:55', '2023-10-18 11:43:02', NULL),
(10, 4, 14, '652fc48eebc82', 2, 12, '2023-10-18', '2024-10-17', 25, 350.00, 0, 0.00, 1, 0, 1, 0, 21.00, 1, NULL, '2023-10-18 11:42:06', '2023-10-18 11:42:51', NULL),
(11, 5, 16, '6533beaf1f446', 2, 13, '2023-10-21', NULL, 2, 380.00, 0, 0.00, 1, 0, 1, 0, 11.00, 0, NULL, '2023-10-21 12:06:07', '2023-10-21 12:06:07', NULL),
(12, 5, 15, '6533bff335d64', 2, 14, '2023-10-21', '2024-10-20', 24, 250.00, 0, 0.00, 1, 0, 1, 0, 2.00, 1, NULL, '2023-10-21 12:11:31', '2023-10-21 12:11:49', NULL),
(13, 5, 6, '6533c0c85809b', 2, 15, '2023-10-21', NULL, 123, 120.00, 0, 0.00, 2, 2, 2, 0, 32.00, 2, NULL, '2023-10-21 12:15:04', '2023-10-21 12:15:37', NULL),
(14, 1, 1, '655b694be8986', 2, 17, '2023-11-20', '2024-11-19', 30, 60.00, 0, 0.00, 1, 0, 1, 0, 0.00, 1, NULL, '2023-11-20 14:12:27', '2023-11-20 14:12:47', 'g1NGsN0u6Gcu9L6RdB1YxcM4Qf5Yrkk0'),
(15, 1, 1, '655b698a4a484', 2, 18, '2023-11-20', '2024-11-19', 30, 60.00, 0, 0.00, 1, 0, 1, 0, 0.00, 1, NULL, '2023-11-20 14:13:30', '2023-11-20 14:13:39', 'g1NGsN0u6Gcu9L6RdB1YxcM4Qf5Yrkk0');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_orders`
--

DROP TABLE IF EXISTS `subscription_orders`;
CREATE TABLE `subscription_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `package_id` bigint UNSIGNED NOT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_type` tinyint NOT NULL DEFAULT '1',
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint NOT NULL DEFAULT '0',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_type` tinyint NOT NULL DEFAULT '1',
  `subtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total` decimal(12,2) DEFAULT '0.00',
  `transaction_amount` decimal(12,2) DEFAULT '0.00',
  `system_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_id` bigint UNSIGNED NOT NULL,
  `gateway_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_rate` decimal(12,2) DEFAULT '1.00',
  `payment_status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=paid, 2=cancelled',
  `bank_id` bigint UNSIGNED DEFAULT NULL,
  `bank_deposit_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_deposit_slip_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_orders`
--

INSERT INTO `subscription_orders` (`id`, `user_id`, `package_id`, `order_id`, `duration_type`, `payment_id`, `transaction_id`, `discount`, `discount_type`, `amount`, `tax_amount`, `tax_type`, `subtotal`, `total`, `transaction_amount`, `system_currency`, `gateway_id`, `gateway_currency`, `conversion_rate`, `payment_status`, `bank_id`, `bank_deposit_by`, `bank_deposit_slip_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, '655b690bac5c0', 1, NULL, '1536de9f6198456eac2d102b422fe98a', 0.00, 0, 10.00, 0.00, 0, 10.00, 10.00, 10.00, 'USD', 11, 'USD', 1.00, 1, NULL, NULL, NULL, '2023-11-20 14:11:23', '2023-11-20 14:11:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_settings`
--

DROP TABLE IF EXISTS `tax_settings`;
CREATE TABLE `tax_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `tax_rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `tax_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0',
  `tax_type` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_settings`
--

INSERT INTO `tax_settings` (`id`, `tax_rule_name`, `user_id`, `product_id`, `plan_id`, `tax_amount`, `status`, `tax_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Tax of Home Security System', 2, 1, 1, 5.00, 1, 1, NULL, '2023-10-17 13:16:43', '2023-10-17 13:19:37'),
(2, 'Tax of Home Internet Service', 2, 2, 9, 5.00, 1, 2, NULL, '2023-10-17 13:17:59', '2023-10-17 13:19:30'),
(3, 'Tax of Meal Kit Delivery Service', 2, 3, 12, 5.00, 1, 2, NULL, '2023-10-17 13:19:01', '2023-10-17 13:19:23'),
(4, 'Tax of Fitness Subscription App', 2, 4, 13, 5.00, 1, 2, NULL, '2023-10-17 13:20:12', '2023-10-17 13:20:12'),
(5, 'Tax of Web Hosting Service', 2, 4, 5, 5.00, 1, 2, NULL, '2023-10-17 13:22:22', '2023-10-17 13:22:22'),
(6, 'Tax of Home Internet Service-Premium', 2, 1, 2, 5.00, 1, 2, NULL, '2023-10-17 13:26:09', '2023-10-17 13:28:37'),
(7, 'Tax of Home Internet Service-Ultimate', 2, 1, 7, 5.00, 1, 1, NULL, '2023-10-17 13:26:37', '2023-10-17 13:28:57'),
(8, 'Tax of Home Internet Service - Premium', 2, 2, 8, 5.00, 1, 2, NULL, '2023-10-17 13:29:56', '2023-10-17 13:29:56'),
(9, 'Tax of Meal Kit Delivery Service - Ultimate', 2, 3, 4, 5.00, 1, 2, NULL, '2023-10-17 13:34:36', '2023-10-17 13:34:36'),
(10, 'Tax of Meal Kit Delivery Service - Gourmet', 2, 3, 10, 5.00, 1, 1, NULL, '2023-10-17 13:36:24', '2023-10-17 13:36:24'),
(11, 'Tax of Fitness Subscription App - Flagship', 2, 4, 14, 5.00, 1, 2, NULL, '2023-10-17 13:39:35', '2023-10-17 13:39:35'),
(12, 'Tax of Web Hosting Service - VPS Hosting', 2, 5, 15, 5.00, 1, 2, NULL, '2023-10-17 13:42:19', '2023-10-17 13:42:19'),
(13, 'Tax of Web Hosting Service - Dedicated Server', 2, 5, 16, 5.00, 1, 2, NULL, '2023-10-17 13:43:00', '2023-10-17 13:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` tinytext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `image`, `designation`, `comment`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'John Smith', '45', 'TechSolutions Inc.', 'The subscription and billing management software project was a game-changer for our business. It streamlined our billing process, increased customer satisfaction, and improved our revenue recognition. The team\'s professionalism and expertise were outstand', 1, '2023-11-01 14:35:45', '2023-11-01 14:42:31', NULL),
(2, 'Sarah Johnson', '82', 'E-Commerce Innovations', 'What sets Zaisub apart is its remarkable scalability. As our business continues to grow, we\'re confident that Zaisub will effortlessly adapt to our evolving needs. Their commitment to customization and exceptional customer support has made the partnership', 1, '2023-11-01 14:39:53', '2023-11-02 11:41:53', NULL),
(3, 'Alex Rodriguez', '48', 'Innovative SaaS Solutions', 'The subscription and billing software has transformed our financial operations. Accurate revenue reporting and proactive problem-solving have been highlights. The post-implementation support ensures our continued success. Highly recommended', 1, '2023-11-01 14:41:03', '2023-11-01 14:42:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `reference_id` bigint UNSIGNED DEFAULT NULL,
  `type` tinyint NOT NULL,
  `tnxId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_time` datetime NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `reference_id`, `type`, `tnxId`, `amount`, `purpose`, `payment_time`, `payment_method`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 16, NULL, 1, 1, 'fff611f657674030b49ab2eb4fd72e6b', 5.00, 'Withdrawal via beneficiary Bank', '0000-00-00 00:00:00', NULL, NULL, '2023-11-20 14:14:45', '2023-11-20 14:14:45'),
(2, 16, NULL, 2, 1, 'd8a2759b42264d609520db69cc42a425', 2.00, 'Withdrawal via beneficiary Bank', '0000-00-00 00:00:00', NULL, NULL, '2023-11-20 14:14:54', '2023-11-20 14:14:54'),
(3, 16, NULL, 2, 2, '8ae9d349cd184f05b59f17e5a093a8d8', 2.00, 'Withdrawal disbursed Bank', '0000-00-00 00:00:00', NULL, NULL, '2023-11-20 14:15:18', '2023-11-20 14:15:18'),
(4, 16, NULL, 3, 1, '2227c488f45c4e84894383e3e3ee968d', 3.00, 'Withdrawal via beneficiary Bank', '0000-00-00 00:00:00', NULL, NULL, '2023-11-20 14:15:35', '2023-11-20 14:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` int DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` bigint UNSIGNED DEFAULT NULL,
  `role` tinyint NOT NULL DEFAULT '2',
  `email_verification_status` tinyint NOT NULL DEFAULT '0',
  `phone_verification_status` tinyint NOT NULL DEFAULT '0',
  `google_auth_status` tinyint NOT NULL DEFAULT '0',
  `google2fa_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `last_seen` datetime NOT NULL DEFAULT '2023-10-16 13:29:04',
  `show_email_in_public` tinyint NOT NULL DEFAULT '1',
  `show_phone_in_public` tinyint NOT NULL DEFAULT '1',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affiliate_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_commission_amount` decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `nick_name`, `email`, `mobile`, `country`, `state`, `city`, `zip_code`, `address`, `currency`, `company_name`, `company_designation`, `company_country`, `company_state`, `company_city`, `company_zip_code`, `company_address`, `company_phone`, `company_logo`, `email_verified_at`, `password`, `image`, `role`, `email_verification_status`, `phone_verification_status`, `google_auth_status`, `google2fa_secret`, `google_id`, `facebook_id`, `verify_token`, `otp`, `otp_expiry`, `last_seen`, `show_email_in_public`, `show_phone_in_public`, `created_by`, `status`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `affiliate_code`, `affiliate_commission_amount`) VALUES
(1, '12345', 'Administrator', NULL, 'admin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$BdL5CyYVs/ceteKYiXmc4u.0Z8QQHe8VhUvnRO9tnpfvuEeq/21XW', 5, 1, 1, 1, 0, 'B3T6UKYRECCWXI6U', NULL, NULL, NULL, NULL, NULL, '2023-11-20 11:21:13', 1, 1, NULL, 1, 'LlYPLy5gyFfgHTyscfPkXw2iaKjE0qWpd7A2aRCXVXnxcpPLajFyAPxWTxr2', NULL, NULL, '2023-11-20 11:16:13', NULL, 0.00),
(2, '123455', 'User Doe', NULL, 'user@gmail.com', '+005465463234', 'New Work', NULL, 'Hempstead', '453432', '401 7TH AVE, NEW YORK, NY 10001-3463, USA', 'AFA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$wBGbvfBQ21X0ZOQrJTywTO6VzIYSAhky5WBM.ThlmGmeWBF7cP.TC', 6, 2, 1, 1, 0, 'IWX76L5GD5X5LI7W', NULL, NULL, NULL, NULL, NULL, '2023-11-20 11:12:26', 1, 1, NULL, 1, NULL, NULL, NULL, '2023-11-20 11:07:26', NULL, 0.00),
(3, '36fbd551-ee75-4a21-b702-8764461ebd19', 'Man joe', NULL, 'manjoe@gmail.com', '545455555552', NULL, NULL, NULL, NULL, NULL, NULL, 'manlu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$afJQN1UV2oUS6jsWkKosy.mS1T3BQ9m0vRpxxM0uRt/CGPBWoH/LO', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-17 14:19:57', '2023-10-17 14:19:57', NULL, 0.00),
(4, 'b85e1ee6-fcb9-40fd-9c37-c31dcb353756', 'Deo Cleveland', NULL, 'kifyjat@mailinator.com', '+1 (322) 394-1604', NULL, NULL, NULL, NULL, NULL, NULL, 'Rocha and Mcintosh Inc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$h7TuPsAWpZ/Jx6THZ4H0wuMuj2/MZxrEf8zbM.Ts50U5xtzCODxaS', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-17 14:43:05', '2023-10-17 14:43:05', NULL, 0.00),
(5, '9a6c4aac-38fb-4ea8-a4b2-f9c98cd339af', 'Sarah Johnson', NULL, 'john.anderson@email.com', '(555) 123-4567', NULL, NULL, NULL, NULL, NULL, NULL, 'Zew It', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$FNiQbmvqGPU5XAPZIe6kEegnwX7t4i9o7.u6xEsSvzzq1vXf6vSBG', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-17 14:54:44', '2023-10-17 14:54:44', NULL, 0.00),
(6, '31a3afaa-b6ef-410b-90f8-079a32b5b6f5', 'Alma Burns', NULL, 'gyna@mailinator.com', '+1 (242) 324-2582', NULL, NULL, NULL, NULL, NULL, NULL, 'Macias Bender Co', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Xz09hDn9wPRwiuRYv9l89OZc.efdo35yPRkg5RD/ewBywwhGPR6cS', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-18 06:01:48', '2023-10-18 06:01:48', NULL, 0.00),
(7, '01e9b157-f59a-4671-be7d-5f09285cda2b', 'Nichole Rich', NULL, 'vovovef@mailinator.com', '+1 (495) 613-6264', NULL, NULL, NULL, NULL, NULL, NULL, 'Johnson Joyce LLC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$en7wfb6IHLDwKStc..JOAugSwq/dPhGpfO0XpUBcH/XNk.Ujze3n.', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-18 06:11:36', '2023-10-18 06:11:36', NULL, 0.00),
(8, '462ade1c-b031-4df4-9261-738c3f9f2d87', 'Nita Paul', NULL, 'nita@gmail.com', '+1 (399) 424-1448', NULL, NULL, NULL, NULL, NULL, NULL, 'Herman Lane Co', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$q0MIrlRnWfPSQfT/b.dKY.TPth8RCXDz1S9PWLkSlgZ3rNmWb86GS', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-18 11:31:11', '2023-10-18 11:31:11', NULL, 0.00),
(10, 'e343d027-3c97-4bee-9bec-b549b7b3c807', 'James Mary', NULL, 'james@mailinator.com', '+1 (934) 391-3766', NULL, NULL, NULL, NULL, NULL, NULL, 'Frost and Edwards Co', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$xIOrOFkpbwfYEzNcNnAyxuCXKiQnZ4L7dBxvuYNPSOia08d88teqK', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-18 11:35:56', '2023-10-18 11:35:56', NULL, 0.00),
(11, '0ada26b6-9e00-4d77-819c-26fbb0a1b6d7', 'Ciara Byrd', NULL, 'wohuwon@mailinator.com', '+1 (381) 621-2527', NULL, NULL, NULL, NULL, NULL, NULL, 'White Williamson Traders', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$2pA6hZinD2udqFMq07i5euPvbkK6DkUvE1JWdYcaeIPmdz4pjKA6q', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-18 11:37:55', '2023-10-18 11:37:55', NULL, 0.00),
(12, '2c58e37c-dff1-4b21-8aa4-3c5118988f79', 'Mr John', NULL, 'John@mailinator.com', '+1 (523) 872-9059', NULL, NULL, NULL, NULL, NULL, NULL, 'Herman Lane Co', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$OEgAvb5vv2ehRJn6dDm85.dVUIqqqc69jJqgVkyZNrdWPDNIijXK.', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-18 11:42:06', '2023-10-18 11:42:06', NULL, 0.00),
(13, 'ece15caa-beeb-468e-a0d5-95690d4faf0e', 'Pauline W. Smith', NULL, 'paulinsmith@teleworm.us', '817-269-9650', NULL, NULL, NULL, NULL, NULL, NULL, 'teleworm.us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$CuLCmconZQ.3MlNPOYvHIuyeTX/cDnLtEe4kd/NoIN5tzuSBmKUEG', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-21 12:06:07', '2023-10-21 12:06:07', NULL, 0.00),
(14, '58d35831-d3e4-4017-8348-d74744cba3c9', 'Wesley G. Shy', NULL, 'wesleygshy@armyspy.com', '530-315-3718', NULL, NULL, NULL, NULL, NULL, NULL, 'armyspy.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$eV2Myv1.qCHMRlllxjXZk.kz.b7qMdMlEHmX9T0XCkDDrCHGbn4Me', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-21 12:11:31', '2023-10-21 12:11:31', NULL, 0.00),
(15, 'dd7eaff3-dd0b-460a-bbb3-ede7f06f7575', 'Clara P. Stephenson', NULL, 'ClaraPStephenson@rhyta.com', '631-780-4310', NULL, NULL, NULL, NULL, NULL, NULL, 'rhyta.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$2Wo/Vz.hnx2Ts5OlKmYWS.gC8eu/UqjYWt6/Ix3LvExBN0J5BB29.', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-10-21 12:15:04', '2023-10-21 12:15:04', NULL, 0.00),
(16, 'd491d59e-cad8-4b6c-9a55-0d6725763747', 'Affiliate', NULL, 'affiliate@gmail.com', '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-20 11:08:17', '$2y$10$Xe7GWPM4ehV1cE9B.wwIjuVth1Q0oy1JuX502pKZ/TuCcCosgwZs.', NULL, 4, 1, 0, 0, NULL, NULL, NULL, '906dadd544d8445cb1f82d64308d4c66', NULL, NULL, '2023-11-20 14:16:47', 1, 1, 2, 1, NULL, NULL, '2023-11-20 11:08:17', '2023-11-20 14:15:35', 'g1NGsN0u6Gcu9L6RdB1YxcM4Qf5Yrkk0', 2.00),
(17, '4dcebec4-22af-48bc-98a5-265b4cce05fe', 'Marion West', NULL, 'marionwest@gmail.com', '56465465465', NULL, NULL, NULL, NULL, NULL, NULL, 'holanki.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$YrhWJGnKbd/j31P8ffw21uSjOPXqNIbEoaJC.ZOgVEgqjYduWrRve', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-11-20 14:12:27', '2023-11-20 14:12:27', NULL, 0.00),
(18, '524ff5ff-b40c-484f-bb68-7a7e0be5a87e', 'Marco Garrett', NULL, 'marcogarrett@gmail.com', '987979879898654', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$8qUXoVTlbDCa8S3D9pyI1.Qm.kyCjXcWJCK2M.zCgONV3o7eA0j1K', NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-16 13:29:04', 1, 1, 2, 1, NULL, NULL, '2023-11-20 14:13:30', '2023-11-20 14:13:30', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `basic_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `basic_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `billing_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_first_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_last_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` tinyint DEFAULT NULL,
  `payment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revenue` decimal(12,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `basic_info`, `basic_first_name`, `basic_last_name`, `basic_phone`, `basic_email`, `basic_company`, `billing_info`, `billing_first_name`, `billing_last_name`, `billing_email`, `billing_phone`, `billing_zip_code`, `billing_address`, `billing_city`, `billing_state`, `billing_country`, `shipping_info`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_phone`, `shipping_zip_code`, `shipping_address`, `shipping_city`, `shipping_state`, `shipping_country`, `shipping_method`, `payment`, `revenue`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 'null', 'Man', 'joe', '545455555552', 'manjoe@gmail.com', 'manlu', 'null', NULL, NULL, NULL, NULL, '5200', 'ganlo', 'cargo', 'cargo', 'United State', 'null', NULL, NULL, NULL, NULL, '1', 'ganlo', 'cargo', 'cargo', 'United State', 0, NULL, 0.00, NULL, '2023-10-17 14:19:57', '2023-10-17 14:19:57'),
(2, 4, 'null', 'Deo', 'Cleveland', '+1 (322) 394-1604', 'kifyjat@mailinator.com', 'Rocha and Mcintosh Inc', 'null', NULL, NULL, NULL, NULL, '62701', '123 Elm Street', 'Springfield', 'Illinois', 'United States', 'null', NULL, NULL, NULL, NULL, '1', '456 Oak Avenue', 'Anytown', 'Consectetur', 'Canada', 127, NULL, 0.00, NULL, '2023-10-17 14:43:05', '2023-10-17 14:43:05'),
(3, 5, 'null', 'Sarah', 'Johnson', '(555) 123-4567', 'john.anderson@email.com', 'Zew It', 'null', NULL, NULL, NULL, NULL, '90001', '456 Oak Avenue, Apt 2B', 'Los Angeles', 'California', 'United States', 'null', NULL, NULL, NULL, NULL, '1', '789 Maple Lane', 'Boston', 'Unit 5C', 'Canada', 127, NULL, 0.00, NULL, '2023-10-17 14:54:44', '2023-10-17 14:54:44'),
(4, 6, 'null', 'Alma', 'Burns', '+1 (242) 324-2582', 'gyna@mailinator.com', 'Macias Bender Co', 'null', NULL, NULL, NULL, NULL, '31656', 'Soluta aliquip ex at', 'Velit dolor doloremq', 'Voluptatem sunt in', 'Ullamco perspiciatis', 'null', NULL, NULL, NULL, NULL, '1', 'Quis pariatur Molli', 'Incididunt ipsum qu', 'Delectus impedit v', 'Reprehenderit est q', 0, NULL, 0.00, NULL, '2023-10-18 06:01:48', '2023-10-18 06:01:48'),
(5, 7, 'null', 'Nichole', 'Rich', '+1 (495) 613-6264', 'vovovef@mailinator.com', 'Johnson Joyce LLC', 'null', NULL, NULL, NULL, NULL, '59777', 'Est deserunt accusam', 'Do ab aut alias fuga', 'Enim neque totam ape', 'In expedita est sim', 'null', NULL, NULL, NULL, NULL, '1', 'Eiusmod temporibus m', 'Odio exercitationem', 'Odio dolore exceptur', 'Fugit sit hic conse', 0, NULL, 0.00, NULL, '2023-10-18 06:11:36', '2023-10-18 06:11:36'),
(6, 8, 'null', 'Nita', 'Paul', '+1 (399) 424-1448', 'nita@gmail.com', 'Herman Lane Co', 'null', NULL, NULL, NULL, NULL, '83299', '132, My Stree', 'Kingston', 'New York', 'USA', 'null', NULL, NULL, NULL, NULL, '1', '132, My Stree', 'Kingston', 'New York', 'USA', 127, NULL, 0.00, NULL, '2023-10-18 11:31:11', '2023-10-18 11:31:11'),
(8, 10, 'null', 'James', 'Mary', '+1 (934) 391-3766', 'james@mailinator.com', 'Frost and Edwards Co', 'null', NULL, NULL, NULL, NULL, '55798', '132, My Street', 'Kingston', 'New York 12401', 'USA', 'null', NULL, NULL, NULL, NULL, '1', '132, My Street', 'Kingston', 'New York 12401', 'USA', 127, NULL, 0.00, NULL, '2023-10-18 11:35:56', '2023-10-18 11:35:56'),
(9, 11, 'null', 'Ciara', 'Byrd', '+1 (381) 621-2527', 'wohuwon@mailinator.com', 'White Williamson Traders', 'null', NULL, NULL, NULL, NULL, '95898', 'Doloribus ullam ut e', 'Expedita in beatae q', 'Ipsa aut nisi conse', 'In laborum Nostrud', 'null', NULL, NULL, NULL, NULL, NULL, 'Et quos deserunt nob', 'Eum est voluptate no', 'Voluptate quod modi', 'Nisi quia ut volupta', 0, NULL, 0.00, NULL, '2023-10-18 11:37:55', '2023-10-18 11:37:55'),
(10, 12, 'null', 'Mr', 'John', '+1 (523) 872-9059', 'John@mailinator.com', 'Herman Lane Co', 'null', NULL, NULL, NULL, NULL, '31001', '132, My Street', 'Kingston', 'New York', 'USA', 'null', NULL, NULL, NULL, NULL, '1', '132, My Street', 'Kingston', 'New York', 'USA', 127, NULL, 0.00, NULL, '2023-10-18 11:42:06', '2023-10-18 11:42:06'),
(11, 13, 'null', 'Pauline', 'W. Smith', '817-269-9650', 'paulinsmith@teleworm.us', 'teleworm.us', 'null', NULL, NULL, NULL, NULL, '76039', '237 Oliver Street', 'Euless', 'Euless', 'United State', 'null', NULL, NULL, NULL, NULL, '1', '237 Oliver Street', 'Euless', 'Euless', 'United State', 127, NULL, 0.00, NULL, '2023-10-21 12:06:07', '2023-10-21 12:06:07'),
(12, 14, 'null', 'Wesley', 'G. Shy', '530-315-3718', 'wesleygshy@armyspy.com', 'armyspy.com', 'null', NULL, NULL, NULL, NULL, '95652', '165 Francis Mine', 'Mcclellan', 'Mcclellan', 'United State', 'null', NULL, NULL, NULL, NULL, '1', '165 Francis Mine', 'Mcclellan', 'Mcclellan', 'United State', 127, NULL, 0.00, NULL, '2023-10-21 12:11:31', '2023-10-21 12:11:31'),
(13, 15, 'null', 'Clara', 'P. Stephenson', '631-780-4310', 'ClaraPStephenson@rhyta.com', 'rhyta.com', 'null', NULL, NULL, NULL, NULL, NULL, '747 Grove Street', 'New York', 'New York', 'United State', 'null', NULL, NULL, NULL, NULL, '1', '747 Grove Street', 'New York', 'New York', 'United State', 127, NULL, 0.00, NULL, '2023-10-21 12:15:04', '2023-10-21 12:15:04'),
(14, 17, 'null', 'Marco', 'Garrett', '9879764643', 'agegeeter@gmail.com', 'kopotakkhotimes', 'null', NULL, NULL, NULL, NULL, '9400', 'satkhira', 'satkhira', 'satkhira', 'Bangladesh', 'null', NULL, NULL, NULL, NULL, '1', 'satkhira', 'satkhira', 'satkhira', 'Bangladesh', 0, NULL, 0.00, NULL, '2023-11-20 14:12:27', '2023-11-20 14:12:27'),
(15, 18, 'null', 'Garrett', 'Garrett', '641941984198', 'mracoda@gmail.com', NULL, 'null', NULL, NULL, NULL, NULL, '9400', 'Gawsia Kasem Center', 'satkhira', NULL, 'Bangladesh', 'null', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '2023-11-20 14:13:30', '2023-11-20 14:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_packages`
--

DROP TABLE IF EXISTS `user_packages`;
CREATE TABLE `user_packages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `package_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `customer_limit` int NOT NULL DEFAULT '-1',
  `product_limit` int NOT NULL DEFAULT '-1',
  `subscription_limit` int NOT NULL DEFAULT '-1',
  `monthly_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `yearly_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `is_trail` tinyint NOT NULL DEFAULT '0' COMMENT 'active for 1 , deactivate for 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_packages`
--

INSERT INTO `user_packages` (`id`, `name`, `user_id`, `package_id`, `order_id`, `customer_limit`, `product_limit`, `subscription_limit`, `monthly_price`, `yearly_price`, `start_date`, `end_date`, `status`, `is_trail`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Standard plan', 2, 2, 1, 50, 50, 50, 10.00, 100.00, '2023-11-20 14:11:23', '2023-12-20 14:11:23', 1, 0, '2023-11-20 14:11:23', '2023-11-20 14:11:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
CREATE TABLE `webhooks` (
  `id` bigint UNSIGNED NOT NULL,
  `webhook_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `webhook_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webhooks`
--

INSERT INTO `webhooks` (`id`, `webhook_name`, `user_id`, `product_id`, `plan_id`, `webhook_url`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Smart Home Security System Basic Plan', 2, 1, 1, 'https://api.publicapis.org/entries', 1, NULL, '2023-10-17 12:46:06', '2023-10-17 12:46:06'),
(2, 'Smart Home Security System Premium Plan', 2, 1, 2, 'https://api.publicapis.org/entries', 1, NULL, '2023-10-17 12:50:31', '2023-10-17 12:57:47'),
(3, 'Smart Home Security System Ultimate Plan', 2, 1, 7, 'https://api.publicapis.org/entries', 1, NULL, '2023-10-17 12:54:48', '2023-10-17 12:57:53'),
(4, 'Home Internet Service Basic Plan', 2, 2, 8, 'https://randomuser.me/api/', 1, NULL, '2023-10-17 12:55:42', '2023-10-17 12:55:42'),
(5, 'Home Internet Service High Speed Plan', 2, 2, 9, 'https://randomuser.me/api/', 1, NULL, '2023-10-17 12:56:39', '2023-10-17 12:56:39'),
(6, 'Home Internet Service Vegetarian Plan', 2, 2, 11, 'https://randomuser.me/api/', 1, NULL, '2023-10-17 12:57:36', '2023-10-17 12:57:36'),
(7, 'Meal Kit Delivery Service Starter Plan', 2, 3, 4, 'https://official-joke-api.appspot.com/random_joke', 1, NULL, '2023-10-17 12:59:20', '2023-10-17 12:59:20'),
(8, 'Meal Kit Delivery Service Gourmet Plan', 2, 3, 10, 'https://official-joke-api.appspot.com/random_joke', 1, NULL, '2023-10-17 13:15:14', '2023-10-17 13:15:14'),
(9, 'Meal Kit Delivery Service  Vegetarian Plan', 2, 3, 12, 'https://official-joke-api.appspot.com/random_joke', 1, NULL, '2023-10-17 13:16:39', '2023-10-17 13:16:39'),
(10, 'Fitness Subscription App Basic Plan', 2, 4, 5, 'https://randomuser.me/api/', 1, NULL, '2023-10-17 13:17:18', '2023-10-17 13:17:18'),
(11, 'Fitness Subscription App Mid Range Plan', 2, 4, 13, 'https://randomuser.me/api/', 1, NULL, '2023-10-17 13:17:47', '2023-10-17 13:17:47'),
(12, 'Fitness Subscription App Flagship Plan', 2, 4, 14, 'https://api.publicapis.org/entries', 1, NULL, '2023-10-17 13:18:52', '2023-10-17 13:18:52'),
(13, 'Web Hosting Service Share Hosting Plan', 2, 5, 6, 'https://api.publicapis.org/entries', 1, NULL, '2023-10-17 13:19:35', '2023-10-17 13:19:35'),
(14, 'Web Hosting Service  VPS', 2, 5, 15, 'https://api.publicapis.org/entries', 1, NULL, '2023-10-17 13:20:03', '2023-10-17 13:20:03'),
(15, 'Web Hosting Service  Dedicated', 2, 5, 16, 'https://api.publicapis.org/entries', 1, NULL, '2023-10-17 13:20:27', '2023-10-17 13:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `webhook_events`
--

DROP TABLE IF EXISTS `webhook_events`;
CREATE TABLE `webhook_events` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `webhook_id` int NOT NULL,
  `product_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `request_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `webhook_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `retry_count` int NOT NULL,
  `response_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webhook_events`
--

INSERT INTO `webhook_events` (`id`, `event_id`, `event_type`, `user_id`, `webhook_id`, `product_id`, `plan_id`, `request_data`, `webhook_url`, `response_msg`, `response_code`, `retry_count`, `response_data`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'WHE-000001', 1, 2, 1, 1, 1, '{\"order_info\":{\"id\":1,\"user_id\":2,\"customer_id\":3,\"product_id\":1,\"transaction_id\":null,\"payment_id\":\"BNK652e980ddd676\",\"bank_id\":1,\"plan_id\":1,\"invoice_id\":1,\"gateway_id\":10,\"subscription_id\":1,\"order_id\":\"652e980dd5d11\",\"amount\":\"60.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"0.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"5.00\",\"tax_type\":1,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"65.00\",\"total\":\"65.00\",\"transaction_amount\":\"65.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"Man joe\",\"bank_deposit_slip_id\":\"11\",\"deleted_at\":null,\"created_at\":\"2023-10-17T14:19:57.000000Z\",\"updated_at\":\"2023-10-17T14:20:56.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-17 14:20:57', '2023-10-17 14:20:57'),
(2, 'WHE-000016', 1, 2, 15, 5, 16, '{\"order_info\":{\"id\":3,\"user_id\":2,\"customer_id\":5,\"product_id\":5,\"transaction_id\":null,\"payment_id\":\"BNK652ea034e6375\",\"bank_id\":1,\"plan_id\":16,\"invoice_id\":3,\"gateway_id\":10,\"subscription_id\":3,\"order_id\":\"652ea034e2276\",\"amount\":\"380.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"11.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"19.00\",\"tax_type\":2,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"410.00\",\"total\":\"410.00\",\"transaction_amount\":\"410.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"Sarah Johnson\",\"bank_deposit_slip_id\":\"13\",\"deleted_at\":null,\"created_at\":\"2023-10-17T14:54:44.000000Z\",\"updated_at\":\"2023-10-17T14:55:04.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-17 14:55:05', '2023-10-17 14:55:05'),
(3, 'WHE-000001', 1, 2, 1, 1, 1, '{\"order_info\":{\"id\":2,\"user_id\":2,\"customer_id\":4,\"product_id\":1,\"transaction_id\":null,\"payment_id\":\"BNK652e9d794f83f\",\"bank_id\":1,\"plan_id\":1,\"invoice_id\":2,\"gateway_id\":10,\"subscription_id\":2,\"order_id\":\"652e9d79464c8\",\"amount\":\"60.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"0.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"5.00\",\"tax_type\":1,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"65.00\",\"total\":\"65.00\",\"transaction_amount\":\"65.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"Deo Cleveland\",\"bank_deposit_slip_id\":\"12\",\"deleted_at\":null,\"created_at\":\"2023-10-17T14:43:05.000000Z\",\"updated_at\":\"2023-10-17T14:55:54.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-17 14:55:55', '2023-10-17 14:55:55'),
(4, 'WHE-000016', 1, 2, 15, 5, 16, '{\"order_info\":{\"id\":4,\"user_id\":2,\"customer_id\":6,\"product_id\":5,\"transaction_id\":null,\"payment_id\":\"BNK652f74cc75551\",\"bank_id\":1,\"plan_id\":16,\"invoice_id\":4,\"gateway_id\":10,\"subscription_id\":4,\"order_id\":\"652f74cc6e84e\",\"amount\":\"380.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"11.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"19.00\",\"tax_type\":2,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"410.00\",\"total\":\"410.00\",\"transaction_amount\":\"410.00\",\"order_number\":null,\"payment_status\":\"2\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"Alma Burns\",\"bank_deposit_slip_id\":\"14\",\"deleted_at\":null,\"created_at\":\"2023-10-18T06:01:48.000000Z\",\"updated_at\":\"2023-10-18T06:12:09.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-18 06:12:10', '2023-10-18 06:12:10'),
(5, 'WHE-000002', 1, 2, 2, 1, 2, '{\"order_info\":{\"id\":8,\"user_id\":2,\"customer_id\":10,\"product_id\":1,\"transaction_id\":null,\"payment_id\":\"BNK652fc31c18eb5\",\"bank_id\":1,\"plan_id\":2,\"invoice_id\":8,\"gateway_id\":10,\"subscription_id\":8,\"order_id\":\"652fc31c1297e\",\"amount\":\"120.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"0.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"6.00\",\"tax_type\":2,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"126.00\",\"total\":\"126.00\",\"transaction_amount\":\"126.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"James Mary\",\"bank_deposit_slip_id\":\"17\",\"deleted_at\":null,\"created_at\":\"2023-10-18T11:35:56.000000Z\",\"updated_at\":\"2023-10-18T11:36:42.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-18 11:36:42', '2023-10-18 11:36:42'),
(6, 'WHE-000014', 1, 2, 12, 4, 14, '{\"order_info\":{\"id\":10,\"user_id\":2,\"customer_id\":12,\"product_id\":4,\"transaction_id\":null,\"payment_id\":\"BNK652fc48f00996\",\"bank_id\":1,\"plan_id\":14,\"invoice_id\":10,\"gateway_id\":10,\"subscription_id\":10,\"order_id\":\"652fc48eeeb31\",\"amount\":\"350.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"21.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"17.50\",\"tax_type\":2,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"388.50\",\"total\":\"388.50\",\"transaction_amount\":\"388.50\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"Mr John\",\"bank_deposit_slip_id\":\"19\",\"deleted_at\":null,\"created_at\":\"2023-10-18T11:42:06.000000Z\",\"updated_at\":\"2023-10-18T11:42:51.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-18 11:42:52', '2023-10-18 11:42:52'),
(7, 'WHE-000007', 1, 2, 3, 1, 7, '{\"order_info\":{\"id\":9,\"user_id\":2,\"customer_id\":11,\"product_id\":1,\"transaction_id\":null,\"payment_id\":\"BNK652fc3933410c\",\"bank_id\":1,\"plan_id\":7,\"invoice_id\":9,\"gateway_id\":10,\"subscription_id\":9,\"order_id\":\"652fc3932cd80\",\"amount\":\"180.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"3.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"5.00\",\"tax_type\":1,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"188.00\",\"total\":\"188.00\",\"transaction_amount\":\"188.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"Ciara Byrd\",\"bank_deposit_slip_id\":\"18\",\"deleted_at\":null,\"created_at\":\"2023-10-18T11:37:55.000000Z\",\"updated_at\":\"2023-10-18T11:43:02.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-18 11:43:03', '2023-10-18 11:43:03'),
(8, 'WHE-000002', 1, 2, 2, 1, 2, '{\"order_info\":{\"id\":6,\"user_id\":2,\"customer_id\":8,\"product_id\":1,\"transaction_id\":null,\"payment_id\":\"BNK652fc1ffeb733\",\"bank_id\":1,\"plan_id\":2,\"invoice_id\":6,\"gateway_id\":10,\"subscription_id\":6,\"order_id\":\"652fc1ffe49dd\",\"amount\":\"120.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"0.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"6.00\",\"tax_type\":2,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"126.00\",\"total\":\"126.00\",\"transaction_amount\":\"126.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":\"Nita Paul\",\"bank_deposit_slip_id\":\"16\",\"deleted_at\":null,\"created_at\":\"2023-10-18T11:31:11.000000Z\",\"updated_at\":\"2023-10-18T11:43:14.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-18 11:43:14', '2023-10-18 11:43:14'),
(9, 'WHE-000015', 1, 2, 14, 5, 15, '{\"order_info\":{\"id\":12,\"user_id\":2,\"customer_id\":14,\"product_id\":5,\"transaction_id\":null,\"payment_id\":\"CAS6533bff33ba7e\",\"bank_id\":null,\"plan_id\":15,\"invoice_id\":12,\"gateway_id\":11,\"subscription_id\":12,\"order_id\":\"6533bff33a388\",\"amount\":\"250.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"2.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"12.50\",\"tax_type\":2,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"264.50\",\"total\":\"264.50\",\"transaction_amount\":\"264.50\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":null,\"bank_deposit_slip_id\":null,\"deleted_at\":null,\"created_at\":\"2023-10-21T12:11:31.000000Z\",\"updated_at\":\"2023-10-21T12:11:49.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-21 12:11:50', '2023-10-21 12:11:50'),
(10, 'WHE-000006', 1, 2, 13, 5, 6, '{\"order_info\":{\"id\":13,\"user_id\":2,\"customer_id\":15,\"product_id\":5,\"transaction_id\":null,\"payment_id\":\"CAS6533c0c85c949\",\"bank_id\":null,\"plan_id\":6,\"invoice_id\":13,\"gateway_id\":11,\"subscription_id\":13,\"order_id\":\"6533c0c85bd76\",\"amount\":\"120.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"32.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"0.00\",\"tax_type\":1,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"152.00\",\"total\":\"152.00\",\"transaction_amount\":\"152.00\",\"order_number\":null,\"payment_status\":\"2\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"USD\",\"bank_deposit_by\":null,\"bank_deposit_slip_id\":null,\"deleted_at\":null,\"created_at\":\"2023-10-21T12:15:04.000000Z\",\"updated_at\":\"2023-10-21T12:15:37.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-10-21 12:15:38', '2023-10-21 12:15:38'),
(11, 'WHE-000001', 1, 2, 1, 1, 1, '{\"order_info\":{\"id\":14,\"user_id\":2,\"customer_id\":17,\"product_id\":1,\"transaction_id\":null,\"payment_id\":\"BNK655b694beb9b4\",\"bank_id\":2,\"plan_id\":1,\"invoice_id\":14,\"gateway_id\":21,\"subscription_id\":14,\"order_id\":\"655b694be9f26\",\"amount\":\"60.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"0.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"5.00\",\"tax_type\":1,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"65.00\",\"total\":\"65.00\",\"transaction_amount\":\"65.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"AFA\",\"bank_deposit_by\":\"sadik khan\",\"bank_deposit_slip_id\":\"93\",\"deleted_at\":null,\"created_at\":\"2023-11-20T14:12:27.000000Z\",\"updated_at\":\"2023-11-20T14:12:47.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-11-20 14:12:48', '2023-11-20 14:12:48'),
(12, 'WHE-000001', 1, 2, 1, 1, 1, '{\"order_info\":{\"id\":15,\"user_id\":2,\"customer_id\":18,\"product_id\":1,\"transaction_id\":null,\"payment_id\":\"BNK655b698a4d335\",\"bank_id\":2,\"plan_id\":1,\"invoice_id\":15,\"gateway_id\":21,\"subscription_id\":15,\"order_id\":\"655b698a4b7ee\",\"amount\":\"60.00\",\"discount\":\"0.00\",\"discount_type\":1,\"shipping_cost\":\"0.00\",\"setup_fees\":\"0.00\",\"tax_amount\":\"5.00\",\"tax_type\":1,\"conversion_rate\":\"1.00\",\"platform_charge\":\"0.00\",\"subtotal\":\"65.00\",\"total\":\"65.00\",\"transaction_amount\":\"65.00\",\"order_number\":null,\"payment_status\":\"1\",\"delivery_status\":1,\"system_currency\":\"BDT\",\"gateway_currency\":\"AFA\",\"bank_deposit_by\":\"Addurs Salam\",\"bank_deposit_slip_id\":\"94\",\"deleted_at\":null,\"created_at\":\"2023-11-20T14:13:30.000000Z\",\"updated_at\":\"2023-11-20T14:13:39.000000Z\"}}', 'https://api.publicapis.org/entries', '', '', 0, '', 2, NULL, '2023-11-20 14:13:41', '2023-11-20 14:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;
CREATE TABLE `withdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `beneficiary_id` bigint UNSIGNED DEFAULT NULL,
  `tnxId` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=complete, 2=rejected',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `user_id`, `beneficiary_id`, `tnxId`, `amount`, `payment_method`, `note`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 16, 1, 'a78c43d969734963afbebc9d17a15fa7', 5.00, NULL, NULL, 1, NULL, '2023-11-20 14:14:45', '2023-11-20 14:15:13'),
(2, 16, 1, 'f8e5b4f01e214fff9b0a81f9c1ef30ae', 2.00, NULL, NULL, 2, NULL, '2023-11-20 14:14:54', '2023-11-20 14:15:18'),
(3, 16, 1, '32be607186aa488f9658e627f6e9f804', 3.00, NULL, NULL, 0, NULL, '2023-11-20 14:15:35', '2023-11-20 14:15:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authentication_log`
--
ALTER TABLE `authentication_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authentication_log_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `best_features_settings`
--
ALTER TABLE `best_features_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout_page_settings`
--
ALTER TABLE `checkout_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `database_backup_cron_settings`
--
ALTER TABLE `database_backup_cron_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features_settings`
--
ALTER TABLE `features_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_managers`
--
ALTER TABLE `file_managers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_managers_file_name_unique` (`file_name`);

--
-- Indexes for table `frontend_sections`
--
ALTER TABLE `frontend_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_language_unique` (`language`),
  ADD UNIQUE KEY `languages_iso_code_unique` (`iso_code`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_histories`
--
ALTER TABLE `mail_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `metas_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_seens`
--
ALTER TABLE `notification_seens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_uuid_unique` (`uuid`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_orders`
--
ALTER TABLE `subscription_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_settings`
--
ALTER TABLE `tax_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_uuid_unique` (`uuid`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webhook_events`
--
ALTER TABLE `webhook_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `authentication_log`
--
ALTER TABLE `authentication_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `best_features_settings`
--
ALTER TABLE `best_features_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `checkout_page_settings`
--
ALTER TABLE `checkout_page_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `database_backup_cron_settings`
--
ALTER TABLE `database_backup_cron_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `features_settings`
--
ALTER TABLE `features_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `file_managers`
--
ALTER TABLE `file_managers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `frontend_sections`
--
ALTER TABLE `frontend_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mail_histories`
--
ALTER TABLE `mail_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notification_seens`
--
ALTER TABLE `notification_seens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `subscription_orders`
--
ALTER TABLE `subscription_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax_settings`
--
ALTER TABLE `tax_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_packages`
--
ALTER TABLE `user_packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `webhook_events`
--
ALTER TABLE `webhook_events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
