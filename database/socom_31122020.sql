-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2020 at 11:14 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrator', 'admin@admin.com', 'users/default.png', '$2y$10$nLGwhi95sd6ngrH9JY2PxepGLVWo7K9dxws4ipbc1/lnisq4k7/rG', NULL, NULL, NULL, '2020-08-30 21:45:32', '2020-08-30 21:45:32');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `parent_id`, `comment`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1, 'App\\Post', '2020-09-10 02:09:45', '2020-09-10 02:09:45'),
(4, 2, 2, 'replies', 1, 'App\\Post', '2020-09-11 03:27:49', '2020-09-11 03:27:49'),
(5, 2, 2, 'replies 2', 1, 'App\\Post', '2020-09-11 03:28:49', '2020-09-11 03:28:49'),
(6, 1, NULL, 'Test Redis Events', 1, 'App\\Post', '2020-12-15 02:25:27', '2020-12-15 02:25:27'),
(8, 2, NULL, 'Comment realtime', 1, 'App\\Post', '2020-12-16 01:58:43', '2020-12-16 01:58:43'),
(9, 2, NULL, 'Insert comment', 1, 'App\\Post', '2020-12-16 02:06:44', '2020-12-16 02:06:44'),
(10, 2, NULL, 'First comment', 3, 'App\\Post', '2020-12-16 02:09:21', '2020-12-16 02:09:21'),
(11, 2, NULL, 'second comment', 3, 'App\\Post', '2020-12-16 02:09:35', '2020-12-16 02:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 1, 1, 1, 1, 1, 1, '{}', 8),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 0, 0, 0, 0, 0, '{}', 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'role_id', 'text', 'Role Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 5),
(27, 4, 'password', 'text', 'Password', 0, 0, 0, 1, 1, 0, '{}', 6),
(28, 4, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 4, 'settings', 'text', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 8),
(30, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 1, '{}', 9),
(31, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(32, 4, 'admin_belongsto_role_relationship', 'relationship', 'role', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"admins\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(34, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(35, 1, 'notify_token', 'text', 'Notify Token', 0, 1, 1, 1, 1, 1, '{}', 8),
(37, 5, 'id', 'text', 'Id', 1, 0, 1, 0, 0, 0, '{}', 1),
(38, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(39, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 1, '{}', 3),
(40, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(41, 6, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(42, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(43, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 0, '{}', 3),
(44, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(45, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(46, 7, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(47, 7, 'description', 'text_area', 'Description', 1, 1, 1, 1, 1, 1, '{}', 5),
(48, 7, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{}', 6),
(49, 7, 'news_category_id', 'text', 'News Category Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(50, 7, 'admin_id', 'text', 'Admin Id', 1, 0, 0, 0, 0, 0, '{}', 3),
(51, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 7),
(52, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(53, 7, 'news_belongsto_news_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\NewsCategory\",\"table\":\"news_categories\",\"type\":\"belongsTo\",\"column\":\"news_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"admins\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(54, 7, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 9),
(55, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(56, 8, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(57, 8, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 5),
(58, 8, 'body', 'rich_text_box', 'Body', 1, 1, 1, 1, 1, 1, '{}', 6),
(59, 8, 'start', 'date', 'Start', 1, 1, 1, 1, 1, 1, '{}', 7),
(60, 8, 'end', 'date', 'End', 1, 1, 1, 1, 1, 1, '{}', 8),
(61, 8, 'event_category_id', 'text', 'Event Category Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(62, 8, 'admin_id', 'text', 'Admin', 1, 0, 1, 0, 0, 0, '{}', 3),
(63, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 11),
(64, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(65, 8, 'event_belongsto_event_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\EventCategory\",\"table\":\"event_categories\",\"type\":\"belongsTo\",\"column\":\"event_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"admins\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(66, 8, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 9),
(67, 1, 'facebook_token', 'text', 'Facebook Token', 0, 1, 1, 1, 1, 1, '{}', 9),
(68, 1, 'twitter_token', 'text', 'Twitter Token', 0, 1, 1, 1, 1, 1, '{}', 10),
(69, 1, 'google_token', 'text', 'Google Token', 0, 1, 1, 1, 1, 1, '{}', 11),
(70, 1, 'phone', 'number', 'Phone', 1, 1, 1, 1, 1, 1, '{}', 16),
(71, 7, 'meta_description', 'text', 'Meta Description', 0, 1, 1, 1, 1, 1, '{}', 8),
(72, 7, 'meta_keywords', 'text', 'Meta Keywords', 0, 1, 1, 1, 1, 1, '{}', 9),
(73, 7, 'seo_title', 'text', 'Seo Title', 0, 1, 1, 1, 1, 1, '{}', 10),
(74, 9, 'id', 'text', 'Id', 1, 0, 1, 0, 0, 0, '{}', 1),
(75, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(76, 9, 'description', 'text_area', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(77, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(78, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-08-30 21:44:28', '2020-10-06 21:53:52'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-08-30 21:44:28', '2020-08-30 21:44:28'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-08-30 21:44:28', '2020-08-30 21:44:28'),
(4, 'admins', 'admins', 'Admin', 'Admins', 'voyager-people', 'App\\Admin', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-30 21:50:32', '2020-08-30 22:09:53'),
(5, 'event_categories', 'event-categories', 'Event Category', 'Event Categories', 'voyager-categories', 'App\\EventCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-09-15 23:35:30', '2020-09-16 01:26:23'),
(6, 'news_categories', 'news-categories', 'News Category', 'News Categories', 'voyager-categories', 'App\\NewsCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-09-15 23:36:05', '2020-09-16 01:26:37'),
(7, 'news', 'news', 'News', 'News', 'voyager-news', 'App\\News', NULL, 'App\\Http\\Controllers\\Voyager\\BaseController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-09-15 23:43:41', '2020-12-07 21:40:42'),
(8, 'events', 'events', 'Event', 'Events', 'voyager-megaphone', 'App\\Event', NULL, 'App\\Http\\Controllers\\Voyager\\BaseController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-09-17 20:06:22', '2020-09-17 20:39:20'),
(9, 'hobbies', 'hobbies', 'Hobby', 'Hobbies', NULL, 'App\\Hobby', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-12-23 01:37:25', '2020-12-23 01:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `discoveries`
--

CREATE TABLE `discoveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_category_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `body`, `start`, `end`, `status`, `meta_description`, `meta_keywords`, `seo_title`, `event_category_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum', 'Events', '<div id=\"output\" class=\"page-generator__output js-generator-output\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Scelerisque varius morbi enim nunc faucibus a pellentesque. Varius duis at consectetur lorem donec. Sed vulputate odio ut enim blandit volutpat. Euismod in pellentesque massa placerat duis ultricies lacus. Ut ornare lectus sit amet est placerat. Fusce ut placerat orci nulla pellentesque dignissim enim sit amet. Vel pretium lectus quam id leo in vitae turpis. Rhoncus dolor purus non enim praesent elementum facilisis. Viverra mauris in aliquam sem. Ultricies mi quis hendrerit dolor magna eget.</p>\r\n<p>Sociis natoque penatibus et magnis dis. Tristique risus nec feugiat in fermentum posuere. Risus pretium quam vulputate dignissim suspendisse. Eget aliquet nibh praesent tristique magna sit. Molestie a iaculis at erat pellentesque adipiscing commodo elit. Id porta nibh venenatis cras. Massa sed elementum tempus egestas sed sed risus pretium. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac. Mattis rhoncus urna neque viverra justo nec ultrices. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Vehicula ipsum a arcu cursus vitae congue mauris. Etiam dignissim diam quis enim lobortis scelerisque. Risus quis varius quam quisque. Nisl suscipit adipiscing bibendum est ultricies integer. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus. Elementum pulvinar etiam non quam lacus suspendisse faucibus. Enim blandit volutpat maecenas volutpat blandit aliquam etiam erat. Gravida rutrum quisque non tellus orci ac auctor augue. Amet massa vitae tortor condimentum lacinia.</p>\r\n</div>', '2020-12-08 00:00:00', '2020-12-31 00:00:00', 'PUBLISHED', NULL, NULL, NULL, 1, 1, '2020-12-08 00:08:30', '2020-12-08 00:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_categories`
--

INSERT INTO `event_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sepeda', NULL, NULL),
(2, 'Nasional', '2020-09-17 20:04:23', '2020-09-17 20:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geolocations`
--

CREATE TABLE `geolocations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'offline',
  `shared` tinyint(1) NOT NULL DEFAULT 0,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `private`, `user_id`, `settings`, `created_at`, `updated_at`) VALUES
(1, 'Bilik Merenung', 'Tempat untuk Merenung', 0, 1, NULL, '2020-09-14 21:34:44', '2020-09-14 21:34:44'),
(2, 'Bilik Merenung', 'Tempat untuk Merenung', 0, 1, NULL, '2020-09-14 22:31:02', '2020-09-14 22:31:02'),
(3, 'Bilik Merenung', 'Tempat untuk Merenung', 0, 1, NULL, '2020-09-14 22:31:22', '2020-09-14 22:31:22');

-- --------------------------------------------------------

--
-- Table structure for table `group_requests`
--

CREATE TABLE `group_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-09-14 21:34:45', '2020-09-14 21:34:45'),
(2, 1, 2, '2020-09-14 21:34:45', '2020-09-14 21:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Sepak Bola', 'Sepakbola', '2020-12-23 01:39:35', '2020-12-23 01:39:35'),
(2, 'Sepeda', 'sepeda', '2020-12-23 01:40:02', '2020-12-23 01:40:02'),
(3, 'Jalan-jalan', 'jalan-jalan', '2020-12-23 01:40:26', '2020-12-23 01:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `hobbyables`
--

CREATE TABLE `hobbyables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hobby_id` bigint(20) UNSIGNED NOT NULL,
  `hobbyable_id` bigint(20) UNSIGNED NOT NULL,
  `hobbyable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hobbyables`
--

INSERT INTO `hobbyables` (`id`, `hobby_id`, `hobbyable_id`, `hobbyable_type`, `created_at`, `updated_at`) VALUES
(3, 2, 1, 'App\\User', NULL, NULL),
(5, 1, 1, 'App\\User', NULL, NULL),
(7, 2, 2, 'App\\User', '2020-12-29 01:57:43', '2020-12-29 01:57:43'),
(8, 1, 4, 'App\\User', '2020-12-29 02:17:58', '2020-12-29 02:17:58'),
(9, 1, 3, 'App\\User', '2020-12-29 21:40:29', '2020-12-29 21:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `path`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(1, 'users/default.png', 1, 'App\\Post', '2020-09-09 02:34:29', '2020-09-09 02:34:29'),
(2, 'users/default.png', 3, 'App\\Post', '2020-09-09 02:35:10', '2020-09-09 02:35:10'),
(3, 'images/2020/09/1600144485_5f6044658cfdb_bmwCb7gEdUs88eufvnWn.jpg', 1, 'App\\Group', '2020-09-14 21:34:45', '2020-09-14 21:34:45'),
(4, 'news\\2020\\09\\1600243242_5f61c62a8e01c_xcSYSsnmHi3gtjhYePNc.jpg', 2, 'App\\News', '2020-09-16 01:00:42', '2020-09-16 01:00:42'),
(6, 'news\\2020\\12\\1607402394_5fcf039a85ace_5ELnLbyAk14yNzjVyXzS.jpg', 1, 'App\\News', '2020-12-07 21:39:54', '2020-12-07 21:39:54'),
(7, 'events/2020/12/1607411311_5fcf266f9ddc6_Ww1hQEJLW48zZSfRYMnZ.jpg', 1, 'App\\Event', '2020-12-08 00:08:34', '2020-12-08 00:08:34'),
(8, 'images/2/2020/12/1608206808_5fdb49d8e87d7_PHaBFvK0zzuG97M86zTU.jpg', 4, 'App\\Post', '2020-12-17 05:06:49', '2020-12-17 05:06:49'),
(9, 'images/2/2020/12/1608207548_5fdb4cbc4d8cd_cHQ7I2k3ojbQig0hhhdN.jpg', 5, 'App\\Post', '2020-12-17 05:19:08', '2020-12-17 05:19:08'),
(10, 'images/2/2020/12/1608262202_5fdc223a4cbc9_5ACLL1pP0QpdXuaJ25N6.jpg', 10, 'App\\Post', '2020-12-17 20:30:02', '2020-12-17 20:30:02'),
(11, 'images/2/2020/12/1608262202_5fdc223a9153b_7L0mbfKMVzJP9IDkbyDx.jpg', 10, 'App\\Post', '2020-12-17 20:30:02', '2020-12-17 20:30:02'),
(12, 'images/2/2020/12/1608265538_5fdc2f425a4a7_7tE4ocOQ1n7qwbWdQcBF.jpg', 11, 'App\\Post', '2020-12-17 21:25:38', '2020-12-17 21:25:38'),
(13, 'images/2/2020/12/1608265698_5fdc2fe2e2b23_qziJe4WrBmQ0uAGNF0rs.jpg', 12, 'App\\Post', '2020-12-17 21:28:19', '2020-12-17 21:28:19'),
(14, 'images/2/2020/12/1608278106_5fdc605a8237a_cqKCsDEEU3mzIP2HhWtL.jpg', 24, 'App\\Post', '2020-12-18 00:55:06', '2020-12-18 00:55:06'),
(15, 'images/3/2020/12/1609303410_5fec057201cf3_Pzx7Q68Qi5h4INpLgUIN.jpg', 25, 'App\\Post', '2020-12-29 21:43:30', '2020-12-29 21:43:30'),
(16, 'images/3/2020/12/1609303410_5fec057275c04_tBQKJkS7zCyskDyZU9wh.jpg', 25, 'App\\Post', '2020-12-29 21:43:30', '2020-12-29 21:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `likeable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likeable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `likeable_type`, `likeable_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Post', 1, '2020-12-11 02:48:26', '2020-12-11 02:48:26'),
(2, 3, 'App\\Post', 1, '2020-12-11 02:51:37', '2020-12-11 02:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-08-30 21:44:29', '2020-08-30 21:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-08-30 21:44:29', '2020-08-30 21:44:29', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 10, '2020-08-30 21:44:29', '2020-12-23 01:39:06', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2020-08-30 21:44:29', '2020-08-30 22:10:37', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2020-08-30 21:44:29', '2020-08-30 22:10:37', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 11, '2020-08-30 21:44:29', '2020-12-23 01:39:06', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-08-30 21:44:29', '2020-08-30 22:10:37', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-08-30 21:44:29', '2020-08-30 22:10:37', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-08-30 21:44:29', '2020-08-30 22:10:37', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-08-30 21:44:29', '2020-08-30 22:10:37', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 12, '2020-08-30 21:44:29', '2020-12-23 01:39:06', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-08-30 21:44:29', '2020-08-30 22:10:37', 'voyager.hooks', NULL),
(12, 1, 'Admins', '', '_self', 'voyager-people', '#000000', NULL, 2, '2020-08-30 21:50:33', '2020-08-30 22:10:37', 'voyager.admins.index', 'null'),
(13, 1, 'Event Categories', '', '_self', 'voyager-categories', '#000000', NULL, 9, '2020-09-15 23:35:30', '2020-12-23 01:39:06', 'voyager.event-categories.index', 'null'),
(14, 1, 'News Categories', '', '_self', 'voyager-categories', '#000000', NULL, 7, '2020-09-15 23:36:05', '2020-12-23 01:39:05', 'voyager.news-categories.index', 'null'),
(15, 1, 'News', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-09-15 23:43:41', '2020-12-23 01:39:05', 'voyager.news.index', NULL),
(16, 1, 'Events', '', '_self', 'voyager-megaphone', '#000000', NULL, 8, '2020-09-17 20:06:22', '2020-12-23 01:39:05', 'voyager.events.index', 'null'),
(17, 1, 'Hobbies', '', '_self', 'voyager-rocket', '#000000', NULL, 5, '2020-12-23 01:37:25', '2020-12-23 01:39:05', 'voyager.hobbies.index', 'null');

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
(2, '2016_01_01_000000_add_voyager_user_fields', 1),
(3, '2016_01_01_000000_create_data_types_table', 1),
(4, '2016_05_19_173453_create_menu_table', 1),
(5, '2016_10_21_190000_create_roles_table', 1),
(6, '2016_10_21_190000_create_settings_table', 1),
(7, '2016_11_30_135954_create_permission_table', 1),
(8, '2016_11_30_141208_create_permission_role_table', 1),
(9, '2016_12_26_201236_data_types__add__server_side', 1),
(10, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(11, '2017_01_14_005015_create_translations_table', 1),
(12, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(13, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(14, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(15, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(16, '2017_08_05_000000_add_group_to_settings_table', 1),
(17, '2017_11_26_013050_add_user_role_relationship', 1),
(18, '2017_11_26_015000_create_user_roles_table', 1),
(19, '2018_03_11_000000_add_user_settings', 1),
(20, '2018_03_14_000000_add_details_to_data_types_table', 1),
(21, '2018_03_16_000000_make_settings_value_nullable', 1),
(22, '2019_08_19_000000_create_failed_jobs_table', 1),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(24, '2020_08_11_074706_create_admins_table', 1),
(25, '2020_04_04_000000_create_user_follower_table', 2),
(26, '2020_04_09_000000_create_subscriptions_table', 2),
(27, '2020_09_07_035827_create_hobbies_table', 2),
(28, '2020_09_07_040307_create_chats_table', 3),
(29, '2020_09_07_040619_create_geolocations_table', 4),
(30, '2020_09_07_041306_create_event_categories_table', 4),
(31, '2020_09_07_041343_create_news_categories_table', 4),
(36, '2020_09_07_072932_create_comments_table', 4),
(38, '2020_09_07_084257_create_conversations_table', 4),
(39, '2020_09_07_084319_create_group_user_table', 4),
(40, '2020_09_07_141052_create_images_table', 4),
(43, '2020_09_07_072700_create_posts_table', 5),
(45, '2020_09_07_072352_create_places_table', 6),
(46, '2020_09_09_094659_create_placeable_table', 6),
(47, '2020_09_08_021357_create_videos_table', 7),
(48, '2020_09_13_070857_create_group_requests_table', 8),
(49, '2020_09_07_082326_create_groups_table', 9),
(54, '2020_09_07_041405_create_events_table', 10),
(55, '2020_09_07_041619_create_news_table', 10),
(56, '2020_09_30_085403_create_ratings_table', 10),
(57, '2020_10_01_031908_create_discoveries_table', 10),
(58, '2020_12_11_043013_create_likes_table', 11),
(62, '2020_12_23_092141_create_hobbyables_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_category_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `body`, `news_category_id`, `admin_id`, `status`, `meta_description`, `meta_keywords`, `seo_title`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum', 'Lorem Ipsum', '<div id=\"output\" class=\"page-generator__output js-generator-output\">\r\n<p><img src=\"/storage/news/December2020/3.jpg\" alt=\"\" /></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Magna fringilla urna porttitor rhoncus. Purus ut faucibus pulvinar elementum integer enim neque. Ipsum a arcu cursus vitae congue. Justo nec ultrices dui sapien eget mi proin. Massa placerat duis ultricies lacus sed turpis. Aliquam id diam maecenas ultricies mi eget mauris. Eget lorem dolor sed viverra ipsum. Interdum velit laoreet id donec ultrices tincidunt arcu. Tristique risus nec feugiat in. Urna et pharetra pharetra massa massa ultricies. Viverra vitae congue eu consequat. Ut aliquam purus sit amet. In eu mi bibendum neque. Egestas pretium aenean pharetra magna ac. Placerat duis ultricies lacus sed turpis tincidunt id aliquet. Viverra suspendisse potenti nullam ac tortor vitae purus faucibus ornare.</p>\r\n<p>Volutpat diam ut venenatis tellus in metus vulputate eu scelerisque. Volutpat commodo sed egestas egestas fringilla. Sit amet purus gravida quis blandit turpis cursus in hac. Arcu dui vivamus arcu felis bibendum ut tristique et. Volutpat commodo sed egestas egestas fringilla phasellus. Tincidunt ornare massa eget egestas purus viverra. Nunc eget lorem dolor sed viverra ipsum nunc. Id diam maecenas ultricies mi eget mauris pharetra. Nisl condimentum id venenatis a condimentum vitae sapien pellentesque. In arcu cursus euismod quis viverra nibh cras pulvinar mattis. Nulla posuere sollicitudin aliquam ultrices. Nunc eget lorem dolor sed viverra ipsum nunc. Vitae aliquet nec ullamcorper sit amet risus nullam eget. Arcu non odio euismod lacinia at quis risus sed.</p>\r\n<p>At lectus urna duis convallis convallis tellus id interdum. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Mattis aliquam faucibus purus in massa tempor nec feugiat nisl. Diam maecenas sed enim ut sem viverra aliquet eget sit. Morbi blandit cursus risus at ultrices mi tempus. Nec dui nunc mattis enim ut tellus elementum. Lacus sed turpis tincidunt id aliquet. Ut etiam sit amet nisl purus in mollis. Convallis aenean et tortor at risus viverra adipiscing at in. Tellus in metus vulputate eu scelerisque felis imperdiet proin. Accumsan tortor posuere ac ut consequat semper viverra. Dui ut ornare lectus sit. Suspendisse faucibus interdum posuere lorem ipsum dolor. Arcu odio ut sem nulla. Lobortis mattis aliquam faucibus purus. Ultrices in iaculis nunc sed augue lacus viverra vitae. In cursus turpis massa tincidunt dui ut ornare. Nisl purus in mollis nunc sed id semper.</p>\r\n<p>Velit egestas dui id ornare arcu odio ut sem. Tellus integer feugiat scelerisque varius morbi enim nunc faucibus. In tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Lacus sed viverra tellus in hac. Tellus id interdum velit laoreet id donec ultrices. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Semper eget duis at tellus at urna condimentum mattis. Ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim. Ut porttitor leo a diam sollicitudin tempor. Aliquam sem fringilla ut morbi tincidunt augue interdum. Sed augue lacus viverra vitae. Diam phasellus vestibulum lorem sed.</p>\r\n<p>Massa sed elementum tempus egestas sed sed risus. Convallis posuere morbi leo urna molestie at. Sit amet luctus venenatis lectus magna fringilla urna porttitor rhoncus. Lorem sed risus ultricies tristique nulla aliquet enim tortor at. Quam elementum pulvinar etiam non quam lacus suspendisse faucibus. Convallis a cras semper auctor neque vitae. Neque convallis a cras semper auctor neque vitae. Purus semper eget duis at tellus at urna condimentum. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Faucibus turpis in eu mi bibendum neque egestas. Gravida quis blandit turpis cursus in hac habitasse.</p>\r\n</div>', 1, 1, 'PUBLISHED', NULL, NULL, NULL, '2020-12-07 21:39:54', '2020-12-07 21:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_categories`
--

INSERT INTO `news_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Umum', '2020-09-15 23:37:22', '2020-09-15 23:37:22'),
(2, 'Bisnis', '2020-09-16 00:13:07', '2020-09-16 00:13:07');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(2, 'browse_bread', NULL, '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(3, 'browse_database', NULL, '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(4, 'browse_media', NULL, '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(5, 'browse_compass', NULL, '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(6, 'browse_menus', 'menus', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(7, 'read_menus', 'menus', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(8, 'edit_menus', 'menus', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(9, 'add_menus', 'menus', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(10, 'delete_menus', 'menus', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(11, 'browse_roles', 'roles', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(12, 'read_roles', 'roles', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(13, 'edit_roles', 'roles', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(14, 'add_roles', 'roles', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(15, 'delete_roles', 'roles', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(16, 'browse_users', 'users', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(17, 'read_users', 'users', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(18, 'edit_users', 'users', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(19, 'add_users', 'users', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(20, 'delete_users', 'users', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(21, 'browse_settings', 'settings', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(22, 'read_settings', 'settings', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(23, 'edit_settings', 'settings', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(24, 'add_settings', 'settings', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(25, 'delete_settings', 'settings', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(26, 'browse_hooks', NULL, '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(27, 'browse_admins', 'admins', '2020-08-30 21:50:33', '2020-08-30 21:50:33'),
(28, 'read_admins', 'admins', '2020-08-30 21:50:33', '2020-08-30 21:50:33'),
(29, 'edit_admins', 'admins', '2020-08-30 21:50:33', '2020-08-30 21:50:33'),
(30, 'add_admins', 'admins', '2020-08-30 21:50:33', '2020-08-30 21:50:33'),
(31, 'delete_admins', 'admins', '2020-08-30 21:50:33', '2020-08-30 21:50:33'),
(32, 'browse_event_categories', 'event_categories', '2020-09-15 23:35:30', '2020-09-15 23:35:30'),
(33, 'read_event_categories', 'event_categories', '2020-09-15 23:35:30', '2020-09-15 23:35:30'),
(34, 'edit_event_categories', 'event_categories', '2020-09-15 23:35:30', '2020-09-15 23:35:30'),
(35, 'add_event_categories', 'event_categories', '2020-09-15 23:35:30', '2020-09-15 23:35:30'),
(36, 'delete_event_categories', 'event_categories', '2020-09-15 23:35:30', '2020-09-15 23:35:30'),
(37, 'browse_news_categories', 'news_categories', '2020-09-15 23:36:05', '2020-09-15 23:36:05'),
(38, 'read_news_categories', 'news_categories', '2020-09-15 23:36:05', '2020-09-15 23:36:05'),
(39, 'edit_news_categories', 'news_categories', '2020-09-15 23:36:05', '2020-09-15 23:36:05'),
(40, 'add_news_categories', 'news_categories', '2020-09-15 23:36:05', '2020-09-15 23:36:05'),
(41, 'delete_news_categories', 'news_categories', '2020-09-15 23:36:05', '2020-09-15 23:36:05'),
(42, 'browse_news', 'news', '2020-09-15 23:43:41', '2020-09-15 23:43:41'),
(43, 'read_news', 'news', '2020-09-15 23:43:41', '2020-09-15 23:43:41'),
(44, 'edit_news', 'news', '2020-09-15 23:43:41', '2020-09-15 23:43:41'),
(45, 'add_news', 'news', '2020-09-15 23:43:41', '2020-09-15 23:43:41'),
(46, 'delete_news', 'news', '2020-09-15 23:43:41', '2020-09-15 23:43:41'),
(47, 'browse_events', 'events', '2020-09-17 20:06:22', '2020-09-17 20:06:22'),
(48, 'read_events', 'events', '2020-09-17 20:06:22', '2020-09-17 20:06:22'),
(49, 'edit_events', 'events', '2020-09-17 20:06:22', '2020-09-17 20:06:22'),
(50, 'add_events', 'events', '2020-09-17 20:06:22', '2020-09-17 20:06:22'),
(51, 'delete_events', 'events', '2020-09-17 20:06:22', '2020-09-17 20:06:22'),
(52, 'browse_hobbies', 'hobbies', '2020-12-23 01:37:25', '2020-12-23 01:37:25'),
(53, 'read_hobbies', 'hobbies', '2020-12-23 01:37:25', '2020-12-23 01:37:25'),
(54, 'edit_hobbies', 'hobbies', '2020-12-23 01:37:25', '2020-12-23 01:37:25'),
(55, 'add_hobbies', 'hobbies', '2020-12-23 01:37:25', '2020-12-23 01:37:25'),
(56, 'delete_hobbies', 'hobbies', '2020-12-23 01:37:25', '2020-12-23 01:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(17, 'App\\User', 1, 'Android', 'dda7e9aab742d2891d5f7777430f870c457b4db08af0bb8f8c627767319f3d70', '[\"*\"]', NULL, '2020-10-06 22:03:50', '2020-10-06 22:03:50'),
(27, 'App\\User', 1, 'web', '9615f45c383bdfc4df6f3bf21e27130f60d275ca2624d9c0ce5929441777c9d4', '[\"*\"]', '2020-11-12 23:12:43', '2020-11-12 20:14:00', '2020-11-12 23:12:43'),
(50, 'App\\User', 2, 'Android', 'f6e19af75f944f7f7ad5921e3f98edbd7214695bf212a802249e8ad90273261c', '[\"*\"]', '2020-12-29 01:58:04', '2020-12-29 01:46:28', '2020-12-29 01:58:04'),
(52, 'App\\User', 4, 'Android', 'a843d19e6fe9e77c0c7ea744bd27cbb66534ed31291a669cc185f5f08767545f', '[\"*\"]', '2020-12-29 21:38:48', '2020-12-29 02:17:32', '2020-12-29 21:38:48'),
(54, 'App\\User', 3, 'Android', 'd39ff9c5d81fa8d7475f9fc7d25cfce819e2c17d645a6031bd7fc8f3a864a34d', '[\"*\"]', '2020-12-31 02:47:21', '2020-12-30 02:54:28', '2020-12-31 02:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `placeables`
--

CREATE TABLE `placeables` (
  `place_id` bigint(20) UNSIGNED NOT NULL,
  `placeable_id` bigint(20) UNSIGNED NOT NULL,
  `placeable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `placeables`
--

INSERT INTO `placeables` (`place_id`, `placeable_id`, `placeable_type`) VALUES
(3, 10, 'App\\Post'),
(4, 25, 'App\\Post');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `zoom` tinyint(4) NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `address`, `lat`, `lng`, `zoom`, `created_at`, `updated_at`) VALUES
(2, 'bandung', 'dago', -1103498.809, 4358908.098320489, 10, '2020-09-10 08:03:42', '2020-09-10 08:03:42'),
(3, 'Citarum', 'Bandung Indah Plaza (Counter in Matahari), JL. Merdeka, No. 56, 40115, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40117, Indonesia', -6.908591400000001, 107.61080129999999, 10, '2020-12-17 20:30:02', '2020-12-17 20:30:02'),
(4, '52, Jl. Terusan Halimun', 'Jl. Terusan Halimun No.52, Lkr. Sel., Kec. Lengkong, Kota Bandung, Jawa Barat 40263, Indonesia', -6.927366090191594, 107.62602187693119, 10, '2020-12-29 21:43:29', '2020-12-29 21:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `caption`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Test Lorem ipsum', 1, '2020-09-09 02:30:53', '2020-09-09 02:30:53'),
(2, 'Test Post', 1, '2020-09-09 02:32:20', '2020-09-09 02:32:20'),
(3, 'Test Post', 1, '2020-09-09 02:35:10', '2020-09-09 02:35:10'),
(4, 'test', 2, '2020-12-17 05:06:46', '2020-12-17 05:06:46'),
(5, 'hbd', 2, '2020-12-17 05:19:07', '2020-12-17 05:19:07'),
(10, 'WhatsApp support', 2, '2020-12-17 20:30:01', '2020-12-17 20:30:01'),
(11, 'web binar', 2, '2020-12-17 21:25:38', '2020-12-17 21:25:38'),
(12, 'kartun', 2, '2020-12-17 21:28:18', '2020-12-17 21:28:18'),
(23, 'fiary tale', 2, '2020-12-17 23:45:10', '2020-12-17 23:45:10'),
(24, 'dijual', 2, '2020-12-18 00:55:05', '2020-12-18 00:55:05'),
(25, 'test upload', 3, '2020-12-29 21:43:29', '2020-12-29 21:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rateable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-08-30 21:44:29', '2020-08-30 21:44:29'),
(2, 'user', 'Normal User', '2020-08-30 21:44:29', '2020-08-30 21:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `subscribable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `subscribable_type`, `subscribable_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Hobby', 1, '2020-12-23 01:46:26', '2020-12-23 01:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users/default.png',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `avatar`, `email`, `email_verified_at`, `password`, `notify_token`, `facebook_token`, `twitter_token`, `google_token`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`) VALUES
(1, NULL, 'Rizal Muhamad H', 'users/default.png', 'rizalm15@gmail.com', NULL, '$2y$10$AvdBb4zy9/tNKInTYglwyuwmLxqZO/uXseJvKzVdU79S7WoMsoh8e', NULL, NULL, NULL, NULL, NULL, '{\"locale\":\"en\"}', '2020-09-08 00:43:44', '2020-10-06 21:55:54', '085722122731'),
(2, NULL, 'Neo', 'users/default.png', 'neoilusionne@gmail.com', NULL, '$2y$10$tIZVowseDTCOzm3SkL3BKeS4A3TlqvEpwRR6pWp..UUwPgUNpEzVq', NULL, NULL, NULL, NULL, NULL, '{\"locale\":\"id\"}', '2020-09-08 00:44:18', '2020-10-08 19:23:19', '08112347895'),
(3, NULL, 'Emulator', 'users/default.png', 'emu@gmail.com', NULL, '$2y$10$KikS9o79mUCeyMdrTFifHeLe5CZ58/eygMW27lJ30bFaVs5f9O19O', NULL, NULL, NULL, NULL, NULL, '{\"locale\":\"en\"}', '2020-10-06 01:35:04', '2020-10-06 21:55:36', '085722022730'),
(4, NULL, 'Admin', 'users/default.png', 'admin@admin.com', NULL, '$2y$10$YPND.OTC76F/hW9tfTeJe.zsZ7t8SAP2l4zqb9o9hn3J6X/oTirRm', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 02:02:32', '2020-12-29 02:02:32', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_follower`
--

CREATE TABLE `user_follower` (
  `id` int(10) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_follower`
--

INSERT INTO `user_follower` (`id`, `following_id`, `follower_id`, `accepted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2020-09-08 09:46:39', NULL, NULL),
(2, 2, 1, '2020-09-08 09:46:39', NULL, NULL),
(3, 3, 1, '2020-12-10 09:46:39', NULL, NULL),
(4, 1, 3, '2020-12-02 09:46:39', NULL, NULL),
(5, 2, 3, '2020-12-29 23:33:05', '2020-12-29 23:33:05', '2020-12-29 23:33:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `videoable_id` bigint(20) UNSIGNED NOT NULL,
  `videoable_type` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `path`, `videoable_id`, `videoable_type`, `created_at`, `updated_at`) VALUES
(1, '{\"download_link\":\"videos\\/2\\/2020\\/12\\/ZaU3hsMCy7I3zUCb7q65.mp4\",\"original_name\":\"VID-20201216-WA0008.mp4\"}', 23, 0, '2020-12-17 23:45:10', '2020-12-17 23:45:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `discoveries`
--
ALTER TABLE `discoveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_event_category_id_foreign` (`event_category_id`),
  ADD KEY `events_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `geolocations`
--
ALTER TABLE `geolocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `geolocations_user_id_foreign` (`user_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_requests`
--
ALTER TABLE `group_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_requests_group_id_foreign` (`group_id`),
  ADD KEY `group_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hobbyables`
--
ALTER TABLE `hobbyables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`),
  ADD KEY `likes_user_id_index` (`user_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_news_category_id_foreign` (`news_category_id`),
  ADD KEY `news_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_rateable_type_rateable_id_index` (`rateable_type`,`rateable_id`),
  ADD KEY `ratings_rateable_id_index` (`rateable_id`),
  ADD KEY `ratings_rateable_type_index` (`rateable_type`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_subscribable_type_subscribable_id_index` (`subscribable_type`,`subscribable_id`),
  ADD KEY `subscriptions_user_id_index` (`user_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_follower`
--
ALTER TABLE `user_follower`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_follower_following_id_index` (`following_id`),
  ADD KEY `user_follower_follower_id_index` (`follower_id`),
  ADD KEY `user_follower_accepted_at_index` (`accepted_at`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`,`user_id`) USING BTREE,
  ADD UNIQUE KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `discoveries`
--
ALTER TABLE `discoveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geolocations`
--
ALTER TABLE `geolocations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_requests`
--
ALTER TABLE `group_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hobbyables`
--
ALTER TABLE `hobbyables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_follower`
--
ALTER TABLE `user_follower`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `events_event_category_id_foreign` FOREIGN KEY (`event_category_id`) REFERENCES `event_categories` (`id`);

--
-- Constraints for table `geolocations`
--
ALTER TABLE `geolocations`
  ADD CONSTRAINT `geolocations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `group_requests`
--
ALTER TABLE `group_requests`
  ADD CONSTRAINT `group_requests_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `news_news_category_id_foreign` FOREIGN KEY (`news_category_id`) REFERENCES `news_categories` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
