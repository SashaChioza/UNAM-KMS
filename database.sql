-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.33-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table unam_kms.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- Dumping data for table unam_kms.category: ~3 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT IGNORE INTO `category` (`category_id`, `name`, `description`) VALUES
	(1, 'Programming', ''),
	(2, 'Security', ''),
	(3, 'Database', '');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table unam_kms.course
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year_of_study` enum('First Year','Second Year','Third Year','Fourth Year') NOT NULL DEFAULT 'First Year',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32 COMMENT='School Courses';

-- Dumping data for table unam_kms.course: ~3 rows (approximately)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT IGNORE INTO `course` (`course_id`, `code`, `title`, `year_of_study`) VALUES
	(1, 'CS101', 'Introduction to Computer Science', 'First Year'),
	(2, 'CMP3671', 'Computer Networks', 'Second Year'),
	(3, 'CMP123', 'Digital Electronics', 'First Year');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- Dumping structure for table unam_kms.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Dumping data for table unam_kms.migration: ~15 rows (approximately)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT IGNORE INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1561789189),
	('m130524_201442_init', 1561789192),
	('m140209_132017_init', 1561799128),
	('m140403_174025_create_account_table', 1561799128),
	('m140504_113157_update_tables', 1561799129),
	('m140504_130429_create_token_table', 1561799129),
	('m140830_171933_fix_ip_field', 1561799129),
	('m140830_172703_change_account_table_name', 1561799129),
	('m141222_110026_update_ip_field', 1561799129),
	('m141222_135246_alter_username_length', 1561799130),
	('m150614_103145_update_social_account_table', 1561799130),
	('m150623_212711_fix_username_notnull', 1561799130),
	('m151218_234654_add_timezone_to_profile', 1561799130),
	('m160929_103127_add_last_login_at_to_user_table', 1561799130),
	('m190124_110200_add_verification_token_column_to_user_table', 1561789192);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;

-- Dumping structure for table unam_kms.post
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `topic_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_topic` (`topic_id`),
  CONSTRAINT `post_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- Dumping data for table unam_kms.post: ~0 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT IGNORE INTO `post` (`post_id`, `content`, `topic_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
	(2, '<p>&lt;a href="<a href="<a href=" http:="" www.google.com"="">www.google.com"&gt;Visit</a> Google&lt;/a&gt;</p>', 2, NULL, NULL, NULL, NULL),
	(4, '<p>TEST NEW COMMENT</p>', 3, 1562231251, 1562231251, 2, 2),
	(5, '<p>MAKE ANOTHER COMMENT</p>', 3, 1562231276, 1562231276, 2, 2),
	(6, '<p>nero</p>', 3, 1562232342, 1562232342, 2, 2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table unam_kms.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table unam_kms.profile: ~2 rows (approximately)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT IGNORE INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
	(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;

-- Dumping structure for table unam_kms.social_account
CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table unam_kms.social_account: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;

-- Dumping structure for table unam_kms.student
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_number` varchar(50) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_number` (`registration_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COMMENT='Student Database';

-- Dumping data for table unam_kms.student: ~2 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT IGNORE INTO `student` (`student_id`, `registration_number`, `active`) VALUES
	(1, '201607291', 'Y'),
	(2, '201607292', 'Y');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table unam_kms.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Dumping data for table unam_kms.tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping structure for table unam_kms.token
CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table unam_kms.token: ~0 rows (approximately)
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;

-- Dumping structure for table unam_kms.topic
CREATE TABLE IF NOT EXISTS `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `description` text,
  `category` int(11) NOT NULL,
  `course` int(11) DEFAULT NULL,
  `tags` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topic_category` (`category`),
  KEY `topic_course` (`course`),
  CONSTRAINT `topic_category` FOREIGN KEY (`category`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE,
  CONSTRAINT `topic_course` FOREIGN KEY (`course`) REFERENCES `course` (`course_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32;

-- Dumping data for table unam_kms.topic: ~4 rows (approximately)
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT IGNORE INTO `topic` (`topic_id`, `subject`, `description`, `category`, `course`, `tags`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
	(2, 'Data Structures and Algorithms', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Data Mining', '<p>My Data Mining Resource List</p><ul><li><a href="https://www.stackoverflow.com" target="_blank">Stack Overflow</a></li><li><a href="https://www.daniweb.com" target="_blank">Dani Web</a></li></ul>', 1, 1, NULL, 1562162982, 1562167555, 2, 2),
	(4, ' Sending Text to the Printer (Python)', '<p>The printer seems to be a much ignored computer peripheral when it comes to programming. This little code snippet explores one way to send text to the default printer. It actually draws the text into an imaginary box on the paper. You can specify the upper left and lower right corners of this box.</p>', 1, NULL, NULL, 1562175092, 1562175092, 2, 2),
	(5, 'about the javascript string split function', '<p>it is about splitting at the string end with a regexp as splitter</p><pre><code><span class="str">\'ab \'</span><span class="pun">.</span><span class="pln">split</span><span class="pun">(</span><span class="str">/\\s*$/</span><span class="pun">)</span></code></pre> <p>outputs : [\'ab\', \'\']</p><p>but if I remove the ending space </p><pre><code><span class="str">\'ab\'</span><span class="pun">.</span><span class="pln">split</span><span class="pun">(</span><span class="str">/\\s*$/</span><span class="pun">)</span> </code></pre> <p>outputs : [\'ab\']</p><p>why the second one does not have a \'\' in the output ? </p>', 1, 1, NULL, 1562218495, 1562218495, 2, 2);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;

-- Dumping structure for table unam_kms.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table unam_kms.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
	(2, 'admin', 'matembudzeb@gmail.com', '$2y$10$kEsVhw2qtZ64kiA6QpNdiOYzIH8f2BV3IoTSFofEi6Lkrmn6VKxja', 'nSX7rWK09oxHLEteqjmpKeCpaXgyexDi', 1561862003, NULL, NULL, NULL, 1561862003, 1561862003, 0, 1562219814),
	(3, 'Sasha', 'sashachioza@gmail.com', '$2y$10$EzEodmAQTR.Curgi553rAOPVqEK.Q2ykeTm222khLJGROV0MvU.ye', 'CVaIIX4UIVRv0uGwIorHIvd1Nz08Vm-y', 1562177882, NULL, NULL, '192.168.1.39', 1562177752, 1562177752, 0, 1562179058);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
