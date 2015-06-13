-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2015 at 06:27 PM
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
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `big_group_face`
--

CREATE TABLE IF NOT EXISTS `big_group_face` (
`id_big_group_face` int(11) NOT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_big_group_face` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `big_group_face`
--

INSERT INTO `big_group_face` (`id_big_group_face`, `client_id`, `image`, `name_big_group_face`) VALUES
(1, '445983705552033', NULL, 'Minh Nguyen'),
(2, '445983705552033', NULL, 'Minh Nguyen2');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `group_face`
--

INSERT INTO `group_face` (`id`, `client_id`, `id_group_face`, `name_group_face`) VALUES
(1, '445983705552033', '943562415694364', 'ThesisMinhHiep'),
(2, '445983705552033', '1642294075990555', 'ThesisMinhHiep2'),
(3, '445983705552033', '556066097771122', 'Tranh sơn dầu đẹp'),
(4, '445983705552033', '434472413309957', 'DJ Bắc Kiến Xương'),
(5, '445983705552033', '302113079862502', 'Lớp 11TH2D - Khoa CNTT ĐH Tôn Đức Thắng');

-- --------------------------------------------------------

--
-- Table structure for table `postfacebook`
--

CREATE TABLE IF NOT EXISTS `postfacebook` (
`id` int(11) NOT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_post` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `postfacebook`
--

INSERT INTO `postfacebook` (`id`, `caption`, `created_date`, `description`, `from_client_id`, `id_group`, `id_post`, `like_count`, `link`, `message`, `name`, `picture`, `type`, `updated_date`) VALUES
(1, 'No Caption', '05/05/2015 08:49:42', 'No Description', '445983705552033', '943562415694364', '943562415694364_960400544010551', 0, 'https://www.google.com/', 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', 'Test', 'https://m.ak.fbcdn.net/external.ak/safe_image.php?d=AQBjzOh8W2mg3EYu&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Flogos%2Fdoodles%2F2015%2Fnellie-blys-151st-birthday-4862371034038272.2-hp.jpg&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '05/05/2015 08:49:42'),
(2, 'No Caption', '05/05/2015 08:49:44', 'No Description', '445983705552033', '1642294075990555', '1642294075990555_1649564118596884', 0, 'https://www.google.com/', 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', 'Test', 'https://m.ak.fbcdn.net/external.ak/safe_image.php?d=AQBjzOh8W2mg3EYu&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Flogos%2Fdoodles%2F2015%2Fnellie-blys-151st-birthday-4862371034038272.2-hp.jpg&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '05/05/2015 08:49:44'),
(3, NULL, '11/05/2015 09:03:03', NULL, '445983705552033', '943562415694364', '943562415694364_962833730433899', 0, NULL, 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 09:03:03'),
(4, NULL, '11/05/2015 09:03:06', NULL, '445983705552033', '1642294075990555', '1642294075990555_1652334354986527', 0, NULL, 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 09:03:06'),
(5, NULL, '11/05/2015 10:42:26', NULL, '445983705552033', '943562415694364', '943562415694364_962916517092287', 0, NULL, 'Test post to single group', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 10:42:26'),
(6, NULL, '11/05/2015 10:48:15', NULL, '445983705552033', '943562415694364', '943562415694364_962919143758691', 0, NULL, 'Test continue 1234567890', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 10:48:15'),
(7, NULL, '11/05/2015 10:50:30', NULL, '445983705552033', '1642294075990555', '1642294075990555_1652382761648353', 0, NULL, 'Test', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 10:50:30'),
(8, 'www.google.com', '11/05/2015 10:55:59', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '1642294075990555', '1642294075990555_1652390654980897', 0, 'https://www.google.com/', 'Test02\nhttps://www.google.com/', 'Google', 'https://m.ak.fbcdn.net/external.ak/safe_image.php?d=AQDZuvq0FLnXR-ky&w=130&h=130&url=https%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 10:55:59'),
(9, 'vnexpress.net', '12/05/2015 09:10:32', NULL, '445983705552033', '1642294075990555', '1642294075990555_1652754234944539', 0, 'http://vnexpress.net/tin-tuc/thoi-su/can-cau-thi-cong-tuyen-metro-nhon-ga-ha-noi-do-xuong-nha-dan-3215549.html', 'Vnexpress', 'vnexpress.net', 'https://m.ak.fbcdn.net/external.ak/safe_image.php?d=AQAGOzM0ICYHUppI&w=130&h=130&url=http%3A%2F%2Fm.f29.img.vnecdn.net%2F2015%2F05%2F12%2FIMG-6592-4140-1431424901.jpg&cfs=1&sx=0&sy=0&sw=333&sh=333', 'org.springframework.social.facebook.api.Post$PostType', '12/05/2015 09:10:32'),
(10, 'dulich.vnexpress.net', '12/05/2015 09:19:48', 'Nơi phụ nữ xinh đẹp nhất thế giới, tình một đêm được coi như truyền thống hay tắm không cần đóng cửa... là những điểm đến thường khiến số đông nam giới tò mò.', '445983705552033', '943562415694364', '943562415694364_963402623710343', 0, 'http://dulich.vnexpress.net/tin-tuc/cong-dong/tu-van/nhung-diem-den-khien-dan-ong-me-man-3214405.html', 'Vnexpress', 'Những điểm đến khiến đàn ông mê mẩn - VnExpress Du Lịch', 'https://m.ak.fbcdn.net/external.ak/safe_image.php?d=AQBRdedI8EQihCR6&w=130&h=130&url=http%3A%2F%2Fc1.f33.img.vnecdn.net%2F2015%2F05%2F12%2F4-7386-1431420361.jpg&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '12/05/2015 09:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `post_facebook`
--

CREATE TABLE IF NOT EXISTS `post_facebook` (
`id` int(11) NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `post_facebook`
--

INSERT INTO `post_facebook` (`id`, `caption`, `created_date`, `description`, `from_client_id`, `id_group`, `id_post`, `like_count`, `link`, `message`, `name`, `picture`, `type`, `updated_date`, `id_group_face`) VALUES
(1, 'google.com', '19/05/2015 11:25:32', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_966987126685226', 0, 'http://google.com/', 'Nguyen Anh Minh', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '19/05/2015 11:25:32', NULL),
(2, 'google.com', '19/05/2015 11:25:50', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_966987260018546', 0, 'http://google.com/', 'Minh nguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '19/05/2015 11:25:50', NULL),
(3, 'google.com', '19/05/2015 11:26:03', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_966987320018540', 0, 'http://google.com/', 'Good night', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '19/05/2015 11:26:03', NULL),
(4, 'google.com', '19/05/2015 11:26:06', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '1642294075990555', '1642294075990555_1655875454632417', 0, 'http://google.com/', 'Good night', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '19/05/2015 11:26:06', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id_schedule`, `client_id`, `date_post`, `group_caption`, `group_description`, `group_image`, `group_link`, `group_message`, `group_name`, `state`) VALUES
(1, '445983705552033', '20/05/2015 02:01:00', '', '', NULL, '', 'Hello', '', 'Pending');

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
(1, 1),
(1, 2);

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
-- Indexes for table `postfacebook`
--
ALTER TABLE `postfacebook`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `big_group_face`
--
ALTER TABLE `big_group_face`
MODIFY `id_big_group_face` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_face`
--
ALTER TABLE `group_face`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `postfacebook`
--
ALTER TABLE `postfacebook`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `post_facebook`
--
ALTER TABLE `post_facebook`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
MODIFY `id_schedule` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
