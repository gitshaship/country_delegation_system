/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3307
 Source Schema         : laravel

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 31/07/2020 11:38:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `skill` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `participants` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO `activities` VALUES (4, 1, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2,3');
INSERT INTO `activities` VALUES (5, 2, 'diving', 'butterfly style', '2010-10-29', '2010-10-30', '1');
INSERT INTO `activities` VALUES (6, 3, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2');
INSERT INTO `activities` VALUES (7, 1, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2,2');
INSERT INTO `activities` VALUES (8, 2, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2');
INSERT INTO `activities` VALUES (9, 3, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2,3');
INSERT INTO `activities` VALUES (10, 1, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2,3');
INSERT INTO `activities` VALUES (11, 2, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2,3');
INSERT INTO `activities` VALUES (12, 3, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2,3');
INSERT INTO `activities` VALUES (13, 1, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1,2,3');
INSERT INTO `activities` VALUES (14, 1, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '3');
INSERT INTO `activities` VALUES (15, 2, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1');
INSERT INTO `activities` VALUES (16, 2, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1');
INSERT INTO `activities` VALUES (17, 2, 'swimming', 'butterfly style', '2010-10-29', '2010-10-30', '1');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (3, '2020_07_28_083045_create_students_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000001_create_oauth_auth_codes_table', 2);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000002_create_oauth_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2);
INSERT INTO `migrations` VALUES (7, '2016_06_01_000004_create_oauth_clients_table', 2);
INSERT INTO `migrations` VALUES (8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
INSERT INTO `migrations` VALUES (9, '2020_07_29_061248_add_new_fields_to_users_table', 3);
INSERT INTO `migrations` VALUES (10, '2020_07_29_084239_create_skills_table', 4);
INSERT INTO `migrations` VALUES (11, '2020_07_29_085944_create_activities_table', 5);

-- ----------------------------
-- Table structure for skills
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skills
-- ----------------------------
INSERT INTO `skills` VALUES (1, 'swimming', NULL, NULL);
INSERT INTO `skills` VALUES (2, 'table_tennis', NULL, NULL);
INSERT INTO `skills` VALUES (3, 'computer', NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `users_api_token_unique`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'pj56', 'shashi', 's45jayaweera92@gmail.com', NULL, '$2y$10$Fp.dIZmz5PsvKr7mEVNzgO/EKVX/F4dH9y3ciGjZfDD1YkFkFqzdW', 'expert', '2', NULL, NULL, '2020-07-29 06:01:13', '2020-07-29 06:01:13');
INSERT INTO `users` VALUES (2, 'sjayaweera', 'shashi', 'sjayaweera92@gmail.com', NULL, '$2y$10$wEmQo3aS7umkUVUGYmyWQOWN5nyDwcDp04iXeMXZOUbP5lmnLpIBS', 'board', '3', 'agmCCM8136VOr0VYkvxCot0LjH9H8AgfJsb1ktB3nGKpeFTAJX46l8l2zXEE', NULL, '2020-07-29 06:28:40', '2020-07-31 01:28:08');
INSERT INTO `users` VALUES (4, 'sjayaweera34', 'shashi', 'pj657@gmail.com', NULL, '$2y$10$473qrqzic0nxuBoL3AAFm.D5xv4IoHwgNbkdtrHOEJFwekiVN7HPC', 'trainer', '1', NULL, NULL, '2020-07-29 13:08:37', '2020-07-29 13:08:37');
INSERT INTO `users` VALUES (5, 'sjayaweera89', 'samodha', 'pj6579@gmail.com', NULL, '$2y$10$7HV.ORSV/2Y.ao8T9UH4IO79yBPol4iwceDZQFb7.W6wTR1AOss9e', 'trainer', '', NULL, NULL, '2020-07-30 00:31:48', '2020-07-30 00:31:48');

SET FOREIGN_KEY_CHECKS = 1;
