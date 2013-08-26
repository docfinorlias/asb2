
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ach_list
-- ----------------------------
DROP TABLE IF EXISTS `ach_list`;
CREATE TABLE `ach_list` (
  `idx` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NULL DEFAULT NULL COMMENT 'Время внесения ачивки в базу',
  `ach_id` int(5) unsigned DEFAULT NULL COMMENT 'Индекс ачивки',
  `mapId` varchar(60) DEFAULT '*' COMMENT 'ID карты на которой назрешена ачивка. * - любая карта',
  `ach_name` varchar(60) DEFAULT NULL COMMENT 'Полное наименование ачивки',
  `requirement` int(11) unsigned DEFAULT '1' COMMENT 'Количество раз, сколько надо выполнить что-то для получения этой ачивки',
  `ach_difficulty` varchar(10) DEFAULT NULL COMMENT 'Индекс сложности (Hard, Insane, Brutal)',
  `ach_points` int(5) DEFAULT '0' COMMENT 'Очки за ачивку на данной сложности',
  `user_name` varchar(100) DEFAULT NULL COMMENT 'Кем внесена ачивка (ник)',
  `css_id` varchar(100) DEFAULT NULL COMMENT 'Имя CSS-класса определяемого в стилях',
  `css_style` varchar(100) DEFAULT '' COMMENT 'CSS класс для сайта',
  `order_output` int(3) DEFAULT NULL COMMENT 'Порядок вывода этой ачивки (элемента) на сайт',
  `ru_description` text COMMENT 'Описание ачивки на русском',
  `en_description` text COMMENT 'Описание ачивки на английском',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ach_list
-- ----------------------------
INSERT INTO `ach_list` VALUES ('1', '2012-05-06 23:40:16', '1', '*', 'Mission Complete', '1', 'Hard', '4', 'Zak', 'mission-complete', 'achievment-big', '1', '<p>Успешное завершение миссии</p>', 'Mission Complete');
INSERT INTO `ach_list` VALUES ('2', '2012-05-06 23:42:20', '1', '*', 'Mission Complete', '1', 'Insane', '14', 'Zak', 'mission-complete', 'achievment-big', '2', null, null);
INSERT INTO `ach_list` VALUES ('3', '2012-05-06 23:42:41', '1', '*', 'Mission Complete', '1', 'Brutal', '24', 'Zak', 'mission-complete', 'achievment-big', '3', null, null);
INSERT INTO `ach_list` VALUES ('4', '2012-05-06 23:45:52', '2', '*', 'NoFlamer', '1', 'Hard', '2', 'Zak', 'no-flamer', 'achievment-small', '4', '<p>Успешное завершение миссии</p>\r\n<p>Огнемёт не использовался (исключение биомасса)</p>', 'Mission complete without flamer');
INSERT INTO `ach_list` VALUES ('5', '2012-05-06 23:45:58', '2', '*', 'NoFlamer', '1', 'Insane', '7', 'Zak', 'no-flamer', 'achievment-small', '5', null, null);
INSERT INTO `ach_list` VALUES ('6', '2012-05-06 23:46:18', '2', '*', 'NoFlamer', '1', 'Brutal', '12', 'Zak', 'no-flamer', 'achievment-small', '6', null, null);
INSERT INTO `ach_list` VALUES ('7', '2012-05-06 23:46:34', '3', '*', 'Sound Execution', '1', 'Hard', '4', 'Zak', 'se', 'achievment-small', '25', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не погиб</p>', 'Mission complete by 4 players without death');
INSERT INTO `ach_list` VALUES ('8', '2012-05-06 23:47:04', '3', '*', 'Sound Execution', '1', 'Insane', '14', 'Zak', 'se', 'achievment-small', '26', null, null);
INSERT INTO `ach_list` VALUES ('9', '2012-05-06 23:57:06', '3', '*', 'Sound Execution', '1', 'Brutal', '24', 'Zak', 'se', 'achievment-small', '27', null, null);
INSERT INTO `ach_list` VALUES ('10', '2012-05-06 23:57:09', '4', '*', 'NoFlamer Sound Execution', '1', 'Hard', '2', 'Zak', 'no-flamer-se', 'achievment-small', '7', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не погиб</p>\r\n<p>Огнемёт не использовался (исключение биомасса)</p>', 'Mission complete by 4 players without death and without using flamer');
INSERT INTO `ach_list` VALUES ('11', '2012-05-07 11:52:23', '4', '*', 'NoFlamer Sound Execution', '1', 'Insane', '7', 'Zak', 'no-flamer-se', 'achievment-small', '8', null, null);
INSERT INTO `ach_list` VALUES ('12', '2012-05-07 11:52:26', '4', '*', 'NoFlamer Sound Execution', '1', 'Brutal', '12', 'Zak', 'no-flamer-se', 'achievment-small', '9', null, null);
INSERT INTO `ach_list` VALUES ('13', '2012-05-07 11:52:29', '5', '*', 'Speedrun', '1', 'Hard', '4', 'Zak', 'speedrun', 'achievment-big', '28', '<p>Успешное завершение миссии</p>\r\n<p>Миссия пройдена за определённое время или быстрее (спидран)</p>', 'Speed run mission complete without any marines dying');
INSERT INTO `ach_list` VALUES ('14', '2012-05-07 11:52:45', '5', '*', 'Speedrun', '1', 'Insane', '14', 'Zak', 'speedrun', 'achievment-big', '29', null, null);
INSERT INTO `ach_list` VALUES ('15', '2012-05-07 11:52:48', '5', '*', 'Speedrun', '1', 'Brutal', '24', 'Zak', 'speedrun', 'achievment-big', '30', null, null);
INSERT INTO `ach_list` VALUES ('16', '2012-05-07 11:52:50', '6', '*', 'Speedrun NoFlamer', '1', 'Hard', '2', 'Zak', 'speedrun-no-flamer', 'achievment-small', '31', '<p>Успешное завершение миссии</p>\r\n<p>Миссия пройдена за определённое время или быстрее</p>\r\n<p>Огнемёт не использовался (исключение биомасса)</p>', 'Speed run mission complete without any marines dying and without using flamer');
INSERT INTO `ach_list` VALUES ('17', '2012-05-07 11:52:53', '6', '*', 'Speedrun NoFlamer', '1', 'Insane', '7', 'Zak', 'speedrun-no-flamer', 'achievment-small', '32', null, null);
INSERT INTO `ach_list` VALUES ('18', '2012-05-07 11:52:56', '6', '*', 'Speedrun NoFlamer', '1', 'Brutal', '12', 'Zak', 'speedrun-no-flamer', 'achievment-small', '33', null, null);
INSERT INTO `ach_list` VALUES ('19', '2012-05-07 11:52:58', '7', '*', 'Speedrun Sound Execution', '1', 'Hard', '4', 'Zak', 'speedrun-se', 'achievment-small', '34', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не погиб</p>\r\n<p>Миссия пройдена за определённое время или быстрее</p>', null);
INSERT INTO `ach_list` VALUES ('20', '2012-05-07 11:53:01', '7', '*', 'Speedrun Sound Execution', '1', 'Insane', '14', 'Zak', 'speedrun-se', 'achievment-small', '35', null, null);
INSERT INTO `ach_list` VALUES ('21', '2012-05-07 11:53:03', '7', '*', 'Speedrun Sound Execution', '1', 'Brutal', '24', 'Zak', 'speedrun-se', 'achievment-small', '36', null, null);
INSERT INTO `ach_list` VALUES ('22', '2012-05-07 11:53:06', '8', '*', 'Speedrun NoFlamer Sound Execution', '1', 'Hard', '2', 'Zak', 'speedrun-no-flamer-se', 'achievment-big', '37', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не погиб</p>\r\n<p>Миссия пройдена за определённое время или быстрее</p>\r\n<p>Огнемёт не использовался (исключение биомасса)</p>', null);
INSERT INTO `ach_list` VALUES ('23', '2012-05-07 11:53:24', '8', '*', 'Speedrun NoFlamer Sound Execution', '1', 'Insane', '7', 'Zak', 'speedrun-no-flamer-se', 'achievment-big', '38', null, null);
INSERT INTO `ach_list` VALUES ('24', '2012-05-07 11:53:26', '8', '*', 'Speedrun NoFlamer Sound Execution', '1', 'Brutal', '12', 'Zak', 'speedrun-no-flamer-se', 'achievment-big', '39', null, null);
INSERT INTO `ach_list` VALUES ('25', '2012-05-07 11:53:29', '9', '*', 'NoAdren', '1', 'Hard', '2', 'Zak', 'no-adren', 'achievment-big', '13', '<p>Успешное завершение миссии</p>\r\n<p>Адреналин не использовался</p>', null);
INSERT INTO `ach_list` VALUES ('26', '2012-05-07 11:53:20', '9', '*', 'NoAdren', '1', 'Insane', '7', 'Zak', 'no-adren', 'achievment-big', '14', null, null);
INSERT INTO `ach_list` VALUES ('27', '2012-05-07 11:53:32', '9', '*', 'NoAdren', '1', 'Brutal', '12', 'Zak', 'no-adren', 'achievment-big', '15', null, null);
INSERT INTO `ach_list` VALUES ('28', '2012-05-07 11:53:34', '10', '*', 'NoAdren NoFlamer', '1', 'Hard', '2', 'Zak', 'no-adren-noflamer', 'achievment-small', '16', '<p>Успешное завершение миссии</p>\r\n<p>Адреналин не использовался</p>\r\n<p>Огнемёт не использовался (исключение биомасса)</p>', null);
INSERT INTO `ach_list` VALUES ('29', '2012-05-07 11:53:37', '10', '*', 'NoAdren NoFlamer', '1', 'Insane', '7', 'Zak', 'no-adren-noflamer', 'achievment-small', '17', null, null);
INSERT INTO `ach_list` VALUES ('30', '2012-05-07 11:53:39', '10', '*', 'NoAdren NoFlamer', '1', 'Brutal', '12', 'Zak', 'no-adren-noflamer', 'achievment-small', '18', null, null);
INSERT INTO `ach_list` VALUES ('31', '2012-05-07 11:53:42', '11', '*', 'NoAdren Sound Execution', '1', 'Hard', '4', 'Zak', 'no-adren-se', 'achievment-small', '19', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не погиб</p>\r\n<p>Адреналин не использовался</p>', null);
INSERT INTO `ach_list` VALUES ('32', '2012-05-07 11:53:45', '11', '*', 'NoAdren Sound Execution', '1', 'Insane', '14', 'Zak', 'no-adren-se', 'achievment-small', '20', null, null);
INSERT INTO `ach_list` VALUES ('33', '2012-05-07 11:53:47', '11', '*', 'NoAdren Sound Execution', '1', 'Brutal', '24', 'Zak', 'no-adren-se', 'achievment-small', '21', null, null);
INSERT INTO `ach_list` VALUES ('34', '2012-05-07 11:53:49', '12', '*', 'NoAdren NoFlamer Sound Execution', '1', 'Hard', '4', 'Zak', 'no-adren-no-flamer-se', 'achievment-big', '22', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не погиб</p>\r\n<p>Адреналин не использовался</p>\r\n<p>Огнемёт не использовался (исключение биомасса)</p>', null);
INSERT INTO `ach_list` VALUES ('35', '2012-05-07 11:53:52', '12', '*', 'NoAdren NoFlamer Sound Execution', '1', 'Insane', '14', 'Zak', 'no-adren-no-flamer-se', 'achievment-big', '23', null, null);
INSERT INTO `ach_list` VALUES ('36', '2012-05-07 11:54:04', '12', '*', 'NoAdren NoFlamer Sound Execution', '1', 'Brutal', '24', 'Zak', 'no-adren-no-flamer-se', 'achievment-big', '24', null, null);
INSERT INTO `ach_list` VALUES ('37', '2012-05-07 11:54:06', '13', '*', 'Sector Destruction', '1', 'Hard', '16', 'Zak', 'sector-destruction', 'achievment-small', '62', '<p>Успешное завершение миссии</p>\r\n<p>Игроками суммарно убито 400 мобов или больше</p>', null);
INSERT INTO `ach_list` VALUES ('38', '2012-05-07 11:54:10', '13', '*', 'Sector Destruction', '1', 'Insane', '56', 'Zak', 'sector-destruction', 'achievment-small', '63', null, null);
INSERT INTO `ach_list` VALUES ('39', '2012-05-07 11:54:14', '13', '*', 'Sector Destruction', '1', 'Brutal', '112', 'Zak', 'sector-destruction', 'achievment-small', '64', null, null);
INSERT INTO `ach_list` VALUES ('40', '2012-05-07 11:54:20', '14', '*', 'Sound Execution Sector Destruction', '1', 'Hard', '16', 'Zak', 'sector-destruction-se', 'achievment-small', '65', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не погиб</p>\r\n<p>Игроками суммарно убито 400 мобов или больше</p>', null);
INSERT INTO `ach_list` VALUES ('41', '2012-05-07 11:54:28', '14', '*', 'Sound Execution Sector Destruction', '1', 'Insane', '56', 'Zak', 'sector-destruction-se', 'achievment-small', '66', null, null);
INSERT INTO `ach_list` VALUES ('42', '2012-05-07 11:54:30', '14', '*', 'Sound Execution Sector Destruction', '1', 'Brutal', '112', 'Zak', 'sector-destruction-se', 'achievment-small', '67', null, null);
INSERT INTO `ach_list` VALUES ('43', '2012-05-07 11:54:33', '15', '*', 'Complexity', '1', 'Hard', '1', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('44', '2012-05-07 11:54:36', '15', '*', 'Complexity', '1', 'Insane', '4', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('45', '2012-05-07 11:54:42', '15', '*', 'Complexity', '1', 'Brutal', '7', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('46', '2012-05-07 11:54:48', '16', '*', 'Best Time', '1', 'Hard', '24', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('47', '2012-05-07 11:53:17', '16', '*', 'Best Time', '1', 'Insane', '24', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('48', '2012-05-07 11:53:15', '16', '*', 'Best Time', '1', 'Brutal', '24', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('65', '2012-06-16 22:39:35', '17', '*', 'Classic Team', '1', 'Hard', '16', 'Zak', 'classic-team', 'achievment-big', '10', '<p>Успешное завершение миссии</p>\r\n<p>В команде 4 игрока</p>\r\n<p>В игре одновременно присутствуют все 4 класса персонажей (техник, доктор, спец и офицер)</p>\r\n<p>Никто не погиб</p>', null);
INSERT INTO `ach_list` VALUES ('66', '2012-06-16 22:41:43', '17', '*', 'Classic Team', '1', 'Insane', '56', 'Zak', 'classic-team', 'achievment-big', '11', null, null);
INSERT INTO `ach_list` VALUES ('67', '2012-06-16 22:41:47', '17', '*', 'Classic Team', '1', 'Brutal', '112', 'Zak', 'classic-team', 'achievment-big', '12', null, null);
INSERT INTO `ach_list` VALUES ('69', '2012-06-17 13:13:07', '18', '*', 'Perfect', '1', 'Hard', '100', 'Zak', 'perfect', 'achievment-big', '1', '<p>Успешно завершить миссию</p>\r\n<p>Не получить урон за миссию</p>', null);
INSERT INTO `ach_list` VALUES ('70', '2012-06-17 13:13:17', '18', '*', 'Perfect', '1', 'Insane', '150', 'Zak', 'perfect', 'achievment-big', '2', null, null);
INSERT INTO `ach_list` VALUES ('71', '2012-06-17 13:13:20', '18', '*', 'Perfect', '1', 'Brutal', '200', 'Zak', 'perfect', 'achievment-big', '3', null, null);
INSERT INTO `ach_list` VALUES ('73', '2012-06-17 14:29:05', '19', '*', 'Perfect Team', '1', 'Hard', '200', 'Zak', 'perfect-team', 'achievment-big', '4', '<p>Успешно завершить миссию</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не получил урона за миссию</p>', null);
INSERT INTO `ach_list` VALUES ('74', '2012-06-17 14:29:40', '19', '*', 'Perfect Team', '1', 'Insane', '300', 'Zak', 'perfect-team', 'achievment-big', '5', null, null);
INSERT INTO `ach_list` VALUES ('75', '2012-06-17 14:29:43', '19', '*', 'Perfect Team', '1', 'Brutal', '400', 'Zak', 'perfect-team', 'achievment-big', '6', null, null);
INSERT INTO `ach_list` VALUES ('77', '2012-06-23 19:55:58', '20', '*', 'Horde Killer', '1', 'Hard', '100', 'Zak', 'horde-killer', 'achievment-big', '13', '<p>Убить 200 или больше мобов за миссию</p>\r\n<p>Успешное завершение миссии</p>', null);
INSERT INTO `ach_list` VALUES ('78', '2012-06-23 19:56:46', '20', '*', 'Horde Killer', '1', 'Insane', '150', 'Zak', 'horde-killer', 'achievment-big', '14', null, null);
INSERT INTO `ach_list` VALUES ('79', '2012-06-23 19:56:49', '20', '*', 'Horde Killer', '1', 'Brutal', '200', 'Zak', 'horde-killer', 'achievment-big', '15', null, null);
INSERT INTO `ach_list` VALUES ('81', '2012-06-24 18:13:06', '21', '*', 'Panzerschreck', '1', 'Hard', '50', 'Zak', 'panzerschreck', 'achievment-big', '10', '<p>Убить трех шилдов (танков)</p>\r\n<p>Успешно завершить миссию</p>', null);
INSERT INTO `ach_list` VALUES ('82', '2012-06-24 18:13:08', '21', '*', 'Panzerschreck', '1', 'Insane', '100', 'Zak', 'panzerschreck', 'achievment-big', '11', null, null);
INSERT INTO `ach_list` VALUES ('83', '2012-06-24 18:13:11', '21', '*', 'Panzerschreck', '1', 'Brutal', '150', 'Zak', 'panzerschreck', 'achievment-big', '12', null, null);
INSERT INTO `ach_list` VALUES ('85', '2012-06-25 06:34:23', '22', 'ASI-Jac1-LandingBay_01', 'Jacob`s NoTesla', '1', 'Hard', '2', 'Zak', 'jacob-no-tesla', 'achievment-small', '41', '<p>Успешное завершение миссии</p>\r\n<p>Тесла пушка не использовалась</p>', null);
INSERT INTO `ach_list` VALUES ('86', '2012-06-25 06:34:26', '22', 'ASI-Jac1-LandingBay_01', 'Jacob`s NoTesla', '1', 'Insane', '7', 'Zak', 'jacob-no-tesla', 'achievment-small', '42', null, null);
INSERT INTO `ach_list` VALUES ('87', '2012-06-25 06:34:29', '22', 'ASI-Jac1-LandingBay_01', 'Jacob`s NoTesla', '1', 'Brutal', '12', 'Zak', 'jacob-no-tesla', 'achievment-small', '43', null, null);
INSERT INTO `ach_list` VALUES ('88', '2012-06-26 03:10:02', '22', 'ASI-Jac1-LandingBay_02', 'Jacob`s NoTesla', '1', 'Hard', '2', 'Zak', 'jacob-no-tesla', 'achievment-small', '44', null, null);
INSERT INTO `ach_list` VALUES ('89', '2012-06-26 03:10:20', '22', 'ASI-Jac1-LandingBay_02', 'Jacob`s NoTesla', '1', 'Insane', '7', 'Zak', 'jacob-no-tesla', 'achievment-small', '45', null, null);
INSERT INTO `ach_list` VALUES ('90', '2012-06-26 03:10:23', '22', 'ASI-Jac1-LandingBay_02', 'Jacob`s NoTesla', '1', 'Brutal', '12', 'Zak', 'jacob-no-tesla', 'achievment-small', '46', null, null);
INSERT INTO `ach_list` VALUES ('91', '2012-06-26 03:10:25', '22', 'ASI-Jac2-Deima', 'Jacob`s NoTesla', '1', 'Hard', '2', 'Zak', 'jacob-no-tesla', 'achievment-small', '47', null, null);
INSERT INTO `ach_list` VALUES ('92', '2012-06-26 03:10:29', '22', 'ASI-Jac2-Deima', 'Jacob`s NoTesla', '1', 'Insane', '7', 'Zak', 'jacob-no-tesla', 'achievment-small', '48', null, null);
INSERT INTO `ach_list` VALUES ('93', '2012-06-26 03:10:31', '22', 'ASI-Jac2-Deima', 'Jacob`s NoTesla', '1', 'Brutal', '12', 'Zak', 'jacob-no-tesla', 'achievment-small', '49', null, null);
INSERT INTO `ach_list` VALUES ('94', '2012-06-26 03:10:34', '22', 'ASI-Jac3-Rydberg', 'Jacob`s NoTesla', '1', 'Hard', '2', 'Zak', 'jacob-no-tesla', 'achievment-small', '50', null, null);
INSERT INTO `ach_list` VALUES ('95', '2012-06-26 03:10:37', '22', 'ASI-Jac3-Rydberg', 'Jacob`s NoTesla', '1', 'Insane', '7', 'Zak', 'jacob-no-tesla', 'achievment-small', '51', null, null);
INSERT INTO `ach_list` VALUES ('96', '2012-06-26 03:10:39', '22', 'ASI-Jac3-Rydberg', 'Jacob`s NoTesla', '1', 'Brutal', '12', 'Zak', 'jacob-no-tesla', 'achievment-small', '52', null, null);
INSERT INTO `ach_list` VALUES ('97', '2012-06-26 03:10:42', '22', 'ASI-Jac4-Residential', 'Jacob`s NoTesla', '1', 'Hard', '2', 'Zak', 'jacob-no-tesla', 'achievment-small', '53', null, null);
INSERT INTO `ach_list` VALUES ('98', '2012-06-26 03:11:04', '22', 'ASI-Jac4-Residential', 'Jacob`s NoTesla', '1', 'Insane', '7', 'Zak', 'jacob-no-tesla', 'achievment-small', '54', null, null);
INSERT INTO `ach_list` VALUES ('99', '2012-06-26 03:11:06', '22', 'ASI-Jac4-Residential', 'Jacob`s NoTesla', '1', 'Brutal', '12', 'Zak', 'jacob-no-tesla', 'achievment-small', '55', null, null);
INSERT INTO `ach_list` VALUES ('100', '2012-06-26 03:11:09', '22', 'ASI-Jac6-SewerJunction', 'Jacob`s NoTesla', '1', 'Hard', '2', 'Zak', 'jacob-no-tesla', 'achievment-small', '56', null, null);
INSERT INTO `ach_list` VALUES ('101', '2012-06-26 03:11:11', '22', 'ASI-Jac6-SewerJunction', 'Jacob`s NoTesla', '1', 'Insane', '7', 'Zak', 'jacob-no-tesla', 'achievment-small', '57', null, null);
INSERT INTO `ach_list` VALUES ('102', '2012-06-26 03:11:13', '22', 'ASI-Jac6-SewerJunction', 'Jacob`s NoTesla', '1', 'Brutal', '12', 'Zak', 'jacob-no-tesla', 'achievment-small', '58', null, null);
INSERT INTO `ach_list` VALUES ('103', '2012-06-26 03:11:15', '22', 'ASI-Jac7-TimorStation', 'Jacob`s NoTesla', '1', 'Hard', '2', 'Zak', 'jacob-no-tesla', 'achievment-small', '59', null, null);
INSERT INTO `ach_list` VALUES ('104', '2012-06-26 03:11:17', '22', 'ASI-Jac7-TimorStation', 'Jacob`s NoTesla', '1', 'Insane', '7', 'Zak', 'jacob-no-tesla', 'achievment-small', '60', null, null);
INSERT INTO `ach_list` VALUES ('105', '2012-06-26 03:11:20', '22', 'ASI-Jac7-TimorStation', 'Jacob`s NoTesla', '1', 'Brutal', '12', 'Zak', 'jacob-no-tesla', 'achievment-small', '61', null, null);
INSERT INTO `ach_list` VALUES ('106', '2012-06-26 03:43:25', '23', '*', 'Awesome Team', '1', 'Hard', '50', 'Zak', 'awesome-team', 'achievment-big', '7', '<p>Успешно завершить миссию</p>\r\n<p>В команде 4 игрока</p>\r\n<p>Никто не получил за миссию более 40% урона от стартового здоровья</p>', null);
INSERT INTO `ach_list` VALUES ('107', '2012-06-26 03:43:28', '23', '*', 'Awesome Team', '1', 'Insane', '100', 'Zak', 'awesome-team', 'achievment-big', '8', null, null);
INSERT INTO `ach_list` VALUES ('108', '2012-06-26 03:43:30', '23', '*', 'Awesome Team', '1', 'Brutal', '150', 'Zak', 'awesome-team', 'achievment-big', '9', null, null);
INSERT INTO `ach_list` VALUES ('110', '2012-06-26 20:18:31', '24', '*', 'Kill Them All', '100000', '*', '200', 'Zak', 'kill-them-all', 'achievment-big', '16', '<p>Убить 100 000 мобов (мины, турели не учитываются)</p>', null);
INSERT INTO `ach_list` VALUES ('111', '2012-06-26 20:18:34', '25', '*', 'Nuke From Orbit', '500000', '*', '200', 'Zak', 'nuke-from-orbit', 'achievment-big', '17', '<p>Убить 500 000 мобов (мины, турели не учитываются)</p>', null);
INSERT INTO `ach_list` VALUES ('114', '2012-06-28 14:29:23', '26', 'ASI-Jac4-Residential', 'Le Docteur', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '100', 'Выполнить Sound Execution, играя за персонажа Bastile', 'Sound Execution with Bastile');
INSERT INTO `ach_list` VALUES ('115', '2012-06-28 14:29:27', '26', 'ASI-Jac4-Residential', 'Le Docteur', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '101', 'Выполнить Sound Execution, играя за персонажа Bastile', 'Sound Execution with Bastile');
INSERT INTO `ach_list` VALUES ('116', '2012-06-28 14:29:29', '26', 'ASI-Jac4-Residential', 'Le Docteur', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '102', 'Выполнить Sound Execution, играя за персонажа Bastile', 'Sound Execution with Bastile');
INSERT INTO `ach_list` VALUES ('117', '2012-06-28 14:29:33', '26', 'as_sci2_sewer', 'Le Docteur', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '103', 'Выполнить Sound Execution, играя за персонажа Bastile', 'Sound Execution with Bastile');
INSERT INTO `ach_list` VALUES ('118', '2012-06-28 14:29:36', '26', 'as_sci2_sewer', 'Le Docteur', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '104', 'Выполнить Sound Execution, играя за персонажа Bastile', 'Sound Execution with Bastile');
INSERT INTO `ach_list` VALUES ('119', '2012-06-28 14:29:39', '26', 'as_sci2_sewer', 'Le Docteur', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '105', 'Выполнить Sound Execution, играя за персонажа Bastile', 'Sound Execution with Bastile');
INSERT INTO `ach_list` VALUES ('120', '2012-06-28 14:29:41', '26', 'dc1-omega_city', 'Le Docteur', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '106', 'Выполнить Sound Execution, играя за персонажа Faith', 'Sound Execution with Faith');
INSERT INTO `ach_list` VALUES ('121', '2012-06-28 14:29:43', '26', 'dc1-omega_city', 'Le Docteur', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '107', 'Выполнить Sound Execution, играя за персонажа Faith', 'Sound Execution with Faith');
INSERT INTO `ach_list` VALUES ('122', '2012-06-28 14:29:45', '26', 'dc1-omega_city', 'Le Docteur', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '108', 'Выполнить Sound Execution, играя за персонажа Faith', 'Sound Execution with Faith');
INSERT INTO `ach_list` VALUES ('123', '2012-06-28 14:29:47', '26', '*', 'Le Docteur', '1', 'Hard', '200', 'Zak', 'cach', 'achievment-big', '94', 'Достижение дается медику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Medic achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('124', '2012-06-28 14:29:50', '26', '*', 'Le Docteur', '1', 'Insane', '300', 'Zak', 'cach', 'achievment-big', '95', 'Достижение дается медику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Medic achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('125', '2012-06-28 14:29:53', '26', '*', 'Le Docteur', '1', 'Brutal', '400', 'Zak', 'cach', 'achievment-big', '96', 'Достижение дается медику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Medic achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('128', '2012-06-28 14:32:55', '27', 'as_paranoia2', 'Pan Oficer', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '144', 'Выполнить Sound Execution, играя за персонажа Jaeger', 'Sound Execution with Jaeger');
INSERT INTO `ach_list` VALUES ('129', '2012-06-28 14:33:03', '27', 'as_paranoia2', 'Pan Oficer', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '145', 'Выполнить Sound Execution, играя за персонажа Jaeger', 'Sound Execution with Jaeger');
INSERT INTO `ach_list` VALUES ('130', '2012-06-28 14:33:00', '27', 'as_paranoia2', 'Pan Oficer', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '146', 'Выполнить Sound Execution, играя за персонажа Jaeger', 'Sound Execution with Jaeger');
INSERT INTO `ach_list` VALUES ('131', '2012-06-28 14:32:57', '27', 'TFT-Spaceport', 'Pan Oficer', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '147', 'Выполнить Sound Execution, играя за персонажа Sarge', 'Sound Execution with Sarge');
INSERT INTO `ach_list` VALUES ('132', '2012-06-28 14:33:13', '27', 'TFT-Spaceport', 'Pan Oficer', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '148', 'Выполнить Sound Execution, играя за персонажа Sarge', 'Sound Execution with Sarge');
INSERT INTO `ach_list` VALUES ('133', '2012-06-28 14:33:10', '27', 'TFT-Spaceport', 'Pan Oficer', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '149', 'Выполнить Sound Execution, играя за персонажа Sarge', 'Sound Execution with Sarge');
INSERT INTO `ach_list` VALUES ('134', '2012-06-28 14:33:09', '27', 'as_sci3_maintenance', 'Pan Oficer', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '150', 'Выполнить Sound Execution, играя за персонажа Jaeger', 'Sound Execution with Jaeger');
INSERT INTO `ach_list` VALUES ('135', '2012-06-28 14:33:07', '27', 'as_sci3_maintenance', 'Pan Oficer', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '151', 'Выполнить Sound Execution, играя за персонажа Jaeger', 'Sound Execution with Jaeger');
INSERT INTO `ach_list` VALUES ('136', '2012-06-28 14:33:05', '27', 'as_sci3_maintenance', 'Pan Oficer', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '152', 'Выполнить Sound Execution, играя за персонажа Jaeger', 'Sound Execution with Jaeger');
INSERT INTO `ach_list` VALUES ('137', '2012-06-28 14:33:15', '27', '*', 'Pan Oficer', '1', 'Hard', '200', 'Zak', 'cach', 'achievment-big', '138', 'Достижение дается офицеру.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Officer achievement for<br />\r\nSound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('138', '2012-06-28 14:33:20', '27', '*', 'Pan Oficer', '1', 'Insane', '300', 'Zak', 'cach', 'achievment-big', '139', 'Достижение дается офицеру.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Officer achievement for<br />\r\nSound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('139', '2012-06-28 14:33:18', '27', '*', 'Pan Oficer', '1', 'Brutal', '400', 'Zak', 'cach', 'achievment-big', '140', 'Достижение дается офицеру.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Officer achievement for<br />\r\nSound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('140', '2012-06-28 16:01:57', '28', 'ASI-Jac7-TimorStation', 'Der Techniker', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '79', 'Выполнить Sound Execution, играя за персонажа Vegas', 'Sound Execution with Vegas');
INSERT INTO `ach_list` VALUES ('141', '2012-06-28 16:02:00', '28', 'ASI-Jac7-TimorStation', 'Der Techniker', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '80', 'Выполнить Sound Execution, играя за персонажа Vegas', 'Sound Execution with Vegas');
INSERT INTO `ach_list` VALUES ('142', '2012-06-28 16:02:04', '28', 'ASI-Jac7-TimorStation', 'Der Techniker', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '81', 'Выполнить Sound Execution, играя за персонажа Vegas', 'Sound Execution with Vegas');
INSERT INTO `ach_list` VALUES ('143', '2012-06-28 16:02:06', '28', 'as_sci3_maintenance', 'Der Techniker', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '82', 'Выполнить Sound Execution, играя за персонажа Crash', 'Sound Execution with Crash');
INSERT INTO `ach_list` VALUES ('144', '2012-06-28 15:02:08', '28', 'as_sci3_maintenance', 'Der Techniker', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '83', 'Выполнить Sound Execution, играя за персонажа Crash', 'Sound Execution with Crash');
INSERT INTO `ach_list` VALUES ('145', '2012-06-28 16:02:13', '28', 'as_sci3_maintenance', 'Der Techniker', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '84', 'Выполнить Sound Execution, играя за персонажа Crash', 'Sound Execution with Crash');
INSERT INTO `ach_list` VALUES ('146', '2012-06-28 16:02:15', '28', 'as_paranoia2', 'Der Techniker', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '85', 'Выполнить Sound Execution, играя за персонажа Vegas', 'Sound Execution with Vegas');
INSERT INTO `ach_list` VALUES ('147', '2012-06-28 16:02:17', '28', 'as_paranoia2', 'Der Techniker', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '86', 'Выполнить Sound Execution, играя за персонажа Vegas', 'Sound Execution with Vegas');
INSERT INTO `ach_list` VALUES ('148', '2012-06-28 16:02:19', '28', 'as_paranoia2', 'Der Techniker', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '87', 'Выполнить Sound Execution, играя за персонажа Vegas', 'Sound Execution with Vegas');
INSERT INTO `ach_list` VALUES ('149', '2012-06-28 16:02:20', '28', '*', 'Der Techniker', '1', 'Hard', '200', 'Zak', 'cach', 'achievment-big', '73', 'Достижение дается технику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Tech achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('150', '2012-06-28 16:02:22', '28', '*', 'Der Techniker', '1', 'Insane', '300', 'Zak', 'cach', 'achievment-big', '74', 'Достижение дается технику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Tech achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('151', '2012-06-28 16:02:24', '28', '*', 'Der Techniker', '1', 'Brutal', '400', 'Zak', 'cach', 'achievment-big', '75', 'Достижение дается технику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Tech achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('152', '2012-06-28 16:30:23', '29', 'as_paranoia2', 'El Luchador', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '124', 'Выполнить Sound Execution, играя за персонажа Wolfe', 'Sound Execution with Wolfe');
INSERT INTO `ach_list` VALUES ('153', '2012-06-28 16:30:25', '29', 'as_paranoia2', 'El Luchador', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '125', 'Выполнить Sound Execution, играя за персонажа Wolfe', 'Sound Execution with Wolfe');
INSERT INTO `ach_list` VALUES ('154', '2012-06-28 16:30:28', '29', 'as_paranoia2', 'El Luchador', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '126', 'Выполнить Sound Execution, играя за персонажа Wolfe', 'Sound Execution with Wolfe');
INSERT INTO `ach_list` VALUES ('155', '2012-06-28 16:30:30', '29', 'ASI-Jac4-Residential', 'El Luchador', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '127', 'Выполнить Sound Execution, играя за персонажа Wild Cat', 'Sound Execution with Wild Cat');
INSERT INTO `ach_list` VALUES ('156', '2012-06-28 16:30:32', '29', 'ASI-Jac4-Residential', 'El Luchador', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '128', 'Выполнить Sound Execution, играя за персонажа Wild Cat', 'Sound Execution with Wild Cat');
INSERT INTO `ach_list` VALUES ('157', '2012-06-28 16:30:34', '29', 'ASI-Jac4-Residential', 'El Luchador', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '129', 'Выполнить Sound Execution, играя за персонажа Wild Cat', 'Sound Execution with Wild Cat');
INSERT INTO `ach_list` VALUES ('158', '2012-06-28 16:30:36', '29', 'as_sci1_bridge', 'El Luchador', '1', 'Hard', '0', 'Zak', 'cach', 'achievment-big', '130', 'Выполнить Sound Execution, играя за персонажа Wolfe', 'Sound Execution with Wolfe');
INSERT INTO `ach_list` VALUES ('159', '2012-06-28 16:30:37', '29', 'as_sci1_bridge', 'El Luchador', '1', 'Insane', '0', 'Zak', 'cach', 'achievment-big', '131', 'Выполнить Sound Execution, играя за персонажа Wolfe', 'Sound Execution with Wolfe');
INSERT INTO `ach_list` VALUES ('160', '2012-06-28 15:30:39', '29', 'as_sci1_bridge', 'El Luchador', '1', 'Brutal', '0', 'Zak', 'cach', 'achievment-big', '132', 'Выполнить Sound Execution, играя за персонажа Wolfe', 'Sound Execution with Wolfe');
INSERT INTO `ach_list` VALUES ('161', '2012-06-28 16:30:41', '29', '*', 'El Luchador', '1', 'Hard', '200', 'Zak', 'cach', 'achievment-big', '118', 'Достижение дается пулеметчику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Special weapons achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('162', '2012-06-28 16:30:43', '29', '*', 'El Luchador', '1', 'Insane', '300', 'Zak', 'cach', 'achievment-big', '119', 'Достижение дается пулеметчику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Special weapons achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('163', '2012-06-28 16:30:44', '29', '*', 'El Luchador', '1', 'Brutal', '400', 'Zak', 'cach', 'achievment-big', '120', 'Достижение дается пулеметчику.<br />\r\nУсловие: Выполнить Sound Execution на 3 картах из списка ниже.<br />\r\nПриявязка к персонажу', 'Special weapons achievement<br />\r\nfor Sound Execution on 3 maps from the list');
INSERT INTO `ach_list` VALUES ('164', '2012-06-28 16:39:06', '30', '*', 'Rambo', '5000', 'Hard', '200', 'Zak', 'vach', 'achievment-big', '115', 'Достижение, получаемое любым пулеметчиком<br />\r\nза убийство на мисии 100 мобов (50 раз)', 'Special Weapons achievement<br />\r\nfor the destruction of 100 mobs per mission<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('165', '2012-06-28 16:39:10', '30', '*', 'Rambo', '5000', 'Insane', '300', 'Zak', 'vach', 'achievment-big', '116', 'Достижение, получаемое любым пулеметчиком<br />\r\nза убийство на мисии 100 мобов (50 раз)', 'Special Weapons achievement<br />\r\nfor the destruction of 100 mobs per mission<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('166', '2012-06-28 16:39:12', '30', '*', 'Rambo', '5000', 'Brutal', '400', 'Zak', 'vach', 'achievment-big', '117', 'Достижение, получаемое любым пулеметчиком<br />\r\nза убийство на мисии 100 мобов (50 раз)', 'Special Weapons achievement<br />\r\nfor the destruction of 100 mobs per mission<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('168', '2012-06-28 17:02:02', '31', '*', 'Firewall Specialist', '5000', 'Hard', '200', 'Zak', 'vach', 'achievment-big', '135', 'Достижение, получаемое любым офицером<br />\r\nза убийство огненными минами на мисии 100 мобов (50 раз)', 'Officer achievement<br />\r\nfor the destruction of 100 mobs per mission with firewall mines<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('169', '2012-06-28 17:02:04', '31', '*', 'Firewall Specialist', '5000', 'Insane', '300', 'Zak', 'vach', 'achievment-big', '136', 'Достижение, получаемое любым офицером<br />\r\nза убийство огненными минами на мисии 100 мобов (50 раз)', 'Officer achievement<br />\r\nfor the destruction of 100 mobs per mission with firewall mines<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('170', '2012-06-28 17:02:06', '31', '*', 'Firewall Specialist', '5000', 'Brutal', '400', 'Zak', 'vach', 'achievment-big', '137', 'Достижение, получаемое любым офицером<br />\r\nза убийство огненными минами на мисии 100 мобов (50 раз)', 'Officer achievement<br />\r\nfor the destruction of 100 mobs per mission with firewall mines<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('172', '2012-06-30 17:09:03', '32', '*', 'Sniper', '50', 'Hard', '200', 'Zak', 'vach', 'achievment-big', '141', 'Достижение, получаемое любым офицером<br />\r\nза прохождение 50 миссий без дружеского огня', 'Officer achievement<br />\r\nfor the completion of 50 missions without friendly fire');
INSERT INTO `ach_list` VALUES ('173', '2012-06-30 17:09:06', '32', '*', 'Sniper', '50', 'Insane', '300', 'Zak', 'vach', 'achievment-big', '142', 'Достижение, получаемое любым офицером<br />\r\nза прохождение 50 миссий без дружеского огня', 'Officer achievement<br />\r\nfor the completion of 50 missions without friendly fire');
INSERT INTO `ach_list` VALUES ('174', '2012-06-30 17:09:08', '32', '*', 'Sniper', '50', 'Brutal', '400', 'Zak', 'vach', 'achievment-big', '143', 'Достижение, получаемое любым офицером<br />\r\nза прохождение 50 миссий без дружеского огня', 'Officer achievement<br />\r\nfor the completion of 50 missions without friendly fire');
INSERT INTO `ach_list` VALUES ('176', '2012-06-30 17:51:36', '33', '*', 'Sharpshooter', '50', 'Hard', '200', 'Zak', 'vach', 'achievment-big', '121', 'Достижение, получаемое любым пулеметчиком<br />\r\nза прохождение 50 миссий без дружеского огня', 'Special weapons achievement<br />\r\nfor the completion of 50 missions without friendly fire');
INSERT INTO `ach_list` VALUES ('177', '2012-06-30 17:51:38', '33', '*', 'Sharpshooter', '50', 'Insane', '300', 'Zak', 'vach', 'achievment-big', '122', 'Достижение, получаемое любым пулеметчиком<br />\r\nза прохождение 50 миссий без дружеского огня', 'Special weapons achievement<br />\r\nfor the completion of 50 missions without friendly fire');
INSERT INTO `ach_list` VALUES ('178', '2012-06-30 17:51:40', '33', '*', 'Sharpshooter', '50', 'Brutal', '400', 'Zak', 'vach', 'achievment-big', '123', 'Достижение, получаемое любым пулеметчиком<br />\r\nза прохождение 50 миссий без дружеского огня', 'Special weapons achievement<br />\r\nfor the completion of 50 missions without friendly fire');
INSERT INTO `ach_list` VALUES ('179', '2012-06-30 18:05:39', '34', '*', 'ParaMedic', '1', 'Hard', '200', 'Zak', 'cach', 'achievment-big', '91', 'Достижение, получаемое любым доктором,<br />\r\nесли он спасет трех персонажей зараженных паразитом<br />\r\nза одну миссию', 'Medic achievement<br />\r\nif he heals three infected marines per mission');
INSERT INTO `ach_list` VALUES ('180', '2012-06-30 18:05:41', '34', '*', 'ParaMedic', '1', 'Insane', '300', 'Zak', 'cach', 'achievment-big', '92', 'Достижение, получаемое любым доктором,<br />\r\nесли он спасет трех персонажей зараженных паразитом<br />\r\nза одну миссию', 'Medic achievement<br />\r\nif he heals three infected marines per mission');
INSERT INTO `ach_list` VALUES ('181', '2012-06-30 18:05:43', '34', '*', 'ParaMedic', '1', 'Brutal', '400', 'Zak', 'cach', 'achievment-big', '93', 'Достижение, получаемое любым доктором,<br />\r\nесли он спасет трех персонажей зараженных паразитом<br />\r\nза одну миссию', 'Medic achievement<br />\r\nif he heals three infected marines per mission');
INSERT INTO `ach_list` VALUES ('183', '2012-06-30 20:20:39', '35', '*', 'iBolit', '15000', 'Hard', '200', 'Zak', 'vach', 'achievment-big', '97', 'Достижение, получаемое любым доктором<br />\r\nза лечение 300 пунктов здоровья за миссию (50 раз)', 'Medic achievement<br />\r\nfor healing of 300 health points<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('184', '2012-06-30 20:20:42', '35', '*', 'iBolit', '15000', 'Insane', '300', 'Zak', 'vach', 'achievment-big', '98', 'Достижение, получаемое любым доктором<br />\r\nза лечение 300 пунктов здоровья за миссию (50 раз)', 'Medic achievement<br />\r\nfor healing of 300 health points<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('185', '2012-06-30 20:20:47', '35', '*', 'iBolit', '15000', 'Brutal', '400', 'Zak', 'vach', 'achievment-big', '99', 'Достижение, получаемое любым доктором<br />\r\nза лечение 300 пунктов здоровья за миссию (50 раз)', 'Medic achievement<br />\r\nfor healing of 300 health points<br />\r\n50 times');
INSERT INTO `ach_list` VALUES ('186', '2012-07-01 19:07:28', '36', '*', 'Smart Hacker', '50', 'Hard', '200', 'Zak', 'vach', 'achievment-big', '70', 'Достижение,<br />\r\nполучаемое техником за 50 успешных<br />\r\nбезадреналиновых хаков компьютера.', 'Tech achievement for 50 successful no adren fast hacks of the computer');
INSERT INTO `ach_list` VALUES ('187', '2012-07-01 19:07:31', '36', '*', 'Smart Hacker', '50', 'Insane', '300', 'Zak', 'vach', 'achievment-big', '71', 'Достижение,<br />\r\nполучаемое техником за 50 успешных<br />\r\nбезадреналиновых хаков компьютера.', 'Tech achievement for 50 successful no adren fast hacks of the computer');
INSERT INTO `ach_list` VALUES ('188', '2012-07-01 19:07:33', '36', '*', 'Smart Hacker', '50', 'Brutal', '400', 'Zak', 'vach', 'achievment-big', '72', 'Достижение,<br />\r\nполучаемое техником за 50 успешных<br />\r\nбезадреналиновых хаков компьютера.', 'Tech achievement for 50 successful no adren fast hacks of the computer');
INSERT INTO `ach_list` VALUES ('190', '2012-07-01 20:15:07', '37', '*', 'Circuit Breaker', '50', '*', '200', 'Zak', 'circuit-breaker', 'achievment-big', '19', '<p>50 фаст-хаков компьютера (Трубопроводчик)</p>', null);
INSERT INTO `ach_list` VALUES ('193', '2012-07-01 20:23:19', '38', '*', 'Security Expert', '50', '*', '200', 'Zak', 'security-expert', 'achievment-big', '18', '<p>50 быстрых передач critical data</p>', null);
INSERT INTO `ach_list` VALUES ('194', '2012-07-01 22:03:46', '39', '*', 'Para Chopper', '1', 'Hard', '200', 'Zak', 'cach', 'achievment-big', '76', 'Достижение, получаемое<br />\r\nза убийство 4 паразитов пилой за миссию,<br />\r\nиграя любым техником', 'Destruction of 4 parasites by saw per mission for the tech');
INSERT INTO `ach_list` VALUES ('195', '2012-07-01 22:05:21', '39', '*', 'Para Chopper', '1', 'Insane', '300', 'Zak', 'cach', 'achievment-big', '77', 'Достижение, получаемое<br />\r\nза убийство 4 паразитов пилой за миссию,<br />\r\nиграя любым техником', 'Destruction of 4 parasites by saw per mission for the tech');
INSERT INTO `ach_list` VALUES ('196', '2012-07-01 22:05:23', '39', '*', 'Para Chopper', '1', 'Brutal', '400', 'Zak', 'cach', 'achievment-big', '78', 'Достижение, получаемое<br />\r\nза убийство 4 паразитов пилой за миссию,<br />\r\nиграя любым техником', 'Destruction of 4 parasites by saw per mission for the tech');
INSERT INTO `ach_list` VALUES ('198', '2012-07-02 22:04:21', '40', '*', 'Veteran', '1', 'Hard', '50', 'Zak', null, '', null, '<p>Не умереть самому ни на одной миссии компании</p>', null);
INSERT INTO `ach_list` VALUES ('199', '2012-07-02 22:04:23', '40', '*', 'Veteran', '1', 'Insane', '100', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('200', '2012-07-02 22:04:25', '40', '*', 'Veteran', '1', 'Brutal', '150', 'Zak', null, '', null, null, null);
INSERT INTO `ach_list` VALUES ('201', '2012-08-21 01:14:56', '41', '*', 'Queen Killer', '1', 'Hard', '1000', 'Zak', 'queen-killer', 'achievment-big-grey', '20', 'В разработке', 'Coming Soon');
INSERT INTO `ach_list` VALUES ('202', '2012-08-21 01:16:13', '41', '*', 'Queen Killer', '1', 'Insane', '2000', 'Zak', 'queen-killer', 'achievment-big-grey', '21', 'В разработке', 'Coming Soon');
INSERT INTO `ach_list` VALUES ('203', '2012-08-21 01:16:16', '41', '*', 'Queen Killer', '1', 'Brutal', '3000', 'Zak', 'queen-killer', 'achievment-big-grey', '22', 'В разработке', 'Coming Soon');

-- ----------------------------
-- Table structure for ach_stat
-- ----------------------------
DROP TABLE IF EXISTS `ach_stat`;
CREATE TABLE `ach_stat` (
  `idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_steam_id` varchar(50) DEFAULT NULL COMMENT 'SteamID',
  `difficulty` varchar(10) DEFAULT NULL COMMENT 'Индекс сложности (Hard, Insane, Brutal)',
  `map_id` varchar(100) DEFAULT NULL COMMENT 'Индекса карты',
  `campaign` varchar(100) DEFAULT NULL COMMENT 'Полное наименование компании',
  `campaign_id` varchar(50) DEFAULT NULL COMMENT 'Индекс кампании',
  `ach_id` int(11) unsigned DEFAULT NULL COMMENT 'Индекс ачивки',
  `requirement` int(11) unsigned DEFAULT '1' COMMENT 'Количество единиц от основного условия (condition) ачивки',
  `ach_points` int(11) unsigned DEFAULT NULL COMMENT 'Очки полученные за ачивку (сюда вписываются очки из базы с описанием ачивок)',
  `date_taken` timestamp NULL DEFAULT NULL COMMENT 'Время получения ачивки',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=53364 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Example Records of ach_stat
-- ----------------------------
INSERT INTO `ach_stat` VALUES ('1', 'STEAM_1:1:33811971', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '1', '1', '4', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('2', 'STEAM_1:1:33811971', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '2', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('3', 'STEAM_1:1:33811971', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '9', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('4', 'STEAM_1:1:33811971', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '10', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('5', 'STEAM_1:1:33811971', '*', '*', 'Jacob`s Rest', 'jacob', '24', '72364', '0', '2012-12-19 15:28:50');
INSERT INTO `ach_stat` VALUES ('6', 'STEAM_1:1:33811971', '*', '*', 'Jacob`s Rest', 'jacob', '25', '72364', '0', '2012-12-19 15:28:50');
INSERT INTO `ach_stat` VALUES ('7', 'STEAM_1:0:38117705', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '1', '1', '4', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('8', 'STEAM_1:0:38117705', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '2', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('9', 'STEAM_1:0:38117705', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '9', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('10', 'STEAM_1:0:38117705', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '10', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('11', 'STEAM_1:0:38117705', '*', '*', 'Jacob`s Rest', 'jacob', '24', '100000', '200', '2012-12-16 20:33:43');
INSERT INTO `ach_stat` VALUES ('12', 'STEAM_1:0:38117705', '*', '*', 'Jacob`s Rest', 'jacob', '25', '234662', '0', '2013-08-25 16:51:16');
INSERT INTO `ach_stat` VALUES ('13', 'STEAM_1:0:38117705', 'Hard', '*', 'Jacob`s Rest', 'jacob', '32', '50', '200', '2012-07-13 14:14:26');
INSERT INTO `ach_stat` VALUES ('14', 'STEAM_1:0:38109057', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '1', '1', '4', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('15', 'STEAM_1:0:38109057', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '2', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('16', 'STEAM_1:0:38109057', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '9', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('17', 'STEAM_1:0:38109057', 'Hard', 'ASI-Jac6-SewerJunction', 'Jacob`s Rest', 'jacob', '10', '1', '2', '2012-07-04 16:17:58');
INSERT INTO `ach_stat` VALUES ('18', 'STEAM_1:0:38109057', '*', '*', 'Jacob`s Rest', 'jacob', '24', '304', '0', '2012-07-31 13:20:52');
INSERT INTO `ach_stat` VALUES ('19', 'STEAM_1:0:38109057', '*', '*', 'Jacob`s Rest', 'jacob', '25', '304', '0', '2012-07-31 13:20:52');

-- ----------------------------
-- Table structure for base_stat
-- ----------------------------
DROP TABLE IF EXISTS `base_stat`;
CREATE TABLE `base_stat` (
  `idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time_try` timestamp NULL DEFAULT NULL COMMENT 'Время записи события в базу (обычно по завершению прохождения карты, т.е. время окончания попытки)',
  `user_steam_id` varchar(50) DEFAULT NULL,
  `points` int(11) DEFAULT NULL COMMENT 'Начисленные оки по итогам прохождения миссии',
  `difficulty` varchar(10) DEFAULT NULL COMMENT 'сложность Hard, Insane, Brutal',
  `map_id` varchar(100) DEFAULT NULL COMMENT 'имя карты',
  `campaign_id` varchar(50) DEFAULT NULL COMMENT 'Наименование компании',
  `wins` int(11) unsigned DEFAULT NULL COMMENT 'кол-во выигрышей на миссии (mission complete)',
  `losses` int(11) unsigned DEFAULT NULL COMMENT 'кол-во проигрышей на миссии (mission failed)',
  `death` int(11) unsigned DEFAULT NULL COMMENT 'сколько раз помер на миссии',
  `ff_dealt` float DEFAULT NULL COMMENT 'кол-во урона нанасенный другим игрокам',
  `ff_taken` float DEFAULT NULL COMMENT 'кол-во урона полученного от других игроков и мобов',
  `AliensKilled` int(11) unsigned DEFAULT NULL COMMENT 'кол-во убитых мобов оружием',
  `MineKills` int(11) unsigned DEFAULT NULL COMMENT 'кол-во убитых мобов огнеминами',
  `ShieldbugsKilled` int(11) unsigned DEFAULT NULL COMMENT 'количество убитых танков',
  `ParasitesKilled` int(11) unsigned DEFAULT NULL COMMENT 'кол-во убитых паразитов',
  `SentryKills` int(11) unsigned DEFAULT NULL COMMENT 'кол-во убитых мобов стрелковой турелью',
  `EggKills` int(11) unsigned DEFAULT NULL COMMENT 'Кол-во замоченных яиц',
  `MissionTimeSec` int(11) unsigned DEFAULT NULL COMMENT 'Секунд затраченное на попытку прохождения карты',
  `profile` varchar(50) DEFAULT NULL COMMENT 'Персонаж за которого играет',
  `Killer` int(11) unsigned DEFAULT NULL COMMENT 'Количество убийств своих',
  `TeamKiller` int(11) unsigned DEFAULT NULL COMMENT 'Количество убийств всей команды',
  `Suicide` int(11) unsigned DEFAULT NULL COMMENT 'Количество самоубийств',
  `c_IP` char(30) DEFAULT NULL COMMENT 'IP адрес игрока',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=304215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Example Records of base_stat
-- ----------------------------
INSERT INTO `base_stat` VALUES ('1', '2012-07-04 12:26:23', 'STEAM_1:1:34384647', '0', 'Hard', 'ASI-Jac1-LandingBay_01', 'jacob', '0', '1', '1', '202.18', '202', '0', '0', '0', '0', '0', '0', '3', '#asw_name_vegas', '0', '0', '1', '192.168.0.2');

-- ----------------------------
-- Table structure for maps
-- ----------------------------
DROP TABLE IF EXISTS `maps`;
CREATE TABLE `maps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'Индекс карты',
  `speedrun` int(11) unsigned DEFAULT NULL COMMENT 'Время спидрана для карты (сек)',
  `map_name` varchar(100) DEFAULT NULL COMMENT 'Полное наименование карты',
  `campaign` varchar(100) DEFAULT NULL COMMENT 'Наименование компании',
  `campaignid` varchar(100) DEFAULT '' COMMENT 'Индекс компании',
  `MinDifficulty` int(4) NOT NULL DEFAULT '1',
  `MaxDifficulty` int(4) NOT NULL DEFAULT '99',
  `MinHordeSize` int(4) NOT NULL DEFAULT '10',
  `MaxHordeSize` int(4) NOT NULL DEFAULT '30',
  `MinWandererSize` int(4) NOT NULL DEFAULT '2',
  `MaxWandererSize` int(4) NOT NULL DEFAULT '6',
  `asw_drone` int(3) NOT NULL DEFAULT '50',
  `asw_drone_uber` int(3) NOT NULL DEFAULT '5',
  `asw_drone_jumper` int(3) NOT NULL DEFAULT '10',
  `asw_buzzer` int(3) NOT NULL DEFAULT '20',
  `asw_ranger` int(3) NOT NULL DEFAULT '15',
  `asw_parasite` int(3) NOT NULL DEFAULT '1',
  `asw_parasite_defanged` int(3) NOT NULL DEFAULT '10',
  `asw_shieldbug` int(3) NOT NULL DEFAULT '1',
  `asw_boomer` int(3) NOT NULL DEFAULT '8',
  `asw_harvester` int(3) NOT NULL DEFAULT '3',
  `asw_mortarbug` int(3) NOT NULL DEFAULT '3',
  `asw_shaman` int(3) NOT NULL DEFAULT '3',
  `asw_queen` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maps
-- ----------------------------
INSERT INTO `maps` VALUES ('1', '*', null, 'default set', null, null, '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('2', 'ASI-Jac1-LandingBay_01', '85', 'Landing Bay', 'Jacob`s Rest', 'jacob', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('3', 'ASI-Jac1-LandingBay_02', '170', 'Cargo Elevator', 'Jacob`s Rest', 'jacob', '1', '99', '10', '30', '3', '7', '30', '5', '10', '20', '15', '1', '10', '5', '8', '5', '5', '3', '0');
INSERT INTO `maps` VALUES ('4', 'ASI-Jac2-Deima', '150', 'Deima Surface Bridge', 'Jacob`s Rest', 'jacob', '1', '99', '10', '30', '1', '3', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '2', '3', '0');
INSERT INTO `maps` VALUES ('5', 'ASI-Jac3-Rydberg', '255', 'Rydberg Reactor', 'Jacob`s Rest', 'jacob', '1', '99', '10', '30', '2', '5', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('6', 'ASI-Jac4-Residential', '150', 'SynTek Residential', 'Jacob`s Rest', 'jacob', '1', '99', '10', '30', '1', '4', '50', '5', '10', '20', '15', '1', '10', '1', '8', '2', '2', '3', '0');
INSERT INTO `maps` VALUES ('7', 'ASI-Jac6-SewerJunction', '85', 'Sewer Junction B5', 'Jacob`s Rest', 'jacob', '1', '99', '10', '30', '2', '5', '40', '5', '10', '10', '10', '5', '5', '5', '8', '5', '5', '3', '0');
INSERT INTO `maps` VALUES ('8', 'ASI-Jac7-TimorStation', '265', 'Timor Station', 'Jacob`s Rest', 'jacob', '1', '99', '10', '30', '2', '4', '70', '5', '20', '40', '30', '1', '20', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('9', 'extermination01port', '200', 'Midnight Port', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('10', 'extermination02road', '255', 'Road to Dawn', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('11', 'extermination03arctic', '190', 'Arctic Infiltration', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('12', 'extermination04area9800', '205', 'Area9800 Landingzone', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('13', 'extermination05catwalks', '215', 'Cold Catwalks', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('14', 'extermination06yanaurus', '260', 'Yanaurus Mine', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('15', 'extermination07factory', '240', 'Forgotten Factory', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('16', 'extermination08comcenter', '0', 'Communication Center', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('17', 'extermination09hospital', '435', 'Full treatment. Syntek Hospital', 'Extermination', 'extermination', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('18', 'as_paranoia1', '90', 'Unexpected encounter', 'Paranoia : Full version', 'paranoia_campaign', '1', '99', '10', '30', '2', '6', '50', '15', '10', '20', '15', '5', '10', '8', '15', '10', '10', '3', '0');
INSERT INTO `maps` VALUES ('19', 'as_paranoia2', '360', 'Hostile places', 'Paranoia : Full version', 'paranoia_campaign', '1', '99', '10', '30', '1', '2', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('20', 'as_paranoia3', '480', 'High Tension', 'Paranoia : Full version', 'paranoia_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('21', 'as_sci1_bridge', '150', 'Lana\'s Bridge', 'Lana`s Escape', 'lanasescape_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('22', 'as_sci2_sewer', '150', 'Lana\'s Sewer', 'Lana`s Escape', 'lanasescape_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('23', 'as_sci3_maintenance', '150', 'Lana\'s Maintenance', 'Lana`s Escape', 'lanasescape_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('24', 'as_sci4_vent', '135', 'Lana\'s Vents', 'Lana`s Escape', 'lanasescape_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('25', 'as_sci5_complex', '300', 'Lana\'s Complex', 'Lana`s Escape', 'lanasescape_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('26', 'bi_rescue', '140', 'BI Rescue', 'BI Rescue', 'bi_rescue', '1', '99', '10', '30', '1', '3', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '2', '3', '0');
INSERT INTO `maps` VALUES ('27', 'beginning', '105', 'Keep it up!', 'The Beginning', 'becampaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('28', 'underground', '180', 'Underground!', 'The Beginning', 'becampaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('29', 'middelsech', '360', 'Upperground', 'The Beginning', 'becampaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('30', 'ending', '150', 'A beautiful night', 'The Beginning', 'becampaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('31', 'TFT-DesertOutpost', '265', 'Insertion Point', 'Tears For Tarnor, Ch.1:Insertion', 'tarnorcampaign1', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('32', 'TFT-AbandonedMaintenance', '160', 'Abandoned Maintenance Tunnels', 'Tears For Tarnor, Ch.1:Insertion', 'tarnorcampaign1', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('33', 'TFT-Spaceport', '370', 'Oasis Colony Spaceport', 'Tears For Tarnor, Ch.1:Insertion', 'tarnorcampaign1', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('34', 'dc1-omega_city', '300', 'Omega City', 'Dead City', 'deadcity', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('35', 'dc2-breaking_an_entry', '240', 'Breaking An Entry', 'Dead City', 'deadcity', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('36', 'dc3-search_and_rescue', '390', 'Search And Rescue', 'Dead City', 'deadcity', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('37', 'ocs_1', '60', 'Storage Facility', 'Operation Cleansweep', 'operationcleansweep', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('38', 'ocs_2', '90', 'Landing Bay 7', 'Operation Cleansweep', 'operationcleansweep', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('39', 'ocs_3', '165', 'U.S.C. Medusa', 'Operation Cleansweep', 'operationcleansweep', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('40', 'xen-cathalu-labs', '180', 'Cathalu Laboratories', 'Call to Cathalu', 'cathalu', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('41', 'researchlab2', '220', 'Research Station Delta', 'Operation: Chaos Theory', 'chaostheory', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('42', 'larnok_1', '65', 'Escape The Odenatus Facility', 'Larnok', 'larnok_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('43', 'larnok_2', '205', 'Power Source', 'Larnok', 'larnok_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('44', 'larnok_3', '200', 'Kill The Queen', 'Larnok', 'larnok_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('45', 'forestentrance', '105', 'Shipping Facility', 'Research 7', 'infestedforest_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('46', 'research7', '150', 'Testing Facility', 'Research 7', 'infestedforest_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('47', 'miningcamp', '220', 'Jericho Mines', 'Research 7', 'infestedforest_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');
INSERT INTO `maps` VALUES ('48', 'themines2', '210', 'Heart of the Swarm', 'Research 7', 'infestedforest_campaign', '1', '99', '10', '30', '2', '6', '50', '5', '10', '20', '15', '1', '10', '1', '8', '3', '3', '3', '0');

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_steam_id` varchar(50) DEFAULT NULL COMMENT 'SteamID',
  `user_name` varchar(100) DEFAULT '' COMMENT 'Ник игрока',
  `current` int(2) unsigned DEFAULT '0' COMMENT 'Текущий используемый ник (флаг)',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5885 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ver
-- ----------------------------
DROP TABLE IF EXISTS `ver`;
CREATE TABLE `ver` (
  `ver` float(3,0) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ver
-- ----------------------------
INSERT INTO `ver` VALUES ('18');
