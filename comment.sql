-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 15, 2021 lúc 07:29 AM
-- Phiên bản máy phục vụ: 10.4.16-MariaDB
-- Phiên bản PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `svat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `post_at` datetime(6) NOT NULL,
  `view` int(11) NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `thumbnail_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article_category`
--

CREATE TABLE `article_category` (
  `id` int(11) NOT NULL,
  `name_en` longtext NOT NULL,
  `name_vi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article_language`
--

CREATE TABLE `article_language` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add user', 1, 'add_user'),
(2, 'Can change user', 1, 'change_user'),
(3, 'Can delete user', 1, 'delete_user'),
(4, 'Can view user', 1, 'view_user'),
(5, 'Can add article', 2, 'add_article'),
(6, 'Can change article', 2, 'change_article'),
(7, 'Can delete article', 2, 'delete_article'),
(8, 'Can view article', 2, 'view_article'),
(9, 'Can add article category', 3, 'add_articlecategory'),
(10, 'Can change article category', 3, 'change_articlecategory'),
(11, 'Can delete article category', 3, 'delete_articlecategory'),
(12, 'Can view article category', 3, 'view_articlecategory'),
(13, 'Can add import order', 4, 'add_importorder'),
(14, 'Can change import order', 4, 'change_importorder'),
(15, 'Can delete import order', 4, 'delete_importorder'),
(16, 'Can view import order', 4, 'view_importorder'),
(17, 'Can add language', 5, 'add_language'),
(18, 'Can change language', 5, 'change_language'),
(19, 'Can delete language', 5, 'delete_language'),
(20, 'Can view language', 5, 'view_language'),
(21, 'Can add media', 6, 'add_media'),
(22, 'Can change media', 6, 'change_media'),
(23, 'Can delete media', 6, 'delete_media'),
(24, 'Can view media', 6, 'view_media'),
(25, 'Can add order', 7, 'add_order'),
(26, 'Can change order', 7, 'change_order'),
(27, 'Can delete order', 7, 'delete_order'),
(28, 'Can view order', 7, 'view_order'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add product category', 9, 'add_productcategory'),
(34, 'Can change product category', 9, 'change_productcategory'),
(35, 'Can delete product category', 9, 'delete_productcategory'),
(36, 'Can view product category', 9, 'view_productcategory'),
(37, 'Can add product language', 10, 'add_productlanguage'),
(38, 'Can change product language', 10, 'change_productlanguage'),
(39, 'Can delete product language', 10, 'delete_productlanguage'),
(40, 'Can view product language', 10, 'view_productlanguage'),
(41, 'Can add product image', 11, 'add_productimage'),
(42, 'Can change product image', 11, 'change_productimage'),
(43, 'Can delete product image', 11, 'delete_productimage'),
(44, 'Can view product image', 11, 'view_productimage'),
(45, 'Can add order product', 12, 'add_orderproduct'),
(46, 'Can change order product', 12, 'change_orderproduct'),
(47, 'Can delete order product', 12, 'delete_orderproduct'),
(48, 'Can view order product', 12, 'view_orderproduct'),
(49, 'Can add import order product', 13, 'add_importorderproduct'),
(50, 'Can change import order product', 13, 'change_importorderproduct'),
(51, 'Can delete import order product', 13, 'delete_importorderproduct'),
(52, 'Can view import order product', 13, 'view_importorderproduct'),
(53, 'Can add article language', 14, 'add_articlelanguage'),
(54, 'Can change article language', 14, 'change_articlelanguage'),
(55, 'Can delete article language', 14, 'delete_articlelanguage'),
(56, 'Can view article language', 14, 'view_articlelanguage'),
(57, 'Can add message', 15, 'add_message'),
(58, 'Can change message', 15, 'change_message'),
(59, 'Can delete message', 15, 'delete_message'),
(60, 'Can view message', 15, 'view_message'),
(61, 'Can add comment', 16, 'add_comment'),
(62, 'Can change comment', 16, 'change_comment'),
(63, 'Can delete comment', 16, 'delete_comment'),
(64, 'Can view comment', 16, 'view_comment'),
(65, 'Can add permission', 17, 'add_permission'),
(66, 'Can change permission', 17, 'change_permission'),
(67, 'Can delete permission', 17, 'delete_permission'),
(68, 'Can view permission', 17, 'view_permission'),
(69, 'Can add group', 18, 'add_group'),
(70, 'Can change group', 18, 'change_group'),
(71, 'Can delete group', 18, 'delete_group'),
(72, 'Can view group', 18, 'view_group'),
(73, 'Can add log entry', 19, 'add_logentry'),
(74, 'Can change log entry', 19, 'change_logentry'),
(75, 'Can delete log entry', 19, 'delete_logentry'),
(76, 'Can view log entry', 19, 'view_logentry'),
(77, 'Can add content type', 20, 'add_contenttype'),
(78, 'Can change content type', 20, 'change_contenttype'),
(79, 'Can delete content type', 20, 'delete_contenttype'),
(80, 'Can view content type', 20, 'view_contenttype'),
(81, 'Can add session', 21, 'add_session'),
(82, 'Can change session', 21, 'change_session'),
(83, 'Can delete session', 21, 'delete_session'),
(84, 'Can view session', 21, 'view_session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `content`, `product_id`, `user_id`, `created`) VALUES
(1, 'sang', 1, 4, '2021-06-15 05:04:07.116404'),
(2, 'sang', 1, 4, '2021-06-15 05:04:09.204289'),
(3, 'sang', 1, 4, '2021-06-15 05:04:09.395552');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(19, 'admin', 'logentry'),
(18, 'auth', 'group'),
(17, 'auth', 'permission'),
(20, 'contenttypes', 'contenttype'),
(2, 'my_admin', 'article'),
(3, 'my_admin', 'articlecategory'),
(14, 'my_admin', 'articlelanguage'),
(16, 'my_admin', 'comment'),
(4, 'my_admin', 'importorder'),
(13, 'my_admin', 'importorderproduct'),
(5, 'my_admin', 'language'),
(6, 'my_admin', 'media'),
(15, 'my_admin', 'message'),
(7, 'my_admin', 'order'),
(12, 'my_admin', 'orderproduct'),
(8, 'my_admin', 'product'),
(9, 'my_admin', 'productcategory'),
(11, 'my_admin', 'productimage'),
(10, 'my_admin', 'productlanguage'),
(1, 'my_admin', 'user'),
(21, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-13 12:55:05.526872'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-06-13 12:55:06.156391'),
(3, 'auth', '0001_initial', '2021-06-13 12:55:10.375600'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-06-13 12:55:11.462536'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-06-13 12:55:11.500743'),
(6, 'auth', '0004_alter_user_username_opts', '2021-06-13 12:55:11.532496'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-06-13 12:55:11.566211'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-06-13 12:55:11.594898'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-06-13 12:55:11.769732'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-06-13 12:55:11.860603'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-06-13 12:55:11.892282'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-06-13 12:55:12.028455'),
(13, 'auth', '0011_update_proxy_permissions', '2021-06-13 12:55:12.097817'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-06-13 12:55:12.137770'),
(15, 'my_admin', '0001_initial', '2021-06-13 12:55:38.644404'),
(16, 'admin', '0001_initial', '2021-06-13 12:55:40.884177'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-06-13 12:55:40.938588'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-13 12:55:40.984405'),
(19, 'my_admin', '0002_auto_20210520_0035', '2021-06-13 12:55:41.912885'),
(20, 'my_admin', '0003_auto_20210523_0925', '2021-06-13 12:55:42.211431'),
(21, 'my_admin', '0004_auto_20210603_1820', '2021-06-13 12:55:44.094379'),
(22, 'my_admin', '0005_order_shipping_fee', '2021-06-13 12:55:44.347422'),
(23, 'my_admin', '0006_order_total', '2021-06-13 12:55:44.517822'),
(24, 'my_admin', '0007_order_total_products', '2021-06-13 12:55:44.654170'),
(25, 'my_admin', '0008_order_note', '2021-06-13 12:55:44.753668'),
(26, 'my_admin', '0004_auto_20210604_2316', '2021-06-13 12:55:44.995878'),
(27, 'my_admin', '0004_auto_20210603_1500', '2021-06-13 12:55:46.739534'),
(28, 'my_admin', '0009_merge_20210605_2317', '2021-06-13 12:55:46.774693'),
(29, 'my_admin', '0009_merge_0004_auto_20210603_1500_0008_order_note', '2021-06-13 12:55:46.812612'),
(30, 'my_admin', '0010_merge_20210607_2326', '2021-06-13 12:55:46.839540'),
(31, 'my_admin', '0011_comment', '2021-06-13 12:55:49.542999'),
(32, 'my_admin', '0012_comment_created', '2021-06-13 12:55:50.051235'),
(33, 'sessions', '0001_initial', '2021-06-13 12:55:50.541475');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_order`
--

CREATE TABLE `import_order` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_order_product`
--

CREATE TABLE `import_order_product` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `import_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `language`
--

INSERT INTO `language` (`id`, `name`, `code`) VALUES
(1, 'Vietnamese', 'vi'),
(2, 'English', 'en');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `file_path` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `media`
--

INSERT INTO `media` (`id`, `file_path`) VALUES
(1, 'uploads\\1623733423.7148535.vietnamflag.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `email` varchar(256) NOT NULL,
  `message` varchar(256) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `address` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone_number` varchar(256) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `name` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `shipping_fee` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `total_products` int(11) NOT NULL,
  `note` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `cost` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `des` longtext NOT NULL,
  `product_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `cost`, `quantity`, `view`, `des`, `product_category_id`) VALUES
(1, '50000.00', 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name_en` longtext NOT NULL,
  `name_vi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_category`
--

INSERT INTO `product_category` (`id`, `name_en`, `name_vi`) VALUES
(1, 'Herbicide', 'Thuốc trừ cỏ'),
(2, 'Pesticides', 'Thuốc trừ sâu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `media_id`, `product_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_language`
--

CREATE TABLE `product_language` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `des` longtext DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_language`
--

INSERT INTO `product_language` (`id`, `name`, `des`, `language_id`, `product_id`) VALUES
(1, 'a', '<p>a</p>\n', 1, 1),
(2, 'a', '<p>a</p>\n', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` longtext NOT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `phone_number` longtext DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `role` int(11) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `is_verify` int(11) DEFAULT NULL,
  `verified_token` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `id`, `email`, `name`, `dob`, `gender`, `address`, `phone_number`, `note`, `role`, `avatar_id`, `is_verify`, `verified_token`) VALUES
('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=', NULL, 0, 'user@svat.com', '', '', 0, 1, '2021-06-15 05:02:23.204423', 1, 'user@svat.com', 'user', NULL, NULL, '', NULL, NULL, 1, NULL, 1, NULL),
('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=', NULL, 1, 'admin@svat.com', '', '', 1, 1, '2021-06-15 05:02:23.271791', 2, 'admin@svat.com', 'admin', NULL, NULL, '', NULL, NULL, 10, NULL, 1, NULL),
('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=', NULL, 1, 'admin_lvl2@svat.com', '', '', 1, 1, '2021-06-15 05:02:23.273253', 3, 'admin_lvl2@svat.com', 'admin_2', NULL, NULL, '', NULL, NULL, 11, NULL, 1, NULL),
('pbkdf2_sha256$260000$lCeDIRIrvuoxMw64whsvlV$LgKo8ErISUj6dvZbSa0qAQpMvAvwRaqo93oE5vcWjDQ=', '2021-06-15 05:02:32.910552', 1, 'admin_lvl3@svat.com', '', '', 1, 1, '2021-06-15 05:02:23.477237', 4, 'admin_lvl3@svat.com', 'admin_3', NULL, NULL, '', NULL, NULL, 12, NULL, 1, NULL),
('pbkdf2_sha256$260000$0ipRhoLdTYC7An5Mt38Y0x$1SlS7xHb505yILTmOgX0aO3ER9xiCHYmi5Jn7+K/CE8=', '2021-06-15 05:14:29.329530', 0, 'truongngoclinhtt12@gmail.com', '', '', 0, 1, '2021-06-15 05:14:13.474532', 5, 'truongngoclinhtt12@gmail.com', 'Hà Ngọc Sang', NULL, NULL, '', '0966720629', NULL, 1, NULL, 1, '7uGhaZIrV4Uvk3EtYOL6MmK8HziPfPQs');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_user_permissions`
--

CREATE TABLE `users_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_article_category_id_365a0c8c_fk_article_category_id` (`article_category_id`),
  ADD KEY `article_thumbnail_id_b2fce9c2_fk_media_id` (`thumbnail_id`),
  ADD KEY `article_author_id_01185df5_fk_users_id` (`author_id`);

--
-- Chỉ mục cho bảng `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `article_language`
--
ALTER TABLE `article_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_language_article_id_477922c1_fk_article_id` (`article_id`),
  ADD KEY `article_language_language_id_64c5442c_fk_language_id` (`language_id`);

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_product_id_62c0c379_fk_product_id` (`product_id`),
  ADD KEY `comment_user_id_2224f9d1_fk_users_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `import_order`
--
ALTER TABLE `import_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_order_user_id_1339f1d9_fk_users_id` (`user_id`);

--
-- Chỉ mục cho bảng `import_order_product`
--
ALTER TABLE `import_order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_order_product_import_order_id_793591da_fk_import_order_id` (`import_order_id`),
  ADD KEY `import_order_product_product_id_660eb6c0_fk_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_id_e323497c_fk_users_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_f65b4f18_fk_order_id` (`order_id`),
  ADD KEY `order_product_product_id_53139cb6_fk_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_product_category_id_1ba01076_fk_product_category_id` (`product_category_id`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_media_id_05f1fd0a_fk_media_id` (`media_id`),
  ADD KEY `product_image_product_id_8b9355c5_fk_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_language`
--
ALTER TABLE `product_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_language_language_id_4b9b66ad_fk_language_id` (`language_id`),
  ADD KEY `product_language_product_id_7c23486b_fk_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_avatar_id_34367965` (`avatar_id`);

--
-- Chỉ mục cho bảng `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  ADD KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `article_language`
--
ALTER TABLE `article_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `import_order`
--
ALTER TABLE `import_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `import_order_product`
--
ALTER TABLE `import_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product_language`
--
ALTER TABLE `product_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_article_category_id_365a0c8c_fk_article_category_id` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`),
  ADD CONSTRAINT `article_author_id_01185df5_fk_users_id` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `article_thumbnail_id_b2fce9c2_fk_media_id` FOREIGN KEY (`thumbnail_id`) REFERENCES `media` (`id`);

--
-- Các ràng buộc cho bảng `article_language`
--
ALTER TABLE `article_language`
  ADD CONSTRAINT `article_language_article_id_477922c1_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `article_language_language_id_64c5442c_fk_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_product_id_62c0c379_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `comment_user_id_2224f9d1_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `import_order`
--
ALTER TABLE `import_order`
  ADD CONSTRAINT `import_order_user_id_1339f1d9_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `import_order_product`
--
ALTER TABLE `import_order_product`
  ADD CONSTRAINT `import_order_product_import_order_id_793591da_fk_import_order_id` FOREIGN KEY (`import_order_id`) REFERENCES `import_order` (`id`),
  ADD CONSTRAINT `import_order_product_product_id_660eb6c0_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_user_id_e323497c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_f65b4f18_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_product_product_id_53139cb6_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_product_category_id_1ba01076_fk_product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`);

--
-- Các ràng buộc cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_media_id_05f1fd0a_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `product_image_product_id_8b9355c5_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product_language`
--
ALTER TABLE `product_language`
  ADD CONSTRAINT `product_language_language_id_4b9b66ad_fk_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `product_language_product_id_7c23486b_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_avatar_id_34367965_fk_media_id` FOREIGN KEY (`avatar_id`) REFERENCES `media` (`id`);

--
-- Các ràng buộc cho bảng `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
