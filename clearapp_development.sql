-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2018 at 10:54 PM
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
-- Database: `clearapp_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) NOT NULL,
  `reg_number` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `sponsor` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `is_dean_approve` int(11) NOT NULL DEFAULT '2',
  `is_hod_approve` int(11) NOT NULL DEFAULT '2',
  `is_finance_approve` int(11) NOT NULL DEFAULT '2',
  `is_warden_approve` int(11) NOT NULL DEFAULT '2',
  `is_librarian_approve` int(11) NOT NULL DEFAULT '2',
  `student_id` int(11) DEFAULT NULL,
  `dean_comment` varchar(255) DEFAULT NULL,
  `hod_comment` varchar(255) DEFAULT NULL,
  `warden_comment` varchar(255) DEFAULT NULL,
  `finance_comment` varchar(255) DEFAULT NULL,
  `librarian_comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `reg_number`, `first_name`, `last_name`, `email`, `telephone`, `sex`, `department`, `level`, `academic_year`, `sponsor`, `created_at`, `updated_at`, `picture`, `is_dean_approve`, `is_hod_approve`, `is_finance_approve`, `is_warden_approve`, `is_librarian_approve`, `student_id`, `dean_comment`, `hod_comment`, `warden_comment`, `finance_comment`, `librarian_comment`) VALUES
(1, 216895068, 'Olivier', 'Niyomugabo', 'nivierlos@gmail.com', '0784735963', 'Male', 'IT', 3, '2018-2019', 'REB', '2018-09-19 00:00:00', '2018-09-25 00:40:25', NULL, 0, 1, 2, 2, 2, NULL, 'You have failed modules', NULL, NULL, NULL, NULL),
(2, 216268095, 'Hello', 'Test', 'test@hello.com', '072457896', 'Female', 'IT', 3, '2017-2018', 'FARG', '2018-09-17 00:00:00', '2018-09-22 02:08:10', NULL, 1, 2, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2136596, 'Test', 'Class', 'class@example.com', '0736558990', 'Male', 'IT', 2, '2015-2016', 'SELF', '2018-08-02 00:00:00', '2018-09-25 00:37:36', NULL, 0, 2, 2, 2, 2, NULL, 'Check year 1', NULL, NULL, NULL, NULL),
(4, 216295068, 'Olivier ', 'Niyomugabo', 'nivierlos@gmail.com', '0784735963', 'Male', 'IT', 3, '2016-2017', 'REB', '2018-09-24 16:19:38', '2018-09-25 00:40:43', NULL, 1, 2, 2, 2, 2, 1, 'You have problem in this modules; ITE2163 and ITE2362', NULL, NULL, NULL, NULL),
(5, 123466, 'test', 'Gmail', 'test@gmail.com', '07856', 'Male', 'IT', 1, '2016-2017', 'REB', '2018-09-25 20:40:40', '2018-09-25 20:44:14', NULL, 1, 2, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 123466, 'test', 'Gmail', 'test@gmail.com', '07856', 'Male', 'IT', 1, '2016-2017', 'REB', '2018-09-25 20:40:55', '2018-09-25 20:40:55', NULL, 2, 2, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 123466, 'test', 'Gmail', 'test@gmail.com', '07856', 'Male', 'IT', 1, '2016-2017', 'REB', '2018-09-25 20:50:21', '2018-09-25 20:51:32', NULL, 0, 2, 2, 2, 2, 3, 'You have failed some modules', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2018-09-17 20:27:34', '2018-09-17 20:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20180917202722'),
('20180918151558'),
('20180918151724'),
('20180918160723'),
('20180919212050'),
('20180919215514'),
('20180920032830'),
('20180920163958'),
('20180920164307'),
('20180920164733'),
('20180920185853'),
('20180920235745'),
('20180922165607'),
('20180922202157'),
('20180924121325'),
('20180924190503'),
('20180925181452'),
('20180925194936');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) NOT NULL,
  `reg_number` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `sponsor` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `reg_number`, `first_name`, `last_name`, `email`, `telephone`, `sex`, `department`, `level`, `academic_year`, `sponsor`, `created_at`, `updated_at`, `password_hash`, `password_salt`, `auth_token`) VALUES
(1, 216295068, 'Olivier ', 'Niyomugabo', 'nivierlos@gmail.com', '0784735963', 'Male', 'IT', 3, '2016-2017', 'REB', '2018-09-22 17:47:36', '2018-09-24 17:42:34', '$2a$10$LcFGHJQnkpa7TTQCNqHmUeOggajUS.L9OmYERTje/82sH3XEBX.JK', '$2a$10$LcFGHJQnkpa7TTQCNqHmUe', 'Yq4Ft23FChiWxdlBEn0iSQ\"'),
(2, 216598, 'test', 'twes', 'niv@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-22 17:48:26', '2018-09-22 17:48:26', '$2a$10$LcFGHJQnkpa7TTQCNqHmUeOggajUS.L9OmYERTje/82sH3XEBX.JK', '$2a$10$LcFGHJQnkpa7TTQCNqHmUe', 'w2NcAQ4mU3tuezbynsfawA\"'),
(3, 123466, 'test', 'Gmail', 'test@gmail.com', '07856', 'Male', 'IT', 1, '2016-2017', 'REB', '2018-09-25 01:51:33', '2018-09-25 20:40:25', '$2a$10$9PJgkFlrDs4Wi0h2EjR.WO7TK0p/ZsJyeVF5c.fzBXIZ.Llssc8aq', '$2a$10$9PJgkFlrDs4Wi0h2EjR.WO', '531wqCCd6Gt18Ls_c_G78Q');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `remember_digest` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `password_reset_sent_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `password_hash`, `password_salt`, `created_at`, `updated_at`, `remember_digest`, `auth_token`, `password_reset_token`, `password_reset_sent_at`) VALUES
(1, 'Olivier Niyomugabo', 'nivierlos@gmail.com', 'Dean', '$2a$10$dRGKRKr0wuVOeCHo3aWoPuE3d8co0MxkQ9VdhjDchd/V5qk1J7jhW', '$2a$10$dRGKRKr0wuVOeCHo3aWoPu', '2018-09-20 01:23:55', '2018-09-25 20:36:05', NULL, 'uckw0Fd_WhWFM8gbFoLQqA', 'SQBrs-6YqCsmc0Dq8u8_6Q', '2018-09-25 20:36:05'),
(3, 'Test Gmail', 'test@gmail.com', 'HOD', '$2a$10$P.0tAx4Q9bDiIr94M/7FZurE8unr0uOnuVolN.Kq5zk.Kg3Bff.WK', '$2a$10$P.0tAx4Q9bDiIr94M/7FZu', '2018-09-20 19:06:41', '2018-09-25 20:05:57', NULL, 'b6PryK4b-PljOMFsYpwYzA', '4yXB1neO6ECLAjKX5OO4zg', '2018-09-25 20:05:57'),
(4, 'Test', 'Warden', 'warden@test.com', '$2a$10$RBGATmb9ZRkTH4RkgjxOSOieeD9E2CSDVC2l5TLVv4/Fx/PV3j5J6', '$2a$10$RBGATmb9ZRkTH4RkgjxOSO', '2018-09-22 18:07:32', '2018-09-22 18:07:32', NULL, 'cs3jyzxHxsq6-Kkq1iExVQ', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
