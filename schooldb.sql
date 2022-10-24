/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : schooldb

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 24/10/2022 08:54:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Admins
-- ----------------------------
DROP TABLE IF EXISTS `Admins`;
CREATE TABLE `Admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginId` varchar(255) NOT NULL,
  `loginPwd` varchar(255) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `StudentId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StudentId` (`StudentId`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Admins
-- ----------------------------
BEGIN;
INSERT INTO `Admins` (`id`, `loginId`, `loginPwd`, `deletedAt`, `StudentId`) VALUES (1, 'abc', '4297f44b13955235245b2497399d7a93', NULL, 504);
INSERT INTO `Admins` (`id`, `loginId`, `loginPwd`, `deletedAt`, `StudentId`) VALUES (2, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 505);
INSERT INTO `Admins` (`id`, `loginId`, `loginPwd`, `deletedAt`, `StudentId`) VALUES (3, 'qwe', '4297f44b13955235245b2497399d7a93', NULL, 506);
COMMIT;

-- ----------------------------
-- Table structure for Books
-- ----------------------------
DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `publishDate` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Books
-- ----------------------------
BEGIN;
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (1, '逃走的伸子', 'https://img9.doubanio.com/view/subject/s/public/s34283035.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[日] 宫本百合子', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (2, '鬼魂目击者、侦探与唯灵论者', 'https://img1.doubanio.com/view/subject/s/public/s34266848.jpg', '2022-9', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[美]斯尔詹·斯马伊奇（Srdjan Smajic）', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (3, '失明症漫记', 'https://img2.doubanio.com/view/subject/s/public/s34269503.jpg', '2022-8-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[葡] 若泽·萨拉马戈', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (4, '黑格尔的《精神现象学》', 'https://img1.doubanio.com/view/subject/s/public/s34265307.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '（英）罗伯特•斯特恩', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (5, '清末都市的政治文化与社会统合', 'https://img2.doubanio.com/view/subject/s/public/s34273662.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '吉泽诚一郎', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (6, '金石', 'https://img2.doubanio.com/view/subject/s/public/s34287411.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[美]陈云倩', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (7, '您可疑的近况', 'https://img2.doubanio.com/view/subject/s/public/s34257333.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '(韩) 金劲旭', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (8, '看不见的女性', 'https://img9.doubanio.com/view/subject/s/public/s34274534.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[英] 卡罗琳·克里亚多·佩雷斯', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (9, '写作脑科学', 'https://img1.doubanio.com/view/subject/s/public/s34270659.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '杨滢（@屠龙的胭脂井）', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (10, '一个人可以在家告别人生吗？', 'https://img9.doubanio.com/view/subject/s/public/s34260605.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[日] 上野千鹤子', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (11, '流行音乐与资本主义', 'https://img3.doubanio.com/view/subject/s/public/s34278680.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[日]毛利嘉孝', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (12, '英国国家美术馆·细究名画（全9册）', 'https://img2.doubanio.com/view/subject/s/public/s34300481.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[英]马乔 里·E. 威斯曼', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (13, '浪的景观', 'https://img9.doubanio.com/view/subject/s/public/s34269145.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '周嘉宁', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (14, '看得见风景的房间', 'https://img9.doubanio.com/view/subject/s/public/s34273994.jpg', '2022-9', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[英] E. M. 福斯特(E. M.Forster)', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (15, '爱丽丝漫游奇境与镜中奇遇', 'https://img9.doubanio.com/view/subject/s/public/s34273315.jpg', '2022-9', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[英]刘易斯·卡罗尔', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (16, '“废除文科学部”的冲击', 'https://img9.doubanio.com/view/subject/s/public/s34273015.jpg', '2022-8-1', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[日] 吉见俊哉', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (17, '软盘的秘密', 'https://img2.doubanio.com/view/subject/s/public/s34286671.jpg', '2022-9', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[法] 菲利普·瓦莱特 编绘', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (18, '哈扎尔辞典', 'https://img2.doubanio.com/view/subject/s/public/s34285122.jpg', '2022-8', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[塞尔维亚] 米洛拉德·帕维奇', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (19, '当尘埃落尽', 'https://img1.doubanio.com/view/subject/s/public/s34245479.jpg', '2022-8-1', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[加]米歇尔·拉巴利亚蒂', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (20, '我为什么要听你的', 'https://img1.doubanio.com/view/subject/s/public/s34268478.jpg', '2022-9-15', '2022-09-11 04:00:17', '2022-09-11 04:00:17', NULL, '[法]  伊莎贝尔·娜扎雷-阿加  著', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (21, '一本书', NULL, '2022-9-5', '2022-09-23 08:42:11', '2022-09-23 08:42:11', NULL, 'abc', '<p>互联网从业者间有着这样的共识，只有适度倾斜资源，才能赋能整体业务。这不禁令我深思。互联网大厂管理人员间流传着这样一句话，找到正确的赛道，选择正确的商业模式，才能将项目落地。也许这句话就是最好的答案。互联网间流传着这样一句话，好的产品要分析用户痛点，击穿用户心智。这让我明白了问题的抓手，互联网为什么有这么多黑话，到底到底该如何落地？而这些问题并不是痛点，而我们需要聚焦的关键是，互联网研发人员间流传着这样一句话，在细分领域找到抓手，形成方法论，才能对外输出，反哺生态。这句话语虽然很短，但沉淀之后真的能发现痛点。解决互联网为什么有这么多黑话的问题，首先要找到抓手。 所以，总的来说，解决互联网为什么有这么多黑话的问题，首先要找到抓手。 所以，互联网从业者间有着这样的共识，只有适度倾斜资源，才能赋能整体业务。也许这句话就是最好的答案。总的来说，互联网从业者间有着这样的共识，只有适度倾斜资源，才能赋能整体业务。这不禁令我深思。我们都必须串联相关生态，去思考有关互联网为什么有这么多黑话的问题。</p><p>　　互联网运营人员间流传着这样一句话，做精细化运营，向目标发力，才能获得影响力。这句话语虽然很短，但沉淀之后真的能发现痛点。我们都必须串联相关生态，去思考有关互联网为什么有这么多黑话的问题。</p><p><img src=\"/origin/1663922521086-obm5mr.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (22, '三体', NULL, '2022-09-28', '2022-09-28 06:44:18', '2022-09-28 06:44:18', NULL, '刘慈欣', '');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (23, '三体-黑暗森林', NULL, '2022-09-28', '2022-09-28 06:45:46', '2022-09-28 06:53:24', NULL, '刘慈欣', '<p>人类无法在地球上生存，只能逃向外太空</p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (24, '书1', NULL, '2022-10-03', '2022-10-22 06:51:30', '2022-10-22 06:51:30', NULL, '译名', '<p>发；发； <span style=\"color: rgb(255, 173, 210);\">发福利</span></p><p><span style=\"color: rgb(255, 173, 210);\">dafa哈哈</span></p><p><strong>测试富文本编辑</strong></p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (25, '书2', NULL, '2022-10-03', '2022-10-22 06:51:36', '2022-10-22 06:51:36', NULL, '译名', '<p>发；发； <span style=\"color: rgb(255, 173, 210);\">发福利</span></p><p><span style=\"color: rgb(255, 173, 210);\">dafa哈哈</span></p><p><strong>测试富文本编辑</strong></p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (26, '书3', NULL, '2022-10-03', '2022-10-22 06:51:49', '2022-10-22 06:51:49', NULL, '译名', '<p>发；发； <span style=\"color: rgb(255, 173, 210);\">发福利</span></p><p><span style=\"color: rgb(255, 173, 210);\">dafa哈哈</span></p><p><strong>测试富文本编辑</strong></p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (27, '书4', NULL, '2022-10-10', '2022-10-22 06:52:27', '2022-10-22 06:52:27', NULL, '佚名', '<p>发；发； <span style=\"color: rgb(255, 173, 210);\">发福利</span></p><p><span style=\"color: rgb(255, 173, 210);\">dafa哈哈</span></p><p><strong>测试富文本编辑</strong></p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (28, '书5', NULL, '2022-10-10', '2022-10-22 06:53:20', '2022-10-22 06:53:20', NULL, '佚名', '<p>发；发； <span style=\"color: rgb(255, 173, 210);\">发福利</span></p><p><span style=\"color: rgb(255, 173, 210);\">dafa哈哈</span></p><p><strong>测试富文本编辑</strong></p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (29, '瘟疫之夜', NULL, '2022-10-10', '2022-10-22 06:55:09', '2022-10-22 06:55:09', NULL, ' 奥尔罕·帕慕克', '<p style=\"text-indent: 2em; text-align: start;\">❉ 诺奖得主帕慕克构思四十年的力作，深度思考东西方文化差异的百科全书式小说，近年最值得一读的外国文学作品！这部充满悬疑色彩的史诗，讲述了追寻正义的英雄与面对死亡的恐惧相互缠斗的跌宕历程。</p><p style=\"text-indent: 2em; text-align: start;\">❉ 苏丹、公主、医生、密探、囚徒……众多人物命运交织，呈现奥斯曼帝国晚期社会全景</p><p style=\"text-indent: 2em; text-align: start;\">❉ 我们该如何度过灾难？当残酷的死亡向我们逼近，有的人会孤独生活，走入内心，写作、思考生活的意义；另一些人会走到街上，寻找家人和朋友，希望从社群中得到安慰。</p><p style=\"text-indent: 2em; text-align: start;\">❉ 封面采用帕慕克手绘插画，书内包含作者手绘地图，细致呈现小说中的城市风貌</p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (30, '我的奋斗 6', NULL, '2022-10-14', '2022-10-22 06:56:59', '2022-10-22 06:56:59', NULL, '李树波', '<p style=\"text-indent: 2em; text-align: start;\">21世纪重大文学事件之一 克瑙斯高 “文学自杀之作”《我的奋斗》系列大结局</p><p style=\"text-indent: 2em; text-align: start;\">挪威作家卡尔•奥韦•克瑙斯高的六卷本自传小说《我的奋斗》与希特勒的野心无关，是作者四十多年成长与生活的自述，六卷主题分别为死亡、爱情、童年、青春、梦想、思考。书中用流水笔调记叙平凡生活，直白坦诚，有着“自虐般的真实和琐碎”，又在日常细节中呈现了动人的敏感。</p><p style=\"text-indent: 2em; text-align: start;\">本书为《我的奋斗》系列的最后一部，如同一块落下的巨石，将读者对前五部的记忆和理解完整激荡而出。从第一部出版时在家人与朋友间引起的不快与争议出发，以妻子琳达的抑郁症治疗与恢复结束，包括四百页对希特勒、纳粹主义和邪恶本质的思索，以及保罗•策兰一首关于大屠杀的诗的细读。全书在个人的外部世界与内部世界间穿插，探讨文学与现实、私人与公共界限，以及个体生活与社会力量不可调和的紧张关系。</p>');
INSERT INTO `Books` (`id`, `name`, `imgurl`, `publishDate`, `createdAt`, `updatedAt`, `deletedAt`, `author`, `description`) VALUES (31, '人为什么会生病？', NULL, '2022-10-07', '2022-10-22 14:53:17', '2022-10-22 14:53:17', NULL, 'Why Do People Get Ill? : Exploring the Mind-Body Connection', '<p style=\"text-indent: 2em; text-align: start;\"><strong>孤独会危害人的身体健康？</strong></p><p style=\"text-indent: 2em; text-align: start;\"><span style=\"background-color: rgb(145, 213, 255);\">压抑真实感受的人更容易患癌症？</span></p><p style=\"text-indent: 2em; text-align: start;\">精神压力会使类风湿关节炎发作？</p><p style=\"text-indent: 2em; text-align: start;\">亲人离世会导致哮喘发作？</p><p style=\"text-indent: 2em; text-align: start;\">……</p><p style=\"text-indent: 2em; text-align: start;\">当心灵受了伤，身体也会记得</p><p style=\"text-indent: 2em; text-align: start;\">★</p>');
COMMIT;

-- ----------------------------
-- Table structure for Classes
-- ----------------------------
DROP TABLE IF EXISTS `Classes`;
CREATE TABLE `Classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `openDate` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Classes
-- ----------------------------
BEGIN;
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (1, '高三1班', '2019-09-02 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (2, '高三2班', '2018-03-04 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (3, '高三3班', '2009-07-28 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (4, '高三4班', '1998-02-15 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (5, '高三5班', '1976-01-02 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (6, '高三6班', '1975-01-03 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (7, '高三7班', '2015-11-19 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (8, '高三8班', '1979-11-06 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (9, '高三9班', '2021-06-27 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (10, '高三10班', '1991-09-08 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (11, '高三11班', '1973-10-20 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (12, '高三12班', '1984-10-28 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (13, '高三13班', '1973-02-12 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (14, '高三14班', '1987-04-07 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (15, '高三15班', '2015-04-30 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (16, '高三16班', '1999-03-17 00:00:00', NULL);
INSERT INTO `Classes` (`id`, `name`, `openDate`, `deletedAt`) VALUES (17, '幼儿园大班', '2022-09-27 23:14:09', NULL);
COMMIT;

-- ----------------------------
-- Table structure for Students
-- ----------------------------
DROP TABLE IF EXISTS `Students`;
CREATE TABLE `Students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birthday` datetime NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ClassId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `Classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Students
-- ----------------------------
BEGIN;
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (1, '任娜', '2008-07-29 00:00:00', 0, '12597841278', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (2, '魏霞', '1978-09-10 00:00:00', 0, '13896217317', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (3, '杜秀兰', '2000-02-13 00:00:00', 1, '19584891169', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (4, '邓秀兰', '1972-03-21 00:00:00', 0, '19286332566', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (5, '孟艳', '2007-05-10 00:00:00', 0, '11737334174', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (6, '常秀英', '1977-11-17 00:00:00', 0, '17128938607', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (7, '高娟', '2001-01-02 00:00:00', 1, '15684952604', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (8, '金平', '2012-11-05 00:00:00', 0, '14996893257', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (9, '尹伟', '2012-05-08 00:00:00', 1, '14546951455', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (10, '崔杰', '2004-05-04 00:00:00', 0, '18428794811', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (11, '余超', '2010-10-21 00:00:00', 0, '13388813621', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (12, '谭娜', '1980-11-27 00:00:00', 0, '19811993573', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (13, '孟娟', '1984-04-19 00:00:00', 0, '13314652413', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (14, '卢芳', '2010-07-21 00:00:00', 0, '18155556259', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (15, '易涛', '1999-01-18 00:00:00', 0, '15296171164', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (16, '段艳', '2020-01-05 00:00:00', 1, '16472125352', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (17, '潘刚', '2018-01-04 00:00:00', 1, '11156393142', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (18, '吕秀兰', '2015-02-21 00:00:00', 0, '15875557245', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (19, '乔洋', '2007-10-31 00:00:00', 0, '11662627892', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (20, '曾霞', '1997-08-31 00:00:00', 0, '19012474175', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (21, '张桂英', '1971-04-29 00:00:00', 1, '16709395148', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (22, '薛霞', '2012-12-17 00:00:00', 1, '10687778828', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (23, '崔强', '2005-02-04 00:00:00', 0, '17829355763', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (24, '邹艳', '1986-10-10 00:00:00', 0, '12642965689', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (25, '崔艳', '2002-06-14 00:00:00', 1, '16725413124', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (26, '冯娟', '2006-08-14 00:00:00', 1, '10862468017', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (27, '顾强', '2003-05-05 00:00:00', 0, '17257445214', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (28, '田敏', '1989-12-21 00:00:00', 1, '15777247433', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (29, '锺磊', '2004-07-27 00:00:00', 1, '16378928213', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (30, '胡娟', '2008-04-19 00:00:00', 0, '10591336149', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (31, '乔军', '1981-07-22 00:00:00', 0, '14439521358', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (32, '袁磊', '1973-03-17 00:00:00', 0, '12293358228', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (33, '赖秀兰', '1974-10-11 00:00:00', 0, '16283587414', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (34, '程娟', '1988-03-17 00:00:00', 0, '18614261345', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (35, '崔芳', '1989-02-03 00:00:00', 0, '18985713762', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (36, '黄刚', '1984-11-06 00:00:00', 1, '18441286513', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (37, '雷娟', '2011-02-27 00:00:00', 0, '16624112445', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (38, '袁勇', '1999-02-11 00:00:00', 0, '10878761150', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (39, '郑强', '2006-09-28 00:00:00', 0, '16791179051', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (40, '梁丽', '1979-02-23 00:00:00', 0, '12711716368', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (41, '郑洋', '1981-03-28 00:00:00', 0, '10112048678', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (42, '龙超', '1979-12-13 00:00:00', 0, '17329387495', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (43, '潘静', '2003-04-07 00:00:00', 0, '14110967951', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (44, '刘平', '2014-08-30 00:00:00', 0, '11792108654', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (45, '黄勇', '1998-07-20 00:00:00', 1, '13773630045', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (46, '汪霞', '1992-09-29 00:00:00', 0, '13630523833', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (47, '唐秀兰', '1990-02-08 00:00:00', 0, '15241966854', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (48, '易涛', '1990-01-01 00:00:00', 1, '16301424093', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (49, '朱磊', '2012-10-22 00:00:00', 0, '19824859908', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (50, '郑磊', '1970-01-31 00:00:00', 0, '16472428487', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (51, '姚强', '1994-01-30 00:00:00', 1, '14211338238', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (52, '刘丽', '2015-01-26 00:00:00', 1, '10262341588', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (53, '冯平', '2003-06-17 00:00:00', 0, '12404852176', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (54, '萧超', '1984-03-16 00:00:00', 1, '10568205683', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (55, '方秀英', '2016-12-04 00:00:00', 0, '18785211425', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (56, '段静', '1992-12-29 00:00:00', 0, '16223578660', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (57, '杨秀兰', '1985-04-03 00:00:00', 0, '17143263448', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (58, '崔秀英', '1993-09-04 00:00:00', 0, '19397194089', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (59, '袁娟', '1973-06-21 00:00:00', 0, '14325744792', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (60, '阎平', '2012-10-05 00:00:00', 0, '14121751668', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (61, '常艳', '2009-06-25 00:00:00', 0, '12572754861', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (62, '江秀英', '2017-11-21 00:00:00', 1, '16183174738', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (63, '尹强', '1992-09-03 00:00:00', 1, '15111802721', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (64, '苏艳', '1985-10-07 00:00:00', 0, '19993465377', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (65, '汤秀兰', '2000-10-20 00:00:00', 0, '11141107608', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (66, '姚明', '1995-07-26 00:00:00', 1, '10644695323', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (67, '钱涛', '2012-07-23 00:00:00', 0, '17643119278', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (68, '贺涛', '1974-06-20 00:00:00', 0, '12376066145', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (69, '傅秀英', '2017-09-20 00:00:00', 0, '13858514717', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (70, '程强', '1997-05-23 00:00:00', 0, '17433342331', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (71, '郭强', '2018-01-28 00:00:00', 0, '14985144781', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (72, '戴超', '2006-03-26 00:00:00', 0, '11015201640', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (73, '罗涛', '2015-12-14 00:00:00', 0, '18347187876', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (74, '许霞', '2022-08-03 00:00:00', 0, '11654776976', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (75, '白超', '2014-07-11 00:00:00', 0, '16882853353', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (76, '邹平', '1982-10-10 00:00:00', 0, '17585554484', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (77, '谢娟', '1989-07-08 00:00:00', 0, '14749417216', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (78, '谢丽', '1980-04-13 00:00:00', 0, '15884559125', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (79, '刘桂英', '1998-03-30 00:00:00', 1, '17843253021', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (80, '李艳', '1989-06-03 00:00:00', 0, '17734227325', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (81, '熊霞', '2016-11-17 00:00:00', 1, '13409157662', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (82, '潘秀英', '1983-10-30 00:00:00', 0, '15903741577', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (83, '秦洋', '1998-04-27 00:00:00', 0, '19469760349', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (84, '郑洋', '1983-04-12 00:00:00', 0, '10876976848', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (85, '赵洋', '2007-08-01 00:00:00', 0, '15886986297', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (86, '钱洋', '2019-03-18 00:00:00', 0, '19568261796', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (87, '郝芳', '1971-04-15 00:00:00', 0, '16338270811', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (88, '赵静', '2011-05-18 00:00:00', 0, '16986383735', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (89, '王杰', '1973-05-11 00:00:00', 1, '16871477253', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (90, '白杰', '1972-12-03 00:00:00', 0, '12839973257', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (91, '刘洋', '2008-03-07 00:00:00', 0, '13436209964', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (92, '魏军', '1971-03-05 00:00:00', 1, '19044981373', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (93, '龙刚', '1993-03-03 00:00:00', 0, '13373155347', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (94, '苏强', '1990-04-15 00:00:00', 1, '18106413625', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (95, '姜明', '2009-09-22 00:00:00', 0, '13127278314', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (96, '叶霞', '1992-03-22 00:00:00', 0, '18625513582', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (97, '谢桂英', '2000-01-02 00:00:00', 0, '18298092152', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (98, '张军', '2004-09-02 00:00:00', 0, '13065585566', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (99, '范涛', '2007-02-05 00:00:00', 0, '13325104075', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (100, '崔丽', '1991-04-12 00:00:00', 1, '17643617072', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (101, '邱军', '2003-06-02 00:00:00', 1, '17225418807', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (102, '杨磊', '2011-07-07 00:00:00', 1, '15672530986', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (103, '董艳', '1982-07-10 00:00:00', 0, '13410424794', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (104, '锺霞', '1988-08-23 00:00:00', 1, '13482712708', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (105, '徐丽', '1983-10-01 00:00:00', 0, '15119138282', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (106, '袁洋', '2003-03-31 00:00:00', 0, '11166564573', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (107, '金娜', '2010-06-27 00:00:00', 1, '18867244798', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (108, '徐敏', '1988-07-27 00:00:00', 0, '12214057478', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (109, '吕超', '1978-08-07 00:00:00', 0, '16648641640', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (110, '王艳', '2019-01-14 00:00:00', 1, '17230237445', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (111, '郝娜', '2019-03-16 00:00:00', 0, '14467377821', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (112, '郝娟', '2019-06-16 00:00:00', 0, '13777773582', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (113, '罗强', '1976-01-28 00:00:00', 1, '14842636177', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (114, '钱静', '1995-06-28 00:00:00', 1, '17776947044', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (115, '龚磊', '2006-08-16 00:00:00', 0, '13315814765', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (116, '冯芳', '1996-04-09 00:00:00', 0, '18330377366', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (117, '朱秀兰', '1989-10-04 00:00:00', 1, '13494633644', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (118, '姜敏', '1996-04-06 00:00:00', 0, '13079031467', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (119, '梁磊', '2000-01-16 00:00:00', 0, '16295523426', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (120, '汪强', '2003-06-02 00:00:00', 0, '16669404312', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (121, '罗涛', '1990-06-13 00:00:00', 0, '15467673508', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (122, '于静', '1992-05-04 00:00:00', 1, '15137232599', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (123, '赵娜', '2021-03-02 00:00:00', 0, '19704464149', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (124, '龚强', '1987-08-26 00:00:00', 0, '17955014504', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (125, '蔡静', '1986-07-09 00:00:00', 1, '10517475517', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (126, '田秀兰', '1999-02-16 00:00:00', 0, '17298646272', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (127, '郭超', '2005-05-22 00:00:00', 0, '15725269438', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (128, '赵强', '2011-08-16 00:00:00', 0, '14716454688', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (129, '陆平', '2006-03-06 00:00:00', 0, '11862392304', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (130, '黎静', '2010-07-19 00:00:00', 1, '13516674811', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (131, '龙芳', '1998-02-03 00:00:00', 1, '16115482120', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (132, '谭杰', '2011-04-16 00:00:00', 0, '11237181640', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (133, '秦杰', '2021-12-31 00:00:00', 0, '14147598257', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (134, '郭娟', '1982-04-23 00:00:00', 0, '12218185817', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (135, '唐磊', '1999-10-28 00:00:00', 0, '11358363274', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (136, '史明', '1988-11-19 00:00:00', 1, '17023175795', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (137, '黎霞', '2003-02-10 00:00:00', 0, '15318767028', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (138, '龚勇', '1970-09-16 00:00:00', 0, '16190452581', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (139, '康军', '2013-01-27 00:00:00', 0, '13417128225', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (140, '田勇', '1997-05-29 00:00:00', 1, '13253346585', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (141, '邓敏', '1994-10-16 00:00:00', 1, '17268845341', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (142, '谢丽', '1970-12-28 00:00:00', 0, '13885212573', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (143, '沈明', '1998-03-03 00:00:00', 0, '15843547223', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (144, '戴霞', '1986-01-26 00:00:00', 0, '12931223284', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (145, '任洋', '1985-01-31 00:00:00', 1, '18825280075', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (146, '锺军', '1995-06-10 00:00:00', 0, '11155678503', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (147, '孙杰', '1992-12-28 00:00:00', 1, '11644232941', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (148, '邵洋', '1970-05-20 00:00:00', 0, '12180444592', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (149, '李平', '2014-02-05 00:00:00', 0, '15538710847', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (150, '苏明', '1997-04-07 00:00:00', 0, '15856987965', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (151, '陈娟', '1989-08-12 00:00:00', 0, '18065431754', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (152, '宋刚', '1997-09-10 00:00:00', 0, '12652810459', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (153, '石秀兰', '2015-10-20 00:00:00', 1, '12613900456', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (154, '乔娜', '2001-04-30 00:00:00', 0, '17149112046', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (155, '钱强', '1979-07-01 00:00:00', 0, '15865828168', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (156, '龚静', '2016-08-07 00:00:00', 1, '11796681181', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (157, '沈刚', '1987-06-25 00:00:00', 1, '15338388718', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (158, '易明', '1985-05-06 00:00:00', 1, '16930622786', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (159, '戴伟', '1988-05-04 00:00:00', 0, '17951846629', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (160, '戴涛', '2016-10-11 00:00:00', 1, '13498346356', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (161, '谭秀兰', '2006-02-16 00:00:00', 0, '14007741527', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (162, '袁秀兰', '1988-07-07 00:00:00', 0, '13406419494', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (163, '钱霞', '1999-09-16 00:00:00', 0, '18754125177', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (164, '李芳', '1979-06-14 00:00:00', 1, '14770210699', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (165, '韩芳', '1982-10-24 00:00:00', 0, '12023944460', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (166, '萧强', '1985-10-08 00:00:00', 0, '19674497901', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (167, '崔刚', '2003-08-21 00:00:00', 1, '12814750517', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (168, '万敏', '1985-02-13 00:00:00', 1, '10075354612', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (169, '郭艳', '2004-01-29 00:00:00', 0, '11463106864', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (170, '姚杰', '2004-03-25 00:00:00', 0, '12423655843', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (171, '乔超', '2017-11-28 00:00:00', 0, '15510766131', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (172, '石静', '1975-05-28 00:00:00', 0, '15688764732', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (173, '谭磊', '1993-12-13 00:00:00', 0, '15539496978', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (174, '冯桂英', '1997-02-14 00:00:00', 0, '18811102251', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (175, '熊娜', '2003-11-16 00:00:00', 1, '14134385160', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (176, '周丽', '2021-02-22 00:00:00', 0, '18479734125', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (177, '何杰', '2018-09-08 00:00:00', 0, '13394565677', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (178, '文强', '1990-08-20 00:00:00', 0, '10236415613', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (179, '石明', '2007-01-09 00:00:00', 0, '12784746823', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (180, '徐洋', '2017-02-24 00:00:00', 0, '13893186584', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (181, '史娜', '1994-10-17 00:00:00', 0, '19104222759', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (182, '袁伟', '2018-10-08 00:00:00', 0, '13963751132', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (183, '蒋丽', '1982-04-13 00:00:00', 1, '13702877647', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (184, '邵强', '2005-01-10 00:00:00', 1, '16069842578', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (185, '阎丽', '1976-06-09 00:00:00', 0, '14477810503', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (186, '田娜', '2021-07-14 00:00:00', 1, '16488361067', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (187, '黄涛', '1978-02-22 00:00:00', 0, '19283937293', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (188, '李磊', '2016-10-02 00:00:00', 0, '19837921255', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (189, '汪平', '2003-08-23 00:00:00', 0, '12316476729', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (190, '谭超', '1992-03-16 00:00:00', 0, '13483751051', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (191, '夏强', '1987-03-06 00:00:00', 0, '16430312019', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (192, '唐芳', '2015-03-27 00:00:00', 1, '13414452774', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (193, '曾明', '1976-10-31 00:00:00', 0, '16692823337', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (194, '方刚', '2000-10-05 00:00:00', 0, '13976773601', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (195, '姚明', '2011-06-20 00:00:00', 0, '11405524524', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (196, '龙明', '1972-12-12 00:00:00', 0, '14176817132', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (197, '陆丽', '2012-09-25 00:00:00', 0, '12744813045', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (198, '武秀兰', '1998-01-05 00:00:00', 0, '14573645786', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (199, '毛敏', '1986-01-09 00:00:00', 0, '18288772573', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (200, '戴强', '1988-02-24 00:00:00', 0, '12557964751', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (201, '范明', '2012-09-16 00:00:00', 0, '12465967971', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (202, '龚敏', '1972-06-05 00:00:00', 0, '17146857138', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (203, '于军', '2001-02-10 00:00:00', 1, '16468331036', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (204, '龚霞', '2010-11-03 00:00:00', 0, '16956436412', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (205, '周秀英', '2010-08-23 00:00:00', 0, '14484956822', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (206, '武娜', '1974-12-14 00:00:00', 1, '12061421297', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (207, '汤芳', '1992-02-08 00:00:00', 0, '13377734567', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (208, '万杰', '1996-09-06 00:00:00', 0, '12635212016', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (209, '贾艳', '2009-09-17 00:00:00', 1, '18136677486', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (210, '谢勇', '2020-12-16 00:00:00', 0, '17722361024', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (211, '廖娟', '1973-07-29 00:00:00', 1, '11738302327', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (212, '汤芳', '1993-11-18 00:00:00', 1, '12006554671', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (213, '雷敏', '1984-08-11 00:00:00', 0, '11756269932', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (214, '黄强', '1982-07-07 00:00:00', 0, '11540318448', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (215, '叶静', '2020-10-12 00:00:00', 0, '17328675622', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (216, '许伟', '2010-09-20 00:00:00', 0, '16153471134', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (217, '武秀英', '1984-01-09 00:00:00', 0, '18586958297', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (218, '范刚', '2015-11-28 00:00:00', 0, '16166404173', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (219, '田秀兰', '1987-03-09 00:00:00', 0, '14764457427', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (220, '李秀兰', '2011-05-03 00:00:00', 1, '14643745411', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (221, '高超', '1991-09-29 00:00:00', 1, '17324474923', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (222, '蒋强', '1992-03-09 00:00:00', 1, '10251426129', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (223, '贾平', '2010-10-11 00:00:00', 0, '14318634178', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (224, '阎秀英', '1988-05-07 00:00:00', 0, '18365442493', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (225, '曾芳', '1979-09-04 00:00:00', 0, '12786783233', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (226, '程娟', '1983-03-15 00:00:00', 1, '19842223730', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (227, '万霞', '1987-07-21 00:00:00', 0, '15381752743', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (228, '范娜', '2013-02-17 00:00:00', 1, '14484321903', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (229, '任洋', '2020-11-14 00:00:00', 0, '13558836621', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (230, '雷刚', '1997-10-11 00:00:00', 0, '13055347355', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (231, '杨磊', '2020-02-24 00:00:00', 1, '15872304342', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (232, '侯秀英', '1995-03-28 00:00:00', 1, '19703822773', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (233, '汤杰', '2014-11-28 00:00:00', 0, '16463146543', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (234, '于军', '1979-05-15 00:00:00', 0, '17723617223', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (235, '陈平', '1993-03-02 00:00:00', 0, '16726621452', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (236, '范静', '1973-01-27 00:00:00', 1, '16487455529', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (237, '陆杰', '1995-03-06 00:00:00', 0, '18568705191', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (238, '陈丽', '2011-08-31 00:00:00', 0, '10503637225', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (239, '崔秀兰', '2000-07-24 00:00:00', 0, '16723142519', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (240, '阎刚', '1993-01-27 00:00:00', 1, '11079156109', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (241, '程杰', '2007-01-18 00:00:00', 0, '16619718823', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (242, '崔伟', '1977-11-27 00:00:00', 0, '16154576850', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (243, '江超', '2009-12-03 00:00:00', 0, '15754432174', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (244, '史勇', '2017-04-12 00:00:00', 1, '13725822806', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (245, '孟磊', '2006-01-05 00:00:00', 0, '12539408717', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (246, '尹勇', '1995-01-07 00:00:00', 0, '12313073723', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (247, '薛静', '2014-04-16 00:00:00', 1, '14398765575', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (248, '萧敏', '1981-11-04 00:00:00', 0, '19746433236', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (249, '金杰', '1976-12-23 00:00:00', 1, '14362120484', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (250, '孙明', '2006-12-10 00:00:00', 0, '17241508517', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (251, '姜涛', '1974-03-10 00:00:00', 0, '11556961301', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (252, '汤丽', '2004-07-10 00:00:00', 0, '10878414638', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (253, '秦娟', '1989-03-27 00:00:00', 1, '18572757225', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (254, '田秀兰', '1983-03-08 00:00:00', 1, '18128165248', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (255, '史霞', '2007-12-07 00:00:00', 0, '16252716628', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (256, '杨杰', '1993-07-05 00:00:00', 1, '18360239926', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (257, '侯刚', '2000-09-16 00:00:00', 1, '18222046140', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (258, '白明', '2020-07-07 00:00:00', 0, '18076714765', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (259, '许明', '1999-03-25 00:00:00', 0, '16618851814', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (260, '萧刚', '1973-05-05 00:00:00', 1, '13353061344', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (261, '方平', '2002-10-31 00:00:00', 0, '14838134552', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (262, '侯勇', '2010-05-14 00:00:00', 0, '18543653163', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (263, '侯明', '2013-07-23 00:00:00', 1, '15033071819', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (264, '高磊', '2004-02-19 00:00:00', 0, '10723797758', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (265, '苏杰', '2006-09-24 00:00:00', 1, '15144770655', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (266, '毛洋', '2013-07-05 00:00:00', 0, '15331340749', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (267, '董静', '1997-09-04 00:00:00', 0, '11861233127', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (268, '雷秀英', '1994-03-10 00:00:00', 1, '15589231187', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (269, '邱秀兰', '2014-06-20 00:00:00', 1, '16295575326', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (270, '康洋', '2003-04-08 00:00:00', 1, '14243651882', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (271, '秦超', '1995-01-04 00:00:00', 0, '10372886822', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (272, '卢军', '1988-06-19 00:00:00', 0, '18096682685', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (273, '文涛', '1998-11-04 00:00:00', 0, '15056857560', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (274, '吕勇', '1991-08-22 00:00:00', 0, '13856446700', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (275, '熊军', '1993-07-27 00:00:00', 0, '15344733385', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (276, '孔刚', '2010-05-05 00:00:00', 0, '18551259729', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (277, '邵杰', '1978-01-18 00:00:00', 0, '14864608278', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (278, '叶敏', '2010-11-01 00:00:00', 1, '16980652453', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (279, '郭涛', '1985-07-18 00:00:00', 0, '18743324238', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (280, '马明', '1993-06-11 00:00:00', 0, '15066718286', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (281, '姜平', '1988-01-06 00:00:00', 0, '18347165193', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (282, '于涛', '2017-07-19 00:00:00', 1, '12479874877', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (283, '韩磊', '2003-11-22 00:00:00', 0, '15761123926', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (284, '郝勇', '1975-06-27 00:00:00', 1, '13473170126', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (285, '姚娟', '1981-09-03 00:00:00', 1, '15511970438', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (286, '熊勇', '1985-07-28 00:00:00', 0, '14765439271', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (287, '丁平', '1986-10-29 00:00:00', 0, '12837466714', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (288, '马刚', '2015-12-22 00:00:00', 0, '15831480746', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (289, '邱超', '1982-01-02 00:00:00', 0, '12842177666', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (290, '董强', '1994-07-23 00:00:00', 0, '11354618433', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (291, '毛桂英', '2015-05-20 00:00:00', 0, '15654747276', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (292, '田磊', '1983-01-13 00:00:00', 1, '18779702041', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (293, '苏杰', '2019-09-13 00:00:00', 1, '11478753540', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (294, '黄强', '2020-07-12 00:00:00', 1, '13562518074', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (295, '程艳', '1992-10-23 00:00:00', 0, '17552838183', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (296, '任丽', '1978-05-18 00:00:00', 1, '18519536318', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (297, '汪洋', '1992-09-19 00:00:00', 0, '19446687766', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (298, '方芳', '2002-09-25 00:00:00', 0, '16505713876', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (299, '锺军', '2021-05-05 00:00:00', 1, '16228265591', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (300, '汪霞', '2014-03-28 00:00:00', 0, '17331733259', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (301, '廖勇', '1998-05-31 00:00:00', 1, '14698976336', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (302, '史勇', '1986-06-18 00:00:00', 0, '17710694735', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (303, '郝静', '1972-05-02 00:00:00', 0, '14354577423', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (304, '金强', '2008-09-28 00:00:00', 1, '13477163713', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (305, '范艳', '2020-06-06 00:00:00', 0, '16083540692', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (306, '白秀兰', '2011-04-04 00:00:00', 0, '13149503932', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (307, '苏娟', '2002-12-20 00:00:00', 0, '14475368338', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (308, '顾秀兰', '1981-07-16 00:00:00', 0, '18845763821', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (309, '梁超', '2020-01-08 00:00:00', 0, '13824826812', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (310, '贾平', '1996-01-25 00:00:00', 0, '12451461344', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (311, '曾刚', '1992-08-10 00:00:00', 0, '14276241337', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (312, '万霞', '1998-08-25 00:00:00', 1, '17118082630', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (313, '孟平', '2013-04-29 00:00:00', 0, '16356848923', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (314, '唐秀兰', '1990-06-10 00:00:00', 0, '17562282184', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (315, '杜平', '1981-09-29 00:00:00', 0, '19582311465', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (316, '黎明', '1978-05-12 00:00:00', 1, '10739591337', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (317, '邱娟', '1989-09-23 00:00:00', 0, '13137969338', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (318, '杨杰', '1993-06-01 00:00:00', 0, '18216167073', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (319, '卢平', '1970-03-27 00:00:00', 0, '18765532550', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (320, '乔伟', '2003-03-10 00:00:00', 0, '11428661042', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (321, '马磊', '2017-10-23 00:00:00', 0, '14434491119', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (322, '薛娟', '2010-12-12 00:00:00', 1, '12942844782', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (323, '谭平', '1976-07-22 00:00:00', 0, '18538216564', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (324, '陆涛', '1998-11-08 00:00:00', 0, '18383753188', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (325, '傅超', '2019-05-11 00:00:00', 1, '18367375814', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (326, '杜娟', '2019-08-02 00:00:00', 0, '13174716256', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (327, '方洋', '2009-05-26 00:00:00', 1, '11797144714', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (328, '吴刚', '1988-08-17 00:00:00', 0, '13149222747', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (329, '任刚', '2017-09-09 00:00:00', 1, '11758675354', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (330, '杨桂英', '2021-05-29 00:00:00', 1, '14765944885', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (331, '邹平', '1974-06-07 00:00:00', 1, '13628785629', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (332, '何强', '1981-01-09 00:00:00', 1, '18677244858', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (333, '卢洋', '1979-04-08 00:00:00', 0, '15586845157', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (334, '董艳', '1995-12-19 00:00:00', 0, '16866732957', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (335, '邹超', '1990-02-03 00:00:00', 0, '18375242826', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (336, '许磊', '2014-04-07 00:00:00', 0, '18219826696', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (337, '范磊', '2011-06-05 00:00:00', 0, '16236626812', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (338, '贺勇', '2011-07-26 00:00:00', 0, '11332777722', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (339, '崔娟', '1977-10-24 00:00:00', 0, '16448210417', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (340, '尹秀英', '1984-11-02 00:00:00', 0, '18696772119', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (341, '陆刚', '1980-12-08 00:00:00', 0, '18427701516', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (342, '邵桂英', '1986-06-02 00:00:00', 1, '13334856158', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (343, '刘伟', '2021-03-17 00:00:00', 1, '15386082863', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (344, '任磊', '1975-11-12 00:00:00', 0, '13565892218', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (345, '林芳', '1988-07-24 00:00:00', 0, '15036751086', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (346, '秦洋', '1997-04-06 00:00:00', 1, '11752967824', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (347, '胡艳', '2004-07-17 00:00:00', 0, '16983464562', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (348, '陆军', '2007-08-30 00:00:00', 0, '16742122281', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (349, '叶桂英', '1992-10-21 00:00:00', 1, '15936750257', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (350, '汪杰', '2003-01-18 00:00:00', 1, '18189711541', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (351, '孟强', '2014-08-25 00:00:00', 1, '12881852478', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (352, '许明', '1978-09-25 00:00:00', 0, '19772415215', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (353, '蒋霞', '1976-05-14 00:00:00', 1, '12160902274', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (354, '杨明', '1997-05-10 00:00:00', 0, '14058534962', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (355, '程秀兰', '1984-04-12 00:00:00', 1, '16032827545', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (356, '余洋', '2004-05-31 00:00:00', 0, '10672215565', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (357, '汤超', '1989-04-29 00:00:00', 0, '17624908487', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (358, '田军', '1972-02-24 00:00:00', 1, '18543754747', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (359, '郑涛', '1980-06-30 00:00:00', 0, '13273451248', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (360, '许秀英', '1991-07-25 00:00:00', 1, '11064967807', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (361, '蔡芳', '1996-08-30 00:00:00', 0, '19831671556', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (362, '许勇', '2003-08-10 00:00:00', 1, '11446421529', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (363, '乔超', '2018-04-15 00:00:00', 1, '12725222777', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (364, '蒋超', '1994-11-10 00:00:00', 0, '10622524594', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (365, '汤杰', '2010-10-26 00:00:00', 1, '13143413487', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (366, '姚超', '1979-12-04 00:00:00', 0, '17789110811', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (367, '程涛', '2005-08-11 00:00:00', 1, '13258759524', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (368, '蔡明', '2019-10-04 00:00:00', 0, '12418543581', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (369, '蔡桂英', '1972-05-30 00:00:00', 0, '18260529667', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (370, '魏磊', '2000-10-31 00:00:00', 1, '17153850785', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (371, '孟霞', '1974-10-03 00:00:00', 1, '12711271216', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (372, '崔娟', '1988-09-13 00:00:00', 1, '17673011768', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (373, '段伟', '2005-04-03 00:00:00', 0, '13472143374', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (374, '易霞', '1995-05-02 00:00:00', 0, '16250427379', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (375, '姜涛', '2003-05-15 00:00:00', 0, '11363353633', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (376, '金明', '1995-09-07 00:00:00', 1, '18999483033', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (377, '赵刚', '1988-04-03 00:00:00', 0, '18472831894', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (378, '郝杰', '1988-09-16 00:00:00', 1, '18330717826', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (379, '谢杰', '1991-09-03 00:00:00', 0, '12229451797', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (380, '贺静', '2010-03-21 00:00:00', 0, '18413555271', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (381, '张桂英', '2011-09-26 00:00:00', 1, '11513615157', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (382, '任丽', '1997-08-13 00:00:00', 0, '11128391393', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (383, '顾娜', '1982-11-13 00:00:00', 1, '15343286651', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (384, '吴敏', '1985-11-23 00:00:00', 1, '10627538322', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (385, '陈霞', '1973-01-05 00:00:00', 1, '10163324658', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (386, '梁磊', '1996-05-02 00:00:00', 1, '13329758860', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (387, '陈强', '1990-06-18 00:00:00', 1, '14948630434', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (388, '陆明', '2022-07-23 00:00:00', 0, '10819760963', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (389, '邹丽', '2005-07-20 00:00:00', 0, '15005167473', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (390, '郭明', '2001-07-02 00:00:00', 0, '13276125341', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (391, '龚娜', '1979-11-30 00:00:00', 1, '19666671247', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (392, '刘超', '2021-05-19 00:00:00', 0, '12113218525', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (393, '罗秀英', '1982-07-26 00:00:00', 0, '14977305544', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (394, '姜刚', '2017-08-02 00:00:00', 0, '19722353738', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (395, '郝桂英', '2016-11-10 00:00:00', 1, '11133843122', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (396, '许刚', '1971-04-05 00:00:00', 1, '18242788472', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (397, '夏霞', '1977-07-18 00:00:00', 0, '12072174318', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (398, '张明', '1998-04-04 00:00:00', 0, '13112567222', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (399, '董霞', '2008-01-04 00:00:00', 1, '12457674286', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (400, '宋丽', '2006-07-23 00:00:00', 1, '15178623372', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (401, '钱刚', '2014-11-12 00:00:00', 1, '16707827052', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (402, '曾强', '1996-11-08 00:00:00', 0, '17473160594', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (403, '韩霞', '2007-08-21 00:00:00', 0, '13908231747', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (404, '史磊', '1974-04-06 00:00:00', 0, '10982894496', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (405, '张洋', '1999-12-10 00:00:00', 1, '15142467665', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (406, '秦娟', '1980-05-12 00:00:00', 0, '14388265735', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (407, '方杰', '2018-11-25 00:00:00', 0, '11724382363', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (408, '秦秀兰', '2002-05-21 00:00:00', 0, '17825348708', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (409, '萧艳', '2020-02-06 00:00:00', 1, '14105388118', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (410, '常明', '2013-08-23 00:00:00', 0, '16139369132', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (411, '马芳', '2021-07-23 00:00:00', 0, '14585855048', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (412, '段秀兰', '1979-02-23 00:00:00', 1, '13401030466', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (413, '梁平', '1987-04-11 00:00:00', 0, '14181523710', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (414, '崔秀英', '1976-02-03 00:00:00', 1, '16449453447', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (415, '姜秀兰', '1984-10-21 00:00:00', 0, '12714035857', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (416, '黄秀兰', '2003-10-11 00:00:00', 0, '13637187308', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (417, '冯艳', '1976-10-23 00:00:00', 0, '18007573061', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (418, '易军', '1989-11-10 00:00:00', 0, '15553978640', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (419, '侯刚', '2012-07-08 00:00:00', 0, '15262877802', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (420, '胡秀英', '2012-12-14 00:00:00', 0, '13571681542', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (421, '宋艳', '2002-01-30 00:00:00', 0, '14961253335', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (422, '谭芳', '1978-01-22 00:00:00', 0, '18039133544', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (423, '于霞', '1984-04-21 00:00:00', 0, '17222233618', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (424, '张刚', '1978-09-13 00:00:00', 0, '18684360827', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (425, '程艳', '2006-01-09 00:00:00', 0, '13329700757', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (426, '朱艳', '1979-12-04 00:00:00', 0, '11741018476', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (427, '蒋娟', '2021-12-07 00:00:00', 0, '19487582065', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (428, '孙娜', '1980-11-16 00:00:00', 0, '18548791720', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (429, '王洋', '2018-02-23 00:00:00', 0, '12648823017', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (430, '熊芳', '1974-03-07 00:00:00', 0, '15987962735', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (431, '方霞', '1984-11-13 00:00:00', 0, '13276935232', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (432, '沈明', '2008-05-23 00:00:00', 0, '16331225679', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (433, '卢秀兰', '1998-01-15 00:00:00', 0, '12504865587', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (434, '史娜', '1977-01-17 00:00:00', 0, '13644830753', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (435, '谭洋', '1999-12-27 00:00:00', 0, '16661237918', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (436, '常娜', '2009-06-06 00:00:00', 1, '18856196758', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (437, '卢秀兰', '2019-04-03 00:00:00', 0, '15227696421', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (438, '文明', '1996-04-02 00:00:00', 1, '11566646981', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (439, '龙娟', '1996-12-30 00:00:00', 0, '10572877465', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (440, '武伟', '1976-03-18 00:00:00', 0, '15696823102', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (441, '邵伟', '2006-05-20 00:00:00', 0, '12317142015', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (442, '李勇', '2022-03-20 00:00:00', 0, '11885850550', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (443, '李秀兰', '1984-12-30 00:00:00', 0, '14824263214', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (444, '冯丽', '2011-06-05 00:00:00', 1, '17873410215', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (445, '沈霞', '1982-11-12 00:00:00', 0, '14045327177', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (446, '赖平', '2015-07-05 00:00:00', 0, '14814558305', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (447, '程平', '2016-08-06 00:00:00', 1, '15334226879', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (448, '黎勇', '2010-12-05 00:00:00', 0, '14657429537', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (449, '武洋', '1972-03-05 00:00:00', 1, '14753121456', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (450, '熊军', '1996-01-08 00:00:00', 0, '12742413690', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (451, '段静', '1976-02-25 00:00:00', 0, '16739253265', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (452, '宋丽', '2009-04-15 00:00:00', 1, '16501030388', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (453, '锺敏', '2012-12-18 00:00:00', 1, '17677617508', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (454, '姜静', '1988-09-30 00:00:00', 1, '11608748763', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (455, '康强', '1979-10-13 00:00:00', 0, '12576741515', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (456, '邵杰', '1987-11-04 00:00:00', 1, '15058563877', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (457, '廖明', '2006-03-02 00:00:00', 1, '12576371718', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (458, '杜芳', '2002-03-03 00:00:00', 1, '16458232452', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (459, '万霞', '2018-11-03 00:00:00', 0, '16334775249', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (460, '汪芳', '2013-06-10 00:00:00', 1, '11781680424', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (461, '常霞', '2007-05-10 00:00:00', 0, '16817145154', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (462, '魏娜', '2005-08-17 00:00:00', 0, '15937615518', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (463, '郝艳', '1987-06-06 00:00:00', 1, '18834554689', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (464, '李芳', '1996-10-11 00:00:00', 0, '18806345077', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (465, '白敏', '1981-08-03 00:00:00', 1, '14658935156', NULL, 3);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (466, '周强', '1970-04-19 00:00:00', 0, '15258348462', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (467, '魏秀英', '2018-10-15 00:00:00', 1, '19528516558', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (468, '傅芳', '2002-12-19 00:00:00', 1, '10318748674', NULL, 1);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (469, '文勇', '1990-12-13 00:00:00', 0, '12098486708', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (470, '史桂英', '1973-10-21 00:00:00', 1, '18607781706', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (471, '龚洋', '2011-09-23 00:00:00', 0, '17745717787', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (472, '白娟', '2012-04-22 00:00:00', 0, '13154004540', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (473, '尹娜', '2006-04-08 00:00:00', 0, '16981983383', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (474, '潘勇', '1990-04-28 00:00:00', 0, '13920442234', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (475, '史艳', '1976-05-03 00:00:00', 0, '16876652528', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (476, '邱伟', '2015-04-28 00:00:00', 0, '14332020775', NULL, 14);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (477, '萧杰', '1991-07-12 00:00:00', 1, '18776368609', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (478, '杜洋', '1985-01-13 00:00:00', 0, '15522179083', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (479, '熊勇', '1994-10-09 00:00:00', 0, '12727246756', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (480, '田勇', '1998-03-09 00:00:00', 0, '18430704331', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (481, '彭强', '1975-08-05 00:00:00', 0, '18877795268', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (482, '陆艳', '2013-03-30 00:00:00', 0, '11315427571', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (483, '曾洋', '1979-03-17 00:00:00', 1, '15548386560', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (484, '雷涛', '1998-07-17 00:00:00', 1, '13643114378', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (485, '贾伟', '1996-01-14 00:00:00', 1, '15750187343', NULL, 16);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (486, '武娟', '1991-05-24 00:00:00', 1, '14686077737', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (487, '林秀英', '2007-11-04 00:00:00', 0, '19411255522', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (488, '梁涛', '2008-04-04 00:00:00', 0, '14177868734', NULL, 8);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (489, '梁杰', '2018-11-15 00:00:00', 0, '12032074768', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (490, '林丽', '2015-09-07 00:00:00', 0, '12437591579', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (491, '徐艳', '1986-02-22 00:00:00', 0, '16459705288', NULL, 2);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (492, '蔡丽', '1977-09-21 00:00:00', 0, '12467532246', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (493, '金涛', '1972-06-05 00:00:00', 0, '10222615863', NULL, 4);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (494, '邵丽', '1972-09-11 00:00:00', 1, '14829224125', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (495, '乔涛', '2011-10-23 00:00:00', 0, '11556458694', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (496, '邓秀英', '1983-08-13 00:00:00', 0, '16417225474', NULL, 11);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (497, '杨伟', '1971-05-04 00:00:00', 0, '15858172157', NULL, 10);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (498, '崔芳', '1994-04-20 00:00:00', 0, '15885472956', NULL, 15);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (499, '谢秀英', '2017-06-07 00:00:00', 1, '14869517503', NULL, 7);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (500, '林娟', '1996-04-11 00:00:00', 1, '14405127291', NULL, 5);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (501, '崔明', '1978-12-26 00:00:00', 1, '19982748073', NULL, 6);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (502, '墨菲特', '2022-04-07 00:00:00', 1, '12853115110', NULL, 9);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (503, '成哥', '2016-01-14 00:00:00', 1, '17553972779', NULL, 13);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (504, '徐阳', '2015-05-01 00:00:00', 1, '13445671234', NULL, 12);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (505, 'admin', '2015-05-06 00:00:00', 0, '13511002244', NULL, 17);
INSERT INTO `Students` (`id`, `name`, `birthday`, `sex`, `mobile`, `deletedAt`, `ClassId`) VALUES (506, '李娜', '2016-06-01 00:00:00', 1, '13212345678', NULL, 17);
COMMIT;

-- ----------------------------
-- Table structure for SysMenus
-- ----------------------------
DROP TABLE IF EXISTS `SysMenus`;
CREATE TABLE `SysMenus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `component` varchar(255) NOT NULL,
  `redirect` varchar(255) DEFAULT NULL,
  `meta_sort` int NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_icon` varchar(255) DEFAULT NULL,
  `meta_keep_alive` tinyint(1) NOT NULL,
  `meta_hidden` tinyint(1) NOT NULL,
  `meta_always_show` tinyint(1) NOT NULL,
  `meta_affix` tinyint(1) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of SysMenus
-- ----------------------------
BEGIN;
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (1000, '-1', '/commendation', 'Commendation', 0, NULL, 'LAYOUT', '/commendation/list', 1000, '表彰管理', 'Commendation', 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (1010, '1000', 'list', 'CommendationList', 1, 'commend_list', '/commendation/index', NULL, 1010, '表彰列表', NULL, 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (1020, '1000', 'add', 'CommendationAdd', 1, 'commend_add', '/commendation/add', NULL, 1020, '新增表彰', NULL, 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (1030, '1000', 'edit', 'CommendationEdit', 1, 'commend_edit', '/commendation/edit', NULL, 1030, '编辑表彰', NULL, 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (1040, '1000', 'detail', 'CommendationDetail', 1, 'commend_detail', '/commendation/detail', NULL, 1040, '表彰明细', NULL, 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (2000, '-1', '/organization', 'Organization', 0, NULL, 'LAYOUT', '/organization/index', 2000, '组织管理', 'Organization', 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (2010, '2000', 'index', 'OrganizationIndex', 1, 'org_index', '/organization/index', NULL, 2010, '组织列表', NULL, 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (2020, '2000', 'add', 'OrganizationAdd', 1, 'org_add', '/organization/add', NULL, 2020, '新增组织', NULL, 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (2030, '2000', 'edit', 'OrganizationEdit', 1, 'org_edit', '/organization/edit', NULL, 2030, '编辑组织', NULL, 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (3000, '-1', '/tree', 'Tree', 0, NULL, 'LAYOUT', NULL, 3000, '组织树', 'Tree', 0, 0, 0, 0, NULL);
INSERT INTO `SysMenus` (`id`, `parent_id`, `path`, `name`, `type`, `permission`, `component`, `redirect`, `meta_sort`, `meta_title`, `meta_icon`, `meta_keep_alive`, `meta_hidden`, `meta_always_show`, `meta_affix`, `deletedAt`) VALUES (4000, '-1', 'https://github.com/', 'GitHub', 0, NULL, 'LAYOUT', NULL, 4000, 'Github', 'Github', 0, 0, 0, 0, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
