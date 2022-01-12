-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2021 at 11:06 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `folk`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  `migration_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `comment_txt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboards`
--

CREATE TABLE `dashboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboards`
--

INSERT INTO `dashboards` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Joy Dash', 2, '2021-12-12 07:28:09', '2021-12-12 07:28:09'),
(2, 'Bipro Dash', 1, '2021-12-12 07:41:30', '2021-12-12 07:41:30');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_events`
--

CREATE TABLE `family_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `event_time` time NOT NULL,
  `user_id` int(11) NOT NULL,
  `venue_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue_lat` decimal(10,2) DEFAULT NULL,
  `venue_lng` decimal(10,2) DEFAULT NULL,
  `venue_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_intro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_members`
--

CREATE TABLE `family_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending' COMMENT 'Pending,Waiting,Accepted,Rejected',
  `is_legacy` tinyint(1) DEFAULT 0,
  `legacy_request` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_members`
--

INSERT INTO `family_members` (`id`, `user_id`, `member_id`, `status`, `is_legacy`, `legacy_request`, `dashboard_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Accepted', 0, NULL, 1, '2021-12-12 07:28:09', '2021-12-12 07:28:09'),
(2, 1, 2, 'Accepted', 0, NULL, 1, '2021-12-12 07:49:58', '2021-12-12 07:28:25'),
(3, 2, 1, 'Accepted', 0, NULL, 1, '2021-12-12 07:49:58', '2021-12-12 07:28:25'),
(4, 1, 1, 'Accepted', 0, NULL, 2, '2021-12-12 07:41:30', '2021-12-12 07:41:30');

-- --------------------------------------------------------

--
-- Table structure for table `family_trees`
--

CREATE TABLE `family_trees` (
  `id` int(10) UNSIGNED NOT NULL,
  `father_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `relation_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Father,Mother,Sister,Bother,Son,Daughter',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_tree_nodes`
--

CREATE TABLE `family_tree_nodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tree_parents_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_tree_parents`
--

CREATE TABLE `family_tree_parents` (
  `id` int(10) UNSIGNED NOT NULL,
  `relation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_member_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feeds`
--

CREATE TABLE `feeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `feed_txt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `lost_person_id` int(11) NOT NULL,
  `comment_count` int(11) DEFAULT 0,
  `love_count` int(11) DEFAULT 0,
  `remember_count` int(11) DEFAULT 0,
  `feed_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'memorial',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feelings`
--

CREATE TABLE `feelings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image,Docs',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funeral_events`
--

CREATE TABLE `funeral_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `eventtype_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lost_person_id` int(10) UNSIGNED NOT NULL,
  `funeral_date` date NOT NULL,
  `funeral_time` time NOT NULL,
  `venue_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue_lat` decimal(10,2) DEFAULT NULL,
  `venue_lng` decimal(10,2) DEFAULT NULL,
  `venue_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mourner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_intro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `last_messages`
--

CREATE TABLE `last_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `msg_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_img` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msg_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_reason_id` int(11) NOT NULL,
  `feeling_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `opened_type_id` int(11) NOT NULL,
  `privacy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration_start` date DEFAULT NULL,
  `duration_end` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `legacy_contacts`
--

CREATE TABLE `legacy_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loves`
--

CREATE TABLE `loves` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Love,Remember',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memorial_mode_confirmations`
--

CREATE TABLE `memorial_mode_confirmations` (
  `id` int(10) UNSIGNED NOT NULL,
  `legacy_id` int(11) NOT NULL,
  `lost_person_id` int(11) NOT NULL,
  `is_agree` tinyint(1) DEFAULT 1,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_reasons`
--

CREATE TABLE `message_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_tags`
--

CREATE TABLE `message_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_id` int(11) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `noti_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) DEFAULT 0,
  `counter` int(11) DEFAULT 0,
  `other_counter` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opened_types`
--

CREATE TABLE `opened_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_intro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `profile_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'http://localhost:3333/uploads/pet.png',
  `date_of_death` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'User' COMMENT 'User,Admin',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Male,Female,Others',
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'http://localhost:3333/uploads/download.png',
  `verification_code` int(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `anniversary_day` date DEFAULT NULL,
  `remember_me_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_step` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Step1,Step2,Step3',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Active' COMMENT 'Verified,Unverified,Active,Banned',
  `fav_photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `death_certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_memorial` tinyint(1) DEFAULT 0,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twiteer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `time` time DEFAULT NULL,
  `career` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `user_type`, `slug`, `email`, `phone`, `address`, `gender`, `access_token`, `profile_pic`, `verification_code`, `birthday`, `date_of_death`, `anniversary_day`, `remember_me_token`, `is_verified`, `designation`, `register_step`, `status`, `fav_photo`, `death_certificate`, `is_memorial`, `password`, `instagram`, `linkedin`, `facebook`, `twiteer`, `website`, `created_at`, `updated_at`, `time`, `career`) VALUES
(1, 'Bipro Bhowmik Joy', NULL, 'User', 'Bipro_Bhowmik_Joy', 'biprobhowmik5@gmail.com', NULL, NULL, NULL, 'ya29.a0ARrdaM84Cv-pfaj5EL-i3Op735iANq27xwQwzLOAx5R7zTKLo8aN3JGsYxHQT2LnRSk_A_P7miHvXZ88fu4G6P9xfi3L6sWw9yNYyQb992yQOPZqEWShYE_u22bW1mGIzDqLfVy8OTdHXhoFNuFT2MAQ4Zp3', 'https://lh3.googleusercontent.com/a-/AOh14GiF_RpNdzXuhnAL0NtboEPRUJas89PXBZ_M4EM0=s96-c', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'Active', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-12 07:10:36', '2021-12-12 07:10:36', NULL, NULL),
(2, 'Joy', NULL, 'User', 'Joy', 'joy@gmail.com', '01766221373', NULL, NULL, NULL, 'http://localhost:3333/uploads/download.png', NULL, '2021-12-01', NULL, NULL, NULL, 0, NULL, NULL, 'Active', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-12 07:44:28', '2021-12-12 07:14:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'life_live,cherish,about_future,last_intention,career,life_purpose,short_intro',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Private' COMMENT 'Public,Private',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `user_id`, `key`, `value`, `privacy`, `created_at`, `updated_at`) VALUES
(1, 1, 'life_live', NULL, 'Private', '2021-12-12 07:10:36', '2021-12-12 07:10:36'),
(2, 1, 'cherish', NULL, 'Private', '2021-12-12 07:10:36', '2021-12-12 07:10:36'),
(3, 1, 'about_future', NULL, 'Private', '2021-12-12 07:10:36', '2021-12-12 07:10:36'),
(4, 1, 'last_intention', NULL, 'Private', '2021-12-12 07:10:36', '2021-12-12 07:10:36'),
(5, 1, 'career', NULL, 'Private', '2021-12-12 07:10:36', '2021-12-12 07:10:36'),
(6, 1, 'life_purpose', NULL, 'Private', '2021-12-12 07:10:36', '2021-12-12 07:10:36'),
(7, 1, 'short_intro', NULL, 'Private', '2021-12-12 07:10:36', '2021-12-12 07:10:36'),
(8, 2, 'life_live', NULL, 'Private', '2021-12-12 07:14:17', '2021-12-12 07:14:17'),
(9, 2, 'cherish', NULL, 'Private', '2021-12-12 07:14:17', '2021-12-12 07:14:17'),
(10, 2, 'about_future', NULL, 'Private', '2021-12-12 07:14:17', '2021-12-12 07:14:17'),
(11, 2, 'last_intention', NULL, 'Private', '2021-12-12 07:14:17', '2021-12-12 07:14:17'),
(12, 2, 'career', NULL, 'Private', '2021-12-12 07:14:17', '2021-12-12 07:14:17'),
(13, 2, 'life_purpose', NULL, 'Private', '2021-12-12 07:14:17', '2021-12-12 07:14:17'),
(14, 2, 'short_intro', NULL, 'Private', '2021-12-12 07:14:17', '2021-12-12 07:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_pets`
--

CREATE TABLE `user_pets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboards`
--
ALTER TABLE `dashboards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_events`
--
ALTER TABLE `family_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_members`
--
ALTER TABLE `family_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `family_members_user_id_foreign` (`user_id`),
  ADD KEY `family_members_member_id_foreign` (`member_id`);

--
-- Indexes for table `family_trees`
--
ALTER TABLE `family_trees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_tree_nodes`
--
ALTER TABLE `family_tree_nodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_tree_parents`
--
ALTER TABLE `family_tree_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feeds`
--
ALTER TABLE `feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feelings`
--
ALTER TABLE `feelings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funeral_events`
--
ALTER TABLE `funeral_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funeral_events_event_id_foreign` (`event_id`),
  ADD KEY `funeral_events_eventtype_id_foreign` (`eventtype_id`),
  ADD KEY `funeral_events_user_id_foreign` (`user_id`),
  ADD KEY `funeral_events_lost_person_id_foreign` (`lost_person_id`);

--
-- Indexes for table `last_messages`
--
ALTER TABLE `last_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legacy_contacts`
--
ALTER TABLE `legacy_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loves`
--
ALTER TABLE `loves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memorial_mode_confirmations`
--
ALTER TABLE `memorial_mode_confirmations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_reasons`
--
ALTER TABLE `message_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_tags`
--
ALTER TABLE `message_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opened_types`
--
ALTER TABLE `opened_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_infos_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_pets`
--
ALTER TABLE `user_pets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboards`
--
ALTER TABLE `dashboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_events`
--
ALTER TABLE `family_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_members`
--
ALTER TABLE `family_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `family_trees`
--
ALTER TABLE `family_trees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_tree_nodes`
--
ALTER TABLE `family_tree_nodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_tree_parents`
--
ALTER TABLE `family_tree_parents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feelings`
--
ALTER TABLE `feelings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funeral_events`
--
ALTER TABLE `funeral_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `last_messages`
--
ALTER TABLE `last_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legacy_contacts`
--
ALTER TABLE `legacy_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loves`
--
ALTER TABLE `loves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memorial_mode_confirmations`
--
ALTER TABLE `memorial_mode_confirmations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_reasons`
--
ALTER TABLE `message_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_tags`
--
ALTER TABLE `message_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opened_types`
--
ALTER TABLE `opened_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_pets`
--
ALTER TABLE `user_pets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `family_members`
--
ALTER TABLE `family_members`
  ADD CONSTRAINT `family_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `family_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `funeral_events`
--
ALTER TABLE `funeral_events`
  ADD CONSTRAINT `funeral_events_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funeral_events_eventtype_id_foreign` FOREIGN KEY (`eventtype_id`) REFERENCES `event_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funeral_events_lost_person_id_foreign` FOREIGN KEY (`lost_person_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `funeral_events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD CONSTRAINT `user_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
