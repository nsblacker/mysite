/*
 Navicat MySQL Data Transfer

 Source Server         : djangodatabase
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : djangodatabase

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 08/31/2017 17:29:44 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_permission`
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add choice', '1', 'add_choice'), ('2', 'Can change choice', '1', 'change_choice'), ('3', 'Can delete choice', '1', 'delete_choice'), ('4', 'Can add question', '2', 'add_question'), ('5', 'Can change question', '2', 'change_question'), ('6', 'Can delete question', '2', 'delete_question'), ('7', 'Can add log entry', '3', 'add_logentry'), ('8', 'Can change log entry', '3', 'change_logentry'), ('9', 'Can delete log entry', '3', 'delete_logentry'), ('10', 'Can add permission', '4', 'add_permission'), ('11', 'Can change permission', '4', 'change_permission'), ('12', 'Can delete permission', '4', 'delete_permission'), ('13', 'Can add group', '5', 'add_group'), ('14', 'Can change group', '5', 'change_group'), ('15', 'Can delete group', '5', 'delete_group'), ('16', 'Can add user', '6', 'add_user'), ('17', 'Can change user', '6', 'change_user'), ('18', 'Can delete user', '6', 'delete_user'), ('19', 'Can add content type', '7', 'add_contenttype'), ('20', 'Can change content type', '7', 'change_contenttype'), ('21', 'Can delete content type', '7', 'delete_contenttype'), ('22', 'Can add session', '8', 'add_session'), ('23', 'Can change session', '8', 'change_session'), ('24', 'Can delete session', '8', 'delete_session');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_user`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$hc6Gu2J8jSmJ$sV9MctvQmd/n7ph9vT6pkNmqa1g+J4UFhTjrdrMPEjM=', '2017-08-31 05:53:57.323263', '1', 'nsblacker', '', '', 'nsblacker@163.com', '1', '1', '2017-08-31 05:53:31.354964');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_admin_log`
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES ('1', '2017-08-31 05:56:47.118845', '2', 'What\'s next?', '2', '[{\"changed\": {\"fields\": [\"pub_date\"]}}]', '2', '1'), ('2', '2017-08-31 06:10:48.791855', '8', 'Choice_What\'s new', '1', '[{\"added\": {}}]', '1', '1'), ('3', '2017-08-31 06:10:53.952352', '8', 'Choice_What\'s new', '2', '[{\"changed\": {\"fields\": [\"votes\"]}}]', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('3', 'admin', 'logentry'), ('5', 'auth', 'group'), ('4', 'auth', 'permission'), ('6', 'auth', 'user'), ('7', 'contenttypes', 'contenttype'), ('1', 'polls', 'choice'), ('2', 'polls', 'question'), ('8', 'sessions', 'session');
COMMIT;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_migrations`
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-08-30 02:04:18.067974'), ('2', 'auth', '0001_initial', '2017-08-30 02:04:18.405587'), ('3', 'admin', '0001_initial', '2017-08-30 02:04:18.483883'), ('4', 'admin', '0002_logentry_remove_auto_add', '2017-08-30 02:04:18.516044'), ('5', 'contenttypes', '0002_remove_content_type_name', '2017-08-30 02:04:18.584114'), ('6', 'auth', '0002_alter_permission_name_max_length', '2017-08-30 02:04:18.608330'), ('7', 'auth', '0003_alter_user_email_max_length', '2017-08-30 02:04:18.635296'), ('8', 'auth', '0004_alter_user_username_opts', '2017-08-30 02:04:18.647205'), ('9', 'auth', '0005_alter_user_last_login_null', '2017-08-30 02:04:18.673925'), ('10', 'auth', '0006_require_contenttypes_0002', '2017-08-30 02:04:18.676297'), ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-08-30 02:04:18.686467'), ('12', 'auth', '0008_alter_user_username_max_length', '2017-08-30 02:04:18.716573'), ('13', 'polls', '0001_initial', '2017-08-30 02:04:18.800912'), ('14', 'sessions', '0001_initial', '2017-08-30 02:04:18.839703');
COMMIT;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_session`
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('5f528dvqystp5sfzlyghe78p9t5g77g7', 'MWM3MTgzZmNiNjQ0MDU0YTc3YmI4N2RhZTg5OWM5NmU5OWJkNmEwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjk4ZmZhNDcyMzFmODE5Y2YyNTBhNTBlOGY1NmVjZjRkMDFkNTBiIn0=', '2017-09-14 05:53:57.327938');
COMMIT;

-- ----------------------------
--  Table structure for `polls_choice`
-- ----------------------------
DROP TABLE IF EXISTS `polls_choice`;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`),
  CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `polls_choice`
-- ----------------------------
BEGIN;
INSERT INTO `polls_choice` VALUES ('1', 'Not much', '0', '1'), ('2', 'The sky', '0', '1'), ('3', 'The sky', '0', '1'), ('4', 'Not much2', '11', '2'), ('5', 'The sky2', '2', '2'), ('6', 'Not much3', '1', '3'), ('7', 'The Sky3', '0', '3'), ('8', 'Choice_What\'s new', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `polls_question`
-- ----------------------------
DROP TABLE IF EXISTS `polls_question`;
CREATE TABLE `polls_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `polls_question`
-- ----------------------------
BEGIN;
INSERT INTO `polls_question` VALUES ('1', 'What\'s new?', '2017-08-30 02:15:21.995748'), ('2', 'What\'s next?', '2017-08-31 12:00:00.000000'), ('3', 'What\'s the point for this issue?', '2017-08-30 02:19:44.945896');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
