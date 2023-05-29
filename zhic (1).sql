-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 08:35 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zhic`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_request`
--

CREATE TABLE `book_request` (
  `request_id` int(11) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_nationality` varchar(255) DEFAULT NULL,
  `user_spoken` varchar(255) DEFAULT NULL,
  `user_message` varchar(255) DEFAULT NULL,
  `request_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `book_request`
--

INSERT INTO `book_request` (`request_id`, `book_name`, `user_name`, `user_email`, `user_nationality`, `user_spoken`, `user_message`, `request_date`, `created_at`, `updated_at`) VALUES
(1, 'Holy QUran', 'Admin', 'admin@gmail.com', 'Indian', 'Hindi', 'hello from jharkhand', '2021-08-23 17:41:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_shelf`
--

CREATE TABLE `book_shelf` (
  `book_shelf_id` int(255) NOT NULL,
  `file_id` int(255) NOT NULL,
  `book_position` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `book_shelf`
--

INSERT INTO `book_shelf` (`book_shelf_id`, `file_id`, `book_position`, `created_at`, `updated_at`) VALUES
(5, 3, '1', '2023-05-26 01:39:19', '2023-05-26 01:39:19'),
(6, 6, '2', '2023-05-26 01:40:19', '2023-05-26 01:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_name_ar` varchar(255) DEFAULT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `category_name_ar`, `category_slug`, `created_at`, `updated_at`) VALUES
(0, 'Holy Quran', 'القرآن الكريم', 'Holy_Quran', '2023-04-17 05:16:06', '2023-04-18 03:49:20'),
(0, 'Hadith', 'الحديث', 'Hadith', '2023-04-17 05:38:41', '2023-04-18 03:48:57'),
(0, 'Arabic Learning Books', 'كتب تعلم اللغة العربية', 'Arabic_Learning_Books', '2023-04-18 03:17:34', '2023-04-18 03:48:29'),
(0, 'Children books', 'كتب أطفال', 'Children_books', '2023-04-18 03:43:49', '2023-04-18 03:47:53'),
(0, 'Islamic Cultural Books', 'كتب الثقافة الإسلامية..', 'Islamic_Cultural_Books', '2023-04-18 03:45:04', '2023-04-18 03:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `category__sub`
--

CREATE TABLE `category__sub` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_name` varchar(255) DEFAULT NULL,
  `sub_category_name_ar` varchar(255) DEFAULT NULL,
  `sub_category_slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category__sub`
--

INSERT INTO `category__sub` (`id`, `category_id`, `sub_category_name`, `sub_category_name_ar`, `sub_category_slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Quraan Majid', 'القرآن الكريم', 'Quraan_Majid', '2023-04-17 05:16:26', '2023-04-18 03:57:51'),
(2, 2, 'Fazail-e-aamal', 'فاضل امل', 'Fazail-e-aamal', '2023-04-17 05:38:51', '2023-04-18 03:58:38'),
(3, 4, 'Poem Book', 'كتاب قصيدة', 'Poem_Book', '2023-04-18 04:04:27', '2023-04-18 04:04:27'),
(4, 5, 'Islamic Information', 'المعلومات الإسلامية', 'Islamic_Information', '2023-04-19 05:47:58', '2023-04-19 05:47:58'),
(5, 7, 'test', NULL, 'test', '2023-05-25 09:57:10', '2023-05-25 09:57:10'),
(6, 1, 'Translation', NULL, 'Translation', '2023-05-25 10:00:16', '2023-05-25 10:00:16'),
(7, 3, 'Deeniyat', NULL, 'Deeniyat', '2023-05-27 02:11:48', '2023-05-27 02:11:48'),
(8, 3, 'Arabic Vacabulary', NULL, 'Arabic_Vacabulary', '2023-05-27 02:21:58', '2023-05-27 02:21:58'),
(9, 5, 'Islamic Fundamendals', NULL, 'Islamic_Fundamendals', '2023-05-27 04:13:37', '2023-05-27 04:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `category__third`
--

CREATE TABLE `category__third` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` varchar(11) DEFAULT NULL,
  `third_category_name` varchar(255) DEFAULT NULL,
  `third_category_name_ar` varchar(255) DEFAULT NULL,
  `third_category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category__third`
--

INSERT INTO `category__third` (`id`, `category_id`, `sub_category_id`, `third_category_name`, `third_category_name_ar`, `third_category_slug`, `created_at`, `updated_at`) VALUES
(1, 5, '4', 'Every Aspect of islam', 'كل جانب من جوانب الإسلام', 'Every_Aspect_of_islam', '2023-04-17 05:18:09', '2023-04-19 05:48:47'),
(2, 2, '2', 'Fazail-e-aamal Part - 1', 'فاضل أمل الجزء 1', 'Fazail-e-aamal_Part_-_1', '2023-04-17 05:39:07', '2023-04-18 04:19:31'),
(3, 4, '3', 'Name book', 'كتاب الاسم', 'Name_book', '2023-04-17 05:39:20', '2023-04-19 05:46:30'),
(4, 4, '3', 'All Volume', 'كل الحجم', 'All_Volume', '2023-04-18 04:08:54', '2023-04-18 04:20:26'),
(5, 1, '1', 'Quraan majid in English', 'القرآن الكريم باللغة الإنجليزية', 'Quraan_majid_in_English', '2023-04-19 05:19:39', '2023-04-19 05:45:19'),
(6, 1, '1', 'Quraan majid In Roman English', 'القرآن المجيد باللغة الإنجليزية الرومانية', 'Quraan_majid_In_Roman_English', '2023-04-19 05:30:44', '2023-04-19 05:30:44'),
(7, 2, '2', 'All Deniyaat Course Book', 'القرآن', 'All_Deniyaat_Course_Book', '2023-04-19 05:43:20', '2023-04-19 05:43:20'),
(8, 3, '7', '5 Minute ka madarsa', NULL, '5_Minute_ka_madarsa', '2023-05-27 02:12:24', '2023-05-27 02:12:24'),
(9, 3, '8', 'Arabic Learning', NULL, 'Arabic_Learning', '2023-05-27 02:22:30', '2023-05-27 02:22:30'),
(10, 1, '6', 'Tafseer', NULL, 'Tafseer', '2023-05-27 04:06:59', '2023-05-27 04:06:59'),
(11, 5, '4', 'Islamic rules', NULL, 'Islamic_rules', '2023-05-27 04:14:09', '2023-05-27 04:14:09'),
(12, 5, '9', 'Islamic basics', NULL, 'Islamic_basics', '2023-05-27 04:14:36', '2023-05-27 04:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `file_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_cat_id` bigint(255) NOT NULL,
  `third_cat_id` bigint(255) DEFAULT NULL,
  `language_id` bigint(255) DEFAULT NULL,
  `languages` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_author` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_author_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_note_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_publisher_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publishing_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_attachment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `p_r_ebook` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_link` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_download_link` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `unique_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `no_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `view_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `downloadable` int(255) NOT NULL DEFAULT 0,
  `printable` int(255) NOT NULL DEFAULT 0,
  `searchable` int(255) DEFAULT NULL,
  `featured` int(255) DEFAULT NULL,
  `ebook_slug` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ebook_audio` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `book_type` int(255) NOT NULL DEFAULT 0,
  `avg_rating` float NOT NULL DEFAULT 5,
  `publish_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `publish_buy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`file_id`, `category_id`, `sub_cat_id`, `third_cat_id`, `language_id`, `languages`, `ebook_name`, `ebook_name_ar`, `ebook_isbn`, `ebook_author`, `ebook_author_ar`, `ebook_note`, `ebook_note_ar`, `ebook_publisher`, `ebook_publisher_ar`, `publishing_date`, `ebook_attachment`, `p_r_ebook`, `ebook_link`, `ebook_download_link`, `unique_id`, `no_view`, `view_duration`, `direction`, `downloadable`, `printable`, `searchable`, `featured`, `ebook_slug`, `ebook_audio`, `book_type`, `avg_rating`, `publish_status`, `publish_buy`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 2, 8, NULL, 'Audio Book Title', 'عنوان كتاب الصوت', '3', 'Speaker Name', 'اسم المتحدث بالعربية', 'Audio Short Description', 'وصف قصير للصوت', 'Publisher', 'الناشر بالعربية', '2023-04-17', NULL, NULL, NULL, NULL, '9C0SW6A566L587O5AJ8M', NULL, NULL, NULL, 0, 0, 0, 0, 'Audio_Book_Title', NULL, 1, 5, '0', '0', '2023-04-17 05:51:03', '2023-04-18 05:50:38'),
(3, 4, 3, 4, 4, NULL, 'Book Title', 'عنوان كتاب', '11', 'Book Author', 'مؤلف الكتاب', 'Book Short Notes', 'ملاحظات قصيرة للكتاب', 'Book Publisher', 'كتاب الناشر', '2023-04-07', '4072836951.pdf', NULL, 'http://localhost/zhic/ControlPanel/Ebook-3-Upload', NULL, 'C7ZVQJA674574C1OM64T', NULL, NULL, 'rtl', 0, 0, 1, 0, 'Book_Title', '978463105268118.mp3', 0, 5, '0', '0', '2023-05-18 05:34:49', '2023-05-26 05:04:44'),
(4, 2, 2, 2, 8, NULL, 'Audio Book Title', 'عنوان كتاب الصوت', '3', 'Speaker Name', 'اسم المتحدث بالعربية', 'Audio Short Description', 'وصف قصير للصوت', 'Publisher', 'الناشر بالعربية', '2023-04-17', NULL, NULL, NULL, NULL, '9C0SW6A566L587O5AJ8M', NULL, NULL, NULL, 0, 0, 0, 0, 'Audio_Book_Title', NULL, 1, 5, '0', '0', '2023-08-17 05:51:03', '2023-04-18 05:50:38'),
(5, 2, 2, 2, 8, NULL, 'Audio Book Title', 'عنوان كتاب الصوت', '3', 'Speaker Name', 'اسم المتحدث بالعربية', 'Audio Short Description', 'وصف قصير للصوت', 'Publisher', 'الناشر بالعربية', '2023-04-17', NULL, NULL, NULL, NULL, '9C0SW6A566L587O5AJ8M', NULL, NULL, NULL, 0, 0, 0, 0, 'Audio_Book_Title', NULL, 1, 5, '0', '0', '2023-03-17 05:51:03', '2023-04-18 05:50:38'),
(6, 4, 3, 3, 2, NULL, 'Learning to love quran', 'VICE CITY', '7777', 'GAMEING', 'LIFE', 'LIFE LINE', 'ZINDAGI NA MILENGE 2 12', 'TOMMY VERCITY', 'TOMMY VERCITY', '2023-05-23', NULL, NULL, 'https://www.rockstargames.com/', NULL, '06T49789MIK71C8VGLB3', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Learning_to_love_quran', NULL, 0, 5, '0', '0', '2023-05-23 05:40:15', '2023-05-26 01:39:44'),
(7, 1, 1, 5, 2, NULL, 'Quraan Majid', NULL, '000', '---', NULL, 'this book for reading and understand quraan in different languages', NULL, 'mohammad', '', '2023-05-27', '2736591480.pdf', NULL, NULL, NULL, 'R5SNXCBAA61O4L937E01', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Quraan_Majid', NULL, 0, 5, '0', '0', '2023-05-27 01:34:40', '2023-05-27 01:37:54'),
(8, 1, 1, 5, 2, NULL, 'Quran Majid', NULL, '2', 'Israr Ahmad', NULL, 'This Book is Simple to read and understanding.', NULL, 'Zulkarnain', '', '2023-05-27', '7498132506.pdf', NULL, NULL, NULL, '88VA71YO942413RPC23I', NULL, NULL, 'rtl', 0, 1, 0, 0, 'Quran_Majid', NULL, 0, 5, '0', '0', '2023-05-27 01:45:43', '2023-05-27 01:50:55'),
(9, 2, 2, 2, 5, NULL, 'Fazail e Aamaal', NULL, '3', 'Qari Ishaque', NULL, 'This book for ahadees purpose.', NULL, 'Fuzail', '', '2023-05-27', '7609253148.pdf', NULL, NULL, NULL, 'P1167CKQ7786NGT4SXE4', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Fazail_e_Aamaal', NULL, 0, 5, '0', '0', '2023-05-27 01:53:22', '2023-05-27 02:04:14'),
(10, 2, 2, 7, 4, NULL, 'Fazail e Aamaal 2', NULL, '4', 'Molana Siddique', NULL, 'This is a book for ahadith remembering purpose.', NULL, 'Faiz', '', '2023-05-27', '0285467913.pdf', NULL, NULL, NULL, 'ZSBLGYW756306VT9614X', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Fazail_e_Aamaal_2', NULL, 0, 5, '0', '0', '2023-05-27 02:06:17', '2023-05-27 02:09:31'),
(11, 3, 7, 8, 2, NULL, 'Deeniyat', NULL, '5', 'Molana Sajjad', NULL, 'This book is for child.', NULL, 'Faizan', '', '2023-05-27', '3264810579.pdf', NULL, NULL, NULL, '9QF73663B6135KIJST67', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Deeniyat', NULL, 0, 5, '0', '0', '2023-05-27 02:13:51', '2023-05-27 02:19:44'),
(12, 3, 8, 9, 2, NULL, 'Arabic Vacabulary', NULL, '6', 'Mahmood', NULL, 'This book is for arabic learning.', NULL, 'Anas', '', '2023-05-27', '2478360519.pdf', NULL, NULL, NULL, '75B110NY7DGC4VT6B7HM', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Arabic_Vacabulary', NULL, 0, 5, '0', '0', '2023-05-27 02:24:03', '2023-05-27 02:27:48'),
(13, 4, 3, 3, 2, NULL, 'Akhlaque', NULL, '7', 'Molana Rehmani', NULL, 'This book for childrens.', NULL, 'Adil', '', '2023-05-27', '0386745129.pdf', NULL, NULL, NULL, '7D86QEZLB6KFEYX213TB', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Akhlaque', NULL, 0, 5, '0', '0', '2023-05-27 02:30:49', '2023-05-27 02:33:15'),
(14, 4, 3, 4, 4, NULL, 'Social skills in islam', NULL, '7', 'Qari Farique', NULL, 'This book is for childs.', NULL, 'Badar', '', '2023-05-27', '3890271645.pdf', NULL, NULL, NULL, '7B0TPCZV5D9J6NFD4EH5', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Social_skills_in_islam', NULL, 0, 5, '0', '0', '2023-05-27 02:35:51', '2023-05-27 02:36:51'),
(15, 1, 6, 10, 4, NULL, 'Tafseerul Quran', NULL, '8', 'Molana Israr Ahmad', NULL, 'This book is talk about Tafseer.', NULL, 'Shams', '', '2023-05-27', '5438921607.pdf', NULL, NULL, NULL, 'O734D49Q5HNLPRC8GWK7', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Tafseerul_Quran', NULL, 0, 5, '0', '0', '2023-05-27 04:08:48', '2023-05-27 04:10:34'),
(16, 5, 4, 1, 4, NULL, 'Principal of Islamic cultural', NULL, '9', 'Syed abdul latif', NULL, 'This book is all about islamic culture.', NULL, 'Syed abdul latif', '', '2023-05-27', '8092617543.pdf', NULL, NULL, NULL, 'DN31J5ZO18W12P6IT6E7', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Principal_of_Islamic_cultural', NULL, 0, 5, '0', '0', '2023-05-27 04:16:55', '2023-05-27 04:18:18'),
(17, 5, 9, 12, 4, NULL, 'Fundamentals of islam', NULL, '10', 'Molana Maudoodi', NULL, 'This book is talk you about fundamentals of islam.', NULL, 'Shamim', '', '2023-05-27', '8406591372.pdf', NULL, NULL, NULL, '56AWMI6241KP78V9J04R', NULL, NULL, 'rtl', 0, 0, 0, 0, 'Fundamentals_of_islam', NULL, 0, 5, '0', '0', '2023-05-27 04:20:51', '2023-05-27 04:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `ebook__audio`
--

CREATE TABLE `ebook__audio` (
  `audio_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `audio_title` longtext DEFAULT NULL,
  `audio_title_ar` varchar(255) DEFAULT NULL,
  `audio_file` varchar(255) DEFAULT NULL,
  `audio_link` varchar(255) DEFAULT NULL,
  `audio_position` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ebook__audio`
--

INSERT INTO `ebook__audio` (`audio_id`, `file_id`, `audio_title`, `audio_title_ar`, `audio_file`, `audio_link`, `audio_position`, `created_at`, `updated_at`) VALUES
(1, 2, 'Dua For protection', 'دعاء للحماية', '30304_Duaa-for-Protection.mp3', 'public/Files/Audio_Book\\30304_Duaa-for-Protection.mp3', NULL, '2023-04-17 05:51:26', '2023-04-18 06:01:08'),
(2, 2, 'Dua For protection new', 'دعاء للحماية جديد', '83181_Duaa-for-Protection.mp3', 'public/Files/Audio_Book\\83181_Duaa-for-Protection.mp3', NULL, '2023-04-18 05:58:23', '2023-04-18 05:58:23'),
(3, 4, 'Audio For Test', 'الصوت للاختبار', '87794_Duaa-for-Protection.mp3', 'public/Files/Audio_Book\\87794_Duaa-for-Protection.mp3', NULL, '2023-04-19 05:58:31', '2023-04-19 05:58:31'),
(4, 4, 'Every Aspect of islam', 'كل جانب من جوانب الإسلام', '72437_differDuaa-for-Protection.mp3', 'public/Files/Audio_Book\\72437_differDuaa-for-Protection.mp3', NULL, '2023-04-19 05:59:28', '2023-04-19 05:59:28'),
(5, 5, 'allData', 'الصوت للاختبار', '65117_Duaa-for-Protection.mp3', 'public/Files/Audio_Book\\65117_Duaa-for-Protection.mp3', NULL, '2023-04-19 06:00:14', '2023-04-19 06:00:14');

-- --------------------------------------------------------

--
-- Table structure for table `ebook__cover`
--

CREATE TABLE `ebook__cover` (
  `ebook__cover_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` int(11) NOT NULL,
  `ebook_cover` longtext DEFAULT NULL,
  `ebook_position` int(11) NOT NULL,
  `ebook_bg_color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ebook__cover`
--

INSERT INTO `ebook__cover` (`ebook__cover_id`, `file_id`, `ebook_cover`, `ebook_position`, `ebook_bg_color`, `created_at`, `updated_at`) VALUES
(2, 2, '99687_the-holy-quran-traslated-by-yusuf-ali-2.jpg', 1, '#a19886', '2023-04-17 05:51:15', '2023-04-18 05:50:55'),
(3, 3, '77797_unnamed.png', 1, '#000000', '2023-04-18 05:36:13', '2023-05-26 04:54:37'),
(4, 6, '76812_51fDM0RL0BL.jpg', 1, '#000000', '2023-05-23 05:51:16', '2023-05-26 04:56:29'),
(5, 7, '38449_quran.png', 1, '#000000', '2023-05-27 01:35:59', '2023-05-27 01:35:59'),
(6, 8, '31818_quran2.jpg', 1, '#000000', '2023-05-27 01:51:10', '2023-05-27 01:51:10'),
(7, 9, '13046_fazail e aamal.jpg', 1, '#000000', '2023-05-27 01:54:31', '2023-05-27 01:54:31'),
(8, 10, '22054_fazail e aamal 2.jpg', 1, '#000000', '2023-05-27 02:06:55', '2023-05-27 02:06:55'),
(9, 11, '71608_deeniyat.jpg', 1, '#000000', '2023-05-27 02:14:21', '2023-05-27 02:14:21'),
(10, 12, '777_arabic.jpg', 1, '#000000', '2023-05-27 02:24:47', '2023-05-27 02:24:47'),
(11, 13, '67857_children1.jpg', 1, '#000000', '2023-05-27 02:31:04', '2023-05-27 02:31:04'),
(12, 14, '88197_chldren 2.jpg', 1, '#000000', '2023-05-27 02:36:17', '2023-05-27 02:36:17'),
(13, 15, '10646_tafseer.jpg', 1, '#000000', '2023-05-27 04:09:49', '2023-05-27 04:09:49'),
(14, 16, '45302_islamic.jpg', 1, '#000000', '2023-05-27 04:17:10', '2023-05-27 04:17:10'),
(15, 17, '94292_islamic 2.jpg', 1, '#000000', '2023-05-27 04:21:02', '2023-05-27 04:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `ebook__location`
--

CREATE TABLE `ebook__location` (
  `location_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `view_duration` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `age` longtext DEFAULT NULL,
  `reader_action` varchar(255) DEFAULT NULL,
  `send_date` varchar(255) NOT NULL,
  `feedback_token` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `created_at`, `updated_at`) VALUES
(1, 'Arabic', '2023-04-18 06:19:30', '2023-04-18 06:19:30'),
(2, 'English', '2023-04-18 06:19:38', '2023-04-18 06:19:44'),
(3, 'Farsi', '2023-04-18 06:19:51', '2023-04-18 06:19:51'),
(4, 'Urdu', '2023-04-18 06:19:56', '2023-04-18 06:19:56'),
(5, 'Hindi', '2023-04-18 06:20:06', '2023-04-18 06:20:06'),
(6, 'Marathi', '2023-04-18 06:20:13', '2023-04-18 06:20:13'),
(7, 'Tamil', '2023-04-18 06:20:19', '2023-04-18 06:20:19'),
(8, 'French', '2023-04-18 06:20:43', '2023-04-18 06:20:43'),
(9, 'German', '2023-04-18 06:20:49', '2023-04-18 06:20:49'),
(10, 'Russian', '2023-04-18 06:21:14', '2023-04-18 06:21:14'),
(11, 'Japanese', '2023-04-18 06:21:24', '2023-04-18 06:21:24'),
(12, 'Panjabi', '2023-04-18 06:21:35', '2023-04-18 06:21:35'),
(13, 'Telugu', '2023-04-18 06:21:47', '2023-04-18 06:21:47'),
(14, 'Tamil', '2023-04-18 06:21:58', '2023-04-18 06:21:58'),
(15, 'Italian', '2023-04-18 06:22:15', '2023-04-18 06:22:15'),
(16, 'Thai', '2023-04-18 06:22:27', '2023-04-18 06:22:27'),
(17, 'Spanish', '2023-04-18 06:22:46', '2023-04-18 06:22:46'),
(18, 'Mandarin Chinese', '2023-04-18 06:22:56', '2023-04-18 06:22:56'),
(19, 'Bengali', '2023-04-18 06:23:05', '2023-04-18 06:23:05'),
(20, 'Portuguese', '2023-04-18 06:23:31', '2023-04-18 06:23:31'),
(21, 'Indonesian', '2023-04-18 06:23:42', '2023-04-18 06:24:35'),
(22, 'Turkish', '2023-04-18 06:24:52', '2023-04-18 06:24:52'),
(23, 'Korean', '2023-04-18 06:25:02', '2023-04-18 06:25:02'),
(24, 'Pushto', '2023-04-18 06:25:08', '2023-04-18 06:25:08'),
(25, 'Sanskirit', '2023-04-18 06:25:25', '2023-04-18 06:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2023_02_26_071632_create_categories_table', 1),
(5, '2023_02_27_142029_create_sub_categories_table', 2),
(6, '2023_02_27_155434_create_third_categories_table', 3),
(7, '2023_02_28_034330_create_languages_table', 4),
(8, '2023_03_01_113912_create_sliders_table', 5),
(9, '2023_03_01_160839_create_promotion_table', 6),
(10, '2023_03_09_002508_create_ebook__cover_table', 7),
(11, '2023_03_18_102910_create_audiobook__cover', 8),
(12, '2023_03_18_104232_create_audiobook_table', 8),
(13, '2023_03_25_090450_create_ebook__audio_table', 9),
(14, '2023_03_30_103858_create_ebook__location_table', 10),
(15, '2023_03_30_123547_create_book_request_table', 11),
(16, '2023_03_31_114215_create_feedback_table', 12),
(17, '2023_04_17_101239_add_paid_to_users_table', 13),
(18, '2023_04_17_101458_add_category_name_ar_to_categories_table', 13),
(19, '2023_02_26_071632_create_category_table', 14),
(20, '2023_04_17_103055_add_category_name_ar_to_category_table', 15),
(21, '2023_04_17_103925_create_table_category__sub', 16),
(22, '2023_04_17_104147_create_category__sub_table', 17),
(23, '2023_04_17_104255_create_category__third_table', 18),
(24, '2023_02_28_054637_update', 19),
(25, '2023_02_28_055610_book', 19),
(26, '2023_02_28_070522_create_categories_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `sub_cat_id` varchar(255) DEFAULT NULL,
  `promotion_attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `category_id`, `sub_cat_id`, `promotion_attachment`, `created_at`, `updated_at`) VALUES
(1, '2', '2', '643d2ad2ebe62.png', '2023-04-17 05:47:39', '2023-04-19 05:52:27'),
(2, '1', '1', '643fc59c9c980.png', '2023-04-17 05:48:29', '2023-04-19 05:16:22');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_heading` varchar(255) NOT NULL,
  `slider_heading_ar` varchar(255) NOT NULL,
  `slider_caption` varchar(255) NOT NULL,
  `slider_link` varchar(255) NOT NULL,
  `slider_bg_color` varchar(255) NOT NULL,
  `slider_position` varchar(255) NOT NULL,
  `slider_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_heading`, `slider_heading_ar`, `slider_caption`, `slider_link`, `slider_bg_color`, `slider_position`, `slider_image`, `created_at`, `updated_at`) VALUES
(1, 'Home Slider', 'المنزل المنزلق', 'Home Slider Caption', 'C:\\xampp\\htdocs\\zhic2\\public\\Slider//64705db9dc148.png', '#915160', '1', '64705db9dc148.png', '2023-04-17 05:41:15', '2023-05-26 01:50:25'),
(2, 'Slider Second', 'المنزلق الثاني', 'Slider Second Caption', 'C:\\xampp\\htdocs\\zhic2\\public\\Slider//64705da1d4c83.png', '#323b24', '2', '64705da1d4c83.png', '2023-04-17 05:45:01', '2023-05-26 01:50:01'),
(5, 'header', '', 'slider caption', 'C:\\xampp\\htdocs\\zhic2\\public\\Slider//64705d5203229.png', '#a78318', '3', '64705d5203229.png', '2023-05-26 00:14:58', '2023-05-26 01:49:00'),
(6, 'Fourtg', '', 'rtet', 'C:\\xampp\\htdocs\\zhic2\\public\\Slider//6470787b683c1.png', '#7f3d3d', '3', '6470787b683c1.png', '2023-05-26 03:44:35', '2023-05-26 03:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Zhic Admin', 'admin@gmail.com', '$2y$10$7okS9eVv11FIDNnk0XT5YuQsUeNUhBGiS3E0E89S1AUovqxYN0QG.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_request`
--
ALTER TABLE `book_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `book_shelf`
--
ALTER TABLE `book_shelf`
  ADD PRIMARY KEY (`book_shelf_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category__sub`
--
ALTER TABLE `category__sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category__third`
--
ALTER TABLE `category__third`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `ebook__audio`
--
ALTER TABLE `ebook__audio`
  ADD PRIMARY KEY (`audio_id`);

--
-- Indexes for table `ebook__cover`
--
ALTER TABLE `ebook__cover`
  ADD PRIMARY KEY (`ebook__cover_id`);

--
-- Indexes for table `ebook__location`
--
ALTER TABLE `ebook__location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
