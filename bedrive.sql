-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 26, 2020 at 07:21 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fimadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing_plans`
--

DROP TABLE IF EXISTS `billing_plans`;
CREATE TABLE IF NOT EXISTS `billing_plans` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(13,2) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `interval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `interval_count` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) DEFAULT NULL,
  `legacy_permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `free` tinyint(1) NOT NULL DEFAULT 0,
  `show_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_space` bigint(20) UNSIGNED DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `billing_plans_hidden_index` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `commentable_id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_path_index` (`path`),
  KEY `comments_user_id_index` (`user_id`),
  KEY `comments_commentable_id_index` (`commentable_id`),
  KEY `comments_commentable_type_index` (`commentable_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `css_themes`
--

DROP TABLE IF EXISTS `css_themes`;
CREATE TABLE IF NOT EXISTS `css_themes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_dark` tinyint(1) NOT NULL DEFAULT 0,
  `default_light` tinyint(1) NOT NULL DEFAULT 0,
  `default_dark` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `colors` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `css_themes_name_unique` (`name`),
  KEY `css_themes_default_light_index` (`default_light`),
  KEY `css_themes_default_dark_index` (`default_dark`),
  KEY `css_themes_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `css_themes`
--

INSERT INTO `css_themes` (`id`, `name`, `is_dark`, `default_light`, `default_dark`, `user_id`, `colors`, `created_at`, `updated_at`) VALUES
(1, 'Dark', 1, 0, 1, 1, '{\"--be-primary-lighter\":\"#3f3f3f\",\"--be-primary-default\":\"#1D1D1D\",\"--be-primary-darker\":\"#181c26\",\"--be-accent-default\":\"#8AB2E0\",\"--be-accent-lighter\":\"#B9D1EC\",\"--be-accent-contrast\":\"rgba(255, 255, 255, 1)\",\"--be-accent-emphasis\":\"rgba(185, 209, 236, 0.1)\",\"--be-foreground-base\":\"#fff\",\"--be-text\":\"#fff\",\"--be-hint-text\":\"rgba(255, 255, 255, 0.5)\",\"--be-secondary-text\":\"rgba(255, 255, 255, 0.7)\",\"--be-label\":\"rgba(255, 255, 255, 0.7)\",\"--be-background\":\"#1D1D1D\",\"--be-background-alternative\":\"#121212\",\"--be-divider-lighter\":\"rgba(255, 255, 255, 0.06)\",\"--be-divider-default\":\"rgba(255, 255, 255, 0.12)\",\"--be-disabled-button-text\":\"rgba(255, 255, 255, 0.3)\",\"--be-disabled-toggle\":\"#000\",\"--be-chip\":\"#616161\",\"--be-hover\":\"rgba(255, 255, 255, 0.04)\",\"--be-selected-button\":\"#212121\",\"--be-disabled-button\":\"rgba(255, 255, 255, 0.12)\",\"--be-raised-button\":\"#424242\",\"--be-backdrop\":\"#BDBDBD\",\"--be-link\":\"#c5cae9\"}', '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(2, 'Light', 0, 1, 0, 1, '{\"--be-primary-lighter\":\"#3e4a66\",\"--be-primary-default\":\"#2B3346\",\"--be-primary-darker\":\"#181c26\",\"--be-accent-default\":\"#1565C0\",\"--be-accent-lighter\":\"#B9D1EC\",\"--be-accent-contrast\":\"rgba(255, 255, 255, 1)\",\"--be-accent-emphasis\":\"rgba(185, 209, 236, 0.15)\",\"--be-background\":\"rgb(255, 255, 255)\",\"--be-background-alternative\":\"rgb(250, 250, 250)\",\"--be-foreground-base\":\"black\",\"--be-text\":\"rgba(0, 0, 0, 0.87)\",\"--be-hint-text\":\"rgba(0, 0, 0, 0.38)\",\"--be-secondary-text\":\"rgba(0, 0, 0, 0.54)\",\"--be-label\":\"rgba(0, 0, 0, 0.87)\",\"--be-disabled-button-text\":\"rgba(0, 0, 0, 0.26)\",\"--be-divider-lighter\":\"rgba(0, 0, 0, 0.06)\",\"--be-divider-default\":\"rgba(0, 0, 0, 0.12)\",\"--be-hover\":\"rgba(0,0,0,0.04)\",\"--be-selected-button\":\"rgb(224, 224, 224)\",\"--be-chip\":\"#e0e0e0\",\"--be-link\":\"#3f51b5\",\"--be-backdrop\":\"black\",\"--be-raised-button\":\"#fff\",\"--be-disabled-toggle\":\"rgb(238, 238, 238)\",\"--be-disabled-button\":\"rgba(0, 0, 0, 0.12)\"}', '2020-08-15 07:26:27', '2020-08-15 07:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `custom_domains`
--

DROP TABLE IF EXISTS `custom_domains`;
CREATE TABLE IF NOT EXISTS `custom_domains` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `host` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT 0,
  `resource_id` int(10) UNSIGNED DEFAULT NULL,
  `resource_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_domains_host_unique` (`host`),
  KEY `custom_domains_user_id_index` (`user_id`),
  KEY `custom_domains_global_index` (`global`),
  KEY `custom_domains_resource_id_index` (`resource_id`),
  KEY `custom_domains_resource_type_index` (`resource_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

DROP TABLE IF EXISTS `custom_pages`;
CREATE TABLE IF NOT EXISTS `custom_pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_type_index` (`type`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `title`, `body`, `slug`, `meta`, `type`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Privacy Policy', '<h1>Example Privacy Policy</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'privacy-policy', NULL, 'default', '2020-08-15 07:26:27', '2020-08-15 07:26:27', NULL),
(2, 'Terms of Service', '<h1>Example Terms of Service</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'terms-of-service', NULL, 'default', '2020-08-15 07:26:27', '2020-08-15 07:26:27', NULL),
(3, 'About Us', '<h1>Example About Us</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'about-us', NULL, 'default', '2020-08-15 07:26:27', '2020-08-15 07:26:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_entries`
--

DROP TABLE IF EXISTS `file_entries`;
CREATE TABLE IF NOT EXISTS `file_entries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `disk_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `preview_token` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `files_user_id_index` (`user_id`),
  KEY `files_folder_id_index` (`parent_id`),
  KEY `file_entries_name_index` (`name`),
  KEY `file_entries_path_index` (`path`),
  KEY `file_entries_type_index` (`type`),
  KEY `file_entries_public_index` (`public`),
  KEY `file_entries_description_index` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_entries`
--

INSERT INTO `file_entries` (`id`, `name`, `description`, `file_name`, `mime`, `file_size`, `user_id`, `parent_id`, `password`, `created_at`, `updated_at`, `deleted_at`, `path`, `disk_prefix`, `type`, `extension`, `public`, `preview_token`, `thumbnail`) VALUES
(5, 'hacker.jpg', NULL, 'eyeSe80ykC2u4SZRnza1zV9EQ4eCXo16kdF0dmw3', 'image/jpeg', 70891, NULL, NULL, NULL, '2020-08-15 07:58:31', '2020-08-15 07:58:31', NULL, '5', NULL, 'image', 'jpg', 0, NULL, 0),
(2, 'CV-VoThaiAn-En.pdf', NULL, 'UbVZQKz2h04fKQkJ2QczdYN1FXA5OTf4FEXjUrnh', 'application/pdf', 55771, NULL, NULL, NULL, '2020-08-15 07:28:49', '2020-08-15 07:28:49', NULL, '2', NULL, 'pdf', 'pdf', 0, NULL, 0),
(3, 'Vòng quay.pptx', NULL, '2cpuZ5mxu0bWB4iR5kSCbMiXUL7MVKf0BXTC6puf', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 49336, NULL, NULL, NULL, '2020-08-15 07:28:50', '2020-08-15 07:29:00', NULL, '3', NULL, 'powerPoint', 'pptx', 0, 'EtVpSdceqZLXEBk', 0),
(4, 'permissions.sql', NULL, '2D4r1tpykVKujPuxk0LY1FvtdBkhRZfm56BnagGV', 'text/x-Algol68', 7462, NULL, NULL, NULL, '2020-08-15 07:56:33', '2020-08-15 07:56:33', NULL, '4', NULL, 'text', 'sql', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `file_entry_models`
--

DROP TABLE IF EXISTS `file_entry_models`;
CREATE TABLE IF NOT EXISTS `file_entry_models` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_entry_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uploadables_upload_id_uploadable_id_uploadable_type_unique` (`file_entry_id`,`model_id`,`model_type`),
  KEY `file_entry_models_owner_index` (`owner`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_entry_models`
--

INSERT INTO `file_entry_models` (`id`, `file_entry_id`, `model_id`, `model_type`, `created_at`, `updated_at`, `owner`, `permissions`) VALUES
(4, 4, 2, 'App\\User', '2020-08-15 07:56:33', '2020-08-15 07:56:33', 1, NULL),
(2, 2, 1, 'App\\User', '2020-08-15 07:28:49', '2020-08-15 07:28:49', 1, NULL),
(3, 3, 1, 'App\\User', '2020-08-15 07:28:50', '2020-08-15 07:28:50', 1, NULL),
(5, 4, 3, 'App\\User', '2020-08-15 07:57:01', '2020-08-15 07:57:01', 0, '{\"view\":true,\"edit\":true,\"download\":true}'),
(6, 5, 3, 'App\\User', '2020-08-15 07:58:31', '2020-08-15 07:58:31', 1, NULL),
(8, 2, 2, 'App\\User', '2020-08-15 08:18:23', '2020-08-15 08:18:23', 0, '{\"view\":true,\"edit\":false,\"download\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
CREATE TABLE IF NOT EXISTS `folders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `share_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folders_user_id_index` (`user_id`),
  KEY `folders_share_id_index` (`share_id`),
  KEY `folders_folder_id_index` (`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `uuid` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_subscription_id_index` (`subscription_id`),
  KEY `invoices_uuid_index` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labelables`
--

DROP TABLE IF EXISTS `labelables`;
CREATE TABLE IF NOT EXISTS `labelables` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `labelable_id` int(11) NOT NULL,
  `labelable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `labelables_label_id_labelable_id_labelable_type_unique` (`label_id`,`labelable_id`,`labelable_type`),
  KEY `labelables_labelable_id_index` (`labelable_id`),
  KEY `labelables_label_id_index` (`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `labels_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localizations`
--

DROP TABLE IF EXISTS `localizations`;
CREATE TABLE IF NOT EXISTS `localizations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localizations_name_index` (`name`),
  KEY `localizations_language_index` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `localizations`
--

INSERT INTO `localizations` (`id`, `name`, `created_at`, `updated_at`, `language`) VALUES
(3, 'english', '2020-08-15 08:15:47', '2020-08-15 08:15:47', 'en'),
(2, 'vietnam', '2020-08-15 08:06:21', '2020-08-15 08:06:21', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

DROP TABLE IF EXISTS `mail_templates`;
CREATE TABLE IF NOT EXISTS `mail_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `markdown` tinyint(1) NOT NULL DEFAULT 0,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_templates_file_name_unique` (`file_name`),
  UNIQUE KEY `mail_templates_action_unique` (`action`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `display_name`, `file_name`, `subject`, `markdown`, `action`, `created_at`, `updated_at`) VALUES
(1, 'Email Confirmation', 'email-confirmation.blade.php', 'Confirm your {{SITE_NAME}} account', 0, 'email_confirmation', '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(2, 'Generic', 'generic.blade.php', '{{EMAIL_SUBJECT}}', 0, 'generic', '2020-08-15 07:26:27', '2020-08-15 07:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_04_127_156842_create_social_profiles_table', 1),
(4, '2015_04_127_156842_create_users_oauth_table', 1),
(5, '2015_04_13_140047_create_files_models_table', 1),
(6, '2015_04_18_134312_create_folders_table', 1),
(7, '2015_05_05_131439_create_labels_table', 1),
(8, '2015_05_29_131549_create_settings_table', 1),
(9, '2015_08_08_131451_create_labelables_table', 1),
(10, '2016_03_18_142141_add_email_confirmation_to_users_table', 1),
(11, '2016_04_06_140017_add_folder_id_index_to_files_table', 1),
(12, '2016_05_12_190852_create_tags_table', 1),
(13, '2016_05_12_190958_create_taggables_table', 1),
(14, '2016_05_26_170044_create_uploads_table', 1),
(15, '2016_05_27_143158_create_uploadables_table', 1),
(16, '2016_07_14_153703_create_groups_table', 1),
(17, '2016_07_14_153921_create_user_group_table', 1),
(18, '2016_10_17_152159_add_space_available_column_to_users_table', 1),
(19, '2017_07_02_120142_create_pages_table', 1),
(20, '2017_07_11_122825_create_localizations_table', 1),
(21, '2017_07_17_135837_create_mail_templates_table', 1),
(22, '2017_08_26_131330_add_private_field_to_settings_table', 1),
(23, '2017_09_17_144728_add_columns_to_users_table', 1),
(24, '2017_09_17_152854_make_password_column_nullable', 1),
(25, '2017_09_30_152855_make_settings_value_column_nullable', 1),
(26, '2017_10_01_152897_add_public_column_to_uploads_table', 1),
(27, '2017_12_04_132911_add_avatar_column_to_users_table', 1),
(28, '2018_01_10_140732_create_subscriptions_table', 1),
(29, '2018_01_10_140746_add_billing_to_users_table', 1),
(30, '2018_01_10_161706_create_billing_plans_table', 1),
(31, '2018_06_05_142932_rename_files_table_to_file_entries', 1),
(32, '2018_06_06_141629_rename_file_entries_table_columns', 1),
(33, '2018_06_07_141630_merge_files_and_folders_tables', 1),
(34, '2018_07_03_114346_create_shareable_links_table', 1),
(35, '2018_07_24_113757_add_available_space_to_billing_plans_table', 1),
(36, '2018_07_24_124254_add_available_space_to_users_table', 1),
(37, '2018_07_26_142339_rename_groups_to_roles', 1),
(38, '2018_07_26_142842_rename_user_role_table_columns_to_roles', 1),
(39, '2018_08_07_124200_rename_uploads_to_file_entries', 1),
(40, '2018_08_07_124327_refactor_file_entries_columns', 1),
(41, '2018_08_07_130653_add_folder_path_column_to_file_entries_table', 1),
(42, '2018_08_07_140328_delete_legacy_root_folders', 1),
(43, '2018_08_07_140330_move_folders_into_file_entries_table', 1),
(44, '2018_08_07_140440_migrate_file_entry_users_to_many_to_many', 1),
(45, '2018_08_10_142251_update_users_table_to_v2', 1),
(46, '2018_08_15_132225_move_uploads_into_subfolders', 1),
(47, '2018_08_16_111525_transform_file_entries_records_to_v2', 1),
(48, '2018_08_31_104145_rename_uploadables_table', 1),
(49, '2018_08_31_104325_rename_file_entry_models_table_columns', 1),
(50, '2018_11_26_171703_add_type_and_title_columns_to_pages_table', 1),
(51, '2018_12_01_144233_change_unique_index_on_tags_table', 1),
(52, '2019_02_16_150049_delete_old_seo_settings', 1),
(53, '2019_02_24_141457_create_jobs_table', 1),
(54, '2019_03_11_162627_add_preview_token_to_file_entries_table', 1),
(55, '2019_03_12_160803_add_thumbnail_column_to_file_entries_table', 1),
(56, '2019_03_16_161836_add_paypal_id_column_to_billing_plans_table', 1),
(57, '2019_05_14_120930_index_description_column_in_file_entries_table', 1),
(58, '2019_06_08_120504_create_custom_domains_table', 1),
(59, '2019_06_13_140318_add_user_id_column_to_pages_table', 1),
(60, '2019_06_15_114320_rename_pages_table_to_custom_pages', 1),
(61, '2019_06_18_133933_create_permissions_table', 1),
(62, '2019_06_18_134203_create_permissionables_table', 1),
(63, '2019_06_18_135822_rename_permissions_columns', 1),
(64, '2019_06_25_133852_move_inline_permissions_to_separate_table', 1),
(65, '2019_07_08_122001_create_css_themes_table', 1),
(66, '2019_07_20_141752_create_invoices_table', 1),
(67, '2019_08_19_121112_add_global_column_to_custom_domains_table', 1),
(68, '2019_08_20_161927_add_api_token_to_users_table', 1),
(69, '2019_08_20_162247_add_api_tokens_to_existing_users', 1),
(70, '2019_09_13_141123_change_plan_amount_to_float', 1),
(71, '2019_10_14_171943_add_index_to_username_column', 1),
(72, '2019_10_20_143522_create_comments_table', 1),
(73, '2019_10_23_134520_create_notifications_table', 1),
(74, '2019_11_21_144956_add_resource_id_and_type_to_custom_domains_table', 1),
(75, '2019_12_14_194512_rename_public_path_column_to_disk_prefix', 1),
(76, '2019_12_24_165237_change_file_size_column_default_value_to_0', 1),
(77, '2019_12_28_190836_update_file_entry_models_table_to_v2', 1),
(78, '2019_12_28_191105_move_user_file_entry_table_records_to_file_entry_models', 1),
(79, '2020_01_26_143733_create_notification_subscriptions_table', 1),
(80, '2020_03_03_140720_add_language_col_to_localizations_table', 1),
(81, '2020_03_03_143142_add_lang_code_to_existing_localizations', 1),
(82, '2020_04_14_163347_add_hidden_column_to_plans_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_subscriptions`
--

DROP TABLE IF EXISTS `notification_subscriptions`;
CREATE TABLE IF NOT EXISTS `notification_subscriptions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notif_id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `channels` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_subscriptions_notif_id_index` (`notif_id`),
  KEY `notification_subscriptions_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissionables`
--

DROP TABLE IF EXISTS `permissionables`;
CREATE TABLE IF NOT EXISTS `permissionables` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `permissionable_id` int(11) NOT NULL,
  `permissionable_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restrictions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissionable_unique` (`permission_id`,`permissionable_id`,`permissionable_type`),
  KEY `permissionables_permission_id_index` (`permission_id`),
  KEY `permissionables_permissionable_id_index` (`permissionable_id`),
  KEY `permissionables_permissionable_type_index` (`permissionable_type`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissionables`
--

INSERT INTO `permissionables` (`id`, `permission_id`, `permissionable_id`, `permissionable_type`, `restrictions`) VALUES
(1, 1, 1, 'App\\User', '[]'),
(2, 9, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(3, 35, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(4, 36, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(5, 32, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(6, 20, 1, 'Common\\Auth\\Roles\\Role', '[]'),
(7, 18, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(8, 20, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(9, 24, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(10, 32, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(11, 35, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(12, 36, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(13, 37, 2, 'Common\\Auth\\Roles\\Role', '[]'),
(14, 1, 3, 'Common\\Auth\\Roles\\Role', '[]'),
(15, 2, 3, 'Common\\Auth\\Roles\\Role', '[]'),
(16, 3, 3, 'Common\\Auth\\Roles\\Role', '[]'),
(25, 3, 2, 'App\\User', '[]'),
(24, 2, 2, 'App\\User', '[]'),
(23, 1, 2, 'App\\User', '[]'),
(20, 17, 3, 'App\\User', '[]'),
(21, 18, 3, 'App\\User', '[]'),
(22, 19, 3, 'App\\User', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restrictions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `group`, `restrictions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Super Admin', 'Give all permissions to user.', 'admin', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(2, 'admin.access', 'Access Admin', 'Required in order to access any admin area page.', 'admin', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(3, 'appearance.update', 'Update Appearance', 'Allows access to appearance editor.', 'admin', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(4, 'roles.view', 'View Roles', 'Allow viewing ALL roles.', 'roles', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(5, 'roles.create', 'Create Roles', 'Allow creating new roles.', 'roles', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(6, 'roles.update', 'Update Roles', 'Allow updating ALL roles.', 'roles', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(7, 'roles.delete', 'Delete Roles', 'Allow deleting ALL roles.', 'roles', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(8, 'reports.view', 'View Reports', 'Allows access to analytics page.', 'analytics', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(9, 'custom_pages.view', 'View Custom Pages', 'Allow viewing ALL custom pages.', 'custom_pages', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(10, 'custom_pages.create', 'Create Custom Pages', 'Allow creating new custom pages.', 'custom_pages', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"policies.count_description\"}]', '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(11, 'custom_pages.update', 'Update Custom Pages', 'Allow updating ALL custom pages.', 'custom_pages', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(12, 'custom_pages.delete', 'Delete Custom Pages', 'Allow deleting ALL custom pages.', 'custom_pages', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(13, 'custom_domains.view', 'View Custom Domains', 'Allow viewing ALL custom domains.', 'custom_domains', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(14, 'custom_domains.create', 'Create Custom Domains', 'Allow creating new custom domains.', 'custom_domains', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"policies.count_description\"}]', '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(15, 'custom_domains.update', 'Update Custom Domains', 'Allow updating ALL custom domains.', 'custom_domains', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(16, 'custom_domains.delete', 'Delete Custom Domains', 'Allow deleting ALL custom domains.', 'custom_domains', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(17, 'files.view', 'View Files', 'Allow viewing ALL files.', 'files', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(18, 'files.create', 'Create Files', 'Allow creating new files.', 'files', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(19, 'files.delete', 'Delete Files', 'Allow deleting ALL files.', 'files', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(20, 'users.view', 'View Users', 'Allow viewing ALL users.', 'users', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(21, 'users.create', 'Create Users', 'Allow creating new users.', 'users', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(22, 'users.update', 'Update Users', 'Allow updating ALL users.', 'users', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(23, 'users.delete', 'Delete Users', 'Allow deleting ALL users.', 'users', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(24, 'localizations.view', 'View Localizations', 'Allow viewing ALL localizations.', 'localizations', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(25, 'localizations.create', 'Create Localizations', 'Allow creating new localizations.', 'localizations', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(26, 'localizations.update', 'Update Localizations', 'Allow updating ALL localizations.', 'localizations', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(27, 'localizations.delete', 'Delete Localizations', 'Allow deleting ALL localizations.', 'localizations', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(28, 'mail_templates.view', 'View Mail Templates', 'Allow viewing ALL mail templates.', 'mail_templates', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(29, 'mail_templates.update', 'Update Mail Templates', 'Allow updating ALL mail templates.', 'mail_templates', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(30, 'settings.view', 'View Settings', 'Allow viewing ALL settings.', 'settings', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(31, 'settings.update', 'Update Settings', 'Allow updating ALL settings.', 'settings', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(32, 'plans.view', 'View Plans', 'Allow viewing ALL plans.', 'plans', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(33, 'plans.create', 'Create Plans', 'Allow creating new plans.', 'plans', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(34, 'plans.delete', 'Delete Plans', 'Allow deleting ALL plans.', 'plans', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(35, 'invoices.view', 'View Invoices', 'Allow viewing ALL invoices.', 'invoices', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(36, 'links.view', 'View Links', 'Allow viewing ALL links.', 'links', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(37, 'links.create', 'Create Links', 'Allow creating new links.', 'links', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(38, 'links.update', 'Update Links', 'Allow updating ALL links.', 'links', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27'),
(39, 'links.delete', 'Delete Links', 'Allow deleting ALL links.', 'links', NULL, '2020-08-15 07:26:27', '2020-08-15 07:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `legacy_permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `guests` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`),
  KEY `groups_default_index` (`default`),
  KEY `groups_guests_index` (`guests`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `legacy_permissions`, `default`, `guests`, `created_at`, `updated_at`) VALUES
(2, 'users', NULL, 1, 0, '2020-08-15 06:56:23', '2020-08-15 06:56:23'),
(3, 'Admin', NULL, 0, 0, '2020-08-15 07:00:31', '2020-08-15 07:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_name_unique` (`name`),
  KEY `settings_private_index` (`private`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`, `private`) VALUES
(1, 'dates.format', 'yyyy-MM-dd', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(2, 'dates.locale', 'en_US', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(3, 'social.google.enable', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(4, 'social.twitter.enable', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(5, 'social.facebook.enable', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(6, 'realtime.enable', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(7, 'registration.disable', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(8, 'branding.favicon', 'client/favicon/icon-144x144.png', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(9, 'branding.logo_dark', 'client/assets/images/logo-dark.png', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(10, 'branding.logo_light', 'client/assets/images/logo-light.png', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(11, 'i18n.default_localization', 'en', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(12, 'i18n.enable', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(13, 'logging.sentry_public', '', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(14, 'realtime.pusher_key', '', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(15, 'homepage.type', 'default', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(16, 'themes.default_mode', 'light', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(17, 'themes.user_change', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(18, 'billing.enable', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(19, 'billing.force_subscription', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(20, 'billing.paypal_test_mode', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(21, 'billing.stripe_test_mode', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(22, 'billing.stripe.enable', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(23, 'billing.paypal.enable', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(24, 'billing.accepted_cards', '[\"visa\",\"mastercard\",\"american-express\",\"discover\"]', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(25, 'custom_domains.default_host', '', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(26, 'uploads.chunk', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(27, 'cookie_notice.enable', 'true', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(28, 'cookie_notice.position', 'bottom', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(29, 'branding.site_name', 'BeDrive', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(30, 'cache.report_minutes', '60', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(31, 'site.force_https', '0', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(32, 'menus', '[{\"name\":\"Drive Sidebar\",\"position\":\"drive-sidebar\",\"items\":[{\"type\":\"route\",\"order\":1,\"label\":\"Shared with me\",\"action\":\"drive\\/shares\",\"icon\":\"people\"},{\"type\":\"route\",\"order\":2,\"label\":\"Recent\",\"action\":\"drive\\/recent\",\"icon\":\"access-time\"},{\"type\":\"route\",\"order\":3,\"label\":\"Starred\",\"action\":\"drive\\/starred\",\"icon\":\"star\"},{\"type\":\"route\",\"order\":4,\"label\":\"Trash\",\"action\":\"drive\\/trash\",\"icon\":\"delete\"}]}]', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(33, 'uploads.max_size', '52428800', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(34, 'uploads.chunk_size', '15728640', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(35, 'uploads.available_space', '104857600', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(36, 'uploads.blocked_extensions', '[\"exe\",\"application\\/x-msdownload\",\"x-dosexec\"]', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(37, 'homepage.appearance', '{\"headerTitle\":\"BeDrive. A new home for your files.\",\"headerSubtitle\":\"Register or Login now to upload, backup, manage and access your files on any device, from anywhere, free.\",\"headerImage\":\"client\\/assets\\/images\\/homepage\\/homepage-header-bg.jpg\",\"headerImageOpacity\":1,\"headerOverlayColor1\":null,\"headerOverlayColor2\":null,\"footerTitle\":\"Get started with BeDrive\",\"footerSubtitle\":null,\"footerImage\":\"client\\/assets\\/images\\/homepage\\/homepage-footer-bg.svg\",\"actions\":{\"cta1\":\"Register Now\",\"cta2\":null,\"cta3\":\"Sign up for free\"},\"primaryFeatures\":[{\"title\":\"Store any file\",\"subtitle\":\"Keep photos, stories, designs, drawings, recordings, videos, and more. Your first 15 GB of storage are free.\",\"image\":\"client\\/assets\\/images\\/homepage\\/inline-feature-1.png\"},{\"title\":\"See your stuff anywhere\",\"subtitle\":\"Your files in BeDrive can be reached from any smartphone, tablet, or computer.\",\"image\":\"client\\/assets\\/images\\/homepage\\/inline-feature-2.png\"},{\"title\":\"Share files and folders\",\"subtitle\":\"You can quickly invite others to view, download, and collaborate on all the files you want.\",\"image\":\"client\\/assets\\/images\\/homepage\\/inline-feature-3.png\"}],\"secondaryFeatures\":[{\"title\":\"Keep your files safe\",\"image\":\"client\\/assets\\/images\\/homepage\\/homepage-feature-1.jpg\",\"description\":\"If something happens to your device, you don\'t have to worry about losing your files or photos \\u2013 they\'re in your BeDrive. And BeDrive is encrypted using SSL.\"},{\"title\":\"Reliable storage and fast transfers\",\"image\":\"client\\/assets\\/images\\/homepage\\/homepage-feature-2.jpg\",\"description\":\"We make secure cloud storage simple and convenient. Create a free BeDrive account today!\"}]}', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(38, 'drive.default_view', 'grid', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(39, 'drive.send_share_notification', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0),
(40, 'share.suggest_emails', 'false', '2020-08-15 07:26:27', '2020-08-15 07:26:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shareable_links`
--

DROP TABLE IF EXISTS `shareable_links`;
CREATE TABLE IF NOT EXISTS `shareable_links` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hash` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `allow_edit` tinyint(1) NOT NULL DEFAULT 0,
  `allow_download` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shareable_links_hash_unique` (`hash`),
  KEY `shareable_links_user_id_index` (`user_id`),
  KEY `shareable_links_entry_id_index` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_profiles`
--

DROP TABLE IF EXISTS `social_profiles`;
CREATE TABLE IF NOT EXISTS `social_profiles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `service_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_service_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_profiles_user_id_service_name_unique` (`user_id`,`service_name`),
  UNIQUE KEY `social_profiles_service_name_user_service_id_unique` (`service_name`,`user_service_id`),
  KEY `social_profiles_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `gateway_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `renews_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_gateway_index` (`gateway`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

DROP TABLE IF EXISTS `taggables`;
CREATE TABLE IF NOT EXISTS `taggables` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  UNIQUE KEY `taggables_tag_id_taggable_id_user_id_taggable_type_unique` (`tag_id`,`taggable_id`,`user_id`,`taggable_type`),
  KEY `taggables_tag_id_index` (`tag_id`),
  KEY `taggables_taggable_id_index` (`taggable_id`),
  KEY `taggables_taggable_type_index` (`taggable_type`),
  KEY `taggables_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_type_unique` (`name`,`type`),
  KEY `tags_type_index` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `display_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'starred', 'Starred', 'label', '2020-08-15 07:26:27', '2020-08-15 07:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `path` varchar(191) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uploads_file_name_unique` (`file_name`),
  KEY `uploads_name_index` (`name`),
  KEY `uploads_user_id_index` (`user_id`),
  KEY `uploads_public_index` (`public`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 1,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `space_available` bigint(20) UNSIGNED DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_space` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `legacy_permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  KEY `users_username_index` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`, `confirmed`, `confirmation_code`, `space_available`, `language`, `country`, `timezone`, `avatar`, `stripe_id`, `available_space`, `first_name`, `last_name`, `legacy_permissions`, `card_brand`, `card_last_four`) VALUES
(1, 'admin', 'thaian@devforum.info', '$2y$10$IxWQgt781WYG3a.eL7ABBOoTJVp.xfnvLyw5fw.nYUeONoxgUa.qi', 'W0C9En8fQGCAe1znj6ro4QxheaYw1s45LaXWlYBd', 'ZEPiNRbkDvioiJ1zwDB9IIFYQGpfRKCqVoD7cmojh9w03nRDhMgSHpI3Yhoy', '2020-08-15 06:56:22', '2020-08-15 08:04:31', 1, NULL, NULL, 'english', NULL, NULL, 'avatars/1cM4W1dDCB4DJSkIAFc4H5uEOfcLjldXiIJMRZP7.jpeg', NULL, 20971520, 'Anh Tester', NULL, NULL, NULL, NULL),
(2, '', 'admin@devforum.info', '$2y$10$x8rkjGuxw1uTnrfwUooWtOTayaSuEI8yNvK0.8ANxMQKcWOGGM.bO', NULL, 'QzqmEOPhRsew72BIYUMM4fhWF1DXb42rYbVXP3KhlmEx7PGk9ZgspffBTrdv', '2020-08-15 07:02:41', '2020-08-15 07:59:34', 1, NULL, NULL, 'english', NULL, NULL, 'avatars/o7PYdGoiEsnsW9BH1B6tkocgCjdH6UeXa0zjkcuY.jpeg', NULL, NULL, 'Admin', NULL, NULL, NULL, NULL),
(3, '', 'vothaian97@gmail.com', '$2y$10$FvUFAM7uPW.BYIHwQCvpleopKKBO9c3ccBY97YN9emhdqDrbvkele', NULL, 'SAz58cVviu5NRl2ihKDyoUCEsnXRaEOayhHGpkrFUx78Pw7PiAtj4E8DqfAs', '2020-08-15 07:09:24', '2020-08-15 07:11:55', 1, NULL, NULL, 'english', NULL, NULL, 'https://www.gravatar.com/avatar/71e115c2e2d401d6b6c1868cdb15e69f?s=&d=retro', NULL, 5242880, 'Võ Thái An', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_oauth`
--

DROP TABLE IF EXISTS `users_oauth`;
CREATE TABLE IF NOT EXISTS `users_oauth` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `service` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_oauth_user_id_service_unique` (`user_id`,`service`),
  UNIQUE KEY `users_oauth_token_unique` (`token`),
  KEY `users_oauth_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_group_user_id_group_id_unique` (`user_id`,`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`) VALUES
(1, 1, 2, '2020-08-15 06:56:23'),
(4, 2, 3, NULL),
(3, 3, 2, NULL),
(5, 1, 3, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
