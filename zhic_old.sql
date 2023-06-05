-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 08:57 AM
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
-- Database: `azhic1`
--

-- --------------------------------------------------------

--
-- Table structure for table `audiobook`
--

CREATE TABLE `audiobook` (
  `audio_id` bigint(255) NOT NULL,
  `sub_cat_id` bigint(255) DEFAULT NULL,
  `category_id` bigint(255) DEFAULT NULL,
  `unique_id` longtext NOT NULL,
  `location_id` bigint(255) DEFAULT NULL,
  `audio_book_name` text DEFAULT NULL,
  `audio_book_file_attachment` longtext NOT NULL,
  `audio_view` varchar(255) NOT NULL DEFAULT '0',
  `duration` varchar(255) DEFAULT NULL,
  `audio_book_isbn` varchar(255) DEFAULT NULL,
  `audio_book_author` varchar(255) DEFAULT NULL,
  `audio_book_notes` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `test_case` int(255) DEFAULT 1,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audiobook__location`
--

CREATE TABLE `audiobook__location` (
  `location_id` bigint(255) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `view_duration` varchar(255) DEFAULT NULL,
  `audio_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audiobook__location`
--

INSERT INTO `audiobook__location` (`location_id`, `ip_address`, `location`, `view_duration`, `audio_id`) VALUES
(1, '106.213.105.165', 'Atlanta,United States', NULL, 'FV25XAZ48DHCA7446APL');

-- --------------------------------------------------------

--
-- Table structure for table `book_request`
--

CREATE TABLE `book_request` (
  `request_id` bigint(255) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_nationality` varchar(255) DEFAULT NULL,
  `user_spoken` text DEFAULT NULL,
  `user_message` text DEFAULT NULL,
  `request_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_request`
--

INSERT INTO `book_request` (`request_id`, `book_name`, `user_name`, `user_email`, `user_nationality`, `user_spoken`, `user_message`, `request_date`) VALUES
(1, 'z0pI61h9sZ', 'mxrGKhTF6T', 'yN5utC25Lx', '49LAA0aWyi', NULL, 'hello from jharkhand', '2021-08-23 17:41:33'),
(2, 'WdCm0Qs7m5', 'drhWpudDHW', '1p5oOOespY', 'KFsOuj9xd9', 'ueCJxVBK6I', 'kcV3z70ios', '2021-09-20 16:38:44'),
(3, 'abc book', 'ahmed', 'dualsysco@gmail.com', 'India', 'Hindi', 'tet', '2022-02-07 11:50:52'),
(4, 'abc book', 'ahmed', 'dualsysco@gmail.com', 'India', 'Hindi', 'tet', '2022-02-07 11:51:01'),
(5, 'abc book', 'ahmed', 'dualsysco@gmail.com', 'India', 'Hindi', 'tet', '2022-02-07 11:54:04'),
(6, 'abc book', 'ahmed', 'dualsysco@gmail.com', 'India', 'Hindi', 'tet', '2022-02-07 11:56:19'),
(7, 'abc book', 'ahmed', 'dualsysco@gmail.com', 'India', 'Hindi', 'tet', '2022-02-07 12:00:55'),
(8, 'abc book', 'ahmed', 'dualsysco@gmail.com', 'India', 'Hindi', 'tet', '2022-02-07 12:05:28'),
(9, 'abc book', 'ahmed', 'dualsysco@gmail.com', 'India', 'Hindi', 'tet', '2022-02-07 12:07:18'),
(10, 'steps for praying', 'dalal', 'dalalalblooshi1983@gmail.com', 'Iraq', 'arabic', 'need this book', '2022-02-25 12:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `book_shelf`
--

CREATE TABLE `book_shelf` (
  `book_shelf_id` bigint(255) NOT NULL,
  `file_id` bigint(255) DEFAULT NULL,
  `ebook_position` varchar(255) DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_shelf`
--

INSERT INTO `book_shelf` (`book_shelf_id`, `file_id`, `ebook_position`, `created_at`, `updated_at`) VALUES
(1, 26, '1', NULL, NULL),
(2, 27, '2', NULL, NULL),
(3, 30, '3', NULL, NULL),
(4, 29, '4', NULL, NULL),
(5, 28, '5', NULL, NULL),
(6, 10, '6', NULL, NULL),
(7, 9, '7', NULL, NULL),
(8, 12, '8', NULL, NULL),
(9, 7, '9', NULL, NULL),
(10, 8, '10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` bigint(255) NOT NULL,
  `category_name` longtext DEFAULT NULL,
  `category_name_ar` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '-',
  `category_slug` text DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_name_ar`, `category_slug`, `created_at`, `updated_at`) VALUES
(1, 'The Holy Quran', 'القرآن الكريم', 'The-Holy-Quraan', '2021-09-01 16:59:31', '2021-09-26 15:33:35'),
(3, 'Islamic Cultural Books', 'كتب الثقافة الإسلامية', 'Islamic-Cultural-Books', '2021-09-01 16:59:57', NULL),
(4, 'Arabic Learning Books', 'كتب تعلم اللغة العربية', 'Arabic-Learning-Books', '2021-09-01 17:00:12', '2021-09-09 18:29:53'),
(5, 'Children books', 'كتب أطفال', 'Children-books', '2021-09-01 17:00:32', NULL),
(6, 'Articles', 'مقالات', 'Articles', '2021-11-03 14:07:56', '2021-11-03 14:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `category__sub`
--

CREATE TABLE `category__sub` (
  `sub_cat_id` bigint(255) NOT NULL,
  `category_id` bigint(255) NOT NULL,
  `sub_cat_name` longtext DEFAULT NULL,
  `sub_cat_name_ar` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '-',
  `slug` longtext DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category__sub`
--

INSERT INTO `category__sub` (`sub_cat_id`, `category_id`, `sub_cat_name`, `sub_cat_name_ar`, `slug`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'E Holy Quran', 'القرآن الكريم الرقمي', 'E-reading-Quran', '2021-09-01 17:01:24', '2021-09-27 20:02:43', 1),
(2, 1, 'Audio  Quran', 'القرآن الصوتي', 'Audio-Quran', '2021-09-01 17:01:38', NULL, 1),
(3, 2, 'Asian Languages', 'اللغات الأسيوية', 'Meanings-of-the-Holy-Quraan-Asian-Languages', '2021-09-01 17:01:52', '2021-09-06 19:25:04', 1),
(4, 2, 'European Languages', 'اللغات الأوروبية', 'Meanings-of-the-Holy-Quraan-European-Languages', '2021-09-01 17:02:08', '2021-09-06 19:25:15', 1),
(5, 2, 'African Languages', 'اللغات الأفريقية', 'Meanings-of-the-Holy-Quraan-African-Languages', '2021-09-01 17:02:25', '2021-09-06 19:25:23', 1),
(6, 3, 'Asian Languages', 'اللغات الأسيوية', 'Islamic-Cultural-Books-Asian-Languages', '2021-09-01 17:04:36', '2021-09-06 19:25:54', 1),
(7, 3, 'European Languages', 'اللغات الأوروبية', 'Islamic-Cultural-Books-European-Languages', '2021-09-01 17:04:49', '2021-09-06 19:26:13', 1),
(8, 3, 'African Languages', 'اللغات الأفريقية', 'Islamic-Cultural-Books-African-Languages', '2021-09-01 17:05:00', '2021-09-06 19:26:21', 1),
(9, 4, 'Introductory Track', 'مسار تمهيدي', 'Arabic Leaning Books-Introductory-Track', '2021-09-01 17:07:18', '2021-09-27 15:25:28', 1),
(10, 4, 'Intermediate Track', 'مسار متوسط ', 'Arabic-Learning-Books-Intermediate-Track', '2021-09-01 17:07:39', '2021-09-27 15:26:45', 1),
(11, 4, 'Advanced Track', 'مسار متقدم', 'Arabic-Learning-Books-Advanced-Track', '2021-09-01 17:08:01', '2021-09-27 15:33:41', 1),
(12, 5, 'Asian Languages', 'اللغات الأسيوية', 'Childern-Asian-Languages', '2021-09-01 17:08:37', '2021-09-06 19:23:17', 1),
(13, 5, 'European Languages', 'اللغات الأوروبية', 'Childern-European-Languages', '2021-09-06 18:24:32', '2021-09-06 19:23:54', 1),
(14, 5, 'African Languages', 'اللغات الأفريقية', 'Childern-African-Languages', '2021-09-06 18:25:08', '2021-09-06 19:24:25', 1),
(15, 6, 'Asian Languages', 'اللغات الأسيوية', 'Articles-Asian-Languages', '2021-11-03 14:09:14', '2021-11-03 14:35:14', 1),
(16, 6, 'European Languages', 'اللغات الأوروبية', 'Articles-European-Languages', '2021-11-03 14:09:35', '2021-11-03 14:34:57', 1),
(17, 6, 'African Languages', 'اللغات الأفريقية', 'Articles-African-Languages', '2021-11-03 14:09:45', '2021-11-03 14:34:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category__third`
--

CREATE TABLE `category__third` (
  `third_cat_id` bigint(255) NOT NULL,
  `category_id` bigint(255) DEFAULT NULL,
  `sub_cat_id` bigint(255) DEFAULT NULL,
  `third_cat_name` text DEFAULT NULL,
  `third_cat_name_ar` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '-',
  `third_cat_slug` text DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category__third`
--

INSERT INTO `category__third` (`third_cat_id`, `category_id`, `sub_cat_id`, `third_cat_name`, `third_cat_name_ar`, `third_cat_slug`, `created_at`, `updated_at`) VALUES
(2, 4, 9, 'English', 'الإنجليزية', 'Introductory-Track-English', '2021-09-27 19:17:42', NULL),
(3, 4, 9, 'Chinese', 'الصينية', 'Introductory-Track-Chinese', '2021-09-27 19:18:27', NULL),
(7, 4, 10, 'Verbal Track', 'مسار شفهي', 'Intermediate-Track-Verbal', '2021-09-27 19:22:07', '2021-09-29 14:33:04'),
(8, 4, 10, 'Islamic Track', 'مسار إسلامي', 'Intermediate-Track-Islamic', '2021-09-27 19:22:29', '2021-09-29 14:33:18'),
(9, 1, 2, 'Abdul Rahman Al-Sudais', 'عبد الرحمن السديس', 'Audio-Quran-Abdul-Rahman-AlSudais', '2021-09-27 19:33:04', NULL),
(10, 1, 2, 'Ali Jaber', 'علي جابر', 'Audio-Quran-Ali-Jaber', '2021-09-27 19:33:40', NULL),
(11, 1, 2, 'Khalifa Al-Tunaiji', 'خليفة الطنيجي', 'Audio-Quran-Khalifa-AlTunaiji', '2021-09-27 19:34:29', NULL),
(12, 3, 6, 'Chinese', 'الصينية', 'Islamic-Culture-Books-Asian-Chinese', '2021-09-28 00:50:36', NULL),
(13, 3, 7, 'English', 'الإنجليزية', 'Islamic-Culture-Books-European-English', '2021-09-28 01:32:43', NULL),
(14, 5, 12, 'Chinese', 'الصينية', 'Children-Books-Asian-Chinese', '2021-09-28 01:35:30', NULL),
(15, 5, 12, 'Senhali', 'السنهالية', 'Children-Books-Asian-Senhali', '2021-09-28 01:37:28', NULL),
(16, 5, 13, 'English', 'الإنجليزية', 'Children-Books-European-English', '2021-09-28 01:39:27', NULL),
(17, 5, 12, 'Arabic', 'العربية', 'Children-Books-Asian-Arabic', '2021-09-28 01:40:25', NULL),
(18, 5, 12, 'Russian', 'الروسية', 'Children-Books-European-Russian', '2021-09-28 01:41:39', NULL),
(19, 5, 14, 'Amharic', 'الأمهرية', 'Children-Books-African-Amharic', '2021-09-28 01:42:53', NULL),
(20, 5, 14, 'Oromo', 'أورومو', 'Children-Books-African-Oromo', '2021-09-28 01:44:10', NULL),
(21, 5, 12, 'Tagalog', 'الفلبينية', 'Children-Books-Asian-Tagalog', '2021-09-28 01:45:12', NULL),
(22, 2, 3, 'Bangali', 'البنغالية', 'Meaning-of-Holy-Quran-Asian-Bangali', '2021-09-28 01:49:50', '2021-09-28 01:50:05'),
(23, 2, 3, 'Tagalog', 'الفلبينية', 'Meaning-of-Holy-Quran-Asian-Tagalog', '2021-09-28 01:51:01', NULL),
(24, 2, 3, 'Urdu', 'الأردية', 'Meaning-of-Holy-Quran-Asian-Urdu', '2021-09-28 01:51:34', NULL),
(25, 2, 3, 'Turkish', 'التركية', 'Meaning-of-Holy-Quran-Asian-Turkish', '2021-09-28 01:52:10', NULL),
(26, 2, 5, 'Lingala', 'اللينغالا', 'Meaning-of-Holy-Quran-African-Lingala', '2021-09-28 01:52:52', NULL),
(27, 2, 5, 'Swahili', 'السواحيلية', 'Meaning-of-Holy-Quran-African-Swahili', '2021-09-28 01:55:36', NULL),
(28, 2, 3, 'Chinese', 'الصينية', 'Meaning-of-Holy-Quran-Asian-Chinese', '2021-09-28 01:56:02', NULL),
(29, 5001, 5001, 'Hafs Narration', 'رواية حفص', 'The-Holy-Quran-E-Holy-Quran-Hafs-Narration', '2021-09-28 16:12:42', NULL),
(30, 1, 1, 'The Holy Qur’an', 'القران الكريم', 'The-Holy-Quran-MBR', '2021-09-28 16:13:06', '2022-01-25 19:20:23'),
(31, 2, 4, 'English', 'الإنجليزية', 'Meaning-of-Holy-Quran-European-English', '2021-09-28 18:44:34', NULL),
(33, 3, 8, 'Kiswahili', 'السواحيلية', 'Islamic-Culture-Books-African-Kiswahili', '2021-09-28 18:50:06', '2021-11-20 20:15:36'),
(34, 3, 8, 'Amharic', 'الأمهرية', 'Islamic-Culture-Books-African-Amharic', '2021-09-28 18:50:25', NULL),
(35, 3, 8, 'Oromo', 'أورومو', 'Islamic-Culture-Books-African-Oromo', '2021-09-28 18:51:05', NULL),
(36, 3, 6, 'Tamil', 'التاميل', 'Islamic-Culture-Books-Asian-Tamil', '2021-09-28 18:52:08', NULL),
(37, 3, 6, 'Tagalog', 'الفلبينية', 'Islamic-Culture-Books-Asian-Tagalog', '2021-09-28 18:53:07', NULL),
(38, 3, 6, 'Urdu', 'الأردية', 'Islamic-Culture-Books-Asian-Urdu', '2021-09-28 18:53:50', NULL),
(39, 3, 6, 'Russian', 'الروسية', 'Islamic-Culture-Books-European-Russian', '2021-09-28 18:54:37', '2021-11-20 18:59:11'),
(40, 3, 6, 'Korean', 'الكورية', 'Islamic-Culture-Books-Asian-Korean', '2021-09-28 18:55:00', NULL),
(41, 3, 6, 'Indonesian', 'الأندونيسية', 'Islamic-Culture-Books-Asian-Indonesian', '2021-09-28 18:55:32', NULL),
(42, 3, 7, 'German', 'ألمانية', 'Islamic-Culture-Books-European-German', '2021-09-28 18:56:07', NULL),
(43, 6, 16, 'French', 'فرنسي', 'Articles-European-French', '2021-11-03 14:29:33', '2021-11-21 17:10:53'),
(44, 6, 15, 'Chinese', 'الصينية', 'Articles-Asian-Chinese', '2021-11-03 14:30:39', NULL),
(45, 6, 15, 'Senhali', 'السنهالية', 'Articles-Asian-Senhali', '2021-11-03 14:31:14', NULL),
(46, 6, 15, 'Tagalog', 'الفلبينية', 'Articles-Asian-Tagalog', '2021-11-03 14:31:42', NULL),
(47, 6, 15, 'Urdu', 'الأردية', 'Articles-Asian-Urdu', '2021-11-03 14:32:02', NULL),
(48, 6666, 16, 'English', 'الإنجليزية', 'Articles-European-English', '2021-11-03 14:33:14', NULL),
(49, 6, 17, 'Amharic', 'الأمهرية', 'Articles-African-Amharic', '2021-11-03 14:33:54', NULL),
(50, 6, 16, 'Russian', 'الروسية', 'Articles-European-Russian', '2021-11-03 14:34:13', '2021-11-21 17:10:33'),
(52, 3, 6, 'Sinhala', 'السنهالية', 'Islamic-Cultrual-Books-Asian-Sinhala', '2021-11-20 19:19:54', NULL),
(53, 3, 7, 'Spanish', 'الأسبانية', 'Islamic-Culture-Books-European-Spanish', '2021-11-20 19:35:05', NULL),
(55, 2, 3, 'Hindi', 'الهندية', 'Meaning-of-Holy-Quran-Asian-Hindi', '2021-11-21 16:29:13', NULL),
(56, 2, 3, 'Vietnamese', 'فيتنامي', 'Meaning-of-Holy-Quran-Asian-Vietnamese', '2021-11-21 16:36:08', NULL),
(57, 2, 3, 'Azerbaijani', 'الأذربيجانية', 'Meaning-of-Holy-Quran-Asian-Azerbaijani', '2021-11-21 16:42:09', '2021-11-21 16:44:11'),
(58, 2, 3, 'Indonesian', 'الأندونيسية', 'Meaning-of-Holy-Quran-Asian-Indonesian', '2021-11-21 16:46:37', NULL),
(59, 2, 3, 'Kurdish', 'كردي', 'Meaning-of-Holy-Quran-Asian-Kurdish', '2021-11-21 16:50:38', NULL),
(60, 2, 5, 'Oromo', 'أورومو', 'Meaning-of-Holy-Quran-African-Oromo', '2021-11-21 16:58:17', NULL),
(61, 2, 3, 'Japanese', 'اليابانية', 'Meaning-of-Holy-Quran-Asian-Japanese', '2021-11-21 17:01:18', NULL),
(62, 6, 16, 'Spanish', 'الأسبانية', 'Articles-European-Spanish', '2021-11-21 17:11:50', NULL),
(63, 4, 9, 'Amharic', 'الأمهرية', 'Introductory-Track-Amharic', '2021-11-22 18:42:12', NULL),
(64, 4, 9, 'French', 'فرنسي', 'Introductory-Track-French', '2021-11-22 18:42:51', NULL),
(65, 4, 9, 'Tagalog', 'الفلبينية', 'Introductory-Track-Tagalog', '2021-11-22 18:45:55', NULL),
(66, 4, 9, 'Sinhala', 'السنهالية', 'Introductory-Track-Sinhala', '2021-11-22 18:46:41', NULL),
(67, 4, 9, 'Russian', 'الروسية', 'Introductory-Track-Russian', '2021-11-22 19:08:43', NULL),
(68, 1, 2, 'Saad El Ghamidi', 'سعد الغامدي', 'Saad-El-Ghamidi', '2021-11-27 13:17:32', NULL),
(69, 1, 2, 'Saud Shuraim', 'سعود شريم', 'Saud-Shuraim', '2021-11-27 13:18:15', NULL),
(70, 1, 2, 'Maher Al Mueaqly', 'ماهر المعيقلي', 'Maher-Al-Mueaqly', '2021-11-27 13:18:38', NULL),
(71, 1, 2, 'Ali Al huthaify', 'علي الحذيفي', 'Ali-Al-huthaify', '2021-11-27 13:19:24', NULL),
(72, 1, 2, 'Idriss Abkar', 'ادريس ابكر', 'Idriss-Abkar', '2021-11-27 13:21:34', NULL),
(73, 1, 2, 'Muhammad Ayyub', 'محمد أيوب', 'Muhammad-Ayyub', '2021-11-27 13:22:05', NULL),
(74, 1, 2, 'Salah Bukhatir', 'صلاح بوخاطر', 'Salah-Bukhatir', '2021-11-27 17:50:46', NULL),
(75, 1, 2, 'Mishary Rashid Alafasy', 'مشاري راشد العفاسي', 'Mishary-Rashid-Alafasy', '2021-11-27 17:55:13', NULL),
(77, 1, 2, 'Mahmoud Khalil Al Hussary', 'محمود خليل الحصري', 'Mahmoud-Khalil-Al-Hussary', '2021-11-27 18:16:15', NULL),
(78, 1, 2, 'Mohamed Tablawi', 'محمد الطبلاوي', 'Mohamed-Tablawi', '2021-11-27 18:31:53', NULL),
(79, 1, 2, 'Mohamed Siddiq El-Minshawi', 'محمد صديق المنشاوي', 'Mohamed-Siddiq-ElMinshawi', '2021-11-27 18:32:22', NULL),
(80, 1, 2, 'Abdulbasit Abdusamad', 'عبد الباسط عبد الصمد', 'Abdulbasit-Abdusamad-Reciter', '2021-11-29 15:16:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `file_id` bigint(255) NOT NULL,
  `category_id` bigint(255) NOT NULL,
  `sub_cat_id` bigint(255) NOT NULL,
  `third_cat_id` bigint(255) DEFAULT NULL,
  `language_id` bigint(255) DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `file_name` longtext DEFAULT NULL,
  `file_name_ar` text DEFAULT NULL,
  `file_isbn` varchar(255) DEFAULT NULL,
  `file_author` longtext DEFAULT NULL,
  `file_author_ar` text DEFAULT NULL,
  `file_note` longtext DEFAULT NULL,
  `file_note_ar` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ebook_publisher` varchar(255) DEFAULT NULL,
  `publishing_date` varchar(255) DEFAULT NULL,
  `file_attachment` longtext DEFAULT NULL,
  `p_r_ebook` longtext DEFAULT NULL,
  `ebook_link` text DEFAULT NULL,
  `ebook_download_link` text DEFAULT NULL,
  `unique_id` longtext DEFAULT NULL,
  `no_view` varchar(255) NOT NULL DEFAULT '0',
  `view_duration` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `downloadable` int(255) NOT NULL DEFAULT 0,
  `printable` int(255) NOT NULL DEFAULT 0,
  `searchable` int(255) DEFAULT NULL,
  `featured` int(255) DEFAULT NULL,
  `ebook_slug` longtext DEFAULT NULL,
  `ebook_audio` longtext DEFAULT NULL,
  `book_type` int(255) NOT NULL DEFAULT 0,
  `avg_rating` float NOT NULL DEFAULT 5,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `deleted_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`file_id`, `category_id`, `sub_cat_id`, `third_cat_id`, `language_id`, `languages`, `file_name`, `file_name_ar`, `file_isbn`, `file_author`, `file_author_ar`, `file_note`, `file_note_ar`, `ebook_publisher`, `publishing_date`, `file_attachment`, `p_r_ebook`, `ebook_link`, `ebook_download_link`, `unique_id`, `no_view`, `view_duration`, `direction`, `downloadable`, `printable`, `searchable`, `featured`, `ebook_slug`, `ebook_audio`, `book_type`, `avg_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 12, 14, 10, 'Mandarian', '请助我一臂之力-Help', 'خذ بيدي', '9789948236733-9-2', 'Aisha Saeed Al Zaabi', 'عايشة سعيد الزعابي', 'This story is about Raed, the outstanding student, who lost his father and becomes the breadwinner of the family. He goes to school in the morning and continues work until night. His studies failure is caused by vicissitudes of life, yet his brilliant colleague Rashid provides help to him and his family; so that he can focus on his studies and resume his heydays to become the top of the class along with Rashid – his close friend. Truly, ‘Best friends, are the siblings that Allah did not give us’.', NULL, 'ZHIC', '2021-09-01', '609541378260195.pdf', '', NULL, NULL, 'F10NKIC8B39G08SR2T21', '11', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 0, '请助我一臂之力-Help', NULL, 0, 3.99, '2021-09-28 01:46:52', NULL, NULL),
(2, 5, 12, 14, 10, 'Mandarian', '你当说善言-Say Polite Words', 'قل كلاماً طيباً ', '9789948236719-3', 'Hisham Damerji', 'هشام دمرجي', 'This story revolves around Ahmed, who always passes by an abandoned house. It happens that he throws a ball one day, to discover the echo of the act. When Ahmed shouts, the shouting replicates from inside to fill him with anger to swear; only to have the same sound goes back to him. He tells his teacher about the matter. The teacher says, ‘say nice words this time, and tell me what will happen’. He follows the advice and hears back good words. The teacher responds, ‘what goes around comes around’.', NULL, 'ZHIC', '2021-09-01', '174208359639670.pdf', '789634512061694.pdf', NULL, NULL, 'K6HS7Y03Q6950713TA54', '6', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 0, '你当说善言-Say-Polite Words', NULL, 0, 5, '2021-09-28 01:47:05', NULL, NULL),
(3, 5, 12, 14, 10, 'Mandarian', '一切始于晨礼-Starting from Dawn Prayer', 'بدءًا من صلاة الفر', '978-9948-23-672-6-4', 'Noura Abdul Ghani Itani', 'نورة عبدالغني عيتاني', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'تدور أحداث قصة \" بدءًا من صلاة الفجر \" حول شخصية راشد الذي ضيع صلاة الفجر، وبدأ معها يومه بأحداث مربكة، حتى التقى بعبد الرحمن؛ عامل البقالة الفقير، والذي افتقده لصلاة الفجر، ثم تتابع الأحداث بذهاب راشد إلى عمله وعبدالرحمن إلى بقالته، وصولًا إلى ما أكرم الله تعالى به عبدالرحمن من تبني راشد لكل ما تحتاجه عائلة عبدالرحمن، بل وتكفل بأن يكمل عبدالرحمن دراسته على نفقته؛ كل ذلك لأن عبدالرحمن ابتدأ يومه بصلاة الفجر في جماعه، فكان في `ذمة الله ورعايته وسخر له من يعينه.', 'ZHIC', '2021-09-01', '301257984630377.pdf', '139684257081285.pdf', NULL, NULL, 'L6WA4V6CDPR95970EB1Y', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 0, 'Starting-from-Dawn-Prayer-Chinese', NULL, 0, 5, '2021-09-28 01:47:13', '2022-07-11 12:49:16', NULL),
(4, 5, 12, 14, 10, 'Mandarian', '包袋的秘密 - The Secret of The Parcel', 'سر الصرة', '978-9948-23-660-3-2', 'Fatima Al Ameri', 'فاطمة العامري', 'The central character of the story is Salim, who is embarrassed to sit near a student of a different faith. However, he does not disclose the matter except to his grandfather who gives him a parcel that he should not open before two weeks. Salim agrees, but detects bad smelling from the parcel which he gives back to his grandfather, who explains to Salim that it is the same odor of what you have against that student and ‘The only way to recover is tolerance’. Thus, the old man teaches his grandson a lesson that he will remember forever.', NULL, 'ZHIC', '2021-09-01', '126703584915521.pdf', '013648927562211.pdf', NULL, NULL, '74E33G8PNSA9Q0K28M9I', '2', NULL, 'ltr', 1, 1, 1, 0, 'The-Secret-of-The-Parcel-Chinese', NULL, 0, 5, '2021-09-28 01:47:23', NULL, NULL),
(5, 5, 12, 14, 10, 'Mandarian', '白色的口罩 - The White Mask', 'القناع الأبيض', '978-9948-23-670-2-3', 'Rami Mattrawi', 'رامي مطراوي', 'This  story is about a physician called Osama, who lives for some time in Europe and comes back home following the death of his father to get the inheritance, only to be shocked that his father left him nothing but a small box. When he is destined to have had an accident, all the villagers come to help with blood donation, maintaining of car, etc. To his surprise, all of them wear green masks signifying good deeds. The idea originates from a white mask wearing old man who they do not know. Astonished as he is, Osama opens the box to find a message from his father, stating apology for leaving him nothing other than good deeds that will eventually be of benefit to him. Along with the message, is a white mask!', NULL, 'ZHIC', '2021-09-01', '153892670488421.pdf', '208567493151797.pdf', NULL, NULL, 'FGL4KDO0E487IV7N6Z29', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 0, 'The-White-Mask-Chinese', NULL, 0, 5, '2021-09-28 01:47:39', NULL, NULL),
(6, 5, 12, 14, 10, 'Mandarian', '新月朝向何方? - Where is The Crescent Heading?', 'لى أين يتجه الهلال', '978-9948-23-659-7-3', 'Ahid Alzaerat', 'عاهد عزيرات', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', '2021-09-01', '51073268943501.pdf', '741938205615521.pdf', NULL, NULL, '1Y1XQS9G6R1HE32K0P03', '6', '2022-01-26 16:53:14', 'ltr', 1, 1, 1, 0, 'Where-is-The-Crescent-Heading-Chinese', NULL, 0, 5, '2021-09-28 01:47:51', NULL, NULL),
(7, 5, 12, 14, 10, 'Mandarian', '宽容的 故事 - Tolerance Stories', 'قصص التسامح', '9789948236733-1', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', '2021-09-01', '365928017444783.pdf', '859376140247475.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-CHIN.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-KIDS-CHIN.pdf', '4HOSG03LR10F9447PC55', '8', '2021-11-28 10:04:54', 'ltr', 1, 1, 0, 0, 'Tolerance-Stories-Chinese', NULL, 0, 5, '2021-11-23 14:43:10', NULL, NULL),
(8, 5, 12, 15, 11, 'Senhali', 'ඉවසීම කතන්දර - Tolerance Stories', 'قصص التسامح', '9789948236733-6', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', '2021-09-01', '397684251077898.pdf', '859421637089754.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-SINH.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-KIDS-SINH.pdf', '3V6A02166WM41B054GPK', '3', '2021-10-19 18:13:24', 'ltr', 1, 1, 0, 1, 'Tolerance Stories-Senhali', NULL, 0, 5, '2021-11-23 14:44:07', NULL, NULL),
(9, 5, 13, 16, 4, 'English', 'Tolerance Stories', 'قصص التسامح', '9789948236733-2', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', '2021-09-01', '072416839531178.pdf', '14975082369128.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-ENG.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-ENG-KIDS.pdf', 'Q17RB3X2ITK5SAEHC835', '18', '2022-10-31 12:44:06', 'ltr', 1, 1, 0, 1, 'Tolerance-Stories-English', NULL, 0, 4, '2022-02-07 13:09:59', NULL, NULL),
(10, 5, 12, 17, 2, 'Arabic', 'حكايات التسامح', 'حكايات التسامح', '9789948236733-1', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', '\nيستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس\n', 'ZHIC', NULL, '967285301431728.pdf', '728946153028037.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-ARAB.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-KIDS-ARAB.pdf', '0FYH114EEK5I0R5MA658', '15', '2022-10-31 12:53:09', 'rtl', 1, 1, 0, 1, 'Tolerance-Stories-Arabic', NULL, 0, 5, '2021-11-23 14:46:24', NULL, NULL),
(11, 5, 12, 18, 12, 'Russian', 'Толерантности Рассказы', 'قصص التسامح', '9789948236733-4', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', '2021-09-01', '813427560911183.pdf', '817632405978978.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-RUSS.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-KIDS-RUSSIAN.pdf', '1RXW02A94D99M119Q5HP', '2', NULL, 'ltr', 1, 1, 0, 1, 'Tolerance-Stories-Russian', NULL, 0, 5, '2021-11-23 14:47:40', NULL, NULL),
(12, 5, 14, 19, 1, 'Amharic', 'የመቻቻል ታሪኮች - Tolerance Stories', 'قصص التسامح', '9789948236733-8', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', '2021-09-01', '874963215031641.pdf', '347150629847054.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-AMH.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-KIDS-AMH.pdf', '21XI30EEV4916TF6CNSG', '6', '2021-11-01 19:24:14', 'ltr', 1, 1, 0, 1, 'Tolerance-Stories-Amharic', NULL, 0, 2.25, '2021-11-23 14:48:29', NULL, NULL),
(13, 5, 14, 20, 13, 'Oromo', 'Seenaawwan Waldandahuu', 'قصص التسامح', '9789948236733-7', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', NULL, '582309176468781.pdf', '850624791357420.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-OROMO.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-KIDS-OROMO.pdf', 'A42A140D69PVYB1735LG', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 1, 'Tolerance-Stories-Oromo', NULL, 0, 5, '2021-11-23 14:49:46', NULL, NULL),
(14, 5, 12, 21, 14, 'Tagalog', 'Mga Kuwento ng Pagkakaunawaan', 'قصص التسامح', '9789948236733-5', 'Ahid Alzaerat,Aysha Alzaabi,Hechim Damerji,Noura Itani,Fatima Al Ameri ,Ramy Matrway', 'عايشة الزعابي ، هاشم دمرجي ، نورة عيتاني ، فاطمة العامري ، رامي مطراوي ', 'The book presents a group of selected stories of tolerance for children and adolescents in an interesting manner that makes the reader live the events of the story in all its details, and presents tolerance as a virtue entrenched in the true Islamic religion, and a prominent feature; To achieve coexistence between the human beings.', 'يستعرض الكتاب مجموعة مختارة من قصص عن التسامح للأطفال والشباب، في أسلوب شيق يجعل القارئ يعيش احداث القصة بكل تفاصيلها. كما يقدم التسامح بأنه فضيلة متأصلة في الدين الإسلامي وتتجلى في تحقيق التعايش بين الناس', 'ZHIC', '2021-09-01', '714308962587626.pdf', '627139480593479.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/Tolerance/Tolerance-KIDS-TAG.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/Tolerance/Tolerance-KIDS-TAG.pdf', '097V32Z1BF356DD45LMS', '12', '2021-11-28 03:15:37', 'ltr', 1, 1, 0, 1, 'Tolerance-Stories-Tagalog', NULL, 0, 2.5, '2021-11-23 17:01:24', NULL, NULL),
(16, 2, 5, 27, 15, 'Sawahili', 'Sawahili Quran', 'السواحلية', NULL, NULL, NULL, 'Spoken regions: Eastern and Central Africa, Kenya, Tanzania, and Zaire, \r\nNative speakers: about 50 million', 'ترجمة: الدكتور عبدالله محمد أبو بكر والشيخ ناصر خميس عبدالرحمن\n\nمناطق التحدث بها:المنطقة الشرقية والمركزية من إفريقية، ككينيا، وتنزانيا، وزائير\n\nعدد الناطقين بها: نحو ٥۰ مليوناً', NULL, '2021-09-01', '', '', 'https://epub.qurancomplex.gov.sa/issues/translations/sawahili/offline/download.pdf', 'https://epub.qurancomplex.gov.sa/issues/translations/sawahili/offline/download.pdf', 'RYZ43XIC8OM1A0NL8421', '48', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Sawahili-Quran-Sawahili', NULL, 0, 5, '2021-11-28 02:23:17', NULL, NULL),
(19, 2, 3, 28, 10, 'Mandarian', 'Chinese Quran', 'الصينية', NULL, NULL, NULL, 'Translated by: Sheikh Muhammad Makin\r\n Taiwan, and neighboring countries of China; There is a large Chinese community living in the United States of America and Canada', 'ترجمـة: الشيخ محمد مكين\n \nمناطق التحدث بها: الصين، تايوان، والدول المجاورة للصين؛ وتعيش في الولايات المتحدة الأمريكية وفي كندا جالية صينية كبيرة\n \nعدد الناطقين بها: أكثر من ١۰۰۰ مليون', NULL, NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/Translation/Chinese.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Chinese.pdf', 'JE5796P0T8S3HAD46Z4I', '5', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 1, 'Chinese-Quran-Mandarian', NULL, 0, 5, '2021-11-28 02:23:24', NULL, NULL),
(20, 3, 7, 13, 4, 'English', 'A Guide Book for New Muslims', 'منهاج المهتدين', '978-9948-15-701-4', '', '', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, '617483095255400.pdf', '672041539870379.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/7-english-basic-books/Guid-book-for-new-muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/7-english-basic-books/Guid-book-for-new-muslims.pdf', 'KC9M337ET02N40619613', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 1, 'A-Guide-Book-for-New-Muslims-in-English', NULL, 0, 5, '2021-11-20 15:08:11', NULL, NULL),
(21, 2, 3, 24, 16, 'Urdu', 'Urdu Quran', 'الاوردية', NULL, NULL, NULL, 'Translation: Sheikh Muhammad Al Junakari, and interpretation: Sheikh Salah Al-Din Yusuf\nSpoken areas: Pakistan, India, Bangladesh, and neighboring countries, in many countries with native speakers\nNative speakers: 160 million', 'ترجمـة: الشيخ محمد الجوناكرهي، وتفسير: الشيخ صلاح الدين يوسف\n \nمناطق التحدث بها: باكستان، والهند، وبنغلاديش، والبلاد المجاورة، وتعيش في كثير من البلاد جاليات ناطقة بها\n \nعدد الناطقين بها: ١٦٠ مليوناً', NULL, NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/Translation/Urdu.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Urdu.pdf', 'BSZFK33R0D9NA2Y61HE2', '17', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 1, 'Urdu-Quran-Urdu', NULL, 0, 5, '2021-11-28 02:23:32', NULL, NULL),
(22, 2, 3, 25, 18, 'Turkish', 'Turkish Quran', 'التركية', NULL, NULL, NULL, 'Translated by: Dr. Ali Ozk and Others\r\nSpoken regions: Turkey, Western Thrace (in Greece), Northern Cyprus, neighboring regions of Bulgaria\r\nNative speakers: about 65 million', 'ترجمـة: الدكتور علي أوزك وآخرين\n \nمناطق التحدث بها: تركيا، تراقيا الغربية (في اليونان)، شمال قبرص، المناطق المجاورة من بلغاريا\n \nعدد الناطقين بها: نحو ٦٥ مليوناً', NULL, NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/Translation/Turkish.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Turkish.pdf', 'JG1HZOBX15384R9AY83P', '3', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 1, 'Turkish-Quran-Turkish', NULL, 0, 5, '2021-11-28 02:23:41', NULL, NULL),
(23, 2, 3, 23, 14, 'Tagalog', 'Tagalog Quran', 'التغالوغ', NULL, NULL, NULL, 'Translation: Dr. Abi Al-Khair  Trasson, Professor Badiuzzaman Salem Saliao, and Professor Al-Amin Rodriguez\r\nSpoken regions: Philippines, which is its official language\r\nNative speakers: about 50 million', 'رجمـة: د. أبي الخير تراسون، والأستاذ بديع الزمان سالم سالياو، والأستاذ الأمين رودريجيز\n \nمناطق التحدث بها: الفلبين، وهي لغته الرسمية\n \nعدد الناطقين بها: نحو ٥۰ مليوناً', NULL, NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/Translation/Filipino-Tagalog.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Filipino-Tagalog.pdf', '8SX1QDZG6T0WEYI45AB0', '5', '2021-11-28 09:54:17', 'ltr', 1, 1, 0, 0, 'Tagalog-Quran-Tagalog', NULL, 0, 5, '2021-11-28 02:23:47', NULL, NULL),
(24, 2, 3, 22, 19, 'Bangali', 'Bangali Quran', 'البنغالية', NULL, NULL, NULL, 'Translation: Dr. Abu Bakr Muhammad Zakaria\r\nSpoken regions: Bangladesh, Bengal, India\r\nNative speakers: about 200 million\r\n\r\nThe translation contains two volumes, the first volume from Surat Al-Fatihah to Surat An-Nahl and the second volume from Surat Bani Israel to Surat An-Nas', 'ترجمـة: د. أبو بكر محمد زكريا\n \nمناطق التحدث بها: بنغلاديش، وولاية البنغال بالهند\n \nعدد الناطقين بها: نحو ٢۰۰ مليون\n \nتحتوي الترجمة على مجلدين، المجلد الأول من سورة الفاتحة إلى سورة النحل والمجلد الثاني من سورة بني إسرائيل إلى سورة الناس', NULL, NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/Translation/Bengali-Volume–1.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Bengali-Volume–1.pdf', '7S1CI70235B4G7XD22ON', '9', '2021-09-18 20:52:25', 'ltr', 1, 1, 0, 0, 'Bangali-Quran-Bangali', NULL, 0, 5, '2021-11-28 02:23:54', NULL, NULL),
(25, 2, 5, 26, 20, 'Lingala', 'Lingala Quran', 'اللينغالا', NULL, NULL, NULL, 'Translated by: Sheikh Zakaria Muhammad Balangongo\r\nSpoken regions: Congo\r\nNative speakers: about 12 million', 'ترجمـــة: الشيخ زكريا محمد بالنغونغو\n\nمناطق التحدث بها: الكونغو\n\nعدد الناطقين بها: نحو ١٢ مليوناً', NULL, NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/Translation/Lingala.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Lingala.pdf', 'M2X37FA6T0497G98Q0NC', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Lingala-Quran-Lingala', NULL, 0, 5, '2021-11-28 02:24:02', NULL, NULL),
(26, 3, 7, 13, 4, 'English', 'Islam and Muslims', 'الإسلام والمسلمون', '978-9948-15-703-8', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, the contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, '674951083215086.pdf', '568309271463932.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/7-english-basic-books/English-E-Book-3-Islam-and-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/7-english-basic-books/Islam-and-Muslims.pdf', '0K44B7CTEG6O4JMX1Z5L', '27', '2022-10-30 15:59:11', 'ltr', 1, 1, 1, 1, 'English-Islam-and-Muslims', NULL, 0, 5, '2021-11-20 15:03:40', NULL, NULL),
(27, 3, 7, 13, 4, 'English', 'ETIQUETTES And Codes of Conduct', 'لآداب والفضائل النبوية', '978-9948-37-901-0', 'ZHIC', 'دار زايد للثقافة الإسلامية', 'The book presents the significance of morals and manners in Islam as demonstrated through Qur’anic verses and hadiths. Including cleanliness, hygiene, social etiquette, dealing with spouse, children, guests, social relations, visits to patients and acquaintance, conversation etiquette, and emulating the morals of prophets to achieve the very objective of being in this world.', 'يَسعى كتاب \"الآداب والفضائل النبوية (الإتيكيت)\" إلى إبراز اهتمام الإسلام البالغ بالأخلاقِ والآدابِ والفّضائِلِ الكريمة من خلال جملة من الآيات القرآنية والأحاديث النبوية، والحديث عن النعمة وآدابها، والنظافة والممارسات الصحية، وآداب السلوك في الحياة الاجتماعية؛ مع الزوجة، والطفل، والضيافة، والعلاقات الاجتماعية، وعيادة المريض، والزيارات، وآداب الحديث، والتخلق بأخلاق الأنبياء على نحوٍ تُحقِّق للإنسانِ الغاية من وجودِه في هذا العالَم على الوجهِ الأكمل.', 'ZHIC', NULL, '', '490215638794418.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/5-english-intermedaite-books/Etiquettes.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/5-english-intermedaite-books/Etiquettes.pdf', 'WI6S46F4HN1M88V0LBJ7', '17', '2022-07-06 11:27:16', 'ltr', 1, 1, 1, 1, 'ETIQUETTES-And-Codes-of-Conduct-English', NULL, 0, 5, '2021-11-30 14:05:37', NULL, NULL),
(28, 3, 7, 13, 4, 'English', 'Muhammed ,The Messenger of Peace', 'محمد رسول السلام', '978-9948-09-590-3', 'Dalal Qassim Al Blooshi', 'دلال قاسم البلوشي ', 'This book sheds light on the\r\nhumanitarian aspects of the personality of Prophet Muhammad\r\nand the messages of love and peace he carries to the whole mankind', 'يعتبر كتاب \" محمد رسول السلام \" كتابًا تعريفيًا بمكارم الأخلاق الإنسانية التي ظهرت في شخصية النبي – صلى الله عليه وسلم – من خلال جملة من الأحاديث النبوية، والتي تبرز علاقة النبي الكريم بالزوجة، وبالطفل، وبالجيران، وفي تعاملاته اليومية مع مختلف شرائح المجتمع، وطريقته في التعليم وفي القيادة، وحثه على الجد والعمل بما يخدم الإنسانية جمعاء.', 'ZHIC', NULL, '173896504284462.pdf', '357120964871432.pdf', NULL, NULL, '5BQDEW76XDCGHL23SFM4', '46', '2022-07-06 12:25:47', 'ltr', 1, 1, 1, 1, 'Muhammed-The-Messenger-of-Peace-English', NULL, 0, 5, '2021-11-28 00:54:51', NULL, NULL),
(29, 4, 11, NULL, 4, 'English', 'Communicate In Arabic', 'المخاطبة بالعربية', NULL, NULL, NULL, 'The book focuses on Arabic phonetics to enable students of Arabic o speakers of other languages to use every day Arabic by utilizing various proper usages starting from home, family, venues, time, profession, market, restaurant, hobbies and occasions. The phonological appendix at the end of the book serves a good reference for students self-learning. ', 'يركز الكتاب على نطق الحرف العربي لتمكين الدارس الأجنبي من الاستخدام اليومي السليم  للغة سواء كان في المنزل مع الأسرة، أو ما يختص بالمكان و الزمان و الحرفة و السوق و الطعام و الهوايات و المناسبات. الفهرس الصوتي عند نهاية الكتاب عبارة عن مرجع للاستذكار', 'ZHIC', NULL, '74609152837121.pdf', '165834907259331.pdf', NULL, NULL, 'CDC15W14AFQXL8I07VH9', '9', '2022-05-26 18:20:09', 'rtl', 1, 1, 1, 1, 'Advanced-Track-Communicate-In-Arabic', NULL, 0, 5, '2021-11-24 19:58:29', NULL, NULL),
(30, 3, 7, 13, 4, 'English', 'MILESTONES In The Life of Prophet Muhammed', 'محطات من حياة الرسول (ص', '978-9948-37-945-4', 'Prof. Ikram A. Tawasil & Prof. Abdulhadi T. Daguit', 'أ.د. إكرام , أ. تواصل , أ.د. عبد الهادي دقويت', 'The book is a response to some inquiries about the Prophet’s life, teaching role of previous messengers, and aims and wisdoms behind their sending. Beginning with Adam, Abraham, Moses, Jesus (peace be upon them), and Mohamed – the final messenger. The theme of the book includes events in the life of the Prophet (PBUH) to provide the reader with practical lessons of benefit in this world and the world to come.', 'يُجيبُ كتاب \"محطات من حياة الرسول -صلى الله عليه وسلم-\" عن بعض التَّساؤلات حول مصطلح الرَّسول والنَّبي، والفرق بينهما، كما يُحدِّد الدور الرِّسالي والتَّعليمي للأنبياء والمُرسلين السَّابقين، وإبراز الهدف والحِكمة من إرسالهم ابتداءً بآدم وإبراهيم وموسى وعيسى -عليهم السَّلام-، وانتهاءً بمحمَّد -صلى الله عليه وسلَّم- خاتم المُرسلين، مع إلقاء الضوء على مواقف من حياة النبي – صلى الله عليه وسلم- بما يقدم للقارئ دروسًا وعبرًا ضامنةً ومحققةً لمصلحة النَّاس، وسعادتِهم العاجِلة والآجِلة، في الدنيا والآخـــرة.', 'ZHIC', NULL, '632187594024575.pdf', '890543671293468.pdf', NULL, NULL, 'L1C87W35DF7J6B19XHEB', '15', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 1, 'English-MILESTONES-In-The-Life-of-Prophet-Muhammed', NULL, 0, 2.66667, '2021-09-28 01:33:08', NULL, NULL),
(31, 5351, 5351, 53529, 2, 'Arabic', 'University Quran', 'University Quran', NULL, NULL, NULL, 'المصحف الجوامعي', NULL, 'ZHIC', NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf-3.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf-3.pdf', '3YCXMNT8VS63A4HB1ILO', '8', '2022-01-24 09:48:25', 'rtl', 1, 1, 1, 1, 'University-Quran-Arabic', NULL, 0, 5, '2021-11-30 13:21:04', NULL, NULL),
(32, 5351, 5351, 53529, 2, 'Arabic', 'The Universal Quran', 'The Universal Quran', NULL, NULL, NULL, 'المصحف العادي', NULL, 'ZHIC', NULL, '', '', 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf.pdf', '08XYFC3MDSAEO9QV3GA7', '8', '2022-05-30 10:35:30', 'rtl', 1, 1, 1, 1, 'The-Universal-Quran-Arabic', NULL, 0, 5, '2021-11-30 13:21:35', NULL, NULL),
(34, 4, 9, 2, 4, 'English', 'Arabic introductory track - English', 'مدخل إلى العربية للناطقين بغيرها', NULL, 'Ministry of Culture, Youth and Community Development', 'وزارة الثقافة والشباب وتنمية المجتمع ', 'The book initiates from the learner’s phonological background by dividing Arabic phonemes and the student’s mother tongue phonemes in equal terms regarding phonation, articulation, phonetic relation and non-relation. \nThe book guides the learner through objective lessons to master alphabets, read phrases and sentences, and differentiate between masculine and feminine. Besides, expressing ideas and situations attracted the acclaim and recommendation of specialists attended the forum entitled \"References of Teaching Arabic to Non- speakers in the four Continents of the World” held in Indonesia, 2014.', 'يستهل الكتاب بالخلفية الصوتية للدارس وذلك بتقسيم صوتيات اللغة العربية وصوتيات اللغة الأصلية للمتلقي بالتساو، فيما يختص بالصوت وطريقة اخراجه والعلاقات الصوتية و غير الصوتية. كما يرشد الكتاب القارئ خلال دروس تهدف إلى الإلمام بالحروف وقراءة الجمل والتمييز بين التذكير والتأنيث. بجانب التعبير عن الأفكار والحالات التي نالت استحسان وتوصيات المختصين الذين حضروا المنتدى المعروف ب \"مراجع تعليم اللغة العربية للناطقين بغيرها في قارات العالم الأربع\" المنعقد بإندونيسيا في 2014', 'ZHIC', NULL, '05924861738139.pdf', '960524178392728.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/7-arabic-introductory-track/Arabic-intoductory-track-english-language.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/7-arabic-introductory-track/Arabic-intoductory-track-english-language.pdf', 'FPN38VACS1EY9Z5I2R8H', '10', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 1, 'Arabic-introductory-track-English', NULL, 0, 5, '2021-11-22 19:04:51', NULL, NULL),
(39, 4, 10, 7, 2, 'Arabic', 'Arabic Verbal Communication Level 1', 'تعليم اللغة العربية للناطقين بغيرها\n-تواصل شفوي \n- المرحلة التأسيسية\n', NULL, NULL, NULL, 'The book focuses on teaching basic communication tools taking place amongst members of society, from which certain communicative situations are chosen for learners. Added to preparing cognizance peculiar to each level for better practice at field while mastering the basic four language skills (listening, speaking, reading and writing). The book comprises three educational levels: elementary, intermediate and advanced.', 'يركز الكتاب على تعليم الأدوات الأساسية للتواصل عند أفراد المجتمع الذي تنتقى منه بعض حالات التواصل للدارسين. بالإضافة لإعداد المعرفة الخاصة بكل مستوى لممارسة أفضل على أرض الواقع؛ في الوقت الذي يتم فيه تطوير المهارات الأساسية الأربع للغة؛ ألا وهي الاستماع التحدث   والقراءة والكتابة. يتضمن الكتاب ثلاثة مستويات تعليمية: الأساس، والمتوسط والمتقدم', 'ZHIC', NULL, '364258971058112.pdf', '573041689255634.pdf', NULL, NULL, 'NDQ2JCIB4E608ZP23GKH', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 1, 'Arabic-Verbal-Communication-Level-1-Arabic', NULL, 0, 5, '2021-09-28 01:30:04', NULL, NULL),
(40, 4, 10, 7, 2, 'Arabic', 'Arabic Verbal Communication Level 2', 'تعليم اللغة العربية للناطقين بغيرها – مخاطبة شفهية\nمتوسط\n', NULL, NULL, NULL, 'The book focuses on teaching basic communication tools taking place amongst members of society, from which certain communicative situations are chosen for learners. Added to preparing cognizance peculiar to each level for better practice at field while mastering the basic four language skills (listening, speaking, reading and writing). The book comprises three educational levels: elementary, intermediate and advanced', 'يركز الكتاب على تعليم أدوات المخاطبة الأساسية لدى أفراد المجتمع الذي تنتقى منه حالات معينة للدارسين. بجانب الإعداد المعرفي لكل مستوى لممارسة أفضل على أرض الواقع، مع اتقان المهارات الأساسية الأربع جميعها (الاستماع، المحادثة، القراءة، الكتابة). يتضمن الكتاب ثلاثة مستويات علمية: مبتدئ، متوسط، و متقدم', 'ZHIC', NULL, '948132605743664.pdf', '572190364874247.pdf', NULL, NULL, 'PO626101FMB472DLXIC5', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 1, 1, 'Arabic-Verbal-Communication-Level-2-Arabic', NULL, 0, 5, '2021-09-28 01:31:00', NULL, NULL),
(41, 4, 10, 7, 2, 'Arabic', 'Arabic Verbal Communication Level 3', 'تعليم اللغة العربية للناطقين بغيرها – مخاطبة شفهية \nمتقدم\n', NULL, 'ZHIC', 'دار زايد للثقافة الإسلامية', 'The book focuses on teaching basic communication tools taking place amongst members of society, from which certain communicative situations are chosen for learners. Added to preparing cognizance peculiar to each level for better practice at field while mastering the basic four language skills (listening, speaking, reading and writing). The book comprises three educational levels: elementary, intermediate and advanced', 'يركز الكتاب على تعليم أدوات المخاطبة الأساسية لدى أفراد المجتمع الذي تنتقى منه حالات معينة للدارسين. بجانب الإعداد المعرفي لكل مستوى لممارسة أفضل على أرض الواقع، مع اتقان المهارات الأساسية الأربع جميعها (الاستماع، المحادثة، القراءة، الكتابة). يتضمن الكتاب ثلاثة مستويات علمية: مبتدئ، متوسط، و متقدم', 'ZHIC', NULL, '834067951297493.pdf', '902456731871007.pdf', NULL, NULL, '4H9CW2XZ396BF4BSDNV2', '17', '2021-11-30 13:59:52', 'ltr', 1, 1, 1, 1, 'Arabic-Verbal-Communication-Level-3-Arabic', NULL, 0, 5, '2021-09-28 01:30:45', NULL, NULL),
(42, 5, 12, 17, 2, 'Arabic', 'Starting from Dawn Prayer', 'بدءًا من صلاة الفر', '978-9948-23-672-6-4', 'Noura Abdul Ghani Itani', 'نورة عبدالغني عيتاني', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'تدور أحداث قصة \" بدءًا من صلاة الفجر \" حول شخصية راشد الذي ضيع صلاة الفجر، وبدأ معها يومه بأحداث مربكة، حتى التقى بعبد الرحمن؛ عامل البقالة الفقير، والذي افتقده لصلاة الفجر، ثم تتابع الأحداث بذهاب راشد إلى عمله وعبدالرحمن إلى بقالته، وصولًا إلى ما أكرم الله تعالى به عبدالرحمن من تبني راشد لكل ما تحتاجه عائلة عبدالرحمن، بل وتكفل بأن يكمل عبدالرحمن دراسته على نفقته؛ كل ذلك لأن عبدالرحمن ابتدأ يومه بصلاة الفجر في جماعه، فكان في `ذمة الله ورعايته وسخر له من يعينه.', 'ZHIC', '2021-09-01', '067298341511288.pdf', '073469185275704.pdf', NULL, NULL, 'F39JFWFIPTDF15604N5G', '43', '2022-10-31 12:42:32', 'rtl', 1, 1, 1, 1, 'Starting-from-Dawn-Prayer-Arabic', '157483609229797.mp3', 0, 4, '2021-09-28 01:57:12', NULL, NULL),
(52, 1, 1, 9, 2, 'Arabic', 'Abdul Rahman Al Sudais', 'عبد الرحمن السديس', NULL, 'Abdul Rahman Al Sudais', 'عبد الرحمن السديس', 'Abdul Rahman Al Sudais Quran Reciter', 'عبد الرحمن السديس المقرئ', NULL, NULL, '381760592454681.mp3', '381760592454681.mp3', NULL, NULL, '5P32S56180Z875V4GCD0', '2', '2022-05-26 18:20:09', NULL, 1, 0, 1, 1, 'Abdul-Rahman-Al-Sudais-Quran', NULL, 1, 5, '2021-09-28 02:10:41', '2022-07-11 13:13:20', NULL),
(524, 1, 2, 11, 2, 'Arabic', 'Khalifa Al Tunaiji', 'Khalifa Al Tunaiji', NULL, NULL, NULL, 'Khalifa Al Tunaiji Quran UAE Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FN8DQO3Y07SVA846ZW74', '4', '2022-05-26 18:20:09', NULL, 1, 0, 1, 0, 'Khalifa-Al-Tunaiji-Quran', NULL, 1, 5, '2022-01-29 18:08:30', NULL, NULL),
(525, 1, 2, 10, 2, 'Arabic', 'Ali Jaber', 'Ali Jaber', NULL, NULL, NULL, 'Ali Jaber Saudi Quran Reciter', NULL, 'ZHIC', NULL, NULL, NULL, NULL, NULL, '21D78ONH7MFTWILZ404Q', '3', NULL, NULL, 1, 0, 1, 1, 'Ali-Jaber-Reciter-Quran', NULL, 1, 5, '2021-09-28 01:15:36', NULL, NULL),
(531, 1, 1, 30, 2, 'Arabic', 'The Holy Qur’an', 'The Holy Qur’an', NULL, NULL, NULL, 'The Holy Quran', NULL, NULL, NULL, '543786029174382.pdf', '754902836147995.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/MBR_Quran.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/MBR_Quran.pdf', 'SZH13T8WPJI93X7NYE8M', '24', '2023-02-17 16:33:30', 'rtl', 1, 1, 1, 1, 'The-Holy-Quran-MBR-Arabic', NULL, 0, 5, '2022-04-03 16:27:51', NULL, NULL),
(532, 5351, 5351, 53529, 2, 'Arabic', 'Mosque Sized Musḥaf', 'Mosque Sized Musḥaf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/EQuran/Mosque-Sized-Mushaf.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/Mosque-Sized-Mushaf.pdf', '7559S3R0BP6G671D47FZ', '4', '2021-11-30 20:04:43', 'rtl', 1, 1, 0, 1, 'Mosque-Sized-Musaf-Quran-Arabic', NULL, 0, 5, '2021-11-30 13:20:07', NULL, NULL),
(533, 5351, 5351, 53529, 2, 'Arabic', 'Standard Mushaf', 'Standard Mushaf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf.pdf', 'R5G74D97PB4Z11Y6WEDJ', '2', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 1, 'Standard-Mushaf-Quran-Arabic', NULL, 0, 5, '2021-11-30 13:19:28', NULL, NULL),
(534, 5351, 5351, 53529, 2, 'Arabic', 'Standard Musḥaf - 3', 'Standard Musḥaf - 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf-3.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/Standard-Mushaf-3.pdf', 'DWZH54EGES16P9039A37', '5', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 1, 'Standard-Musaf-three-QuranArabic', NULL, 0, 5, '2021-11-30 13:19:04', NULL, NULL),
(535, 5351, 5351, 53529, 2, 'Arabic', 'Medium Sized Mushaf Quran', 'Medium Sized Mushaf Quran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/EQuran/Medium-sized-Mushaf.pdf', 'http://localhost/zhic/public/Locker/Quran/EQuran/Medium-sized-Mushaf.pdf', 'J8AX91C444BFWDR13LF8', '13', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 1, 'Medium-Sized-Mushaf-Quran-Arabic', NULL, 0, 5, '2021-11-30 13:38:03', NULL, NULL),
(536, 3, 7, 13, 4, 'English', 'First Instructions On Worship Shafi school of thought', 'قه المهتدين - شافعي', '9789948156956', 'Samah Marei', 'سماح مرعي', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/7-english-basic-books/first-instructions-for-new-muslims-shafi.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/7-english-basic-books/first-instructions-for-new-muslims-shafi.pdf', 'CJ621T6FD5BLG57H4R0Q', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Hanafi-school-of-thought-English', NULL, 0, 5, '2021-11-20 15:59:35', NULL, NULL),
(537, 3, 7, 13, 4, 'English', 'First Instructions On Worship Maliki school of thought ', 'فقه المهتدين - مالكي', '9789948156956', 'Samah Marei', 'سماح مرعي', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/7-english-basic-books/maliki.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/7-english-basic-books/maliki.pdf', 'CJ621T6FD5BLG57H4R0Q101', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Maliki-school-of-thought-English', NULL, 0, 5, '2021-11-20 15:59:35', NULL, NULL),
(538, 3, 7, 13, 4, 'English', 'First Instructions On Worship Hanafi school of thought ', 'فقه المهتدين - حنفي', '9789948156956', 'Samah Marei', 'سماح مرعي', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/7-english-basic-books/hanafi.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/7-english-basic-books/hanafi.pdf', 'CJ621T6FD5BLG57H4R0Q102', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Hanafi-school-of-thought-English', NULL, 0, 5, '2021-11-20 15:59:35', NULL, NULL),
(539, 3, 7, 13, 4, 'English', 'First Instructions On Worship Hanbali school of thought ', 'فقه المهتدين - حنبلي', '9789948156956', 'Samah Marei', 'سماح مرعي', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/7-english-basic-books/hanbali.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/7-english-basic-books/hanbali.pdf', 'CJ621T6FD5BLG57H4R0Q103', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Hanbali-school-of-thought-English', NULL, 0, 5, '2021-11-20 15:59:35', NULL, NULL),
(540, 3, 8, 34, 1, 'Amharic', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948220572', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-amharic-basicbooks/islam-and-muslim.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-amharic-basic-books/islam-and-muslim.pdf', '40F17Q2L30SNE67316TJ', '2', NULL, 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Amharic', NULL, 0, 5, '2021-11-20 16:40:22', NULL, NULL),
(541, 3, 8, 34, 1, 'Amharic', 'First Instructions On Worship Shafi  school of thought', 'قه المهتدين - شافعي', '9948220541', 'Seim Din', 'سيم دين', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-amharic-basicbooks/shafai.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-amharic-basic-books/shafai.pdf', '40F17Q2L30SNE67316TJ101', '5', NULL, 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Shafi--school-of-thought-Amharic', NULL, 0, 5, '2021-11-20 16:46:12', NULL, NULL),
(542, 3, 8, 34, 1, 'Amharic', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948220541', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed \n', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-amharic-basicbooks/A-Guide-Book-for-New-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-amharic-basic-books/A-Guide-Book-for-New-Muslims.pdf', '40F17Q2L30SNE67316TJ102', '0', NULL, 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Amharic', NULL, 0, 5, '2021-11-20 16:47:19', NULL, NULL);
INSERT INTO `ebook` (`file_id`, `category_id`, `sub_cat_id`, `third_cat_id`, `language_id`, `languages`, `file_name`, `file_name_ar`, `file_isbn`, `file_author`, `file_author_ar`, `file_note`, `file_note_ar`, `ebook_publisher`, `publishing_date`, `file_attachment`, `p_r_ebook`, `ebook_link`, `ebook_download_link`, `unique_id`, `no_view`, `view_duration`, `direction`, `downloadable`, `printable`, `searchable`, `featured`, `ebook_slug`, `ebook_audio`, `book_type`, `avg_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(543, 3, 6, 12, 10, 'Mandarian', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948220589', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-chinese-basic-books/Guide-Book-for-New-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-chinese-basic-books/Guide-Book-for-New-Muslims.pdf', '2B7CZT0ANY6V1242POAF', '3', '2022-01-27 12:09:35', 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Mandarian', NULL, 0, 5, '2021-11-20 17:06:22', NULL, NULL),
(544, 3, 6, 12, 10, 'Mandarian', 'First Instructions On Worship Hanafi school of thought', 'فقه المهتدين - حنفي', '9789948156994', 'Samah Marei', 'سماح مرعي', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-chinese-basic-books/Hanafi.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-chinese-basic-books/hanafi.pdf', 'BI9619X3G2H5QSO18R5W', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Hanafi-school-of-thought-Mandarian', NULL, 0, 5, '2021-11-20 17:10:06', NULL, NULL),
(545, 3, 6, 12, 10, 'Mandarian', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948157014', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-chinese-basic-books/Islam-and-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-chinese-basic-books/Islam-and-Muslims.pdf', 'H8XS85WM2FB4V99E826G', '4', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Mandarian', NULL, 0, 5, '2021-11-20 17:12:23', NULL, NULL),
(546, 3, 7, 42, 21, 'German', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948225089', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-german-basic-books/Islam-and-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-german-basic-books/Islam-and-Muslims.pdf', 'T8BS1JLF2006P37C6VME', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-German', NULL, 0, 5, '2021-11-20 17:23:33', NULL, NULL),
(547, 3, 7, 42, 21, 'German', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948225096', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-german-basic-books/A-Guide-Book-for-New-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-german-basic-books/A-Guide-Book-for-New-Muslims.pdf', '61978X60188REI12V56T', '2', NULL, 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-German', NULL, 0, 5, '2021-11-20 17:25:54', NULL, NULL),
(548, 3, 7, 42, 21, 'German', 'First Instructions On Worship Shafi  school of thought', 'قه المهتدين - شافعي', '9789948225102', 'Seim Din', 'سيم دين', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-german-basic-books/shafai.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-german-basic-books/shafai.pdf', 'Z8L42XE16G857VICHMC2', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Shafi--school-of-thought-German', NULL, 0, 5, '2021-11-20 17:28:03', NULL, NULL),
(549, 3, 6, 41, 7, 'Indonesian', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948096122', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-indonesian-basic-books/islam-and-muslim', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-indonesian-basic-books/Islam-and-Muslims.pdf', '8WR9KY551OCJ8CDXP6Z3', '1', NULL, 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Indonesian', NULL, 0, 5, '2021-11-20 17:36:14', NULL, NULL),
(550, 3, 6, 41, 7, 'Indonesian', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948096139', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-indonesian-basic-books/A-GUIDE-BOOK-FOR-NEW-MUSLIMS.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-indonesian-basic-books/A-GUIDE-BOOK-FOR-NEW-MUSLIMS.pdf', '0B5BDTFO60WNA109KJZA', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Indonesian', NULL, 0, 5, '2021-11-20 17:38:18', NULL, NULL),
(551, 3, 6, 41, 7, 'Indonesian', 'First Instructions On Worship Shafi  school of thought', 'قه المهتدين - شافعي', '9789948096146', 'Seim Din', 'سيم دين', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-indonesian-basic-books/shafai.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-indonesian-basic-books/shafai.pdf', 'BIOL618YTHFEQ719XS3R', '5', '2022-10-30 16:00:00', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Shafi--school-of-thought-Indonesian', NULL, 0, 4, '2021-11-20 17:40:02', NULL, NULL),
(552, 3, 6, 40, 9, 'Korean', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948371687', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-korean-basic-books/Islam-and-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-korean-basic-books/Islam-and-Muslims.pdf', '43EBBQ39Z8P1ORV0K8DX', '1', NULL, 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Korean', NULL, 0, 5, '2021-11-20 17:47:39', NULL, NULL),
(553, 3, 6, 40, 9, 'Korean', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948371670', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-korean-basic-books/new-muslim.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-korean-basic-books/new-muslim.pdf', 'CB5A9398JC809HR120O4', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Korean', NULL, 0, 5, '2021-11-20 17:49:32', NULL, NULL),
(554, 3, 6, 40, 9, 'Korean', 'First Instructions On Worship Hanafi school of thought', 'فقه المهتدين - حنفي', '9789948220517', 'Samah Marei', 'سماح مرعي', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-korean-basic-books/hanafi.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-korean-basic-books/hanafi.pdf', '19H48V27A5R0EWXZ4S83', '3', NULL, 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Hanafi-school-of-thought-Korean', NULL, 0, 5, '2021-11-20 17:52:29', NULL, NULL),
(555, 3, 6, 39, 12, 'Russian', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948157038', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-russain-basic-books/Islam-and-muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-russain-basic-books/Islam-and-muslims.pdf', 'E77HV461DZ9CY5MQO135', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Russian', NULL, 0, 5, '2021-11-20 19:01:26', NULL, NULL),
(556, 3, 6, 39, 12, 'Russian', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948225065', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-russain-basic-books/guid-book-for-new-muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-russain-basic-books/Guide-Book-for-new-muslims.pdf', '57E0C58613FZ9NDH8G29', '2', NULL, 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Russian', NULL, 0, 5, '2021-11-20 19:03:41', NULL, NULL),
(557, 3, 6, 39, 12, 'Russian', 'First Instructions On Worship Shafi  school of thought', 'قه المهتدين - شافعي', '9789948225065', 'Seim Din', 'سيم دين', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-russain-basic-books/shafai.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-russain-basic-books/shafai.pdf', '921F89AQFVK7ZPJ305NL', '2', NULL, 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Shafi--school-of-thought-Russian', NULL, 0, 5, '2021-11-20 19:05:26', NULL, NULL),
(558, 3, 6, 52, 11, 'Senhali', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948185574', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-senhali-basic-books/islam-and-muslim.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-senhali-basic-books/islam-and-muslim.pdf', 'EZ9182Y146R1350I1KTX', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Senhali', NULL, 0, 5, '2021-11-20 19:22:10', NULL, NULL),
(559, 3, 6, 52, 11, 'Senhali', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948185567', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-senhali-basic-books/new-muslim.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-senhali-basic-books/new-muslim.pdf', 'E880WSFFXC3C4LIB7BNP', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Senhali', NULL, 0, 5, '2021-11-20 19:27:38', NULL, NULL),
(560, 3, 6, 52, 11, 'Senhali', 'First Instructions On Worship Shafi  school of thought', 'قه المهتدين - شافعي', '9789948185581', 'Seim Din', 'سيم دين', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-senhali-basic-books/shafai.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-senhali-basic-books/shafai.pdf', 'GR089053S26941J8E9N2', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Shafi--school-of-thought-Senhali', NULL, 0, 5, '2021-11-20 19:32:36', NULL, NULL),
(561, 3, 7, 53, 22, 'Spanish', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948095866', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-spanish-basic-books/islam-and-muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-spanish-basic-books/islam-and-muslims.pdf', 'FC6L91SA70A6WYC4Q95J', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Spanish', NULL, 0, 5, '2021-11-20 19:47:39', NULL, NULL),
(562, 3, 7, 53, 22, 'Spanish', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948095880', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-spanish-basic-books/new-muslim.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-spanish-basic-books/new-muslim.pdf', 'TL2MI8VWXZ49RS07AD34', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Spanish', NULL, 0, 5, '2021-11-20 19:53:44', NULL, NULL),
(563, 3, 7, 53, 22, 'Spanish', 'First Instructions On Worship Maliki school of thought', 'فقه المهتدين - مالكي', '9789948095897', 'Ramzi Ajem', 'رمزي عجم', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-spanish-basic-books/maliki.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-spanish-basic-books/maliki.pdf', '638C69DA1Q66G9MR42C8', '0', NULL, 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Maliki-school-of-thought-Spanish', NULL, 0, 5, '2021-11-20 20:01:03', NULL, NULL),
(564, 3, 8, 33, 8, 'Kiswahili', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948096153', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-swahili-basic-books/Islam-and-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-swahili-basic-books/Islam-and-Muslims.pdf', 'FMBI96YR92AJ7B9GO6P3', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Kiswahili', NULL, 0, 5, '2021-11-20 20:18:22', NULL, NULL),
(565, 3, 8, 33, 8, 'Kiswahili', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948157014', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-swahili-basic-books/NEW-MUSLIM.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-swahili-basic-books/NEW-MUSLIM.pdf', '2P0BVCF1GHW3N4M200ES', '3', NULL, 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Kiswahili', NULL, 0, 5, '2021-11-20 20:20:23', NULL, NULL),
(566, 3, 8, 33, 8, 'Kiswahili', 'First Instructions On Worship Shafi  school of thought', 'قه المهتدين - شافعي', '9789948096177', 'Seim Din', 'سيم دين', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-swahili-basic-books/shafi.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-swahili-basic-books/shafi.pdf', '37682S91VRQ9BGAEPCM5', '2', NULL, 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Shafi--school-of-thought-Kiswahili', NULL, 0, 5, '2021-11-20 20:22:16', NULL, NULL),
(567, 3, 6, 37, 14, 'Tagalog', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948220619', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-tagalog-basic-books/islam-and-muslim.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-tagalog-basic-books/islam-and-muslim.pdf', '37620KC895W8NF3ADOY6', '1', NULL, 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Tagalog', NULL, 0, 5, '2021-11-21 13:34:58', NULL, NULL),
(568, 3, 6, 37, 14, 'Tagalog', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948220626', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-tagalog-basic-books/new-muslim.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-tagalog-basic-books/new-muslim.pdf', 'P5F4I921B5TKML91HDJW', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Tagalog', NULL, 0, 5, '2021-11-21 13:36:27', NULL, NULL),
(569, 3, 6, 37, 14, 'Tagalog', 'First Instructions On Worship shafi school of thought', 'قه المهتدين - شافعي', '9789948220602', 'Seim Din', 'سيم دين', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-tagalog-basic-books/shafi.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-tagalog-basic-books/shafi.pdf', '0J16EI834WS9ZH1TQD7K', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-shafi-school-of-thought-Tagalog', NULL, 0, 5, '2021-11-21 13:38:09', NULL, NULL),
(570, 3, 6, 36, 23, 'Tamil', 'Islam and Muslims', 'الإسلام والمسلمون', '9789948220527', 'Samah Marei', 'سماح مرعي', 'It is an introductory book with regard to the essence of Islam, religious particularities, contribution of Muslims in enriching human civilization with their expertise in culture, art and life sciences. It also introduces the reader to the Almighty creator, the Prophet Mohammed (PBUH), the Qur’an, Sunnah, and explicating of Islamic teachings such as prayer, Hajj, etc. In addition to topics correcting misconceptions about Islam and Muslims like the role of Muslim women in modern society, Hijab, and other issues without denigrating other faiths.', 'يعد كتاب \"الإسلام والمسلمون\" كتابًا تعريفيًا: بجوهر الإسلام، وخصوصياته الدينية، ومساهمة المسلمين في إثراء الحضارة الإنسانية بتجاربهم في مجالات الثقافة والفن والحياة ككل، ويتناول التعريف بالخالق – تبارك وتعالى-، وبمحمد – صلى الله عليه وسلم -، وبالقرآن، وبالسنة، وببعض التعاليم الإسلامية من صلاة، وحج، وغيرها، مع توضيح معانيها السامية، كما يناقش بعض المواضيع المتعلقة بتصحيح المفاهيم الخاطئة عن الإسلام والمسلمين: كدور المرأة المسلمة في المجتمعات المعاصرة، والحجاب، وغيرها من المسائل بأسلوب جاذب بعيدًا عن التعرض للديانات الأخرى', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-tamil-basic-books/Islam-and-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-tamil-basic-books/Islam-and-Muslims.pdf', 'C4JQ161OI79XE63KZNC9', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Islam-and-Muslims-Tamil', NULL, 0, 5, '2021-11-21 13:45:20', NULL, NULL),
(571, 3, 6, 36, 23, 'Tamil', 'A Guide Book for New Muslims', 'منهاج المهتدين', '9789948220534', 'Hasan Lam ,Ramzy Ajem,Samah Marei,Njam Khaja,Seim Din,Nadeem Memon,Qaiser Ahmed', 'حسن لام ، رمزي عجم، سماح مرعي ،نجم خاجه، سيم دين ، نديم مؤمن ،قيصر أحمد', 'The book is a brief comprehensive key knowledge to all that a new Muslim needs at his initial life in Islam. It introduces the pillars and basics of Islam, principles of faith, charitable acts and virtues of practical guidance briefly presented to the new reverts.', 'يعد كتاب \"منهاج المهتدين\" مفتاحاً معرفياً شاملاً ومختصراً لما يحتاجه المهتدي الجديد في بداية رحلته للإسلام؛ إذ يقدم لمحة تعريفيَّة عن أركان الإسلام، وأساسياته، ومبادئ الإيمان، وطرق الإحسان، وفضائل الأعمال، ويحوي إرشادات عملية للمهتدي الجديد، ورُوعي فيه: الإيجاز والاقتضاب، وعدم التعرض إلى الأدلة التفصيلية.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-tamil-basic-books/Guide-Book-for-New-Muslims.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-tamil-basic-books/Guide-Book-for-New-Muslims.pdf', 'NW581DT35KJSIP096146', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'A-Guide-Book-for-New-Muslims-Tamil', NULL, 0, 5, '2021-11-21 13:46:47', NULL, NULL),
(572, 3, 6, 36, 23, 'Tamil', 'First Instructions On Worship Hanafi school of thought', 'فقه المهتدين - حنفي', '9789948220517', 'Samah Marei', 'سماح مرعي', 'It is a basic introductory book necessary for the new Muslim. It demonstrates ways of prayer, cleanliness, man, woman, call for prayer, preparation for prayer and performance of prayer (mandatory, supplementary, and commended).  Added to particulars of prayer, mandatory and supplementary fasting and inquiries thereof. Along with clarifications of meanings in approaches immune to indifference and disturbance for the new Muslim.', 'يعد كتاب \"فقه المهتدين\" مدخلًا معرفيًا أساسيًا لما يحتاجه المسلم الجديد بعد إسلامه؛ إذ يتناول التَّعريف بكيفية الوضوء، ومسائل الطهارة؛ للرجل والمرأة، والأذان، والاستعداد للصلاة، وكيفية أدائها؛ سواء المفروضة منها أو المسنونة أو المندوبة، ومسائل الصلاة، وكيفية أداء صوم الفرض وصوم النفل، والمسائل المتعلقة بها، مع توضيح معانيها السامية؛ بعيدًا عن التعرض للمسائل التي تثير الخلاف، وتشتت المهتدي الجديد', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/reading/3-tamil-basic-books/hanafi.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/watermark/3-tamil-basic-books/hanafi.pdf', '76KJAQLS46000O6P195F', '2', NULL, 'ltr', 1, 1, 0, 0, 'First-Instructions-On-Worship-Hanafi-school-of-thought-Tamil', NULL, 0, 5, '2021-11-21 13:48:07', NULL, NULL),
(573, 3, 7, 13, 4, 'English', 'Global Muslim', 'الحياة في العصر الحديث', '9789948379393', 'Dr.Reda Ibrahim', 'د. رضا براهيم', 't depicts the comprehensiveness of Islam acclimatizing with modernity and beyond. As it covers all the sensible human religious and every day needs. Especially as Islam, urges for keeping pace and interacting with various existing cultures of religious and ideological type. The book also examines western concepts such as globalism, modernity, etc. to ease diversity.', 'يُظهر كتاب \"الحياة في العصر الحديث\" كَمال الإسلام، وشموليته، وصلاحيَّته لكل زمانٍ ومكانٍ، ووفاءه بكل المُتطلَّبات الإنسانيَّة المتوازنة، الدينيَّة والدنيويَّة؛ باعتبار الإسلام دين، وعقيدة، وحضارة؛ يدعو إلى مُواكبة المُسلم الكوني للعَصر، والتَّفاعل الإيجابي بين الحَضارات والثَّقافات على اختلاف خُصوصيَّاتِها الثَّقافيَّة والدِّينيَّة والفِكريَّة، كما يبحث الكِتاب في مُميَّزات العالَم الحَديث، وفي مَفاهيمِه التي أنتجتها الحَضارة الغربيَّة المُعاصرة كالعَولمة، والحَداثة وغيرها، وتَـيْسير إِمْكانات عيش المجتمعات في ظل التنوّع.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/5-english-intermedaite-books/Global-Muslim-WEST.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/5-english-intermedaite-books/Global-Muslim-WEST.pdf', 'T5IZ131LY46O16926DBA', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Global-Muslim-English', NULL, 0, 5, '2021-11-21 14:15:12', NULL, NULL),
(574, 3, 7, 13, 4, 'English', 'Living in the light of God', 'فقه الحياة', '9789948379041', 'Abdul Basit Muhammad', 'عبد الباسط محمد', 'The book depicts Islamic jurisprudence, which is so significant in the life of Muslims. It discusses various topics related to worships, dealing, cleanliness, prayer, fasting, Zakat, Hajj, food, marriage, funeral, inheritance, sell, etc. of respective issues. Especially as jurisprudence is a comprehensive social system reflecting Islam thorough organization of relationship between man and God, individuals, and society as a whole.', 'تكمن أهميَّة كتاب \"فقه الحياة\" في كون الفِقه من أهمِّ العلومِ الإسلاميَّةِ التي يحتاج إليها المُسلم في تطبيق أحكام التَّشريع الإلهي في أمور حياته كلها، فيحتوي هذا الكتاب على عدة محاور وأجزاء في فقه العبادات والمعاملات من طَهارةٍ، وصَلاةٍ، وصِيامٍ، وزكاةٍ، وحَجٍّ، وأطعمةٍ، ونِــكاحٍ، وجَنازةٍ، وميــراثٍ، وبَــيعٍ، وغيرها من المسائل الفقهيَّة المتنوِّعة؛ بما يقدم الفقه كنِظام اجتماعيٍّ شاملٍ لمظهرٍ من مظاهر كَمالِ الإسلام في تنظيم العلاقة بين الإنسان والخالق سبحانه، وبين الإنسان وأخيه الإنسان، والإنسان والمجتمع.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/5-english-intermedaite-books/LIGHT-of-GOD-WESt.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/5-english-intermedaite-books/LIGHT-of-GOD--WESt.pdf', '83BWTDZ1VMB54CA28C67', '2', NULL, 'ltr', 1, 1, 0, 0, 'Living-in-the-light-of-God-English', NULL, 0, 5, '2021-11-21 14:23:20', NULL, NULL),
(575, 3, 7, 13, 4, 'English', 'The Human and The Unseen', 'الإيمان والسعادة', '9789948379386', 'Olgay Emre Serbetcioglu,Sally Tayban ,Nurkisa B, Acosta ,Mustafa Samur ,Allan AbdulHaleem Bana', 'أولجاي إمري سيربيتسي أوغلو ، سالي طيبان ، نوركيسا ب ، أكوستا ، مصطفى سامر ، ألان عبد الحليم بانا.', 'The book portrays the significance of thinking about God, the One and Perfect enough to be worshipped alone. Added to presenting the concept of faith and its relation to true happiness reached through instinctive obedience to God, and good deeds to others.', 'يتناول كتاب \"الإيمان والسعادة\" أهمية التفكر في الخالق المستحق للعبادة، وأنه سبحانه متفرد في صفات الكمال والجلال بما يجعله هو المعبود بحق، مع تقديم مفهوم الإيمان وعلاقته الوثيقة بالسَّعادة الحقيقيَّة؛ بما يقتضيه هذا الإيمان من الطَّاعات التي تتناسب مع الفِطرة، والأعمال الصَّالحة، والحياة الكونيَّة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/5-english-intermedaite-books/Human-and-Unseen.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/5-english-intermedaite-books/Human-and-Unseen.pdf', '890K2OFIA8F9E39X67V1', '2', '2022-03-16 15:43:04', 'ltr', 1, 1, 0, 0, 'The-Human-and-The-Unseen-English', NULL, 0, 5, '2021-11-21 14:26:32', NULL, NULL),
(576, 3, 6, 36, 23, 'Tamil', 'Qurann and Sunnah as a source of knowledge ,normes and values', 'القرآن الكريم والسنة النبوية مصدر الثقافة والقيم', '9789948397489', 'Madin Academy', 'Madin Academy', 'The book introduces Qur’an and Sunnah as a source of culture and values revealed by the Almighty to teach Islam, guide, educate and establish godly and social human values. It also presents revelation, as a source of knowledge of God most honoring on humankind.', 'يُعرِّف كتاب \"القرآن الكريم والسنة النبوية مصدر الثقافة والقيم\" بالقرآن الكريم والسُّنة النَّبويَّة الشَّريفة باعتبارهما وحياً من عِند الله تعالى، وكمصدرين لتعاليم الإسلام، والعلوم، والمقاصد الشَّرعية، والهداية، والتربيَّة، والعدل، والقيم الإنسانيَّة؛ التي تُحَدِّد علاقة الإنسان بالله تعالى وبالناس وبالمجتمع وبالكون، فالكِتاب يُقدِّم الوحيَ بوَصفه مصدراً للمعرفة، ومن أعظم صُوَرِ التَّـكريم التي امْتـنَّ الله به على البشريَّـــة جمعاء.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-tamil-intermedaite-books/Quraan-Sunnah.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-tamil-intermedaite-books/Quraan-Sunnah.pdf', 'K92L5ES183BQ2IEG9A5M', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Qurann-and-Sunnah-as-a-source-of-knowledge-normes-and-values-Tamil', NULL, 0, 5, '2021-11-21 15:06:38', NULL, NULL);
INSERT INTO `ebook` (`file_id`, `category_id`, `sub_cat_id`, `third_cat_id`, `language_id`, `languages`, `file_name`, `file_name_ar`, `file_isbn`, `file_author`, `file_author_ar`, `file_note`, `file_note_ar`, `ebook_publisher`, `publishing_date`, `file_attachment`, `p_r_ebook`, `ebook_link`, `ebook_download_link`, `unique_id`, `no_view`, `view_duration`, `direction`, `downloadable`, `printable`, `searchable`, `featured`, `ebook_slug`, `ebook_audio`, `book_type`, `avg_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(577, 3, 6, 36, 23, 'Tamil', 'Global Muslim', 'الحياة في العصر الحديث', '9789948397502', 'Madin Academy', 'Madin Academy', 't depicts the comprehensiveness of Islam acclimatizing with modernity and beyond. As it covers all the sensible human religious and every day needs. Especially as Islam, urges for keeping pace and interacting with various existing cultures of religious and ideological type. The book also examines western concepts such as globalism, modernity, etc. to ease diversity', 'يُظهر كتاب \"الحياة في العصر الحديث\" كَمال الإسلام، وشموليته، وصلاحيَّته لكل زمانٍ ومكانٍ، ووفاءه بكل المُتطلَّبات الإنسانيَّة المتوازنة، الدينيَّة والدنيويَّة؛ باعتبار الإسلام دين، وعقيدة، وحضارة؛ يدعو إلى مُواكبة المُسلم الكوني للعَصر، والتَّفاعل الإيجابي بين الحَضارات والثَّقافات على اختلاف خُصوصيَّاتِها الثَّقافيَّة والدِّينيَّة والفِكريَّة، كما يبحث الكِتاب في مُميَّزات العالَم الحَديث، وفي مَفاهيمِه التي أنتجتها الحَضارة الغربيَّة المُعاصرة كالعَولمة، والحَداثة وغيرها، وتَـيْسير إِمْكانات عيش المجتمعات في ظل التنوّع.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-tamil-intermedaite-books/Global-Muslim.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-tamil-intermedaite-books/Global-Muslim.pdf', 'RJYBEI1D397N2P04QTMA', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Global-Muslim-Tamil', NULL, 0, 5, '2021-11-21 15:09:06', NULL, NULL),
(578, 3, 6, 36, 23, 'Tamil', 'MILESTONES In The Life of Prophet Muhammed', 'محطات من حياة الرسول (ص', '9789948397519', 'Madin Academy', 'Madin Academy', 'The book is a response to some inquiries about the Prophet’s life, teaching role of previous messengers, and aims and wisdoms behind their sending. Beginning with Adam, Abraham, Moses, Jesus (peace be upon them), and Mohamed – the final messenger. The theme of the book includes events in the life of the Prophet (PBUH) to provide the reader with practical lessons of benefit in this world and the world to come.', 'يُجيبُ كتاب \"محطات من حياة الرسول -صلى الله عليه وسلم-\" عن بعض التَّساؤلات حول مصطلح الرَّسول والنَّبي، والفرق بينهما، كما يُحدِّد الدور الرِّسالي والتَّعليمي للأنبياء والمُرسلين السَّابقين، وإبراز الهدف والحِكمة من إرسالهم ابتداءً بآدم وإبراهيم وموسى وعيسى -عليهم السَّلام-، وانتهاءً بمحمَّد -صلى الله عليه وسلَّم- خاتم المُرسلين، مع إلقاء الضوء على مواقف من حياة النبي – صلى الله عليه وسلم- بما يقدم للقارئ دروسًا وعبرًا ضامنةً ومحققةً لمصلحة النَّاس، وسعادتِهم العاجِلة والآجِلة، في الدنيا والآخـــرة.', 'ZHIC', NULL, NULL, NULL, NULL, NULL, 'P279QDR7KX17ZBL3I01A', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'MILESTONES-In-The-Life-of-Prophet-Muhammed-Tamil', NULL, 0, 5, '2021-11-21 15:10:02', NULL, NULL),
(579, 3, 6, 36, 23, 'Tamil', 'Humanity of prophet Muhammed', 'محمد الإنسان', '9789948397526', 'Madin Academy', 'Madin Academy', 'The book presents the simple life of the Prophet (PBUH), his compassion, love and respect for others. Notably as the Prophet was perfect enough to deal with both serious and simple issues at the same time. He was a father, husband, mentor, leader, prophet, messenger, and social reformer. The aim of the biography presented is to follow the Prophet as a role model in terms of his great human morals.', 'يقدّم كتاب \"محمد الإنسان\" شخصيَّة الرسول محمد -صلَّى الله عليه وسلَّم- على قدر كبير جدًا من البساطة، والرَّحمة، وحبّ الآخرين، واحترامه في تعامله مع الناس جميعاً، فهو إنسانٌ يتَّسِم بالكمال الذي يكمُن في جَمعه بين الأمور الجليلة وبين البساطة في آنٍ واحد، فهو أبٌ، وزوجٌ، ومربيٌ، وقائدٌ، ونبيٌّ، ورسول الله، وباني لمجتمع وثيق، كما يركز الكتاب في عرضه لشخصية محمد –صلى الله عليه وسلم- على أهمية الاقتداء به، وبأخلاقه الإنسانية العظيمة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-tamil-intermedaite-books/Muhammad-The-Human.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-tamil-intermedaite-books/Muhammad-The-Human.pdf', 'TVO8G9N68B1Y222919I1', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Humanity-of-prophet-Muhammed-Tamil', NULL, 0, 5, '2021-11-21 15:25:33', NULL, NULL),
(580, 3, 6, 36, 23, 'Tamil', 'Etiquettes and Codes of conduct', 'لآداب والفضائل النبوية', '9789948397786', 'Madin Academy', 'Madin Academy', 'The book presents the significance of morals and manners in Islam as demonstrated through Qur’anic verses and hadiths. Including cleanliness, hygiene, social etiquette, dealing with spouse, children, guests, social relations, visits to patients and acquaintance, conversation etiquette, and emulating the morals of prophets to achieve the very objective of being in this world.', 'يَسعى كتاب \"الآداب والفضائل النبوية (الإتيكيت)\" إلى إبراز اهتمام الإسلام البالغ بالأخلاقِ والآدابِ والفّضائِلِ الكريمة من خلال جملة من الآيات القرآنية والأحاديث النبوية، والحديث عن النعمة وآدابها، والنظافة والممارسات الصحية، وآداب السلوك في الحياة الاجتماعية؛ مع الزوجة، والطفل، والضيافة، والعلاقات الاجتماعية، وعيادة المريض، والزيارات، وآداب الحديث، والتخلق بأخلاق الأنبياء على نحوٍ تُحقِّق للإنسانِ الغاية من وجودِه في هذا العالَم على الوجهِ الأكمل.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-tamil-intermedaite-books/Etiquette.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-tamil-intermedaite-books/Etiquette.pdf', 'Y8VD6QBKAM613NGWSZ7O', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Etiquettes-and-Codes-of-conduct-Tamil', NULL, 0, 5, '2021-11-21 15:34:53', NULL, NULL),
(581, 3, 6, 36, 23, 'Tamil', 'Living the life of goodness and blessing', 'Living the life of goodness and blessing', '9789948397793', 'Madin Academy', 'Madin Academy', 'The book discusses the virtue and significance of morals in bonding man with God, prophets, humankind, family, and environment. Which are essential to human life.', 'The book discusses the virtue and significance of morals in bonding man with God, prophets, humankind, family, and environment. Which are essential to human life.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-tamil-intermedaite-books/Modern-Life.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-tamil-intermedaite-books/Modern-Life.pdf', '879493Y1F35DIQLSZ2XM', '2', NULL, 'ltr', 1, 1, 0, 0, 'Living-the-life-of-goodness-and-blessing-Tamil', NULL, 0, 5, '2021-11-21 15:41:46', NULL, NULL),
(582, 3, 6, 12, 10, 'Mandarian', 'Global Muslim', 'الحياة في العصر الحديث', '9789948232667', 'Wan tian fang', 'Wan tian fang', 't depicts the comprehensiveness of Islam acclimatizing with modernity and beyond. As it covers all the sensible human religious and every day needs. Especially as Islam, urges for keeping pace and interacting with various existing cultures of religious and ideological type. The book also examines western concepts such as globalism, modernity, etc. to ease diversity.', 'يُظهر كتاب \"الحياة في العصر الحديث\" كَمال الإسلام، وشموليته، وصلاحيَّته لكل زمانٍ ومكانٍ، ووفاءه بكل المُتطلَّبات الإنسانيَّة المتوازنة، الدينيَّة والدنيويَّة؛ باعتبار الإسلام دين، وعقيدة، وحضارة؛ يدعو إلى مُواكبة المُسلم الكوني للعَصر، والتَّفاعل الإيجابي بين الحَضارات والثَّقافات على اختلاف خُصوصيَّاتِها الثَّقافيَّة والدِّينيَّة والفِكريَّة، كما يبحث الكِتاب في مُميَّزات العالَم الحَديث، وفي مَفاهيمِه التي أنتجتها الحَضارة الغربيَّة المُعاصرة كالعَولمة، والحَداثة وغيرها، وتَـيْسير إِمْكانات عيش المجتمعات في ظل التنوّع.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-Chinese-intermedaite-books/Global-Muslim.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-chinese-intermedaite-books/Global-Muslim.pdf', 'H04JV6273G9IDTBE90OW', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Global-Muslim-Mandarian', NULL, 0, 5, '2021-11-21 15:53:29', NULL, NULL),
(583, 3, 6, 12, 10, 'Mandarian', 'MILESTONES In The Life of Prophet Muhammed', 'محطات من حياة الرسول (ص', '9789948232674', 'Niu Yang Ling', 'نيو يانج لينج', 'The book is a response to some inquiries about the Prophet’s life, teaching role of previous messengers, and aims and wisdoms behind their sending. Beginning with Adam, Abraham, Moses, Jesus (peace be upon them), and Mohamed – the final messenger. The theme of the book includes events in the life of the Prophet (PBUH) to provide the reader with practical lessons of benefit in this world and the world to come.', 'يُجيبُ كتاب \"محطات من حياة الرسول -صلى الله عليه وسلم-\" عن بعض التَّساؤلات حول مصطلح الرَّسول والنَّبي، والفرق بينهما، كما يُحدِّد الدور الرِّسالي والتَّعليمي للأنبياء والمُرسلين السَّابقين، وإبراز الهدف والحِكمة من إرسالهم ابتداءً بآدم وإبراهيم وموسى وعيسى -عليهم السَّلام-، وانتهاءً بمحمَّد -صلى الله عليه وسلَّم- خاتم المُرسلين، مع إلقاء الضوء على مواقف من حياة النبي – صلى الله عليه وسلم- بما يقدم للقارئ دروسًا وعبرًا ضامنةً ومحققةً لمصلحة النَّاس، وسعادتِهم العاجِلة والآجِلة، في الدنيا والآخـــرة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-Chinese-intermedaite-books/Mohammed-Prophet.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-chinese-intermedaite-books/Mohammed-Prophet.pdf', 'Y9PFZORM27XB6A1ACEGW', '6', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'MILESTONES-In-The-Life-of-Prophet-Muhammed-Mandarian', NULL, 0, 5, '2021-11-21 15:57:33', NULL, NULL),
(584, 3, 6, 12, 10, 'Mandarian', 'Humanity of prophet Muhammed', 'محمد الإنسان', '9789948379058', 'Mashew Zi', 'ميشاو زي', 'The book presents the simple life of the Prophet (PBUH), his compassion, love and respect for others. Notably as the Prophet was perfect enough to deal with both serious and simple issues at the same time. He was a father, husband, mentor, leader, prophet, messenger, and social reformer. The aim of the biography presented is to follow the Prophet as a role model in terms of his great human morals.', 'يقدّم كتاب \"محمد الإنسان\" شخصيَّة الرسول محمد -صلَّى الله عليه وسلَّم- على قدر كبير جدًا من البساطة، والرَّحمة، وحبّ الآخرين، واحترامه في تعامله مع الناس جميعاً، فهو إنسانٌ يتَّسِم بالكمال الذي يكمُن في جَمعه بين الأمور الجليلة وبين البساطة في آنٍ واحد، فهو أبٌ، وزوجٌ، ومربيٌ، وقائدٌ، ونبيٌّ، ورسول الله، وباني لمجتمع وثيق، كما يركز الكتاب في عرضه لشخصية محمد –صلى الله عليه وسلم- على أهمية الاقتداء به، وبأخلاقه الإنسانية العظيمة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-Chinese-intermedaite-books/Momammed-Human.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-chinese-intermedaite-books/Momammed-Human.pdf', 'DFI2G941MS6RA6H18K7B', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Humanity-of-prophet-Muhammed-Mandarian', NULL, 0, 5, '2021-11-21 16:02:36', NULL, NULL),
(585, 3, 6, 12, 10, 'Mandarian', 'Etiquettes and Codes of conduct', 'لآداب والفضائل النبوية', '9789948421863', 'Wang Cho Being', 'وان جو بينغ', 'The book presents the significance of morals and manners in Islam as demonstrated through Qur’anic verses and hadiths. Including cleanliness, hygiene, social etiquette, dealing with spouse, children, guests, social relations, visits to patients and acquaintance, conversation etiquette, and emulating the morals of prophets to achieve the very objective of being in this world.', 'يَسعى كتاب \"الآداب والفضائل النبوية (الإتيكيت)\" إلى إبراز اهتمام الإسلام البالغ بالأخلاقِ والآدابِ والفّضائِلِ الكريمة من خلال جملة من الآيات القرآنية والأحاديث النبوية، والحديث عن النعمة وآدابها، والنظافة والممارسات الصحية، وآداب السلوك في الحياة الاجتماعية؛ مع الزوجة، والطفل، والضيافة، والعلاقات الاجتماعية، وعيادة المريض، والزيارات، وآداب الحديث، والتخلق بأخلاق الأنبياء على نحوٍ تُحقِّق للإنسانِ الغاية من وجودِه في هذا العالَم على الوجهِ الأكمل.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Reading/8-Chinese-intermedaite-books/Etiquettee.pdf', 'http://localhost/zhic/public/Locker/Intermedaite-Books/Uploading/Watermark/8-chinese-intermedaite-books/Etiquettee.pdf', 'AM0XT84Y5E4D603A0O98', '7', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Etiquettes-and-Codes-of-conduct-Mandarian', NULL, 0, 5, '2021-11-21 16:04:36', NULL, NULL),
(586, 2, 3, 55, 17, 'Hindi', 'Hindi Quran', 'الهندية', NULL, NULL, NULL, 'Translated by: Shaikh Aziz Al-Haq Al-Omari\r\nRegions where spoken: India, neighboring countries, and Hindi-speaking communities live in many countries\r\nSpeakers: Almost 400 million', 'ترجمـة: الشيخ عزيز الحق العمري\n \nمناطق التحدث بها: الهند، والبلاد المجاورة، وفي كثير من البلاد جاليات ناطقة بالهندية\n \nعدد الناطقين بها: نحو ٤۰۰ مليون', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/Translation/Hindi.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Hindi.pdf', '7DKZ1H4E299TRJ9A6M6V', '6', '2022-02-24 16:43:24', 'ltr', 1, 1, 0, 0, 'Hindi-Quran-Hindi', NULL, 0, 5, '2021-11-28 02:24:11', NULL, NULL),
(587, 2, 3, 56, 24, 'Vietnamese', 'Vietnamese Quran', 'الفيتنامية', NULL, NULL, NULL, 'Translated by: Shaikh Hassan Abdul Karim\r\nRegions where spoken: Vietnam, Cambodia, Laos; In the United States of America, and other countries, Vietnamese communities', 'ترجمـة: الشيخ حسن عبد الكريم\n \nمناطق التحدث بها: فيتنام، كمبوديا، لاوس؛ وفي الولايات المتحدة الأمريكية، ودول أخرى جاليات فيتنامية\n \nعدد الناطقين بها: نحو ٦۰ مليوناً', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/Translation/Vietnamese.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Vietnamese.pdf', '32C4TO919D896DXEKJS8', '2', NULL, 'ltr', 1, 1, 0, 0, 'Vietnamese-Quran-Vietnamese', NULL, 0, 5, '2021-11-28 02:24:19', NULL, NULL),
(588, 2, 3, 57, 25, 'Azerbaijani', 'Azeri Quran', 'الأذربيجانية', NULL, NULL, NULL, 'Translation: Sheikh Ali Khan M. Speaking areas: Azerbaijan, NW Iran, some communities in Georgia, Armenia and Dagestan. Speakers: 14 million. ', 'ترجمـة: الشيخ علي خان موساييف\n \nمناطق التحدث بها: جمهورية أذربيجان، وشمال غرب إيران؛ وتتحدث بها كذلك جاليات في جورجيا، وأرمينيا، وداغستان\nعدد الناطقين بها: نحو ١٤ مليوناً', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/Translation/Azeri.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Azeri.pdf', '6MNDD2AV781808GLJK17', '3', '2022-02-24 16:39:32', 'ltr', 1, 1, 0, 0, 'Azeri-Quran-Azerbaijani', NULL, 0, 5, '2021-11-28 02:24:25', NULL, NULL),
(589, 2, 3, 58, 7, 'Indonesian', 'Indonesian Quran', 'الإندونيسية', NULL, NULL, NULL, 'Translated by: Indonesian Ministry of Religious Affairs\r\nRegions where spoken: Indonesia, Malaysia, Brunei, and neighboring countries. It is called in Malaysia and Brunei \"Malay language\"\r\nSpeakers: 160 million', 'ترجمـة: وزارة الشؤون الدينية الإندونيسية\n \nمناطق التحدث بها: إندونيسيا، وماليزيا، وبروناي، والبلاد المجاورة، وتسمى في ماليزيا وبروناي «لغة الملايو»\n \nعدد الناطقين بها: ١٦٠ مليوناً', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/Translation/Indonesian.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Indonesian.pdf', '876B5O146PC6R2J12ABT', '3', '2022-02-24 16:38:39', 'ltr', 1, 1, 0, 0, 'Indonesian-Quran-Indonesian', NULL, 0, 5, '2021-11-28 02:24:30', NULL, NULL),
(590, 2, 3, 59, 26, 'Kurdish', 'Kurdish Quran', 'الكردي', NULL, NULL, NULL, 'Translated by: Shaikh Mohammad Salah Al-Bamoki\nRegions where spoken: Iraq, Iran and Turkey; a large community in the diaspora\nSpeakers: About 12 million', 'ترجمه الشيخ محمد صلاح البموقي\nالمناطق التي يتحدث بها: العراق وإيران وتركيا. مجتمع كبير في الشتات\nالمتحدثون: حوالي 12 مليون', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/Translation/Kurdish.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Kurdish.pdf', '45LQ30XBBD3F36YEBZB7', '3', '2022-02-24 16:38:00', 'ltr', 1, 1, 0, 0, 'Kurdish-Quran-Kurdish', NULL, 0, 5, '2021-11-28 02:24:35', NULL, NULL),
(591, 2, 5, 60, 13, 'Oromo', 'Oromo Quran', 'الأورومية', NULL, NULL, NULL, 'Translated by: Shaikh Mohammad Rashad Abdullah Al-Harari\r\nRegions where spoken: Ethiopia and Kenya\r\nSpeakers: About 11 million', 'ترجمـة: الشيخ محمد رشاد عبد الله الهرري\n\nمناطق التحدث بها: أثيوبيا وكينيا\n\nعدد الناطقين بها: نحو ١١ مليوناً', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/Translation/Oromo.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Oromo.pdf', 'JR9MBAGE65D0L3S2XHV6', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Oromo-Quran-Oromo', NULL, 0, 5, '2021-11-28 02:24:40', NULL, NULL),
(592, 2, 3, 61, 27, 'Japanese', 'Japanese Quran', 'اليابانية', NULL, NULL, NULL, 'Translated by: Al-Tafsir Al-Muyassar by Shaikh Saeed Sato\r\nRegions where spoken: Japan. Japanese-speaking communities live in many countries of the world\r\nSpeakers: 125 million', 'ترجمـة: التفسير الميسر للشيخ سعيد ساتو\n \nمناطق التحدث بها: اليابان. وتقطن جاليات ناطقة باللغة اليابانية في كثير من بلاد العالم\n \nعدد الناطقين بها: ١٢٥ مليوناً', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Quran/Translation/Japanese.pdf', 'http://localhost/zhic/public/Locker/Quran/Translation/Japanese.pdf', '6H22TS6OK9DI90YAB1J2', '9', '2022-02-24 16:37:21', 'ltr', 1, 1, 0, 0, 'Japanese-Quran-Japanese', NULL, 0, 5, '2021-11-28 02:22:49', NULL, NULL),
(593, 6, 15, 44, 10, 'Mandarian', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Communal-Tolerance.pdf', 'H836ZAMA7O74TX5F09WE', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Article-Communal-Tolerance-Mandarian', NULL, 0, 5, '2021-11-21 17:23:19', NULL, NULL),
(594, 6, 15, 44, 10, 'Mandarian', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Cultural-Diversity.pdf', 'QTGSBO23W41R6A8Z2J9C', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Article-Cultural-Diversity-Mandarian', NULL, 0, 5, '2021-11-21 17:28:19', NULL, NULL),
(595, 6, 15, 44, 10, 'Mandarian', 'UAE: A Tolerant and Close-knit Community', 'UAE: A Tolerant and Close-knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'ZTB974L6AKQ30BS9Y201', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'UAE-A-Tolerant-and-Closeknit-Community-Mandarian', NULL, 0, 5, '2021-11-21 17:30:53', NULL, NULL),
(596, 6, 15, 44, 10, 'Mandarian', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Aspiration-in-the-possibility-approach.pdf', '68N4XJS7131OA8H76Q05', '2', NULL, 'ltr', 1, 1, 0, 0, 'Article-Aspiration-in-the-possibility-approach-Mandarian', NULL, 0, 5, '2021-11-21 17:33:54', NULL, NULL),
(597, 6, 15, 44, 10, 'Mandarian', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Distance-learning-An-authentic-system.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Distance-learning-An-authentic-system.pdf', '45NG8M70SE5T9A4H09F6', '2', NULL, 'ltr', 1, 1, 0, 0, 'Article-Distance-learning-An-authentic-system-Mandarian', NULL, 0, 5, '2021-11-21 17:36:41', NULL, NULL),
(598, 6, 15, 44, 10, 'Mandarian', 'Tolerance & Human Rights', 'Tolerance & Human Rights', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Tolerance-Human-Rights.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Tolerance-Human-Rights.pdf', '1E46881IB3AAS6VW6GZ4', '2', NULL, 'ltr', 1, 1, 0, 0, 'Article-Tolerance-and-Human-Rights-Mandarian', NULL, 0, 5, '2021-11-21 17:40:50', NULL, NULL),
(599, 6, 15, 44, 10, 'Mandarian', 'International Tolerance', 'International Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/International-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/International-Tolerance.pdf', 'OER32W7AS3KV63A9M73Z', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Article-International-Tolerance-Mandarian', NULL, 0, 5, '2021-11-21 17:45:57', NULL, NULL),
(600, 6, 15, 44, 10, 'Mandarian', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Ramadan-and-Human-Building.pdf', 'O83V816L635JYS0B7G91', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Ramadan-and-Human-Building-Mandarian', NULL, 0, 5, '2021-11-22 14:50:43', NULL, NULL),
(601, 6, 15, 44, 10, 'Mandarian', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Sustainable-Tolerance.pdf', '70QH9C91L46X8OIG1654', '1', NULL, 'ltr', 1, 1, 0, 0, 'Article-Sustainable-Tolerance-Mandarian', NULL, 0, 5, '2021-11-22 14:52:33', NULL, NULL),
(602, 6, 15, 44, 10, 'Mandarian', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Chinese', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Chinese/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/Chinese/Tolerance-and-Social-Cohesion.pdf', 'CITQ3Y10F2WJ946RLH98', '4', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Article-Tolerance-and-Social-Cohesion-Mandarian', NULL, 0, 5, '2021-11-22 16:02:33', NULL, NULL),
(603, 3, 7, 13, 4, 'English', 'I converted,and what is next ?', 'أسلمت؛ فماذا بعد؟', '9789948187929', 'Dr.Reda Ibrahim', 'د. رضا براهيم', 'The book is a simplified guide discussing the most significant issues and challenges that may face new Muslims after embracing Islam. It responds to their queries about coming to Islam, Islamic dress, food, interpersonal relationship and other major issues through depiction of previous new Muslims to help new comers to stick firmly to their new faith.', 'يُعد كتاب \" أسلمت فماذا بعد؟ \" دليلًا مبسطًا يناقش أهم القضايا والتحديات التي ربما تواجه المهتدين الجدد بعد اعتناقهم الإسلام، ويجيب على كثير من تساؤلاتهم واستفساراتهم فيما يخص كيفية الدخول في الإسلام، والزي الإسلامي، وقضايا الأطعمة، والعلاقة مع الآخرين، وغيرها من القضايا المهمة، ويقدم عرضًا فريدًا من نوعه لتجارب السابقين في الإسلام ليمضي المهتدي الجديد قدماً بخطوات ثابته على هدي الدين الحنيف.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/reading/1-i-converted-so-what-is-next/I-Converted-so-what-is-next.pdf', 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/1-i-converted-so-what-is-next/I-Converted-so-what-is-next.pdf', 'GBCR5S911JTIAFM36678', '4', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'I-convertedand-what-is-next--English', NULL, 0, 5, '2021-11-22 17:07:53', NULL, NULL),
(604, 3, 6, 12, 10, 'Mandarian', 'Muhammed ,the messenger of peace', 'محمد رسول السلام', '9789948095903-2', 'Dalal Qassim Alblooshi', 'دلال قاسم البلوشي ', 'The book introduces the humanity of the Prophet (PBUH) through hadiths demonstrating his relationship with spouse, children, neighbors and daily life with various segments of society, his approach to teaching and leadership, and inspiration for hard work to benefit all humankind.', 'يعتبر كتاب \" محمد رسول السلام \" كتابًا تعريفيًا بمكارم الأخلاق الإنسانية التي ظهرت في شخصية النبي – صلى الله عليه وسلم – من خلال جملة من الأحاديث النبوية، والتي تبرز علاقة النبي الكريم بالزوجة، وبالطفل، وبالجيران، وفي تعاملاته اليومية مع مختلف شرائح المجتمع، وطريقته في التعليم وفي القيادة، وحثه على الجد والعمل بما يخدم الإنسانية جمعاء.', 'ZHIC', NULL, '483076951288384.pdf', NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/4-messenger-of-peace/Messenger-of-Peace-CHIN.pdf', '43JDV0690OAN93Y151LQ', '11', '2021-11-30 14:19:15', 'ltr', 1, 1, 0, 0, 'Muhammed-the-messenger-of-peace-Mandarian', NULL, 0, 5, '2021-11-28 01:07:14', NULL, NULL),
(605, 3, 8, 34, 1, 'Amharic', 'Muhammed ,The Messenger of Peace', 'محمد رسول السلام', '9789948095903-3', 'Dalal Qassim Alblooshi', 'دلال قاسم البلوشي', 'The book introduces the humanity of the Prophet (PBUH) through hadiths demonstrating his relationship with spouse, children, neighbors and daily life with various segments of society, his approach to teaching and leadership, and inspiration for hard work to benefit all humankind.', 'يعتبر كتاب \" محمد رسول السلام \" كتابًا تعريفيًا بمكارم الأخلاق الإنسانية التي ظهرت في شخصية النبي – صلى الله عليه وسلم – من خلال جملة من الأحاديث النبوية، والتي تبرز علاقة النبي الكريم بالزوجة، وبالطفل، وبالجيران، وفي تعاملاته اليومية مع مختلف شرائح المجتمع، وطريقته في التعليم وفي القيادة، وحثه على الجد والعمل بما يخدم الإنسانية جمعاء.', 'ZHIC', NULL, '257408916373043.pdf', NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/4-messenger-of-peace/Messenger-of-Peace-AMH.pdf', 'X9PHR1G0BDZ285D8EAKQ', '9', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Muhammed-The-Messenger-of-Peace-Amharic', NULL, 0, 5, '2021-11-28 01:12:48', NULL, NULL),
(606, 3, 6, 37, 14, 'Tagalog', 'Muhammed ,The Messenger of Peace', 'محمد رسول السلام', '9789948095903-4', 'Dalal Qassim Alblooshi', 'دلال قاسم البلوشي ', 'The book introduces the humanity of the Prophet (PBUH) through hadiths demonstrating his relationship with spouse, children, neighbors and daily life with various segments of society, his approach to teaching and leadership, and inspiration for hard work to benefit all humankind.', 'يعتبر كتاب \" محمد رسول السلام \" كتابًا تعريفيًا بمكارم الأخلاق الإنسانية التي ظهرت في شخصية النبي – صلى الله عليه وسلم – من خلال جملة من الأحاديث النبوية، والتي تبرز علاقة النبي الكريم بالزوجة، وبالطفل، وبالجيران، وفي تعاملاته اليومية مع مختلف شرائح المجتمع، وطريقته في التعليم وفي القيادة، وحثه على الجد والعمل بما يخدم الإنسانية جمعاء.', 'ZHIC', NULL, NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/4-messenger-of-peace/Messenger-of-Peace-TAG.pdf', 'ZFR88V1FJX5LEH8651I6', '6', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Muhammed-The-Messenger-of-Peace-Tagalog', NULL, 0, 5, '2021-11-22 17:28:12', NULL, NULL),
(607, 3, 7, 13, 4, 'English', 'How do I perfom ablution ?', 'كيف أتوضأ؟', '9789948224990', 'Dr.Saeed Hafez', 'د. سعيد حافظ', 'This booklet provides practical simple steps to do Wudu as a right step towards prayer. It contains nine practical steps starting with the intent and ending with feet washing. The book is a self-learning tool facilitated with explanatory images for each step.', 'يتضمن كتاب \" كيف أتوضأ؟ \" مجموعة من الخطوات العملية الميسّرة لأداء عبادة \"الوضوء\" لتكون مفتاحًا صحيحًا للقيام بفريضة \"الصلاة\"، ويحتوي على (9) خطوات تطبيقية، تبدأ بعقد النِيَّة، وتنتهي بغَسل الرِجْلَيْن، ويتبع الكتاب أسلوب التعلم الذاتي؛ بصورة سهلة، مدعومة بالصورة التوضيحية لكل خطوة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/reading/6-how-do-i-perform-ablution/english_ablution.pdf', 'http://localhost/zhic/public/Locker/Basics-Books/Uploading/..//..//Different-Books/uploading/watermark/6-how-do-i-perform-ablution/english.pdf', 'FI9K5YVW71FAM3099RQ8101', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'How-do-I-perfom-ablution-English', NULL, 0, 5, '2021-11-22 18:34:43', NULL, NULL),
(608, 3, 6, 39, 12, 'Russian', 'How do I perfom ablution ?', 'كيف أتوضأ؟', '9789948421917', 'Dr.Saeed Hafez', 'د. سعيد حافظ', 'This booklet provides practical simple steps to do Wudu as a right step towards prayer. It contains nine practical steps starting with the intent and ending with feet washing. The book is a self-learning tool facilitated with explanatory images for each step.', 'يتضمن كتاب \" كيف أتوضأ؟ \" مجموعة من الخطوات العملية الميسّرة لأداء عبادة \"الوضوء\" لتكون مفتاحًا صحيحًا للقيام بفريضة \"الصلاة\"، ويحتوي على (9) خطوات تطبيقية، تبدأ بعقد النِيَّة، وتنتهي بغَسل الرِجْلَيْن، ويتبع الكتاب أسلوب التعلم الذاتي؛ بصورة سهلة، مدعومة بالصورة التوضيحية لكل خطوة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/reading/6-how-do-i-perform-ablution/russian.pdf', 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/6-how-do-i-perform-ablution/russian.pdf', 'FI9K5YVW71FAM3099RQ8102', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'How-do-I-perfom-ablution-Russian', NULL, 0, 5, '2021-11-22 18:34:24', NULL, NULL),
(609, 3, 8, 35, 13, 'Oromo', 'How do I perfom ablution ?', 'كيف أتوضأ؟', '9789948225041', 'Dr.Saeed Hafez', 'د. سعيد حافظ', 'This booklet provides practical simple steps to do Wudu as a right step towards prayer. It contains nine practical steps starting with the intent and ending with feet washing. The book is a self-learning tool facilitated with explanatory images for each step.', 'يتضمن كتاب \" كيف أتوضأ؟ \" مجموعة من الخطوات العملية الميسّرة لأداء عبادة \"الوضوء\" لتكون مفتاحًا صحيحًا للقيام بفريضة \"الصلاة\"، ويحتوي على (9) خطوات تطبيقية، تبدأ بعقد النِيَّة، وتنتهي بغَسل الرِجْلَيْن، ويتبع الكتاب أسلوب التعلم الذاتي؛ بصورة سهلة، مدعومة بالصورة التوضيحية لكل خطوة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/reading/6-how-do-i-perform-ablution/oromo.pdf', 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/6-how-do-i-perform-ablution/oromo.pdf', 'FI9K5YVW71FAM3099RQ8103', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'How-do-I-perfom-ablution-Oromo', NULL, 0, 5, '2021-11-22 18:33:48', NULL, NULL),
(610, 3, 8, 34, 1, 'Amharic', 'How do I perfom ablution ?', 'كيف أتوضأ؟', '9789948225034', 'Dr.Saeed Hafez', 'د. سعيد حافظ', 'This booklet provides practical simple steps to do Wudu as a right step towards prayer. It contains nine practical steps starting with the intent and ending with feet washing. The book is a self-learning tool facilitated with explanatory images for each step.', 'يتضمن كتاب \" كيف أتوضأ؟ \" مجموعة من الخطوات العملية الميسّرة لأداء عبادة \"الوضوء\" لتكون مفتاحًا صحيحًا للقيام بفريضة \"الصلاة\"، ويحتوي على (9) خطوات تطبيقية، تبدأ بعقد النِيَّة، وتنتهي بغَسل الرِجْلَيْن، ويتبع الكتاب أسلوب التعلم الذاتي؛ بصورة سهلة، مدعومة بالصورة التوضيحية لكل خطوة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/reading/6-how-do-i-perform-ablution/amharic.pdf', 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/6-how-do-i-perform-ablution/amharic.pdf', 'FI9K5YVW71FAM3099RQ8104', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'How-do-I-perfom-ablution-Amharic', NULL, 0, 5, '2021-11-22 18:33:30', NULL, NULL),
(611, 3, 6, 52, 11, 'Senhali', 'How do I perfom ablution ?', 'كيف أتوضأ؟', '9789948225003', 'Dr.Saeed Hafez', 'د. سعيد حافظ', 'This booklet provides practical simple steps to do Wudu as a right step towards prayer. It contains nine practical steps starting with the intent and ending with feet washing. The book is a self-learning tool facilitated with explanatory images for each step.', 'يتضمن كتاب \" كيف أتوضأ؟ \" مجموعة من الخطوات العملية الميسّرة لأداء عبادة \"الوضوء\" لتكون مفتاحًا صحيحًا للقيام بفريضة \"الصلاة\"، ويحتوي على (9) خطوات تطبيقية، تبدأ بعقد النِيَّة، وتنتهي بغَسل الرِجْلَيْن، ويتبع الكتاب أسلوب التعلم الذاتي؛ بصورة سهلة، مدعومة بالصورة التوضيحية لكل خطوة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/reading/6-how-do-i-perform-ablution/senhali.pdf', 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/6-how-do-i-perform-ablution/senhali.pdf', 'FI9K5YVW71FAM3099RQ8105', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'How-do-I-perfom-ablution-Senhali', NULL, 0, 5, '2021-11-22 18:33:08', NULL, NULL),
(612, 3, 6, 38, 16, 'Urdu', 'How do I perfom ablution ?', 'كيف أتوضأ؟', '9789948224976', 'Dr.Saeed Hafez', 'د. سعيد حافظ', 'This booklet provides practical simple steps to do Wudu as a right step towards prayer. It contains nine practical steps starting with the intent and ending with feet washing. The book is a self-learning tool facilitated with explanatory images for each step.', 'يتضمن كتاب \" كيف أتوضأ؟ \" مجموعة من الخطوات العملية الميسّرة لأداء عبادة \"الوضوء\" لتكون مفتاحًا صحيحًا للقيام بفريضة \"الصلاة\"، ويحتوي على (9) خطوات تطبيقية، تبدأ بعقد النِيَّة، وتنتهي بغَسل الرِجْلَيْن، ويتبع الكتاب أسلوب التعلم الذاتي؛ بصورة سهلة، مدعومة بالصورة التوضيحية لكل خطوة.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Different-Books/uploading/reading/6-how-do-i-perform-ablution/urdu.pdf', 'http://localhost/zhic/public/Locker/Different-Books/uploading/watermark/6-how-do-i-perform-ablution/urdu.pdf', 'FI9K5YVW71FAM3099RQ8106', '6', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'How-do-I-perfom-ablution-Urdu', NULL, 0, 5, '2021-11-22 18:32:45', NULL, NULL),
(613, 4, 9, 64, 5, 'French', 'Arabic introductory track - French', 'مدخل إلى العربية للناطقين بغيرها', NULL, NULL, NULL, 'The book initiates from the learner’s phonological background by dividing Arabic phonemes and the student’s mother tongue phonemes in equal terms regarding phonation, articulation, phonetic relation and non-relation. \nThe book guides the learner through objective lessons to master alphabets, read phrases and sentences, and differentiate between masculine and feminine. Besides, expressing ideas and situations attracted the acclaim and recommendation of specialists attended the forum entitled \"References of Teaching Arabic to Non- speakers in the four Continents of the World” held in Indonesia, 2014.', 'يستهل الكتاب بالخلفية الصوتية للدارس وذلك بتقسيم صوتيات اللغة العربية وصوتيات اللغة الأصلية للمتلقي بالتساو، فيما يختص بالصوت وطريقة اخراجه والعلاقات الصوتية و غير الصوتية. كما يرشد الكتاب القارئ خلال دروس تهدف إلى الإلمام بالحروف وقراءة الجمل والتمييز بين التذكير والتأنيث. بجانب التعبير عن الأفكار والحالات التي نالت استحسان وتوصيات المختصين الذين حضروا المنتدى المعروف ب \"مراجع تعليم اللغة العربية للناطقين بغيرها في قارات العالم الأربع\" المنعقد بإندونيسيا في 2014', 'ZHIC', NULL, '05924861738139.pdf', '960524178392728.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/7-arabic-introductory-track/Arabic-intoductory-track-french-language.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/7-arabic-introductory-track/Arabic-intoductory-track-french-language.pdf', 'FPN38VACS1EY9Z5I2R8H101', '3', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 1, 'Arabic-introductory-track-French', NULL, 0, 5, '2021-11-22 19:07:30', NULL, NULL),
(614, 4, 9, 67, 12, 'Russian', 'Arabic introductory track - Russian', 'مدخل إلى العربية للناطقين بغيرها', NULL, NULL, NULL, 'The book initiates from the learner’s phonological background by dividing Arabic phonemes and the student’s mother tongue phonemes in equal terms regarding phonation, articulation, phonetic relation and non-relation. \r\nThe book guides the learner through objective lessons to master alphabets, read phrases and sentences, and differentiate between masculine and feminine. Besides, expressing ideas and situations attracted the acclaim and recommendation of specialists attended the forum entitled \"References of Teaching Arabic to Non- speakers in the four Continents of the World” held in Indonesia, 2014.', 'يستهل الكتاب بالخلفية الصوتية للدارس وذلك بتقسيم صوتيات اللغة العربية وصوتيات اللغة الأصلية للمتلقي بالتساو، فيما يختص بالصوت وطريقة اخراجه والعلاقات الصوتية و غير الصوتية. كما يرشد الكتاب القارئ خلال دروس تهدف إلى الإلمام بالحروف وقراءة الجمل والتمييز بين التذكير والتأنيث. بجانب التعبير عن الأفكار والحالات التي نالت استحسان وتوصيات المختصين الذين حضروا المنتدى المعروف ب \"مراجع تعليم اللغة العربية للناطقين بغيرها في قارات العالم الأربع\" المنعقد بإندونيسيا في 2014', 'ZHIC', NULL, '05924861738139.pdf', '960524178392728.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/7-arabic-introductory-track/Arabic-intoductory-track-russain-language.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/7-arabic-introductory-track/Arabic-intoductory-track-russain-language.pdf', 'FPN38VACS1EY9Z5I2R8H102', '2', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 1, 'Arabic-introductory-track-Russian', NULL, 0, 5, '2021-11-22 19:12:53', NULL, NULL),
(615, 4, 9, 66, 11, 'Senhali', 'Arabic introductory track - Sinhala', 'مدخل إلى العربية للناطقين بغيرها', NULL, NULL, NULL, 'The book initiates from the learner’s phonological background by dividing Arabic phonemes and the student’s mother tongue phonemes in equal terms regarding phonation, articulation, phonetic relation and non-relation. \r\nThe book guides the learner through objective lessons to master alphabets, read phrases and sentences, and differentiate between masculine and feminine. Besides, expressing ideas and situations attracted the acclaim and recommendation of specialists attended the forum entitled \"References of Teaching Arabic to Non- speakers in the four Continents of the World” held in Indonesia, 2014.', 'يستهل الكتاب بالخلفية الصوتية للدارس وذلك بتقسيم صوتيات اللغة العربية وصوتيات اللغة الأصلية للمتلقي بالتساو، فيما يختص بالصوت وطريقة اخراجه والعلاقات الصوتية و غير الصوتية. كما يرشد الكتاب القارئ خلال دروس تهدف إلى الإلمام بالحروف وقراءة الجمل والتمييز بين التذكير والتأنيث. بجانب التعبير عن الأفكار والحالات التي نالت استحسان وتوصيات المختصين الذين حضروا المنتدى المعروف ب \"مراجع تعليم اللغة العربية للناطقين بغيرها في قارات العالم الأربع\" المنعقد بإندونيسيا في 2014', 'ZHIC', NULL, '05924861738139.pdf', '960524178392728.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/7-arabic-introductory-track/Arabic-intoductory-track-senhali-language.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/7-arabic-introductory-track/Arabic-intoductory-track-senhali-language.pdf', 'FPN38VACS1EY9Z5I2R8H103', '2', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 0, 'Arabic-introductory-track--Sinhala-Senhali', NULL, 0, 5, '2021-11-22 19:13:52', NULL, NULL),
(616, 4, 9, 63, 1, 'Amharic', 'Arabic introductory track - Amharic', 'مدخل إلى العربية للناطقين بغيرها', NULL, NULL, NULL, 'The book initiates from the learner’s phonological background by dividing Arabic phonemes and the student’s mother tongue phonemes in equal terms regarding phonation, articulation, phonetic relation and non-relation. \r\nThe book guides the learner through objective lessons to master alphabets, read phrases and sentences, and differentiate between masculine and feminine. Besides, expressing ideas and situations attracted the acclaim and recommendation of specialists attended the forum entitled \"References of Teaching Arabic to Non- speakers in the four Continents of the World” held in Indonesia, 2014.', 'يستهل الكتاب بالخلفية الصوتية للدارس وذلك بتقسيم صوتيات اللغة العربية وصوتيات اللغة الأصلية للمتلقي بالتساو، فيما يختص بالصوت وطريقة اخراجه والعلاقات الصوتية و غير الصوتية. كما يرشد الكتاب القارئ خلال دروس تهدف إلى الإلمام بالحروف وقراءة الجمل والتمييز بين التذكير والتأنيث. بجانب التعبير عن الأفكار والحالات التي نالت استحسان وتوصيات المختصين الذين حضروا المنتدى المعروف ب \"مراجع تعليم اللغة العربية للناطقين بغيرها في قارات العالم الأربع\" المنعقد بإندونيسيا في 2014', 'ZHIC', NULL, '05924861738139.pdf', '960524178392728.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/7-arabic-introductory-track/Arabic-intoductory-track-amaharic.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/7-arabic-introductory-track/Arabic-intoductory-track-amaharic-language.pdf', 'FPN38VACS1EY9Z5I2R8H104', '2', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 0, 'Arabic-introductory-track-Amharic', NULL, 0, 5, '2021-11-22 19:15:25', NULL, NULL),
(617, 4, 9, 65, 14, 'Tagalog', 'Arabic introductory track - Tagalog', 'مدخل إلى العربية للناطقين بغيرها', NULL, NULL, NULL, 'The book initiates from the learner’s phonological background by dividing Arabic phonemes and the student’s mother tongue phonemes in equal terms regarding phonation, articulation, phonetic relation and non-relation. \r\nThe book guides the learner through objective lessons to master alphabets, read phrases and sentences, and differentiate between masculine and feminine. Besides, expressing ideas and situations attracted the acclaim and recommendation of specialists attended the forum entitled \"References of Teaching Arabic to Non- speakers in the four Continents of the World” held in Indonesia, 2014.', 'يستهل الكتاب بالخلفية الصوتية للدارس وذلك بتقسيم صوتيات اللغة العربية وصوتيات اللغة الأصلية للمتلقي بالتساو، فيما يختص بالصوت وطريقة اخراجه والعلاقات الصوتية و غير الصوتية. كما يرشد الكتاب القارئ خلال دروس تهدف إلى الإلمام بالحروف وقراءة الجمل والتمييز بين التذكير والتأنيث. بجانب التعبير عن الأفكار والحالات التي نالت استحسان وتوصيات المختصين الذين حضروا المنتدى المعروف ب \"مراجع تعليم اللغة العربية للناطقين بغيرها في قارات العالم الأربع\" المنعقد بإندونيسيا في 2014', 'ZHIC', NULL, '05924861738139.pdf', '960524178392728.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/7-arabic-introductory-track/Arabic-intoductory-track-tagalog-language.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/7-arabic-introductory-track/Arabic-intoductory-track-tagalog-language.pdf', 'FPN38VACS1EY9Z5I2R8H105', '1', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 0, 'Arabic-introductory-track-Tagalog-Tagalog', NULL, 0, 5, '2021-11-22 19:18:30', NULL, NULL),
(619, 4, 9, 3, 10, 'Mandarian', 'Arabic introductory track - Chinese', 'مدخل إلى العربية للناطقين بغيرها', NULL, NULL, NULL, 'The book initiates from the learner’s phonological background by dividing Arabic phonemes and the student’s mother tongue phonemes in equal terms regarding phonation, articulation, phonetic relation and non-relation. \nThe book guides the learner through objective lessons to master alphabets, read phrases and sentences, and differentiate between masculine and feminine. Besides, expressing ideas and situations attracted the acclaim and recommendation of specialists attended the forum entitled \"References of Teaching Arabic to Non- speakers in the four Continents of the World” held in Indonesia, 2014.', 'يستهل الكتاب بالخلفية الصوتية للدارس وذلك بتقسيم صوتيات اللغة العربية وصوتيات اللغة الأصلية للمتلقي بالتساو، فيما يختص بالصوت وطريقة اخراجه والعلاقات الصوتية و غير الصوتية. كما يرشد الكتاب القارئ خلال دروس تهدف إلى الإلمام بالحروف وقراءة الجمل والتمييز بين التذكير والتأنيث. بجانب التعبير عن الأفكار والحالات التي نالت استحسان وتوصيات المختصين الذين حضروا المنتدى المعروف ب \"مراجع تعليم اللغة العربية للناطقين بغيرها في قارات العالم الأربع\" المنعقد بإندونيسيا في 2014', 'ZHIC', NULL, '05924861738139.pdf', '960524178392728.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/7-arabic-introductory-track/Arabic-intoductory-track-chines-language.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/7-arabic-introductory-track/Arabic-intoductory-track-chines-language.pdf', 'FPN38VACS1EY9Z5I2R8H106', '2', '2022-05-26 18:20:09', 'rtl', 1, 1, 0, 0, 'Arabic-introductory-track--Chinese-Mandarian', NULL, 0, 5, '2021-11-22 19:58:17', NULL, NULL),
(620, 4, 10, 8, 2, 'Arabic', 'Islamic Culture Track - Elementary', 'تعليم العربية للناطقين بغيرها – مسار الثقافة الإسلامية\nمرحلة تأسيسية\n', NULL, NULL, NULL, 'The book focuses on Islamic Culture relevant to learning a number of inner linguistics and usages. In addition to skills pertinent to listening, speaking, reading and writing, while establishing global Islamic culture through situations to enable the learner to express, describe and use Arabic in real situations tallying purpose and motives. The book also comprises three educational levels: elementary, intermediate and advance.', 'يركز الكتاب على الثقافة الإسلامية ذات العلاقة بتعلم بعض مداخل اللغة و استخدامها. بجانب مهارات الاستماع و التحدث و القراءة و الكتابة؛ مع ترسيخ ثقافة إسلامية جامعة من خلال حالات تمكن الدارس من التعبير و الوصف و استخدام اللغة العربية في الحالات الحقيقية توفي بالغرض و الدافع. يشتمل الكتاب على ثلاثة مستويات: مبتدئ، متوسط، و متقدم', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/3-islamic-culture-track/level-1.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/3-islamic-culture-track/level-1.pdf', '9Y420A4754OP7AZ23XFT101', '2', NULL, 'ltr', 1, 1, 0, 0, 'Islamic-Culture-Track--Elementary-Arabic', NULL, 0, 5, '2021-11-22 20:15:42', NULL, NULL),
(621, 4, 10, 8, 2, 'Arabic', 'Islamic Culture Track - Intermediate', 'تعليم العربية للناطقين بغيرها – مسار الثقافة الإسلامية\nمرحلة متوسطة\n', NULL, NULL, NULL, 'The book focuses on Islamic Culture relevant to learning a number of inner linguistics and usages. In addition to skills pertinent to listening, speaking, reading and writing, while establishing global Islamic culture through situations to enable the learner to express, describe and use Arabic in real situations tallying purpose and motives. The book also comprises three educational levels: elementary, intermediate and advance.', 'يركز الكتاب على الثقافة الإسلامية ذات العلاقة بتعلم بعض مداخل اللغة و استخدامها. بجانب مهارات الاستماع و التحدث و القراءة و الكتابة؛ مع ترسيخ ثقافة إسلامية جامعة من خلال حالات تمكن الدارس من التعبير و الوصف و استخدام اللغة العربية في الحالات الحقيقية توفي بالغرض و الدافع. يشتمل الكتاب على ثلاثة مستويات: مبتدئ، متوسط، و متقدم', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/3-islamic-culture-track/level-2.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/3-islamic-culture-track/level-2.pdf', '9Y420A4754OP7AZ23XFT102', '3', NULL, 'ltr', 1, 1, 0, 0, 'Islamic-Culture-Track--Intermediate-Arabic', NULL, 0, 5, '2021-11-22 20:16:38', NULL, NULL),
(622, 4, 10, 8, 2, 'Arabic', 'Islamic Culture Track - Advance', 'تعليم العربية للناطقين بغيرها – مسار الثقافة الإسلامية\nمرحلة متقدمة\n', NULL, NULL, NULL, 'The book focuses on Islamic Culture relevant to learning a number of inner linguistics and usages. In addition to skills pertinent to listening, speaking, reading and writing, while establishing global Islamic culture through situations to enable the learner to express, describe and use Arabic in real situations tallying purpose and motives. The book also comprises three educational levels: elementary, intermediate and advance.', 'يركز الكتاب على الثقافة الإسلامية ذات العلاقة بتعلم بعض مداخل اللغة و استخدامها. بجانب مهارات الاستماع و التحدث و القراءة و الكتابة؛ مع ترسيخ ثقافة إسلامية جامعة من خلال حالات تمكن الدارس من التعبير و الوصف و استخدام اللغة العربية في الحالات الحقيقية توفي بالغرض و الدافع. يشتمل الكتاب على ثلاثة مستويات: مبتدئ، متوسط، و متقدم', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Reading/3-islamic-culture-track/level-3.pdf', 'http://localhost/zhic/public/Locker/Arabic-Learning-Books/Uploading/Watermark/3-islamic-culture-track/level-3.pdf', '9Y420A4754OP7AZ23XFT103', '0', NULL, 'ltr', 1, 1, 0, 0, 'Islamic-Culture-Track-Advance-Arabic', NULL, 0, 5, '2021-11-22 20:17:39', NULL, NULL);
INSERT INTO `ebook` (`file_id`, `category_id`, `sub_cat_id`, `third_cat_id`, `language_id`, `languages`, `file_name`, `file_name_ar`, `file_isbn`, `file_author`, `file_author_ar`, `file_note`, `file_note_ar`, `ebook_publisher`, `publishing_date`, `file_attachment`, `p_r_ebook`, `ebook_link`, `ebook_download_link`, `unique_id`, `no_view`, `view_duration`, `direction`, `downloadable`, `printable`, `searchable`, `featured`, `ebook_slug`, `ebook_audio`, `book_type`, `avg_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(623, 5, 12, 18, 12, 'Russian', 'Help', 'خذ بيدي', '9789948236733-9-3', 'Aysha Alzaabi', 'عايشة سعيد الزعابي', 'This story is about Raed, the outstanding student, who lost his father and becomes the breadwinner of the family. He goes to school in the morning and continues work until night. His studies failure is caused by vicissitudes of life, yet his brilliant colleague Rashid provides help to him and his family; so that he can focus on his studies and resume his heydays to become the top of the class along with Rashid – his close friend. Truly, ‘Best friends, are the siblings that Allah did not give us’.', 'تدور أحداث قصة \" خذ بيدي \" حول شخصية الطالب المتفوق رائد، الذي فقد أباه، وأصبح هو المعيل لأسرته، يدرس في الصباح، ويكد حتى آخر الليل، دفعت هذه الظروف رائد إلى الرسوب، لكن بأحداث كتبها الله تعالى أخذ زميله المتوفق راشد بيده، وتابع ظروفه، وبدون علم رائد تكفل والد راشد بكل ما تحتاجه أسرة رائد ليتفرغ إلى دراسته ويعيد بناء مجده، وفعلًا استعاد لياقته الدراسية وحصل على الترتيب الأول؛ هو وزميله راشد، فهذه الصداقة التي تبقى، وتبقى معها مقولة: \" رب أخ لك لم تلده أمك\".', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-russain-short-stories/Help-Russian.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-russain-short-stories/Help-Russian.pdf', '1E56F19FJP1LEQ80VN9B101', '2', NULL, 'ltr', 1, 1, 0, 0, 'Help-Russian', NULL, 0, 5, '2021-11-24 16:24:15', NULL, NULL),
(624, 5, 12, 21, 14, 'Tagalog', 'Help', 'خذ بيدي', '9789948236733-9-4', 'Aysha Alzaabi', 'عايشة سعيد الزعابي', 'This story is about Raed, the outstanding student, who lost his father and becomes the breadwinner of the family. He goes to school in the morning and continues work until night. His studies failure is caused by vicissitudes of life, yet his brilliant colleague Rashid provides help to him and his family; so that he can focus on his studies and resume his heydays to become the top of the class along with Rashid – his close friend. Truly, ‘Best friends, are the siblings that Allah did not give us’.', 'تدور أحداث قصة \" خذ بيدي \" حول شخصية الطالب المتفوق رائد، الذي فقد أباه، وأصبح هو المعيل لأسرته، يدرس في الصباح، ويكد حتى آخر الليل، دفعت هذه الظروف رائد إلى الرسوب، لكن بأحداث كتبها الله تعالى أخذ زميله المتوفق راشد بيده، وتابع ظروفه، وبدون علم رائد تكفل والد راشد بكل ما تحتاجه أسرة رائد ليتفرغ إلى دراسته ويعيد بناء مجده، وفعلًا استعاد لياقته الدراسية وحصل على الترتيب الأول؛ هو وزميله راشد، فهذه الصداقة التي تبقى، وتبقى معها مقولة: \" رب أخ لك لم تلده أمك\".', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-tagalog-short-stories/Help-Tagalog.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-tagalog-short-stories/Help-Tagalog.pdf', '1E56F19FJP1LEQ80VN9B102', '2', NULL, 'ltr', 1, 1, 0, 0, 'Help-Tagalog', NULL, 0, 5, '2021-11-24 16:38:47', NULL, NULL),
(625, 5, 12, 15, 11, 'Senhali', 'Help', 'خذ بيدي', '9789948236733-9-5', 'Aysha Alzaabi', 'عايشة سعيد الزعابي', 'This story is about Raed, the outstanding student, who lost his father and becomes the breadwinner of the family. He goes to school in the morning and continues work until night. His studies failure is caused by vicissitudes of life, yet his brilliant colleague Rashid provides help to him and his family; so that he can focus on his studies and resume his heydays to become the top of the class along with Rashid – his close friend. Truly, ‘Best friends, are the siblings that Allah did not give us’.', 'تدور أحداث قصة \" خذ بيدي \" حول شخصية الطالب المتفوق رائد، الذي فقد أباه، وأصبح هو المعيل لأسرته، يدرس في الصباح، ويكد حتى آخر الليل، دفعت هذه الظروف رائد إلى الرسوب، لكن بأحداث كتبها الله تعالى أخذ زميله المتوفق راشد بيده، وتابع ظروفه، وبدون علم رائد تكفل والد راشد بكل ما تحتاجه أسرة رائد ليتفرغ إلى دراسته ويعيد بناء مجده، وفعلًا استعاد لياقته الدراسية وحصل على الترتيب الأول؛ هو وزميله راشد، فهذه الصداقة التي تبقى، وتبقى معها مقولة: \" رب أخ لك لم تلده أمك\".', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-senhali-short-stories/Help-Sinhala.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-senhali-short-stories/Help-Sinhala.pdf', '1E56F19FJP1LEQ80VN9B103', '2', NULL, 'ltr', 1, 1, 0, 0, 'Help-Senhali', NULL, 0, 5, '2021-11-24 16:43:35', NULL, NULL),
(626, 5, 14, 20, 13, 'Oromo', 'Help', 'خذ بيدي', '9789948236733-9-6', 'Aysha Alzaabi', 'عايشة سعيد الزعابي', 'This story is about Raed, the outstanding student, who lost his father and becomes the breadwinner of the family. He goes to school in the morning and continues work until night. His studies failure is caused by vicissitudes of life, yet his brilliant colleague Rashid provides help to him and his family; so that he can focus on his studies and resume his heydays to become the top of the class along with Rashid – his close friend. Truly, ‘Best friends, are the siblings that Allah did not give us’.', 'تدور أحداث قصة \" خذ بيدي \" حول شخصية الطالب المتفوق رائد، الذي فقد أباه، وأصبح هو المعيل لأسرته، يدرس في الصباح، ويكد حتى آخر الليل، دفعت هذه الظروف رائد إلى الرسوب، لكن بأحداث كتبها الله تعالى أخذ زميله المتوفق راشد بيده، وتابع ظروفه، وبدون علم رائد تكفل والد راشد بكل ما تحتاجه أسرة رائد ليتفرغ إلى دراسته ويعيد بناء مجده، وفعلًا استعاد لياقته الدراسية وحصل على الترتيب الأول؛ هو وزميله راشد، فهذه الصداقة التي تبقى، وتبقى معها مقولة: \" رب أخ لك لم تلده أمك\".', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-oromo-short-stories/Help-Oromo.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-oromo-amharic-short-stories/Help-Oromo.pdf', '1E56F19FJP1LEQ80VN9B104', '2', NULL, 'ltr', 1, 1, 0, 0, 'Help-Oromo', NULL, 0, 5, '2021-11-24 16:45:43', NULL, NULL),
(627, 5, 14, 19, 1, 'Amharic', 'Help', 'خذ بيدي', '9789948236733-9-7', 'Aysha Alzaabi', 'عايشة سعيد الزعابي', 'This story is about Raed, the outstanding student, who lost his father and becomes the breadwinner of the family. He goes to school in the morning and continues work until night. His studies failure is caused by vicissitudes of life, yet his brilliant colleague Rashid provides help to him and his family; so that he can focus on his studies and resume his heydays to become the top of the class along with Rashid – his close friend. Truly, ‘Best friends, are the siblings that Allah did not give us’.', 'تدور أحداث قصة \" خذ بيدي \" حول شخصية الطالب المتفوق رائد، الذي فقد أباه، وأصبح هو المعيل لأسرته، يدرس في الصباح، ويكد حتى آخر الليل، دفعت هذه الظروف رائد إلى الرسوب، لكن بأحداث كتبها الله تعالى أخذ زميله المتوفق راشد بيده، وتابع ظروفه، وبدون علم رائد تكفل والد راشد بكل ما تحتاجه أسرة رائد ليتفرغ إلى دراسته ويعيد بناء مجده، وفعلًا استعاد لياقته الدراسية وحصل على الترتيب الأول؛ هو وزميله راشد، فهذه الصداقة التي تبقى، وتبقى معها مقولة: \" رب أخ لك لم تلده أمك\".', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-ethiopian-ahmharic-short-stories/Help-Amharic.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-ethiopian-ahmharic-short-stories/Help-Amharic.pdf', '1E56F19FJP1LEQ80VN9B105', '3', NULL, 'ltr', 1, 1, 0, 0, 'Help-Amharic', NULL, 0, 5, '2021-11-24 16:47:58', NULL, NULL),
(628, 5, 12, 18, 12, 'Russian', 'Say Polite Words', 'قل كلاماً طيباً ', '9789948236719-4', 'Hechim Damerji', 'هشام دمرجي', 'This story revolves around Ahmed, who always passes by an abandoned house. It happens that he throws a ball one day, to discover the echo of the act. When Ahmed shouts, the shouting replicates from inside to fill him with anger to swear; only to have the same sound goes back to him. He tells his teacher about the matter. The teacher says, ‘say nice words this time, and tell me what will happen’. He follows the advice and hears back good words. The teacher responds, ‘what goes around comes around’.', 'تدور أحداث قصة \" قل كلامًا طيبًا \" حول أحمدالذي يمر في طريقه من وإلى المدرسة ببيت مهجور، وفي يوم ما رمى أحمد كورته على جدار البيت وإذا به يسمع طفلًا يلعب بالكرة في البيت، صاح أحمد وإذا بالصياح نفسه في البيت، بدأ أحمد يشتاط غضبًا وقام بكيل عبارات السب والشتائم، وإذا بالمقابل كيل بالمثل في البيت، وهكذا تطورت أحداث القصة حتى أخبر أحمد أستاذه مصطفى بما حدث له، فيقول له الأستاذ: قل كلًامًا طيبا، وأخبرني بما سيحدث، وفعلًا طبق أحمد نصيحة أستاذه ليتفاجأ بسماعه لكلام طيب كالذي يقول، وهنا قال له الأستاذ: معاملة الغير لك هي صدى معاملتك، قل كلامًا طيبًا ليقابلك الآخرون بمثل الذي تقول.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-russain-short-stories/Say-Polite-Words-Russian.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-russain-short-stories/Say-Polite-Words-Russian.pdf', 'FHE3IP44YWEN0JKZB513101', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Say-Polite-Words-Russian', NULL, 0, 5, '2021-11-24 16:53:23', NULL, NULL),
(629, 5, 12, 21, 14, 'Tagalog', 'Say Polite Words', 'قل كلاماً طيباً ', '9789948236719-5', 'Hechim Damerji', 'هشام دمرجي', 'This story revolves around Ahmed, who always passes by an abandoned house. It happens that he throws a ball one day, to discover the echo of the act. When Ahmed shouts, the shouting replicates from inside to fill him with anger to swear; only to have the same sound goes back to him. He tells his teacher about the matter. The teacher says, ‘say nice words this time, and tell me what will happen’. He follows the advice and hears back good words. The teacher responds, ‘what goes around comes around’.', 'تدور أحداث قصة \" قل كلامًا طيبًا \" حول أحمدالذي يمر في طريقه من وإلى المدرسة ببيت مهجور، وفي يوم ما رمى أحمد كورته على جدار البيت وإذا به يسمع طفلًا يلعب بالكرة في البيت، صاح أحمد وإذا بالصياح نفسه في البيت، بدأ أحمد يشتاط غضبًا وقام بكيل عبارات السب والشتائم، وإذا بالمقابل كيل بالمثل في البيت، وهكذا تطورت أحداث القصة حتى أخبر أحمد أستاذه مصطفى بما حدث له، فيقول له الأستاذ: قل كلًامًا طيبا، وأخبرني بما سيحدث، وفعلًا طبق أحمد نصيحة أستاذه ليتفاجأ بسماعه لكلام طيب كالذي يقول، وهنا قال له الأستاذ: معاملة الغير لك هي صدى معاملتك، قل كلامًا طيبًا ليقابلك الآخرون بمثل الذي تقول.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-tagalog-short-stories/Say-Polite-Words-Tagalog.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-tagalog-short-stories/Say-Polite-Words-Tagalog.pdf', 'FHE3IP44YWEN0JKZB513102', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Say-Polite-Words-Tagalog', NULL, 0, 5, '2021-11-24 16:56:50', NULL, NULL),
(630, 5, 12, 15, 11, 'Senhali', 'Say Polite Words', 'قل كلاماً طيباً ', '9789948236719-6', 'Hechim Damerji', 'هشام دمرجي', 'This story revolves around Ahmed, who always passes by an abandoned house. It happens that he throws a ball one day, to discover the echo of the act. When Ahmed shouts, the shouting replicates from inside to fill him with anger to swear; only to have the same sound goes back to him. He tells his teacher about the matter. The teacher says, ‘say nice words this time, and tell me what will happen’. He follows the advice and hears back good words. The teacher responds, ‘what goes around comes around’.', 'تدور أحداث قصة \" قل كلامًا طيبًا \" حول أحمدالذي يمر في طريقه من وإلى المدرسة ببيت مهجور، وفي يوم ما رمى أحمد كورته على جدار البيت وإذا به يسمع طفلًا يلعب بالكرة في البيت، صاح أحمد وإذا بالصياح نفسه في البيت، بدأ أحمد يشتاط غضبًا وقام بكيل عبارات السب والشتائم، وإذا بالمقابل كيل بالمثل في البيت، وهكذا تطورت أحداث القصة حتى أخبر أحمد أستاذه مصطفى بما حدث له، فيقول له الأستاذ: قل كلًامًا طيبا، وأخبرني بما سيحدث، وفعلًا طبق أحمد نصيحة أستاذه ليتفاجأ بسماعه لكلام طيب كالذي يقول، وهنا قال له الأستاذ: معاملة الغير لك هي صدى معاملتك، قل كلامًا طيبًا ليقابلك الآخرون بمثل الذي تقول.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-senhali-short-stories/Say-Polite-Words-Sinhala.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-senhali-short-stories/Say-Polite-Words-Sinhala.pdf', 'FHE3IP44YWEN0JKZB513103', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Say-Polite-Words-Senhali', NULL, 0, 5, '2021-11-24 16:59:37', NULL, NULL),
(631, 5, 14, 20, 13, 'Oromo', 'Say Polite Words', 'قل كلاماً طيباً ', '9789948236719-7', 'Hechim Damerji', 'هشام دمرجي', 'This story revolves around Ahmed, who always passes by an abandoned house. It happens that he throws a ball one day, to discover the echo of the act. When Ahmed shouts, the shouting replicates from inside to fill him with anger to swear; only to have the same sound goes back to him. He tells his teacher about the matter. The teacher says, ‘say nice words this time, and tell me what will happen’. He follows the advice and hears back good words. The teacher responds, ‘what goes around comes around’.', 'تدور أحداث قصة \" قل كلامًا طيبًا \" حول أحمدالذي يمر في طريقه من وإلى المدرسة ببيت مهجور، وفي يوم ما رمى أحمد كورته على جدار البيت وإذا به يسمع طفلًا يلعب بالكرة في البيت، صاح أحمد وإذا بالصياح نفسه في البيت، بدأ أحمد يشتاط غضبًا وقام بكيل عبارات السب والشتائم، وإذا بالمقابل كيل بالمثل في البيت، وهكذا تطورت أحداث القصة حتى أخبر أحمد أستاذه مصطفى بما حدث له، فيقول له الأستاذ: قل كلًامًا طيبا، وأخبرني بما سيحدث، وفعلًا طبق أحمد نصيحة أستاذه ليتفاجأ بسماعه لكلام طيب كالذي يقول، وهنا قال له الأستاذ: معاملة الغير لك هي صدى معاملتك، قل كلامًا طيبًا ليقابلك الآخرون بمثل الذي تقول.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-oromo-short-stories/Say-Polite-Words-Oromo.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-oromo-amharic-short-stories/Say-Polite-Words-Oromo.pdf', 'FHE3IP44YWEN0JKZB513104', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Say-Polite-Words-Oromo', NULL, 0, 5, '2021-11-24 17:01:42', NULL, NULL),
(632, 5, 14, 19, 1, 'Amharic', 'Say Polite Words', 'قل كلاماً طيباً ', '9789948236719-8', 'Hechim Damerji', 'هشام دمرجي', 'This story revolves around Ahmed, who always passes by an abandoned house. It happens that he throws a ball one day, to discover the echo of the act. When Ahmed shouts, the shouting replicates from inside to fill him with anger to swear; only to have the same sound goes back to him. He tells his teacher about the matter. The teacher says, ‘say nice words this time, and tell me what will happen’. He follows the advice and hears back good words. The teacher responds, ‘what goes around comes around’.', 'تدور أحداث قصة \" قل كلامًا طيبًا \" حول أحمدالذي يمر في طريقه من وإلى المدرسة ببيت مهجور، وفي يوم ما رمى أحمد كورته على جدار البيت وإذا به يسمع طفلًا يلعب بالكرة في البيت، صاح أحمد وإذا بالصياح نفسه في البيت، بدأ أحمد يشتاط غضبًا وقام بكيل عبارات السب والشتائم، وإذا بالمقابل كيل بالمثل في البيت، وهكذا تطورت أحداث القصة حتى أخبر أحمد أستاذه مصطفى بما حدث له، فيقول له الأستاذ: قل كلًامًا طيبا، وأخبرني بما سيحدث، وفعلًا طبق أحمد نصيحة أستاذه ليتفاجأ بسماعه لكلام طيب كالذي يقول، وهنا قال له الأستاذ: معاملة الغير لك هي صدى معاملتك، قل كلامًا طيبًا ليقابلك الآخرون بمثل الذي تقول.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-ethiopian-ahmharic-short-stories/Say-Polite-Words-Amharic.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-ethiopian-ahmharic-short-stories/Say-Polite-Words-Amharic.pdf', 'FHE3IP44YWEN0JKZB513105', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Say-Polite-Words-Amharic', NULL, 0, 5, '2021-11-24 17:03:28', NULL, NULL),
(633, 5, 12, 18, 12, 'Russian', 'Starting from Dawn Prayer', 'بدءًا من صلاة الفر', '978-9948-23-672-6-4', 'Noura Itani', 'نورة عبدالغني عيتاني', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'تدور أحداث قصة \" بدءًا من صلاة الفجر \" حول شخصية راشد الذي ضيع صلاة الفجر، وبدأ معها يومه بأحداث مربكة، حتى التقى بعبد الرحمن؛ عامل البقالة الفقير، والذي افتقده لصلاة الفجر، ثم تتابع الأحداث بذهاب راشد إلى عمله وعبدالرحمن إلى بقالته، وصولًا إلى ما أكرم الله تعالى به عبدالرحمن من تبني راشد لكل ما تحتاجه عائلة عبدالرحمن، بل وتكفل بأن يكمل عبدالرحمن دراسته على نفقته؛ كل ذلك لأن عبدالرحمن ابتدأ يومه بصلاة الفجر في جماعه، فكان في `ذمة الله ورعايته وسخر له من يعينه.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-russain-short-stories/Starting-from-Dawn-Prayer-Russian.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-russain-short-stories/Starting-from-Dawn-Prayer-Russian.pdf', 'E9F455093SH6R849DO21101', '6', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Starting-from-Dawn-Prayer-Russian', NULL, 0, 5, '2021-11-24 20:17:30', NULL, NULL),
(634, 5, 12, 21, 14, 'Tagalog', 'Starting from Dawn Prayer', 'بدءًا من صلاة الفر', '978-9948-23-672-6-5', 'Noura Itani', 'نورة عبدالغني عيتاني', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'تدور أحداث قصة \" بدءًا من صلاة الفجر \" حول شخصية راشد الذي ضيع صلاة الفجر، وبدأ معها يومه بأحداث مربكة، حتى التقى بعبد الرحمن؛ عامل البقالة الفقير، والذي افتقده لصلاة الفجر، ثم تتابع الأحداث بذهاب راشد إلى عمله وعبدالرحمن إلى بقالته، وصولًا إلى ما أكرم الله تعالى به عبدالرحمن من تبني راشد لكل ما تحتاجه عائلة عبدالرحمن، بل وتكفل بأن يكمل عبدالرحمن دراسته على نفقته؛ كل ذلك لأن عبدالرحمن ابتدأ يومه بصلاة الفجر في جماعه، فكان في `ذمة الله ورعايته وسخر له من يعينه.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-tagalog-short-stories/Starting-from-Dawn-Prayer-Tagalog.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-tagalog-short-stories/Starting-from-Dawn-Prayer-Tagalog.pdf', 'E9F455093SH6R849DO21102', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Starting-from-Dawn-Prayer-Tagalog', NULL, 0, 5, '2021-11-24 20:20:30', NULL, NULL),
(635, 5, 12, 15, 11, 'Senhali', 'Starting from Dawn Prayer', 'بدءًا من صلاة الفر', '978-9948-23-672-6-6', 'Noura Itani', 'نورة عبدالغني عيتاني', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'تدور أحداث قصة \" بدءًا من صلاة الفجر \" حول شخصية راشد الذي ضيع صلاة الفجر، وبدأ معها يومه بأحداث مربكة، حتى التقى بعبد الرحمن؛ عامل البقالة الفقير، والذي افتقده لصلاة الفجر، ثم تتابع الأحداث بذهاب راشد إلى عمله وعبدالرحمن إلى بقالته، وصولًا إلى ما أكرم الله تعالى به عبدالرحمن من تبني راشد لكل ما تحتاجه عائلة عبدالرحمن، بل وتكفل بأن يكمل عبدالرحمن دراسته على نفقته؛ كل ذلك لأن عبدالرحمن ابتدأ يومه بصلاة الفجر في جماعه، فكان في `ذمة الله ورعايته وسخر له من يعينه.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-senhali-short-stories/Starting-from-Dawn-Prayer-Sinhala.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-senhali-short-stories/Starting-from-Dawn-Prayer-Sinhala.pdf', 'E9F455093SH6R849DO21103', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Starting-from-Dawn-Prayer-Senhali', NULL, 0, 5, '2021-11-24 20:22:02', NULL, NULL),
(636, 5, 14, 20, 13, 'Oromo', 'Starting from Dawn Prayer', 'بدءًا من صلاة الفر', '978-9948-23-672-6-7', 'Noura Itani', 'نورة عبدالغني عيتاني', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'تدور أحداث قصة \" بدءًا من صلاة الفجر \" حول شخصية راشد الذي ضيع صلاة الفجر، وبدأ معها يومه بأحداث مربكة، حتى التقى بعبد الرحمن؛ عامل البقالة الفقير، والذي افتقده لصلاة الفجر، ثم تتابع الأحداث بذهاب راشد إلى عمله وعبدالرحمن إلى بقالته، وصولًا إلى ما أكرم الله تعالى به عبدالرحمن من تبني راشد لكل ما تحتاجه عائلة عبدالرحمن، بل وتكفل بأن يكمل عبدالرحمن دراسته على نفقته؛ كل ذلك لأن عبدالرحمن ابتدأ يومه بصلاة الفجر في جماعه، فكان في `ذمة الله ورعايته وسخر له من يعينه.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-oromo-short-stories/Starting-from-Dawn-Prayer-Oromo.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-oromo-amharic-short-stories/Starting-from-Dawn-Prayer-Oromo.pdf', 'E9F455093SH6R849DO21104', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Starting-from-Dawn-Prayer-Oromo', NULL, 0, 5, '2021-11-24 20:24:07', NULL, NULL),
(637, 5, 14, 19, 1, 'Amharic', 'Starting from Dawn Prayer', 'بدءًا من صلاة الفر', '978-9948-23-672-6-8', 'Noura Itani', 'نورة عبدالغني عيتاني', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', 'تدور أحداث قصة \" بدءًا من صلاة الفجر \" حول شخصية راشد الذي ضيع صلاة الفجر، وبدأ معها يومه بأحداث مربكة، حتى التقى بعبد الرحمن؛ عامل البقالة الفقير، والذي افتقده لصلاة الفجر، ثم تتابع الأحداث بذهاب راشد إلى عمله وعبدالرحمن إلى بقالته، وصولًا إلى ما أكرم الله تعالى به عبدالرحمن من تبني راشد لكل ما تحتاجه عائلة عبدالرحمن، بل وتكفل بأن يكمل عبدالرحمن دراسته على نفقته؛ كل ذلك لأن عبدالرحمن ابتدأ يومه بصلاة الفجر في جماعه، فكان في `ذمة الله ورعايته وسخر له من يعينه.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-ethiopian-ahmharic-short-stories/Starting-from-Dawn-Prayer-Amharic.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-ethiopian-ahmharic-short-stories/Starting-from-Dawn-Prayer-Amharic.pdf', 'E9F455093SH6R849DO21105', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Starting-from-Dawn-Prayer-Amharic', NULL, 0, 5, '2021-11-24 20:24:58', NULL, NULL),
(638, 5, 12, 18, 12, 'Russian', 'The Secret of The Parcel', 'سر الصر', '978-9948-23-660-3-4', 'Fatima Al Ameri', 'فاطمة العامري', 'The central character of the story is Salim, who is embarrassed to sit near a student of a different faith. However, he does not disclose the matter except to his grandfather who gives him a parcel that he should not open before two weeks. Salim agrees, but detects bad smelling from the parcel which he gives back to his grandfather, who explains to Salim that it is the same odor of what you have against that student and ‘The only way to recover is tolerance’. Thus, the old man teaches his grandson a lesson that he will remember forever.', 'تدور أحداث قصة \" سر الصُرة \" حول شخصية سالم الذي تضايق من جلوسه بجانب طالب من غير ديانته؛ ولم يفصح بذلك إلا إلى جده الذي أعطاه صرة واشترط عليه أن يحملها لمدة أسبوعين أين ما كان، وألا يفتحها، وافق سالم؛ لكن تفاجأ بعد أيام بخروج رائحة كريهة من الصرة مما جعله لا يطيقها ورجع إلى جده بها الذي قال له: هذا الرائحة هي رائحة ما تكنة تجاه ذلك الطالب، وشفاء ذلك هو التسامح الذي سيزيل تلك الرائحة، وبهذا علم الجد حفيدة قيمة يحملها معه أبد الدهر', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-russain-short-stories/The-Secret-of-The-Parcel-Russian.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-russain-short-stories/The-Secret-of-The-Parcel-Russian.pdf', 'GZEQT91JN9SXO3E7I981101', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-Secret-of-The-Parcel-Russian', NULL, 0, 5, '2021-11-24 20:27:03', NULL, NULL),
(639, 5, 12, 21, 14, 'Tagalog', 'The Secret of The Parcel', 'سر الصر', '978-9948-23-660-3-5', 'Fatima Al Ameri', 'فاطمة العامري', 'The central character of the story is Salim, who is embarrassed to sit near a student of a different faith. However, he does not disclose the matter except to his grandfather who gives him a parcel that he should not open before two weeks. Salim agrees, but detects bad smelling from the parcel which he gives back to his grandfather, who explains to Salim that it is the same odor of what you have against that student and ‘The only way to recover is tolerance’. Thus, the old man teaches his grandson a lesson that he will remember forever.', 'تدور أحداث قصة \" سر الصُرة \" حول شخصية سالم الذي تضايق من جلوسه بجانب طالب من غير ديانته؛ ولم يفصح بذلك إلا إلى جده الذي أعطاه صرة واشترط عليه أن يحملها لمدة أسبوعين أين ما كان، وألا يفتحها، وافق سالم؛ لكن تفاجأ بعد أيام بخروج رائحة كريهة من الصرة مما جعله لا يطيقها ورجع إلى جده بها الذي قال له: هذا الرائحة هي رائحة ما تكنة تجاه ذلك الطالب، وشفاء ذلك هو التسامح الذي سيزيل تلك الرائحة، وبهذا علم الجد حفيدة قيمة يحملها معه أبد الدهر', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-tagalog-short-stories/The-Secret-of-The-Parcel-Tagalog.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-tagalog-short-stories/The-Secret-of-The-Parcel-Tagalog.pdf', 'GZEQT91JN9SXO3E7I981105', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-Secret-of-The-Parcel-Tagalog', NULL, 0, 5, '2021-11-24 20:32:07', NULL, NULL),
(640, 5, 12, 15, 11, 'Senhali', 'The Secret of The Parcel', 'سر الصر', '978-9948-23-660-3-6', 'Fatima Al Ameri', 'فاطمة العامري', 'The central character of the story is Salim, who is embarrassed to sit near a student of a different faith. However, he does not disclose the matter except to his grandfather who gives him a parcel that he should not open before two weeks. Salim agrees, but detects bad smelling from the parcel which he gives back to his grandfather, who explains to Salim that it is the same odor of what you have against that student and ‘The only way to recover is tolerance’. Thus, the old man teaches his grandson a lesson that he will remember forever.', 'تدور أحداث قصة \" سر الصُرة \" حول شخصية سالم الذي تضايق من جلوسه بجانب طالب من غير ديانته؛ ولم يفصح بذلك إلا إلى جده الذي أعطاه صرة واشترط عليه أن يحملها لمدة أسبوعين أين ما كان، وألا يفتحها، وافق سالم؛ لكن تفاجأ بعد أيام بخروج رائحة كريهة من الصرة مما جعله لا يطيقها ورجع إلى جده بها الذي قال له: هذا الرائحة هي رائحة ما تكنة تجاه ذلك الطالب، وشفاء ذلك هو التسامح الذي سيزيل تلك الرائحة، وبهذا علم الجد حفيدة قيمة يحملها معه أبد الدهر', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-senhali-short-stories/The-Secret-of-The-Parcel-Sinhala.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-senhali-short-stories/The-Secret-of-The-Parcel-Sinhala.pdf', 'GZEQT91JN9SXO3E7I981102', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-Secret-of-The-Parcel-Senhali', NULL, 0, 5, '2021-11-24 20:33:12', NULL, NULL),
(641, 5, 14, 20, 13, 'Oromo', 'The Secret of The Parcel', 'سر الصر', '978-9948-23-660-3-7', 'Fatima Al Ameri', 'فاطمة العامري', 'The central character of the story is Salim, who is embarrassed to sit near a student of a different faith. However, he does not disclose the matter except to his grandfather who gives him a parcel that he should not open before two weeks. Salim agrees, but detects bad smelling from the parcel which he gives back to his grandfather, who explains to Salim that it is the same odor of what you have against that student and ‘The only way to recover is tolerance’. Thus, the old man teaches his grandson a lesson that he will remember forever.', 'تدور أحداث قصة \" سر الصُرة \" حول شخصية سالم الذي تضايق من جلوسه بجانب طالب من غير ديانته؛ ولم يفصح بذلك إلا إلى جده الذي أعطاه صرة واشترط عليه أن يحملها لمدة أسبوعين أين ما كان، وألا يفتحها، وافق سالم؛ لكن تفاجأ بعد أيام بخروج رائحة كريهة من الصرة مما جعله لا يطيقها ورجع إلى جده بها الذي قال له: هذا الرائحة هي رائحة ما تكنة تجاه ذلك الطالب، وشفاء ذلك هو التسامح الذي سيزيل تلك الرائحة، وبهذا علم الجد حفيدة قيمة يحملها معه أبد الدهر', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-oromo-short-stories/The-Secret-of-The-Parcel-Oromo.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-oromo-amharic-short-stories/The-Secret-of-The-Parcel-Oromo.pdf', 'GZEQT91JN9SXO3E7I981103', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-Secret-of-The-Parcel-Oromo', NULL, 0, 5, '2021-11-24 20:34:10', NULL, NULL),
(642, 5, 14, 19, 1, 'Amharic', 'The Secret of The Parcel', 'سر الصر', '978-9948-23-660-3-8', 'Fatima Al Ameri', 'فاطمة العامري', 'The central character of the story is Salim, who is embarrassed to sit near a student of a different faith. However, he does not disclose the matter except to his grandfather who gives him a parcel that he should not open before two weeks. Salim agrees, but detects bad smelling from the parcel which he gives back to his grandfather, who explains to Salim that it is the same odor of what you have against that student and ‘The only way to recover is tolerance’. Thus, the old man teaches his grandson a lesson that he will remember forever.', 'تدور أحداث قصة \" سر الصُرة \" حول شخصية سالم الذي تضايق من جلوسه بجانب طالب من غير ديانته؛ ولم يفصح بذلك إلا إلى جده الذي أعطاه صرة واشترط عليه أن يحملها لمدة أسبوعين أين ما كان، وألا يفتحها، وافق سالم؛ لكن تفاجأ بعد أيام بخروج رائحة كريهة من الصرة مما جعله لا يطيقها ورجع إلى جده بها الذي قال له: هذا الرائحة هي رائحة ما تكنة تجاه ذلك الطالب، وشفاء ذلك هو التسامح الذي سيزيل تلك الرائحة، وبهذا علم الجد حفيدة قيمة يحملها معه أبد الدهر', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-ethiopian-ahmharic-short-stories/The-Secret-of-The-Parcel-Amharic.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-ethiopian-ahmharic-short-stories/The-Secret-of-The-Parcel-Amharic.pdf', 'GZEQT91JN9SXO3E7I981104', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-Secret-of-The-Parcel-Amharic', NULL, 0, 5, '2021-11-24 20:35:15', NULL, NULL),
(643, 5, 12, 18, 12, 'Russian', 'The White Mask', 'القناع الأبيض', '978-9948-23-670-2-4', 'Ramy Matrway', 'رامي مطراوي', 'This  story is about a physician called Osama, who lives for some time in Europe and comes back home following the death of his father to get the inheritance, only to be shocked that his father left him nothing but a small box. When he is destined to have had an accident, all the villagers come to help with blood donation, maintaining of car, etc. To his surprise, all of them wear green masks signifying good deeds. The idea originates from a white mask wearing old man who they do not know. Astonished as he is, Osama opens the box to find a message from his father, stating apology for leaving him nothing other than good deeds that will eventually be of benefit to him. Along with the message, is a white mask!', 'تدور أحداث قصة \" القناع الأبيض\" حول  شخصية الطبيب أسامه الذي أمضى حياته في أوروبا، وبعد وفاة والده أتى إلى بلده ليأخذ الميراث، وليتفاجأ بأن والده لم يترك له غير صندوق صغير، وتتوالى الأحداث وهو في امتعاض شديد من هول الصدمة، ثم قدر الله أن يصير له حادث، وقد توافد أهالي قرية والده لنجدته؛ بين متبرع بالدم، وبين من يصلح سيارته، وهو في ذهول شديد، وقد لاحظ أن كل من ساعدوه يرتدون قناعًا أخضرًا، وتتوالى الأحداث حتى يسأل عن سر هذا القناع، وكانت الإجابة بأن كل واحد من القرية نذر نفسه لفعل الخير، وأنهم يرتدون هذا القناع استعدادًا للمساعدة، ثم قيل له بأن أصل هذه الفكرة أتت من شيخ كبير لا يعرفونه كان يرتدي قناعًا أبيضًا، ثم وهو في ذهول شديد قام بفتح الصندوق ليجد رسالة له من أبيه بأنه يعتذر منه بأنه لم يترك له شيئًا غير فعل الخير الذي لابد من أن ينفعه، ومع هذه الرسالة قناعًا أبيضًا.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-russain-short-stories/The-White-Mask-Russian.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-russain-short-stories/The-White-Mask-Russian.pdf', 'E3151J0IQAT8R61967DS101', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-White-Mask-Russian', NULL, 0, 5, '2021-11-24 20:38:20', NULL, NULL),
(644, 5, 12, 21, 14, 'Tagalog', 'The White Mask', 'القناع الأبيض', '978-9948-23-670-2-5', 'Ramy Matrway', 'رامي مطراوي', 'This  story is about a physician called Osama, who lives for some time in Europe and comes back home following the death of his father to get the inheritance, only to be shocked that his father left him nothing but a small box. When he is destined to have had an accident, all the villagers come to help with blood donation, maintaining of car, etc. To his surprise, all of them wear green masks signifying good deeds. The idea originates from a white mask wearing old man who they do not know. Astonished as he is, Osama opens the box to find a message from his father, stating apology for leaving him nothing other than good deeds that will eventually be of benefit to him. Along with the message, is a white mask!', 'تدور أحداث قصة \" القناع الأبيض\" حول  شخصية الطبيب أسامه الذي أمضى حياته في أوروبا، وبعد وفاة والده أتى إلى بلده ليأخذ الميراث، وليتفاجأ بأن والده لم يترك له غير صندوق صغير، وتتوالى الأحداث وهو في امتعاض شديد من هول الصدمة، ثم قدر الله أن يصير له حادث، وقد توافد أهالي قرية والده لنجدته؛ بين متبرع بالدم، وبين من يصلح سيارته، وهو في ذهول شديد، وقد لاحظ أن كل من ساعدوه يرتدون قناعًا أخضرًا، وتتوالى الأحداث حتى يسأل عن سر هذا القناع، وكانت الإجابة بأن كل واحد من القرية نذر نفسه لفعل الخير، وأنهم يرتدون هذا القناع استعدادًا للمساعدة، ثم قيل له بأن أصل هذه الفكرة أتت من شيخ كبير لا يعرفونه كان يرتدي قناعًا أبيضًا، ثم وهو في ذهول شديد قام بفتح الصندوق ليجد رسالة له من أبيه بأنه يعتذر منه بأنه لم يترك له شيئًا غير فعل الخير الذي لابد من أن ينفعه، ومع هذه الرسالة قناعًا أبيضًا.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-tagalog-short-stories/The-White-Mask-Tagalog.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-tagalog-short-stories/The-White-Mask-Tagalog.pdf', 'E3151J0IQAT8R61967DS102', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-White-Mask-Tagalog', NULL, 0, 5, '2021-11-24 20:42:25', NULL, NULL),
(645, 5, 12, 15, 11, 'Senhali', 'The White Mask', 'القناع الأبيض', '978-9948-23-670-6', 'Ramy Matrway', 'رامي مطراوي', 'This  story is about a physician called Osama, who lives for some time in Europe and comes back home following the death of his father to get the inheritance, only to be shocked that his father left him nothing but a small box. When he is destined to have had an accident, all the villagers come to help with blood donation, maintaining of car, etc. To his surprise, all of them wear green masks signifying good deeds. The idea originates from a white mask wearing old man who they do not know. Astonished as he is, Osama opens the box to find a message from his father, stating apology for leaving him nothing other than good deeds that will eventually be of benefit to him. Along with the message, is a white mask!', 'تدور أحداث قصة \" القناع الأبيض\" حول  شخصية الطبيب أسامه الذي أمضى حياته في أوروبا، وبعد وفاة والده أتى إلى بلده ليأخذ الميراث، وليتفاجأ بأن والده لم يترك له غير صندوق صغير، وتتوالى الأحداث وهو في امتعاض شديد من هول الصدمة، ثم قدر الله أن يصير له حادث، وقد توافد أهالي قرية والده لنجدته؛ بين متبرع بالدم، وبين من يصلح سيارته، وهو في ذهول شديد، وقد لاحظ أن كل من ساعدوه يرتدون قناعًا أخضرًا، وتتوالى الأحداث حتى يسأل عن سر هذا القناع، وكانت الإجابة بأن كل واحد من القرية نذر نفسه لفعل الخير، وأنهم يرتدون هذا القناع استعدادًا للمساعدة، ثم قيل له بأن أصل هذه الفكرة أتت من شيخ كبير لا يعرفونه كان يرتدي قناعًا أبيضًا، ثم وهو في ذهول شديد قام بفتح الصندوق ليجد رسالة له من أبيه بأنه يعتذر منه بأنه لم يترك له شيئًا غير فعل الخير الذي لابد من أن ينفعه، ومع هذه الرسالة قناعًا أبيضًا.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-senhali-short-stories/The-White-Mask-Sinhala.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-senhali-short-stories/The-White-Mask-Sinhala.pdf', 'E3151J0IQAT8R61967DS103', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-White-Mask-Senhali', NULL, 0, 5, '2021-11-24 20:43:25', NULL, NULL),
(646, 5, 14, 20, 13, 'Oromo', 'The White Mask', 'القناع الأبيض', '978-9948-23-670-2-7', 'Ramy Matrway', 'رامي مطراوي', 'This  story is about a physician called Osama, who lives for some time in Europe and comes back home following the death of his father to get the inheritance, only to be shocked that his father left him nothing but a small box. When he is destined to have had an accident, all the villagers come to help with blood donation, maintaining of car, etc. To his surprise, all of them wear green masks signifying good deeds. The idea originates from a white mask wearing old man who they do not know. Astonished as he is, Osama opens the box to find a message from his father, stating apology for leaving him nothing other than good deeds that will eventually be of benefit to him. Along with the message, is a white mask!', 'تدور أحداث قصة \" القناع الأبيض\" حول  شخصية الطبيب أسامه الذي أمضى حياته في أوروبا، وبعد وفاة والده أتى إلى بلده ليأخذ الميراث، وليتفاجأ بأن والده لم يترك له غير صندوق صغير، وتتوالى الأحداث وهو في امتعاض شديد من هول الصدمة، ثم قدر الله أن يصير له حادث، وقد توافد أهالي قرية والده لنجدته؛ بين متبرع بالدم، وبين من يصلح سيارته، وهو في ذهول شديد، وقد لاحظ أن كل من ساعدوه يرتدون قناعًا أخضرًا، وتتوالى الأحداث حتى يسأل عن سر هذا القناع، وكانت الإجابة بأن كل واحد من القرية نذر نفسه لفعل الخير، وأنهم يرتدون هذا القناع استعدادًا للمساعدة، ثم قيل له بأن أصل هذه الفكرة أتت من شيخ كبير لا يعرفونه كان يرتدي قناعًا أبيضًا، ثم وهو في ذهول شديد قام بفتح الصندوق ليجد رسالة له من أبيه بأنه يعتذر منه بأنه لم يترك له شيئًا غير فعل الخير الذي لابد من أن ينفعه، ومع هذه الرسالة قناعًا أبيضًا.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-oromo-short-stories/The-White-Mask-Oromo.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-oromo-amharic-short-stories/The-White-Mask-Oromo.pdf', 'E3151J0IQAT8R61967DS104', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-White-Mask-Oromo', NULL, 0, 5, '2021-11-24 20:44:33', NULL, NULL),
(647, 5, 14, 19, 1, 'Amharic', 'The White Mask', 'القناع الأبيض', '978-9948-23-670-2-8', 'Ramy Matrway', 'رامي مطراوي', 'This  story is about a physician called Osama, who lives for some time in Europe and comes back home following the death of his father to get the inheritance, only to be shocked that his father left him nothing but a small box. When he is destined to have had an accident, all the villagers come to help with blood donation, maintaining of car, etc. To his surprise, all of them wear green masks signifying good deeds. The idea originates from a white mask wearing old man who they do not know. Astonished as he is, Osama opens the box to find a message from his father, stating apology for leaving him nothing other than good deeds that will eventually be of benefit to him. Along with the message, is a white mask!', 'تدور أحداث قصة \" القناع الأبيض\" حول  شخصية الطبيب أسامه الذي أمضى حياته في أوروبا، وبعد وفاة والده أتى إلى بلده ليأخذ الميراث، وليتفاجأ بأن والده لم يترك له غير صندوق صغير، وتتوالى الأحداث وهو في امتعاض شديد من هول الصدمة، ثم قدر الله أن يصير له حادث، وقد توافد أهالي قرية والده لنجدته؛ بين متبرع بالدم، وبين من يصلح سيارته، وهو في ذهول شديد، وقد لاحظ أن كل من ساعدوه يرتدون قناعًا أخضرًا، وتتوالى الأحداث حتى يسأل عن سر هذا القناع، وكانت الإجابة بأن كل واحد من القرية نذر نفسه لفعل الخير، وأنهم يرتدون هذا القناع استعدادًا للمساعدة، ثم قيل له بأن أصل هذه الفكرة أتت من شيخ كبير لا يعرفونه كان يرتدي قناعًا أبيضًا، ثم وهو في ذهول شديد قام بفتح الصندوق ليجد رسالة له من أبيه بأنه يعتذر منه بأنه لم يترك له شيئًا غير فعل الخير الذي لابد من أن ينفعه، ومع هذه الرسالة قناعًا أبيضًا.', 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-ethiopian-ahmharic-short-stories/The-White-Mask-Amharic.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-ethiopian-ahmharic-short-stories/The-White-Mask-Amharic.pdf', 'E3151J0IQAT8R61967DS105', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'The-White-Mask-Amharic', NULL, 0, 5, '2021-11-24 20:45:24', NULL, NULL),
(648, 5, 12, 18, 12, 'Russian', 'Where is The Crescent Heading?', 'لى أين يتجه الهلال', '978-9948-23-659-7-4', 'Ahid Alzaerat', 'عاهد عزيرات', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-russain-short-stories/Where-is-The-Crescent-Heading-Russian.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-russain-short-stories/Where-is-The-Crescent-Heading-Russian.pdf', 'DWPT65V3COF09XE4I980101', '5', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Where-is-The-Crescent-Heading-Russian', NULL, 0, 5, '2021-11-24 20:51:04', NULL, NULL),
(649, 5, 12, 21, 14, 'Tagalog', 'Where is The Crescent Heading?', 'لى أين يتجه الهلال', '978-9948-23-659-7-5', 'Ahid Alzaerat', 'عاهد عزيرات', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-tagalog-short-stories/Where-is-The-Crescent-Heading-Tagalog.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-tagalog-short-stories/Where-is-The-Crescent-Heading-Tagalog.pdf', 'DWPT65V3COF09XE4I980102', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Where-is-The-Crescent-Heading-Tagalog', NULL, 0, 5, '2021-11-24 20:55:16', NULL, NULL),
(650, 5, 12, 15, 11, 'Senhali', 'Where is The Crescent Heading?', 'لى أين يتجه الهلال', '978-9948-23-659-7-6', 'Ahid Alzaerat', 'عاهد عزيرات', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-senhali-short-stories/Where-is-The-Crescent-Heading-Sinhala.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-senhali-short-stories/Where-is-The-Crescent-Heading-Sinhala.pdf', 'DWPT65V3COF09XE4I980103', '8', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Where-is-The-Crescent-Heading-Senhali', NULL, 0, 4.66667, '2021-11-24 20:56:19', NULL, NULL),
(651, 5, 14, 20, 13, 'Oromo', 'Where is The Crescent Heading?', 'لى أين يتجه الهلال', '978-9948-23-659-7-7', 'Ahid Alzaerat', 'عاهد عزيرات', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-oromo-short-stories/Where-is-The-Crescent-Heading-Oromo.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-oromo-amharic-short-stories/Where-is-The-Crescent-Heading-Oromo.pdf', 'DWPT65V3COF09XE4I980104', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Where-is-The-Crescent-Heading-Oromo', NULL, 0, 5, '2021-11-24 20:57:19', NULL, NULL),
(652, 5, 14, 19, 1, 'Amharic', 'Where is The Crescent Heading?', 'إلى أين يتجه الهلال', '978-9948-23-659-7-8', 'Ahid Alzaerat', 'عاهد عزيرات', 'The story portrays two paintings for Nael and Sami. Their art teacher selects the paintings, which both show a crescent heading to a different direction. The teacher and other students find it difficult to say which is better, with regard to the direction of the crescent. As argument goes on, the teacher says both painters are right, as the moon has phases; it turns right in the beginning of lunar month and left at its end. Others may share us viewpoint, but in ways different than they seem to us.!', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Kids/EBooks/Reading/6-ethiopian-ahmharic-short-stories/Where-is-The-Crescent-Heading-Amharic.pdf', 'http://localhost/zhic/public/Locker/Kids/EBooks/Watermark/6-ethiopian-ahmharic-short-stories/Where-is-The-Crescent-Heading-Amharic.pdf', 'DWPT65V3COF09XE4I980105', '7', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Where-is-The-Crescent-Heading-Amharic', NULL, 0, 5, '2021-11-24 20:58:20', NULL, NULL),
(653, 6, 16, 43, 5, 'French', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Communal-Tolerance.pdf', 'M802A1I63J74EH30D965101', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Communal-Tolerance-French', NULL, 0, 5, '2021-11-27 00:20:38', NULL, NULL),
(654, 6, 16, 43, 5, 'French', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Cultural-Diversity.pdf', 'M802A1I63J74EH30D965102', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-French', NULL, 0, 5, '2021-11-27 00:21:00', NULL, NULL),
(655, 6, 16, 43, 5, 'French', 'UAE A Tolerant and Close knit Community', 'UAE A Tolerant and Close knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/French/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'M802A1I63J74EH30D965103', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'UAE-A-Tolerant-and-Close-knit-Community-French', NULL, 0, 5, '2021-11-27 00:21:22', NULL, NULL),
(656, 6, 16, 43, 5, 'French', 'Cognitive security is vital for tolerance', 'Cognitive security is vital for tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Cognitive-security-is-vital-for-tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Cognitive-security-is-vital-for-tolerance.pdf', 'M802A1I63J74EH30D965104', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cognitive-security-is-vital-for-tolerance-French', NULL, 0, 5, '2021-11-27 00:21:55', NULL, NULL),
(657, 6, 16, 43, 5, 'French', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Aspiration-in-the-possibility-approach.pdf', 'M802A1I63J74EH30D965105', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Aspiration-in-the-possibility-approach-French', NULL, 0, 5, '2021-11-27 00:22:32', NULL, NULL);
INSERT INTO `ebook` (`file_id`, `category_id`, `sub_cat_id`, `third_cat_id`, `language_id`, `languages`, `file_name`, `file_name_ar`, `file_isbn`, `file_author`, `file_author_ar`, `file_note`, `file_note_ar`, `ebook_publisher`, `publishing_date`, `file_attachment`, `p_r_ebook`, `ebook_link`, `ebook_download_link`, `unique_id`, `no_view`, `view_duration`, `direction`, `downloadable`, `printable`, `searchable`, `featured`, `ebook_slug`, `ebook_audio`, `book_type`, `avg_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(658, 6, 16, 43, 5, 'French', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Distance-learning-An-authentic-system.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Distance-learning-An-authentic-system.pdf', 'M802A1I63J74EH30D965106', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Distance-learning-An-authentic-system-French', NULL, 0, 5, '2021-11-27 00:22:48', NULL, NULL),
(659, 6, 16, 43, 5, 'French', 'Multiculturalism', 'Multiculturalism', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Multiculturalism.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Multiculturalism.pdf', 'M802A1I63J74EH30D965107', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Multiculturalism-French', NULL, 0, 5, '2021-11-27 00:23:06', NULL, NULL),
(660, 6, 16, 43, 5, 'French', 'International Tolerance', 'International Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/International-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/French/International-Tolerance.pdf', 'M802A1I63J74EH30D965108', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'International-Tolerance-French', NULL, 0, 5, '2021-11-27 00:23:31', NULL, NULL),
(661, 6, 16, 43, 5, 'French', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Ramadan-and-Human-Building.pdf', 'M802A1I63J74EH30D965109', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Ramadan-and-Human-Building-French', NULL, 0, 5, '2021-11-27 00:24:32', NULL, NULL),
(662, 6, 16, 43, 5, 'French', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Sustainable-Tolerance.pdf', 'M802A1I63J74EH30D965110', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Sustainable-Tolerance-French', NULL, 0, 5, '2021-11-27 00:25:02', NULL, NULL),
(663, 6, 16, 43, 5, 'French', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into French', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/French/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/French/Tolerance-and-Social-Cohesion.pdf', 'M802A1I63J74EH30D965111', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Tolerance-and-Social-Cohesion-French', NULL, 0, 5, '2021-11-27 00:26:08', NULL, NULL),
(664, 6, 16, 50, 12, 'Russian', 'Cultural Diversity Enriches Knowledge', 'Cultural Diversity Enriches Knowledge', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Cultural-Diversity-Enriches-Knowledge.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Cultural-Diversity-Enriches-Knowledge.pdf', 'WBVQ83M9K7S1N6I2E911101', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Russian', NULL, 0, 5, '2021-11-27 00:28:12', NULL, NULL),
(665, 6, 16, 50, 12, 'Russian', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Communal-Tolerance.pdf', 'WBVQ83M9K7S1N6I2E911102', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Communal-Tolerance-Russian', NULL, 0, 5, '2021-11-27 00:28:32', NULL, NULL),
(666, 6, 16, 50, 12, 'Russian', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Cultural-Diversity.pdf', 'WBVQ83M9K7S1N6I2E911103', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Russian', NULL, 0, 5, '2021-11-27 00:29:25', NULL, NULL),
(667, 6, 16, 50, 12, 'Russian', 'UAE A Tolerant and Close knit Community', 'UAE A Tolerant and Close knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'WBVQ83M9K7S1N6I2E911104', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'UAE-A-Tolerant-and-Close-knit-Community-Russian', NULL, 0, 5, '2021-11-27 00:29:38', NULL, NULL),
(668, 6, 16, 50, 12, 'Russian', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Aspiration-in-the-possibility-approach.pdf', 'WBVQ83M9K7S1N6I2E911105', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Aspiration-in-the-possibility-approach-Russian', NULL, 0, 5, '2021-11-27 00:29:57', NULL, NULL),
(669, 6, 16, 50, 12, 'Russian', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Distance-learning-An-authentic-system.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Distance-learning-An-authentic-system.pdf', 'WBVQ83M9K7S1N6I2E911106', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Distance-learning-An-authentic-system-Russian', NULL, 0, 5, '2021-11-27 00:30:17', NULL, NULL),
(670, 6, 16, 50, 12, 'Russian', 'Multiculturalism', 'Multiculturalism', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Multiculturalism.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Multiculturalism.pdf', 'WBVQ83M9K7S1N6I2E911107', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Multiculturalism-Russian', NULL, 0, 5, '2021-11-27 00:30:30', NULL, NULL),
(671, 6, 16, 50, 12, 'Russian', 'Tolerance Human Rights', 'Tolerance Human Rights', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Tolerance-Human-Rights.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Tolerance-Human-Rights.pdf', 'WBVQ83M9K7S1N6I2E911108', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Tolerance-Human-Rights-Russian', NULL, 0, 5, '2021-11-27 00:30:43', NULL, NULL),
(672, 6, 16, 50, 12, 'Russian', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Ramadan-and-Human-Building.pdf', 'WBVQ83M9K7S1N6I2E911109', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Ramadan-and-Human-Building-Russian', NULL, 0, 5, '2021-11-26 01:04:10', NULL, NULL),
(673, 6, 16, 50, 12, 'Russian', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Sustainable-Tolerance.pdf', 'WBVQ83M9K7S1N6I2E911110', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Sustainable-Tolerance-Russian', NULL, 0, 5, '2021-11-26 01:04:19', NULL, NULL),
(674, 6, 16, 50, 12, 'Russian', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Russian', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Russian/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/Russian/Tolerance-and-Social-Cohesion.pdf', 'WBVQ83M9K7S1N6I2E911111', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Tolerance-and-Social-Cohesion-Russian', NULL, 0, 5, '2021-11-26 01:04:27', NULL, NULL),
(675, 6, 16, 62, 22, 'Spanish', 'Cultural Diversity Enriches Knowledge', 'Cultural Diversity Enriches Knowledge', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Cultural-Diversity-Enriches-Knowledge.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Cultural-Diversity-Enriches-Knowledge.pdf', '6WZ8HYG2582B5S577LDF', '2', NULL, 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Spanish', NULL, 0, 5, '2021-11-26 01:08:39', NULL, NULL),
(676, 6, 16, 62, 22, 'Spanish', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Communal-Tolerance.pdf', 'E8F4XE8N0156G4P6WROB', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Communal-Tolerance-Spanish', NULL, 0, 5, '2021-11-26 01:09:09', NULL, NULL),
(677, 6, 16, 62, 22, 'Spanish', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Cultural-Diversity.pdf', 'Q0L537A6FDKE4ZM9BI4R', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Spanish', NULL, 0, 5, '2021-11-26 01:09:33', NULL, NULL),
(678, 6, 16, 62, 22, 'Spanish', 'UAE A Tolerant and Close knit Community', 'UAE A Tolerant and Close knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/UAE-A-Tolerant-and-Close-knit-Community.pdf', '86XF14BN8V8672F66E4P', '2', NULL, 'ltr', 1, 1, 0, 0, 'UAE-A-Tolerant-and-Close-knit-Community-Spanish', NULL, 0, 5, '2021-11-26 01:09:54', NULL, NULL),
(679, 6, 16, 62, 22, 'Spanish', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Aspiration-in-the-possibility-approach.pdf', 'B9LJ88GBHC839F6A7X3Z', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Aspiration-in-the-possibility-approach-Spanish', NULL, 0, 5, '2021-11-26 01:10:40', NULL, NULL),
(680, 6, 16, 62, 22, 'Spanish', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Distance-Learning-An-authentic-system.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Distance-Learning-An-authentic-system.pdf', '29K656ISWGO9LBZDVX61', '0', NULL, 'ltr', 1, 1, 0, 0, 'Distance-learning-An-authentic-system-Spanish', NULL, 0, 5, '2021-11-26 01:11:04', NULL, NULL),
(681, 6, 16, 62, 22, 'Spanish', 'Multiculturalism', 'Multiculturalism', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Multiculturalism.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Multiculturalism.pdf', 'T6QDBP6SJBE92O3K6C0X', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Multiculturalism-Spanish', NULL, 0, 5, '2021-11-26 01:11:30', NULL, NULL),
(682, 6, 16, 62, 22, 'Spanish', 'Tolerance  Human Rights', 'Tolerance  Human Rights', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Tolerance-Human-Rights.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Tolerance-Human-Rights.pdf', 'HYA5970ZMI47K6N0C7LQ', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Tolerance-Human-Rights-Spanish', NULL, 0, 5, '2021-11-26 01:11:59', NULL, NULL),
(683, 6, 16, 62, 22, 'Spanish', 'International Tolerance', 'International Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/International-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/International-Tolerance.pdf', 'Y713A6K7SIEL1E44PD51', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'International-Tolerance-Spanish', NULL, 0, 5, '2021-11-26 01:12:29', NULL, NULL),
(684, 6, 16, 62, 22, 'Spanish', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Ramadan-and-Human-Building.pdf', '3DNE6Q702FLYX469SHEJ', '2', NULL, 'ltr', 1, 1, 0, 0, 'Ramadan-and-Human-Building-Spanish', NULL, 0, 5, '2021-11-26 01:12:52', NULL, NULL),
(685, 6, 16, 62, 22, 'Spanish', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Sustainable-Tolerance.pdf', '6F22DY9FVT9DL31C48I5', '0', NULL, 'ltr', 1, 1, 0, 0, 'Sustainable-Tolerance-Spanish', NULL, 0, 5, '2021-11-26 01:13:25', NULL, NULL),
(686, 6, 16, 62, 22, 'Spanish', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Spanish', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Spanish/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/Spanish/Tolerance-and-Social-Cohesion.pdf', '65FDJ11WHE7V1NOM72I4', '2', NULL, 'ltr', 1, 1, 0, 0, 'Tolerance-and-Social-Cohesion-Spanish', NULL, 0, 5, '2021-11-26 01:17:36', NULL, NULL),
(687, 6, 15, 47, 16, 'Urdu', 'Cultural Diversity Enriches Knowledge', 'Cultural Diversity Enriches Knowledge', NULL, NULL, NULL, NULL, NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Cultural-Diversity-Enriches-Knowledge.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Cultural-Diversity-Enriches-Knowledge.pdf', '27F79X70F1C38YDJZ9O6', '2', NULL, 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Urdu', NULL, 0, 5, '2021-11-27 00:39:51', NULL, NULL),
(688, 6, 15, 47, 16, 'Urdu', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Communal-Tolerance.pdf', 'T6AQ4B9Y61IB12FKEAOW', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Communal-Tolerance-Urdu', NULL, 0, 5, '2021-11-26 01:19:06', NULL, NULL),
(689, 6, 15, 47, 16, 'Urdu', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Cultural-Diversity.pdf', 'ATF61YNI2K749Q2DJEO9', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Urdu', NULL, 0, 5, '2021-11-26 01:19:30', NULL, NULL),
(690, 6, 15, 47, 16, 'Urdu', 'UAE A Tolerant and Close knit Community', 'UAE A Tolerant and Close knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/UAE-A-Tolerant-and-Close-knit-Community.pdf', '46CVEX92924GF08143WY', '2', NULL, 'ltr', 1, 1, 0, 0, 'UAE-A-Tolerant-and-Close-knit-Community-Urdu', NULL, 0, 5, '2021-11-26 01:19:54', NULL, NULL),
(691, 6, 15, 47, 16, 'Urdu', 'Cognitive security is vital for tolerance', 'Cognitive security is vital for tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Cognitive-security-is-vital-for-tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Cognitive-security-is-vital-for-tolerance.pdf', 'X419G7V5QE2Y5EHFNFAD', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cognitive-security-is-vital-for-tolerance-Urdu', NULL, 0, 5, '2021-11-26 01:20:15', NULL, NULL),
(692, 6, 15, 47, 16, 'Urdu', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Aspiration-in-the-possibility-approach.pdf', 'M4FZC01W89F1LV0K36HY', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Aspiration-in-the-possibility-approach-Urdu', NULL, 0, 5, '2021-11-26 01:21:39', NULL, NULL),
(693, 6, 15, 47, 16, 'Urdu', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Distance-learning-An-authentic-system.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Distance-learning-An-authentic-system.pdf', '9BD999LEJRFMW1S0D324', '1', NULL, 'ltr', 1, 1, 0, 0, 'Distance-learning-An-authentic-system-Urdu', NULL, 0, 5, '2021-11-26 01:22:00', NULL, NULL),
(694, 6, 15, 47, 16, 'Urdu', 'Multiculturalism', 'Multiculturalism', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Multiculturalism.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Multiculturalism.pdf', 'MDV75Y1KC5T6NFC11FPH', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Multiculturalism-Urdu', NULL, 0, 5, '2021-11-26 01:22:23', NULL, NULL),
(695, 6, 15, 47, 16, 'Urdu', 'Tolerance  Human Rights', 'Tolerance  Human Rights', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Tolerance-Human-Rights.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Tolerance-Human-Rights.pdf', '53EB1961KJFE38FHV7D6', '0', NULL, 'ltr', 1, 1, 0, 0, 'Tolerance--Human-Rights-Urdu', NULL, 0, 5, '2021-11-26 01:22:42', NULL, NULL),
(696, 6, 15, 47, 16, 'Urdu', 'International Tolerance', 'International Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/International-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/International-Tolerance.pdf', '4RF1PMT7G5A39FV3W68K', '2', NULL, 'ltr', 1, 1, 0, 0, 'International-Tolerance-Urdu', NULL, 0, 5, '2021-11-26 01:23:07', NULL, NULL),
(697, 6, 15, 47, 16, 'Urdu', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Ramadan-and-Human-Building.pdf', '76B786KV4O1DB64EA1BY', '0', NULL, 'ltr', 1, 1, 0, 0, 'Ramadan-and-Human-Building-Urdu', NULL, 0, 5, '2021-11-26 01:23:26', NULL, NULL),
(698, 6, 15, 47, 16, 'Urdu', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Sustainable-Tolerance.pdf', '426J69AR11HFT2LNV9IP', '2', NULL, 'ltr', 1, 1, 0, 0, 'Sustainable-Tolerance-Urdu', NULL, 0, 5, '2021-11-26 01:23:46', NULL, NULL),
(699, 6, 15, 47, 16, 'Urdu', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Urdu', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Urdu/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/Urdu/Tolerance-and-Social-Cohesion.pdf', '1C4DK2FME9911B6JNPE3', '2', NULL, 'ltr', 1, 1, 0, 0, 'Tolerance-and-Social-Cohesion-Urdu', NULL, 0, 5, '2021-11-26 01:24:09', NULL, NULL),
(700, 6, 15, 46, 14, 'Tagalog', 'Cultural Diversity Enriches Knowledge', 'Cultural Diversity Enriches Knowledge', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Cultural-Diversity-Enriches-Knowledge.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Cultural-Diversity-Enriches-Knowledge.pdf', 'E8AOA475668N2I19L22D', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Tagalog', NULL, 0, 5, '2021-11-26 01:25:14', NULL, NULL),
(701, 6, 15, 46, 14, 'Tagalog', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Communal-Tolerance.pdf', 'MCJLQF4H1FC79596ND21', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Communal-Tolerance-Tagalog', NULL, 0, 5, '2021-11-26 01:26:01', NULL, NULL),
(702, 6, 15, 46, 14, 'Tagalog', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Cultural-Diversity.pdf', 'GV6L3J3TQE75P86E26S4', '1', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Tagalog', NULL, 0, 5, '2021-11-26 01:26:22', NULL, NULL),
(703, 6, 15, 46, 14, 'Tagalog', 'UAE A Tolerant and Close knit Community', 'UAE A Tolerant and Close knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'B6KA5N71J0FE843WHCAP', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'UAE-A-Tolerant-and-Close-knit-Community-Tagalog', NULL, 0, 5, '2021-11-26 01:26:46', NULL, NULL),
(704, 6, 15, 46, 14, 'Tagalog', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Aspiration-in-the-possibility-approach.pdf', 'EK17LX5A0AV471MS3Y2B', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Aspiration-in-the-possibility-approach-Tagalog', NULL, 0, 5, '2021-11-26 01:27:29', NULL, NULL),
(705, 6, 15, 46, 14, 'Tagalog', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Distance-Learning-An-authentic-system -.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Distance-Learning-An-authentic-system -.pdf', '4AECAD3S89JN1B377W4Z', '2', NULL, 'ltr', 1, 1, 0, 0, 'Distance-learning-An-authentic-system-Tagalog', NULL, 0, 5, '2021-11-26 01:27:55', NULL, NULL),
(706, 6, 15, 46, 14, 'Tagalog', 'Multiculturalism', 'Multiculturalism', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Multiculturalism.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Multiculturalism.pdf', 'SZR8T6AJ401NF0B9DABE', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Multiculturalism-Tagalog', NULL, 0, 5, '2021-11-26 01:28:18', NULL, NULL),
(707, 6, 15, 46, 14, 'Tagalog', 'Tolerance Human Rights', 'Tolerance Human Rights', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Tolerance-Human-Rights.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Tolerance-Human-Rights.pdf', '72BYZ9EW1O9RPCFQ8E6K', '2', NULL, 'ltr', 1, 1, 0, 0, 'Tolerance-Human-Rights-Tagalog', NULL, 0, 5, '2021-11-26 01:28:47', NULL, NULL),
(708, 6, 15, 46, 14, 'Tagalog', 'International Tolerance', 'International Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/International-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/International-Tolerance.pdf', 'SGE4K7W96T0141NE82P0', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'International-Tolerance-Tagalog', NULL, 0, 5, '2021-11-26 01:29:13', NULL, NULL),
(709, 6, 15, 46, 14, 'Tagalog', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Ramadan-and-Human-Building.pdf', '6D81G8Y20LRF7NSEO9AC', '2', NULL, 'ltr', 1, 1, 0, 0, 'Ramadan-and-Human-Building-Tagalog', NULL, 0, 5, '2021-11-26 01:29:32', NULL, NULL),
(710, 6, 15, 46, 14, 'Tagalog', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Sustainable-Tolerance.pdf', 'F0019244X57VA6BPAS9K', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Sustainable-Tolerance-Tagalog', NULL, 0, 5, '2021-11-26 01:30:00', NULL, NULL),
(711, 6, 15, 46, 14, 'Tagalog', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Tagalog', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Tagalog/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/Tagalog/Tolerance-and-Social-Cohesion.pdf', '1D0IBF57C1WKY6HBJ662', '6', NULL, 'ltr', 1, 1, 0, 0, 'Tolerance-and-Social-Cohesion-Tagalog', NULL, 0, 5, '2021-11-26 01:30:21', NULL, NULL),
(712, 6, 17, 49, 1, 'Amharic', 'Cultural Diversity Enriches Knowledge', 'Cultural Diversity Enriches Knowledge', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Cultural-Diversity-Enriches-Knowledge.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Cultural-Diversity-Enriches-Knowledge.pdf', 'BEA3FBTBR0I5C6Z7208F', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Amharic', NULL, 0, 5, '2021-11-26 01:30:55', NULL, NULL),
(713, 6, 17, 49, 1, 'Amharic', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Communal-Tolerance.pdf', '5384X30CE6WP9MV67B5G', '3', NULL, 'ltr', 1, 1, 0, 0, 'Communal-Tolerance-Amharic', NULL, 0, 5, '2021-11-26 01:31:14', NULL, NULL),
(714, 6, 17, 49, 1, 'Amharic', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Cultural-Diversity.pdf', 'BPLT9ESQJEE7MXFN3V19', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Amharic', NULL, 0, 5, '2021-11-26 01:31:34', NULL, NULL),
(715, 6, 17, 49, 1, 'Amharic', 'UAE A Tolerant and Close knit Community', 'UAE A Tolerant and Close knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'SGBLN9K11H4B6Z6E2JBE', '2', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'UAE-A-Tolerant-and-Close-knit-Community-Amharic', NULL, 0, 5, '2021-11-26 01:31:52', NULL, NULL),
(716, 6, 17, 49, 1, 'Amharic', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Aspiration-in-the-possibility-approach.pdf', '83HJ3O6M4Z52FYX5P6E0', '3', NULL, 'ltr', 1, 1, 0, 0, 'Aspiration-in-the-possibility-approach-Amharic', NULL, 0, 5, '2021-11-26 01:32:12', NULL, NULL),
(717, 6, 17, 49, 1, 'Amharic', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Distance-learning-An-authentic-system.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Distance-learning-An-authentic-system.pdf', '93D0Y13EI6TSZE9192RF', '3', NULL, 'ltr', 1, 1, 0, 0, 'Distance-learning-An-authentic-system-Amharic', NULL, 0, 5, '2021-11-26 01:32:33', NULL, NULL),
(718, 6, 17, 49, 1, 'Amharic', 'Multiculturalism', 'Multiculturalism', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Multiculturalism.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Multiculturalism.pdf', '06FPC6O16E79J9BYLZD0', '5', NULL, 'ltr', 1, 1, 0, 0, 'Multiculturalism-Amharic', NULL, 0, 5, '2021-11-26 01:32:48', NULL, NULL),
(719, 6, 17, 49, 1, 'Amharic', 'Tolerance  Human Rights', 'Tolerance  Human Rights', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Tolerance-Human-Rights.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Tolerance-Human-Rights.pdf', 'P87OCF631B190ZGF8QTY', '0', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Tolerance--Human-Rights-Amharic', NULL, 0, 5, '2021-11-26 01:33:05', NULL, NULL),
(720, 6, 17, 49, 1, 'Amharic', 'International Tolerance', 'International Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/International-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/International-Tolerance.pdf', '9WK5CNASHT264I852Y1O', '2', NULL, 'ltr', 1, 1, 0, 0, 'International-Tolerance-Amharic', NULL, 0, 5, '2021-11-26 01:33:34', NULL, NULL),
(721, 6, 17, 49, 1, 'Amharic', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Ramadan-and-Human-Building.pdf', '7Y296NZ6APFH63V8KIO3', '2', NULL, 'ltr', 1, 1, 0, 0, 'Ramadan-and-Human-Building-Amharic', NULL, 0, 5, '2021-11-26 01:33:51', NULL, NULL),
(722, 6, 17, 49, 1, 'Amharic', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Sustainable-Tolerance.pdf', 'QC9FB86A9J051TRV70Z3', '3', '2022-05-26 18:20:09', 'ltr', 1, 1, 0, 0, 'Sustainable-Tolerance-Amharic', NULL, 0, 5, '2021-11-26 01:34:17', NULL, NULL),
(723, 6, 17, 49, 1, 'Amharic', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Amharic', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Amharic/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/Amharic/Tolerance-and-Social-Cohesion.pdf', '3SV7L94IF5FFJ64WRC31', '10', '2022-02-07 14:15:44', 'ltr', 1, 1, 0, 0, 'Tolerance-and-Social-Cohesion-Amharic', NULL, 0, 5, '2021-11-26 01:34:35', NULL, NULL),
(726, 6, 15, 45, 11, 'Senhali', 'Communal Tolerance', 'Communal Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Communal-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Communal-Tolerance.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(727, 6, 15, 45, 11, 'Senhali', 'Cultural Diversity', 'Cultural Diversity', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Cultural-Diversity.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Cultural-Diversity.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(728, 6, 15, 45, 11, 'Senhali', 'UAE A Tolerant and Close knit Community', 'UAE A Tolerant and Close knit Community', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/UAE-A-Tolerant-and-Close-knit-Community.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/UAE-A-Tolerant-and-Close-knit-Community.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(729, 6, 15, 45, 11, 'Senhali', 'Aspiration in the possibility approach', 'Aspiration in the possibility approach', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Aspiration-in-the-possibility-approach.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Aspiration-in-the-possibility-approach.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(730, 6, 15, 45, 11, 'Senhali', 'Distance learning An authentic system', 'Distance learning An authentic system', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Distance-Learning-An-authentic-system.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Distance-Learning-An-authentic-system.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(731, 6, 15, 45, 11, 'Senhali', 'Multiculturalism', 'Multiculturalism', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Multiculturalism.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Multiculturalism.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(732, 6, 15, 45, 11, 'Senhali', 'Tolerance  Human Rights', 'Tolerance  Human Rights', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Tolerance-Human-Rights.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Tolerance-Human-Rights.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(733, 6, 15, 45, 11, 'Senhali', 'International Tolerance', 'International Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/International-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/International-Tolerance.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(734, 6, 15, 45, 11, 'Senhali', 'Ramadan and Human Building', 'Ramadan and Human Building', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Ramadan-and-Human-Building.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Ramadan-and-Human-Building.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(735, 6, 15, 45, 11, 'Senhali', 'Sustainable Tolerance', 'Sustainable Tolerance', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Sustainable-Tolerance.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Sustainable-Tolerance.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(736, 6, 15, 45, 11, 'Senhali', 'Tolerance and Social Cohesion', 'Tolerance and Social Cohesion', NULL, NULL, NULL, 'Articles on various topics about Islamic culture, translated into Senhali', NULL, 'ZHIC', NULL, NULL, NULL, 'http://localhost/zhic/public/Locker/Articles/Snahali/Tolerance-and-Social-Cohesion.pdf', 'http://localhost/zhic/public/Locker/Articles/Snahali/Tolerance-and-Social-Cohesion.pdf', '5CYSQ02B167X311G6163', '6', '2021-11-30 12:09:32', 'ltr', 1, 1, 0, 0, 'Cultural-Diversity-Enriches-Knowledge-Senhali', NULL, 0, 5, '2021-11-27 01:01:56', NULL, NULL),
(737, 1, 2, 73, 2, NULL, 'Muhammad Ayyub', 'Muhammad Ayyub', NULL, NULL, NULL, 'Muhammad Ayyub Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '61BY14A32ZT7CQOXW15L', '3', NULL, NULL, 1, 0, 1, NULL, 'Muhammad-Ayyub-Arabic', NULL, 1, 5, '2021-11-27 17:36:48', NULL, NULL),
(738, 1, 2, 72, 2, NULL, 'Idriss Abkar', 'Idriss Abkar', NULL, NULL, NULL, 'Idriss Abkar Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '119D4CIH7ABJT9Z25KB6', '4', NULL, NULL, 1, 0, 1, NULL, 'Idriss-Abkar-Arabic', NULL, 1, 5, '2021-11-27 17:38:27', NULL, NULL),
(739, 1, 2, 71, 2, NULL, 'Ali Al huthaify', 'Ali Al huthaify', NULL, NULL, NULL, 'Ali Al huthaify Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'B6AYFF09MVER5IDXSWG6', '1', '2022-05-26 18:20:09', NULL, 1, 0, 1, NULL, 'Ali-Al-huthaify-Arabic', NULL, 1, 5, '2021-11-27 17:40:06', NULL, NULL),
(740, 1, 2, NULL, 2, NULL, 'Maher Al Mueaqly', 'Maher Al Mueaqly', NULL, NULL, NULL, 'Maher Al Mueaqly Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FV25XAZ48DHCA7446APL', '2', '2022-05-26 18:20:09', NULL, 1, 0, 1, NULL, 'Maher-Al-Mueaqly-Arabic', NULL, 1, 5, '2021-11-27 17:20:59', NULL, NULL),
(742, 1, 2, 69, 2, NULL, 'Saud Shuraim', 'Saud Shuraim', NULL, NULL, NULL, 'Saud Shuraim Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EHBA04KE9QC152LB2J41', '2', '2022-05-26 18:20:09', NULL, 1, 0, 1, NULL, 'Saud-Shuraim-Arabic', NULL, 1, 5, '2021-11-27 17:31:31', NULL, NULL),
(743, 1, 2, 68, 2, NULL, 'Saad El Ghamidi', 'Saad El Ghamidi', NULL, NULL, NULL, 'Saad El Ghamidi Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A99YNKW2972EJI10O61D', '2', '2022-05-26 18:20:09', NULL, 1, 0, 1, NULL, 'Saad-El-Ghamidi-Arabic', NULL, 1, 5, '2021-11-27 17:44:02', NULL, NULL),
(745, 1, 2, 74, 2, NULL, 'Salah Bukhatir', 'Salah Bukhatir', NULL, NULL, NULL, 'Salah Bukhatir Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LWDCO1H1G2B7PDIAF709', '2', '2022-05-26 18:20:09', NULL, 1, 0, 1, NULL, 'Salah-Bukhatir-Arabic', NULL, 1, 5, '2021-11-27 17:51:31', NULL, NULL),
(746, 1, 2, 77, 2, NULL, 'Mahmoud Khalil Al Hussary', 'Mahmoud Khalil Al Hussary', NULL, NULL, NULL, 'Mahmoud Khalil Al Hussary Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P6LKB9Y9X362S25M4FQ2', '2', '2022-05-26 18:20:09', NULL, 1, 0, 1, NULL, 'Mahmoud-Khalil-Al-Hussary-Arabic', NULL, 1, 5, '2021-11-27 18:18:59', NULL, NULL),
(747, 1, 2, NULL, 2, NULL, 'Abdulbasit Abdusamad', 'Abdulbasit Abdusamad', NULL, NULL, NULL, 'Mohamed Tablawi Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '60W4QM38I0YEA731AXGD', '3', NULL, NULL, 1, 0, 1, NULL, 'Abdulbasit-Abdusamad-Reciter-Arabic', NULL, 1, 5, '2021-11-30 13:17:39', NULL, NULL),
(748, 1, 2, 79, 2, NULL, 'Mohamed Siddiq El-Minshawi', 'Mohamed Siddiq El-Minshawi', NULL, NULL, NULL, 'Mohamed Siddiq El-Minshawi Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '56R90J9DGNF6A2LSQVEM', '2', NULL, NULL, 1, 0, 1, NULL, 'Mohamed-Siddiq-ElMinshawi-Arabic', NULL, 1, 5, '2021-11-27 18:35:02', NULL, NULL),
(749, 1, 2, 78, 2, NULL, 'Mohammed Tablawi', 'Mohammed Tablawi', NULL, NULL, NULL, 'Mohammed Tablawi Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '176ZYCLAN16630DRJCOH', '2', '2022-01-13 17:44:28', NULL, 1, 0, 0, NULL, 'Mohammed-Tablawi-Arabic', NULL, 1, 5, '2022-01-26 14:43:51', NULL, NULL),
(750, 1, 2, 75, 2, NULL, 'Mishary Rashid Alafasy', 'Mishary Rashid Alafasy', NULL, NULL, NULL, 'Mishary Rashid Alafasy Reciter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FB6ZH7JE10FPRX5DAN07', '1', '2022-05-26 18:20:09', NULL, 1, 0, 0, NULL, 'Mishary-Rashid-Alafasy-Arabic', NULL, 1, 5, '2022-01-26 14:43:06', NULL, NULL),
(751, 5, 12, 17, 2, 'Arabic', 'First Book', 'الكتاب الأول', '1000H-87S9898989', 'Ahmed Abdallah AlShahab', 'احمد عبدالله الشهاب', 'Simple Description about this this book', 'وصف بسيط عن هذا الكتاب', 'ZHIC', '2022-07-11', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'rtl', 1, 1, 0, 0, 'First-Book-Arabic', NULL, 0, 5, '2022-07-11 12:57:52', NULL, NULL),
(752, 4, 9, 2, 4, NULL, 'First Audio', 'الصوت الأول', '1000-000000', 'Ahmed Abdallah AlShahab', 'احمد عبدالله الشهاب', 'Ahmed Abdallah AlShahab', 'احمد عبدالله الشهاب', NULL, '2022-07-11', NULL, NULL, NULL, NULL, 'B1I37OA6Q78BXRJZF216', '0', NULL, NULL, 1, 0, 1, NULL, 'First-Audio-English', NULL, 1, 5, '2022-07-11 13:16:55', '2022-07-11 13:23:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ebook__audios`
--

CREATE TABLE `ebook__audios` (
  `audio_id` bigint(255) NOT NULL,
  `file_id` bigint(255) NOT NULL,
  `audio_title` longtext NOT NULL,
  `audio_file` longtext NOT NULL,
  `audio_link` longtext DEFAULT NULL,
  `audio_position` int(255) NOT NULL DEFAULT 0,
  `created_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ebook__audios`
--

INSERT INTO `ebook__audios` (`audio_id`, `file_id`, `audio_title`, `audio_file`, `audio_link`, `audio_position`, `created_at`) VALUES
(1, 52, 'Al-Fatiha', '381760592454681.mp3', NULL, 1, NULL),
(2, 52, 'Al-Baqara', '698072351455013.mp3', NULL, 2, NULL),
(3, 52, 'Aal-e-Imran', '740591286323317.mp3', NULL, 3, NULL),
(4, 52, 'An-Nisa', '672189305471587.mp3', NULL, 4, NULL),
(5, 52, 'Al-Maeda', '930867145225668.mp3', NULL, 5, NULL),
(8, 52, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-006-al-anaam-3227-4203.mp3', 0, '2021-11-27 13:24:57'),
(9, 52, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-007-al-araf-3219-8114.mp3', 0, '2021-11-27 13:27:19'),
(10, 52, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-008-al-anfal-3220-9689.mp3', 0, '2021-11-27 13:28:12'),
(11, 52, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-009-at-taubah-3221-6039.mp3', 0, '2021-11-27 13:28:50'),
(12, 52, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-010-yunus-3222-4925.mp3', 0, '2021-11-27 13:29:15'),
(13, 52, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-011-hud-3223-9465.mp3', 0, '2021-11-27 13:29:39'),
(14, 52, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-012-yusuf-3224-6810.mp3', 0, '2021-11-27 13:30:28'),
(15, 52, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-013-ar-rad-3228-6993.mp3', 0, '2021-11-27 13:31:00'),
(16, 52, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-014-ibrahim-3232-1606.mp3', 0, '2021-11-27 13:32:04'),
(17, 52, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-015-al-hijr-3233-4712.mp3', 0, '2021-11-27 13:33:07'),
(18, 52, 'Al Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-016-an-nahl-3234-7671.mp3', 0, '2021-11-27 13:33:39'),
(19, 52, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-017-al-isra-3229-6517.mp3', 0, '2021-11-27 13:37:18'),
(20, 52, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-018-al-kahf-3230-4586.mp3', 0, '2021-11-27 13:37:54'),
(21, 52, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-019-maryam-3231-4796.mp3', 0, '2021-11-27 13:38:19'),
(22, 52, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-020-taha-3244-5464.mp3', 0, '2021-11-27 13:39:47'),
(23, 52, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-021-al-anbiya-3245-6502.mp3', 0, '2021-11-27 13:40:36'),
(24, 52, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-022-al-hajj-3246-8531.mp3', 0, '2021-11-27 13:41:28'),
(25, 52, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-023-al-mumenoon-3247-2659.mp3', 0, '2021-11-27 13:41:57'),
(26, 52, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-024-an-noor-3248-7033.mp3', 0, '2021-11-27 13:42:20'),
(27, 52, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-025-al-furqan-3182-4713.mp3', 0, '2021-11-27 13:43:12'),
(28, 52, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-026-ash-shuara-3183-9430.mp3', 0, '2021-11-27 13:44:01'),
(30, 52, 'An-Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-027-an-naml-3184-8691.mp3', 0, '2021-11-27 15:39:01'),
(31, 52, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-028-al-qasas-3040-5960.mp3', 0, '2021-11-27 15:40:03'),
(32, 52, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-029-al-ankaboot-3041-765.mp3', 0, '2021-11-27 15:40:29'),
(33, 52, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-030-ar-room-3042-9177.mp3', 0, '2021-11-27 15:40:53'),
(34, 52, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-031-luqman-3043-2045.mp3', 0, '2021-11-27 15:41:20'),
(35, 52, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-032-as-sajda-3044-8786.mp3', 0, '2021-11-27 15:41:52'),
(36, 52, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-033-al-ahzab-3045-4834.mp3', 0, '2021-11-27 15:42:50'),
(37, 52, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-034-saba-3046-1554.mp3', 0, '2021-11-27 15:43:10'),
(38, 52, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-035-fatir-3047-659.mp3', 0, '2021-11-27 15:43:29'),
(39, 52, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-036-ya-seen-3048-9086.mp3', 0, '2021-11-27 15:43:59'),
(41, 52, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-037-as-saaffat-3049-5757.mp3', 0, '2021-11-27 15:46:05'),
(42, 52, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-038-sad-3050-8773.mp3', 0, '2021-11-27 15:47:38'),
(43, 52, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-039-az-zumar-3051-8775.mp3', 0, '2021-11-27 15:48:19'),
(44, 52, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-040-ghafir-3052-1796.mp3', 0, '2021-11-27 15:48:44'),
(45, 52, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-041-fussilat-3185-3698.mp3', 0, '2021-11-27 15:49:14'),
(46, 52, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-042-ash-shura-3186-8239.mp3', 0, '2021-11-27 15:50:01'),
(47, 52, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-043-az-zukhruf-3187-8606.mp3', 0, '2021-11-27 15:50:41'),
(48, 52, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-044-ad-dukhan-3188-690.mp3', 0, '2021-11-27 15:51:27'),
(49, 52, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-045-al-jathiya-3189-9845.mp3', 0, '2021-11-27 15:52:05'),
(50, 52, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-046-al-ahqaf-3190-3318.mp3', 0, '2021-11-27 15:52:56'),
(51, 52, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-047-muhammad-3191-8362.mp3', 0, '2021-11-27 15:53:35'),
(52, 52, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-048-al-fath-3192-6362.mp3', 0, '2021-11-27 15:53:55'),
(53, 52, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-049-al-hujraat-3029-7904.mp3', 0, '2021-11-27 15:54:43'),
(54, 52, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-050-qaf-3030-3157.mp3', 0, '2021-11-27 15:55:03'),
(55, 52, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-051-adh-dhariyat-3031-1825.mp3', 0, '2021-11-27 15:55:33'),
(56, 52, 'At tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-052-at-tur-3032-4406.mp3', 0, '2021-11-27 15:55:51'),
(57, 52, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-053-an-najm-3033-1688.mp3', 0, '2021-11-27 15:56:11'),
(58, 52, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-054-al-qamar-3034-4484.mp3', 0, '2021-11-27 15:56:39'),
(59, 52, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-055-al-rahman-3035-1438.mp3', 0, '2021-11-27 15:57:27'),
(60, 52, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-056-al-waqia-3036-6402.mp3', 0, '2021-11-27 15:57:58'),
(61, 52, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-057-al-hadid-3037-3914.mp3', 0, '2021-11-27 15:58:19'),
(62, 52, 'Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-058-al-mujadala-3038-129.mp3', 0, '2021-11-27 15:58:46'),
(63, 52, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-059-al-hashr-3039-2362.mp3', 0, '2021-11-27 15:59:28'),
(64, 52, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-060-al-mumtahina-3249-4679.mp3', 0, '2021-11-27 16:00:09'),
(65, 52, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-061-as-saff-3250-9307.mp3', 0, '2021-11-27 16:01:04'),
(66, 52, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-062-al-jumua-3251-4407.mp3', 0, '2021-11-27 16:01:46'),
(67, 52, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-063-al-munafiqoon-3252-3465.mp3', 0, '2021-11-27 16:02:15'),
(68, 52, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-064-at-taghabun-3253-4141.mp3', 0, '2021-11-27 16:03:13'),
(69, 52, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-065-at-talaq-3254-5961.mp3', 0, '2021-11-27 16:03:34'),
(70, 52, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-066-at-tahrim-3255-4124.mp3', 0, '2021-11-27 16:04:06'),
(71, 52, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/..//Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-067-al-mulk-3256-3227.mp3', 0, '2021-11-27 16:04:36'),
(72, 52, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-068-al-qalam-3193-1718.mp3', 0, '2021-11-27 16:06:40'),
(73, 52, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-069-al-haaqqa-3194-2897.mp3', 0, '2021-11-27 16:07:02'),
(74, 52, 'Al-Maarij', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-070-al-maarij-3195-2001.mp3', 0, '2021-11-27 16:07:38'),
(75, 52, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-071-nooh-3196-3514.mp3', 0, '2021-11-27 16:08:04'),
(76, 52, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-072-al-jinn-3197-6595.mp3', 0, '2021-11-27 16:08:45'),
(77, 52, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-073-al-muzzammil-3198-239.mp3', 0, '2021-11-27 16:09:21'),
(78, 52, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-074-al-muddathir-3199-2119.mp3', 0, '2021-11-27 16:10:15'),
(79, 52, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-075-al-qiyama-3200-7286.mp3', 0, '2021-11-27 16:11:07'),
(80, 52, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-076-al-insan-3201-84.mp3', 0, '2021-11-27 16:11:43'),
(81, 52, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-077-al-mursalat-3202-5437.mp3', 0, '2021-11-27 16:12:45'),
(82, 52, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-078-an-naba-3203-5647.mp3', 0, '2021-11-27 16:13:19'),
(83, 52, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-079-an-naziat-3204-6446.mp3', 0, '2021-11-27 16:13:39'),
(84, 52, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-080-abasa-3205-3341.mp3', 0, '2021-11-27 16:13:58'),
(85, 52, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-081-at-takwir-3206-8805.mp3', 0, '2021-11-27 16:15:58'),
(86, 52, 'At Infiatar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-081-at-takwir-3206-8805.mp3', 0, '2021-11-27 16:17:02'),
(87, 52, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-083-al-mutaffifin-3208-7747.mp3', 0, '2021-11-27 16:19:57'),
(88, 52, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-084-al-inshiqaq-3209-492.mp3', 0, '2021-11-27 16:20:32'),
(89, 52, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-085-al-burooj-3210-2755.mp3', 0, '2021-11-27 16:21:29'),
(90, 52, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-086-at-tariq-3211-9186.mp3', 0, '2021-11-27 16:22:10'),
(91, 52, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudaisabdul-rahman-al-sudais-087-al-ala-3212-6895.mp3', 0, '2021-11-27 16:22:33'),
(92, 52, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-088-al-ghashiya-3213-6669.mp3', 0, '2021-11-27 16:23:19'),
(93, 52, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-089-al-fajr-3214-9316.mp3', 0, '2021-11-27 16:24:08'),
(94, 52, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-090-al-balad-3215-9257.mp3', 0, '2021-11-27 16:24:58'),
(95, 52, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-091-ash-shams-3167-1348.mp3', 0, '2021-11-27 16:25:41'),
(96, 52, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-092-al-lail-3168-8622.mp3', 0, '2021-11-27 16:26:14'),
(97, 52, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-093-ad-dhuha-3169-3664.mp3', 0, '2021-11-27 16:26:54'),
(98, 52, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-094-ash-sharh-3170-4813.mp3', 0, '2021-11-27 16:27:28'),
(99, 52, 'At Fin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-095-at-fin-3171-2763.mp3', 0, '2021-11-27 16:28:06'),
(100, 52, 'Al Laq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-096-al-alaq-3172-9626.mp3', 0, '2021-11-27 16:28:39'),
(101, 52, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-097-al-qadr-3173-8938.mp3', 0, '2021-11-27 16:29:29'),
(102, 52, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-098-al-bayyina-3174-5990.mp3', 0, '2021-11-27 16:30:13'),
(103, 52, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-099-al-zalzala-3175-1343.mp3', 0, '2021-11-27 16:30:43'),
(104, 52, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-100-al-adiyat-3176-1834.mp3', 0, '2021-11-27 16:31:14'),
(105, 52, 'Al Garia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-101-al-garia-3177-7991.mp3', 0, '2021-11-27 16:32:12'),
(106, 52, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-102-at-takathur-3178-4858.mp3', 0, '2021-11-27 16:32:41'),
(107, 52, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-103-al-asr-3179-8430.mp3', 0, '2021-11-27 16:33:07'),
(108, 52, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-104-al-humaza-3180-8231.mp3', 0, '2021-11-27 16:33:45'),
(109, 52, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-105-al-fil-3181-6978.mp3', 0, '2021-11-27 16:34:08'),
(110, 52, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-106-quraish-3235-5715.mp3', 0, '2021-11-27 16:34:44'),
(111, 52, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-107-al-maun-3236-8315.mp3', 0, '2021-11-27 16:35:15'),
(112, 52, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-108-al-kauther-3237-2415.mp3', 0, '2021-11-27 16:36:04'),
(113, 52, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-109-al-kafiroon-3238-1361.mp3', 0, '2021-11-27 16:36:48'),
(114, 52, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-110-an-nasr-3239-4760.mp3', 0, '2021-11-27 16:37:14'),
(115, 52, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-111-al-masadd-3240-5756.mp3', 0, '2021-11-27 16:37:55'),
(116, 52, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-112-al-ikhlas-3241-165.mp3', 0, '2021-11-27 16:38:36'),
(117, 52, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-113-al-falaq-3242-3031.mp3', 0, '2021-11-27 16:39:05'),
(118, 52, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Abdul-Rahman-Al-Sudais/abdul-rahman-al-sudais-114-an-nas-3243-3503.mp3', 0, '2021-11-27 16:39:37'),
(119, 737, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-001-al-fatiha-879-1250.mp3', 0, '2021-11-27 17:08:27'),
(120, 524, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-001-al-fatiha-6549-6917.mp3', 0, '2021-11-28 16:57:42'),
(121, 524, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-002-al-baqara-6550-623.mp3', 0, '2021-11-28 16:59:38'),
(122, 524, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-003-aal-e-imran-6551-8600.mp3', 0, '2021-11-28 17:01:04'),
(123, 524, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-004-an-nisa-6552-6376.mp3', 0, '2021-11-28 17:03:08'),
(124, 524, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-005-al-maeda-6553-4916.mp3', 0, '2021-11-28 17:03:59'),
(125, 524, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-006-al-anaam-6554-1875.mp3', 0, '2021-11-28 17:04:26'),
(126, 524, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-007-al-araf-6555-188.mp3', 0, '2021-11-28 17:06:56'),
(127, 524, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-008-al-anfal-6556-8882.mp3', 0, '2021-11-28 17:41:02'),
(128, 524, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-009-at-taubah-6557-9692.mp3', 0, '2021-11-28 17:41:44'),
(129, 524, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-010-yunus-6558-2127.mp3', 0, '2021-11-28 17:42:11'),
(130, 525, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-001-al-fatiha-2184-9076.mp3', 0, '2021-11-28 17:51:05'),
(131, 525, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-002-al-baqara-2479-7044.mp3', 0, '2021-11-28 17:53:05'),
(132, 525, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-003-aal-e-imran-2480-2937.mp3', 0, '2021-11-28 17:53:30'),
(133, 525, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-004-an-nisa-2481-5295.mp3', 0, '2021-11-28 17:53:50'),
(134, 525, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-005-al-maeda-2482-7428.mp3', 0, '2021-11-28 17:54:14'),
(135, 525, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-006-al-anaam-2483-5009.mp3', 0, '2021-11-28 17:54:40'),
(136, 525, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-007-al-araf-2484-3409.mp3', 0, '2021-11-28 17:55:07'),
(137, 525, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-008-al-anfal-2485-9007.mp3', 0, '2021-11-28 17:55:32'),
(138, 525, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-009-at-taubah-2486-7137.mp3', 0, '2021-11-28 17:56:00'),
(139, 525, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-010-yunus-2487-3524.mp3', 0, '2021-11-28 17:56:21'),
(140, 737, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-002-al-baqara-880-2077.mp3', 0, '2021-11-28 17:57:13'),
(141, 737, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-003-aal-e-imran-876-7400.mp3', 0, '2021-11-28 18:57:18'),
(142, 737, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-004-an-nisa-877-1724.mp3', 0, '2021-11-28 18:58:04'),
(143, 737, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-005-al-maeda-878-8472.mp3', 0, '2021-11-28 18:58:53'),
(144, 737, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-006-al-anaam-884-412.mp3', 0, '2021-11-28 18:59:17'),
(145, 737, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-007-al-araf-885-1029.mp3', 0, '2021-11-28 18:59:49'),
(146, 737, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-008-al-anfal-881-5474.mp3', 0, '2021-11-28 19:00:24'),
(147, 737, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-009-at-taubah-882-3731.mp3', 0, '2021-11-28 19:00:45'),
(148, 737, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-010-yunus-883-4122.mp3', 0, '2021-11-28 19:01:14'),
(149, 738, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-001-al-fatiha-8368-3360.mp3', 0, '2021-11-28 19:02:08'),
(150, 738, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-002-al-baqara-8369-8381.mp3', 0, '2021-11-28 19:02:37'),
(151, 738, 'Al Maidah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-005-al-mai-dah-112944-5939.mp3', 0, '2021-11-28 19:03:02'),
(152, 738, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-006-al-anaam-8370-8407.mp3', 0, '2021-11-28 19:04:45'),
(153, 738, 'Al Araf-', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-007-al-araf-8371-5457.mp3', 0, '2021-11-28 19:05:16'),
(154, 738, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-008-al-anfal-112943-5247.mp3', 0, '2021-11-28 19:05:43'),
(155, 738, 'At Tawbah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-009-at-tawbah-112942-8353.mp3', 0, '2021-11-28 19:06:08'),
(156, 738, 'Younes', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-010-younes-112941-8868.mp3', 0, '2021-11-28 19:06:28'),
(157, 739, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-001-al-fatiha-1452-6563.mp3', 0, '2021-11-28 19:07:26'),
(158, 739, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-002-al-baqara-1453-1906.mp3', 0, '2021-11-28 19:07:47'),
(159, 739, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-003-aal-e-imran-1454-1328.mp3', 0, '2021-11-28 19:21:56'),
(160, 739, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-004-an-nisa-1455-6842.mp3', 0, '2021-11-28 19:28:12'),
(161, 739, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-005-al-maeda-1456-224.mp3', 0, '2021-11-28 19:28:35'),
(162, 739, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-006-al-anaam-1457-7544.mp3', 0, '2021-11-28 19:29:01'),
(163, 739, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-007-al-araf-1458-5014.mp3', 0, '2021-11-28 19:29:26'),
(164, 739, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-008-al-anfal-1459-1022.mp3', 0, '2021-11-28 19:29:52'),
(165, 739, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-009-at-taubah-1460-1216.mp3', 0, '2021-11-28 19:30:19'),
(166, 739, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-010-yunus-1461-1832.mp3', 0, '2021-11-28 19:30:49'),
(167, 740, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-001-al-fatiha-3083-1938.mp3', 0, '2021-11-28 19:31:46'),
(168, 740, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-002-al-baqara-3066-525.mp3', 0, '2021-11-28 19:32:44'),
(169, 740, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-003-aal-e-imran-3067-6809.mp3', 0, '2021-11-28 19:33:22'),
(170, 740, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-004-an-nisa-3068-3076.mp3', 0, '2021-11-28 19:33:52'),
(171, 740, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-005-al-maeda-3069-8011.mp3', 0, '2021-11-28 19:34:21'),
(172, 740, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-006-al-anaam-3070-9783.mp3', 0, '2021-11-28 19:34:46'),
(173, 740, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-007-al-araf-3071-2051.mp3', 0, '2021-11-28 19:35:13'),
(174, 740, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-008-al-anfal-3072-4277.mp3', 0, '2021-11-28 19:35:40'),
(175, 740, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-009-at-taubah-3073-5399.mp3', 0, '2021-11-28 19:36:04'),
(176, 740, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-010-yunus-3074-8246.mp3', 0, '2021-11-28 19:36:27'),
(177, 742, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-001-al-fatiha-541-4075.mp3', 0, '2021-11-29 13:24:02'),
(178, 742, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-002-al-baqara-536-5923.mp3', 0, '2021-11-29 13:24:25'),
(179, 742, 'Al E imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-003-aal-e-imran-553-6503.mp3', 0, '2021-11-29 13:24:47'),
(180, 742, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-004-an-nisa-592-531.mp3', 0, '2021-11-29 13:25:13'),
(181, 742, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-005-al-maeda-566-6407.mp3', 0, '2021-11-29 13:25:35'),
(182, 742, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-006-al-anaam-642-8667.mp3', 0, '2021-11-29 13:25:55'),
(183, 742, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-007-al-araf-646-2376.mp3', 0, '2021-11-29 13:26:29'),
(184, 742, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-008-al-anfal-644-6639.mp3', 0, '2021-11-29 13:26:54'),
(185, 742, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-009-at-taubah-610-4486.mp3', 0, '2021-11-29 13:27:22'),
(186, 742, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-010-yunus-632-862.mp3', 0, '2021-11-29 13:27:43'),
(187, 743, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-001-al-fatiha-204-9244.mp3', 0, '2021-11-29 13:29:06'),
(188, 743, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-002-al-baqara-224-3045.mp3', 0, '2021-11-29 13:29:33'),
(189, 743, 'Al E-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-003-aal-e-imran-225-3311.mp3', 0, '2021-11-29 13:29:57'),
(190, 743, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-004-an-nisa-226-285.mp3', 0, '2021-11-29 13:30:36'),
(191, 743, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-005-al-maeda-227-5920.mp3', 0, '2021-11-29 13:31:00'),
(192, 743, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-006-al-anaam-228-285.mp3', 0, '2021-11-29 13:31:27'),
(193, 743, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-007-al-araf-115-3031.mp3', 0, '2021-11-29 13:32:00'),
(194, 743, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-008-al-anfal-116-8000.mp3', 0, '2021-11-29 13:33:44'),
(195, 743, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-009-at-taubah-117-8780.mp3', 0, '2021-11-29 13:34:30'),
(196, 743, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-010-yunus-118-7308.mp3', 0, '2021-11-29 13:45:55'),
(197, 745, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-001-al-fatiha-2025-4294.mp3', 0, '2021-11-29 14:13:30'),
(198, 745, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-002-al-baqara-2026-8762.mp3', 0, '2021-11-29 14:13:56'),
(199, 745, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-003-aal-e-imran-2027-6320.mp3', 0, '2021-11-29 14:14:24'),
(200, 745, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-004-an-nisa-2028-4877.mp3', 0, '2021-11-29 14:14:52'),
(201, 745, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-005-al-maeda-2029-691.mp3', 0, '2021-11-29 14:15:27'),
(202, 745, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-006-al-anaam-2030-2364.mp3', 0, '2021-11-29 14:15:49'),
(203, 745, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-008-al-anfal-2032-4331.mp3', 0, '2021-11-29 14:18:11'),
(204, 745, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-009-at-taubah-2033-97.mp3', 0, '2021-11-29 14:18:40'),
(205, 745, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-010-yunus-2034-1459.mp3', 0, '2021-11-29 14:19:16'),
(206, 746, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-001-al-fatiha-2363-3757.zip', 0, '2021-11-29 14:46:08'),
(207, 746, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-002-al-baqara-2364-9644.zip', 0, '2021-11-29 14:46:52'),
(208, 746, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-003-aal-e-imran-2365-7026.zip', 0, '2021-11-29 14:47:32'),
(209, 746, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-004-an-nisa-2366-2606.zip', 0, '2021-11-29 14:51:41'),
(210, 746, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-005-al-maeda-2367-3735.zip', 0, '2021-11-29 14:55:14'),
(211, 746, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-006-al-anaam-2368-5975.mp3', 0, '2021-11-29 14:56:16'),
(212, 746, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-007-al-araf-2369-8872.mp3', 0, '2021-11-29 14:56:51'),
(213, 746, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-008-al-anfal-2370-3935.mp3', 0, '2021-11-29 14:57:12'),
(214, 746, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-009-at-taubah-2371-695.mp3', 0, '2021-11-29 14:57:38'),
(215, 746, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-010-yunus-2372-9522.mp3', 0, '2021-11-29 14:57:57'),
(216, 524, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-011-hud-6559-69.mp3', 0, '2021-11-29 15:09:52'),
(217, 524, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-012-yusuf-6560-1756.mp3', 0, '2021-11-29 15:10:09'),
(218, 524, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-013-ar-rad-6561-1258.mp3', 0, '2021-11-29 15:10:36'),
(219, 524, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-014-ibrahim-6562-67.mp3', 0, '2021-11-29 15:15:00'),
(220, 524, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-015-al-hijr-6563-3025.mp3', 0, '2021-11-29 15:15:24'),
(221, 524, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-016-an-nahl-6564-7702.mp3', 0, '2021-11-29 15:16:32'),
(222, 524, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-017-al-isra-6565-6469.mp3', 0, '2021-11-29 15:16:55'),
(223, 524, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-018-al-kahf-6566-36.mp3', 0, '2021-11-29 15:17:18'),
(224, 524, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-019-maryam-6567-5758.mp3', 0, '2021-11-29 15:17:38'),
(225, 524, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-020-taha-6568-423.mp3', 0, '2021-11-29 15:17:56'),
(226, 524, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-021-al-anbiya-6569-6932.mp3', 0, '2021-11-29 15:18:24'),
(227, 524, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-022-al-hajj-6570-9265.mp3', 0, '2021-11-29 15:18:54'),
(228, 524, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-023-al-mumenoon-6571-9058.mp3', 0, '2021-11-29 15:19:13'),
(229, 524, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-024-an-noor-6572-467.mp3', 0, '2021-11-29 15:19:42'),
(230, 524, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-025-al-furqan-6573-3314.mp3', 0, '2021-11-29 15:20:08'),
(231, 524, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-026-ash-shuara-6574-1838.mp3', 0, '2021-11-29 15:20:30'),
(232, 524, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-027-an-naml-6575-8262.mp3', 0, '2021-11-29 15:20:52'),
(233, 524, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-028-al-qasas-6576-6301.mp3', 0, '2021-11-29 15:21:13'),
(234, 524, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-029-al-ankaboot-6577-7877.mp3', 0, '2021-11-29 15:21:36'),
(235, 524, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-030-ar-room-6578-572.mp3', 0, '2021-11-29 15:21:53'),
(236, 524, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-031-luqman-6579-780.mp3', 0, '2021-11-29 15:22:12'),
(237, 524, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-032-as-sajda-6580-4793.mp3', 0, '2021-11-29 15:22:43'),
(238, 524, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-033-al-ahzab-6581-1196.mp3', 0, '2021-11-29 15:23:30'),
(239, 524, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-034-saba-6582-9380.mp3', 0, '2021-11-29 15:23:50'),
(240, 524, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-035-fatir-6583-1169.mp3', 0, '2021-11-29 15:24:18'),
(241, 524, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-036-ya-seen-6584-6112.mp3', 0, '2021-11-29 15:24:44'),
(242, 524, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-037-as-saaffat-6585-1255.mp3', 0, '2021-11-29 15:25:17'),
(243, 524, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-038-sad-6586-1358.mp3', 0, '2021-11-29 15:25:41'),
(244, 747, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-001-al-fatiha-660-1859.mp3', 0, '2021-11-29 15:25:43'),
(245, 524, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-039-az-zumar-6587-4994.mp3', 0, '2021-11-29 15:25:56'),
(246, 524, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-040-ghafir-6588-946.mp3', 0, '2021-11-29 15:26:10'),
(247, 747, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-002-al-baqara-662-6997.mp3', 0, '2021-11-29 15:26:14'),
(248, 524, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-041-fussilat-6589-3485.mp3', 0, '2021-11-29 15:26:33'),
(249, 747, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-003-aal-e-imran-661-5038.mp3', 0, '2021-11-29 15:26:42'),
(251, 747, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-004-an-nisa-663-5521.mp3', 0, '2021-11-29 15:27:15'),
(252, 524, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-042-ash-shura-6590-5063.mp3', 0, '2021-11-29 15:27:21'),
(253, 747, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-005-al-maeda-719-1378.mp3', 0, '2021-11-29 15:27:48'),
(254, 524, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-043-az-zukhruf-6591-2703.mp3', 0, '2021-11-29 15:27:50'),
(255, 747, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-006-al-anaam-721-6233.mp3', 0, '2021-11-29 15:28:14'),
(256, 524, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-044-ad-dukhan-6592-4744.mp3', 0, '2021-11-29 15:28:19'),
(257, 524, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-045-al-jathiya-6593-5131.mp3', 0, '2021-11-29 15:28:41'),
(258, 747, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-007-al-araf-720-4158.mp3', 0, '2021-11-29 15:29:01'),
(259, 747, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-008-al-anfal-648-6638.mp3', 0, '2021-11-29 15:29:32'),
(260, 524, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-046-al-ahqaf-6594-5729.mp3', 0, '2021-11-29 15:30:01'),
(261, 747, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-009-at-taubah-650-2528.mp3', 0, '2021-11-29 15:30:08'),
(262, 524, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-047-muhammad-6595-2445.mp3', 0, '2021-11-29 15:30:17'),
(263, 747, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-010-yunus-649-4138.mp3', 0, '2021-11-29 15:30:36'),
(264, 524, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-048-al-fath-6596-1599.mp3', 0, '2021-11-29 15:30:38'),
(265, 524, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-049-al-hujraat-6597-5765.mp3', 0, '2021-11-29 15:30:56'),
(266, 524, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-050-qaf-6598-8204.mp3', 0, '2021-11-29 15:31:20'),
(267, 524, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-051-adh-dhariyat-6599-2023.mp3', 0, '2021-11-29 15:31:44'),
(268, 524, 'At tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-052-at-tur-6600-2696.mp3', 0, '2021-11-29 15:32:04'),
(270, 524, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-053-an-najm-6601-7469.mp3', 0, '2021-11-29 15:33:39'),
(271, 524, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-054-al-qamar-6602-1080.mp3', 0, '2021-11-29 15:33:58'),
(272, 524, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-055-al-rahman-6603-3164.mp3', 0, '2021-11-29 15:34:19'),
(273, 524, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-056-al-waqia-6604-783.mp3', 0, '2021-11-29 15:35:04'),
(274, 524, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-057-al-hadid-6605-2918.mp3', 0, '2021-11-29 15:35:55'),
(275, 524, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-058-al-mujadala-6606-1425.mp3', 0, '2021-11-29 15:36:37'),
(276, 524, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-059-al-hashr-6607-7084.mp3', 0, '2021-11-29 15:38:07'),
(277, 524, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-060-al-mumtahina-6608-794.mp3', 0, '2021-11-29 15:39:11'),
(278, 524, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-061-as-saff-6609-1998.mp3', 0, '2021-11-29 15:39:33'),
(279, 524, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-062-al-jumua-6610-7864.mp3', 0, '2021-11-29 15:39:54'),
(280, 524, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-063-al-munafiqoon-6611-5588.mp3', 0, '2021-11-29 15:40:11'),
(281, 524, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-064-at-taghabun-6612-3194.mp3', 0, '2021-11-29 15:41:10'),
(282, 524, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-065-at-talaq-6613-7243.mp3', 0, '2021-11-29 15:41:49'),
(283, 524, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-066-at-tahrim-6614-6757.mp3', 0, '2021-11-29 15:42:16'),
(284, 524, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-067-al-mulk-6615-9307.mp3', 0, '2021-11-29 15:42:35'),
(285, 524, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-068-al-qalam-6616-8498.mp3', 0, '2021-11-29 15:42:54'),
(286, 524, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-069-al-haaqqa-6617-8115.mp3', 0, '2021-11-29 15:43:20'),
(287, 524, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-070-al-maarij-6618-4300.mp3', 0, '2021-11-29 15:44:03'),
(288, 524, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-071-nooh-6619-9445.mp3', 0, '2021-11-29 15:44:55'),
(289, 524, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-072-al-jinn-6620-1600.mp3', 0, '2021-11-29 15:45:53'),
(290, 524, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-073-al-muzzammil-6621-9364.mp3', 0, '2021-11-29 15:46:14'),
(291, 524, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-074-al-muddathir-6622-2148.mp3', 0, '2021-11-29 15:47:00'),
(292, 524, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-075-al-qiyama-6623-6344.mp3', 0, '2021-11-29 15:47:31'),
(293, 524, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-076-al-insan-6624-4494.mp3', 0, '2021-11-29 15:47:51');
INSERT INTO `ebook__audios` (`audio_id`, `file_id`, `audio_title`, `audio_file`, `audio_link`, `audio_position`, `created_at`) VALUES
(294, 524, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-077-al-mursalat-6625-7878.mp3', 0, '2021-11-29 15:48:13'),
(295, 524, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-078-an-naba-6626-8790.mp3', 0, '2021-11-29 15:49:04'),
(296, 524, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-079-an-naziat-6627-6094.mp3', 0, '2021-11-29 15:50:16'),
(297, 524, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-080-abasa-6628-3643.mp3', 0, '2021-11-29 15:50:32'),
(298, 524, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-081-at-takwir-6629-6994.mp3', 0, '2021-11-29 15:50:54'),
(299, 524, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-082-al-infitar-6630-8117.mp3', 0, '2021-11-29 15:51:51'),
(300, 524, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-083-al-mutaffifin-6631-6340.mp3', 0, '2021-11-29 15:52:36'),
(301, 524, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-084-al-inshiqaq-6632-4462.mp3', 0, '2021-11-29 15:53:12'),
(302, 524, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-085-al-burooj-6633-9197.mp3', 0, '2021-11-29 15:53:33'),
(303, 524, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-086-at-tariq-6634-9504.mp3', 0, '2021-11-29 15:53:52'),
(304, 524, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-087-al-ala-6635-5246.mp3', 0, '2021-11-29 15:54:13'),
(305, 524, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-088-al-ghashiya-6636-2115.mp3', 0, '2021-11-29 15:54:38'),
(306, 524, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-089-al-fajr-6637-928.mp3', 0, '2021-11-29 15:54:55'),
(307, 524, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-090-al-balad-6638-2329.mp3', 0, '2021-11-29 15:55:12'),
(308, 524, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-091-ash-shams-6639-2909.mp3', 0, '2021-11-29 15:55:34'),
(309, 524, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-092-al-lail-6640-2927.mp3', 0, '2021-11-29 15:55:51'),
(310, 524, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-093-ad-dhuha-6641-192.mp3', 0, '2021-11-29 15:56:13'),
(311, 524, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-094-ash-sharh-6642-8497.mp3', 0, '2021-11-29 15:56:46'),
(312, 524, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-095-at-tin-6643-6122.mp3', 0, '2021-11-29 15:57:16'),
(313, 524, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-096-al-alaq-6644-7436.mp3', 0, '2021-11-29 15:57:51'),
(314, 524, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-097-al-qadr-6645-5254.mp3', 0, '2021-11-29 15:58:11'),
(315, 524, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-098-al-bayyina-6646-5428.mp3', 0, '2021-11-29 15:58:28'),
(316, 524, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-099-al-zalzala-6647-5934.mp3', 0, '2021-11-29 15:58:52'),
(317, 524, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-100-al-adiyat-6648-3369.mp3', 0, '2021-11-29 15:59:10'),
(318, 524, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-101-al-qaria-6649-9729.mp3', 0, '2021-11-29 15:59:44'),
(319, 524, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-102-at-takathur-6650-5379.mp3', 0, '2021-11-29 16:00:25'),
(320, 524, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-103-al-asr-6651-4969.mp3', 0, '2021-11-29 16:00:53'),
(321, 524, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-104-al-humaza-6652-9092.mp3', 0, '2021-11-29 16:01:23'),
(322, 524, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-105-al-fil-6653-7527.mp3', 0, '2021-11-29 16:01:43'),
(323, 524, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-106-quraish-6654-1313.mp3', 0, '2021-11-29 16:02:00'),
(324, 524, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-107-al-maun-6655-3586.mp3', 0, '2021-11-29 16:02:19'),
(325, 524, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-108-al-kauther-6656-5405.mp3', 0, '2021-11-29 16:03:03'),
(326, 524, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-109-al-kafiroon-6657-103.mp3', 0, '2021-11-29 16:03:20'),
(327, 524, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-110-an-nasr-6658-9680.mp3', 0, '2021-11-29 16:03:40'),
(328, 524, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-111-al-masadd-6659-9048.mp3', 0, '2021-11-29 16:04:05'),
(329, 524, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-112-al-ikhlas-6660-7097.mp3', 0, '2021-11-29 16:04:22'),
(330, 524, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-113-al-falaq-6661-7797.mp3', 0, '2021-11-29 16:04:40'),
(331, 524, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Khalifa-Al-Tunaiji/khalifa-al-tunaiji-114-an-nas-6662-5387.mp3', 0, '2021-11-29 16:04:57'),
(332, 525, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-011-hud-2488-9130.mp3', 0, '2021-11-29 16:05:49'),
(333, 525, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-012-yusuf-2489-8474.mp3', 0, '2021-11-29 16:06:17'),
(334, 525, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-013-ar-rad-2491-2772.mp3', 0, '2021-11-29 16:06:33'),
(335, 525, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-014-ibrahim-2492-7749.mp3', 0, '2021-11-29 16:06:48'),
(336, 525, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-015-al-hijr-2470-1909.mp3', 0, '2021-11-29 16:07:14'),
(337, 525, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-016-an-nahl-2471-4259.mp3', 0, '2021-11-29 16:07:28'),
(338, 525, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-017-al-isra-2472-3691.mp3', 0, '2021-11-29 16:07:46'),
(339, 525, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-018-al-kahf-2473-4268.mp3', 0, '2021-11-29 16:08:16'),
(340, 525, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-019-maryam-2474-1787.mp3', 0, '2021-11-29 16:08:34'),
(341, 525, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-020-taha-2475-5304.mp3', 0, '2021-11-29 16:09:02'),
(342, 525, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-021-al-anbiya-2476-2007.mp3', 0, '2021-11-29 16:09:18'),
(343, 525, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-022-al-hajj-2477-5496.mp3', 0, '2021-11-29 16:10:22'),
(344, 525, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-023-al-mumenoon-2478-8968.mp3', 0, '2021-11-29 16:10:39'),
(345, 525, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-024-an-noor-2504-9547.mp3', 0, '2021-11-29 16:10:59'),
(346, 525, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-025-al-furqan-2505-1879.mp3', 0, '2021-11-29 16:11:44'),
(347, 525, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-026-ash-shuara-2506-2349.mp3', 0, '2021-11-29 16:12:02'),
(348, 525, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-027-an-naml-2507-7986.mp3', 0, '2021-11-29 16:12:29'),
(349, 525, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-028-al-qasas-2508-5955.mp3', 0, '2021-11-29 16:12:51'),
(350, 525, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-029-al-ankaboot-2509-8488.mp3', 0, '2021-11-29 16:13:07'),
(351, 525, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-030-ar-room-2493-2252.mp3', 0, '2021-11-29 16:13:27'),
(352, 525, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-031-luqman-2494-7368.mp3', 0, '2021-11-29 16:13:47'),
(353, 525, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-032-as-sajda-2495-7564.mp3', 0, '2021-11-29 16:14:12'),
(354, 525, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-033-al-ahzab-2496-9296.mp3', 0, '2021-11-29 16:14:45'),
(355, 525, 'As Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-034-saba-2497-305.mp3', 0, '2021-11-29 16:15:06'),
(356, 525, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-035-fatir-2498-2859.mp3', 0, '2021-11-29 16:15:34'),
(357, 525, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-036-ya-seen-2499-6724.mp3', 0, '2021-11-29 16:15:50'),
(358, 525, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-037-as-saaffat-2500-5314.mp3', 0, '2021-11-29 16:16:23'),
(359, 525, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-038-sad-2490-6269.mp3', 0, '2021-11-29 16:16:41'),
(360, 525, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-039-az-zumar-2501-5731.mp3', 0, '2021-11-29 16:17:04'),
(361, 525, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-040-ghafir-2502-2450.mp3', 0, '2021-11-29 16:17:30'),
(362, 525, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-041-fussilat-2503-9794.mp3', 0, '2021-11-29 16:17:50'),
(363, 748, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-001-al-fatiha-3308-825.mp3', 0, '2021-11-29 16:17:53'),
(364, 748, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-002-al-baqara-3299-2096.mp3', 0, '2021-11-29 16:18:16'),
(365, 525, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-042-ash-shura-2567-4860.mp3', 0, '2021-11-29 16:18:23'),
(366, 748, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-003-aal-e-imran-3300-4458.mp3', 0, '2021-11-29 16:18:46'),
(367, 525, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-043-az-zukhruf-2568-924.mp3', 0, '2021-11-29 16:18:56'),
(368, 748, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-004-an-nisa-3301-313.mp3', 0, '2021-11-29 16:19:09'),
(369, 525, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-044-ad-dukhan-2569-2565.mp3', 0, '2021-11-29 16:19:15'),
(370, 748, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-005-al-maeda-3302-8803.mp3', 0, '2021-11-29 16:19:35'),
(371, 525, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-045-al-jathiya-2570-2609.mp3', 0, '2021-11-29 16:19:42'),
(372, 748, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-006-al-anaam-3303-2269.mp3', 0, '2021-11-29 16:20:06'),
(373, 748, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-007-al-araf-3304-147.mp3', 0, '2021-11-29 16:20:36'),
(374, 525, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-046-al-ahqaf-2571-2834.mp3', 0, '2021-11-29 16:20:44'),
(375, 748, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-008-al-anfal-3305-8829.mp3', 0, '2021-11-29 16:21:07'),
(376, 525, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-047-muhammad-2572-6825.mp3', 0, '2021-11-29 16:21:14'),
(377, 748, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-009-at-taubah-3306-9916.mp3', 0, '2021-11-29 16:21:30'),
(378, 525, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-048-al-fath-2573-6300.mp3', 0, '2021-11-29 16:21:33'),
(379, 525, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-049-al-hujraat-2574-7102.mp3', 0, '2021-11-29 16:21:50'),
(380, 748, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-010-yunus-3307-8102.mp3', 0, '2021-11-29 16:22:04'),
(381, 525, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-050-qaf-2575-8612.mp3', 0, '2021-11-29 16:22:12'),
(382, 525, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-051-adh-dhariyat-2576-1604.mp3', 0, '2021-11-29 16:22:30'),
(383, 525, 'At tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-052-at-tur-2577-9109.mp3', 0, '2021-11-29 16:22:47'),
(384, 525, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-053-an-najm-2578-4107.mp3', 0, '2021-11-29 16:23:17'),
(385, 525, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-054-al-qamar-2579-572.mp3', 0, '2021-11-29 16:23:42'),
(386, 525, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-055-al-rahman-8385-7942.mp3', 0, '2021-11-29 16:24:04'),
(387, 525, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-056-al-waqia-2581-5987.mp3', 0, '2021-11-29 16:24:23'),
(388, 525, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-057-al-hadid-2582-2921.mp3', 0, '2021-11-29 16:24:41'),
(389, 525, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-058-al-mujadala-2518-6642.mp3', 0, '2021-11-29 16:25:02'),
(390, 525, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-059-al-hashr-2519-1941.mp3', 0, '2021-11-29 16:25:22'),
(391, 525, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-060-al-mumtahina-2520-1408.mp3', 0, '2021-11-29 16:25:49'),
(392, 525, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-061-as-saff-2521-8894.mp3', 0, '2021-11-29 16:26:15'),
(393, 525, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-062-al-jumua-2522-9309.mp3', 0, '2021-11-29 16:26:32'),
(394, 525, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-063-al-munafiqoon-2523-8972.mp3', 0, '2021-11-29 16:26:53'),
(395, 525, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-064-at-taghabun-2524-8190.mp3', 0, '2021-11-29 16:27:36'),
(396, 525, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-065-at-talaq-2525-9614.mp3', 0, '2021-11-29 16:27:52'),
(397, 525, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-066-at-tahrim-2526-1831.mp3', 0, '2021-11-29 16:28:14'),
(398, 525, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-067-al-mulk-2527-4913.mp3', 0, '2021-11-29 16:29:06'),
(399, 525, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-068-al-qalam-2528-4928.mp3', 0, '2021-11-29 16:29:42'),
(400, 525, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-069-al-haaqqa-2529-8100.mp3', 0, '2021-11-29 16:30:01'),
(401, 525, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-070-al-maarij-2530-644.mp3', 0, '2021-11-29 16:30:30'),
(402, 525, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-071-nooh-2531-7378.mp3', 0, '2021-11-29 16:30:56'),
(403, 525, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-072-al-jinn-2532-7893.mp3', 0, '2021-11-29 16:31:20'),
(404, 525, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-073-al-muzzammil-2533-5504.mp3', 0, '2021-11-29 16:32:07'),
(405, 525, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-074-al-muddathir-2534-8303.mp3', 0, '2021-11-29 16:32:39'),
(406, 525, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-075-al-qiyama-2535-458.mp3', 0, '2021-11-29 16:33:06'),
(407, 525, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-076-al-insan-2536-8114.mp3', 0, '2021-11-29 16:33:23'),
(408, 525, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-077-al-mursalat-2537-1136.mp3', 0, '2021-11-29 16:33:42'),
(409, 525, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-078-an-naba-2538-7283.mp3', 0, '2021-11-29 16:34:00'),
(410, 525, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-079-an-naziat-2539-4414.mp3', 0, '2021-11-29 16:34:16'),
(411, 525, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-080-abasa-2540-8239.mp3', 0, '2021-11-29 16:34:33'),
(412, 525, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-081-at-takwir-2541-5895.mp3', 0, '2021-11-29 16:57:57'),
(413, 525, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-082-al-infitar-2510-6018.mp3', 0, '2021-11-29 16:58:25'),
(414, 525, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-083-al-mutaffifin-2511-7348.mp3', 0, '2021-11-29 16:58:46'),
(415, 525, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-084-al-inshiqaq-2512-1.mp3', 0, '2021-11-29 16:59:17'),
(416, 525, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-085-al-burooj-2513-6590.mp3', 0, '2021-11-29 16:59:35'),
(417, 525, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-086-at-tariq-2514-6003.mp3', 0, '2021-11-29 16:59:53'),
(418, 525, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-087-al-ala-2515-5989.mp3', 0, '2021-11-29 17:00:17'),
(419, 525, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-088-al-ghashiya-2516-9511.mp3', 0, '2021-11-29 17:00:32'),
(420, 525, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-089-al-fajr-2517-2644.mp3', 0, '2021-11-29 17:00:51'),
(421, 525, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-090-al-balad-2542-7930.mp3', 0, '2021-11-29 17:01:18'),
(422, 525, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-091-ash-shams-2543-919.mp3', 0, '2021-11-29 17:01:32'),
(423, 525, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-092-al-lail-2544-1537.mp3', 0, '2021-11-29 17:01:52'),
(424, 525, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-093-ad-dhuha-2545-7239.mp3', 0, '2021-11-29 17:02:08'),
(425, 525, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-094-ash-sharh-2546-9892.mp3', 0, '2021-11-29 17:02:28'),
(426, 525, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-095-at-tin-2547-9727.mp3', 0, '2021-11-29 17:02:59'),
(427, 525, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-096-al-alaq-2548-6853.mp3', 0, '2021-11-29 17:03:22'),
(428, 525, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-097-al-qadr-2549-1722.mp3', 0, '2021-11-29 17:03:43'),
(429, 525, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-098-al-bayyina-2550-4640.mp3', 0, '2021-11-29 17:03:58'),
(430, 525, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-099-al-zalzala-2551-1780.mp3', 0, '2021-11-29 17:04:14'),
(431, 525, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-100-al-adiyat-2552-9823.mp3', 0, '2021-11-29 17:04:47'),
(432, 525, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-101-al-qaria-2553-5284.mp3', 0, '2021-11-29 17:05:03'),
(433, 525, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-102-at-takathur-2554-9159.mp3', 0, '2021-11-29 17:05:21'),
(434, 525, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-103-al-asr-2555-7715.mp3', 0, '2021-11-29 17:05:37'),
(435, 525, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-104-al-humaza-2556-788.mp3', 0, '2021-11-29 17:05:58'),
(436, 525, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-105-al-fil-2557-7461.mp3', 0, '2021-11-29 17:06:18'),
(437, 525, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-106-quraish-2558-8173.mp3', 0, '2021-11-29 17:06:40'),
(438, 525, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-107-al-maun-2559-8902.mp3', 0, '2021-11-29 17:06:59'),
(439, 525, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-108-al-kauther-2560-8598.mp3', 0, '2021-11-29 17:07:17'),
(440, 525, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-109-al-kafiroon-2561-5456.mp3', 0, '2021-11-29 17:07:33'),
(441, 525, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-110-an-nasr-2562-3316.mp3', 0, '2021-11-29 17:07:58'),
(442, 525, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-111-al-masadd-2563-6836.mp3', 0, '2021-11-29 17:08:15'),
(443, 525, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-112-al-ikhlas-2564-1350.mp3', 0, '2021-11-29 17:08:34'),
(444, 525, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-113-al-falaq-2565-9334.mp3', 0, '2021-11-29 17:08:58'),
(445, 525, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Jaber/ali-jaber-114-an-nas-2566-4183.mp3', 0, '2021-11-29 17:09:28'),
(446, 737, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-011-hud-891-8803.mp3', 0, '2021-11-29 17:11:02'),
(447, 737, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-012-yusuf-892-4846.mp3', 0, '2021-11-29 17:11:37'),
(457, 737, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-013-ar-rad-893-8645.mp3', 0, '2021-11-29 17:15:39'),
(460, 737, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-014-ibrahim-894-1729.mp3', 0, '2021-11-29 17:16:44'),
(461, 737, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-015-al-hijr-895-3703.mp3', 0, '2021-11-29 17:17:44'),
(462, 737, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-016-an-nahl-896-4245.mp3', 0, '2021-11-29 17:18:04'),
(463, 737, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-017-al-isra-886-4338.mp3', 0, '2021-11-29 17:18:20'),
(464, 737, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-018-al-kahf-887-4050.mp3', 0, '2021-11-29 17:18:47'),
(465, 737, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-019-maryam-888-1197.mp3', 0, '2021-11-29 17:19:08'),
(466, 737, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-020-taha-889-7187.mp3', 0, '2021-11-29 17:19:28'),
(467, 737, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-021-al-anbiya-890-8248.mp3', 0, '2021-11-29 17:19:49'),
(468, 737, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-022-al-hajj-906-3168.mp3', 0, '2021-11-29 17:20:04'),
(469, 737, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-023-al-mumenoon-907-934.mp3', 0, '2021-11-29 17:20:29'),
(470, 737, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-024-an-noor-908-6214.mp3', 0, '2021-11-29 17:20:45'),
(471, 737, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-025-al-furqan-909-3198.mp3', 0, '2021-11-29 17:21:01'),
(472, 737, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-026-ash-shuara-910-7684.mp3', 0, '2021-11-29 17:21:26'),
(473, 737, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-027-an-naml-911-7251.mp3', 0, '2021-11-29 17:21:59'),
(474, 737, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-028-al-qasas-912-1701.mp3', 0, '2021-11-29 17:22:28'),
(475, 737, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-029-al-ankaboot-913-5840.mp3', 0, '2021-11-29 17:22:45'),
(476, 737, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-030-ar-room-914-8482.mp3', 0, '2021-11-29 17:23:06'),
(477, 737, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-031-luqman-915-4689.mp3', 0, '2021-11-29 17:24:11'),
(478, 737, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-032-as-sajda-916-7090.mp3', 0, '2021-11-29 17:24:29'),
(479, 737, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-033-al-ahzab-917-558.mp3', 0, '2021-11-29 17:25:05'),
(480, 737, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-034-saba-918-2089.mp3', 0, '2021-11-29 17:25:31'),
(481, 737, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-035-fatir-919-8814.mp3', 0, '2021-11-29 17:25:51'),
(482, 737, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-036-ya-seen-920-9031.mp3', 0, '2021-11-29 17:26:13'),
(483, 737, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-037-as-saaffat-921-2502.mp3', 0, '2021-11-29 17:26:35'),
(484, 737, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-038-sad-922-9844.mp3', 0, '2021-11-29 17:26:57'),
(485, 737, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-039-az-zumar-923-4505.mp3', 0, '2021-11-29 17:27:22'),
(486, 737, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-040-ghafir-924-6233.mp3', 0, '2021-11-29 17:28:24'),
(487, 737, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-041-fussilat-925-3966.mp3', 0, '2021-11-29 17:28:46'),
(488, 737, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-042-ash-shura-926-3307.mp3', 0, '2021-11-29 17:29:16'),
(489, 737, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-043-az-zukhruf-927-1078.mp3', 0, '2021-11-29 17:29:35'),
(490, 737, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-044-ad-dukhan-928-2610.mp3', 0, '2021-11-29 17:29:56'),
(491, 737, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-045-al-jathiya-929-5037.mp3', 0, '2021-11-29 17:30:14'),
(492, 737, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-046-al-ahqaf-930-4782.mp3', 0, '2021-11-29 17:30:29'),
(493, 737, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-047-muhammad-931-6855.mp3', 0, '2021-11-29 17:30:48'),
(494, 737, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-048-al-fath-932-9375.mp3', 0, '2021-11-29 17:31:08'),
(495, 737, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-049-al-hujraat-933-8832.mp3', 0, '2021-11-29 17:31:39'),
(496, 737, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-050-qaf-934-8053.mp3', 0, '2021-11-29 17:32:26'),
(497, 737, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-051-adh-dhariyat-935-6562.mp3', 0, '2021-11-29 17:32:46'),
(498, 737, 'At tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-052-at-tur-936-7080.mp3', 0, '2021-11-29 17:33:04'),
(499, 737, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-053-an-najm-937-1220.mp3', 0, '2021-11-29 17:33:28'),
(500, 737, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-054-al-qamar-938-7496.mp3', 0, '2021-11-29 17:33:49'),
(501, 737, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-055-al-rahman-939-3293.mp3', 0, '2021-11-29 17:34:11'),
(502, 737, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-056-al-waqia-940-4418.mp3', 0, '2021-11-29 17:34:27'),
(503, 737, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-057-al-hadid-941-5179.mp3', 0, '2021-11-29 17:34:48'),
(504, 737, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-058-al-mujadala-942-543.mp3', 0, '2021-11-29 17:35:10'),
(505, 737, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-059-al-hashr-943-6120.mp3', 0, '2021-11-29 17:35:35'),
(506, 737, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-060-al-mumtahina-944-1019.mp3', 0, '2021-11-29 17:35:56'),
(507, 737, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-061-as-saff-945-9026.mp3', 0, '2021-11-29 17:36:17'),
(508, 737, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-062-al-jumua-946-809.mp3', 0, '2021-11-29 17:36:34'),
(509, 737, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-063-al-munafiqoon-947-8109.mp3', 0, '2021-11-29 17:37:03'),
(510, 737, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-064-at-taghabun-948-9584.mp3', 0, '2021-11-29 17:37:32'),
(511, 737, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-065-at-talaq-949-2898.mp3', 0, '2021-11-29 17:38:02'),
(512, 737, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-066-at-tahrim-950-6923.mp3', 0, '2021-11-29 17:38:26'),
(513, 737, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-067-al-mulk-951-8615.mp3', 0, '2021-11-29 17:38:44'),
(514, 737, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-068-al-qalam-952-5400.mp3', 0, '2021-11-29 17:39:17'),
(515, 737, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-069-al-haaqqa-953-6767.mp3', 0, '2021-11-29 17:39:48'),
(516, 737, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-070-al-maarij-897-3119.mp3', 0, '2021-11-29 17:40:07'),
(517, 737, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-071-nooh-898-1633.mp3', 0, '2021-11-29 17:40:27'),
(518, 737, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-072-al-jinn-899-732.mp3', 0, '2021-11-29 17:40:46'),
(519, 737, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-073-al-muzzammil-900-6427.mp3', 0, '2021-11-29 17:41:07'),
(520, 737, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-074-al-muddathir-901-2711.mp3', 0, '2021-11-29 17:41:26'),
(521, 737, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-075-al-qiyama-902-3343.mp3', 0, '2021-11-29 17:41:54'),
(522, 737, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-076-al-insan-903-1463.mp3', 0, '2021-11-29 17:42:18'),
(523, 737, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-077-al-mursalat-904-7494.mp3', 0, '2021-11-29 17:42:41'),
(524, 737, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-078-an-naba-905-197.mp3', 0, '2021-11-29 17:43:02'),
(525, 737, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-079-an-naziat-980-838.mp3', 0, '2021-11-29 17:43:34'),
(526, 737, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-080-abasa-981-6325.mp3', 0, '2021-11-29 17:44:10'),
(527, 737, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-081-at-takwir-982-8250.mp3', 0, '2021-11-29 17:44:33'),
(528, 737, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-082-al-infitar-983-7400.mp3', 0, '2021-11-29 17:44:56'),
(529, 737, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-083-al-mutaffifin-984-3404.mp3', 0, '2021-11-29 17:45:22'),
(530, 737, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-084-al-inshiqaq-985-9471.mp3', 0, '2021-11-29 17:45:54'),
(531, 737, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-085-al-burooj-986-4895.mp3', 0, '2021-11-29 17:46:26'),
(532, 737, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-086-at-tariq-987-6698.mp3', 0, '2021-11-29 17:46:52'),
(533, 737, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-087-al-ala-988-3889.mp3', 0, '2021-11-29 17:47:22'),
(534, 737, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-088-al-ghashiya-989-74.mp3', 0, '2021-11-29 17:47:49'),
(535, 737, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-089-al-fajr-954-7241.mp3', 0, '2021-11-29 17:48:10'),
(536, 737, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-090-al-balad-955-8.mp3', 0, '2021-11-29 17:48:28'),
(537, 737, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-091-ash-shams-956-1093.mp3', 0, '2021-11-29 17:48:46'),
(538, 737, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-092-al-lail-957-6267.mp3', 0, '2021-11-29 17:49:06'),
(539, 737, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-093-ad-dhuha-958-817.mp3', 0, '2021-11-29 17:49:45'),
(540, 737, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-094-ash-sharh-959-9203.mp3', 0, '2021-11-29 17:50:04'),
(541, 737, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-095-at-tin-960-5851.mp3', 0, '2021-11-29 17:50:28'),
(542, 737, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-096-al-alaq-961-3716.mp3', 0, '2021-11-29 17:50:51'),
(543, 737, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-097-al-qadr-962-6126.mp3', 0, '2021-11-29 17:51:17'),
(544, 737, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-098-al-bayyina-963-4465.mp3', 0, '2021-11-29 17:51:37'),
(545, 737, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-099-al-zalzala-964-9117.mp3', 0, '2021-11-29 17:51:56'),
(546, 737, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-100-al-adiyat-965-2892.mp3', 0, '2021-11-29 17:52:14'),
(547, 737, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-101-al-qaria-966-7585.mp3', 0, '2021-11-29 17:52:37'),
(548, 737, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-102-at-takathur-967-749.mp3', 0, '2021-11-29 17:52:58'),
(549, 737, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-103-al-asr-968-3624.mp3', 0, '2021-11-29 17:53:37'),
(550, 737, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-104-al-humaza-969-4011.mp3', 0, '2021-11-29 17:54:04'),
(551, 737, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-105-al-fil-970-3461.mp3', 0, '2021-11-29 17:54:25'),
(552, 737, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-106-quraish-971-6967.mp3', 0, '2021-11-29 17:54:48'),
(553, 737, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-107-al-maun-972-5475.mp3', 0, '2021-11-29 17:55:06'),
(554, 737, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-108-al-kauther-973-955.mp3', 0, '2021-11-29 17:55:31'),
(555, 737, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-109-al-kafiroon-974-7165.mp3', 0, '2021-11-29 17:55:48'),
(556, 737, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-110-an-nasr-975-6313.mp3', 0, '2021-11-29 17:56:25'),
(557, 737, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-111-al-masadd-976-7280.mp3', 0, '2021-11-29 17:56:53'),
(558, 737, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-112-al-ikhlas-977-5415.mp3', 0, '2021-11-29 17:57:11'),
(559, 737, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-113-al-falaq-978-3713.mp3', 0, '2021-11-29 17:57:52'),
(560, 737, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Muhammad-Ayyub/mohamed-ayoub-114-an-nas-979-684.mp3', 0, '2021-11-29 17:58:08'),
(561, 738, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-011-hud-8372-977.mp3', 0, '2021-11-29 18:14:53'),
(562, 738, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-012-yusuf-8373-8714.mp3', 0, '2021-11-29 18:15:10'),
(563, 738, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-014-ibrahim-112940-9968.mp3', 0, '2021-11-29 18:15:33'),
(564, 738, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-015-al-hijr-112939-9249.mp3', 0, '2021-11-29 18:15:56'),
(565, 738, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-016-an-nahl-112938-8697.mp3', 0, '2021-11-29 18:16:15'),
(566, 738, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-017-al-isra-8374-8748.mp3', 0, '2021-11-29 18:16:29'),
(567, 738, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-018-al-kahf-8375-5540.mp3', 0, '2021-11-29 18:16:49'),
(568, 738, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-019-maryam-8376-9431.mp3', 0, '2021-11-29 18:17:05'),
(569, 738, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-020-taha-8377-2448.mp3', 0, '2021-11-29 18:17:30'),
(570, 738, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-021-al-anbiya-112937-3504.mp3', 0, '2021-11-29 18:17:54'),
(571, 738, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-022-al-hajj-112936-6107.mp3', 0, '2021-11-29 18:18:15'),
(572, 738, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-023-al-moueminoun-112935-3375.mp3', 0, '2021-11-29 18:19:27'),
(574, 738, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-024-an-noor-8378-5284.mp3', 0, '2021-11-29 18:20:14'),
(575, 738, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-025-al-furqan-8379-9650.mp3', 0, '2021-11-29 18:20:45'),
(576, 738, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-026-as-shua-raa-112945-9611.mp3', 0, '2021-11-29 18:21:14'),
(577, 738, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-027-an-naml-112910-170.mp3', 0, '2021-11-29 18:21:41'),
(578, 738, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-028-al-qasas-112908-3142.mp3', 0, '2021-11-29 18:22:05'),
(579, 738, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-029-al-ankabout-112909-6463.mp3', 0, '2021-11-29 18:22:26'),
(580, 738, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-030-ar-roum-112911-9104.mp3', 0, '2021-11-29 18:22:42'),
(581, 738, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-031-louqman-112912-5279.mp3', 0, '2021-11-29 18:23:03'),
(582, 738, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-032-as-sajda-112913-7072.mp3', 0, '2021-11-29 18:23:23'),
(583, 738, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-033-al-ahzab-112914-1258.mp3', 0, '2021-11-29 18:23:46'),
(584, 738, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-034-saba-112915-3699.mp3', 0, '2021-11-29 18:24:11'),
(585, 738, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-035-fater-112916-9142.mp3', 0, '2021-11-29 18:24:29'),
(587, 738, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-037-as-safaat-112917-8723.mp3', 0, '2021-11-29 18:26:46'),
(588, 738, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-038-sad-112918-4041.mp3', 0, '2021-11-29 18:27:03'),
(589, 738, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-039-az-zoumar-112919-6803.mp3', 0, '2021-11-29 18:27:27'),
(590, 738, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-040-ghafer-112920-6950.mp3', 0, '2021-11-29 18:27:49'),
(591, 738, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-041-foussilat-112921-2601.mp3', 0, '2021-11-29 18:28:05'),
(592, 738, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-042-asshoura-112922-1628.mp3', 0, '2021-11-29 18:28:49'),
(593, 738, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-043-az-zoukhrouf-112923-8416.mp3', 0, '2021-11-29 18:30:02'),
(594, 738, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-044-ad-doukhan-112924-3952.mp3', 0, '2021-11-29 18:30:31'),
(595, 738, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-047-mouhammad-112925-5712.mp3', 0, '2021-11-29 18:30:55'),
(596, 738, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-050-qaf-8380-9020.mp3', 0, '2021-11-29 18:31:29'),
(597, 738, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-051-adh-dhariyat-8381-100.mp3', 0, '2021-11-29 18:31:50'),
(598, 738, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-052-at-tur-8382-5043.mp3', 0, '2021-11-29 18:32:24'),
(599, 738, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-053-an-najm-8383-4804.mp3', 0, '2021-11-29 18:33:07'),
(600, 738, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-054-al-qamar-8384-1038.mp3', 0, '2021-11-29 18:33:29'),
(601, 738, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-055-al-rahman-8385-7942.mp3', 0, '2021-11-29 18:33:47'),
(602, 738, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-056-al-waqia-8386-2607.mp3', 0, '2021-11-29 18:34:06'),
(603, 738, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-057-al-hadid-8387-9181.mp3', 0, '2021-11-29 18:34:29'),
(604, 738, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-058-al-moujadalah-112926-32.mp3', 0, '2021-11-29 18:35:34'),
(605, 738, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-059-al-hashr-112927-1256.mp3', 0, '2021-11-29 18:35:58'),
(606, 738, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-060-al-moumtahina-112928-8335.mp3', 0, '2021-11-29 18:36:18'),
(607, 738, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-061-as-saff-112929-2259.mp3', 0, '2021-11-29 18:36:52'),
(608, 738, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-062-al-joumou-a-112930-4562.mp3', 0, '2021-11-29 18:37:14'),
(609, 738, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-063-al-mounafiqoun-112931-5374.mp3', 0, '2021-11-29 18:37:34');
INSERT INTO `ebook__audios` (`audio_id`, `file_id`, `audio_title`, `audio_file`, `audio_link`, `audio_position`, `created_at`) VALUES
(610, 738, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-064-at-taghaboun-112932-6882.mp3', 0, '2021-11-29 18:37:57'),
(611, 738, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-065-at-talaq-112933-6326.mp3', 0, '2021-11-29 18:38:37'),
(612, 738, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-066-at-tahrim-112934-9169.mp3', 0, '2021-11-29 18:39:05'),
(613, 738, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-067-al-mulk-8388-5840.mp3', 0, '2021-11-29 18:39:28'),
(614, 738, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-068-al-qalam-8389-8221.mp3', 0, '2021-11-29 18:39:51'),
(615, 738, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-069-al-haaqqa-8390-4624.mp3', 0, '2021-11-29 18:40:09'),
(616, 738, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-070-al-maarij-8391-404.mp3', 0, '2021-11-29 18:40:28'),
(617, 738, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-071-nooh-8392-1837.mp3', 0, '2021-11-29 18:40:54'),
(618, 738, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-072-al-jinn-8393-9506.mp3', 0, '2021-11-29 18:41:10'),
(619, 738, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-073-al-muzzammil-8394-8165.mp3', 0, '2021-11-29 18:41:25'),
(620, 738, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-074-al-muddathir-8395-3.mp3', 0, '2021-11-29 18:41:49'),
(621, 738, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-075-al-qiyama-8396-8560.mp3', 0, '2021-11-29 18:42:15'),
(622, 738, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-076-al-insan-8397-3261.mp3', 0, '2021-11-29 18:42:32'),
(623, 738, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-077-al-mursalat-8398-7339.mp3', 0, '2021-11-29 18:42:48'),
(624, 738, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-078-an-naba-8399-1920.mp3', 0, '2021-11-29 18:43:10'),
(625, 738, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-079-an-naziat-8400-1641.mp3', 0, '2021-11-29 18:43:29'),
(626, 738, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-080-abasa-8401-5745.mp3', 0, '2021-11-29 18:43:45'),
(627, 738, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-081-at-takwir-8402-7377.mp3', 0, '2021-11-29 18:44:10'),
(628, 738, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-082-al-infitar-8403-2619.mp3', 0, '2021-11-29 18:44:28'),
(629, 738, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-083-al-mutaffifin-8404-4459.mp3', 0, '2021-11-29 18:44:47'),
(630, 738, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-084-al-inshiqaq-8405-6125.mp3', 0, '2021-11-29 18:45:10'),
(631, 738, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-085-al-burooj-8406-8159.mp3', 0, '2021-11-29 18:45:29'),
(632, 738, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-086-at-tariq-8407-3890.mp3', 0, '2021-11-29 18:45:51'),
(633, 738, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-087-al-ala-8408-8573.mp3', 0, '2021-11-29 18:46:12'),
(634, 738, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-088-al-ghashiya-8409-3443.mp3', 0, '2021-11-29 18:46:32'),
(635, 738, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-089-al-fajr-8410-3539.mp3', 0, '2021-11-29 18:47:02'),
(636, 738, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-090-al-balad-8411-7593.mp3', 0, '2021-11-29 18:47:22'),
(637, 738, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-091-ash-shams-8412-3543.mp3', 0, '2021-11-29 18:47:42'),
(638, 738, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-092-al-lail-8413-8583.mp3', 0, '2021-11-29 18:48:00'),
(639, 738, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-093-ad-dhuha-8414-2396.mp3', 0, '2021-11-29 18:48:19'),
(640, 738, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-094-ash-sharh-8415-4581.mp3', 0, '2021-11-29 18:48:44'),
(641, 738, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-095-at-tin-8416-6524.mp3', 0, '2021-11-29 18:49:07'),
(642, 738, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-096-al-alaq-8417-5003.mp3', 0, '2021-11-29 18:49:48'),
(643, 738, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-097-al-qadr-8418-3761.mp3', 0, '2021-11-29 18:50:09'),
(644, 738, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-098-al-bayyina-8419-2363.mp3', 0, '2021-11-29 18:50:26'),
(645, 738, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-099-al-zalzala-8420-3224.mp3', 0, '2021-11-29 18:50:58'),
(646, 738, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-100-al-adiyat-8421-8386.mp3', 0, '2021-11-29 18:51:57'),
(647, 738, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-101-al-qaria-8422-2768.mp3', 0, '2021-11-29 18:52:24'),
(648, 738, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-102-at-takathur-8423-5061.mp3', 0, '2021-11-29 18:52:47'),
(649, 738, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-103-al-asr-8424-7892.mp3', 0, '2021-11-29 18:53:24'),
(650, 738, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-104-al-humaza-8425-932.mp3', 0, '2021-11-29 18:53:38'),
(651, 738, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-105-al-fil-8426-5065.mp3', 0, '2021-11-29 18:53:55'),
(652, 738, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-106-quraish-8427-6452.mp3', 0, '2021-11-29 18:54:10'),
(653, 738, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-107-al-maun-8428-4194.mp3', 0, '2021-11-29 18:54:29'),
(654, 738, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-108-al-kauther-8429-2403.mp3', 0, '2021-11-29 18:54:45'),
(655, 738, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-109-al-kafiroon-8430-8372.mp3', 0, '2021-11-29 18:55:30'),
(656, 738, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-110-an-nasr-8431-5835.mp3', 0, '2021-11-29 18:55:52'),
(657, 738, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-111-al-masadd-8432-8148.mp3', 0, '2021-11-29 18:56:18'),
(658, 738, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-112-al-ikhlas-8433-5748.mp3', 0, '2021-11-29 18:56:34'),
(659, 738, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-113-al-falaq-8434-8455.mp3', 0, '2021-11-29 18:57:31'),
(660, 738, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Idriss-Abkar/idriss-abkar-114-an-nas-8435-2607.mp3', 0, '2021-11-29 18:57:52'),
(661, 739, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-011-hud-1462-4067.mp3', 0, '2021-11-30 11:39:46'),
(662, 739, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-012-yusuf-1463-8684.mp3', 0, '2021-11-30 11:40:29'),
(663, 739, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-013-ar-rad-1464-2169.mp3', 0, '2021-11-30 11:41:54'),
(664, 739, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-014-ibrahim-1465-2216.mp3', 0, '2021-11-30 11:43:03'),
(665, 739, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-015-al-hijr-1466-9090.mp3', 0, '2021-11-30 11:43:41'),
(666, 739, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-016-an-nahl-1467-8209.mp3', 0, '2021-11-30 11:43:58'),
(667, 739, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-017-al-isra-1443-9583.mp3', 0, '2021-11-30 11:44:20'),
(668, 739, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-018-al-kahf-1444-6109.mp3', 0, '2021-11-30 11:44:40'),
(669, 739, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-019-maryam-1445-6980.mp3', 0, '2021-11-30 11:52:53'),
(670, 739, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-020-taha-1446-6606.mp3', 0, '2021-11-30 11:53:16'),
(671, 739, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-021-al-anbiya-1447-6811.mp3', 0, '2021-11-30 11:53:39'),
(672, 739, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-022-al-hajj-1448-9424.mp3', 0, '2021-11-30 12:06:42'),
(673, 739, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-023-al-mumenoon-1449-2171.mp3', 0, '2021-11-30 12:07:01'),
(674, 739, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-024-an-noor-1450-4181.mp3', 0, '2021-11-30 12:08:06'),
(675, 739, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-025-al-furqan-1451-6933.mp3', 0, '2021-11-30 12:08:27'),
(676, 739, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-026-ash-shuara-1476-8935.mp3', 0, '2021-11-30 12:09:08'),
(677, 739, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-027-an-naml-1477-6370.mp3', 0, '2021-11-30 12:09:26'),
(678, 739, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-028-al-qasas-1478-4880.mp3', 0, '2021-11-30 12:09:40'),
(679, 739, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-029-al-ankaboot-1479-1965.mp3', 0, '2021-11-30 12:10:24'),
(680, 739, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-030-ar-room-1480-1408.mp3', 0, '2021-11-30 12:10:37'),
(681, 739, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-031-luqman-1481-6018.mp3', 0, '2021-11-30 12:10:51'),
(682, 739, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-032-as-sajda-1468-8529.mp3', 0, '2021-11-30 12:11:19'),
(683, 739, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-033-al-ahzab-1469-3314.mp3', 0, '2021-11-30 12:11:55'),
(684, 739, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-034-saba-1470-7347.mp3', 0, '2021-11-30 12:12:22'),
(685, 739, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-035-fatir-1471-5370.mp3', 0, '2021-11-30 12:13:11'),
(686, 739, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-036-ya-seen-1472-3539.mp3', 0, '2021-11-30 12:13:30'),
(687, 739, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-037-as-saaffat-1473-4891.mp3', 0, '2021-11-30 12:13:51'),
(688, 739, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-038-sad-1474-384.mp3', 0, '2021-11-30 12:14:09'),
(689, 739, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-039-az-zumar-1475-4561.mp3', 0, '2021-11-30 12:14:33'),
(690, 739, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-040-ghafir-1490-6108.mp3', 0, '2021-11-30 12:14:46'),
(691, 739, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-041-fussilat-1491-2216.mp3', 0, '2021-11-30 12:14:59'),
(692, 739, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-042-ash-shura-1482-8629.mp3', 0, '2021-11-30 12:15:45'),
(693, 739, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-043-az-zukhruf-1483-4791.mp3', 0, '2021-11-30 12:16:08'),
(694, 739, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-044-ad-dukhan-1484-4385.mp3', 0, '2021-11-30 12:17:22'),
(695, 739, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-045-al-jathiya-1485-845.mp3', 0, '2021-11-30 12:18:03'),
(696, 739, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-046-al-ahqaf-1486-3880.mp3', 0, '2021-11-30 12:18:28'),
(697, 739, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-047-muhammad-1487-2594.mp3', 0, '2021-11-30 12:19:14'),
(698, 739, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-048-al-fath-1488-427.mp3', 0, '2021-11-30 12:19:57'),
(699, 739, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-049-al-hujraat-1489-9990.mp3', 0, '2021-11-30 12:20:13'),
(700, 739, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-050-qaf-1504-9574.mp3', 0, '2021-11-30 12:20:53'),
(701, 739, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-051-adh-dhariyat-1505-7034.mp3', 0, '2021-11-30 12:21:08'),
(702, 739, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-052-at-tur-1506-6801.mp3', 0, '2021-11-30 12:21:24'),
(703, 739, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-053-an-najm-1507-8998.mp3', 0, '2021-11-30 12:21:47'),
(704, 739, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-054-al-qamar-1508-9206.mp3', 0, '2021-11-30 12:22:17'),
(705, 739, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-055-al-rahman-1509-981.mp3', 0, '2021-11-30 12:23:20'),
(706, 739, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-056-al-waqia-1510-5930.mp3', 0, '2021-11-30 12:23:37'),
(707, 739, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-057-al-hadid-1511-8140.mp3', 0, '2021-11-30 12:24:05'),
(708, 739, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-058-al-mujadala-1512-7352.mp3', 0, '2021-11-30 12:24:25'),
(709, 739, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-059-al-hashr-1513-810.mp3', 0, '2021-11-30 12:24:49'),
(710, 739, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-060-al-mumtahina-1514-105.mp3', 0, '2021-11-30 12:25:10'),
(711, 739, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-061-as-saff-1515-8760.mp3', 0, '2021-11-30 12:26:09'),
(712, 739, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-062-al-jumua-1516-6828.mp3', 0, '2021-11-30 12:26:24'),
(713, 739, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-063-al-munafiqoon-1517-8634.mp3', 0, '2021-11-30 12:27:03'),
(714, 739, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-064-at-taghabun-1518-2074.mp3', 0, '2021-11-30 12:27:22'),
(715, 739, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-065-at-talaq-1492-4175.mp3', 0, '2021-11-30 12:28:13'),
(716, 739, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-066-at-tahrim-1493-4004.mp3', 0, '2021-11-30 12:29:01'),
(717, 739, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-067-al-mulk-1494-5614.mp3', 0, '2021-11-30 12:29:21'),
(718, 739, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-068-al-qalam-1495-9066.mp3', 0, '2021-11-30 12:29:42'),
(719, 739, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-069-al-haaqqa-1496-4388.mp3', 0, '2021-11-30 12:30:00'),
(720, 739, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-070-al-maarij-1497-174.mp3', 0, '2021-11-30 12:30:13'),
(721, 739, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-071-nooh-1498-5174.mp3', 0, '2021-11-30 12:30:32'),
(722, 739, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-072-al-jinn-1499-6605.mp3', 0, '2021-11-30 12:30:50'),
(723, 739, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-073-al-muzzammil-1500-8804.mp3', 0, '2021-11-30 12:31:12'),
(724, 739, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-074-al-muddathir-1501-9965.mp3', 0, '2021-11-30 12:32:09'),
(725, 739, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-075-al-qiyama-1502-990.mp3', 0, '2021-11-30 12:32:27'),
(726, 739, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-076-al-insan-1503-9649.mp3', 0, '2021-11-30 12:33:28'),
(727, 739, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-077-al-mursalat-1529-3845.mp3', 0, '2021-11-30 12:34:58'),
(728, 739, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-078-an-naba-1530-3584.mp3', 0, '2021-11-30 12:35:15'),
(729, 739, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-079-an-naziat-1531-76.mp3', 0, '2021-11-30 12:36:13'),
(730, 739, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-080-abasa-1532-3834.mp3', 0, '2021-11-30 12:36:44'),
(731, 739, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-081-at-takwir-1533-3157.mp3', 0, '2021-11-30 12:37:00'),
(732, 739, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-082-al-infitar-1534-7110.mp3', 0, '2021-11-30 12:37:26'),
(733, 739, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-083-al-mutaffifin-1535-634.mp3', 0, '2021-11-30 12:37:51'),
(734, 739, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-084-al-inshiqaq-1536-2155.mp3', 0, '2021-11-30 12:38:16'),
(735, 739, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-085-al-burooj-1537-6315.mp3', 0, '2021-11-30 12:38:52'),
(736, 739, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-086-at-tariq-1538-1616.mp3', 0, '2021-11-30 12:40:11'),
(737, 739, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-087-al-ala-1539-8086.mp3', 0, '2021-11-30 12:40:42'),
(738, 739, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-088-al-ghashiya-1540-4455.mp3', 0, '2021-11-30 12:41:46'),
(739, 739, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-089-al-fajr-1541-8969.mp3', 0, '2021-11-30 12:41:59'),
(740, 739, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-090-al-balad-1542-8896.mp3', 0, '2021-11-30 12:42:20'),
(741, 739, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-091-ash-shams-1543-4560.mp3', 0, '2021-11-30 12:43:28'),
(742, 739, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-092-al-lail-1544-7729.mp3', 0, '2021-11-30 12:43:42'),
(743, 739, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-093-ad-dhuha-1545-5724.mp3', 0, '2021-11-30 12:44:02'),
(744, 739, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-094-ash-sharh-1546-3194.mp3', 0, '2021-11-30 12:44:18'),
(745, 739, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-095-at-tin-1547-9803.mp3', 0, '2021-11-30 12:44:32'),
(746, 739, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-096-al-alaq-1548-9900.mp3', 0, '2021-11-30 12:45:21'),
(747, 739, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-097-al-qadr-1549-7199.mp3', 0, '2021-11-30 12:46:29'),
(748, 739, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-098-al-bayyina-1550-5416.mp3', 0, '2021-11-30 12:46:45'),
(749, 739, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-099-al-zalzala-1551-8965.mp3', 0, '2021-11-30 12:47:58'),
(750, 739, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-100-al-adiyat-1552-1586.mp3', 0, '2021-11-30 12:48:13'),
(751, 739, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-101-al-qaria-1553-5591.mp3', 0, '2021-11-30 12:48:43'),
(752, 739, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-102-at-takathur-1554-4139.mp3', 0, '2021-11-30 12:48:56'),
(753, 739, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-103-al-asr-1555-8192.mp3', 0, '2021-11-30 12:49:28'),
(754, 739, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-104-al-humaza-1556-4395.mp3', 0, '2021-11-30 12:49:43'),
(755, 739, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-105-al-fil-1519-4103.mp3', 0, '2021-11-30 12:50:33'),
(756, 739, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-106-quraish-1520-9182.mp3', 0, '2021-11-30 12:50:49'),
(757, 739, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-107-al-maun-1521-4043.mp3', 0, '2021-11-30 12:51:03'),
(758, 739, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-108-al-kauther-1522-7948.mp3', 0, '2021-11-30 12:51:25'),
(759, 739, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-109-al-kafiroon-1523-2765.mp3', 0, '2021-11-30 12:52:20'),
(760, 739, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-110-an-nasr-1524-4119.mp3', 0, '2021-11-30 12:52:41'),
(761, 739, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-111-al-masadd-1525-1782.mp3', 0, '2021-11-30 12:54:02'),
(762, 739, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-112-al-ikhlas-1526-5923.mp3', 0, '2021-11-30 12:54:40'),
(763, 739, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-113-al-falaq-1527-1229.mp3', 0, '2021-11-30 12:55:01'),
(764, 739, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Ali-Al-huthaify/ali-alhodaifi-114-an-nas-1528-2417.mp3', 0, '2021-11-30 12:55:34'),
(765, 740, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-011-hud-3075-6912.mp3', 0, '2021-11-30 12:56:33'),
(766, 740, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-012-yusuf-3076-1100.mp3', 0, '2021-11-30 12:57:11'),
(768, 740, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-013-ar-rad-3149-58.mp3', 0, '2021-11-30 12:58:20'),
(769, 740, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-014-ibrahim-3150-9396.mp3', 0, '2021-11-30 12:59:01'),
(770, 740, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-015-al-hijr-3151-7763.mp3', 0, '2021-11-30 12:59:38'),
(771, 740, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-016-an-nahl-3152-7165.mp3', 0, '2021-11-30 13:00:06'),
(772, 740, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-017-al-isra-3153-9901.mp3', 0, '2021-11-30 13:00:26'),
(773, 740, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-018-al-kahf-3154-6870.mp3', 0, '2021-11-30 13:01:20'),
(777, 740, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-019-maryam-3155-7193.mp3', 0, '2021-11-30 13:04:30'),
(778, 740, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-020-taha-3156-5331.mp3', 0, '2021-11-30 13:04:50'),
(779, 740, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-021-al-anbiya-3157-2233.mp3', 0, '2021-11-30 13:05:09'),
(780, 740, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-022-al-hajj-3158-2825.mp3', 0, '2021-11-30 13:06:44'),
(781, 740, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-023-al-mumenoon-3159-3489.mp3', 0, '2021-11-30 13:08:37'),
(782, 740, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-024-an-noor-3142-3360.mp3', 0, '2021-11-30 13:09:16'),
(783, 740, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-025-al-furqan-3143-4101.mp3', 0, '2021-11-30 13:10:12'),
(784, 740, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-026-ash-shuara-3144-6777.mp3', 0, '2021-11-30 13:10:45'),
(785, 740, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-027-an-naml-3145-6343.mp3', 0, '2021-11-30 13:11:05'),
(786, 740, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-028-al-qasas-3146-3987.mp3', 0, '2021-11-30 13:11:36'),
(787, 740, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-029-al-ankaboot-3147-5628.mp3', 0, '2021-11-30 13:11:54'),
(788, 740, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-030-ar-room-3148-1379.mp3', 0, '2021-11-30 13:12:24'),
(789, 740, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-031-luqman-3084-1756.mp3', 0, '2021-11-30 13:12:39'),
(790, 740, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-032-as-sajda-3085-7566.mp3', 0, '2021-11-30 13:13:12'),
(791, 740, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-033-al-ahzab-3086-1904.mp3', 0, '2021-11-30 13:14:12'),
(792, 740, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-034-saba-3087-8565.mp3', 0, '2021-11-30 13:14:50'),
(793, 740, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-035-fatir-3088-641.mp3', 0, '2021-11-30 13:15:39'),
(794, 740, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-036-ya-seen-3089-9916.mp3', 0, '2021-11-30 13:15:54'),
(795, 740, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-037-as-saaffat-3090-8348.mp3', 0, '2021-11-30 13:16:20'),
(796, 740, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-038-sad-3091-2693.mp3', 0, '2021-11-30 13:17:04'),
(797, 740, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-039-az-zumar-3092-4192.mp3', 0, '2021-11-30 13:17:43'),
(798, 740, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-040-ghafir-3093-3747.mp3', 0, '2021-11-30 13:18:29'),
(799, 740, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-041-fussilat-3094-938.mp3', 0, '2021-11-30 13:18:52'),
(800, 740, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-042-ash-shura-3095-1103.mp3', 0, '2021-11-30 13:19:29'),
(801, 740, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-043-az-zukhruf-3096-4847.mp3', 0, '2021-11-30 13:19:47'),
(802, 740, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-044-ad-dukhan-3097-997.mp3', 0, '2021-11-30 13:20:18'),
(803, 740, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-045-al-jathiya-3098-499.mp3', 0, '2021-11-30 13:20:40'),
(804, 740, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-046-al-ahqaf-3099-2610.mp3', 0, '2021-11-30 13:22:16'),
(805, 740, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-047-muhammad-3053-8162.mp3', 0, '2021-11-30 13:22:32'),
(806, 740, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-048-al-fath-3054-400.mp3', 0, '2021-11-30 13:23:04'),
(807, 740, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-049-al-hujraat-3055-9480.mp3', 0, '2021-11-30 13:23:34'),
(808, 740, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-050-qaf-3056-5355.mp3', 0, '2021-11-30 13:24:11'),
(809, 740, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-051-adh-dhariyat-3057-5732.mp3', 0, '2021-11-30 13:25:01'),
(810, 740, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-052-at-tur-3058-1713.mp3', 0, '2021-11-30 13:25:57'),
(811, 740, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-053-an-najm-3059-8180.mp3', 0, '2021-11-30 13:26:40'),
(812, 740, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-054-al-qamar-3060-9221.mp3', 0, '2021-11-30 13:27:18'),
(813, 740, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-055-al-rahman-3061-5074.mp3', 0, '2021-11-30 13:27:40'),
(814, 740, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-056-al-waqia-3062-2281.mp3', 0, '2021-11-30 13:28:13'),
(815, 740, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-057-al-hadid-3063-5998.mp3', 0, '2021-11-30 13:28:30'),
(816, 740, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-058-al-mujadala-3064-1417.mp3', 0, '2021-11-30 13:29:07'),
(817, 740, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-059-al-hashr-3065-6268.mp3', 0, '2021-11-30 13:29:59'),
(818, 740, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-060-al-mumtahina-3100-1626.mp3', 0, '2021-11-30 13:30:33'),
(820, 740, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-061-as-saff-3101-2796.mp3', 0, '2021-11-30 13:32:15'),
(821, 740, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-062-al-jumua-3102-8024.mp3', 0, '2021-11-30 13:32:30'),
(822, 740, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-063-al-munafiqoon-3103-9193.mp3', 0, '2021-11-30 13:35:04'),
(823, 740, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-064-at-taghabun-3104-4700.mp3', 0, '2021-11-30 13:35:22'),
(824, 740, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-065-at-talaq-3105-6589.mp3', 0, '2021-11-30 13:35:49'),
(825, 740, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-066-at-tahrim-3106-9835.mp3', 0, '2021-11-30 13:36:11'),
(826, 740, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-067-al-mulk-3107-4615.mp3', 0, '2021-11-30 13:36:45'),
(827, 740, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-068-al-qalam-3108-4936.mp3', 0, '2021-11-30 13:37:21'),
(828, 740, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-069-al-haaqqa-3109-2527.mp3', 0, '2021-11-30 13:37:56'),
(829, 740, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-070-al-maarij-3110-8808.mp3', 0, '2021-11-30 13:38:20'),
(830, 740, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-071-nooh-3111-8683.mp3', 0, '2021-11-30 13:38:43'),
(831, 740, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-072-al-jinn-3112-3466.mp3', 0, '2021-11-30 13:38:57'),
(832, 740, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-073-al-muzzammil-3113-9912.mp3', 0, '2021-11-30 13:39:16'),
(833, 740, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-074-al-muddathir-3114-3530.mp3', 0, '2021-11-30 13:39:35'),
(834, 740, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-075-al-qiyama-3115-4463.mp3', 0, '2021-11-30 13:40:21'),
(835, 740, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-076-al-insan-3116-410.mp3', 0, '2021-11-30 13:40:38'),
(836, 740, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-077-al-mursalat-3117-6140.mp3', 0, '2021-11-30 13:40:56'),
(837, 740, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-078-an-naba-3118-2625.mp3', 0, '2021-11-30 13:41:45'),
(838, 740, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-079-an-naziat-3119-811.mp3', 0, '2021-11-30 13:42:38'),
(839, 740, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-080-abasa-3120-5619.mp3', 0, '2021-11-30 15:39:41'),
(840, 740, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-081-at-takwir-3121-7980.mp3', 0, '2021-11-30 15:40:01'),
(841, 740, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-082-al-infitar-3122-6543.mp3', 0, '2021-11-30 15:40:26'),
(842, 740, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-083-al-mutaffifin-3123-7333.mp3', 0, '2021-11-30 15:42:05'),
(843, 740, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-084-al-inshiqaq-3077-6159.mp3', 0, '2021-11-30 15:42:27'),
(844, 740, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-085-al-burooj-3078-5764.mp3', 0, '2021-11-30 15:42:43'),
(845, 740, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-086-at-tariq-3079-2407.mp3', 0, '2021-11-30 15:43:04'),
(846, 740, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-087-al-ala-3080-8441.mp3', 0, '2021-11-30 15:43:33'),
(847, 740, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-088-al-ghashiya-3081-1761.mp3', 0, '2021-11-30 15:43:54'),
(848, 740, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-089-al-fajr-3082-3824.mp3', 0, '2021-11-30 15:44:16'),
(849, 740, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-090-al-balad-3160-4708.mp3', 0, '2021-11-30 15:44:39'),
(850, 740, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-091-ash-shams-3161-3388.mp3', 0, '2021-11-30 15:45:10'),
(851, 740, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-092-al-lail-3162-6620.mp3', 0, '2021-11-30 15:46:05'),
(852, 740, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-093-ad-dhuha-3163-2732.mp3', 0, '2021-11-30 15:46:37'),
(853, 740, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-094-ash-sharh-3164-2580.mp3', 0, '2021-11-30 15:47:21'),
(854, 740, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-095-at-tin-3165-1320.mp3', 0, '2021-11-30 15:49:30'),
(855, 740, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-096-al-alaq-3166-9322.mp3', 0, '2021-11-30 15:51:30'),
(856, 740, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-097-al-qadr-3124-2414.mp3', 0, '2021-11-30 15:51:57'),
(857, 740, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-098-al-bayyina-3125-5936.mp3', 0, '2021-11-30 15:53:44'),
(858, 740, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-099-al-zalzala-3126-4257.mp3', 0, '2021-11-30 15:54:59'),
(859, 740, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-100-al-adiyat-3127-4942.mp3', 0, '2021-11-30 15:55:31'),
(860, 740, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-101-al-qaria-3128-4743.mp3', 0, '2021-11-30 15:56:11'),
(861, 740, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-102-at-takathur-3129-2940.mp3', 0, '2021-11-30 15:56:31'),
(862, 740, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-103-al-asr-3130-8408.mp3', 0, '2021-11-30 15:57:35'),
(863, 740, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-104-al-humaza-3131-4654.mp3', 0, '2021-11-30 15:59:04'),
(864, 740, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-105-al-fil-3132-6470.mp3', 0, '2021-11-30 15:59:42'),
(865, 740, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-106-quraish-3133-2871.mp3', 0, '2021-11-30 16:00:21'),
(866, 740, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-107-al-maun-3134-5065.mp3', 0, '2021-11-30 16:00:54'),
(867, 740, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-108-al-kauther-3135-2609.mp3', 0, '2021-11-30 16:02:32'),
(868, 740, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-109-al-kafiroon-3136-5496.mp3', 0, '2021-11-30 16:07:35'),
(869, 740, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-110-an-nasr-3137-5877.mp3', 0, '2021-11-30 16:07:58'),
(870, 740, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-111-al-masadd-3138-8229.mp3', 0, '2021-11-30 16:08:32'),
(871, 740, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-112-al-ikhlas-3139-3475.mp3', 0, '2021-11-30 16:09:01'),
(872, 740, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-113-al-falaq-3140-2419.mp3', 0, '2021-11-30 16:09:18'),
(873, 740, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Maher-Al-Mueaqly/maher-al-mueaqly-114-an-nas-3141-5562.mp3', 0, '2021-11-30 16:09:34'),
(874, 742, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-011-hud-620-5234.mp3', 0, '2021-11-30 16:12:45'),
(875, 742, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-012-yusuf-633-2322.mp3', 0, '2021-11-30 16:13:28'),
(876, 742, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-013-ar-rad-594-2947.mp3', 0, '2021-11-30 16:14:06'),
(877, 742, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-014-ibrahim-621-6500.mp3', 0, '2021-11-30 16:15:07'),
(878, 742, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-015-al-hijr-549-5677.mp3', 0, '2021-11-30 16:15:50'),
(879, 742, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-016-an-nahl-586-7114.mp3', 0, '2021-11-30 16:16:49'),
(880, 742, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-017-al-isra-557-5943.mp3', 0, '2021-11-30 16:17:17'),
(881, 742, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-018-al-kahf-562-6778.mp3', 0, '2021-11-30 16:17:34'),
(882, 742, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-019-maryam-623-3663.mp3', 0, '2021-11-30 16:18:10'),
(883, 742, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-020-taha-630-5185.mp3', 0, '2021-11-30 16:18:53'),
(884, 742, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-021-al-anbiya-643-7159.mp3', 0, '2021-11-30 16:26:22'),
(885, 742, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-022-al-hajj-546-7129.mp3', 0, '2021-11-30 16:28:59'),
(886, 742, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-023-al-mumenoon-572-8646.mp3', 0, '2021-11-30 16:30:33'),
(887, 742, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-024-an-noor-593-8808.mp3', 0, '2021-11-30 16:30:54'),
(888, 742, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-025-al-furqan-543-5051.mp3', 0, '2021-11-30 16:31:25'),
(889, 742, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-026-ash-shuara-599-7077.mp3', 0, '2021-11-30 16:54:55'),
(890, 742, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-027-an-naml-588-2689.mp3', 0, '2021-11-30 16:55:17'),
(891, 742, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-028-al-qasas-582-5218.mp3', 0, '2021-11-30 16:56:04'),
(892, 742, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-029-al-ankaboot-645-3421.mp3', 0, '2021-11-30 16:59:14'),
(893, 742, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-030-ar-room-596-5870.mp3', 0, '2021-11-30 16:59:32'),
(894, 742, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-031-luqman-622-8184.mp3', 0, '2021-11-30 17:00:20'),
(895, 742, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-032-as-sajda-603-7496.mp3', 0, '2021-11-30 17:00:59'),
(896, 742, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-033-al-ahzab-639-1792.mp3', 0, '2021-11-30 17:13:59'),
(897, 742, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-034-saba-628-4686.mp3', 0, '2021-11-30 17:14:24'),
(898, 742, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-035-fatir-617-8028.mp3', 0, '2021-11-30 17:16:47'),
(899, 742, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-036-ya-seen-631-8199.mp3', 0, '2021-11-30 17:17:25'),
(900, 742, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-037-as-saaffat-602-3353.mp3', 0, '2021-11-30 17:18:04'),
(901, 742, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-038-sad-629-403.mp3', 0, '2021-11-30 17:18:25'),
(902, 742, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-039-az-zumar-616-4838.mp3', 0, '2021-11-30 17:18:52'),
(903, 742, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-040-ghafir-619-7839.mp3', 0, '2021-11-30 17:19:16'),
(904, 742, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-041-fussilat-618-1266.mp3', 0, '2021-11-30 17:19:32'),
(905, 742, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-042-ash-shura-600-71.mp3', 0, '2021-11-30 17:20:16'),
(906, 742, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-043-az-zukhruf-615-161.mp3', 0, '2021-11-30 17:21:32'),
(907, 742, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-044-ad-dukhan-636-4213.mp3', 0, '2021-11-30 17:21:49'),
(908, 742, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-045-al-jathiya-558-6572.mp3', 0, '2021-11-30 17:22:10'),
(909, 742, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-046-al-ahqaf-638-5838.mp3', 0, '2021-11-30 17:22:31'),
(910, 742, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-047-muhammad-624-1327.mp3', 0, '2021-11-30 17:23:17'),
(911, 742, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-048-al-fath-540-2514.mp3', 0, '2021-11-30 17:23:35'),
(912, 742, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-049-al-hujraat-550-2616.mp3', 0, '2021-11-30 17:24:11');
INSERT INTO `ebook__audios` (`audio_id`, `file_id`, `audio_title`, `audio_file`, `audio_link`, `audio_position`, `created_at`) VALUES
(913, 742, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-050-qaf-626-4990.mp3', 0, '2021-11-30 17:24:51'),
(914, 742, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-051-adh-dhariyat-614-7699.mp3', 0, '2021-11-30 17:25:08'),
(915, 742, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-052-at-tur-612-9776.mp3', 0, '2021-11-30 17:25:31'),
(916, 742, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-053-an-najm-587-2118.mp3', 0, '2021-11-30 17:26:22'),
(917, 742, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-054-al-qamar-580-6345.mp3', 0, '2021-11-30 17:26:54'),
(918, 742, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-055-al-rahman-595-8583.mp3', 0, '2021-11-30 17:27:21'),
(919, 742, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-056-al-waqia-584-7170.mp3', 0, '2021-11-30 17:27:51'),
(920, 742, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-057-al-hadid-545-3422.mp3', 0, '2021-11-30 17:28:17'),
(921, 742, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-059-al-hashr-548-2387.mp3', 0, '2021-11-30 17:29:11'),
(922, 742, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-060-al-mumtahina-573-6843.mp3', 0, '2021-11-30 17:29:58'),
(923, 742, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-061-as-saff-601-7142.mp3', 0, '2021-11-30 17:32:57'),
(924, 742, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-062-al-jumua-560-570.mp3', 0, '2021-11-30 17:44:31'),
(925, 742, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-063-al-munafiqoon-574-4339.mp3', 0, '2021-11-30 17:46:16'),
(926, 742, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-064-at-taghabun-604-8934.mp3', 0, '2021-11-30 17:46:47'),
(927, 742, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-065-at-talaq-608-5257.mp3', 0, '2021-11-30 17:47:07'),
(928, 742, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-066-at-tahrim-605-2366.mp3', 0, '2021-11-30 17:47:37'),
(929, 742, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-067-al-mulk-571-7133.mp3', 0, '2021-11-30 17:47:54'),
(930, 742, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-068-al-qalam-579-8610.mp3', 0, '2021-11-30 17:48:13'),
(931, 742, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-069-al-haaqqa-547-2769.mp3', 0, '2021-11-30 17:49:05'),
(932, 742, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-070-al-maarij-565-1970.mp3', 0, '2021-11-30 17:49:36'),
(933, 742, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-071-nooh-625-6448.mp3', 0, '2021-11-30 17:50:02'),
(934, 742, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-072-al-jinn-559-4035.mp3', 0, '2021-11-30 17:50:25'),
(935, 742, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-073-al-muzzammil-577-2042.mp3', 0, '2021-11-30 17:51:31'),
(936, 742, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-074-al-muddathir-569-6609.mp3', 0, '2021-11-30 17:52:24'),
(937, 742, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-075-al-qiyama-583-8249.mp3', 0, '2021-11-30 17:52:53'),
(938, 742, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-076-al-insan-555-8614.mp3', 0, '2021-11-30 17:53:25'),
(939, 742, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-077-al-mursalat-575-2447.mp3', 0, '2021-11-30 17:53:52'),
(940, 742, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-078-an-naba-585-9576.mp3', 0, '2021-11-30 17:54:49'),
(941, 742, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-079-an-naziat-591-1128.mp3', 0, '2021-11-30 17:55:20'),
(942, 742, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-080-abasa-634-5064.mp3', 0, '2021-11-30 17:55:41'),
(943, 742, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-081-at-takwir-607-4565.mp3', 0, '2021-11-30 17:56:39'),
(944, 742, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-082-al-infitar-554-8828.mp3', 0, '2021-11-30 17:59:59'),
(945, 742, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-083-al-mutaffifin-576-4840.mp3', 0, '2021-11-30 18:00:32'),
(946, 742, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-084-al-inshiqaq-556-6684.mp3', 0, '2021-11-30 18:00:53'),
(947, 742, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-085-al-burooj-537-5172.mp3', 0, '2021-11-30 18:01:13'),
(948, 742, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-086-at-tariq-609-3422.mp3', 0, '2021-11-30 18:01:48'),
(949, 742, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-087-al-ala-640-3853.mp3', 0, '2021-11-30 18:02:54'),
(950, 742, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-088-al-ghashiya-544-8594.mp3', 0, '2021-11-30 18:03:26'),
(951, 742, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-089-al-fajr-538-4694.mp3', 0, '2021-11-30 18:12:02'),
(952, 742, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-090-al-balad-534-6241.mp3', 0, '2021-11-30 18:12:24'),
(953, 742, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-091-ash-shams-597-5437.mp3', 0, '2021-11-30 18:12:55'),
(954, 742, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-092-al-lail-564-1836.mp3', 0, '2021-11-30 18:13:15'),
(955, 742, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-093-ad-dhuha-635-6811.mp3', 0, '2021-11-30 18:13:36'),
(956, 742, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-094-ash-sharh-598-9776.mp3', 0, '2021-11-30 18:15:50'),
(957, 742, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-095-at-tin-611-770.mp3', 0, '2021-11-30 18:16:09'),
(958, 742, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-096-al-alaq-641-2068.mp3', 0, '2021-11-30 18:16:46'),
(959, 742, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-097-al-qadr-578-2142.mp3', 0, '2021-11-30 18:17:43'),
(960, 742, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-098-al-bayyina-535-7903.mp3', 0, '2021-11-30 18:18:30'),
(961, 742, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-099-al-zalzala-613-677.mp3', 0, '2021-11-30 18:19:19'),
(962, 742, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-100-al-adiyat-637-4911.mp3', 0, '2021-11-30 18:19:42'),
(963, 742, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-101-al-qaria-581-9874.mp3', 0, '2021-11-30 18:20:02'),
(964, 742, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-102-at-takathur-606-7126.mp3', 0, '2021-11-30 18:20:27'),
(965, 742, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-103-al-asr-647-8947.mp3', 0, '2021-11-30 18:20:45'),
(966, 742, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-104-al-humaza-551-1916.mp3', 0, '2021-11-30 18:21:15'),
(967, 742, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-105-al-fil-542-3735.mp3', 0, '2021-11-30 18:21:47'),
(968, 742, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-106-quraish-627-7195.mp3', 0, '2021-11-30 18:22:04'),
(969, 742, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-107-al-maun-568-530.mp3', 0, '2021-11-30 18:22:26'),
(970, 742, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-108-al-kauther-563-6182.mp3', 0, '2021-11-30 18:22:48'),
(971, 742, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-109-al-kafiroon-561-6771.mp3', 0, '2021-11-30 18:23:12'),
(972, 742, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-110-an-nasr-590-1658.mp3', 0, '2021-11-30 18:23:41'),
(973, 742, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-111-al-masadd-567-1246.mp3', 0, '2021-11-30 18:24:09'),
(974, 742, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-112-al-ikhlas-552-1336.mp3', 0, '2021-11-30 18:24:26'),
(975, 742, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-113-al-falaq-539-485.mp3', 0, '2021-11-30 18:24:48'),
(976, 742, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-114-an-nas-589-6086.mp3', 0, '2021-11-30 18:25:07'),
(977, 743, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-011-hud-217-9627.mp3', 0, '2021-11-30 18:25:53'),
(978, 743, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-012-yusuf-218-3309.mp3', 0, '2021-11-30 18:26:08'),
(979, 743, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-013-ar-rad-219-7402.mp3', 0, '2021-11-30 18:26:26'),
(980, 743, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-014-ibrahim-220-1454.mp3', 0, '2021-11-30 18:26:50'),
(981, 743, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saud-Shuraim/saoud-shuraim-015-al-hijr-549-5677.mp3', 0, '2021-11-30 18:27:15'),
(982, 743, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-016-an-nahl-222-9869.mp3', 0, '2021-11-30 18:27:55'),
(983, 743, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-017-al-isra-223-4286.mp3', 0, '2021-11-30 18:28:22'),
(984, 743, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-018-al-kahf-205-2580.mp3', 0, '2021-11-30 18:28:39'),
(985, 743, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-019-maryam-206-1179.mp3', 0, '2021-11-30 18:28:53'),
(986, 743, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-020-taha-207-7025.mp3', 0, '2021-11-30 18:29:27'),
(987, 743, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-021-al-anbiya-208-3145.mp3', 0, '2021-11-30 18:29:45'),
(988, 743, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-022-al-hajj-209-7062.mp3', 0, '2021-11-30 18:30:27'),
(989, 743, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-023-al-mumenoon-210-5565.mp3', 0, '2021-11-30 18:30:47'),
(990, 743, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-024-an-noor-211-4342.mp3', 0, '2021-11-30 18:31:47'),
(991, 743, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-025-al-furqan-212-6783.mp3', 0, '2021-11-30 18:32:30'),
(992, 743, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-026-ash-shuara-213-1659.mp3', 0, '2021-11-30 18:33:05'),
(993, 743, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-027-an-naml-214-237.mp3', 0, '2021-11-30 18:33:37'),
(994, 743, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-028-al-qasas-215-2236.mp3', 0, '2021-11-30 18:34:25'),
(995, 743, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-029-al-ankaboot-216-3350.mp3', 0, '2021-11-30 18:34:54'),
(996, 743, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-030-ar-room-119-97.mp3', 0, '2021-11-30 18:35:25'),
(997, 743, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-031-luqman-120-7673.mp3', 0, '2021-11-30 18:35:39'),
(998, 743, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-032-as-sajda-121-2593.mp3', 0, '2021-11-30 18:36:08'),
(999, 743, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-033-al-ahzab-122-3142.mp3', 0, '2021-11-30 18:36:28'),
(1000, 743, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-034-saba-123-984.mp3', 0, '2021-11-30 18:37:01'),
(1001, 743, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-035-fatir-124-2879.mp3', 0, '2021-11-30 18:37:24'),
(1003, 743, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-036-ya-seen-125-9063.mp3', 0, '2021-11-30 18:38:32'),
(1004, 743, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-037-as-saaffat-126-1270.mp3', 0, '2021-11-30 18:38:52'),
(1005, 743, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-038-sad-127-5910.mp3', 0, '2021-11-30 18:39:35'),
(1015, 743, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-039-az-zumar-128-7063.mp3', 0, '2021-11-30 18:47:51'),
(1016, 743, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-040-ghafir-129-49.mp3', 0, '2021-11-30 18:48:08'),
(1017, 743, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-041-fussilat-130-3217.mp3', 0, '2021-11-30 18:48:28'),
(1018, 743, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-042-ash-shura-131-6689.mp3', 0, '2021-11-30 18:49:01'),
(1019, 743, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-043-az-zukhruf-132-3358.mp3', 0, '2021-11-30 18:49:24'),
(1020, 743, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-044-ad-dukhan-133-619.mp3', 0, '2021-11-30 18:49:41'),
(1021, 743, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-045-al-jathiya-134-8144.mp3', 0, '2021-11-30 18:50:55'),
(1022, 743, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-046-al-ahqaf-135-551.mp3', 0, '2021-11-30 18:51:15'),
(1023, 743, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-047-muhammad-136-487.mp3', 0, '2021-11-30 18:51:31'),
(1024, 743, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-048-al-fath-137-2430.mp3', 0, '2021-11-30 18:51:52'),
(1025, 743, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-049-al-hujraat-138-3131.mp3', 0, '2021-11-30 18:52:14'),
(1026, 743, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-050-qaf-139-1667.mp3', 0, '2021-11-30 18:53:19'),
(1027, 743, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-051-adh-dhariyat-140-9456.mp3', 0, '2021-11-30 18:53:35'),
(1028, 743, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-052-at-tur-141-6276.mp3', 0, '2021-11-30 18:53:56'),
(1029, 743, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-053-an-najm-142-8730.mp3', 0, '2021-11-30 18:54:46'),
(1030, 743, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-054-al-qamar-143-5020.mp3', 0, '2021-11-30 18:55:19'),
(1031, 743, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-055-al-rahman-144-617.mp3', 0, '2021-11-30 18:55:38'),
(1032, 743, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-056-al-waqia-145-5512.mp3', 0, '2021-11-30 18:56:32'),
(1033, 743, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-057-al-hadid-146-6680.mp3', 0, '2021-11-30 18:56:53'),
(1034, 743, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-058-al-mujadala-147-855.mp3', 0, '2021-11-30 18:58:15'),
(1035, 743, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-059-al-hashr-148-7749.mp3', 0, '2021-11-30 18:58:57'),
(1036, 743, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-060-al-mumtahina-149-29.mp3', 0, '2021-11-30 19:01:32'),
(1037, 743, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-061-as-saff-150-952.mp3', 0, '2021-11-30 19:02:11'),
(1038, 743, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-062-al-jumua-151-5421.mp3', 0, '2021-11-30 19:04:34'),
(1039, 743, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-063-al-munafiqoon-152-2623.mp3', 0, '2021-11-30 19:05:35'),
(1040, 743, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-064-at-taghabun-153-4095.mp3', 0, '2021-11-30 19:06:05'),
(1041, 743, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-065-at-talaq-154-6405.mp3', 0, '2021-11-30 19:06:44'),
(1042, 743, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-066-at-tahrim-155-5502.mp3', 0, '2021-11-30 19:07:20'),
(1043, 743, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-067-al-mulk-156-3158.mp3', 0, '2021-11-30 19:08:08'),
(1044, 743, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-068-al-qalam-157-7675.mp3', 0, '2021-11-30 19:08:41'),
(1045, 743, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-069-al-haaqqa-158-1412.mp3', 0, '2021-11-30 19:09:22'),
(1046, 743, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-070-al-maarij-159-220.mp3', 0, '2021-11-30 19:10:43'),
(1047, 743, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-071-nooh-160-7724.mp3', 0, '2021-11-30 19:11:18'),
(1048, 743, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-072-al-jinn-161-4629.mp3', 0, '2021-11-30 19:12:02'),
(1049, 743, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-073-al-muzzammil-162-6909.mp3', 0, '2021-11-30 19:12:41'),
(1050, 743, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-074-al-muddathir-163-1082.mp3', 0, '2021-11-30 19:13:03'),
(1051, 743, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-075-al-qiyama-164-5249.mp3', 0, '2021-11-30 19:13:31'),
(1052, 743, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-076-al-insan-165-5053.mp3', 0, '2021-11-30 19:14:15'),
(1053, 743, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-077-al-mursalat-166-1633.mp3', 0, '2021-11-30 19:14:37'),
(1054, 743, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-078-an-naba-167-5737.mp3', 0, '2021-11-30 19:15:13'),
(1055, 743, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-079-an-naziat-168-7483.mp3', 0, '2021-11-30 19:15:57'),
(1056, 743, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-080-abasa-169-4765.mp3', 0, '2021-11-30 19:16:14'),
(1057, 743, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-081-at-takwir-170-7404.mp3', 0, '2021-11-30 19:16:34'),
(1058, 743, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-082-al-infitar-171-6938.mp3', 0, '2021-11-30 19:16:54'),
(1059, 743, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-083-al-mutaffifin-172-1041.mp3', 0, '2021-11-30 19:17:35'),
(1060, 743, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-084-al-inshiqaq-173-6133.mp3', 0, '2021-11-30 19:17:56'),
(1061, 743, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-085-al-burooj-174-1957.mp3', 0, '2021-11-30 19:18:28'),
(1062, 743, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-086-at-tariq-175-1659.mp3', 0, '2021-11-30 19:19:03'),
(1063, 743, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-087-al-ala-176-1645.mp3', 0, '2021-11-30 19:19:44'),
(1064, 743, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-088-al-ghashiya-177-8637.mp3', 0, '2021-11-30 19:20:01'),
(1065, 743, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-089-al-fajr-178-2514.mp3', 0, '2021-11-30 19:20:16'),
(1066, 743, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-090-al-balad-179-9394.mp3', 0, '2021-11-30 19:20:34'),
(1067, 743, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-091-ash-shams-180-8667.mp3', 0, '2021-11-30 19:20:50'),
(1068, 743, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-092-al-lail-181-3467.mp3', 0, '2021-11-30 19:21:21'),
(1069, 743, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-093-ad-dhuha-182-4815.mp3', 0, '2021-11-30 19:21:44'),
(1070, 743, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-094-ash-sharh-183-1290.mp3', 0, '2021-11-30 19:22:14'),
(1071, 743, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-095-at-tin-184-7563.mp3', 0, '2021-11-30 19:22:29'),
(1072, 743, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-096-al-alaq-185-1219.mp3', 0, '2021-11-30 19:22:43'),
(1073, 743, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-097-al-qadr-186-6793.mp3', 0, '2021-11-30 19:23:00'),
(1074, 743, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-098-al-bayyina-187-720.mp3', 0, '2021-11-30 19:23:15'),
(1075, 743, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-099-al-zalzala-188-8895.mp3', 0, '2021-11-30 19:23:40'),
(1076, 743, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-100-al-adiyat-189-8206.mp3', 0, '2021-11-30 19:23:56'),
(1077, 743, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-101-al-qaria-190-940.mp3', 0, '2021-11-30 19:24:23'),
(1078, 743, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-102-at-takathur-191-6619.mp3', 0, '2021-11-30 19:24:43'),
(1079, 743, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-103-al-asr-192-2834.mp3', 0, '2021-11-30 19:25:04'),
(1080, 743, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-104-al-humaza-193-7850.mp3', 0, '2021-11-30 19:25:18'),
(1081, 743, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-105-al-fil-194-7701.mp3', 0, '2021-11-30 19:25:32'),
(1082, 743, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-106-quraish-195-8084.mp3', 0, '2021-11-30 19:25:48'),
(1083, 743, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-107-al-maun-196-2902.mp3', 0, '2021-11-30 19:26:07'),
(1084, 743, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-108-al-kauther-197-9335.mp3', 0, '2021-11-30 19:26:23'),
(1085, 743, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-109-al-kafiroon-198-3820.mp3', 0, '2021-11-30 19:26:39'),
(1086, 743, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-110-an-nasr-199-384.mp3', 0, '2021-11-30 19:26:57'),
(1087, 743, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-111-al-masadd-200-4099.mp3', 0, '2021-11-30 19:27:19'),
(1088, 743, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-112-al-ikhlas-201-1223.mp3', 0, '2021-11-30 19:27:36'),
(1089, 743, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-113-al-falaq-202-7322.mp3', 0, '2021-11-30 19:27:52'),
(1090, 743, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/KSA/Saad-El-Ghamidi/saad-el-ghamidi-114-an-nas-203-5140.mp3', 0, '2021-11-30 19:28:06'),
(1091, 745, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-011-hud-2035-3204.mp3', 0, '2021-11-30 19:40:41'),
(1092, 745, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-012-yusuf-2036-4074.mp3', 0, '2021-11-30 19:40:55'),
(1093, 745, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-013-ar-rad-2037-8214.mp3', 0, '2021-11-30 19:41:14'),
(1094, 745, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-014-ibrahim-2038-6089.mp3', 0, '2021-11-30 19:41:39'),
(1095, 745, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-015-al-hijr-2039-8116.mp3', 0, '2021-11-30 19:42:14'),
(1096, 745, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-016-an-nahl-2040-9907.mp3', 0, '2021-11-30 19:43:05'),
(1097, 745, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-017-al-isra-2041-9639.mp3', 0, '2021-11-30 19:43:50'),
(1098, 745, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-018-al-kahf-2042-97.mp3', 0, '2021-11-30 19:44:08'),
(1099, 745, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-019-maryam-2043-5756.mp3', 0, '2021-11-30 19:44:25'),
(1100, 745, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-020-taha-2044-5009.mp3', 0, '2021-11-30 19:44:48'),
(1101, 745, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-021-al-anbiya-2045-7953.mp3', 0, '2021-11-30 19:45:05'),
(1102, 745, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-022-al-hajj-2046-8386.mp3', 0, '2021-11-30 19:45:23'),
(1103, 745, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-023-al-mumenoon-2047-9864.mp3', 0, '2021-11-30 19:45:45'),
(1104, 745, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-024-an-noor-2048-6698.mp3', 0, '2021-11-30 19:46:15'),
(1105, 745, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-025-al-furqan-2049-6082.mp3', 0, '2021-11-30 19:46:35'),
(1106, 745, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-026-ash-shuara-2050-7437.mp3', 0, '2021-11-30 19:47:09'),
(1107, 745, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-027-an-naml-2051-9852.mp3', 0, '2021-11-30 19:47:25'),
(1108, 745, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-028-al-qasas-2052-4474.mp3', 0, '2021-11-30 19:48:15'),
(1109, 745, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-029-al-ankaboot-2013-2809.mp3', 0, '2021-11-30 19:48:54'),
(1110, 745, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-030-ar-room-2014-3551.mp3', 0, '2021-11-30 19:49:12'),
(1111, 745, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-031-luqman-2015-72.mp3', 0, '2021-11-30 19:49:33'),
(1112, 745, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-032-as-sajda-2016-7103.mp3', 0, '2021-11-30 19:50:10'),
(1113, 745, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-033-al-ahzab-2017-2312.mp3', 0, '2021-11-30 19:50:29'),
(1114, 745, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-034-saba-2018-6393.mp3', 0, '2021-11-30 19:50:47'),
(1115, 745, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-035-fatir-2019-1980.mp3', 0, '2021-11-30 19:51:28'),
(1116, 745, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-036-ya-seen-2020-3004.mp3', 0, '2021-11-30 19:52:32'),
(1117, 745, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-037-as-saaffat-2021-8757.mp3', 0, '2021-11-30 19:52:54'),
(1118, 750, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-001-al-fatiha-30-7477.mp3', 0, '2021-11-30 20:52:29'),
(1119, 750, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-002-al-baqara-31-6337.mp3', 0, '2021-11-30 20:52:54'),
(1120, 750, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-003-aal-e-imran-32-3412.mp3', 0, '2021-11-30 20:53:22'),
(1121, 750, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-004-an-nisa-33-2664.mp3', 0, '2021-11-30 20:53:43'),
(1122, 750, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-005-al-maeda-34-6163.mp3', 0, '2021-11-30 20:54:37'),
(1123, 750, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-006-al-anaam-35-1925.mp3', 0, '2021-11-30 20:55:01'),
(1124, 750, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-007-al-araf-36-3799.mp3', 0, '2021-11-30 20:55:44'),
(1125, 750, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-008-al-anfal-37-8182.mp3', 0, '2021-11-30 20:56:10'),
(1126, 750, 'At Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-009-at-taubah-38-7538.mp3', 0, '2021-11-30 20:56:35'),
(1127, 750, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-010-yunus-39-1075.mp3', 0, '2021-11-30 20:56:54'),
(1128, 750, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-011-hud-40-905.mp3', 0, '2021-11-30 20:57:26'),
(1129, 750, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-012-yusuf-41-7958.mp3', 0, '2021-11-30 20:57:44'),
(1130, 750, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-013-ar-rad-42-7411.mp3', 0, '2021-11-30 20:59:49'),
(1131, 750, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-014-ibrahim-43-7856.mp3', 0, '2021-11-30 21:00:26'),
(1132, 750, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-015-al-hijr-44-2240.mp3', 0, '2021-11-30 21:01:00'),
(1133, 750, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-016-an-nahl-45-5110.mp3', 0, '2021-11-30 21:02:26'),
(1134, 750, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-017-al-isra-46-1901.mp3', 0, '2021-11-30 21:02:58'),
(1135, 750, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-018-al-kahf-47-6010.mp3', 0, '2021-11-30 21:03:26'),
(1136, 750, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-019-maryam-48-5396.mp3', 0, '2021-11-30 21:03:48'),
(1137, 750, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-020-taha-49-7801.mp3', 0, '2021-11-30 21:05:09'),
(1138, 750, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-021-al-anbiya-50-7355.mp3', 0, '2021-11-30 21:05:43'),
(1139, 750, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-022-al-hajj-51-4172.mp3', 0, '2021-11-30 21:07:40'),
(1140, 750, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-023-al-mumenoon-52-3477.mp3', 0, '2021-11-30 21:08:20'),
(1141, 750, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-024-an-noor-53-116.mp3', 0, '2021-11-30 21:08:55'),
(1142, 750, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-025-al-furqan-54-7913.mp3', 0, '2021-11-30 21:09:23'),
(1143, 750, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-026-ash-shuara-55-8763.mp3', 0, '2021-11-30 21:11:03'),
(1144, 750, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-027-an-naml-56-8375.mp3', 0, '2021-11-30 21:11:26'),
(1145, 750, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-028-al-qasas-57-4269.mp3', 0, '2021-11-30 21:11:58'),
(1146, 750, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-029-al-ankaboot-58-5689.mp3', 0, '2021-11-30 21:12:28'),
(1147, 750, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-030-ar-room-59-3804.mp3', 0, '2021-11-30 21:12:57'),
(1148, 750, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-031-luqman-60-6369.mp3', 0, '2021-11-30 21:15:00'),
(1149, 750, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-032-as-sajda-61-3165.mp3', 0, '2021-11-30 21:15:32'),
(1150, 750, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-033-al-ahzab-62-141.mp3', 0, '2021-11-30 21:16:05'),
(1151, 750, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-034-saba-63-9781.mp3', 0, '2021-11-30 21:16:31'),
(1152, 750, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-035-fatir-64-5829.mp3', 0, '2021-11-30 21:17:01'),
(1153, 750, 'Yaseen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-036-ya-seen-65-6305.mp3', 0, '2021-11-30 21:18:47'),
(1154, 750, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-037-as-saaffat-66-1705.mp3', 0, '2021-11-30 21:19:20'),
(1155, 750, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-038-sad-67-9629.mp3', 0, '2021-11-30 21:19:37'),
(1156, 750, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-039-az-zumar-68-4486.mp3', 0, '2021-11-30 21:20:15'),
(1157, 750, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-040-ghafir-69-9244.mp3', 0, '2021-11-30 21:21:09'),
(1158, 745, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-038-sad-2022-9870.mp3', 0, '2021-12-01 13:28:05'),
(1159, 745, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-039-az-zumar-2023-7335.mp3', 0, '2021-12-01 15:03:40'),
(1160, 745, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-040-ghafir-2024-8854.mp3', 0, '2021-12-01 15:03:56'),
(1161, 745, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-041-fussilat-2067-1329.mp3', 0, '2021-12-01 15:04:48'),
(1162, 745, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-042-ash-shura-2068-539.mp3', 0, '2021-12-01 15:05:16'),
(1163, 745, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-043-az-zukhruf-2069-2927.mp3', 0, '2021-12-01 15:06:11'),
(1164, 745, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-044-ad-dukhan-2070-9544.mp3', 0, '2021-12-01 15:07:20'),
(1165, 745, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-045-al-jathiya-2071-6628.mp3', 0, '2021-12-01 15:07:43'),
(1166, 745, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-046-al-ahqaf-2072-1043.mp3', 0, '2021-12-01 15:08:05'),
(1167, 745, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-047-muhammad-2073-9450.mp3', 0, '2021-12-01 15:08:20'),
(1168, 745, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-048-al-fath-2074-6266.mp3', 0, '2021-12-01 15:08:57'),
(1169, 745, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-049-al-hujraat-2075-1140.mp3', 0, '2021-12-01 15:09:11'),
(1170, 745, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-050-qaf-2076-5206.mp3', 0, '2021-12-01 15:09:27'),
(1171, 745, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-051-adh-dhariyat-2077-1275.mp3', 0, '2021-12-01 15:09:44'),
(1172, 745, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-052-at-tur-2078-9094.mp3', 0, '2021-12-01 15:10:00'),
(1173, 745, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-053-an-najm-2079-3592.mp3', 0, '2021-12-01 15:10:23'),
(1174, 745, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-054-al-qamar-2080-1138.mp3', 0, '2021-12-01 15:10:39'),
(1175, 745, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-055-al-rahman-2081-5791.mp3', 0, '2021-12-01 15:10:54'),
(1176, 745, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-056-al-waqia-2082-9675.mp3', 0, '2021-12-01 15:11:09'),
(1177, 745, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-057-al-hadid-2083-8576.mp3', 0, '2021-12-01 15:11:25'),
(1178, 745, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-058-al-mujadala-2084-5643.mp3', 0, '2021-12-01 15:11:43'),
(1179, 745, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-059-al-hashr-2085-4149.mp3', 0, '2021-12-01 15:12:07'),
(1180, 745, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-060-al-mumtahina-2086-1384.mp3', 0, '2021-12-01 15:12:30'),
(1181, 745, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-061-as-saff-2087-9194.mp3', 0, '2021-12-01 15:12:49'),
(1182, 745, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-062-al-jumua-2088-4221.mp3', 0, '2021-12-01 15:13:14'),
(1183, 745, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-063-al-munafiqoon-2089-8488.mp3', 0, '2021-12-01 15:13:33'),
(1184, 745, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-064-at-taghabun-2090-1506.mp3', 0, '2021-12-01 15:13:47'),
(1185, 745, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-065-at-talaq-2091-613.mp3', 0, '2021-12-01 15:14:03'),
(1186, 745, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-066-at-tahrim-2053-468.mp3', 0, '2021-12-01 15:14:17'),
(1187, 745, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-067-al-mulk-2054-4510.mp3', 0, '2021-12-01 15:14:37'),
(1188, 745, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-068-al-qalam-2055-9371.mp3', 0, '2021-12-01 15:14:55'),
(1189, 745, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-069-al-haaqqa-2056-338.mp3', 0, '2021-12-01 15:15:12'),
(1190, 745, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-070-al-maarij-2057-1845.mp3', 0, '2021-12-01 15:15:27'),
(1191, 745, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-071-nooh-2059-8224.mp3', 0, '2021-12-01 15:15:41'),
(1192, 745, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-072-al-jinn-2060-1668.mp3', 0, '2021-12-01 15:16:19'),
(1193, 745, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-073-al-muzzammil-2061-2385.mp3', 0, '2021-12-01 15:16:42'),
(1194, 745, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-074-al-muddathir-2062-1151.mp3', 0, '2021-12-01 15:16:57'),
(1195, 745, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-075-al-qiyama-2064-1211.mp3', 0, '2021-12-01 15:17:13'),
(1196, 745, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-076-al-insan-2065-9013.mp3', 0, '2021-12-01 15:17:37'),
(1197, 745, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-077-al-mursalat-2066-2194.mp3', 0, '2021-12-01 15:17:57'),
(1198, 745, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-078-an-naba-2101-660.mp3', 0, '2021-12-01 15:18:27'),
(1199, 745, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-079-an-naziat-2102-5279.mp3', 0, '2021-12-01 15:18:58'),
(1200, 745, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-080-abasa-2103-3335.mp3', 0, '2021-12-01 15:19:41'),
(1201, 745, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-081-at-takwir-2104-5867.mp3', 0, '2021-12-01 15:25:13'),
(1202, 745, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-082-al-infitar-2105-6555.mp3', 0, '2021-12-01 15:25:36'),
(1203, 745, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-083-al-mutaffifin-2106-2428.mp3', 0, '2021-12-01 15:26:05'),
(1204, 745, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-084-al-inshiqaq-2107-9459.mp3', 0, '2021-12-01 15:26:30'),
(1205, 745, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-085-al-burooj-2108-7693.mp3', 0, '2021-12-01 15:26:51'),
(1206, 745, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-086-at-tariq-2109-8220.mp3', 0, '2021-12-01 15:28:14'),
(1207, 745, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-087-al-ala-2110-9134.mp3', 0, '2021-12-01 15:28:40'),
(1208, 745, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-088-al-ghashiya-2111-6269.mp3', 0, '2021-12-01 15:29:09'),
(1209, 745, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-089-al-fajr-2112-3862.mp3', 0, '2021-12-01 15:29:55'),
(1210, 745, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-090-al-balad-2113-3282.mp3', 0, '2021-12-01 15:30:13'),
(1211, 745, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-091-ash-shams-2114-7654.mp3', 0, '2021-12-01 15:30:32'),
(1212, 745, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-092-al-lail-2115-3056.mp3', 0, '2021-12-01 15:30:49'),
(1213, 745, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-093-ad-dhuha-2116-7503.mp3', 0, '2021-12-01 15:31:09'),
(1214, 745, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-094-ash-sharh-2117-6141.mp3', 0, '2021-12-01 15:31:27'),
(1215, 745, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-095-at-tin-2118-4562.mp3', 0, '2021-12-01 15:31:47'),
(1216, 745, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-096-al-alaq-2119-8117.mp3', 0, '2021-12-01 15:32:03');
INSERT INTO `ebook__audios` (`audio_id`, `file_id`, `audio_title`, `audio_file`, `audio_link`, `audio_position`, `created_at`) VALUES
(1217, 745, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-097-al-qadr-2120-6610.mp3', 0, '2021-12-01 15:32:24'),
(1218, 745, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-098-al-bayyina-2121-9073.mp3', 0, '2021-12-01 15:32:47'),
(1219, 745, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-099-al-zalzala-2122-7487.mp3', 0, '2021-12-01 15:33:08'),
(1220, 745, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-100-al-adiyat-2123-6948.mp3', 0, '2021-12-01 15:33:27'),
(1221, 745, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-101-al-qaria-2124-918.mp3', 0, '2021-12-01 15:34:36'),
(1222, 745, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-102-at-takathur-2125-5710.mp3', 0, '2021-12-01 15:35:19'),
(1223, 745, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-103-al-asr-2126-8616.mp3', 0, '2021-12-01 15:35:44'),
(1224, 745, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-104-al-humaza-2127-3303.mp3', 0, '2021-12-01 15:36:02'),
(1225, 745, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-105-al-fil-2128-6862.mp3', 0, '2021-12-01 15:36:25'),
(1226, 745, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-106-quraish-2092-9827.mp3', 0, '2021-12-01 15:36:42'),
(1227, 745, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-107-al-maun-2093-2316.mp3', 0, '2021-12-01 15:37:01'),
(1228, 745, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-108-al-kauther-2094-9057.mp3', 0, '2021-12-01 15:37:26'),
(1229, 745, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-109-al-kafiroon-2095-487.mp3', 0, '2021-12-01 15:37:49'),
(1230, 745, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-110-an-nasr-2096-7596.mp3', 0, '2021-12-01 15:38:09'),
(1231, 745, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-111-al-masadd-2097-2392.mp3', 0, '2021-12-01 15:38:30'),
(1232, 745, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-112-al-ikhlas-2098-6354.mp3', 0, '2021-12-01 15:38:46'),
(1233, 745, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-113-al-falaq-2099-4150.mp3', 0, '2021-12-01 15:39:16'),
(1234, 745, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/UAE/Salah-Bukhatir/salah-bukhatir-114-an-nas-2100-4821.mp3', 0, '2021-12-01 15:39:41'),
(1235, 747, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-011-hud-651-5939.mp3', 0, '2021-12-01 15:47:08'),
(1236, 747, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-012-yusuf-653-4067.mp3', 0, '2021-12-01 15:47:33'),
(1237, 747, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-013-ar-rad-652-5242.mp3', 0, '2021-12-01 15:48:10'),
(1238, 747, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-014-ibrahim-654-5112.mp3', 0, '2021-12-01 15:48:31'),
(1239, 747, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-015-al-hijr-655-7152.mp3', 0, '2021-12-01 15:48:49'),
(1240, 747, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-016-an-nahl-656-9177.mp3', 0, '2021-12-01 15:49:13'),
(1241, 747, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-017-al-isra-657-3785.mp3', 0, '2021-12-01 15:49:30'),
(1242, 747, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-018-al-kahf-658-6270.mp3', 0, '2021-12-01 15:49:56'),
(1243, 747, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-019-maryam-659-5185.mp3', 0, '2021-12-01 15:50:29'),
(1244, 747, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-020-taha-802-2661.mp3', 0, '2021-12-01 15:50:55'),
(1245, 747, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-021-al-anbiya-803-6814.mp3', 0, '2021-12-01 15:51:21'),
(1246, 747, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-022-al-hajj-804-468.mp3', 0, '2021-12-01 15:51:48'),
(1247, 747, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-023-al-mumenoon-722-9856.mp3', 0, '2021-12-01 15:52:04'),
(1248, 747, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-024-an-noor-805-2028.mp3', 0, '2021-12-01 15:52:34'),
(1249, 747, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-025-al-furqan-760-4467.mp3', 0, '2021-12-01 15:52:55'),
(1250, 747, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-026-ash-shuara-761-8594.mp3', 0, '2021-12-01 15:53:29'),
(1251, 747, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-027-an-naml-762-7063.mp3', 0, '2021-12-01 15:53:56'),
(1252, 747, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-028-al-qasas-859-2634.mp3', 0, '2021-12-01 15:54:32'),
(1253, 747, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-029-al-ankaboot-801-7496.mp3', 0, '2021-12-01 15:55:26'),
(1254, 747, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-030-ar-room-861-4865.mp3', 0, '2021-12-01 15:55:44'),
(1255, 747, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-031-luqman-860-7776.mp3', 0, '2021-12-01 15:56:05'),
(1256, 747, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-032-as-sajda-862-9355.mp3', 0, '2021-12-01 15:56:28'),
(1257, 747, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-033-al-ahzab-864-1861.mp3', 0, '2021-12-01 15:56:47'),
(1258, 747, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-034-saba-863-2814.mp3', 0, '2021-12-01 15:57:01'),
(1259, 747, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-035-fatir-806-4876.mp3', 0, '2021-12-01 15:57:17'),
(1260, 747, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-036-ya-seen-807-3240.mp3', 0, '2021-12-01 15:57:45'),
(1261, 747, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-037-as-saaffat-808-9047.mp3', 0, '2021-12-01 15:58:02'),
(1262, 747, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-038-sad-809-9034.mp3', 0, '2021-12-01 15:58:51'),
(1263, 747, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-039-az-zumar-865-9879.mp3', 0, '2021-12-01 15:59:12'),
(1264, 747, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-040-ghafir-868-1575.mp3', 0, '2021-12-01 15:59:29'),
(1265, 747, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-041-fussilat-866-3171.mp3', 0, '2021-12-01 15:59:46'),
(1266, 747, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-042-ash-shura-867-5818.mp3', 0, '2021-12-01 16:00:21'),
(1267, 747, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-043-az-zukhruf-869-5642.mp3', 0, '2021-12-01 16:00:51'),
(1268, 747, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-044-ad-dukhan-870-8414.mp3', 0, '2021-12-01 16:01:09'),
(1269, 747, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-045-al-jathiya-871-929.mp3', 0, '2021-12-01 16:01:31'),
(1270, 747, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-046-al-ahqaf-873-2794.mp3', 0, '2021-12-01 16:02:42'),
(1271, 747, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-047-muhammad-872-7591.mp3', 0, '2021-12-01 16:03:14'),
(1272, 747, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-048-al-fath-664-4714.mp3', 0, '2021-12-01 16:03:54'),
(1273, 747, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-049-al-hujraat-666-9065.mp3', 0, '2021-12-01 16:04:08'),
(1274, 747, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-050-qaf-665-2775.mp3', 0, '2021-12-01 16:04:54'),
(1275, 747, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-051-adh-dhariyat-667-7375.mp3', 0, '2021-12-01 16:05:28'),
(1276, 747, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-052-at-tur-669-5878.mp3', 0, '2021-12-01 16:05:56'),
(1277, 747, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-053-an-najm-668-3244.mp3', 0, '2021-12-01 16:06:18'),
(1278, 747, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-054-al-qamar-670-7231.mp3', 0, '2021-12-01 16:06:42'),
(1279, 747, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-055-al-rahman-672-7907.mp3', 0, '2021-12-01 16:07:05'),
(1280, 747, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-056-al-waqia-671-7711.mp3', 0, '2021-12-01 16:07:34'),
(1281, 747, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-057-al-hadid-673-5824.mp3', 0, '2021-12-01 16:07:54'),
(1282, 747, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-058-al-mujadala-675-4969.mp3', 0, '2021-12-01 16:08:37'),
(1283, 747, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-059-al-hashr-674-345.mp3', 0, '2021-12-01 16:09:01'),
(1284, 747, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-060-al-mumtahina-676-3320.mp3', 0, '2021-12-01 16:09:45'),
(1285, 747, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-061-as-saff-678-9835.mp3', 0, '2021-12-01 16:10:01'),
(1286, 747, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-062-al-jumua-677-8121.mp3', 0, '2021-12-01 16:10:19'),
(1287, 747, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-063-al-munafiqoon-679-2674.mp3', 0, '2021-12-01 16:10:46'),
(1288, 747, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-064-at-taghabun-789-1696.mp3', 0, '2021-12-01 16:11:28'),
(1289, 747, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-065-at-talaq-680-934.mp3', 0, '2021-12-01 16:11:43'),
(1290, 747, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-066-at-tahrim-790-7550.mp3', 0, '2021-12-01 16:12:03'),
(1291, 747, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-067-al-mulk-792-4936.mp3', 0, '2021-12-01 16:12:53'),
(1292, 747, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-068-al-qalam-791-9982.mp3', 0, '2021-12-01 16:13:49'),
(1293, 747, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-069-al-haaqqa-793-6583.mp3', 0, '2021-12-01 16:14:07'),
(1294, 747, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-070-al-maarij-794-4815.mp3', 0, '2021-12-01 16:14:38'),
(1295, 747, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-071-nooh-795-1557.mp3', 0, '2021-12-01 16:14:53'),
(1296, 747, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-072-al-jinn-796-9755.mp3', 0, '2021-12-01 16:15:17'),
(1297, 747, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-073-al-muzzammil-797-632.mp3', 0, '2021-12-01 16:15:37'),
(1298, 747, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-074-al-muddathir-798-7200.mp3', 0, '2021-12-01 16:15:59'),
(1299, 747, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-075-al-qiyama-800-8168.mp3', 0, '2021-12-01 16:16:33'),
(1300, 747, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-076-al-insan-799-1561.mp3', 0, '2021-12-01 16:17:06'),
(1301, 747, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-077-al-mursalat-704-9994.mp3', 0, '2021-12-01 16:17:31'),
(1302, 747, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-078-an-naba-710-5758.mp3', 0, '2021-12-01 16:17:51'),
(1303, 747, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-079-an-naziat-705-6276.mp3', 0, '2021-12-01 16:18:22'),
(1304, 747, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-080-abasa-706-9059.mp3', 0, '2021-12-01 16:18:38'),
(1305, 747, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-081-at-takwir-707-8534.mp3', 0, '2021-12-01 16:18:59'),
(1306, 747, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-082-al-infitar-708-3651.mp3', 0, '2021-12-01 16:19:38'),
(1307, 747, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-083-al-mutaffifin-709-4936.mp3', 0, '2021-12-01 16:19:58'),
(1308, 747, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-084-al-inshiqaq-711-1777.mp3', 0, '2021-12-01 16:20:24'),
(1309, 747, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-085-al-burooj-712-881.mp3', 0, '2021-12-01 16:21:03'),
(1310, 747, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-086-at-tariq-713-2843.mp3', 0, '2021-12-01 16:21:22'),
(1311, 747, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-087-al-ala-714-9489.mp3', 0, '2021-12-01 16:21:46'),
(1312, 747, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-088-al-ghashiya-715-6706.mp3', 0, '2021-12-01 16:22:13'),
(1313, 747, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-089-al-fajr-716-7812.mp3', 0, '2021-12-01 16:22:35'),
(1314, 747, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-090-al-balad-717-9834.mp3', 0, '2021-12-01 16:22:51'),
(1315, 747, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-091-ash-shams-718-25.mp3', 0, '2021-12-01 16:23:15'),
(1316, 747, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-092-al-lail-681-7646.mp3', 0, '2021-12-01 16:23:43'),
(1317, 747, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-093-ad-dhuha-682-7954.mp3', 0, '2021-12-01 16:24:14'),
(1318, 747, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-094-ash-sharh-683-2700.mp3', 0, '2021-12-01 16:24:29'),
(1319, 747, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-095-at-tin-684-9343.mp3', 0, '2021-12-01 16:24:44'),
(1320, 747, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-096-al-alaq-686-8889.mp3', 0, '2021-12-01 16:24:58'),
(1321, 747, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-097-al-qadr-685-250.mp3', 0, '2021-12-01 16:25:35'),
(1322, 747, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-098-al-bayyina-688-4279.mp3', 0, '2021-12-01 16:25:54'),
(1323, 747, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-099-al-zalzala-687-8871.mp3', 0, '2021-12-01 16:26:11'),
(1324, 747, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-100-al-adiyat-689-6834.mp3', 0, '2021-12-01 16:26:25'),
(1325, 747, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-101-al-qaria-690-9094.mp3', 0, '2021-12-01 16:26:46'),
(1326, 747, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-102-at-takathur-692-427.mp3', 0, '2021-12-01 16:27:03'),
(1327, 747, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-103-al-asr-691-6588.mp3', 0, '2021-12-01 16:27:34'),
(1328, 747, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-104-al-humaza-694-9726.mp3', 0, '2021-12-01 16:27:52'),
(1329, 747, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-105-al-fil-693-7627.mp3', 0, '2021-12-01 16:28:10'),
(1330, 747, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-106-quraish-695-4755.mp3', 0, '2021-12-01 16:30:02'),
(1331, 747, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-107-al-maun-696-1287.mp3', 0, '2021-12-01 16:30:22'),
(1332, 747, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-108-al-kauther-697-7621.mp3', 0, '2021-12-01 16:30:37'),
(1333, 747, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-109-al-kafiroon-698-513.mp3', 0, '2021-12-01 16:30:55'),
(1334, 747, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-110-an-nasr-699-7564.mp3', 0, '2021-12-01 16:31:27'),
(1335, 747, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-111-al-masadd-702-6679.mp3', 0, '2021-12-01 16:31:59'),
(1336, 747, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-112-al-ikhlas-700-9048.mp3', 0, '2021-12-01 16:32:28'),
(1337, 747, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-113-al-falaq-701-1214.mp3', 0, '2021-12-01 16:32:59'),
(1338, 747, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Abdulbasit-Abdusamad/abdelbasset-abdessamad-114-an-nas-703-1615.mp3', 0, '2021-12-01 16:33:25'),
(1339, 748, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-013-ar-rad-3292-6990.mp3', 0, '2021-12-01 16:52:27'),
(1340, 748, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-014-ibrahim-3293-1778.mp3', 0, '2021-12-01 16:52:59'),
(1341, 748, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-015-al-hijr-3294-3536.mp3', 0, '2021-12-01 16:53:32'),
(1342, 748, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-016-an-nahl-3295-5860.mp3', 0, '2021-12-01 16:53:55'),
(1343, 748, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-017-al-isra-3296-8612.mp3', 0, '2021-12-01 16:54:17'),
(1344, 748, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-018-al-kahf-3297-2629.mp3', 0, '2021-12-01 16:54:45'),
(1345, 748, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-019-maryam-3298-6288.mp3', 0, '2021-12-01 16:55:05'),
(1346, 748, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-020-taha-3275-5200.mp3', 0, '2021-12-01 16:55:22'),
(1347, 748, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-021-al-anbiya-3276-2355.mp3', 0, '2021-12-01 16:55:54'),
(1348, 748, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-022-al-hajj-3271-3914.mp3', 0, '2021-12-01 16:56:15'),
(1349, 748, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-023-al-mumenoon-3272-9955.mp3', 0, '2021-12-01 16:56:44'),
(1350, 748, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-024-an-noor-3273-3642.mp3', 0, '2021-12-01 16:56:59'),
(1351, 748, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-025-al-furqan-3274-1534.mp3', 0, '2021-12-01 16:57:12'),
(1352, 748, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-026-ash-shuara-3285-468.mp3', 0, '2021-12-01 16:57:29'),
(1353, 748, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-027-an-naml-3286-1206.mp3', 0, '2021-12-01 16:57:52'),
(1354, 748, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-028-al-qasas-3287-8213.mp3', 0, '2021-12-01 16:58:24'),
(1355, 748, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-029-al-ankaboot-3288-9516.mp3', 0, '2021-12-01 16:58:56'),
(1356, 748, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-030-ar-room-3289-2420.mp3', 0, '2021-12-01 16:59:10'),
(1357, 748, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-031-luqman-518-9829.mp3', 0, '2021-12-01 16:59:23'),
(1358, 748, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-032-as-sajda-519-341.mp3', 0, '2021-12-01 16:59:45'),
(1359, 748, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-033-al-ahzab-3277-4517.mp3', 0, '2021-12-01 17:00:04'),
(1360, 748, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-034-saba-3278-4286.mp3', 0, '2021-12-01 17:00:25'),
(1361, 748, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-035-fatir-3279-654.mp3', 0, '2021-12-01 17:00:39'),
(1362, 748, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-036-ya-seen-3280-3319.mp3', 0, '2021-12-01 17:01:01'),
(1363, 748, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-037-as-saaffat-3281-6556.mp3', 0, '2021-12-01 17:01:24'),
(1364, 748, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-038-sad-3282-802.mp3', 0, '2021-12-01 17:01:49'),
(1365, 748, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-039-az-zumar-3283-2147.mp3', 0, '2021-12-01 17:02:26'),
(1366, 748, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-040-ghafir-3284-6471.mp3', 0, '2021-12-01 17:02:46'),
(1367, 748, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-041-fussilat-520-8904.mp3', 0, '2021-12-01 17:03:08'),
(1368, 748, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-042-ash-shura-521-3676.mp3', 0, '2021-12-01 17:03:27'),
(1369, 748, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-043-az-zukhruf-522-5729.mp3', 0, '2021-12-01 17:03:53'),
(1370, 748, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-044-ad-dukhan-523-5894.mp3', 0, '2021-12-01 17:04:11'),
(1371, 748, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-045-al-jathiya-524-5454.mp3', 0, '2021-12-01 17:04:27'),
(1372, 748, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-046-al-ahqaf-525-9266.mp3', 0, '2021-12-01 17:04:53'),
(1373, 748, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-047-muhammad-526-1754.mp3', 0, '2021-12-01 17:05:12'),
(1374, 748, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-048-al-fath-527-4066.mp3', 0, '2021-12-01 17:06:20'),
(1375, 748, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-049-al-hujraat-528-1895.mp3', 0, '2021-12-01 17:06:38'),
(1376, 748, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-050-qaf-529-8042.mp3', 0, '2021-12-01 17:06:57'),
(1377, 748, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-051-adh-dhariyat-530-9266.mp3', 0, '2021-12-01 17:08:33'),
(1378, 748, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-052-at-tur-531-4250.mp3', 0, '2021-12-01 17:09:26'),
(1379, 748, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-053-an-najm-532-1955.mp3', 0, '2021-12-01 17:11:42'),
(1380, 748, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-054-al-qamar-533-9221.mp3', 0, '2021-12-01 17:12:43'),
(1381, 748, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-055-al-rahman-458-7893.mp3', 0, '2021-12-01 17:13:24'),
(1382, 748, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-056-al-waqia-459-3490.mp3', 0, '2021-12-01 17:13:47'),
(1383, 748, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-057-al-hadid-460-9690.mp3', 0, '2021-12-01 17:14:10'),
(1384, 748, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-058-al-mujadala-461-9099.mp3', 0, '2021-12-01 17:14:36'),
(1385, 748, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-059-al-hashr-462-1703.mp3', 0, '2021-12-01 17:15:14'),
(1386, 748, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-060-al-mumtahina-463-9206.mp3', 0, '2021-12-01 17:15:35'),
(1387, 748, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-061-as-saff-464-1519.mp3', 0, '2021-12-01 17:15:54'),
(1388, 748, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-062-al-jumua-465-1531.mp3', 0, '2021-12-01 17:16:12'),
(1389, 748, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-063-al-munafiqoon-466-9547.mp3', 0, '2021-12-01 17:17:11'),
(1390, 748, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-064-at-taghabun-467-6036.mp3', 0, '2021-12-01 17:17:27'),
(1391, 748, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-065-at-talaq-468-5817.mp3', 0, '2021-12-01 17:17:50'),
(1392, 748, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-066-at-tahrim-469-201.mp3', 0, '2021-12-01 17:18:19'),
(1393, 748, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-067-al-mulk-470-9355.mp3', 0, '2021-12-01 17:18:38'),
(1394, 748, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-068-al-qalam-471-2372.mp3', 0, '2021-12-01 17:18:51'),
(1395, 748, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-069-al-haaqqa-472-1003.mp3', 0, '2021-12-01 17:19:09'),
(1396, 748, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-070-al-maarij-473-1502.mp3', 0, '2021-12-01 17:19:28'),
(1397, 748, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-071-nooh-474-8844.mp3', 0, '2021-12-01 17:19:44'),
(1398, 748, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-072-al-jinn-475-9908.mp3', 0, '2021-12-01 17:20:01'),
(1399, 748, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-073-al-muzzammil-476-5178.mp3', 0, '2021-12-01 17:20:18'),
(1400, 748, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-074-al-muddathir-477-4572.mp3', 0, '2021-12-01 17:22:14'),
(1401, 748, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-075-al-qiyama-478-5801.mp3', 0, '2021-12-01 17:22:42'),
(1402, 748, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-076-al-insan-479-632.mp3', 0, '2021-12-01 17:23:13'),
(1403, 748, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-077-al-mursalat-480-3838.mp3', 0, '2021-12-01 17:23:34'),
(1404, 748, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-078-an-naba-481-7555.mp3', 0, '2021-12-01 17:23:51'),
(1405, 748, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-079-an-naziat-482-4699.mp3', 0, '2021-12-01 17:24:14'),
(1406, 748, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-080-abasa-483-5733.mp3', 0, '2021-12-01 17:24:32'),
(1407, 748, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-081-at-takwir-484-5596.mp3', 0, '2021-12-01 17:24:55'),
(1408, 748, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-082-al-infitar-485-3964.mp3', 0, '2021-12-01 17:25:11'),
(1409, 748, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-083-al-mutaffifin-486-9983.mp3', 0, '2021-12-01 17:25:56'),
(1410, 748, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-084-al-inshiqaq-487-7552.mp3', 0, '2021-12-01 17:26:11'),
(1411, 748, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-085-al-burooj-488-3185.mp3', 0, '2021-12-01 17:26:30'),
(1412, 748, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-086-at-tariq-489-7876.mp3', 0, '2021-12-01 17:27:04'),
(1413, 748, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-087-al-ala-490-1042.mp3', 0, '2021-12-01 17:27:30'),
(1414, 748, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-088-al-ghashiya-491-2874.mp3', 0, '2021-12-01 17:27:59'),
(1415, 748, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-089-al-fajr-492-6974.mp3', 0, '2021-12-01 17:28:37'),
(1416, 748, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-090-al-balad-493-2745.mp3', 0, '2021-12-01 17:28:56'),
(1417, 748, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-091-ash-shams-494-2080.mp3', 0, '2021-12-01 17:29:16'),
(1418, 748, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-092-al-lail-495-8494.mp3', 0, '2021-12-01 17:29:32'),
(1419, 748, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-093-ad-dhuha-496-4277.mp3', 0, '2021-12-01 17:29:51'),
(1420, 748, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-094-ash-sharh-497-1626.mp3', 0, '2021-12-01 17:30:07'),
(1421, 748, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-095-at-tin-498-4529.mp3', 0, '2021-12-01 17:30:30'),
(1422, 748, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-096-al-alaq-499-94.mp3', 0, '2021-12-01 17:30:50'),
(1423, 748, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-097-al-qadr-500-1828.mp3', 0, '2021-12-01 17:31:41'),
(1424, 748, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-098-al-bayyina-501-3884.mp3', 0, '2021-12-01 17:32:00'),
(1425, 748, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-099-al-zalzala-502-2467.mp3', 0, '2021-12-01 17:32:29'),
(1426, 748, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-100-al-adiyat-503-2831.mp3', 0, '2021-12-01 17:32:45'),
(1427, 748, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-101-al-qaria-504-5387.mp3', 0, '2021-12-01 17:33:01'),
(1428, 748, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-102-at-takathur-505-1310.mp3', 0, '2021-12-01 17:33:17'),
(1429, 748, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-103-al-asr-506-2739.mp3', 0, '2021-12-01 17:33:31'),
(1430, 748, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-104-al-humaza-507-564.mp3', 0, '2021-12-01 17:33:47'),
(1431, 748, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-105-al-fil-508-5883.mp3', 0, '2021-12-01 17:34:30'),
(1432, 748, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-106-quraish-509-8540.mp3', 0, '2021-12-01 17:34:48'),
(1433, 748, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-107-al-maun-510-1197.mp3', 0, '2021-12-01 17:35:04'),
(1434, 748, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-108-al-kauther-511-9721.mp3', 0, '2021-12-01 17:35:30'),
(1435, 748, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-109-al-kafiroon-512-6095.mp3', 0, '2021-12-01 17:35:58'),
(1436, 748, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-110-an-nasr-513-5896.mp3', 0, '2021-12-01 17:36:24'),
(1437, 748, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-111-al-masadd-514-5453.mp3', 0, '2021-12-01 17:36:36'),
(1438, 748, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-112-al-ikhlas-515-1691.mp3', 0, '2021-12-01 17:36:51'),
(1439, 748, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-113-al-falaq-516-9860.mp3', 0, '2021-12-01 17:37:04'),
(1440, 748, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-seddik-el-menchaoui/mohamed-seddik-el-menchaoui-114-an-nas-517-5436.mp3', 0, '2021-12-01 17:37:17'),
(1441, 746, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-011-hud-2373-9634.mp3', 0, '2021-12-01 17:39:24'),
(1442, 746, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-012-yusuf-2374-6338.mp3', 0, '2021-12-01 17:39:43'),
(1443, 746, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-013-ar-rad-2375-8034.mp3', 0, '2021-12-01 17:40:05'),
(1444, 746, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-014-ibrahim-2376-7964.mp3', 0, '2021-12-01 17:40:24'),
(1445, 746, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-015-al-hijr-2377-6355.mp3', 0, '2021-12-01 17:40:38'),
(1446, 746, 'An Nahl', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-016-an-nahl-2378-1284.mp3', 0, '2021-12-01 17:41:12'),
(1447, 746, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-017-al-isra-2379-6678.mp3', 0, '2021-12-01 17:41:25'),
(1448, 746, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-018-al-kahf-2380-8521.mp3', 0, '2021-12-01 17:41:38'),
(1449, 746, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-019-maryam-2381-5375.mp3', 0, '2021-12-01 17:41:58'),
(1450, 746, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-020-taha-2382-3826.mp3', 0, '2021-12-01 17:42:17'),
(1451, 746, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-021-al-anbiya-2383-4632.mp3', 0, '2021-12-01 17:42:35'),
(1452, 746, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-023-al-mumenoon-2356-2027.mp3', 0, '2021-12-01 17:43:00'),
(1453, 746, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-024-an-noor-2357-4540.mp3', 0, '2021-12-01 17:43:18'),
(1454, 746, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-025-al-furqan-2358-3101.mp3', 0, '2021-12-01 17:43:35'),
(1455, 746, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-026-ash-shuara-2359-652.mp3', 0, '2021-12-01 17:43:50'),
(1456, 746, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-027-an-naml-2360-6360.mp3', 0, '2021-12-01 17:44:18'),
(1457, 746, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-028-al-qasas-2361-8614.mp3', 0, '2021-12-01 17:44:31'),
(1458, 746, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-029-al-ankaboot-2362-3590.mp3', 0, '2021-12-01 17:44:49'),
(1459, 746, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-030-ar-room-2468-9510.mp3', 0, '2021-12-01 17:45:08'),
(1460, 746, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/Mahmoud-Khalil-Al-Hussary/mahmoud-khalil-al-hussary-031-luqman-2469-106.mp3', 0, '2021-12-01 17:45:23'),
(1461, 750, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-041-fussilat-70-703.mp3', 0, '2021-12-01 17:48:53'),
(1462, 750, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-042-ash-shura-71-5392.mp3', 0, '2021-12-01 17:49:31'),
(1463, 750, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-043-az-zukhruf-72-7201.mp3', 0, '2021-12-01 17:49:51'),
(1464, 750, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-044-ad-dukhan-73-8115.mp3', 0, '2021-12-01 17:50:20'),
(1465, 750, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-045-al-jathiya-74-3247.mp3', 0, '2021-12-01 17:50:41'),
(1466, 750, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-046-al-ahqaf-75-9442.mp3', 0, '2021-12-01 17:51:01'),
(1467, 750, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-047-muhammad-76-3225.mp3', 0, '2021-12-01 17:51:42'),
(1468, 750, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-048-al-fath-77-5148.mp3', 0, '2021-12-01 17:51:58'),
(1469, 750, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-049-al-hujraat-78-5452.mp3', 0, '2021-12-01 17:52:20'),
(1470, 750, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-050-qaf-79-8621.mp3', 0, '2021-12-01 17:52:45'),
(1471, 750, 'Adh Dhariyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-051-adh-dhariyat-80-2948.mp3', 0, '2021-12-01 17:53:02'),
(1472, 750, 'At Tur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-052-at-tur-81-2806.mp3', 0, '2021-12-01 17:53:19'),
(1473, 750, 'An Najm', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-053-an-najm-82-2792.mp3', 0, '2021-12-01 17:53:41'),
(1474, 750, 'Al Qamar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-054-al-qamar-83-6426.mp3', 0, '2021-12-01 17:54:10'),
(1475, 750, 'Al Rahman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-055-al-rahman-84-2923.mp3', 0, '2021-12-01 17:54:28'),
(1476, 750, 'Al Waqia', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-056-al-waqia-85-705.mp3', 0, '2021-12-01 17:54:48'),
(1477, 750, 'Al Hadid', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-057-al-hadid-86-5188.mp3', 0, '2021-12-01 17:55:06'),
(1478, 750, 'Al Mujadala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-058-al-mujadala-87-1297.mp3', 0, '2021-12-01 17:55:29'),
(1479, 750, 'Al Hashr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-059-al-hashr-88-4974.mp3', 0, '2021-12-01 17:55:47'),
(1480, 750, 'Al Mumtahina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-060-al-mumtahina-89-876.mp3', 0, '2021-12-01 17:56:22'),
(1481, 750, 'As Saff', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-061-as-saff-90-5101.mp3', 0, '2021-12-01 17:56:40');
INSERT INTO `ebook__audios` (`audio_id`, `file_id`, `audio_title`, `audio_file`, `audio_link`, `audio_position`, `created_at`) VALUES
(1482, 750, 'Al Jumua', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-062-al-jumua-91-1343.mp3', 0, '2021-12-01 17:57:09'),
(1483, 750, 'Al Munafiqoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-063-al-munafiqoon-92-4042.mp3', 0, '2021-12-01 17:57:39'),
(1484, 750, 'At Taghabun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-064-at-taghabun-93-5242.mp3', 0, '2021-12-01 17:58:01'),
(1485, 750, 'At Talaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-065-at-talaq-94-1124.mp3', 0, '2021-12-01 18:16:42'),
(1486, 750, 'At Tahrim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-066-at-tahrim-95-9872.mp3', 0, '2021-12-01 18:17:23'),
(1487, 750, 'Al Mulk', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-067-al-mulk-96-1547.mp3', 0, '2021-12-01 18:17:53'),
(1488, 750, 'Al Qalam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-068-al-qalam-97-2830.mp3', 0, '2021-12-01 18:19:00'),
(1489, 750, 'Al Haaqqa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-069-al-haaqqa-98-9500.mp3', 0, '2021-12-01 18:19:22'),
(1490, 750, 'Al Maarji', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-070-al-maarij-99-6033.mp3', 0, '2021-12-01 18:19:47'),
(1491, 750, 'Nooh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-071-nooh-100-2073.mp3', 0, '2021-12-01 18:20:04'),
(1492, 750, 'Al Jinn', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-072-al-jinn-101-203.mp3', 0, '2021-12-01 18:20:24'),
(1493, 750, 'Al Muzzammil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-073-al-muzzammil-102-1424.mp3', 0, '2021-12-01 18:20:56'),
(1494, 750, 'Al Muddathir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-074-al-muddathir-103-9275.mp3', 0, '2021-12-01 18:21:15'),
(1495, 750, 'Al Qiyama', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-075-al-qiyama-104-8319.mp3', 0, '2021-12-01 18:21:40'),
(1496, 750, 'Al Insan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-076-al-insan-105-4672.mp3', 0, '2021-12-01 18:22:09'),
(1497, 750, 'Al Mursalat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-077-al-mursalat-106-8717.mp3', 0, '2021-12-01 18:22:25'),
(1498, 750, 'An Naba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-078-an-naba-107-1543.mp3', 0, '2021-12-01 18:22:44'),
(1499, 750, 'An Naziat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-079-an-naziat-108-9820.mp3', 0, '2021-12-01 18:23:05'),
(1500, 750, 'Abasa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-080-abasa-109-4168.mp3', 0, '2021-12-01 18:23:23'),
(1501, 750, 'At Takwir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-081-at-takwir-110-164.mp3', 0, '2021-12-01 18:23:41'),
(1502, 750, 'Al Infitar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-082-al-infitar-111-2768.mp3', 0, '2021-12-01 18:24:01'),
(1503, 750, 'Al Mutaffifin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-083-al-mutaffifin-112-6974.mp3', 0, '2021-12-01 18:24:24'),
(1504, 750, 'Al Inshiqaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-084-al-inshiqaq-113-2956.mp3', 0, '2021-12-01 18:24:41'),
(1505, 750, 'Al Burooj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-085-al-burooj-114-9195.mp3', 0, '2021-12-01 18:24:56'),
(1506, 750, 'At Tariq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-086-at-tariq-1-9898.mp3', 0, '2021-12-01 18:25:19'),
(1507, 750, 'Al Ala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-087-al-ala-2-3662.mp3', 0, '2021-12-01 18:25:35'),
(1508, 750, 'Al Ghashiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-088-al-ghashiya-3-4382.mp3', 0, '2021-12-01 18:26:22'),
(1509, 750, 'Al Fajr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-089-al-fajr-6-1194.mp3', 0, '2021-12-01 18:26:44'),
(1510, 750, 'Al Balad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-090-al-balad-4-8637.mp3', 0, '2021-12-01 18:27:04'),
(1511, 750, 'Ash Shams', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-091-ash-shams-5-5259.mp3', 0, '2021-12-01 18:27:20'),
(1512, 750, 'Al Lail', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-092-al-lail-7-6296.mp3', 0, '2021-12-01 18:27:35'),
(1513, 750, 'Ad Dhuha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-093-ad-dhuha-8-9981.mp3', 0, '2021-12-01 18:27:50'),
(1514, 750, 'Ash Sharh', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-094-ash-sharh-9-9302.mp3', 0, '2021-12-01 18:28:25'),
(1515, 750, 'At Tin', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-095-at-tin-10-1538.mp3', 0, '2021-12-01 18:28:49'),
(1516, 750, 'Al Alaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-096-al-alaq-11-1104.mp3', 0, '2021-12-01 18:29:11'),
(1517, 750, 'Al Qadr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-097-al-qadr-12-9173.mp3', 0, '2021-12-01 18:29:42'),
(1518, 750, 'Al Bayyina', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-098-al-bayyina-13-3085.mp3', 0, '2021-12-01 18:29:59'),
(1519, 750, 'Al Zalzala', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-099-al-zalzala-14-3935.mp3', 0, '2021-12-01 18:30:13'),
(1520, 750, 'Al Adiyat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-100-al-adiyat-15-8673.mp3', 0, '2021-12-01 18:30:29'),
(1521, 750, 'Al Qaria', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-101-al-qaria-16-9119.mp3', 0, '2021-12-01 18:30:44'),
(1522, 750, 'At Takathur', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-102-at-takathur-17-6008.mp3', 0, '2021-12-01 18:30:58'),
(1523, 750, 'Al Asr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-103-al-asr-18-8877.mp3', 0, '2021-12-01 18:31:17'),
(1524, 750, 'Al Humaza', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-104-al-humaza-19-543.mp3', 0, '2021-12-01 18:31:39'),
(1525, 750, 'Al Fil', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-105-al-fil-20-5283.mp3', 0, '2021-12-01 18:31:57'),
(1526, 750, 'Quraish', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-106-quraish-21-7195.mp3', 0, '2021-12-01 18:32:13'),
(1527, 750, 'Al Maun', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-107-al-maun-22-5215.mp3', 0, '2021-12-01 18:32:30'),
(1528, 750, 'Al Kauther', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-108-al-kauther-23-3999.mp3', 0, '2021-12-01 18:32:45'),
(1529, 750, 'Al Kafiroon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-109-al-kafiroon-24-8738.mp3', 0, '2021-12-01 18:33:06'),
(1530, 750, 'An Nasr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-110-an-nasr-25-5034.mp3', 0, '2021-12-01 18:33:33'),
(1531, 750, 'Al Masadd', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-111-al-masadd-26-8167.mp3', 0, '2021-12-01 18:34:27'),
(1532, 750, 'Al Ikhlas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-112-al-ikhlas-27-8903.mp3', 0, '2021-12-01 18:34:45'),
(1533, 750, 'Al Falaq', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-113-al-falaq-28-7803.mp3', 0, '2021-12-01 18:34:59'),
(1534, 750, 'An Nas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Kuwait/Mishary-Rashid-Alafasy/mishary-rashid-alafasy-114-an-nas-29-5141.mp3', 0, '2021-12-01 18:35:14'),
(1535, 749, 'Al Fatiha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-001-al-fatiha-2893-1530.mp3', 0, '2021-12-01 18:54:17'),
(1536, 749, 'Al Baqara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-002-al-baqara-2894-4390.mp3', 0, '2021-12-01 18:54:51'),
(1537, 749, 'Al e-imran', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-003-aal-e-imran-2895-1327.mp3', 0, '2021-12-01 18:55:35'),
(1538, 749, 'An Nisa', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-004-an-nisa-2896-4967.mp3', 0, '2021-12-01 18:55:53'),
(1539, 749, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-005-al-maeda-2897-8799.mp3', 0, '2021-12-01 18:56:21'),
(1540, 749, 'Al Maeda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-005-al-maeda-2897-8799.mp3', 0, '2021-12-01 18:56:22'),
(1541, 749, 'Al Anaam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-006-al-anaam-2898-532.mp3', 0, '2021-12-01 18:56:45'),
(1542, 749, 'Al Araf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-007-al-araf-2899-8835.mp3', 0, '2021-12-01 18:56:58'),
(1543, 749, 'Al Anfal', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-008-al-anfal-2900-3273.mp3', 0, '2021-12-01 18:57:20'),
(1544, 749, 'Al Taubah', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-009-at-taubah-2901-4803.mp3', 0, '2021-12-01 18:57:57'),
(1545, 749, 'Yunus', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-010-yunus-2885-3190.mp3', 0, '2021-12-01 18:58:18'),
(1546, 749, 'Hud', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-011-hud-2884-6485.mp3', 0, '2021-12-01 18:58:38'),
(1547, 749, 'Yusuf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-012-yusuf-2886-7675.mp3', 0, '2021-12-01 18:58:56'),
(1548, 749, 'Ar Rad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-013-ar-rad-2887-5897.mp3', 0, '2021-12-01 18:59:09'),
(1549, 749, 'Ibrahim', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-014-ibrahim-2888-9833.mp3', 0, '2021-12-01 18:59:23'),
(1550, 749, 'Al Hijr', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-015-al-hijr-2889-2872.mp3', 0, '2021-12-01 18:59:39'),
(1551, 749, 'Al Isra', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-017-al-isra-2891-8764.mp3', 0, '2021-12-01 18:59:52'),
(1552, 749, 'Al Kahf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-018-al-kahf-2892-2688.mp3', 0, '2021-12-01 19:00:05'),
(1553, 749, 'Maryam', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-019-maryam-2908-2137.mp3', 0, '2021-12-01 19:00:27'),
(1554, 749, 'Taha', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-020-taha-2909-6552.mp3', 0, '2021-12-01 19:00:41'),
(1555, 749, 'Al Anbiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-021-al-anbiya-2910-3067.mp3', 0, '2021-12-01 19:01:04'),
(1556, 749, 'Al Hajj', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-022-al-hajj-2902-2968.mp3', 0, '2021-12-01 19:01:34'),
(1557, 749, 'Al Mumenoon', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-023-al-mumenoon-2903-8091.mp3', 0, '2021-12-01 19:01:50'),
(1558, 749, 'An Noor', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-024-an-noor-2904-4579.mp3', 0, '2021-12-01 19:02:14'),
(1559, 749, 'Al Furqan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-025-al-furqan-2905-2830.mp3', 0, '2021-12-01 19:02:32'),
(1560, 749, 'Ash Shuara', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-026-ash-shuara-2906-4109.mp3', 0, '2021-12-01 19:02:51'),
(1561, 749, 'An Naml', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-027-an-naml-2907-3737.mp3', 0, '2021-12-01 19:03:12'),
(1562, 749, 'Al Qasas', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-028-al-qasas-2860-1193.mp3', 0, '2021-12-01 19:03:58'),
(1563, 749, 'Al Ankaboot', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-029-al-ankaboot-2861-569.mp3', 0, '2021-12-01 19:04:23'),
(1564, 749, 'Ar Room', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-030-ar-room-2862-1599.mp3', 0, '2021-12-01 19:04:49'),
(1565, 749, 'Luqman', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-031-luqman-2863-1546.mp3', 0, '2021-12-01 19:06:46'),
(1566, 749, 'As Sajda', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-032-as-sajda-2864-2100.mp3', 0, '2021-12-01 19:07:37'),
(1567, 749, 'Al Ahzab', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-033-al-ahzab-2865-5990.mp3', 0, '2021-12-01 19:08:23'),
(1568, 749, 'Saba', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-034-saba-2866-2874.mp3', 0, '2021-12-01 19:08:36'),
(1569, 749, 'Fatir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-035-fatir-2841-7068.mp3', 0, '2021-12-01 19:08:52'),
(1570, 749, 'Ya Seen', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-036-ya-seen-2842-4788.mp3', 0, '2021-12-01 19:09:08'),
(1571, 749, 'As Saaffat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-037-as-saaffat-2843-3406.mp3', 0, '2021-12-01 19:09:32'),
(1572, 749, 'Sad', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-038-sad-2844-5902.mp3', 0, '2021-12-01 19:09:46'),
(1573, 749, 'Az Zumar', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-039-az-zumar-2845-8061.mp3', 0, '2021-12-01 19:10:06'),
(1574, 749, 'Ghafir', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-040-ghafir-2846-8209.mp3', 0, '2021-12-01 19:10:27'),
(1575, 749, 'Fussilat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-041-fussilat-2847-9093.mp3', 0, '2021-12-01 19:10:40'),
(1576, 749, 'Ash Shura', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-042-ash-shura-2848-4545.mp3', 0, '2021-12-01 19:11:02'),
(1577, 749, 'Az Zukhruf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-043-az-zukhruf-2801-5884.mp3', 0, '2021-12-01 19:11:17'),
(1578, 749, 'Ad Dukhan', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-044-ad-dukhan-2802-4989.mp3', 0, '2021-12-01 19:11:41'),
(1579, 749, 'Al Jathiya', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-045-al-jathiya-2803-4377.mp3', 0, '2021-12-01 19:11:57'),
(1580, 749, 'Al Ahqaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-046-al-ahqaf-2804-8757.mp3', 0, '2021-12-01 19:12:22'),
(1581, 749, 'Muhammed', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-047-muhammad-2805-4574.mp3', 0, '2021-12-01 19:12:50'),
(1582, 749, 'Al Fath', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-048-al-fath-2806-3141.mp3', 0, '2021-12-01 19:13:09'),
(1583, 749, 'Al Hujraat', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-049-al-hujraat-2807-1444.mp3', 0, '2021-12-01 19:13:21'),
(1584, 749, 'Qaf', '', 'http://localhost/zhic/public/Locker/Quran/Reciters/Egypt/mohamed-tablawi/mohamed-tablawi-050-qaf-2808-6712.mp3', 0, '2021-12-01 19:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `ebook__cover`
--

CREATE TABLE `ebook__cover` (
  `ebook__cover_id` bigint(255) NOT NULL,
  `file_id` bigint(255) DEFAULT NULL,
  `ebook__cover` longtext DEFAULT NULL,
  `ebook_position` bigint(255) DEFAULT NULL,
  `ebook_bg_color` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ebook__location`
--

CREATE TABLE `ebook__location` (
  `location_id` bigint(255) NOT NULL,
  `user_name` text DEFAULT NULL,
  `user_email` text DEFAULT NULL,
  `user_address` text DEFAULT NULL,
  `qualification` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `view_duration` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `datetime` text NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ebook__location`
--

INSERT INTO `ebook__location` (`location_id`, `user_name`, `user_email`, `user_address`, `qualification`, `gender`, `age`, `ip_address`, `city`, `location`, `view_duration`, `file_id`, `datetime`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'FMBI96YR92AJ7B9GO6P3', '2022-02-03 08:53:01'),
(2, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'T6AQ4B9Y61IB12FKEAOW', '2022-02-03 08:53:01'),
(3, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, '45NG8M70SE5T9A4H09F6', '2022-02-03 08:53:01'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, '426J69AR11HFT2LNV9IP', '2022-02-03 08:53:01'),
(5, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'K6HS7Y03Q6950713TA54', '2022-02-03 08:53:01'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'FPN38VACS1EY9Z5I2R8H103', '2022-02-03 08:53:01'),
(7, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'WBVQ83M9K7S1N6I2E911108', '2022-02-03 08:53:01'),
(8, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, 'WBVQ83M9K7S1N6I2E911109', '2022-02-03 08:53:01'),
(9, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, '60W4QM38I0YEA731AXGD', '2022-02-03 08:53:01'),
(10, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'JE5796P0T8S3HAD46Z4I', '2022-02-03 08:53:01'),
(11, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, 'DWPT65V3COF09XE4I980103', '2022-02-03 08:53:01'),
(12, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'FPN38VACS1EY9Z5I2R8H105', '2022-02-03 08:53:01'),
(13, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, '1RXW02A94D99M119Q5HP', '2022-02-03 08:53:01'),
(14, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'WBVQ83M9K7S1N6I2E911107', '2022-02-03 08:53:01'),
(15, 'ahmed', 'duals@aasdsa.ci', 'India', 'Doctorate or higher', 'male', NULL, '106.213.67.228', 'Atlanta', 'United States', NULL, 'DWPT65V3COF09XE4I980105', '2022-02-03 08:53:01'),
(16, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, '21XI30EEV4916TF6CNSG', '2022-02-03 08:53:01'),
(17, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'K6HS7Y03Q6950713TA54', '2022-02-03 08:53:01'),
(18, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'K6HS7Y03Q6950713TA54', '2022-02-03 08:53:01'),
(19, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'T5IZ131LY46O16926DBA', '2022-02-03 08:53:01'),
(20, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, '3SV7L94IF5FFJ64WRC31', '2022-02-03 08:53:01'),
(21, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'E9F455093SH6R849DO21103', '2022-02-03 08:53:01'),
(22, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'WI6S46F4HN1M88V0LBJ7', '2022-02-03 08:53:01'),
(23, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, 'CDC15W14AFQXL8I07VH9', '2022-02-03 08:53:01'),
(24, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'Q0L537A6FDKE4ZM9BI4R', '2022-02-03 08:53:01'),
(25, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'H836ZAMA7O74TX5F09WE', '2022-02-03 08:53:01'),
(26, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, 'RYZ43XIC8OM1A0NL8421', '2022-02-03 08:53:01'),
(27, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'Q0L537A6FDKE4ZM9BI4R', '2022-02-03 08:53:01'),
(28, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'FHE3IP44YWEN0JKZB513105', '2022-02-03 08:53:01'),
(29, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'D93Z20A9L4D6I2M4CDKH', '2022-02-03 08:53:01'),
(30, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'AM0XT84Y5E4D603A0O98', '2022-02-03 08:53:01'),
(31, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'Q17RB3X2ITK5SAEHC835', '2022-02-03 08:53:01'),
(32, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'JT2A0ES8644CF8GQMI6R', '2022-02-03 08:53:01'),
(33, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.79', 'Atlanta', 'United States', NULL, 'WBVQ83M9K7S1N6I2E911108', '2022-02-03 08:53:01'),
(34, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.76', 'Atlanta', 'United States', NULL, 'FC6L91SA70A6WYC4Q95J', '2022-02-03 08:53:01'),
(35, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.79', 'Atlanta', 'United States', NULL, 'A99YNKW2972EJI10O61D', '2022-02-03 08:53:01'),
(36, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'EHBA04KE9QC152LB2J41', '2022-02-03 08:53:01'),
(37, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'M802A1I63J74EH30D965101', '2022-02-03 08:53:01'),
(38, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, '0FYH114EEK5I0R5MA658', '2022-02-03 08:53:01'),
(39, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, '4AECAD3S89JN1B377W4Z', '2022-02-03 08:53:01'),
(40, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'DFI2G941MS6RA6H18K7B', '2022-02-03 08:53:01'),
(41, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, 'FMBI96YR92AJ7B9GO6P3', '2022-02-03 08:53:01'),
(42, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Atlanta', 'United States', NULL, 'L6WA4V6CDPR95970EB1Y', '2022-02-03 08:53:01'),
(43, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, '83HJ3O6M4Z52FYX5P6E0', '2022-02-03 08:53:01'),
(44, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Atlanta', 'United States', NULL, 'JR9MBAGE65D0L3S2XHV6', '2022-02-03 08:53:01'),
(45, 'khalifa', 'kh.zhic@gmail.com', 'United Arab Erimates', 'Doctorate or higher', 'male', NULL, '185.66.16.143', 'Atlanta', 'United States', NULL, 'SZH13T8WPJI93X7NYE8M', '2022-02-03 08:53:01'),
(46, 'khalifa', 'kh.zhic@gmail.com', 'United Arab Erimates', 'Doctorate or higher', 'male', NULL, '185.66.16.143', 'Atlanta', 'United States', NULL, 'SZH13T8WPJI93X7NYE8M', '2022-02-03 08:53:01'),
(47, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Atlanta', 'United States', NULL, 'M802A1I63J74EH30D965106', '2022-02-03 08:53:01'),
(48, 'test new', 'tes@asdasd.co', 'Algeria', 'Vocational qualification', 'male', NULL, '106.213.67.228', 'Atlanta', 'United States', NULL, '0FYH114EEK5I0R5MA658', '2022-02-03 09:02:14'),
(49, 'test new', 'tes@asdasd.co', 'Algeria', 'Vocational qualification', 'male', NULL, '106.213.67.228', 'Pune', 'IN', NULL, '0FYH114EEK5I0R5MA658', '2022-02-03 09:07:29'),
(50, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'M802A1I63J74EH30D965108', '2022-02-03 10:08:45'),
(51, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, '0B5BDTFO60WNA109KJZA', '2022-02-03 11:38:45'),
(52, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Salem', 'US', NULL, 'E8F4XE8N0156G4P6WROB', '2022-02-03 12:38:46'),
(53, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Salem', 'US', NULL, 'BI9619X3G2H5QSO18R5W', '2022-02-03 16:38:45'),
(54, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Salem', 'US', NULL, '2B7CZT0ANY6V1242POAF', '2022-02-03 18:38:45'),
(55, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'WBVQ83M9K7S1N6I2E911104', '2022-02-03 19:39:49'),
(56, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, '68N4XJS7131OA8H76Q05', '2022-02-03 20:08:45'),
(57, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'H8XS85WM2FB4V99E826G', '2022-02-03 20:38:45'),
(58, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Salem', 'US', NULL, '3V6A02166WM41B054GPK', '2022-02-04 06:05:20'),
(59, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'M4FZC01W89F1LV0K36HY', '2022-02-04 09:05:20'),
(60, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.67', 'Salem', 'US', NULL, 'KC9M337ET02N40619613', '2022-02-04 12:05:56'),
(61, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'BI9619X3G2H5QSO18R5W', '2022-02-04 14:03:52'),
(62, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, '1E56F19FJP1LEQ80VN9B104', '2022-02-04 16:05:20'),
(63, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Salem', 'US', NULL, '1E56F19FJP1LEQ80VN9B104', '2022-02-04 18:05:20'),
(64, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'Q0L537A6FDKE4ZM9BI4R', '2022-02-04 20:35:20'),
(65, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.73', 'Salem', 'US', NULL, 'FN8DQO3Y07SVA846ZW74', '2022-02-06 07:29:48'),
(66, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.169', 'Salem', 'US', NULL, 'AM0XT84Y5E4D603A0O98', '2022-02-07 01:21:28'),
(67, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.172', 'Salem', 'US', NULL, '7559S3R0BP6G671D47FZ', '2022-02-07 04:03:40'),
(68, 'Ahmed', 'test@gmail.com', 'Albania', 'Doctorate or higher', 'male', NULL, '106.202.236.134', 'Pune', 'IN', NULL, '3SV7L94IF5FFJ64WRC31', '2022-02-07 06:14:07'),
(69, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.174', 'Salem', 'US', NULL, '7Y296NZ6APFH63V8KIO3', '2022-02-07 06:17:27'),
(70, 'ahmed', 'dualsysco@gmail.com', 'India', 'Doctorate or higher', 'male', NULL, '106.202.236.134', 'Pune', 'IN', NULL, 'Q17RB3X2ITK5SAEHC835', '2022-02-07 07:15:31'),
(71, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.174', 'Salem', 'US', NULL, '9Y420A4754OP7AZ23XFT101', '2022-02-07 07:38:30'),
(72, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.172', 'Salem', 'US', NULL, 'FN8DQO3Y07SVA846ZW74', '2022-02-07 07:38:31'),
(73, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.169', 'Salem', 'US', NULL, '45NG8M70SE5T9A4H09F6', '2022-02-07 07:38:33'),
(74, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.172', 'Salem', 'US', NULL, '7559S3R0BP6G671D47FZ', '2022-02-07 21:26:53'),
(75, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.169', 'Salem', 'US', NULL, '43JDV0690OAN93Y151LQ', '2022-02-07 22:11:52'),
(76, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.169', 'Salem', 'US', NULL, 'M802A1I63J74EH30D965106', '2022-02-07 22:41:52'),
(77, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.174', 'Salem', 'US', NULL, '1E56F19FJP1LEQ80VN9B105', '2022-02-08 04:33:45'),
(78, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.174', 'Salem', 'US', NULL, 'CJ621T6FD5BLG57H4R0Q', '2022-02-08 06:33:46'),
(79, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.174', 'Salem', 'US', NULL, 'QC9FB86A9J051TRV70Z3', '2022-02-08 06:48:46'),
(80, 'zxkj', 'sada@asdsa.co', 'India', 'Doctorate or higher', 'male', NULL, '106.202.236.134', 'Pune', 'IN', NULL, 'Q17RB3X2ITK5SAEHC835', '2022-02-08 12:01:34'),
(81, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.73.73', 'Catoosa', 'US', NULL, '6H22TS6OK9DI90YAB1J2', '2022-02-08 13:15:22'),
(82, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.73.70', 'Catoosa', 'US', NULL, 'F39JFWFIPTDF15604N5G', '2022-02-08 18:15:20'),
(83, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.73.67', 'Catoosa', 'US', NULL, 'ZTB974L6AKQ30BS9Y201', '2022-02-08 18:51:21'),
(84, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.73.73', 'Catoosa', 'US', NULL, 'WI6S46F4HN1M88V0LBJ7', '2022-02-09 07:15:12'),
(85, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.73.67', 'Catoosa', 'US', NULL, '9Y420A4754OP7AZ23XFT101', '2022-02-09 09:03:05'),
(86, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.137', 'Columbia', 'US', NULL, '27F79X70F1C38YDJZ9O6', '2022-02-09 16:34:09'),
(87, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.130', 'Columbia', 'US', NULL, 'WBVQ83M9K7S1N6I2E911101', '2022-02-09 17:59:16'),
(88, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.148', 'Columbia', 'US', NULL, 'X419G7V5QE2Y5EHFNFAD', '2022-02-09 17:59:18'),
(89, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.137', 'Columbia', 'US', NULL, 'T6AQ4B9Y61IB12FKEAOW', '2022-02-09 18:29:20'),
(90, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.142', 'Columbia', 'US', NULL, '6D81G8Y20LRF7NSEO9AC', '2022-02-09 18:59:20'),
(91, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.137', 'Columbia', 'US', NULL, '426J69AR11HFT2LNV9IP', '2022-02-09 21:03:09'),
(92, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.142', 'Columbia', 'US', NULL, 'ATF61YNI2K749Q2DJEO9', '2022-02-09 21:59:20'),
(93, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.148', 'Columbia', 'US', NULL, 'M4FZC01W89F1LV0K36HY', '2022-02-09 22:44:20'),
(94, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.137', 'Columbia', 'US', NULL, '68N4XJS7131OA8H76Q05', '2022-02-10 00:20:52'),
(95, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.142', 'Columbia', 'US', NULL, '46CVEX92924GF08143WY', '2022-02-10 04:19:11'),
(96, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.148', 'Columbia', 'US', NULL, '9BD999LEJRFMW1S0D324', '2022-02-10 04:49:11'),
(97, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.148', 'Columbia', 'US', NULL, '1C4DK2FME9911B6JNPE3', '2022-02-10 07:04:11'),
(98, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.148', 'Columbia', 'US', NULL, '4RF1PMT7G5A39FV3W68K', '2022-02-10 09:03:11'),
(99, 'Basit Siddiqui', 'basit@sify.com', 'India', 'Bachelor\'s degree', 'male', NULL, '121.46.116.165', 'Aurangabad', 'IN', NULL, 'L1C87W35DF7J6B19XHEB', '2022-02-23 11:09:07'),
(100, 'Basit Siddiqui', 'basit@sify.com', 'India', 'Bachelor\'s degree', 'male', NULL, '121.46.116.165', 'Aurangabad', 'IN', NULL, 'Q17RB3X2ITK5SAEHC835', '2022-02-23 11:11:00'),
(101, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, 'SZH13T8WPJI93X7NYE8M', '2022-02-24 11:00:12'),
(102, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, '6H22TS6OK9DI90YAB1J2', '2022-02-24 11:06:41'),
(103, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, '45LQ30XBBD3F36YEBZB7', '2022-02-24 11:07:39'),
(104, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, '876B5O146PC6R2J12ABT', '2022-02-24 11:08:18'),
(105, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, '6MNDD2AV781808GLJK17', '2022-02-24 11:09:12'),
(106, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, '32C4TO919D896DXEKJS8', '2022-02-24 11:10:17'),
(107, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, '7DKZ1H4E299TRJ9A6M6V', '2022-02-24 11:13:03'),
(108, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, '7S1CI70235B4G7XD22ON', '2022-02-24 11:13:54'),
(109, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'JG1HZOBX15384R9AY83P', '2022-02-25 05:58:28'),
(110, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'JE5796P0T8S3HAD46Z4I', '2022-02-25 06:01:28'),
(111, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'JR9MBAGE65D0L3S2XHV6', '2022-02-25 06:04:10'),
(112, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, '5BQDEW76XDCGHL23SFM4', '2022-02-25 06:12:25'),
(113, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'K6HS7Y03Q6950713TA54', '2022-02-25 06:21:28'),
(114, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'KC9M337ET02N40619613', '2022-02-25 06:27:55'),
(115, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'FPN38VACS1EY9Z5I2R8H101', '2022-02-25 06:38:02'),
(116, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'FPN38VACS1EY9Z5I2R8H', '2022-02-25 06:40:41'),
(117, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'CDC15W14AFQXL8I07VH9', '2022-02-25 06:46:20'),
(118, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, '5CYSQ02B167X311G6163', '2022-02-25 06:47:23'),
(119, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', '35-40', '2.50.92.248', 'Al Ain City', 'AE', NULL, 'M2X37FA6T0497G98Q0NC', '2022-02-25 07:13:14'),
(120, 'دلال قاسم البلوشي', 'dalalalblooshi1983@gmail.com', 'Albania', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, 'SZH13T8WPJI93X7NYE8M', '2022-03-03 06:21:19'),
(121, 'دلال قاسم البلوشي', 'dalalalblooshi1983@gmail.com', 'Albania', 'Bachelor\'s degree', 'female', NULL, '185.66.16.143', 'Al Ain City', 'AE', NULL, 'SZH13T8WPJI93X7NYE8M', '2022-03-03 06:21:20'),
(122, 'sjdjhas', 'ashdkajs@asdasd.co', 'American Samoa', 'Primary education', 'male', NULL, '223.235.170.166', 'Koregaon', 'IN', NULL, '0FYH114EEK5I0R5MA658', '2022-03-07 07:15:36'),
(123, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.66.44', 'Siler City', 'US', NULL, '6WZ8HYG2582B5S577LDF', '2022-03-09 19:11:26'),
(124, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.66.46', 'Siler City', 'US', NULL, '93D0Y13EI6TSZE9192RF', '2022-03-11 20:30:49'),
(125, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.64.40', 'Columbia', 'US', NULL, '1E46881IB3AAS6VW6GZ4', '2022-03-13 07:46:16'),
(126, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'CB5A9398JC809HR120O4', '2022-03-16 10:00:52'),
(127, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'FI9K5YVW71FAM3099RQ8101', '2022-03-16 10:03:09'),
(128, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'GBCR5S911JTIAFM36678', '2022-03-16 10:04:53'),
(129, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, '890K2OFIA8F9E39X67V1', '2022-03-16 10:11:04'),
(130, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-03-16 10:14:04'),
(131, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'Q17RB3X2ITK5SAEHC835', '2022-03-16 10:18:34'),
(132, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'SZH13T8WPJI93X7NYE8M', '2022-03-16 10:26:43'),
(133, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'CDC15W14AFQXL8I07VH9', '2022-03-16 10:29:24'),
(134, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, '5BQDEW76XDCGHL23SFM4', '2022-03-16 10:34:00'),
(135, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, '5BQDEW76XDCGHL23SFM4', '2022-03-16 10:49:14'),
(136, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'WI6S46F4HN1M88V0LBJ7', '2022-03-16 11:04:49'),
(137, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'WI6S46F4HN1M88V0LBJ7', '2022-03-16 11:08:47'),
(138, 'Raahat Khan', 'raahatkhan658@gmail.com', 'India', 'Bachelor\'s degree', 'female', NULL, '122.181.112.100', 'Pune', 'IN', NULL, 'FPN38VACS1EY9Z5I2R8H', '2022-03-16 11:22:38'),
(139, 'MUHAMMAD HAIDER', 'hasnainhayder@hotmail.com', 'Pakistan', 'Bachelor\'s degree', 'male', '40-55', '125.168.118.101', 'Sydney', 'AU', NULL, 'BSZFK33R0D9NA2Y61HE2', '2022-04-26 18:42:18'),
(140, 'Muhammad', 'hasnainhayder3333@gmail.com', 'Pakistan', 'Bachelor\'s degree', 'male', '40-55', '125.168.118.101', 'Sydney', 'AU', NULL, 'BSZFK33R0D9NA2Y61HE2', '2022-04-28 15:36:52'),
(141, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'AM0XT84Y5E4D603A0O98', '2022-04-28 19:52:49'),
(142, NULL, NULL, NULL, NULL, NULL, NULL, '66.249.79.70', 'Salem', 'US', NULL, 'AM0XT84Y5E4D603A0O98', '2022-04-29 08:11:12'),
(143, 'sadhaj', 'asdhasj@asdas.c', 'Algeria', 'Vocational qualification', 'male', NULL, '223.236.155.233', 'Pimpri', 'IN', NULL, '0FYH114EEK5I0R5MA658', '2022-05-07 11:07:37'),
(144, 'Nahide', 'extraforwhenineedhay@gmail.com', 'Turkey', 'Secondary education', 'female', '25-35', '103.120.7.5', 'Adelaide', 'AU', NULL, '5BQDEW76XDCGHL23SFM4', '2022-05-20 00:48:12'),
(145, 'Nahide', 'extraforwhenineedhay@gmail.com', 'Turkey', 'Secondary education', 'female', '25-35', '103.120.7.5', 'Adelaide', 'AU', NULL, '5BQDEW76XDCGHL23SFM4', '2022-05-20 00:56:02'),
(146, 'Nahide', 'extraforwhenineedhay@gmail.com', 'Turkey', 'Secondary education', 'female', '25-35', '103.120.7.5', 'Adelaide', 'AU', NULL, '5BQDEW76XDCGHL23SFM4', '2022-05-20 00:57:32'),
(147, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.206.92', 'Los Angeles', 'US', NULL, '9Y420A4754OP7AZ23XFT102', '2022-05-25 02:29:18'),
(148, NULL, NULL, NULL, NULL, NULL, NULL, '172.71.22.34', 'Atlanta', 'US', NULL, 'WBVQ83M9K7S1N6I2E911107', '2022-05-25 15:06:50'),
(149, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.131.57', 'Chicago', 'US', NULL, '60W4QM38I0YEA731AXGD', '2022-05-25 16:00:23'),
(150, NULL, NULL, NULL, NULL, NULL, NULL, '141.101.69.239', 'Paris', 'FR', NULL, '08XYFC3MDSAEO9QV3GA7', '2022-05-30 04:44:47'),
(151, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.68.7', 'Dallas', 'US', NULL, 'RYZ43XIC8OM1A0NL8421', '2022-05-30 13:44:22'),
(152, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.70.50', 'Dallas', 'US', NULL, '19H48V27A5R0EWXZ4S83', '2022-05-31 00:03:25'),
(153, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.69.204', 'Dallas', 'US', NULL, 'SZR8T6AJ401NF0B9DABE', '2022-05-31 12:03:32'),
(154, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.71.90', 'Dallas', 'US', NULL, '097V32Z1BF356DD45LMS', '2022-05-31 12:28:06'),
(155, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.69.177', 'Dallas', 'US', NULL, 'CITQ3Y10F2WJ946RLH98', '2022-06-02 11:58:46'),
(156, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.174.216', 'Ashburn', 'US', NULL, 'F39JFWFIPTDF15604N5G', '2022-06-03 12:42:14'),
(157, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.34.190', 'Ashburn', 'US', NULL, '5384X30CE6WP9MV67B5G', '2022-06-04 01:26:28'),
(158, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.33.36', 'Los Angeles', 'US', NULL, '7Y296NZ6APFH63V8KIO3', '2022-06-04 12:04:29'),
(159, NULL, NULL, NULL, NULL, NULL, NULL, '108.162.246.117', 'Seattle', 'US', NULL, 'QC9FB86A9J051TRV70Z3', '2022-06-04 23:50:32'),
(160, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.126.234', 'Chicago', 'US', NULL, 'LWDCO1H1G2B7PDIAF709', '2022-06-05 12:20:53'),
(161, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.178.48', 'Chicago', 'US', NULL, 'Q17RB3X2ITK5SAEHC835', '2022-06-05 12:47:40'),
(162, NULL, NULL, NULL, NULL, NULL, NULL, '108.162.216.98', 'Chicago', 'US', NULL, '119D4CIH7ABJT9Z25KB6', '2022-06-05 14:20:53'),
(163, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.178.180', 'Chicago', 'US', NULL, '4RF1PMT7G5A39FV3W68K', '2022-06-05 15:14:28'),
(164, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.130.160', 'Chicago', 'US', NULL, 'K6HS7Y03Q6950713TA54', '2022-06-05 17:01:36'),
(165, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.131.131', 'Chicago', 'US', NULL, 'FGL4KDO0E487IV7N6Z29', '2022-06-05 17:55:10'),
(166, NULL, NULL, NULL, NULL, NULL, NULL, '108.162.216.162', 'Chicago', 'US', NULL, '2P0BVCF1GHW3N4M200ES', '2022-06-06 01:05:49'),
(167, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.178.212', 'Chicago', 'US', NULL, '8SX1QDZG6T0WEYI45AB0', '2022-06-06 12:17:37'),
(168, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.71.11', 'Dallas', 'US', NULL, '21XI30EEV4916TF6CNSG', '2022-06-06 12:44:24'),
(169, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.70.212', 'Dallas', 'US', NULL, 'FHE3IP44YWEN0JKZB513104', '2022-06-06 13:11:11'),
(170, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.70.96', 'Dallas', 'US', NULL, 'CJ621T6FD5BLG57H4R0Q', '2022-06-06 23:43:03'),
(171, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.135.9', 'Ashburn', 'US', NULL, 'WI6S46F4HN1M88V0LBJ7', '2022-06-07 23:49:30'),
(172, NULL, NULL, NULL, NULL, NULL, NULL, '162.158.78.12', 'Ashburn', 'US', NULL, '4HOSG03LR10F9447PC55', '2022-06-08 00:16:16'),
(173, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.175.45', 'Ashburn', 'US', NULL, '7DKZ1H4E299TRJ9A6M6V', '2022-06-08 00:43:08'),
(174, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.38.254', 'Ashburn', 'US', NULL, 'FN8DQO3Y07SVA846ZW74', '2022-06-08 01:09:56'),
(175, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.175.205', 'Ashburn', 'US', NULL, '43JDV0690OAN93Y151LQ', '2022-06-17 01:49:29'),
(176, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.71.158', 'Dallas', 'US', NULL, '1E56F19FJP1LEQ80VN9B105', '2022-06-20 00:18:17'),
(177, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.71.148', 'Dallas', 'US', NULL, '83HJ3O6M4Z52FYX5P6E0', '2022-06-20 00:18:19'),
(178, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.71.114', 'Dallas', 'US', NULL, '61BY14A32ZT7CQOXW15L', '2022-06-20 00:18:20'),
(179, NULL, NULL, NULL, NULL, NULL, NULL, '108.162.221.194', 'Dallas', 'US', NULL, '3YCXMNT8VS63A4HB1ILO', '2022-06-20 00:18:21'),
(180, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.70.138', 'Dallas', 'US', NULL, 'CDC15W14AFQXL8I07VH9', '2022-06-20 00:18:21'),
(181, NULL, NULL, NULL, NULL, NULL, NULL, '172.69.70.28', 'Dallas', 'US', NULL, 'JE5796P0T8S3HAD46Z4I', '2022-06-20 00:18:22'),
(182, NULL, NULL, NULL, NULL, NULL, NULL, '108.162.221.228', 'Dallas', 'US', NULL, 'OER32W7AS3KV63A9M73Z', '2022-06-20 00:18:22'),
(183, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.174.122', 'Ashburn', 'US', NULL, 'J8AX91C444BFWDR13LF8', '2022-06-22 23:58:48'),
(184, NULL, NULL, NULL, NULL, NULL, NULL, '172.68.253.116', 'Hong Kong', 'HK', NULL, '5BQDEW76XDCGHL23SFM4', '2022-06-24 05:33:49'),
(185, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.38.70', 'Ashburn', 'US', NULL, 'BEA3FBTBR0I5C6Z7208F', '2022-07-04 01:58:53'),
(186, NULL, NULL, NULL, NULL, NULL, NULL, '172.68.253.68', 'Hong Kong', 'HK', NULL, '5BQDEW76XDCGHL23SFM4', '2022-07-06 05:35:15'),
(187, NULL, NULL, NULL, NULL, NULL, NULL, '172.68.253.68', 'Hong Kong', 'HK', NULL, 'WI6S46F4HN1M88V0LBJ7', '2022-07-06 05:36:45'),
(188, NULL, NULL, NULL, NULL, NULL, NULL, '172.68.253.68', 'Hong Kong', 'HK', NULL, 'WI6S46F4HN1M88V0LBJ7', '2022-07-06 05:52:16'),
(189, NULL, NULL, NULL, NULL, NULL, NULL, '172.70.175.63', 'Ashburn', 'US', NULL, 'FPN38VACS1EY9Z5I2R8H', '2022-07-07 23:48:13'),
(190, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:51:50'),
(191, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:53:15'),
(192, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:54:51'),
(193, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:54:52'),
(194, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:54:53'),
(195, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:54:53'),
(196, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:54:54'),
(197, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:54:54'),
(198, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:54:54'),
(199, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:58:42'),
(200, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0K44B7CTEG6O4JMX1Z5L', '2022-10-30 15:58:51'),
(201, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, 'BIOL618YTHFEQ719XS3R', '2022-10-30 15:59:39'),
(202, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, 'F39JFWFIPTDF15604N5G', '2022-10-30 16:00:44'),
(203, 'asdas', 'asd@asdas.co', 'Algeria', 'No formal education', 'male', NULL, '::1', NULL, NULL, NULL, 'SZH13T8WPJI93X7NYE8M', '2022-10-31 10:55:39'),
(204, 'Ahmed', 'Ahmed@gmail.co', 'Algeria', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0FYH114EEK5I0R5MA658', '2022-10-31 12:41:05'),
(205, 'Ahmed', 'Ahmed@gmail.co', 'Algeria', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, 'F39JFWFIPTDF15604N5G', '2022-10-31 12:41:51'),
(206, 'Ahmed', 'Ahmed@gmail.co', 'Algeria', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, 'Q17RB3X2ITK5SAEHC835', '2022-10-31 12:43:45'),
(207, 'Ahmed', 'Ahmed@gmail.co', 'Algeria', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0FYH114EEK5I0R5MA658', '2022-10-31 12:49:20'),
(208, 'Ahmed', 'Ahmed@gmail.co', 'Algeria', 'Vocational qualification', 'male', NULL, '::1', NULL, NULL, NULL, '0FYH114EEK5I0R5MA658', '2022-10-31 12:50:06'),
(209, 'syed Zulkharnain', 'syedzulkharnain334@gmail.com', 'India', 'Bachelor\'s degree', 'male', NULL, '192.168.5.118', NULL, NULL, NULL, 'SZH13T8WPJI93X7NYE8M', '2023-02-17 16:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `ebook__onetime`
--

CREATE TABLE `ebook__onetime` (
  `onetime_id` bigint(255) NOT NULL,
  `ebook_id` bigint(255) NOT NULL,
  `unique_id` text NOT NULL,
  `ebook_path` text NOT NULL,
  `downloadable` int(255) NOT NULL DEFAULT 0,
  `expiry_date` text DEFAULT NULL,
  `created_at` text NOT NULL,
  `expired_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ebook__onetime`
--

INSERT INTO `ebook__onetime` (`onetime_id`, `ebook_id`, `unique_id`, `ebook_path`, `downloadable`, `expiry_date`, `created_at`, `expired_at`) VALUES
(1, 3, '2V65S4XL1671630F22BE', '301257984630377.pdf', 0, '2022-01-02', '2022-01-27 10:35:28', '27-01-2022 10:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` bigint(255) NOT NULL,
  `book_id` bigint(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `age` longtext DEFAULT NULL,
  `reader_action` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `send_date` varchar(255) DEFAULT NULL,
  `feedback_token` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `book_id`, `user_name`, `user_email`, `user_address`, `qualification`, `gender`, `message`, `rating`, `age`, `reader_action`, `created_at`, `send_date`, `feedback_token`) VALUES
(1, 551, 'Ahmed Al-Shahab', 'dualsysco@gmail.com', 'India', 'Doctorate or higher', 'male', NULL, NULL, '25', NULL, '2021-11-24 19:51:04', NULL, '2222a3650f42ba3d2eed43ae835b13c34838e314'),
(2, 592, 'khalifa', 'k.almehrezi@zhic.ae', 'United Arab Erimates', 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-25 15:40:30', NULL, '0f2fb8571a915106a4aad2e471814100f2e32c82'),
(3, 28, 'khalifa', 'k.almehrezi@zhic.ae', 'United Arab Erimates', 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-25 15:42:06', NULL, 'f70755f8042c742a4d4d62d4f2d91c39db18ba11'),
(4, 28, 'ahmed', 'dualsysco@gmail.com', 'India', 'Doctorate or higher', 'male', NULL, NULL, '25', NULL, '2021-11-25 15:50:30', NULL, '1e267790f2887ad8b42f63072a389f7fcc39ef21'),
(5, 602, 'ahmed', 'dualsysco@gmail.com', 'India', 'Doctorate or higher', 'male', NULL, NULL, '25', NULL, '2021-11-25 16:02:13', NULL, '14a2a08beb22abdc8c0d9824b59958ee048fb34f'),
(6, 21, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, NULL, '40', NULL, '2021-11-26 20:51:55', NULL, 'd854c9d090ac7cbcf18f831179345d78caad51d3'),
(7, 604, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, NULL, '40', NULL, '2021-11-26 20:53:42', NULL, '9b52e3db06167e81ad3b0a3d577d895bd061fd1b'),
(8, 7, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, NULL, '40', NULL, '2021-11-26 20:54:27', NULL, 'a46c4cdb9144e8fd4d56fb106df036b0eeb50c1c'),
(9, 585, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, NULL, '40', NULL, '2021-11-26 20:58:20', NULL, '8cbf3ae8fd36bafd06eb722bc80cbbedcac03603'),
(10, 650, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, NULL, '40', NULL, '2021-11-26 20:59:48', NULL, '6d5991898aaaffb36d327e8e6e95cba6b747d76a'),
(11, 34, 'ahmed', 'dualsysco@gmail.com', 'American Samoa', 'Vocational qualification', 'male', NULL, NULL, '40', NULL, '2021-11-26 21:01:24', NULL, 'a9e24a7cb709aa4f40e724d4690c92c798689b61'),
(12, 711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 09:20:41', NULL, 'ecb36d07dc3ccb4c34e945a6271ebb756e28e182'),
(13, 726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 09:22:21', NULL, '33af8f99350bc2953c5b2b42fa0767b071a8dedc'),
(14, 726, 'Ahmed AlShahab', 'dual@fgma.co', 'American Samoa', 'Bachelor\'s degree', 'male', NULL, NULL, '25', NULL, '2021-11-27 09:27:37', NULL, '76e7e1d8dc768ed2c8aa4a212e237e89410e2fde'),
(15, 531, 'ahmed', 'dualsysco@gmail.com', 'Algeria', 'Secondary education', 'male', NULL, NULL, '25', NULL, '2021-11-27 13:49:30', NULL, '60e38d0ed164e3eff7cc1caa5be9956258ececc2'),
(16, 30, 'aiNZC3Jlgr', 'abdurrehmanhab@gmail.com', 'American Samoa', NULL, 'male', NULL, NULL, '25', NULL, '2021-11-27 16:00:10', NULL, 'f0fc097f89f3f18a510bbb686bd5b456ca59309f'),
(17, 593, 'aiNZC3Jlgr', 'abdurrehmanhab@gmail.com', 'American Samoa', NULL, 'male', NULL, NULL, '25', NULL, '2021-11-27 17:31:39', NULL, '2a3f9fc9fa751d7ffea508f46e32da578451b5f8'),
(18, 586, 'ahmed', 'dualsysco@gmail.com', 'Algeria', 'Vocational qualification', 'male', NULL, NULL, '25', NULL, '2021-11-27 21:30:01', NULL, '77ad540e5682aea0ece19d85d4bebfe92114f320'),
(19, 545, 'ahmed', 'dualsysco@gmail.com', 'Algeria', 'Vocational qualification', 'male', NULL, NULL, '25', NULL, '2021-11-27 21:32:20', NULL, '29fc7964bfd7bed27ef2ecd21a909643444ee4e3'),
(20, 531, 'basit', 'basit@gmail.com', 'India', 'Bachelor\'s degree', 'male', NULL, NULL, '35', NULL, '2021-11-28 00:30:54', NULL, '6506f04b8c9e81f1c0031572d7cba6e2dec3287e'),
(21, 28, 'basit', 'basit@gmail.com', 'India', 'Bachelor\'s degree', 'male', NULL, NULL, '35', NULL, '2021-11-28 00:32:17', NULL, '4aff12680d4c336bc13ca39238d192f3f8d3da4a'),
(22, 604, 'basit', 'basit@gmail.com', 'India', 'Bachelor\'s degree', 'male', NULL, NULL, '35', NULL, '2021-11-28 00:54:57', NULL, '7cb5cb4ca130d037f136f707a2b661d400f154f8'),
(23, 723, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 09:44:10', NULL, '3e0d5b813a5d81fbb49816d3cb21524684a77664'),
(24, 32, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 09:47:07', NULL, '9255ca23724c51b62935f81911289e3f525c4a9e'),
(25, 531, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 09:48:55', NULL, 'd7bfc4938248d4fcda9574fe46d2b2e10a44dd06'),
(26, 23, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 09:53:36', NULL, '6221237ce38dc0f3627a53850e68d4c0e28a5123'),
(27, 545, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 09:57:18', NULL, 'b213e528dee0078df92ed88ff0b980403210f6be'),
(28, 573, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 09:59:56', NULL, 'ee9ebfec429d68b35d3f103a93a2b6d26545a9a4'),
(29, 650, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 10:03:15', NULL, '260998b6a9efeeff4a61a8f6be480d5a72139860'),
(30, 7, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 10:04:13', NULL, 'b2b08b84e3a8fc06aeed103875468cd925fd0568'),
(31, 27, 'khalifa', 'k.almehrezi@zhic.ae', NULL, 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2021-11-28 10:05:26', NULL, '6449591d1b9930f3a5cfea08594ddaa76c5b4d36'),
(32, 42, 'sadsa', 'dsadasd', 'Algeria', 'Bachelor\'s degree', 'male', NULL, NULL, '25', NULL, '2021-11-29 14:07:19', NULL, '347eca1f04a76ab0c99d1c1c49f4fe267b5d7a03'),
(33, 28, 'Dalal', 'Dalal@hotmail.com', 'Brazil', 'Bachelor\'s degree', 'female', NULL, NULL, '25', NULL, '2021-11-30 12:00:21', NULL, '9920b9ae5234d2db0657e2a3ce6630fe6b91481c'),
(34, 609, 'Dalal', 'Dalal@hotmail.com', 'Brazil', 'Bachelor\'s degree', 'female', NULL, NULL, '25', NULL, '2021-11-30 12:03:52', NULL, 'cd8ef65f37a5aa40a600c0c3282161bda3af9a78'),
(35, 726, 'Dalal', 'Dalal@hotmail.com', 'Brazil', 'Bachelor\'s degree', 'female', NULL, NULL, '25', NULL, '2021-11-30 12:08:50', NULL, '862ba2ad76cc5d68de2cb990804b8f4ddee99d81'),
(36, 28, 'Khalifa', 'kh.zhic@gmail.com', 'Algeria', 'Master\'s degree', 'male', NULL, NULL, '40', NULL, '2021-11-30 12:40:16', NULL, '75d351034d2ed1a32673cf012ece5952406f867d'),
(37, 535, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 12:59:23', NULL, '77d8d516bb167dae6a30844eea1152d911420f3d'),
(38, 534, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 13:08:16', NULL, '40e5e4af92f76816c262fce845b1f49310b26ce0'),
(39, 533, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 13:12:03', NULL, 'db184275fe6b28bcbdfbc60f077a1406c5f98cd7'),
(40, 532, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 13:13:55', NULL, 'd1fecd9ecc507c193797ca95d17e69606910ca03'),
(41, 27, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:04:39', NULL, 'e864dbe01b356bf7bebd8b5d41f5786d0dbf98c6'),
(42, 604, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:18:14', NULL, '138c7ad707ab2170d9334696d499ff1de5aba563'),
(43, 583, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:20:24', NULL, 'b7b674dcc63ee06381bcb6c0403b9608923cac22'),
(44, 605, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:22:06', NULL, '47db58aea7273cb38b62f3b6058280f8a16fe9f2'),
(45, 541, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:23:56', NULL, '9675c794989335da0827dd71cb18feccbc8ccc43'),
(46, 34, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:25:48', NULL, 'dc5a9bd80587a5ebfa9f1a8e49f5b08656c74d0e'),
(47, 9, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:27:16', NULL, 'a0de43ce26b8e4b7b2a7eaf3ea2687892c79bd42'),
(48, 648, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:29:06', NULL, '7dac986c9501ee3801e7840614c3a9d898817af4'),
(49, 633, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:31:24', NULL, 'da008af7ddd93892272f330be478038052f655f6'),
(50, 24, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:33:07', NULL, '0d70d951e5e25ebb39ed87e47a07e65b776acdd0'),
(51, 592, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:34:37', NULL, '20aeac5e5b266df32f6f3e77b886544b2260535a'),
(52, 21, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:36:30', NULL, '2ad4fd721e84d718476898c96ba47a0c126846e7'),
(53, 32, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:38:44', NULL, '56ab30dfbcf9d07177fec1c53643dde91c6d4f47'),
(54, 531, 'sadsa', 'dsadas', 'Albania', 'Primary education', 'male', NULL, NULL, '25', NULL, '2021-11-30 14:39:00', NULL, '5a33efb385d7b5003a7ba73b876ecf870d1bcf15'),
(55, 605, 'sadasd', 'sadsadas', 'American Samoa', 'Secondary education', 'male', NULL, NULL, '55', NULL, '2021-11-30 14:49:58', NULL, '6165134f6e438098262745d2cdbc8978c7217a2e'),
(56, 606, 'sadasd', 'sadsadas', 'American Samoa', 'Secondary education', 'male', NULL, NULL, '55', NULL, '2021-11-30 14:50:24', NULL, 'e19d52e96dc34919317cebbdf3f116b540353a47'),
(57, 592, 'khalifa', 'kh.zhic@gmail.com', 'United Arab Erimates', 'Master\'s degree', 'male', NULL, NULL, '40', NULL, '2021-12-07 13:51:16', NULL, '2407f488484aaabb82d392f09dba39a8948364f6'),
(58, 573, 'khalifa', 'kh.zhic@gmail.com', 'United Arab Erimates', 'Master\'s degree', 'male', NULL, NULL, '40', NULL, '2021-12-07 13:57:05', NULL, '43b1ae6e1fb4de96113459cbbd15514e8543232b'),
(59, 27, 'asdasd', 'sadsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-14 14:22:30', NULL, 'bc29de36296578aa098d5f91d1cb4fa2ddaddac2'),
(60, 535, 'khalifa', 'kh.zhic@gmail.com', 'United Arab Erimates', 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2022-01-24 09:43:03', NULL, 'd6803648a1e1441cddb04a72cdf74878793acced'),
(61, 652, 'sadasd', 'asdsa@asdas.co', 'Andorra', 'Vocational qualification', 'male', NULL, NULL, '25', NULL, '2022-01-26 16:56:19', NULL, 'da2d8589f46bb2a6e0716a2fc53c412da1514a68'),
(62, 26, 'khalifa', 'k.almehrezi@zhic.ae', 'United Arab Erimates', 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2022-01-27 11:46:27', NULL, '4a38f49fb9997e13952932aa807f3e05ef954d78'),
(63, 26, 'ahmed', 'dualsysco@gmail.com', 'Andorra', 'Vocational qualification', 'male', NULL, NULL, '40', NULL, '2022-01-27 15:43:37', NULL, '9c430be8dcb985e3be062a06c1412f8b1ff04cbc'),
(64, 29, 'khalifa', 'k.almehrezi@zhic.ae', 'United Arab Erimates', 'Doctorate or higher', 'male', NULL, NULL, '40', NULL, '2022-01-27 15:43:56', NULL, 'e0e126219e1aeba7408bff015123a3ff6b12756a'),
(65, 10, 'Ahmed new', 'test@gadasdsa.co', 'Algeria', 'Vocational qualification', 'male', NULL, NULL, '25', NULL, '2022-01-29 18:25:37', NULL, 'bbcd6e93984ff72a088b94a19000d0f90f767ca9'),
(66, 650, 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'Woho wo ho ho', 4, '0', 'Read', '2022-01-30 13:11:03', NULL, '6a094035e121511107faa8f2a6bf32ebcb33af56'),
(67, 650, 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'Ahmed Al-Shahab', 'ttttt', 5, '0', 'Read', '2022-01-30 13:32:51', NULL, 'a1ee7eecbbc0e69ee82e66b15ef80fbb0134215b'),
(68, 650, 'tester tester', 'tester tester', 'tester tester', 'tester tester', 'tester tester', 'tesadsa dasd as', 5, 'tester tester', 'Read', '2022-01-30 15:35:24', NULL, '4272ab520f63d75c3ce8e38bcf0cac7691358773'),
(69, 23, 'dalal', 'dalalalblooshi1983@gmail.com', 'United Arab Erimates', 'Bachelor\'s degree', 'female', NULL, NULL, '35-40', 'Download/Print', '2022-02-25 11:24:51', NULL, '315dc5a134aa199e193fca3c56b4d98e9541a8a0'),
(70, NULL, 'dalal', 'dalal', 'dalal', 'dalal', 'dalal', 'great', 5, 'dalal', 'Read', '2022-02-25 10:27:48', NULL, '5b1191912f3765712989f54754576d1373a466d5'),
(71, 9, 'Yasir NV', 'nvyasir@gmail.com', 'India', 'Master\'s degree', 'male', NULL, NULL, '25-35', 'Download/Print', '2022-03-16 21:05:47', NULL, '37f7d7c2b4766bb82c983ffa4a6f15ead74ceb3e'),
(72, 41, 'dalal', 'dalalalblooshi1983@gmail.com', 'Algeria', 'Bachelor\'s degree', 'female', NULL, NULL, '35-40', 'Download/Print', '2022-03-28 14:09:49', NULL, '3612980d207e58edb38121296e79fed1e2703788'),
(73, 21, 'Tom', 'cobabi1468@vsooc.com', 'India', 'Bachelor\'s degree', 'male', NULL, NULL, '25-35', 'Download/Print', '2022-03-30 22:32:53', NULL, '7e14279a257aae88ee92a0f5c252f6b21c8fb7bc'),
(74, 539, 'dfghdfgfdgdfgg', 'dfgdfggfdfgdfg@sfdgfgfdgdfgd.com', 'Afganistan', 'Bachelor\'s degree', 'male', NULL, NULL, '35-40', 'Download/Print', '2022-04-07 17:27:13', NULL, '169ecda0e729e56d1a04ba1d6f614fe269c49a3e'),
(75, 9, 'test', 'test', 'United Arab Erimates', 'No formal education', 'female', NULL, NULL, '35-40', 'Download/Print', '2022-04-26 14:12:50', NULL, 'a012b8209c7e632f7c025b8f4e763bdb0ff99752'),
(76, 21, 'MUHAMMAD HAIDER', 'hasnainhayder@hotmail.com', 'Pakistan', 'Bachelor\'s degree', 'male', NULL, NULL, '40-55', 'Download/Print', '2022-04-27 00:11:59', NULL, '0c1bdc94e9545180d0d02ac87799e2c344ed4d41'),
(77, 21, 'Muhammad', 'hasnainhayder3333@gmail.com', 'Pakistan', 'Bachelor\'s degree', 'male', NULL, NULL, '40-55', 'Download/Print', '2022-04-28 21:06:43', NULL, '8c11cd9977fdfb6d5330b6b6e792f00949200f92'),
(78, 28, 'Nahide', 'extraforwhenineedhay@gmail.com', 'Turkey', 'Secondary education', 'female', NULL, NULL, '25-35', 'Download/Print', '2022-05-20 06:17:29', NULL, 'e2cf9a1a8cd0b3dbc27ea652a7e9ec873ce42ddc'),
(79, 26, 'ahmed', 'ahmed', 'ahmed', 'ahmed', 'ahmed', NULL, 5, 'ahmed', 'Read', '2022-10-30 14:29:27', NULL, '82de0ae43718d7613b3332fee79a76ba89b4f067'),
(80, 551, 'ahmed', 'ahmed', 'ahmed', 'ahmed', 'ahmed', 'sa', 4, 'ahmed', 'Read', '2022-10-30 14:30:05', NULL, '7b23c13acc0c9230de25756c433a4780be9683b5'),
(81, 42, 'ahmed', 'ahmed', 'ahmed', 'ahmed', 'ahmed', NULL, 4, 'ahmed', 'Read', '2022-10-30 14:31:20', NULL, 'd4eb29faf3f1e04d6c32177d8d114585b6658fe3'),
(82, 9, 'Ahmed', 'Ahmed', 'Ahmed', 'Ahmed', 'Ahmed', 'i like it', 4, 'Ahmed', 'Read', '2022-10-31 11:14:09', NULL, 'b1c1b1572e9c4d9117f906df270f0b01cd4ce0cb'),
(83, 10, 'my full name', 'me@mydomain.com', 'Albania', 'Vocational qualification', 'male', NULL, NULL, '25-35', NULL, '2023-03-27 15:05:39', NULL, NULL),
(84, 10, 'my full name', 'me@mydomain.com', 'Algeria', 'Bachelor\'s degree', 'male', NULL, NULL, '35-40', NULL, '2023-03-27 15:20:05', NULL, NULL),
(85, 10, 'dEGJUJXqt7', '5kpksgwH0J', 'Albania', 'Bachelor\'s degree', 'male', NULL, NULL, '25-35', NULL, '2023-03-31 12:06:39', NULL, NULL),
(86, 531, 'UhUt8ltTja', 'cNKWy89N6c', 'American Samoa', 'Primary education', 'male', NULL, NULL, '35-40', NULL, '2023-03-31 15:50:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` bigint(255) NOT NULL,
  `lang_type` varchar(255) DEFAULT NULL,
  `language` text DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `lang_type`, `language`, `created_at`, `updated_at`) VALUES
(1, 'African', 'Amharic', '2021-08-17 11:26:19', NULL),
(2, 'Asian', 'Arabic', '2021-08-17 11:26:26', NULL),
(3, 'Asian', 'Aromi', '2021-08-17 11:26:34', NULL),
(4, 'European', 'English', '2021-08-17 11:26:41', NULL),
(5, 'European', 'French', '2021-08-17 11:26:49', NULL),
(7, 'Asian', 'Indonesian', '2021-08-17 11:27:06', NULL),
(8, 'African', 'Kiswahili', '2021-08-17 11:27:17', NULL),
(9, 'Asian', 'Korean', '2021-08-17 11:27:25', NULL),
(10, 'Asian', 'Mandarian', '2021-08-17 11:27:34', NULL),
(11, 'Asian', 'Senhali', '2021-08-17 18:20:41', NULL),
(12, 'European', 'Russian', '2021-08-17 18:38:19', NULL),
(13, 'African', 'Oromo', '2021-08-17 18:46:03', NULL),
(14, 'Asian', 'Tagalog', '2021-08-17 18:49:06', NULL),
(15, 'African', 'Sawahili', '2021-09-02 16:24:54', '2021-09-02 16:25:08'),
(16, 'Asian', 'Urdu', '2021-09-09 20:29:26', NULL),
(17, 'Asian', 'Hindi', '2021-09-09 20:29:43', NULL),
(18, 'Asian', 'Turkish', '2021-09-10 15:49:39', NULL),
(19, 'Asian', 'Bangali', '2021-09-10 16:09:54', NULL),
(20, 'Lingala', 'Lingala', '2021-09-10 16:27:07', NULL),
(21, NULL, 'German', '2021-11-20 17:18:36', NULL),
(22, NULL, 'Spanish', '2021-11-20 19:35:56', NULL),
(23, NULL, 'Tamil', '2021-11-21 13:43:06', NULL),
(24, NULL, 'Vietnamese', '2021-11-21 16:36:32', NULL),
(25, NULL, 'Azerbaijani', '2021-11-21 16:41:27', '2021-11-21 16:44:26'),
(26, NULL, 'Kurdish', '2021-11-21 16:51:01', NULL),
(27, NULL, 'Japanese', '2021-11-21 17:01:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `main_slider`
--

CREATE TABLE `main_slider` (
  `slider_id` bigint(255) NOT NULL,
  `slider_heading` text DEFAULT NULL,
  `slider_heading_ar` longtext NOT NULL DEFAULT '-',
  `link` varchar(255) DEFAULT NULL,
  `slider_caption` text DEFAULT NULL,
  `slider_caption_ar` longtext NOT NULL DEFAULT '-',
  `slider_bg` varchar(255) DEFAULT NULL,
  `slider_img` longtext NOT NULL,
  `slider_position` int(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `navigation_id` bigint(255) NOT NULL,
  `navigation_name` text DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`navigation_id`, `navigation_name`, `created_at`, `updated_at`) VALUES
(1, 'The Holy Quraan', '2021-08-28 20:35:15', NULL),
(2, 'Meanings of the Holy Quraan', '2021-08-28 20:35:27', '2021-08-28 20:35:36'),
(3, 'Islamic Cultural Books', '2021-08-28 20:36:04', NULL),
(4, 'Arabic Books for Speakers of other Languages', '2021-08-28 20:36:19', NULL),
(5, 'Children books', '2021-08-28 20:36:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `navigation__sub`
--

CREATE TABLE `navigation__sub` (
  `sub_navigation_id` bigint(255) NOT NULL,
  `navigation_id` bigint(255) DEFAULT NULL,
  `sub_navigation_name` text DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `navigation__sub`
--

INSERT INTO `navigation__sub` (`sub_navigation_id`, `navigation_id`, `sub_navigation_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'E reading Quran', '2021-08-28 20:37:30', NULL),
(2, 1, 'Audio  Quran', '2021-08-28 20:37:44', '2021-08-28 20:37:52'),
(3, 2, 'Asian Languages', '2021-08-28 20:38:12', NULL),
(4, 2, 'European Languages', '2021-08-28 20:38:25', NULL),
(5, 2, 'African Languages', '2021-08-28 20:38:42', NULL),
(6, 3, 'Asian Languages', '2021-08-28 20:40:36', NULL),
(7, 3, 'European Languages', '2021-08-28 20:40:53', NULL),
(8, 3, 'African Languages', '2021-08-28 20:41:07', NULL),
(9, 4, 'Asian Languages', '2021-08-28 20:41:40', NULL),
(10, 4, 'European Languages', '2021-08-28 20:41:52', NULL),
(11, 4, 'African Languages', '2021-08-28 20:42:05', NULL),
(12, 5, 'Stories', '2021-08-28 20:42:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` bigint(255) NOT NULL,
  `category_id` bigint(255) DEFAULT NULL,
  `sub_cat_id` bigint(255) DEFAULT NULL,
  `promotion_attachment` longtext DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_id`, `category_id`, `sub_cat_id`, `promotion_attachment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '56850_banner.jpeg', '2021-07-28 13:02:08', '2021-09-15 15:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `admin_id` int(255) NOT NULL,
  `admin_name` text NOT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL,
  `deleted_at` text DEFAULT NULL,
  `date` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `created_at`, `updated_at`, `deleted_at`, `date`, `status`) VALUES
(1, 'admin', 'hab@gmail.com', '8899', '2021-04-06 14:38:00', NULL, NULL, '2021-04-06', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audiobook`
--
ALTER TABLE `audiobook`
  ADD PRIMARY KEY (`audio_id`);

--
-- Indexes for table `audiobook__location`
--
ALTER TABLE `audiobook__location`
  ADD PRIMARY KEY (`location_id`);

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
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category__sub`
--
ALTER TABLE `category__sub`
  ADD PRIMARY KEY (`sub_cat_id`);
ALTER TABLE `category__sub` ADD FULLTEXT KEY `sub_cat_name` (`sub_cat_name`);

--
-- Indexes for table `category__third`
--
ALTER TABLE `category__third`
  ADD PRIMARY KEY (`third_cat_id`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`file_id`);
ALTER TABLE `ebook` ADD FULLTEXT KEY `file_name` (`file_name`,`file_note`);
ALTER TABLE `ebook` ADD FULLTEXT KEY `file_author` (`file_author`);
ALTER TABLE `ebook` ADD FULLTEXT KEY `file_note` (`file_note`);

--
-- Indexes for table `ebook__audios`
--
ALTER TABLE `ebook__audios`
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
-- Indexes for table `ebook__onetime`
--
ALTER TABLE `ebook__onetime`
  ADD PRIMARY KEY (`onetime_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);
ALTER TABLE `language` ADD FULLTEXT KEY `language` (`language`);

--
-- Indexes for table `main_slider`
--
ALTER TABLE `main_slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`navigation_id`);

--
-- Indexes for table `navigation__sub`
--
ALTER TABLE `navigation__sub`
  ADD PRIMARY KEY (`sub_navigation_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audiobook`
--
ALTER TABLE `audiobook`
  MODIFY `audio_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audiobook__location`
--
ALTER TABLE `audiobook__location`
  MODIFY `location_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book_request`
--
ALTER TABLE `book_request`
  MODIFY `request_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `book_shelf`
--
ALTER TABLE `book_shelf`
  MODIFY `book_shelf_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category__sub`
--
ALTER TABLE `category__sub`
  MODIFY `sub_cat_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category__third`
--
ALTER TABLE `category__third`
  MODIFY `third_cat_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `ebook`
--
ALTER TABLE `ebook`
  MODIFY `file_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;

--
-- AUTO_INCREMENT for table `ebook__audios`
--
ALTER TABLE `ebook__audios`
  MODIFY `audio_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1585;

--
-- AUTO_INCREMENT for table `ebook__cover`
--
ALTER TABLE `ebook__cover`
  MODIFY `ebook__cover_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ebook__location`
--
ALTER TABLE `ebook__location`
  MODIFY `location_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `ebook__onetime`
--
ALTER TABLE `ebook__onetime`
  MODIFY `onetime_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `main_slider`
--
ALTER TABLE `main_slider`
  MODIFY `slider_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `navigation_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `navigation__sub`
--
ALTER TABLE `navigation__sub`
  MODIFY `sub_navigation_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `admin_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
