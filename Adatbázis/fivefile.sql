-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: db
-- Létrehozás ideje: 2022. Ápr 29. 20:18
-- Kiszolgáló verziója: 8.0.27-0ubuntu0.20.04.1
-- PHP verzió: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `FiveFile`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `group_id` bigint UNSIGNED DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `files`
--

INSERT INTO `files` (`id`, `user_id`, `type`, `title`, `size`, `group_id`, `mimetype`, `created_at`, `updated_at`) VALUES
(1, 4, 'pdf', 'csiazsofia-body-measurements-form.pdf', 774083, 1, 'application/pdf', '2022-04-29 20:21:46', '2022-04-29 20:57:02'),
(2, 4, 'pdf', 'csiazsofia-ready-willing-and-able-worksheet.pdf', 85205, NULL, 'application/pdf', '2022-04-29 20:21:46', '2022-04-29 20:21:46'),
(3, 4, 'txt', 'csiazsofia-zsofika.txt', 19, 1, 'text/plain', '2022-04-29 20:29:34', '2022-04-29 20:56:55'),
(4, 4, 'jpg', 'csiazsofia-AsterNovi-belgii-flower-1mb.jpg', 175563, 1, 'image/jpeg', '2022-04-29 20:30:58', '2022-04-29 20:56:45'),
(5, 5, 'pdf', 'raczroland-200-things-to-declutter-pdf-checklist_6d07334b-55ec-42d9-92f0-af3c7d219b75.pdf', 1118749, 2, 'application/pdf', '2022-04-29 20:48:15', '2022-04-29 21:18:18'),
(6, 5, 'pdf', 'raczroland-coaching-breakthroughs-lesson-1.pdf', 625025, NULL, 'application/pdf', '2022-04-29 20:48:15', '2022-04-29 20:48:15'),
(7, 5, 'jpg', 'raczroland-Pizigani_1367_Chart_1MB.jpg', 1093957, 2, 'image/jpeg', '2022-04-29 20:51:25', '2022-04-29 20:52:22'),
(8, 5, 'txt', 'raczroland-rolika.txt', 17, 2, 'text/plain', '2022-04-29 20:51:26', '2022-04-29 21:18:22'),
(9, 7, 'png', 'csehviktoria-fbqr.png', 15693, 4, 'image/png', '2022-04-29 21:00:36', '2022-04-29 21:15:53'),
(10, 7, 'jfif', 'csehviktoria-letoltes.jfif', 6470, 3, 'image/jpeg', '2022-04-29 21:00:36', '2022-04-29 21:15:01'),
(12, 7, 'txt', 'csehviktoria-vikike.txt', 17, NULL, 'text/plain', '2022-04-29 21:00:36', '2022-04-29 21:00:36'),
(13, 6, 'jpg', 'mateszilvi-eso1205a.jpg', 1204505, NULL, 'image/jpeg', '2022-04-29 21:09:54', '2022-04-29 21:09:54'),
(14, 6, 'pdf', 'mateszilvi-initial-assessment-and-triage-questionnaire-client-version.pdf', 140357, NULL, 'application/pdf', '2022-04-29 21:09:54', '2022-04-29 21:09:54'),
(15, 6, 'pdf', 'mateszilvi-initial-assessment-and-triage-questionnaire-coach-version.pdf', 223890, NULL, 'application/pdf', '2022-04-29 21:09:54', '2022-04-29 21:09:54'),
(16, 6, 'txt', 'mateszilvi-szilvike.txt', 19, NULL, 'text/plain', '2022-04-29 21:09:55', '2022-04-29 21:09:55'),
(17, 7, 'jpg', 'csehviktoria-2021124175319.jpg', 208383, 3, 'image/jpeg', '2022-04-29 22:09:02', '2022-04-29 22:10:23');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `friends`
--

CREATE TABLE `friends` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id_sender` bigint UNSIGNED DEFAULT NULL,
  `user_id_addressee` bigint UNSIGNED DEFAULT NULL,
  `status` enum('requested','accepted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'requested',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `friends`
--

INSERT INTO `friends` (`id`, `user_id_sender`, `user_id_addressee`, `status`, `created_at`, `updated_at`) VALUES
(2, 4, 7, 'accepted', NULL, '2022-04-29 21:02:21'),
(3, 4, 6, 'accepted', NULL, '2022-04-29 21:10:56'),
(8, 5, 7, 'accepted', NULL, '2022-04-29 21:02:32'),
(9, 5, 4, 'accepted', NULL, '2022-04-29 20:54:54'),
(10, 4, 5, 'accepted', '2022-04-29 20:54:54', '2022-04-29 20:54:54'),
(11, 7, 4, 'accepted', '2022-04-29 21:02:22', '2022-04-29 21:02:22'),
(12, 7, 5, 'accepted', '2022-04-29 21:02:32', '2022-04-29 21:02:32'),
(13, 7, 6, 'accepted', NULL, '2022-04-29 21:10:58'),
(14, 6, 4, 'accepted', '2022-04-29 21:10:56', '2022-04-29 21:10:56'),
(15, 6, 7, 'accepted', '2022-04-29 21:10:58', '2022-04-29 21:10:58');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `groupmembers`
--

CREATE TABLE `groupmembers` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `group_member` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `groupmembers`
--

INSERT INTO `groupmembers` (`id`, `group_id`, `group_member`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2022-04-29 20:55:20', '2022-04-29 20:55:20'),
(4, 4, 4, '2022-04-29 21:16:30', '2022-04-29 21:16:30'),
(5, 3, 6, '2022-04-29 21:16:31', '2022-04-29 21:16:31'),
(6, 3, 6, '2022-04-29 21:16:40', '2022-04-29 21:16:40'),
(7, 2, 7, '2022-04-29 21:20:53', '2022-04-29 21:20:53');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `owner_id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `groups`
--

INSERT INTO `groups` (`id`, `owner_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 4, 'Egyetemi tanulmányok', '2022-04-29 20:35:55', '2022-04-29 20:35:55'),
(2, 5, 'Tinder csoport', '2022-04-29 20:47:37', '2022-04-29 20:47:37'),
(3, 7, 'Iroda munka', '2022-04-29 21:03:36', '2022-04-29 21:03:36'),
(4, 7, 'Privát', '2022-04-29 21:06:09', '2022-04-29 21:06:09');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_10_171613_create_friends_table', 1),
(6, '2022_04_14_114835_create_groups_table', 1),
(7, '2022_04_14_121243_create_groupmembers_table', 1),
(8, '2022_04_15_111544_create_files_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'token', '6e9f796e517d6d3b5368cfdc8e844cae0797c8806c54beecfc12ffc392b3fb80', '[\"*\"]', '2022-04-29 20:20:12', '2022-04-29 20:20:00', '2022-04-29 20:20:12'),
(2, 'App\\Models\\User', 4, 'token', '7e7759d77461d62fd4ca41655ebf038950c331d20e9af14f2b385c3c65e504e2', '[\"*\"]', '2022-04-29 20:20:43', '2022-04-29 20:20:06', '2022-04-29 20:20:43'),
(3, 'App\\Models\\User', 4, 'token', '8258c1c0d77435494d4f2fe74c7226dc4bab7f0580c15ad21b8aa010f644a1a0', '[\"*\"]', '2022-04-29 20:29:13', '2022-04-29 20:20:30', '2022-04-29 20:29:13'),
(4, 'App\\Models\\User', 4, 'token', 'ab42cf6cbf1cd620c3f0bec8994e416c51bd0f250ad1eeae0fffc85e186772e6', '[\"*\"]', '2022-04-29 20:29:10', '2022-04-29 20:28:50', '2022-04-29 20:29:10'),
(5, 'App\\Models\\User', 4, 'token', 'dfea2ad913950d2bf0a78314ec15988bc9854ac45175e3ccf6e21a571f744c1b', '[\"*\"]', '2022-04-29 20:29:14', '2022-04-29 20:29:07', '2022-04-29 20:29:14'),
(6, 'App\\Models\\User', 4, 'token', '37b1e5f9169b6b123f50a03f85ff48b7ad87c00ca6be28af3adc282f3d05fb6a', '[\"*\"]', '2022-04-29 20:33:41', '2022-04-29 20:29:08', '2022-04-29 20:33:41'),
(7, 'App\\Models\\User', 4, 'token', 'bc207615c2f6f6b20f3dfbb6da3dbb53830bee72b6d86e49e1d165d012141b0f', '[\"*\"]', '2022-04-29 20:40:01', '2022-04-29 20:33:27', '2022-04-29 20:40:01'),
(8, 'App\\Models\\User', 4, 'token', '11b4ed6935d79a608b18e5fa9caac3de82240166c66920f519ab362afe57df13', '[\"*\"]', '2022-04-29 20:39:55', '2022-04-29 20:39:39', '2022-04-29 20:39:55'),
(9, 'App\\Models\\User', 5, 'token', '743b3d237ba48ecf8576f454b78a9eb513352e0c1fe1ee599a7c4bf53c6262a0', '[\"*\"]', '2022-04-29 20:41:07', '2022-04-29 20:40:45', '2022-04-29 20:41:07'),
(10, 'App\\Models\\User', 5, 'token', '1c0f05307cdb4daf64be7afb5dca93b74a9e7eb2570767c53cd950cb7c93b3a2', '[\"*\"]', '2022-04-29 20:41:48', '2022-04-29 20:41:02', '2022-04-29 20:41:48'),
(11, 'App\\Models\\User', 5, 'token', 'e2fb5a9691c6a53baa721461d77b37be68bf3f94a98c91469c49bcc3aa24f735', '[\"*\"]', '2022-04-29 20:43:05', '2022-04-29 20:41:37', '2022-04-29 20:43:05'),
(12, 'App\\Models\\User', 5, 'token', 'cb85f11d60489f0e62d4526c7d55d0e9c9535603130380c8d25880d4852d81f4', '[\"*\"]', '2022-04-29 20:45:16', '2022-04-29 20:42:52', '2022-04-29 20:45:16'),
(13, 'App\\Models\\User', 5, 'token', '1b2fc26a340d1acf7e927f3063831a0e3cbd678b98e9ff95148dd01562abf053', '[\"*\"]', '2022-04-29 20:48:15', '2022-04-29 20:45:04', '2022-04-29 20:48:15'),
(14, 'App\\Models\\User', 5, 'token', '18f7cfce7c76bf39a3ff156249a4fc275b82460be1ea877d9c557059d82f3e60', '[\"*\"]', '2022-04-29 20:49:09', '2022-04-29 20:48:13', '2022-04-29 20:49:09'),
(15, 'App\\Models\\User', 5, 'token', 'e8b22a27ffb4d7cf8c4b5f1cd0eaeaa0e75dc2382673fb296d4f26431da14b70', '[\"*\"]', '2022-04-29 20:50:13', '2022-04-29 20:48:59', '2022-04-29 20:50:13'),
(16, 'App\\Models\\User', 5, 'token', '2e5a01bbacab38ee7e344c3da50d62173169b4b55982d7d746f0ea1d34ccc8aa', '[\"*\"]', '2022-04-29 20:51:01', '2022-04-29 20:50:34', '2022-04-29 20:51:01'),
(17, 'App\\Models\\User', 5, 'token', '6631e0533b180cec736f1a7f1a0e91c831def702ce3c3955d0f94d31a18fc378', '[\"*\"]', '2022-04-29 20:53:04', '2022-04-29 20:50:54', '2022-04-29 20:53:04'),
(18, 'App\\Models\\User', 5, 'token', '16a9d97610ce65e4b751a149685ff30d409c8534658d7a9f1e35d8fa7509609e', '[\"*\"]', '2022-04-29 20:53:19', '2022-04-29 20:52:47', '2022-04-29 20:53:19'),
(19, 'App\\Models\\User', 4, 'token', '36e94d325c7fb17c276362b4efdba4ec637616c728d9878088e9d4a223a1a720', '[\"*\"]', '2022-04-29 20:54:10', '2022-04-29 20:53:38', '2022-04-29 20:54:10'),
(20, 'App\\Models\\User', 4, 'token', '3493fbce5594110a42bb89c624cfcd68a7e0a5d6f07509ea00cea61fdaa09928', '[\"*\"]', '2022-04-29 20:54:33', '2022-04-29 20:53:59', '2022-04-29 20:54:33'),
(21, 'App\\Models\\User', 4, 'token', 'be13a73b87ea3e4f2ae10c5d93cb3d5820e110d631455db2dd4546e527200240', '[\"*\"]', '2022-04-29 20:55:34', '2022-04-29 20:54:17', '2022-04-29 20:55:34'),
(22, 'App\\Models\\User', 4, 'token', 'e83ee7e790dc6a16eebee2778f457da1a5357f964892221b9b7f8de3e1d35cd9', '[\"*\"]', '2022-04-29 20:57:32', '2022-04-29 20:55:19', '2022-04-29 20:57:32'),
(23, 'App\\Models\\User', 4, 'token', 'f596a6109fc7466f107c4335a89199a9ec5bbe4b7821c094224f1bcb43d8ebe0', '[\"*\"]', '2022-04-29 20:57:38', '2022-04-29 20:57:32', '2022-04-29 20:57:38'),
(24, 'App\\Models\\User', 7, 'token', '5cd766efe8c43b94e5dd49cc877c7f69996fec29be45d86b8ead7c8cb855d098', '[\"*\"]', '2022-04-29 20:57:58', '2022-04-29 20:57:43', '2022-04-29 20:57:58'),
(25, 'App\\Models\\User', 7, 'token', '5e3d8978204207c7ece17aa989869ed5b91c5ab290e2cf7d8d2b3bfae248327d', '[\"*\"]', '2022-04-29 20:57:48', '2022-04-29 20:57:43', '2022-04-29 20:57:48'),
(26, 'App\\Models\\User', 7, 'token', '7a39539a27a86eaed83b1166c81625cccf7efe11b0c95c6617946feb0c2a3e72', '[\"*\"]', '2022-04-29 21:01:21', '2022-04-29 20:57:52', '2022-04-29 21:01:21'),
(27, 'App\\Models\\User', 7, 'token', '78deb1ce838488573ccfe097ca9af0eeaed6a36881f159858e534002ae867451', '[\"*\"]', '2022-04-29 21:07:17', '2022-04-29 21:01:03', '2022-04-29 21:07:17'),
(28, 'App\\Models\\User', 6, 'token', 'cf3ea1bfe13b2ac2adccbd552595d3b580b8a0abf3d562904440eab498934a82', '[\"*\"]', '2022-04-29 21:08:14', '2022-04-29 21:07:34', '2022-04-29 21:08:14'),
(29, 'App\\Models\\User', 6, 'token', '92fee59e70644cc0b50e8175248e73f22ac8e9bbb7dc7865cc80dc0c001fbeea', '[\"*\"]', '2022-04-29 21:10:42', '2022-04-29 21:08:05', '2022-04-29 21:10:42'),
(30, 'App\\Models\\User', 6, 'token', 'd082f23f1c76becec2efe51a16f501965588df094a8fb64a14100918a4e43849', '[\"*\"]', '2022-04-29 21:11:38', '2022-04-29 21:10:32', '2022-04-29 21:11:38'),
(31, 'App\\Models\\User', 4, 'token', 'f75debb623b3e5b260d74e6599c8e418fdf65a8ef8f37342ea3962d41aa2f3d7', '[\"*\"]', '2022-04-29 21:12:18', '2022-04-29 21:11:57', '2022-04-29 21:12:18'),
(32, 'App\\Models\\User', 4, 'token', 'e788b3ffddf875d438cc1cb478143f02497cd9e7b0bcb414041243cd0776edf6', '[\"*\"]', '2022-04-29 21:12:44', '2022-04-29 21:12:11', '2022-04-29 21:12:44'),
(33, 'App\\Models\\User', 4, 'token', 'f5e396dde3264da2855989e393c7fbd39229bcbb9b0984c174d6839ee363fceb', '[\"*\"]', '2022-04-29 21:12:44', '2022-04-29 21:12:21', '2022-04-29 21:12:44'),
(34, 'App\\Models\\User', 4, 'token', '770689a50029836f896835cb4858c357f6c7b71082d78ebf4f1acd7a5779a09a', '[\"*\"]', '2022-04-29 21:12:52', '2022-04-29 21:12:37', '2022-04-29 21:12:52'),
(35, 'App\\Models\\User', 4, 'token', '3e3378380caffd93d72767eb99b84b528e31eb7228d7cb8626150a1e22284ade', '[\"*\"]', '2022-04-29 21:13:30', '2022-04-29 21:12:50', '2022-04-29 21:13:30'),
(36, 'App\\Models\\User', 7, 'token', '8b88b34c625f518a802e954b0a90da6c3003124aa1c543722b713e914b4e103d', '[\"*\"]', '2022-04-29 21:14:02', '2022-04-29 21:13:51', '2022-04-29 21:14:02'),
(37, 'App\\Models\\User', 7, 'token', '60a61ce3828c88f8cc0a05d61dfcd9590d905f075af07a3fe29623bf4c30f79f', '[\"*\"]', '2022-04-29 21:14:18', '2022-04-29 21:13:53', '2022-04-29 21:14:18'),
(38, 'App\\Models\\User', 7, 'token', '1abec7baca6c9b56dbe190601d978e449a3101f85163b2af3c588919c02b468e', '[\"*\"]', '2022-04-29 21:16:06', '2022-04-29 21:14:13', '2022-04-29 21:16:06'),
(39, 'App\\Models\\User', 7, 'token', '5eea392c066f2fa81eb89d15d042836ed1e655b93576ca14f7c26a40bdeffa7a', '[\"*\"]', '2022-04-29 21:17:05', '2022-04-29 21:15:51', '2022-04-29 21:17:05'),
(40, 'App\\Models\\User', 5, 'token', '07906d6f158aae4f3151d88dbddb9dc7cf78c1be1752741a81bd4757798e6b49', '[\"*\"]', '2022-04-29 21:17:46', '2022-04-29 21:17:23', '2022-04-29 21:17:46'),
(41, 'App\\Models\\User', 5, 'token', '953754c9408031b277c13286274c14c9ee6fc2b4aed54b2b57eaafcec3443d9d', '[\"*\"]', '2022-04-29 21:18:59', '2022-04-29 21:17:34', '2022-04-29 21:18:59'),
(42, 'App\\Models\\User', 5, 'token', '5a8d39ece8112df1f272e079c0eb938072c2c1a269fe8d8c2c8581250f0d41fb', '[\"*\"]', '2022-04-29 21:19:07', '2022-04-29 21:18:45', '2022-04-29 21:19:07'),
(43, 'App\\Models\\User', 5, 'token', '4ae0315c9e23603dfb8c6f19f98ea5ade13e4a25f1c50aa43de151b55102fe41', '[\"*\"]', '2022-04-29 21:20:02', '2022-04-29 21:19:37', '2022-04-29 21:20:02'),
(44, 'App\\Models\\User', 5, 'token', '0a8ff017edf96765e1b7cff90952f90a1592744b991880e83c16ddf85fb00bd1', '[\"*\"]', '2022-04-29 21:20:27', '2022-04-29 21:19:54', '2022-04-29 21:20:27'),
(45, 'App\\Models\\User', 5, 'token', 'd28dfdc63eedc3acca0b86c1614ceb8d6ed8cb0427e260c8ee159d8d1fafcf71', '[\"*\"]', '2022-04-29 21:21:01', '2022-04-29 21:20:19', '2022-04-29 21:21:01'),
(46, 'App\\Models\\User', 5, 'token', 'bb84e469f74cd29e063b9a0bd51c9f02ea2d6a3ebe0991a8f6cbb63cc5e1f589', '[\"*\"]', '2022-04-29 21:21:54', '2022-04-29 21:21:33', '2022-04-29 21:21:54'),
(47, 'App\\Models\\User', 5, 'token', '0c037b856e8603ed643e0ff18f9ecbfb8a66d172d001c3ec1aa22b637b27a615', '[\"*\"]', '2022-04-29 21:22:21', '2022-04-29 21:21:44', '2022-04-29 21:22:21'),
(48, 'App\\Models\\User', 5, 'token', '2101dabb52e424b57ea3540cfbf7153148ddb6b8626ad53256fb3b98d62277ce', '[\"*\"]', '2022-04-29 21:22:47', '2022-04-29 21:22:04', '2022-04-29 21:22:47'),
(49, 'App\\Models\\User', 5, 'token', 'e5c385a3e76fef9e9917e6a0590ddad698180033a2c52031358c6a06089adc49', '[\"*\"]', '2022-04-29 21:24:03', '2022-04-29 21:23:39', '2022-04-29 21:24:03'),
(50, 'App\\Models\\User', 5, 'token', '647079a6c71e5e152d22ab70e82ed2a055d1ee5333e36ac6accbc8fbd92aa251', '[\"*\"]', '2022-04-29 21:24:27', '2022-04-29 21:23:55', '2022-04-29 21:24:27'),
(51, 'App\\Models\\User', 5, 'token', 'e9209efe058e57412742e725e92e3c6d64558939ffe97e6971c0f57d0ebc99af', '[\"*\"]', '2022-04-29 21:24:24', '2022-04-29 21:24:13', '2022-04-29 21:24:24'),
(52, 'App\\Models\\User', 7, 'token', '4836f9df74534596d8ab85a0f9961b83c143c710de110eeb14176abb2acc6d6c', '[\"*\"]', '2022-04-29 22:04:01', '2022-04-29 22:03:35', '2022-04-29 22:04:01'),
(53, 'App\\Models\\User', 7, 'token', '666b3d9669e0033e128f6a7846b8c78b30d6e642a0a1e044d4f23a8a69d4a2b9', '[\"*\"]', '2022-04-29 22:04:22', '2022-04-29 22:03:51', '2022-04-29 22:04:22'),
(54, 'App\\Models\\User', 7, 'token', 'aef37bdd2a905c2535054e33b6546a0f01a934dfe9029d32ceb1b03c3acbf456', '[\"*\"]', '2022-04-29 22:07:26', '2022-04-29 22:04:02', '2022-04-29 22:07:26'),
(55, 'App\\Models\\User', 7, 'token', 'c48f2bc3622762148eeaf73f32fd0b98c33ffa15ca3f3dd6639abcb007b5dc62', '[\"*\"]', '2022-04-29 22:09:01', '2022-04-29 22:07:24', '2022-04-29 22:09:01'),
(56, 'App\\Models\\User', 7, 'token', '480287550cec99494f915eeb9703aebb7d4594159b59b87915bf33c11813801f', '[\"*\"]', '2022-04-29 22:10:26', '2022-04-29 22:08:48', '2022-04-29 22:10:26');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `profilpic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'base-notfound.svg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `profilpic`, `created_at`, `updated_at`) VALUES
(1, 'papandras', 'papandras@example.com', '$2y$10$vV.amnWatx0b.eNnI/i2le3VJqSTwGtTjuqagfvIYkWlVhZ1SyD9C', 'admin', 'base-notfound.svg', '2022-04-29 20:11:06', '2022-04-29 20:11:06'),
(2, 'polli', 'polli@example.com', '$2y$10$M4Ey5wPXWvtmNYp7pkY27.I//lp.7l/CHbx6JdRxrPIXJQWPQ2AvS', 'admin', 'base-notfound.svg', '2022-04-29 20:11:06', '2022-04-29 20:11:06'),
(3, 'peti', 'peti@example.com', '$2y$10$EEqmLbBWXXQqS9PemITYv.h0cU6SIqDrzXEuxMU0PZ8zysD8Qhzy6', 'admin', 'base-notfound.svg', '2022-04-29 20:11:06', '2022-04-29 20:11:06'),
(4, 'csiazsofia', 'csiazsofia@gmail.com', '$2y$10$.g/yBFA7WQd3YIGXWIQTDuSWA6izgknn2lBFT9hw6tE9Bx9kVERgy', 'user', 'base-notfound.svg', '2022-04-29 20:14:58', '2022-04-29 20:14:58'),
(5, 'raczroland', 'raczroland@freemail.hu', '$2y$10$iJBdpAeTRkUIeSCHvTDp4Owjg3quMHmqWJXgvKpy..vT6tXEiLY/G', 'admin', 'base-notfound.svg', '2022-04-29 20:15:53', '2022-04-29 20:15:53'),
(6, 'mateszilvi', 'mateszilvi@hotmail.hu', '$2y$10$YuaUPuar02aGq78MtXW.AuOkHbd1yuIT7Ci30RbOrvb1VoAxRQrr.', 'user', 'base-notfound.svg', '2022-04-29 20:17:00', '2022-04-29 20:17:00'),
(7, 'csehviktoria', 'csehviki@gmail.com', '$2y$10$ve.pAjqhRioQzmc8Mn0s2.tNclLhr2y8T/TRL9rQdJ0RKJKMpZrc6', 'user', 'base-notfound.svg', '2022-04-29 20:18:12', '2022-04-29 20:18:12');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_user_id_foreign` (`user_id`),
  ADD KEY `files_group_id_foreign` (`group_id`);

--
-- A tábla indexei `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friends_user_id_sender_foreign` (`user_id_sender`),
  ADD KEY `friends_user_id_addressee_foreign` (`user_id_addressee`);

--
-- A tábla indexei `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupmembers_group_id_foreign` (`group_id`),
  ADD KEY `groupmembers_group_member_foreign` (`group_member`);

--
-- A tábla indexei `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_owner_id_foreign` (`owner_id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `groupmembers`
--
ALTER TABLE `groupmembers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_user_id_addressee_foreign` FOREIGN KEY (`user_id_addressee`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_user_id_sender_foreign` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD CONSTRAINT `groupmembers_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `groupmembers_group_member_foreign` FOREIGN KEY (`group_member`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
