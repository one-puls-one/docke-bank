/*
 Navicat Premium Data Transfer

 Source Server         : 172.18.27.175
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : data

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 15/03/2022 07:16:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('dalksdhkja1', 'admin', '123456');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `cid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `uid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tprice` double NULL DEFAULT NULL,
  `pay` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctime` date NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `card_food`(`fid`) USING BTREE,
  INDEX `card_user`(`uid`) USING BTREE,
  CONSTRAINT `card_food` FOREIGN KEY (`fid`) REFERENCES `food` (`fid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `card_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('011c62581f504be', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-05');
INSERT INTO `card` VALUES ('05782b9fd599460', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-05');
INSERT INTO `card` VALUES ('06459f2a2925407', 'asdjlas231', 1, 'a40460622d904ad', 25, '1', '2021-04-09');
INSERT INTO `card` VALUES ('0b71961277fe43f', 'asdakjh1ds', 1, 'wqeoiuqsa12', 20, '1', '2021-04-05');
INSERT INTO `card` VALUES ('0d08bb8952594dc', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-05');
INSERT INTO `card` VALUES ('0eb3dc5eecb44f5', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-05');
INSERT INTO `card` VALUES ('11bc49786b844dd', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-05');
INSERT INTO `card` VALUES ('141f95c653e24e3', 'sadlkjl1212', 1, 'wqeoiuqsa12', 16, '1', '2021-04-05');
INSERT INTO `card` VALUES ('1c01398bea26465', 'sdahjk1221', 1, 'wqeoiuqsa12', 22, '1', '2021-04-07');
INSERT INTO `card` VALUES ('2a372989297444f', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-05');
INSERT INTO `card` VALUES ('340122ca0a1d4fe', 'sadlkjl1212', 1, 'wqeoiuqsa12', 16, '1', '2021-04-05');
INSERT INTO `card` VALUES ('386b297d7b93479', 'sadlkjl1212', 1, 'wqeoiuqsa12', 16, '1', '2021-04-02');
INSERT INTO `card` VALUES ('3a25645cdb864e9', 'sadlkjl1212', 1, 'wqeoiuqsa12', 16, '1', '2021-04-02');
INSERT INTO `card` VALUES ('3d6dfd78f9f2420', 'asdjlas231', 1, '0af9bee1d59a4df', 25, '1', '2021-04-07');
INSERT INTO `card` VALUES ('428fc347948146c', 'sadad2131', 1, 'wqeoiuqsa12', 25, '1', '2021-04-03');
INSERT INTO `card` VALUES ('4494e596eee9479', 'sadlj1jlsad', 1, 'wqeoiuqsa12', 65, '1', '2021-04-05');
INSERT INTO `card` VALUES ('4bdd77cb98f4470', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-05');
INSERT INTO `card` VALUES ('572be93003d94b4', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-02');
INSERT INTO `card` VALUES ('57940dd8f92d4bd', 'asdakjh1ds', 1, 'wqeoiuqsa12', 20, '1', '2021-04-05');
INSERT INTO `card` VALUES ('59f9d0374f724df', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-05');
INSERT INTO `card` VALUES ('5bc4f31960d548e', 'asdakjh1ds', 1, 'wqeoiuqsa12', 20, '1', '2021-04-02');
INSERT INTO `card` VALUES ('6eda849adb6548d', 'dsadsd121', 1, 'wqeoiuqsa12', 15, '1', '2021-04-03');
INSERT INTO `card` VALUES ('72b327fb4bab480', 'asdh22jdd', 1, 'wqeoiuqsa12', 15, '1', '2021-04-07');
INSERT INTO `card` VALUES ('81e7e0218d5e48f', 'asdakjh1ds', 1, '0af9bee1d59a4df', 20, '1', '2021-04-07');
INSERT INTO `card` VALUES ('8355e563678c487', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-05');
INSERT INTO `card` VALUES ('87caf7e5d1ec497', 'sadlkjl1212', 1, 'wqeoiuqsa12', 16, '1', '2021-04-05');
INSERT INTO `card` VALUES ('91de449f70fd40c', 'sdahjk1221', 1, 'a40460622d904ad', 22, '1', '2021-04-09');
INSERT INTO `card` VALUES ('a0aa2082140c401', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-05');
INSERT INTO `card` VALUES ('ad13cac4f3c3489', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-07');
INSERT INTO `card` VALUES ('c5c5d91890d2483', 'asdakjh1ds', 1, 'a40460622d904ad', 20, '1', '2021-04-09');
INSERT INTO `card` VALUES ('c77711ea32d84ac', 'asdqw2131', 1, 'wqeoiuqsa12', 12, '1', '2021-04-05');
INSERT INTO `card` VALUES ('c81433d89978464', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-05');
INSERT INTO `card` VALUES ('cabee2058b784da', 'sdahjk1221', 1, 'wqeoiuqsa12', 22, '1', '2021-04-03');
INSERT INTO `card` VALUES ('caf25c4ec18f42a', 'sdahjk1221', 1, 'wqeoiuqsa12', 22, '1', '2021-04-05');
INSERT INTO `card` VALUES ('cc8fc9a3ed03443', 'asdakjh1ds', 1, 'wqeoiuqsa12', 20, '1', '2021-04-02');
INSERT INTO `card` VALUES ('cf557c67a19840e', 'asdqw2131', 1, 'wqeoiuqsa12', 12, '1', '2021-04-07');
INSERT INTO `card` VALUES ('d28a5d56f35048d', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-05');
INSERT INTO `card` VALUES ('d37b6cc575bf46f', 'sdad2239w', 1, 'wqeoiuqsa12', 35, '1', '2021-04-03');
INSERT INTO `card` VALUES ('d3e34aa65365437', 'sadlkjl1212', 1, 'wqeoiuqsa12', 16, '1', '2021-04-05');
INSERT INTO `card` VALUES ('dab639e823c54fa', 'asdjlas231', 1, 'wqeoiuqsa12', 25, '1', '2021-04-05');
INSERT INTO `card` VALUES ('eb625c80ac8945d', 'asgdj21326', 1, 'wqeoiuqsa12', 4, '1', '2021-04-05');
INSERT INTO `card` VALUES ('ee129a44b12e44e', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-02');
INSERT INTO `card` VALUES ('f12ce0217bdf4a1', 'sdahjk1221', 1, 'wqeoiuqsa12', 22, '1', '2021-04-05');
INSERT INTO `card` VALUES ('f1b3c58ffb46496', 'sjdladj1da', 1, 'wqeoiuqsa12', 45, '1', '2021-04-05');
INSERT INTO `card` VALUES ('f4dd3060086a48b', 'sdad23178', 1, 'wqeoiuqsa12', 15, '1', '2021-04-03');
INSERT INTO `card` VALUES ('fb1b49f657074aa', 'sadlj1jlsad', 1, 'wqeoiuqsa12', 65, '1', '2021-04-05');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `fid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fpicture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fprice` double NULL DEFAULT NULL,
  `fdesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftime` date NULL DEFAULT NULL,
  `tid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `food_type`(`tid`) USING BTREE,
  CONSTRAINT `food_type` FOREIGN KEY (`tid`) REFERENCES `type` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('adjlk2131a', 'Cafe Latte', '/food/拿铁咖啡.png', 21, 'delicious', '2021-01-04', '2');
INSERT INTO `food` VALUES ('asdad1jk1', 'Cappuccino', '/food/卡布奇诺.png', 21, 'delicious', '2021-01-01', '2');
INSERT INTO `food` VALUES ('asdakjh1ds', 'Iced American', '/food/冰美式.png', 21, 'delicious', '2021-02-02', '2');
INSERT INTO `food` VALUES ('asdh22jdd', 'Snow top coffee', '/food/雪顶咖啡.png', 21, 'delicious', '2021-01-06', '2');
INSERT INTO `food` VALUES ('asdjlas231', 'Oreo ice cream', '/food/奥利奥冰淇淋.png', 21, 'delicious', '2021-01-09', '2');
INSERT INTO `food` VALUES ('asdqw2131', 'Black pepper pasta', '/food/黑椒意面.png', 12, 'delicious', '2021-01-06', '3');
INSERT INTO `food` VALUES ('asgdj21326', 'Stewed pork noodles', '/food/.卤肉宽面png', 16, 'delicious', '2021-01-13', '3');
INSERT INTO `food` VALUES ('asldkja1asd', 'Plain wide surface', '/food/素宽面.png', 15, 'delicious', '2021-02-03', '3');
INSERT INTO `food` VALUES ('aslkda1121', 'Shrimp and beef noodles', '/food/虾仁肥牛面.png', 16, 'delicious', '2021-03-02', '3');
INSERT INTO `food` VALUES ('dsadsd121', 'Beef noodles', '/food/牛肉面.png', 15, 'delicious', '2021-01-07', '3');
INSERT INTO `food` VALUES ('sadad2131', 'Set meal1', '/food/套餐1.png', 25, 'delicious', '2021-01-07', '4');
INSERT INTO `food` VALUES ('sadlj1jlsad', 'Set meal2', '/food/套餐2.png', 25, 'delicious', '2021-02-02', '4');
INSERT INTO `food` VALUES ('sadlkjl1212', 'Set meal3', '/food/套餐3.png', 25, 'delicious', '2021-01-06', '4');
INSERT INTO `food` VALUES ('sdad2239w', 'Set meal4', '/food/套餐4.png', 25, 'delicious', '2021-02-02', '4');
INSERT INTO `food` VALUES ('sdad23178', 'Set meal5', '/food/套餐5.png', 25, 'delicious', '2021-01-14', '4');
INSERT INTO `food` VALUES ('sdahjk1221', 'Ice cake', '/food/冰皮蛋糕.png', 16, 'delicious', '2021-02-02', '1');
INSERT INTO `food` VALUES ('sjdladj112', 'Yogurt Cake', '/food/酸奶蛋糕.png', 25, 'delicious', '2022-02-16', '1');
INSERT INTO `food` VALUES ('sjdladj1da', 'Mango Pudding', '/food/芒果布丁.png', 15, 'delicious', '2021-01-02', '1');
INSERT INTO `food` VALUES ('sujdsaf133', 'doughnut', '/food/甜甜圈.png', 8, 'delicious', '2022-02-23', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otime` date NULL DEFAULT NULL,
  `wait` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wstate` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `orders_user`(`uid`) USING BTREE,
  INDEX `orders_card`(`cid`) USING BTREE,
  CONSTRAINT `orders_card` FOREIGN KEY (`cid`) REFERENCES `card` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0804dfef41ba409', '72b327fb4bab480', 'wqeoiuqsa12', '2021-04-07', '6a3b71e586d34bd', '2');
INSERT INTO `orders` VALUES ('1f2db8c10bb641e', '3d6dfd78f9f2420', '0af9bee1d59a4df', '2021-04-07', '0d14a3fd624649c', '1');
INSERT INTO `orders` VALUES ('7e0a4bb592b0497', 'c5c5d91890d2483', 'a40460622d904ad', '2021-04-09', '331ea87aa70d44e', '2');
INSERT INTO `orders` VALUES ('96d6929abfec46f', 'ad13cac4f3c3489', 'wqeoiuqsa12', '2021-04-07', '6a3b71e586d34bd', '2');
INSERT INTO `orders` VALUES ('998f5b1cd12443c', '06459f2a2925407', 'a40460622d904ad', '2021-04-09', '331ea87aa70d44e', '2');
INSERT INTO `orders` VALUES ('add56d3cd45a402', 'cf557c67a19840e', 'wqeoiuqsa12', '2021-04-07', '6a3b71e586d34bd', '2');
INSERT INTO `orders` VALUES ('c0e42c88bec0498', '1c01398bea26465', 'wqeoiuqsa12', '2021-04-07', '6a3b71e586d34bd', '2');
INSERT INTO `orders` VALUES ('c33e817a90c0498', '91de449f70fd40c', 'a40460622d904ad', '2021-04-09', '331ea87aa70d44e', '2');
INSERT INTO `orders` VALUES ('ca99ec5fdc1c47f', '81e7e0218d5e48f', '0af9bee1d59a4df', '2021-04-07', '0d14a3fd624649c', '1');
INSERT INTO `orders` VALUES ('e0c6e4dbe04d4b1', 'd28a5d56f35048d', 'wqeoiuqsa12', '2021-04-05', '29e3fbe9a5f1474', '2');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `tid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpicture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ttime` date NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'cake', '/images/header1.jpg', '2020-12-30');
INSERT INTO `type` VALUES ('2', 'coffee', '/images/header2.jpg', '2021-01-09');
INSERT INTO `type` VALUES ('3', 'noodles', '/images/header1.jpg', '2020-11-20');
INSERT INTO `type` VALUES ('4', 'set meal', '/images/header2.jpg', '2021-02-02');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nike` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `utime` date NULL DEFAULT NULL,
  `acount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0af9bee1d59a4df', 'xiaowan', '123456', '13574629511', '小王', '2021-04-07', 55);
INSERT INTO `user` VALUES ('9364d81bf36b423', 'yangchen', '123456', '18183900271', '小杨', '2022-03-14', 123456789);
INSERT INTO `user` VALUES ('a40460622d904ad', 'lixuan', '123456', '17374659211', '轩怪兽', '2021-04-09', 33);
INSERT INTO `user` VALUES ('bc16a1e568e149b', 'xielei', '123456', '17374504067', '谢先生', '2021-04-07', 100);
INSERT INTO `user` VALUES ('wqeoiuqsa12', 'lihaizhen', '123456', '13574629511', '小丸子', '2021-02-03', 36);

SET FOREIGN_KEY_CHECKS = 1;
