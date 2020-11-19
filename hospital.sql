/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 19/11/2020 23:52:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dno` int(0) NOT NULL AUTO_INCREMENT COMMENT '科室编号',
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室名',
  PRIMARY KEY (`dno`) USING BTREE,
  UNIQUE INDEX `name`(`dname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (9, '中医科');
INSERT INTO `department` VALUES (6, '五官科');
INSERT INTO `department` VALUES (10, '传染病科');
INSERT INTO `department` VALUES (5, '儿科');
INSERT INTO `department` VALUES (16, '其他科室');
INSERT INTO `department` VALUES (1, '内科');
INSERT INTO `department` VALUES (2, '外科');
INSERT INTO `department` VALUES (3, '妇产科');
INSERT INTO `department` VALUES (12, '整形美容科');
INSERT INTO `department` VALUES (14, '生殖中心');
INSERT INTO `department` VALUES (4, '男科');
INSERT INTO `department` VALUES (8, '皮肤性病科');
INSERT INTO `department` VALUES (11, '精神心理科');
INSERT INTO `department` VALUES (7, '肿瘤科');
INSERT INTO `department` VALUES (13, '营养科');
INSERT INTO `department` VALUES (15, '麻醉医学科');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `did` int(0) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `cardno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号\r\n',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `sex` int(0) NOT NULL COMMENT '性别',
  `birthday` date NOT NULL COMMENT '出生年月日',
  `age` int(0) NOT NULL COMMENT '年龄',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `education` int(0) NOT NULL COMMENT '学历',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`did`) USING BTREE,
  UNIQUE INDEX `cardno`(`cardno`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '扁鹊', '10000001', '15511111111', 1, '2020-11-07', 30, 'bianque@doctor.com', 1, '扁鹊，生卒年不详，姬姓，秦氏，名越人，春秋战国时期名医，渤海郡鄚(今雄县鄚州镇)人。');
INSERT INTO `doctor` VALUES (2, '华佗', '10000002', '15522222222', 1, '2020-11-07', 30, 'huatuo@doctor.com', 2, '华佗（约公元145年－公元208年），字元化，一名旉，沛国谯县（今安徽亳州）人，东汉末年著名的医学家。');
INSERT INTO `doctor` VALUES (3, '张仲景', '10000003', '15533333333', 1, '2020-11-07', 30, 'zhangzhongjing@doctor.com', 3, '张仲景（约公元150～154年—约公元215～219年），名机，字仲景，东汉南阳涅阳县（今河南省邓州市穰东镇张寨村）人。东汉末年著名医学家，被后人尊称为医圣。');
INSERT INTO `doctor` VALUES (4, '李时珍', '10000004', '15544444444', 1, '2020-11-07', 30, 'lishizhen@doctor.com', 4, '李时珍（1518年7月3日－1593年），字东璧，晚年自号濒湖山人，湖广黄州府蕲州（今湖北省蕲春县）人，明代著名医药学家。');
INSERT INTO `doctor` VALUES (5, '安道全', '10000005', '15555555555', 1, '2020-11-07', 30, 'andaoquan@doctor.com', 1, '安道全是《水浒传》中的人物，绰号神医，建康府人氏。宋江让张顺去建康府请安道全，安道全无奈，上了梁山。梁山大聚义时，成为一百零八将之一，排第五十六位，上应地灵星，负责医治梁山好汉。征方腊中被皇帝调入宫中。');
INSERT INTO `doctor` VALUES (6, '钟南山', '10000006', '15566666666', 1, '1936-10-20', 84, 'zhongnanshan@doctor.com', 2, '钟南山，男，汉族，中共党员，1936年10月出生于江苏南京，福建厦门人，呼吸内科学家，广州医科大学附属第一医院国家呼吸系统疾病临床医学研究中心主任，中国工程院院士 ，中国医学科学院学部委员 ，中国抗击非典型肺炎的领军人物。');
INSERT INTO `doctor` VALUES (7, '亨利·诺尔曼·白求恩', '10000007', '15577777777', 1, '1890-03-04', 49, 'baiqiuen@doctor.com', 3, '白求恩，全名亨利·诺尔曼·白求恩（Henry Norman Bethune，1890年3月4日—1939年11月12日） ，加拿大共产党员，国际主义战士，著名胸外科医师。');
INSERT INTO `doctor` VALUES (8, '弗罗伦斯·南丁格尔', '10000008', '15588888888', 2, '1820-05-13', 90, 'nandinggeer@doctor.com', 4, '弗罗伦斯·南丁格尔（英语：Florence Nightingale，1820年5月12日－1910年8月13日），英国护士和统计学家。');
INSERT INTO `doctor` VALUES (9, '希波克拉底', '10000009', '15599999999', 1, '2020-11-07', 30, 'xibokeladi@doctor.com', 1, '希波克拉底（古希腊文：Ἱπποκράτης，前460年——前370年）为古希腊伯里克利时代的医师，被西方尊为“医学之父”，西方医学奠基人。');
INSERT INTO `doctor` VALUES (10, '皇甫谧', '10000010', '15600000000', 1, '2020-11-07', 30, 'huangpumi@doctor.com', 2, '皇甫谧（mì）（215年—282年），幼名静，字士安，自号玄晏先生。安定郡朝那县（今甘肃省灵台县）人，后徙居新安（今河南新安县）。三国西晋时期学者、医学家、史学家，东汉名将皇甫嵩曾孙。');
INSERT INTO `doctor` VALUES (11, '葛洪', '10000011', '15611111111', 1, '2020-11-07', 30, 'gehong@doctor.com', 3, '葛洪(283—363)，字稚川，自号抱朴子，丹阳郡句容(今江苏句容县)人，东晋道教理论家、著名炼丹家和医药学家，世称小仙翁。');
INSERT INTO `doctor` VALUES (12, '孙思邈', '10000012', '15622222222', 1, '2020-11-07', 30, 'sunsimiao@doctor.com', 4, '孙思邈（541年—682年，存在争议），京兆华原（今陕西省铜川市耀州区）人，相传为楚大夫屈原的后人，唐代医药学家、道士，被后人尊称为“药王”。');
INSERT INTO `doctor` VALUES (13, '钱乙', '10000013', '15633333333', 1, '2020-11-07', 30, 'qianyi@doctor.com', 1, '钱乙，字仲阳，宋代东平人，约生于北宋仁宗至徽宗年间(约公元1032~1113年)，享年82年，是我国宋代著名的儿科医家。');
INSERT INTO `doctor` VALUES (14, '马希麟', '10000014', '15644444444', 1, '1892-01-02', 83, 'maxilin@doctor.com', 2, '马希麟，被后世誉为医仙。年轻立志行医，经过多年潜心学医，博览医书，因其专攻医术，素重医德，济世扶伤，而医术闻名。他精通于内外妇儿各科，在噎嗝、反胃二症及辩癫、狂、痫之异治卓越有识。');
INSERT INTO `doctor` VALUES (15, '叶天士', '10000015', '15655555555', 1, '1666-01-02', 79, 'yetianshi@doctor.com', 3, '叶天士（1666年—1745年），名桂，字天士，号香岩，别号南阳先生。江苏吴县（今江苏苏州）人。祖籍安徽歙县，其高祖叶封山从安徽歙县蓝田村迁居苏州，居上津桥畔，故叶桂晚年又号上津老人。是清代著名医学家，四大温病学家之一。');
INSERT INTO `doctor` VALUES (16, '张三', '10000016', '15666666666', 1, '2020-11-08', 30, 'zhangsan@doctor.com', 4, '张三');
INSERT INTO `doctor` VALUES (17, '李四', '10000017', '15677777777', 1, '2020-11-08', 30, 'lisi@doctor.com', 1, '李四');
INSERT INTO `doctor` VALUES (18, '赵四', '10000018', '15688888888', 1, '2020-11-11', 30, 'zhaosi@doctor.com', 2, '赵四');
INSERT INTO `doctor` VALUES (19, '刘能', '10000019', '15699999999', 1, '2020-11-11', 30, 'liuneng@doctor.com', 3, '刘能');

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `mid` int(0) NOT NULL COMMENT '药品编号',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `inprice` double NOT NULL COMMENT '进价',
  `salprice` double NOT NULL COMMENT '售价',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `type` int(0) NOT NULL COMMENT '药品类型',
  `descs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简单描述',
  `qualitydate` int(0) NOT NULL COMMENT '保质期',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `producefirm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `readme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服用说明',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`mid`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES (1, '2a8eb436-b11c-41c7-b7ba-b4e797425777.jpg', 8.35, 9.6, '小儿氨酚黄那敏颗粒(护彤)', 3, '适用于缓解儿童普通感冒及流行性感冒引起的发热、头痛、四肢酸痛、打喷嚏、流鼻涕、鼻塞、咽痛等症状。', 24, '1.用药3-7天，症状未缓解，请咨询医师或药师。 2.服用本品期间不得饮酒或含有酒精的饮料。 3.1岁以下儿童应在医师指导下使用。 4.不能同时服用与本品成份相似的其他抗感冒药。 5.肝、肾功能不全者慎用。 6.如服用过量或出现严重不良反应，应立即就医。 7.对本品过敏者禁用，过敏体质者慎用。 8.本品性状发生改变时禁止使用。 9.请将本品放在儿童不能接触的地方。 10.儿童必须在成人监护下使用。 11.如正在使用其他药品，使用本品前请咨询医师或药师。', '哈药集团制药六厂', '温开水冲服', '严重肝肾功能不全者禁用');
INSERT INTO `medicine` VALUES (2, '2dfadb6f-4081-4135-b57b-e1271a25300e.jpg', 19, 23, '布洛芬混悬液(美林)', 3, '用于儿童普通感冒或流行性感冒引起的发热', 36, '1.本品与其他解热、镇痛、抗炎药物同用时可增加胃肠道的不良反应，并可导致溃疡。2.本品与肝素、双香豆素等抗凝药同用时，可导致凝血酶原时间延长，增加出血倾向。3.本品与地高辛、甲氨蝶呤口服降血糖药同用时，能使这些药物的血药浓度增高，不宜同用。4.本品与呋噻米 (呋喃苯胺酸) 同用时，后者的排钠和降压作用减弱，与抗高血压药同用时也降低后者的降压效果。5.如正在服用其他药品，使用本品前请咨询医师或药师。', '上海强生制药有限公司', '成人一次15-20毫升,一日3-4次', '1.对其他非甾体抗炎药过敏者禁用。 2.对阿司匹林过敏的哮喘患者禁用。');
INSERT INTO `medicine` VALUES (3, '5b108913-8dba-41ee-9ce4-6977c65c3b94.jpg', 9.75, 10, '尼美舒利颗粒(瑞芝清)', 3, '本品为非甾体抗炎药，具有抗炎、镇痛、解热作用，可用于慢性关节炎症（如类风湿性关节炎和骨关节炎等）', 24, '1.根据控制症状的需要，在最短治疗时间内使用最低有效剂量，可以使不良反应降到最低。 2.如果治疗无效请终止本品的治疗。 3.长期应用应监测肝肾心功能等检查。 4.罕见本品引起严重肝损伤的报道，致死性报道更为罕见。服用本品治疗期间出现肝损伤症状（如厌食、恶心、呕吐、腹痛、疲倦、尿赤）的患者及肝功能检查出现异常的患者应该被终止治疗。这些患者不应该继续服用本品。有报导显示本品短期服用后引起肝损害，其中绝大多数属于可逆性病变。 5.服用本品进行治疗期间必须避免同时使用已知的肝损害性药物与过量饮酒，因为任何一种因素', '海南康芝药业股份有限公司', '本品依据临床实际情况采用尽可能短的疗程。口服，成人，一次0.05-0.1g，每日2次，餐后服用。儿童用药见常用剂量为5mg/kg体重/天，分2至3次服用，其它注意见【儿童用药】项。', '1.已知对尼美舒利或本品中任何成份过敏者。 2.具有对乙酰水杨酸或其它非甾体类抗炎药过敏史者(支气管痉挛、鼻炎、风疹)。 3.禁用于冠状动脉搭桥手术(CABG)围手术期疼痛的治疗。 4.对尼美舒利具有肝毒性反应病史者。 5.有应用非甾体抗炎药后发生胃肠道出血或穿孔病史的患者。 6.患有活动性消化道溃疡/出血，脑血管出血或其它活动性出血/出血性疾病者，或者既往曾复发溃疡/出血的患者。 7.严重凝血障碍者。 8.严重心衰患者。 9.严重肾功能损害患者。 10.肝功能损害患者。');
INSERT INTO `medicine` VALUES (4, '6d93e1c5-7113-416a-97c4-8808f7ce8fd3.jpg', 10.8, 14.13, '复方氨酚烷胺片(感康)', 3, '适用于缓解普通感冒及流行性感冒引起的发热、头痛、四肢酸痛、打喷嚏、流鼻涕、鼻塞、咽痛等症状。', 36, '按规定计量服用，每日用量不可超过2片。儿童、孕妇使用及对任一组份过敏或慎用者请咨询医师或药师。哺乳期妇女禁用。本品应放在儿童不能手及的地方。服用本品时避免饮用含酒精的饮料。服用本品可能会引起轻度嗜睡，因此不应驾驶或操纵机器，以免发生事故。不能同时服用含有与本品成份相似的其它抗感冒药。 8.服用过量或有严重反应时请立即去医院就医。', '吉林省吴太感康药业有限公司', '口服。成人，一次1片，一日2次。', '严重肝肾功能不全者禁用');
INSERT INTO `medicine` VALUES (5, '8bb6ea99-3c7a-489c-8ead-83c880cee96e.jpg', 20.3, 24.2, '阿莫西林克拉维酸钾片', 3, '本品适用于敏感菌引起的各种感染', 24, '1.一般： 尽管本品具有氨苄青霉素类抗生素毒性低的性质，但仍建议在延长治疗期间定期检查一些器官功能，包括：肾、肝或造血功能。单核细胞增多症的病人服用氨苄青霉素后，较多病人会出现红斑疹。因此单核细胞增多症的病人应禁用氨苄青霉素类抗生素。治疗期间有出现由霉素或细菌引起的双重感染的可能。如出现双重感染，应停药或采取合适的方法继续治疗。 2.患者须知： 用餐时服用本品，以减轻胃肠道副作用。许多抗生素均会引起腹泻，如出现严重腹泻或持续腹泻2-3天以上，请咨询你的医生。 3.警告： 据报道在青霉素治疗过程中有病人发生', '广州白云山医药集团股份有限公司白云山制药总厂', '口服', '青霉素皮试阳性反应者、对本品及其他青霉素类药物过敏者及传染性单核细胞增多症患者禁用');
INSERT INTO `medicine` VALUES (6, '189d16f2-a6a2-44a8-baed-49db7ef2591b.jpg', 13.7, 16.75, '阿莫西林胶囊(联邦阿莫仙)', 3, '溶血链球菌、肺炎链球菌、葡萄球菌或流感嗜血杆菌所致中耳炎、鼻窦炎、咽炎、扁桃体炎等上呼吸道感染', 48, '1.用药前必须详细询问病人病史及过敏史，排除有青霉素本人或家族过敏史及有过敏性疾患病人的情况下，口服阿莫仙胶囊可免做青霉素皮试。2.传染性单核细胞增多症患者应用本品易发生皮疹，应避免使用。3.疗程较长患者应检查肝肾功能和血常规。4.阿莫西林可导致采用Benedit或Fehling试剂的尿糖试验出现假阳性。5.下列情况慎用：有哮喘，枯草热等过敏性疾病史者。老年人和肾功能严重损害时可能需调整剂量。', '珠海联邦制药股份有限公司中山分公司', '口服。成人一次0.5g，每6～8小时1次，一日剂量不超过4g。', '青霉素过敏及青霉素皮肤试验阳性患者禁用。');
INSERT INTO `medicine` VALUES (7, 'a05387eb-cc4d-4673-a4e8-81c12c9fabf7.jpg', 12.4, 13.6, '氨麻苯美片(白加黑)', 3, '本品适用于治疗和减轻感冒引起的发热、头痛、周身四肢酸痛、喷嚏、流涕、鼻塞、咳嗽等症状', 24, '1.用药3-7天，症状未缓解，请咨询医师或药师。 2.服用本品期间不得饮酒或含有酒精的饮料。 3.不能同时服用与本品成份相似的其他抗感冒药。 4.心脏病、高血压、甲状腺疾病、糖尿病、前列腺肥大、青光眼、抑郁症、哮喘等患者以及老年人应在医师指导下使用。 5.服药期间不得驾驶机、车、船、从事高空作业、机械作业及操作精密仪器。 6.孕妇及哺乳期妇女慎用。 7.肝、肾功能不全者慎用。 8.运动员慎用。 9.如服用过量或出现严重不良反应，应立即就医。 10.对本品过敏者禁用，过敏体质者慎用。 11.本品性状发生改变', '拜耳医药保健有限公司启东分公司', '日用片：口服，成人和12岁以上儿童，一次1~2片，一日2次或白天每6小时服1次。夜用片：口服，成人和12岁以上儿童，睡前服1~2片。', '严重肝肾功能不全者禁用');
INSERT INTO `medicine` VALUES (8, 'aa00f7e8-0170-483d-a7cd-8d398a69d8d7.jpg', 9.3, 10, '小儿氨酚黄那敏颗粒(小快克)', 3, '适用于缓解儿童普通感冒及流行性感冒引起的发热、头痛、四肢酸痛、打喷嚏、流鼻涕、鼻塞、咽痛等症状', 24, '1.用药3-7天，症状未缓解，请咨询医师或药师。2.服用本品期间不得饮酒或含有酒精的饮料。3.1岁以下儿童应在医师指导下使用。4.不能同时服用与本品成份相似的其他抗感冒药。5.肝、肾功能不全者慎用。6.如服用过量或出现严重不良反应，应立即就医。7.对本品过敏者禁用，过敏体质者慎用。8.本品性状发生改变时禁止使用。9.请将本品放在儿童不能接触的地方。10.儿童必须在成人监护下使用。11.如正在使用其他药品，使用本品前请咨询医师或药师。', '浙江亚峰药厂有限公司', '温开水冲服', '严重肝肾功能不全者禁用');
INSERT INTO `medicine` VALUES (9, 'e7b1eb17-1c5b-4efe-a4dc-7b7da518990e.jpg', 5.1, 5.8, '复方甘草片', 3, '用于镇咳祛痰', 24, '1.胃炎及胃溃疡患者禁用。 2.如服用过量或发生严重不良反应时应立即就医。 3.运动员慎用。', '天津力生制药股份有限公司', '口服或含化。成人一次3～4片，一日3次。', '1.对本品成分过敏者禁用。 2.当本品性状发生改变时禁用。');
INSERT INTO `medicine` VALUES (10, 'f5beaa11-ad54-4c67-89ee-52fad6b78090.jpg', 32, 53.19, '盐酸氨溴索片(沐舒坦)', 3, '适用于痰液粘稠而不易咳出者', 60, '1.孕妇及哺乳期妇女慎用。 2.儿童用量请咨询医师或药师。 3.应避免与中枢性镇咳药 （如右美沙芬等） 同时使用，以免稀化的痰液堵塞气道。 4.本品为一种粘液调节剂，仅对咳痰症状有一定作用，在使用时应注意咳嗽。咳痰的原因，如使用7日后未见好转，应及时就医。 5.如服用过量或出现严重不良反应，应立即就医。 6.对本品过敏者禁用，过敏体质者慎用。 7.本品性状发生改变时禁止使用。 8.请将本品放在儿童不能接触的地方。 9.儿童必须在成人监护下使用。 10.如正在使用其他药品，使用本品前请咨询医师或药师。', '上海勃林格殷格翰药业有限公司', '口服。成人：一次1-2片，一日3次，饭后服。', '1.已知对盐酸氨溴索或本品其它成份过敏者不宜使用。 2.妊娠头3个月内妇女禁用。');
INSERT INTO `medicine` VALUES (11, '70997237-9eb2-47a9-8f8a-3a75527b8cfd.jpg', 13, 15, '感冒灵颗粒(999)', 2, '解热镇痛。用于感冒引起的头痛，发热，鼻塞。流涕，咽痛等。', 24, '1.忌烟、酒及辛辣、生冷、油腻食物。 2.不宜在服药期间同时服用滋补性中成药。 3.本品含对乙酰氨基酚、马来酸氯苯那敏、咖啡因。服用本品期间不得饮酒或含有酒精的饮料；不能同时服用与本品成份相似的其他抗感冒药；肝、肾功能不全者慎用；膀胱颈梗阻、甲状腺功能亢进、青光眼、高血压和前列腺肥大者慎用；孕妇及哺乳期妇女慎用；服药期间不得驾驶机、车、船、从事高空作业、机械作业及操作精密仪器。 4.脾胃虚寒，症见腹痛、喜暖、泄泻者慎用。 5.糖尿病患者及有心脏病等慢性病严重者应在医师指导下服用。 6.儿童、年老体弱者应在', '华润三九医药股份有限公司', '开水冲服。一次10克(1袋)，一日3次。', '严重肝肾功能不全者禁用');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `rid` int(0) NOT NULL AUTO_INCREMENT COMMENT '病历号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `sinumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社保号',
  `registermoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '挂号费',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `ispay` int(0) NOT NULL COMMENT '是否自费',
  `sex` int(0) NOT NULL COMMENT '性别',
  `age` int(0) NOT NULL COMMENT '年龄',
  `consultation` int(0) NOT NULL COMMENT '初复诊',
  `department` int(0) NOT NULL COMMENT '所挂科室',
  `did` int(0) NULL DEFAULT NULL COMMENT '指定医生',
  `createtime` datetime(0) NOT NULL COMMENT '挂号时间',
  `state` int(0) NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES (1, '宋江 ', '10001001', '20001001', '10', '15500000001', 0, 1, 30, 1, 1, 1, '2020-11-07 16:06:42', 1, '宋江 ');
INSERT INTO `register` VALUES (2, '卢俊义 ', '10001002', '20001002', '15', '15500000002', 0, 1, 30, 1, 2, 2, '2020-11-07 16:06:42', 1, '卢俊义 ');
INSERT INTO `register` VALUES (3, '吴用 ', '10001003', '20001003', '20', '15500000003', 0, 1, 30, 2, 3, 3, '2020-11-07 16:06:42', 2, '吴用 ');
INSERT INTO `register` VALUES (4, '公孙胜 ', '10001004', '20001004', '15', '15500000004', 0, 1, 30, 1, 4, 4, '2020-11-07 16:06:42', 1, '公孙胜 ');
INSERT INTO `register` VALUES (5, '关胜 ', '10001005', '20001005', '15', '15500000005', 0, 1, 30, 1, 5, 5, '2020-11-07 16:06:42', 2, '关胜 ');
INSERT INTO `register` VALUES (6, '林冲 ', '10001006', '20001006', '10', '15500000006', 0, 1, 30, 2, 6, 6, '2020-11-07 16:06:42', 1, '林冲 ');
INSERT INTO `register` VALUES (7, '秦明 ', '10001007', '20001007', '20', '15500000007', 0, 1, 30, 1, 7, 7, '2020-11-07 16:06:42', 1, '秦明 ');
INSERT INTO `register` VALUES (8, '呼延灼 ', '10001008', '20001008', '10', '15500000008', 0, 1, 30, 1, 8, 8, '2020-11-07 16:06:42', 2, '呼延灼 ');
INSERT INTO `register` VALUES (9, '花荣 ', '10001009', '20001009', '20', '15500000009', 0, 1, 30, 2, 9, 9, '2020-11-07 16:06:42', 1, '花荣 ');
INSERT INTO `register` VALUES (10, '柴进 ', '10001010', '20001010', '15', '15500000010', 0, 1, 30, 1, 10, 10, '2020-11-07 16:06:42', 2, '柴进 ');
INSERT INTO `register` VALUES (11, '李应 ', '10001011', '20001011', '10', '15500000011', 0, 1, 30, 1, 11, 11, '2020-11-07 16:06:42', 1, '李应 ');
INSERT INTO `register` VALUES (12, '朱仝 ', '10001012', '20001012', '15', '15500000012', 0, 1, 30, 2, 12, 12, '2020-11-07 16:06:42', 1, '朱仝 ');
INSERT INTO `register` VALUES (13, '鲁智深 ', '10001013', '20001013', '10', '15500000013', 0, 1, 30, 1, 13, 13, '2020-11-07 16:06:42', 2, '鲁智深 ');
INSERT INTO `register` VALUES (14, '武松 ', '10001014', '20001014', '20', '15500000014', 0, 1, 30, 1, 14, 14, '2020-11-07 16:06:42', 1, '武松 ');
INSERT INTO `register` VALUES (15, '董平 ', '10001015', '20001015', '10', '15500000015', 0, 1, 30, 2, 15, 15, '2020-11-07 16:06:42', 2, '董平 ');
INSERT INTO `register` VALUES (16, '张清 ', '10001016', '20001016', '15', '15500000016', 0, 1, 30, 1, 16, 16, '2020-11-07 16:06:42', 1, '张清 ');
INSERT INTO `register` VALUES (17, '杨志 ', '10001017', '20001017', '10', '15500000017', 0, 1, 30, 1, 1, 17, '2020-11-07 16:06:42', 1, '杨志 ');
INSERT INTO `register` VALUES (18, '徐宁 ', '10001018', '20001018', '15', '15500000018', 0, 1, 30, 2, 2, 18, '2020-11-07 16:06:42', 2, '徐宁 ');
INSERT INTO `register` VALUES (19, '索超 ', '10001019', '20001019', '20', '15500000019', 0, 1, 30, 1, 3, 19, '2020-11-07 16:06:42', 1, '索超 ');
INSERT INTO `register` VALUES (20, '戴宗 ', '10001020', '20001020', '15', '15500000020', 0, 1, 30, 1, 4, 1, '2020-11-07 16:06:42', 2, '戴宗 ');
INSERT INTO `register` VALUES (21, '刘唐 ', '10001021', '20001021', '15', '15500000021', 0, 1, 30, 2, 5, 2, '2020-11-07 16:06:42', 1, '刘唐 ');
INSERT INTO `register` VALUES (22, '李逵 ', '10001022', '20001022', '10', '15500000022', 0, 1, 30, 1, 6, 3, '2020-11-07 16:06:42', 1, '李逵 ');
INSERT INTO `register` VALUES (23, '史进 ', '10001023', '20001023', '20', '15500000023', 0, 1, 30, 1, 7, 4, '2020-11-07 16:06:42', 2, '史进 ');
INSERT INTO `register` VALUES (24, '穆弘 ', '10001024', '20001024', '10', '15500000024', 0, 1, 30, 2, 8, 5, '2020-11-07 16:06:42', 1, '穆弘 ');
INSERT INTO `register` VALUES (25, '雷横 ', '10001025', '20001025', '20', '15500000025', 0, 1, 30, 1, 9, 6, '2020-11-07 16:06:42', 2, '雷横 ');
INSERT INTO `register` VALUES (26, '李俊 ', '10001026', '20001026', '15', '15500000026', 0, 1, 30, 1, 10, 7, '2020-11-07 16:06:42', 1, '李俊 ');
INSERT INTO `register` VALUES (27, '阮小二 ', '10001027', '20001027', '10', '15500000027', 0, 1, 30, 2, 11, 8, '2020-11-07 16:06:42', 1, '阮小二 ');
INSERT INTO `register` VALUES (28, '张横 ', '10001028', '20001028', '15', '15500000028', 0, 1, 30, 1, 12, 9, '2020-11-07 16:06:42', 2, '张横 ');
INSERT INTO `register` VALUES (29, '阮小五 ', '10001029', '20001029', '10', '15500000029', 0, 1, 30, 1, 13, 10, '2020-11-07 16:06:42', 1, '阮小五 ');
INSERT INTO `register` VALUES (30, '张顺 ', '10001030', '20001030', '20', '15500000030', 0, 1, 30, 2, 14, 11, '2020-11-07 16:06:42', 2, '张顺 ');
INSERT INTO `register` VALUES (31, '阮小七 ', '10001031', '20001031', '10', '15500000031', 0, 1, 30, 1, 15, 12, '2020-11-07 16:06:42', 1, '阮小七 ');
INSERT INTO `register` VALUES (32, '杨雄 ', '10001032', '20001032', '15', '15500000032', 0, 1, 30, 1, 16, 13, '2020-11-07 16:06:42', 1, '杨雄 ');
INSERT INTO `register` VALUES (33, '石秀 ', '10001033', '20001033', '10', '15500000033', 0, 1, 30, 2, 1, 14, '2020-11-07 16:06:42', 2, '石秀 ');
INSERT INTO `register` VALUES (34, '解珍 ', '10001034', '20001034', '15', '15500000034', 0, 1, 30, 1, 2, 15, '2020-11-07 16:06:42', 1, '解珍 ');
INSERT INTO `register` VALUES (35, '解宝 ', '10001035', '20001035', '20', '15500000035', 0, 1, 30, 1, 3, 16, '2020-11-07 16:06:42', 2, '解宝 ');
INSERT INTO `register` VALUES (36, '燕青 ', '10001036', '20001036', '15', '15500000036', 0, 1, 30, 2, 4, 17, '2020-11-07 16:06:42', 1, '燕青 ');
INSERT INTO `register` VALUES (37, '朱武 ', '10001037', '20001037', '15', '15500000037', 0, 1, 30, 1, 5, 18, '2020-11-07 16:06:42', 1, '朱武 ');
INSERT INTO `register` VALUES (38, '黄信 ', '10001038', '20001038', '10', '15500000038', 0, 1, 30, 1, 6, 19, '2020-11-07 16:06:42', 2, '黄信 ');
INSERT INTO `register` VALUES (39, '孙立 ', '10001039', '20001039', '20', '15500000039', 0, 1, 30, 2, 7, 1, '2020-11-07 16:06:42', 1, '孙立 ');
INSERT INTO `register` VALUES (40, '宣赞 ', '10001040', '20001040', '10', '15500000040', 0, 1, 30, 1, 8, 2, '2020-11-07 16:06:42', 2, '宣赞 ');
INSERT INTO `register` VALUES (41, '郝思文 ', '10001041', '20001041', '20', '15500000041', 0, 1, 30, 1, 9, 3, '2020-11-07 16:06:42', 1, '郝思文 ');
INSERT INTO `register` VALUES (42, '韩滔 ', '10001042', '20001042', '15', '15500000042', 0, 1, 30, 2, 10, 4, '2020-11-07 16:06:42', 1, '韩滔 ');
INSERT INTO `register` VALUES (43, '彭玘 ', '10001043', '20001043', '10', '15500000043', 0, 1, 30, 1, 11, 5, '2020-11-07 16:06:42', 2, '彭玘 ');
INSERT INTO `register` VALUES (44, '单廷珪 ', '10001044', '20001044', '15', '15500000044', 0, 1, 30, 1, 12, 6, '2020-11-07 16:06:42', 1, '单廷珪 ');
INSERT INTO `register` VALUES (45, '魏定国 ', '10001045', '20001045', '10', '15500000045', 0, 1, 30, 2, 13, 7, '2020-11-07 16:06:42', 2, '魏定国 ');
INSERT INTO `register` VALUES (46, '萧让 ', '10001046', '20001046', '20', '15500000046', 0, 1, 30, 1, 14, 8, '2020-11-07 16:06:42', 1, '萧让 ');
INSERT INTO `register` VALUES (47, '裴宣 ', '10001047', '20001047', '10', '15500000047', 0, 1, 30, 1, 15, 9, '2020-11-07 16:06:42', 1, '裴宣 ');
INSERT INTO `register` VALUES (48, '欧鹏 ', '10001048', '20001048', '15', '15500000048', 0, 1, 30, 2, 16, 10, '2020-11-07 16:06:42', 2, '欧鹏 ');
INSERT INTO `register` VALUES (49, '邓飞 ', '10001049', '20001049', '10', '15500000049', 0, 1, 30, 1, 1, 11, '2020-11-07 16:06:42', 1, '邓飞 ');
INSERT INTO `register` VALUES (50, '燕顺 ', '10001050', '20001050', '15', '15500000050', 0, 1, 30, 1, 2, 12, '2020-11-07 16:06:42', 2, '燕顺 ');
INSERT INTO `register` VALUES (51, '杨林 ', '10001051', '20001051', '20', '15500000051', 0, 1, 30, 2, 3, 13, '2020-11-07 16:06:42', 1, '杨林 ');
INSERT INTO `register` VALUES (52, '凌振 ', '10001052', '20001052', '15', '15500000052', 0, 1, 30, 1, 4, 14, '2020-11-07 16:06:42', 1, '凌振 ');
INSERT INTO `register` VALUES (53, '蒋敬 ', '10001053', '20001053', '15', '15500000053', 0, 1, 30, 1, 5, 15, '2020-11-07 16:06:42', 2, '蒋敬 ');
INSERT INTO `register` VALUES (54, '吕方 ', '10001054', '20001054', '10', '15500000054', 0, 1, 30, 2, 6, 16, '2020-11-07 16:06:42', 1, '吕方 ');
INSERT INTO `register` VALUES (55, '郭盛 ', '10001055', '20001055', '20', '15500000055', 0, 1, 30, 1, 7, 17, '2020-11-07 16:06:42', 2, '郭盛 ');
INSERT INTO `register` VALUES (56, '安道全 ', '10001056', '20001056', '10', '15500000056', 0, 1, 30, 1, 8, 18, '2020-11-07 16:06:42', 1, '安道全 ');
INSERT INTO `register` VALUES (57, '皇甫端 ', '10001057', '20001057', '20', '15500000057', 0, 1, 30, 2, 9, 19, '2020-11-07 16:06:42', 1, '皇甫端 ');
INSERT INTO `register` VALUES (58, '王英 ', '10001058', '20001058', '15', '15500000058', 0, 1, 30, 1, 10, 1, '2020-11-07 16:06:42', 2, '王英 ');
INSERT INTO `register` VALUES (59, '扈三娘 ', '10001059', '20001059', '10', '15500000059', 0, 1, 30, 1, 11, 2, '2020-11-07 16:06:42', 1, '扈三娘 ');
INSERT INTO `register` VALUES (60, '鲍旭 ', '10001060', '20001060', '15', '15500000060', 0, 1, 30, 2, 12, 3, '2020-11-07 16:06:42', 2, '鲍旭 ');
INSERT INTO `register` VALUES (61, '樊瑞 ', '10001061', '20001061', '10', '15500000061', 0, 1, 30, 1, 13, 4, '2020-11-07 16:06:42', 1, '樊瑞 ');
INSERT INTO `register` VALUES (62, '孔明 ', '10001062', '20001062', '20', '15500000062', 0, 1, 30, 1, 14, 5, '2020-11-07 16:06:42', 1, '孔明 ');
INSERT INTO `register` VALUES (63, '孔亮 ', '10001063', '20001063', '10', '15500000063', 0, 1, 30, 2, 15, 6, '2020-11-07 16:06:42', 2, '孔亮 ');
INSERT INTO `register` VALUES (64, '项充 ', '10001064', '20001064', '15', '15500000064', 0, 1, 30, 1, 16, 7, '2020-11-07 16:06:42', 1, '项充 ');
INSERT INTO `register` VALUES (65, '李衮 ', '10001065', '20001065', '10', '15500000065', 0, 1, 30, 1, 1, 8, '2020-11-07 16:06:42', 2, '李衮 ');
INSERT INTO `register` VALUES (66, '金大坚 ', '10001066', '20001066', '15', '15500000066', 0, 1, 30, 2, 2, 9, '2020-11-07 16:06:42', 1, '金大坚 ');
INSERT INTO `register` VALUES (67, '马麟 ', '10001067', '20001067', '20', '15500000067', 0, 1, 30, 1, 3, 10, '2020-11-07 16:06:42', 1, '马麟 ');
INSERT INTO `register` VALUES (68, '童威 ', '10001068', '20001068', '15', '15500000068', 0, 1, 30, 1, 4, 11, '2020-11-07 16:06:42', 2, '童威 ');
INSERT INTO `register` VALUES (69, '童猛 ', '10001069', '20001069', '15', '15500000069', 0, 1, 30, 2, 5, 12, '2020-11-07 16:06:42', 1, '童猛 ');
INSERT INTO `register` VALUES (70, '孟康 ', '10001070', '20001070', '10', '15500000070', 0, 1, 30, 1, 6, 13, '2020-11-07 16:06:42', 2, '孟康 ');
INSERT INTO `register` VALUES (71, '侯健 ', '10001071', '20001071', '20', '15500000071', 0, 1, 30, 1, 7, 14, '2020-11-07 16:06:42', 1, '侯健 ');
INSERT INTO `register` VALUES (72, '陈达 ', '10001072', '20001072', '10', '15500000072', 0, 1, 30, 2, 8, 15, '2020-11-07 16:06:42', 1, '陈达 ');
INSERT INTO `register` VALUES (73, '杨春 ', '10001073', '20001073', '20', '15500000073', 0, 1, 30, 1, 9, 16, '2020-11-07 16:06:42', 2, '杨春 ');
INSERT INTO `register` VALUES (74, '郑天寿 ', '10001074', '20001074', '15', '15500000074', 0, 1, 30, 1, 10, 17, '2020-11-07 16:06:42', 1, '郑天寿 ');
INSERT INTO `register` VALUES (75, '陶宗旺 ', '10001075', '20001075', '10', '15500000075', 0, 1, 30, 2, 11, 18, '2020-11-07 16:06:42', 2, '陶宗旺 ');
INSERT INTO `register` VALUES (76, '宋清 ', '10001076', '20001076', '15', '15500000076', 0, 1, 30, 1, 12, 19, '2020-11-07 16:06:42', 1, '宋清 ');
INSERT INTO `register` VALUES (77, '乐和 ', '10001077', '20001077', '10', '15500000077', 0, 1, 30, 1, 13, 1, '2020-11-07 16:06:42', 1, '乐和 ');
INSERT INTO `register` VALUES (78, '龚旺 ', '10001078', '20001078', '20', '15500000078', 0, 1, 30, 2, 14, 2, '2020-11-07 16:06:42', 2, '龚旺 ');
INSERT INTO `register` VALUES (79, '丁得孙 ', '10001079', '20001079', '10', '15500000079', 0, 1, 30, 1, 15, 3, '2020-11-07 16:06:42', 1, '丁得孙 ');
INSERT INTO `register` VALUES (80, '穆春 ', '10001080', '20001080', '15', '15500000080', 0, 1, 30, 1, 16, 4, '2020-11-07 16:06:42', 2, '穆春 ');
INSERT INTO `register` VALUES (81, '曹正 ', '10001081', '20001081', '10', '15500000081', 0, 1, 30, 2, 1, 5, '2020-11-07 16:06:42', 1, '曹正 ');
INSERT INTO `register` VALUES (82, '宋万 ', '10001082', '20001082', '15', '15500000082', 0, 1, 30, 1, 2, 6, '2020-11-07 16:06:42', 1, '宋万 ');
INSERT INTO `register` VALUES (83, '杜迁 ', '10001083', '20001083', '20', '15500000083', 0, 1, 30, 1, 3, 7, '2020-11-07 16:06:42', 2, '杜迁 ');
INSERT INTO `register` VALUES (84, '薛永 ', '10001084', '20001084', '15', '15500000084', 0, 1, 30, 2, 4, 8, '2020-11-07 16:06:42', 1, '薛永 ');
INSERT INTO `register` VALUES (85, '施恩 ', '10001085', '20001085', '15', '15500000085', 0, 1, 30, 1, 5, 9, '2020-11-07 16:06:42', 2, '施恩 ');
INSERT INTO `register` VALUES (86, '李忠 ', '10001086', '20001086', '10', '15500000086', 0, 1, 30, 1, 6, 10, '2020-11-07 16:06:42', 1, '李忠 ');
INSERT INTO `register` VALUES (87, '周通 ', '10001087', '20001087', '20', '15500000087', 0, 1, 30, 2, 7, 11, '2020-11-07 16:06:42', 1, '周通 ');
INSERT INTO `register` VALUES (88, '汤隆 ', '10001088', '20001088', '10', '15500000088', 0, 1, 30, 1, 8, 12, '2020-11-07 16:06:42', 2, '汤隆 ');
INSERT INTO `register` VALUES (89, '杜兴 ', '10001089', '20001089', '20', '15500000089', 0, 1, 30, 1, 9, 13, '2020-11-07 16:06:42', 1, '杜兴 ');
INSERT INTO `register` VALUES (90, '邹渊 ', '10001090', '20001090', '15', '15500000090', 0, 1, 30, 2, 10, 14, '2020-11-07 16:06:42', 2, '邹渊 ');
INSERT INTO `register` VALUES (91, '邹润 ', '10001091', '20001091', '10', '15500000091', 0, 1, 30, 1, 11, 15, '2020-11-07 16:06:42', 1, '邹润 ');
INSERT INTO `register` VALUES (92, '朱贵 ', '10001092', '20001092', '15', '15500000092', 0, 1, 30, 1, 12, 16, '2020-11-07 16:06:42', 1, '朱贵 ');
INSERT INTO `register` VALUES (93, '朱富 ', '10001093', '20001093', '10', '15500000093', 0, 1, 30, 2, 13, 17, '2020-11-07 16:06:42', 2, '朱富 ');
INSERT INTO `register` VALUES (94, '蔡福 ', '10001094', '20001094', '20', '15500000094', 0, 1, 30, 1, 14, 18, '2020-11-07 16:06:42', 1, '蔡福 ');
INSERT INTO `register` VALUES (95, '蔡庆 ', '10001095', '20001095', '10', '15500000095', 0, 1, 30, 1, 15, 19, '2020-11-07 16:06:42', 2, '蔡庆 ');
INSERT INTO `register` VALUES (96, '李立 ', '10001096', '20001096', '15', '15500000096', 0, 1, 30, 2, 16, 1, '2020-11-07 16:06:42', 1, '李立 ');
INSERT INTO `register` VALUES (97, '李云 ', '10001097', '20001097', '10', '15500000097', 0, 1, 30, 1, 1, 2, '2020-11-07 16:06:42', 1, '李云 ');
INSERT INTO `register` VALUES (98, '焦挺 ', '10001098', '20001098', '15', '15500000098', 0, 1, 30, 1, 2, 3, '2020-11-07 16:06:42', 2, '焦挺 ');
INSERT INTO `register` VALUES (99, '石勇 ', '10001099', '20001099', '20', '15500000099', 0, 1, 30, 2, 3, 4, '2020-11-07 16:06:42', 1, '石勇 ');
INSERT INTO `register` VALUES (100, '孙新 ', '10001100', '20001100', '15', '15500000100', 0, 1, 30, 1, 4, 5, '2020-11-07 16:06:42', 2, '孙新 ');
INSERT INTO `register` VALUES (101, '顾大嫂 ', '10001101', '20001101', '15', '15500000101', 0, 1, 30, 1, 5, 6, '2020-11-07 16:06:42', 1, '顾大嫂 ');
INSERT INTO `register` VALUES (102, '张青 ', '10001102', '20001102', '10', '15500000102', 0, 1, 30, 2, 6, 7, '2020-11-07 16:06:42', 1, '张青 ');
INSERT INTO `register` VALUES (103, '孙二娘 ', '10001103', '20001103', '20', '15500000103', 0, 1, 30, 1, 7, 8, '2020-11-07 16:06:42', 2, '孙二娘 ');
INSERT INTO `register` VALUES (104, '王定六 ', '10001104', '20001104', '10', '15500000104', 0, 1, 30, 1, 8, 9, '2020-11-07 16:06:42', 1, '王定六 ');
INSERT INTO `register` VALUES (105, '郁保四 ', '10001105', '20001105', '20', '15500000105', 0, 1, 30, 2, 9, 10, '2020-11-07 16:06:42', 2, '郁保四 ');
INSERT INTO `register` VALUES (106, '白胜 ', '10001106', '20001106', '15', '15500000106', 0, 1, 30, 1, 10, 11, '2020-11-07 16:06:42', 1, '白胜 ');
INSERT INTO `register` VALUES (107, '时迁 ', '10001107', '20001107', '10', '15500000107', 0, 1, 30, 1, 11, 12, '2020-11-07 16:06:42', 1, '时迁 ');
INSERT INTO `register` VALUES (108, '段景住', '10001108', '20001108', '15', '15500000108', 0, 1, 30, 2, 12, 13, '2020-11-07 16:06:42', 2, '段景住');

-- ----------------------------
-- Table structure for relationship
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship`  (
  `docid` int(0) NOT NULL,
  `depid` int(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relationship
-- ----------------------------
INSERT INTO `relationship` VALUES (1, 1);
INSERT INTO `relationship` VALUES (1, 2);
INSERT INTO `relationship` VALUES (2, 2);
INSERT INTO `relationship` VALUES (2, 6);
INSERT INTO `relationship` VALUES (3, 3);
INSERT INTO `relationship` VALUES (3, 11);
INSERT INTO `relationship` VALUES (4, 4);
INSERT INTO `relationship` VALUES (4, 7);
INSERT INTO `relationship` VALUES (5, 5);
INSERT INTO `relationship` VALUES (5, 9);
INSERT INTO `relationship` VALUES (6, 6);
INSERT INTO `relationship` VALUES (6, 16);
INSERT INTO `relationship` VALUES (7, 7);
INSERT INTO `relationship` VALUES (7, 8);
INSERT INTO `relationship` VALUES (8, 8);
INSERT INTO `relationship` VALUES (8, 10);
INSERT INTO `relationship` VALUES (9, 9);
INSERT INTO `relationship` VALUES (9, 13);
INSERT INTO `relationship` VALUES (10, 10);
INSERT INTO `relationship` VALUES (10, 1);
INSERT INTO `relationship` VALUES (11, 11);
INSERT INTO `relationship` VALUES (11, 3);
INSERT INTO `relationship` VALUES (12, 12);
INSERT INTO `relationship` VALUES (12, 15);
INSERT INTO `relationship` VALUES (13, 13);
INSERT INTO `relationship` VALUES (13, 5);
INSERT INTO `relationship` VALUES (14, 14);
INSERT INTO `relationship` VALUES (14, 4);
INSERT INTO `relationship` VALUES (15, 15);
INSERT INTO `relationship` VALUES (15, 14);
INSERT INTO `relationship` VALUES (16, 16);
INSERT INTO `relationship` VALUES (16, 12);
INSERT INTO `relationship` VALUES (1, 16);
INSERT INTO `relationship` VALUES (2, 15);
INSERT INTO `relationship` VALUES (3, 14);
INSERT INTO `relationship` VALUES (4, 13);
INSERT INTO `relationship` VALUES (5, 12);
INSERT INTO `relationship` VALUES (6, 11);
INSERT INTO `relationship` VALUES (7, 10);
INSERT INTO `relationship` VALUES (8, 9);
INSERT INTO `relationship` VALUES (9, 8);
INSERT INTO `relationship` VALUES (10, 7);
INSERT INTO `relationship` VALUES (11, 6);
INSERT INTO `relationship` VALUES (12, 5);
INSERT INTO `relationship` VALUES (13, 4);
INSERT INTO `relationship` VALUES (14, 3);
INSERT INTO `relationship` VALUES (15, 2);
INSERT INTO `relationship` VALUES (16, 1);
INSERT INTO `relationship` VALUES (17, 1);
INSERT INTO `relationship` VALUES (17, 2);
INSERT INTO `relationship` VALUES (17, 3);
INSERT INTO `relationship` VALUES (18, 3);
INSERT INTO `relationship` VALUES (18, 4);
INSERT INTO `relationship` VALUES (18, 14);
INSERT INTO `relationship` VALUES (19, 3);
INSERT INTO `relationship` VALUES (19, 4);
INSERT INTO `relationship` VALUES (19, 14);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户序号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `createTime` datetime(0) NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', 'admin@user.com', '2020-11-12 13:20:58');
INSERT INTO `user` VALUES (2, 'root', '123456', 'root', 'root@user.com', '2020-11-12 17:43:14');

SET FOREIGN_KEY_CHECKS = 1;
