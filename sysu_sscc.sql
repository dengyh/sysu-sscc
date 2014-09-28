-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-09-28 12:29:34
-- 服务器版本： 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sysu_sscc`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can view group', 2, 'view_group'),
(11, 'Can view permission', 1, 'view_permission'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add site', 6, 'add_site'),
(22, 'Can change site', 6, 'change_site'),
(23, 'Can delete site', 6, 'delete_site'),
(24, 'Can view site', 6, 'view_site'),
(25, 'Can add 队伍', 7, 'add_team'),
(26, 'Can change 队伍', 7, 'change_team'),
(27, 'Can delete 队伍', 7, 'delete_team'),
(28, 'Can add 队员', 8, 'add_member'),
(29, 'Can change 队员', 8, 'change_member'),
(30, 'Can delete 队员', 8, 'delete_member'),
(31, 'Can add 队伍材料', 9, 'add_profile'),
(32, 'Can change 队伍材料', 9, 'change_profile'),
(33, 'Can delete 队伍材料', 9, 'delete_profile'),
(34, 'Can view 队伍', 7, 'view_team'),
(35, 'Can view 队伍材料', 9, 'view_profile'),
(36, 'Can view 队员', 8, 'view_member'),
(37, 'Can add 栏目', 10, 'add_section'),
(38, 'Can change 栏目', 10, 'change_section'),
(39, 'Can delete 栏目', 10, 'delete_section'),
(40, 'Can add 轮播图片', 11, 'add_picture'),
(41, 'Can change 轮播图片', 11, 'change_picture'),
(42, 'Can delete 轮播图片', 11, 'delete_picture'),
(43, 'Can add 附件', 12, 'add_submission'),
(44, 'Can change 附件', 12, 'change_submission'),
(45, 'Can delete 附件', 12, 'delete_submission'),
(46, 'Can view 栏目', 10, 'view_section'),
(47, 'Can view 轮播图片', 11, 'view_picture'),
(48, 'Can view 附件', 12, 'view_submission'),
(49, 'Can add log entry', 13, 'add_logentry'),
(50, 'Can change log entry', 13, 'change_logentry'),
(51, 'Can delete log entry', 13, 'delete_logentry'),
(52, 'Can view log entry', 13, 'view_logentry'),
(53, 'Can add Bookmark', 14, 'add_bookmark'),
(54, 'Can change Bookmark', 14, 'change_bookmark'),
(55, 'Can delete Bookmark', 14, 'delete_bookmark'),
(56, 'Can add User Setting', 15, 'add_usersettings'),
(57, 'Can change User Setting', 15, 'change_usersettings'),
(58, 'Can delete User Setting', 15, 'delete_usersettings'),
(59, 'Can add User Widget', 16, 'add_userwidget'),
(60, 'Can change User Widget', 16, 'change_userwidget'),
(61, 'Can delete User Widget', 16, 'delete_userwidget'),
(62, 'Can view Bookmark', 14, 'view_bookmark'),
(63, 'Can view User Setting', 15, 'view_usersettings'),
(64, 'Can view User Widget', 16, 'view_userwidget');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$10000$IBe3l81xSAHo$ufJwtUJ9x7HjM/bqR8+rWhREZWiKZnEXTjWPHBrKYVA=', '2014-09-28 09:43:16', 1, 'dengyh', '', '', 'dengyh071@gmail.com', 1, 1, '2014-09-26 13:50:39'),
(10, 'pbkdf2_sha256$10000$e864Zba0KvvG$dDBCUh50TgBhIZtOP4tzkgSe13dYTPF+DGrLPts3ZwA=', '2014-09-28 05:51:30', 0, '12330071', '', '', '', 0, 1, '2014-09-27 15:31:25'),
(14, 'pbkdf2_sha256$10000$VirNJDpZqf1N$IbcpBeKThWV6gjW3ezSO7KH5rIBfrz9Y/IEKhn8zBpE=', '2014-09-28 04:45:06', 0, '11335071', '', '', '', 0, 1, '2014-09-27 19:22:20'),
(18, 'pbkdf2_sha256$10000$cJ4efP2ytsnv$nPaYS1a6bR2raQzjmg0US9mBm/zcrz1j+fQ6xAB3aic=', '2014-09-28 05:33:56', 0, '224234', '', '', '', 0, 1, '2014-09-28 05:33:55'),
(19, 'pbkdf2_sha256$10000$kbmH7CobvcgK$Z5no6UyIGfuKNPuF+iw9Z9UycDjtDGyOK6AMy1WFDEs=', '2014-09-28 05:34:57', 0, 'sadfsad', '', '', '', 0, 1, '2014-09-28 05:34:57');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, '队伍', 'team', 'team'),
(8, '队员', 'team', 'member'),
(9, '队伍材料', 'team', 'profile'),
(10, '栏目', 'section', 'section'),
(11, '轮播图片', 'section', 'picture'),
(12, '附件', 'section', 'submission'),
(13, 'log entry', 'admin', 'logentry'),
(14, 'Bookmark', 'xadmin', 'bookmark'),
(15, 'User Setting', 'xadmin', 'usersettings'),
(16, 'User Widget', 'xadmin', 'userwidget');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8ghp0b12e333wdgq0egbsw02s24lmhnx', 'YWIzNWY2ZjkyZDRjNmU0Y2EyOTVmNDdjZGU2MmIwMzMzNTIzMDhjNjqAAn1xAShVCkxJU1RfUVVFUllYBAAAAHRlYW1xAlUGbWVtYmVycQOGcQRVAIZVDV9hdXRoX3VzZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==', '2014-10-12 09:47:20');

-- --------------------------------------------------------

--
-- 表的结构 `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- 表的结构 `section_picture`
--

CREATE TABLE IF NOT EXISTS `section_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `section_picture`
--

INSERT INTO `section_picture` (`id`, `url`, `description`) VALUES
(1, 'pictures/contest1.jpg', '比赛报名已经开始了，赶紧报名吧！丰厚奖品和奖金等着你哦。'),
(2, 'pictures/contest2.jpg', '比赛报名已经开始了，赶紧报名吧！丰厚奖品和奖金等着你哦。'),
(3, 'pictures/contest3.jpg', '比赛报名已经开始了，赶紧报名吧！丰厚奖品和奖金等着你哦。'),
(4, 'pictures/contest4.jpg', '比赛报名已经开始了，赶紧报名吧！丰厚奖品和奖金等着你哦。'),
(5, 'pictures/contest5.jpg', '比赛报名已经开始了，赶紧报名吧！丰厚奖品和奖金等着你哦。'),
(6, 'pictures/contest6.jpg', '比赛报名已经开始了，赶紧报名吧！丰厚奖品和奖金等着你哦。'),
(7, 'pictures/contest7.jpg', '比赛报名已经开始了，赶紧报名吧！丰厚奖品和奖金等着你哦。');

-- --------------------------------------------------------

--
-- 表的结构 `section_section`
--

CREATE TABLE IF NOT EXISTS `section_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `section_section`
--

INSERT INTO `section_section` (`id`, `title`, `content`, `time`) VALUES
(1, '大赛公告', '<h4>大赛简介：</h4>\r\n    <p>中山大学软件创新设计大赛是由共青团中山大学委员会、中山大学校学生处、中山大学软件学院共同主办，中山大学学生软件技术发展中心承办的一项大型赛事。本届比赛是第十届，以“智能生活”为主题，大赛理念为“创意→创新→创业”。大赛面向全校学生，各院系各年级的学生都可以参加。</p>\r\n\r\n    <h4>大赛赛程:</h4> \r\n    <p>2014年9月至2014年12月</p>\r\n\r\n    <h4>大赛奖励:</h4>\r\n    <p>（保研加分范围限于软件学院）</p>\r\n    <p>（以下综合测评加分限于软件学院，其他学院均会认可，请队伍自行询问自己本学院教务员老师加分情况）</p>\r\n    <p>一等奖10000（1名） </p>\r\n    <p>二等奖6000（2名）</p>\r\n    <p>三等奖4000（3名）</p>\r\n    <p>最佳人气奖 1名</p>\r\n    <p>优胜奖6名</p>\r\n    <p>最佳学员奖 4名</p>\r\n    <p>唯品会单项奖：需选择唯品会选题，获奖队伍1支，奖金3000元，获得唯品会实习就业机会，无额外加分。</p>\r\n    <p>特别命题奖：题目由企业设立，奖金视企业标准而定，无额外加分</p>\r\n    <p>最具潜力奖：若干，现场企业嘉宾如有意愿继续与项目团队深入合作，参赛团队可获此奖励，无额外加分及奖金。</p>\r\n    <p>微软特别奖：需选择微软云开发，获奖队伍1支，微软将颁发证书。</p>\r\n    <p>决赛选择微软云的队伍中排名第一的参赛队伍直接进入ImagineCup广州区总决赛，中国区半决赛。</p>\r\n   \r\n    <h4>*唯品会选题：</h4>\r\n    <p>选题：移动APP&智能服务</p>\r\n    <h4>涉及范围：</h4>\r\n    <p>1. 创新移动APP，移动技术应用方向：移动终端产品、创新工具、创新游戏等等</p>\r\n    <p>2. 智能服务，大数据与云计算技术应用方向：大数据应用、云计算应用、商业智能应用</p>\r\n    <p>（应用包括但不限于算法及工具等）、新客导流、社区运营等等。</p>\r\n\r\n    <h4>大赛资助：</h4>\r\n    <p>通过复赛的新项目（之前未参加过其他任何比赛项目）如在院级立项，无论获奖与否，结项后给予200元的开发经费支持，比赛结束后凭发票报销（收据不予受理）。<br></p>\r\n\r\n    <h4>大赛答疑：</h4>\r\n    <p>大赛答疑邮箱：center_ssic@163.com</p>\r\n    <p>大家有疑问随时可以向答疑邮箱发邮件，我们除了集中答疑时间21:00-23:00外，也会在其他时间尽快处理邮件。</p>\r\n    <p>由于Q群答疑可能会给选手造成误导，给参赛队伍造成诸多不便，本次大赛取消Q群答疑。如有问题，请参赛队伍移驾到答疑邮箱。谢谢！</p>', '2014-09-27 16:26:23'),
(3, '大赛规则', '<ul class="list-group">\r\n<li class="list-group-item">参赛对象及组队要求：</li>\r\n<li class="list-group-item">1)本次大赛的主题是“智能生活”，请参赛同学围绕主题寻找灵感与创意，进行创新设计。</li>\r\n<li class="list-group-item">2)大赛面向全校学生，对于软件设计有想法并有能力完成项目的同学均可报名参加。</li>\r\n<li class="list-group-item">3)每支队伍人数下限为 3 人，上限为 6 人。</li>\r\n<li class="list-group-item">4)每人最多参与两支队伍，且仅能担任其中一支队伍的队长。</li>\r\n</ul>', '2014-09-27 16:25:49'),
(4, '参赛流程', '<ul class="list-group">\r\n          <li class="list-group-item">* 报名</li>\r\n        </ul>\r\n        <ul class="list-group">\r\n          <li class="list-group-item">* 初审阶段</li>\r\n          <li class="list-group-item">· 开题报告上传</li>\r\n          <li class="list-group-item">· 老师初审点评</li>\r\n          <li class="list-group-item">· 查看点评结果</li>\r\n        </ul>\r\n        <ul class="list-group">\r\n          <li class="list-group-item">·* 初赛阶段</li>\r\n          <li class="list-group-item"> · 资料上传</li>\r\n          <li class="list-group-item">· 在线抽签</li>\r\n          <li class="list-group-item">· 校验展示材料</li>\r\n          <li class="list-group-item">· 现场展示</li>\r\n          <li class="list-group-item">· 赛果公布</li>\r\n        </ul>\r\n        <ul class="list-group">\r\n          <li class="list-group-item">* 复活赛资格评审</li>\r\n        </ul>\r\n        <ul class="list-group">\r\n          <li class="list-group-item">* 复赛阶段</li>\r\n          <li class="list-group-item">· 资料上传</li>\r\n          <li class="list-group-item">· 在线抽签</li>\r\n          <li class="list-group-item">· 校验展示材料</li>\r\n          <li class="list-group-item">· 现场展示</li>\r\n          <li class="list-group-item">· 赛果公布</li>\r\n        </ul>\r\n        <ul class="list-group">\r\n          <li class="list-group-item">* 复活赛阶段</li>\r\n          <li class="list-group-item">· 资料提交</li>\r\n          <li class="list-group-item">· 产品展投票</li>\r\n          <li class="list-group-item">· 网投</li>\r\n          <li class="list-group-item">· 复活结果公布</li>\r\n        </ul>\r\n        <ul class="list-group">\r\n          <li class="list-group-item">* 决赛阶段</li>\r\n          <li class="list-group-item">· 资料上传</li>\r\n          <li class="list-group-item">· 在线抽签</li>\r\n          <li class="list-group-item">· 校验材料</li>\r\n          <li class="list-group-item">· 现场展示</li>\r\n          <li class="list-group-item">· 赛果公布</li>\r\n        </ul>', '2014-09-27 16:26:44');

-- --------------------------------------------------------

--
-- 表的结构 `section_submission`
--

CREATE TABLE IF NOT EXISTS `section_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `team_member`
--

CREATE TABLE IF NOT EXISTS `team_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isLeader` tinyint(1) NOT NULL,
  `name` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `cornet` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `dormitory` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `sno` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `collage` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `major` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `sclass` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_member_95e8aaa1` (`team_id`),
  KEY `team_member_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `team_member`
--

INSERT INTO `team_member` (`id`, `team_id`, `user_id`, `isLeader`, `name`, `email`, `phone`, `cornet`, `qq`, `dormitory`, `sno`, `collage`, `major`, `sclass`, `gender`) VALUES
(3, 5, 10, 1, '邓宇恒', 'dengyh071@gmail.com', '13824418154', '638154', '1041204020', '至善园二栋225', '12330071', '软件学院', '软件工程', '12级2班', 'male'),
(4, 5, 14, 0, '黄伟鹏', '2385367768@qq.com', '13570416429', '672975', '2385367768', '至二203', '11335071', '软件学院', '数字媒体', NULL, 'male'),
(8, 10, 14, 1, 'DDP', 'dengyh071@gmail.com', '13824418154', '638154', '1041204020', '至善园二栋225', '11335071', '软件学院', '软件工程', '12级2班', 'male'),
(9, 10, 10, 0, '邓宇恒', 'dengyh071@gmail.com', '13824418154', '638154', '1041204020', '至二225', '12330071', '软件学院', '软件工程', '12级1班', 'male'),
(10, 11, 18, 1, '哈哈', 'dengyh071@gmail.com', '324234', '234234', '234234', '2432423', '224234', '234234', '141243', '32432', 'male'),
(11, 12, 19, 1, 'fasdfasd', 'fsadfsdaf', 'fasdf', 'sdafasd', 'sdafsad', 'fsadfsadf', 'sadfsad', 'fsdaf', 'sadfsadf', 'sdafsad', 'male');

-- --------------------------------------------------------

--
-- 表的结构 `team_profile`
--

CREATE TABLE IF NOT EXISTS `team_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `file` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_profile_95e8aaa1` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `team_team`
--

CREATE TABLE IF NOT EXISTS `team_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `teacher` varchar(64) COLLATE utf8_bin NOT NULL,
  `number` varchar(16) COLLATE utf8_bin NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `status` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `team_team_3a82c675` (`leader_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `team_team`
--

INSERT INTO `team_team` (`id`, `name`, `leader_id`, `teacher`, `number`, `isActive`, `status`) VALUES
(5, '登山包', NULL, '郭嵩山', '', 1, '参赛人数不足'),
(10, '大傻逼', NULL, '人讲涛', '', 0, '参赛人员不足'),
(11, '你妹', NULL, '正规冯', '', 0, '参赛人员不足'),
(12, 'safsdafsd', NULL, 'sadfsadfas', '', 0, '参赛人员不足');

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_bookmark`
--

CREATE TABLE IF NOT EXISTS `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_bin NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_usersettings`
--

CREATE TABLE IF NOT EXISTS `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xadmin_usersettings`
--

INSERT INTO `xadmin_usersettings` (`id`, `user_id`, `key`, `value`) VALUES
(1, 1, 'dashboard:home:pos', '');

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_userwidget`
--

CREATE TABLE IF NOT EXISTS `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `widget_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `team_member`
--
ALTER TABLE `team_member`
  ADD CONSTRAINT `user_id_refs_id_cd50e2ac` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `team_id_refs_id_42388d61` FOREIGN KEY (`team_id`) REFERENCES `team_team` (`id`);

--
-- 限制表 `team_profile`
--
ALTER TABLE `team_profile`
  ADD CONSTRAINT `team_id_refs_id_682c7810` FOREIGN KEY (`team_id`) REFERENCES `team_team` (`id`);

--
-- 限制表 `team_team`
--
ALTER TABLE `team_team`
  ADD CONSTRAINT `leader_id_refs_id_8c396e49` FOREIGN KEY (`leader_id`) REFERENCES `team_member` (`id`);

--
-- 限制表 `xadmin_bookmark`
--
ALTER TABLE `xadmin_bookmark`
  ADD CONSTRAINT `content_type_id_refs_id_af66fd92` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_91d2dce8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `xadmin_usersettings`
--
ALTER TABLE `xadmin_usersettings`
  ADD CONSTRAINT `user_id_refs_id_a4128191` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `xadmin_userwidget`
--
ALTER TABLE `xadmin_userwidget`
  ADD CONSTRAINT `user_id_refs_id_97371ff7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
