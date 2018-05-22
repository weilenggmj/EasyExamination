/*
Navicat MySQL Data Transfer

Source Server         : sss
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : easyexamination

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2018-05-22 14:25:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(20) DEFAULT NULL,
  `bookType` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `bookImg` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  UNIQUE KEY `usersbook_id` (`bookId`),
  KEY `user_id` (`userId`),
  CONSTRAINT `books_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------

-- ----------------------------
-- Table structure for `calendars`
-- ----------------------------
DROP TABLE IF EXISTS `calendars`;
CREATE TABLE `calendars` (
  `calendarId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `chapterId` int(11) NOT NULL,
  `time` date NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`calendarId`),
  UNIQUE KEY `calendar_plan_id` (`calendarId`),
  KEY `users_id` (`userId`),
  KEY `chapterId` (`chapterId`),
  CONSTRAINT `calendars_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `calendars_fk1` FOREIGN KEY (`chapterId`) REFERENCES `chapter` (`chapterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `chapter`
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `chapterId` int(11) NOT NULL AUTO_INCREMENT,
  `chapterNumber` int(11) NOT NULL,
  `chapterName` varchar(20) NOT NULL,
  `bookId` int(11) NOT NULL,
  PRIMARY KEY (`chapterId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `chapter_fk` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter
-- ----------------------------

-- ----------------------------
-- Table structure for `majors`
-- ----------------------------
DROP TABLE IF EXISTS `majors`;
CREATE TABLE `majors` (
  `majorId` int(11) NOT NULL AUTO_INCREMENT,
  `majorName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`majorId`),
  UNIQUE KEY `major_id` (`majorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of majors
-- ----------------------------

-- ----------------------------
-- Table structure for `marks`
-- ----------------------------
DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks` (
  `majorId` int(11) NOT NULL,
  `universityId` int(11) NOT NULL,
  `mark` varchar(20) NOT NULL,
  PRIMARY KEY (`majorId`,`universityId`),
  KEY `marks_fk1` (`universityId`),
  CONSTRAINT `marks_fk` FOREIGN KEY (`majorId`) REFERENCES `majors` (`majorId`),
  CONSTRAINT `marks_fk1` FOREIGN KEY (`universityId`) REFERENCES `universities` (`universityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marks
-- ----------------------------

-- ----------------------------
-- Table structure for `plans`
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `planId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `beginTime` date DEFAULT NULL,
  `needTime` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`planId`),
  UNIQUE KEY `book_plan_id` (`planId`),
  KEY `users_id` (`userId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `plans_fk` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`),
  CONSTRAINT `plans_fk1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plans
-- ----------------------------

-- ----------------------------
-- Table structure for `universities`
-- ----------------------------
DROP TABLE IF EXISTS `universities`;
CREATE TABLE `universities` (
  `universityId` int(11) NOT NULL AUTO_INCREMENT,
  `universityName` varchar(20) NOT NULL,
  `district` varchar(20) DEFAULT NULL,
  `information` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`universityId`),
  UNIQUE KEY `universities_id` (`universityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of universities
-- ----------------------------

-- ----------------------------
-- Table structure for `un_major`
-- ----------------------------
DROP TABLE IF EXISTS `un_major`;
CREATE TABLE `un_major` (
  `universiteid` int(11) NOT NULL,
  `majorid` int(11) NOT NULL,
  PRIMARY KEY (`universiteid`,`majorid`),
  KEY `majorid` (`majorid`),
  CONSTRAINT `un_major_ibfk_1` FOREIGN KEY (`universiteid`) REFERENCES `universities` (`universityId`),
  CONSTRAINT `un_major_ibfk_2` FOREIGN KEY (`majorid`) REFERENCES `majors` (`majorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of un_major
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userLove` varchar(20) DEFAULT NULL,
  `userImg` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`password`),
  UNIQUE KEY `userid` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'sss', 'sss', null, null);
