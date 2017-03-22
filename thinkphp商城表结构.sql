/*
Navicat MySQL Data Transfer

Source Server         : study
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-11-15 20:56:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sh_ad
-- ----------------------------
DROP TABLE IF EXISTS `sh_ad`;
CREATE TABLE `sh_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ad_name` varchar(45) NOT NULL COMMENT '广告名称',
  `pos_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `is_on` enum('是','否') NOT NULL COMMENT '是否启用',
  `ad_type` enum('图片','动画') NOT NULL COMMENT '广告类型',
  `img_url` varchar(150) NOT NULL DEFAULT '' COMMENT '广告地址',
  `link` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of sh_ad
-- ----------------------------
INSERT INTO `sh_ad` VALUES ('37', '右侧图片', '1', '是', '图片', 'Goods/2015-08-29/55e1296c2883f.jpg', '');
INSERT INTO `sh_ad` VALUES ('36', '中间轮换', '2', '是', '动画', '', '');

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `role_id` int(10) unsigned NOT NULL COMMENT '所在角色',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES ('1', 'admin', 'b2ca678b4c936f905fb82f2733f5297f', '1');
INSERT INTO `sh_admin` VALUES ('4', 'wawa', '202cb962ac59075b964b07152d234b70', '5');

-- ----------------------------
-- Table structure for sh_ad_info
-- ----------------------------
DROP TABLE IF EXISTS `sh_ad_info`;
CREATE TABLE `sh_ad_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `img_url` varchar(150) NOT NULL DEFAULT '' COMMENT '广告地址',
  `link` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_id` mediumint(8) unsigned NOT NULL COMMENT '广告id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='动画广告信息';

-- ----------------------------
-- Records of sh_ad_info
-- ----------------------------
INSERT INTO `sh_ad_info` VALUES ('52', 'Goods/2015-08-29/55e1294443bf6.jpg', '', '36');
INSERT INTO `sh_ad_info` VALUES ('53', 'Goods/2015-08-29/55e1294444f7f.jpg', '', '36');
INSERT INTO `sh_ad_info` VALUES ('54', 'Goods/2015-08-29/55e1294446307.jpg', '', '36');
INSERT INTO `sh_ad_info` VALUES ('55', 'Goods/2015-08-29/55e1294447a77.jpg', '', '36');

-- ----------------------------
-- Table structure for sh_ad_pos
-- ----------------------------
DROP TABLE IF EXISTS `sh_ad_pos`;
CREATE TABLE `sh_ad_pos` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pos_name` varchar(45) NOT NULL COMMENT '广告位名称',
  `pos_width` smallint(5) unsigned NOT NULL COMMENT '广告位宽',
  `pos_height` smallint(5) unsigned NOT NULL COMMENT '广告位高',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告位';

-- ----------------------------
-- Records of sh_ad_pos
-- ----------------------------
INSERT INTO `sh_ad_pos` VALUES ('1', '首页上面右侧图片', '310', '70');
INSERT INTO `sh_ad_pos` VALUES ('2', '首页中间轮换广告', '670', '400');

-- ----------------------------
-- Table structure for sh_article
-- ----------------------------
DROP TABLE IF EXISTS `sh_article`;
CREATE TABLE `sh_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(150) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '内容',
  `cat_id` mediumint(8) unsigned NOT NULL COMMENT '文章分类id',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of sh_article
-- ----------------------------

-- ----------------------------
-- Table structure for sh_article_cat
-- ----------------------------
DROP TABLE IF EXISTS `sh_article_cat`;
CREATE TABLE `sh_article_cat` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cat_name` varchar(45) NOT NULL COMMENT '分类名称',
  `is_help` enum('是','否') NOT NULL COMMENT '是否是帮助',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文章分类';

-- ----------------------------
-- Records of sh_article_cat
-- ----------------------------
INSERT INTO `sh_article_cat` VALUES ('3', '购物指南', '是');
INSERT INTO `sh_article_cat` VALUES ('2', '网站快报', '否');
INSERT INTO `sh_article_cat` VALUES ('4', '正品行货', '是');
INSERT INTO `sh_article_cat` VALUES ('5', '精致服务', '是');
INSERT INTO `sh_article_cat` VALUES ('6', '送货上门', '是');

-- ----------------------------
-- Table structure for sh_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sh_attribute`;
CREATE TABLE `sh_attribute` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_name` varchar(30) NOT NULL COMMENT '属性名称',
  `attr_type` enum('唯一','单选') NOT NULL COMMENT '属性类型',
  `attr_values` varchar(300) NOT NULL DEFAULT '' COMMENT '属性值',
  `type_id` mediumint(8) unsigned NOT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商品属性';

-- ----------------------------
-- Records of sh_attribute
-- ----------------------------
INSERT INTO `sh_attribute` VALUES ('14', '像素', '唯一', '300万', '5');
INSERT INTO `sh_attribute` VALUES ('15', '产地', '单选', '日本,美国,台湾', '5');
INSERT INTO `sh_attribute` VALUES ('16', '品牌', '唯一', '三星', '5');
INSERT INTO `sh_attribute` VALUES ('17', '出场日期', '唯一', '', '5');
INSERT INTO `sh_attribute` VALUES ('18', '笔记本', '单选', 'Thinkpad,联想,戴尔', '6');
INSERT INTO `sh_attribute` VALUES ('19', '品牌', '单选', '中华书局,三联书店', '7');
INSERT INTO `sh_attribute` VALUES ('20', '颜色', '单选', '黑色,白色,金色,黄色', '5');

-- ----------------------------
-- Table structure for sh_brand
-- ----------------------------
DROP TABLE IF EXISTS `sh_brand`;
CREATE TABLE `sh_brand` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `brand_name` varchar(30) NOT NULL COMMENT '品牌名称',
  `brand_logo` varchar(150) NOT NULL COMMENT '品牌logo',
  `brand_url` varchar(150) NOT NULL COMMENT '官方网站',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='商品品牌';

-- ----------------------------
-- Records of sh_brand
-- ----------------------------
INSERT INTO `sh_brand` VALUES ('22', 'adidas', 'Brand/2015-08-29/55e14e2711f95.jpg', 'www.adidas.con');
INSERT INTO `sh_brand` VALUES ('21', '耐克', 'Brand/2015-08-29/55e14d84d28fc.jpg', 'www.nick.com');

-- ----------------------------
-- Table structure for sh_buttons
-- ----------------------------
DROP TABLE IF EXISTS `sh_buttons`;
CREATE TABLE `sh_buttons` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `btn_name` varchar(30) NOT NULL COMMENT '按钮名称',
  `btn_url` varchar(150) NOT NULL COMMENT '按钮地址',
  `open_new` enum('是','否') NOT NULL DEFAULT '是' COMMENT '是否打开新窗口',
  `btn_pos` enum('上','中','下') NOT NULL COMMENT '按钮位置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='按钮表';

-- ----------------------------
-- Records of sh_buttons
-- ----------------------------
INSERT INTO `sh_buttons` VALUES ('2', '关于我们', '/', '是', '下');
INSERT INTO `sh_buttons` VALUES ('3', '我的订单', '/', '是', '上');
INSERT INTO `sh_buttons` VALUES ('4', '客户服务', '/', '是', '上');
INSERT INTO `sh_buttons` VALUES ('6', '服装城', 'www.fuzhuang.com', '是', '中');
INSERT INTO `sh_buttons` VALUES ('7', '美妆馆', 'www.meizhuangguan.com', '是', '中');
INSERT INTO `sh_buttons` VALUES ('8', '美食', 'www.meishi.com', '是', '中');
INSERT INTO `sh_buttons` VALUES ('9', '全球购', 'www.quanqiu.com', '是', '中');
INSERT INTO `sh_buttons` VALUES ('10', '全球购', 'www.quanqiu.com', '是', '中');
INSERT INTO `sh_buttons` VALUES ('11', '闪购', 'www.shangou.com', '是', '中');
INSERT INTO `sh_buttons` VALUES ('12', '团购', 'www.tuangou.com', '是', '中');
INSERT INTO `sh_buttons` VALUES ('13', '正品行货', 'www.zhengping.com', '是', '下');
INSERT INTO `sh_buttons` VALUES ('14', '精致服务', 'www.fuwu.com', '是', '下');
INSERT INTO `sh_buttons` VALUES ('15', '联系我们', 'www.lx.com', '是', '下');
INSERT INTO `sh_buttons` VALUES ('18', '营销中心', '\\', '是', '下');
INSERT INTO `sh_buttons` VALUES ('17', '商家入驻', 'www.shangjia.com', '是', '下');
INSERT INTO `sh_buttons` VALUES ('19', '手机京东', '\\', '是', '下');
INSERT INTO `sh_buttons` VALUES ('20', '友情链接', '\\', '是', '下');
INSERT INTO `sh_buttons` VALUES ('21', '京东社区', '\\ ', '是', '下');
INSERT INTO `sh_buttons` VALUES ('22', '京东公益', '\\', '是', '下');

-- ----------------------------
-- Table structure for sh_category
-- ----------------------------
DROP TABLE IF EXISTS `sh_category`;
CREATE TABLE `sh_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cat_name` varchar(30) NOT NULL COMMENT '分类名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `filter_goods_attr_id` varchar(150) NOT NULL DEFAULT '' COMMENT '用来搜索的属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Records of sh_category
-- ----------------------------
INSERT INTO `sh_category` VALUES ('55', '手机、数码、京东通信', '0', '');
INSERT INTO `sh_category` VALUES ('54', '电脑、办公', '0', '');
INSERT INTO `sh_category` VALUES ('58', '鞋靴、珠宝、奢饰品', '0', '');
INSERT INTO `sh_category` VALUES ('57', '男装、女装、内衣', '0', '');
INSERT INTO `sh_category` VALUES ('56', '家具、家居、厨具', '0', '');
INSERT INTO `sh_category` VALUES ('59', '运动户外', '0', '');
INSERT INTO `sh_category` VALUES ('60', '汽车、汽车用品', '0', '');
INSERT INTO `sh_category` VALUES ('61', '母婴、玩具乐器', '0', '');
INSERT INTO `sh_category` VALUES ('62', '食品、酒类、海鲜、特产', '0', '');
INSERT INTO `sh_category` VALUES ('63', '营养保健', '0', '');
INSERT INTO `sh_category` VALUES ('64', '图书、音像、电子书', '0', '');
INSERT INTO `sh_category` VALUES ('65', '彩票、旅行、票务、充值', '0', '');
INSERT INTO `sh_category` VALUES ('66', '理财、众筹、白条、保险', '0', '');
INSERT INTO `sh_category` VALUES ('67', '手机通信', '55', '18,15');
INSERT INTO `sh_category` VALUES ('68', '手机、对讲机', '67', '15');
INSERT INTO `sh_category` VALUES ('69', '选号中心、自动服务', '67', '');
INSERT INTO `sh_category` VALUES ('71', '电脑整机', '54', '');
INSERT INTO `sh_category` VALUES ('72', '笔记本、超级本、游戏本、平板电脑、电脑配件、台式电脑', '71', '');
INSERT INTO `sh_category` VALUES ('73', '时尚女鞋', '58', '');
INSERT INTO `sh_category` VALUES ('74', '单鞋、高跟鞋、休闲鞋、凉鞋、低跟鞋、内增高、妈妈鞋、鱼嘴鞋', '73', '');
INSERT INTO `sh_category` VALUES ('75', '女装', '57', '');
INSERT INTO `sh_category` VALUES ('76', '雪纺衫、女衬衣、休闲装、牛仔裤、毛呢大衣、T恤、休闲装', '75', '');
INSERT INTO `sh_category` VALUES ('77', '厨具', '56', '');
INSERT INTO `sh_category` VALUES ('78', '茶杯、家用菜刀、咖啡杯、家用餐具、家用面板', '77', '');
INSERT INTO `sh_category` VALUES ('79', '运动鞋包', '59', '');
INSERT INTO `sh_category` VALUES ('80', '休闲鞋、跑步鞋、登山鞋、旅行包、登山鞋', '79', '');
INSERT INTO `sh_category` VALUES ('81', '汽车车型', '60', '');
INSERT INTO `sh_category` VALUES ('82', '微小型、紧凑车型、豪车型、中车型', '81', '');
INSERT INTO `sh_category` VALUES ('83', '奶粉', '61', '');
INSERT INTO `sh_category` VALUES ('84', '婴儿奶粉、成人奶粉', '83', '');
INSERT INTO `sh_category` VALUES ('85', '中外名酒', '62', '');
INSERT INTO `sh_category` VALUES ('86', '白酒、葡萄酒、红酒、啤酒、养生酒', '85', '');
INSERT INTO `sh_category` VALUES ('87', '营养健康', '63', '');
INSERT INTO `sh_category` VALUES ('88', '调节免疫、调节疲劳、营养塑体', '87', '');
INSERT INTO `sh_category` VALUES ('89', '音像', '64', '');
INSERT INTO `sh_category` VALUES ('90', '游戏、动漫、音乐、影视', '89', '');
INSERT INTO `sh_category` VALUES ('91', '彩票', '65', '');
INSERT INTO `sh_category` VALUES ('92', '七乐彩、双色球、福彩3D、新时时彩', '91', '');
INSERT INTO `sh_category` VALUES ('93', '理财', '66', '');
INSERT INTO `sh_category` VALUES ('94', '京东小金库、基金理财', '93', '');

-- ----------------------------
-- Table structure for sh_config
-- ----------------------------
DROP TABLE IF EXISTS `sh_config`;
CREATE TABLE `sh_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `config_name` varchar(150) NOT NULL COMMENT '参数名称',
  `config_type` enum('单行文本','单选','多行文本') NOT NULL COMMENT '参数类型',
  `config_values` varchar(600) NOT NULL DEFAULT '' COMMENT '参数的可选值',
  `config_value` varchar(600) NOT NULL DEFAULT '' COMMENT '参数的值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺参数表';

-- ----------------------------
-- Records of sh_config
-- ----------------------------

-- ----------------------------
-- Table structure for sh_goods
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods`;
CREATE TABLE `sh_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_name` varchar(40) NOT NULL COMMENT '商品名称',
  `goods_sn` char(16) NOT NULL COMMENT '商品编号',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT '原图',
  `sm_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '小图',
  `mid_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '中图',
  `big_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '大图',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价',
  `shop_price` decimal(10,2) NOT NULL COMMENT '本店价',
  `is_on_sale` enum('是','否') NOT NULL COMMENT '是否上架',
  `cat_id` mediumint(8) unsigned NOT NULL COMMENT '分类id',
  `brand_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `goods_desc` text COMMENT '商品描述',
  `goods_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `weight_unit` enum('克','千克') NOT NULL COMMENT '重量单位',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_name` (`goods_name`),
  KEY `cat_id` (`cat_id`),
  KEY `shop_price` (`shop_price`),
  KEY `brand_id` (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of sh_goods
-- ----------------------------
INSERT INTO `sh_goods` VALUES ('78', '电动车', '1440826956720630', 'Goods/2015-08-29/55e1464ca1b91.jpg', 'Goods/2015-08-29/small_55e1464ca1b91.jpg', 'Goods/2015-08-29/mid_55e1464ca1b91.jpg', 'Goods/2015-08-29/big_55e1464ca1b91.jpg', '2999.00', '2668.00', '是', '59', '0', '', '500.00', '克', '0');
INSERT INTO `sh_goods` VALUES ('77', '健身器', '1440826915759421', 'Goods/2015-08-29/55e146239334a.jpg', 'Goods/2015-08-29/small_55e146239334a.jpg', 'Goods/2015-08-29/mid_55e146239334a.jpg', 'Goods/2015-08-29/big_55e146239334a.jpg', '3999.00', '3559.00', '是', '54', '0', '', '1000.00', '克', '5');
INSERT INTO `sh_goods` VALUES ('75', '游戏机', '1440826799889754', 'Goods/2015-08-29/55e145af384af.jpg', 'Goods/2015-08-29/small_55e145af384af.jpg', 'Goods/2015-08-29/mid_55e145af384af.jpg', 'Goods/2015-08-29/big_55e145af384af.jpg', '109.00', '89.00', '是', '73', '22', '', '20.00', '克', '5');
INSERT INTO `sh_goods` VALUES ('76', '平板', '1440826863912717', 'Goods/2015-08-29/55e145ef08400.jpg', 'Goods/2015-08-29/small_55e145ef08400.jpg', 'Goods/2015-08-29/mid_55e145ef08400.jpg', 'Goods/2015-08-29/big_55e145ef08400.jpg', '3999.00', '3559.00', '是', '54', '0', '', '20.00', '克', '0');
INSERT INTO `sh_goods` VALUES ('74', '无线鼠标', '1440826757460457', 'Goods/2015-08-29/55e14585c8bbd.jpg', 'Goods/2015-08-29/small_55e14585c8bbd.jpg', 'Goods/2015-08-29/mid_55e14585c8bbd.jpg', 'Goods/2015-08-29/big_55e14585c8bbd.jpg', '89.00', '69.00', '是', '54', '0', '', '5.00', '克', '0');
INSERT INTO `sh_goods` VALUES ('73', '吸尘器', '1440826707991245', 'Goods/2015-08-29/55e145531f794.jpg', 'Goods/2015-08-29/small_55e145531f794.jpg', 'Goods/2015-08-29/mid_55e145531f794.jpg', 'Goods/2015-08-29/big_55e145531f794.jpg', '988.00', '899.00', '是', '56', '21', '', '100.00', '克', '7');
INSERT INTO `sh_goods` VALUES ('79', '智能手机', '1440827027641869', 'Goods/2015-08-29/55e146939020c.jpg', 'Goods/2015-08-29/small_55e146939020c.jpg', 'Goods/2015-08-29/mid_55e146939020c.jpg', 'Goods/2015-08-29/big_55e146939020c.jpg', '1299.00', '999.00', '是', '54', '0', '', '30.00', '克', '5');
INSERT INTO `sh_goods` VALUES ('80', '打飞机', '1441636101560800', 'Goods/2015-09-07/55ed9f2c4c4b4.jpeg', 'Goods/2015-09-07/small_55ed9f2c4c4b4.jpeg', 'Goods/2015-09-07/mid_55ed9f2c4c4b4.jpeg', 'Goods/2015-09-07/big_55ed9f2c4c4b4.jpeg', '3000.00', '2000.00', '是', '55', '22', '', '22.00', '克', '0');
INSERT INTO `sh_goods` VALUES ('82', '水电费', '1441803830953117', 'Goods/2015-09-09/55f02e36aba95.jpg', 'Goods/2015-09-09/small_55f02e36aba95.jpg', 'Goods/2015-09-09/mid_55f02e36aba95.jpg', 'Goods/2015-09-09/big_55f02e36aba95.jpg', '333.00', '11.00', '是', '58', '21', '&lt;p style=&quot;text-align:center&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.xm.com/ueditor/php/upload/image/20150910/1441890508532001.jpeg&quot; title=&quot;1441890508532001.jpeg&quot; alt=&quot;豹.jpeg&quot;/&gt;&lt;/p&gt;', '22.00', '克', '5');
INSERT INTO `sh_goods` VALUES ('83', 'asdfsdfs', '1442106893460992', 'Goods/2015-09-13/55f4ce0db34a7.jpg', 'Goods/2015-09-13/small_55f4ce0db34a7.jpg', 'Goods/2015-09-13/mid_55f4ce0db34a7.jpg', 'Goods/2015-09-13/big_55f4ce0db34a7.jpg', '33333.00', '1111.00', '是', '67', '22', '', '33.00', '克', '6');
INSERT INTO `sh_goods` VALUES ('84', '但V啊晚上发', '1442129196535841', 'Goods/2015-09-13/55f5252bbaeb9.JPG', 'Goods/2015-09-13/small_55f5252bbaeb9.JPG', 'Goods/2015-09-13/mid_55f5252bbaeb9.JPG', 'Goods/2015-09-13/big_55f5252bbaeb9.JPG', '333.00', '111.00', '是', '54', '21', '', '33.00', '克', '0');
INSERT INTO `sh_goods` VALUES ('85', '大奶女王', '1442583187284267', 'Goods/2015-09-18/55fc129322551.jpg', 'Goods/2015-09-18/small_55fc129322551.jpg', 'Goods/2015-09-18/mid_55fc129322551.jpg', 'Goods/2015-09-18/big_55fc129322551.jpg', '44444.00', '33333.00', '是', '54', '22', 'asdfasd', '23.00', '克', '5');

-- ----------------------------
-- Table structure for sh_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_attr`;
CREATE TABLE `sh_goods_attr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_id` mediumint(9) NOT NULL COMMENT '商品id',
  `attr_id` mediumint(8) unsigned NOT NULL COMMENT '属性id',
  `attr_value` varchar(150) NOT NULL DEFAULT '' COMMENT '属性值',
  `attr_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '属性价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='商品属性';

-- ----------------------------
-- Records of sh_goods_attr
-- ----------------------------
INSERT INTO `sh_goods_attr` VALUES ('70', '77', '14', '500万', '100.00');
INSERT INTO `sh_goods_attr` VALUES ('71', '77', '15', '日本', '200.00');
INSERT INTO `sh_goods_attr` VALUES ('72', '77', '16', '三星', '100.00');
INSERT INTO `sh_goods_attr` VALUES ('73', '77', '17', '2014-11-12', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('92', '83', '18', 'Thinkpad', '111.00');
INSERT INTO `sh_goods_attr` VALUES ('91', '82', '17', '2343243', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('90', '82', '16', '苹果', '22.00');
INSERT INTO `sh_goods_attr` VALUES ('89', '82', '15', '台湾', '444.00');
INSERT INTO `sh_goods_attr` VALUES ('88', '82', '15', '美国', '333.00');
INSERT INTO `sh_goods_attr` VALUES ('79', '77', '14', '0', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('80', '77', '15', '美国', '22.00');
INSERT INTO `sh_goods_attr` VALUES ('81', '77', '15', '台湾', '224.00');
INSERT INTO `sh_goods_attr` VALUES ('82', '77', '16', '0', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('83', '77', '17', '', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('87', '82', '15', '日本', '11.00');
INSERT INTO `sh_goods_attr` VALUES ('86', '82', '14', '300万', '33.00');
INSERT INTO `sh_goods_attr` VALUES ('94', '85', '14', '300万', '222.00');
INSERT INTO `sh_goods_attr` VALUES ('95', '85', '15', '日本', '111.00');
INSERT INTO `sh_goods_attr` VALUES ('96', '85', '15', '台湾', '222.00');
INSERT INTO `sh_goods_attr` VALUES ('97', '85', '15', '美国', '333.00');
INSERT INTO `sh_goods_attr` VALUES ('98', '85', '16', '三星', '22.00');
INSERT INTO `sh_goods_attr` VALUES ('99', '85', '17', '1999-11-12', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('100', '85', '20', '黑色', '1000.00');
INSERT INTO `sh_goods_attr` VALUES ('101', '85', '20', '白色', '2000.00');
INSERT INTO `sh_goods_attr` VALUES ('102', '85', '20', '金色', '3000.00');
INSERT INTO `sh_goods_attr` VALUES ('103', '85', '20', '黄色', '4000.00');
INSERT INTO `sh_goods_attr` VALUES ('104', '73', '19', '中华书局', '33.00');
INSERT INTO `sh_goods_attr` VALUES ('105', '75', '14', '0', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('106', '75', '16', '0', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('107', '75', '17', '', '0.00');
INSERT INTO `sh_goods_attr` VALUES ('108', '75', '20', '黑色', '300.00');

-- ----------------------------
-- Table structure for sh_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_pic`;
CREATE TABLE `sh_goods_pic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT '原图',
  `sm_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '小图',
  `big_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '大图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Records of sh_goods_pic
-- ----------------------------
INSERT INTO `sh_goods_pic` VALUES ('44', '73', 'Goods/2015-09-06/55ec3aff8583b.jpg', 'Goods/2015-09-06/small_55ec3aff8583b.jpg', 'Goods/2015-09-06/big_55ec3aff8583b.jpg');
INSERT INTO `sh_goods_pic` VALUES ('45', '73', 'Goods/2015-09-06/55ec3aff94c5f.jpg', 'Goods/2015-09-06/small_55ec3aff94c5f.jpg', 'Goods/2015-09-06/big_55ec3aff94c5f.jpg');
INSERT INTO `sh_goods_pic` VALUES ('46', '73', 'Goods/2015-09-06/55ec3aff98968.jpg', 'Goods/2015-09-06/small_55ec3aff98968.jpg', 'Goods/2015-09-06/big_55ec3aff98968.jpg');
INSERT INTO `sh_goods_pic` VALUES ('47', '77', 'Goods/2015-09-06/55ec3de6d59f8.jpg', 'Goods/2015-09-06/small_55ec3de6d59f8.jpg', 'Goods/2015-09-06/big_55ec3de6d59f8.jpg');
INSERT INTO `sh_goods_pic` VALUES ('48', '77', 'Goods/2015-09-06/55ec3de6d9701.jpg', 'Goods/2015-09-06/small_55ec3de6d9701.jpg', 'Goods/2015-09-06/big_55ec3de6d9701.jpg');
INSERT INTO `sh_goods_pic` VALUES ('50', '82', 'Goods/2015-09-09/55f02e5366ff3.jpg', 'Goods/2015-09-09/small_55f02e5366ff3.jpg', 'Goods/2015-09-09/big_55f02e5366ff3.jpg');
INSERT INTO `sh_goods_pic` VALUES ('51', '82', 'Goods/2015-09-09/55f02e536acfc.jpg', 'Goods/2015-09-09/small_55f02e536acfc.jpg', 'Goods/2015-09-09/big_55f02e536acfc.jpg');
INSERT INTO `sh_goods_pic` VALUES ('52', '85', 'Goods/2015-09-18/55fc129353ec6.jpg', 'Goods/2015-09-18/small_55fc129353ec6.jpg', 'Goods/2015-09-18/big_55fc129353ec6.jpg');
INSERT INTO `sh_goods_pic` VALUES ('53', '85', 'Goods/2015-09-18/55fc129357bcf.jpg', 'Goods/2015-09-18/small_55fc129357bcf.jpg', 'Goods/2015-09-18/big_55fc129357bcf.jpg');

-- ----------------------------
-- Table structure for sh_member
-- ----------------------------
DROP TABLE IF EXISTS `sh_member`;
CREATE TABLE `sh_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(15) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` varchar(150) NOT NULL COMMENT '邮箱',
  `addtime` datetime NOT NULL COMMENT '注册时间',
  `gender` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `email_checked` enum('已验证','未验证') NOT NULL DEFAULT '未验证' COMMENT 'email是否已验证',
  `email_chk_str` char(32) NOT NULL COMMENT 'email验证字符串',
  `get_pass_code` char(7) NOT NULL DEFAULT '' COMMENT '找回密码密钥',
  `get_pass_code_time` int(11) NOT NULL DEFAULT '0' COMMENT '密钥生成时间',
  `face` varchar(150) NOT NULL DEFAULT '' COMMENT '会员头像',
  `Integral` mediumint(9) NOT NULL DEFAULT '0' COMMENT '积分',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of sh_member
-- ----------------------------
INSERT INTO `sh_member` VALUES ('19', 'sui', '169147973080f123ceee81055ea6b1d4', 's15863549041@126.com', '2015-08-26 21:45:21', '男', '已验证', 'c0546301ff036a7a3e5e142cc33fc58f', 'a8af79e', '1440921512', '', '30000', '64556.00');
INSERT INTO `sh_member` VALUES ('20', 'root', 'a51d2602e49dada946059f60cd97eedc', '15863549041@126.com', '2015-08-27 22:31:08', '男', '已验证', '9860f614991e49f77d9a2ad8e865e0e3', '', '0', '', '0', '0.00');

-- ----------------------------
-- Table structure for sh_member_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_member_address`;
CREATE TABLE `sh_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_name` varchar(30) NOT NULL COMMENT '会员名',
  `member_province` varchar(30) NOT NULL COMMENT '省份',
  `member_city` varchar(30) NOT NULL COMMENT '市',
  `member_area` varchar(30) NOT NULL COMMENT '地区',
  `member_address` varchar(30) NOT NULL COMMENT '详细地址',
  `member_phone` varchar(30) NOT NULL COMMENT '手机号',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_member_address
-- ----------------------------
INSERT INTO `sh_member_address` VALUES ('13', '王大哥', '天津', '东城区', '三环以内', '阿桑的发生地方', '3434234', '19');
INSERT INTO `sh_member_address` VALUES ('34', '温柔温柔', '北京', '东城区', '西二旗', '文认为', '143252343453', '19');

-- ----------------------------
-- Table structure for sh_member_level
-- ----------------------------
DROP TABLE IF EXISTS `sh_member_level`;
CREATE TABLE `sh_member_level` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level_name` varchar(30) NOT NULL COMMENT '级别名称',
  `num_bottom` int(10) unsigned NOT NULL COMMENT '积分下限',
  `num_top` int(10) unsigned NOT NULL COMMENT '积分上限',
  `rate` tinyint(3) unsigned NOT NULL COMMENT '折扣率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员级别表';

-- ----------------------------
-- Records of sh_member_level
-- ----------------------------
INSERT INTO `sh_member_level` VALUES ('1', '注册会员', '0', '20000', '100');
INSERT INTO `sh_member_level` VALUES ('2', '中级会员', '20001', '80000', '95');
INSERT INTO `sh_member_level` VALUES ('3', '高级会员', '80001', '200000', '90');

-- ----------------------------
-- Table structure for sh_member_price
-- ----------------------------
DROP TABLE IF EXISTS `sh_member_price`;
CREATE TABLE `sh_member_price` (
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `level_id` mediumint(8) unsigned NOT NULL COMMENT '级别id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员价格';

-- ----------------------------
-- Records of sh_member_price
-- ----------------------------
INSERT INTO `sh_member_price` VALUES ('5555.00', '3', '82');
INSERT INTO `sh_member_price` VALUES ('222.00', '2', '82');
INSERT INTO `sh_member_price` VALUES ('333.00', '1', '82');
INSERT INTO `sh_member_price` VALUES ('4444.00', '1', '83');
INSERT INTO `sh_member_price` VALUES ('2.00', '2', '83');
INSERT INTO `sh_member_price` VALUES ('3.00', '3', '83');
INSERT INTO `sh_member_price` VALUES ('777.00', '1', '80');
INSERT INTO `sh_member_price` VALUES ('444.00', '2', '80');
INSERT INTO `sh_member_price` VALUES ('3323.00', '3', '80');
INSERT INTO `sh_member_price` VALUES ('32.00', '1', '85');
INSERT INTO `sh_member_price` VALUES ('44.00', '2', '85');
INSERT INTO `sh_member_price` VALUES ('1.00', '3', '85');

-- ----------------------------
-- Table structure for sh_order
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sn` char(16) NOT NULL COMMENT '商品编号',
  `addtime` datetime NOT NULL COMMENT '下单时间',
  `shr_name` varchar(30) NOT NULL COMMENT '会员名',
  `shr_province` varchar(30) NOT NULL COMMENT '省份',
  `shr_city` varchar(30) NOT NULL COMMENT '市',
  `shr_area` varchar(30) NOT NULL COMMENT '地区',
  `shr_address` varchar(30) NOT NULL COMMENT '详细地址',
  `shr_phone` varchar(30) NOT NULL COMMENT '手机号',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `delivery` varchar(30) NOT NULL DEFAULT '' COMMENT '送货方式',
  `pay` varchar(30) NOT NULL DEFAULT '' COMMENT '支付方式',
  `total_price` decimal(10,2) NOT NULL COMMENT '订单的总价(含运费)',
  `goods_tprice` decimal(10,2) NOT NULL COMMENT '商品的总价(不含运费)',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单的状态,0:未确认 1:已确认 2:申请退货 3:退货成功',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态:0:未支付 1:已支付',
  `delivery_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发货状态: 0:未发货 1:已发货 2已收货',
  `yunfei` decimal(10,2) NOT NULL COMMENT '运费',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='订单的基本信息';

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES ('36', '1445690345304654', '2015-10-24 20:39:05', '温柔温柔', '北京', '东城区', '西二旗', '文认为', '143252343453', '19', '圆通', '余额', '35444.00', '35444.00', '0', '1', '0', '100.00');

-- ----------------------------
-- Table structure for sh_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_goods`;
CREATE TABLE `sh_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_attr_id` varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性id',
  `goods_attr_str` varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性id',
  `goods_price` decimal(10,2) NOT NULL COMMENT '购买时的价格',
  `goods_number` smallint(5) unsigned NOT NULL COMMENT '购买的数量',
  `goods_name` varchar(150) NOT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='订单中商品的信息';

-- ----------------------------
-- Records of sh_order_goods
-- ----------------------------
INSERT INTO `sh_order_goods` VALUES ('1', '6', '77', '71', '产地:日本(￥200.00)', '3581.00', '1', '健身器');
INSERT INTO `sh_order_goods` VALUES ('2', '7', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('4', '10', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '2', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('5', '11', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('6', '12', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('7', '13', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('8', '14', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('9', '15', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('10', '16', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('11', '17', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('12', '18', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('13', '19', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('14', '20', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('15', '21', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('16', '22', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('17', '23', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('18', '24', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('19', '25', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('20', '26', '85', '95,100', '产地:日本(￥111.00)<br>颜色:黑色(￥1000.00)', '1155.00', '1', '大奶女王');
INSERT INTO `sh_order_goods` VALUES ('22', '36', '85', '95,101', '产地:日本(￥111.00)<br>颜色:白色(￥2000.00)', '2155.00', '1', '大奶女王');

-- ----------------------------
-- Table structure for sh_privilege
-- ----------------------------
DROP TABLE IF EXISTS `sh_privilege`;
CREATE TABLE `sh_privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pri_name` varchar(30) NOT NULL COMMENT '权限名称',
  `module_name` varchar(30) NOT NULL COMMENT '模块名称',
  `controller_name` varchar(30) NOT NULL COMMENT '控制器名称',
  `action_name` varchar(30) NOT NULL COMMENT '方法名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pri_name` (`pri_name`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sh_privilege
-- ----------------------------
INSERT INTO `sh_privilege` VALUES ('1', '系统模块', 'null', 'null', 'null', '0');
INSERT INTO `sh_privilege` VALUES ('2', '代码生成器', 'Gii', 'Index', 'index', '1');
INSERT INTO `sh_privilege` VALUES ('3', '管理员模块', 'null', 'null', 'null', '0');
INSERT INTO `sh_privilege` VALUES ('4', '权限列表', 'Admin', 'Privilege', 'lst', '3');
INSERT INTO `sh_privilege` VALUES ('5', '添加权限', 'Admin', 'Privilege', 'add', '4');
INSERT INTO `sh_privilege` VALUES ('6', '删除权限', 'Admin', 'Privilege', 'del', '4');
INSERT INTO `sh_privilege` VALUES ('7', '批量删除权限', 'Admin', 'Privilege', 'bdel', '4');
INSERT INTO `sh_privilege` VALUES ('8', '角色列表', 'Admin', 'Role', 'lst', '3');
INSERT INTO `sh_privilege` VALUES ('9', '添加角色', 'Admin', 'Role', 'add', '8');
INSERT INTO `sh_privilege` VALUES ('10', '删除角色', 'Admin', 'Role', 'del', '8');
INSERT INTO `sh_privilege` VALUES ('11', '批量删除角色', 'Admin', 'Role', 'bdel', '8');
INSERT INTO `sh_privilege` VALUES ('12', '管理员列表', 'Admin', 'Admin', 'lst', '3');
INSERT INTO `sh_privilege` VALUES ('13', '添加管理员', 'Admin', 'Admin', 'add', '12');
INSERT INTO `sh_privilege` VALUES ('14', '删除管理员', 'Admin', 'Admin', 'del', '12');
INSERT INTO `sh_privilege` VALUES ('15', '修改权限', 'Admin', 'Privilege', 'save', '4');
INSERT INTO `sh_privilege` VALUES ('16', '修改角色', 'Admin', 'Role', 'save', '8');
INSERT INTO `sh_privilege` VALUES ('17', '修改管理员', 'Admin', 'Admin', 'save', '12');
INSERT INTO `sh_privilege` VALUES ('18', '商品模块', 'null', 'null', 'null', '0');
INSERT INTO `sh_privilege` VALUES ('19', '商品列表', 'Goods', 'Goods', 'lst', '18');
INSERT INTO `sh_privilege` VALUES ('20', '商品分类', 'Goods', 'Category', 'lst', '18');
INSERT INTO `sh_privilege` VALUES ('21', '添加商品', 'Goods', 'Goods', 'add', '19');
INSERT INTO `sh_privilege` VALUES ('22', '编辑商品', 'Goods', 'Goods', 'save', '19');
INSERT INTO `sh_privilege` VALUES ('23', '删除商品', 'Goods', 'Goods', 'del', '19');
INSERT INTO `sh_privilege` VALUES ('24', '批量删除商品', 'Goods', 'Goods', 'bdel', '19');
INSERT INTO `sh_privilege` VALUES ('25', '添加商品分类', 'Goods', 'Category', 'add', '20');
INSERT INTO `sh_privilege` VALUES ('26', '修改商品分类', 'Goods', 'Category', 'save', '20');
INSERT INTO `sh_privilege` VALUES ('27', '删除商品分类', 'Goods', 'Category', 'del', '20');
INSERT INTO `sh_privilege` VALUES ('28', '批量删除商品分类', 'Goods', 'Category', 'bdel', '20');
INSERT INTO `sh_privilege` VALUES ('29', '品牌列表', 'Goods', 'Brand', 'lst', '18');
INSERT INTO `sh_privilege` VALUES ('30', '添加品牌', 'Goods', 'Brand', 'add', '29');
INSERT INTO `sh_privilege` VALUES ('31', '修改品牌', 'Goods', 'Brand', 'save', '29');
INSERT INTO `sh_privilege` VALUES ('32', '删除品牌', 'Goods', 'Brand', 'del', '29');
INSERT INTO `sh_privilege` VALUES ('33', '批量删除品牌', 'Goods', 'Brand', 'bdel', '29');
INSERT INTO `sh_privilege` VALUES ('34', '会员模块', 'null', 'null', 'null', '0');
INSERT INTO `sh_privilege` VALUES ('35', '会员级别列表', 'Member', 'MemberLevel', 'lst', '34');
INSERT INTO `sh_privilege` VALUES ('36', '添加', 'Member', 'MemberLevel', 'add', '35');
INSERT INTO `sh_privilege` VALUES ('37', '修改', 'Member', 'MemberLevel', 'save', '35');
INSERT INTO `sh_privilege` VALUES ('38', '删除', 'Member', 'MemberLevel', 'del', '35');
INSERT INTO `sh_privilege` VALUES ('39', '批量删除', 'Member', 'MemberLevel', 'bdel', '35');
INSERT INTO `sh_privilege` VALUES ('40', '商品类型', 'Goods', 'Type', 'lst', '18');
INSERT INTO `sh_privilege` VALUES ('41', '文章模块', 'null', 'null', 'null', '0');
INSERT INTO `sh_privilege` VALUES ('42', '文章分类列表', 'Article', 'ArticleCat', 'lst', '41');
INSERT INTO `sh_privilege` VALUES ('43', '文章列表', 'Article', 'Article', 'lst', '41');
INSERT INTO `sh_privilege` VALUES ('44', '广告模块', 'null', 'null', 'null', '0');
INSERT INTO `sh_privilege` VALUES ('45', '广告位列表', 'Ad', 'AdPos', 'lst', '44');
INSERT INTO `sh_privilege` VALUES ('46', '广告列表', 'Ad', 'Ad', 'lst', '44');
INSERT INTO `sh_privilege` VALUES ('47', '按钮管理', 'Gii', 'Buttons', 'lst', '1');
INSERT INTO `sh_privilege` VALUES ('48', '参数列表', 'Gii', 'ShopConfig', 'lst', '1');
INSERT INTO `sh_privilege` VALUES ('49', '店铺设置', 'Gii', 'ShopConfig', 'config', '1');
INSERT INTO `sh_privilege` VALUES ('50', '推荐位列表', 'Gii', 'Recommend', 'lst', '1');

-- ----------------------------
-- Table structure for sh_product
-- ----------------------------
DROP TABLE IF EXISTS `sh_product`;
CREATE TABLE `sh_product` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `goods_number` mediumint(8) unsigned NOT NULL COMMENT '库存量',
  `goods_attr` varchar(150) NOT NULL DEFAULT '' COMMENT '货品的属性'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货品';

-- ----------------------------
-- Records of sh_product
-- ----------------------------
INSERT INTO `sh_product` VALUES ('85', '3', '96,102');
INSERT INTO `sh_product` VALUES ('85', '9', '95,100');
INSERT INTO `sh_product` VALUES ('85', '0', '95,101');
INSERT INTO `sh_product` VALUES ('73', '33', '104');

-- ----------------------------
-- Table structure for sh_recommend
-- ----------------------------
DROP TABLE IF EXISTS `sh_recommend`;
CREATE TABLE `sh_recommend` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rec_name` varchar(30) NOT NULL COMMENT '推荐位名称',
  `rec_type` enum('商品','分类') NOT NULL COMMENT '推荐位的类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='推荐位';

-- ----------------------------
-- Records of sh_recommend
-- ----------------------------
INSERT INTO `sh_recommend` VALUES ('1', '疯狂抢购', '商品');
INSERT INTO `sh_recommend` VALUES ('2', '热卖商品', '商品');
INSERT INTO `sh_recommend` VALUES ('3', '推荐商品', '商品');
INSERT INTO `sh_recommend` VALUES ('4', '首页中间大类推荐', '分类');
INSERT INTO `sh_recommend` VALUES ('5', '首页中间大类推荐', '商品');
INSERT INTO `sh_recommend` VALUES ('6', '新品上架', '商品');
INSERT INTO `sh_recommend` VALUES ('7', '猜您喜欢', '商品');

-- ----------------------------
-- Table structure for sh_recommend_item
-- ----------------------------
DROP TABLE IF EXISTS `sh_recommend_item`;
CREATE TABLE `sh_recommend_item` (
  `rec_id` mediumint(8) unsigned NOT NULL COMMENT '推荐位id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐位中的数据';

-- ----------------------------
-- Records of sh_recommend_item
-- ----------------------------
INSERT INTO `sh_recommend_item` VALUES ('1', '67');
INSERT INTO `sh_recommend_item` VALUES ('2', '67');
INSERT INTO `sh_recommend_item` VALUES ('1', '68');
INSERT INTO `sh_recommend_item` VALUES ('5', '69');
INSERT INTO `sh_recommend_item` VALUES ('1', '70');
INSERT INTO `sh_recommend_item` VALUES ('5', '71');
INSERT INTO `sh_recommend_item` VALUES ('3', '71');
INSERT INTO `sh_recommend_item` VALUES ('2', '71');
INSERT INTO `sh_recommend_item` VALUES ('4', '45');
INSERT INTO `sh_recommend_item` VALUES ('4', '46');
INSERT INTO `sh_recommend_item` VALUES ('4', '48');
INSERT INTO `sh_recommend_item` VALUES ('1', '69');
INSERT INTO `sh_recommend_item` VALUES ('4', '44');
INSERT INTO `sh_recommend_item` VALUES ('4', '51');
INSERT INTO `sh_recommend_item` VALUES ('4', '52');
INSERT INTO `sh_recommend_item` VALUES ('4', '52');
INSERT INTO `sh_recommend_item` VALUES ('5', '66');
INSERT INTO `sh_recommend_item` VALUES ('1', '71');
INSERT INTO `sh_recommend_item` VALUES ('5', '70');
INSERT INTO `sh_recommend_item` VALUES ('4', '53');
INSERT INTO `sh_recommend_item` VALUES ('4', '47');
INSERT INTO `sh_recommend_item` VALUES ('7', '80');
INSERT INTO `sh_recommend_item` VALUES ('3', '74');
INSERT INTO `sh_recommend_item` VALUES ('1', '76');
INSERT INTO `sh_recommend_item` VALUES ('4', '56');
INSERT INTO `sh_recommend_item` VALUES ('7', '79');
INSERT INTO `sh_recommend_item` VALUES ('6', '79');
INSERT INTO `sh_recommend_item` VALUES ('7', '73');
INSERT INTO `sh_recommend_item` VALUES ('6', '73');
INSERT INTO `sh_recommend_item` VALUES ('2', '74');
INSERT INTO `sh_recommend_item` VALUES ('1', '74');
INSERT INTO `sh_recommend_item` VALUES ('1', '78');
INSERT INTO `sh_recommend_item` VALUES ('2', '78');
INSERT INTO `sh_recommend_item` VALUES ('3', '78');
INSERT INTO `sh_recommend_item` VALUES ('5', '78');
INSERT INTO `sh_recommend_item` VALUES ('5', '75');
INSERT INTO `sh_recommend_item` VALUES ('3', '75');
INSERT INTO `sh_recommend_item` VALUES ('2', '75');
INSERT INTO `sh_recommend_item` VALUES ('1', '75');
INSERT INTO `sh_recommend_item` VALUES ('3', '77');
INSERT INTO `sh_recommend_item` VALUES ('2', '77');
INSERT INTO `sh_recommend_item` VALUES ('1', '77');
INSERT INTO `sh_recommend_item` VALUES ('5', '73');
INSERT INTO `sh_recommend_item` VALUES ('3', '73');
INSERT INTO `sh_recommend_item` VALUES ('2', '73');
INSERT INTO `sh_recommend_item` VALUES ('4', '54');
INSERT INTO `sh_recommend_item` VALUES ('4', '59');
INSERT INTO `sh_recommend_item` VALUES ('1', '73');
INSERT INTO `sh_recommend_item` VALUES ('6', '74');
INSERT INTO `sh_recommend_item` VALUES ('7', '74');
INSERT INTO `sh_recommend_item` VALUES ('3', '79');
INSERT INTO `sh_recommend_item` VALUES ('1', '79');
INSERT INTO `sh_recommend_item` VALUES ('6', '80');
INSERT INTO `sh_recommend_item` VALUES ('2', '80');
INSERT INTO `sh_recommend_item` VALUES ('1', '80');
INSERT INTO `sh_recommend_item` VALUES ('3', '81');
INSERT INTO `sh_recommend_item` VALUES ('2', '81');
INSERT INTO `sh_recommend_item` VALUES ('1', '81');
INSERT INTO `sh_recommend_item` VALUES ('5', '81');
INSERT INTO `sh_recommend_item` VALUES ('6', '81');
INSERT INTO `sh_recommend_item` VALUES ('7', '81');
INSERT INTO `sh_recommend_item` VALUES ('7', '82');
INSERT INTO `sh_recommend_item` VALUES ('7', '84');
INSERT INTO `sh_recommend_item` VALUES ('6', '84');
INSERT INTO `sh_recommend_item` VALUES ('5', '84');
INSERT INTO `sh_recommend_item` VALUES ('3', '84');
INSERT INTO `sh_recommend_item` VALUES ('2', '84');
INSERT INTO `sh_recommend_item` VALUES ('1', '84');
INSERT INTO `sh_recommend_item` VALUES ('5', '85');

-- ----------------------------
-- Table structure for sh_remark
-- ----------------------------
DROP TABLE IF EXISTS `sh_remark`;
CREATE TABLE `sh_remark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '打分',
  `content` varchar(600) NOT NULL DEFAULT '' COMMENT '评论的内容',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `addtime` datetime NOT NULL COMMENT '评论时间',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员的id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of sh_remark
-- ----------------------------
INSERT INTO `sh_remark` VALUES ('7', '5', '商品垃圾的很1', '77', '2015-09-02 21:22:59', '0');
INSERT INTO `sh_remark` VALUES ('8', '5', '商品垃圾的很2', '77', '2015-09-02 21:24:03', '0');
INSERT INTO `sh_remark` VALUES ('9', '5', '商品垃圾的很3', '77', '2015-09-02 21:25:37', '0');
INSERT INTO `sh_remark` VALUES ('10', '5', 'asdfasdfasd', '75', '2015-09-03 20:03:20', '19');
INSERT INTO `sh_remark` VALUES ('11', '5', 'rfhrtyhrt', '77', '2015-09-04 19:33:10', '19');
INSERT INTO `sh_remark` VALUES ('12', '5', '第一次是商品评论', '77', '2015-09-05 19:41:40', '0');

-- ----------------------------
-- Table structure for sh_role
-- ----------------------------
DROP TABLE IF EXISTS `sh_role`;
CREATE TABLE `sh_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `pri_id_list` varchar(150) NOT NULL DEFAULT '' COMMENT '权限列表',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sh_role
-- ----------------------------
INSERT INTO `sh_role` VALUES ('1', '超级管理员', '*');
INSERT INTO `sh_role` VALUES ('5', '经理', '3,8,9,12,13');

-- ----------------------------
-- Table structure for sh_shop_config
-- ----------------------------
DROP TABLE IF EXISTS `sh_shop_config`;
CREATE TABLE `sh_shop_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `config_name` varchar(150) NOT NULL COMMENT '参数名称',
  `config_type` enum('单行文本','单选','多行文本') NOT NULL COMMENT '参数类型',
  `config_values` varchar(600) NOT NULL DEFAULT '' COMMENT '参数的可选值',
  `config_value` varchar(600) NOT NULL DEFAULT '' COMMENT '参数的值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='店铺参数表';

-- ----------------------------
-- Records of sh_shop_config
-- ----------------------------
INSERT INTO `sh_shop_config` VALUES ('1', '下单时间', '单选', '下单时,支付之后,发后之后', '下单时');
INSERT INTO `sh_shop_config` VALUES ('2', '邮件服务器', '单行文本', 'ete', '15863549041@126.com');
INSERT INTO `sh_shop_config` VALUES ('3', 'tcp备案号', '多行文本', '', '北京市公安局朝阳分局备案编号110105014669  |  京ICP证070359号Copyright @ 2004-2015  京东JD.com 版权所有\r\n');
INSERT INTO `sh_shop_config` VALUES ('28', '热门搜索', '多行文本', '', 'D-Link无线路由,耐克篮球鞋,TCL空调,休闲男鞋');
INSERT INTO `sh_shop_config` VALUES ('29', '用户评论规则', '单选', '会员,全部', '全部');
INSERT INTO `sh_shop_config` VALUES ('30', '匿名用户头像', '单行文本', '', 'http://www.xm.com/Public/Images/1.jpg');
INSERT INTO `sh_shop_config` VALUES ('31', '匿名用户的名称', '单行文本', '', '游客');

-- ----------------------------
-- Table structure for sh_type
-- ----------------------------
DROP TABLE IF EXISTS `sh_type`;
CREATE TABLE `sh_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_name` varchar(30) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品类型';

-- ----------------------------
-- Records of sh_type
-- ----------------------------
INSERT INTO `sh_type` VALUES ('7', '书');
INSERT INTO `sh_type` VALUES ('6', '电脑');
INSERT INTO `sh_type` VALUES ('5', '手机');

-- ----------------------------
-- Table structure for sh_yinxiang
-- ----------------------------
DROP TABLE IF EXISTS `sh_yinxiang`;
CREATE TABLE `sh_yinxiang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `yx_name` varchar(30) NOT NULL COMMENT '名称',
  `yx_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '统计次数',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='印象表';

-- ----------------------------
-- Records of sh_yinxiang
-- ----------------------------
INSERT INTO `sh_yinxiang` VALUES ('1', '垃圾', '1', '77');
INSERT INTO `sh_yinxiang` VALUES ('2', '大气', '1', '77');
INSERT INTO `sh_yinxiang` VALUES ('3', '23432', '1', '75');
INSERT INTO `sh_yinxiang` VALUES ('4', 'aasdfa', '1', '77');
INSERT INTO `sh_yinxiang` VALUES ('5', '杠杠的', '1', '77');
