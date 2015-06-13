-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2015 at 04:49 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thesis`
--

-- --------------------------------------------------------

--
-- Table structure for table `biggroup_group`
--

CREATE TABLE IF NOT EXISTS `biggroup_group` (
  `id_big_group_face` int(11) NOT NULL,
  `id_group_face` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `biggroup_group`
--

INSERT INTO `biggroup_group` (`id_big_group_face`, `id_group_face`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 11),
(3, 12),
(3, 13),
(4, 11),
(5, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `big_group_face`
--

CREATE TABLE IF NOT EXISTS `big_group_face` (
`id_big_group_face` int(11) NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_big_group_face` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `big_group_face`
--

INSERT INTO `big_group_face` (`id_big_group_face`, `client_id`, `image`, `name_big_group_face`) VALUES
(1, '1424801057844165', NULL, 'Group 1'),
(2, '1424801057844165', NULL, 'Group 2'),
(3, '1617179881832546', NULL, 'Minh Nguyễn'),
(4, '1617179881832546', NULL, 'Minh Nguyễn2'),
(5, '108575602813001', NULL, 'Minh A Nguyen');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
`id` int(11) NOT NULL,
  `date_create` datetime DEFAULT NULL,
  `from_client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_face`
--

CREATE TABLE IF NOT EXISTS `group_face` (
`id` int(11) NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_group_face` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_group_face` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `group_face`
--

INSERT INTO `group_face` (`id`, `client_id`, `id_group_face`, `name_group_face`) VALUES
(1, '1424801057844165', '425608607618275', 'Thesis 3 - Sport'),
(2, '1424801057844165', '381751885368133', 'Thesis 2 - Music'),
(3, '1424801057844165', '1153057674711735', 'Thesis 1 - Education'),
(4, '1424378184552921', '425608607618275', 'Thesis 3 - Sport'),
(5, '1424378184552921', '381751885368133', 'Thesis 2 - Music'),
(6, '1424378184552921', '1153057674711735', 'Thesis 1 - Education'),
(7, '108575602813001', '832458093505507', 'Thesis 4 - Work'),
(8, '108575602813001', '425608607618275', 'Thesis 3 - Sport'),
(9, '108575602813001', '381751885368133', 'Thesis 2 - Music'),
(10, '108575602813001', '1153057674711735', 'Thesis 1 - Education'),
(11, '1617179881832546', '374979216039530', 'ThesisMinhHiep3'),
(12, '1617179881832546', '1642294075990555', 'ThesisMinhHiep2'),
(13, '1617179881832546', '943562415694364', 'ThesisMinhHiep'),
(14, '1617179881832546', '935998529777903', 'Thesis.TDT.201503'),
(15, '1617179881832546', '1407547466214455', 'csc-oanhBai'),
(16, '1617179881832546', '506496509489500', 'Nướng thịt BQ'),
(17, '1617179881832546', '1563170463899461', 'CSC Java Fresher Dec-2014'),
(18, '1617179881832546', '271523319667578', 'FPT & Friends'),
(19, '1617179881832546', '312349358968371', '♡♡♡PRACTICE FACE  To  FACE  ENGLISH   ♡♡♡'),
(20, '1617179881832546', '797872106904673', 'Practice Face to Face English Chat <3'),
(21, '1617179881832546', '788546381188995', 'Đồ án Chuyên đề mạng'),
(22, '1617179881832546', '823028621063248', 'TDT_CĐCPPM_HKI_2014_2015'),
(23, '1617179881832546', '705025912917632', 'TDT_CDNET_2014'),
(24, '1617179881832546', '527783710608616', 'Cộng đồng Lập trình Java'),
(25, '1617179881832546', '530105397096220', 'Hội ASUS ZENPHONE'),
(26, '1617179881832546', '1501975386684037', 'Hội Chơi ASUS ZenPhone 4, 5, 6'),
(27, '1617179881832546', '922170751131037', 'Đồ Án Minh&Hiệp'),
(28, '1617179881832546', '679564555473240', 'We can do it'),
(29, '1617179881832546', '1469508349970574', 'CĐ Mạng HK I 2014-2015'),
(30, '1617179881832546', '671686342927095', 'THVP 2014'),
(31, '1617179881832546', '417496335057158', 'Funny Game (^___^)'),
(32, '1617179881832546', '430120557090625', 'Guitar'),
(33, '1617179881832546', '558729750882879', 'Android app review - VN'),
(34, '1617179881832546', '230636260467271', 'Thảo Luận Nhóm @@'),
(35, '1617179881832546', '136681739809626', 'Lập Trình PHP');

-- --------------------------------------------------------

--
-- Table structure for table `post_facebook`
--

CREATE TABLE IF NOT EXISTS `post_facebook` (
`id` int(11) NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `from_client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_post` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_group_face` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `post_facebook`
--

INSERT INTO `post_facebook` (`id`, `caption`, `created_date`, `description`, `from_client_id`, `id_group`, `id_post`, `like_count`, `link`, `message`, `name`, `picture`, `type`, `updated_date`, `id_group_face`) VALUES
(1, 'facebook.com', '09/06/2015 10:40:44', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '1424801057844165', '425608607618275', '425608607618275_425614250951044', 0, 'http://facebook.com/', 'Status from App @MinhNguyen', 'Welcome to Facebook - Log In, Sign Up or Learn More', NULL, 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:40:44', NULL),
(2, 'facebook.com', '09/06/2015 10:40:47', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '1424801057844165', '381751885368133', '381751885368133_381754598701195', 0, 'http://facebook.com/', 'Status from App @MinhNguyen', 'Welcome to Facebook - Log In, Sign Up or Learn More', NULL, 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:40:47', NULL),
(3, 'facebook.com', '09/06/2015 10:40:49', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '1424801057844165', '1153057674711735', '1153057674711735_1153064018044434', 0, 'http://facebook.com/', 'Status from App @MinhNguyen', 'Welcome to Facebook - Log In, Sign Up or Learn More', NULL, 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:40:49', NULL),
(4, 'google.com', '09/06/2015 10:41:31', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '1424801057844165', '425608607618275', '425608607618275_425614330951036', 0, 'http://google.com/', 'Status 2 from App @MinhNguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:41:31', NULL),
(5, 'google.com', '09/06/2015 10:41:32', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '1424801057844165', '381751885368133', '381751885368133_381754722034516', 0, 'http://google.com/', 'Status 2 from App @MinhNguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:41:32', NULL),
(6, 'google.com', '09/06/2015 10:41:34', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '1424801057844165', '1153057674711735', '1153057674711735_1153064221377747', 0, 'http://google.com/', 'Status 2 from App @MinhNguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:41:34', NULL),
(7, 'google.com', '09/06/2015 10:42:20', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '1424801057844165', '425608607618275', '425608607618275_425614467617689', 0, 'http://google.com/', 'Status 3 from App @MinhNguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:42:20', NULL),
(8, 'google.com', '09/06/2015 10:42:21', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '1424801057844165', '381751885368133', '381751885368133_381754815367840', 0, 'http://google.com/', 'Status 3 from App @MinhNguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:42:21', NULL),
(9, 'google.com', '09/06/2015 10:42:23', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '1424801057844165', '1153057674711735', '1153057674711735_1153064431377726', 0, 'http://google.com/', 'Status 3 from App @MinhNguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '09/06/2015 10:42:23', NULL),
(10, NULL, '11/06/2015 22:48', NULL, '108575602813001', '832458093505507', '832458093505507_833182630099720', 0, NULL, 'Nguyenn ANh Minh', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/06/2015 22:48', NULL),
(11, 'facebook.com', '11/06/2015 22:57', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '108575602813001', '832458093505507', '832458093505507_833184993432817', 0, 'http://facebook.com/', 'Hello World', 'Welcome to Facebook - Log In, Sign Up or Learn More', NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/06/2015 22:57', NULL),
(12, 'facebook.com', '11/06/2015 22:57', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '108575602813001', '425608607618275', '425608607618275_426353124210490', 0, 'http://facebook.com/', 'Hello World', 'Welcome to Facebook - Log In, Sign Up or Learn More', NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/06/2015 22:57', NULL),
(13, 'facebook.com', '11/06/2015 22:57', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '108575602813001', '381751885368133', '381751885368133_382852065258115', 0, 'http://facebook.com/', 'Hello World', 'Welcome to Facebook - Log In, Sign Up or Learn More', NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/06/2015 22:57', NULL),
(14, 'facebook.com', '11/06/2015 22:57', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '108575602813001', '1153057674711735', '1153057674711735_1155642831119886', 0, 'http://facebook.com/', 'Hello World', 'Welcome to Facebook - Log In, Sign Up or Learn More', NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/06/2015 22:57', NULL),
(15, NULL, '11/06/2015 22:59', NULL, '108575602813001', '1153057674711735', '1153057674711735_1155647121119457', 0, NULL, 'Yahoo, Posst from home Page', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/06/2015 22:59', NULL),
(16, NULL, '12/06/2015 01:18', NULL, '108575602813001', '832458093505507', '832458093505507_833219430096040', 0, NULL, 'Post from Facebook4j', NULL, NULL, 'status', '12/06/2015 01:18', 7),
(17, NULL, '12/06/2015 01:22', NULL, '108575602813001', '832458093505507', '832458093505507_833220646762585', 0, NULL, 'Good night @MinhNguyen', NULL, NULL, 'status', '12/06/2015 01:22', 7),
(18, NULL, '12/06/2015 01:22', NULL, '108575602813001', '425608607618275', '425608607618275_426389514206851', 0, NULL, 'Good night @MinhNguyen', NULL, NULL, 'status', '12/06/2015 01:22', 8);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
`id_schedule` int(11) NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_post` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_message` text COLLATE utf8mb4_unicode_ci,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id_schedule`, `client_id`, `date_post`, `group_caption`, `group_description`, `group_image`, `group_link`, `group_message`, `group_name`, `state`) VALUES
(1, '108575602813001', '11/06/2015 01:21', '', '', NULL, 'google.com', 'Good night all!!!', '', 'active'),
(2, '1617179881832546', '11/06/2015 01:21', '', '', NULL, 'google.com', 'Good night all everyone!!! <3 <3 <3', '', 'active'),
(3, '1617179881832546', '11/06/2015 01:23', '', '', NULL, '', 'Minh', '', 'Pending'),
(4, '108575602813001', '12/06/2015 01:22', '', '', NULL, '', 'Good night @MinhNguyen', '', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_group`
--

CREATE TABLE IF NOT EXISTS `schedule_group` (
  `id_schedule` int(11) NOT NULL,
  `id_group_face` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_group`
--

INSERT INTO `schedule_group` (`id_schedule`, `id_group_face`) VALUES
(1, 7),
(1, 8),
(2, 11),
(2, 12),
(2, 13),
(3, 11),
(3, 12),
(3, 13),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `access_token`, `password`, `user_id`, `user_name`) VALUES
(1, 'CAAUcRcDZBhwIBADnIZA5Q2LAOoZBji9yNO0xSO2bw2Q5BBfd9diOMC1reZBCFkv54pPoGXTJKmEhwC70AUZCJY0gefzUsUZBcsvDNM6yb5G5hShvBqoZALGGfqs6iUZBZBxJGJZCWVABo1S2LJ2PSeKLlGd2fvwBVY0nMMq9L398yx34ZBPOFk477WPtvfl2SfxRFe4puRtBWvbZCxM2pzaEjCe3', NULL, '1424378184552921', NULL),
(8, 'CAAUcRcDZBhwIBALOotR1MjkKb4oXkuECe1Y6nGVVU8NsNdDIM3dfMZB51aNOz7kKyZAwMwZCNwYpTB3XcV3gxh7lBjXgUgMQOb074D476T0kBR93O3a03lHSzatJygkeoZCJXIFNZAc9Y2hidOEEkqCYMFonO2ys65DZA4fVjK6sWpoThZC8zMUf26EW5jV1ul9EifQTfYcp64SPnWbIdqLe', NULL, '108575602813001', NULL),
(9, 'CAAUcRcDZBhwIBAOc8bMH14xmF5pqrq4IZBiMDrzdnMKRAgvZCwxleprkYaoEGItTHDYrpIYjFvRVluLtH0fi9H2so65vfXLCJMpTjaLUI5jXIthlR5rNNE4VT4PzutMEkRoF4Dpyfj9SSyqX0ZARc9Yt37L5WRsZBZCtQadR14TZAUrGv9h5xHvBhwfAQrmGd3acJohNO3EV28bmxaVZAPPJ', NULL, '1617179881832546', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biggroup_group`
--
ALTER TABLE `biggroup_group`
 ADD KEY `FK_d6uolqw4kgb4t8ubogrhbi6p5` (`id_group_face`), ADD KEY `FK_4m3hnub17ou8ah6xqdir0sdvh` (`id_big_group_face`);

--
-- Indexes for table `big_group_face`
--
ALTER TABLE `big_group_face`
 ADD PRIMARY KEY (`id_big_group_face`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_qp41ionc07ros07rta0rh5nnf` (`id_post`);

--
-- Indexes for table `group_face`
--
ALTER TABLE `group_face`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_facebook`
--
ALTER TABLE `post_facebook`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_kpjc7vormd936fuyv4210br5t` (`id_group_face`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
 ADD PRIMARY KEY (`id_schedule`);

--
-- Indexes for table `schedule_group`
--
ALTER TABLE `schedule_group`
 ADD KEY `FK_qqx8gfqgr77b73xff24acbrfm` (`id_group_face`), ADD KEY `FK_9emyyvrk9mqxt1ou0you9ffpp` (`id_schedule`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `big_group_face`
--
ALTER TABLE `big_group_face`
MODIFY `id_big_group_face` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_face`
--
ALTER TABLE `group_face`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `post_facebook`
--
ALTER TABLE `post_facebook`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
MODIFY `id_schedule` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `biggroup_group`
--
ALTER TABLE `biggroup_group`
ADD CONSTRAINT `FK_4m3hnub17ou8ah6xqdir0sdvh` FOREIGN KEY (`id_big_group_face`) REFERENCES `big_group_face` (`id_big_group_face`),
ADD CONSTRAINT `FK_d6uolqw4kgb4t8ubogrhbi6p5` FOREIGN KEY (`id_group_face`) REFERENCES `group_face` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `FK_qp41ionc07ros07rta0rh5nnf` FOREIGN KEY (`id_post`) REFERENCES `post_facebook` (`id`);

--
-- Constraints for table `post_facebook`
--
ALTER TABLE `post_facebook`
ADD CONSTRAINT `FK_kpjc7vormd936fuyv4210br5t` FOREIGN KEY (`id_group_face`) REFERENCES `group_face` (`id`);

--
-- Constraints for table `schedule_group`
--
ALTER TABLE `schedule_group`
ADD CONSTRAINT `FK_9emyyvrk9mqxt1ou0you9ffpp` FOREIGN KEY (`id_schedule`) REFERENCES `schedule` (`id_schedule`),
ADD CONSTRAINT `FK_qqx8gfqgr77b73xff24acbrfm` FOREIGN KEY (`id_group_face`) REFERENCES `group_face` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
