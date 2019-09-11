/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.62 : Database - pluto_ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pluto_ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pluto_ssm`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`NAME`,`nickname`,`phoneNum`,`email`) values (1,'张三','小三','18888888888','zs@163.com'),(2,'李四','小四','18888888888','ls@163.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderId` int(16) NOT NULL DEFAULT '0',
  `travellerId` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderId`,`travellerId`) values (1,1),(2,1),(4,1),(1,2),(2,2),(5,2),(6,2),(7,2),(9,2);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(32) DEFAULT NULL,
  `memberId` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values (1,'12345','2019-09-07 18:42:28',1,'没什么',0,1,3,2),(2,'12580','2019-03-04 12:00:00',2,'没什么',0,1,4,1),(4,'12512','2019-09-07 17:25:38',2,'没什么',0,1,3,1),(5,'17812','2019-09-07 17:26:17',2,'没什么',0,1,2,2),(6,'17882','2019-09-07 17:25:51',2,'没什么',0,1,1,1),(7,'18712','2019-09-07 17:26:10',2,'没什么',0,1,4,2),(8,'78412','2019-03-04 12:00:00',2,'没什么',0,1,4,1),(9,'78454','2019-09-07 17:26:08',2,'没什么',0,1,2,2),(10,'77864','2019-09-07 17:25:57',2,'没什么',0,1,1,1),(11,'78945','2019-03-04 12:00:00',2,'没什么',0,1,4,1),(12,'45678','2019-09-07 17:26:05',2,'没什么',0,1,3,2),(13,'12312','2019-03-04 12:00:00',2,'没什么',0,1,4,1);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`url`) values (1,'user findAll','/user/findAll.do'),(2,'user findById','/user/findById.do'),(3,'role findAll','/role/findAll.do');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` int(11) DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product` (`id`,`productNum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`DepartureTime`,`productPrice`,`productDesc`,`productStatus`) values (1,'itcast-003','上海五日游','上海','2019-09-07 14:24:18',1800,'魔都我来了',0),(2,'itcast-002','北京三日游','北京','2019-09-07 14:24:21',1200,'不错的旅行',1),(3,'itcast-001','北京三日游','北京','2019-09-07 14:24:26',1200,'不错的旅行',1),(4,'pers-xxx-001','广州一日游','西安','2019-09-07 14:25:00',8500,'无',0),(5,'pers-xxx-002','杭州一日游','西安','2019-09-10 13:27:00',9000,'无',0);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`roleDesc`) values (1,'ADMIN','vip'),(2,'USER',NULL),(3,'guest','测试角色');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` int(16) NOT NULL DEFAULT '0',
  `roleId` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`permissionId`,`roleId`) values (1,1),(2,1),(2,2),(1,3);

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `syslog` */

insert  into `syslog`(`id`,`visitTime`,`username`,`ip`,`url`,`executionTime`,`method`) values (1,'2019-09-11 22:36:22','admin','0:0:0:0:0:0:0:1','/user/findAll.do',15,'[类名] pers.pluto.controller.UserController[方法名] findAll'),(2,'2019-09-11 22:37:12','admin','0:0:0:0:0:0:0:1','/product/findAll.do',14,'[类名] pers.pluto.controller.ProductController[方法名] findAll'),(3,'2019-09-11 22:37:24','admin','0:0:0:0:0:0:0:1','/user/findAll.do',4,'[类名] pers.pluto.controller.UserController[方法名] findAll'),(4,'2019-09-11 22:37:36','admin','0:0:0:0:0:0:0:1','/user/findAll.do',2,'[类名] pers.pluto.controller.UserController[方法名] findAll'),(5,'2019-09-11 22:37:49','admin','0:0:0:0:0:0:0:1','/orders/findAll.do',0,'[类名] pers.pluto.controller.OrdersController[方法名] findAll'),(6,'2019-09-11 22:40:44','xxl','0:0:0:0:0:0:0:1','/user/findAll.do',18,'[类名] pers.pluto.controller.UserController[方法名] findAll'),(7,'2019-09-11 22:40:55','xxl','0:0:0:0:0:0:0:1','/product/findAll.do',12,'[类名] pers.pluto.controller.ProductController[方法名] findAll'),(8,'2019-09-11 22:41:05','xxl','0:0:0:0:0:0:0:1','/orders/findAll.do',163,'[类名] pers.pluto.controller.OrdersController[方法名] findAll'),(9,'2019-09-11 22:49:52','admin','0:0:0:0:0:0:0:1','/sysLog/findAll.do',17,'[类名] pers.pluto.controller.SysLogController[方法名] findAll');

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`NAME`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values (1,'张小龙','男','15555555555',0,'987654321123456789',1),(2,'夏小凉','男','15555555555',0,'987654321123456789',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`PASSWORD`,`phoneNum`,`STATUS`) values (1,'123456@163.com','admin','$2a$10$i0wpJMEdTBp7c.T..IZ0veaMhbtG1Z446k6R3Ljbm/ooZYTgiGumK','13289263675',1),(2,'qq12345@qq.com','xxl','$2a$10$JxblmyHoRcoXg.b0eO51neO2UWCNI5BcvniqZsFJze6GTOx1p5HqC','13289263675',1),(4,'qq123456@qq.com','xxl1','$2a$10$5xejibeYLC9OesxVc4DMmuXbxLZ6bvVmpHDykq0DaAeTY4ilSR0I6','13289263675',1);

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userId` int(16) NOT NULL DEFAULT '0',
  `roleId` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_role` */

insert  into `users_role`(`userId`,`roleId`) values (1,1),(1,2),(2,2),(1,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
