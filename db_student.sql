/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : db_student

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2018-04-21 00:05:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s_admin`
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin` VALUES ('1', 'admin', '1', '2018-03-17 14:24:09');

-- ----------------------------
-- Table structure for `s_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `s_attendance`;
CREATE TABLE `s_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `attendance_date` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_attendance_foreign` (`student_id`),
  KEY `course_attendance_foreign` (`course_id`),
  CONSTRAINT `course_attendance_foreign` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`),
  CONSTRAINT `student_attendance_foreign` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_attendance
-- ----------------------------
INSERT INTO `s_attendance` VALUES ('1', '1', '1', '2018-05-17');
INSERT INTO `s_attendance` VALUES ('2', '1', '1', '2018-04-17');
INSERT INTO `s_attendance` VALUES ('3', '1', '4', '2018-04-17');
INSERT INTO `s_attendance` VALUES ('4', '1', '3', '2018-04-17');
INSERT INTO `s_attendance` VALUES ('5', '1', '1', '2018-04-18');
INSERT INTO `s_attendance` VALUES ('6', '1', '4', '2018-04-18');
INSERT INTO `s_attendance` VALUES ('7', '1', '3', '2018-04-18');
INSERT INTO `s_attendance` VALUES ('8', '4', '1', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('9', '4', '2', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('10', '4', '6', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('11', '4', '4', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('12', '3', '1', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('15', '3', '4', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('16', '1', '1', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('17', '1', '4', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('18', '1', '3', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('19', '1', '2', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('20', '3', '6', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('21', '3', '5', '2018-04-19');
INSERT INTO `s_attendance` VALUES ('22', '1', '1', '2018-04-20');
INSERT INTO `s_attendance` VALUES ('23', '1', '4', '2018-04-20');
INSERT INTO `s_attendance` VALUES ('24', '1', '3', '2018-04-20');

-- ----------------------------
-- Table structure for `s_class`
-- ----------------------------
DROP TABLE IF EXISTS `s_class`;
CREATE TABLE `s_class` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `info` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_class
-- ----------------------------
INSERT INTO `s_class` VALUES ('2', '软件一班', '这是软件一班。');
INSERT INTO `s_class` VALUES ('6', '的撒旦', '的撒旦');
INSERT INTO `s_class` VALUES ('7', '奋斗的公司的', '');
INSERT INTO `s_class` VALUES ('9', '大撒333', '');

-- ----------------------------
-- Table structure for `s_course`
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `teacher_id` int(5) NOT NULL,
  `max_student_num` int(3) NOT NULL,
  `info` varchar(512) DEFAULT NULL,
  `selected_num` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teacher_foreign` (`teacher_id`),
  CONSTRAINT `teacher_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `s_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_course
-- ----------------------------
INSERT INTO `s_course` VALUES ('1', '大学数学', '3', '50', '数学课程', '3');
INSERT INTO `s_course` VALUES ('2', '大学英语', '4', '45', '大英3', '3');
INSERT INTO `s_course` VALUES ('3', '原子弹原理技术', '5', '66', '制造原子弹技术，很牛逼！', '1');
INSERT INTO `s_course` VALUES ('4', '软件工程', '3', '66', '666', '3');
INSERT INTO `s_course` VALUES ('5', '计算机原理', '4', '45', '计算机组成原理，非常重要。', '1');
INSERT INTO `s_course` VALUES ('6', '人工智能', '5', '2', '人工智能课程。', '2');

-- ----------------------------
-- Table structure for `s_selected_course`
-- ----------------------------
DROP TABLE IF EXISTS `s_selected_course`;
CREATE TABLE `s_selected_course` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) DEFAULT NULL,
  `course_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_foreign` (`student_id`),
  KEY `course_foreign` (`course_id`),
  CONSTRAINT `course_foreign` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`),
  CONSTRAINT `student_foreign` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_selected_course
-- ----------------------------
INSERT INTO `s_selected_course` VALUES ('12', '1', '1');
INSERT INTO `s_selected_course` VALUES ('13', '1', '4');
INSERT INTO `s_selected_course` VALUES ('14', '1', '3');
INSERT INTO `s_selected_course` VALUES ('15', '3', '1');
INSERT INTO `s_selected_course` VALUES ('16', '3', '6');
INSERT INTO `s_selected_course` VALUES ('17', '3', '5');
INSERT INTO `s_selected_course` VALUES ('18', '3', '2');
INSERT INTO `s_selected_course` VALUES ('19', '4', '1');
INSERT INTO `s_selected_course` VALUES ('20', '4', '2');
INSERT INTO `s_selected_course` VALUES ('21', '1', '2');
INSERT INTO `s_selected_course` VALUES ('22', '3', '4');
INSERT INTO `s_selected_course` VALUES ('23', '4', '6');
INSERT INTO `s_selected_course` VALUES ('24', '4', '4');

-- ----------------------------
-- Table structure for `s_student`
-- ----------------------------
DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `classId` int(5) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_foreign` (`classId`),
  CONSTRAINT `class_foreign` FOREIGN KEY (`classId`) REFERENCES `s_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_student
-- ----------------------------
INSERT INTO `s_student` VALUES ('1', '张三', '2', '1', '女');
INSERT INTO `s_student` VALUES ('3', '李四', '6', '11', '女');
INSERT INTO `s_student` VALUES ('4', '王麻子', '7', '1', '保密');

-- ----------------------------
-- Table structure for `s_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `s_teacher`;
CREATE TABLE `s_teacher` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `title` varchar(32) NOT NULL,
  `age` int(5) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_teacher
-- ----------------------------
INSERT INTO `s_teacher` VALUES ('3', '张三', '男', '教授', '35', '1');
INSERT INTO `s_teacher` VALUES ('4', '李四', '男', '博导', '58', '222');
INSERT INTO `s_teacher` VALUES ('5', '王麻子', '男', '讲师', '28', '000000');
