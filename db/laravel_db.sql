-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2019. Júl 19. 03:25
-- Kiszolgáló verziója: 10.1.40-MariaDB-0ubuntu0.18.04.1
-- PHP verzió: 7.0.33-4+bionic

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `laravel_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(10) NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` int(10) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `category_id`, `body`, `title`, `picture`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Why Node.js Is The Coolest Kid On The Backend Development Block!', 'Ipsum', 5, 1, '2019-07-15 22:00:00', '2019-07-15 22:00:00'),
(2, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem', 6, 1, '2019-07-16 18:28:42', '2019-07-16 18:28:42'),
(3, 1, 1, 'A hiedelemmel ellentétben a Lorem Ipsum nem véletlenszerû szöveg. Gyökerei egy Kr. E. 45-ös latin irodalmi klasszikushoz nyúlnak. Richarrd McClintock a virginiai Hampden-Sydney egyetem professzora kikereste az ismeretlenebb latin.', 'Mi a Lorem Ipsum?', 7, 0, '2019-07-17 04:28:54', '2019-07-17 04:28:54'),
(4, 1, 1, 'A Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét', 'Szövegutánzata', 8, 0, '2019-07-17 04:33:00', '2019-07-17 04:33:00'),
(5, 1, 2, 'Az 1960-as években népszerûsítették a Lorem Ipsum részleteket magukbafoglaló Letraset lapokkal, és legutóbb softwarekkel mint például az Aldus Pagemaker', 'Pagemaker', 9, 0, '2019-07-17 05:43:22', '2019-07-17 05:43:22'),
(6, 1, 2, 'A Lorem Ipsum részleteinek sok változata elérhetõ, de a legtöbbet megváltoztatták egy kis humorral és véletlenszerûen kiválasztott szavakkal, amik kicsit sem teszik értelmessé.', 'Pagedraw', 5, 0, '2019-07-17 05:43:22', '2019-07-17 05:43:22'),
(7, 2, 1, 'A Lorem Ipsum részleteinek sok változata elérhetõ, de a legtöbbet megváltoztatták egy kis humorral és véletlenszerûen kiválasztott szavakkal, amik kicsit sem teszik értelmessé.', 'Fisrst', 5, 0, '2019-07-18 07:56:01', '2019-07-18 07:56:01'),
(8, 2, 2, 'A Lorem Ipsum részleteinek sok változata elérhetõ, de a legtöbbet megváltoztatták egy kis humorral és véletlenszerûen kiválasztott szavakkal, amik kicsit sem teszik értelmessé.', 'Secund', 5, 0, '2019-07-18 07:58:59', '2019-07-18 07:58:59'),
(9, 2, 2, 'A Lorem Ipsum részleteinek sok változata elérhetõ, de a legtöbbet megváltoztatták egy kis humorral és véletlenszerûen kiválasztott szavakkal, amik kicsit sem teszik értelmessé.', 'Third', 5, 0, '2019-07-18 07:59:04', '2019-07-18 07:59:04'),
(10, 1, 1, '10A Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 12, 1, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(11, 1, 1, '11A Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(12, 1, 1, '12A Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(13, 1, 1, '13A Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(14, 1, 1, '14A Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(15, 1, 1, '15', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(16, 1, 1, 'A16 Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(17, 1, 1, 'A17 Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra17', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(18, 1, 1, 'A18 Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(19, 1, 1, '19A Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(20, 1, 1, 'A20 Lorem Ipsum egy egyszerû szövegrészlete, szövegutánzata a betûszedõ és nyomdaiparnak. A Lorem Ipsum az 1500-as évek óta standard szövegrészletként szolgált az iparban; mikor egy ismeretlen nyomdász összeállította a betûkészletét és egy példa-könyvet vagy szöveget nyomott papírra', 'A Lorem Ipsum', 5, 0, '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(21, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'typesetting', 9, 1, '2019-07-19 03:01:50', '2019-07-19 03:01:50');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'javascript', '2019-07-15 22:00:00', '2019-07-15 22:00:00'),
(2, 'css', '2019-07-15 22:00:00', '2019-07-15 22:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_04_142546_create_categories_table', 1),
(4, '2019_07_16_154846_create_articles_table', 1),
(5, '2019_07_17_142303_create_photos_table', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `photos`
--

INSERT INTO `photos` (`id`, `user_id`, `path`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'public/1563384770.jpg', '1563434292.jpg', '2019-07-17 15:06:09', '2019-07-17 15:06:09'),
(2, 1, 'public/1563384191.jpg', '1563384191.jpg', '2019-07-17 15:23:11', '2019-07-17 15:23:11'),
(3, 1, 'public/1563384293.jpg', '1563434368.jpg', '2019-07-17 15:24:53', '2019-07-17 15:24:53'),
(4, 1, 'public/1563384435.jpg', '1563434445.jpg', '2019-07-17 15:27:15', '2019-07-17 15:27:15'),
(5, 1, 'public/1563384770.jpg', '1563384770.jpg', '2019-07-17 15:32:50', '2019-07-17 15:32:50'),
(6, 1, 'public/1563385389.jpg', '1563434858.jpg', '2019-07-17 15:43:09', '2019-07-17 15:43:09'),
(7, 1, 'public/1563386171.jpg', '1563435003.jpg', '2019-07-17 17:56:11', '2019-07-17 17:56:11'),
(8, 1, 'public/1563386667.jpg', '1563435411.jpg', '2019-07-17 18:04:27', '2019-07-17 18:04:27'),
(9, 1, 'public/1563387044.jpg', '1563434445.jpg', '2019-07-17 18:10:44', '2019-07-17 18:10:44'),
(10, 1, 'public/1563387169.jpg', '1563435612.jpg', '2019-07-17 18:12:49', '2019-07-17 18:12:49'),
(11, 2, 'public/1563436740.jpg', '1563435685.jpg', '2019-07-18 07:59:00', '2019-07-18 07:59:00'),
(12, 1, 'public/1563436747.jpg', '1563435801.jpg', '2019-07-18 07:59:07', '2019-07-18 07:59:07'),
(13, 1, 'public/1563498760.jpg', '1563498760.jpg', '2019-07-19 01:12:40', '2019-07-19 01:12:40'),
(14, 1, 'public/1563502072.jpg', '1563502072.jpg', '2019-07-19 02:07:52', '2019-07-19 02:07:52'),
(15, 1, 'public/1563502387.jpg', '1563502387.jpg', '2019-07-19 02:13:07', '2019-07-19 02:13:07'),
(16, 1, 'public/1563502441.jpg', '1563502441.jpg', '2019-07-19 02:14:01', '2019-07-19 02:14:01'),
(17, 1, 'public/1563505664.jpg', '1563505664.jpg', '2019-07-19 03:07:44', '2019-07-19 03:07:44');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Teszt Elek q', 'teszt@a.hu', NULL, '$2y$10$EEO5kW1IhbI6zE9EYUwVPujiH9jMGkOBJxNWICy7whR9ejCp0wtA.', NULL, '2019-07-16 16:20:30', '2019-07-16 16:20:30'),
(2, 'Bártfay Bence', 'bence.bartfay@budapestkozut.hu', NULL, '$2y$10$7AMEj3SJjCtZeaFiIc4eTODOkhJtLEk3ak9opkP7bwRYJccu5buTa', NULL, '2019-07-18 07:55:20', '2019-07-18 07:55:20');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- A tábla indexei `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
