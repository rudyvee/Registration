CREATE DATABASE  IF NOT EXISTS `database`;
USE `database`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `students`; 
DROP TABLE IF EXISTS `courses`;
DROP TABLE IF EXISTS `professors`;
DROP TABLE IF EXISTS `teaches`;
DROP TABLE IF EXISTS `enrollment`;
DROP TABLE IF EXISTS `admin`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `admin` (
	`username` varchar(50) NOT NULL DEFAULT '',
	`password` varchar(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`username`)
);


INSERT INTO `admin` VALUES ('admin','admin');


CREATE TABLE IF NOT EXISTS `professors` (
	`pid` varchar(50) NOT NULL DEFAULT '',
	`did` varchar(50) NOT NULL DEFAULT '',
	`name` varchar(50) NOT NULL DEFAULT '',
	`phone` varchar(50) NOT NULL DEFAULT '',
    `office_id` varchar(50) NOT NULL DEFAULT '',    
	`password` varchar(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`pid`)
);



CREATE TABLE IF NOT EXISTS `students` (
	`sid` varchar(50) NOT NULL DEFAULT '',
    `name` varchar(50) NOT NULL DEFAULT '',
	`phone` varchar(50) NOT NULL DEFAULT '',
    `birthday` varchar(50) NOT NULL DEFAULT '',
	`password` varchar(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`sid`)
);


CREATE TABLE IF NOT EXISTS `courses` (
	`cid` varchar(50) NOT NULL DEFAULT '',
	`course_name` varchar(50) NOT NULL DEFAULT '',
	`number_of_credits` int NOT NULL DEFAULT 0,
	`did` varchar(50) NOT NULL DEFAULT '',
	`prerequisites` varchar(200) DEFAULT '',
	`section_number` varchar(50) NOT NULL DEFAULT '',
	`meeting_times` varchar(50) NOT NULL DEFAULT '',
    `semester` varchar(50) NOT NULL DEFAULT '',
	`pid` varchar(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`cid`),
	FOREIGN KEY (`pid`) REFERENCES professors (`pid`)
);



CREATE TABLE IF NOT EXISTS `enrollment` (
	`sid` varchar(50) NOT NULL DEFAULT '',
	`cid` varchar(50) NOT NULL DEFAULT '',
	`section_number` varchar(50) NOT NULL DEFAULT '',
	`semester` varchar(50) NOT NULL DEFAULT '',
    `grade` varchar(10),
	PRIMARY KEY (`sid`, `cid`),
    FOREIGN KEY (`sid`) REFERENCES students (`sid`),
	FOREIGN KEY (`cid`) REFERENCES courses (`cid`)
);
