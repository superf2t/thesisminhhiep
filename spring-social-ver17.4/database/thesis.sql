-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2015 at 05:12 PM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thesis`
--
CREATE DATABASE IF NOT EXISTS `thesis` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `thesis`;

-- --------------------------------------------------------

--
-- Table structure for table `biggroup_group`
--

CREATE TABLE IF NOT EXISTS `biggroup_group` (
  `id_big_group_face` int(11) NOT NULL,
  `id_group_face` int(11) NOT NULL,
  KEY `FK_d6uolqw4kgb4t8ubogrhbi6p5` (`id_group_face`),
  KEY `FK_4m3hnub17ou8ah6xqdir0sdvh` (`id_big_group_face`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `biggroup_group`
--

INSERT INTO `biggroup_group` (`id_big_group_face`, `id_group_face`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `big_group_face`
--

CREATE TABLE IF NOT EXISTS `big_group_face` (
  `id_big_group_face` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_big_group_face` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_big_group_face`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `big_group_face`
--

INSERT INTO `big_group_face` (`id_big_group_face`, `client_id`, `image`, `name_big_group_face`) VALUES
(1, '445983705552033', NULL, 'Group 01'),
(2, '445983705552033', NULL, 'Group 02');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `from_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qp41ionc07ros07rta0rh5nnf` (`id_post`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `date_create`, `from_client_id`, `id_comment`, `like_count`, `message`, `name_client`, `id_post`) VALUES
(1, '2015-05-20 23:29:33', '1617179881832546', '967347469982525', 2, 'comment 2', 'Nguyễn Anh Minh', 1),
(2, '2015-05-20 23:55:04', '445983705552033', '967354576648481', 2, 'comment', 'Xêcô Mỏ Nhọn', 1),
(3, '2015-05-20 23:28:53', '1617179881832546', '967347366649202', 0, 'comment', 'Nguyễn Anh Minh', 3),
(4, '2015-05-20 23:29:07', '1617179881832546', '967347416649197', 1, '', 'Nguyễn Anh Minh', 3),
(5, '2015-05-20 23:29:13', '1617179881832546', '967347426649196', 1, '', 'Nguyễn Anh Minh', 3),
(6, '2015-05-20 23:28:11', '1617179881832546', '967347219982550', 0, 'comment1', 'Nguyễn Anh Minh', 4),
(7, '2015-05-12 23:24:36', '1617179881832546', '963438853706720', 0, 'comment', 'Nguyễn Anh Minh', 17),
(8, '2015-05-11 23:00:29', '445983705552033', '962923333758272', 1, '@@', 'Xêcô Mỏ Nhọn', 20),
(9, '2015-05-11 23:00:37', '445983705552033', '962923363758269', 1, 'Comment 01', 'Xêcô Mỏ Nhọn', 20),
(10, '2015-05-11 21:08:16', '445983705552033', '962835567100382', 1, '@@', 'Xêcô Mỏ Nhọn', 22),
(11, '2015-05-05 20:50:09', '445983705552033', '960400640677208', 2, 'Comment01', 'Xêcô Mỏ Nhọn', 23),
(12, '2015-05-05 20:50:14', '445983705552033', '960400654010540', 2, 'Comment02', 'Xêcô Mỏ Nhọn', 23),
(13, '2015-05-05 20:50:35', '708394165956241', '960400700677202', 2, 'Comment03', 'Hiep Nguyen', 23),
(14, '2015-05-05 20:50:42', '708394165956241', '960400730677199', 2, 'Comment04', 'Hiep Nguyen', 23),
(15, '2015-05-05 21:31:15', '445983705552033', '960411284009477', 1, '@@', 'Xêcô Mỏ Nhọn', 23),
(16, '2015-05-05 21:41:40', '445983705552033', '960414104009195', 1, 'Hiep Nguyen Test', 'Xêcô Mỏ Nhọn', 23),
(17, '2015-05-05 01:29:54', '445983705552033', '960027774047828', 1, 'comment01', 'Xêcô Mỏ Nhọn', 25),
(18, '2015-05-05 01:29:58', '445983705552033', '960027800714492', 1, 'comment02', 'Xêcô Mỏ Nhọn', 25),
(19, '2015-05-05 01:30:02', '445983705552033', '960027827381156', 1, 'comment03', 'Xêcô Mỏ Nhọn', 25),
(20, '2015-05-05 01:30:08', '445983705552033', '960027874047818', 1, 'comment04', 'Xêcô Mỏ Nhọn', 25),
(21, '2015-05-05 01:30:11', '445983705552033', '960028004047805', 1, 'comment05', 'Xêcô Mỏ Nhọn', 25);

-- --------------------------------------------------------

--
-- Table structure for table `group_face`
--

CREATE TABLE IF NOT EXISTS `group_face` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_group_face` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_group_face` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

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
-- Table structure for table `post_facebook`
--

CREATE TABLE IF NOT EXISTS `post_facebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `from_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_post` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_group_face` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kpjc7vormd936fuyv4210br5t` (`id_group_face`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `post_facebook`
--

INSERT INTO `post_facebook` (`id`, `caption`, `created_date`, `description`, `from_client_id`, `id_group`, `id_post`, `like_count`, `link`, `message`, `name`, `picture`, `type`, `updated_date`, `id_group_face`) VALUES
(1, 'google.com', '19/05/2015 11:25:32', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_966987126685226', 0, 'http://google.com/', 'Nguyen Anh Minh', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '20/05/2015 11:55:04', NULL),
(2, 'google.com', '20/05/2015 11:31:51', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '708394165956241', '943562415694364', '943562415694364_967348129982459', 0, 'http://google.com/', 'My Share to good night', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '20/05/2015 11:31:51', NULL),
(3, 'google.com', '19/05/2015 11:25:50', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_966987260018546', 0, 'http://google.com/', 'Minh nguyen', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '20/05/2015 11:29:13', NULL),
(4, 'google.com', '19/05/2015 11:26:03', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_966987320018540', 0, 'http://google.com/', 'Good night', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '20/05/2015 11:28:11', NULL),
(5, 'vnexpress.net', '18/05/2015 11:47:05', 'Thông tin nhanh & mới nhất được cập nhật hàng giờ. Tin tức Việt Nam & thế giới về xã hội, kinh doanh, pháp luật, khoa học, công nghệ, sức khoẻ, đời sống, văn hóa, rao vặt, tâm sự...', '445983705552033', '943562415694364', '943562415694364_966479153402690', 0, 'http://vnexpress.net/', 'Hi, all', 'Tin nhanh VnExpress - Đọc báo, tin tức online 24h', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQAA-r0u2EEUbLxw&w=130&h=130&url=http%3A%2F%2Fst.f1.vnecdn.net%2Fresponsive%2Fi%2Fv20%2Flogo_default.jpg&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '18/05/2015 11:47:05', NULL),
(6, 'translate.google.com', '18/05/2015 11:45:47', 'Google''s free online language translation service instantly translates text and web pages. This translator supports: English, Afrikaans, Albanian, Arabic, Armenian, Azerbaijani, Basque, Belarusian, Bengali, Bosnian, Bulgarian, Catalan, Cebuano, Chichewa, Chinese, Croatian, Czech, Danish, Dutch, Espe…', '445983705552033', '943562415694364', '943562415694364_966478926736046', 0, 'https://translate.google.com/', 'https://translate.google.com', 'Google Translate', NULL, 'org.springframework.social.facebook.api.Post$PostType', '18/05/2015 11:45:47', NULL),
(7, NULL, '18/05/2015 11:44:30', NULL, '445983705552033', '943562415694364', '943562415694364_966478673402738', 0, NULL, '@@', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '18/05/2015 11:44:30', NULL),
(8, 'translate.google.com', '18/05/2015 11:43:59', 'Google''s free online language translation service instantly translates text and web pages. This translator supports: English, Afrikaans, Albanian, Arabic, Armenian, Azerbaijani, Basque, Belarusian, Bengali, Bosnian, Bulgarian, Catalan, Cebuano, Chichewa, Chinese, Croatian, Czech, Danish, Dutch, Espe…', '445983705552033', '943562415694364', '943562415694364_966478550069417', 0, 'https://translate.google.com/', '@@', 'Google Translate', NULL, 'org.springframework.social.facebook.api.Post$PostType', '18/05/2015 11:43:59', NULL),
(9, 'translate.google.com', '18/05/2015 11:42:53', 'Google''s free online language translation service instantly translates text and web pages. This translator supports: English, Afrikaans, Albanian, Arabic, Armenian, Azerbaijani, Basque, Belarusian, Bengali, Bosnian, Bulgarian, Catalan, Cebuano, Chichewa, Chinese, Croatian, Czech, Danish, Dutch, Espe…', '445983705552033', '943562415694364', '943562415694364_966478293402776', 0, 'https://translate.google.com/#en/vi/least', 'Google.com', 'Google Translate', NULL, 'org.springframework.social.facebook.api.Post$PostType', '18/05/2015 11:42:53', NULL),
(10, NULL, '18/05/2015 11:41:49', NULL, '445983705552033', '943562415694364', '943562415694364_966477980069474', 0, NULL, 'Test @@', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '18/05/2015 11:41:49', NULL),
(11, 'translate.google.com', '18/05/2015 11:28:21', 'Google''s free online language translation service instantly translates text and web pages. This translator supports: English, Afrikaans, Albanian, Arabic, Armenian, Azerbaijani, Basque, Belarusian, Bengali, Bosnian, Bulgarian, Catalan, Cebuano, Chichewa, Chinese, Croatian, Czech, Danish, Dutch, Espe…', '445983705552033', '943562415694364', '943562415694364_966472490070023', 0, 'https://translate.google.com/#en/vi/least', 'Show Test', 'Google Translate', NULL, 'org.springframework.social.facebook.api.Post$PostType', '18/05/2015 11:28:21', NULL),
(12, 'google.com', '16/05/2015 12:09:59', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_965022173548388', 0, 'http://google.com/', 'Xin Chao Tat ca cac ban', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '16/05/2015 12:09:59', NULL),
(13, 'google.com', '15/05/2015 11:51:52', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_965014720215800', 0, 'http://google.com/', 'Hello World', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '15/05/2015 11:51:52', NULL),
(14, NULL, '13/05/2015 08:51:50', NULL, '445983705552033', '943562415694364', '943562415694364_963937550323517', 0, NULL, 'Test Post Minh', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '13/05/2015 08:51:50', NULL),
(15, NULL, '13/05/2015 12:14:57', NULL, '445983705552033', '943562415694364', '943562415694364_963453727038566', 0, NULL, 'Hahahaha Tetst', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '13/05/2015 12:14:57', NULL),
(16, 'facebook.com', '12/05/2015 11:45:05', 'Facebook is a social utility that connects people with friends and others who work, study and live around them. People use Facebook to keep up with...', '445983705552033', '943562415694364', '943562415694364_963444910372781', 0, 'http://facebook.com/', 'TEst', 'Heehee', NULL, 'org.springframework.social.facebook.api.Post$PostType', '12/05/2015 11:45:05', NULL),
(17, 'google.com', '12/05/2015 11:21:46', 'Search the world''s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you''re looking for.', '445983705552033', '943562415694364', '943562415694364_963438237040115', 0, 'http://google.com/', 'Test', 'Google', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCeFfeWVmCQIwyC&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Fimages%2Fsrpr%2Flogo9w.png&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '12/05/2015 11:24:36', NULL),
(18, NULL, '12/05/2015 10:31:41', NULL, '445983705552033', '943562415694364', '943562415694364_963423013708304', 0, NULL, 'Hello', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '12/05/2015 10:31:41', NULL),
(19, 'dulich.vnexpress.net', '12/05/2015 09:19:48', 'Nơi phụ nữ xinh đẹp nhất thế giới, tình một đêm được coi như truyền thống hay tắm không cần đóng cửa... là những điểm đến thường khiến số đông nam giới tò mò.', '445983705552033', '943562415694364', '943562415694364_963402623710343', 0, 'http://dulich.vnexpress.net/tin-tuc/cong-dong/tu-van/nhung-diem-den-khien-dan-ong-me-man-3214405.html', 'Vnexpress', 'Những điểm đến khiến đàn ông mê mẩn - VnExpress Du Lịch', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQBRdedI8EQihCR6&w=130&h=130&url=http%3A%2F%2Fc1.f33.img.vnecdn.net%2F2015%2F05%2F12%2F4-7386-1431420361.jpg&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '12/05/2015 09:19:48', NULL),
(20, NULL, '11/05/2015 10:48:15', NULL, '445983705552033', '943562415694364', '943562415694364_962919143758691', 0, NULL, 'Test continue 1234567890', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 11:00:37', NULL),
(21, NULL, '11/05/2015 10:42:26', NULL, '445983705552033', '943562415694364', '943562415694364_962916517092287', 0, NULL, 'Test post to single group', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 10:42:26', NULL),
(22, NULL, '11/05/2015 09:03:03', NULL, '445983705552033', '943562415694364', '943562415694364_962833730433899', 0, NULL, 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '11/05/2015 09:08:16', NULL),
(23, 'No Caption', '05/05/2015 08:49:42', 'No Description', '445983705552033', '943562415694364', '943562415694364_960400544010551', 0, 'https://www.google.com/', 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', 'Test', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQC6xUwAyKk8an3T&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Flogos%2Fdoodles%2F2015%2Fnellie-blys-151st-birthday-4862371034038272.2-hp.jpg&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '05/05/2015 09:41:40', NULL),
(24, 'Test', '05/05/2015 08:34:31', 'No Description', '445983705552033', '943562415694364', '943562415694364_960396537344285', 0, 'https://www.google.com/', 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', 'Test', 'https://fbexternal-a.akamaihd.net/safe_image.php?d=AQC6xUwAyKk8an3T&w=130&h=130&url=http%3A%2F%2Fwww.google.com%2Flogos%2Fdoodles%2F2015%2Fnellie-blys-151st-birthday-4862371034038272.2-hp.jpg&cfs=1', 'org.springframework.social.facebook.api.Post$PostType', '05/05/2015 08:34:31', NULL),
(25, NULL, '04/05/2015 11:43:38', NULL, '445983705552033', '943562415694364', '943562415694364_959990367384902', 0, NULL, 'Ngày 19/4/2015 tại O2 lúc 8h: họp & cùng giải quyết các vấn đề sau:\n- Thống nhật Plan.\n- Xem tất cả output của nhóm\n- Cung cấp thông tin về project trên sourceforce.net\n- Debug và fix lỗi\n=> Các bạn chuẩn bị mọi thứ để làm việc hiệu quả nha.', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '05/05/2015 01:30:11', NULL),
(26, NULL, '26/05/2015 11:19:35', NULL, '445983705552033', '1642294075990555', '1642294075990555_1659232970963332', 0, NULL, '-Test @@', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '26/05/2015 11:19:35', NULL),
(27, NULL, '26/05/2015 11:22:48', NULL, '445983705552033', '943562415694364', '943562415694364_970117353038870', 0, NULL, '- Test @@', NULL, NULL, 'org.springframework.social.facebook.api.Post$PostType', '26/05/2015 11:22:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id_schedule` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_post` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_message` text COLLATE utf8_unicode_ci,
  `group_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_schedule`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id_schedule`, `client_id`, `date_post`, `group_caption`, `group_description`, `group_image`, `group_link`, `group_message`, `group_name`, `state`) VALUES
(1, '445983705552033', '04/06/2015 03:09:00', '', '', NULL, '', 'Schedule 01', '', 'Pending'),
(2, '445983705552033', '10/06/2015 02:00:00', '', '', NULL, '', 'Schedule 02', '', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_group`
--

CREATE TABLE IF NOT EXISTS `schedule_group` (
  `id_schedule` int(11) NOT NULL,
  `id_group_face` int(11) NOT NULL,
  KEY `FK_qqx8gfqgr77b73xff24acbrfm` (`id_group_face`),
  KEY `FK_9emyyvrk9mqxt1ou0you9ffpp` (`id_schedule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schedule_group`
--

INSERT INTO `schedule_group` (`id_schedule`, `id_group_face`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5);

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
