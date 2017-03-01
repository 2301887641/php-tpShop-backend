#建表优化原则1:选择最小的字段类型 int(0~40亿) tinyint(0~255) smallint(0~65535) mediumint(0~1600万)
#建表优化原则2:尽可能所有字段设置为not null
#建表优化原则3:创建合适的索引
#每张表对应一个控制器
#跳模块时,使用__APP__,有可能不在一个模块但是控制器或方法相同<a href="__APP__/Admin/Admin/lst" target="main-frame">管理员列表</a>
#__self__当前方法,用于模板中表示访问当前方法,__MODULE__表示当前模块
#sql语句中带not null && default ''的表示可以为空,在模型验证时,不用验证
#和null做比较时,null不用加引号,否则错误
#模型中如果在钩子函数中使用delete函数会死循环,因为会先调用钩子函数,所以要用execute函数
#实例化表模型,取数据后,不传递给变量也可以,数据也会被保存在原实例对象中  
//$role=M('role');
//$role->where('id='.$role_id)->find();
//var_dump($role->pri_id_list);die;按对象的方式取出即可
#权限验证只取前两级权限,并且把第2级权限放到第一级权限的下面
create database shop charset=utf8;//建库语句
use shop;

#管理员表
drop table if exists sh_admin;
create table sh_admin (
id int unsigned auto_increment comment 'id',
username varchar(30) not null comment '用户名',
password char(32) not null comment '密码',
role_id int unsigned not null comment '所在角色',
primary key (id),
unique (username)
)engine=myisam default charset=utf8 comment '管理员';
insert into sh_admin values(1,'admin','b2ca678b4c936f905fb82f2733f5297f',1);//初始化管理员

#商品表
drop table if exists sh_goods;
create table sh_goods (
id int unsigned auto_increment comment 'id',
goods_name varchar(60) not null comment '商品名称',
market_price decimal(10,2) not null comment '市场价',
shop_price decimal(10,2) not null comment '本店价',
logo varchar(150) not null  comment 'logo',
is_on_sale enum('是','否') not null comment '是否上架',
primary key(id),
unique (goods_name)
)engine=myisam default charset=utf8 comment '商品';

#商品分类表
drop table if exists sh_category;
create table sh_category (
id int unsigned auto_increment comment 'id',
cat_name varchar(30) not null comment '分类名称',
parent_id int unsigned not null default '0' comment '上级分类',
filter_goods_attr_id varchar(150) not null default '' comment '用来搜索的属性',
primary key(id),
unique (cat_name)
)engine=myisam default charset=utf8 comment '分类';

#权限表
drop table if exists sh_privilege;
create table sh_privilege(
id int unsigned auto_increment comment 'id',
pri_name varchar(30) not null comment'权限名称',
module_name varchar(30) not null comment '模块名称',
controller_name varchar(30) not null comment '控制器名称',
action_name varchar(30) not null comment '方法名称',
parent_id int unsigned not null default 0 comment '上级权限',
primary key(id),
key parent_id(parent_id),
unique (pri_name)
)engine=myisam default charset=utf8 comment'权限表'; 

#角色表
drop table if exists sh_role;
create table sh_role(
id int unsigned auto_increment comment 'id',
role_name varchar(30) not null comment '角色名称',
pri_id_list varchar(150) not null default '' comment '权限列表',
primary key(id),
unique (role_name)
)engine=myisam default charset=utf8 comment '角色表';
insert into sh_role values(1,'超级管理员','*');

#商品类型表
drop table if exists sh_type;
create table sh_type(
id mediumint unsigned auto_increment comment 'id',
type_name varchar(30) not null comment '类型名称',
primary key(id)
)engine=myisam default charset=utf8 comment '商品类型'

#商品属性表
drop table if exists sh_attribute;
create table sh_attribute(
id mediumint unsigned auto_increment comment 'id',
attr_name varchar(30) not null comment '属性名称',
attr_type enum('唯一','单选') not null comment '属性类型',
attr_values varchar(300) not null default '' comment '属性值',
type_id mediumint unsigned not null comment '所属类型',
primary key(id),
key type_id(type_id)
)engine=myisam default charset=utf8 comment '商品属性'

#品牌表
drop table if exists sh_brand;
create table sh_brand(
id mediumint unsigned auto_increment comment 'id',
brand_name varchar(30) not null comment '品牌名称',
brand_logo varchar(150) not null comment '品牌logo',
brand_url varchar(150) not null comment '官方网站',
primary key (id)
)engine=myisam default charset=utf8 comment '商品品牌'

#商品表
drop table if exists sh_goods;

create table sh_goods(
id mediumint unsigned auto_increment comment 'id',
goods_name varchar(40) not null comment '商品名称',
goods_sn char(16) not null comment '商品编号',
logo varchar(150) not null default '' comment '原图',
sm_logo varchar(150) not null default '' comment '小图',
mid_logo varchar(150) not null default '' comment '中图',
big_logo varchar(150) not null default '' comment '大图',
market_price decimal(10,2) not null comment '市场价',
shop_price decimal(10,2) not null comment '本店价',
is_on_sale enum("是","否") not null comment '是否上架',
cat_id mediumint unsigned not null comment '分类id',
brand_id mediumint unsigned not null default '0' comment '品牌id',
goods_desc text  comment '商品描述',
goods_weight decimal(10,2) not null default '0.00' comment '商品重量',
weight_unit enum("克","千克") not null comment '重量单位',
type_id mediumint unsigned not null default '0' comment '类型id', 
primary key(id),
key cat_id(cat_id),
key shop_price(shop_price),
key brand_id(brand_id),
unique goods_name(goods_name)
)engine=myisam default charset=utf8 comment '商品表'

#会员级别表

drop table if exists sh_member_level;

create table sh_member_level(
id mediumint unsigned auto_increment comment 'id',
level_name varchar(30) not null comment '级别名称',
num_bottom int unsigned not null comment '积分下限',
num_top int unsigned not null comment '积分上限',
rate tinyint unsigned not null comment '折扣率',
primary key(id),
)engine=myisam default charset=utf8 comment '会员级别表'

#会员价格表

drop table if exists sh_member_price;
create table sh_member_price(
price decimal(10,2) not null comment '价格',
level_id mediumint unsigned not null comment '级别id',
goods_id mediumint unsigned not null comment '商品id'
)engine=myisam default charset=utf8 comment '会员价格'

#商品属性表

drop table if exists sh_goods_attr;

create table sh_goods_attr(
id mediumint unsigned auto_increment comment 'id',
goods_id mediumint not null comment '商品id',
attr_id mediumint unsigned not null comment '属性id',
attr_value varchar(150) not null default '' comment '属性值',
attr_price decimal(10,2) not null default '0.00' comment '属性价格',
primary key(id)
)engine=myisam default charset=utf8 comment '商品属性'

#商品图片

drop table if exists sh_goods_pic;
create table sh_goods_pic(
id mediumint unsigned auto_increment comment 'id',
goods_id mediumint unsigned not null comment '商品id',
logo varchar(150) not null default '' comment '原图',
sm_logo varchar(150) not null default '' comment '小图',
big_logo varchar(150) not null default '' comment '大图',
primary key(id)
)engine=myisam default charset=utf8 comment '商品图片'

#货品表

drop tale if exists sh_product;

create table sh_product(
id mediumint unsigned auto_increment comment 'id',
goods_id mediumint unsigned not null comment '商品id',
goods_number mediumint unsigned not null comment '库存量',
goods_attr varchar(150) not null default '' comment '货品的属性',
primary key(id)
)engine=myisam default charset=utf8 comment '货品'

#文章分类
drop table if exists sh_article_cat;

create table sh_article_cat(
id mediumint auto_increment comment 'id',
cat_name varchar(45) not null comment '分类名称',
is_help enum('是','否') not null  comment '是否是帮助',
primary key(id) 
)engine=myisam default charset=utf8 comment='文章分类'

#文章表
drop table if exists sh_article;
create table sh_article(
id mediumint unsigned auto_increment comment 'id',
title varchar(150) not null comment '文章标题',
content text not null comment '内容',
cat_id mediumint unsigned not null  comment '文章分类id',
addtime timestamp comment '添加时间',
primary key(id)
)engine=myisam default charset=utf8 comment '文章表'

#广告位表
drop table if exists sh_ad_pos;

create table sh_ad_pos(
id mediumint unsigned auto_increment comment 'id',
pos_name varchar(45) not null comment '广告位名称',
pos_width smallint unsigned not null comment '广告位宽',
pos_height smallint unsigned not null comment '广告位高',
primary key(id)
)engine=myisam default charset=utf8 comment '广告位'

#广告表
drop table if exists sh_ad;

create table sh_ad(
id int unsigned auto_increment comment 'id',
ad_name varchar(45) not null comment '广告名称',
pos_id mediumint unsigned not null comment '广告位id',
is_on enum("是","否") not null comment '是否启用',
ad_type enum("图片","动画") not null comment '广告类型',
img_url varchar(150) not null default '' comment '广告地址',
link varchar(150) not null default '' comment '链接地址',
primary key(id)
)engine=myisam default charset=utf8 comment '广告'

#广告动画表

drop table if exists sh_ad_info;

create table sh_ad_info(
id int unsigned auto_increment comment 'id',
img_url varchar(150) not null default '' comment '广告地址',
link varchar(150) not null default '' comment '链接地址',
ad_id mediumint unsigned not null comment '广告id',
primary key(id) 
)engine=myisam default charset=utf8 comment '动画广告信息'

#按钮表
drop table if exists sh_buttons;

create table sh_buttons(
id mediumint unsigned  auto_increment comment 'id',
btn_name varchar(30) not null comment '按钮名称',
btn_url varchar(150) not null comment '按钮地址',
open_new enum("是","否") not null default "是" comment '是否打开新窗口',
btn_pos enum('上','中','下') not null comment '按钮位置',
primary key(id)
)engine=myisam default charset=utf8 comment '按钮表'

#店铺参数表

drop table if exists sh_shop_config;

create table sh_shop_config(
id mediumint unsigned auto_increment comment 'id',
config_name varchar(150) not null comment '参数名称',
config_type enum("单行文本","单选","多行文本") not null comment '参数类型',
config_values varchar(600) not null default '' comment '参数的可选值',
config_value varchar(600) not null default '' comment '参数的值', 
primary key(id)
)engine=myisam default charset=utf8 comment '店铺参数表'


#推荐位
drop table if exists sh_recommend;
create table sh_recommend(
id mediumint unsigned auto_increment comment 'id',
rec_name varchar(30) not null comment '推荐位名称',
rec_type enum("商品","分类") not null comment '推荐位的类型',
primary key(id)
)engine=myisam default charset=utf8 comment '推荐位'

#推荐位中的数据
drop table if exists sh_recommend_item;
create table sh_recommend_item(
id mediumint unsigned auto_increment comment 'id',
rec_id mediumint unsigned  not null comment '推荐位id',
goods_id  mediumint unsigned  not null comment '商品id',
primary key(id)
)engine=myisam default charset=utf8 comment '推荐位中的数据'

#会员前台表
drop table if exists sh_member;
create table sh_member(
id mediumint unsigned auto_increment comment 'id',
face varchar(150) not null default '' comment '会员头像',
username varchar(15) not null comment '用户名',
password char(32) not null comment '密码',
email varchar(150) not null comment '邮箱',
addtime datetime not null comment '注册时间',
gender enum("男","女") not null default '男' comment '性别',
email_checked enum("已验证","未验证") not null default "未验证" comment 'email是否已验证',
get_pass_code char(7) not null default '' comment '找回密码密钥',
get_pass_code_time int not null default '0' comment '密钥生成时间',
Integral mediumint not null default '0' comment '积分',
email_chk_str char(32) not null comment 'email验证字符串',
money decimal(10,2) not null default '0.00' comment '余额',
primary key (id)
)engine=InnoDB default charset=utf8 comment '会员表';

//表建立完成后,需要添加字段时,使用add,后面是要添加的字段规则
 alter table sh_member add money decimal(10,2) not null default '0.00' comment '余额';
alter table sh_member add get_pass_code_time int not null default '0' comment '密钥生成时间';

//用户商品详情页评论时,假如开启全部可以评论功能(允许匿名用户评论),默认的匿名用户的头像,直接保存在了
//http://www.xm.com/Public/Images/1.jpg,然后再店铺设置里面填写的这个地址,如果想自己随意添加的话,可以修改成上传表单

#评论表
drop table  if exists sh_remark;
create table sh_remark (
id int unsigned not null auto_increment comment 'id',
star tinyint unsigned not null default '5' comment '打分',
content varchar(600) not null default '' comment '评论的内容',
goods_id int unsigned not null  comment '商品id',
addtime datetime not null comment '评论时间',
member_id int unsigned not null default '0' comment '会员的id',
primary key(id)
)engine=myisam default charset=utf8 comment '评论表'

#商品印象表
drop table if exists sh_yinxiang;
create table sh_yinxiang(
id int unsigned not null auto_increment comment 'id',
yx_name varchar(30) not null comment '名称',
yx_count smallint unsigned not null default '0' comment '统计次数', 
goods_id int unsigned not null comment '商品id',
primary key(id)
)engine=myisam default charset=utf8 comment '印象表'

#会员收货地址
drop table if exists sh_member_address;
create table sh_member_address(
id int unsigned auto_increment comment 'id',    
member_name varchar(30) not null comment '会员名',
member_Province varchar(30) not null comment '省份',
member_city varchar(30) not null comment '市',    
member_area varchar(30) not null comment '地区',
mebmer_address varchar(30) not null comment '详细地址',
member_phone varchar(30) not null comment '手机号',    
member_id int unsigned not null comment '会员id',    
primary key(id),    
key member_id(member_id)    
)engine=myisam default charset=utf8 comment '收货人地址'

#订单表--订单的基本信息
drop table if exists sh_order;
create table sh_order(
id int unsigned auto_increment comment 'id',
sn char(16) not null comment '商品编号',
addtime datetime not null comment '下单时间',
shr_name varchar(30) not null comment '会员名',
shr_province varchar(30) not null comment '省份',
shr_city varchar(30) not null comment '市',    
shr_area varchar(30) not null comment '地区',
shr_address varchar(30) not null comment '详细地址',
shr_phone varchar(30) not null comment '手机号',    
member_id int unsigned not null comment '会员id', 
delivery varchar(30) not null default '' comment '送货方式',
pay varchar(30) not null default '' comment '支付方式',
total_price decimal(10,2) not null comment '订单的总价(含运费)',
goods_tprice decimal(10,2) not null comment '商品的总价(不含运费)',
order_status tinyint not null default '0' comment '订单的状态,0:未确认 1:已确认 2:申请退货 3:退货成功',
pay_status tinyint not null default '0' comment '支付状态:0:未支付 1:已支付',
delivery_status tinyint not null default '0' comment '发货状态: 0:未发货 1:已发货 2已收货',
yunfei decimal(10,2) not null comment '运费',
primary key(id),
key member_id(member_id)
)engine=InnoDB default charset=utf8 comment '订单的基本信息';

#订单的商品
drop table if exists sh_order_goods;
create table sh_order_goods(
id int unsigned auto_increment comment 'id',
order_id int unsigned not null comment '订单id',
goods_id int unsigned not null comment '商品id',
goods_attr_id varchar(150) not null default '' comment '商品属性id',
goods_attr_str varchar(150) not null default '' comment '商品属性id',
goods_price decimal(10,2) not null comment '购买时的价格',
goods_number smallint unsigned not null comment '购买的数量',
goods_name varchar(150) not null comment '商品名称',
primary key(id),
key order_id(order_id)
)engine=InnoDB default charset=utf8 comment '订单中商品的信息'



//商品详情页的评论功能,要根据后台的,店铺设置动态的显示(匿名用户是否显示这个评论表单)
按照常理,因该在goods.html页面中将店铺设置中的,用户评论设置取出来,然后用php代码进行判断
如果只允许会员评论,就要检查session.否则,都可以提交
但是这里有个问题,因为goods商品页面已经生成了静态页面了,这个时候检查session是不起作用的,所以用ajax来检查