-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 18 Jun 2021 pada 11.32
-- Versi server: 8.0.18
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livestream`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `division`
--

CREATE TABLE `division` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_id` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `division`
--

INSERT INTO `division` (`id`, `division_name`, `desc`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'Direktur', NULL, 1, '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(2, 'Kepala Unit', NULL, 1, '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(3, 'Kepala Produksi', NULL, 1, '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(4, 'Technical Support', NULL, 1, '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(5, 'Sales', NULL, 1, '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(6, 'Admin', NULL, 1, '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(7, 'Bagian Umum', NULL, 1, '2021-06-04 03:51:30', '2021-06-04 03:51:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `event`
--

CREATE TABLE `event` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` datetime NOT NULL,
  `meeting_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `livestream_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sesion_limit_time` time DEFAULT NULL,
  `waiting_time` bigint(20) DEFAULT NULL,
  `status_id` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `event`
--

INSERT INTO `event` (`id`, `event_name`, `desc`, `date`, `meeting_link`, `livestream_link`, `sesion_limit_time`, `waiting_time`, `status_id`, `created_at`, `updated_at`) VALUES
(12, 'Mustika Mid Year Meeting', 'Mid Year Meeting adalah salah satu kegiatan yang pasti rutin dilaksanankan oleh berbagai perusahaan setiap tahunnya. Untuk waktu pelaksanaannya masing-masing kantor atau perusahaan tentu memiliki jadwal tersendiri, bisa diawal tahun, akhir tahun atau pertengahan tahun.', '2021-06-30 09:00:00', NULL, 'https://youtu.be/-5KAN9_CzSA', '12:00:00', 5, 4, '2021-06-18 04:19:30', '2021-06-18 04:28:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('06bd79489f0e209061012e908e57cf5ca4fd335e4b4145b4c8e2208be87cd2f848f0c2f76483cdd1', 1550, 1, 'MustikaApps', '[]', 0, '2021-06-15 20:30:35', '2021-06-15 20:30:35', '2022-06-16 03:30:35'),
('3d4d6a573ed93c200a50d1763d9afdc0225e294f0bb958461d07ef2dc54067549ff644e20f56c8e3', 1, 1, 'MustikaApps', '[]', 0, '2021-06-15 20:16:41', '2021-06-15 20:16:41', '2022-06-16 03:16:41'),
('ac03cbd14d97790f24b3acc26de40f88471fa1c8d1d058164099722d025a510e93f9e8d02a0dd7ab', 1, 1, 'MustikaApps', '[]', 0, '2021-06-17 07:31:06', '2021-06-17 07:31:06', '2022-06-17 14:31:06'),
('dae459f413c70b86aca16c763aa72accca9dad2305944527e1ae7c24eed3ed3446f04edbc158e369', 1, 1, 'MustikaApps', '[]', 0, '2021-06-15 20:33:16', '2021-06-15 20:33:16', '2022-06-16 03:33:16'),
('ec46c554d3bc7d51568619ef59b06bedace9e546fc0150801a1980e0725a4f80664e92dbfe0837ec', 1, 1, 'MustikaApps', '[]', 0, '2021-06-17 07:31:04', '2021-06-17 07:31:04', '2022-06-17 14:31:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'VDX9py5sRjWeKfuT6rEGYAzUpJlXTYSpLayTcEHz', NULL, 'http://localhost', 1, 0, 0, '2021-06-15 20:16:18', '2021-06-15 20:16:18'),
(2, NULL, 'Laravel Password Grant Client', 'vORipKL0NwBjL8IoduufyQkWaOHFvANuJqQeRcfT', 'users', 'http://localhost', 0, 1, 0, '2021-06-15 20:16:18', '2021-06-15 20:16:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-15 20:16:18', '2021-06-15 20:16:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quote`
--

CREATE TABLE `quote` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_id` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `status`
--

INSERT INTO `status` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Active', '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(2, 'In Active', '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(3, 'Archived', '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(4, 'Running', '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(5, 'Joining', '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(6, 'leaving', '2021-06-04 03:51:30', '2021-06-04 03:51:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `substream`
--

CREATE TABLE `substream` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speaker_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `event_id` bigint(20) NOT NULL,
  `division_id` bigint(20) NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` bigint(20) NOT NULL,
  `user_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `nik`, `division_id`, `user_verified_at`, `password`, `status_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '0000.MTK.0000', -1, '2021-06-04 03:51:30', '$2y$10$FFd4/vOAmCMID6pQW9XtD.wc9kW6vppXkyxs0cG9RNnpRYNTMY.x2', 1, NULL, '2021-06-04 03:51:30', '2021-06-04 03:51:30'),
(770, 'HEE RENALD MAMANGKEY', '0001.MTK.0209', 1, NULL, '$2y$10$Z4VUA3QcABAHtAPXJBp2H.tlXI2f.uZ2KnDL01GnEdxhWvVifbtOe', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(771, 'NG BARNABAS', '1152.MTK.0209', 1, NULL, '$2y$10$oSWd5llfEMNgOsWjQLCUSu7OldjeTZkNtVLExZg4fEoSnlBi9gg8u', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(772, 'ASRI RIANA DWIJAYANTI', '0004.MTK.0209', 6, NULL, '$2y$10$G70eywq25LqW4Rwk8thaTukxOBaLzAoGYZ/l8qTHJnRZGLyp13Bf2', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(773, 'YULI FITRIYANI', '0017.MTK.0609', 6, NULL, '$2y$10$vBaRoFkiXvs/xnmtkCkss.hYNR2Bz3R6uSFIaxnPvex5qL2zwgGoW', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(774, 'ABDULLAH JUNAIDI', '0595.MTK.1115', 6, NULL, '$2y$10$QZbM14xOcNdTTeaX8SKrlOXSmK6uxCxSFrby7XfGDjpMxD4yReHui', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(775, 'SUSI SUSANTI', '0261.MTK.0913', 6, NULL, '$2y$10$i2rMueIS8y4Em3m6NqfGzuBpzceaj6cOdBDuivHJkYfSagDpY8EGy', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(776, 'DIMAS TONI SURYADI PUTRA', '0856.MTK.0416', 6, NULL, '$2y$10$lS7XyYKZ2xWhZR8K8Ox/Z.riRqNxfkpMa7J966W4wjodNUDwahnxu', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(777, 'MUH FATIHU ROJAI', '0613.MTK.1115', 6, NULL, '$2y$10$8OKcF7iIQ4tySF9LlfFFROCS2U7.zNacj0NgM0nia6MOonRmd49zm', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(778, 'ARIF SUMYANI', '0120.MTK.0812', 6, NULL, '$2y$10$SUtFdBbkneIls/G7JxB0geLo1Z34p7PXeVzALsglHSp1yQR/gWHxW', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(779, 'TERI LINDAWATI', '0034.MTK.0110', 6, NULL, '$2y$10$ux5eIOb6JBMdizbDI0HY7epC4.oboC5SCQMkb8w8W6xLwRQ64NEaC', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(780, 'DEWI SULISTIARINI', '0022.MTK.1009', 6, NULL, '$2y$10$IuvJCn5B5p0HcSXkN/Xb7.j15Q37Mdd57SOuVi.mtzinB6C6iAKC2', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(781, 'PRATIWI ADI SUTARTO', '0110.MTK.0412', 6, NULL, '$2y$10$V3lU4IMhUYIZxJ/EedGqteTRgAUqUDmT7P32s9SBq.WxC48Cr6WDS', 1, NULL, '2021-06-15 20:21:17', '2021-06-15 20:21:17'),
(782, 'DWIYANTO', '0033.MTK.0110', 6, NULL, '$2y$10$ZbUCznL/MNX0OrYJJD1qa.IalcyXs1L1nYekEtUa5iyAxOlLORPx2', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(783, 'NIA DWI FITRIARINI', '0065.MTK.1011', 6, NULL, '$2y$10$JcxmQplrnIau6xCcivLJBOHjvBprJRKdEPSUpztpykn23CAsW2fRm', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(784, 'Y SOFE MEIYANTOKO', '0008.MTK.0309', 6, NULL, '$2y$10$0.YJwktkKYl1y/s8bS2zge0qWFLI6LbtsLcHGPClZqOfpBitNdPGi', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(785, 'WAHYU ARYADI', '0036.MTK.0210', 6, NULL, '$2y$10$LDJ6KhqUFKmfo4A74CWR4eygBKtKKJ.vmh1DE8S2FEGJwB45xbtGu', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(786, 'SATRIYO PRAYOGO WICAKSONO', '0315.MTK.1213', 6, NULL, '$2y$10$tht/8S1Dn1h1E5/wVMrQZ.frGr2O9LtYkklIKSrqkZj/6EKDdJI7m', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(787, 'PARADITA PRAMESTHIAN', '0069.MTK.1011', 6, NULL, '$2y$10$90muRFYnEUwnDKG5kjf7C.olbqVVsclcOoPop4DEdPtk3QLUkEu7m', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(788, 'CHOIRUL ROZAQ', '1287.MTK.0717', 6, NULL, '$2y$10$z11W1yXq7kIW7GRUqtPY2.rN5i/xiFuEbU87aLko5AuTr7IFsyO/e', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(789, 'SOFI MUDRIKAH', '0447.MTK.0515', 6, NULL, '$2y$10$nPbXrzPGNxyJ9RxkOg40F.1UuhAr4GHJNLpCOMPxsOOE0PHyG4kF.', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(790, 'EVI KURNIAWATI', '0576.MTK.1015', 6, NULL, '$2y$10$wCJMByapm/Y8JKqbDVlKQemWQoAowxjhGyw6Z6L4UnUjRY9UndxOe', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(791, 'TRI UTAMI HANDAYANI', '0267.MTK.1013', 6, NULL, '$2y$10$WBzx.bhtW9R4c7mKRpZ2A.bvE.RTfXQGlGh97I5PwYu1cjovqMDTq', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(792, 'TRI SUHARYATI', '0639.MTK.1215', 6, NULL, '$2y$10$OSe0p3JzjfDDBUAXfPPMQe5J54ylmMjlYrxd7BT6SPwFa4e6R6cky', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(793, 'MEGA DEBIE PERTIWI', '1010.MTK.0816', 6, NULL, '$2y$10$5aO8lC95UwJ1Jj2eXSRJQOiCWxel6a2DjMfNZmv42a9zVijbK8UXW', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(794, 'HERU HARIYANTO', '0340.MTK.0714', 6, NULL, '$2y$10$T8iN3CngBPiKG0QYg.OrL.G/aV./2IeZXSFhgvXCsgkwlQ.QCc1jO', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(795, 'MAHAPUTRA TRAH BINATHORO', '0945.MTK.1115', 6, NULL, '$2y$10$q2yN9gqMxB5WlCekUY3SiONRI/QEoXKaTDIvNZkcrEoByGTRONROe', 1, NULL, '2021-06-15 20:21:18', '2021-06-15 20:21:18'),
(796, 'MUHAMMAD AMBAR WIJAKSONO', '1466.MTK.0518', 6, NULL, '$2y$10$RTlbg3SX.T1GVPvT7ZT21.eUjSq2iUyI28gGbqvnlAFh4ftaxr/oK', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(797, 'DEWI SAFITRI', '0161.MTK.0113', 6, NULL, '$2y$10$lJUlpGD1snSsxOVmd16X/eu5VfoKr.Z1srl06cB1vyFXCxQ6JioHW', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(798, 'INAYAH LISTIANINGSIH', '0295.MTK.1113', 6, NULL, '$2y$10$6whsjDIw.hsm7iYu6nrkLuI0Ev8wFwWIonqji4ZcMaJlJjtR1ceOW', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(799, 'ERIN SEPTIANI', '0608.MTK.1115', 6, NULL, '$2y$10$YKCT9b81J9UUFS/hE2nbH.jlamzf8HEiO6rLTXeAOU5/YQFnxCZDS', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(800, 'NADYA NANDA UTAMI', '0609.MTK.1115', 6, NULL, '$2y$10$09jeZkW4fkHJYMA0ZQPbQe4rQwKHm.4rGyI2UPph3eFs9nBpEKiUm', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(801, 'LINDA SAFITRI', '1505.MTK.1018', 6, NULL, '$2y$10$aF/Ssqqzg1IWHRtVTnyQceNoIhiV0K7u.xH8qhLkBczNDl86IReFK', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(802, 'VANIA DEYA JENA AQKDA', '1540.MTK.0119', 6, NULL, '$2y$10$7mqiAplR3PngLnNGsjtwQ.oYgBnC06sUepGQW/.HgmWC9oog0YVOa', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(803, 'DENIS PURWANTI', '1541.MTK.0119', 6, NULL, '$2y$10$DewwfU7qHOSjOMF7dMrMF.VnziwtQl9Aq93Xdyh8Ahl0h.HuLxEpi', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(804, 'RACHMAD SUBEKTI', '0053.MTK.0811', 6, NULL, '$2y$10$ninCfVMh.UN6m01pNraAEekJwGX.THJSVJflNwyYJQvTIaj6/0ODC', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(805, 'ELIS SETYAWATI', '0126.MTK.0912', 6, NULL, '$2y$10$Ysaeeu0E8Z1u4yUYVOZct.uWLBXoK2FIpwHUpOKKCnB3z0f9o/iHi', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(806, 'ADIB MURTAJI', '0189.MTK.0313', 6, NULL, '$2y$10$8bgw4GJVUSlLP/1Rn1Gu6ublkeI.2B4fqd3Txy.LWZcYkK6rS8Uie', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(807, 'ASRI MARIANY', '1498.MTK.0918', 6, NULL, '$2y$10$XT/PAdFLi0zA18D7rHpZKuohX0mDCkTuVr4kNFd/x7itPIbyO.y/i', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(808, 'INDONAH', '0191.MTK.0313', 6, NULL, '$2y$10$tYVoFGk0We3cbmGGtCv3uOvJvhHOx8f.na4rX2xAqftIdrpE05l7q', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(809, 'ANISA YULIANA', '0256.MTK.0913', 6, NULL, '$2y$10$6aAUGLfE9FnB4zUVaVSnkuVRLfH/0MSIHBnFkdoQNUTBb8sIZUbTG', 1, NULL, '2021-06-15 20:21:19', '2021-06-15 20:21:19'),
(810, 'MEGA RINDA PRATAMA', '0296.MTK.1113', 6, NULL, '$2y$10$mck2ORONb.xiHaiZ2gBG4.wde1kaQJF/L6D198tS5sveuL0MrWHdq', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(811, 'ROSSI KUSUMA JATI', '0614.MTK.1115', 6, NULL, '$2y$10$0bpwS.8xoVLg5tOyhVjXyO8USLzEWfi7rA8ScXTUpKW0mPXzRGE9O', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(812, 'FERI HARTANTO', '1212.MTK.0117', 6, NULL, '$2y$10$YuRQ2NCas7EeACwpcgrCqeHbRAQ12ocJS0NnFmvPJUCClE3iHLSnW', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(813, 'AMY AYU PRIMADANI', '1550.MTK.0219', 6, NULL, '$2y$10$JF/bOtWQ.9G.3Vm7U7qrOO7weaQgx.JDdZjHkejYnXiQdrWHvIlsq', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(814, 'ALI MUHSON', '1551.MTK.0219', 6, NULL, '$2y$10$.zwCFbfnp4hFC9iaE0t2FOAKWChvNPoCuQRJMVAaZ4BRtqx4SkEJi', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(815, 'AGNES PRAVITA ARIYANI', '0307.MTK.1113', 6, NULL, '$2y$10$cSxLpUxDtTvq7wZ/m6eOueHLOFOMU/toiJhz0aOmexRRP/fIZ3/ja', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(816, 'VELIEKA APRILIANI', '0309.MTK.1113', 6, NULL, '$2y$10$XFwm7tdnrUjSvWF14kzHFuABxnmTJdOMvf4wUVmx9bDzz3qKh0tNq', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(817, 'NANDA BAGUS FAVIANTO', '0392.MTK.1114', 6, NULL, '$2y$10$y7NwztWWqZYz8acWlCVwBeewX3UP7ZMQkCdNtP.EOwkReSQv6tQPa', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(818, 'DEWI AMBARWATI', '0571.MTK.1015', 6, NULL, '$2y$10$cDnUfidcKr4dA1fjBAHT2eeHxoKBVM.k1ClBotktUCvyVqnCfB2R2', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(819, 'JULYANTI PURNAMASARI', '1073.MTK.0916', 6, NULL, '$2y$10$CtX87tWyO/aVW8w1DgIt/eaW6U0tn0CaV2cisgx0EOG/zsvfLwRES', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(820, 'NUR AFIFAH 1', '1433.MTK.0418', 6, NULL, '$2y$10$3Ye62TWHjeZCeomi4jRlK./dSSBUQOTcPoSR84CpUYvcKLVeZWC/m', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(821, 'ANNISAA NOOR CHASANAH', '1487.MTK.0818', 6, NULL, '$2y$10$a5UdiyMEDd7f88I4xIIfeeWehMlX3SHT21t27HuLSg7XS/fAdI1zO', 1, NULL, '2021-06-15 20:21:20', '2021-06-15 20:21:20'),
(822, 'SITI KURNIA APRILIYANI', '1556.MTK.0219', 6, NULL, '$2y$10$2sPE6rvGrGWagiK26oy.YOfxQd1Qvj3Q/ZXgP/O/bSluZPR4UEYda', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(823, 'DWI BOWO', '1732.MTK.0520', 6, NULL, '$2y$10$VA3qczI.noZY2NudOH.FJeciFZJC6Ty0bCm4.xJs15.MzvGAMbZ8q', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(824, 'DWI ARIANTO', '0538.MTK.0915', 6, NULL, '$2y$10$qX7Bu5uGcKWlFOrbtnpHYOY4t2vRlIYqZJOLSAqzUHAgNk25L/Xy6', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(825, 'LUTFI SETYO WIBOWO', '1009.MTK.0816', 6, NULL, '$2y$10$AzYZqRGOJse0rIezmZPFq.qA/i.E7GDG88jEVe0q5xW9fcmI3Mu0.', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(826, 'FADLU MUHAMMAD AMRULLOH', '1761.MTK.0121', 6, NULL, '$2y$10$cuHir38deQbIG6t3t5h9j.KM6VoKr/H1ozywVkHIw5AVfaY/rvSiW', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(827, 'EVI NILAWATI', '0020.MTK.1009', 6, NULL, '$2y$10$wi8bn/5yESoOXkKofUnCA.lpuulqMJ4umCWS4mWO0moTbjPTqakPC', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(828, 'BENI SISWANTO', '0046.MTK.0311', 2, NULL, '$2y$10$1vF/YKHB.iCI2CZFIFICpOFJvJSwKeZD3Nam/w3ZIuMBrzh.vVaom', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(829, 'LELLY NOVIARTI', '0260.MTK.0913', 6, NULL, '$2y$10$z5tg/iPkDYMKp2q8MtpbMO38MUZy.mrrxOzkUwqfrpSkEA8bhf41y', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(830, 'FITRIANTO EKO NURCAHYO', '0478.MTK.0815', 2, NULL, '$2y$10$kTrDQUaYnWO166jUREmq4eXDStMdD/LUXw2ws9xlZ/XCKFC1Eon8i', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(831, 'SUHARDI', '1676.MTK.0819', 7, NULL, '$2y$10$257Cvlte3raIKZpgKbhzU.CtFQ1ILTJw7Pf9h4r.CWHpkkJea5Z3G', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(832, 'IDHA BAGUS ASIDIQI', '1773.MTK.0521', 4, NULL, '$2y$10$Mr3S7PVknmEAHfu/.Uya/eYw41bvdiHvW4MS1kIu5QZqN9uTaKMv6', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(833, 'ADE NUGRAHA', '1774.MTK.0521', 4, NULL, '$2y$10$PdA1H7TaECSjiJq.xuMOmu7dJRga5mre/rRQ7vXPQc4DaR/fOEpp.', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(834, 'WAHYU IHSANUDIN', '0278.MTK.1013', 2, NULL, '$2y$10$yOfNy.P9P2v4px4REwvV9eagdBDepnPYDdsPKuCKGj5n2db4hMwne', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(835, 'EKO PURWANTO', '0559.MTK.0915', 7, NULL, '$2y$10$qvuIIoshsVPKdEyXAwQabeLyC5NxyqzagK/Av2Qmv8eQZw0UdPe52', 1, NULL, '2021-06-15 20:21:21', '2021-06-15 20:21:21'),
(836, 'LINGGAR FARUKHI', '1023.MTK.0816', 5, NULL, '$2y$10$fISr2UXdT2CiyKkmHLZ4m.vXh2iMZptbujRhNPre1PpFWodj5nFVa', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(837, 'DHONY HARYONO PUTRO', '1315.MTK.0917', 4, NULL, '$2y$10$Kl0d2RppaeXusBIgKCxoEueQ7TvbPEfG5qSxtdVTu3lCYuoMGZA7C', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(838, 'JUNDI SAABIQ', '1442.MTK.0418', 4, NULL, '$2y$10$vnymfYip7oyheMwFfhGGyurDfVBbqVD4h7oMIbF/2JS6Jxs5ZvC6y', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(839, 'ANDIKA AGUS HARI PRADANA', '1596.MTK.0419', 4, NULL, '$2y$10$Ep0auW/GIJKNdk70CPysNur64uKyFKgUVitUFRPz4GK9cJB29FNja', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(840, 'HASBI IBKAR ASSIDIQI', '1600.MTK.0419', 4, NULL, '$2y$10$gRr1SMUZsW/WOA8Zc52jEOiP2JeYkm0P4BfGWvdpMKXt.3HatiocC', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(841, 'YUMRONI AFANDI', '1623.MTK.0419', 7, NULL, '$2y$10$Gc2iYJ8vd/Dj3lDb2qKLvOCOdihQ9.n2b228VdjdXClTCw4orjmQm', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(842, 'ADITYA PRASETYO', '1626.MTK.0519', 7, NULL, '$2y$10$JRt9BlRxLqxeoZ6eyrxX2OSCM1.K4mGa9rUSI9UYEHuWYNNpqeHha', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(843, 'ADITIYA', '1658.MTK.0819', 4, NULL, '$2y$10$j604WPzBu20FHG7LBa8urO7340WcNLe04CJNpt9ge4hAfrt6gqX/O', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(844, 'YUSUF AHMAD SUWANDI', '1684.MTK.0819', 6, NULL, '$2y$10$GKQbL0RbWZZJ/9LBiNXpee/CiHqjMpC7JKUtalM/ppAvMWtSnIf3m', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(845, 'RIDWAN DIAN DARU', '0286.MTK.1013', 3, NULL, '$2y$10$PAGdIcBbCtHQMWeOJu74v.eFgj9nYXw3sCDx36w60/Ks6ZelUcJJm', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(846, 'IRDAS SYAIRULLOH', '0502.MTK.0815', 3, NULL, '$2y$10$hnKBuxz75W1GZ4KZiOktquakhtufyu97pS8esxT4.L42M6BLzNEAi', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(847, 'INDAH RATNANINGSIH', '0835.MTK.0416', 6, NULL, '$2y$10$IrfqkVAOWR8yczr552GwJ.eIGWhTPOoZjtmNOqyfbqCnnILt/ifxW', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(848, 'ESTI NUR\'AINI UMIAROH', '1584.MTK.0419', 6, NULL, '$2y$10$MH3G8YlBCiJw4laCWXxjguMynFZqXFtBNJ1zDsvAn040WTs9dhG3y', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(849, 'MOCH. AZMY KARTIKO', '1737.MTK.0620', 4, NULL, '$2y$10$/6dVyi7D1U.4CZbOoyS33erjk7zu0TxWT1gz/AO/CfB6X4wz31fMW', 1, NULL, '2021-06-15 20:21:22', '2021-06-15 20:21:22'),
(850, 'SUNADIYONO', '0298.MTK.1113', 4, NULL, '$2y$10$4iezihbiAowrHGELm66BquegW1AgVybo2NS2rmBS1bcBUgk00dJQa', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(851, 'SUSANTI', '0494.MTK.0815', 6, NULL, '$2y$10$tFzQl.nzMpxndK/BP8Jdj.PAZmq8F3F7dpsm2TwjmkPB8OnhkXMyG', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(852, 'AGUS DWI PANDU', '1659.MTK.0819', 4, NULL, '$2y$10$QbTZMAS9vR0Ou7VhJe1/2ek2xTLOE9RXHqpjm00X2KvGMJ21Vl9tG', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(853, 'SYUKURMANTO', '1422.MTK.0318', 7, NULL, '$2y$10$JIIlZARnNGBjEdTr/YU0XewtR6jsZnIREjpjAxBdrIbt8i677EsDu', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(854, 'LINTANG INTAN LARASATI', '1595.MTK.0419', 5, NULL, '$2y$10$JITwpBLeMO5buHXemdOv9edgjnPxQvsZF9Tz0MHbHzHB3In66FKpe', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(855, 'ERI KURNIAWANTO', '1621.MTK.0519', 7, NULL, '$2y$10$tYfDKrYrfNz7v.szOCIZJ.lcHbl88ZrtnUAwSXMWS3Jh7dv.4wWKe', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(856, 'MOHAMAD RISKI MAULANA', '1677.MTK.0819', 7, NULL, '$2y$10$B9loBV7k4MFnsVNaxi4J5uDCF7ke5vnRuyofUsvY.Ik4hQXFg.rTa', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(857, 'SUKARDI', '0273.MTK.1013', 2, NULL, '$2y$10$nRRfPRLK/dBwXNVGL7Zb5O0C.PSjNbei30qw1DUM0HL4/kPlrME4e', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(858, 'KRISNA PARMANTA PUTRA', '1752.MTK.0820', 4, NULL, '$2y$10$FsObwBZsGFFObDP1PycBXOa9AjD2lrH1Wg1tDTPFWz1ht8kDwxo1O', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(859, 'MAYA SINDY KUMALASARI', '1525.MTK.1218', 6, NULL, '$2y$10$GCexoeLIEXCMcrkwOyS0fOPjStfJGnBEPRGi3mMSXmW8JK.ioyJku', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(860, 'GALIH SATRIA RAMADHAN', '1619.MTK.0519', 4, NULL, '$2y$10$BaqTwRnU9gKl3tVpFW7JFencdvCsL/YXRPd4pzOiTj5AKv8MePKvm', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(861, 'MUHAMMAD RICKY SAPUTRA', '1775.MTK.0521', 6, NULL, '$2y$10$dTj0RK9JoRb2aHGsbPn9zOl2QhC4o.MX0mP9uo3Gqa8X6.xPaMJvK', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(862, 'EDI PAMUNGKAS', '0228.MTK.0813', 2, NULL, '$2y$10$bwuWIrzVjlTOr0CfLYSCCeIoAskDy9fy6WHCKnbH/UvnMcNTJBstW', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(863, 'PURDIYANTO', '0266.MTK.0913', 5, NULL, '$2y$10$F8UA25seAuoW.g..ybcae.Y07Setgm.C5HtpPaDZkBPjK.P1VmKIC', 1, NULL, '2021-06-15 20:21:23', '2021-06-15 20:21:23'),
(864, 'MARIA APRIL LIANASARI', '0396.MTK.1214', 6, NULL, '$2y$10$zrn1qtUV39pckSwdPH19nu7NlfJmNEuONWas3ngiDKWdVke3WGYqi', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(865, 'ALBERTUS WIDIATMOKO', '0954.MTK.1115', 4, NULL, '$2y$10$RQrWS39WYfXjhRwAAmWVNey3jcl8nK7xDObtPNsyYn/AMiF4GRChe', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(866, 'TEGUH PRANOTO', '0999.MTK.0716', 4, NULL, '$2y$10$4UHdYcqVy9hkEVjacE75LOESMIxmdqwnmTOvHd4ao5KowKKpnU1du', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(867, 'JUPRI TAMAMI', '1148.MTK.1016', 4, NULL, '$2y$10$rt3z8ugBszz1pjtj0Hwvk.3eZ/mFir/J50d/qWL1fu07F653QjOx.', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(868, 'MEITA SUSANTI', '1183.MTK.1116', 6, NULL, '$2y$10$Jh9dAH3wQ3.fLG6H3cXhHOkGJmGUbJe4lRfx0JepQa5oqAUr1J7tu', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(869, 'FADIL', '1274.MTK.0517', 7, NULL, '$2y$10$cW0JvDsAg5YiXoV7NdGBfemNDScJZbX.0mD9Y6BhB/AwCWorGTisq', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(870, 'HERMAWAN SAPUTRA', '1421.MTK.0318', 4, NULL, '$2y$10$42zN6YXeCBDyTlLceAoM6ey/7gKMLUioXZRGy9tSSRDCY8iQBlh5i', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(871, 'MUHTADIN', '1674.MTK.0819', 7, NULL, '$2y$10$XuLCkszRnR5Xys93EtVuQ./qqLOj8DRxdOsbSDhZqZnoz8HQjmbcW', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(872, 'ALEK SETIAWAN', '1154.MTK.1016', 3, NULL, '$2y$10$Fa/8uIiq3t8w9guGgRaMYu.44Cnk4QyoqoArUA4H7OoQscOghDFUm', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(873, 'MARTA RAHHMATIKA SARI', '1493.MTK.0818', 6, NULL, '$2y$10$l2f4H6cwkR7sgEmRYSEWUecPP8xFn5Ol36gccrbZ6RMVC8nCv5sUq', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(874, 'BOGIE ALFIANTO', '1597.MTK.0419', 4, NULL, '$2y$10$A/gmB2IRx4iKrOVYS685Ou3Uw7050gqn2OP/aEpOjpCjWzd9BU/b6', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(875, 'EKA NOFITA SARI', '1586.MTK.0419', 6, NULL, '$2y$10$.iCorIrM.frpbN7fawqnpucZrWp/sX596JSlVI.4.Nt35j7Ph1Smq', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(876, 'ERNI SAFITRI', '0154.MTK.1112', 6, NULL, '$2y$10$RoWO/P7TfmN1Yf8ra4E2w.bWywoctFUKcH/NDY5gc5xbta5ASM5TK', 1, NULL, '2021-06-15 20:21:24', '2021-06-15 20:21:24'),
(877, 'R. DANANG GEMA WIJAYANTO', '0249.MTK.0913', 2, NULL, '$2y$10$CFrvMXjn7zqFpw6J.XqXL.k7bGW4XyCXIuC/B3lOB0MG/FuCJ.1sS', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(878, 'KHASANATUN NIKMAH', '1396.MTK.0218', 6, NULL, '$2y$10$UMv96XS9CRNIrFitpK32Fu0ap2Z.uKh4cyt.YMi65kuX2lAgE5bG.', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(879, 'FERIANTO', '1579.MTK.0419', 7, NULL, '$2y$10$EmsJIkESjYobeM.j5ePDru4UCviA32PuwG1xkU9Lfp1OUjm2ngTzm', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(880, 'REDDO SEPTIADI', '1636.MTK.0519', 7, NULL, '$2y$10$puEx6r1FC8qFL2LKslE4FeB0PuaQIiwo8kYrGIgSMWbuR8kK0O1BK', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(881, 'SUPRIHATIN', '0910.MTK.0516', 4, NULL, '$2y$10$KSj4UmRLIEMBwfT/l8LRD.nhY6x6WitZPqlDm3BmoOK8jbcyDLRr.', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(882, 'JATMIKO', '1744.MTK.0720', 4, NULL, '$2y$10$E3jVnhs2lIdxfKkuZ51VYezW5Qa0pAjJTVuGgg3d37i95yrDhgu2e', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(883, 'ACHMAD IQBAL FAUZI', '1751.MTK.1120', 4, NULL, '$2y$10$nICWfsJjYit0hVPIpW2By.EhQEjowQFrnu4n5JJkUfW7iZ/b4fmy.', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(884, 'YOHANES PUTRO NUGRAHA', '1393.MTK.0218', 5, NULL, '$2y$10$SBaN6RncThvvecF7TtNJFercLkgkVraMsNZeUC7wjYRGUzLNmP5W2', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(885, 'SUMARSONO', '0005.MTK.0209', 2, NULL, '$2y$10$ECf.G8beRiLZBu3SK9gtZOwVo9NWjzaCnpWafWq6tUXliG1DEgm8W', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(886, 'YOHAN RINEKO PUTRO', '0322.MTK.0214', 2, NULL, '$2y$10$7qpch6Vmqo21G1oXG35IA.dCE6FjlbRWpoEVoe6TWckV5zy/zFXLK', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(887, 'AMBARWATI', '0640.MTK.1215', 5, NULL, '$2y$10$eM9KewUQguOncB14GCVwMugizjyhwUFrdKQfeduarDu3I85us9gH6', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(888, 'ZAKARIA HUSEIN ABDURRAHMAN', '1425.MTK.0318', 6, NULL, '$2y$10$9ze844kvRep.pEt/OWyU/.etJDQTXUMPANO0znJaVB.SX1nEWJFqO', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(889, 'FAISAL ADIVIATAMA AHMADI', '0150.MTK.1112', 3, NULL, '$2y$10$GeEOWj9O9aOZ.NTj3.hPQOfwt.7iJNHw466RxSXbnxj3box2y1f5a', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(890, 'EDI PRAYITNO', '0170.MTK.0113', 3, NULL, '$2y$10$ThmSb9rwI2jzuBbOTQDRSO0ex4bNjN9orKR1DsurezXmawJG4HJTK', 1, NULL, '2021-06-15 20:21:25', '2021-06-15 20:21:25'),
(891, 'SIGIT HARI PRASETYO', '0207.MTK.0513', 2, NULL, '$2y$10$K0OJZfhBtfgtGXYNYxlN9ew61biQgNCKRELiMEwSme0Ok7bCE/nra', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(892, 'LAILATUL MUVIDAH', '0768.MTK.0216', 6, NULL, '$2y$10$4sdP941UT3B86u8GGWPBcOxjnPG8rURjjoE4Vbu6y6lsuUKJ3ApTe', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(893, 'AGUS PRIYANTO', '1062.MTK.0916', 7, NULL, '$2y$10$GkI2DCiXGdjz2vL18yzvf.WT7KYD5fy7uYtsIStHgGMDl374kCZRK', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(894, 'ARIF ISNANTO', '1387.MTK.0218', 7, NULL, '$2y$10$twNjI8o3MwTCjSf.3klrZOTfDHUM8EBYqpFuaCymtCLDuKJ5YHC/a', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(895, 'IKUM PUSPITASARI', '0192.MTK.0313', 5, NULL, '$2y$10$oF3b4KCA7H7H7B5gWWcnZOcUPrEUa8d6VnimTLNS.RFVNp/iicahG', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(896, 'CATUR BUDI KRISTANTO', '0421.MTK.0215', 4, NULL, '$2y$10$Qo4OIk92UBD8DbXYaZfIWuJHgwAY.5HElvUYINiHtIxkS9pRvMEDy', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(897, 'PRAYOGA YULIYANTO', '0762.MTK.0216', 4, NULL, '$2y$10$5EiFXi1dsdJ4hGBzko8GJuk1IGGsz2xxtdarTJCs4zdcTlgzQ72A.', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(898, 'DONA BANGUN JAYA BAMBANG SAPUTRA', '1076.MTK.0916', 4, NULL, '$2y$10$QDv2WIcFO35bilOwDWcNxeTwClFTka4gv8ISfpRc/31pwTw5oHxAG', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(899, 'HUDA SHODIQ', '1714.MTK.0320', 4, NULL, '$2y$10$b2piqSbJ5I0J0jAtJ9uKku7CA3it.UW87K9ZWWcArsuuvrSVwPIna', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(900, 'NUR AFIFAH', '0782.MTK.0216', 6, NULL, '$2y$10$cwDpIftxpevNqcEZNGTkLeTS0BBve4Cjrbsygka4Vl4dJaQwH4UOi', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(901, 'TITIK SUTAMI', '0094.MTK.0212', 6, NULL, '$2y$10$Wdtss89MVFkXLzv2BJUoJOtIbhllU.Nm6TsT8LjNZZfnJrdfA.9QK', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(902, 'SATRIAWAN NUGROHO', '0234.MTK.0813', 3, NULL, '$2y$10$APvzfYQHtqwba9QvKw8VEeAl6/lEfNxYPANu9J8e539vQRdtIGLIu', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(903, 'SATRIYO WIDAYANTO', '0368.MTK.1014', 4, NULL, '$2y$10$DKvab0DAMXRtbvszsYmZmOvOGu6gaS9TWATFW4EXb4lqXUqj7T1im', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(904, 'FATA GRAHA SANJAYA', '0400.MTK.0115', 3, NULL, '$2y$10$qqVIVL3X74AXBwEWBaCGVuxX7illvFFh4iN7eyaxEN7ORrg/2s7gC', 1, NULL, '2021-06-15 20:21:26', '2021-06-15 20:21:26'),
(905, 'FENDI SETYAWAN', '0775.MTK.0216', 4, NULL, '$2y$10$EE7uTUQsbkdGfSZZyhoPRORsaOEXf/Vjr6szBLNcHMLgSzGuZZAZC', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(906, 'MUHAMMAD ANWAR', '1053.MTK.0816', 4, NULL, '$2y$10$9Cq9rc/KTnWoCdeUqI7s6.3O6BoFGI4uAQ8/LRrBWzrg9wQecGtuq', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(907, 'EKO SULISTIYO', '1389.MTK.0218', 7, NULL, '$2y$10$iF3oo65jIY2z8w5kcryzC.S92df.aeP05enWiFN6iV3svtKqn4bxG', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(908, 'HERIYANTO', '1406.MTK.0218', 7, NULL, '$2y$10$IBiezG.imUK.vr5mhcqcAOIJeyHKe9VSRDXkTkR/5CgVmOS7uQ.S.', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(909, 'PARJIYANTO', '1407.MTK.0218', 7, NULL, '$2y$10$7uN8BLcRJdOVwl46mrO2m.xRATUZDUGvYKsZA0o8UT73Uh0l/YfXG', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(910, 'DIAN PRANOWO', '1536.MTK.0119', 4, NULL, '$2y$10$GS48os5CowWzEIcBoXt4oOM8LKBpzdLUt8qFkHXE7IsZkaB1WC2.W', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(911, 'VANESSA AJENG RAHARJO', '1266.MTK.0517', 5, NULL, '$2y$10$PdHIcmKCycvVk9xPCMK4Cu7sFth/9Ci805yNyGdxCzQM3tsOjxMCu', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(912, 'MUHAMMAD ABDUL AZIZ', '1562.MTK.0319', 4, NULL, '$2y$10$g9TNRXHCBuC8tTwU0aA87.0X1.Vc9sZf3ub..ZmJyYXrm1M7kK0Xe', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(913, 'CANDRA RATNANINGTYAS', '0802.MTK.0316', 6, NULL, '$2y$10$nzQGDJ3KzvewaTe3m01NLuJ8BhGpWYc3uvj3RZrGZQeJakpbuI9z6', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(914, 'JOVICHO BARLY EFFENDIE', '0635.MTK.1215', 5, NULL, '$2y$10$o2.XqPuxbP1scrQcfqLmQ.RIiSG6bKQTFkEngedermDbbiVWEHgOa', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(915, 'RENDA ADRIAN FIKIYANTO', '1015.MTK.0816', 6, NULL, '$2y$10$YTFGYo/BDgM9RQJ0rAgZI.JlhGSkWFabcf0GCtwMPPXrUJm7qK1ti', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(916, 'MUHAMAD HISAM', '0093.MTK.0212', 2, NULL, '$2y$10$HRzHu4HE/9q5vGCHAPo05eIcfbsILw.JXEDyiDwpFDjZEwdAP.IQW', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(917, 'SUPAT ANDRIANTO', '0560.MTK.0915', 3, NULL, '$2y$10$v.W2ZH8mqB8OHcFlwp3TJeb9/k3IXLOXjdvJ0XK2Ozb3KthSPlywi', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(918, 'UUN DWI SEPTA', '1061.MTK.0916', 4, NULL, '$2y$10$1rBcf5cFM9MQFXdG1JZ4Ce4tPTfn9.udofU0mKKpE7QRJqw.oUozm', 1, NULL, '2021-06-15 20:21:27', '2021-06-15 20:21:27'),
(919, 'DWI ASTUTI', '1081.MTK.0916', 6, NULL, '$2y$10$K8V96g4K27W2Yrk./NFxpOdHRbuRqoRNxfXqPBIOjzFSJUTSYt2xS', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(920, 'DELI SAZLI', '1096.MTK.1016', 3, NULL, '$2y$10$fTwUB1DASKPKvE9tAW/KlOLB5t5EBMnewZhaCci3.ipMDbgs2fpqu', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(921, 'NURUL ROZIKIN', '1357.MTK.0118', 4, NULL, '$2y$10$u9xtj6lI.b/LcCTamiLNsuf87DS3VIW.3XZEB3Dn2DsQmExImjVYa', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(922, 'ANGGA YULYAN ARDHY SANTOSA', '1385.MTK.0118', 4, NULL, '$2y$10$GnOwIU5S8d.QevCHosliFulBvWMvoyzipLnW7pTbSQY49MdAVDr0e', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(923, 'AHMAD ASYKHIYANI', '1416.MTK.0318', 4, NULL, '$2y$10$di9l2pIzhcz.rd0I9JBXzuWnbtHGzj/maj98IB6JHmMgrxtbg753C', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(924, 'VENDI GINTORO SULISTIYONO', '1518.MTK.1118', 4, NULL, '$2y$10$aagKaZP.QzX6q0f.j5YRh.wyLGZOpl3LjbZ7C80cHAR7V9OXZlCTe', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(925, 'SUGIYONO', '1082.MTK.0916', 7, NULL, '$2y$10$X6LxCXS6WsqZCnMVJgtCZuTzF.WHawL.uvicej0ZE5NNxtM.Ex2X6', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(926, 'ROIS', '1292.MTK.0817', 7, NULL, '$2y$10$31qv.NoVzNB7JaHgz6xYiOj97S5zSDzVfOA17ih5bZSPOrwdalnzW', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(927, 'IHWAN NUR ROHIM', '1527.MTK.1218', 7, NULL, '$2y$10$x0rPfoqdd.sudt/lhhaG9O4U6ON9lnGWYV4dvjhmbuT8VyY7CSNQq', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(928, 'DEDI SANTOSO', '1533.MTK.0119', 5, NULL, '$2y$10$AaurdqYXj3dry1iWUAusRODmesc7hiOoVxWh94MWbyJD95.EE0IZS', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(929, 'ILMIANISA AZIZAH', '0767.MTK.0216', 6, NULL, '$2y$10$LQvLVYC38FCW3CyaNW1FvuP2NqW1XI8WTUIZgKvHOeUmJYoOIDF4e', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(930, 'SURADI', '0007.MTK.0309', 2, NULL, '$2y$10$rYND/nzFGl8p2xx9RKe3xOjYgJS74wVPxqmQUc7/7pwYd/sWeP58W', 1, NULL, '2021-06-15 20:21:28', '2021-06-15 20:21:28'),
(931, 'DIANA FITRIANI', '0334.MTK.0414', 6, NULL, '$2y$10$OF2HLMh2otAE3AwxASTuM.FGuVT7gCqstCG2tulMf2qUdFXwcTAxu', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(932, 'SURADI 2', '0622.MTK.1215', 3, NULL, '$2y$10$NyCBidI0mlZm03L3.eJq9e.WXKJwpwnit89rlrYcSuVxNX9R7Xo2e', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(933, 'GIYANTO', '0627.MTK.1215', 4, NULL, '$2y$10$./AjnvdlReaeLFg94s31puq/dIwtwMzsO5XQXed8bokF/93sx4kpK', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(934, 'BETI SEPTIANI', '0792.MTK.0316', 6, NULL, '$2y$10$UjQuC/GpK5Imo9xnj1moD.5PMIxCoT66t7PZIefNFuCpsqhm1QjxC', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(935, 'DWI HARJIYONO', '0980.MTK.0616', 3, NULL, '$2y$10$qsEpeN3QLTBgiBdyDAxUSOPx.dcPiKZCDG58iIYcp6p2ijFxWKr7m', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(936, 'ARI FIRMANTO', '1021.MTK.0816', 4, NULL, '$2y$10$OcrZbWBcL7vztMA/c.vdseuzTCHqkP8PZYT5Lb461cHabYh2yWofy', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(937, 'MAULANA NDARU BASKORO', '1413.MTK.0318', 7, NULL, '$2y$10$YfDU..dvLOjZCGvwROUHQ.yxZZa9hkTpHJD1qHN1RFNIa/4AZL482', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(938, 'ERIK GUSTAMAM', '1414.MTK.0318', 7, NULL, '$2y$10$lz/muDlRNunrICSseKvPrOh2nHEbGMbEjUKZG4hK0Ploq7MWJqYiq', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(939, 'FAJAR TYAS PERMANA', '1657.MTK.0719', 4, NULL, '$2y$10$LZOV3kHvkpMzbPGq4MT0RuKtRXdG.uDFyIXyevZ8euxIhbZru1Nli', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(940, 'WANTONO', '1716.MTK.0320', 4, NULL, '$2y$10$LDczOH1Do2RUkS1kHG1uo.aJjGUFD4nII3HZxkngavFVpDEzf88iu', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(941, 'MUCHAMAD DANANJAYA PRABOWO', '1703.MTK.0220', 5, NULL, '$2y$10$P.T360k79ASLqjJVWIlzIeLHla/5bj5Z2XqDntpGZFg2LpG9LmRbK', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(942, 'SUHARDI 2', '1086.MTK.0916', 7, NULL, '$2y$10$dXjblPs5XEGZKvzicrSdd.bozxop19w9UvoSscWMHahX88hrkev6W', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(943, 'SEPTIAN ADI NUGROHO 2', '0328.MTK.0214', 5, NULL, '$2y$10$/zII3x2wNCQ0rr1DxUbZBe4k..QrvU8Er6pO8czY2HNJZs0YhOO9.', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(944, 'HANIF RAHMAN IRAWAN', '0103.MTK.0412', 2, NULL, '$2y$10$qczukKS1lu7a7rMm2nU3o.JYQQqiayYhF4b4c8X4lxHF4lxbhG3p.', 1, NULL, '2021-06-15 20:21:29', '2021-06-15 20:21:29'),
(945, 'DINI ARUM ANISSA ARINTYA', '1682.MTK.0819', 6, NULL, '$2y$10$OJgX9cqQBTsIrNvKhnv.uunnK7XLMp7bfmpklWHVeLkaSrDoEWycm', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(946, 'SICHA SILVIANI SHOLIKHAH', '1087.MTK.0916', 6, NULL, '$2y$10$Ntm1BQ8wxWnhS.MulAi1rutTvoxfWRL7IyebHXoTXi9JS6qGvTJF6', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(947, 'WAHYU PURNOMO', '0784.MTK.0216', 4, NULL, '$2y$10$XyB4s83j0yr7yXvE05Z99OzoiqZY13YwPCn.imVnbMHh9/HDkn5re', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(948, 'FADILLAH AKBAR', '0569.MTK.1015', 7, NULL, '$2y$10$9qPc6WGRZrxNvZ4zLnB0EO5maWUAbOldlbPZwL3BsO04bGvWihTU2', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(949, 'SUTRIYAT', '0964.MTK.0616', 4, NULL, '$2y$10$tTogEv8CoDwI9adwFh86suzPfMwJdONRpMHEYmbbXeP1yrieD5ug.', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(950, 'ANDI BAYU RACHMAN', '0015.MTK.0509', 5, NULL, '$2y$10$9jJeqiRYG5roh/aTdeLa2uGBE0ZWuVYWbIiD7v5YS2oCQ/KfEs/zm', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(951, 'SUMARDI', '0043.MTK.0111', 2, NULL, '$2y$10$9kgTfKPuvjAivhU5GkkKw.L.4FVIsh9qCDb2IfDJgbeeL5lLZxnLa', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(952, 'ANUGRAH BUDI PRASETYO', '0225.MTK.0713', 6, NULL, '$2y$10$wlQzqvNcFxKdhBbXsjgaoORFZYZiO7zFWpIDxfXQHlNluj3RSjhbu', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(953, 'GALANG APRILIA PUTRA', '1063.MTK.0916', 3, NULL, '$2y$10$91hZoCUDdzsoJ7IUWm2UMuqMaGXcwm9I99lUQRyaPTST3RE1cUIOC', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(954, 'MACHASIN', '0139.MTK.1012', 3, NULL, '$2y$10$hakt6Bc1lGQ2l3q6pHXQdu9zDrvN2xmtrxKWu65DZFGVVnx//qUKW', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(955, 'FAJAR RINDIYANTO', '0367.MTK.1014', 3, NULL, '$2y$10$FudOLM.g0Z1GpjXl4yQS5OrGwshLmULugOAdgiXjzO8z7OqI014fS', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(956, 'MUHAMMAD HUSNI MUBAROK', '0376.MTK.1014', 5, NULL, '$2y$10$36vCkUKtIXeRHkNWfbIpmOUEYVJNl6fR3.kTrqPt1TiqPSMM8NDY.', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(957, 'MUHAMAD ROSID', '0420.MTK.0215', 4, NULL, '$2y$10$6F.kxzQnXhQrmBSVadWW.eJ9/ENw9QwuotuMeaMy5zkjbKIpTSqR2', 1, NULL, '2021-06-15 20:21:30', '2021-06-15 20:21:30'),
(958, 'AMARSANI WIDODO', '0911.MTK.0516', 6, NULL, '$2y$10$jpnMPn0lBmyrAV0NiGDTEOHc4Ci85BqWvfrGkBzkSacAET7YeUgB2', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(959, 'MUHAMAD GHULAM YAHYA', '1054.MTK.0816', 4, NULL, '$2y$10$CcC2lGWQF1mVElZ/pFCgqu6zKnASrwz1Rh1eIpw.iYEW46slKW1RO', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(960, 'SULIS RASWIHADI', '1197.MTK.1116', 4, NULL, '$2y$10$PDtaIpqBL.8iYPOfoUl00eV/AF6UDjzp63tfS5ClOg.xbLfCUSpwy', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(961, 'LUKMAN', '0620.MTK.1215', 7, NULL, '$2y$10$jkk3.WUwwOhZ2mUDoduniu.M7XMKbnM28kA904hovy17gy7RiSnE6', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(962, 'RIZKI ISNAWAN', '0865.MTK.0416', 7, NULL, '$2y$10$OCPG7P9AJIRXde6yWD8vKOfW22F8lUw2RXZ4MEAs/gvHcbt11pEs6', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(963, 'SURYA ADITYA SAPUTRA', '1408.MTK.0218', 7, NULL, '$2y$10$Yp/of3ZX2S.aWmmf64qyNO.NGRt3B6A3RtqDKECrQsQ8GCXf4tznS', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(964, 'LUJENG PUSPITA LESTARI', '1511.MTK.1118', 6, NULL, '$2y$10$Oe0LM8qXEgcs65T4kfEjRe6aZVmRx/YQRGoxLkjIuwaLuYBifeaXW', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(965, 'MUHAMMAD JUNAIDI ADHA', '1648.MTK.0619', 6, NULL, '$2y$10$kiUWteyE1sgUNW/sZ5MJF.oWpdbsrhd6GHHCqKSZo6qPL.WpIodha', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(966, 'OKI ROHIMAN', '1573.MTK.0319', 4, NULL, '$2y$10$16oNwEqpcCVPSpzwqctApu1rlLavhPYjFrzvIrcYqUj1kN1VCALe6', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(967, 'MUHAMAD WAHIB', '1167.MTK.1116', 4, NULL, '$2y$10$aLvUiML.QVStdGSRJ/ZPfuYtW07EkjuerrZwbKuuImtwKqRDFQMMi', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(968, 'AGUS YULI KRISTIYANTO', '0236.MTK.0813', 3, NULL, '$2y$10$EhCMwyCqXxB5VA8p.LnBEOOHD/PfQdX4aJWaSH78BJO8fIcvQoq8G', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(969, 'MUHAMAD HASAN ASNGARI', '0313.MTK.1213', 3, NULL, '$2y$10$8CY4Au9/WXJcSus.I72t6O7g/HtNopz720WbalFPBrz.9hltc.GhW', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(970, 'AGUS RUWADI', '0816.MTK.0316', 7, NULL, '$2y$10$wbvvTj2dWk3msDaaui7eS.4YoAY0rpNw2Fcb3jXw8/91mvQYMtpg2', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(971, 'PUJI PRIHATIN', '0900.MTK.0116', 4, NULL, '$2y$10$zR2hFjNPBGEzDUADzvevQu19WAyJqVNyuA02FT./cbdtH4N5VEXC6', 1, NULL, '2021-06-15 20:21:31', '2021-06-15 20:21:31'),
(972, 'IMAM BUCHORI', '0901.MTK.0116', 4, NULL, '$2y$10$eFAIbsYiBxVyn1QIQc17Eu2Iq5b4pEBIOVi4AFoakmf5XtUOnyLES', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(973, 'RANI PUSPANINGRUM', '1209.MTK.0117', 6, NULL, '$2y$10$jbn1SIpqjKxhlB3d3GpxRuMO9ZWJ7ct.HMerE.T9POlcjCDyStUkS', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(974, 'FIQQI CHOLISHOTUL MARDLIYATI', '1497.MTK.0918', 6, NULL, '$2y$10$/UsSEy35eKnUl/bIr5dWaue2.bwfQ0HK6uixgPeOM/8PTErhrZDqi', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(975, 'MURDIYO', '1574.MTK.0319', 7, NULL, '$2y$10$eSE394wP0InTicsjYQm3geaYmaIIP27jFu7xNTrMi84gwZWd/aZJi', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(976, 'NURUL HIDAYAH', '1622.MTK.0519', 6, NULL, '$2y$10$Fb3ZPo6C3UQQXxxjRYv2/uC5P9WIOgV//I/Amr5qFVdL4hI6iRlWa', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(977, 'IMAM ASY\'ARI AHMAD', '1627.MTK.0519', 4, NULL, '$2y$10$fpgWCx/fF5xxknA6DGvace07PTUZ8I8yGw8/ESGclYt/Qct.sXE1e', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(978, 'DHAMA PRAYITNO', '1628.MTK.0519', 7, NULL, '$2y$10$Lhs.K/LnLJavfyvc4gVasebrmBWI1ZkvOVa2DbooEhJF3hOkeoA4y', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(979, 'NUR KHABIB', '1655.MTK.0719', 4, NULL, '$2y$10$kmgPUu7ujis3k1EuqOBWjeXUIo4GLpoMxQ/MQz07SCFr.ARUJ/r2q', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(980, 'GILANG YOGA ARFIAN', '1687.MTK.0819', 5, NULL, '$2y$10$Tpdyc3ZbYGkZI2Ir5GTo3eqlvoEFMrNtHdLF4oBz15Z1l4zXv1ozG', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(981, 'ARIEF WIRA WIBOWO', '1695.MTK.0919', 4, NULL, '$2y$10$JJ6T82mZddDoALEtOzOV.e2xHfRB/gGu0qklXD7CXbHJwjRuLROe6', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(982, 'TARYONO', '0354.MTK.0914', 2, NULL, '$2y$10$he317uwEDsNTJcCafIYULOkuZGTUc7t55nElmVbICfH5Umdq96E0W', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(983, 'SEPTI ISTIQOMAH', '0573.MTK.1015', 6, NULL, '$2y$10$YeOIUBLic5Nb5P3MlxtzdeMFMl8TGYqj80M8GI3.G7PX3BJy6GVVG', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(984, 'NUR CHASANAH', '0039.MTK.0910', 6, NULL, '$2y$10$Yv3c2HNtsLLeu.LjsSF2N.ArqICNhqDRFcfoStxJjtpGIGxUWCtN6', 1, NULL, '2021-06-15 20:21:32', '2021-06-15 20:21:32'),
(985, 'FRENDITHA QUEEN RENDY', '1296.MTK.0817', 4, NULL, '$2y$10$jCkEvwiGWr5ziRZDYC40Eud0f7lNBVy9YecDUVJlyHTwVhTrkKLQa', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(986, 'IMAN NURRAKHMAT FIDJAYA', '1482.MTK.0718', 4, NULL, '$2y$10$VGDrf3iQoqJm6Ot.PFoiQe4aAy3OrS30Cy/mkyjsD0u8OC74IGkgi', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(987, 'DEDI IRAWAN', '0195.MTK.0413', 7, NULL, '$2y$10$jHEN2b9cRzyoX6umhcg4qO1SZxRCmmPeGIearjEl5nVyiNl4EBZYq', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(988, 'KASIRON', '0419.MTK.0215', 2, NULL, '$2y$10$VgudmtoneE8eB31dBxQvreCK1vqhrFfkBMo7mUK.DLQTfNV2OQiHe', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(989, 'ARI MUSTOFA', '1572.MTK.0319', 5, NULL, '$2y$10$/3aRKstY7u2a0PE.XlxcN.gydAjQqxDszlcYLfaIMFI/HdASCHR.y', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(990, 'TIYAR AGUS WIDODO', '1203.MTK.1216', 4, NULL, '$2y$10$PJ4o/25TSoW2W36DmTBfHOfulPc37Q7CJfhChGlR2K.tt4wEwm7iW', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(991, 'UNTUNG BUDIARTO', '1322.MTK.1017', 4, NULL, '$2y$10$x3fhqtuhnBuz62q4urqeQuCrxzRWScCa7wop.ULOPfl3VVhxT4JxC', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(992, 'YENDI PURWOKO', '0090.MTK.0212', 2, NULL, '$2y$10$tzgbvEDLfnsQqONjphOm6.mExYp1c58lDXIZB2TkSNYyhzPVTG6ue', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(993, 'TRIYONO', '0240.MTK.0913', 4, NULL, '$2y$10$kI5SCjjCHUM/f7Z4oShbMulhN5fB7TEhBwKFgjJBELmGvFv7n2F6q', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(994, 'AKHMAD NAJIB', '0385.MTK.1114', 4, NULL, '$2y$10$O34/wGXvXC/y/gNMYAmrX.Riv/6DLFaxVlJkx/UDlMDHdrtZynNZK', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(995, 'AGUS SETIAWAN 2', '0520.MTK.0815', 3, NULL, '$2y$10$uGOdjrMuv6DAL2WlNv3tQ.BIhUjBFYRZ69Ce9.r7Y74pcRHzX8dGG', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(996, 'AKHMAD MURTAKI', '0781.MTK.0216', 4, NULL, '$2y$10$ujy8OP7Eytupz8.mV/aRuOcpzQgzuUDG/Hw.6MtkuEgcW1vZUqcmO', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(997, 'DENDI DWI KURNIAWAN', '1089.MTK.0916', 4, NULL, '$2y$10$US22BdEF9xS6wx.n/eBwVeKgiITXDilu3wc.OnNIDag5xFfJfxfKa', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(998, 'DESKIYO CATUR SAPUTRA', '1132.MTK.1016', 4, NULL, '$2y$10$KtWFR6rV0PZ9SlEAY09L9uqfvZCJn/ZCnoa9prZaArUvU0pegbQMi', 1, NULL, '2021-06-15 20:21:33', '2021-06-15 20:21:33'),
(999, 'FENI RAHMAWATI', '1342.MTK.1117', 6, NULL, '$2y$10$Dg5VnDg07bJAZRcTi7RMBOlaAYAHNTj7HBmTaabAbstHWCEBdodHm', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1000, 'M RIFQI AZIZI', '1581.MTK.0419', 6, NULL, '$2y$10$kvwG47mRmj/byMuJOur7k.n7j6JCttNHR44/eZwHvSZQ63wQHJSWW', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1001, 'LYAN PRATAMA', '1649.MTK.0619', 7, NULL, '$2y$10$HPrZoF9Tb715rxIqkSZaSO5Tjt59Mju8o3cPuRfmHj1mRFDZ/KFWi', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1002, 'RAMA TRIAN AL DANAR', '0966.MTK.0616', 5, NULL, '$2y$10$GRUsR5Eu90rsIQWVMquk1uLn0q2Xrs717/mgNsqMcCLtGDpOJwdfW', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1003, 'DIDIK DARWANTO', '1686.MTK.0819', 6, NULL, '$2y$10$C2eYffuZSU9HiO09s7BkXuDe0OpSECJ3h08tKg8oRdMUtAYBhW6NO', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1004, 'YUDHI AHMAD ASHADI', '0023.MTK.1109', 2, NULL, '$2y$10$ZHp6cSx5oDBusYZo02K6JuyQvBRCPAe2WTZ4M0jrlSTvXCxJF0JrG', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1005, 'CRONELLIA HUTABARAT', '0049.MTK.0611', 6, NULL, '$2y$10$GSIgtHbXzNecFux8tDm9.uORhwjBrjC6K79AlT7CRMLnpKfoLN9gq', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1006, 'ARIS DWI PRASETYO', '0437.MTK.0315', 5, NULL, '$2y$10$YSGGP8OYns.50FwHfA/sWuNlxJ8LXvWI8K0eIJjviZbrNCYDfp0a6', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1007, 'NUR HIDAYAT', '1035.MTK.0816', 3, NULL, '$2y$10$O9o.2c/fNVSstebih6uBjed8vJtJdets1tYkyybRIzYjZiHTze5ia', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1008, 'SOHIB', '0025.MTK.1109', 4, NULL, '$2y$10$axcwYm.4xKXO6DqZaBYp3.Vu19h9Zd0F7KAujRl7mA4.r.sNVUqW6', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1009, 'DAIMUL FAIZ', '0095.MTK.0312', 2, NULL, '$2y$10$OBLNYlBPYYtjiwaAd.QiQuljExC9xaLHsUvwtTp.l5xCnfRqQVZzO', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1010, 'FITRI HANDAYANI', '0153.MTK.1112', 5, NULL, '$2y$10$6l78YeNTkf6D9OJ/RE7aJOevTDcbE/9Pw0pF6TEZitK4mZ.8EBXpS', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1011, 'ACHMAD ZAENI', '0262.MTK.0913', 3, NULL, '$2y$10$aWuxY8wT0XaVjWfkisqOaupYpb32Hpq6kwlTzslvYZ6AJU8gtKUq6', 1, NULL, '2021-06-15 20:21:34', '2021-06-15 20:21:34'),
(1012, 'MUJIONO', '0288.MTK.1013', 4, NULL, '$2y$10$SU6OslcimzoOH15SRpgepO4kj3IL88qZ8LiJ7Im2cLDtA9AF6k5F2', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1013, 'DINI SEPTIANI', '0519.MTK.0815', 6, NULL, '$2y$10$B9hhtWJSMfvFhF7X5Fnp6.Bl8A/BktCAKWB2slTkhX9rDBtF4yzsW', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1014, 'DEDY PARMONO', '0535.MTK.0915', 6, NULL, '$2y$10$Si3lLwDRujLpusD0xSK74eDfKbibQ1LhqtEH7Y7NfA7JGRw5yxz0G', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1015, 'SRIYANTA', '0550.MTK.0915', 3, NULL, '$2y$10$kidpFW1Yp5fNqCyYcl/dL.8S.PnJQAiLyZtSpt9.GFMZqO3Zu2lNy', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1016, 'ALVENIA CARINA PRAMUDITA', '1019.MTK.0816', 6, NULL, '$2y$10$x0KpzRRL1U3W/x1lChCWmukxVQOW2hSswsm4fFfexQDC0GKbMJRzO', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1017, 'AJI PURNOMO', '1235.MTK.0217', 4, NULL, '$2y$10$KwPEvY5VIGuDl1bSABg68exabk7STfJsuF0AI7S597su1DWqMPnle', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1018, 'WAHYU ADI SUSILO', '1589.MTK.0519', 4, NULL, '$2y$10$nh1DEySyXWY19cZvgGcNuuFYAaSsbBnuO5pdAgnZTkZrFMUVfTd5S', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1019, 'YUSYAK PAGIANTORO', '0179.MTK.0213', 3, NULL, '$2y$10$C8PeweCYOHxhXjfTnSh6Yuo1medLwVuP.EH3xXCddDGQ4eKko.u9O', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1020, 'SATRIO WICAKSONO SETIOADI', '0516.MTK.0815', 3, NULL, '$2y$10$A2WqdHFYMA4GXLguH125vum8ZbDDZ6F.t6X51P3Rh7XnQvJqetJJu', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1021, 'MUHAMMAD OKI FIRDAUS', '0531.MTK.0915', 2, NULL, '$2y$10$POUFGHR2/tw3uc7BG5WdFuM24QdYc.K5.7IpMNbjPbfW.yEh.UUw2', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1022, 'CHOIRUL ANHAR', '0572.MTK.1015', 4, NULL, '$2y$10$5htSlqUhpsI64CPCDrG.3uMwEjAnox.gAWUgTeg9ROs/SQn8pf0Jm', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1023, 'IZZA ALIYATUL MUNA', '0626.MTK.1215', 6, NULL, '$2y$10$v7qCcZRbRTjCbwixhZ/TEelti6WJInwa.mZnv8pATKFpCtAGyrFCi', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1024, 'DEVITA AYU NIARROSA', '0638.MTK.1215', 6, NULL, '$2y$10$DhuNpbtoMI9LiBu6JVC1R.4u.vn.DwiZtgcBepnacQlkEvpuzXEYG', 1, NULL, '2021-06-15 20:21:35', '2021-06-15 20:21:35'),
(1025, 'HENI SULISTIYAWATI', '1553.MTK.0219', 6, NULL, '$2y$10$/75dFY2QzgrybHcCascPcupqaPpzQ4ij8PHaTBsiy2DiqnLn7D4ve', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1026, 'ANSORI IHWANUDDIN', '1592.MTK.0419', 5, NULL, '$2y$10$rLR.PcZsWx0XbYlHnGW1uOriE92.t4Gcd/ANzbqkgHreAPtoRaFUi', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1027, 'WAHYU HIDAYAT', '0220.MTK.0713', 4, NULL, '$2y$10$IQyoZ0pBLFhDz/QonJSKO.p3oDjDsoDjPrWt7rkEQOY5rAHgKn2U.', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1028, 'ILHAM SAYEKTI', '0991.MTK.0716', 4, NULL, '$2y$10$OfPy2WkISE4fFwHAlAWudO55XWYXMA8LPPWBId9rhp88K14g0pmYS', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1029, 'MOCHAMMAD HARWIN FEBRIANTO', '1610.MTK.0519', 4, NULL, '$2y$10$TANxmN6CeXhcW/9v5cGmHe5F0rJ8zlZdbRFDCEmYE7W4yp5sAX1YS', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1030, 'NUUR HANIF ISMAIL', '0027.MTK.1109', 2, NULL, '$2y$10$bCEdBf1AwyuEns9GEHRuhewxoqOlzPHBHyW2B.ciX6RWLEJO8BlQO', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1031, 'MUHAMMAD AUFA', '0211.MTK.0513', 4, NULL, '$2y$10$AwsrUXudPtBYpmAIHGX8sugO1a7h4X.Wm.TN3kswaGye/4x4u2CtW', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1032, 'DEDEN SURYONO', '0342.MTK.0814', 5, NULL, '$2y$10$JHfItU/oJfMZIS44h8JPZeTJoHewUPvg/hY/mY5oo7xCoGhBZExGK', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1033, 'HANDIKA ADI CAHYA', '0512.MTK.0815', 3, NULL, '$2y$10$6/PBaeGRAPIE/KvEncubdO7/P4uGXfO0djvFnwwxJe6KNKmdySBrC', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1034, 'CRYSTALIA NIDIA KINANTI', '0612.MTK.1115', 6, NULL, '$2y$10$fx/ommj08zZwrCu35RkmGeFBvXVUQPbs6W1Rs0uyVP.RI366bOG3G', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1035, 'DWI PRASETYO MIRANDHI', '0617.MTK.1215', 3, NULL, '$2y$10$yMPtir/aQnL9gzaTKRlMHulkTtwzfr6UB.g1nyJsWD/4WiUaBX8c.', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1036, 'EKO WIJI MULYANTO', '1049.MTK.0816', 4, NULL, '$2y$10$c54u6vHJlVHLx3fVGNjol.85yr/lRQoj1V9A4nG2C0QTl3PDtIaxS', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1037, 'ANDRE PUTRA PRAKASA', '1424.MTK.0318', 7, NULL, '$2y$10$zmNJDoDal8ovs9H78vKcW.X7Bkz4KwfCpF9BsIITsktD4Fe85jrn6', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1038, 'AHMAD SUHADI', '1582.MTK.0419', 4, NULL, '$2y$10$dOyYCxnLvk9xM7FDTdil4OxzxGQ000tGxRx0JVt7FVMhddrnGPB4K', 1, NULL, '2021-06-15 20:21:36', '2021-06-15 20:21:36'),
(1039, 'ILLYAS SURYA WICAKSANA', '1587.MTK.0419', 6, NULL, '$2y$10$A0PciMycUlBYvyaCZR1F2utLwNJkHr1lSBB/tF0kZRzZOZPyc.mpW', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1040, 'SLAMET SETIONO', '1617.MTK.0519', 6, NULL, '$2y$10$5LffUi8bNqz/egMZ2NcnxuVBt0F2BV.kJgiAuN7DQKwIrRaV.lih2', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1041, 'YAYAN DARYANTO', '1245.MTK.0317', 4, NULL, '$2y$10$/OXolV4bAQsuP3nEn13TZOlGqQDzxmQn5y1420GYltBuT6HyWNsNK', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1042, 'RUDY YULIANTORO', '0412.MTK.0215', 2, NULL, '$2y$10$K82i.VeHGq6ontRz6uMg6eENeeVOMgnJh4Jtnum.hSytpUtBjOYkm', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1043, 'MUHAMMAD ARIF ABDULLAH', '0623.MTK.1215', 3, NULL, '$2y$10$mbm8bZ2ohNU.9hZPsdftOubD2vadwPrWofCqy2.NMfqeCfYQkI7J2', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1044, 'ABDUL KHALIM MUAMMAR', '1187.MTK.1116', 4, NULL, '$2y$10$XXOOpQa8uBs9nLZIbfGdJ.BIIjbD0kn5IeGGPDEdCTWlLeOgTL0CC', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1045, 'ESTU VIRGINIA ANGGRAENI', '1517.MTK.1118', 6, NULL, '$2y$10$0TsBA4v/KheK9QS2rCGusujCPHjF1b5.aF7fl0RMM6rI8.NvaHWzC', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1046, 'DAMAR NINDYO WIBOWO', '1680.MTK.0819', 6, NULL, '$2y$10$9rG3TZUt4pxXPlKPbFhozOUOo7SDSb8IFp1QsjkmTAJ9KrAZ3V4FW', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1047, 'MUHAMMAD KHOSI\'IN', '1725.MTK.0420', 4, NULL, '$2y$10$jxi2Xzv66VOHA.uO4Oeq2uT5sDZI.uWl5QflESlzbiETznp7l39D6', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1048, 'PUJO SULISTYO', '1733.MTK.0520', 4, NULL, '$2y$10$WZYFeCE.npuxRqySUbr2H.RsQttII28NDyH7/rAN8/RkRD84cxRtW', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1049, 'KHAIRUL ANAS', '1739.MTK.0620', 5, NULL, '$2y$10$0H1IODJUrhjjTRGfgUbODORkmj3OeyPdtl5sX.br7IcklKZAMW0US', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1050, 'ECHWAN PURWADI', '1591.MTK.0419', 6, NULL, '$2y$10$AhdALau7QBl2G1q8rZqgLunVchwK5fXSU5Qmv8YjIM30nTqI/oTL6', 1, NULL, '2021-06-15 20:21:37', '2021-06-15 20:21:37'),
(1051, 'GUNADI', '1244.MTK.0317', 7, NULL, '$2y$10$U4ySIQmOr.NYOtRebxmrWekY.eUlMoRLU/AatE24pFQtXdPQRwZuG', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1052, 'TRI BUDIARTO', '0530.MTK.0915', 2, NULL, '$2y$10$Psy3tAJ4la/XPlQjmvS8wOyYSsGNsFJjllrUc/mGdcHZN70csJsfy', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1053, 'DWI SABTO WICAKSONO', '0611.MTK.1115', 5, NULL, '$2y$10$mxCGSyQIfI0I7Vk7jFZ5TuH.Ztx2OYaqIiFHiZvyGhBX5wsSJ98rq', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1054, 'NOVIADI SETYO UNTORO', '0808.MTK.0316', 4, NULL, '$2y$10$g7FD5EuCWnyE2LtF3MqiB.FLK2CUj.JbZ3hwDR2nsBbsZHhNFvMQq', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1055, 'MOHAMAD GUFRON', '0819.MTK.0316', 4, NULL, '$2y$10$9ZJafSYaqPAS9.H7WzsJ5e8GgTSFni4ygHVnzfFGhu2yLhJ6Wjezi', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1056, 'RIDWAN NUR HANIF FEBRIANTO', '0912.MTK.0516', 6, NULL, '$2y$10$PWYkn1kyHAvVgw6/WQBg7OgG72j1vY9Ox8QXn7m/FxPPvwuTDwoKu', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1057, 'INTAN PERMATA SARI', '1549.MTK.0219', 6, NULL, '$2y$10$isHYtegVXkxbSKANJDIuN.v7t9tAWWdnwS.LH3Rwvx/bijg1CF7hm', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1058, 'AGUS BUDI HARSOYO', '1580.MTK.0419', 7, NULL, '$2y$10$sacnJjX2sPUMYCXRLLrTOepizPwVZnkOzsqA168em29bnULpXgewi', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1059, 'FANDHI RACHMAT SAPUTRA', '0206.MTK.0513', 4, NULL, '$2y$10$HykwF3crOuTDfQTFOahG7e0tW0YVf6ecEXwqChJYrg/eFSy1buzsi', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1060, 'MUKHOY YAROTUL JANNAH', '1748.MTK.0720', 6, NULL, '$2y$10$zFl77/215BLU.o0vFE5RpegSf3vu7//pitHlrU0E.gH3GSPHYN3dy', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1061, 'RUSIYONO', '0152.MTK.1112', 2, NULL, '$2y$10$KGHpTYSjtrzRbu9dJs9NSu.YPPxWLlpH67qNr4xPvjwIu7Zy0k9r6', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38');
INSERT INTO `users` (`id`, `name`, `nik`, `division_id`, `user_verified_at`, `password`, `status_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1062, 'IKA DIAN LESTARI', '0529.MTK.0915', 6, NULL, '$2y$10$lS7IIt3vi4Px9yzuu4vhfOfR097T/jWTihC5BRsCPu.ApoICqdC9q', 1, NULL, '2021-06-15 20:21:38', '2021-06-15 20:21:38'),
(1063, 'HENDRA IRAWAN', '0554.MTK.0915', 6, NULL, '$2y$10$./EsS02dtvGks73HYU6MF.eXS9Jue6rdH89g.Q.e94txb0Wl.0tdy', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1064, 'YULIAN CANDRA SETIANTO', '0790.MTK.0316', 3, NULL, '$2y$10$T4VccZW0udVdFNZrjPSIu.KfkcBaxjaTcg4FDPrcA7sfQ.xmK69wq', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1065, 'HARIYANTO', '0906.MTK.0116', 4, NULL, '$2y$10$YhWjhgd5h/jmn/6PH8Wc4OIyh/iKOzsazCVRcCsSyu9qQzDrsmJTC', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1066, 'HENDY FITRI FEBRIAN', '1220.MTK.0117', 4, NULL, '$2y$10$jjRjqtQMjF/alcPdTMlMgOoOXy3F7wGveTBl.etNYRZ/RFP6Hc6.2', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1067, 'PRISTY WULANDARI', '1251.MTK.0417', 6, NULL, '$2y$10$37x.GS3ivJEERbLOdX7RWerGBmy3ZF/1/80IapTvyokpFqHVNuejy', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1068, 'NUR FUAD HASAN', '1618.MTK.0519', 4, NULL, '$2y$10$FQ3dMqQf/L7gDrNQB3m3f.DhubGz.5cnURlNtwqm.LvCZH8uYljPq', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1069, 'BASOR PAJAR SETIAWAN', '0331.MTK.0314', 5, NULL, '$2y$10$sGC5JIiC5hjyVCEbaxKIpugvCsEeQ0WgpTgfLYnxdrrcNvTJVtIyy', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1070, 'NUROCHIM', '0029.MTK.1209', 2, NULL, '$2y$10$f7etXYHLKdQiRmlFiDtsy.gJUQM7nwRh9YAtS61DR3hQN8lp03l1S', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1071, 'WAHYU APRILIYANTO', '0068.MTK.1011', 6, NULL, '$2y$10$xtHkIZLXgwcAMhp0VsHvjOg7mhB2pMV9kYLhTMpXbIZ9btTYWkXJ.', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1072, 'MUHAMMAD SHIDQI ARIS MUNANDAR', '0255.MTK.0913', 3, NULL, '$2y$10$IEpvsMMS/1U2am/hA2RbKuySU.STmJgQoYJcbVt2fxf4tHhHpZ9Hy', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1073, 'ANCE NERVIN', '0283.MTK.1013', 6, NULL, '$2y$10$wbKlsOPrANAURHndTTzyjeFAnhlL2FVuHZqsd3SyqM1Rv4dQ6Mxe6', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1074, 'AGUS PURNOMO', '0137.MTK.1012', 2, NULL, '$2y$10$mm7.2PUMOfNw1D3kfihjQeg1BYVT3aaI/MuvjKiI3R3Q3xsmkD/2W', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1075, 'RIZKADIATRI ALDILA', '0035.MTK.0110', 6, NULL, '$2y$10$qHLjuWJWNxRO97B0TOGYy.mpi1hTHFn5lVuHnwwcjsp8zuNFdYYUy', 1, NULL, '2021-06-15 20:21:39', '2021-06-15 20:21:39'),
(1076, 'ACHMAD SYIHABUDIN ABDUR ROHMAN', '0045.MTK.0211', 2, NULL, '$2y$10$0XVxSdJBYueLvQtOKb4AL.t/2uUIrv9rEkGWP6KYa86fgQi7cPSXy', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1077, 'MARIA FAUZUL MUNA', '0064.MTK.1011', 5, NULL, '$2y$10$qGzuzItpeIW0bivujJz.vuLxPaMfgtEzeSHyWsCld3w88uMCupmyu', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1078, 'M SYAIFUDIN', '0203.MTK.0413', 3, NULL, '$2y$10$GDlO23Qc.YcA1cqTWVjOxejQELtLAlrBdyVABHyLDNxS9n0JOuMXy', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1079, 'HERTUSI DWIRAHAYU', '0210.MTK.0513', 6, NULL, '$2y$10$2uX5kcW/wLfJUlP6oG/DNO6.lhsNRBg5eVJjBNStLTx0Rsbtdy0Fi', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1080, 'MUHAMMAT SUPRIYADI', '0276.MTK.1013', 4, NULL, '$2y$10$AZ4koZa93ri.wG94XUiPdeFb7.YTH4aQ2.KnRLinkSlW2Nd/kfNwi', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1081, 'SEPTIAN ADI NUGROHO', '0587.MTK.1115', 3, NULL, '$2y$10$eI5ByGkd7V00jisenjy/ze4S7FkWWEH/rCx4Rd0bIlYrQ1xHAXUNm', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1082, 'ADI PRATOMO', '0765.MTK.0216', 4, NULL, '$2y$10$I/xCbJPuFipHnLtqOBPvmejBd8Oe2oVW2p4AoZbRlV1vvtlzqY7s6', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1083, 'RAISA LATHIFAH NAJMINA', '0869.MTK.0116', 6, NULL, '$2y$10$X9Lf5rCNHTAipl0RTvl.SO09IYpZK8A/yH3TW1.AJGhy0ET04Kl52', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1084, 'ALI MU\'RIDLIN', '1101.MTK.1016', 7, NULL, '$2y$10$oTB8dx1WlgS27LelPQ5WEuvlYbMY4DFl39MVx7hRT9Pc2AU/P0TMK', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1085, 'AGUS AFWANTONO', '1200.MTK.1216', 4, NULL, '$2y$10$axVMMj9Jmf.i1WYvOlBKEeCN7vdCpSEsoU89MxrEqKxSgnz/UqGOm', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1086, 'DWI AGUS SUSANTO', '0581.MTK.1115', 4, NULL, '$2y$10$gz9WTPahP0mKbK68o.ESdOyBfhejRStxAWzrqdmxSMyGxVdMl25UK', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1087, 'SUHADI', '0006.MTK.0309', 2, NULL, '$2y$10$SqfDv6f0KEet9BfIB1hOU.oQJtI.5CA7ETzwxe/DJsDF6b4UnCa0.', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1088, 'RITA WULANDARI', '0113.MTK.0512', 6, NULL, '$2y$10$W7OVpA2eTgN0kIG8aaCxy.h9R1A2SCzV.Amj8Wr1gFS8.lpZ9mt8e', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1089, 'TRI SUAJI WALUYO', '0289.MTK.1013', 3, NULL, '$2y$10$64i.qROb6gEhidr1SrJdpelfJaQeCBK8yH2NDX5fmlj5eLUHuNVtS', 1, NULL, '2021-06-15 20:21:40', '2021-06-15 20:21:40'),
(1090, 'ZAKIAH HANUM', '0308.MTK.1113', 5, NULL, '$2y$10$lzNhX6E26lkyX95PTYLaSOu4ZCGxnQ.vGRdMr7kQF5KeC3skZ6lW.', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1091, 'MU\'ALIM', '0351.MTK.0914', 4, NULL, '$2y$10$SmgfZUjbxL6JEUyBclSGEexVO/P2GoKgjzaP/TkcPTIVVp6aYOzV2', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1092, 'TASRIFIN ZAENAL ABIDIN', '0365.MTK.1014', 4, NULL, '$2y$10$ZPaH6CUkgJT8So8rcn8HVe36.Ckzf/But3xfnl6ODTE1lYb1vmRkO', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1093, 'ARYANANDA EGA PRUDHITA', '0372.MTK.1014', 3, NULL, '$2y$10$Ed/6hHyP3uuPb3xw8bxuGuqcpTI2NGaUzfPu36SnyilVR2N5jWeMq', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1094, 'AGUS PURWO WANTORO', '0862.MTK.0416', 7, NULL, '$2y$10$OMll5YEt5gwSRuYBHjCt1.2PJSBeTYcsRuivXalj0LnGQ3Jqxrm8e', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1095, 'DIAH RAHMA SURYANI', '1004.MTK.0816', 6, NULL, '$2y$10$0vpLrl5gpCo656RcLfeHxeYn9C7tGW8fBZ1yGk2OI.6u/crMM7LSe', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1096, 'AHMAD MAULANA KHOIRUDIN', '1097.MTK.1016', 4, NULL, '$2y$10$L8YJ9wyiH7XZxRzf8pSvguI6rxgpkVDyAsXUCyY9Vzfj6/lPT4rfK', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1097, 'FATKHAN', '1180.MTK.1116', 4, NULL, '$2y$10$1d24hOQEisJopttxlVoFvOCloyB4E1u42NFEvY.rNylKiivV7/zD2', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1098, 'FEBY NILASARI', '1354.MTK.1217', 6, NULL, '$2y$10$S9Qz6t7mKQWS3jL09OqYlOGgdiCUaP3ml2V1N6D1N10HIC5eRZ2iG', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1099, 'MUHAMMAD BAHRUL ULUM', '0809.MTK.0316', 3, NULL, '$2y$10$PrSNenHM5qhk5mM7sPuFGOEIR4igvsgvV.nFZqFki8ipHHwZDSd/q', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1100, 'WIDIANTI EKA MINARNI', '0294.MTK.1113', 6, NULL, '$2y$10$9pw1TQ7eklMy69jHWHNxXODVjUnJUmU5J5nfaHKQ3LI9TGLLsz0dy', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1101, 'KUSNANDAR', '0041.MTK.1110', 2, NULL, '$2y$10$z2clcK5MjZ3ealcl3Xoonup8pyy0ZyWXkLPsqYPMOFI4tGzsgaSPu', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1102, 'HAPSARI WITANTRI', '0306.MTK.1113', 6, NULL, '$2y$10$di2qKY9azSLojuSblFNGoO7/.2rgUfibQ62BhDBMLNoiItIRYf8KK', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1103, 'MUHAMMAD YUSUF SETIAWAN', '0320.MTK.0114', 3, NULL, '$2y$10$GtacrmQMRUzqI1UxRNils.PoqSeMBtgjfj3H46fztqJ44or1fTp.u', 1, NULL, '2021-06-15 20:21:41', '2021-06-15 20:21:41'),
(1104, 'NUR CAHYANI FEBRIYANTI', '0958.MTK.0915', 6, NULL, '$2y$10$YVsUcsAKBeEOT2qqD8PAX.Uq8LhVPSn7Byn1sloHYuFNfdQckHOq.', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1105, 'AKBAR REKSA BACHTIAR', '0963.MTK.1115', 4, NULL, '$2y$10$5wJ.rioClZuUuZ3n2PRM8e6v3ceXXbF9mpQhmWN54zIj0BFHzHDwu', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1106, 'JOKO BIMA SHAKTI', '0981.MTK.0616', 7, NULL, '$2y$10$LglSmQ0s/LQbKBU0HPkGbOFTyQDty13iLMrogZfTQWJUu0oEvxg9u', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1107, 'MUJIYANTO', '1169.MTK.1116', 4, NULL, '$2y$10$y1bi9qOoJxW.fAqhaALzzuCu6PvHrluHzAUAZ/af0bCmFdWuyp/GS', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1108, 'TRI ENDAH FITRIANASARI', '0245.MTK.0913', 6, NULL, '$2y$10$XJNr7Y2HUytHgX59VNyVWO4wgAkCU8GikfzyeKQ2Ti09d0g8UmDD2', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1109, 'WARDIONO', '0304.MTK.1113', 2, NULL, '$2y$10$pE/Z.FwQN5mDjUX53N52nu/Uvez36CMKXS3v1jplerA6E/F0C./N.', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1110, 'PRIMASTA ADI PERMANA', '0586.MTK.1115', 3, NULL, '$2y$10$Dr0iJFVLylQ5OVo6yrBQ3ONSUOI/0eu8t3TqYEDEepUUMr8Unu8rq', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1111, 'KARDIKA', '0854.MTK.0416', 7, NULL, '$2y$10$RGPcVNon5VY96aWZv5EqR.Qr2POrqa2CCgi3xAvQ5aOMSAVyQBZa2', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1112, 'YENI ARDIANTI', '0867.MTK.0416', 5, NULL, '$2y$10$Raig8Xkw3cuJFt5mx7W8HOYME/GELhfgdJLm.wBizgAI/cQbcA45y', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1113, 'DEWI ARIYANTI', '1124.MTK.1016', 6, NULL, '$2y$10$LacO26oFAoo/YguGqJYXdOFJAtnKQnmLkrR1WwsmbZ9lC1ObiQY7e', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1114, 'VIMA MEISYA FRISTIKASARI', '1350.MTK.1217', 6, NULL, '$2y$10$DK/YbPRQti50IxovtW8zH.9rhsK/RQK4LTMsTzjivBv/M0J9QrgKO', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1115, 'ROFIQ UDIN', '0357.MTK.0914', 3, NULL, '$2y$10$0XNQFDjcvJnwLWjVLsmihegsxGH5YbaR/wUspZpHfz01A4DkT2RQG', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1116, 'SANOFI', '0514.MTK.0815', 4, NULL, '$2y$10$39fQpwWjUwHYF/8iCuTJyOXPh0G0357D.oiLsiCdwHrYGzeIHraWG', 1, NULL, '2021-06-15 20:21:42', '2021-06-15 20:21:42'),
(1117, 'EVA PRIYANTO', '1168.MTK.1116', 4, NULL, '$2y$10$98XT94amDIphmy/iVXv6uuzu.bBH3/cc1qRNmEcRcQQoo7Q57MkhS', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1118, 'AGUNG PRASTIYO UTOMO', '1542.MTK.0219', 4, NULL, '$2y$10$mDTJAUo0aJMxGaRLdLWRkuJWcFs/t5tcCKpZtRhp0AXmuPwNcn/dy', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1119, 'KASMANI', '1129.MTK.1016', 4, NULL, '$2y$10$Yl7MncALS.qYf/jCtwT3VeTlZqPl93AypG5WNTugS/d0gENWTEA1i', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1120, 'HENI NURASIH', '0311.MTK.1213', 5, NULL, '$2y$10$lmxm4fDFdf8.3FeiCZtM1uNXvgMlNtmF0wyymJlSUoWP28NGjJmK.', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1121, 'TEDUH SUGARNADI', '1128.MTK.1016', 4, NULL, '$2y$10$3hz9xYzrx2vOHpv3Yn4DGe.tPBpeHyaus7fjuJwvK1tE1mgqT1noy', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1122, 'EDI SUSANTO', '0312.MTK.1213', 3, NULL, '$2y$10$Brr55W5vcNwKdd8zIhuN8.V/qq0unM46crcoqnk3uWs9I3AzHaixS', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1123, 'SITI BUDY FATONAH', '0111.MTK.0412', 6, NULL, '$2y$10$0pN.Yqx8F2FfzUUR0Tx7Te8GxjLWdu6oePWjFOek8dY.L6tLZe9eG', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1124, 'SUWAJI', '0124.MTK.0912', 2, NULL, '$2y$10$92jLbHnMTxCVP8Ji0w4mmOsj6qyFHqYhnMFfOxc/enUZWnV1/Xl4i', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1125, 'WAHYUNI DWI PERMATASARI', '1120.MTK.1016', 6, NULL, '$2y$10$bV6eNgKYtmD/iNWsFPaDHOl.fXk/q53EcZzOkM/gY0EvdLXSG98by', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1126, 'AMIR BACHTIAR', '0747.MTK.0216', 4, NULL, '$2y$10$Sj9GwbbEQNKTJHtCFN0biePbkcpY9.ckEIxcN105.0kDgpINXYi4i', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1127, 'ALFIAN DWI CAHYONO', '1098.MTK.1016', 4, NULL, '$2y$10$/SKvaVtUTMbBhobNET476uFbO/UJCHt4TqTcVp6P0/ZA6fEB3Kl6q', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1128, 'TRI SITI UNTARI', '0887.MTK.0116', 6, NULL, '$2y$10$BTVvyuCE8uUFjFXlHwP.heGzqFClUemtCffJDf3vY5bnLpFDr1nn6', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1129, 'HERAWAN ADITYO', '0582.MTK.1115', 3, NULL, '$2y$10$yDppt4pAUW4T37YSBGk1Ee4bpCBqpssXj.kdUhw6PWePP9Bgua5Z2', 1, NULL, '2021-06-15 20:21:43', '2021-06-15 20:21:43'),
(1130, 'MUGIYONO', '0458.MTK.0715', 7, NULL, '$2y$10$C9KiPDjbK/6tH65FaHsV3uqFt3NnVcTK/Td0P.cinZpWIPSsEf19i', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1131, 'YUHAN', '0577.MTK.1015', 4, NULL, '$2y$10$c45/wq6ynniTtBEWhy1BA.x7qeraqrNUkwdEZK9F/sOBgeU0zphT6', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1132, 'NUGROHO KHOIRUL ANAM', '0959.MTK.1015', 2, NULL, '$2y$10$48ghAny8k4wdam0mJjJoSed9LTAszjAa/y9jowf7tyS5iNW3JDNQi', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1133, 'DIAN ANDARI AINNUN', '1088.MTK.0916', 6, NULL, '$2y$10$/Loo8nj5UUTDSgBjMvgaxO.N34ShCdGfBwRBHOb.IHDNBRkIajXRi', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1134, 'ROCHMAN ISNAINI', '1430.MTK.0318', 4, NULL, '$2y$10$wp5ifiu//NJJcBiadBe9Q.UAQYE/xfamagKzUD0IJb0oUYz2.8kr.', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1135, 'SURONO', '0002.MTK.0109', 2, NULL, '$2y$10$AnOeUge//n4pUmkcL5221eQr7iiCVOYKcF1dwhP4MhArDxP/qI3qi', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1136, 'SRI SULISTIYAWATI', '0188.MTK.0313', 5, NULL, '$2y$10$6sJcJarv9bBEihAmrTjhfuNDOhF/3ZW3cHHZL10RnXeXU7bbIigbC', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1137, 'ARI WIDIYANTO', '0422.MTK.0215', 6, NULL, '$2y$10$ktIkiAkfBEN72aSs/On9RueKaz7.Fe56pwWlIkdme21HYXaaVenja', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1138, 'ROHMAD AHMADI', '0863.MTK.0416', 2, NULL, '$2y$10$kolB4WHRCcR66OvBL9.jBOPHta.GYBRjHvwGHKScwCLWihFZwnh7y', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1139, 'RENDRA KURNIAWAN', '1450.MTK.0418', 6, NULL, '$2y$10$Z/VFkonzSd9HVGGNGnpd.uDnK/pxIOu.NeGST/48pr39x1x6bEkoC', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1140, 'TRI SANTI MARSELLY', '0143.MTK.1012', 6, NULL, '$2y$10$/AzMYoHq.yLFKJPg1ojeIOL3nYHifPsxINsYyKcyYbvx3wDEKSyYW', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1141, 'ANSOR SAPUTRO HIRLAMBANG', '0158.MTK.0113', 2, NULL, '$2y$10$0wFHgrSWHX50rqyPwIgEYOLkAtOBhfyvJVozcftFf6teQMclLIFAq', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1142, 'AGUNG NUGROHO', '0235.MTK.0813', 6, NULL, '$2y$10$gkcAIQmhcxWWpH9ra0CJueaQS5LHIAa/XvEAhyKhMw4yw0BfL8HsO', 1, NULL, '2021-06-15 20:21:44', '2021-06-15 20:21:44'),
(1143, 'INDRIANA YUNIASTUTI', '0277.MTK.1013', 6, NULL, '$2y$10$ywiCLNG8ykL9LvyU2NN.guY3kafOUe.WMeNAXMH6eUKoce7qiVNyy', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1144, 'BUDI AGUS PRASETYO', '0408.MTK.0215', 7, NULL, '$2y$10$ReAjob0rrCgqpiucn76bBuIIw6PxC0GwCeConkiJ2G4sshSSylvn6', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1145, 'APRIYANTO NUR ARIFIN', '0983.MTK.0616', 7, NULL, '$2y$10$8n2jf68rfbPMYQ9ePtC/c.dHoRS2wzXtmFtvk8fOinKUY1HwO5GFO', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1146, 'PANDI', '1371.MTK.0118', 5, NULL, '$2y$10$ap79pwg/qaKSgApVmAfzzeQ3mmG1gt/F7qYFzsyvMc3q6kuGOKrO2', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1147, 'ROKHIM KUSTIYANTO', '0208.MTK.0513', 3, NULL, '$2y$10$bI/hZRqDkmyG1j7Mu3Hub.e663CG4UEDjxXx6.9m9BMR5HnFZiKSK', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1148, 'MUHAMMAD MARZUKI', '0443.MTK.0415', 4, NULL, '$2y$10$LI3UWKO2qxYCJwQxJxbezeJLHL7qEpi2yz3Ckv9qfqtu4ifrJeOdu', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1149, 'SUTARWO', '0821.MTK.0316', 4, NULL, '$2y$10$6E30Rt9NpVQkXZCCyJEg2.oAZieCISn89.K9kgIiYJ.YsVinf.dqK', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1150, 'MUFTI SATMATA GIRI', '0844.MTK.0416', 4, NULL, '$2y$10$eZ9LoglXtMQqVSpA3XCC7OcNjjSFbBhjzDtFWy3N.XS5DP.PW69.i', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1151, 'ANDI NOVIANTO', '0974.MTK.0616', 4, NULL, '$2y$10$sHqithSvD4iJpbuxA.pKNOFnupF0LiWEjqF45B62UE0bpPvyNJ/h.', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1152, 'FIRMANDA', '1074.MTK.0916', 4, NULL, '$2y$10$pcMdghLgZzleNNoVx7i3guouiV9kvrO3s0TTBmYyVmqphobKdd.92', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1153, 'HERNAWAN WICAKSONO', '1660.MTK.0819', 4, NULL, '$2y$10$7Vsu57v8t8.L6.5kmr/K2u/.rymtcC8lV.SXXOseMm9nA/g.Bv73.', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1154, 'KIRYANTO', '1616.MTK.0519', 3, NULL, '$2y$10$ovSxuRRi.1ovWME8DXbpiuI0qUkR1kY74k3yIfgEFJVaU2sb8PUNW', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1155, 'MH. ARIEF WIBAWA', '0157.MTK.0113', 2, NULL, '$2y$10$fnOlb2asvGGjDQO5DkQNpO07Q77mzD.YQSv.Fdk9NEuF6y.wI.tJ6', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1156, 'PRIYANTO', '0212.MTK.0513', 3, NULL, '$2y$10$8t3qM6z0kg9wJMYnzlDKcez6rp1YA3832cCrZZx0/lJjG/7LmHIx.', 1, NULL, '2021-06-15 20:21:45', '2021-06-15 20:21:45'),
(1157, 'SUGENG ARIYANTO', '0424.MTK.0215', 7, NULL, '$2y$10$Mxx90xHTUnHbl9TvngukBO6dclwL1TVGS6JnoHpoJZDaXF9bxmamy', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1158, 'CAHYA ADI SETIYAWAN', '0761.MTK.0216', 4, NULL, '$2y$10$An9yq7R20RC9KQlz8YTl4uTnEVhIXqR/y8TB/v1am9nsyXk9EHAGu', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1159, 'NUR HIDAYATI', '0788.MTK.0316', 6, NULL, '$2y$10$OPc8tKeE8/S8ufaGl9lRx.bd.SzRGLfwcU2VorPOHc0dvnMuE3FH2', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1160, 'ARDHI TUNGGAL MARTOPO', '0904.MTK.0116', 4, NULL, '$2y$10$6X.yG86eAJUwZ3xPt4kjRO/7rsjlwUP7Ru/zJ3i/hDbGqnszjPJk6', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1161, 'MIFTA DEWI MAGHFIROH', '1611.MTK.0519', 6, NULL, '$2y$10$lJdESMyQGSVuCle.pYfLBOtQRhFQmqY0rr.Wo8xHahghYC4fPc42S', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1162, 'FATAKHUL HUDA', '1692.MTK.0819', 5, NULL, '$2y$10$caIhWYzn4mnEztcgX6gbp.q1OJ1z15SuXCpSnrYvhsvwXGPmy6K.u', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1163, 'ABIT BUDI UTOMO', '1377.MTK.0118', 4, NULL, '$2y$10$/MpSoB7I.QnVGKcC7vnBQ.sUrmvdXACi/wWyHKhoHKWRSYGiuAuvC', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1164, 'BAKTIAR BUDI WIBOWO', '0878.MTK.0116', 3, NULL, '$2y$10$PmeHP7Z88C1KEKjfgZQq5O3oI.xcv5VXBk2afU9rlasPJgcjCZnvS', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1165, 'WENING SATITI GUNTARI', '1238.MTK.0217', 6, NULL, '$2y$10$OaY50PCmD9hVI2j7CrtypeWRnkjeK5S3893Z1sd6aKgOvpV8p/A76', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1166, 'BERNADUS KRISTIAWAN', '0407.MTK.0215', 4, NULL, '$2y$10$U/bQYDJr1KzQ3fRSOToOd.Ef85Gp8v3cvuSx/gRP7Fldl0Sm18uUG', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1167, 'SUNARDI', '0556.MTK.0915', 2, NULL, '$2y$10$rcGO2V/LrdOlBf.8Eq0EhuJhmBNK6cQTSy6GY6dFM0Qj7mEX7sBY2', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1168, 'EDY YUSUP CAHYONO', '0760.MTK.0216', 4, NULL, '$2y$10$szrtERiSgJ1sTcAyirEgquPzrFqGpdUxoI9sURmU.c/HshDlLoYnm', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1169, 'ARGA CAHYA OKSATIANTO', '0851.MTK.0416', 7, NULL, '$2y$10$JN15sBN/CVgeeBDt4pL9O.72UUjgHITAtwZ7K6dAZbThGL1IVME1C', 1, NULL, '2021-06-15 20:21:46', '2021-06-15 20:21:46'),
(1170, 'AGUS BUDIAWAN', '0934.MTK.0116', 4, NULL, '$2y$10$pyQjKUtW7bDOMYaIB8PuuOgKTlrI/a4AdfpLu.yeJar0lMeJnO8Xa', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1171, 'WIWIN ISTIQOMAH', '1246.MTK.0317', 6, NULL, '$2y$10$s/zGxAhlo5iVLjCLV7jTouFoLdcusPe/BVc/8/97btMZjZv0w/dGy', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1172, 'DIAN PRABOWO', '1325.MTK.1017', 4, NULL, '$2y$10$VeNOzB.Grop4GnvxdGjfButkS36kPCarFNCiO91fjz/fVO5y3JuHm', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1173, 'GATOT RIYANTO', '0133.MTK.1012', 4, NULL, '$2y$10$MCrQu5kuVPzvU69x5Ti9guTCa9rITY13WzzldHbpDY8JnaNXnZdHS', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1174, 'GHIFFRI LAKSANA JAYA', '0850.MTK.0416', 3, NULL, '$2y$10$l/Q6aG.PcCdrlBgmU.t0beDmdaRcG6rkSobZM8wOIGq/e.03gdAzG', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1175, 'SUYANI', '1634.MTK.0519', 5, NULL, '$2y$10$y0ac8aQ/CBUsCHgZ/Vd0bOKcpVYUd8BeYgdDWCY4INP3w5G8krYqS', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1176, 'EKO PRASETIYA', '0186.MTK.0313', 2, NULL, '$2y$10$U94ig61SD9byvGo6tMS7HuokEZ39F492FQ0eelSb1Ka4HD4mEJcTK', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1177, 'WAHYU NURMALASARI', '0326.MTK.0214', 5, NULL, '$2y$10$RV8JmZI26IQioYE.y7t52u2lZ1tnlj2ZI6Tv45EjkY9aedrHpgt0y', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1178, 'NOVITASARI ANGGARAWATI', '0469.MTK.0715', 6, NULL, '$2y$10$IXUFKASeeyC9Und71bOPR.xeFtDQoZKRGL57rmcwF9td7B1aCYIOq', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1179, 'SARJONO', '0482.MTK.0815', 4, NULL, '$2y$10$y.7HiQIM5Rxh8TuiBY3FVuwqiyLLLSSiqFsD/Qfegdd3deNyjw3BC', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1180, 'MUHAMMAD ABDULLAH FATTAH ALKARIM', '0601.MTK.1115', 4, NULL, '$2y$10$W.BXqqxr2lGa/Qll8ZUucOxm7xvCGFEq9nfhv35FEl2FpM4uThcaO', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1181, 'SUMARNO', '1604.MTK.0519', 4, NULL, '$2y$10$2.KXPA7NgyhxN1zZdJmQOO2jMooEs9b0tzEgJbboIQonl20v5fmTK', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1182, 'SUCI ANNA\'FI', '1637.MTK.0519', 6, NULL, '$2y$10$e4VxPanMLW0R0MgUKp0wUuxW0ygZxOeb7qygGEYOv5Ce1ePAuDaOm', 1, NULL, '2021-06-15 20:21:47', '2021-06-15 20:21:47'),
(1183, 'EVI OKTAFIANA', '1639.MTK.0519', 6, NULL, '$2y$10$TlejziIppeqJjZFK9lnjz.AWdVYZP26OTBZD4.Kxp2cB73KqxQ7ye', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1184, 'AKHMAD AMINUDIN ADKHA', '0524.MTK.0915', 7, NULL, '$2y$10$0M7jaHVKcctrKcjeJG1uguQsINXjci4PqpPXPUvZK6aWqlZv.CxXG', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1185, 'ANDRI ADITAMA', '0894.MTK.0116', 4, NULL, '$2y$10$ySsZWFE74/RDp2XaA9z9xeyw/N08TNBY3keL50CbEDxCXmb5DsfEO', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1186, 'AKBAR BISANTO', '1594.MTK.0519', 3, NULL, '$2y$10$unx81vFH6VMSae9qwo5yuuK8uVFJFa/mgRSC0qpZAT1w43ZYJW2Fa', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1187, 'HARTO', '0185.MTK.0313', 2, NULL, '$2y$10$LtLfuXHD6/kEteIuFTxorOCAKC2MzkOdUswTEWsNmr1Gsa9xeUQSS', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1188, 'DADANG KURNIA', '0500.MTK.0815', 4, NULL, '$2y$10$Pnqg6Jl4LgcI94vHpkQF4uRkISIB/.43i9Mu8giTiQJGonOmJljrS', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1189, 'CATUR RAHMADI SUTOMO', '0621.MTK.1215', 3, NULL, '$2y$10$zUvqq.5yHVR3X/xufTjCV.rByx8J8eYIRlFimPNPqdcls9cwSxYci', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1190, 'DOADAN SYAHRIL SIDIK', '1378.MTK.0118', 4, NULL, '$2y$10$5bNTENZzknsITCccFl3v4O2DqgeJMD.OZGrfnGzbEqO/vM7dK89Pq', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1191, 'ZHULIH WINDU BERLIANI', '1690.MTK.0819', 6, NULL, '$2y$10$nakUdyPdXXNt8B5xQV8ST.b41rrUu6wSdkfTA/T6HVWdIakugIXvy', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1192, 'SRI MARYANI', '1691.MTK.0819', 6, NULL, '$2y$10$oOqrMab8xMLEfbj4exHCRu137ELbz2IKvIur8N03fsABF/RfrT3Uq', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1193, 'YUNARDI PUTRA RIYADI', '1708.MTK.0220', 5, NULL, '$2y$10$9XwRkzgK4HE5FD9RvgPsLO8/oVydWtF68fKkIIe6KXCwZSADSV32.', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1194, 'NANA SOLIHIN', '0427.MTK.0315', 7, NULL, '$2y$10$.EA5B0DKf65PcnhXV2UameGFdvTUZNTXiANtInjR7lDQrPaK2crPO', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1195, 'FADEL HAMDAN HABIBI', '1771.MTK.0421', 4, NULL, '$2y$10$7fiOprpUK86WBfPrhWrhDeUe3ev.WJW3QyE7.Ss4RgJZbnAG7wAuq', 1, NULL, '2021-06-15 20:21:48', '2021-06-15 20:21:48'),
(1196, 'ANANG RIFAI', '0402.MTK.0115', 5, NULL, '$2y$10$LfshbaNQCHv2ZJxJmVC8uevdp0nXJnDhziFsy3g9OJQuhI/gGkwMO', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1197, 'RIAN MEIYOGA', '0823.MTK.0316', 4, NULL, '$2y$10$Fn5I7hul3Tzo2kw7MIk.f.bnJzycYrVTvtzG3G5tXqFirwo6i.HlO', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1198, 'MUHAMMAD AFIFUDIN', '0264.MTK.0913', 2, NULL, '$2y$10$b93Z5KlxGYogsIVMclOEyeKs1/eQVEMAKn4pniVZzKixMRazi0sCi', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1199, 'WAHYU SUSKAPINANTO', '0381.MTK.1114', 6, NULL, '$2y$10$HJuVsSQPl2.T2254MYuiwOsIRctuUl.Zj6a.eNm3eY2Q1bRqG0yd2', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1200, 'ALEX YULIYANTO', '0423.MTK.0215', 4, NULL, '$2y$10$l4qtcgyCaUeAwteMXI9pMeZwR6p9ND/uuRm1ggwFWyb4WZsjAgsEG', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1201, 'NUR APNI MUBAROK', '0579.MTK.1115', 3, NULL, '$2y$10$aC3xx53.7uIhYM/Sux3EGeWqHZBvJUE/CZM.7I1hmQ0e7j1ov5vfC', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1202, 'AKHSAN TRIYONO', '0886.MTK.0116', 4, NULL, '$2y$10$qFC60DLw3Yd4ipGR54umnuPkowApKLO/UXSBNarybpL/Ka3JE3WZq', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1203, 'ABDUL AZIIS', '1017.MTK.0816', 7, NULL, '$2y$10$xhfKDdfQS62yz/oNsp86fev1a2.ZxO.gkPXZEjpoT1UJmZZMDFpFS', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1204, 'DANANG WAHYUDI', '0014.MTK.0509', 2, NULL, '$2y$10$hyjVm4Hj0qtd0eGekwRgkOJ1373P2jL86ecrli5LBuE4K6.HO3wmm', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1205, 'DINA APRIYANI', '0130.MTK.0912', 6, NULL, '$2y$10$yRsSy8.zXKbqGPJSKn0uUuvXcZeAtrIo4wXid9CqAt1lv.U6nYgmW', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1206, 'MUHAMAD IRVAN', '0404.MTK.0115', 5, NULL, '$2y$10$2e0JepP56E0.3lSS/V9rtOdSRbfosZPJe/ELgU4wwQcYmYUyhioFC', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1207, 'NAFI\' AZKIYA', '0557.MTK.0915', 6, NULL, '$2y$10$bYrDRDeZNnnoiwu/7ABDC.m5Tmgha.ty325UxdMBDGGraNYTuHFw2', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1208, 'RINANTO', '0413.MTK.0215', 5, NULL, '$2y$10$YQkwztebjug63T/rE4BireaWv/NTapP3neWmOz7xU.VCzpcuw4E1O', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1209, 'ERLITA WINDA LESTARI', '1286.MTK.0717', 5, NULL, '$2y$10$/GRiy0PhUwWPGlZGr9Kzi.erOl0AkHH5VWf0XTm2JDRnKHmTbLNyO', 1, NULL, '2021-06-15 20:21:49', '2021-06-15 20:21:49'),
(1210, 'BURUUJ NUR KHOMSYAH', '1304.MTK.0817', 5, NULL, '$2y$10$cX0SO0RVK393HFGzvhJWzuHiKMqbu/C1EMDSDw5EHcDPiPXgI44/e', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1211, 'KISWOYO', '0859.MTK.0416', 7, NULL, '$2y$10$BwQ6K6A5MWHaEmMbQppA7uocKhfe80X6H1q0ykJgqSYJAWbz/RME.', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1212, 'ARDI TRI HANTORO', '0834.MTK.0416', 3, NULL, '$2y$10$VcTq3o9vD1Gt92Ms3VM/c.1.KbuB2YTpM4CU4.LymBKQx4eh/yPO6', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1213, 'IKE WIDYASTUTI', '0067.MTK.1011', 6, NULL, '$2y$10$fLtfci2oAWv6oiTNU06fqe2r/eqfAEEOv0e5Eqc4x7m5vTU.FZS1m', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1214, 'SUDARMANTO', '0128.MTK.0912', 2, NULL, '$2y$10$XCS68EzHASY9Q7KXiu.DIe0jafkwVPnPnKYEQp5O9FV4PRXqii1KG', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1215, 'REKSI WULANSARI', '0163.MTK.0113', 6, NULL, '$2y$10$TpZEROStybeOeLphKEfEyOaXhjV.8y14nEz5CthT8dqe2IqkATmni', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1216, 'KUSNENDRO', '0169.MTK.0113', 3, NULL, '$2y$10$OPXnVrt88RNBkwUcs8Tg/eQMPf/bOfIoDFB1/yZIpqruANeRzXNeC', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1217, 'HANDRIYANTO', '0253.MTK.0913', 4, NULL, '$2y$10$enjaiKdP2zrCs9i9VPUL4uBiwcEr58SeiB2ZZmg5UYtuXb5g6vce.', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1218, 'NITA HIQMAWATI', '1080.MTK.0916', 6, NULL, '$2y$10$sTb1cHCnwHx1VcxFW8zzXuOXpG/f/bpTiJSru55ZjT0l2yQgtH05u', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1219, 'SODIKIN', '1165.MTK.1116', 4, NULL, '$2y$10$lRBbK1.cdiVRRJbSbFQDne/KU8HAbj3wT3A3AiLvFml/8tjMotauu', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1220, 'ERZHE TRY ARDIANSYAH', '1447.MTK.0418', 4, NULL, '$2y$10$ggy20DtFC.XFAOeNgRQtFOmd2M7PJd.bSWRL9lAIVF5xD6xZ3paam', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1221, 'BAYU RESPATI NUR PERMADI', '1508.MTK.1018', 4, NULL, '$2y$10$ibQzJUIVQdH/h3MNfg83Ge7DqtX40i7SBqPHgx8EVN97nOsiDA5RS', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1222, 'BURHANUDIN ALI RASIBI', '0167.MTK.0113', 2, NULL, '$2y$10$QKpJa6/wQbyWbpIvD/DFg.Lisw9VQcGsD5jnS7maRg.UyORyn.2QC', 1, NULL, '2021-06-15 20:21:50', '2021-06-15 20:21:50'),
(1223, 'DIDIK KURDIONO', '0578.MTK.1015', 3, NULL, '$2y$10$yNphu6PQezwhAfb/kVvSG.dZjwO3CV0ipwHHyjnQSVRB7eJxK82UO', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1224, 'HERRY FIRMANSYAH', '0915.MTK.0516', 4, NULL, '$2y$10$rf1s44agH.5bPqOcCr0tpuUVtym4GEtwXwA3/T4D7FC4lUAtU/2dG', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1225, 'AGUS SETIAWAN 3', '0975.MTK.0616', 4, NULL, '$2y$10$qA75k7m7R6Bva66LonOl1ej37XH3DIg3X2KUJXY6hka9RvnXYY8Kq', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1226, 'SUGIYANTI', '1355.MTK.1217', 6, NULL, '$2y$10$WSJFYEENaQ4GAPkjB2gW.ulu9Au2X86Oms2Cgp.HqWhbhrsMRNg32', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1227, 'FIDI SAPUTRA', '1453.MTK.0518', 4, NULL, '$2y$10$XP9Dfm0rlkQVFfTW3FabtudYRkuFprAfZsn06AgOZCkGygCO8f87q', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1228, 'DESTA UNUN', '1635.MTK.0519', 6, NULL, '$2y$10$v4w0j/Db.LmQY6GCoGRwGO/3oirlyEs8nJx0dmi4/X8/qzQUc39Cq', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1229, 'AGYL DHANI PRADITYA', '1652.MTK.0719', 4, NULL, '$2y$10$T.MQah8.b4RnLugUPleLLeHYPeh0JD4j8JVqx.Wq6yZ/6L9PJ8c2.', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1230, 'RIYADI', '0564.MTK.1015', 7, NULL, '$2y$10$xGHtzMHhHZnAC0IJ58l4Eu8kRZxkxvja4v47dY99ZNZGKfr4cvrgK', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1231, 'KOES INDRAJID', '0252.MTK.0913', 3, NULL, '$2y$10$3G1JxskTAF4UIyN0fDmQy.T8p6X5mIgwuYvaouZBigWBplrNYjWRq', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1232, 'ULFA KARIMA', '0356.MTK.0914', 6, NULL, '$2y$10$ektl1xgKXFjP35HW4jTpBukItHgSkwgds11a.L9V2ih269zw5JtXa', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1233, 'LILIS RIZQIANA', '1176.MTK.1116', 6, NULL, '$2y$10$jTLy1ONTbGQxZjaXYSM51.RkUhUR5Seq2EDlaY2D.lqKYdzZoRyt.', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1234, 'FIKO KHARISMA ARGA BUDIYAN MARTIN', '1306.MTK.0817', 6, NULL, '$2y$10$z79iJn.nW/yVOLPdq66nN.emngYgQJYvJ8ADUS8WruR3VfxHOP5/q', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1235, 'IMAM NUGROHO', '1311.MTK.0917', 7, NULL, '$2y$10$mM9VaoSUlXtUNcp2en3pc.jBny0IZ23wR6mprA9rZFgqpZnSPIWeO', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1236, 'NUR ROCHMAT MULYONO', '0121.MTK.0912', 4, NULL, '$2y$10$RWREOYWpuc8lOVSE9sfGGOGfP.vwfMnf4Txr/mrnNyK7fPj6UlXoy', 1, NULL, '2021-06-15 20:21:51', '2021-06-15 20:21:51'),
(1237, 'AGUS SANTOSO', '0363.MTK.1014', 2, NULL, '$2y$10$RhaoH3CZADSFG7GSsGOBR.AtHgChQn0TMDGvMmiXDDSbjAOt9Q/fe', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1238, 'EMHA AINUN NAJIB', '1058.MTK.0916', 4, NULL, '$2y$10$B13K9g24RE7V27JBL6O0xei0y46JG3z86pEcB1GmM4bHNnDJVayP6', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1239, 'WILDAN FELANI', '1319.MTK.1017', 4, NULL, '$2y$10$RytJ0rojNtedw4nCx1mTauGM1uIQ/plJlvG1fdk5guxTj7k8172Tq', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1240, 'MUHAMMAD FAJRUL FALAH', '1512.MTK.1118', 4, NULL, '$2y$10$Z42RM30XvM1IqNBjuJ38N.p4Gp.jL67vG0qRgXkcEbWL2SCpgoPay', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1241, 'DETYA KURNIA PUTRA', '0270.MTK.1013', 2, NULL, '$2y$10$ntudBqMYEAqp69K9hrNFueJBJfRFdh/MvorbpgFfnbJk4HXQYBXDO', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1242, 'MOH. IBAD NURHADIYANTO', '0384.MTK.1114', 4, NULL, '$2y$10$GRTq7b49k/wC2lB8lw9HZecBm2JKVhPXUuGGA3WC/.2E3E9YrvvtK', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1243, 'PAPANG IMAM NURCHOLIS', '1249.MTK.0317', 7, NULL, '$2y$10$dZ8OQ2JvIbktd7YDLfhmhe0qyaZY1O5UQAS5qA7Q8oPebGGcSCp5m', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1244, 'MOS ALDIN LONG', '1298.MTK.0817', 4, NULL, '$2y$10$N6AT3y.hFNwTWvm6bekBOOw4aMn8TKwBrpoiPjNJpj3CeRC1D5Zoi', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1245, 'NUR HALIMAH', '1299.MTK.0817', 6, NULL, '$2y$10$vjZuVelOttoXfInQDbwMHuUEycNhu.FcGRL0L4ZfXVvqGQdWqwjGe', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1246, 'HENDRIK RISMONO', '1312.MTK.0917', 6, NULL, '$2y$10$6Uq7bUng.E0SxraPsODz3OvxEm4nZm0lffonMkDLUAYdat8R6U73S', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1247, 'USWANTO', '0173.MTK.0213', 2, NULL, '$2y$10$qQrM.lFtocRSaKDJ7hLeW.K1RBXJGQlKglE2BYXLgQL41ZKt6aZfa', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1248, 'AOLIA KHUSNI BAKHTIAR', '0852.MTK.0416', 3, NULL, '$2y$10$8z5.2vBIRSRx5bRBnWX5pOZwHokJiNDmxkIVjjI7IY0wnJiYkB7fm', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1249, 'SIGIT ADI WASKITO', '0968.MTK.0616', 4, NULL, '$2y$10$Wj1rG.pwUGeB62pjfiEjXeo5QXsLzZVZgkhKV2c3JjE3IFaOq08fW', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1250, 'AINUN RASYID HARIANSYAH', '1675.MTK.0819', 4, NULL, '$2y$10$qBTtr3hUE5IuDSwmaRHnB.3AxiFRS69qrRbirscz49I71Y9bVTbSW', 1, NULL, '2021-06-15 20:21:52', '2021-06-15 20:21:52'),
(1251, 'BARIZAH', '0552.MTK.0915', 6, NULL, '$2y$10$XikZuEwTqBx2NTYPYoh2Tue93YTzD6KQT1fWczHLSF2rm5L33KGWe', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1252, 'MIA RATRISARI', '0998.MTK.0716', 6, NULL, '$2y$10$gw.kBnyjNvuj4oY5v8OeBu8Leg5MHM3jxpAQFI4iNgzfKl.ySXQ6u', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1253, 'ALBERTUS DWIYANTO', '0030.MTK.1209', 2, NULL, '$2y$10$pZVxt2uKLWywKrHCjbOAT.1YEjRgqap6V5PQ6EzNCvK.K3wjGAkeq', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1254, 'RHESMA BHEKTI DHARMAYANTI', '1767.MTK.0121', 6, NULL, '$2y$10$wKsFQFKy28xHBlhCo6vW1.Zm/BtpOrRxUOYPKIKyTx96s3vOyZ64O', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1255, 'ARIF RIYANTO', '0274.MTK.1013', 5, NULL, '$2y$10$U8j3a.8TfV8CGRfyKA71e.0cVOeRjgzK56ASI7WTuiXauBhufNEo6', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1256, 'ERNI SUSANTI', '0031.MTK.1209', 6, NULL, '$2y$10$jzIUx.mEKQm62vypkWeB6.1oTi2be1goE/lrqBBg0KPIJVV7A5lua', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1257, 'HENDRI', '0044.MTK.0111', 6, NULL, '$2y$10$TMgJohRwokVEyWUU8FT0P.jV91zHHneVDSZCpYVZjaAzkfy4Z1sPK', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1258, 'SUSWOYO', '0116.MTK.0612', 5, NULL, '$2y$10$WxxqbpgN8S4W.2EFIRM9wOxFgmz2q6hWKksDIiWg69kHEF333VbTC', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1259, 'SUMBODO AHMAD FURQON', '0119.MTK.0612', 4, NULL, '$2y$10$DjjQK.ihbTf4u0ApUaf16uzvroy7vTL5R7crw2niFLm9Eu2aNyhxC', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1260, 'TRI NURHARYANTO', '0226.MTK.0813', 2, NULL, '$2y$10$R0ppEPotfacg3VJ6BRCEw.mm4tMg1t4WJHhmTHxQwmxs3n4lV8VqS', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1261, 'KASIWAN', '0248.MTK.0913', 4, NULL, '$2y$10$rd5c2OIu9NZiG33eZT1HduNBtZ0l5tmsai8xgBeX11S478QWP0Wzi', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1262, 'RUSDIANTO', '0417.MTK.0215', 7, NULL, '$2y$10$/vAt.Wfrym.seSl8e9vCkOso0vhJNtPOqoUy0gxPHFWJNnxJPl.fS', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1263, 'EDY SUBEGYO', '0510.MTK.0815', 3, NULL, '$2y$10$oM5H5CevogANVYYkGntu4.9fOQkWHATL6L3u47Z2/NhqEk3.9vqwO', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1264, 'RINI RACHMA PUTRI', '1008.MTK.0816', 6, NULL, '$2y$10$Tk2kX.Uliv/3sX3WoSkvse9JHDFeTeIhO88UTX4ij96xjl4OdkaCm', 1, NULL, '2021-06-15 20:21:53', '2021-06-15 20:21:53'),
(1265, 'FACHRUL BUDI SANTOSO', '1305.MTK.0817', 4, NULL, '$2y$10$YcX9Ejlg8RRbEb.NyfNCwei2rFqXp9CyLRtb/6d5HTDmZbs8Er55C', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1266, 'AMIR ULIL ALBAB', '1330.MTK.1017', 4, NULL, '$2y$10$PlTUBrfIeBfVqErDzj/DSuY9IHMB5mpKVgbI.LFntNs1r.8uRtnZe', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1267, 'AMELIA LUTFIAH', '0244.MTK.0913', 6, NULL, '$2y$10$ouZtrw/jZSKo6jt5fmu7rOCyNLuvFtl3ky4125TBsjXwDUnZlP4dK', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1268, 'BUNDAN PEKSO JANDU', '0388.MTK.1114', 4, NULL, '$2y$10$t2LkjtkxM6DKGPTKUPloieFaiRWy83wvXIujvqvUGNEeDuGBxVsmK', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1269, 'SLAMET HIDAYAT', '0401.MTK.0115', 7, NULL, '$2y$10$MV56O/Dt5HkeY5HrfrNK9.PWnXnOY.5qTFMTexZCKoKZzPysPUq6O', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1270, 'NOFAN SETIABUDI', '0777.MTK.0216', 4, NULL, '$2y$10$lfIiYx4IM9pFBOUBaFK7qOT5SFRo3z1lOacpHPB4gWBZ9rvavaCI6', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1271, 'INDRIYANI', '0930.MTK.0516', 6, NULL, '$2y$10$OozCe4iEskRAw8Q2nY41NOWsnke7prSHNa59.jGa8By9S/EnHMtSG', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1272, 'SLAMET', '0187.MTK.0313', 2, NULL, '$2y$10$vIKNo6QxcOZuAIs4KZTGAe79S1AKxlyIE6b5Li.acWYn2wZGCqwUu', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1273, 'ZAENAL AFRUDIN', '1753.MTK.1220', 4, NULL, '$2y$10$rldkvRbUtjJyM8GdUrxyBuICw2n.IHTVzQmlcd3OYrSICB21Zi1IS', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1274, 'FITRIA ANDRIANI', '0317.MTK.1213', 5, NULL, '$2y$10$SAPqfqSnK6fJpchtxl17MO010OUEBi1ow0wnG31UdNTz4omM9E/6O', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1275, 'DANNY AGUS PURWANTO', '0011.MTK.0509', 2, NULL, '$2y$10$tz/NaK9DiC4aw9V3hz.Yy.HAUdQOnffTvbFm1GwKdV6pClQWhdu4u', 1, NULL, '2021-06-15 20:21:54', '2021-06-15 20:21:54'),
(1276, 'SUYOKO', '0508.MTK.0815', 4, NULL, '$2y$10$gN7GnALagxWg0tJDIDOpIejAZqrqJaGkWH0IDDmR9q0DvDW.pQV3G', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1277, 'NORI ESTINA', '0291.MTK.1013', 6, NULL, '$2y$10$v6sLzSvO0SSU3aqCEyAvMOycHWcppGyIE85oUW3EW0UR2nPLfqvUy', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1278, 'TEGUH GIRI WIBOWO', '0534.MTK.0915', 5, NULL, '$2y$10$jt5szxQQ46akvQU96oZLHOEStYiZT3gphvP879w75jzz1zn0vJfX6', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1279, 'EKA RETNO SULISTYOWATI', '0540.MTK.0915', 6, NULL, '$2y$10$mkh5ZAdCGfSSU6o8SzkQuOCTaEGqSOCAnBpfUhLkuIqOpoiRk5Fx6', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1280, 'WARID SUGIMIN', '0830.MTK.0416', 4, NULL, '$2y$10$n/kvoKUsJSqHAcm/eFVz0Ok6KIfj/lHrG0qt/qJrw/py1bfu43Xva', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1281, 'HERNI PRATIWI', '0565.MTK.1015', 6, NULL, '$2y$10$G3HzaeyfW3Ow5MMmBRfKt.Si5JLNX3x0bMn2CK0s/urtJjeR2yVqW', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1282, 'JOKO PURNANTO', '0971.MTK.0616', 7, NULL, '$2y$10$J1dav1Rx5YHqTp1jr0q1XuunlL3iRRKVvLepFNYvMZIY6h0tank36', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1283, 'FAIZIN NUR HIDAYAT', '1742.MTK.0720', 4, NULL, '$2y$10$kM9mU/kaAzH3JdIESfBhNOJCObb4iOy83bQxgNbNTlwJXOOxSF/Mu', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1284, 'AMIN MAHMUDDIN', '1755.MTK.0121', 4, NULL, '$2y$10$DeRX/q.LeZQGjlMIlSJa2eyVl8jY1cCbHrpmhMOjgOdqGgsxq/OJK', 1, NULL, '2021-06-15 20:21:55', '2021-06-15 20:21:55'),
(1285, 'JATI PURNAWAN', '1756.MTK.0121', 4, NULL, '$2y$10$POn8PnVu0OSQrUTIgCq4Se8x3OhyVExVQJbhZE/hZEgjivu4UrCyq', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1286, 'DOYO SUJARWO', '0893.MTK.0116', 7, NULL, '$2y$10$wea2Tf1Fa6lCykjBw98d3O9Dm4.d5cqDJo.IjkPwjcKTljPQ9CNK.', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1287, 'TEGUH SUPRAPTO', '0227.MTK.0813', 3, NULL, '$2y$10$HxwHUNIT/lTfyQS0s3j/ie11/SMBgCutGfi.j1oRycu8wODlLBAmW', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1288, 'M AFAN SAGAF', '0305.MTK.1113', 4, NULL, '$2y$10$HSzfplr2OFkfOJFYOqYyYuVi46K.7GaiO.5HJrM0Y3NJiQdgm9Rsy', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1289, 'TUWARSO', '0358.MTK.0914', 4, NULL, '$2y$10$2yMUA8MK6w0ThLMDCBzb5ODDwr2vMccNok1K7OdvG8JpiYfHh2JCK', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1290, 'AJI SUCIPTO', '1025.MTK.0816', 4, NULL, '$2y$10$hy.rF4PXEzG8.F0uDNpEfusYFiuqvo/IiDylY9LXyoUrXRGr0Ciu.', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1291, 'EPRI SUSANTO', '1538.MTK.0119', 5, NULL, '$2y$10$cdIQPkV/xUW/E2m.DFbXa.rT/rGxOCXoR2NNzSiStgbDU2Wk68XoK', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1292, 'ULFA NGAENI', '1762.MTK.0121', 6, NULL, '$2y$10$sEb9NZ9ZQVeF0a.BDC0f2.abIusvj4vgWTy6CPBnWh3Wc4sV5AXdK', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1293, 'SKOLASTIKA PRADITA DIAH SETIAWATI', '1766.MTK.0121', 6, NULL, '$2y$10$wO9S0T2eMZTepu76ARDMIubyhaQPW1VSHhB3Id.OgjvVjPCCgUMl6', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1294, 'SAHRUL MUNIR', '0102.MTK.0412', 2, NULL, '$2y$10$J8X1B5oX3XfGyhZMjQkXQ.V4suVz09W/J0r3r8c60XsyJFkkE58Ty', 1, NULL, '2021-06-15 20:21:56', '2021-06-15 20:21:56'),
(1295, 'DEFI', '0101.MTK.0312', 6, NULL, '$2y$10$meqVS9BQ5NVjkvE4jBxDs.bsA.jor4mB2VQofhj7ByE9PL8n3lIUS', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1296, 'BAYU PRIMASETYA', '1472.MTK.0618', 3, NULL, '$2y$10$KIucMKgMu72zcfVGK9SzouYsnBqV9qEwCn6.G11vJggcXUlNoYYou', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1297, 'AGUS SUCIPTO', '0135.MTK.1012', 3, NULL, '$2y$10$ZmCK.Ua6zgmtLINAgyJEYe/qIHIMm.rEXfq5Uhau2TyyR2sQqjxWm', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1298, 'DWI WITANTO', '0857.MTK.0416', 2, NULL, '$2y$10$6GRECd.BzysQLswLm3oslOBwCJb9uC9wrQrzR1vZnmax8ve6yRTVe', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1299, 'SUCI WULANDARI', '0344.MTK.0814', 6, NULL, '$2y$10$4Deb.ThNyN.9i/wFObhhgOoBphF4.oE.d7vTII06FI5QWDEVveX7i', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1300, 'DEAN PRAHITA DARMASTUTI', '0403.MTK.0115', 6, NULL, '$2y$10$VpYmQVMEJdmNyG4FKbex8O7jWZGQ1YqThwgKvBG/itkOZ.vaAwmKa', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1301, 'LUKMAN KHALIM', '0410.MTK.0215', 3, NULL, '$2y$10$98fVWTp0dqjPoMJNaNMr2.dc26DqYntWUfkAKWQ7qeBFoKgia96w2', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1302, 'GARY ADAM', '0946.MTK.1115', 3, NULL, '$2y$10$jmj9PlzVBk3EzpG4yPXrKOmmi0fCsU1Q0D0kh.TAXI1a85F5nIUw2', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1303, 'MUHAMAD RIZAL IRFANI', '1100.MTK.1016', 4, NULL, '$2y$10$Z513iYAHMUxo3YNP0wyXROUz.TY7kR4MDpii6M7qxh5Bz2K5LW9sq', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1304, 'BUDIARTO', '1157.MTK.1116', 7, NULL, '$2y$10$pcei3ZjvMVO4fWBdece1DeR4d.M8MUAJpBt06EKVdoc9CwJbPlugi', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1305, 'AJI SAMAHUDI', '1272.MTK.0517', 7, NULL, '$2y$10$8cs8UNr4lxfuD8BuxaVUu.dk6FX3ZtplQewMKLmbTfot64elTBTgi', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1306, 'MOH YUSUF', '1388.MTK.0218', 4, NULL, '$2y$10$RhVIA8bmp//d0WdzAvlAue0s/Y4EtZ3W73J1qu2/GkMmCouJ3N2iC', 1, NULL, '2021-06-15 20:21:57', '2021-06-15 20:21:57'),
(1307, 'MUHAMMAD ARNANDI', '1391.MTK.0218', 7, NULL, '$2y$10$AyI/ddW8Qvaf12jOF1u1X.uAlamyAmDUsPVvI8OUg2OdMcMbakNNq', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1308, 'SULFIA NOVIANA', '1500.MTK.0918', 6, NULL, '$2y$10$skeZfs.i2J6lzmWTOeDYIOkNwjWWC9LNb0GXgIokbR3648lRI39gS', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1309, 'KUN PRAYITNO', '0165.MTK.0113', 5, NULL, '$2y$10$bDDlyCWL/iihSDMBtgp0TescWmpJcTYFQzhUorNfEtABdooX4P24q', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1310, 'AHMAD KHAERUL FAHMI', '0183.MTK.0213', 6, NULL, '$2y$10$bO5BeV04D99vRwKnEfFTbuYbZmHNI79Ltdw/i0mO3gAIe7Qzu4Fx6', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1311, 'EKA FAUZIAH', '0300.MTK.1113', 5, NULL, '$2y$10$LaCW45VXQrLxvrcLDGHQXunhc9kq4z0Kgm4y8LgT0KA45XY.a0.WW', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1312, 'FERRY ZELLYG PRABOWO', '0411.MTK.0215', 2, NULL, '$2y$10$9cbkMdKihsDremFuuF0cJeOXJh9XT1KQ/V1oFfhBv17ihknJTafjO', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1313, 'BANI SETIA', '0799.MTK.0316', 4, NULL, '$2y$10$JHzl.390RsvHR9d6JV.2yOR3yAQsT0aZmH8CcAlm9A.MFu6DESkAG', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1314, 'IKHSANUDDIN ABDUSSALAM', '0818.MTK.0316', 4, NULL, '$2y$10$UTOPQxq9uyKoyPobEuO8SOWhXORz58LmxPBbGyvGA3hL0PElw1kRO', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1315, 'TRIYANTO', '1211.MTK.0117', 4, NULL, '$2y$10$hPsooHNE131NLSnhOGY92eEb/9yv12J/p498qNSxr2sv4RPBw/bdm', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1316, 'FAKHRI NAUFAL', '1291.MTK.0817', 4, NULL, '$2y$10$2yAkot2mhmGg.x9b7BA9GuWYy3BCpir9UBDObwYdivq1b4NrFlgwa', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1317, 'AJI PAMUNGKAS', '1373.MTK.0118', 4, NULL, '$2y$10$OCo8qqf.Patw42E4Z1/iK.4N8Y8w3J45E9u3ZgG6NNSdr/HG./p6S', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1318, 'AHMAD ARIF BUDIMAN', '1372.MTK.0118', 7, NULL, '$2y$10$1Ujtf.ZcfVbCGr6MiSZCneBhG//k3hsqLFLIB9HgrA9moVhfsT9L6', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1319, 'MIFTA AIDIL AKBAR', '1402.MTK.0218', 7, NULL, '$2y$10$0udvGZJS7zt7Rf69UtMQo.dW9la2r/kk19fXROCqvItU7tBrn5qP6', 1, NULL, '2021-06-15 20:21:58', '2021-06-15 20:21:58'),
(1320, 'SITI FATIMAH', '1156.MTK.1116', 6, NULL, '$2y$10$Dqbpz5bhcs9DBsgs9AMfF.hEj4P6yiNHyA9cF6nRfF2cD2rlSRmmW', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1321, 'HADI MUAMAR', '1710.MTK.0220', 7, NULL, '$2y$10$fXL3x2WNV5LF71pfhkCwIeXIXoG9qWMHpIhd3IqCpfrJ7gQiR3gUG', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1322, 'FUNDY WIDYAS WENI', '1290.MTK.0817', 6, NULL, '$2y$10$Gk4053bfCrG.GaOx61l0w.Gho947Jo2kuA.cEXUF2qa1EVbuX7Ugm', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1323, 'MUHAMMAD ARZAQI', '0406.MTK.0215', 5, NULL, '$2y$10$W8C/aVQ8UGfX78kYqla5f.spRiLIZHxcgtvUUZrSNXUQeoLsQ6vmS', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1324, 'DWI DASA AGUSTIN BADRIYANTI', '0164.MTK.0113', 6, NULL, '$2y$10$ko0VUj7dWXhBVNuTI028aOL7H0R8eyZ.uo4J71lWEXKvJSwtORAR6', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1325, 'DEDY SETYO PURNOMO SAHRI', '0199.MTK.0413', 3, NULL, '$2y$10$9BVAzWYMUUZ1NotjjHGfNe1I46T1M9/ZBFB19r1oitYAc077K.q6y', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1326, 'SUGIANTORO', '0386.MTK.1114', 7, NULL, '$2y$10$D1rCnrjc2XMe30EsvQdfcu.BeKhl9sefMLLksAPuJGNjygrYetoMG', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1327, 'TITIS ALFI PANGESTI', '0398.MTK.0115', 6, NULL, '$2y$10$kWcUY47Eg/8zOY/NOSc6e.kOSMv.SU2k6sPtdJm2tm3hln.vU6OgS', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1328, 'NURIS ALFARISI', '0428.MTK.0315', 3, NULL, '$2y$10$yjuMnNjgBwFBnQs/73DdRuaDYvZU9K9856NUmLSe35UnuOisV.jkC', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1329, 'KARYONO', '1232.MTK.0217', 7, NULL, '$2y$10$UTrHZY3TquhAyAjjcqryGeAZxgTS2/m3rYs4vDmAGdxPhgBvzaAe2', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1330, 'M. NURSEKHA', '1233.MTK.0217', 7, NULL, '$2y$10$nqujIkO1k68QUaTciiPLounLTgsYXUTIJzWH/2oZ45uoXL4FwKOEm', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1331, 'AGIL TRI HARYANTO', '0213.MTK.0613', 7, NULL, '$2y$10$b4DPzCAAmteGLUlS.Dnhbu7DR7kR7tQCYGvb7cV0o8r/DZ.w1rcki', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1332, 'TOHARI', '0214.MTK.0613', 4, NULL, '$2y$10$B3kC2uvOXdI7/KkFsQSgVO3dF5MZWtJD2t3kL/OktXEbEhvzu45Uq', 1, NULL, '2021-06-15 20:21:59', '2021-06-15 20:21:59'),
(1333, 'IS HARYANTO', '0275.MTK.1013', 2, NULL, '$2y$10$AZcBxmOlM5WqFG1o4eX0EONo1xom0RX3N/2gxdp.k166vnMSQX6k.', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1334, 'SINGGIH PRAYOGI', '1072.MTK.0916', 4, NULL, '$2y$10$QtZPH5yQ42PYKICwA3y1xOApINTjW06o038n/EgD0x8O.dAYQLQtS', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1335, 'MUHAMMAD YUNUS PRASETYO', '1117.MTK.1016', 4, NULL, '$2y$10$bcYBfD/SXou9uUr5o7rGGOJsO2qzd/93iGEAyks5Gd.3zAsGN6bXW', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1336, 'FEBRIAN NUR IMANI', '1462.MTK.0518', 4, NULL, '$2y$10$sYep7z.iR7CrGEqYSZnssu5mbXQ4nGa1qaLtNGdlF9lFCfXUgK8US', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1337, 'SEBASTIAN ABDUL SAPAR', '1002.MTK.0716', 4, NULL, '$2y$10$BoeiAJzaw55.2rUgZW5bMuY5sJY33OXTVgueRhtA.OcNTHqGNYu5e', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1338, 'ABDUL AZIZ FERYANTO', '1001.MTK.0716', 4, NULL, '$2y$10$2P0aRjN7UgKEGtDLGdkDDuhKCl6yuPxHeZkRAmQ5DHQzhc6cRXkAe', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1339, 'PYADELAND HERRY KASHIKA', '1647.MTK.0619', 5, NULL, '$2y$10$2xrMTQQzBAyx3biZL0C/SupJiuvs.SrTbcetrsblAK3r5bbDEmi7e', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1340, 'ABDUL BASYIR', '0868.MTK.0416', 3, NULL, '$2y$10$wv1XlKbHtJqZ1sXncReUBuWjhH3vHjRg8uKVsi8RX1pRMzab1GFkq', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1341, 'ABU UBAEDILLAH', '1257.MTK.0417', 7, NULL, '$2y$10$H9xs7dM2NBAj0ij8/.Jaxu/DgslRb7jZEAdwKK/vrlQiauoR54IYC', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1342, 'EFENDI BUDIONO', '1464.MTK.0518', 4, NULL, '$2y$10$IbE3.t3MZiVTA2XuD5w.aetlANQikLwN.KF.rb9V/MdIMoOIIW1Tm', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1343, 'TINA ERVIYANI', '1631.MTK.0519', 6, NULL, '$2y$10$rk5z.b9DUn3gbHTn6Nqlvu9Ha43U0XWGYfIF64tjsqHP2qTwZWK4.', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1344, 'AYU EKA PUTRI', '1632.MTK.0519', 6, NULL, '$2y$10$oCNocyCqq8qiYeWrxrU1h.BI24GLQQ96rF8ym/LVUf0yrw4BkeuZ6', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1345, 'UNTUNG SUPRATMAN', '1705.MTK.0220', 7, NULL, '$2y$10$fFdMRiQ.Iy9.JCMm9zZ1BO0qKYYV2XdfXlUzGtPzbooslx3/JbNGm', 1, NULL, '2021-06-15 20:22:00', '2021-06-15 20:22:00'),
(1346, 'WIDI ASMORO SAKTI', '0435.MTK.0315', 2, NULL, '$2y$10$H5eFi4xvoKTvLRksEs3JIurtRSXM8vkn.cbOf8qgwBMiGUPlkCQyS', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1347, 'MURYANTO', '0754.MTK.0216', 6, NULL, '$2y$10$GItBogHT2rQXy2elhjLSIOiATC028gt8mF9INd9c81H2a7EtKiYDi', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1348, 'EKO PRASETYO BAYU S', '1523.MTK.1218', 3, NULL, '$2y$10$sS9Gx8KBy5JhtCklcddyLuikGvVhluzfy2A5GX4/IPaKJNNFwNfSK', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1349, 'RISKI ARDIANTI', '0480.MTK.0815', 6, NULL, '$2y$10$chvLzRprX4fCoVJWooKl1.5NCkSvpmb0aALaKC83zL78TWrqtq1DG', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1350, 'DWI WAHYUNINGRUM MANSUR PUTRI', '1289.MTK.0817', 6, NULL, '$2y$10$1aVuQ.y4B5ds1GzD2fP2.eMJJgrgFhc9BxRoz5JYPiRvPTmlkQjOa', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1351, 'SUPRAPTO', '0484.MTK.0815', 2, NULL, '$2y$10$UynI8bzz0eFe5yOCT1uQpe.bkifCsAfYq82yWoarQ5YalX52hrfLy', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1352, 'AYU SISWOYO PUTRI', '0829.MTK.0416', 6, NULL, '$2y$10$3vX.gOWUtdpWNMk6bDXpi.LnWEXXuxprJWp4zNOwI.XPR/QyQzUO.', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1353, 'YULVIKAR BATI HENRY', '1375.MTK.0118', 3, NULL, '$2y$10$ZlQiJAe.pFxrbWo5pT7tbOVj4pSofdU38zELyCmD1tUFufDW5vuve', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1354, 'ANDRIAS RISTIAWAN', '1379.MTK.0118', 7, NULL, '$2y$10$H1VDep3jAejn7agqTu4HnOdDGQTr9t/k4VkKrN0zADTN7b8/NGDqC', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01');
INSERT INTO `users` (`id`, `name`, `nik`, `division_id`, `user_verified_at`, `password`, `status_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1355, 'ANIK LESTARI', '1524.MTK.1218', 6, NULL, '$2y$10$lrf.Oq.a.JuC8oWb72ZaB.nSlkoAdNQrJd1JiPjQlt9tji38PIT6K', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1356, 'ARIES HARIADI', '1532.MTK.0119', 5, NULL, '$2y$10$mzm1u9oWTZKEGx/NWqfocOSm28po0YmAAH1uUUpg7.C23afOi8GKK', 1, NULL, '2021-06-15 20:22:01', '2021-06-15 20:22:01'),
(1357, 'HENDRA ABDUR ROHMAN', '1051.MTK.0816', 4, NULL, '$2y$10$ZBZ5lvYD6WpcbxNsAsgSYuir0uk.WHabCBUpYMunkIYfJGSgVWQZi', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1358, 'TABIN KHALILULLAH ANIESI', '1758.MTK.0121', 4, NULL, '$2y$10$kpPqAKc3CUTLuM5CGikB.e08axokWIIvGlWZcQSYdJOHIFo00Y2mi', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1359, 'DANANG TRI SWANTORO', '1759.MTK.0121', 7, NULL, '$2y$10$qetNqBcAKAdHmoc8G1Slouemlass78L96NqXUnjSDtGm7yxmyAS5e', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1360, 'BAMBANG SUPRIYONO', '0485.MTK.0815', 5, NULL, '$2y$10$v5KmLOxQSfUl.Jdhwr.GQeZZzZZXrSIJdHPH6kEbfUlWzuA8W/mlq', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1361, 'SUROTO', '0548.MTK.0915', 2, NULL, '$2y$10$bQKP8CR4znGv3gXmr2ISceGNXdCbibFTH3kNQ4FMdauPtu.ZlEUDy', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1362, 'SURYO HADI PRAYITNO', '0470.MTK.0715', 4, NULL, '$2y$10$oQqKiAdSzi1SR8wr0nM3MOTlQ1XTgysgLFWZI5.6QPZfNioUE.mgq', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1363, 'ABDUL AZIZ MASYHURI', '1718.MTK.0320', 6, NULL, '$2y$10$270dgl9layruEdJHeYDGyOOXxC57257T/PjXa.UC.7V6l0v9lNq2.', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1364, 'YUNAS SYAIFULLAH RAMADANI', '0908.MTK.0116', 7, NULL, '$2y$10$qkbbSk4vBaqDDT9pD/yjEOsTbyMVkDm32PSCUKPE6t2YsjcdKeqta', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1365, 'GALEH DWI ARDIAN', '1383.MTK.0118', 6, NULL, '$2y$10$jdJNJ6lU624ysgA9qqROhO3EdKzGF.qwlgowFBSs0kBhtqEWM2X.y', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1366, 'MARDIANA DIAH HARJIYANTI', '1734.MTK.0520', 6, NULL, '$2y$10$Z7e529WSS/AXNgblIXi8YOwET8g3r8lrXXj2O593njIng0GjF8yd6', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1367, 'ILHAM HABIB', '1177.MTK.1116', 3, NULL, '$2y$10$Av2N.lYiecfu7dI4ypdxeeW9FNGDddHrYZ1GaFQRFlNPfk9KL65tS', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1368, 'YUDHA KRISTANTO', '1763.MTK.0121', 4, NULL, '$2y$10$G1gk0nJA30KBlyIQhzrqTeaovfRc8OET0xvPsSkXzWe.PGk43R2ti', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1369, 'ABIDIN SUGIARTO', '0561.MTK.1015', 2, NULL, '$2y$10$g3FVkU/PHFJ4bExZD9siQeaSbGChHeLL3bzty2aV0TlaUVVzMZpdi', 1, NULL, '2021-06-15 20:22:02', '2021-06-15 20:22:02'),
(1370, 'SUHARTO', '0919.MTK.0516', 3, NULL, '$2y$10$JuGEWrVxWqJdp/kIQLs9Au2zWrmXBynvqn9U95eRqOzfh/Gzp503a', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1371, 'MEGA YANUASSARY', '1630.MTK.0519', 6, NULL, '$2y$10$iJLG1FbtUKvTbioAPpf57e01iE9ULZxz38i10wds26fVuBIxrJHmS', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1372, 'DANU AJI PUTRA NURYANI', '1696.MTK.0919', 4, NULL, '$2y$10$WcjeTgClFzBNp6bIWjOdS.AaBwFKqohNbo9auMQvhXowrc6xICWvm', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1373, 'SHOLIKUL HUDA', '1688.MTK.0819', 7, NULL, '$2y$10$4mvOD1nLzEIs.DcXPxyce.Xn91BNYMEn9KR3k7cvDjkIPaINhRGmm', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1374, 'YOYOK FEBRIHANSAH', '1719.MTK.0320', 7, NULL, '$2y$10$XxLx3KWJqSCgWcQoAG00oOoCmlUvYv3kVElKJ39ieeGiS1zCzAW/S', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1375, 'WULAN DWI MAHARANI', '1738.MTK.0620', 6, NULL, '$2y$10$W.QxNNk86sBoUVv0Ui8fHe68uh0hc5OtlOTDLnGgD/apfZFE.y1sm', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1376, 'HARLIN SETIAWAN', '1757.MTK.0121', 4, NULL, '$2y$10$aL4D5Flau5MtR2nCughtse5EYSyhYiAW/30bT5ycF3A0nUf3R95q.', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1377, 'PEGGY YULIA ANDANI', '1770.MTK.0221', 5, NULL, '$2y$10$PlwMNVp9PeVSwuw34Dnv.OAp2sTU3TbRuVuVTjTYeULr9MHj0uDXy', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1378, 'ARIS KURNIAWAN', '0271.MTK.1013', 2, NULL, '$2y$10$saNJsT8XtKnpnsBYASKsze7nKCQNFoX8yPiEhWQJsnKx0AybYYCnW', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1379, 'UMUL FATMA SYAH PUTRI', '1380.MTK.0118', 6, NULL, '$2y$10$RauzwB1MSRDpvEHlk.tJr.MATk6d0gcF//KqkRGtsA5Lz96Eo1azW', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1380, 'PUJI ASTUTI WERDININGSIH', '1722.MTK.0320', 6, NULL, '$2y$10$huYgvII00jZ8xcIkuHD4Y.Gpg.048ls6h.zTfSKITZ.aCtq5yBGAa', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1381, 'HIMAWAN', '1671.MTK.0819', 4, NULL, '$2y$10$jLu6GtB2r4hXF2Ol0zRQuOcr62AfsXfE9gqeP8z5T4MbGiSGvIRFO', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1382, 'HENDRA SETYAWAN', '0978.MTK.0616', 4, NULL, '$2y$10$EvsfcjB2Xzbap1e8E.EIUu7mkzK8Ptb.0SrovTX9TFVDHsInOkz4i', 1, NULL, '2021-06-15 20:22:03', '2021-06-15 20:22:03'),
(1383, 'RUDI IKHSAN AZHARI', '1374.MTK.0118', 3, NULL, '$2y$10$FFTcpCNFSYeXPcLD6EAHIuiL5.Dxn2uAb8E0VovpltxdXz2x3rz2m', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1384, 'ARDIAN SULAKSONO', '1717.MTK.0320', 5, NULL, '$2y$10$Oh3QS.wElbLdnE8jSM6Huehm6ZiBykyZqfXknXBI6S7PhIAY1mZLC', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1385, 'XFANURI', '1668.MTK.0819', 7, NULL, '$2y$10$TwkwyvLPf8i6ow2Cu4fFVOtDRSXEkwm/Ns.aChdp/eJjmHyqUQomy', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1386, 'AGUS WICAKSONO', '0463.MTK.0715', 2, NULL, '$2y$10$blpd8vaQzq/hJPdExvfYSeAEsQkjpuOaT4e/QzND6cPxQwXsRojY.', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1387, 'CIPTO WIDARTO', '1663.MTK.0819', 4, NULL, '$2y$10$iBiLjmDHgh2yHR6bTIU/ieVgfmXiU2x6nYebIa2W7f46O84GMppGa', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1388, 'ARIEA YONNATA', '0050.MTK.0611', 2, NULL, '$2y$10$u0DWFg8h.tEeTceTWom/8.nkBgQ3eK2sje/iVvIPEvot5PtpZyubq', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1389, 'DHIMAS ARY SETIAWAN', '0076.MTK.1211', 3, NULL, '$2y$10$IMEvZf9zhG4.mMrYHYZ7G.sV6NWGzrswVpgmh.el5oe.rbx1scJHu', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1390, 'WAHYUNI', '0081.MTK.0112', 5, NULL, '$2y$10$.jYFWdjR8TiPZxhfYKbk8OPN5A0jRHj2v3y5HcUq6gXsmPrF4xIwu', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1391, 'YULIASIH', '0218.MTK.0713', 6, NULL, '$2y$10$sE37MuFiCrbZEVdlgJMOYuZJPmBZs1l.hl613i4XXscErnqyYbLdu', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1392, 'ICUK HERMAWAN', '0815.MTK.0316', 3, NULL, '$2y$10$ydOO4IKASQq0T6T8vgVoEuNAYUgEjVa7A9RT7PeEWvdTzw5vR4OGa', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1393, 'ANJAR RAH GUNAWAN', '0026.MTK.1109', 2, NULL, '$2y$10$kpGDciTDZ86lknr84YhxCOQOxx8mHbKuIKNabch7tXWM5mJk42QjW', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1394, 'RITA ROSITA', '0498.MTK.0815', 6, NULL, '$2y$10$wRfwAxGdN17nfiH1l9yWiuS1a8i.8tDhwq.9pD1f8AYShTej7nt6O', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1395, 'TINNA SRIHANI WIDYANINGSIH', '1043.MTK.0816', 6, NULL, '$2y$10$sQcKfY21B4lvXJGO2cPKTey/D6i2Sk1phwAlafMPF/GKFN1edkWr2', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1396, 'MUHAMMAD FAQIH FODLI', '0496.MTK.0815', 3, NULL, '$2y$10$a/SVgKGzmfPa29hxiZKvDueiz4QlxHTMNGSXOE9nNXNTrhd36Sc.y', 1, NULL, '2021-06-15 20:22:04', '2021-06-15 20:22:04'),
(1397, 'MUHAMAD SAID', '0941.MTK.1215', 4, NULL, '$2y$10$bIxMp7e6PiJ.fCLHfeWF3.qfGWfJ3JmmB6/xJli/R.LYxqsyCQ2je', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1398, 'FANNI ANGGRAENI', '1164.MTK.1116', 6, NULL, '$2y$10$98nvIAcoLt48fTeLlW2d.OhvxXPrgmpOe8vNuHGA1Q5boynZ5N4SO', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1399, 'MUHAMMAD LUTFI', '0117.MTK.0612', 6, NULL, '$2y$10$w.pih0uiXWhnQUCN8FWwoOT5tJ7cLrieEJqtHbMioaDtjZD6BJ3ay', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1400, 'ALI MAHMUDI', '0758.MTK.0216', 4, NULL, '$2y$10$6/5eUHlGy4fYM.umJN3Qc.pvOCvloOYRMgvNTFD1zMSORnBllbrFq', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1401, 'FAHMI', '0925.MTK.0516', 4, NULL, '$2y$10$Y3LeAws5KihuHwAi5G.BBeH2hNCoLR4yF/oqRTVN0740koqXqePVG', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1402, 'GILANG DWI ANGGORO', '1565.MTK.0319', 4, NULL, '$2y$10$tu6Ne3UjUQHSn1/sX0rNdO7Yt/AVbwo809h4xLHKB6Tvcww5fhJb.', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1403, 'SUMINTA', '0107.MTK.0412', 7, NULL, '$2y$10$hANCR8Na6RC1AsYMIcvNpuLLavGvXthL1s2c1bL6MgVodiJb3mDbC', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1404, 'SATONI', '0440.MTK.0415', 7, NULL, '$2y$10$rVQUyGZEaVelwXhzvrNGLOsGhA2flhPpcq5boFVUkPhfpHrMp4K/i', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1405, 'DADAN ABDUL HANAN', '0574.MTK.1015', 6, NULL, '$2y$10$snRoji0GNCrrjk/pAPnxFuYB7P40HtbrcKIZD1aLNtjkvcXwFHvB2', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1406, 'RENDI HERMAWAN', '0793.MTK.0316', 7, NULL, '$2y$10$kBy14OKlpCoxyBeLgL0yiukCo84vic3uZlDYJbBlX/IsxPJ12ozom', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1407, 'OKY WAHYU WIBOWO', '1534.MTK.0119', 7, NULL, '$2y$10$aWvLkqnpcme5AswRlmjGoeyacEIZmVtW58Ssme8gKbTI.fukTU7WG', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1408, 'LATIFAH', '1316.MTK.0917', 6, NULL, '$2y$10$cyrzYiXf/xncrqTyfjRGWeC3jNriylbiVflfk/.F59bQ8dIrpPOCC', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1409, 'ARIEF AKHBAR PRABOWO', '0387.MTK.1114', 2, NULL, '$2y$10$NFJzXnAajuegpl/Trd7ZEeehnRo62GACGgM2RtCTPdTn0bCO63Kf6', 1, NULL, '2021-06-15 20:22:05', '2021-06-15 20:22:05'),
(1410, 'HARIS LUKMAN', '1728.MTK.0420', 5, NULL, '$2y$10$bY5F5UxUV1fBXV/ZcF.uWud1D11IhJaSTkX1.QWNtndvy8Pg9xKPe', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1411, 'ARIFIN WAHYU UTOMO', '0052.MTK.0711', 2, NULL, '$2y$10$dsKIT1W5FevdFGUsRcIJwuMeE14LNuqzR41kJxfMuIyQi7rG4SPdS', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1412, 'DADAN HARIS HERMAWAN', '0545.MTK.0915', 3, NULL, '$2y$10$g6deEKtX/3McAYRZLjqr2OjvAQwtYj.xHw6AtYArg7/szWEUT/GuS', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1413, 'ANGGA SAPUTRA', '0924.MTK.0516', 3, NULL, '$2y$10$BbHDX.JHGDem393E58LGEuN9g5a01NYjLpmtNsh2eEAPFuxjAxLhS', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1414, 'RENA HANDAYANI', '1041.MTK.0816', 6, NULL, '$2y$10$7eUR6TacF2n2iIJh280.ceywZPLwB88VpzbbKNzOP6PDoWB63QkTO', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1415, 'SARIFFUDIN', '1042.MTK.0816', 5, NULL, '$2y$10$a6/.3cj8/UQcsdpRvMv4Ee7doxdHFNK4pzkI2vTZ.QHtExSpwVI5y', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1416, 'NOFAN KRISWANTO', '0371.MTK.1014', 4, NULL, '$2y$10$/NzlJECce7etjR38YPt/x.8cywQ8EwZYtR71yPeDGpk6wZe4kHq6i', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1417, 'AKHMAD RIZAL', '0806.MTK.0316', 4, NULL, '$2y$10$582hvfTnuRmV0gAmc7UQeeEGpmvVWA5q2JQaRmLvrOqJDOpZIYli.', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1418, 'GALANG BUDHI SETIAWAN', '1171.MTK.1116', 4, NULL, '$2y$10$C84a1t.DWy0y1tW3mGn.3eeKi4GOc4zGonWp9hK/FFhYfbjfJ8hOa', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1419, 'MUHAMAD', '0880.MTK.0116', 7, NULL, '$2y$10$f1Qz9/KGECV1UxMI6GFI3O6JLMgpW2p4ZkAuQBDzyLQgdIvvVWNXK', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1420, 'ALAN HUMAEDI', '1178.MTK.1116', 7, NULL, '$2y$10$/nYMul7Vx96f4KsZUMJHFu.3t/.k5XPFO4WZ54Y8v64RFpuAYeKP.', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1421, 'ERLANGGA', '1181.MTK.1116', 7, NULL, '$2y$10$D5hkV3ta0qYrToRksLKxL.RsJ7uuL0VN1bs4lS0iUtzE4yjTc7Bdi', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1422, 'BAGJA WIJAYA', '1300.MTK.0817', 7, NULL, '$2y$10$EFOtBtI69W4enZ336jpv8ui/FQlCPIQEUFoyCXifiMdd8o4tr2NYa', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1423, 'DIAN NURDIANA', '1418.MTK.0318', 6, NULL, '$2y$10$AG4PJTOqC8WTPRiFnu89MOcVeceFQ8SQ27BG7h5CtqipEgTGi/fU6', 1, NULL, '2021-06-15 20:22:06', '2021-06-15 20:22:06'),
(1424, 'MITA FEBRIYANI', '1455.MTK.0518', 6, NULL, '$2y$10$uOYvPYgXX0TqqCB0OqtUmO5yGXSAdJpcLz6uHxqpBcAR/21q7RbiK', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1425, 'FX. YUDI SATRIA', '0347.MTK.0914', 2, NULL, '$2y$10$vjqEb1ZRTOeiaZKLNvSK6uGEIoICHQmJkFjMwFkxtIbYd.D00xZZ.', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1426, 'MUCHLASIN', '0373.MTK.1014', 3, NULL, '$2y$10$TDdKXW9syWLqyFzwZfhMy.6vYcQKxJkEunae.m8IjjZFvKmMs/OFi', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1427, 'SUPARTO', '0511.MTK.0815', 4, NULL, '$2y$10$Gxx1Ge6xn4KCxis3XeeZIeQs3Y3uTnPVmX3wbSK0O2.mKVDRr.Puu', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1428, 'BIARCHI AGUSTINA PURBASARI', '0362.MTK.1014', 6, NULL, '$2y$10$rp6UFn9s20rAbuC5SMRDJ.aNSdeVpga2QQBsS0ATgnq7WbiYWZlnS', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1429, 'MEGA DIANTRI', '1700.MTK.0919', 6, NULL, '$2y$10$qA9u..GI9/yBiQN4tqEEKOlHJSmsPBVzWiZB0ZnwqirwzI0Cx0SM6', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1430, 'NUR QOLIM', '1293.MTK.0817', 5, NULL, '$2y$10$5thojs94HAXftq2CwBTrYuMOIHSQE4GqISkzHqa8gCyjrcUeBO2t.', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1431, 'GALIH ARSYAN HIDAYAT', '1205.MTK.0117', 4, NULL, '$2y$10$zItQDk14Et6pOBb4.EYDgeOAsRB3NBVssBRAYmhs3iAEkdS/RinZa', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1432, 'ROHMANI', '1003.MTK.0716', 6, NULL, '$2y$10$9JG7INErmwWUZExWtrxKoeh1GSmQEnAlk6yxsuKvSuT/CyxCfI9zi', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1433, 'HANITYO BUDI RAHARJO', '1045.MTK.0816', 7, NULL, '$2y$10$1ZffQd30lpANUGQvyCTAWOG8iUcaUtCnuRCLKrXOm3/Ux03BFR1mO', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1434, 'SUNARTO', '1078.MTK.0916', 7, NULL, '$2y$10$V.obFA17oiqkUO.3PAV4TuBzuOk1ypLV4bjOldHjSe9.Xr9geGSbS', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1435, 'ARYO SUJATMIKO', '1173.MTK.1116', 7, NULL, '$2y$10$wzzxqWOk1HU4ITX7U2u63eM53C8DS3rpy92fmIwbprV7FsVFIImqu', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1436, 'NUR KARIM', '1294.MTK.0817', 6, NULL, '$2y$10$4/iAk8vAkEW8g6jk4FxbPuF5wCu/rk8KPb580knmiDaKp571TFrHO', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1437, 'WANDI', '1419.MTK.0318', 7, NULL, '$2y$10$h0hYQ7LVvtqft/MmKSCn8O5eIxzRthbI8LPQ7XserJnGehHGh.lGS', 1, NULL, '2021-06-15 20:22:07', '2021-06-15 20:22:07'),
(1438, 'MOH. ARIF MAULANA', '1428.MTK.0318', 6, NULL, '$2y$10$POUO1BXR.RyI/mo407OGqOPVWV69OvBTHjiCac0I73jjE0RLg.ZmW', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1439, 'IRAWAN BAHRUN', '0335.MTK.0414', 2, NULL, '$2y$10$2Dia9clNyGD57erN82jauup6NzhPoP4fzJtLdRBNNXs4LXKCrjro2', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1440, 'JOKO SARYANTO', '0361.MTK.0914', 3, NULL, '$2y$10$E/xE8vnRp5RthEh/daP.hupPJIF3Ve6yGlSMP1kjt0KODisMxN/nC', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1441, 'INDAH SUSILOWATI', '0855.MTK.0416', 6, NULL, '$2y$10$y3oxbElNn1rNd6y83.95BObpIZRxN6dEuUzKJlBbA5ehFlzLltG9a', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1442, 'ENDANG TRIYANA', '0555.MTK.0915', 6, NULL, '$2y$10$jnU4KkfXxY3Hs31U4twjbOqhBU54aIEz49s8/iYrFwpF0uW6etPhC', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1443, 'PRASETYA UTAMI HARI NASTITI', '0931.MTK.0516', 5, NULL, '$2y$10$8IXeBRl0ywjVNNT03.8iGe/vvxO19TaOE8Gi0dOhtytzBZ7OFQ652', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1444, 'ALI AFRIDIN', '1013.MTK.0816', 4, NULL, '$2y$10$Ymt.UlybBZRJMkvpgIomL./PSt4gdHSbsNhJdJ48GbCu1381s9UQm', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1445, 'ZAENAL ARIFIN 1', '1564.MTK.0319', 4, NULL, '$2y$10$3w8m1UblYU0TioJXItm/wOuAlW79G7Hn4UawEcsUdGFd3vMX8VjAS', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1446, 'MOHAMMAD RIZAL', '0374.MTK.1014', 7, NULL, '$2y$10$dIXnvjNxdO7aV7MCx75udO40WvyVDTdFZ6txJgYVgZHkQueVBjNvm', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1447, 'REZA KURNIAWAN', '0832.MTK.0416', 7, NULL, '$2y$10$TTNJuB0idQMUHDUclnWLQuT/S2lvGP9671IphsZPGgYCuiQhY.TiK', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1448, 'SATRIO BUDI UTOMO', '0918.MTK.0516', 7, NULL, '$2y$10$2Tycp/pVnrhQiMeziX348O.zEwEFLp83/jk5ymL4DwZQwjuiDwyL2', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1449, 'ZAENAL ARIFIN', '0074.MTK.1111', 2, NULL, '$2y$10$rTWJAcxSWrbm8YgdBCy7Oe0s4D7Qp.XdpepRyZ5TiEQVY3fdKYNo6', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1450, 'ILYAS', '0960.MTK.1015', 3, NULL, '$2y$10$YfEqPqK3BZF.fRwjxvH9JuoZ8cc4By86bIO7uR0olK9ArTzubP72.', 1, NULL, '2021-06-15 20:22:08', '2021-06-15 20:22:08'),
(1451, 'FITRI WAHYUNI', '1697.MTK.0919', 6, NULL, '$2y$10$9hiYw9cWf/KiOVr0Wv1eMePPgwTlNvPjKeExcErlBZg0YPiVm2hqa', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1452, 'ANI TRISNAWATI', '0168.MTK.0113', 6, NULL, '$2y$10$icXrPKZI3HoKeoGKcOe.ju97IkV5wIJYSM.knnR7EQ0BAJCT2WlZe', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1453, 'HIDAYATULLAH', '0232.MTK.0813', 6, NULL, '$2y$10$RZGfoCV7J.ijIHTu2juUIur4YWFupIxPGMgm0szkbwKLk.ei4Z10m', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1454, 'YULI YATUL MUNAWAROH', '0339.MTK.0614', 5, NULL, '$2y$10$ILTUsCUYy1L9qGBWgj0FZu9IPtXiZva5r8xcz26jngsHKkCi7KKJq', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1455, 'AGUS SETIAWAN 1', '0486.MTK.0815', 4, NULL, '$2y$10$b.PhknB/hV.T4e4THzWeNe7RRIQ8IToQawfB3iH9k6DlW8uXAolg.', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1456, 'ARIF SUPRIANTORO', '0780.MTK.0216', 4, NULL, '$2y$10$AwbY4CTOrpsDjxvGDpNEx.dL72mzxf70B3t4FwDtwo213DOO.kly.', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1457, 'ADHARI', '0230.MTK.0813', 7, NULL, '$2y$10$dbDl.ca.OzXuhojXIbgFvOI1vHcBZvOzJU.uRIqh9.W58/UxGZx22', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1458, 'MARHELI', '1208.MTK.0117', 7, NULL, '$2y$10$HgIjRx.TcMsaikh4hzCZtOx3Glj.O2Gd2AshjKipLhaduZww7qVnG', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1459, 'BURHANUDIN', '1242.MTK.0317', 4, NULL, '$2y$10$gTr8ScKCP4a.RJTmG9OIa.80F49J7Kmw1pOJcul87eZdvUkirVAL2', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1460, 'MAHFUDIN', '1271.MTK.0517', 4, NULL, '$2y$10$TltcmNHKI1J7SkFzKmnCPuf7sGRgYOhEU0Da9sAsOXAsFKgM3F4Ba', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1461, 'DIAN ASTI MUVITA', '1683.MTK.0819', 5, NULL, '$2y$10$RL/EXa3tnFGkX5mEnGPXVOYcHNZyiu4gJ17pw1LrdgUox2LUe0p9S', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1462, 'WIKI AIDIN', '0634.MTK.1215', 4, NULL, '$2y$10$tMCTyvlsitVxTaXLmpSGsuGN14Zw5UOZgxfFvwd.BVql5fHccsyCe', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1463, 'FENDI SUSANTO', '0237.MTK.0813', 2, NULL, '$2y$10$i4HqD6RCxvfcB7T8dwn.PeF7bRj.owuA680s9/tavPvFR16SNDHWi', 1, NULL, '2021-06-15 20:22:09', '2021-06-15 20:22:09'),
(1464, 'MURDIYONO', '0501.MTK.0815', 3, NULL, '$2y$10$L2i99gPrvrCYez9575oOmuyAJPbg3YmmlSWkfSMlrZLor/M6pbULe', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1465, 'FIRMAN KURNIA RAMADHAN', '1331.MTK.1017', 4, NULL, '$2y$10$P4.Ab7bc25rQPJPQLgd5YOSuhYjHsnwtf95XVRSSQ/gACftDtAiFK', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1466, 'ACHMAD SHAWALUDIN ALI', '0327.MTK.0214', 4, NULL, '$2y$10$1YQROeCmU.tKzVTCsCw0Heq1Ydtx2fzCnipuNiNCTFW8f7sE3A2Ti', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1467, 'MAULIDA OKTAVIANI', '1729.MTK.0420', 6, NULL, '$2y$10$T/v/DWvZIp/61KpG1.G4QOb1DqTMi24VvgnGccOc9Qj0Wq1HUZeKW', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1468, 'RAHMA SAFIRA', '1730.MTK.0420', 6, NULL, '$2y$10$xQWJp/UQab4jv5xdXWXIZ.PBSXHeY1d9TEfvwjUo2fjFUjfPxoxmK', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1469, 'SITI NURJANAH', '1077.MTK.0916', 6, NULL, '$2y$10$oYld6TN33E69AcXlazqjUeJwfCOXUq6E5R1/TbkKqleeJQEWSzLku', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1470, 'FAIZAL NURYAWAN', '1417.MTK.0318', 7, NULL, '$2y$10$kfVu48AiEioxv1jL5uUY8.B5o1Arr1UuVO2q4Ueb/NhW/XzN3jGU.', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1471, 'ANGGI', '1039.MTK.0816', 7, NULL, '$2y$10$BHcOmwHmUzR4F7E.4MvRIuxa6Lga4dcDnIvxKJ/jzR5bPxMQhMx7K', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1472, 'INGGAR RIZKI PRATAMA', '1332.MTK.1017', 4, NULL, '$2y$10$3lLhcr.GtB7xsn1hTjxf2eCyep/Gg3qQn2x6L7IGPkV8UWSXIXfoe', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1473, 'FAHRURROZI', '0229.MTK.0813', 2, NULL, '$2y$10$VxRh/9sBOQGHLtnrQYFZLeuIEhg1IMj9I1MOZO7HW6VD/0f1A9QfG', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1474, 'NURDIN', '1046.MTK.0816', 4, NULL, '$2y$10$CBEqUzoMXdl/svR2Ey3vWOBDmaTnzBhXDBJ7DhJQaqVSXHoab5xDu', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1475, 'ITA DHIKRINIATI YANA', '1727.MTK.0420', 5, NULL, '$2y$10$RlVV2eyJeJ3c8SVknf3wcuU5eOmgvb8rPm3ZjZYB8notWCbRmOrtC', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1476, 'MUKTI', '0409.MTK.0215', 7, NULL, '$2y$10$sD/0L/rxWcAtKr20cPOoCeL2eD7yGMMe5uJ5x6SRhsN2y/YTtHOti', 1, NULL, '2021-06-15 20:22:10', '2021-06-15 20:22:10'),
(1477, 'AKHMAD AGUNG PUJIANTO', '1302.MTK.0817', 4, NULL, '$2y$10$F1HE/rx2P//auVY3lodxaeSv7IDVFqPFZOTfn5J6dH0783loNqYTW', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1478, 'OKI RIZKI KURNIAWAN', '1764.MTK.0121', 6, NULL, '$2y$10$lgcjPXvnlMNzqDjvO8IOzO0Kka8/Kp/xfyrb/RHheiSUa28Ygr1wW', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1479, 'UNANG CARWAN', '1765.MTK.0121', 6, NULL, '$2y$10$AZdgi/roLPrLmzRZjBvIYOHzr5Zjm0vzso7Ek0HLKT/5fN2hPLlCC', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1480, 'AGUS WARDI', '0057.MTK.0911', 2, NULL, '$2y$10$m1vQ9mfUQLflB5nHe/0BJ.5.foSj1XHd.bt0qFPqMZuYx.t9zqiDe', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1481, 'SUDARNO', '0109.MTK.0412', 5, NULL, '$2y$10$kYt5kiZ/lX.x7g5aLgkbQO0v4dE.l2gEojYNbKUw8jIdnHrhet6Hy', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1482, 'SANTI YULIANTI', '0360.MTK.0914', 6, NULL, '$2y$10$h1dNpV5X1vCBErEw9B507.cGOeVBSoRcB45STUczbhaiNE0htIAxu', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1483, 'UJANG SOPYAN', '0091.MTK.0212', 2, NULL, '$2y$10$xs4AY/TtgDg/w1dzScw4sOy0yyZooM3M85e.LUNSjGNvKkTxfWnKa', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1484, 'DEDE NURDIANSAH', '0140.MTK.1012', 2, NULL, '$2y$10$0mTLDVlAVZE09m3YMsKc/.17G.1p/11zTssfGe799hWEskJ.cSztm', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1485, 'MUHAMAD JALALUDIN', '0541.MTK.0915', 3, NULL, '$2y$10$NPMBL4aOL7kr156COm1GEuXHjhumDMkYQAF2xGw8OrYYiYXQB54w.', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1486, 'ERNA SITI KHODIJAH', '0239.MTK.0813', 6, NULL, '$2y$10$mvCCPuWBKjEMWWQMcRGxx.mUhmWVWEhEbb9ilr3hMSH1GgH3YO.C.', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1487, 'KRISNIADI', '0089.MTK.0212', 6, NULL, '$2y$10$ikq28qs77l1nq/sDo5nr.eqDobRDTnkPRi5DWf.J911ZvJWN5AaSW', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1488, 'NANANG SUDARMANTO', '1366.MTK.0118', 5, NULL, '$2y$10$ILKlAC7AITYL9HN0YMCzpOXMqnP5HzsMmWc/D9iD51MDjR.CKM/R6', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1489, 'IRFANSYAH ABDUL AZIZ', '0333.MTK.0414', 4, NULL, '$2y$10$zchdANFi1wJE8eGP3QkJcOetu58EUlDYm/78Y9hQRujNciEJQIg7W', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1490, 'ABDUL KARIM', '0841.MTK.0416', 4, NULL, '$2y$10$JIveyUsc3j9kWWxr0I7bWOUli2hPYGuzOPbUZhbfTABlKtfk5ABV2', 1, NULL, '2021-06-15 20:22:11', '2021-06-15 20:22:11'),
(1491, 'CECEP BAMBANG S', '1085.MTK.0916', 4, NULL, '$2y$10$jOsNShNqA6fdFJvXDdzSaOZYnVSuNiTJo1Br151Z38PLoiV052tG.', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1492, 'PANJI AGUNG MUHAMAD', '1369.MTK.0118', 4, NULL, '$2y$10$30QskMgorAYD6fTHDLWa/O3trGFtgSnRzabH72rHvLYVt5jr/GY9W', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1493, 'SOPANDI', '0533.MTK.0915', 7, NULL, '$2y$10$rsqOU.jOJDSDBO8lWp4EK.6r2WWG9yoX4x3evMQIYzxzsMKAQtZ3K', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1494, 'PURNAMA', '1094.MTK.0916', 7, NULL, '$2y$10$TupyEj7AVLiEr8ukxV7Er.F9HjVEX9tE/n1vM3smRyNsDuUpvMfW6', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1495, 'RIZKY RAMDANI', '1489.MTK.0818', 7, NULL, '$2y$10$Prg1NKDqfwWYOq4s7/OQruIKJYjzadkmdXh4qrIreMAAHriyuaVea', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1496, 'DIAN HERDIANA', '0875.MTK.0116', 3, NULL, '$2y$10$9Z45brUoCmSrq8a6PsIzwOxSPFBEoTsQC5aewnDsCaJGVO3PL1vY.', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1497, 'PURNOMO ADHY PRAJITNO', '0059.MTK.0911', 2, NULL, '$2y$10$rp/Rrm2ZlZ4yZjk.HXs4PehQejsvxT8oTF26Z04mvdXNrHizFsj5a', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1498, 'AHMAD YULI JULIAMAN', '0160.MTK.0113', 3, NULL, '$2y$10$X7EOM/SvNEaxe7SahDg5jep3r5snmIY9nGw6CGt2c0NHaYydHXbmi', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1499, 'HENHEN SUHENDAR', '0061.MTK.0911', 6, NULL, '$2y$10$CdAiGSlJCjitia4lIaLNr.oLuyhOsY8yb6Fe10BXfePLa7tyfne8K', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1500, 'WILA ROSIANTI', '0084.MTK.0112', 6, NULL, '$2y$10$UxKCvPLFCzCmMam9DTGdC.KsOdVexn3CUlZMx8aD.TOSb5YL6.DSW', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1501, 'GINA UMUL MUTI\'AH', '1359.MTK.0118', 6, NULL, '$2y$10$r1.KCe0pIaStmrkOzXbF7u/aG2X90pOgz0WBhRIaFGVVxDiqKNreq', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1502, 'HERU SETIAWAN', '1360.MTK.0118', 5, NULL, '$2y$10$u53ya9pbfGp5jRZwPXMWxeIj0eXkI8Hbfx0yC.Fht7FRMQNHdDuvq', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1503, 'RAHMID', '0926.MTK.0516', 4, NULL, '$2y$10$0tjQpDXONaTIclwy8hA11ex4CFLkHOXABwn4nuhzNl4zWk8pOiMk.', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1504, 'IQBAL RAHMADHANI', '1715.MTK.0320', 4, NULL, '$2y$10$.htSkKTFBGjq4UCQeDlRruqtPnMYU/zoRHtm5uRulhr0iu09w3.uO', 1, NULL, '2021-06-15 20:22:12', '2021-06-15 20:22:12'),
(1505, 'WAWAN CASWAN', '1285.MTK.0717', 7, NULL, '$2y$10$YlT5lggdmwkOkdSCiIzQ6eUT5.Hw5m/SweGUzASo1FPS/ehP4tqfC', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1506, 'BOHIM PIRAWAN', '1555.MTK.0219', 7, NULL, '$2y$10$4A7S9j3Qv7ETp3qCJaY/ruYfigIl3LLERu.TdzH5dXxikvxm7CMZy', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1507, 'AHMAD PRANOWO', '1735.MTK.0620', 4, NULL, '$2y$10$Xv9NMcQH0rJNeSaWiPL/m.veXkD3lyMtn9hkGzXGxMReNMQeiY72O', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1508, 'BAMBANG PERMANA', '0114.MTK.0512', 2, NULL, '$2y$10$pwT/g/bGMUcfvYhu3hgMf.Tao432g9.41UnsZWSGhkJTjMKiOVQ3K', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1509, 'EKI ALDI RAFSANJANI', '0947.MTK.1115', 4, NULL, '$2y$10$uX1cTmiySifVRBUS7Xio5em8KRVQ.AYRp/J4X1N70ZaLJpU9RlMv6', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1510, 'SUSI ANDARANI', '1537.MTK.0119', 6, NULL, '$2y$10$4ICsyeqGKA.RU.3UgQDC.OZvw9FBlcyn4Uim8bkXEeha.nQhMUxQO', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1511, 'HENI SUMARNI', '0870.MTK.0116', 6, NULL, '$2y$10$y/mKoRFtMGH7GsV4SGnmzu99Kdj8LRR.HS.KKrXnTOOa427B3rm06', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1512, 'WAHYUDIN', '0558.MTK.0915', 6, NULL, '$2y$10$.UtbSOX7mBZzWEuj1yiYSetVrGkYtw9m4BraD6fGBe6Mmv1CBTUba', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1513, 'DIAN NURZAMAN', '0083.MTK.0112', 5, NULL, '$2y$10$Dnf4LE7H3b5KmgL0/4YLj.zb9cb3H5D7duCPqEX6DUcINL9ZI/oBS', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1514, 'ERI NOERYADI', '0063.MTK.0911', 4, NULL, '$2y$10$rUfQaOh7LQvQXARua//Fd.joOCqBHePb1EIdGqd6.5KEFtyR.RaYi', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1515, 'AHMAD RAFIK', '1411.MTK.0318', 4, NULL, '$2y$10$shENcZ.eagFohPmPEAkPIerX935CS.HkYTHxFU5cK.8vsNNwDEYy2', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1516, 'AGUS ABDUL MALIK', '0265.MTK.0913', 4, NULL, '$2y$10$R2WnKS3Xbw4SaCWtXUDGUumP.ADXbSvKTMVvTyB8e6djcjbfuitge', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1517, 'DODDY SURYADI', '0058.MTK.0911', 2, NULL, '$2y$10$kDTXOfMVwIB2rXSrnRxb3OrGecJOALl5K0QEdky82gwEv4v1Sivv6', 1, NULL, '2021-06-15 20:22:13', '2021-06-15 20:22:13'),
(1518, 'INDAH RETNANI', '0175.MTK.0213', 6, NULL, '$2y$10$jpdu6jAnw9/o8vytc3RUROh3d9Y92uZNFiEFBnPKcaFywlkwV.aqa', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1519, 'UUM UMAYAH', '1554.MTK.0219', 6, NULL, '$2y$10$jEZ1.hMjAjXRPlQifOsDruXkOg2NpKXceOKkDyvFbtfzOKpXpTuQS', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1520, 'RD. DINDA AROFATU SYADIDAH', '1638.MTK.0519', 6, NULL, '$2y$10$tol1pMtXyvTOzBAb54YsA.lKEBXwUdzTGE4DIUE/3j8QRnV8lI6AS', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1521, 'IIS ISTICHAROH', '1436.MTK.0418', 5, NULL, '$2y$10$oJLSan2v3nC8MWmobhgoauWwEMwNJuAZEGe9o24iKD50fHo9HJB2K', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1522, 'AMAN KURNIA', '0174.MTK.0213', 4, NULL, '$2y$10$9HRmjovwZi48BaJ3.CV8a.HXH44Pvmz7Zp5dkeUI1bxrFC5IINz9e', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1523, 'RUDI MUSTOPA', '0303.MTK.1113', 4, NULL, '$2y$10$UhQbdgLSQUEuNrrCgz.9jeoqX4Iw7zRjGOh74ynqDWO5gimbSog8q', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1524, 'TATA TAHYUDIN', '0594.MTK.1115', 7, NULL, '$2y$10$roBbOW3Ix8D.VVvrsfvixeSfuSkYl2mRobHQGMKjIZqSyiOKnrwEe', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1525, 'RUDI DIANSYAH', '1339.MTK.1117', 7, NULL, '$2y$10$0IGg5vpsw159Li6jrMRpGOXTf8lJfzK5OzukP4fX4tAxcqwI6mmC.', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1526, 'CEP IMAN BUDIMAN', '0525.MTK.0915', 2, NULL, '$2y$10$n1t1lT5Kk48YEktxqqphuOI/0vQMC3zwZAVRGdllVfAoNghNHIZlG', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1527, 'IIK HIKMATURROHMAN', '1568.MTK.0319', 3, NULL, '$2y$10$dfD87AvC3H0NISsD19HTIOXe0o6aOI0lVFp6mbL6C4DtypZ.FZc2.', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1528, 'YAYA NURHIDAYAT', '0359.MTK.0914', 6, NULL, '$2y$10$w7XZ.0kwY1PUnq1ZYhtvxeShR1rSwqys.AV0LJCAWtUG0CPRvGFGu', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1529, 'YOYO SUDARAJAT', '0798.MTK.0316', 5, NULL, '$2y$10$dYEUXJoTr6gMxmKYzJQN6usuLr7PRA24KCBfxrxh/fH64yPx79dKi', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1530, 'SYLVIA INDRIANI', '0465.MTK.0715', 6, NULL, '$2y$10$NtOamu.BA9QsYCvT9nXUJ.EtIQBNPWxdy2PFcS0LrYkZAmqLulamq', 1, NULL, '2021-06-15 20:22:14', '2021-06-15 20:22:14'),
(1531, 'A NOVAL FARDIANI BASUNI', '0942.MTK.1215', 4, NULL, '$2y$10$VfutEd.d2I/4wv5ePuOJt.pdwOTC5JoavxHzxrrKYdgg1QuiLYqva', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1532, 'ADE BRIAN KRISYADHI', '1283.MTK.0717', 4, NULL, '$2y$10$nreOvl4EqIPI.1rcvU/InuqGSm9TSaH4jy.J8lCz4sBbR9S/ts/je', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1533, 'MOHAMAD SUKRON', '1548.MTK.0219', 4, NULL, '$2y$10$fli85N0A4pkLKJt2iJXi7O1w74WjmjcdH2v1WP41RJMQz9yQblqHK', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1534, 'ERWIN ZAENAL HAMZAH', '1030.MTK.0816', 7, NULL, '$2y$10$WQjQNy9mrA.mblGXaSwEquhUAd0MrMdiRJMgTSduMegabzDAJ9FyS', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1535, 'BASARI', '1480.MTK.0718', 4, NULL, '$2y$10$JfEdTrvJCpn6ZGIgr1O7ou.Nl66IvHHRgF589LfZGkneZRkcDpkSq', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1536, 'EGI SUTIANA', '1481.MTK.0718', 7, NULL, '$2y$10$CX2rUsigFI5BLpFrDTktQOuAz9BEBZZbtd9SpnnFqrtu7Z8Rb5WAy', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1537, 'FAJAR RIYADI', '0292.MTK.1113', 2, NULL, '$2y$10$onr4u2/TYJmMYFhDiA8dT.lz8NDp34pPgEU06X19xzv/Sdni8/xE6', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1538, 'AMALIA UTAMI', '1275.MTK.0617', 6, NULL, '$2y$10$dB4sEN2uQ//SXhqtDtcbrOQPg8Ni8rWBDvu3zpN0Xdw4qgQILh8U.', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1539, 'ENCI RISAWATI', '0837.MTK.0416', 6, NULL, '$2y$10$V9omBxFebB77b93CanK7kOBb/6Lyh8XgVabFOW8OR7U2OqOovIBa6', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1540, 'CHUNDA PANDITA FIBULA PUTRI', '1712.MTK.0320', 6, NULL, '$2y$10$71AJHStMIrqGemqNzK1jc.zeqDBEKnCJM5Y7cop4KfiUVndTQ2JHa', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1541, 'RAMDANI', '1552.MTK.0219', 4, NULL, '$2y$10$YUlw1is/E1/2OjZYz0H3e.0VIUdcHBjcpdA0rL/SKqXOX7exzWuNq', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1542, 'MA\'MUN SANTOSA', '1188.MTK.1116', 7, NULL, '$2y$10$IomYRYbPk/cn.JFFXDdQaeYfy02CcthEXfZlVfvbJTnR9iCAAhgL.', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1543, 'ASENG ACA', '1253.MTK.0417', 7, NULL, '$2y$10$hGyFYCEvCZOAwlNa38/NQe/vQ3lfTQi87OMBNz6Sj1ZTvna6vN7d2', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1544, 'ANDI SUWANDI', '1570.MTK.0319', 5, NULL, '$2y$10$bPzPl6KY.qqrxvR765MzEuSOKT/CwpiHfvjIglJTjMGe2k5D72kKK', 1, NULL, '2021-06-15 20:22:15', '2021-06-15 20:22:15'),
(1545, 'HASAN ASRI', '0917.MTK.0516', 6, NULL, '$2y$10$OUuObPUuebwZx5CEu4ijke05AvWzBrEAQu01EwzzorkKzVH1TbezG', 1, NULL, '2021-06-15 20:22:16', '2021-06-15 20:22:16'),
(1546, 'EDI SUYANTO', '1166.MTK.1116', 6, NULL, '$2y$10$XE9W.bMY2KZUQ47y5V87S.kj6KbW2ktsO3cMfsznwQ/E3rzs7sBHy', 1, NULL, '2021-06-15 20:22:16', '2021-06-15 20:22:16'),
(1547, 'AKHMAT IRFANI ROSBANI', '1343.MTK.1117', 6, NULL, '$2y$10$UfmKRnWbASpS5Ty/IB7C5uZcF0mg75xxUkUCQZO2l6eFG5HY1DvI2', 1, NULL, '2021-06-15 20:22:16', '2021-06-15 20:22:16'),
(1548, 'BAGUS DWI PRASETYO', '1397.MTK.0218', 6, NULL, '$2y$10$6alyGzMBuiLBhgl/zbNLO.ewA4OGalumyQh.qpMDpk.cKXwH.8tPK', 1, NULL, '2021-06-15 20:22:16', '2021-06-15 20:22:16'),
(1549, 'AJI SETIAWAN', '1429.MTK.0318', 6, NULL, '$2y$10$3Ng/f.2EnqYyZqVEVNUpKeLfFzDMahOzeO7//VF12lv6m6bj6NdNW', 1, NULL, '2021-06-15 20:22:16', '2021-06-15 20:22:16'),
(1550, 'WIDIADJI', '0118.MTK.0612', 6, NULL, '$2y$10$zO0GyhUbpc6dp6UwoeRWHODJXLbiyfE1XPsU9WVRRK2exYYjvlLDW', 1, NULL, '2021-06-15 20:22:16', '2021-06-15 20:22:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `substream`
--
ALTER TABLE `substream`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `division`
--
ALTER TABLE `division`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `event`
--
ALTER TABLE `event`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `quote`
--
ALTER TABLE `quote`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `substream`
--
ALTER TABLE `substream`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1551;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
