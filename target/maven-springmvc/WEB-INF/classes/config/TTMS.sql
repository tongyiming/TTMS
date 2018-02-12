-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: ttms
-- ------------------------------------------------------
-- Server version	5.7.12

DROP DATABASE IF EXISTS `ttms`; 
CREATE DATABASE `ttms`;
USE `ttms`;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `film_type` varchar(100) NOT NULL COMMENT '影片类型',
  `file_status` int(11) DEFAULT NULL COMMENT '影片状态 1正在上映 2即将上映 3已经上映',
  `name` varchar(100) NOT NULL COMMENT '影片名',
  `lang` varchar(20) NOT NULL COMMENT '语种',
  `length` int(11) DEFAULT NULL COMMENT '播放长度',
  `introduction` varchar(2000) DEFAULT NULL COMMENT '影片描述',
  `ticket_price` int(11) DEFAULT NULL COMMENT '票价',
  `cover` varchar(50) NOT NULL COMMENT '影片封面图',
  `picture_1` varchar(50) DEFAULT NULL COMMENT '影片剧照1',
  `picture_2` varchar(50) DEFAULT NULL COMMENT '影片剧照2',
  `picture_3` varchar(50) DEFAULT NULL COMMENT '影片剧照3',
  `picture_4` varchar(50) DEFAULT NULL COMMENT '影片剧照4',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='影片实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `studio_id` int(11) NOT NULL COMMENT '放映厅id',
  `film_id` int(11) NOT NULL COMMENT '影片id',
  `sche_time` datetime NOT NULL COMMENT '演出时间',
  `sche_ticket_price` int(11) NOT NULL COMMENT '票价',
  PRIMARY KEY (`id`),
  KEY `studio_id` (`studio_id`),
  KEY `film_id` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='演出计划实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `studio_id` int(11) NOT NULL COMMENT '所属放映厅id',
  `seat_row` int(11) DEFAULT NULL COMMENT '座位行号',
  `seat_col` int(11) DEFAULT NULL COMMENT '座位列号',
  `seat_status` int(11) DEFAULT NULL COMMENT '座位状态 1使用状态 2 损坏状态 3空置状态',
  PRIMARY KEY (`id`),
  KEY `studio_id` (`studio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='座位实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '放映厅名称',
  `studio_row_count` int(11) DEFAULT NULL COMMENT '座位行数',
  `studio_col_count` int(11) DEFAULT NULL COMMENT '座位列数',
  `studio_introduction` varchar(2000) DEFAULT NULL COMMENT '放映厅介绍',
  `studio_status` int(11) DEFAULT NULL COMMENT '放映厅状态 1使用状态 2空闲状态 3损坏状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='放映厅实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `seat_id` int(11) NOT NULL COMMENT '座位id',
  `sche_id` int(11) NOT NULL COMMENT '演出计划id',
  `ticket_price` int(11) NOT NULL COMMENT '票价',
  `ticket_status` int(11) DEFAULT NULL COMMENT '票状态 1已支付 2已退票',
  PRIMARY KEY (`id`),
  KEY `seat_id` (`seat_id`),
  KEY `sche_id` (`sche_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='票实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `callphone` varchar(20) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `callphone` (`callphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-22 11:59:28
