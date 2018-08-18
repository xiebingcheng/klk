/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : baoma

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-07-19 13:40:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ac_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ac_admin_menu`;
CREATE TABLE `ac_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of ac_admin_menu
-- ----------------------------
INSERT INTO ac_admin_menu VALUES ('1', '0', '0', '1', '20', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO ac_admin_menu VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO ac_admin_menu VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO ac_admin_menu VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO ac_admin_menu VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO ac_admin_menu VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO ac_admin_menu VALUES ('7', '6', '1', '1', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO ac_admin_menu VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO ac_admin_menu VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO ac_admin_menu VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO ac_admin_menu VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO ac_admin_menu VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO ac_admin_menu VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO ac_admin_menu VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO ac_admin_menu VALUES ('15', '6', '1', '1', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO ac_admin_menu VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO ac_admin_menu VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO ac_admin_menu VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO ac_admin_menu VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO ac_admin_menu VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO ac_admin_menu VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO ac_admin_menu VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO ac_admin_menu VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO ac_admin_menu VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO ac_admin_menu VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO ac_admin_menu VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO ac_admin_menu VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO ac_admin_menu VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO ac_admin_menu VALUES ('29', '6', '1', '1', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO ac_admin_menu VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO ac_admin_menu VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO ac_admin_menu VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO ac_admin_menu VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO ac_admin_menu VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO ac_admin_menu VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO ac_admin_menu VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO ac_admin_menu VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO ac_admin_menu VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO ac_admin_menu VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO ac_admin_menu VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO ac_admin_menu VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO ac_admin_menu VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO ac_admin_menu VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO ac_admin_menu VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO ac_admin_menu VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO ac_admin_menu VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO ac_admin_menu VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO ac_admin_menu VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO ac_admin_menu VALUES ('49', '109', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO ac_admin_menu VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO ac_admin_menu VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO ac_admin_menu VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO ac_admin_menu VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO ac_admin_menu VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO ac_admin_menu VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO ac_admin_menu VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO ac_admin_menu VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO ac_admin_menu VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO ac_admin_menu VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO ac_admin_menu VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO ac_admin_menu VALUES ('61', '6', '1', '1', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO ac_admin_menu VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO ac_admin_menu VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO ac_admin_menu VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO ac_admin_menu VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO ac_admin_menu VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO ac_admin_menu VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO ac_admin_menu VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO ac_admin_menu VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO ac_admin_menu VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO ac_admin_menu VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO ac_admin_menu VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO ac_admin_menu VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO ac_admin_menu VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO ac_admin_menu VALUES ('75', '6', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO ac_admin_menu VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO ac_admin_menu VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO ac_admin_menu VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO ac_admin_menu VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO ac_admin_menu VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO ac_admin_menu VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO ac_admin_menu VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO ac_admin_menu VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO ac_admin_menu VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO ac_admin_menu VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO ac_admin_menu VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO ac_admin_menu VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO ac_admin_menu VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO ac_admin_menu VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO ac_admin_menu VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO ac_admin_menu VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO ac_admin_menu VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO ac_admin_menu VALUES ('93', '6', '1', '1', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO ac_admin_menu VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO ac_admin_menu VALUES ('95', '6', '1', '1', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO ac_admin_menu VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO ac_admin_menu VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO ac_admin_menu VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO ac_admin_menu VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO ac_admin_menu VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO ac_admin_menu VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO ac_admin_menu VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO ac_admin_menu VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO ac_admin_menu VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO ac_admin_menu VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO ac_admin_menu VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO ac_admin_menu VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO ac_admin_menu VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO ac_admin_menu VALUES ('109', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO ac_admin_menu VALUES ('110', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO ac_admin_menu VALUES ('111', '110', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO ac_admin_menu VALUES ('112', '110', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO ac_admin_menu VALUES ('113', '110', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO ac_admin_menu VALUES ('114', '110', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO ac_admin_menu VALUES ('115', '110', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO ac_admin_menu VALUES ('116', '110', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO ac_admin_menu VALUES ('117', '110', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO ac_admin_menu VALUES ('118', '110', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO ac_admin_menu VALUES ('119', '110', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO ac_admin_menu VALUES ('120', '0', '0', '1', '30', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO ac_admin_menu VALUES ('121', '120', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO ac_admin_menu VALUES ('122', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO ac_admin_menu VALUES ('123', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO ac_admin_menu VALUES ('124', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO ac_admin_menu VALUES ('125', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO ac_admin_menu VALUES ('126', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO ac_admin_menu VALUES ('127', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO ac_admin_menu VALUES ('128', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO ac_admin_menu VALUES ('129', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO ac_admin_menu VALUES ('130', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO ac_admin_menu VALUES ('131', '120', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO ac_admin_menu VALUES ('132', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO ac_admin_menu VALUES ('133', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO ac_admin_menu VALUES ('134', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO ac_admin_menu VALUES ('135', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO ac_admin_menu VALUES ('136', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO ac_admin_menu VALUES ('137', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO ac_admin_menu VALUES ('138', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO ac_admin_menu VALUES ('139', '120', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO ac_admin_menu VALUES ('140', '139', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO ac_admin_menu VALUES ('141', '139', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO ac_admin_menu VALUES ('142', '139', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO ac_admin_menu VALUES ('143', '139', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO ac_admin_menu VALUES ('144', '139', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO ac_admin_menu VALUES ('145', '120', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO ac_admin_menu VALUES ('146', '145', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO ac_admin_menu VALUES ('147', '145', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO ac_admin_menu VALUES ('148', '145', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO ac_admin_menu VALUES ('149', '145', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO ac_admin_menu VALUES ('150', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO ac_admin_menu VALUES ('151', '150', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO ac_admin_menu VALUES ('152', '109', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO ac_admin_menu VALUES ('153', '152', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO ac_admin_menu VALUES ('154', '153', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO ac_admin_menu VALUES ('155', '153', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO ac_admin_menu VALUES ('156', '152', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO ac_admin_menu VALUES ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO ac_admin_menu VALUES ('158', '6', '1', '1', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO ac_admin_menu VALUES ('159', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO ac_admin_menu VALUES ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO ac_admin_menu VALUES ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO ac_admin_menu VALUES ('162', '0', '0', '1', '10000', 'business', 'AdminIndex', 'default', '', '业务管理', 'newspaper-o', '业务管理');
INSERT INTO ac_admin_menu VALUES ('163', '162', '1', '1', '10000', 'business', 'AdminType', 'index', '', '彩种管理', '', '');
INSERT INTO ac_admin_menu VALUES ('164', '162', '1', '1', '10000', 'business', 'AdminData', 'index', '', '开奖管理', '', '开奖管理');
INSERT INTO ac_admin_menu VALUES ('165', '162', '1', '1', '10000', 'business', 'AdminPlan', 'index', '', '计划管理', '', '计划管理');
INSERT INTO ac_admin_menu VALUES ('166', '162', '1', '1', '10000', 'business', 'AdminTime', 'index', '', '时间管理', '', ' 时间管理');
INSERT INTO ac_admin_menu VALUES ('167', '162', '1', '1', '10000', 'business', 'AdminLhcCategory', 'index', '', '六合分类管理', '', '六合分类管理');
INSERT INTO ac_admin_menu VALUES ('168', '162', '1', '1', '10000', 'business', 'AdminLhcArticle', 'index', '', '六合文章管理', '', '六合文章管理');

-- ----------------------------
-- Table structure for `ac_asset`
-- ----------------------------
DROP TABLE IF EXISTS `ac_asset`;
CREATE TABLE `ac_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of ac_asset
-- ----------------------------
INSERT INTO ac_asset VALUES ('1', '1', '128814', '1527126671', '1', '0', '33228c175c1493835705fd46c7ad9370f9d6646e35126df12bbd98664f777069', 'timg.jpg', 'portal/20180524/418ecf94dd374555e088f3d54b758a4d.jpg', '33228c175c1493835705fd46c7ad9370', 'd64a15baeebde045ecd5aeea494cd53fef06d262', 'jpg', null);
INSERT INTO ac_asset VALUES ('2', '1', '16331', '1529915469', '1', '0', 'a2ee0e7c0089bb5398db52cd83e6b7457749e79d69f1aba70020bcc934e109e7', 'ssccq.png', 'business/20180625/03f8e287667339c60ccadeaf94b8ca4b.png', 'a2ee0e7c0089bb5398db52cd83e6b745', '0b2e237846cc535a42ee5fd414818b3a424ccb56', 'png', null);
INSERT INTO ac_asset VALUES ('3', '1', '19133', '1529915485', '1', '0', '3d3b256f638b9a20df784f7331e2785d7e2cafa893b881e0ca29116fbb4c9704', 'pk10bj.png', 'business/20180625/ec42a91d2f1b5e76fab6613f194f5a9c.png', '3d3b256f638b9a20df784f7331e2785d', '34160cd450b1b511982f8c3f78425b43ca634877', 'png', null);
INSERT INTO ac_asset VALUES ('4', '1', '8510', '1529915500', '1', '0', 'a0fefa4df2bd9b06db1c92449b7b5a0168e9ffd3682e4c73f32bd49069b34e6c', 'syxwgd.png', 'business/20180625/d51f5f59038198e53b7101af2e167f9d.png', 'a0fefa4df2bd9b06db1c92449b7b5a01', 'da7742f3e3f4b05107fd66151f350ee96982c4e8', 'png', null);
INSERT INTO ac_asset VALUES ('5', '1', '3767', '1529915511', '1', '0', '7d4e4a22d4a53de3d2461a88acbd114d86eacb62b7de03006beb0e3170149f50', 'fc3d.png', 'business/20180625/06937117ba79dbdccf5d6b66863c2728.png', '7d4e4a22d4a53de3d2461a88acbd114d', '7725761e43480ba383bafd75d1818b58f5c95786', 'png', null);
INSERT INTO ac_asset VALUES ('6', '1', '29948', '1529915536', '1', '0', 'a4960c4dd9e75f542c4dd242fb4f965c9fe8a6eeb51338b4347d70e9252c2f84', 'pl3.png', 'business/20180625/0ff5e711ade547fc3491c676d49c63d0.png', 'a4960c4dd9e75f542c4dd242fb4f965c', '8ed044ecb9179321f008cfa3b0dee35baae9606a', 'png', null);
INSERT INTO ac_asset VALUES ('7', '1', '11749', '1529915553', '1', '0', '4b53719d7a6901b0f9441660aa0e668691284d0b3947048090bb39da94b6b329', 'xy28pc.png', 'business/20180625/929b05c6683c9ebdb759091c9ce2ab9a.png', '4b53719d7a6901b0f9441660aa0e6686', 'c60ca2228298f713f9f4f193bdb1eae139877a50', 'png', null);
INSERT INTO ac_asset VALUES ('8', '1', '26229', '1530071870', '1', '0', 'ab02daafc13fdcfba53a4ab142b812094e7d03dabbe7c3d30f43b36ffc8a85ad', 'img1.jpg', 'portal/20180627/c42255014151599fbfa3200187fdb25d.jpg', 'ab02daafc13fdcfba53a4ab142b81209', '1fee63b92bc59f7ab223adc866f7babfb233178e', 'jpg', null);
INSERT INTO ac_asset VALUES ('9', '1', '320480', '1531039998', '1', '0', 'af8d7f2c5fc34e4d7c69aa0763f9b22b8154350e3e85bbe1de98f216fa353976', 'focus01.jpg', 'admin/20180708/c45903abb1641a58afe93cba2c4ad272.jpg', 'af8d7f2c5fc34e4d7c69aa0763f9b22b', 'ed0ec30e67a72a05ad82121eca3ffdb1d30795b0', 'jpg', null);
INSERT INTO ac_asset VALUES ('10', '1', '87448', '1531040086', '1', '0', '7db3ad4c69948f03c931c126a1854f0c7eda5a184e566f1bb3d8edf19a25cc57', 'focus02.jpg', 'admin/20180708/1a6e96ea15233b9bb62dbbc02312becd.jpg', '7db3ad4c69948f03c931c126a1854f0c', 'f65a11f11ad602f41accc25bed5289d3396b6493', 'jpg', null);
INSERT INTO ac_asset VALUES ('11', '1', '17251', '1531564007', '1', '0', 'e7b188457812d17d781040ab2ca9938b4403b88e2cc87254d0fb7f89f426ef4d', '28d9f4d9e477b3c8e233bd3f384e70ef.png', 'business/20180714/ea55bbaf83461bd44a01839b0adbb52f.png', 'e7b188457812d17d781040ab2ca9938b', '8948e2056e2fbeaa26034311554ecd4a386e4fdc', 'png', null);

-- ----------------------------
-- Table structure for `ac_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `ac_auth_access`;
CREATE TABLE `ac_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of ac_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ac_auth_rule`;
CREATE TABLE `ac_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of ac_auth_rule
-- ----------------------------
INSERT INTO ac_auth_rule VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO ac_auth_rule VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO ac_auth_rule VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO ac_auth_rule VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO ac_auth_rule VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO ac_auth_rule VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO ac_auth_rule VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO ac_auth_rule VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO ac_auth_rule VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO ac_auth_rule VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO ac_auth_rule VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO ac_auth_rule VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO ac_auth_rule VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO ac_auth_rule VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO ac_auth_rule VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO ac_auth_rule VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO ac_auth_rule VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO ac_auth_rule VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO ac_auth_rule VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO ac_auth_rule VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO ac_auth_rule VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO ac_auth_rule VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO ac_auth_rule VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO ac_auth_rule VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO ac_auth_rule VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO ac_auth_rule VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO ac_auth_rule VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO ac_auth_rule VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO ac_auth_rule VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO ac_auth_rule VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO ac_auth_rule VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO ac_auth_rule VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO ac_auth_rule VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO ac_auth_rule VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO ac_auth_rule VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO ac_auth_rule VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO ac_auth_rule VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO ac_auth_rule VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO ac_auth_rule VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO ac_auth_rule VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', '');
INSERT INTO ac_auth_rule VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO ac_auth_rule VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO ac_auth_rule VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO ac_auth_rule VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO ac_auth_rule VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO ac_auth_rule VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO ac_auth_rule VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO ac_auth_rule VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO ac_auth_rule VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO ac_auth_rule VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO ac_auth_rule VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO ac_auth_rule VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO ac_auth_rule VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO ac_auth_rule VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO ac_auth_rule VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO ac_auth_rule VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO ac_auth_rule VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO ac_auth_rule VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO ac_auth_rule VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO ac_auth_rule VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO ac_auth_rule VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO ac_auth_rule VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO ac_auth_rule VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO ac_auth_rule VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO ac_auth_rule VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO ac_auth_rule VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO ac_auth_rule VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO ac_auth_rule VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO ac_auth_rule VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO ac_auth_rule VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO ac_auth_rule VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO ac_auth_rule VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO ac_auth_rule VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO ac_auth_rule VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO ac_auth_rule VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO ac_auth_rule VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO ac_auth_rule VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO ac_auth_rule VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO ac_auth_rule VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO ac_auth_rule VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO ac_auth_rule VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO ac_auth_rule VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO ac_auth_rule VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO ac_auth_rule VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO ac_auth_rule VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO ac_auth_rule VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO ac_auth_rule VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO ac_auth_rule VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO ac_auth_rule VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO ac_auth_rule VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO ac_auth_rule VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO ac_auth_rule VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO ac_auth_rule VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO ac_auth_rule VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO ac_auth_rule VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO ac_auth_rule VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO ac_auth_rule VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO ac_auth_rule VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO ac_auth_rule VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO ac_auth_rule VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO ac_auth_rule VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO ac_auth_rule VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO ac_auth_rule VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO ac_auth_rule VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO ac_auth_rule VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO ac_auth_rule VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO ac_auth_rule VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO ac_auth_rule VALUES ('108', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO ac_auth_rule VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO ac_auth_rule VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO ac_auth_rule VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO ac_auth_rule VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO ac_auth_rule VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO ac_auth_rule VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO ac_auth_rule VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO ac_auth_rule VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO ac_auth_rule VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO ac_auth_rule VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO ac_auth_rule VALUES ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO ac_auth_rule VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO ac_auth_rule VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO ac_auth_rule VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO ac_auth_rule VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO ac_auth_rule VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO ac_auth_rule VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO ac_auth_rule VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO ac_auth_rule VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO ac_auth_rule VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO ac_auth_rule VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO ac_auth_rule VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO ac_auth_rule VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO ac_auth_rule VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO ac_auth_rule VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO ac_auth_rule VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO ac_auth_rule VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO ac_auth_rule VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO ac_auth_rule VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO ac_auth_rule VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO ac_auth_rule VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO ac_auth_rule VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO ac_auth_rule VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO ac_auth_rule VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO ac_auth_rule VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO ac_auth_rule VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO ac_auth_rule VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO ac_auth_rule VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO ac_auth_rule VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO ac_auth_rule VALUES ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO ac_auth_rule VALUES ('149', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO ac_auth_rule VALUES ('150', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO ac_auth_rule VALUES ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO ac_auth_rule VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO ac_auth_rule VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO ac_auth_rule VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO ac_auth_rule VALUES ('155', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO ac_auth_rule VALUES ('156', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO ac_auth_rule VALUES ('157', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO ac_auth_rule VALUES ('158', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO ac_auth_rule VALUES ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO ac_auth_rule VALUES ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO ac_auth_rule VALUES ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO ac_auth_rule VALUES ('162', '1', 'business', 'admin_url', 'business/AdminIndex/default', '', '业务管理', '');
INSERT INTO ac_auth_rule VALUES ('163', '1', 'business', 'admin_url', 'business/AdminType/index', '', '彩种管理', '');
INSERT INTO ac_auth_rule VALUES ('164', '1', 'business', 'admin_url', 'business/AdminData/index', '', '开奖管理', '');
INSERT INTO ac_auth_rule VALUES ('165', '1', 'business', 'admin_url', 'business/AdminPlan/index', '', '计划管理', '');
INSERT INTO ac_auth_rule VALUES ('166', '1', 'business', 'admin_url', 'business/AdminTime/index', '', '时间管理', '');

-- ----------------------------
-- Table structure for `ac_comment`
-- ----------------------------
DROP TABLE IF EXISTS `ac_comment`;
CREATE TABLE `ac_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of ac_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_data_fc3d`
-- ----------------------------
DROP TABLE IF EXISTS `ac_data_fc3d`;
CREATE TABLE `ac_data_fc3d` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15286 DEFAULT CHARSET=utf8 COMMENT='开奖数据';

-- ----------------------------
-- Records of ac_data_fc3d
-- ----------------------------
INSERT INTO ac_data_fc3d VALUES ('1', '1527133295', '2018136', '6,4,3');
INSERT INTO ac_data_fc3d VALUES ('19', '1527167857', '2018137', '5,3,7');
INSERT INTO ac_data_fc3d VALUES ('695', '1527254420', '2018138', '0,6,8');
INSERT INTO ac_data_fc3d VALUES ('1031', '1527340593', '2018139', '4,4,7');
INSERT INTO ac_data_fc3d VALUES ('1637', '1527427346', '2018140', '1,3,3');
INSERT INTO ac_data_fc3d VALUES ('2294', '1527513623', '2018141', '5,3,6');
INSERT INTO ac_data_fc3d VALUES ('2940', '1527859147', '2018145', '3,8,6');
INSERT INTO ac_data_fc3d VALUES ('3440', '1527945424', '2018146', '5,6,9');
INSERT INTO ac_data_fc3d VALUES ('3909', '1528042881', '2018147', '6,3,6');
INSERT INTO ac_data_fc3d VALUES ('3910', '1529827658', '2018167', '4,8,9');
INSERT INTO ac_data_fc3d VALUES ('3915', '1529846198', '2018168', '1,7,4');
INSERT INTO ac_data_fc3d VALUES ('4464', '1529932544', '2018169', '5,3,0');
INSERT INTO ac_data_fc3d VALUES ('5131', '1530019053', '2018170', '1,1,7');
INSERT INTO ac_data_fc3d VALUES ('5768', '1530364455', '2018174', '8,8,6');
INSERT INTO ac_data_fc3d VALUES ('5769', '1530783403', '2018178', '3,3,6');
INSERT INTO ac_data_fc3d VALUES ('5771', '1530796877', '2018179', '7,2,4');
INSERT INTO ac_data_fc3d VALUES ('6366', '1530883330', '2018180', '7,6,1');
INSERT INTO ac_data_fc3d VALUES ('6978', '1530969494', '2018181', '4,9,8');
INSERT INTO ac_data_fc3d VALUES ('7963', '1531056126', '2018182', '3,2,9');
INSERT INTO ac_data_fc3d VALUES ('9128', '1531142472', '2018183', '3,5,9');
INSERT INTO ac_data_fc3d VALUES ('10341', '1531228948', '2018184', '4,7,3');
INSERT INTO ac_data_fc3d VALUES ('11531', '1531315271', '2018185', '5,7,0');
INSERT INTO ac_data_fc3d VALUES ('11622', '1531401674', '2018186', '1,4,1');
INSERT INTO ac_data_fc3d VALUES ('12851', '1531488088', '2018187', '8,0,7');
INSERT INTO ac_data_fc3d VALUES ('14088', '1531574286', '2018188', '0,4,8');
INSERT INTO ac_data_fc3d VALUES ('15285', '1531884797', '2018191', '5,0,3');

-- ----------------------------
-- Table structure for `ac_data_lhc`
-- ----------------------------
DROP TABLE IF EXISTS `ac_data_lhc`;
CREATE TABLE `ac_data_lhc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4861 DEFAULT CHARSET=utf8 COMMENT='开奖数据';

-- ----------------------------
-- Records of ac_data_lhc
-- ----------------------------
INSERT INTO ac_data_lhc VALUES ('1', '1531312425', '2018076', '08,49,06,41,29,38,02');
INSERT INTO ac_data_lhc VALUES ('1327', '1531402148', '2018077', '05,08,01,07,30,33,22');
INSERT INTO ac_data_lhc VALUES ('3941', '1531575402', '2018078', '33,13,07,36,22,27,45');
INSERT INTO ac_data_lhc VALUES ('4860', '1531884797', '2018079', '41,06,36,48,10,32,47');

-- ----------------------------
-- Table structure for `ac_data_pk10bj`
-- ----------------------------
DROP TABLE IF EXISTS `ac_data_pk10bj`;
CREATE TABLE `ac_data_pk10bj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83879 DEFAULT CHARSET=utf8 COMMENT='开奖数据';

-- ----------------------------
-- Records of ac_data_pk10bj
-- ----------------------------
INSERT INTO ac_data_pk10bj VALUES ('1', '1527133294', '683599', '03,10,07,02,04,08,05,09,01,06');
INSERT INTO ac_data_pk10bj VALUES ('16', '1527133523', '683600', '02,05,09,01,03,10,07,08,04,06');
INSERT INTO ac_data_pk10bj VALUES ('36', '1527133822', '683601', '07,04,09,10,03,05,01,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('56', '1527134126', '683602', '06,07,03,08,09,10,01,04,02,05');
INSERT INTO ac_data_pk10bj VALUES ('75', '1527134415', '683603', '03,10,02,07,06,01,04,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('95', '1527134718', '683604', '03,05,04,06,07,01,10,09,08,02');
INSERT INTO ac_data_pk10bj VALUES ('115', '1527135026', '683605', '09,07,02,05,06,08,10,04,03,01');
INSERT INTO ac_data_pk10bj VALUES ('135', '1527135324', '683606', '07,04,09,01,06,08,10,02,03,05');
INSERT INTO ac_data_pk10bj VALUES ('151', '1527135626', '683607', '07,04,05,03,10,08,02,09,06,01');
INSERT INTO ac_data_pk10bj VALUES ('170', '1527135915', '683608', '05,07,06,10,01,03,04,09,02,08');
INSERT INTO ac_data_pk10bj VALUES ('186', '1527136223', '683609', '04,05,07,09,10,08,02,03,06,01');
INSERT INTO ac_data_pk10bj VALUES ('206', '1527136520', '683610', '04,02,05,09,03,08,07,10,01,06');
INSERT INTO ac_data_pk10bj VALUES ('225', '1527136822', '683611', '03,08,09,05,10,02,04,01,07,06');
INSERT INTO ac_data_pk10bj VALUES ('241', '1527137132', '683612', '10,07,09,01,05,08,04,02,06,03');
INSERT INTO ac_data_pk10bj VALUES ('260', '1527137422', '683613', '05,01,09,08,06,07,03,02,10,04');
INSERT INTO ac_data_pk10bj VALUES ('280', '1527137726', '683614', '02,09,01,07,05,08,04,03,10,06');
INSERT INTO ac_data_pk10bj VALUES ('291', '1527139511', '683620', '07,10,09,06,01,03,05,04,02,08');
INSERT INTO ac_data_pk10bj VALUES ('311', '1527139822', '683621', '05,10,01,08,09,03,02,04,06,07');
INSERT INTO ac_data_pk10bj VALUES ('331', '1527140125', '683622', '10,07,06,05,03,01,02,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('351', '1527140428', '683623', '10,02,03,06,08,01,05,04,07,09');
INSERT INTO ac_data_pk10bj VALUES ('370', '1527140716', '683624', '01,09,05,10,08,02,07,06,03,04');
INSERT INTO ac_data_pk10bj VALUES ('391', '1527141027', '683625', '04,08,02,06,01,10,03,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('410', '1527141315', '683626', '04,07,05,10,09,08,01,06,02,03');
INSERT INTO ac_data_pk10bj VALUES ('430', '1527141618', '683627', '03,09,05,02,04,01,07,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('450', '1527141921', '683628', '02,01,07,05,03,08,04,06,09,10');
INSERT INTO ac_data_pk10bj VALUES ('469', '1527142209', '683629', '04,01,03,07,10,09,02,08,06,05');
INSERT INTO ac_data_pk10bj VALUES ('489', '1527142513', '683630', '03,04,01,08,09,02,10,06,05,07');
INSERT INTO ac_data_pk10bj VALUES ('509', '1527142853', '683631', '04,07,08,10,01,03,02,09,06,05');
INSERT INTO ac_data_pk10bj VALUES ('522', '1527143126', '683632', '05,01,09,08,03,04,02,07,10,06');
INSERT INTO ac_data_pk10bj VALUES ('541', '1527143422', '683633', '05,09,07,06,02,10,01,04,03,08');
INSERT INTO ac_data_pk10bj VALUES ('561', '1527143727', '683634', '05,08,07,06,03,10,04,01,09,02');
INSERT INTO ac_data_pk10bj VALUES ('581', '1527144030', '683635', '03,07,04,09,10,01,02,08,06,05');
INSERT INTO ac_data_pk10bj VALUES ('600', '1527144358', '683636', '02,04,10,09,06,07,05,08,03,01');
INSERT INTO ac_data_pk10bj VALUES ('612', '1527144619', '683637', '03,07,01,06,02,05,10,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('628', '1527144929', '683638', '01,06,02,05,04,03,08,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('647', '1527145225', '683639', '08,02,05,06,09,03,07,10,04,01');
INSERT INTO ac_data_pk10bj VALUES ('667', '1527145515', '683640', '05,04,10,07,08,09,02,01,03,06');
INSERT INTO ac_data_pk10bj VALUES ('687', '1527145820', '683641', '06,04,08,01,05,02,09,07,03,10');
INSERT INTO ac_data_pk10bj VALUES ('700', '1527146120', '683642', '03,01,02,07,05,09,04,06,08,10');
INSERT INTO ac_data_pk10bj VALUES ('720', '1527146424', '683643', '02,08,03,05,09,10,06,04,01,07');
INSERT INTO ac_data_pk10bj VALUES ('740', '1527146713', '683644', '03,01,10,05,08,06,07,09,02,04');
INSERT INTO ac_data_pk10bj VALUES ('760', '1527147022', '683645', '09,04,02,07,01,03,06,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('780', '1527147325', '683646', '08,10,07,01,04,09,06,05,02,03');
INSERT INTO ac_data_pk10bj VALUES ('799', '1527147615', '683647', '01,07,03,10,05,09,02,04,08,06');
INSERT INTO ac_data_pk10bj VALUES ('819', '1527147918', '683648', '04,08,07,10,06,01,02,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('839', '1527148214', '683649', '08,03,09,01,10,07,05,04,02,06');
INSERT INTO ac_data_pk10bj VALUES ('859', '1527148517', '683650', '10,03,04,05,07,02,09,06,08,01');
INSERT INTO ac_data_pk10bj VALUES ('878', '1527148814', '683651', '01,05,04,06,09,03,08,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('897', '1527149114', '683652', '05,07,10,06,02,03,04,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('914', '1527149425', '683653', '05,04,03,01,07,02,10,08,06,09');
INSERT INTO ac_data_pk10bj VALUES ('934', '1527149715', '683654', '01,05,10,06,09,02,07,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('954', '1527150019', '683655', '07,05,03,01,10,08,09,04,06,02');
INSERT INTO ac_data_pk10bj VALUES ('974', '1527150322', '683656', '02,10,06,07,03,01,05,09,08,04');
INSERT INTO ac_data_pk10bj VALUES ('994', '1527150625', '683657', '07,08,01,06,05,04,03,09,02,10');
INSERT INTO ac_data_pk10bj VALUES ('1014', '1527150928', '683658', '09,03,08,05,10,06,02,04,07,01');
INSERT INTO ac_data_pk10bj VALUES ('1033', '1527151216', '683659', '02,10,03,08,07,05,09,06,01,04');
INSERT INTO ac_data_pk10bj VALUES ('1053', '1527151519', '683660', '01,05,06,04,02,10,03,08,09,07');
INSERT INTO ac_data_pk10bj VALUES ('1073', '1527151822', '683661', '01,06,09,02,07,08,05,10,03,04');
INSERT INTO ac_data_pk10bj VALUES ('1093', '1527152124', '683662', '10,01,02,05,03,07,08,06,09,04');
INSERT INTO ac_data_pk10bj VALUES ('1112', '1527152414', '683663', '10,06,09,04,07,02,03,01,05,08');
INSERT INTO ac_data_pk10bj VALUES ('1132', '1527152717', '683664', '06,04,10,02,09,01,07,05,08,03');
INSERT INTO ac_data_pk10bj VALUES ('1152', '1527153020', '683665', '05,04,02,01,06,08,10,03,07,09');
INSERT INTO ac_data_pk10bj VALUES ('1172', '1527153323', '683666', '03,05,06,02,07,04,09,01,10,08');
INSERT INTO ac_data_pk10bj VALUES ('1192', '1527153626', '683667', '08,04,07,06,10,02,03,01,05,09');
INSERT INTO ac_data_pk10bj VALUES ('1212', '1527153915', '683668', '05,09,03,10,07,08,01,06,04,02');
INSERT INTO ac_data_pk10bj VALUES ('1232', '1527154218', '683669', '08,04,02,05,09,01,10,06,07,03');
INSERT INTO ac_data_pk10bj VALUES ('1252', '1527154525', '683670', '04,07,05,02,03,08,01,09,10,06');
INSERT INTO ac_data_pk10bj VALUES ('1272', '1527154828', '683671', '01,08,05,09,04,06,02,07,10,03');
INSERT INTO ac_data_pk10bj VALUES ('1291', '1527155118', '683672', '06,09,02,03,01,07,04,08,10,05');
INSERT INTO ac_data_pk10bj VALUES ('1311', '1527155416', '683673', '05,09,01,08,04,03,06,02,07,10');
INSERT INTO ac_data_pk10bj VALUES ('1331', '1527155720', '683674', '08,10,01,03,07,09,02,05,04,06');
INSERT INTO ac_data_pk10bj VALUES ('1351', '1527156023', '683675', '03,02,05,04,10,07,06,01,08,09');
INSERT INTO ac_data_pk10bj VALUES ('1371', '1527156326', '683676', '02,04,01,07,05,08,06,03,10,09');
INSERT INTO ac_data_pk10bj VALUES ('1390', '1527156613', '683677', '06,01,09,03,05,08,04,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('1410', '1527156917', '683678', '06,01,02,04,10,07,03,08,05,09');
INSERT INTO ac_data_pk10bj VALUES ('1430', '1527157220', '683679', '06,02,05,04,10,09,08,07,01,03');
INSERT INTO ac_data_pk10bj VALUES ('1450', '1527157525', '683680', '06,01,10,04,09,03,02,08,05,07');
INSERT INTO ac_data_pk10bj VALUES ('1470', '1527157829', '683681', '04,06,08,05,09,10,03,01,07,02');
INSERT INTO ac_data_pk10bj VALUES ('1489', '1527158119', '683682', '02,10,06,09,05,03,04,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('1509', '1527158421', '683683', '05,07,10,08,03,02,06,01,09,04');
INSERT INTO ac_data_pk10bj VALUES ('1528', '1527158711', '683684', '02,07,09,04,08,03,01,05,10,06');
INSERT INTO ac_data_pk10bj VALUES ('1548', '1527159014', '683685', '04,07,08,06,02,09,10,05,01,03');
INSERT INTO ac_data_pk10bj VALUES ('1568', '1527159318', '683686', '06,05,04,03,09,08,01,10,07,02');
INSERT INTO ac_data_pk10bj VALUES ('1588', '1527159623', '683687', '07,05,02,03,09,04,01,06,08,10');
INSERT INTO ac_data_pk10bj VALUES ('1608', '1527159921', '683688', '06,03,10,04,01,05,09,08,07,02');
INSERT INTO ac_data_pk10bj VALUES ('1628', '1527160224', '683689', '03,06,04,02,10,09,08,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('1648', '1527160527', '683690', '02,10,07,04,09,01,08,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('1667', '1527160817', '683691', '08,03,01,05,10,07,02,09,06,04');
INSERT INTO ac_data_pk10bj VALUES ('1687', '1527161117', '683692', '03,05,04,10,06,08,07,09,02,01');
INSERT INTO ac_data_pk10bj VALUES ('1707', '1527161421', '683693', '05,01,02,08,06,03,10,07,04,09');
INSERT INTO ac_data_pk10bj VALUES ('1727', '1527161725', '683694', '05,04,02,07,09,01,06,10,08,03');
INSERT INTO ac_data_pk10bj VALUES ('1746', '1527162024', '683695', '02,06,05,10,03,08,04,09,01,07');
INSERT INTO ac_data_pk10bj VALUES ('1765', '1527162314', '683696', '03,06,04,09,02,10,08,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('1785', '1527162618', '683697', '09,07,03,04,05,02,01,08,06,10');
INSERT INTO ac_data_pk10bj VALUES ('1805', '1527162922', '683698', '03,05,09,07,06,04,08,01,02,10');
INSERT INTO ac_data_pk10bj VALUES ('1825', '1527163224', '683699', '05,02,06,04,03,01,08,07,09,10');
INSERT INTO ac_data_pk10bj VALUES ('1844', '1527163516', '683700', '05,01,06,04,07,02,08,03,10,09');
INSERT INTO ac_data_pk10bj VALUES ('1864', '1527163822', '683701', '06,07,04,05,01,03,02,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('1884', '1527164119', '683702', '05,08,01,03,02,09,07,04,10,06');
INSERT INTO ac_data_pk10bj VALUES ('1903', '1527164417', '683703', '10,08,05,09,07,01,06,03,04,02');
INSERT INTO ac_data_pk10bj VALUES ('1923', '1527164720', '683704', '04,08,06,05,09,03,02,07,01,10');
INSERT INTO ac_data_pk10bj VALUES ('1942', '1527165013', '683705', '08,05,03,04,07,09,10,02,01,06');
INSERT INTO ac_data_pk10bj VALUES ('1962', '1527165318', '683706', '07,10,04,05,08,09,02,03,06,01');
INSERT INTO ac_data_pk10bj VALUES ('1982', '1527165622', '683707', '01,06,08,05,04,09,10,03,02,07');
INSERT INTO ac_data_pk10bj VALUES ('2001', '1527165911', '683708', '08,06,03,02,10,09,05,01,04,07');
INSERT INTO ac_data_pk10bj VALUES ('2021', '1527166215', '683709', '04,05,06,08,02,09,10,07,01,03');
INSERT INTO ac_data_pk10bj VALUES ('2041', '1527166524', '683710', '09,07,08,03,05,10,04,02,01,06');
INSERT INTO ac_data_pk10bj VALUES ('2060', '1527166813', '683711', '03,04,07,10,06,01,02,05,08,09');
INSERT INTO ac_data_pk10bj VALUES ('2081', '1527167122', '683712', '09,06,10,01,04,03,05,08,07,02');
INSERT INTO ac_data_pk10bj VALUES ('2101', '1527167425', '683713', '10,09,05,07,01,02,06,04,08,03');
INSERT INTO ac_data_pk10bj VALUES ('2121', '1527167727', '683714', '10,07,04,05,06,09,02,03,08,01');
INSERT INTO ac_data_pk10bj VALUES ('2140', '1527168015', '683715', '05,07,04,06,01,09,03,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('2161', '1527168319', '683716', '06,01,05,10,08,04,07,09,03,02');
INSERT INTO ac_data_pk10bj VALUES ('2181', '1527168624', '683717', '03,07,05,09,01,02,06,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('2200', '1527168911', '683718', '02,10,08,01,06,07,05,09,04,03');
INSERT INTO ac_data_pk10bj VALUES ('2220', '1527169218', '683719', '09,08,10,07,03,06,05,04,02,01');
INSERT INTO ac_data_pk10bj VALUES ('2240', '1527169520', '683720', '10,04,03,06,01,02,07,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('2260', '1527169821', '683721', '01,08,02,07,05,04,10,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('2280', '1527170124', '683722', '01,04,08,09,10,06,02,03,05,07');
INSERT INTO ac_data_pk10bj VALUES ('2299', '1527170414', '683723', '05,09,08,06,03,10,04,07,01,02');
INSERT INTO ac_data_pk10bj VALUES ('2319', '1527170717', '683724', '04,01,02,07,05,06,03,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('2339', '1527171020', '683725', '03,08,06,09,02,10,01,05,04,07');
INSERT INTO ac_data_pk10bj VALUES ('2359', '1527171321', '683726', '07,08,01,05,02,09,04,10,03,06');
INSERT INTO ac_data_pk10bj VALUES ('2379', '1527171624', '683727', '01,10,04,02,05,03,06,08,07,09');
INSERT INTO ac_data_pk10bj VALUES ('2398', '1527171911', '683728', '04,07,05,02,03,08,10,06,01,09');
INSERT INTO ac_data_pk10bj VALUES ('2417', '1527172209', '683729', '10,07,03,04,01,08,06,09,05,02');
INSERT INTO ac_data_pk10bj VALUES ('2437', '1527172512', '683730', '04,07,06,10,08,02,01,03,05,09');
INSERT INTO ac_data_pk10bj VALUES ('2457', '1527172811', '683731', '07,06,08,09,04,03,10,05,01,02');
INSERT INTO ac_data_pk10bj VALUES ('2477', '1527173115', '683732', '09,04,01,06,05,02,03,07,08,10');
INSERT INTO ac_data_pk10bj VALUES ('2497', '1527173418', '683733', '08,07,06,05,10,01,03,09,04,02');
INSERT INTO ac_data_pk10bj VALUES ('2517', '1527173722', '683734', '09,08,01,05,02,04,03,07,10,06');
INSERT INTO ac_data_pk10bj VALUES ('2536', '1527174010', '683735', '06,05,09,08,02,04,03,01,07,10');
INSERT INTO ac_data_pk10bj VALUES ('2557', '1527174323', '683736', '06,04,09,03,08,02,07,01,10,05');
INSERT INTO ac_data_pk10bj VALUES ('2631', '1527175451', '683737', '09,05,03,04,02,01,08,07,06,10');
INSERT INTO ac_data_pk10bj VALUES ('2663', '1527175933', '683738', '02,05,10,04,01,03,09,06,07,08');
INSERT INTO ac_data_pk10bj VALUES ('2706', '1527176586', '683739', '01,02,06,03,07,05,08,04,09,10');
INSERT INTO ac_data_pk10bj VALUES ('2714', '1527176709', '683744', '08,04,07,03,09,01,06,05,10,02');
INSERT INTO ac_data_pk10bj VALUES ('2735', '1527177024', '683745', '04,01,06,02,05,03,10,09,08,07');
INSERT INTO ac_data_pk10bj VALUES ('2755', '1527177327', '683746', '07,06,09,08,02,05,01,04,10,03');
INSERT INTO ac_data_pk10bj VALUES ('2798', '1527210310', '683747', '01,08,04,06,02,05,09,10,07,03');
INSERT INTO ac_data_pk10bj VALUES ('2818', '1527210615', '683748', '08,07,02,05,04,09,01,03,10,06');
INSERT INTO ac_data_pk10bj VALUES ('2837', '1527210912', '683749', '06,04,10,02,09,05,01,08,07,03');
INSERT INTO ac_data_pk10bj VALUES ('2856', '1527211211', '683750', '05,10,01,06,09,03,07,08,04,02');
INSERT INTO ac_data_pk10bj VALUES ('2876', '1527211514', '683751', '10,09,06,02,03,01,05,08,04,07');
INSERT INTO ac_data_pk10bj VALUES ('2897', '1527211819', '683752', '06,02,08,04,05,01,09,07,10,03');
INSERT INTO ac_data_pk10bj VALUES ('2917', '1527212122', '683753', '08,07,04,02,10,01,05,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('2936', '1527212411', '683754', '03,01,10,06,09,08,05,02,04,07');
INSERT INTO ac_data_pk10bj VALUES ('2956', '1527212716', '683755', '09,07,02,04,06,01,08,05,10,03');
INSERT INTO ac_data_pk10bj VALUES ('2976', '1527213016', '683756', '04,02,06,08,07,05,03,09,10,01');
INSERT INTO ac_data_pk10bj VALUES ('2996', '1527213322', '683757', '05,07,08,03,06,10,09,01,04,02');
INSERT INTO ac_data_pk10bj VALUES ('3015', '1527213610', '683758', '08,07,04,06,09,01,03,02,05,10');
INSERT INTO ac_data_pk10bj VALUES ('3035', '1527213916', '683759', '02,08,09,04,10,07,06,05,03,01');
INSERT INTO ac_data_pk10bj VALUES ('3055', '1527214219', '683760', '05,07,09,08,10,01,06,03,02,04');
INSERT INTO ac_data_pk10bj VALUES ('3072', '1527215235', '683763', '05,07,01,06,04,10,02,09,03,08');
INSERT INTO ac_data_pk10bj VALUES ('3084', '1527215417', '683764', '01,09,07,10,02,05,08,03,04,06');
INSERT INTO ac_data_pk10bj VALUES ('3104', '1527215723', '683765', '03,07,05,09,01,08,02,06,10,04');
INSERT INTO ac_data_pk10bj VALUES ('3124', '1527216021', '683766', '04,07,03,02,05,01,06,08,09,10');
INSERT INTO ac_data_pk10bj VALUES ('3143', '1527216313', '683767', '05,10,03,07,08,09,01,06,02,04');
INSERT INTO ac_data_pk10bj VALUES ('3163', '1527216621', '683768', '07,04,10,09,03,01,05,08,02,06');
INSERT INTO ac_data_pk10bj VALUES ('3183', '1527216924', '683769', '05,09,03,01,10,04,07,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('3202', '1527217212', '683770', '08,01,10,03,05,09,04,07,02,06');
INSERT INTO ac_data_pk10bj VALUES ('3223', '1527217519', '683771', '02,03,05,08,06,09,10,01,07,04');
INSERT INTO ac_data_pk10bj VALUES ('3242', '1527217808', '683772', '06,03,02,07,09,05,10,08,01,04');
INSERT INTO ac_data_pk10bj VALUES ('3263', '1527218126', '683773', '04,07,08,10,05,03,09,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('3282', '1527218416', '683774', '02,10,06,07,09,01,05,03,08,04');
INSERT INTO ac_data_pk10bj VALUES ('3301', '1527218715', '683775', '05,01,10,06,04,03,09,02,08,07');
INSERT INTO ac_data_pk10bj VALUES ('3322', '1527219021', '683776', '08,01,10,04,02,07,03,09,06,05');
INSERT INTO ac_data_pk10bj VALUES ('3341', '1527219309', '683777', '03,08,09,10,05,02,04,06,07,01');
INSERT INTO ac_data_pk10bj VALUES ('3361', '1527219613', '683778', '08,02,04,01,10,05,06,03,07,09');
INSERT INTO ac_data_pk10bj VALUES ('3381', '1527219916', '683779', '02,07,05,01,08,06,03,09,04,10');
INSERT INTO ac_data_pk10bj VALUES ('3401', '1527220218', '683780', '01,09,10,06,05,08,03,04,02,07');
INSERT INTO ac_data_pk10bj VALUES ('3421', '1527220523', '683781', '05,06,08,01,03,04,02,07,10,09');
INSERT INTO ac_data_pk10bj VALUES ('3441', '1527220827', '683782', '10,08,02,03,05,09,06,01,04,07');
INSERT INTO ac_data_pk10bj VALUES ('3460', '1527221114', '683783', '02,01,04,05,07,03,08,10,06,09');
INSERT INTO ac_data_pk10bj VALUES ('3480', '1527221418', '683784', '05,01,02,08,03,04,06,10,09,07');
INSERT INTO ac_data_pk10bj VALUES ('3500', '1527221719', '683785', '03,02,05,08,10,01,04,09,07,06');
INSERT INTO ac_data_pk10bj VALUES ('3520', '1527222024', '683786', '01,07,08,05,02,06,09,04,10,03');
INSERT INTO ac_data_pk10bj VALUES ('3539', '1527222312', '683787', '03,01,08,10,09,07,04,06,02,05');
INSERT INTO ac_data_pk10bj VALUES ('3559', '1527222616', '683788', '04,10,08,02,09,01,05,06,07,03');
INSERT INTO ac_data_pk10bj VALUES ('3579', '1527222919', '683789', '10,08,06,03,04,05,07,09,01,02');
INSERT INTO ac_data_pk10bj VALUES ('3599', '1527223221', '683790', '09,08,05,04,07,01,02,03,06,10');
INSERT INTO ac_data_pk10bj VALUES ('3618', '1527223514', '683791', '03,09,01,10,06,07,02,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('3638', '1527223817', '683792', '06,10,09,02,07,01,05,03,04,08');
INSERT INTO ac_data_pk10bj VALUES ('3658', '1527224121', '683793', '01,04,06,03,08,02,09,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('3677', '1527224410', '683794', '04,09,03,10,06,05,08,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('3698', '1527224721', '683795', '02,04,03,10,01,08,06,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('3717', '1527225014', '683796', '08,05,03,02,01,06,04,07,09,10');
INSERT INTO ac_data_pk10bj VALUES ('3737', '1527225318', '683797', '08,10,09,06,01,07,02,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('3756', '1527225610', '683798', '09,05,08,01,03,04,02,10,07,06');
INSERT INTO ac_data_pk10bj VALUES ('3776', '1527225913', '683799', '03,08,09,10,05,02,06,04,07,01');
INSERT INTO ac_data_pk10bj VALUES ('3797', '1527226222', '683800', '02,07,03,06,04,05,10,01,08,09');
INSERT INTO ac_data_pk10bj VALUES ('3816', '1527226510', '683801', '01,09,04,07,08,10,06,02,03,05');
INSERT INTO ac_data_pk10bj VALUES ('3836', '1527226818', '683802', '02,03,07,08,05,10,04,06,01,09');
INSERT INTO ac_data_pk10bj VALUES ('3856', '1527227121', '683803', '05,04,08,06,02,10,01,03,07,09');
INSERT INTO ac_data_pk10bj VALUES ('3876', '1527227420', '683804', '05,09,04,02,03,07,10,06,01,08');
INSERT INTO ac_data_pk10bj VALUES ('3896', '1527227723', '683805', '02,06,09,10,04,01,03,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('3916', '1527228026', '683806', '10,04,02,05,08,03,01,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('3935', '1527228314', '683807', '10,04,03,09,06,05,01,08,02,07');
INSERT INTO ac_data_pk10bj VALUES ('3955', '1527228617', '683808', '05,07,08,09,03,02,10,01,04,06');
INSERT INTO ac_data_pk10bj VALUES ('3975', '1527228921', '683809', '01,05,10,04,07,06,08,03,09,02');
INSERT INTO ac_data_pk10bj VALUES ('3994', '1527229214', '683810', '05,09,07,02,03,01,06,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('4014', '1527229517', '683811', '02,05,04,07,01,09,03,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('4034', '1527229821', '683812', '06,07,08,01,09,05,02,04,10,03');
INSERT INTO ac_data_pk10bj VALUES ('4054', '1527230126', '683813', '03,02,09,01,06,10,07,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('4074', '1527230422', '683814', '08,01,02,03,07,06,05,04,09,10');
INSERT INTO ac_data_pk10bj VALUES ('4094', '1527230726', '683815', '03,05,10,01,09,07,06,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('4113', '1527231018', '683816', '06,03,08,07,10,01,05,02,04,09');
INSERT INTO ac_data_pk10bj VALUES ('4133', '1527231322', '683817', '07,03,01,02,08,10,09,04,05,06');
INSERT INTO ac_data_pk10bj VALUES ('4152', '1527231610', '683818', '09,01,08,06,10,07,03,02,05,04');
INSERT INTO ac_data_pk10bj VALUES ('4173', '1527231923', '683819', '01,05,08,07,06,09,10,02,04,03');
INSERT INTO ac_data_pk10bj VALUES ('4193', '1527232226', '683820', '05,08,03,01,07,09,06,02,10,04');
INSERT INTO ac_data_pk10bj VALUES ('4212', '1527232523', '683821', '09,05,08,06,04,01,07,02,03,10');
INSERT INTO ac_data_pk10bj VALUES ('4231', '1527232811', '683822', '02,07,01,09,04,10,08,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('4251', '1527233114', '683823', '05,03,02,10,08,09,04,07,01,06');
INSERT INTO ac_data_pk10bj VALUES ('4271', '1527233417', '683824', '07,01,08,10,03,06,02,09,05,04');
INSERT INTO ac_data_pk10bj VALUES ('4291', '1527233720', '683825', '10,08,04,01,05,07,03,09,06,02');
INSERT INTO ac_data_pk10bj VALUES ('4311', '1527234023', '683826', '06,02,07,05,03,10,08,04,01,09');
INSERT INTO ac_data_pk10bj VALUES ('4330', '1527234311', '683827', '06,04,08,07,01,03,02,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('4351', '1527234622', '683828', '02,09,01,08,06,07,10,04,03,05');
INSERT INTO ac_data_pk10bj VALUES ('4370', '1527234910', '683829', '05,07,03,06,02,08,10,04,01,09');
INSERT INTO ac_data_pk10bj VALUES ('4390', '1527235213', '683830', '09,06,02,10,01,04,08,07,05,03');
INSERT INTO ac_data_pk10bj VALUES ('4410', '1527235522', '683831', '08,03,05,10,07,02,01,04,09,06');
INSERT INTO ac_data_pk10bj VALUES ('4430', '1527235826', '683832', '06,01,05,03,09,02,07,08,10,04');
INSERT INTO ac_data_pk10bj VALUES ('4450', '1527236123', '683833', '02,09,04,01,08,03,05,10,06,07');
INSERT INTO ac_data_pk10bj VALUES ('4469', '1527236415', '683834', '09,05,03,10,08,01,06,07,04,02');
INSERT INTO ac_data_pk10bj VALUES ('4489', '1527236718', '683835', '03,09,04,05,06,08,07,02,01,10');
INSERT INTO ac_data_pk10bj VALUES ('4508', '1527237016', '683836', '05,03,04,07,01,06,10,02,09,08');
INSERT INTO ac_data_pk10bj VALUES ('4528', '1527237326', '683837', '07,10,08,04,03,05,02,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('4548', '1527237624', '683838', '05,01,08,03,09,02,07,04,06,10');
INSERT INTO ac_data_pk10bj VALUES ('4567', '1527237911', '683839', '03,10,05,06,04,08,02,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('4587', '1527238214', '683840', '10,01,07,02,03,08,09,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('4607', '1527238517', '683841', '02,04,08,03,10,05,01,07,06,09');
INSERT INTO ac_data_pk10bj VALUES ('4626', '1527238809', '683842', '10,02,04,06,01,05,07,09,08,03');
INSERT INTO ac_data_pk10bj VALUES ('4646', '1527239114', '683843', '02,09,05,06,03,01,04,07,10,08');
INSERT INTO ac_data_pk10bj VALUES ('4666', '1527239419', '683844', '01,03,08,09,02,07,06,10,04,05');
INSERT INTO ac_data_pk10bj VALUES ('4686', '1527239722', '683845', '05,07,06,09,02,04,10,08,03,01');
INSERT INTO ac_data_pk10bj VALUES ('4705', '1527240010', '683846', '06,08,07,10,02,03,04,01,09,05');
INSERT INTO ac_data_pk10bj VALUES ('4725', '1527240314', '683847', '03,05,01,08,04,10,07,09,06,02');
INSERT INTO ac_data_pk10bj VALUES ('4746', '1527240627', '683848', '07,10,01,02,04,08,06,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('4765', '1527240914', '683849', '08,04,06,07,01,09,02,03,10,05');
INSERT INTO ac_data_pk10bj VALUES ('4784', '1527241207', '683850', '06,04,10,02,05,03,09,01,07,08');
INSERT INTO ac_data_pk10bj VALUES ('4805', '1527241525', '683851', '01,02,05,04,03,07,06,09,10,08');
INSERT INTO ac_data_pk10bj VALUES ('4825', '1527241824', '683852', '05,08,09,01,03,04,06,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('4844', '1527242115', '683853', '01,08,07,10,03,04,05,09,02,06');
INSERT INTO ac_data_pk10bj VALUES ('4864', '1527242420', '683854', '02,08,06,04,03,05,01,09,07,10');
INSERT INTO ac_data_pk10bj VALUES ('4884', '1527242723', '683855', '05,03,02,04,06,07,01,09,08,10');
INSERT INTO ac_data_pk10bj VALUES ('4904', '1527243026', '683856', '04,01,06,02,07,09,03,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('4923', '1527243313', '683857', '07,03,06,04,01,05,09,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('4943', '1527243618', '683858', '09,06,05,07,08,03,02,10,04,01');
INSERT INTO ac_data_pk10bj VALUES ('4962', '1527243914', '683859', '02,07,04,09,10,01,06,03,08,05');
INSERT INTO ac_data_pk10bj VALUES ('4982', '1527244219', '683860', '05,03,02,04,10,08,01,06,07,09');
INSERT INTO ac_data_pk10bj VALUES ('5002', '1527244530', '683861', '05,04,02,06,10,01,09,03,08,07');
INSERT INTO ac_data_pk10bj VALUES ('5022', '1527244826', '683862', '04,08,05,10,02,09,03,01,06,07');
INSERT INTO ac_data_pk10bj VALUES ('5041', '1527245114', '683863', '05,10,08,04,02,09,06,03,07,01');
INSERT INTO ac_data_pk10bj VALUES ('5061', '1527245418', '683864', '06,08,09,04,01,03,02,10,05,07');
INSERT INTO ac_data_pk10bj VALUES ('5081', '1527245723', '683865', '01,06,04,05,03,07,10,02,09,08');
INSERT INTO ac_data_pk10bj VALUES ('5100', '1527246010', '683866', '08,02,01,05,09,07,04,06,10,03');
INSERT INTO ac_data_pk10bj VALUES ('5120', '1527246311', '683867', '05,01,10,04,02,07,06,03,09,08');
INSERT INTO ac_data_pk10bj VALUES ('5140', '1527246618', '683868', '01,05,04,06,08,03,10,09,02,07');
INSERT INTO ac_data_pk10bj VALUES ('5159', '1527246917', '683869', '04,05,01,10,03,08,07,06,09,02');
INSERT INTO ac_data_pk10bj VALUES ('5179', '1527247221', '683870', '10,06,09,01,04,07,02,08,03,05');
INSERT INTO ac_data_pk10bj VALUES ('5199', '1527247524', '683871', '05,09,10,08,04,03,06,01,02,07');
INSERT INTO ac_data_pk10bj VALUES ('5219', '1527247813', '683872', '02,03,06,05,08,10,04,07,01,09');
INSERT INTO ac_data_pk10bj VALUES ('5239', '1527248116', '683873', '01,07,05,09,03,04,06,08,02,10');
INSERT INTO ac_data_pk10bj VALUES ('5258', '1527248407', '683874', '07,02,04,05,01,10,03,08,06,09');
INSERT INTO ac_data_pk10bj VALUES ('5279', '1527248725', '683875', '01,04,07,02,06,08,03,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('5299', '1527249026', '683876', '10,08,03,06,02,09,01,05,07,04');
INSERT INTO ac_data_pk10bj VALUES ('5319', '1527249329', '683877', '07,10,05,04,01,06,09,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('5338', '1527249619', '683878', '07,10,09,08,01,03,02,04,05,06');
INSERT INTO ac_data_pk10bj VALUES ('5358', '1527249923', '683879', '01,05,03,08,10,07,04,02,09,06');
INSERT INTO ac_data_pk10bj VALUES ('5377', '1527250213', '683880', '06,07,02,10,01,03,08,05,04,09');
INSERT INTO ac_data_pk10bj VALUES ('5397', '1527250511', '683881', '04,03,02,05,08,06,09,01,07,10');
INSERT INTO ac_data_pk10bj VALUES ('5417', '1527250815', '683882', '07,09,08,10,04,02,01,03,05,06');
INSERT INTO ac_data_pk10bj VALUES ('5437', '1527251117', '683883', '08,04,06,10,03,02,01,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('5457', '1527251422', '683884', '10,07,01,05,08,06,03,09,02,04');
INSERT INTO ac_data_pk10bj VALUES ('5476', '1527251711', '683885', '05,07,08,01,10,09,04,06,02,03');
INSERT INTO ac_data_pk10bj VALUES ('5496', '1527252013', '683886', '09,04,06,01,02,03,08,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('5516', '1527252316', '683887', '06,08,04,10,03,07,09,01,05,02');
INSERT INTO ac_data_pk10bj VALUES ('5536', '1527252620', '683888', '08,01,05,03,09,06,02,07,10,04');
INSERT INTO ac_data_pk10bj VALUES ('5555', '1527252909', '683889', '09,07,10,06,05,04,01,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('5575', '1527253212', '683890', '04,08,09,06,05,03,10,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('5595', '1527253516', '683891', '10,02,01,08,05,04,07,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('5615', '1527253823', '683892', '01,05,10,08,07,06,02,04,09,03');
INSERT INTO ac_data_pk10bj VALUES ('5635', '1527254127', '683893', '02,09,07,01,10,04,03,08,06,05');
INSERT INTO ac_data_pk10bj VALUES ('5654', '1527254414', '683894', '08,05,01,04,06,03,07,10,09,02');
INSERT INTO ac_data_pk10bj VALUES ('5674', '1527254717', '683895', '03,01,10,08,05,04,02,07,09,06');
INSERT INTO ac_data_pk10bj VALUES ('5694', '1527255014', '683896', '02,10,08,03,09,04,01,06,05,07');
INSERT INTO ac_data_pk10bj VALUES ('5714', '1527255318', '683897', '10,07,01,06,02,03,04,05,08,09');
INSERT INTO ac_data_pk10bj VALUES ('5734', '1527255621', '683898', '07,08,01,04,06,03,02,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('5753', '1527255908', '683899', '06,04,09,02,07,08,10,01,03,05');
INSERT INTO ac_data_pk10bj VALUES ('5773', '1527256212', '683900', '08,06,05,07,10,04,01,03,02,09');
INSERT INTO ac_data_pk10bj VALUES ('5793', '1527256516', '683901', '04,03,09,08,07,10,06,01,05,02');
INSERT INTO ac_data_pk10bj VALUES ('5813', '1527256820', '683902', '07,10,09,01,06,02,03,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('5833', '1527257124', '683903', '06,03,02,10,07,09,01,05,04,08');
INSERT INTO ac_data_pk10bj VALUES ('5852', '1527257413', '683904', '02,01,04,10,07,09,05,08,06,03');
INSERT INTO ac_data_pk10bj VALUES ('5872', '1527257715', '683905', '04,07,05,02,03,06,09,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('5892', '1527258018', '683906', '06,08,05,01,03,04,10,07,09,02');
INSERT INTO ac_data_pk10bj VALUES ('5912', '1527258321', '683907', '07,05,03,09,10,06,08,01,02,04');
INSERT INTO ac_data_pk10bj VALUES ('5932', '1527258625', '683908', '03,02,06,01,04,09,07,10,05,08');
INSERT INTO ac_data_pk10bj VALUES ('5951', '1527258919', '683909', '07,06,03,08,05,02,01,10,09,04');
INSERT INTO ac_data_pk10bj VALUES ('5971', '1527259215', '683910', '09,02,08,05,07,04,10,03,01,06');
INSERT INTO ac_data_pk10bj VALUES ('5980', '1527300608', '683939', '06,02,04,03,07,08,01,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('6000', '1527300911', '683940', '05,01,02,04,10,07,09,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('6020', '1527301216', '683941', '02,10,01,07,08,09,03,06,05,04');
INSERT INTO ac_data_pk10bj VALUES ('6039', '1527301505', '683942', '02,08,05,01,06,04,03,10,09,07');
INSERT INTO ac_data_pk10bj VALUES ('6059', '1527301816', '683943', '09,03,07,05,01,08,10,06,02,04');
INSERT INTO ac_data_pk10bj VALUES ('6079', '1527302110', '683944', '10,09,03,07,08,06,04,01,05,02');
INSERT INTO ac_data_pk10bj VALUES ('6099', '1527302413', '683945', '02,10,09,01,04,07,03,06,08,05');
INSERT INTO ac_data_pk10bj VALUES ('6119', '1527302716', '683946', '06,08,07,05,10,09,04,01,02,03');
INSERT INTO ac_data_pk10bj VALUES ('6138', '1527303004', '683947', '09,04,08,05,03,10,07,06,01,02');
INSERT INTO ac_data_pk10bj VALUES ('6158', '1527303308', '683948', '07,03,10,08,02,04,01,06,05,09');
INSERT INTO ac_data_pk10bj VALUES ('6178', '1527303609', '683949', '06,02,09,01,07,04,03,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('6198', '1527303913', '683950', '09,03,10,01,02,05,06,04,08,07');
INSERT INTO ac_data_pk10bj VALUES ('6218', '1527304219', '683951', '06,01,04,07,03,08,09,10,05,02');
INSERT INTO ac_data_pk10bj VALUES ('6237', '1527304511', '683952', '08,10,09,03,06,07,05,01,04,02');
INSERT INTO ac_data_pk10bj VALUES ('6257', '1527304814', '683953', '10,05,01,08,02,03,06,07,09,04');
INSERT INTO ac_data_pk10bj VALUES ('6277', '1527305110', '683954', '02,08,03,06,04,05,01,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('6297', '1527305413', '683955', '07,06,02,09,04,03,05,10,08,01');
INSERT INTO ac_data_pk10bj VALUES ('6316', '1527305707', '683956', '05,02,07,01,09,04,06,10,08,03');
INSERT INTO ac_data_pk10bj VALUES ('6336', '1527306012', '683957', '08,06,04,02,03,07,01,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('6355', '1527306305', '683958', '07,03,01,10,05,08,06,04,02,09');
INSERT INTO ac_data_pk10bj VALUES ('6376', '1527306612', '683959', '06,04,10,08,05,09,03,01,07,02');
INSERT INTO ac_data_pk10bj VALUES ('6396', '1527306916', '683960', '06,09,08,10,04,03,02,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('6416', '1527307219', '683961', '09,07,10,03,05,08,01,06,04,02');
INSERT INTO ac_data_pk10bj VALUES ('6435', '1527307511', '683962', '03,04,10,09,08,02,07,06,01,05');
INSERT INTO ac_data_pk10bj VALUES ('6455', '1527307809', '683963', '02,05,06,07,09,01,08,03,04,10');
INSERT INTO ac_data_pk10bj VALUES ('6475', '1527308112', '683964', '06,05,09,07,08,04,03,10,02,01');
INSERT INTO ac_data_pk10bj VALUES ('6495', '1527308415', '683965', '06,09,10,03,05,02,04,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('6515', '1527308719', '683966', '05,10,02,04,06,01,08,07,09,03');
INSERT INTO ac_data_pk10bj VALUES ('6534', '1527309010', '683967', '09,04,05,06,02,10,07,03,01,08');
INSERT INTO ac_data_pk10bj VALUES ('6554', '1527309310', '683968', '04,09,07,10,03,06,05,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('6574', '1527309613', '683969', '02,04,06,08,03,09,01,10,07,05');
INSERT INTO ac_data_pk10bj VALUES ('6594', '1527309916', '683970', '02,04,07,10,06,09,08,05,01,03');
INSERT INTO ac_data_pk10bj VALUES ('6613', '1527310208', '683971', '02,04,10,08,07,03,06,05,09,01');
INSERT INTO ac_data_pk10bj VALUES ('6633', '1527310512', '683972', '10,08,02,03,06,04,01,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('6653', '1527310811', '683973', '07,02,09,05,01,06,04,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('6673', '1527311113', '683974', '04,06,02,05,01,09,07,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('6693', '1527311421', '683975', '06,03,04,10,08,09,05,02,07,01');
INSERT INTO ac_data_pk10bj VALUES ('6712', '1527311708', '683976', '10,01,04,03,09,05,02,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('6732', '1527312011', '683977', '09,10,05,06,07,08,02,01,04,03');
INSERT INTO ac_data_pk10bj VALUES ('6752', '1527312312', '683978', '01,07,09,10,05,04,08,03,02,06');
INSERT INTO ac_data_pk10bj VALUES ('6772', '1527312614', '683979', '08,09,05,02,07,04,03,10,01,06');
INSERT INTO ac_data_pk10bj VALUES ('6792', '1527312920', '683980', '02,07,04,06,05,01,10,09,03,08');
INSERT INTO ac_data_pk10bj VALUES ('6811', '1527313207', '683981', '05,09,07,01,06,03,04,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('6831', '1527313511', '683982', '04,01,03,10,08,09,07,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('6851', '1527313812', '683983', '06,09,07,02,03,04,05,10,08,01');
INSERT INTO ac_data_pk10bj VALUES ('6871', '1527314115', '683984', '09,04,02,06,03,07,08,01,05,10');
INSERT INTO ac_data_pk10bj VALUES ('6891', '1527314419', '683985', '10,05,08,06,07,09,02,03,04,01');
INSERT INTO ac_data_pk10bj VALUES ('6910', '1527314707', '683986', '01,09,04,02,08,03,05,06,07,10');
INSERT INTO ac_data_pk10bj VALUES ('6930', '1527315010', '683987', '05,10,03,09,01,04,06,07,02,08');
INSERT INTO ac_data_pk10bj VALUES ('6951', '1527315316', '683988', '03,06,05,09,08,01,10,04,07,02');
INSERT INTO ac_data_pk10bj VALUES ('6971', '1527315621', '683989', '03,10,01,09,02,04,07,08,06,05');
INSERT INTO ac_data_pk10bj VALUES ('6990', '1527315909', '683990', '09,10,08,07,06,03,05,04,02,01');
INSERT INTO ac_data_pk10bj VALUES ('7010', '1527316212', '683991', '04,07,10,06,02,03,05,09,08,01');
INSERT INTO ac_data_pk10bj VALUES ('7030', '1527316511', '683992', '02,07,06,03,04,05,09,01,08,10');
INSERT INTO ac_data_pk10bj VALUES ('7050', '1527316814', '683993', '08,10,02,05,06,04,03,01,07,09');
INSERT INTO ac_data_pk10bj VALUES ('7070', '1527317117', '683994', '03,08,01,06,10,07,02,09,05,04');
INSERT INTO ac_data_pk10bj VALUES ('7089', '1527317404', '683995', '03,07,05,02,04,01,08,10,09,06');
INSERT INTO ac_data_pk10bj VALUES ('7094', '1527317717', '683996', '01,08,02,03,06,05,10,04,09,07');
INSERT INTO ac_data_pk10bj VALUES ('7114', '1527318015', '683997', '01,10,09,08,02,07,05,06,03,04');
INSERT INTO ac_data_pk10bj VALUES ('7133', '1527318303', '683998', '01,02,10,03,09,04,05,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('7154', '1527318621', '683999', '03,02,05,01,09,10,08,04,07,06');
INSERT INTO ac_data_pk10bj VALUES ('7173', '1527318908', '684000', '06,01,10,04,09,08,07,05,03,02');
INSERT INTO ac_data_pk10bj VALUES ('7193', '1527319212', '684001', '06,08,01,04,10,03,05,02,07,09');
INSERT INTO ac_data_pk10bj VALUES ('7213', '1527319514', '684002', '10,02,05,04,01,03,08,07,09,06');
INSERT INTO ac_data_pk10bj VALUES ('7233', '1527319817', '684003', '05,02,09,06,01,04,08,07,03,10');
INSERT INTO ac_data_pk10bj VALUES ('7252', '1527320109', '684004', '09,10,07,04,06,05,01,02,08,03');
INSERT INTO ac_data_pk10bj VALUES ('7272', '1527320411', '684005', '04,01,10,07,05,09,06,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('7292', '1527320715', '684006', '04,10,06,01,07,03,05,08,02,09');
INSERT INTO ac_data_pk10bj VALUES ('7312', '1527321014', '684007', '02,09,05,07,10,06,08,01,04,03');
INSERT INTO ac_data_pk10bj VALUES ('7331', '1527321312', '684008', '08,01,02,06,09,04,05,03,10,07');
INSERT INTO ac_data_pk10bj VALUES ('7351', '1527321615', '684009', '08,10,05,02,07,01,04,03,06,09');
INSERT INTO ac_data_pk10bj VALUES ('7370', '1527321913', '684010', '06,08,10,02,03,05,07,09,04,01');
INSERT INTO ac_data_pk10bj VALUES ('7390', '1527322212', '684011', '05,06,01,02,07,10,04,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('7410', '1527322515', '684012', '10,02,07,06,03,01,09,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('7430', '1527322820', '684013', '03,10,04,06,05,07,09,01,02,08');
INSERT INTO ac_data_pk10bj VALUES ('7449', '1527323113', '684014', '01,06,03,10,09,05,04,02,07,08');
INSERT INTO ac_data_pk10bj VALUES ('7469', '1527323416', '684015', '02,01,08,03,07,10,09,05,06,04');
INSERT INTO ac_data_pk10bj VALUES ('7489', '1527323712', '684016', '07,04,08,10,06,02,01,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('7509', '1527324016', '684017', '02,09,03,10,01,05,07,04,06,08');
INSERT INTO ac_data_pk10bj VALUES ('7528', '1527324305', '684018', '02,05,07,01,06,10,08,03,09,04');
INSERT INTO ac_data_pk10bj VALUES ('7548', '1527324608', '684019', '01,02,03,08,05,06,10,07,04,09');
INSERT INTO ac_data_pk10bj VALUES ('7567', '1527324907', '684020', '05,07,09,04,06,02,10,01,03,08');
INSERT INTO ac_data_pk10bj VALUES ('7588', '1527325213', '684021', '10,08,03,09,01,04,07,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('7608', '1527325516', '684022', '06,01,02,05,09,03,08,10,04,07');
INSERT INTO ac_data_pk10bj VALUES ('7627', '1527325804', '684023', '02,03,09,07,06,04,08,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('7647', '1527326107', '684024', '08,01,02,05,10,03,09,07,04,06');
INSERT INTO ac_data_pk10bj VALUES ('7653', '1527332445', '684045', '06,02,08,03,10,07,09,04,05,01');
INSERT INTO ac_data_pk10bj VALUES ('7670', '1527332709', '684046', '06,07,10,01,02,09,03,08,05,04');
INSERT INTO ac_data_pk10bj VALUES ('7690', '1527333011', '684047', '10,03,09,06,08,01,05,07,04,02');
INSERT INTO ac_data_pk10bj VALUES ('7710', '1527333319', '684048', '02,05,01,06,09,04,10,03,08,07');
INSERT INTO ac_data_pk10bj VALUES ('7729', '1527333606', '684049', '01,08,10,07,05,03,04,09,06,02');
INSERT INTO ac_data_pk10bj VALUES ('7750', '1527333916', '684050', '08,01,10,09,03,04,07,06,02,05');
INSERT INTO ac_data_pk10bj VALUES ('7769', '1527334204', '684051', '10,02,08,07,03,06,01,09,04,05');
INSERT INTO ac_data_pk10bj VALUES ('7789', '1527334507', '684052', '09,08,02,04,01,06,03,10,07,05');
INSERT INTO ac_data_pk10bj VALUES ('7809', '1527334809', '684053', '07,05,10,02,08,09,01,03,06,04');
INSERT INTO ac_data_pk10bj VALUES ('7829', '1527335112', '684054', '07,10,03,05,04,06,08,02,09,01');
INSERT INTO ac_data_pk10bj VALUES ('7850', '1527335417', '684055', '08,06,05,10,02,07,09,01,03,04');
INSERT INTO ac_data_pk10bj VALUES ('7869', '1527335713', '684056', '09,03,02,07,06,01,10,04,08,05');
INSERT INTO ac_data_pk10bj VALUES ('7889', '1527336016', '684057', '04,07,02,03,01,10,08,09,06,05');
INSERT INTO ac_data_pk10bj VALUES ('7908', '1527336304', '684058', '07,04,06,08,01,03,10,02,05,09');
INSERT INTO ac_data_pk10bj VALUES ('7928', '1527336607', '684059', '06,03,07,09,05,08,02,10,01,04');
INSERT INTO ac_data_pk10bj VALUES ('7948', '1527336903', '684060', '06,10,08,05,03,07,09,04,02,01');
INSERT INTO ac_data_pk10bj VALUES ('7968', '1527337207', '684061', '07,03,01,05,08,06,10,09,02,04');
INSERT INTO ac_data_pk10bj VALUES ('7988', '1527337509', '684062', '04,03,02,08,09,05,01,10,06,07');
INSERT INTO ac_data_pk10bj VALUES ('8008', '1527337812', '684063', '06,03,09,07,10,05,04,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('8028', '1527338114', '684064', '08,10,09,01,05,04,03,02,07,06');
INSERT INTO ac_data_pk10bj VALUES ('8047', '1527338403', '684065', '02,08,07,06,04,10,03,05,01,09');
INSERT INTO ac_data_pk10bj VALUES ('8067', '1527338712', '684066', '04,08,02,10,09,03,07,05,01,06');
INSERT INTO ac_data_pk10bj VALUES ('8087', '1527339014', '684067', '06,05,09,07,02,03,01,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('8106', '1527339302', '684068', '03,01,09,08,02,06,07,10,05,04');
INSERT INTO ac_data_pk10bj VALUES ('8126', '1527339604', '684069', '05,02,03,06,07,09,04,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('8146', '1527339906', '684070', '10,09,02,01,06,08,03,04,07,05');
INSERT INTO ac_data_pk10bj VALUES ('8166', '1527340208', '684071', '06,01,10,07,04,05,02,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('8185', '1527340507', '684072', '08,02,06,05,01,09,03,10,04,07');
INSERT INTO ac_data_pk10bj VALUES ('8205', '1527340810', '684073', '07,02,04,08,05,06,01,10,03,09');
INSERT INTO ac_data_pk10bj VALUES ('8226', '1527341117', '684074', '05,01,06,02,09,08,10,07,03,04');
INSERT INTO ac_data_pk10bj VALUES ('8245', '1527341405', '684075', '04,03,08,01,10,09,02,05,06,07');
INSERT INTO ac_data_pk10bj VALUES ('8265', '1527341710', '684076', '02,07,01,04,06,09,08,05,10,03');
INSERT INTO ac_data_pk10bj VALUES ('8285', '1527342013', '684077', '03,01,10,07,02,09,05,08,06,04');
INSERT INTO ac_data_pk10bj VALUES ('8304', '1527342301', '684078', '10,09,04,08,05,03,02,07,06,01');
INSERT INTO ac_data_pk10bj VALUES ('8325', '1527342618', '684079', '06,03,02,04,10,05,08,09,07,01');
INSERT INTO ac_data_pk10bj VALUES ('8344', '1527342907', '684080', '01,03,05,02,09,04,10,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('8364', '1527343211', '684081', '06,01,03,07,05,09,02,04,08,10');
INSERT INTO ac_data_pk10bj VALUES ('8384', '1527343517', '684082', '06,10,09,04,02,05,07,01,03,08');
INSERT INTO ac_data_pk10bj VALUES ('8403', '1527343808', '684083', '10,06,09,01,03,08,02,04,07,05');
INSERT INTO ac_data_pk10bj VALUES ('8423', '1527344104', '684084', '03,06,08,02,04,01,09,10,07,05');
INSERT INTO ac_data_pk10bj VALUES ('8443', '1527344408', '684085', '06,05,02,08,03,07,04,10,01,09');
INSERT INTO ac_data_pk10bj VALUES ('8463', '1527344713', '684086', '10,01,06,08,04,03,05,07,02,09');
INSERT INTO ac_data_pk10bj VALUES ('8482', '1527345001', '684087', '02,01,05,08,03,07,06,09,04,10');
INSERT INTO ac_data_pk10bj VALUES ('8502', '1527345303', '684088', '07,08,04,10,03,01,02,09,05,06');
INSERT INTO ac_data_pk10bj VALUES ('8522', '1527345605', '684089', '04,05,10,07,01,03,09,06,08,02');
INSERT INTO ac_data_pk10bj VALUES ('8542', '1527345908', '684090', '02,06,08,10,04,09,03,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('8560', '1527346206', '684091', '04,02,10,01,07,08,05,09,06,03');
INSERT INTO ac_data_pk10bj VALUES ('8579', '1527346501', '684092', '04,08,09,01,10,06,03,05,02,07');
INSERT INTO ac_data_pk10bj VALUES ('8599', '1527346807', '684093', '06,07,04,08,09,02,03,01,10,05');
INSERT INTO ac_data_pk10bj VALUES ('8619', '1527347108', '684094', '04,10,01,07,03,05,06,09,08,02');
INSERT INTO ac_data_pk10bj VALUES ('8639', '1527347415', '684095', '09,10,06,02,05,08,07,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('8658', '1527347710', '684096', '10,09,04,06,03,01,08,07,05,02');
INSERT INTO ac_data_pk10bj VALUES ('8678', '1527348015', '684097', '09,06,08,02,07,10,03,04,05,01');
INSERT INTO ac_data_pk10bj VALUES ('8697', '1527348305', '684098', '04,07,09,06,05,03,01,08,10,02');
INSERT INTO ac_data_pk10bj VALUES ('8716', '1527348612', '684099', '10,01,04,06,07,09,03,05,02,08');
INSERT INTO ac_data_pk10bj VALUES ('8734', '1527348905', '684100', '05,07,04,01,03,09,02,06,08,10');
INSERT INTO ac_data_pk10bj VALUES ('8753', '1527349209', '684101', '08,07,04,10,09,06,05,01,03,02');
INSERT INTO ac_data_pk10bj VALUES ('8771', '1527349510', '684102', '10,01,04,06,05,02,03,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('8779', '1527387925', '684121', '02,10,01,04,08,09,06,07,03,05');
INSERT INTO ac_data_pk10bj VALUES ('8797', '1527388211', '684122', '03,08,07,01,02,09,10,05,04,06');
INSERT INTO ac_data_pk10bj VALUES ('8817', '1527388515', '684123', '04,08,07,02,01,09,03,06,05,10');
INSERT INTO ac_data_pk10bj VALUES ('8836', '1527388803', '684124', '01,08,05,04,02,03,06,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('8856', '1527389105', '684125', '07,10,06,09,04,03,05,01,02,08');
INSERT INTO ac_data_pk10bj VALUES ('8876', '1527389401', '684126', '05,06,04,08,01,03,07,09,10,02');
INSERT INTO ac_data_pk10bj VALUES ('8896', '1527389707', '684127', '09,06,01,04,05,10,07,02,08,03');
INSERT INTO ac_data_pk10bj VALUES ('8916', '1527390012', '684128', '10,02,03,07,01,05,04,08,06,09');
INSERT INTO ac_data_pk10bj VALUES ('8935', '1527390299', '684129', '07,03,02,04,06,09,10,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('8955', '1527390602', '684130', '07,10,06,05,03,04,08,02,01,09');
INSERT INTO ac_data_pk10bj VALUES ('8975', '1527390901', '684131', '07,09,06,02,03,10,08,05,04,01');
INSERT INTO ac_data_pk10bj VALUES ('8995', '1527391205', '684132', '09,05,03,04,07,02,08,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('9015', '1527391509', '684133', '03,08,04,01,07,09,06,10,02,05');
INSERT INTO ac_data_pk10bj VALUES ('9035', '1527391813', '684134', '09,01,07,10,05,03,06,02,08,04');
INSERT INTO ac_data_pk10bj VALUES ('9038', '1527392666', '684136', '05,01,09,06,02,10,04,03,07,08');
INSERT INTO ac_data_pk10bj VALUES ('9040', '1527392711', '684137', '04,09,02,10,06,08,01,05,03,07');
INSERT INTO ac_data_pk10bj VALUES ('9060', '1527393014', '684138', '01,04,10,05,03,09,08,07,06,02');
INSERT INTO ac_data_pk10bj VALUES ('9079', '1527393302', '684139', '03,09,05,06,01,10,02,04,08,07');
INSERT INTO ac_data_pk10bj VALUES ('9099', '1527393600', '684140', '01,08,10,06,09,03,05,04,07,02');
INSERT INTO ac_data_pk10bj VALUES ('9119', '1527393903', '684141', '01,05,06,04,03,08,02,09,07,10');
INSERT INTO ac_data_pk10bj VALUES ('9139', '1527394206', '684142', '05,02,07,06,08,09,03,04,10,01');
INSERT INTO ac_data_pk10bj VALUES ('9159', '1527394509', '684143', '03,09,05,10,01,02,04,08,07,06');
INSERT INTO ac_data_pk10bj VALUES ('9179', '1527394812', '684144', '01,03,09,04,08,10,05,06,02,07');
INSERT INTO ac_data_pk10bj VALUES ('9198', '1527395103', '684145', '04,07,02,06,05,03,08,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('9218', '1527395409', '684146', '09,10,01,05,07,03,02,04,06,08');
INSERT INTO ac_data_pk10bj VALUES ('9237', '1527395699', '684147', '02,09,06,01,07,08,05,04,10,03');
INSERT INTO ac_data_pk10bj VALUES ('9257', '1527396001', '684148', '09,08,10,02,06,03,05,07,04,01');
INSERT INTO ac_data_pk10bj VALUES ('9277', '1527396310', '684149', '04,08,05,02,09,06,01,07,10,03');
INSERT INTO ac_data_pk10bj VALUES ('9297', '1527396602', '684150', '08,03,05,04,02,06,09,07,01,10');
INSERT INTO ac_data_pk10bj VALUES ('9317', '1527396905', '684151', '03,04,02,01,08,09,10,06,07,05');
INSERT INTO ac_data_pk10bj VALUES ('9336', '1527397200', '684152', '08,09,07,02,06,04,10,01,05,03');
INSERT INTO ac_data_pk10bj VALUES ('9356', '1527397503', '684153', '08,05,01,07,06,03,04,02,10,09');
INSERT INTO ac_data_pk10bj VALUES ('9376', '1527397805', '684154', '02,07,09,03,08,01,10,06,05,04');
INSERT INTO ac_data_pk10bj VALUES ('9397', '1527398118', '684155', '06,09,08,05,04,02,07,01,03,10');
INSERT INTO ac_data_pk10bj VALUES ('9416', '1527398406', '684156', '02,04,03,05,08,09,10,01,07,06');
INSERT INTO ac_data_pk10bj VALUES ('9436', '1527398708', '684157', '03,05,07,08,04,10,02,09,06,01');
INSERT INTO ac_data_pk10bj VALUES ('9456', '1527399013', '684158', '08,06,01,10,09,05,03,07,02,04');
INSERT INTO ac_data_pk10bj VALUES ('9475', '1527399305', '684159', '08,10,02,06,03,07,01,04,09,05');
INSERT INTO ac_data_pk10bj VALUES ('9495', '1527399604', '684160', '07,04,10,02,09,01,03,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('9515', '1527399907', '684161', '09,07,03,05,02,01,10,04,08,06');
INSERT INTO ac_data_pk10bj VALUES ('9535', '1527400214', '684162', '04,10,03,09,02,07,01,05,08,06');
INSERT INTO ac_data_pk10bj VALUES ('9554', '1527400503', '684163', '05,08,06,10,02,09,03,04,07,01');
INSERT INTO ac_data_pk10bj VALUES ('9574', '1527400802', '684164', '01,08,02,10,03,04,09,07,06,05');
INSERT INTO ac_data_pk10bj VALUES ('9594', '1527401106', '684165', '02,06,05,07,08,10,04,09,01,03');
INSERT INTO ac_data_pk10bj VALUES ('9614', '1527401408', '684166', '04,02,01,08,06,10,03,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('9633', '1527401697', '684167', '05,09,04,02,10,03,01,08,06,07');
INSERT INTO ac_data_pk10bj VALUES ('9653', '1527402000', '684168', '01,09,07,05,02,08,03,04,10,06');
INSERT INTO ac_data_pk10bj VALUES ('9673', '1527402302', '684169', '04,02,06,03,05,08,09,01,10,07');
INSERT INTO ac_data_pk10bj VALUES ('9693', '1527402612', '684170', '04,01,05,03,10,02,09,06,07,08');
INSERT INTO ac_data_pk10bj VALUES ('9713', '1527402915', '684171', '03,08,04,10,09,02,07,06,05,01');
INSERT INTO ac_data_pk10bj VALUES ('9732', '1527403211', '684172', '09,04,07,08,01,03,05,10,02,06');
INSERT INTO ac_data_pk10bj VALUES ('9752', '1527403516', '684173', '05,10,08,09,01,02,07,04,03,06');
INSERT INTO ac_data_pk10bj VALUES ('9771', '1527403804', '684174', '07,01,05,10,09,08,04,03,02,06');
INSERT INTO ac_data_pk10bj VALUES ('9791', '1527404108', '684175', '09,03,05,08,01,02,07,06,04,10');
INSERT INTO ac_data_pk10bj VALUES ('9811', '1527404411', '684176', '05,06,02,03,07,09,10,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('9830', '1527404702', '684177', '02,10,04,07,09,03,05,08,01,06');
INSERT INTO ac_data_pk10bj VALUES ('9850', '1527405007', '684178', '06,08,05,02,03,09,04,01,10,07');
INSERT INTO ac_data_pk10bj VALUES ('9870', '1527405305', '684179', '03,10,07,04,05,01,02,09,06,08');
INSERT INTO ac_data_pk10bj VALUES ('9890', '1527405608', '684180', '01,09,10,02,04,05,06,07,03,08');
INSERT INTO ac_data_pk10bj VALUES ('9909', '1527405896', '684181', '01,08,02,10,09,03,05,06,07,04');
INSERT INTO ac_data_pk10bj VALUES ('9929', '1527406201', '684182', '10,03,05,06,04,02,08,09,07,01');
INSERT INTO ac_data_pk10bj VALUES ('9949', '1527406506', '684183', '03,07,09,05,06,01,08,02,10,04');
INSERT INTO ac_data_pk10bj VALUES ('9969', '1527406807', '684184', '02,09,01,08,05,10,06,03,07,04');
INSERT INTO ac_data_pk10bj VALUES ('9989', '1527407110', '684185', '02,03,01,04,10,06,07,08,05,09');
INSERT INTO ac_data_pk10bj VALUES ('10009', '1527407413', '684186', '01,09,07,05,04,03,02,06,08,10');
INSERT INTO ac_data_pk10bj VALUES ('10028', '1527407700', '684187', '07,06,09,01,04,03,08,02,10,05');
INSERT INTO ac_data_pk10bj VALUES ('10048', '1527408003', '684188', '01,05,08,04,09,10,03,02,07,06');
INSERT INTO ac_data_pk10bj VALUES ('10068', '1527408306', '684189', '04,03,08,09,10,07,01,05,02,06');
INSERT INTO ac_data_pk10bj VALUES ('10088', '1527408611', '684190', '07,06,10,09,05,01,03,08,02,04');
INSERT INTO ac_data_pk10bj VALUES ('10107', '1527408899', '684191', '06,10,08,04,03,02,05,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('10128', '1527409218', '684192', '03,08,02,10,05,06,04,07,01,09');
INSERT INTO ac_data_pk10bj VALUES ('10147', '1527409505', '684193', '06,07,05,01,09,03,08,02,04,10');
INSERT INTO ac_data_pk10bj VALUES ('10167', '1527409808', '684194', '09,05,10,01,08,02,06,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('10187', '1527410115', '684195', '07,06,01,02,09,10,03,05,08,04');
INSERT INTO ac_data_pk10bj VALUES ('10206', '1527410403', '684196', '10,09,02,08,01,07,03,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('10226', '1527410711', '684197', '06,03,09,10,02,04,07,01,05,08');
INSERT INTO ac_data_pk10bj VALUES ('10246', '1527411005', '684198', '02,08,09,05,07,10,03,01,06,04');
INSERT INTO ac_data_pk10bj VALUES ('10266', '1527411307', '684199', '09,04,01,03,07,06,05,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('10286', '1527411610', '684200', '02,04,06,08,09,07,03,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('10306', '1527411918', '684201', '01,05,08,09,07,10,02,06,03,04');
INSERT INTO ac_data_pk10bj VALUES ('10325', '1527412206', '684202', '06,08,07,04,10,09,03,01,05,02');
INSERT INTO ac_data_pk10bj VALUES ('10345', '1527412506', '684203', '07,03,09,02,01,06,10,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('10364', '1527412801', '684204', '03,10,09,02,06,04,01,08,07,05');
INSERT INTO ac_data_pk10bj VALUES ('10384', '1527413103', '684205', '08,10,05,02,03,04,09,06,01,07');
INSERT INTO ac_data_pk10bj VALUES ('10404', '1527413408', '684206', '10,07,08,02,09,06,01,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('10424', '1527413711', '684207', '09,10,02,01,06,04,03,05,07,08');
INSERT INTO ac_data_pk10bj VALUES ('10444', '1527414006', '684208', '02,04,09,07,01,08,10,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('10464', '1527414308', '684209', '03,02,05,08,07,10,06,04,01,09');
INSERT INTO ac_data_pk10bj VALUES ('10484', '1527414611', '684210', '06,10,05,08,07,01,03,02,04,09');
INSERT INTO ac_data_pk10bj VALUES ('10503', '1527414902', '684211', '02,09,08,07,03,05,01,10,06,04');
INSERT INTO ac_data_pk10bj VALUES ('10523', '1527415205', '684212', '01,07,02,03,04,08,09,05,10,06');
INSERT INTO ac_data_pk10bj VALUES ('10543', '1527415508', '684213', '10,04,05,06,01,03,08,09,07,02');
INSERT INTO ac_data_pk10bj VALUES ('10562', '1527415798', '684214', '05,01,06,04,02,03,09,07,08,10');
INSERT INTO ac_data_pk10bj VALUES ('10582', '1527416100', '684215', '03,04,05,08,02,09,01,07,06,10');
INSERT INTO ac_data_pk10bj VALUES ('10602', '1527416404', '684216', '09,10,05,02,06,04,07,01,08,03');
INSERT INTO ac_data_pk10bj VALUES ('10622', '1527416705', '684217', '02,09,08,06,10,05,07,04,03,01');
INSERT INTO ac_data_pk10bj VALUES ('10642', '1527417008', '684218', '07,09,01,10,02,04,06,03,05,08');
INSERT INTO ac_data_pk10bj VALUES ('10662', '1527417316', '684219', '04,03,07,05,10,01,02,08,06,09');
INSERT INTO ac_data_pk10bj VALUES ('10681', '1527417604', '684220', '03,09,04,08,01,06,05,07,10,02');
INSERT INTO ac_data_pk10bj VALUES ('10701', '1527417907', '684221', '07,02,10,05,08,03,06,01,04,09');
INSERT INTO ac_data_pk10bj VALUES ('10721', '1527418207', '684222', '02,05,06,08,09,10,04,07,01,03');
INSERT INTO ac_data_pk10bj VALUES ('10741', '1527418509', '684223', '06,04,08,05,02,07,01,10,09,03');
INSERT INTO ac_data_pk10bj VALUES ('10761', '1527418813', '684224', '04,06,08,07,01,10,03,05,09,02');
INSERT INTO ac_data_pk10bj VALUES ('10780', '1527419104', '684225', '07,02,08,09,10,03,04,05,06,01');
INSERT INTO ac_data_pk10bj VALUES ('10800', '1527419408', '684226', '03,04,01,02,10,08,07,06,09,05');
INSERT INTO ac_data_pk10bj VALUES ('10820', '1527419707', '684227', '04,02,01,03,10,09,06,08,05,07');
INSERT INTO ac_data_pk10bj VALUES ('10839', '1527420007', '684228', '02,06,10,08,04,09,03,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('10859', '1527420311', '684229', '10,05,03,04,07,08,06,02,01,09');
INSERT INTO ac_data_pk10bj VALUES ('10878', '1527420598', '684230', '05,07,01,03,08,02,04,06,09,10');
INSERT INTO ac_data_pk10bj VALUES ('10898', '1527420901', '684231', '10,05,06,02,09,08,01,07,03,04');
INSERT INTO ac_data_pk10bj VALUES ('10919', '1527421208', '684232', '01,06,08,05,04,03,09,10,02,07');
INSERT INTO ac_data_pk10bj VALUES ('10939', '1527421511', '684233', '03,04,02,01,07,06,10,09,08,05');
INSERT INTO ac_data_pk10bj VALUES ('10959', '1527421813', '684234', '02,06,07,01,08,04,09,10,05,03');
INSERT INTO ac_data_pk10bj VALUES ('10978', '1527422106', '684235', '08,07,09,02,03,04,10,06,05,01');
INSERT INTO ac_data_pk10bj VALUES ('10998', '1527422405', '684236', '06,07,03,09,01,08,10,02,04,05');
INSERT INTO ac_data_pk10bj VALUES ('11018', '1527422709', '684237', '10,08,06,02,09,07,01,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('11038', '1527423011', '684238', '04,10,01,02,03,08,09,05,06,07');
INSERT INTO ac_data_pk10bj VALUES ('11057', '1527423300', '684239', '05,08,01,02,09,06,10,03,07,04');
INSERT INTO ac_data_pk10bj VALUES ('11078', '1527423618', '684240', '06,03,05,10,09,07,08,04,02,01');
INSERT INTO ac_data_pk10bj VALUES ('11097', '1527423906', '684241', '02,08,10,06,09,01,04,07,05,03');
INSERT INTO ac_data_pk10bj VALUES ('11117', '1527424209', '684242', '01,06,10,03,05,07,04,09,02,08');
INSERT INTO ac_data_pk10bj VALUES ('11137', '1527424511', '684243', '04,05,02,03,01,10,07,09,06,08');
INSERT INTO ac_data_pk10bj VALUES ('11157', '1527424814', '684244', '05,10,06,08,09,02,01,04,03,07');
INSERT INTO ac_data_pk10bj VALUES ('11176', '1527425102', '684245', '03,09,01,04,10,06,08,02,07,05');
INSERT INTO ac_data_pk10bj VALUES ('11197', '1527425410', '684246', '05,02,03,09,01,10,06,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('11217', '1527425713', '684247', '02,01,03,05,04,09,07,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('11236', '1527426003', '684248', '09,01,04,08,05,02,06,03,10,07');
INSERT INTO ac_data_pk10bj VALUES ('11256', '1527426307', '684249', '08,03,06,09,10,07,02,05,01,04');
INSERT INTO ac_data_pk10bj VALUES ('11276', '1527426610', '684250', '02,01,05,03,04,09,08,10,07,06');
INSERT INTO ac_data_pk10bj VALUES ('11296', '1527426910', '684251', '05,07,06,10,03,09,02,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('11316', '1527427212', '684252', '10,07,03,09,02,08,01,04,06,05');
INSERT INTO ac_data_pk10bj VALUES ('11336', '1527427515', '684253', '07,05,02,10,08,01,03,06,09,04');
INSERT INTO ac_data_pk10bj VALUES ('11355', '1527427806', '684254', '01,08,10,06,05,04,03,07,09,02');
INSERT INTO ac_data_pk10bj VALUES ('11375', '1527428111', '684255', '10,05,09,06,01,07,08,04,02,03');
INSERT INTO ac_data_pk10bj VALUES ('11395', '1527428410', '684256', '06,01,02,05,10,03,09,07,04,08');
INSERT INTO ac_data_pk10bj VALUES ('11415', '1527428712', '684257', '07,02,06,09,01,08,10,05,03,04');
INSERT INTO ac_data_pk10bj VALUES ('11431', '1527429004', '684258', '08,06,05,04,07,09,02,01,03,10');
INSERT INTO ac_data_pk10bj VALUES ('11450', '1527429302', '684259', '02,07,01,10,05,04,09,03,06,08');
INSERT INTO ac_data_pk10bj VALUES ('11469', '1527429600', '684260', '08,07,03,10,04,06,09,01,02,05');
INSERT INTO ac_data_pk10bj VALUES ('11481', '1527429897', '684261', '03,08,06,10,07,09,05,01,04,02');
INSERT INTO ac_data_pk10bj VALUES ('11500', '1527430204', '684262', '09,04,03,02,01,07,05,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('11520', '1527430506', '684263', '01,02,04,03,06,07,10,09,08,05');
INSERT INTO ac_data_pk10bj VALUES ('11540', '1527430813', '684264', '04,09,10,05,08,07,06,01,03,02');
INSERT INTO ac_data_pk10bj VALUES ('11560', '1527431107', '684265', '10,02,08,09,04,01,07,03,06,05');
INSERT INTO ac_data_pk10bj VALUES ('11580', '1527431412', '684266', '07,06,01,10,04,08,02,03,09,05');
INSERT INTO ac_data_pk10bj VALUES ('11600', '1527431714', '684267', '01,02,10,08,03,09,07,05,06,04');
INSERT INTO ac_data_pk10bj VALUES ('11619', '1527432002', '684268', '05,07,09,10,04,01,02,03,08,06');
INSERT INTO ac_data_pk10bj VALUES ('11639', '1527432308', '684269', '03,01,02,06,05,09,07,04,08,10');
INSERT INTO ac_data_pk10bj VALUES ('11659', '1527432610', '684270', '04,08,10,06,09,07,02,05,01,03');
INSERT INTO ac_data_pk10bj VALUES ('11679', '1527432912', '684271', '08,02,04,06,05,03,07,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('11698', '1527433203', '684272', '04,08,01,06,05,09,02,10,03,07');
INSERT INTO ac_data_pk10bj VALUES ('11718', '1527433509', '684273', '04,02,08,01,03,10,06,09,05,07');
INSERT INTO ac_data_pk10bj VALUES ('11738', '1527433812', '684274', '08,06,03,10,05,09,02,04,07,01');
INSERT INTO ac_data_pk10bj VALUES ('11758', '1527434110', '684275', '06,03,05,01,02,09,10,08,07,04');
INSERT INTO ac_data_pk10bj VALUES ('11777', '1527434401', '684276', '01,08,03,06,10,04,02,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('11794', '1527434708', '684277', '05,06,07,01,08,03,04,09,10,02');
INSERT INTO ac_data_pk10bj VALUES ('11813', '1527434997', '684278', '08,09,05,01,04,03,10,02,06,07');
INSERT INTO ac_data_pk10bj VALUES ('11833', '1527435299', '684279', '09,07,04,10,01,08,05,06,03,02');
INSERT INTO ac_data_pk10bj VALUES ('11854', '1527435610', '684280', '06,04,10,02,01,03,07,05,08,09');
INSERT INTO ac_data_pk10bj VALUES ('11873', '1527435898', '684281', '05,04,10,03,09,08,02,01,06,07');
INSERT INTO ac_data_pk10bj VALUES ('11893', '1527436200', '684282', '07,09,10,04,01,08,05,03,06,02');
INSERT INTO ac_data_pk10bj VALUES ('11913', '1527436503', '684283', '08,02,01,06,10,07,05,09,04,03');
INSERT INTO ac_data_pk10bj VALUES ('11957', '1527469511', '684284', '06,09,03,04,08,10,05,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('11976', '1527469801', '684285', '03,05,01,06,04,09,08,10,07,02');
INSERT INTO ac_data_pk10bj VALUES ('11996', '1527470102', '684286', '01,10,07,03,02,04,06,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('12016', '1527470406', '684287', '07,01,02,06,09,05,03,08,10,04');
INSERT INTO ac_data_pk10bj VALUES ('12036', '1527470710', '684288', '08,01,07,06,10,03,05,02,09,04');
INSERT INTO ac_data_pk10bj VALUES ('12055', '1527470998', '684289', '04,01,06,07,05,10,03,02,09,08');
INSERT INTO ac_data_pk10bj VALUES ('12076', '1527471316', '684290', '08,10,03,05,04,09,06,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('12095', '1527471601', '684291', '06,01,07,04,03,05,09,02,08,10');
INSERT INTO ac_data_pk10bj VALUES ('12115', '1527471908', '684292', '08,07,02,05,04,06,01,09,10,03');
INSERT INTO ac_data_pk10bj VALUES ('12134', '1527472198', '684293', '05,08,01,04,03,09,10,02,07,06');
INSERT INTO ac_data_pk10bj VALUES ('12154', '1527472501', '684294', '02,10,03,04,08,09,01,06,07,05');
INSERT INTO ac_data_pk10bj VALUES ('12174', '1527472799', '684295', '01,02,05,08,03,10,07,04,09,06');
INSERT INTO ac_data_pk10bj VALUES ('12194', '1527473104', '684296', '01,02,08,04,06,07,05,10,09,03');
INSERT INTO ac_data_pk10bj VALUES ('12214', '1527473414', '684297', '06,04,08,03,05,10,09,02,07,01');
INSERT INTO ac_data_pk10bj VALUES ('12233', '1527473701', '684298', '05,07,06,08,02,01,09,10,03,04');
INSERT INTO ac_data_pk10bj VALUES ('12253', '1527474005', '684299', '04,09,03,05,07,08,10,02,01,06');
INSERT INTO ac_data_pk10bj VALUES ('12273', '1527474300', '684300', '05,06,10,07,03,08,09,02,04,01');
INSERT INTO ac_data_pk10bj VALUES ('12293', '1527474603', '684301', '05,03,10,09,02,07,01,04,08,06');
INSERT INTO ac_data_pk10bj VALUES ('12313', '1527474911', '684302', '05,09,07,08,10,06,03,04,01,02');
INSERT INTO ac_data_pk10bj VALUES ('12333', '1527475213', '684303', '03,07,06,09,02,05,01,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('12352', '1527475501', '684304', '04,05,10,01,09,02,08,06,07,03');
INSERT INTO ac_data_pk10bj VALUES ('12372', '1527475801', '684305', '02,01,04,09,06,03,07,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('12392', '1527476105', '684306', '03,08,06,01,02,10,05,04,07,09');
INSERT INTO ac_data_pk10bj VALUES ('12412', '1527476407', '684307', '04,03,06,09,07,02,05,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('12432', '1527476712', '684308', '02,08,06,04,05,03,09,07,10,01');
INSERT INTO ac_data_pk10bj VALUES ('12451', '1527477000', '684309', '08,02,09,06,10,04,07,01,03,05');
INSERT INTO ac_data_pk10bj VALUES ('12471', '1527477303', '684310', '09,06,07,03,01,10,02,08,05,04');
INSERT INTO ac_data_pk10bj VALUES ('12491', '1527477610', '684311', '09,06,03,01,08,10,04,05,07,02');
INSERT INTO ac_data_pk10bj VALUES ('12511', '1527477926', '684312', '08,02,06,01,07,05,10,03,04,09');
INSERT INTO ac_data_pk10bj VALUES ('12529', '1527478200', '684313', '04,07,06,09,08,10,02,01,05,03');
INSERT INTO ac_data_pk10bj VALUES ('12549', '1527478504', '684314', '01,09,10,07,02,08,03,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('12569', '1527478804', '684315', '04,09,03,02,07,06,01,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('12589', '1527479108', '684316', '02,06,01,07,08,09,05,03,10,04');
INSERT INTO ac_data_pk10bj VALUES ('12609', '1527479414', '684317', '10,02,05,07,04,01,03,06,08,09');
INSERT INTO ac_data_pk10bj VALUES ('12628', '1527479708', '684318', '06,04,10,05,03,07,09,02,01,08');
INSERT INTO ac_data_pk10bj VALUES ('12648', '1527480001', '684319', '04,09,01,08,03,06,02,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('12668', '1527480304', '684320', '04,06,03,09,10,02,05,01,07,08');
INSERT INTO ac_data_pk10bj VALUES ('12688', '1527480607', '684321', '08,03,02,09,01,06,05,10,07,04');
INSERT INTO ac_data_pk10bj VALUES ('12708', '1527480915', '684322', '04,05,10,08,01,06,03,02,09,07');
INSERT INTO ac_data_pk10bj VALUES ('12727', '1527481203', '684323', '04,10,08,02,06,09,03,07,05,01');
INSERT INTO ac_data_pk10bj VALUES ('12747', '1527481503', '684324', '08,02,04,10,03,01,05,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('12767', '1527481807', '684325', '02,09,05,06,04,03,10,08,07,01');
INSERT INTO ac_data_pk10bj VALUES ('12786', '1527482096', '684326', '06,08,09,05,10,04,01,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('12806', '1527482401', '684327', '02,04,10,06,07,05,03,01,08,09');
INSERT INTO ac_data_pk10bj VALUES ('12826', '1527482704', '684328', '10,01,03,05,02,08,09,06,04,07');
INSERT INTO ac_data_pk10bj VALUES ('12846', '1527483003', '684329', '09,06,02,10,07,01,03,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('12866', '1527483306', '684330', '09,01,10,07,03,02,04,06,05,08');
INSERT INTO ac_data_pk10bj VALUES ('12886', '1527483612', '684331', '04,02,06,08,07,05,10,01,03,09');
INSERT INTO ac_data_pk10bj VALUES ('12905', '1527483900', '684332', '05,08,04,09,02,10,01,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('12925', '1527484203', '684333', '01,07,06,02,04,09,08,03,05,10');
INSERT INTO ac_data_pk10bj VALUES ('12945', '1527484503', '684334', '05,04,02,08,06,01,09,10,07,03');
INSERT INTO ac_data_pk10bj VALUES ('12965', '1527484806', '684335', '08,01,04,10,09,05,03,06,02,07');
INSERT INTO ac_data_pk10bj VALUES ('12985', '1527485111', '684336', '05,03,01,02,08,06,07,10,09,04');
INSERT INTO ac_data_pk10bj VALUES ('13005', '1527485413', '684337', '02,01,07,03,10,09,06,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('13024', '1527485701', '684338', '10,07,08,05,03,04,01,06,02,09');
INSERT INTO ac_data_pk10bj VALUES ('13044', '1527486006', '684339', '01,02,04,09,07,10,08,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('13064', '1527486309', '684340', '07,08,09,01,06,02,05,10,03,04');
INSERT INTO ac_data_pk10bj VALUES ('13084', '1527486613', '684341', '02,05,03,01,08,04,10,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('13103', '1527486902', '684342', '05,10,01,04,08,09,03,07,02,06');
INSERT INTO ac_data_pk10bj VALUES ('13123', '1527487202', '684343', '10,08,07,03,04,05,01,02,09,06');
INSERT INTO ac_data_pk10bj VALUES ('13143', '1527487505', '684344', '09,04,08,06,01,10,07,03,05,02');
INSERT INTO ac_data_pk10bj VALUES ('13163', '1527487808', '684345', '04,06,08,01,03,02,10,07,09,05');
INSERT INTO ac_data_pk10bj VALUES ('13183', '1527488111', '684346', '08,10,03,04,01,09,05,02,06,07');
INSERT INTO ac_data_pk10bj VALUES ('13203', '1527488415', '684347', '07,10,02,04,05,03,08,09,01,06');
INSERT INTO ac_data_pk10bj VALUES ('13222', '1527488703', '684348', '03,09,07,02,08,05,10,04,01,06');
INSERT INTO ac_data_pk10bj VALUES ('13242', '1527489009', '684349', '05,08,03,04,10,01,09,06,02,07');
INSERT INTO ac_data_pk10bj VALUES ('13262', '1527489313', '684350', '06,02,09,01,07,10,05,04,08,03');
INSERT INTO ac_data_pk10bj VALUES ('13281', '1527489605', '684351', '07,02,01,09,03,05,08,10,04,06');
INSERT INTO ac_data_pk10bj VALUES ('13301', '1527489908', '684352', '09,10,01,02,07,05,06,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('13321', '1527490204', '684353', '09,10,08,07,02,01,04,06,03,05');
INSERT INTO ac_data_pk10bj VALUES ('13341', '1527490510', '684354', '07,01,08,05,10,04,09,02,03,06');
INSERT INTO ac_data_pk10bj VALUES ('13360', '1527490799', '684355', '07,03,02,08,09,05,04,06,01,10');
INSERT INTO ac_data_pk10bj VALUES ('13380', '1527491104', '684356', '07,05,04,02,03,06,10,01,08,09');
INSERT INTO ac_data_pk10bj VALUES ('13400', '1527491409', '684357', '01,07,10,04,09,03,05,06,08,02');
INSERT INTO ac_data_pk10bj VALUES ('13420', '1527491706', '684358', '10,02,04,06,08,07,01,03,09,05');
INSERT INTO ac_data_pk10bj VALUES ('13440', '1527492011', '684359', '06,09,01,04,08,10,03,02,05,07');
INSERT INTO ac_data_pk10bj VALUES ('13459', '1527492298', '684360', '04,02,03,07,09,05,01,10,08,06');
INSERT INTO ac_data_pk10bj VALUES ('13479', '1527492603', '684361', '01,09,07,06,04,03,08,05,10,02');
INSERT INTO ac_data_pk10bj VALUES ('13499', '1527492908', '684362', '06,03,09,07,08,01,05,04,10,02');
INSERT INTO ac_data_pk10bj VALUES ('13519', '1527493210', '684363', '05,01,04,03,02,07,06,10,08,09');
INSERT INTO ac_data_pk10bj VALUES ('13539', '1527493513', '684364', '09,08,07,06,01,02,05,03,10,04');
INSERT INTO ac_data_pk10bj VALUES ('13558', '1527493801', '684365', '01,03,08,04,07,06,09,02,05,10');
INSERT INTO ac_data_pk10bj VALUES ('13578', '1527494107', '684366', '09,01,06,05,02,10,07,04,08,03');
INSERT INTO ac_data_pk10bj VALUES ('13598', '1527494403', '684367', '06,05,02,07,09,10,08,01,04,03');
INSERT INTO ac_data_pk10bj VALUES ('13618', '1527494708', '684368', '05,03,07,10,08,04,02,09,01,06');
INSERT INTO ac_data_pk10bj VALUES ('13638', '1527495012', '684369', '05,01,09,03,10,02,06,08,07,04');
INSERT INTO ac_data_pk10bj VALUES ('13657', '1527495302', '684370', '02,07,06,10,03,09,01,04,08,05');
INSERT INTO ac_data_pk10bj VALUES ('13675', '1527495598', '684371', '09,01,07,02,10,05,06,03,08,04');
INSERT INTO ac_data_pk10bj VALUES ('13696', '1527495904', '684372', '04,03,09,06,08,10,01,05,02,07');
INSERT INTO ac_data_pk10bj VALUES ('13715', '1527496199', '684373', '03,06,01,09,10,07,08,04,02,05');
INSERT INTO ac_data_pk10bj VALUES ('13735', '1527496501', '684374', '05,02,03,06,08,09,04,10,01,07');
INSERT INTO ac_data_pk10bj VALUES ('13755', '1527496809', '684375', '07,05,01,10,06,08,02,09,04,03');
INSERT INTO ac_data_pk10bj VALUES ('13774', '1527497103', '684376', '07,04,09,05,06,10,01,02,03,08');
INSERT INTO ac_data_pk10bj VALUES ('13794', '1527497407', '684377', '10,09,06,01,08,07,03,04,05,02');
INSERT INTO ac_data_pk10bj VALUES ('13813', '1527497704', '684378', '05,04,10,06,09,02,03,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('13833', '1527498007', '684379', '10,05,09,02,04,08,06,03,01,07');
INSERT INTO ac_data_pk10bj VALUES ('13853', '1527498313', '684380', '01,06,05,07,03,10,04,09,08,02');
INSERT INTO ac_data_pk10bj VALUES ('13872', '1527498603', '684381', '09,10,06,05,03,02,04,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('13892', '1527498907', '684382', '06,08,10,04,07,01,05,09,03,02');
INSERT INTO ac_data_pk10bj VALUES ('13911', '1527499200', '684383', '01,03,02,10,06,08,07,04,05,09');
INSERT INTO ac_data_pk10bj VALUES ('13931', '1527499503', '684384', '08,10,04,09,05,02,06,03,07,01');
INSERT INTO ac_data_pk10bj VALUES ('13951', '1527499808', '684385', '03,08,10,04,01,09,02,06,07,05');
INSERT INTO ac_data_pk10bj VALUES ('13971', '1527500111', '684386', '09,07,05,02,08,04,01,10,03,06');
INSERT INTO ac_data_pk10bj VALUES ('13991', '1527500408', '684387', '05,07,01,02,04,03,06,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('14011', '1527500712', '684388', '04,10,02,07,05,08,03,01,09,06');
INSERT INTO ac_data_pk10bj VALUES ('14030', '1527500999', '684389', '09,05,08,10,07,03,01,06,04,02');
INSERT INTO ac_data_pk10bj VALUES ('14050', '1527501302', '684390', '10,04,08,05,07,01,06,03,02,09');
INSERT INTO ac_data_pk10bj VALUES ('14070', '1527501605', '684391', '06,01,04,08,10,05,02,03,09,07');
INSERT INTO ac_data_pk10bj VALUES ('14090', '1527501907', '684392', '05,06,07,08,10,04,09,03,02,01');
INSERT INTO ac_data_pk10bj VALUES ('14109', '1527502202', '684393', '06,03,07,10,02,01,04,08,05,09');
INSERT INTO ac_data_pk10bj VALUES ('14129', '1527502505', '684394', '09,08,02,05,06,07,01,10,03,04');
INSERT INTO ac_data_pk10bj VALUES ('14149', '1527502808', '684395', '02,05,08,09,03,10,01,04,07,06');
INSERT INTO ac_data_pk10bj VALUES ('14169', '1527503105', '684396', '06,10,04,05,01,02,03,07,09,08');
INSERT INTO ac_data_pk10bj VALUES ('14189', '1527503408', '684397', '08,06,07,10,02,05,09,01,03,04');
INSERT INTO ac_data_pk10bj VALUES ('14208', '1527503698', '684398', '09,02,04,06,03,07,08,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('14228', '1527504002', '684399', '04,01,09,10,05,02,08,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('14248', '1527504305', '684400', '03,02,06,01,10,09,05,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('14268', '1527504608', '684401', '02,03,07,06,10,09,04,05,01,08');
INSERT INTO ac_data_pk10bj VALUES ('14288', '1527504913', '684402', '03,02,05,01,07,10,04,09,06,08');
INSERT INTO ac_data_pk10bj VALUES ('14307', '1527505200', '684403', '03,02,10,04,05,07,09,01,08,06');
INSERT INTO ac_data_pk10bj VALUES ('14327', '1527505506', '684404', '03,01,05,08,09,06,04,07,10,02');
INSERT INTO ac_data_pk10bj VALUES ('14347', '1527505813', '684405', '06,10,04,01,07,05,03,09,02,08');
INSERT INTO ac_data_pk10bj VALUES ('14367', '1527506108', '684406', '08,10,05,09,06,04,02,01,07,03');
INSERT INTO ac_data_pk10bj VALUES ('14386', '1527506403', '684407', '04,07,10,01,05,08,03,09,02,06');
INSERT INTO ac_data_pk10bj VALUES ('14406', '1527506710', '684408', '05,04,02,03,07,06,10,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('14426', '1527507013', '684409', '01,09,07,04,05,10,02,08,06,03');
INSERT INTO ac_data_pk10bj VALUES ('14445', '1527507300', '684410', '07,08,04,05,03,09,02,06,10,01');
INSERT INTO ac_data_pk10bj VALUES ('14466', '1527507609', '684411', '10,05,09,02,01,03,07,04,06,08');
INSERT INTO ac_data_pk10bj VALUES ('14485', '1527507898', '684412', '10,04,02,05,09,03,01,08,07,06');
INSERT INTO ac_data_pk10bj VALUES ('14505', '1527508206', '684413', '07,06,08,09,02,04,03,10,05,01');
INSERT INTO ac_data_pk10bj VALUES ('14525', '1527508510', '684414', '06,04,01,10,08,03,02,07,05,09');
INSERT INTO ac_data_pk10bj VALUES ('14545', '1527508806', '684415', '10,05,09,03,01,08,07,04,02,06');
INSERT INTO ac_data_pk10bj VALUES ('14565', '1527509112', '684416', '06,03,05,10,02,07,08,01,04,09');
INSERT INTO ac_data_pk10bj VALUES ('14584', '1527509405', '684417', '04,01,02,06,03,10,05,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('14604', '1527509710', '684418', '06,04,07,01,02,10,08,03,05,09');
INSERT INTO ac_data_pk10bj VALUES ('14623', '1527510010', '684419', '05,02,06,01,09,10,08,07,03,04');
INSERT INTO ac_data_pk10bj VALUES ('14643', '1527510308', '684420', '05,02,06,10,04,03,08,07,01,09');
INSERT INTO ac_data_pk10bj VALUES ('14663', '1527510612', '684421', '09,05,07,03,01,06,10,04,02,08');
INSERT INTO ac_data_pk10bj VALUES ('14682', '1527510899', '684422', '09,07,06,01,04,10,03,05,08,02');
INSERT INTO ac_data_pk10bj VALUES ('14702', '1527511204', '684423', '02,04,10,09,08,01,07,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('14722', '1527511509', '684424', '07,04,01,09,10,08,06,03,02,05');
INSERT INTO ac_data_pk10bj VALUES ('14742', '1527511808', '684425', '07,09,04,02,01,10,08,06,03,05');
INSERT INTO ac_data_pk10bj VALUES ('14762', '1527512111', '684426', '04,05,08,06,07,09,03,02,10,01');
INSERT INTO ac_data_pk10bj VALUES ('14781', '1527512401', '684427', '01,02,03,09,10,06,07,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('14801', '1527512706', '684428', '01,04,05,09,02,07,06,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('14821', '1527513010', '684429', '07,06,02,05,01,08,09,04,03,10');
INSERT INTO ac_data_pk10bj VALUES ('14841', '1527513309', '684430', '09,04,08,10,05,03,07,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('14861', '1527513612', '684431', '02,09,04,03,01,06,10,08,07,05');
INSERT INTO ac_data_pk10bj VALUES ('14880', '1527513902', '684432', '06,08,04,02,05,01,09,07,03,10');
INSERT INTO ac_data_pk10bj VALUES ('14900', '1527514207', '684433', '01,03,10,08,07,02,09,04,05,06');
INSERT INTO ac_data_pk10bj VALUES ('14920', '1527514511', '684434', '05,09,10,08,01,03,04,02,07,06');
INSERT INTO ac_data_pk10bj VALUES ('14940', '1527514809', '684435', '10,05,08,06,01,09,03,04,02,07');
INSERT INTO ac_data_pk10bj VALUES ('14959', '1527515097', '684436', '05,06,08,10,09,02,04,03,01,07');
INSERT INTO ac_data_pk10bj VALUES ('14979', '1527515400', '684437', '01,09,06,10,02,08,04,05,07,03');
INSERT INTO ac_data_pk10bj VALUES ('14999', '1527515703', '684438', '02,10,08,07,09,04,01,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('15019', '1527516007', '684439', '03,07,05,06,01,10,08,04,09,02');
INSERT INTO ac_data_pk10bj VALUES ('15038', '1527516295', '684440', '10,02,01,04,09,07,05,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('15078', '1527516905', '684442', '03,06,09,10,07,04,05,02,08,01');
INSERT INTO ac_data_pk10bj VALUES ('15098', '1527517209', '684443', '10,09,02,08,05,01,04,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('15117', '1527517508', '684444', '05,04,02,09,08,03,10,07,06,01');
INSERT INTO ac_data_pk10bj VALUES ('15137', '1527517811', '684445', '05,02,01,04,06,08,09,07,10,03');
INSERT INTO ac_data_pk10bj VALUES ('15156', '1527518102', '684446', '04,01,07,05,09,03,06,08,10,02');
INSERT INTO ac_data_pk10bj VALUES ('15176', '1527518407', '684447', '04,05,08,09,01,06,03,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('15195', '1527518696', '684448', '04,09,03,08,01,07,02,06,10,05');
INSERT INTO ac_data_pk10bj VALUES ('15216', '1527519009', '684449', '03,10,08,04,05,09,07,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('15235', '1527519299', '684450', '04,08,03,01,07,10,05,02,06,09');
INSERT INTO ac_data_pk10bj VALUES ('15255', '1527519601', '684451', '03,06,07,05,01,08,09,04,10,02');
INSERT INTO ac_data_pk10bj VALUES ('15275', '1527519905', '684452', '06,04,02,03,10,08,01,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('15295', '1527520208', '684453', '09,01,05,10,03,08,06,07,04,02');
INSERT INTO ac_data_pk10bj VALUES ('15315', '1527520512', '684454', '07,03,06,08,05,01,09,02,04,10');
INSERT INTO ac_data_pk10bj VALUES ('15334', '1527520801', '684455', '01,02,10,03,05,04,07,08,09,06');
INSERT INTO ac_data_pk10bj VALUES ('15354', '1527521104', '684456', '07,09,02,06,10,01,08,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('15374', '1527521406', '684457', '07,06,01,04,02,05,09,03,08,10');
INSERT INTO ac_data_pk10bj VALUES ('15394', '1527521710', '684458', '02,04,09,01,10,08,07,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('15413', '1527521998', '684459', '04,07,09,01,05,02,10,08,06,03');
INSERT INTO ac_data_pk10bj VALUES ('15433', '1527522302', '684460', '01,04,09,08,06,05,02,07,10,03');
INSERT INTO ac_data_pk10bj VALUES ('15453', '1527522604', '684461', '08,10,07,05,06,03,02,01,09,04');
INSERT INTO ac_data_pk10bj VALUES ('15473', '1527522910', '684462', '01,05,07,10,06,04,08,03,09,02');
INSERT INTO ac_data_pk10bj VALUES ('15516', '1527555910', '684463', '10,02,03,08,09,05,04,01,07,06');
INSERT INTO ac_data_pk10bj VALUES ('15536', '1527556213', '684464', '04,06,05,09,08,01,10,03,07,02');
INSERT INTO ac_data_pk10bj VALUES ('15555', '1527556501', '684465', '10,09,06,08,03,02,07,04,05,01');
INSERT INTO ac_data_pk10bj VALUES ('15575', '1527556805', '684466', '05,10,08,09,02,06,01,03,04,07');
INSERT INTO ac_data_pk10bj VALUES ('15594', '1527557094', '684467', '02,04,07,09,10,06,08,01,03,05');
INSERT INTO ac_data_pk10bj VALUES ('15614', '1527557398', '684468', '01,07,06,10,02,05,03,08,04,09');
INSERT INTO ac_data_pk10bj VALUES ('15634', '1527557703', '684469', '08,04,06,02,09,07,03,01,05,10');
INSERT INTO ac_data_pk10bj VALUES ('15654', '1527558002', '684470', '05,02,06,10,07,04,03,09,08,01');
INSERT INTO ac_data_pk10bj VALUES ('15674', '1527558305', '684471', '02,10,07,06,09,05,01,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('15693', '1527558603', '684472', '10,03,08,07,02,04,06,01,05,09');
INSERT INTO ac_data_pk10bj VALUES ('15713', '1527558906', '684473', '04,03,06,08,09,05,01,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('15733', '1527559199', '684474', '06,05,02,01,10,04,03,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('15753', '1527559503', '684475', '02,01,04,10,05,03,07,06,08,09');
INSERT INTO ac_data_pk10bj VALUES ('15769', '1527857148', '685140', '04,10,07,05,03,06,09,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('15784', '1527857378', '685141', '03,09,06,04,01,08,10,05,02,07');
INSERT INTO ac_data_pk10bj VALUES ('15796', '1527857699', '685142', '07,08,01,10,03,06,02,09,04,05');
INSERT INTO ac_data_pk10bj VALUES ('15809', '1527857995', '685143', '08,06,03,10,09,01,02,04,07,05');
INSERT INTO ac_data_pk10bj VALUES ('15824', '1527858278', '685144', '02,07,04,10,09,08,01,06,03,05');
INSERT INTO ac_data_pk10bj VALUES ('15840', '1527858588', '685145', '10,05,06,07,02,09,04,03,01,08');
INSERT INTO ac_data_pk10bj VALUES ('15859', '1527858921', '685146', '02,10,03,05,08,06,09,04,01,07');
INSERT INTO ac_data_pk10bj VALUES ('15875', '1527859180', '685147', '04,03,08,10,05,02,07,06,01,09');
INSERT INTO ac_data_pk10bj VALUES ('15894', '1527859469', '685148', '02,04,09,01,07,06,05,10,03,08');
INSERT INTO ac_data_pk10bj VALUES ('15915', '1527859787', '685149', '01,04,02,08,06,05,03,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('15934', '1527860074', '685150', '01,08,02,04,06,09,03,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('15952', '1527860542', '685151', '04,08,09,05,01,02,10,07,06,03');
INSERT INTO ac_data_pk10bj VALUES ('15959', '1527860677', '685152', '08,02,01,07,09,10,03,05,06,04');
INSERT INTO ac_data_pk10bj VALUES ('15979', '1527860981', '685153', '07,06,10,04,01,02,05,09,08,03');
INSERT INTO ac_data_pk10bj VALUES ('15998', '1527861269', '685154', '05,09,07,06,03,04,02,10,01,08');
INSERT INTO ac_data_pk10bj VALUES ('16019', '1527861575', '685155', '02,03,08,06,01,07,09,05,10,04');
INSERT INTO ac_data_pk10bj VALUES ('16039', '1527861878', '685156', '04,10,06,03,07,05,08,02,01,09');
INSERT INTO ac_data_pk10bj VALUES ('16059', '1527862181', '685157', '01,09,03,10,06,02,04,05,07,08');
INSERT INTO ac_data_pk10bj VALUES ('16079', '1527862486', '685158', '07,05,02,10,03,09,08,06,04,01');
INSERT INTO ac_data_pk10bj VALUES ('16099', '1527862790', '685159', '09,05,04,03,10,07,01,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('16118', '1527863076', '685160', '07,05,03,09,04,10,02,08,01,06');
INSERT INTO ac_data_pk10bj VALUES ('16138', '1527863390', '685161', '05,10,06,04,02,08,09,03,01,07');
INSERT INTO ac_data_pk10bj VALUES ('16157', '1527863678', '685162', '07,01,03,02,06,09,08,05,10,04');
INSERT INTO ac_data_pk10bj VALUES ('16177', '1527863985', '685163', '06,02,07,10,08,03,09,05,01,04');
INSERT INTO ac_data_pk10bj VALUES ('16197', '1527864288', '685164', '01,10,02,07,04,08,09,03,06,05');
INSERT INTO ac_data_pk10bj VALUES ('16216', '1527864580', '685165', '03,07,10,05,09,04,01,06,02,08');
INSERT INTO ac_data_pk10bj VALUES ('16236', '1527864885', '685166', '06,05,03,02,07,10,08,09,01,04');
INSERT INTO ac_data_pk10bj VALUES ('16255', '1527865174', '685167', '10,02,09,01,08,07,05,04,03,06');
INSERT INTO ac_data_pk10bj VALUES ('16275', '1527865477', '685168', '08,09,06,07,05,04,03,10,02,01');
INSERT INTO ac_data_pk10bj VALUES ('16295', '1527865781', '685169', '10,01,08,04,07,03,09,02,06,05');
INSERT INTO ac_data_pk10bj VALUES ('16315', '1527866077', '685170', '09,04,03,02,10,05,01,08,07,06');
INSERT INTO ac_data_pk10bj VALUES ('16335', '1527866380', '685171', '07,05,08,10,03,02,01,06,09,04');
INSERT INTO ac_data_pk10bj VALUES ('16355', '1527866683', '685172', '03,08,07,02,09,05,01,04,06,10');
INSERT INTO ac_data_pk10bj VALUES ('16363', '1527907528', '685199', '04,09,05,02,01,06,08,03,07,10');
INSERT INTO ac_data_pk10bj VALUES ('16379', '1527907778', '685200', '03,06,05,01,10,09,08,07,02,04');
INSERT INTO ac_data_pk10bj VALUES ('16399', '1527908081', '685201', '02,01,08,03,04,05,06,09,07,10');
INSERT INTO ac_data_pk10bj VALUES ('16419', '1527908384', '685202', '01,07,03,10,08,02,04,09,05,06');
INSERT INTO ac_data_pk10bj VALUES ('16438', '1527908672', '685203', '06,08,03,02,09,05,07,10,01,04');
INSERT INTO ac_data_pk10bj VALUES ('16459', '1527908984', '685204', '10,07,01,09,04,03,08,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('16479', '1527909287', '685205', '07,05,10,09,06,04,01,02,03,08');
INSERT INTO ac_data_pk10bj VALUES ('16498', '1527909575', '685206', '01,07,10,05,09,08,03,02,04,06');
INSERT INTO ac_data_pk10bj VALUES ('16518', '1527909878', '685207', '04,10,02,07,03,06,05,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('16538', '1527910182', '685208', '01,05,07,09,02,04,08,03,06,10');
INSERT INTO ac_data_pk10bj VALUES ('16558', '1527910484', '685209', '05,09,02,07,10,03,08,01,06,04');
INSERT INTO ac_data_pk10bj VALUES ('16577', '1527910775', '685210', '07,09,10,01,04,03,06,08,05,02');
INSERT INTO ac_data_pk10bj VALUES ('16597', '1527911078', '685211', '07,04,08,09,10,05,02,01,03,06');
INSERT INTO ac_data_pk10bj VALUES ('16617', '1527911380', '685212', '01,03,10,08,05,09,07,06,04,02');
INSERT INTO ac_data_pk10bj VALUES ('16637', '1527911683', '685213', '05,06,07,02,03,08,10,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('16656', '1527911973', '685214', '04,05,02,06,08,07,03,01,10,09');
INSERT INTO ac_data_pk10bj VALUES ('16676', '1527912276', '685215', '03,10,09,07,02,08,05,06,01,04');
INSERT INTO ac_data_pk10bj VALUES ('16696', '1527912582', '685216', '02,01,06,04,07,08,10,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('16716', '1527912885', '685217', '02,07,03,08,01,05,10,09,04,06');
INSERT INTO ac_data_pk10bj VALUES ('16735', '1527913176', '685218', '02,05,04,06,10,07,09,08,03,01');
INSERT INTO ac_data_pk10bj VALUES ('16756', '1527913486', '685219', '04,10,08,05,09,02,07,03,01,06');
INSERT INTO ac_data_pk10bj VALUES ('16775', '1527913775', '685220', '07,06,01,09,05,03,04,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('16795', '1527914078', '685221', '04,01,07,09,10,06,03,05,02,08');
INSERT INTO ac_data_pk10bj VALUES ('16815', '1527914381', '685222', '01,08,04,03,09,10,02,06,07,05');
INSERT INTO ac_data_pk10bj VALUES ('16835', '1527914686', '685223', '03,05,08,10,07,01,09,02,06,04');
INSERT INTO ac_data_pk10bj VALUES ('16854', '1527914972', '685224', '09,02,07,05,08,06,04,03,10,01');
INSERT INTO ac_data_pk10bj VALUES ('16874', '1527915275', '685225', '04,06,03,09,08,05,02,07,10,01');
INSERT INTO ac_data_pk10bj VALUES ('16894', '1527915580', '685226', '08,01,06,04,03,02,10,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('16914', '1527915884', '685227', '01,06,05,03,02,07,10,04,08,09');
INSERT INTO ac_data_pk10bj VALUES ('16934', '1527916185', '685228', '09,05,04,07,01,03,10,08,06,02');
INSERT INTO ac_data_pk10bj VALUES ('16953', '1527916473', '685229', '06,04,09,01,03,02,07,08,05,10');
INSERT INTO ac_data_pk10bj VALUES ('16973', '1527916777', '685230', '01,08,10,02,07,03,05,09,06,04');
INSERT INTO ac_data_pk10bj VALUES ('16993', '1527917083', '685231', '06,02,09,03,08,01,05,04,10,07');
INSERT INTO ac_data_pk10bj VALUES ('17012', '1527917371', '685232', '04,06,05,09,03,02,07,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('17033', '1527917686', '685233', '05,09,07,03,01,04,06,08,02,10');
INSERT INTO ac_data_pk10bj VALUES ('17052', '1527917978', '685234', '01,06,02,04,08,10,09,05,03,07');
INSERT INTO ac_data_pk10bj VALUES ('17072', '1527918282', '685235', '07,01,08,10,06,09,05,03,02,04');
INSERT INTO ac_data_pk10bj VALUES ('17091', '1527918573', '685236', '04,07,10,05,01,08,09,06,02,03');
INSERT INTO ac_data_pk10bj VALUES ('17111', '1527918881', '685237', '01,10,07,04,09,08,05,03,02,06');
INSERT INTO ac_data_pk10bj VALUES ('17132', '1527919187', '685238', '08,02,04,05,09,01,10,06,07,03');
INSERT INTO ac_data_pk10bj VALUES ('17151', '1527919474', '685239', '06,05,01,08,09,02,10,07,03,04');
INSERT INTO ac_data_pk10bj VALUES ('17171', '1527919781', '685240', '03,05,10,01,09,02,06,04,07,08');
INSERT INTO ac_data_pk10bj VALUES ('17191', '1527920084', '685241', '02,03,01,06,04,10,08,09,05,07');
INSERT INTO ac_data_pk10bj VALUES ('17210', '1527920373', '685242', '07,09,02,05,04,10,03,06,01,08');
INSERT INTO ac_data_pk10bj VALUES ('17230', '1527920672', '685243', '10,01,07,06,08,04,03,09,02,05');
INSERT INTO ac_data_pk10bj VALUES ('17250', '1527920982', '685244', '07,03,01,02,08,06,10,09,04,05');
INSERT INTO ac_data_pk10bj VALUES ('17270', '1527921285', '685245', '01,04,08,10,09,06,02,03,05,07');
INSERT INTO ac_data_pk10bj VALUES ('17289', '1527921573', '685246', '09,05,10,02,08,03,04,01,07,06');
INSERT INTO ac_data_pk10bj VALUES ('17309', '1527921877', '685247', '06,09,01,03,04,07,02,10,05,08');
INSERT INTO ac_data_pk10bj VALUES ('17329', '1527922176', '685248', '01,06,09,07,02,03,05,10,04,08');
INSERT INTO ac_data_pk10bj VALUES ('17349', '1527922479', '685249', '02,03,07,08,10,05,01,09,04,06');
INSERT INTO ac_data_pk10bj VALUES ('17369', '1527922782', '685250', '09,08,10,01,05,03,04,06,07,02');
INSERT INTO ac_data_pk10bj VALUES ('17389', '1527923085', '685251', '06,10,07,02,04,05,08,01,03,09');
INSERT INTO ac_data_pk10bj VALUES ('17408', '1527923371', '685252', '05,03,07,06,01,10,09,02,08,04');
INSERT INTO ac_data_pk10bj VALUES ('17428', '1527923677', '685253', '09,06,07,10,03,01,08,02,04,05');
INSERT INTO ac_data_pk10bj VALUES ('17448', '1527923982', '685254', '02,08,03,04,10,01,07,09,06,05');
INSERT INTO ac_data_pk10bj VALUES ('17467', '1527924270', '685255', '08,09,07,01,04,02,06,03,05,10');
INSERT INTO ac_data_pk10bj VALUES ('17487', '1527924577', '685256', '06,01,04,03,05,02,08,07,09,10');
INSERT INTO ac_data_pk10bj VALUES ('17508', '1527924887', '685257', '08,03,04,02,05,01,09,06,07,10');
INSERT INTO ac_data_pk10bj VALUES ('17527', '1527925175', '685258', '05,09,01,02,03,06,07,08,10,04');
INSERT INTO ac_data_pk10bj VALUES ('17547', '1527925480', '685259', '10,03,05,08,06,01,07,04,02,09');
INSERT INTO ac_data_pk10bj VALUES ('17567', '1527925783', '685260', '03,08,01,09,10,05,04,07,02,06');
INSERT INTO ac_data_pk10bj VALUES ('17586', '1527926074', '685261', '07,02,10,03,05,04,06,09,01,08');
INSERT INTO ac_data_pk10bj VALUES ('17606', '1527926373', '685262', '06,03,07,10,01,05,04,02,08,09');
INSERT INTO ac_data_pk10bj VALUES ('17626', '1527926681', '685263', '01,02,07,04,06,09,10,03,05,08');
INSERT INTO ac_data_pk10bj VALUES ('17646', '1527926984', '685264', '03,09,04,02,10,05,07,06,08,01');
INSERT INTO ac_data_pk10bj VALUES ('17665', '1527927273', '685265', '05,08,02,04,03,06,09,07,10,01');
INSERT INTO ac_data_pk10bj VALUES ('17685', '1527927576', '685266', '09,07,02,03,04,10,08,01,05,06');
INSERT INTO ac_data_pk10bj VALUES ('17705', '1527927884', '685267', '07,02,08,09,05,01,03,04,06,10');
INSERT INTO ac_data_pk10bj VALUES ('17724', '1527928175', '685268', '10,05,01,04,08,03,02,07,09,06');
INSERT INTO ac_data_pk10bj VALUES ('17744', '1527928478', '685269', '09,02,04,01,10,05,08,03,07,06');
INSERT INTO ac_data_pk10bj VALUES ('17764', '1527928781', '685270', '02,04,10,01,08,03,06,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('17783', '1527929076', '685271', '01,04,02,03,05,10,09,08,07,06');
INSERT INTO ac_data_pk10bj VALUES ('17803', '1527929374', '685272', '03,02,06,10,05,04,08,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('17823', '1527929680', '685273', '10,05,02,09,04,07,03,08,06,01');
INSERT INTO ac_data_pk10bj VALUES ('17842', '1527929979', '685274', '06,02,09,10,03,08,07,05,04,01');
INSERT INTO ac_data_pk10bj VALUES ('17862', '1527930283', '685275', '05,09,10,02,03,01,07,08,06,04');
INSERT INTO ac_data_pk10bj VALUES ('17882', '1527930572', '685276', '01,06,03,02,04,05,10,08,07,09');
INSERT INTO ac_data_pk10bj VALUES ('17902', '1527930878', '685277', '01,08,09,07,10,05,02,06,04,03');
INSERT INTO ac_data_pk10bj VALUES ('17922', '1527931181', '685278', '04,01,09,06,02,10,08,05,07,03');
INSERT INTO ac_data_pk10bj VALUES ('17942', '1527931484', '685279', '04,10,09,03,07,01,06,02,05,08');
INSERT INTO ac_data_pk10bj VALUES ('17961', '1527931772', '685280', '06,04,08,05,02,03,07,09,10,01');
INSERT INTO ac_data_pk10bj VALUES ('17981', '1527932073', '685281', '10,07,04,01,06,08,09,05,02,03');
INSERT INTO ac_data_pk10bj VALUES ('18001', '1527932376', '685282', '02,04,08,10,07,06,01,03,09,05');
INSERT INTO ac_data_pk10bj VALUES ('18021', '1527932679', '685283', '10,07,09,04,02,08,01,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('18040', '1527932966', '685284', '01,07,09,06,10,02,04,08,05,03');
INSERT INTO ac_data_pk10bj VALUES ('18061', '1527933284', '685285', '07,03,09,01,04,05,06,08,10,02');
INSERT INTO ac_data_pk10bj VALUES ('18081', '1527933574', '685286', '01,08,07,06,03,04,09,05,02,10');
INSERT INTO ac_data_pk10bj VALUES ('18101', '1527933883', '685287', '10,05,01,09,04,07,03,06,08,02');
INSERT INTO ac_data_pk10bj VALUES ('18121', '1527934187', '685288', '02,05,06,04,08,03,09,10,01,07');
INSERT INTO ac_data_pk10bj VALUES ('18140', '1527934474', '685289', '03,04,10,05,09,02,06,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('18160', '1527934778', '685290', '07,09,08,01,10,05,02,06,04,03');
INSERT INTO ac_data_pk10bj VALUES ('18180', '1527935075', '685291', '08,07,01,02,09,06,04,10,05,03');
INSERT INTO ac_data_pk10bj VALUES ('18200', '1527935378', '685292', '05,06,04,08,10,07,09,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('18220', '1527935684', '685293', '10,04,06,02,05,07,03,08,09,01');
INSERT INTO ac_data_pk10bj VALUES ('18240', '1527935987', '685294', '09,03,08,01,10,04,05,07,06,02');
INSERT INTO ac_data_pk10bj VALUES ('18259', '1527936275', '685295', '09,01,06,03,04,07,05,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('18279', '1527936580', '685296', '01,10,07,08,03,04,09,05,02,06');
INSERT INTO ac_data_pk10bj VALUES ('18299', '1527936882', '685297', '10,05,02,04,09,03,01,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('18318', '1527937170', '685298', '01,04,08,06,09,05,03,02,07,10');
INSERT INTO ac_data_pk10bj VALUES ('18338', '1527937477', '685299', '10,08,01,07,04,06,03,05,09,02');
INSERT INTO ac_data_pk10bj VALUES ('18358', '1527937774', '685300', '03,02,07,09,08,04,06,10,01,05');
INSERT INTO ac_data_pk10bj VALUES ('18378', '1527938078', '685301', '06,07,02,01,04,03,08,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('18398', '1527938381', '685302', '09,03,04,10,06,07,08,02,05,01');
INSERT INTO ac_data_pk10bj VALUES ('18417', '1527938669', '685303', '09,05,03,01,07,04,02,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('18437', '1527938974', '685304', '06,04,05,02,07,01,10,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('18457', '1527939275', '685305', '10,03,09,06,04,05,07,02,08,01');
INSERT INTO ac_data_pk10bj VALUES ('18477', '1527939580', '685306', '01,08,04,09,07,05,10,03,02,06');
INSERT INTO ac_data_pk10bj VALUES ('18496', '1527939867', '685307', '04,08,05,10,02,01,07,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('18516', '1527940170', '685308', '06,05,03,08,10,02,04,09,07,01');
INSERT INTO ac_data_pk10bj VALUES ('18536', '1527940472', '685309', '04,02,07,05,03,10,06,01,08,09');
INSERT INTO ac_data_pk10bj VALUES ('18556', '1527940775', '685310', '01,06,08,07,03,09,10,04,02,05');
INSERT INTO ac_data_pk10bj VALUES ('18576', '1527941080', '685311', '05,07,10,03,02,06,04,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('18596', '1527941382', '685312', '06,01,07,09,03,04,08,05,10,02');
INSERT INTO ac_data_pk10bj VALUES ('18615', '1527941672', '685313', '01,05,07,04,02,06,10,09,08,03');
INSERT INTO ac_data_pk10bj VALUES ('18635', '1527941976', '685314', '01,10,09,05,06,08,02,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('18655', '1527942281', '685315', '01,02,06,03,07,09,10,08,05,04');
INSERT INTO ac_data_pk10bj VALUES ('18674', '1527942568', '685316', '02,03,08,04,01,05,09,10,06,07');
INSERT INTO ac_data_pk10bj VALUES ('18683', '1527942876', '685317', '06,01,09,05,04,08,10,03,07,02');
INSERT INTO ac_data_pk10bj VALUES ('18702', '1527943180', '685318', '02,05,06,07,08,10,03,09,04,01');
INSERT INTO ac_data_pk10bj VALUES ('18710', '1527943495', '685319', '04,07,01,08,06,05,09,03,10,02');
INSERT INTO ac_data_pk10bj VALUES ('18725', '1527943781', '685320', '07,05,04,03,02,09,08,06,10,01');
INSERT INTO ac_data_pk10bj VALUES ('18745', '1527944084', '685321', '07,02,05,08,09,04,06,01,10,03');
INSERT INTO ac_data_pk10bj VALUES ('18764', '1527944373', '685322', '04,05,03,06,01,09,08,07,02,10');
INSERT INTO ac_data_pk10bj VALUES ('18784', '1527944678', '685323', '01,10,08,05,03,07,09,04,02,06');
INSERT INTO ac_data_pk10bj VALUES ('18804', '1527944975', '685324', '04,06,09,10,08,01,03,05,02,07');
INSERT INTO ac_data_pk10bj VALUES ('18824', '1527945278', '685325', '03,10,04,06,01,02,07,09,05,08');
INSERT INTO ac_data_pk10bj VALUES ('18844', '1527945582', '685326', '06,05,04,08,09,03,07,10,01,02');
INSERT INTO ac_data_pk10bj VALUES ('18864', '1527945884', '685327', '07,09,06,02,03,04,10,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('18884', '1527946188', '685328', '01,02,04,05,10,09,06,07,08,03');
INSERT INTO ac_data_pk10bj VALUES ('18903', '1527946476', '685329', '07,05,10,02,06,08,03,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('18923', '1527946780', '685330', '04,09,03,01,02,06,08,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('18943', '1527947083', '685331', '03,10,08,01,02,04,06,09,05,07');
INSERT INTO ac_data_pk10bj VALUES ('18963', '1527947386', '685332', '04,10,02,09,01,07,03,08,06,05');
INSERT INTO ac_data_pk10bj VALUES ('18982', '1527947673', '685333', '07,04,02,01,03,09,10,05,06,08');
INSERT INTO ac_data_pk10bj VALUES ('19002', '1527947978', '685334', '07,02,09,10,05,03,04,01,06,08');
INSERT INTO ac_data_pk10bj VALUES ('19022', '1527948280', '685335', '05,03,06,08,09,04,02,10,07,01');
INSERT INTO ac_data_pk10bj VALUES ('19041', '1527948570', '685336', '02,05,10,06,09,08,03,04,01,07');
INSERT INTO ac_data_pk10bj VALUES ('19061', '1527948873', '685337', '10,07,04,02,09,03,05,06,01,08');
INSERT INTO ac_data_pk10bj VALUES ('19081', '1527949182', '685338', '04,03,06,09,05,10,07,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('19101', '1527949477', '685339', '05,04,03,01,07,06,08,02,10,09');
INSERT INTO ac_data_pk10bj VALUES ('19121', '1527949780', '685340', '10,06,03,01,05,07,04,09,02,08');
INSERT INTO ac_data_pk10bj VALUES ('19140', '1527950070', '685341', '04,01,08,06,02,05,09,10,03,07');
INSERT INTO ac_data_pk10bj VALUES ('19160', '1527950373', '685342', '01,07,03,05,02,10,08,09,04,06');
INSERT INTO ac_data_pk10bj VALUES ('19180', '1527950676', '685343', '07,02,10,03,01,08,05,09,06,04');
INSERT INTO ac_data_pk10bj VALUES ('19199', '1527950979', '685344', '10,03,05,07,01,08,04,06,09,02');
INSERT INTO ac_data_pk10bj VALUES ('19219', '1527951282', '685345', '06,08,07,09,01,02,03,10,04,05');
INSERT INTO ac_data_pk10bj VALUES ('19239', '1527951587', '685346', '08,01,02,06,04,09,07,10,03,05');
INSERT INTO ac_data_pk10bj VALUES ('19258', '1527951874', '685347', '08,03,07,06,05,01,10,04,02,09');
INSERT INTO ac_data_pk10bj VALUES ('19277', '1527952176', '685348', '09,05,01,10,06,02,07,08,03,04');
INSERT INTO ac_data_pk10bj VALUES ('19288', '1527989892', '685364', '08,04,03,09,05,10,06,01,07,02');
INSERT INTO ac_data_pk10bj VALUES ('19293', '1527989973', '685365', '03,08,06,01,04,10,07,05,02,09');
INSERT INTO ac_data_pk10bj VALUES ('19313', '1527990276', '685366', '04,08,06,03,01,07,05,02,09,10');
INSERT INTO ac_data_pk10bj VALUES ('19333', '1527990582', '685367', '04,06,01,03,05,10,09,07,08,02');
INSERT INTO ac_data_pk10bj VALUES ('19352', '1527990869', '685368', '05,08,02,10,06,09,01,04,03,07');
INSERT INTO ac_data_pk10bj VALUES ('19372', '1527991174', '685369', '07,09,05,04,03,06,10,02,08,01');
INSERT INTO ac_data_pk10bj VALUES ('19393', '1527991484', '685370', '04,09,07,10,06,02,03,05,01,08');
INSERT INTO ac_data_pk10bj VALUES ('19412', '1527991772', '685371', '02,03,06,09,04,01,08,10,05,07');
INSERT INTO ac_data_pk10bj VALUES ('19432', '1527992075', '685372', '04,08,10,02,01,03,07,06,05,09');
INSERT INTO ac_data_pk10bj VALUES ('19452', '1527992378', '685373', '07,03,05,02,06,09,10,01,08,04');
INSERT INTO ac_data_pk10bj VALUES ('19472', '1527992682', '685374', '01,08,05,06,09,10,04,03,02,07');
INSERT INTO ac_data_pk10bj VALUES ('19492', '1527992970', '685375', '06,08,04,02,01,05,03,07,09,10');
INSERT INTO ac_data_pk10bj VALUES ('19512', '1527993275', '685376', '01,09,06,04,02,05,07,10,03,08');
INSERT INTO ac_data_pk10bj VALUES ('19531', '1527993566', '685377', '08,07,01,10,09,06,03,05,02,04');
INSERT INTO ac_data_pk10bj VALUES ('19552', '1527993884', '685378', '07,04,02,06,05,03,10,01,09,08');
INSERT INTO ac_data_pk10bj VALUES ('19571', '1527994174', '685379', '05,09,03,08,07,01,06,02,04,10');
INSERT INTO ac_data_pk10bj VALUES ('19591', '1527994470', '685380', '09,05,10,02,08,07,06,03,04,01');
INSERT INTO ac_data_pk10bj VALUES ('19611', '1527994775', '685381', '03,08,01,05,10,02,07,09,06,04');
INSERT INTO ac_data_pk10bj VALUES ('19631', '1527995078', '685382', '06,01,08,04,07,10,05,09,02,03');
INSERT INTO ac_data_pk10bj VALUES ('19651', '1527995382', '685383', '07,02,10,03,09,01,05,08,06,04');
INSERT INTO ac_data_pk10bj VALUES ('19670', '1527995669', '685384', '04,02,08,01,09,03,06,07,05,10');
INSERT INTO ac_data_pk10bj VALUES ('19690', '1527995972', '685385', '08,10,02,04,01,07,05,09,06,03');
INSERT INTO ac_data_pk10bj VALUES ('19710', '1527996279', '685386', '06,07,10,08,01,05,09,02,03,04');
INSERT INTO ac_data_pk10bj VALUES ('19729', '1527996574', '685387', '03,04,08,09,05,02,06,07,10,01');
INSERT INTO ac_data_pk10bj VALUES ('19749', '1527996878', '685388', '03,02,05,09,10,01,06,04,07,08');
INSERT INTO ac_data_pk10bj VALUES ('19768', '1527997169', '685389', '04,01,06,07,03,02,08,09,05,10');
INSERT INTO ac_data_pk10bj VALUES ('19788', '1527997472', '685390', '06,09,08,01,04,03,02,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('19808', '1527997776', '685391', '10,06,09,05,03,04,02,08,07,01');
INSERT INTO ac_data_pk10bj VALUES ('19828', '1527998079', '685392', '05,03,06,02,01,04,07,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('19848', '1527998382', '685393', '06,03,04,09,08,07,05,10,02,01');
INSERT INTO ac_data_pk10bj VALUES ('19866', '1527998670', '685394', '02,10,06,09,03,05,04,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('19886', '1527998973', '685395', '10,04,01,05,09,03,08,02,07,06');
INSERT INTO ac_data_pk10bj VALUES ('19906', '1527999279', '685396', '02,03,08,06,05,01,10,04,07,09');
INSERT INTO ac_data_pk10bj VALUES ('19926', '1527999583', '685397', '10,03,08,04,09,06,05,02,07,01');
INSERT INTO ac_data_pk10bj VALUES ('19945', '1527999870', '685398', '02,03,07,09,06,01,05,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('19965', '1528000174', '685399', '06,03,01,10,05,04,07,02,08,09');
INSERT INTO ac_data_pk10bj VALUES ('19985', '1528000480', '685400', '03,04,10,01,06,07,02,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('20004', '1528000770', '685401', '03,06,08,04,05,10,01,09,02,07');
INSERT INTO ac_data_pk10bj VALUES ('20024', '1528001077', '685402', '01,02,10,04,09,08,05,06,07,03');
INSERT INTO ac_data_pk10bj VALUES ('20043', '1528001380', '685403', '02,01,05,10,09,08,07,04,03,06');
INSERT INTO ac_data_pk10bj VALUES ('20063', '1528001682', '685404', '03,07,09,08,06,02,10,04,05,01');
INSERT INTO ac_data_pk10bj VALUES ('20083', '1528001985', '685405', '08,06,01,07,02,10,05,04,03,09');
INSERT INTO ac_data_pk10bj VALUES ('20102', '1528002273', '685406', '02,08,01,05,04,07,10,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('20122', '1528002576', '685407', '08,02,09,07,03,10,01,04,06,05');
INSERT INTO ac_data_pk10bj VALUES ('20142', '1528002870', '685408', '07,01,08,04,03,06,10,05,02,09');
INSERT INTO ac_data_pk10bj VALUES ('20162', '1528003173', '685409', '05,04,09,01,06,03,07,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('20182', '1528003478', '685410', '07,06,04,08,03,02,09,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('20202', '1528003781', '685411', '02,08,06,03,07,05,10,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('20221', '1528004069', '685412', '03,04,10,08,02,05,07,01,06,09');
INSERT INTO ac_data_pk10bj VALUES ('20242', '1528004387', '685413', '02,05,03,07,09,06,10,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('20261', '1528004676', '685414', '04,02,05,03,10,07,08,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('20281', '1528004979', '685415', '01,09,08,03,04,10,07,05,02,06');
INSERT INTO ac_data_pk10bj VALUES ('20301', '1528005282', '685416', '06,05,04,01,07,08,02,03,09,10');
INSERT INTO ac_data_pk10bj VALUES ('20320', '1528005570', '685417', '09,07,03,08,10,02,01,04,06,05');
INSERT INTO ac_data_pk10bj VALUES ('20340', '1528005871', '685418', '02,04,05,09,07,03,08,01,06,10');
INSERT INTO ac_data_pk10bj VALUES ('20360', '1528006177', '685419', '09,02,08,06,04,10,03,05,01,07');
INSERT INTO ac_data_pk10bj VALUES ('20380', '1528006480', '685420', '08,06,03,05,04,09,07,01,02,10');
INSERT INTO ac_data_pk10bj VALUES ('20399', '1528006773', '685421', '08,01,10,02,04,07,06,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('20419', '1528007079', '685422', '08,07,09,04,06,01,05,02,10,03');
INSERT INTO ac_data_pk10bj VALUES ('20439', '1528007376', '685423', '01,02,04,10,08,03,07,06,05,09');
INSERT INTO ac_data_pk10bj VALUES ('20458', '1528007675', '685424', '02,05,03,06,08,07,09,10,04,01');
INSERT INTO ac_data_pk10bj VALUES ('20478', '1528007979', '685425', '06,07,04,05,01,10,09,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('20497', '1528008269', '685426', '09,04,07,02,06,10,03,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('20517', '1528008572', '685427', '01,09,05,04,02,07,03,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('20537', '1528008874', '685428', '04,06,05,02,08,07,03,10,09,01');
INSERT INTO ac_data_pk10bj VALUES ('20556', '1528009168', '685429', '03,05,08,04,02,10,09,07,06,01');
INSERT INTO ac_data_pk10bj VALUES ('20576', '1528009474', '685430', '02,10,04,09,06,01,05,03,08,07');
INSERT INTO ac_data_pk10bj VALUES ('20596', '1528009777', '685431', '04,07,05,03,09,08,02,06,01,10');
INSERT INTO ac_data_pk10bj VALUES ('20616', '1528010071', '685432', '09,07,08,02,06,04,05,01,10,03');
INSERT INTO ac_data_pk10bj VALUES ('20636', '1528010376', '685433', '03,02,05,07,01,09,04,10,08,06');
INSERT INTO ac_data_pk10bj VALUES ('20655', '1528010665', '685434', '08,07,05,10,04,06,09,03,01,02');
INSERT INTO ac_data_pk10bj VALUES ('20675', '1528010969', '685435', '03,06,08,10,07,05,01,04,09,02');
INSERT INTO ac_data_pk10bj VALUES ('20695', '1528011275', '685436', '05,09,06,01,02,08,03,07,10,04');
INSERT INTO ac_data_pk10bj VALUES ('20715', '1528011573', '685437', '06,02,03,10,01,07,09,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('20735', '1528011876', '685438', '04,03,10,07,01,05,02,06,08,09');
INSERT INTO ac_data_pk10bj VALUES ('20754', '1528012168', '685439', '06,02,08,07,01,03,04,05,10,09');
INSERT INTO ac_data_pk10bj VALUES ('20774', '1528012471', '685440', '03,04,02,05,10,06,09,07,01,08');
INSERT INTO ac_data_pk10bj VALUES ('20794', '1528012774', '685441', '09,02,10,04,06,08,07,05,01,03');
INSERT INTO ac_data_pk10bj VALUES ('20814', '1528013075', '685442', '02,08,10,04,03,01,07,06,05,09');
INSERT INTO ac_data_pk10bj VALUES ('20833', '1528013368', '685443', '05,10,07,08,04,06,01,09,02,03');
INSERT INTO ac_data_pk10bj VALUES ('20853', '1528013672', '685444', '03,10,04,09,01,02,06,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('20873', '1528013976', '685445', '06,07,09,01,04,10,08,02,05,03');
INSERT INTO ac_data_pk10bj VALUES ('20893', '1528014279', '685446', '01,07,05,10,03,04,02,08,09,06');
INSERT INTO ac_data_pk10bj VALUES ('20913', '1528014575', '685447', '06,07,01,03,09,08,05,10,04,02');
INSERT INTO ac_data_pk10bj VALUES ('20933', '1528014877', '685448', '02,04,07,08,03,01,10,09,05,06');
INSERT INTO ac_data_pk10bj VALUES ('20953', '1528015180', '685449', '01,06,05,03,10,07,02,08,09,04');
INSERT INTO ac_data_pk10bj VALUES ('20973', '1528015483', '685450', '07,08,03,04,01,06,02,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('20992', '1528015770', '685451', '03,08,04,01,10,06,05,07,02,09');
INSERT INTO ac_data_pk10bj VALUES ('21013', '1528016076', '685452', '03,04,10,01,08,07,09,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('21033', '1528016378', '685453', '05,03,06,01,08,02,07,10,04,09');
INSERT INTO ac_data_pk10bj VALUES ('21053', '1528016682', '685454', '04,09,07,03,06,08,05,02,01,10');
INSERT INTO ac_data_pk10bj VALUES ('21072', '1528016969', '685455', '06,02,10,04,01,08,05,03,09,07');
INSERT INTO ac_data_pk10bj VALUES ('21092', '1528017277', '685456', '07,05,08,09,02,03,06,10,01,04');
INSERT INTO ac_data_pk10bj VALUES ('21111', '1528017570', '685457', '01,05,09,02,06,03,07,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('21130', '1528017878', '685458', '05,09,10,04,02,07,03,06,01,08');
INSERT INTO ac_data_pk10bj VALUES ('21149', '1528018165', '685459', '04,02,03,05,06,10,01,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('21169', '1528018468', '685460', '02,09,01,08,10,05,04,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('21190', '1528018773', '685461', '09,06,04,10,05,07,03,02,01,08');
INSERT INTO ac_data_pk10bj VALUES ('21210', '1528019080', '685462', '01,10,02,07,04,06,03,09,05,08');
INSERT INTO ac_data_pk10bj VALUES ('21229', '1528019370', '685463', '10,08,09,07,01,04,06,02,05,03');
INSERT INTO ac_data_pk10bj VALUES ('21249', '1528019674', '685464', '10,09,03,04,02,08,01,05,06,07');
INSERT INTO ac_data_pk10bj VALUES ('21269', '1528019977', '685465', '02,10,08,07,04,06,01,09,03,05');
INSERT INTO ac_data_pk10bj VALUES ('21289', '1528020274', '685466', '03,09,05,01,04,02,08,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('21309', '1528020581', '685467', '09,05,10,08,02,06,04,01,03,07');
INSERT INTO ac_data_pk10bj VALUES ('21329', '1528020884', '685468', '05,03,07,08,01,04,02,06,10,09');
INSERT INTO ac_data_pk10bj VALUES ('21348', '1528021171', '685469', '06,01,02,03,04,09,07,10,05,08');
INSERT INTO ac_data_pk10bj VALUES ('21368', '1528021481', '685470', '10,08,04,01,05,09,02,03,07,06');
INSERT INTO ac_data_pk10bj VALUES ('21388', '1528021775', '685471', '08,05,03,07,10,02,01,06,04,09');
INSERT INTO ac_data_pk10bj VALUES ('21408', '1528022077', '685472', '04,02,01,07,08,03,09,10,05,06');
INSERT INTO ac_data_pk10bj VALUES ('21428', '1528022380', '685473', '08,06,05,07,02,09,04,01,10,03');
INSERT INTO ac_data_pk10bj VALUES ('21443', '1528022673', '685474', '05,01,06,10,08,04,03,07,09,02');
INSERT INTO ac_data_pk10bj VALUES ('21463', '1528022978', '685475', '08,05,02,10,01,04,09,06,03,07');
INSERT INTO ac_data_pk10bj VALUES ('21483', '1528023284', '685476', '08,04,02,10,06,07,05,03,01,09');
INSERT INTO ac_data_pk10bj VALUES ('21502', '1528023576', '685477', '05,03,01,10,06,04,08,02,09,07');
INSERT INTO ac_data_pk10bj VALUES ('21522', '1528023882', '685478', '01,10,02,08,05,03,04,07,06,09');
INSERT INTO ac_data_pk10bj VALUES ('21541', '1528024173', '685479', '05,07,01,10,06,08,09,04,03,02');
INSERT INTO ac_data_pk10bj VALUES ('21561', '1528024474', '685480', '06,02,04,10,08,07,09,01,03,05');
INSERT INTO ac_data_pk10bj VALUES ('21578', '1528024782', '685481', '06,05,04,01,07,02,08,03,10,09');
INSERT INTO ac_data_pk10bj VALUES ('21597', '1528025071', '685482', '02,03,08,04,06,05,01,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('21617', '1528025374', '685483', '09,06,04,07,01,05,08,02,10,03');
INSERT INTO ac_data_pk10bj VALUES ('21637', '1528025680', '685484', '08,04,05,06,03,09,01,07,02,10');
INSERT INTO ac_data_pk10bj VALUES ('21657', '1528025974', '685485', '02,05,03,09,06,10,01,08,07,04');
INSERT INTO ac_data_pk10bj VALUES ('21677', '1528026277', '685486', '08,02,07,04,03,01,05,10,09,06');
INSERT INTO ac_data_pk10bj VALUES ('21697', '1528026579', '685487', '03,07,06,01,08,10,05,09,02,04');
INSERT INTO ac_data_pk10bj VALUES ('21717', '1528026883', '685488', '07,05,08,04,09,06,01,02,03,10');
INSERT INTO ac_data_pk10bj VALUES ('21736', '1528027172', '685489', '08,09,01,05,10,06,03,04,02,07');
INSERT INTO ac_data_pk10bj VALUES ('21756', '1528027475', '685490', '10,03,01,08,04,09,05,02,07,06');
INSERT INTO ac_data_pk10bj VALUES ('21776', '1528027779', '685491', '04,09,02,08,10,06,01,07,03,05');
INSERT INTO ac_data_pk10bj VALUES ('21795', '1528028066', '685492', '05,08,10,02,06,03,04,09,01,07');
INSERT INTO ac_data_pk10bj VALUES ('21815', '1528028369', '685493', '08,01,04,10,07,06,05,09,03,02');
INSERT INTO ac_data_pk10bj VALUES ('21834', '1528028672', '685494', '05,01,08,03,09,04,10,07,06,02');
INSERT INTO ac_data_pk10bj VALUES ('21855', '1528028977', '685495', '09,10,03,08,06,04,07,05,02,01');
INSERT INTO ac_data_pk10bj VALUES ('21874', '1528029270', '685496', '04,10,08,07,02,01,03,05,06,09');
INSERT INTO ac_data_pk10bj VALUES ('21894', '1528029574', '685497', '10,07,06,08,09,05,01,04,03,02');
INSERT INTO ac_data_pk10bj VALUES ('21914', '1528029876', '685498', '09,01,04,03,10,02,05,07,08,06');
INSERT INTO ac_data_pk10bj VALUES ('21934', '1528030180', '685499', '02,03,09,07,05,01,10,06,04,08');
INSERT INTO ac_data_pk10bj VALUES ('21954', '1528030478', '685500', '04,01,09,08,10,05,06,03,02,07');
INSERT INTO ac_data_pk10bj VALUES ('21974', '1528030780', '685501', '06,01,08,05,03,07,04,10,02,09');
INSERT INTO ac_data_pk10bj VALUES ('21993', '1528031070', '685502', '05,10,08,04,07,02,06,09,01,03');
INSERT INTO ac_data_pk10bj VALUES ('22013', '1528031374', '685503', '02,03,09,06,08,01,07,05,04,10');
INSERT INTO ac_data_pk10bj VALUES ('22033', '1528031675', '685504', '07,08,03,06,04,05,01,10,09,02');
INSERT INTO ac_data_pk10bj VALUES ('22046', '1528042881', '685536', '04,03,10,09,07,08,02,06,01,05');
INSERT INTO ac_data_pk10bj VALUES ('22049', '1528074968', '685539', '06,03,10,09,07,02,01,05,04,08');
INSERT INTO ac_data_pk10bj VALUES ('22062', '1528075165', '685540', '09,02,03,06,04,05,07,10,01,08');
INSERT INTO ac_data_pk10bj VALUES ('22082', '1528075468', '685541', '09,03,02,07,10,05,01,06,04,08');
INSERT INTO ac_data_pk10bj VALUES ('22102', '1528075772', '685542', '04,10,09,05,06,02,07,08,03,01');
INSERT INTO ac_data_pk10bj VALUES ('22122', '1528076075', '685543', '08,05,02,10,03,09,06,04,07,01');
INSERT INTO ac_data_pk10bj VALUES ('22141', '1528076364', '685544', '03,10,02,09,01,04,05,06,07,08');
INSERT INTO ac_data_pk10bj VALUES ('22161', '1528076667', '685545', '01,06,07,09,04,05,10,08,03,02');
INSERT INTO ac_data_pk10bj VALUES ('22181', '1528076970', '685546', '09,06,03,04,10,01,08,05,02,07');
INSERT INTO ac_data_pk10bj VALUES ('22201', '1528077272', '685547', '04,01,03,10,06,09,02,07,05,08');
INSERT INTO ac_data_pk10bj VALUES ('22220', '1528077571', '685548', '01,07,03,04,06,05,09,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('22241', '1528077879', '685549', '06,10,03,05,01,09,08,07,04,02');
INSERT INTO ac_data_pk10bj VALUES ('22260', '1528078172', '685550', '02,08,03,05,04,10,06,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('22280', '1528078476', '685551', '10,04,03,05,08,06,02,09,07,01');
INSERT INTO ac_data_pk10bj VALUES ('22300', '1528078779', '685552', '02,04,06,10,07,01,05,08,03,09');
INSERT INTO ac_data_pk10bj VALUES ('22319', '1528079067', '685553', '06,05,09,03,10,04,08,02,07,01');
INSERT INTO ac_data_pk10bj VALUES ('22339', '1528079381', '685554', '06,05,08,09,07,01,10,04,02,03');
INSERT INTO ac_data_pk10bj VALUES ('22340', '1529827658', '689201', '08,01,02,05,09,07,06,03,04,10');
INSERT INTO ac_data_pk10bj VALUES ('22342', '1529827689', '689202', '03,07,04,05,06,02,08,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('22362', '1529827993', '689203', '08,10,06,03,02,07,04,01,09,05');
INSERT INTO ac_data_pk10bj VALUES ('22382', '1529828298', '689204', '04,10,08,07,05,02,01,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('22402', '1529828601', '689205', '07,06,03,05,01,08,02,10,09,04');
INSERT INTO ac_data_pk10bj VALUES ('22421', '1529828890', '689206', '10,07,06,05,08,03,01,09,02,04');
INSERT INTO ac_data_pk10bj VALUES ('22441', '1529829190', '689207', '05,02,06,08,01,10,04,07,09,03');
INSERT INTO ac_data_pk10bj VALUES ('22461', '1529829494', '689208', '10,02,05,07,08,01,04,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('22481', '1529829797', '689209', '08,03,01,02,09,07,06,10,05,04');
INSERT INTO ac_data_pk10bj VALUES ('22501', '1529830101', '689210', '10,07,05,06,09,02,03,04,08,01');
INSERT INTO ac_data_pk10bj VALUES ('22520', '1529830390', '689211', '01,04,06,03,09,07,05,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('22540', '1529830695', '689212', '07,06,04,05,09,02,10,01,03,08');
INSERT INTO ac_data_pk10bj VALUES ('22560', '1529830999', '689213', '04,01,02,07,06,05,10,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('22580', '1529831304', '689214', '09,10,03,08,06,02,07,05,04,01');
INSERT INTO ac_data_pk10bj VALUES ('22599', '1529831594', '689215', '08,02,09,06,01,05,03,10,07,04');
INSERT INTO ac_data_pk10bj VALUES ('22619', '1529831898', '689216', '07,05,08,01,04,06,02,03,09,10');
INSERT INTO ac_data_pk10bj VALUES ('22639', '1529832191', '689217', '07,04,09,05,10,01,06,02,03,08');
INSERT INTO ac_data_pk10bj VALUES ('22659', '1529832499', '689218', '06,04,03,07,09,05,01,02,10,08');
INSERT INTO ac_data_pk10bj VALUES ('22679', '1529832802', '689219', '03,10,01,07,04,08,02,06,09,05');
INSERT INTO ac_data_pk10bj VALUES ('22699', '1529833105', '689220', '02,09,06,10,05,01,04,08,03,07');
INSERT INTO ac_data_pk10bj VALUES ('22718', '1529833397', '689221', '02,06,05,08,09,07,04,01,03,10');
INSERT INTO ac_data_pk10bj VALUES ('22738', '1529833692', '689222', '08,07,06,09,03,01,10,02,04,05');
INSERT INTO ac_data_pk10bj VALUES ('22758', '1529833997', '689223', '02,10,04,03,08,06,09,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('22777', '1529834289', '689224', '07,03,10,05,01,09,02,06,08,04');
INSERT INTO ac_data_pk10bj VALUES ('22797', '1529834595', '689225', '03,10,09,08,07,06,05,02,04,01');
INSERT INTO ac_data_pk10bj VALUES ('22817', '1529834891', '689226', '01,03,08,02,04,05,06,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('22837', '1529835196', '689227', '02,04,07,03,08,06,05,10,09,01');
INSERT INTO ac_data_pk10bj VALUES ('22856', '1529835488', '689228', '02,04,01,06,08,03,10,09,05,07');
INSERT INTO ac_data_pk10bj VALUES ('22876', '1529835792', '689229', '10,02,03,09,04,07,05,01,08,06');
INSERT INTO ac_data_pk10bj VALUES ('22896', '1529836095', '689230', '10,01,09,08,04,07,03,05,02,06');
INSERT INTO ac_data_pk10bj VALUES ('22916', '1529836395', '689231', '05,04,06,10,02,01,09,07,08,03');
INSERT INTO ac_data_pk10bj VALUES ('22936', '1529836702', '689232', '05,03,10,01,07,02,06,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('22955', '1529836990', '689233', '05,02,01,08,06,10,07,03,04,09');
INSERT INTO ac_data_pk10bj VALUES ('22975', '1529837297', '689234', '07,10,05,01,03,06,04,02,08,09');
INSERT INTO ac_data_pk10bj VALUES ('22995', '1529837599', '689235', '03,09,07,05,08,01,10,06,04,02');
INSERT INTO ac_data_pk10bj VALUES ('23015', '1529837894', '689236', '10,05,06,08,09,07,03,02,01,04');
INSERT INTO ac_data_pk10bj VALUES ('23035', '1529838197', '689237', '03,05,08,09,07,02,10,04,01,06');
INSERT INTO ac_data_pk10bj VALUES ('23055', '1529838501', '689238', '09,05,07,03,02,06,01,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('23075', '1529838804', '689239', '05,08,09,01,06,03,04,10,02,07');
INSERT INTO ac_data_pk10bj VALUES ('23094', '1529839092', '689240', '06,08,04,10,07,09,01,05,02,03');
INSERT INTO ac_data_pk10bj VALUES ('23114', '1529839393', '689241', '03,01,06,05,04,09,07,02,10,08');
INSERT INTO ac_data_pk10bj VALUES ('23134', '1529839695', '689242', '04,07,06,08,10,09,05,02,01,03');
INSERT INTO ac_data_pk10bj VALUES ('23154', '1529840000', '689243', '05,04,10,07,06,03,02,01,09,08');
INSERT INTO ac_data_pk10bj VALUES ('23173', '1529840288', '689244', '07,03,09,08,04,05,06,02,01,10');
INSERT INTO ac_data_pk10bj VALUES ('23193', '1529840591', '689245', '10,05,09,07,08,02,03,01,06,04');
INSERT INTO ac_data_pk10bj VALUES ('23212', '1529840887', '689246', '04,10,01,07,05,09,06,03,08,02');
INSERT INTO ac_data_pk10bj VALUES ('23232', '1529841189', '689247', '03,06,08,01,04,07,02,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('23252', '1529841494', '689248', '05,09,06,08,03,10,04,01,07,02');
INSERT INTO ac_data_pk10bj VALUES ('23272', '1529841797', '689249', '10,05,01,08,04,07,06,02,03,09');
INSERT INTO ac_data_pk10bj VALUES ('23292', '1529842092', '689250', '09,03,01,02,10,05,08,07,06,04');
INSERT INTO ac_data_pk10bj VALUES ('23312', '1529842395', '689251', '02,04,10,09,08,06,01,07,05,03');
INSERT INTO ac_data_pk10bj VALUES ('23332', '1529842698', '689252', '06,07,08,09,05,03,04,10,01,02');
INSERT INTO ac_data_pk10bj VALUES ('23352', '1529843001', '689253', '09,04,02,07,01,06,05,10,08,03');
INSERT INTO ac_data_pk10bj VALUES ('23371', '1529843290', '689254', '08,04,02,01,07,03,10,06,09,05');
INSERT INTO ac_data_pk10bj VALUES ('23391', '1529843593', '689255', '04,06,03,10,07,09,08,01,02,05');
INSERT INTO ac_data_pk10bj VALUES ('23411', '1529843897', '689256', '09,10,02,06,07,04,08,03,05,01');
INSERT INTO ac_data_pk10bj VALUES ('23431', '1529844199', '689257', '02,06,05,08,04,07,01,03,10,09');
INSERT INTO ac_data_pk10bj VALUES ('23451', '1529844502', '689258', '06,08,02,07,04,10,05,09,03,01');
INSERT INTO ac_data_pk10bj VALUES ('23470', '1529844791', '689259', '09,06,03,01,05,04,08,10,07,02');
INSERT INTO ac_data_pk10bj VALUES ('23491', '1529845094', '689260', '06,09,08,10,02,01,03,04,05,07');
INSERT INTO ac_data_pk10bj VALUES ('23511', '1529845397', '689261', '04,02,08,07,01,10,06,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('23531', '1529845700', '689262', '10,03,01,06,05,02,04,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('23550', '1529845988', '689263', '06,04,08,09,07,10,02,05,03,01');
INSERT INTO ac_data_pk10bj VALUES ('23570', '1529846292', '689264', '08,02,07,05,04,06,03,10,01,09');
INSERT INTO ac_data_pk10bj VALUES ('23591', '1529846596', '689265', '10,05,09,02,08,07,06,01,03,04');
INSERT INTO ac_data_pk10bj VALUES ('23611', '1529846901', '689266', '07,03,06,01,09,02,10,08,05,04');
INSERT INTO ac_data_pk10bj VALUES ('23630', '1529847191', '689267', '07,03,01,09,08,10,06,05,04,02');
INSERT INTO ac_data_pk10bj VALUES ('23650', '1529847494', '689268', '01,07,03,09,10,05,02,06,04,08');
INSERT INTO ac_data_pk10bj VALUES ('23670', '1529847797', '689269', '09,01,07,05,10,03,08,04,02,06');
INSERT INTO ac_data_pk10bj VALUES ('23690', '1529848097', '689270', '08,07,03,02,01,09,05,10,04,06');
INSERT INTO ac_data_pk10bj VALUES ('23710', '1529848400', '689271', '07,04,02,03,08,01,10,05,09,06');
INSERT INTO ac_data_pk10bj VALUES ('23730', '1529848702', '689272', '08,01,06,09,03,05,04,02,07,10');
INSERT INTO ac_data_pk10bj VALUES ('23749', '1529848990', '689273', '07,10,01,08,06,02,05,09,04,03');
INSERT INTO ac_data_pk10bj VALUES ('23769', '1529849294', '689274', '01,09,06,02,05,07,10,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('23789', '1529849597', '689275', '02,09,03,06,04,10,08,05,01,07');
INSERT INTO ac_data_pk10bj VALUES ('23805', '1529849900', '689276', '03,06,04,02,07,10,01,05,09,08');
INSERT INTO ac_data_pk10bj VALUES ('23825', '1529850203', '689277', '10,06,05,02,07,08,04,09,01,03');
INSERT INTO ac_data_pk10bj VALUES ('23844', '1529850490', '689278', '04,10,05,07,09,02,01,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('23864', '1529850795', '689279', '10,07,04,08,01,02,06,05,09,03');
INSERT INTO ac_data_pk10bj VALUES ('23884', '1529851098', '689280', '10,07,01,02,08,03,06,09,05,04');
INSERT INTO ac_data_pk10bj VALUES ('23903', '1529851386', '689281', '03,01,08,07,05,02,09,06,10,04');
INSERT INTO ac_data_pk10bj VALUES ('23923', '1529851690', '689282', '02,07,03,09,04,10,06,08,05,01');
INSERT INTO ac_data_pk10bj VALUES ('23943', '1529851996', '689283', '05,03,04,01,10,07,02,09,08,06');
INSERT INTO ac_data_pk10bj VALUES ('23963', '1529852297', '689284', '04,10,06,05,01,08,02,03,07,09');
INSERT INTO ac_data_pk10bj VALUES ('23983', '1529852600', '689285', '01,05,06,03,04,02,07,09,08,10');
INSERT INTO ac_data_pk10bj VALUES ('24002', '1529852887', '689286', '04,03,01,09,02,05,10,06,08,07');
INSERT INTO ac_data_pk10bj VALUES ('24022', '1529853191', '689287', '01,04,02,10,09,03,06,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('24042', '1529853494', '689288', '03,04,10,06,01,05,02,09,08,07');
INSERT INTO ac_data_pk10bj VALUES ('24063', '1529853799', '689289', '06,02,05,07,03,01,10,09,08,04');
INSERT INTO ac_data_pk10bj VALUES ('24082', '1529854096', '689290', '02,01,04,10,06,05,08,09,03,07');
INSERT INTO ac_data_pk10bj VALUES ('24102', '1529854399', '689291', '08,01,04,02,06,03,07,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('24114', '1529896750', '689323', '03,05,02,07,01,09,10,04,08,06');
INSERT INTO ac_data_pk10bj VALUES ('24120', '1529913711', '689379', '07,01,06,03,09,05,02,10,04,08');
INSERT INTO ac_data_pk10bj VALUES ('24123', '1529913807', '689380', '10,03,08,01,02,05,07,06,09,04');
INSERT INTO ac_data_pk10bj VALUES ('24141', '1529914092', '689381', '07,03,04,10,09,01,02,06,05,08');
INSERT INTO ac_data_pk10bj VALUES ('24160', '1529914383', '689382', '08,06,07,01,04,03,05,10,09,02');
INSERT INTO ac_data_pk10bj VALUES ('24180', '1529914688', '689383', '02,05,07,01,04,03,09,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('24200', '1529914993', '689384', '03,07,02,09,01,05,08,06,04,10');
INSERT INTO ac_data_pk10bj VALUES ('24220', '1529915289', '689385', '02,05,07,04,06,03,08,10,09,01');
INSERT INTO ac_data_pk10bj VALUES ('24240', '1529915592', '689386', '08,06,10,01,05,09,04,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('24259', '1529915884', '689387', '07,03,08,01,04,02,05,06,10,09');
INSERT INTO ac_data_pk10bj VALUES ('24279', '1529916196', '689388', '04,01,09,05,03,06,07,02,10,08');
INSERT INTO ac_data_pk10bj VALUES ('24298', '1529916489', '689389', '05,10,06,03,07,01,09,02,08,04');
INSERT INTO ac_data_pk10bj VALUES ('24318', '1529916790', '689390', '03,06,09,01,10,02,07,08,05,04');
INSERT INTO ac_data_pk10bj VALUES ('24334', '1529917084', '689391', '01,02,08,07,09,06,10,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('24353', '1529917387', '689392', '02,01,07,08,09,03,05,04,10,06');
INSERT INTO ac_data_pk10bj VALUES ('24373', '1529917690', '689393', '08,01,10,03,02,04,07,06,09,05');
INSERT INTO ac_data_pk10bj VALUES ('24386', '1529919309', '689398', '06,07,05,09,08,04,01,03,10,02');
INSERT INTO ac_data_pk10bj VALUES ('24397', '1529919478', '689399', '09,06,03,02,08,07,04,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('24417', '1529919782', '689400', '04,10,09,07,02,08,03,06,05,01');
INSERT INTO ac_data_pk10bj VALUES ('24437', '1529920092', '689401', '10,09,05,02,01,08,06,03,04,07');
INSERT INTO ac_data_pk10bj VALUES ('24456', '1529920383', '689402', '09,06,04,01,03,08,10,07,02,05');
INSERT INTO ac_data_pk10bj VALUES ('24476', '1529920688', '689403', '06,07,02,01,09,10,05,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('24497', '1529920992', '689404', '03,05,07,09,10,01,04,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('24516', '1529921280', '689405', '06,07,04,02,08,03,01,10,09,05');
INSERT INTO ac_data_pk10bj VALUES ('24537', '1529921588', '689406', '02,06,04,07,09,05,03,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('24557', '1529921893', '689407', '03,07,02,05,06,08,01,09,04,10');
INSERT INTO ac_data_pk10bj VALUES ('24576', '1529922180', '689408', '02,03,10,01,08,06,05,07,09,04');
INSERT INTO ac_data_pk10bj VALUES ('24596', '1529922483', '689409', '09,05,08,02,04,03,01,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('24615', '1529922779', '689410', '07,03,05,01,08,04,09,02,10,06');
INSERT INTO ac_data_pk10bj VALUES ('24636', '1529923089', '689411', '03,02,08,01,09,06,04,10,05,07');
INSERT INTO ac_data_pk10bj VALUES ('24656', '1529923392', '689412', '03,08,07,09,02,01,10,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('24675', '1529923683', '689413', '03,07,10,09,05,08,01,02,06,04');
INSERT INTO ac_data_pk10bj VALUES ('24695', '1529923988', '689414', '06,05,01,03,09,10,02,07,04,08');
INSERT INTO ac_data_pk10bj VALUES ('24715', '1529924287', '689415', '02,01,07,08,09,05,04,10,06,03');
INSERT INTO ac_data_pk10bj VALUES ('24735', '1529924589', '689416', '10,04,07,09,06,02,05,01,03,08');
INSERT INTO ac_data_pk10bj VALUES ('24754', '1529924880', '689417', '10,04,03,07,09,05,08,01,06,02');
INSERT INTO ac_data_pk10bj VALUES ('24774', '1529925183', '689418', '04,03,05,09,07,08,06,01,10,02');
INSERT INTO ac_data_pk10bj VALUES ('24794', '1529925487', '689419', '03,01,09,07,06,04,08,05,10,02');
INSERT INTO ac_data_pk10bj VALUES ('24814', '1529925789', '689420', '10,04,01,09,06,05,03,02,07,08');
INSERT INTO ac_data_pk10bj VALUES ('24834', '1529926092', '689421', '05,09,02,10,01,06,04,07,03,08');
INSERT INTO ac_data_pk10bj VALUES ('24854', '1529926394', '689422', '09,01,03,05,08,04,06,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('24873', '1529926683', '689423', '06,01,08,04,03,05,02,10,09,07');
INSERT INTO ac_data_pk10bj VALUES ('24893', '1529926986', '689424', '01,07,06,02,03,05,04,08,09,10');
INSERT INTO ac_data_pk10bj VALUES ('24914', '1529927291', '689425', '09,07,03,08,05,10,01,02,04,06');
INSERT INTO ac_data_pk10bj VALUES ('24934', '1529927594', '689426', '02,03,04,05,06,01,07,09,10,08');
INSERT INTO ac_data_pk10bj VALUES ('24953', '1529927881', '689427', '01,03,06,10,05,09,08,04,07,02');
INSERT INTO ac_data_pk10bj VALUES ('24973', '1529928185', '689428', '05,04,10,02,09,06,08,01,07,03');
INSERT INTO ac_data_pk10bj VALUES ('24993', '1529928489', '689429', '06,02,05,04,07,08,03,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('25013', '1529928790', '689430', '02,05,01,08,04,06,10,07,03,09');
INSERT INTO ac_data_pk10bj VALUES ('25032', '1529929078', '689431', '08,03,07,06,04,05,01,10,09,02');
INSERT INTO ac_data_pk10bj VALUES ('25053', '1529929398', '689432', '03,07,09,02,08,05,06,01,04,10');
INSERT INTO ac_data_pk10bj VALUES ('25072', '1529929687', '689433', '01,05,03,04,09,07,02,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('25092', '1529929990', '689434', '02,05,10,09,07,03,08,04,01,06');
INSERT INTO ac_data_pk10bj VALUES ('25111', '1529930278', '689435', '07,03,08,05,01,02,06,04,09,10');
INSERT INTO ac_data_pk10bj VALUES ('25131', '1529930581', '689436', '01,03,10,08,07,04,09,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('25150', '1529930877', '689437', '01,02,08,04,09,03,05,07,06,10');
INSERT INTO ac_data_pk10bj VALUES ('25170', '1529931196', '689438', '09,06,02,04,05,03,08,10,01,07');
INSERT INTO ac_data_pk10bj VALUES ('25190', '1529931490', '689439', '06,07,02,05,01,09,08,03,10,04');
INSERT INTO ac_data_pk10bj VALUES ('25209', '1529931781', '689440', '05,10,01,09,06,08,04,02,07,03');
INSERT INTO ac_data_pk10bj VALUES ('25229', '1529932085', '689441', '06,07,08,01,09,03,05,04,02,10');
INSERT INTO ac_data_pk10bj VALUES ('25249', '1529932389', '689442', '10,08,05,04,07,03,01,09,02,06');
INSERT INTO ac_data_pk10bj VALUES ('25269', '1529932693', '689443', '09,03,07,02,08,05,04,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('25289', '1529932991', '689444', '10,03,08,01,07,05,06,02,04,09');
INSERT INTO ac_data_pk10bj VALUES ('25308', '1529933280', '689445', '04,01,08,07,10,09,03,02,06,05');
INSERT INTO ac_data_pk10bj VALUES ('25328', '1529933583', '689446', '05,08,01,04,10,02,06,07,09,03');
INSERT INTO ac_data_pk10bj VALUES ('25348', '1529933887', '689447', '02,09,01,08,03,05,07,04,06,10');
INSERT INTO ac_data_pk10bj VALUES ('25368', '1529934191', '689448', '09,02,03,06,04,10,07,01,08,05');
INSERT INTO ac_data_pk10bj VALUES ('25388', '1529934492', '689449', '06,02,04,07,10,08,03,01,09,05');
INSERT INTO ac_data_pk10bj VALUES ('25407', '1529934782', '689450', '05,07,06,08,09,02,10,03,04,01');
INSERT INTO ac_data_pk10bj VALUES ('25427', '1529935085', '689451', '07,04,03,06,01,08,05,10,09,02');
INSERT INTO ac_data_pk10bj VALUES ('25447', '1529935388', '689452', '10,04,06,05,08,07,02,03,09,01');
INSERT INTO ac_data_pk10bj VALUES ('25466', '1529935680', '689453', '06,03,04,01,02,07,05,09,10,08');
INSERT INTO ac_data_pk10bj VALUES ('25486', '1529935981', '689454', '09,03,05,08,06,01,04,02,07,10');
INSERT INTO ac_data_pk10bj VALUES ('25506', '1529936284', '689455', '03,06,08,01,02,07,05,10,04,09');
INSERT INTO ac_data_pk10bj VALUES ('25526', '1529936587', '689456', '10,05,04,08,01,07,02,03,09,06');
INSERT INTO ac_data_pk10bj VALUES ('25546', '1529936890', '689457', '01,07,08,03,05,06,09,04,10,02');
INSERT INTO ac_data_pk10bj VALUES ('25566', '1529937194', '689458', '06,05,09,08,02,01,10,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('25585', '1529937480', '689459', '09,08,05,02,01,06,07,10,04,03');
INSERT INTO ac_data_pk10bj VALUES ('25605', '1529937784', '689460', '08,09,07,03,10,01,06,02,04,05');
INSERT INTO ac_data_pk10bj VALUES ('25625', '1529938089', '689461', '05,08,04,06,02,03,09,07,01,10');
INSERT INTO ac_data_pk10bj VALUES ('25645', '1529938391', '689462', '07,04,06,01,08,10,03,02,09,05');
INSERT INTO ac_data_pk10bj VALUES ('25665', '1529938693', '689463', '10,04,08,02,03,05,07,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('25684', '1529938984', '689464', '09,02,05,04,10,03,01,07,08,06');
INSERT INTO ac_data_pk10bj VALUES ('25704', '1529939287', '689465', '05,01,06,03,09,08,02,04,07,10');
INSERT INTO ac_data_pk10bj VALUES ('25724', '1529939591', '689466', '02,07,03,05,01,04,08,06,10,09');
INSERT INTO ac_data_pk10bj VALUES ('25742', '1529939879', '689467', '09,02,07,05,03,08,10,04,06,01');
INSERT INTO ac_data_pk10bj VALUES ('25762', '1529940179', '689468', '07,10,01,08,06,05,04,03,02,09');
INSERT INTO ac_data_pk10bj VALUES ('25782', '1529940481', '689469', '06,03,04,08,01,10,07,05,09,02');
INSERT INTO ac_data_pk10bj VALUES ('25802', '1529940784', '689470', '01,03,08,09,04,02,05,07,06,10');
INSERT INTO ac_data_pk10bj VALUES ('25822', '1529941091', '689471', '02,10,01,06,08,04,09,05,03,07');
INSERT INTO ac_data_pk10bj VALUES ('25841', '1529941380', '689472', '02,03,04,06,08,05,07,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('25861', '1529941680', '689473', '01,02,05,03,08,09,06,04,07,10');
INSERT INTO ac_data_pk10bj VALUES ('25881', '1529941983', '689474', '06,08,01,05,02,07,10,09,03,04');
INSERT INTO ac_data_pk10bj VALUES ('25917', '1529978881', '689488', '07,01,06,03,02,08,10,05,09,04');
INSERT INTO ac_data_pk10bj VALUES ('25937', '1529979182', '689489', '06,10,02,09,08,01,07,04,05,03');
INSERT INTO ac_data_pk10bj VALUES ('25956', '1529979477', '689490', '02,01,08,09,10,07,05,06,03,04');
INSERT INTO ac_data_pk10bj VALUES ('25976', '1529979780', '689491', '10,09,08,02,05,01,03,06,07,04');
INSERT INTO ac_data_pk10bj VALUES ('25996', '1529980085', '689492', '10,02,06,03,04,05,01,09,08,07');
INSERT INTO ac_data_pk10bj VALUES ('26016', '1529980380', '689493', '09,07,03,04,10,01,05,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('26036', '1529980685', '689494', '02,10,08,06,07,04,03,05,09,01');
INSERT INTO ac_data_pk10bj VALUES ('26056', '1529980988', '689495', '07,09,08,01,04,05,10,02,03,06');
INSERT INTO ac_data_pk10bj VALUES ('26071', '1529982767', '689500', '05,08,04,07,10,02,06,03,01,09');
INSERT INTO ac_data_pk10bj VALUES ('26072', '1529982782', '689501', '05,06,02,10,03,09,08,04,07,01');
INSERT INTO ac_data_pk10bj VALUES ('26088', '1529983079', '689502', '10,09,01,04,02,06,07,05,08,03');
INSERT INTO ac_data_pk10bj VALUES ('26108', '1529983384', '689503', '03,06,01,10,04,08,02,09,07,05');
INSERT INTO ac_data_pk10bj VALUES ('26124', '1529983679', '689504', '01,09,05,03,04,08,02,10,06,07');
INSERT INTO ac_data_pk10bj VALUES ('26144', '1529983987', '689505', '07,02,09,03,04,01,05,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('26164', '1529984283', '689506', '03,05,06,02,01,10,08,07,04,09');
INSERT INTO ac_data_pk10bj VALUES ('26184', '1529984586', '689507', '02,09,03,05,08,07,10,04,06,01');
INSERT INTO ac_data_pk10bj VALUES ('26203', '1529984880', '689508', '01,07,04,05,10,06,03,02,08,09');
INSERT INTO ac_data_pk10bj VALUES ('26223', '1529985186', '689509', '06,05,08,09,10,07,02,03,04,01');
INSERT INTO ac_data_pk10bj VALUES ('26242', '1529985478', '689510', '06,10,07,02,05,08,04,01,03,09');
INSERT INTO ac_data_pk10bj VALUES ('26263', '1529985784', '689511', '01,07,10,03,08,04,06,09,02,05');
INSERT INTO ac_data_pk10bj VALUES ('26282', '1529986085', '689512', '07,10,05,01,03,06,08,02,04,09');
INSERT INTO ac_data_pk10bj VALUES ('26302', '1529986390', '689513', '07,09,10,05,06,02,04,08,03,01');
INSERT INTO ac_data_pk10bj VALUES ('26321', '1529986679', '689514', '06,10,07,01,09,08,02,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('26341', '1529986984', '689515', '07,06,01,05,09,02,03,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('26361', '1529987288', '689516', '04,07,10,09,03,02,01,06,05,08');
INSERT INTO ac_data_pk10bj VALUES ('26380', '1529987578', '689517', '10,03,01,05,08,02,07,09,04,06');
INSERT INTO ac_data_pk10bj VALUES ('26400', '1529987890', '689518', '07,01,09,06,05,02,04,08,10,03');
INSERT INTO ac_data_pk10bj VALUES ('26419', '1529988180', '689519', '10,07,02,06,09,05,03,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('26439', '1529988487', '689520', '07,01,02,06,03,04,08,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('26459', '1529988788', '689521', '02,04,03,01,09,08,07,06,10,05');
INSERT INTO ac_data_pk10bj VALUES ('26474', '1529989083', '689522', '01,05,02,08,06,09,07,04,03,10');
INSERT INTO ac_data_pk10bj VALUES ('26494', '1529989389', '689523', '07,04,10,03,05,08,09,01,06,02');
INSERT INTO ac_data_pk10bj VALUES ('26514', '1529989695', '689524', '09,04,10,03,06,05,08,07,01,02');
INSERT INTO ac_data_pk10bj VALUES ('26533', '1529989984', '689525', '03,01,07,06,05,10,04,09,08,02');
INSERT INTO ac_data_pk10bj VALUES ('26552', '1529990282', '689526', '01,09,04,02,08,07,05,06,03,10');
INSERT INTO ac_data_pk10bj VALUES ('26572', '1529990585', '689527', '06,02,03,05,09,07,10,08,01,04');
INSERT INTO ac_data_pk10bj VALUES ('26592', '1529990889', '689528', '01,08,02,05,07,10,06,09,04,03');
INSERT INTO ac_data_pk10bj VALUES ('26612', '1529991193', '689529', '05,07,03,10,04,01,08,02,06,09');
INSERT INTO ac_data_pk10bj VALUES ('26632', '1529991486', '689530', '07,03,02,01,06,08,04,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('26651', '1529991779', '689531', '05,07,06,09,01,08,10,02,04,03');
INSERT INTO ac_data_pk10bj VALUES ('26671', '1529992084', '689532', '05,09,03,06,10,08,04,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('26691', '1529992388', '689533', '05,01,09,04,07,06,08,02,03,10');
INSERT INTO ac_data_pk10bj VALUES ('26710', '1529992676', '689534', '05,06,07,02,09,03,04,01,08,10');
INSERT INTO ac_data_pk10bj VALUES ('26731', '1529992990', '689535', '07,08,03,01,05,10,09,04,02,06');
INSERT INTO ac_data_pk10bj VALUES ('26750', '1529993279', '689536', '05,06,03,01,07,02,10,08,09,04');
INSERT INTO ac_data_pk10bj VALUES ('26766', '1529993582', '689537', '07,06,05,03,01,08,09,02,10,04');
INSERT INTO ac_data_pk10bj VALUES ('26786', '1529993885', '689538', '08,06,05,02,03,04,10,07,09,01');
INSERT INTO ac_data_pk10bj VALUES ('26805', '1529994180', '689539', '06,03,04,02,01,05,08,09,07,10');
INSERT INTO ac_data_pk10bj VALUES ('26825', '1529994480', '689540', '03,02,09,04,01,05,07,10,08,06');
INSERT INTO ac_data_pk10bj VALUES ('26845', '1529994784', '689541', '06,07,01,05,02,04,09,03,08,10');
INSERT INTO ac_data_pk10bj VALUES ('26865', '1529995089', '689542', '06,03,01,10,02,05,08,07,04,09');
INSERT INTO ac_data_pk10bj VALUES ('26884', '1529995378', '689543', '06,10,05,04,07,08,02,09,03,01');
INSERT INTO ac_data_pk10bj VALUES ('26904', '1529995682', '689544', '10,09,07,08,01,02,04,06,03,05');
INSERT INTO ac_data_pk10bj VALUES ('26925', '1529995994', '689545', '05,01,08,02,10,03,06,07,09,04');
INSERT INTO ac_data_pk10bj VALUES ('26944', '1529996283', '689546', '07,04,09,10,01,08,06,03,02,05');
INSERT INTO ac_data_pk10bj VALUES ('26964', '1529996589', '689547', '08,01,10,04,02,03,07,09,06,05');
INSERT INTO ac_data_pk10bj VALUES ('26983', '1529996880', '689548', '09,04,10,02,03,08,07,06,05,01');
INSERT INTO ac_data_pk10bj VALUES ('27004', '1529997188', '689549', '07,09,02,10,01,05,03,08,06,04');
INSERT INTO ac_data_pk10bj VALUES ('27023', '1529997480', '689550', '03,04,01,06,08,10,05,07,02,09');
INSERT INTO ac_data_pk10bj VALUES ('27043', '1529997788', '689551', '07,04,08,02,05,01,10,03,09,06');
INSERT INTO ac_data_pk10bj VALUES ('27059', '1529998081', '689552', '10,09,08,03,04,05,06,01,07,02');
INSERT INTO ac_data_pk10bj VALUES ('27079', '1529998495', '689553', '08,06,09,04,10,05,07,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('27089', '1529998688', '689554', '07,01,10,09,03,06,05,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('27108', '1529998984', '689555', '07,08,02,05,03,09,01,04,10,06');
INSERT INTO ac_data_pk10bj VALUES ('27128', '1529999289', '689556', '07,09,04,06,08,10,05,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('27147', '1529999584', '689557', '09,01,03,07,06,10,05,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('27167', '1529999889', '689558', '08,02,04,10,03,05,09,07,06,01');
INSERT INTO ac_data_pk10bj VALUES ('27186', '1530000177', '689559', '07,01,04,05,09,03,02,10,08,06');
INSERT INTO ac_data_pk10bj VALUES ('27206', '1530000482', '689560', '07,09,04,02,10,03,08,05,01,06');
INSERT INTO ac_data_pk10bj VALUES ('27226', '1530000786', '689561', '08,06,10,01,03,04,05,09,07,02');
INSERT INTO ac_data_pk10bj VALUES ('27245', '1530001075', '689562', '07,03,06,05,02,09,01,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('27265', '1530001383', '689563', '02,08,10,05,09,07,03,01,04,06');
INSERT INTO ac_data_pk10bj VALUES ('27285', '1530001678', '689564', '04,06,10,03,08,01,09,02,05,07');
INSERT INTO ac_data_pk10bj VALUES ('27305', '1530001981', '689565', '07,04,02,05,06,01,09,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('27325', '1530002285', '689566', '03,01,06,05,02,10,08,07,04,09');
INSERT INTO ac_data_pk10bj VALUES ('27344', '1530002575', '689567', '06,07,10,02,05,09,08,01,04,03');
INSERT INTO ac_data_pk10bj VALUES ('27364', '1530002879', '689568', '02,06,10,05,03,07,01,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('27384', '1530003182', '689569', '10,02,05,08,04,06,03,07,09,01');
INSERT INTO ac_data_pk10bj VALUES ('27404', '1530003489', '689570', '03,01,10,09,06,08,07,05,02,04');
INSERT INTO ac_data_pk10bj VALUES ('27423', '1530003780', '689571', '05,06,07,03,04,09,10,08,02,01');
INSERT INTO ac_data_pk10bj VALUES ('27439', '1530005359', '689576', '02,09,04,07,03,08,05,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('27455', '1530005589', '689577', '08,03,07,05,04,09,01,02,06,10');
INSERT INTO ac_data_pk10bj VALUES ('27474', '1530005877', '689578', '05,03,07,08,10,01,04,06,09,02');
INSERT INTO ac_data_pk10bj VALUES ('27494', '1530006181', '689579', '05,04,03,10,07,08,09,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('27514', '1530006483', '689580', '05,02,06,08,09,01,03,10,07,04');
INSERT INTO ac_data_pk10bj VALUES ('27534', '1530006787', '689581', '01,09,02,05,06,04,10,08,03,07');
INSERT INTO ac_data_pk10bj VALUES ('27552', '1530007520', '689583', '10,04,06,05,03,01,07,08,09,02');
INSERT INTO ac_data_pk10bj VALUES ('27562', '1530007677', '689584', '01,09,05,06,08,03,02,04,10,07');
INSERT INTO ac_data_pk10bj VALUES ('27582', '1530007982', '689585', '07,04,03,08,06,05,09,02,01,10');
INSERT INTO ac_data_pk10bj VALUES ('27602', '1530008285', '689586', '03,01,10,09,05,04,08,07,06,02');
INSERT INTO ac_data_pk10bj VALUES ('27622', '1530008575', '689587', '04,03,09,10,05,07,01,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('27642', '1530008881', '689588', '01,10,07,09,04,08,02,06,03,05');
INSERT INTO ac_data_pk10bj VALUES ('27662', '1530009185', '689589', '07,08,06,04,10,03,09,02,05,01');
INSERT INTO ac_data_pk10bj VALUES ('27681', '1530009476', '689590', '09,06,10,04,07,01,02,03,08,05');
INSERT INTO ac_data_pk10bj VALUES ('27701', '1530009774', '689591', '06,01,07,08,10,02,04,05,03,09');
INSERT INTO ac_data_pk10bj VALUES ('27721', '1530010078', '689592', '02,09,01,06,07,04,10,03,08,05');
INSERT INTO ac_data_pk10bj VALUES ('27740', '1530010382', '689593', '05,09,06,07,04,08,03,10,01,02');
INSERT INTO ac_data_pk10bj VALUES ('27760', '1530010687', '689594', '06,05,01,03,07,02,08,10,09,04');
INSERT INTO ac_data_pk10bj VALUES ('27779', '1530010979', '689595', '07,04,05,06,03,09,02,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('27800', '1530011291', '689596', '01,09,05,04,08,06,02,03,07,10');
INSERT INTO ac_data_pk10bj VALUES ('27819', '1530011578', '689597', '01,03,02,06,04,07,08,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('27839', '1530011881', '689598', '08,03,05,01,02,06,04,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('27858', '1530012173', '689599', '06,09,07,02,01,03,04,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('27878', '1530012477', '689600', '06,01,04,07,03,08,02,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('27899', '1530012791', '689601', '02,01,05,06,08,10,04,03,09,07');
INSERT INTO ac_data_pk10bj VALUES ('27918', '1530013078', '689602', '07,03,01,04,10,09,05,06,02,08');
INSERT INTO ac_data_pk10bj VALUES ('27938', '1530013383', '689603', '03,04,01,06,09,05,10,08,02,07');
INSERT INTO ac_data_pk10bj VALUES ('27958', '1530013685', '689604', '09,01,07,08,06,05,03,04,02,10');
INSERT INTO ac_data_pk10bj VALUES ('27977', '1530013973', '689605', '05,04,10,07,09,08,06,03,01,02');
INSERT INTO ac_data_pk10bj VALUES ('27997', '1530014278', '689606', '01,07,03,02,04,10,09,08,06,05');
INSERT INTO ac_data_pk10bj VALUES ('28017', '1530014582', '689607', '05,01,03,07,04,02,09,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('28036', '1530014874', '689608', '07,02,08,06,03,05,01,10,04,09');
INSERT INTO ac_data_pk10bj VALUES ('28056', '1530015183', '689609', '09,02,05,08,01,07,04,06,03,10');
INSERT INTO ac_data_pk10bj VALUES ('28076', '1530015488', '689610', '06,07,09,10,04,03,08,01,05,02');
INSERT INTO ac_data_pk10bj VALUES ('28096', '1530015778', '689611', '05,09,03,04,06,02,07,10,08,01');
INSERT INTO ac_data_pk10bj VALUES ('28136', '1530016387', '689613', '06,04,07,09,05,03,02,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('28155', '1530016676', '689614', '10,08,04,06,01,09,07,05,02,03');
INSERT INTO ac_data_pk10bj VALUES ('28175', '1530016991', '689615', '03,04,02,06,10,08,01,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('28194', '1530017280', '689616', '02,03,04,01,06,10,09,07,05,08');
INSERT INTO ac_data_pk10bj VALUES ('28214', '1530017585', '689617', '05,02,07,03,08,04,10,01,09,06');
INSERT INTO ac_data_pk10bj VALUES ('28234', '1530017888', '689618', '10,08,04,02,05,01,03,06,07,09');
INSERT INTO ac_data_pk10bj VALUES ('28254', '1530018191', '689619', '01,03,02,05,08,04,06,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('28273', '1530018478', '689620', '10,08,02,06,01,04,05,09,03,07');
INSERT INTO ac_data_pk10bj VALUES ('28292', '1530018771', '689621', '06,05,01,08,02,04,10,09,07,03');
INSERT INTO ac_data_pk10bj VALUES ('28312', '1530019078', '689622', '09,04,10,01,08,03,07,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('28331', '1530019370', '689623', '07,04,02,01,05,08,06,03,09,10');
INSERT INTO ac_data_pk10bj VALUES ('28351', '1530019674', '689624', '05,01,08,06,02,03,04,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('28372', '1530019978', '689625', '10,03,09,05,07,04,01,08,06,02');
INSERT INTO ac_data_pk10bj VALUES ('28393', '1530020296', '689626', '01,08,09,04,05,07,10,02,06,03');
INSERT INTO ac_data_pk10bj VALUES ('28412', '1530020584', '689627', '01,02,05,03,04,06,07,10,09,08');
INSERT INTO ac_data_pk10bj VALUES ('28432', '1530020886', '689628', '03,02,07,06,01,09,10,05,04,08');
INSERT INTO ac_data_pk10bj VALUES ('28451', '1530021189', '689629', '05,03,09,06,08,02,04,10,01,07');
INSERT INTO ac_data_pk10bj VALUES ('28471', '1530021482', '689630', '05,06,03,01,08,09,04,10,07,02');
INSERT INTO ac_data_pk10bj VALUES ('28491', '1530021785', '689631', '04,09,05,01,08,06,07,02,03,10');
INSERT INTO ac_data_pk10bj VALUES ('28510', '1530022073', '689632', '01,05,02,08,03,09,04,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('28530', '1530022376', '689633', '08,02,07,05,04,06,03,09,01,10');
INSERT INTO ac_data_pk10bj VALUES ('28550', '1530022680', '689634', '06,01,04,02,07,09,03,10,05,08');
INSERT INTO ac_data_pk10bj VALUES ('28570', '1530022980', '689635', '04,09,05,01,02,08,03,07,06,10');
INSERT INTO ac_data_pk10bj VALUES ('28590', '1530023283', '689636', '01,05,06,02,03,08,07,04,10,09');
INSERT INTO ac_data_pk10bj VALUES ('28610', '1530023586', '689637', '06,02,08,01,04,03,09,07,10,05');
INSERT INTO ac_data_pk10bj VALUES ('28629', '1530023873', '689638', '09,03,06,08,04,10,07,01,05,02');
INSERT INTO ac_data_pk10bj VALUES ('28649', '1530024178', '689639', '06,07,01,02,04,03,08,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('28669', '1530024481', '689640', '10,08,05,04,07,06,01,02,03,09');
INSERT INTO ac_data_pk10bj VALUES ('28689', '1530024788', '689641', '07,02,10,08,09,01,06,04,03,05');
INSERT INTO ac_data_pk10bj VALUES ('28709', '1530025091', '689642', '08,01,05,07,10,03,04,02,09,06');
INSERT INTO ac_data_pk10bj VALUES ('28728', '1530025379', '689643', '01,03,05,10,07,09,02,04,08,06');
INSERT INTO ac_data_pk10bj VALUES ('28748', '1530025680', '689644', '10,01,06,03,05,04,02,08,07,09');
INSERT INTO ac_data_pk10bj VALUES ('28768', '1530025982', '689645', '10,08,09,06,01,05,02,03,04,07');
INSERT INTO ac_data_pk10bj VALUES ('28788', '1530026285', '689646', '06,10,01,08,05,09,03,04,07,02');
INSERT INTO ac_data_pk10bj VALUES ('28808', '1530026587', '689647', '04,01,08,02,10,03,07,06,09,05');
INSERT INTO ac_data_pk10bj VALUES ('28827', '1530026882', '689648', '05,02,09,07,03,08,04,01,06,10');
INSERT INTO ac_data_pk10bj VALUES ('28847', '1530027181', '689649', '10,06,04,02,09,07,03,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('28866', '1530027470', '689650', '07,03,06,09,04,02,10,05,01,08');
INSERT INTO ac_data_pk10bj VALUES ('28887', '1530027791', '689651', '07,09,02,01,03,06,10,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('28906', '1530028084', '689652', '06,09,05,04,08,01,10,02,07,03');
INSERT INTO ac_data_pk10bj VALUES ('28925', '1530028374', '689653', '02,01,05,09,08,07,10,03,04,06');
INSERT INTO ac_data_pk10bj VALUES ('28960', '1530061435', '689654', '07,04,10,05,02,03,08,09,01,06');
INSERT INTO ac_data_pk10bj VALUES ('28972', '1530061678', '689655', '05,06,08,02,10,04,09,07,03,01');
INSERT INTO ac_data_pk10bj VALUES ('28992', '1530061981', '689656', '01,02,06,07,03,09,04,08,10,05');
INSERT INTO ac_data_pk10bj VALUES ('29012', '1530062286', '689657', '10,07,09,02,01,03,08,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('29031', '1530062576', '689658', '09,01,03,10,08,04,06,02,05,07');
INSERT INTO ac_data_pk10bj VALUES ('29038', '1530359963', '690322', '04,07,10,03,06,05,01,09,02,08');
INSERT INTO ac_data_pk10bj VALUES ('29051', '1530360160', '690323', '04,05,01,06,02,03,09,07,08,10');
INSERT INTO ac_data_pk10bj VALUES ('29071', '1530360464', '690324', '01,03,08,04,06,10,05,09,02,07');
INSERT INTO ac_data_pk10bj VALUES ('29091', '1530360771', '690325', '02,06,03,07,10,09,08,04,05,01');
INSERT INTO ac_data_pk10bj VALUES ('29110', '1530361063', '690326', '03,10,02,07,08,05,01,04,09,06');
INSERT INTO ac_data_pk10bj VALUES ('29130', '1530361365', '690327', '03,07,09,01,10,06,08,02,04,05');
INSERT INTO ac_data_pk10bj VALUES ('29150', '1530361666', '690328', '01,09,06,04,05,08,02,07,10,03');
INSERT INTO ac_data_pk10bj VALUES ('29170', '1530361970', '690329', '04,09,07,08,10,05,01,06,02,03');
INSERT INTO ac_data_pk10bj VALUES ('29189', '1530362258', '690330', '10,02,09,01,08,06,07,05,04,03');
INSERT INTO ac_data_pk10bj VALUES ('29209', '1530362561', '690331', '08,04,02,03,07,10,09,01,06,05');
INSERT INTO ac_data_pk10bj VALUES ('29229', '1530362859', '690332', '02,03,05,04,09,08,01,10,06,07');
INSERT INTO ac_data_pk10bj VALUES ('29248', '1530363153', '690333', '10,05,06,01,09,04,02,03,07,08');
INSERT INTO ac_data_pk10bj VALUES ('29268', '1530363456', '690334', '02,08,06,10,03,01,04,09,05,07');
INSERT INTO ac_data_pk10bj VALUES ('29288', '1530363764', '690335', '03,01,02,04,07,10,08,09,06,05');
INSERT INTO ac_data_pk10bj VALUES ('29308', '1530364068', '690336', '04,07,10,01,05,06,02,08,03,09');
INSERT INTO ac_data_pk10bj VALUES ('29328', '1530364361', '690337', '03,10,02,08,04,07,05,06,01,09');
INSERT INTO ac_data_pk10bj VALUES ('29348', '1530364665', '690338', '01,10,02,05,07,09,03,06,08,04');
INSERT INTO ac_data_pk10bj VALUES ('29368', '1530364969', '690339', '02,06,08,09,04,07,10,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('29387', '1530365257', '690340', '07,02,06,08,03,01,05,09,10,04');
INSERT INTO ac_data_pk10bj VALUES ('29407', '1530365562', '690341', '05,09,06,07,04,03,08,01,02,10');
INSERT INTO ac_data_pk10bj VALUES ('29427', '1530365863', '690342', '08,03,02,05,07,01,04,10,09,06');
INSERT INTO ac_data_pk10bj VALUES ('29446', '1530366155', '690343', '04,09,03,06,10,02,05,01,07,08');
INSERT INTO ac_data_pk10bj VALUES ('29466', '1530366463', '690344', '02,09,04,10,08,01,07,05,03,06');
INSERT INTO ac_data_pk10bj VALUES ('29485', '1530366756', '690345', '01,04,03,10,02,07,05,09,06,08');
INSERT INTO ac_data_pk10bj VALUES ('29505', '1530367062', '690346', '06,07,03,08,01,02,09,05,10,04');
INSERT INTO ac_data_pk10bj VALUES ('29525', '1530367364', '690347', '04,01,08,07,05,03,06,09,10,02');
INSERT INTO ac_data_pk10bj VALUES ('29545', '1530367667', '690348', '02,10,06,07,08,04,05,03,09,01');
INSERT INTO ac_data_pk10bj VALUES ('29564', '1530367954', '690349', '08,09,10,06,02,03,01,04,05,07');
INSERT INTO ac_data_pk10bj VALUES ('29584', '1530368257', '690350', '02,01,10,03,07,04,08,06,05,09');
INSERT INTO ac_data_pk10bj VALUES ('29604', '1530368562', '690351', '03,02,10,08,07,06,09,05,01,04');
INSERT INTO ac_data_pk10bj VALUES ('29624', '1530368863', '690352', '10,05,01,04,08,03,07,09,06,02');
INSERT INTO ac_data_pk10bj VALUES ('29644', '1530369166', '690353', '04,02,06,09,07,05,08,10,03,01');
INSERT INTO ac_data_pk10bj VALUES ('29664', '1530369470', '690354', '09,05,02,06,01,03,07,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('29683', '1530369758', '690355', '01,04,08,10,06,07,02,03,09,05');
INSERT INTO ac_data_pk10bj VALUES ('29703', '1530370062', '690356', '01,10,02,06,04,07,05,09,08,03');
INSERT INTO ac_data_pk10bj VALUES ('29722', '1530370352', '690357', '04,06,05,07,08,10,02,09,03,01');
INSERT INTO ac_data_pk10bj VALUES ('29742', '1530370655', '690358', '09,06,07,02,01,05,04,08,03,10');
INSERT INTO ac_data_pk10bj VALUES ('29762', '1530370957', '690359', '02,08,10,04,03,07,09,01,05,06');
INSERT INTO ac_data_pk10bj VALUES ('29782', '1530371262', '690360', '01,03,05,06,04,10,08,09,02,07');
INSERT INTO ac_data_pk10bj VALUES ('29802', '1530371563', '690361', '02,09,08,01,06,04,10,05,07,03');
INSERT INTO ac_data_pk10bj VALUES ('29817', '1530371877', '690362', '06,03,04,09,02,07,05,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('29818', '1530608425', '690823', '03,09,07,04,01,06,08,02,05,10');
INSERT INTO ac_data_pk10bj VALUES ('29832', '1530608547', '690824', '02,07,08,01,06,03,05,10,04,09');
INSERT INTO ac_data_pk10bj VALUES ('29866', '1530773267', '691153', '03,01,04,09,06,07,10,02,05,08');
INSERT INTO ac_data_pk10bj VALUES ('29867', '1530773282', '691154', '03,01,07,06,04,02,05,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('29885', '1530773581', '691155', '09,05,06,04,02,08,03,01,10,07');
INSERT INTO ac_data_pk10bj VALUES ('29899', '1530773871', '691156', '04,09,06,02,07,08,10,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('29917', '1530774171', '691157', '01,03,06,08,10,07,02,04,05,09');
INSERT INTO ac_data_pk10bj VALUES ('29934', '1530774461', '691158', '01,05,02,08,04,06,07,03,10,09');
INSERT INTO ac_data_pk10bj VALUES ('29952', '1530774777', '691159', '09,07,05,02,10,04,03,06,01,08');
INSERT INTO ac_data_pk10bj VALUES ('29970', '1530775071', '691160', '04,10,02,07,05,09,01,03,08,06');
INSERT INTO ac_data_pk10bj VALUES ('29987', '1530775373', '691161', '06,05,01,09,10,07,04,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('30005', '1530775666', '691162', '03,08,02,09,01,07,04,05,06,10');
INSERT INTO ac_data_pk10bj VALUES ('30030', '1530776084', '691163', '02,06,04,09,08,05,07,03,10,01');
INSERT INTO ac_data_pk10bj VALUES ('30041', '1530776264', '691164', '02,03,06,07,04,01,10,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('30057', '1530776579', '691165', '05,10,04,06,02,09,08,07,01,03');
INSERT INTO ac_data_pk10bj VALUES ('30075', '1530776875', '691166', '02,03,10,07,08,01,09,05,06,04');
INSERT INTO ac_data_pk10bj VALUES ('30093', '1530777167', '691167', '03,06,09,01,10,07,02,05,08,04');
INSERT INTO ac_data_pk10bj VALUES ('30111', '1530777467', '691168', '06,03,01,04,09,07,05,02,08,10');
INSERT INTO ac_data_pk10bj VALUES ('30130', '1530777772', '691169', '06,07,10,01,02,08,09,05,03,04');
INSERT INTO ac_data_pk10bj VALUES ('30148', '1530778076', '691170', '09,01,02,08,03,10,04,06,05,07');
INSERT INTO ac_data_pk10bj VALUES ('30162', '1530778366', '691171', '04,07,06,01,05,10,09,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('30180', '1530778676', '691172', '07,05,03,10,09,01,06,08,02,04');
INSERT INTO ac_data_pk10bj VALUES ('30198', '1530778967', '691173', '08,05,02,04,01,03,07,09,10,06');
INSERT INTO ac_data_pk10bj VALUES ('30216', '1530779268', '691174', '01,03,09,10,05,06,07,02,08,04');
INSERT INTO ac_data_pk10bj VALUES ('30236', '1530779582', '691175', '06,04,08,09,01,03,10,02,07,05');
INSERT INTO ac_data_pk10bj VALUES ('30252', '1530779866', '691176', '08,05,09,04,06,10,01,02,07,03');
INSERT INTO ac_data_pk10bj VALUES ('30270', '1530780170', '691177', '02,06,04,01,07,03,10,05,08,09');
INSERT INTO ac_data_pk10bj VALUES ('30288', '1530780464', '691178', '02,06,09,04,07,01,08,10,03,05');
INSERT INTO ac_data_pk10bj VALUES ('30307', '1530780767', '691179', '07,06,05,03,09,10,08,04,01,02');
INSERT INTO ac_data_pk10bj VALUES ('30325', '1530781063', '691180', '01,08,05,02,07,09,03,06,04,10');
INSERT INTO ac_data_pk10bj VALUES ('30344', '1530781363', '691181', '07,08,01,05,03,04,09,06,10,02');
INSERT INTO ac_data_pk10bj VALUES ('30363', '1530781674', '691182', '01,08,06,02,05,03,10,07,04,09');
INSERT INTO ac_data_pk10bj VALUES ('30381', '1530781966', '691183', '01,03,10,09,04,02,07,06,08,05');
INSERT INTO ac_data_pk10bj VALUES ('30399', '1530782272', '691184', '05,10,07,02,01,03,06,08,04,09');
INSERT INTO ac_data_pk10bj VALUES ('30417', '1530782570', '691185', '05,08,10,04,02,09,06,07,03,01');
INSERT INTO ac_data_pk10bj VALUES ('30435', '1530782860', '691186', '06,07,05,03,09,04,10,01,02,08');
INSERT INTO ac_data_pk10bj VALUES ('30454', '1530783172', '691187', '10,06,02,05,09,01,03,07,04,08');
INSERT INTO ac_data_pk10bj VALUES ('30473', '1530783479', '691188', '09,04,05,01,03,10,06,07,08,02');
INSERT INTO ac_data_pk10bj VALUES ('30488', '1530783765', '691189', '09,01,10,04,07,05,02,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('30507', '1530784077', '691190', '09,04,01,03,05,07,08,02,10,06');
INSERT INTO ac_data_pk10bj VALUES ('30524', '1530784364', '691191', '06,03,01,07,04,09,02,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('30543', '1530784673', '691192', '05,03,10,08,06,02,07,09,04,01');
INSERT INTO ac_data_pk10bj VALUES ('30560', '1530784965', '691193', '02,01,09,05,07,06,08,03,04,10');
INSERT INTO ac_data_pk10bj VALUES ('30579', '1530785268', '691194', '09,07,08,04,05,10,03,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('30598', '1530785572', '691195', '01,04,02,06,08,09,03,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('30617', '1530785874', '691196', '10,08,09,07,02,01,05,03,06,04');
INSERT INTO ac_data_pk10bj VALUES ('30636', '1530786174', '691197', '04,01,07,02,05,09,10,06,08,03');
INSERT INTO ac_data_pk10bj VALUES ('30655', '1530786464', '691198', '06,08,09,02,05,01,03,04,10,07');
INSERT INTO ac_data_pk10bj VALUES ('30673', '1530786763', '691199', '07,08,05,01,03,04,10,09,06,02');
INSERT INTO ac_data_pk10bj VALUES ('30692', '1530787064', '691200', '04,05,01,03,06,07,10,08,02,09');
INSERT INTO ac_data_pk10bj VALUES ('30711', '1530787371', '691201', '05,09,03,08,02,01,10,07,04,06');
INSERT INTO ac_data_pk10bj VALUES ('30729', '1530787671', '691202', '04,05,03,08,07,01,10,09,02,06');
INSERT INTO ac_data_pk10bj VALUES ('30748', '1530787966', '691203', '02,09,06,04,10,03,01,07,08,05');
INSERT INTO ac_data_pk10bj VALUES ('30767', '1530788265', '691204', '02,08,05,10,03,04,07,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('30786', '1530788567', '691205', '09,08,02,01,07,05,06,10,04,03');
INSERT INTO ac_data_pk10bj VALUES ('30804', '1530788865', '691206', '01,06,03,07,04,08,09,10,02,05');
INSERT INTO ac_data_pk10bj VALUES ('30822', '1530789173', '691207', '05,01,02,07,10,08,09,06,03,04');
INSERT INTO ac_data_pk10bj VALUES ('30840', '1530789466', '691208', '01,05,03,08,09,07,04,06,02,10');
INSERT INTO ac_data_pk10bj VALUES ('30859', '1530789765', '691209', '07,08,02,04,06,01,10,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('30877', '1530790073', '691210', '05,03,06,08,09,02,01,07,04,10');
INSERT INTO ac_data_pk10bj VALUES ('30895', '1530790362', '691211', '07,02,10,08,01,06,09,04,05,03');
INSERT INTO ac_data_pk10bj VALUES ('30914', '1530790674', '691212', '05,01,03,06,10,08,09,07,02,04');
INSERT INTO ac_data_pk10bj VALUES ('30932', '1530790975', '691213', '09,03,08,02,07,10,01,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('30950', '1530791264', '691214', '07,04,05,08,10,06,01,03,09,02');
INSERT INTO ac_data_pk10bj VALUES ('30968', '1530791566', '691215', '08,09,05,07,06,02,01,03,04,10');
INSERT INTO ac_data_pk10bj VALUES ('30987', '1530791867', '691216', '09,07,04,10,08,02,06,05,01,03');
INSERT INTO ac_data_pk10bj VALUES ('31006', '1530792178', '691217', '04,07,06,05,03,10,02,08,09,01');
INSERT INTO ac_data_pk10bj VALUES ('31025', '1530792477', '691218', '06,01,02,07,05,08,09,04,10,03');
INSERT INTO ac_data_pk10bj VALUES ('31043', '1530792772', '691219', '09,08,06,03,07,01,05,10,04,02');
INSERT INTO ac_data_pk10bj VALUES ('31062', '1530793074', '691220', '07,05,06,02,09,03,01,08,04,10');
INSERT INTO ac_data_pk10bj VALUES ('31080', '1530793373', '691221', '06,05,09,01,08,03,02,07,10,04');
INSERT INTO ac_data_pk10bj VALUES ('31097', '1530793670', '691222', '08,07,01,02,09,04,10,03,05,06');
INSERT INTO ac_data_pk10bj VALUES ('31116', '1530793975', '691223', '06,09,08,03,07,05,10,04,01,02');
INSERT INTO ac_data_pk10bj VALUES ('31134', '1530794264', '691224', '04,05,06,08,02,01,09,03,10,07');
INSERT INTO ac_data_pk10bj VALUES ('31153', '1530794574', '691225', '04,01,02,07,03,09,05,06,08,10');
INSERT INTO ac_data_pk10bj VALUES ('31171', '1530794868', '691226', '08,07,01,05,10,03,06,02,09,04');
INSERT INTO ac_data_pk10bj VALUES ('31189', '1530795166', '691227', '03,02,06,07,08,04,09,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('31208', '1530795474', '691228', '03,06,10,05,01,07,09,02,04,08');
INSERT INTO ac_data_pk10bj VALUES ('31227', '1530795775', '691229', '06,04,03,10,07,02,05,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('31245', '1530796071', '691230', '04,10,09,02,03,01,08,06,07,05');
INSERT INTO ac_data_pk10bj VALUES ('31263', '1530796376', '691231', '03,08,01,05,07,10,02,04,06,09');
INSERT INTO ac_data_pk10bj VALUES ('31282', '1530796677', '691232', '09,04,10,07,01,03,02,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('31300', '1530796979', '691233', '10,03,01,04,07,09,08,06,05,02');
INSERT INTO ac_data_pk10bj VALUES ('31318', '1530797271', '691234', '10,08,09,01,02,03,04,07,06,05');
INSERT INTO ac_data_pk10bj VALUES ('31336', '1530797566', '691235', '04,02,09,03,06,07,01,08,10,05');
INSERT INTO ac_data_pk10bj VALUES ('31356', '1530797878', '691236', '05,10,07,02,03,01,08,06,04,09');
INSERT INTO ac_data_pk10bj VALUES ('31374', '1530798170', '691237', '07,06,08,04,03,02,05,01,10,09');
INSERT INTO ac_data_pk10bj VALUES ('31393', '1530798471', '691238', '10,02,05,03,06,08,01,04,07,09');
INSERT INTO ac_data_pk10bj VALUES ('31411', '1530798763', '691239', '05,04,06,01,09,02,03,07,10,08');
INSERT INTO ac_data_pk10bj VALUES ('31430', '1530799071', '691240', '07,09,10,08,03,04,06,02,01,05');
INSERT INTO ac_data_pk10bj VALUES ('31448', '1530799366', '691241', '10,09,04,03,05,06,07,02,01,08');
INSERT INTO ac_data_pk10bj VALUES ('31467', '1530799668', '691242', '04,01,08,09,03,07,10,06,02,05');
INSERT INTO ac_data_pk10bj VALUES ('31486', '1530799972', '691243', '01,06,10,04,02,09,03,07,08,05');
INSERT INTO ac_data_pk10bj VALUES ('31504', '1530800263', '691244', '07,04,08,09,02,03,01,06,05,10');
INSERT INTO ac_data_pk10bj VALUES ('31523', '1530800566', '691245', '03,05,07,10,09,06,02,04,08,01');
INSERT INTO ac_data_pk10bj VALUES ('31541', '1530800870', '691246', '06,07,03,08,02,05,09,01,10,04');
INSERT INTO ac_data_pk10bj VALUES ('31560', '1530801167', '691247', '06,10,02,09,08,04,07,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('31580', '1530801478', '691248', '10,02,08,07,09,06,03,04,05,01');
INSERT INTO ac_data_pk10bj VALUES ('31598', '1530801763', '691249', '02,01,07,03,05,09,08,04,06,10');
INSERT INTO ac_data_pk10bj VALUES ('31616', '1530802066', '691250', '03,01,04,02,05,10,06,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('31634', '1530802371', '691251', '09,02,07,01,06,10,05,03,04,08');
INSERT INTO ac_data_pk10bj VALUES ('31652', '1530802669', '691252', '10,09,04,03,02,01,08,07,06,05');
INSERT INTO ac_data_pk10bj VALUES ('31671', '1530802971', '691253', '09,05,06,07,04,08,02,03,01,10');
INSERT INTO ac_data_pk10bj VALUES ('31690', '1530803270', '691254', '08,03,09,02,07,01,04,05,10,06');
INSERT INTO ac_data_pk10bj VALUES ('31708', '1530803564', '691255', '02,07,06,09,10,01,08,04,05,03');
INSERT INTO ac_data_pk10bj VALUES ('31727', '1530803871', '691256', '02,04,10,05,08,07,01,06,09,03');
INSERT INTO ac_data_pk10bj VALUES ('31746', '1530804174', '691257', '03,04,06,01,10,09,08,07,05,02');
INSERT INTO ac_data_pk10bj VALUES ('31764', '1530804474', '691258', '07,05,03,08,06,10,01,02,09,04');
INSERT INTO ac_data_pk10bj VALUES ('31782', '1530804762', '691259', '05,04,07,10,02,09,01,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('31801', '1530805067', '691260', '09,05,04,01,03,07,08,02,10,06');
INSERT INTO ac_data_pk10bj VALUES ('31820', '1530805363', '691261', '08,02,01,07,06,10,04,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('31839', '1530805674', '691262', '07,09,08,10,03,02,06,01,04,05');
INSERT INTO ac_data_pk10bj VALUES ('31858', '1530805967', '691263', '05,10,02,06,04,07,03,08,09,01');
INSERT INTO ac_data_pk10bj VALUES ('31878', '1530806278', '691264', '08,04,02,03,01,05,06,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('31920', '1530839266', '691265', '06,05,04,01,02,08,10,03,07,09');
INSERT INTO ac_data_pk10bj VALUES ('31939', '1530839572', '691266', '02,04,03,06,08,01,05,09,07,10');
INSERT INTO ac_data_pk10bj VALUES ('31957', '1530839872', '691267', '04,10,09,03,08,07,01,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('31975', '1530840168', '691268', '01,04,03,02,05,06,08,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('31993', '1530840477', '691269', '06,05,09,02,01,04,03,08,07,10');
INSERT INTO ac_data_pk10bj VALUES ('32011', '1530840762', '691270', '03,04,07,01,02,09,10,06,08,05');
INSERT INTO ac_data_pk10bj VALUES ('32030', '1530841067', '691271', '09,01,04,07,06,05,03,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('32048', '1530841376', '691272', '01,03,04,09,10,02,05,06,08,07');
INSERT INTO ac_data_pk10bj VALUES ('32066', '1530841674', '691273', '05,06,04,10,01,09,08,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('32084', '1530841963', '691274', '03,09,05,02,04,10,01,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('32102', '1530842267', '691275', '07,03,02,04,01,06,09,05,10,08');
INSERT INTO ac_data_pk10bj VALUES ('32120', '1530842563', '691276', '06,10,09,07,04,05,02,03,08,01');
INSERT INTO ac_data_pk10bj VALUES ('32139', '1530842878', '691277', '05,04,01,07,06,03,02,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('32157', '1530843159', '691278', '09,06,02,10,05,04,08,07,01,03');
INSERT INTO ac_data_pk10bj VALUES ('32177', '1530843476', '691279', '07,05,10,04,01,02,09,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('32195', '1530843771', '691280', '05,07,03,10,04,01,08,02,09,06');
INSERT INTO ac_data_pk10bj VALUES ('32213', '1530844066', '691281', '02,07,01,08,10,09,03,06,05,04');
INSERT INTO ac_data_pk10bj VALUES ('32232', '1530844371', '691282', '08,05,03,01,04,10,02,09,07,06');
INSERT INTO ac_data_pk10bj VALUES ('32250', '1530844668', '691283', '01,06,08,09,10,04,07,02,05,03');
INSERT INTO ac_data_pk10bj VALUES ('32269', '1530844969', '691284', '02,04,10,05,03,08,09,06,07,01');
INSERT INTO ac_data_pk10bj VALUES ('32286', '1530845267', '691285', '02,04,08,03,01,09,07,06,05,10');
INSERT INTO ac_data_pk10bj VALUES ('32304', '1530845569', '691286', '05,04,09,01,10,08,07,03,06,02');
INSERT INTO ac_data_pk10bj VALUES ('32322', '1530845864', '691287', '07,08,04,03,10,06,02,09,05,01');
INSERT INTO ac_data_pk10bj VALUES ('32339', '1530846162', '691288', '01,05,04,02,08,03,06,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('32358', '1530846474', '691289', '08,06,03,10,09,05,07,04,02,01');
INSERT INTO ac_data_pk10bj VALUES ('32375', '1530846764', '691290', '09,08,07,04,10,01,02,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('32394', '1530847075', '691291', '10,04,01,07,09,08,05,06,02,03');
INSERT INTO ac_data_pk10bj VALUES ('32412', '1530847362', '691292', '09,02,10,08,07,06,05,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('32430', '1530847664', '691293', '03,05,06,01,09,02,07,04,08,10');
INSERT INTO ac_data_pk10bj VALUES ('32449', '1530847973', '691294', '02,07,06,09,03,10,04,01,05,08');
INSERT INTO ac_data_pk10bj VALUES ('32466', '1530848262', '691295', '09,10,04,03,06,02,08,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('32484', '1530848571', '691296', '09,01,08,02,05,04,07,03,06,10');
INSERT INTO ac_data_pk10bj VALUES ('32501', '1530848863', '691297', '10,04,01,09,06,03,05,08,02,07');
INSERT INTO ac_data_pk10bj VALUES ('32520', '1530849182', '691298', '01,05,09,10,02,07,08,06,04,03');
INSERT INTO ac_data_pk10bj VALUES ('32537', '1530849465', '691299', '09,02,06,04,01,07,05,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('32556', '1530849764', '691300', '07,06,03,10,04,09,05,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('32574', '1530850069', '691301', '09,02,05,01,03,06,07,08,10,04');
INSERT INTO ac_data_pk10bj VALUES ('32591', '1530850373', '691302', '01,02,04,05,10,08,07,06,09,03');
INSERT INTO ac_data_pk10bj VALUES ('32608', '1530850666', '691303', '09,06,08,04,01,03,05,07,02,10');
INSERT INTO ac_data_pk10bj VALUES ('32627', '1530850981', '691304', '02,09,05,06,04,08,07,01,10,03');
INSERT INTO ac_data_pk10bj VALUES ('32644', '1530851265', '691305', '02,08,09,04,03,05,01,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('32658', '1530851566', '691306', '08,04,06,02,05,09,01,03,10,07');
INSERT INTO ac_data_pk10bj VALUES ('32676', '1530851862', '691307', '08,07,04,02,03,05,09,01,06,10');
INSERT INTO ac_data_pk10bj VALUES ('32694', '1530852163', '691308', '03,09,02,10,04,08,07,06,05,01');
INSERT INTO ac_data_pk10bj VALUES ('32713', '1530852469', '691309', '10,01,04,09,06,02,07,08,05,03');
INSERT INTO ac_data_pk10bj VALUES ('32732', '1530852764', '691310', '09,03,02,10,07,06,08,01,05,04');
INSERT INTO ac_data_pk10bj VALUES ('32750', '1530853072', '691311', '08,01,07,03,05,04,06,10,02,09');
INSERT INTO ac_data_pk10bj VALUES ('32767', '1530853364', '691312', '06,01,08,10,03,05,07,04,02,09');
INSERT INTO ac_data_pk10bj VALUES ('32785', '1530853664', '691313', '04,02,05,10,01,09,07,03,08,06');
INSERT INTO ac_data_pk10bj VALUES ('32803', '1530853967', '691314', '10,09,02,01,07,06,08,04,03,05');
INSERT INTO ac_data_pk10bj VALUES ('32822', '1530854269', '691315', '01,09,04,06,10,03,07,08,02,05');
INSERT INTO ac_data_pk10bj VALUES ('32840', '1530854573', '691316', '10,05,02,08,04,07,03,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('32858', '1530854869', '691317', '08,07,09,02,03,04,06,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('32877', '1530855177', '691318', '04,03,06,10,07,08,01,09,05,02');
INSERT INTO ac_data_pk10bj VALUES ('32894', '1530855460', '691319', '08,05,10,04,03,07,01,02,06,09');
INSERT INTO ac_data_pk10bj VALUES ('32913', '1530855764', '691320', '09,06,03,10,02,08,04,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('32932', '1530856077', '691321', '07,04,09,05,10,02,08,01,03,06');
INSERT INTO ac_data_pk10bj VALUES ('32949', '1530856368', '691322', '03,06,10,08,01,04,07,02,09,05');
INSERT INTO ac_data_pk10bj VALUES ('32968', '1530856665', '691323', '09,02,06,04,07,03,01,08,10,05');
INSERT INTO ac_data_pk10bj VALUES ('32986', '1530856974', '691324', '03,01,04,07,08,10,09,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('33005', '1530857274', '691325', '10,02,08,09,06,04,03,07,05,01');
INSERT INTO ac_data_pk10bj VALUES ('33023', '1530857575', '691326', '09,07,01,05,06,04,08,10,03,02');
INSERT INTO ac_data_pk10bj VALUES ('33041', '1530857871', '691327', '02,09,01,05,06,04,07,10,08,03');
INSERT INTO ac_data_pk10bj VALUES ('33059', '1530858183', '691328', '03,08,06,05,07,09,02,01,10,04');
INSERT INTO ac_data_pk10bj VALUES ('33075', '1530858469', '691329', '02,07,10,09,01,06,08,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('33094', '1530858769', '691330', '10,04,07,08,06,02,09,03,05,01');
INSERT INTO ac_data_pk10bj VALUES ('33112', '1530859073', '691331', '07,04,10,06,02,01,08,05,09,03');
INSERT INTO ac_data_pk10bj VALUES ('33130', '1530859369', '691332', '02,09,07,06,05,01,10,04,08,03');
INSERT INTO ac_data_pk10bj VALUES ('33148', '1530859671', '691333', '08,03,06,04,02,07,05,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('33166', '1530859969', '691334', '05,04,07,06,08,01,03,09,02,10');
INSERT INTO ac_data_pk10bj VALUES ('33184', '1530860268', '691335', '01,10,09,02,05,03,07,04,08,06');
INSERT INTO ac_data_pk10bj VALUES ('33202', '1530860575', '691336', '05,10,09,06,04,03,07,08,02,01');
INSERT INTO ac_data_pk10bj VALUES ('33220', '1530860869', '691337', '10,02,09,03,01,06,04,08,07,05');
INSERT INTO ac_data_pk10bj VALUES ('33239', '1530861177', '691338', '08,04,03,05,07,10,06,09,01,02');
INSERT INTO ac_data_pk10bj VALUES ('33257', '1530861463', '691339', '03,08,04,01,05,02,09,07,10,06');
INSERT INTO ac_data_pk10bj VALUES ('33275', '1530861772', '691340', '03,07,04,01,10,05,08,06,02,09');
INSERT INTO ac_data_pk10bj VALUES ('33293', '1530862074', '691341', '09,07,06,02,04,05,08,10,03,01');
INSERT INTO ac_data_pk10bj VALUES ('33311', '1530862368', '691342', '05,08,04,10,09,03,07,02,01,06');
INSERT INTO ac_data_pk10bj VALUES ('33329', '1530862676', '691343', '01,02,07,04,05,10,03,08,06,09');
INSERT INTO ac_data_pk10bj VALUES ('33346', '1530862966', '691344', '09,08,07,03,10,05,01,04,06,02');
INSERT INTO ac_data_pk10bj VALUES ('33361', '1530863277', '691345', '10,01,06,09,05,07,03,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('33378', '1530863561', '691346', '05,02,01,03,06,10,09,08,04,07');
INSERT INTO ac_data_pk10bj VALUES ('33393', '1530863875', '691347', '07,02,04,01,10,06,05,09,08,03');
INSERT INTO ac_data_pk10bj VALUES ('33410', '1530864170', '691348', '08,05,04,03,02,01,10,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('33428', '1530864471', '691349', '07,01,02,08,04,10,09,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('33446', '1530864768', '691350', '10,05,03,07,02,06,08,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('33464', '1530865066', '691351', '04,09,08,01,03,05,06,07,10,02');
INSERT INTO ac_data_pk10bj VALUES ('33483', '1530865374', '691352', '03,02,09,01,08,07,06,04,10,05');
INSERT INTO ac_data_pk10bj VALUES ('33501', '1530865671', '691353', '06,10,07,04,08,09,05,01,03,02');
INSERT INTO ac_data_pk10bj VALUES ('33519', '1530865969', '691354', '01,03,02,07,09,10,04,05,06,08');
INSERT INTO ac_data_pk10bj VALUES ('33537', '1530866277', '691355', '01,06,09,10,05,02,08,03,07,04');
INSERT INTO ac_data_pk10bj VALUES ('33554', '1530866570', '691356', '01,08,09,07,10,06,04,05,03,02');
INSERT INTO ac_data_pk10bj VALUES ('33573', '1530866872', '691357', '03,09,06,07,10,02,05,08,04,01');
INSERT INTO ac_data_pk10bj VALUES ('33592', '1530867170', '691358', '04,06,09,05,02,03,08,01,07,10');
INSERT INTO ac_data_pk10bj VALUES ('33611', '1530867477', '691359', '03,02,05,04,01,08,10,06,09,07');
INSERT INTO ac_data_pk10bj VALUES ('33628', '1530867768', '691360', '04,03,02,06,07,09,01,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('33645', '1530868074', '691361', '09,02,06,01,04,03,10,08,07,05');
INSERT INTO ac_data_pk10bj VALUES ('33662', '1530868369', '691362', '06,08,07,04,01,09,02,05,10,03');
INSERT INTO ac_data_pk10bj VALUES ('33678', '1530868663', '691363', '09,08,07,02,04,05,03,06,01,10');
INSERT INTO ac_data_pk10bj VALUES ('33695', '1530868966', '691364', '09,07,10,03,01,06,02,05,08,04');
INSERT INTO ac_data_pk10bj VALUES ('33712', '1530869270', '691365', '10,05,03,04,01,02,09,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('33729', '1530869574', '691366', '03,01,05,07,04,06,08,09,02,10');
INSERT INTO ac_data_pk10bj VALUES ('33745', '1530869869', '691367', '05,07,03,04,06,01,10,09,02,08');
INSERT INTO ac_data_pk10bj VALUES ('33762', '1530870176', '691368', '04,09,02,06,07,05,08,10,03,01');
INSERT INTO ac_data_pk10bj VALUES ('33779', '1530870464', '691369', '07,09,01,10,03,04,05,08,06,02');
INSERT INTO ac_data_pk10bj VALUES ('33797', '1530870774', '691370', '08,03,09,06,07,02,05,01,10,04');
INSERT INTO ac_data_pk10bj VALUES ('33813', '1530871063', '691371', '04,01,05,09,07,03,02,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('33831', '1530871370', '691372', '04,07,10,01,06,02,03,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('33849', '1530871664', '691373', '07,03,05,04,01,02,06,10,09,08');
INSERT INTO ac_data_pk10bj VALUES ('33867', '1530871974', '691374', '06,10,03,09,01,02,07,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('33884', '1530872265', '691375', '04,03,05,02,06,09,07,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('33903', '1530872569', '691376', '03,01,07,04,05,09,10,08,06,02');
INSERT INTO ac_data_pk10bj VALUES ('33921', '1530872874', '691377', '10,01,02,04,05,09,08,07,03,06');
INSERT INTO ac_data_pk10bj VALUES ('33938', '1530873179', '691378', '08,06,02,05,03,04,09,10,07,01');
INSERT INTO ac_data_pk10bj VALUES ('33954', '1530873468', '691379', '03,01,02,07,09,06,08,10,04,05');
INSERT INTO ac_data_pk10bj VALUES ('33971', '1530873763', '691380', '10,08,04,05,07,01,02,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('33988', '1530874068', '691381', '01,08,05,06,09,03,07,10,02,04');
INSERT INTO ac_data_pk10bj VALUES ('34007', '1530874375', '691382', '10,09,08,01,03,05,02,04,06,07');
INSERT INTO ac_data_pk10bj VALUES ('34023', '1530874663', '691383', '08,03,02,04,06,10,05,07,01,09');
INSERT INTO ac_data_pk10bj VALUES ('34042', '1530874978', '691384', '06,07,05,01,08,10,04,09,02,03');
INSERT INTO ac_data_pk10bj VALUES ('34059', '1530875269', '691385', '10,09,03,02,07,06,01,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('34077', '1530875566', '691386', '04,01,02,06,09,05,07,10,08,03');
INSERT INTO ac_data_pk10bj VALUES ('34094', '1530875870', '691387', '01,03,05,02,08,09,10,04,06,07');
INSERT INTO ac_data_pk10bj VALUES ('34111', '1530876166', '691388', '09,10,06,08,01,03,05,07,02,04');
INSERT INTO ac_data_pk10bj VALUES ('34129', '1530876486', '691389', '06,02,10,01,08,04,05,07,09,03');
INSERT INTO ac_data_pk10bj VALUES ('34146', '1530876765', '691390', '04,01,10,07,03,06,08,09,05,02');
INSERT INTO ac_data_pk10bj VALUES ('34165', '1530877066', '691391', '08,07,03,01,05,06,02,04,09,10');
INSERT INTO ac_data_pk10bj VALUES ('34182', '1530877368', '691392', '02,07,08,01,10,04,03,09,06,05');
INSERT INTO ac_data_pk10bj VALUES ('34199', '1530877664', '691393', '09,03,08,07,05,04,01,10,02,06');
INSERT INTO ac_data_pk10bj VALUES ('34211', '1530877971', '691394', '06,09,08,04,10,07,02,01,05,03');
INSERT INTO ac_data_pk10bj VALUES ('34228', '1530878270', '691395', '06,08,02,10,04,03,05,09,01,07');
INSERT INTO ac_data_pk10bj VALUES ('34247', '1530878574', '691396', '04,01,09,08,10,03,07,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('34264', '1530878870', '691397', '10,07,08,01,02,05,09,03,04,06');
INSERT INTO ac_data_pk10bj VALUES ('34282', '1530879169', '691398', '08,07,09,04,03,10,02,05,06,01');
INSERT INTO ac_data_pk10bj VALUES ('34299', '1530879474', '691399', '04,05,01,09,08,02,06,10,07,03');
INSERT INTO ac_data_pk10bj VALUES ('34315', '1530879763', '691400', '05,01,04,03,02,10,09,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('34331', '1530880072', '691401', '07,08,09,04,06,03,10,01,02,05');
INSERT INTO ac_data_pk10bj VALUES ('34349', '1530880379', '691402', '09,02,03,08,05,01,04,06,07,10');
INSERT INTO ac_data_pk10bj VALUES ('34366', '1530880662', '691403', '09,01,10,06,05,03,08,07,02,04');
INSERT INTO ac_data_pk10bj VALUES ('34383', '1530880965', '691404', '06,03,04,08,01,02,05,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('34402', '1530881276', '691405', '03,01,06,04,05,07,09,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('34419', '1530881568', '691406', '04,03,10,07,02,06,05,09,01,08');
INSERT INTO ac_data_pk10bj VALUES ('34436', '1530881861', '691407', '02,01,05,04,03,08,06,10,09,07');
INSERT INTO ac_data_pk10bj VALUES ('34455', '1530882175', '691408', '09,10,07,04,05,03,02,08,06,01');
INSERT INTO ac_data_pk10bj VALUES ('34471', '1530882473', '691409', '10,02,04,03,09,08,01,06,05,07');
INSERT INTO ac_data_pk10bj VALUES ('34488', '1530882766', '691410', '04,03,02,06,08,10,01,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('34507', '1530883073', '691411', '02,08,05,09,03,04,06,01,07,10');
INSERT INTO ac_data_pk10bj VALUES ('34524', '1530883363', '691412', '01,03,07,08,06,05,04,02,10,09');
INSERT INTO ac_data_pk10bj VALUES ('34543', '1530883673', '691413', '08,06,03,02,04,07,05,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('34561', '1530883976', '691414', '06,04,08,01,07,09,10,02,03,05');
INSERT INTO ac_data_pk10bj VALUES ('34578', '1530884266', '691415', '01,05,04,07,09,08,02,10,06,03');
INSERT INTO ac_data_pk10bj VALUES ('34597', '1530884566', '691416', '06,07,03,08,04,05,02,01,10,09');
INSERT INTO ac_data_pk10bj VALUES ('34615', '1530884861', '691417', '01,06,05,08,04,07,10,03,02,09');
INSERT INTO ac_data_pk10bj VALUES ('34632', '1530885163', '691418', '01,03,05,08,07,10,06,02,04,09');
INSERT INTO ac_data_pk10bj VALUES ('34651', '1530885467', '691419', '06,10,03,01,05,09,07,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('34670', '1530885783', '691420', '10,05,01,08,02,04,06,09,03,07');
INSERT INTO ac_data_pk10bj VALUES ('34685', '1530886071', '691421', '02,08,09,05,10,04,06,07,03,01');
INSERT INTO ac_data_pk10bj VALUES ('34703', '1530886363', '691422', '10,05,07,02,04,03,06,09,01,08');
INSERT INTO ac_data_pk10bj VALUES ('34722', '1530886678', '691423', '09,04,02,08,07,01,05,03,10,06');
INSERT INTO ac_data_pk10bj VALUES ('34739', '1530886966', '691424', '02,04,06,05,03,09,08,01,10,07');
INSERT INTO ac_data_pk10bj VALUES ('34757', '1530887264', '691425', '03,04,07,05,10,08,01,09,06,02');
INSERT INTO ac_data_pk10bj VALUES ('34775', '1530887567', '691426', '05,01,02,06,10,07,03,08,04,09');
INSERT INTO ac_data_pk10bj VALUES ('34794', '1530887875', '691427', '10,07,09,08,03,02,01,05,06,04');
INSERT INTO ac_data_pk10bj VALUES ('34812', '1530888167', '691428', '02,09,05,06,08,01,07,03,04,10');
INSERT INTO ac_data_pk10bj VALUES ('34830', '1530888473', '691429', '09,04,06,07,05,02,03,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('34847', '1530888777', '691430', '09,05,08,03,04,01,10,02,06,07');
INSERT INTO ac_data_pk10bj VALUES ('34864', '1530889066', '691431', '02,10,04,08,09,01,07,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('34882', '1530889368', '691432', '01,06,07,02,09,04,08,05,03,10');
INSERT INTO ac_data_pk10bj VALUES ('34900', '1530889675', '691433', '06,07,10,08,09,05,04,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('34917', '1530889966', '691434', '10,02,05,06,01,07,09,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('34935', '1530890268', '691435', '04,01,06,10,09,05,03,02,08,07');
INSERT INTO ac_data_pk10bj VALUES ('34953', '1530890577', '691436', '09,03,01,04,02,07,05,10,08,06');
INSERT INTO ac_data_pk10bj VALUES ('34970', '1530890866', '691437', '05,01,03,04,07,09,02,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('34987', '1530891166', '691438', '01,02,10,06,08,04,07,09,03,05');
INSERT INTO ac_data_pk10bj VALUES ('35005', '1530891465', '691439', '01,06,02,07,10,03,09,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('35023', '1530891774', '691440', '04,01,06,09,10,07,08,02,05,03');
INSERT INTO ac_data_pk10bj VALUES ('35040', '1530892058', '691441', '05,02,10,04,08,09,03,06,07,01');
INSERT INTO ac_data_pk10bj VALUES ('35056', '1530892361', '691442', '03,07,06,02,08,04,01,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('35073', '1530892665', '691443', '02,04,10,01,07,06,08,09,03,05');
INSERT INTO ac_data_pk10bj VALUES ('35114', '1530925757', '691444', '01,09,10,05,08,06,07,02,03,04');
INSERT INTO ac_data_pk10bj VALUES ('35116', '1530926077', '691445', '08,10,09,05,02,01,06,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('35121', '1530926348', '691446', '07,05,01,09,10,02,04,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('35126', '1530926575', '691447', '06,09,07,05,01,10,02,03,08,04');
INSERT INTO ac_data_pk10bj VALUES ('35136', '1530926947', '691448', '06,02,05,10,09,01,07,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('35140', '1530927483', '691450', '10,07,04,09,03,05,01,08,06,02');
INSERT INTO ac_data_pk10bj VALUES ('35146', '1530927775', '691451', '08,07,10,03,05,09,02,01,04,06');
INSERT INTO ac_data_pk10bj VALUES ('35150', '1530928097', '691452', '08,10,03,07,04,05,09,06,01,02');
INSERT INTO ac_data_pk10bj VALUES ('35156', '1530928379', '691453', '06,05,09,04,07,03,02,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('35163', '1530928957', '691454', '05,06,04,01,02,09,08,10,03,07');
INSERT INTO ac_data_pk10bj VALUES ('35164', '1530929187', '691455', '02,03,07,08,01,10,06,05,04,09');
INSERT INTO ac_data_pk10bj VALUES ('35166', '1530929282', '691456', '09,05,01,10,06,03,02,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('35173', '1530929624', '691457', '04,05,06,01,10,03,02,07,08,09');
INSERT INTO ac_data_pk10bj VALUES ('35176', '1530929951', '691458', '06,10,09,01,03,04,05,02,07,08');
INSERT INTO ac_data_pk10bj VALUES ('35179', '1530930292', '691459', '08,06,07,09,10,03,01,02,04,05');
INSERT INTO ac_data_pk10bj VALUES ('35184', '1530930521', '691460', '04,01,09,10,07,05,08,06,03,02');
INSERT INTO ac_data_pk10bj VALUES ('35185', '1530930841', '691461', '10,04,08,05,09,01,07,02,03,06');
INSERT INTO ac_data_pk10bj VALUES ('35187', '1530931192', '691462', '06,07,01,05,08,10,03,04,02,09');
INSERT INTO ac_data_pk10bj VALUES ('35193', '1530931375', '691463', '09,01,06,04,03,05,10,02,07,08');
INSERT INTO ac_data_pk10bj VALUES ('35196', '1530931776', '691464', '04,07,09,05,10,02,01,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('35201', '1530931979', '691465', '03,05,10,09,06,04,01,08,07,02');
INSERT INTO ac_data_pk10bj VALUES ('35206', '1530932421', '691466', '03,05,09,06,04,08,07,01,02,10');
INSERT INTO ac_data_pk10bj VALUES ('35210', '1530932664', '691467', '10,06,09,07,03,02,05,04,01,08');
INSERT INTO ac_data_pk10bj VALUES ('35215', '1530932898', '691468', '01,03,09,10,04,08,02,05,06,07');
INSERT INTO ac_data_pk10bj VALUES ('35222', '1530933170', '691469', '02,09,06,03,04,10,01,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('35228', '1530933482', '691470', '02,04,06,09,01,03,08,10,07,05');
INSERT INTO ac_data_pk10bj VALUES ('35232', '1530933803', '691471', '03,04,06,07,08,10,01,05,09,02');
INSERT INTO ac_data_pk10bj VALUES ('35236', '1530934069', '691472', '06,08,02,03,05,10,09,07,04,01');
INSERT INTO ac_data_pk10bj VALUES ('35242', '1530934413', '691473', '10,06,03,07,08,01,09,04,05,02');
INSERT INTO ac_data_pk10bj VALUES ('35249', '1530934952', '691474', '03,05,09,08,02,07,04,01,10,06');
INSERT INTO ac_data_pk10bj VALUES ('35250', '1530935058', '691475', '05,02,10,06,09,07,03,04,01,08');
INSERT INTO ac_data_pk10bj VALUES ('35254', '1530935359', '691476', '08,01,05,06,09,03,04,02,07,10');
INSERT INTO ac_data_pk10bj VALUES ('35260', '1530935662', '691477', '09,07,05,08,06,10,01,02,04,03');
INSERT INTO ac_data_pk10bj VALUES ('35269', '1530935864', '691478', '10,06,09,04,02,07,08,03,05,01');
INSERT INTO ac_data_pk10bj VALUES ('35289', '1530936171', '691479', '07,04,03,02,08,09,06,10,05,01');
INSERT INTO ac_data_pk10bj VALUES ('35308', '1530936471', '691480', '06,02,03,10,08,01,07,04,09,05');
INSERT INTO ac_data_pk10bj VALUES ('35326', '1530936765', '691481', '03,01,06,02,05,04,09,07,08,10');
INSERT INTO ac_data_pk10bj VALUES ('35340', '1530940013', '691491', '04,02,08,10,05,06,09,07,03,01');
INSERT INTO ac_data_pk10bj VALUES ('35343', '1530940077', '691492', '01,05,07,06,08,04,10,02,03,09');
INSERT INTO ac_data_pk10bj VALUES ('35360', '1530940381', '691493', '08,07,06,02,03,05,04,01,09,10');
INSERT INTO ac_data_pk10bj VALUES ('35375', '1530940680', '691494', '04,10,05,07,06,08,09,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('35388', '1530940974', '691495', '09,10,06,01,04,02,08,05,03,07');
INSERT INTO ac_data_pk10bj VALUES ('35400', '1530942832', '691501', '09,03,01,05,10,07,02,08,04,06');
INSERT INTO ac_data_pk10bj VALUES ('35419', '1530943070', '691502', '06,10,03,08,04,09,07,05,02,01');
INSERT INTO ac_data_pk10bj VALUES ('35450', '1530943363', '691503', '03,06,05,04,02,10,01,08,09,07');
INSERT INTO ac_data_pk10bj VALUES ('35486', '1530943670', '691504', '01,04,09,08,02,10,06,03,07,05');
INSERT INTO ac_data_pk10bj VALUES ('35522', '1530943965', '691505', '03,08,09,05,04,01,10,07,06,02');
INSERT INTO ac_data_pk10bj VALUES ('35559', '1530944263', '691506', '08,09,05,10,02,04,07,06,03,01');
INSERT INTO ac_data_pk10bj VALUES ('35592', '1530944564', '691507', '02,04,05,03,09,01,10,08,06,07');
INSERT INTO ac_data_pk10bj VALUES ('35625', '1530944863', '691508', '01,05,07,08,10,06,04,02,09,03');
INSERT INTO ac_data_pk10bj VALUES ('35659', '1530945165', '691509', '10,09,07,08,03,01,02,05,06,04');
INSERT INTO ac_data_pk10bj VALUES ('35693', '1530945461', '691510', '02,08,05,10,01,06,07,03,04,09');
INSERT INTO ac_data_pk10bj VALUES ('35728', '1530945766', '691511', '09,06,02,05,07,01,03,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('35764', '1530946073', '691512', '04,01,09,02,07,03,06,05,10,08');
INSERT INTO ac_data_pk10bj VALUES ('35799', '1530946365', '691513', '03,05,09,02,04,10,08,06,07,01');
INSERT INTO ac_data_pk10bj VALUES ('35835', '1530946676', '691514', '06,05,09,07,04,08,01,02,10,03');
INSERT INTO ac_data_pk10bj VALUES ('35868', '1530946970', '691515', '09,03,01,05,07,10,02,04,06,08');
INSERT INTO ac_data_pk10bj VALUES ('35898', '1530947265', '691516', '04,09,03,07,02,05,01,06,08,10');
INSERT INTO ac_data_pk10bj VALUES ('35932', '1530947571', '691517', '08,09,04,06,01,03,07,05,10,02');
INSERT INTO ac_data_pk10bj VALUES ('35967', '1530947872', '691518', '08,10,01,06,07,04,03,02,05,09');
INSERT INTO ac_data_pk10bj VALUES ('36003', '1530948173', '691519', '09,08,05,10,06,01,07,02,04,03');
INSERT INTO ac_data_pk10bj VALUES ('36036', '1530948466', '691520', '08,03,09,02,07,10,04,01,06,05');
INSERT INTO ac_data_pk10bj VALUES ('36069', '1530948762', '691521', '01,03,08,09,06,07,02,04,05,10');
INSERT INTO ac_data_pk10bj VALUES ('36105', '1530949063', '691522', '01,09,02,10,06,03,04,07,05,08');
INSERT INTO ac_data_pk10bj VALUES ('36141', '1530949363', '691523', '01,02,07,04,03,10,09,05,08,06');
INSERT INTO ac_data_pk10bj VALUES ('36179', '1530949661', '691524', '03,09,01,06,02,10,07,05,04,08');
INSERT INTO ac_data_pk10bj VALUES ('36216', '1530949969', '691525', '04,05,06,10,07,02,08,09,03,01');
INSERT INTO ac_data_pk10bj VALUES ('36252', '1530950264', '691526', '03,05,08,10,07,09,02,06,04,01');
INSERT INTO ac_data_pk10bj VALUES ('36290', '1530950565', '691527', '05,01,09,03,02,10,06,04,07,08');
INSERT INTO ac_data_pk10bj VALUES ('36328', '1530950864', '691528', '01,08,09,02,07,03,06,05,04,10');
INSERT INTO ac_data_pk10bj VALUES ('36365', '1530951171', '691529', '07,10,09,01,05,06,04,02,08,03');
INSERT INTO ac_data_pk10bj VALUES ('36400', '1530951466', '691530', '02,07,09,06,04,05,08,01,03,10');
INSERT INTO ac_data_pk10bj VALUES ('36433', '1530951762', '691531', '05,06,04,09,02,01,03,10,07,08');
INSERT INTO ac_data_pk10bj VALUES ('36465', '1530952065', '691532', '06,03,07,02,08,10,05,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('36500', '1530952370', '691533', '06,03,09,02,04,05,10,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('36538', '1530952673', '691534', '07,03,02,01,06,08,10,05,04,09');
INSERT INTO ac_data_pk10bj VALUES ('36575', '1530952969', '691535', '08,02,07,06,05,09,10,04,03,01');
INSERT INTO ac_data_pk10bj VALUES ('36610', '1530953268', '691536', '08,05,04,07,03,01,02,09,06,10');
INSERT INTO ac_data_pk10bj VALUES ('36647', '1530953566', '691537', '05,03,10,06,04,01,02,09,08,07');
INSERT INTO ac_data_pk10bj VALUES ('36684', '1530953865', '691538', '04,06,03,09,02,05,10,07,01,08');
INSERT INTO ac_data_pk10bj VALUES ('36723', '1530954176', '691539', '07,02,09,03,06,10,05,01,08,04');
INSERT INTO ac_data_pk10bj VALUES ('36759', '1530954473', '691540', '05,07,03,09,04,06,02,10,01,08');
INSERT INTO ac_data_pk10bj VALUES ('36794', '1530954767', '691541', '04,02,08,10,06,03,09,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('36831', '1530955067', '691542', '07,02,04,09,01,10,03,06,08,05');
INSERT INTO ac_data_pk10bj VALUES ('36866', '1530955366', '691543', '06,03,02,01,04,10,05,07,08,09');
INSERT INTO ac_data_pk10bj VALUES ('36904', '1530955663', '691544', '07,05,10,04,01,06,02,08,03,09');
INSERT INTO ac_data_pk10bj VALUES ('36940', '1530955967', '691545', '02,10,09,05,06,08,07,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('36972', '1530956263', '691546', '05,03,04,10,08,07,06,09,01,02');
INSERT INTO ac_data_pk10bj VALUES ('37009', '1530956561', '691547', '02,05,03,09,04,08,07,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('37045', '1530956874', '691548', '07,10,01,08,05,04,02,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('37081', '1530957169', '691549', '08,03,10,09,06,05,01,04,02,07');
INSERT INTO ac_data_pk10bj VALUES ('37114', '1530957463', '691550', '03,02,05,08,06,10,07,09,04,01');
INSERT INTO ac_data_pk10bj VALUES ('37152', '1530957774', '691551', '01,05,02,06,03,09,10,08,04,07');
INSERT INTO ac_data_pk10bj VALUES ('37188', '1530958075', '691552', '06,01,05,03,09,04,02,10,07,08');
INSERT INTO ac_data_pk10bj VALUES ('37224', '1530958369', '691553', '03,06,04,10,01,08,05,07,02,09');
INSERT INTO ac_data_pk10bj VALUES ('37262', '1530958670', '691554', '05,06,09,03,04,08,10,07,02,01');
INSERT INTO ac_data_pk10bj VALUES ('37297', '1530958973', '691555', '02,03,01,06,10,08,05,09,04,07');
INSERT INTO ac_data_pk10bj VALUES ('37330', '1530959280', '691556', '05,06,07,04,08,01,09,10,03,02');
INSERT INTO ac_data_pk10bj VALUES ('37362', '1530959570', '691557', '09,02,07,04,10,06,05,01,08,03');
INSERT INTO ac_data_pk10bj VALUES ('37390', '1530959865', '691558', '07,10,02,06,05,08,04,09,03,01');
INSERT INTO ac_data_pk10bj VALUES ('37426', '1530960165', '691559', '09,02,01,04,05,10,07,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('37491', '1530960729', '691560', '06,01,08,03,04,07,05,09,02,10');
INSERT INTO ac_data_pk10bj VALUES ('37497', '1530960774', '691561', '03,04,10,02,07,05,01,08,06,09');
INSERT INTO ac_data_pk10bj VALUES ('37560', '1530961293', '691562', '09,06,08,01,03,07,04,05,02,10');
INSERT INTO ac_data_pk10bj VALUES ('37572', '1530961384', '691563', '05,06,02,08,07,04,09,01,03,10');
INSERT INTO ac_data_pk10bj VALUES ('37606', '1530961684', '691564', '01,08,10,09,06,07,05,04,02,03');
INSERT INTO ac_data_pk10bj VALUES ('37641', '1530961980', '691565', '01,08,03,02,07,05,04,06,10,09');
INSERT INTO ac_data_pk10bj VALUES ('37675', '1530962267', '691566', '10,07,04,08,01,06,02,05,09,03');
INSERT INTO ac_data_pk10bj VALUES ('37711', '1530962575', '691567', '06,08,01,02,04,09,10,07,05,03');
INSERT INTO ac_data_pk10bj VALUES ('37743', '1530962866', '691568', '06,04,07,05,08,01,10,02,09,03');
INSERT INTO ac_data_pk10bj VALUES ('37779', '1530963176', '691569', '03,09,10,07,06,04,05,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('37810', '1530963473', '691570', '10,08,05,01,03,07,04,02,06,09');
INSERT INTO ac_data_pk10bj VALUES ('37839', '1530963785', '691571', '07,04,06,01,09,05,10,08,03,02');
INSERT INTO ac_data_pk10bj VALUES ('37865', '1530964072', '691572', '09,04,01,07,06,05,10,02,08,03');
INSERT INTO ac_data_pk10bj VALUES ('37893', '1530964368', '691573', '04,05,10,06,09,01,08,02,07,03');
INSERT INTO ac_data_pk10bj VALUES ('37920', '1530964676', '691574', '07,04,01,03,05,08,09,06,02,10');
INSERT INTO ac_data_pk10bj VALUES ('37949', '1530964990', '691575', '05,09,02,06,10,03,04,08,07,01');
INSERT INTO ac_data_pk10bj VALUES ('37977', '1530965280', '691576', '05,03,10,01,09,02,07,06,04,08');
INSERT INTO ac_data_pk10bj VALUES ('38003', '1530965580', '691577', '07,05,01,04,02,03,06,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('38031', '1530965872', '691578', '05,07,08,04,02,09,06,01,03,10');
INSERT INTO ac_data_pk10bj VALUES ('38057', '1530966172', '691579', '03,02,01,08,05,04,06,07,10,09');
INSERT INTO ac_data_pk10bj VALUES ('38083', '1530966464', '691580', '06,10,08,02,05,09,03,01,07,04');
INSERT INTO ac_data_pk10bj VALUES ('38110', '1530966776', '691581', '10,09,08,04,06,05,01,03,07,02');
INSERT INTO ac_data_pk10bj VALUES ('38136', '1530967066', '691582', '09,04,06,10,05,08,01,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('38165', '1530967370', '691583', '05,10,09,04,03,07,01,08,06,02');
INSERT INTO ac_data_pk10bj VALUES ('38193', '1530967664', '691584', '10,09,04,01,06,08,05,07,02,03');
INSERT INTO ac_data_pk10bj VALUES ('38222', '1530967966', '691585', '07,09,02,01,03,06,04,10,08,05');
INSERT INTO ac_data_pk10bj VALUES ('38251', '1530968266', '691586', '05,09,02,10,06,01,08,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('38278', '1530968573', '691587', '07,04,03,02,08,05,09,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('38305', '1530968873', '691588', '10,09,02,06,07,05,08,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('38333', '1530969162', '691589', '04,05,09,02,01,06,10,03,07,08');
INSERT INTO ac_data_pk10bj VALUES ('38363', '1530969472', '691590', '02,08,05,10,01,06,07,03,09,04');
INSERT INTO ac_data_pk10bj VALUES ('38389', '1530969765', '691591', '02,05,06,07,04,09,08,03,01,10');
INSERT INTO ac_data_pk10bj VALUES ('38416', '1530970076', '691592', '08,09,03,10,02,06,01,07,04,05');
INSERT INTO ac_data_pk10bj VALUES ('38443', '1530970370', '691593', '06,08,05,01,09,02,10,04,03,07');
INSERT INTO ac_data_pk10bj VALUES ('38469', '1530970663', '691594', '10,01,05,07,08,02,03,06,04,09');
INSERT INTO ac_data_pk10bj VALUES ('38495', '1530970971', '691595', '04,02,08,05,03,07,09,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('38523', '1530971272', '691596', '06,02,01,09,05,03,10,07,04,08');
INSERT INTO ac_data_pk10bj VALUES ('38552', '1530971573', '691597', '09,10,02,08,04,01,05,07,03,06');
INSERT INTO ac_data_pk10bj VALUES ('38578', '1530971872', '691598', '08,05,06,03,01,04,10,07,09,02');
INSERT INTO ac_data_pk10bj VALUES ('38604', '1530972164', '691599', '03,08,06,09,07,04,02,10,01,05');
INSERT INTO ac_data_pk10bj VALUES ('38632', '1530972473', '691600', '05,04,09,06,01,08,03,10,07,02');
INSERT INTO ac_data_pk10bj VALUES ('38657', '1530972768', '691601', '06,03,07,10,01,05,04,08,09,02');
INSERT INTO ac_data_pk10bj VALUES ('38685', '1530973075', '691602', '03,07,05,02,06,04,01,09,10,08');
INSERT INTO ac_data_pk10bj VALUES ('38712', '1530973363', '691603', '08,02,03,07,04,01,06,05,10,09');
INSERT INTO ac_data_pk10bj VALUES ('38741', '1530973669', '691604', '05,01,09,03,02,10,04,06,08,07');
INSERT INTO ac_data_pk10bj VALUES ('38770', '1530973961', '691605', '01,10,02,04,07,03,09,05,08,06');
INSERT INTO ac_data_pk10bj VALUES ('38798', '1530974273', '691606', '05,10,01,03,06,02,07,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('38823', '1530974570', '691607', '10,01,05,06,03,04,02,07,09,08');
INSERT INTO ac_data_pk10bj VALUES ('38852', '1530974871', '691608', '09,02,07,10,05,01,06,04,08,03');
INSERT INTO ac_data_pk10bj VALUES ('38881', '1530975165', '691609', '03,04,02,09,07,10,08,01,06,05');
INSERT INTO ac_data_pk10bj VALUES ('38909', '1530975477', '691610', '09,01,04,03,06,08,07,05,02,10');
INSERT INTO ac_data_pk10bj VALUES ('38933', '1530975777', '691611', '01,02,03,06,08,10,07,05,09,04');
INSERT INTO ac_data_pk10bj VALUES ('38955', '1530976060', '691612', '06,07,08,01,09,02,05,03,04,10');
INSERT INTO ac_data_pk10bj VALUES ('38984', '1530976367', '691613', '01,09,05,03,10,02,04,06,07,08');
INSERT INTO ac_data_pk10bj VALUES ('39013', '1530976676', '691614', '02,08,01,10,06,04,07,05,09,03');
INSERT INTO ac_data_pk10bj VALUES ('39039', '1530976965', '691615', '03,01,09,10,04,06,05,07,02,08');
INSERT INTO ac_data_pk10bj VALUES ('39068', '1530977274', '691616', '09,07,08,01,02,03,10,04,06,05');
INSERT INTO ac_data_pk10bj VALUES ('39093', '1530977566', '691617', '08,07,02,06,04,01,10,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('39122', '1530977870', '691618', '04,08,02,06,09,10,01,07,03,05');
INSERT INTO ac_data_pk10bj VALUES ('39147', '1530978162', '691619', '10,08,06,07,01,02,09,04,05,03');
INSERT INTO ac_data_pk10bj VALUES ('39176', '1530978470', '691620', '07,09,05,10,01,08,02,03,04,06');
INSERT INTO ac_data_pk10bj VALUES ('39204', '1530978761', '691621', '01,08,03,09,02,10,06,05,07,04');
INSERT INTO ac_data_pk10bj VALUES ('39233', '1530979070', '691622', '06,01,02,03,07,09,05,10,04,08');
INSERT INTO ac_data_pk10bj VALUES ('39307', '1531012065', '691623', '01,06,08,09,03,07,04,05,02,10');
INSERT INTO ac_data_pk10bj VALUES ('39336', '1531012373', '691624', '08,07,10,06,01,04,03,02,05,09');
INSERT INTO ac_data_pk10bj VALUES ('39364', '1531012670', '691625', '06,01,10,04,02,08,07,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('39393', '1531012977', '691626', '09,05,10,08,07,04,06,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('39419', '1531013268', '691627', '09,01,02,07,06,10,03,04,08,05');
INSERT INTO ac_data_pk10bj VALUES ('39447', '1531013562', '691628', '07,01,02,05,09,03,04,10,06,08');
INSERT INTO ac_data_pk10bj VALUES ('39477', '1531013872', '691629', '06,10,09,02,08,07,04,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('39505', '1531014170', '691630', '03,01,09,10,07,05,08,06,02,04');
INSERT INTO ac_data_pk10bj VALUES ('39534', '1531014463', '691631', '06,01,05,08,03,07,02,10,04,09');
INSERT INTO ac_data_pk10bj VALUES ('39559', '1531014766', '691632', '02,06,10,07,05,09,04,03,08,01');
INSERT INTO ac_data_pk10bj VALUES ('39588', '1531015077', '691633', '01,06,04,10,03,08,07,02,09,05');
INSERT INTO ac_data_pk10bj VALUES ('39611', '1531015366', '691634', '02,06,10,01,05,08,07,04,03,09');
INSERT INTO ac_data_pk10bj VALUES ('39638', '1531015662', '691635', '10,06,07,05,04,08,03,01,09,02');
INSERT INTO ac_data_pk10bj VALUES ('39668', '1531015978', '691636', '08,10,09,02,04,05,01,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('39692', '1531016272', '691637', '03,09,05,07,01,04,10,06,08,02');
INSERT INTO ac_data_pk10bj VALUES ('39719', '1531016579', '691638', '09,01,07,05,06,03,04,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('39744', '1531016873', '691639', '05,02,03,09,04,07,10,01,08,06');
INSERT INTO ac_data_pk10bj VALUES ('39769', '1531017165', '691640', '03,07,06,02,01,08,09,10,04,05');
INSERT INTO ac_data_pk10bj VALUES ('39796', '1531017463', '691641', '05,08,09,02,07,03,04,06,01,10');
INSERT INTO ac_data_pk10bj VALUES ('39826', '1531017772', '691642', '07,08,02,10,04,09,05,03,06,01');
INSERT INTO ac_data_pk10bj VALUES ('39855', '1531018075', '691643', '07,03,06,01,05,09,02,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('39883', '1531018364', '691644', '08,04,03,05,10,06,01,02,09,07');
INSERT INTO ac_data_pk10bj VALUES ('39913', '1531018673', '691645', '08,04,05,07,10,09,01,03,02,06');
INSERT INTO ac_data_pk10bj VALUES ('39941', '1531018966', '691646', '05,06,02,03,10,09,04,07,01,08');
INSERT INTO ac_data_pk10bj VALUES ('39969', '1531019271', '691647', '03,07,06,01,04,10,09,08,05,02');
INSERT INTO ac_data_pk10bj VALUES ('39996', '1531019570', '691648', '07,08,06,02,01,10,05,03,04,09');
INSERT INTO ac_data_pk10bj VALUES ('40019', '1531019862', '691649', '03,01,06,02,10,04,07,09,08,05');
INSERT INTO ac_data_pk10bj VALUES ('40046', '1531020171', '691650', '01,02,06,04,05,07,10,08,03,09');
INSERT INTO ac_data_pk10bj VALUES ('40074', '1531020477', '691651', '02,10,07,08,04,03,06,05,01,09');
INSERT INTO ac_data_pk10bj VALUES ('40101', '1531020768', '691652', '01,05,09,08,02,10,06,07,03,04');
INSERT INTO ac_data_pk10bj VALUES ('40123', '1531021066', '691653', '08,02,06,10,01,09,03,04,05,07');
INSERT INTO ac_data_pk10bj VALUES ('40151', '1531021371', '691654', '05,08,07,09,02,10,03,01,06,04');
INSERT INTO ac_data_pk10bj VALUES ('40176', '1531021663', '691655', '09,06,01,08,03,02,10,05,07,04');
INSERT INTO ac_data_pk10bj VALUES ('40204', '1531021962', '691656', '02,04,03,08,05,06,10,09,01,07');
INSERT INTO ac_data_pk10bj VALUES ('40233', '1531022271', '691657', '06,03,04,08,05,07,10,02,09,01');
INSERT INTO ac_data_pk10bj VALUES ('40257', '1531022563', '691658', '03,02,04,10,01,06,08,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('40285', '1531022875', '691659', '04,03,01,02,08,06,05,07,09,10');
INSERT INTO ac_data_pk10bj VALUES ('40310', '1531023173', '691660', '08,05,09,04,10,07,03,01,02,06');
INSERT INTO ac_data_pk10bj VALUES ('40335', '1531023468', '691661', '01,03,10,05,06,07,04,09,08,02');
INSERT INTO ac_data_pk10bj VALUES ('40361', '1531023780', '691662', '04,02,10,08,06,01,07,09,03,05');
INSERT INTO ac_data_pk10bj VALUES ('40384', '1531024074', '691663', '10,04,03,05,09,01,06,07,08,02');
INSERT INTO ac_data_pk10bj VALUES ('40406', '1531024364', '691664', '03,01,04,07,05,02,06,09,08,10');
INSERT INTO ac_data_pk10bj VALUES ('40431', '1531024667', '691665', '02,01,08,10,06,04,03,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('40460', '1531024971', '691666', '05,01,06,03,02,04,10,08,09,07');
INSERT INTO ac_data_pk10bj VALUES ('40487', '1531025265', '691667', '04,09,05,06,07,03,08,01,10,02');
INSERT INTO ac_data_pk10bj VALUES ('40515', '1531025578', '691668', '09,06,05,08,02,07,03,04,01,10');
INSERT INTO ac_data_pk10bj VALUES ('40538', '1531025874', '691669', '02,08,07,03,10,09,06,01,05,04');
INSERT INTO ac_data_pk10bj VALUES ('40565', '1531026172', '691670', '07,09,05,02,08,01,04,06,10,03');
INSERT INTO ac_data_pk10bj VALUES ('40593', '1531026471', '691671', '01,09,10,02,06,03,07,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('40621', '1531026778', '691672', '04,07,01,09,03,05,02,10,08,06');
INSERT INTO ac_data_pk10bj VALUES ('40649', '1531027070', '691673', '09,07,03,05,10,01,04,06,08,02');
INSERT INTO ac_data_pk10bj VALUES ('40676', '1531027376', '691674', '01,09,05,04,07,10,02,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('40703', '1531027680', '691675', '04,05,03,08,02,07,10,01,06,09');
INSERT INTO ac_data_pk10bj VALUES ('40729', '1531027968', '691676', '02,10,01,05,06,03,08,07,09,04');
INSERT INTO ac_data_pk10bj VALUES ('40757', '1531028264', '691677', '06,03,01,10,05,07,09,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('40787', '1531028571', '691678', '08,03,04,02,10,05,06,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('40815', '1531028865', '691679', '09,03,02,01,06,08,04,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('40843', '1531029172', '691680', '05,09,08,02,07,03,10,01,04,06');
INSERT INTO ac_data_pk10bj VALUES ('40871', '1531029462', '691681', '09,03,02,05,06,01,04,08,07,10');
INSERT INTO ac_data_pk10bj VALUES ('40900', '1531029771', '691682', '02,09,10,04,08,01,03,05,07,06');
INSERT INTO ac_data_pk10bj VALUES ('40929', '1531030064', '691683', '05,09,08,10,06,03,02,01,07,04');
INSERT INTO ac_data_pk10bj VALUES ('40958', '1531030376', '691684', '04,09,08,05,07,10,01,03,02,06');
INSERT INTO ac_data_pk10bj VALUES ('40986', '1531030677', '691685', '10,05,06,08,01,04,02,07,03,09');
INSERT INTO ac_data_pk10bj VALUES ('41010', '1531030976', '691686', '04,01,10,07,06,02,05,09,03,08');
INSERT INTO ac_data_pk10bj VALUES ('41038', '1531031270', '691687', '02,04,06,05,01,09,03,10,08,07');
INSERT INTO ac_data_pk10bj VALUES ('41066', '1531031567', '691688', '02,06,05,10,01,08,07,03,09,04');
INSERT INTO ac_data_pk10bj VALUES ('41095', '1531031869', '691689', '06,05,03,10,04,08,02,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('41124', '1531032169', '691690', '07,01,05,06,10,04,09,08,02,03');
INSERT INTO ac_data_pk10bj VALUES ('41153', '1531032470', '691691', '06,08,05,01,02,07,04,03,09,10');
INSERT INTO ac_data_pk10bj VALUES ('41181', '1531032777', '691692', '10,02,08,07,04,03,06,09,01,05');
INSERT INTO ac_data_pk10bj VALUES ('41208', '1531033072', '691693', '09,07,08,05,03,10,04,01,06,02');
INSERT INTO ac_data_pk10bj VALUES ('41236', '1531033372', '691694', '04,07,10,06,09,03,01,05,08,02');
INSERT INTO ac_data_pk10bj VALUES ('41263', '1531033665', '691695', '10,08,03,06,07,01,02,09,04,05');
INSERT INTO ac_data_pk10bj VALUES ('41289', '1531033974', '691696', '08,05,10,06,04,02,03,07,01,09');
INSERT INTO ac_data_pk10bj VALUES ('41316', '1531034272', '691697', '06,07,04,08,02,09,03,05,01,10');
INSERT INTO ac_data_pk10bj VALUES ('41344', '1531034570', '691698', '03,04,02,08,05,09,10,07,06,01');
INSERT INTO ac_data_pk10bj VALUES ('41372', '1531034862', '691699', '07,08,02,06,10,01,05,04,03,09');
INSERT INTO ac_data_pk10bj VALUES ('41401', '1531035168', '691700', '03,01,10,05,09,08,02,04,07,06');
INSERT INTO ac_data_pk10bj VALUES ('41430', '1531035472', '691701', '09,03,01,04,06,07,05,02,10,08');
INSERT INTO ac_data_pk10bj VALUES ('41457', '1531035764', '691702', '02,06,10,09,03,08,07,04,05,01');
INSERT INTO ac_data_pk10bj VALUES ('41486', '1531036068', '691703', '02,01,10,09,03,07,08,04,06,05');
INSERT INTO ac_data_pk10bj VALUES ('41512', '1531036377', '691704', '07,09,08,01,10,02,03,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('41537', '1531036670', '691705', '07,01,10,03,09,08,06,04,02,05');
INSERT INTO ac_data_pk10bj VALUES ('41565', '1531036980', '691706', '01,04,05,09,10,08,02,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('41590', '1531037276', '691707', '03,02,10,08,01,05,04,09,07,06');
INSERT INTO ac_data_pk10bj VALUES ('41615', '1531037567', '691708', '05,04,01,09,08,10,03,07,06,02');
INSERT INTO ac_data_pk10bj VALUES ('41641', '1531037873', '691709', '08,06,04,07,01,10,02,05,09,03');
INSERT INTO ac_data_pk10bj VALUES ('41668', '1531038164', '691710', '03,05,01,04,10,02,08,07,09,06');
INSERT INTO ac_data_pk10bj VALUES ('41695', '1531038473', '691711', '03,06,08,10,05,04,01,09,07,02');
INSERT INTO ac_data_pk10bj VALUES ('41720', '1531038768', '691712', '02,06,07,08,09,10,04,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('41747', '1531039071', '691713', '10,01,02,07,09,05,06,03,04,08');
INSERT INTO ac_data_pk10bj VALUES ('41775', '1531039367', '691714', '02,05,04,06,08,01,09,07,10,03');
INSERT INTO ac_data_pk10bj VALUES ('41804', '1531039673', '691715', '02,05,03,06,10,01,07,04,08,09');
INSERT INTO ac_data_pk10bj VALUES ('41831', '1531039978', '691716', '06,10,08,09,03,04,07,01,05,02');
INSERT INTO ac_data_pk10bj VALUES ('41854', '1531040270', '691717', '09,06,02,10,01,08,04,07,03,05');
INSERT INTO ac_data_pk10bj VALUES ('41883', '1531040568', '691718', '09,05,07,06,04,10,01,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('41912', '1531040867', '691719', '09,07,03,08,02,06,04,10,01,05');
INSERT INTO ac_data_pk10bj VALUES ('41940', '1531041161', '691720', '10,03,08,06,07,02,09,05,01,04');
INSERT INTO ac_data_pk10bj VALUES ('41968', '1531041472', '691721', '02,05,08,04,07,09,10,03,01,06');
INSERT INTO ac_data_pk10bj VALUES ('41993', '1531041760', '691722', '01,09,04,05,07,03,08,10,06,02');
INSERT INTO ac_data_pk10bj VALUES ('42018', '1531042067', '691723', '09,02,10,04,08,01,03,06,05,07');
INSERT INTO ac_data_pk10bj VALUES ('42047', '1531042369', '691724', '07,01,02,06,08,03,05,09,10,04');
INSERT INTO ac_data_pk10bj VALUES ('42074', '1531042668', '691725', '09,01,02,08,10,06,05,04,03,07');
INSERT INTO ac_data_pk10bj VALUES ('42098', '1531042975', '691726', '07,09,04,02,03,01,05,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('42123', '1531043270', '691727', '01,09,08,05,02,06,10,07,03,04');
INSERT INTO ac_data_pk10bj VALUES ('42149', '1531043573', '691728', '10,02,09,05,07,03,06,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('42172', '1531043865', '691729', '02,10,08,09,04,05,07,06,01,03');
INSERT INTO ac_data_pk10bj VALUES ('42199', '1531044171', '691730', '03,06,05,01,02,04,09,08,10,07');
INSERT INTO ac_data_pk10bj VALUES ('42223', '1531044463', '691731', '09,07,06,08,01,10,03,02,04,05');
INSERT INTO ac_data_pk10bj VALUES ('42250', '1531044766', '691732', '02,03,04,07,06,05,08,10,09,01');
INSERT INTO ac_data_pk10bj VALUES ('42279', '1531045074', '691733', '01,07,09,08,10,05,06,03,04,02');
INSERT INTO ac_data_pk10bj VALUES ('42305', '1531045365', '691734', '02,03,08,07,01,06,05,10,04,09');
INSERT INTO ac_data_pk10bj VALUES ('42334', '1531045669', '691735', '05,04,08,07,02,03,06,01,10,09');
INSERT INTO ac_data_pk10bj VALUES ('42363', '1531045968', '691736', '07,03,05,06,01,04,10,09,02,08');
INSERT INTO ac_data_pk10bj VALUES ('42392', '1531046271', '691737', '05,02,09,10,06,01,03,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('42416', '1531046559', '691738', '04,07,01,02,05,10,08,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('42446', '1531046870', '691739', '09,06,02,03,01,05,10,08,04,07');
INSERT INTO ac_data_pk10bj VALUES ('42475', '1531047170', '691740', '07,04,02,09,10,03,06,08,05,01');
INSERT INTO ac_data_pk10bj VALUES ('42503', '1531047464', '691741', '04,08,01,05,02,03,09,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('42533', '1531047776', '691742', '01,07,10,04,09,06,02,03,05,08');
INSERT INTO ac_data_pk10bj VALUES ('42561', '1531048071', '691743', '03,01,07,06,08,05,09,10,02,04');
INSERT INTO ac_data_pk10bj VALUES ('42587', '1531048362', '691744', '02,10,07,04,06,01,05,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('42613', '1531048678', '691745', '04,02,01,07,09,05,08,10,06,03');
INSERT INTO ac_data_pk10bj VALUES ('42638', '1531048973', '691746', '06,01,03,02,09,10,04,08,07,05');
INSERT INTO ac_data_pk10bj VALUES ('42647', '1531049437', '691747', '09,05,02,10,04,08,06,01,03,07');
INSERT INTO ac_data_pk10bj VALUES ('42654', '1531049566', '691748', '02,06,08,09,10,04,07,01,05,03');
INSERT INTO ac_data_pk10bj VALUES ('42662', '1531049920', '691749', '02,09,08,05,06,04,01,07,03,10');
INSERT INTO ac_data_pk10bj VALUES ('42675', '1531050156', '691750', '07,03,01,06,09,05,04,10,08,02');
INSERT INTO ac_data_pk10bj VALUES ('42704', '1531050464', '691751', '02,04,03,09,08,06,01,07,10,05');
INSERT INTO ac_data_pk10bj VALUES ('42733', '1531050764', '691752', '09,01,06,05,02,03,04,10,07,08');
INSERT INTO ac_data_pk10bj VALUES ('42762', '1531051072', '691753', '02,04,03,05,06,09,01,10,08,07');
INSERT INTO ac_data_pk10bj VALUES ('42798', '1531051376', '691754', '02,04,05,01,08,09,06,10,03,07');
INSERT INTO ac_data_pk10bj VALUES ('42832', '1531051665', '691755', '09,01,10,07,06,05,03,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('42867', '1531051975', '691756', '05,02,03,10,06,09,08,07,04,01');
INSERT INTO ac_data_pk10bj VALUES ('42900', '1531052270', '691757', '01,09,05,10,06,02,04,07,03,08');
INSERT INTO ac_data_pk10bj VALUES ('42934', '1531052568', '691758', '02,10,06,01,09,03,08,05,04,07');
INSERT INTO ac_data_pk10bj VALUES ('42966', '1531052868', '691759', '07,10,09,03,01,02,04,06,08,05');
INSERT INTO ac_data_pk10bj VALUES ('43000', '1531053170', '691760', '08,04,02,07,05,03,09,10,01,06');
INSERT INTO ac_data_pk10bj VALUES ('43035', '1531053464', '691761', '01,03,09,06,04,07,10,08,05,02');
INSERT INTO ac_data_pk10bj VALUES ('43064', '1531053788', '691762', '05,02,04,06,07,09,03,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('43079', '1531054098', '691763', '08,01,06,07,10,02,09,04,03,05');
INSERT INTO ac_data_pk10bj VALUES ('43103', '1531054367', '691764', '09,08,01,06,04,05,10,03,07,02');
INSERT INTO ac_data_pk10bj VALUES ('43139', '1531054673', '691765', '06,08,07,02,09,04,03,05,10,01');
INSERT INTO ac_data_pk10bj VALUES ('43175', '1531054968', '691766', '04,02,05,10,06,03,07,09,01,08');
INSERT INTO ac_data_pk10bj VALUES ('43210', '1531055276', '691767', '03,02,09,04,07,06,01,10,08,05');
INSERT INTO ac_data_pk10bj VALUES ('43246', '1531055566', '691768', '07,08,04,01,06,02,03,10,09,05');
INSERT INTO ac_data_pk10bj VALUES ('43285', '1531055872', '691769', '05,02,10,06,01,09,03,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('43320', '1531056168', '691770', '03,08,04,06,10,02,05,07,09,01');
INSERT INTO ac_data_pk10bj VALUES ('43356', '1531056474', '691771', '03,05,01,07,06,09,04,02,10,08');
INSERT INTO ac_data_pk10bj VALUES ('43387', '1531056763', '691772', '05,01,10,04,07,06,02,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('43424', '1531057067', '691773', '01,05,10,08,07,02,09,06,04,03');
INSERT INTO ac_data_pk10bj VALUES ('43459', '1531057365', '691774', '03,10,08,06,04,05,07,01,02,09');
INSERT INTO ac_data_pk10bj VALUES ('43496', '1531057669', '691775', '07,03,09,02,04,10,08,01,06,05');
INSERT INTO ac_data_pk10bj VALUES ('43530', '1531057965', '691776', '03,02,07,06,04,01,08,09,05,10');
INSERT INTO ac_data_pk10bj VALUES ('43564', '1531058266', '691777', '07,06,08,04,01,02,05,03,10,09');
INSERT INTO ac_data_pk10bj VALUES ('43599', '1531058573', '691778', '04,08,09,05,03,02,10,01,07,06');
INSERT INTO ac_data_pk10bj VALUES ('43632', '1531058869', '691779', '09,02,06,10,07,04,08,03,05,01');
INSERT INTO ac_data_pk10bj VALUES ('43662', '1531059164', '691780', '02,09,08,03,10,05,04,01,06,07');
INSERT INTO ac_data_pk10bj VALUES ('43701', '1531059467', '691781', '06,08,10,01,02,09,05,03,04,07');
INSERT INTO ac_data_pk10bj VALUES ('43738', '1531059769', '691782', '01,09,05,10,08,03,07,04,06,02');
INSERT INTO ac_data_pk10bj VALUES ('43773', '1531060065', '691783', '02,08,01,10,03,07,09,04,06,05');
INSERT INTO ac_data_pk10bj VALUES ('43807', '1531060358', '691784', '08,07,04,06,09,01,10,02,05,03');
INSERT INTO ac_data_pk10bj VALUES ('43845', '1531060664', '691785', '04,05,08,07,02,10,03,01,09,06');
INSERT INTO ac_data_pk10bj VALUES ('43881', '1531060968', '691786', '04,07,02,06,05,01,10,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('43916', '1531061262', '691787', '05,02,04,03,08,01,09,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('43953', '1531061564', '691788', '09,07,10,08,06,01,04,03,02,05');
INSERT INTO ac_data_pk10bj VALUES ('43990', '1531061866', '691789', '02,06,09,05,01,08,10,03,07,04');
INSERT INTO ac_data_pk10bj VALUES ('44026', '1531062163', '691790', '08,02,01,10,06,03,04,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('44063', '1531062464', '691791', '07,09,08,05,04,03,06,02,01,10');
INSERT INTO ac_data_pk10bj VALUES ('44098', '1531062772', '691792', '04,09,08,10,03,06,02,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('44126', '1531063062', '691793', '02,08,07,06,10,03,05,01,04,09');
INSERT INTO ac_data_pk10bj VALUES ('44161', '1531063361', '691794', '05,10,06,09,02,07,03,08,04,01');
INSERT INTO ac_data_pk10bj VALUES ('44197', '1531063671', '691795', '04,08,07,02,10,05,06,09,03,01');
INSERT INTO ac_data_pk10bj VALUES ('44229', '1531063960', '691796', '05,07,04,06,09,10,08,03,02,01');
INSERT INTO ac_data_pk10bj VALUES ('44268', '1531064264', '691797', '03,06,05,09,08,02,10,01,04,07');
INSERT INTO ac_data_pk10bj VALUES ('44306', '1531064575', '691798', '09,05,08,07,04,01,10,06,03,02');
INSERT INTO ac_data_pk10bj VALUES ('44342', '1531064871', '691799', '04,05,02,01,07,10,09,03,06,08');
INSERT INTO ac_data_pk10bj VALUES ('44378', '1531065170', '691800', '08,04,09,07,02,05,01,03,10,06');
INSERT INTO ac_data_pk10bj VALUES ('44414', '1531065462', '691801', '08,03,09,07,05,04,10,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('44495', '1531098461', '691802', '05,08,07,03,09,01,02,04,10,06');
INSERT INTO ac_data_pk10bj VALUES ('44529', '1531098769', '691803', '05,03,01,09,08,07,04,06,10,02');
INSERT INTO ac_data_pk10bj VALUES ('44563', '1531099062', '691804', '08,05,07,10,03,09,04,01,02,06');
INSERT INTO ac_data_pk10bj VALUES ('44598', '1531099365', '691805', '09,05,10,07,04,06,01,08,02,03');
INSERT INTO ac_data_pk10bj VALUES ('44628', '1531099662', '691806', '10,07,04,01,02,03,05,06,09,08');
INSERT INTO ac_data_pk10bj VALUES ('44666', '1531099968', '691807', '08,03,02,01,04,10,09,05,06,07');
INSERT INTO ac_data_pk10bj VALUES ('44703', '1531100276', '691808', '06,03,04,08,02,09,05,07,10,01');
INSERT INTO ac_data_pk10bj VALUES ('44734', '1531100564', '691809', '02,06,07,10,05,09,01,03,04,08');
INSERT INTO ac_data_pk10bj VALUES ('44770', '1531100861', '691810', '07,01,06,09,05,04,02,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('44808', '1531101164', '691811', '05,07,03,06,08,09,10,01,02,04');
INSERT INTO ac_data_pk10bj VALUES ('44845', '1531101469', '691812', '03,10,04,05,08,09,07,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('44879', '1531101769', '691813', '10,03,08,01,09,02,04,07,05,06');
INSERT INTO ac_data_pk10bj VALUES ('44914', '1531102065', '691814', '09,06,05,07,02,04,03,01,08,10');
INSERT INTO ac_data_pk10bj VALUES ('44952', '1531102375', '691815', '09,06,05,02,04,03,10,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('44988', '1531102677', '691816', '04,10,09,06,08,05,03,01,02,07');
INSERT INTO ac_data_pk10bj VALUES ('45022', '1531102963', '691817', '04,05,09,03,01,08,02,10,07,06');
INSERT INTO ac_data_pk10bj VALUES ('45060', '1531103267', '691818', '01,10,06,07,04,02,09,08,05,03');
INSERT INTO ac_data_pk10bj VALUES ('45094', '1531103566', '691819', '10,02,07,05,06,09,03,04,01,08');
INSERT INTO ac_data_pk10bj VALUES ('45130', '1531103872', '691820', '10,07,08,05,03,01,06,02,09,04');
INSERT INTO ac_data_pk10bj VALUES ('45165', '1531104165', '691821', '07,05,10,08,02,09,06,01,03,04');
INSERT INTO ac_data_pk10bj VALUES ('45202', '1531104468', '691822', '04,10,07,03,02,08,01,05,09,06');
INSERT INTO ac_data_pk10bj VALUES ('45236', '1531104765', '691823', '06,07,02,05,01,04,03,09,10,08');
INSERT INTO ac_data_pk10bj VALUES ('45270', '1531105068', '691824', '01,10,03,09,04,08,06,05,02,07');
INSERT INTO ac_data_pk10bj VALUES ('45303', '1531105363', '691825', '02,03,01,09,04,05,06,07,10,08');
INSERT INTO ac_data_pk10bj VALUES ('45337', '1531105672', '691826', '04,03,08,06,01,09,07,05,10,02');
INSERT INTO ac_data_pk10bj VALUES ('45368', '1531105962', '691827', '09,02,08,03,01,06,10,05,04,07');
INSERT INTO ac_data_pk10bj VALUES ('45402', '1531106274', '691828', '10,08,01,03,05,06,02,07,04,09');
INSERT INTO ac_data_pk10bj VALUES ('45436', '1531106567', '691829', '03,08,09,05,10,04,01,06,07,02');
INSERT INTO ac_data_pk10bj VALUES ('45472', '1531106867', '691830', '01,06,04,03,10,08,05,09,07,02');
INSERT INTO ac_data_pk10bj VALUES ('45508', '1531107165', '691831', '01,07,05,03,09,04,08,10,06,02');
INSERT INTO ac_data_pk10bj VALUES ('45545', '1531107467', '691832', '07,01,03,05,10,06,02,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('45581', '1531107768', '691833', '06,07,04,10,09,08,05,03,02,01');
INSERT INTO ac_data_pk10bj VALUES ('45615', '1531108071', '691834', '06,04,01,02,03,10,08,07,09,05');
INSERT INTO ac_data_pk10bj VALUES ('45647', '1531108370', '691835', '10,08,05,02,01,03,09,06,07,04');
INSERT INTO ac_data_pk10bj VALUES ('45679', '1531108678', '691836', '04,07,03,05,08,10,02,01,06,09');
INSERT INTO ac_data_pk10bj VALUES ('45712', '1531108971', '691837', '03,05,10,06,02,09,01,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('45742', '1531109273', '691838', '10,06,03,07,08,04,01,05,09,02');
INSERT INTO ac_data_pk10bj VALUES ('45772', '1531109565', '691839', '08,07,05,01,06,04,03,10,02,09');
INSERT INTO ac_data_pk10bj VALUES ('45806', '1531109866', '691840', '03,04,06,05,02,10,07,08,09,01');
INSERT INTO ac_data_pk10bj VALUES ('45840', '1531110173', '691841', '10,03,08,01,02,05,07,09,04,06');
INSERT INTO ac_data_pk10bj VALUES ('45872', '1531110472', '691842', '04,02,03,08,09,06,07,01,05,10');
INSERT INTO ac_data_pk10bj VALUES ('45902', '1531110769', '691843', '02,10,05,09,07,04,06,03,08,01');
INSERT INTO ac_data_pk10bj VALUES ('45933', '1531111074', '691844', '07,04,10,06,05,01,02,09,08,03');
INSERT INTO ac_data_pk10bj VALUES ('45970', '1531111366', '691845', '02,01,09,05,10,03,07,06,04,08');
INSERT INTO ac_data_pk10bj VALUES ('46007', '1531111674', '691846', '09,04,08,07,10,02,01,05,03,06');
INSERT INTO ac_data_pk10bj VALUES ('46041', '1531111970', '691847', '03,04,07,10,05,01,02,09,08,06');
INSERT INTO ac_data_pk10bj VALUES ('46072', '1531112266', '691848', '10,03,07,02,06,04,01,05,09,08');
INSERT INTO ac_data_pk10bj VALUES ('46105', '1531112565', '691849', '06,07,09,04,10,03,01,08,05,02');
INSERT INTO ac_data_pk10bj VALUES ('46140', '1531112866', '691850', '09,07,01,08,02,10,03,04,06,05');
INSERT INTO ac_data_pk10bj VALUES ('46178', '1531113177', '691851', '01,02,05,06,04,08,03,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('46214', '1531113468', '691852', '06,08,10,01,03,07,05,04,09,02');
INSERT INTO ac_data_pk10bj VALUES ('46251', '1531113773', '691853', '10,08,09,05,06,01,03,04,07,02');
INSERT INTO ac_data_pk10bj VALUES ('46285', '1531114060', '691854', '10,06,05,09,04,01,07,03,08,02');
INSERT INTO ac_data_pk10bj VALUES ('46322', '1531114366', '691855', '04,06,02,01,07,05,03,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('46358', '1531114669', '691856', '07,03,06,10,08,09,02,01,05,04');
INSERT INTO ac_data_pk10bj VALUES ('46392', '1531114964', '691857', '08,07,06,02,03,04,10,01,09,05');
INSERT INTO ac_data_pk10bj VALUES ('46418', '1531115261', '691858', '04,06,05,02,03,10,01,07,09,08');
INSERT INTO ac_data_pk10bj VALUES ('46454', '1531115573', '691859', '10,09,07,05,08,06,03,01,04,02');
INSERT INTO ac_data_pk10bj VALUES ('46487', '1531115867', '691860', '08,06,09,01,07,03,02,04,10,05');
INSERT INTO ac_data_pk10bj VALUES ('46522', '1531116173', '691861', '09,02,03,07,10,01,04,05,06,08');
INSERT INTO ac_data_pk10bj VALUES ('46551', '1531116464', '691862', '01,10,05,07,03,06,08,02,04,09');
INSERT INTO ac_data_pk10bj VALUES ('46585', '1531116772', '691863', '01,09,02,08,06,07,05,10,04,03');
INSERT INTO ac_data_pk10bj VALUES ('46621', '1531117069', '691864', '04,01,03,02,09,10,05,07,08,06');
INSERT INTO ac_data_pk10bj VALUES ('46655', '1531117376', '691865', '09,06,02,10,03,04,08,07,05,01');
INSERT INTO ac_data_pk10bj VALUES ('46685', '1531117671', '691866', '05,06,07,10,04,03,08,02,01,09');
INSERT INTO ac_data_pk10bj VALUES ('46717', '1531117974', '691867', '05,06,08,07,03,02,04,09,01,10');
INSERT INTO ac_data_pk10bj VALUES ('46749', '1531118273', '691868', '07,03,10,09,01,08,06,05,02,04');
INSERT INTO ac_data_pk10bj VALUES ('46782', '1531118570', '691869', '09,10,08,04,01,05,06,03,07,02');
INSERT INTO ac_data_pk10bj VALUES ('46816', '1531118871', '691870', '07,08,01,09,06,03,02,10,05,04');
INSERT INTO ac_data_pk10bj VALUES ('46850', '1531119171', '691871', '09,08,05,01,10,02,04,07,03,06');
INSERT INTO ac_data_pk10bj VALUES ('46885', '1531119464', '691872', '10,06,02,07,09,05,03,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('46918', '1531119763', '691873', '02,05,10,08,04,07,09,01,03,06');
INSERT INTO ac_data_pk10bj VALUES ('46954', '1531120071', '691874', '07,09,08,10,06,01,04,03,02,05');
INSERT INTO ac_data_pk10bj VALUES ('46989', '1531120375', '691875', '06,07,01,08,03,04,09,10,05,02');
INSERT INTO ac_data_pk10bj VALUES ('47025', '1531120663', '691876', '09,05,01,07,02,10,04,06,08,03');
INSERT INTO ac_data_pk10bj VALUES ('47064', '1531120977', '691877', '02,06,04,07,10,08,05,01,09,03');
INSERT INTO ac_data_pk10bj VALUES ('47099', '1531121272', '691878', '01,04,07,05,03,06,02,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('47130', '1531121562', '691879', '05,03,08,01,10,06,07,04,09,02');
INSERT INTO ac_data_pk10bj VALUES ('47167', '1531121866', '691880', '08,06,04,09,02,01,03,07,05,10');
INSERT INTO ac_data_pk10bj VALUES ('47201', '1531122169', '691881', '07,03,08,09,02,04,05,01,06,10');
INSERT INTO ac_data_pk10bj VALUES ('47235', '1531122464', '691882', '04,09,08,07,02,06,10,03,05,01');
INSERT INTO ac_data_pk10bj VALUES ('47270', '1531122761', '691883', '09,06,08,02,07,05,04,03,10,01');
INSERT INTO ac_data_pk10bj VALUES ('47306', '1531123071', '691884', '07,05,09,02,08,03,10,06,04,01');
INSERT INTO ac_data_pk10bj VALUES ('47341', '1531123372', '691885', '08,04,01,05,07,10,03,09,02,06');
INSERT INTO ac_data_pk10bj VALUES ('47376', '1531123663', '691886', '06,08,05,10,02,07,01,03,09,04');
INSERT INTO ac_data_pk10bj VALUES ('47409', '1531123966', '691887', '06,03,09,10,01,04,07,08,05,02');
INSERT INTO ac_data_pk10bj VALUES ('47443', '1531124259', '691888', '01,10,02,05,09,06,03,07,04,08');
INSERT INTO ac_data_pk10bj VALUES ('47478', '1531124571', '691889', '07,02,05,04,10,01,08,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('47509', '1531124867', '691890', '06,10,03,09,07,05,02,04,08,01');
INSERT INTO ac_data_pk10bj VALUES ('47546', '1531125170', '691891', '06,05,03,09,10,07,08,01,02,04');
INSERT INTO ac_data_pk10bj VALUES ('47583', '1531125469', '691892', '03,05,10,08,01,02,07,09,06,04');
INSERT INTO ac_data_pk10bj VALUES ('47617', '1531125757', '691893', '02,03,09,10,07,06,08,05,01,04');
INSERT INTO ac_data_pk10bj VALUES ('47655', '1531126076', '691894', '08,09,03,04,02,05,01,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('47687', '1531126366', '691895', '04,08,02,07,03,01,06,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('47722', '1531126674', '691896', '08,10,04,03,09,06,01,05,07,02');
INSERT INTO ac_data_pk10bj VALUES ('47757', '1531126964', '691897', '02,03,01,10,06,04,09,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('47795', '1531127265', '691898', '07,05,09,02,03,10,08,06,04,01');
INSERT INTO ac_data_pk10bj VALUES ('47830', '1531127566', '691899', '05,04,08,07,10,09,06,01,02,03');
INSERT INTO ac_data_pk10bj VALUES ('47863', '1531127869', '691900', '10,05,08,09,06,04,03,01,07,02');
INSERT INTO ac_data_pk10bj VALUES ('47898', '1531128165', '691901', '03,07,01,09,02,05,08,06,10,04');
INSERT INTO ac_data_pk10bj VALUES ('47936', '1531128470', '691902', '09,01,10,03,07,06,05,02,04,08');
INSERT INTO ac_data_pk10bj VALUES ('47972', '1531128770', '691903', '05,09,07,08,04,01,06,10,03,02');
INSERT INTO ac_data_pk10bj VALUES ('48009', '1531129080', '691904', '02,09,07,03,06,05,01,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('48047', '1531129426', '691905', '07,08,02,03,10,04,05,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('48085', '1531129745', '691906', '10,06,09,07,08,03,04,05,02,01');
INSERT INTO ac_data_pk10bj VALUES ('48126', '1531130071', '691907', '03,10,02,04,07,06,01,08,05,09');
INSERT INTO ac_data_pk10bj VALUES ('48160', '1531130352', '691908', '04,08,09,05,02,07,03,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('48184', '1531130563', '691909', '08,06,10,04,03,01,05,09,02,07');
INSERT INTO ac_data_pk10bj VALUES ('48191', '1531130971', '691910', '01,06,08,10,04,05,02,03,07,09');
INSERT INTO ac_data_pk10bj VALUES ('48211', '1531131161', '691911', '04,01,05,07,03,09,06,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('48248', '1531131474', '691912', '07,10,04,06,01,05,02,08,09,03');
INSERT INTO ac_data_pk10bj VALUES ('48281', '1531131768', '691913', '09,05,01,02,03,04,10,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('48314', '1531132062', '691914', '07,02,10,09,06,03,05,04,08,01');
INSERT INTO ac_data_pk10bj VALUES ('48351', '1531132365', '691915', '10,04,05,07,08,02,01,09,06,03');
INSERT INTO ac_data_pk10bj VALUES ('48387', '1531132670', '691916', '10,02,05,06,01,07,08,09,04,03');
INSERT INTO ac_data_pk10bj VALUES ('48421', '1531132969', '691917', '02,10,07,04,01,09,08,03,06,05');
INSERT INTO ac_data_pk10bj VALUES ('48458', '1531133261', '691918', '07,10,09,06,05,08,01,03,04,02');
INSERT INTO ac_data_pk10bj VALUES ('48494', '1531133567', '691919', '08,03,05,01,04,09,07,10,06,02');
INSERT INTO ac_data_pk10bj VALUES ('48530', '1531133864', '691920', '01,05,03,06,09,08,07,04,10,02');
INSERT INTO ac_data_pk10bj VALUES ('48566', '1531134167', '691921', '04,07,09,01,06,10,05,02,08,03');
INSERT INTO ac_data_pk10bj VALUES ('48603', '1531134472', '691922', '01,04,07,06,09,03,10,05,08,02');
INSERT INTO ac_data_pk10bj VALUES ('48635', '1531134767', '691923', '04,03,08,05,07,10,01,06,09,02');
INSERT INTO ac_data_pk10bj VALUES ('48671', '1531135072', '691924', '01,03,07,05,02,09,04,08,06,10');
INSERT INTO ac_data_pk10bj VALUES ('48706', '1531135363', '691925', '09,10,04,08,02,03,06,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('48740', '1531135675', '691926', '07,03,09,05,01,02,06,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('48775', '1531135959', '691927', '06,04,07,01,09,05,08,02,03,10');
INSERT INTO ac_data_pk10bj VALUES ('48810', '1531136272', '691928', '08,07,01,05,02,03,10,04,06,09');
INSERT INTO ac_data_pk10bj VALUES ('48846', '1531136563', '691929', '07,06,03,01,10,09,02,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('48880', '1531136877', '691930', '10,02,06,08,01,05,09,03,04,07');
INSERT INTO ac_data_pk10bj VALUES ('48913', '1531137169', '691931', '05,02,01,09,10,04,08,06,03,07');
INSERT INTO ac_data_pk10bj VALUES ('48949', '1531137466', '691932', '09,08,06,05,10,03,07,01,04,02');
INSERT INTO ac_data_pk10bj VALUES ('48982', '1531137767', '691933', '07,01,05,04,09,06,10,03,08,02');
INSERT INTO ac_data_pk10bj VALUES ('49017', '1531138064', '691934', '04,06,09,02,01,08,03,07,10,05');
INSERT INTO ac_data_pk10bj VALUES ('49052', '1531138362', '691935', '10,09,05,04,03,06,02,07,08,01');
INSERT INTO ac_data_pk10bj VALUES ('49087', '1531138666', '691936', '02,01,03,04,06,09,08,10,05,07');
INSERT INTO ac_data_pk10bj VALUES ('49124', '1531138966', '691937', '06,09,04,01,08,03,07,10,05,02');
INSERT INTO ac_data_pk10bj VALUES ('49160', '1531139270', '691938', '08,03,09,01,02,07,04,05,10,06');
INSERT INTO ac_data_pk10bj VALUES ('49193', '1531139570', '691939', '08,03,10,02,09,07,01,04,05,06');
INSERT INTO ac_data_pk10bj VALUES ('49227', '1531139870', '691940', '10,01,07,04,05,02,03,09,08,06');
INSERT INTO ac_data_pk10bj VALUES ('49263', '1531140175', '691941', '02,04,10,08,01,09,06,03,05,07');
INSERT INTO ac_data_pk10bj VALUES ('49298', '1531140473', '691942', '02,09,03,04,06,08,10,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('49330', '1531140769', '691943', '04,09,02,07,03,08,05,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('49366', '1531141078', '691944', '08,06,09,01,05,04,03,07,02,10');
INSERT INTO ac_data_pk10bj VALUES ('49400', '1531141364', '691945', '09,06,07,04,08,10,02,05,01,03');
INSERT INTO ac_data_pk10bj VALUES ('49435', '1531141666', '691946', '06,04,07,10,09,01,08,03,05,02');
INSERT INTO ac_data_pk10bj VALUES ('49470', '1531141965', '691947', '03,10,08,01,02,07,04,09,05,06');
INSERT INTO ac_data_pk10bj VALUES ('49508', '1531142268', '691948', '08,07,10,03,09,06,01,02,05,04');
INSERT INTO ac_data_pk10bj VALUES ('49544', '1531142567', '691949', '09,02,06,01,04,05,07,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('49579', '1531142864', '691950', '06,08,05,02,09,01,07,03,04,10');
INSERT INTO ac_data_pk10bj VALUES ('49615', '1531143173', '691951', '09,10,04,02,08,01,07,03,06,05');
INSERT INTO ac_data_pk10bj VALUES ('49648', '1531143471', '691952', '07,02,09,01,04,05,06,10,03,08');
INSERT INTO ac_data_pk10bj VALUES ('49685', '1531143771', '691953', '01,07,04,05,09,02,10,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('49720', '1531144062', '691954', '09,02,10,04,06,05,08,07,01,03');
INSERT INTO ac_data_pk10bj VALUES ('49758', '1531144367', '691955', '08,10,06,09,01,02,04,05,03,07');
INSERT INTO ac_data_pk10bj VALUES ('49792', '1531144663', '691956', '02,07,03,08,06,10,05,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('49826', '1531144963', '691957', '04,02,03,05,08,10,09,07,01,06');
INSERT INTO ac_data_pk10bj VALUES ('49862', '1531145270', '691958', '03,10,08,01,02,05,09,04,07,06');
INSERT INTO ac_data_pk10bj VALUES ('49897', '1531145569', '691959', '04,06,05,07,10,09,01,08,02,03');
INSERT INTO ac_data_pk10bj VALUES ('49928', '1531145864', '691960', '01,08,09,02,06,04,03,05,07,10');
INSERT INTO ac_data_pk10bj VALUES ('49964', '1531146162', '691961', '06,07,09,05,08,01,02,10,04,03');
INSERT INTO ac_data_pk10bj VALUES ('49999', '1531146469', '691962', '02,09,10,01,03,04,05,08,07,06');
INSERT INTO ac_data_pk10bj VALUES ('50034', '1531146771', '691963', '01,07,03,05,06,09,04,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('50071', '1531147063', '691964', '01,06,10,07,02,09,05,04,03,08');
INSERT INTO ac_data_pk10bj VALUES ('50107', '1531147365', '691965', '02,09,06,07,10,03,05,08,01,04');
INSERT INTO ac_data_pk10bj VALUES ('50142', '1531147663', '691966', '09,03,04,10,08,01,05,07,06,02');
INSERT INTO ac_data_pk10bj VALUES ('50176', '1531147962', '691967', '02,01,06,05,04,10,09,03,07,08');
INSERT INTO ac_data_pk10bj VALUES ('50208', '1531148274', '691968', '08,02,04,01,03,09,07,10,05,06');
INSERT INTO ac_data_pk10bj VALUES ('50245', '1531148567', '691969', '01,06,02,10,08,07,05,03,04,09');
INSERT INTO ac_data_pk10bj VALUES ('50280', '1531148865', '691970', '06,04,07,08,02,03,05,10,01,09');
INSERT INTO ac_data_pk10bj VALUES ('50312', '1531149174', '691971', '01,02,03,06,04,08,10,07,09,05');
INSERT INTO ac_data_pk10bj VALUES ('50345', '1531149471', '691972', '01,07,05,02,08,10,04,03,09,06');
INSERT INTO ac_data_pk10bj VALUES ('50379', '1531149767', '691973', '04,05,03,06,07,08,01,10,09,02');
INSERT INTO ac_data_pk10bj VALUES ('50417', '1531150067', '691974', '02,06,10,04,07,03,05,01,08,09');
INSERT INTO ac_data_pk10bj VALUES ('50451', '1531150374', '691975', '10,04,03,08,09,01,06,07,05,02');
INSERT INTO ac_data_pk10bj VALUES ('50482', '1531150670', '691976', '03,07,04,08,01,06,05,02,10,09');
INSERT INTO ac_data_pk10bj VALUES ('50517', '1531150965', '691977', '06,03,05,09,08,10,04,02,07,01');
INSERT INTO ac_data_pk10bj VALUES ('50554', '1531151267', '691978', '01,02,03,09,04,06,07,05,08,10');
INSERT INTO ac_data_pk10bj VALUES ('50585', '1531151563', '691979', '06,05,01,09,08,02,03,10,04,07');
INSERT INTO ac_data_pk10bj VALUES ('50609', '1531151879', '691980', '05,02,01,10,07,06,03,04,08,09');
INSERT INTO ac_data_pk10bj VALUES ('50687', '1531184875', '691981', '09,06,01,04,03,05,02,07,10,08');
INSERT INTO ac_data_pk10bj VALUES ('50718', '1531185169', '691982', '08,06,02,01,09,03,07,05,10,04');
INSERT INTO ac_data_pk10bj VALUES ('50750', '1531185468', '691983', '07,03,09,04,05,08,02,06,01,10');
INSERT INTO ac_data_pk10bj VALUES ('50785', '1531185775', '691984', '10,01,02,08,03,05,09,06,07,04');
INSERT INTO ac_data_pk10bj VALUES ('50828', '1531186176', '691985', '03,10,07,06,08,09,05,02,01,04');
INSERT INTO ac_data_pk10bj VALUES ('50858', '1531186479', '691986', '07,03,06,01,09,10,04,05,08,02');
INSERT INTO ac_data_pk10bj VALUES ('50879', '1531186664', '691987', '07,10,08,05,02,04,09,06,01,03');
INSERT INTO ac_data_pk10bj VALUES ('50914', '1531186968', '691988', '06,03,01,02,10,09,04,08,05,07');
INSERT INTO ac_data_pk10bj VALUES ('50951', '1531187274', '691989', '05,02,06,04,08,03,07,09,10,01');
INSERT INTO ac_data_pk10bj VALUES ('50982', '1531187568', '691990', '04,01,02,06,03,07,08,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('51019', '1531187867', '691991', '03,09,05,08,07,02,06,10,04,01');
INSERT INTO ac_data_pk10bj VALUES ('51055', '1531188175', '691992', '07,03,02,10,01,04,06,05,09,08');
INSERT INTO ac_data_pk10bj VALUES ('51088', '1531188467', '691993', '09,05,06,08,01,02,03,10,07,04');
INSERT INTO ac_data_pk10bj VALUES ('51118', '1531188768', '691994', '04,08,07,03,09,01,05,10,02,06');
INSERT INTO ac_data_pk10bj VALUES ('51153', '1531189066', '691995', '04,02,07,01,03,05,09,10,08,06');
INSERT INTO ac_data_pk10bj VALUES ('51189', '1531189361', '691996', '10,01,05,04,08,07,09,02,03,06');
INSERT INTO ac_data_pk10bj VALUES ('51225', '1531189666', '691997', '07,08,04,09,02,05,03,10,01,06');
INSERT INTO ac_data_pk10bj VALUES ('51258', '1531189971', '691998', '05,03,09,02,08,04,01,10,06,07');
INSERT INTO ac_data_pk10bj VALUES ('51294', '1531190264', '691999', '05,03,10,01,02,08,09,07,06,04');
INSERT INTO ac_data_pk10bj VALUES ('51326', '1531190574', '692000', '07,10,03,06,02,01,04,05,09,08');
INSERT INTO ac_data_pk10bj VALUES ('51360', '1531190874', '692001', '04,06,10,08,09,05,03,07,01,02');
INSERT INTO ac_data_pk10bj VALUES ('51394', '1531191171', '692002', '04,10,07,05,06,01,02,03,09,08');
INSERT INTO ac_data_pk10bj VALUES ('51430', '1531191464', '692003', '01,05,10,06,07,03,09,08,02,04');
INSERT INTO ac_data_pk10bj VALUES ('51471', '1531191826', '692004', '04,01,10,09,08,07,05,06,02,03');
INSERT INTO ac_data_pk10bj VALUES ('51506', '1531192143', '692005', '02,08,06,04,03,01,10,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('51531', '1531192372', '692006', '05,08,02,03,04,10,01,07,06,09');
INSERT INTO ac_data_pk10bj VALUES ('51567', '1531192660', '692007', '01,04,10,06,05,07,02,08,09,03');
INSERT INTO ac_data_pk10bj VALUES ('51603', '1531192969', '692008', '04,10,06,08,09,05,01,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('51637', '1531193272', '692009', '02,10,07,06,03,01,08,04,05,09');
INSERT INTO ac_data_pk10bj VALUES ('51672', '1531193565', '692010', '03,02,08,09,01,07,10,05,06,04');
INSERT INTO ac_data_pk10bj VALUES ('51709', '1531193869', '692011', '06,03,07,10,05,09,01,08,04,02');
INSERT INTO ac_data_pk10bj VALUES ('51742', '1531194167', '692012', '07,09,05,02,01,04,06,08,10,03');
INSERT INTO ac_data_pk10bj VALUES ('51779', '1531194466', '692013', '07,10,04,01,08,02,06,09,05,03');
INSERT INTO ac_data_pk10bj VALUES ('51815', '1531194762', '692014', '05,03,04,10,06,02,09,07,08,01');
INSERT INTO ac_data_pk10bj VALUES ('51848', '1531195067', '692015', '01,05,02,08,03,07,06,04,09,10');
INSERT INTO ac_data_pk10bj VALUES ('51884', '1531195369', '692016', '02,08,06,01,03,04,05,07,10,09');
INSERT INTO ac_data_pk10bj VALUES ('51919', '1531195670', '692017', '02,05,03,01,04,07,09,06,10,08');
INSERT INTO ac_data_pk10bj VALUES ('51952', '1531195966', '692018', '07,09,03,06,10,08,02,05,01,04');
INSERT INTO ac_data_pk10bj VALUES ('51988', '1531196276', '692019', '09,06,03,10,01,02,04,07,05,08');
INSERT INTO ac_data_pk10bj VALUES ('52023', '1531196568', '692020', '10,02,04,06,09,07,03,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('52055', '1531196870', '692021', '09,06,03,01,05,10,07,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('52091', '1531197180', '692022', '10,03,09,04,01,05,08,06,07,02');
INSERT INTO ac_data_pk10bj VALUES ('52125', '1531197470', '692023', '06,03,10,09,08,04,07,05,01,02');
INSERT INTO ac_data_pk10bj VALUES ('52160', '1531197769', '692024', '01,06,08,04,10,09,05,07,03,02');
INSERT INTO ac_data_pk10bj VALUES ('52196', '1531198065', '692025', '01,04,07,02,09,06,08,03,10,05');
INSERT INTO ac_data_pk10bj VALUES ('52231', '1531198371', '692026', '06,10,01,09,04,05,07,08,02,03');
INSERT INTO ac_data_pk10bj VALUES ('52265', '1531198674', '692027', '06,04,10,03,01,07,02,05,08,09');
INSERT INTO ac_data_pk10bj VALUES ('52295', '1531198962', '692028', '01,05,04,07,09,06,02,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('52332', '1531199271', '692029', '07,01,03,02,08,04,05,10,09,06');
INSERT INTO ac_data_pk10bj VALUES ('52363', '1531199571', '692030', '10,06,04,03,08,07,01,02,09,05');
INSERT INTO ac_data_pk10bj VALUES ('52397', '1531199874', '692031', '09,02,10,01,06,04,08,03,05,07');
INSERT INTO ac_data_pk10bj VALUES ('52428', '1531200166', '692032', '05,03,01,09,02,06,08,04,07,10');
INSERT INTO ac_data_pk10bj VALUES ('52461', '1531200465', '692033', '02,05,03,04,07,09,08,06,10,01');
INSERT INTO ac_data_pk10bj VALUES ('52496', '1531200769', '692034', '06,08,05,10,02,04,07,01,09,03');
INSERT INTO ac_data_pk10bj VALUES ('52532', '1531201078', '692035', '03,05,06,04,07,08,09,10,02,01');
INSERT INTO ac_data_pk10bj VALUES ('52566', '1531201377', '692036', '05,06,07,01,04,09,10,08,03,02');
INSERT INTO ac_data_pk10bj VALUES ('52600', '1531201666', '692037', '10,01,05,02,07,06,08,03,09,04');
INSERT INTO ac_data_pk10bj VALUES ('52636', '1531201970', '692038', '04,03,10,07,06,02,09,08,05,01');
INSERT INTO ac_data_pk10bj VALUES ('52673', '1531202263', '692039', '03,01,04,10,02,05,06,08,09,07');
INSERT INTO ac_data_pk10bj VALUES ('52707', '1531202565', '692040', '07,06,05,10,01,09,04,02,03,08');
INSERT INTO ac_data_pk10bj VALUES ('52740', '1531202873', '692041', '10,01,08,06,02,03,04,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('52779', '1531203201', '692042', '05,04,07,10,09,06,03,01,02,08');
INSERT INTO ac_data_pk10bj VALUES ('52817', '1531203516', '692043', '02,04,09,06,07,08,03,01,10,05');
INSERT INTO ac_data_pk10bj VALUES ('52852', '1531203839', '692044', '07,04,10,09,08,05,01,06,03,02');
INSERT INTO ac_data_pk10bj VALUES ('52887', '1531204131', '692045', '09,04,10,02,07,08,01,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('52918', '1531204395', '692046', '08,07,10,06,04,01,02,05,09,03');
INSERT INTO ac_data_pk10bj VALUES ('52956', '1531204714', '692047', '10,04,07,06,05,09,01,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('52988', '1531205009', '692048', '10,03,09,05,06,02,07,04,01,08');
INSERT INTO ac_data_pk10bj VALUES ('53022', '1531205293', '692049', '01,10,07,02,05,03,08,09,04,06');
INSERT INTO ac_data_pk10bj VALUES ('53059', '1531205599', '692050', '03,04,02,07,06,09,08,10,01,05');
INSERT INTO ac_data_pk10bj VALUES ('53097', '1531205911', '692051', '03,06,07,02,08,09,01,04,10,05');
INSERT INTO ac_data_pk10bj VALUES ('53155', '1531206419', '692052', '10,06,04,03,02,09,07,08,05,01');
INSERT INTO ac_data_pk10bj VALUES ('53177', '1531206593', '692053', '03,08,06,07,09,10,01,04,05,02');
INSERT INTO ac_data_pk10bj VALUES ('53200', '1531206796', '692054', '07,01,06,09,04,05,10,03,02,08');
INSERT INTO ac_data_pk10bj VALUES ('53248', '1531207231', '692055', '03,07,05,06,02,04,08,01,10,09');
INSERT INTO ac_data_pk10bj VALUES ('53281', '1531207496', '692056', '09,07,04,06,10,05,08,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('53315', '1531207795', '692057', '10,09,06,07,04,01,02,03,08,05');
INSERT INTO ac_data_pk10bj VALUES ('53347', '1531208086', '692058', '02,09,03,06,07,01,08,04,10,05');
INSERT INTO ac_data_pk10bj VALUES ('53381', '1531208382', '692059', '04,02,10,08,09,07,01,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('53418', '1531208689', '692060', '05,06,02,04,01,07,09,03,10,08');
INSERT INTO ac_data_pk10bj VALUES ('53451', '1531208976', '692061', '02,01,05,06,03,09,10,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('53486', '1531209287', '692062', '02,05,07,10,01,03,09,06,08,04');
INSERT INTO ac_data_pk10bj VALUES ('53507', '1531209469', '692063', '04,06,07,05,09,03,02,10,08,01');
INSERT INTO ac_data_pk10bj VALUES ('53539', '1531209763', '692064', '02,01,05,03,06,10,04,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('53576', '1531210072', '692065', '08,01,09,10,07,03,04,02,06,05');
INSERT INTO ac_data_pk10bj VALUES ('53604', '1531210368', '692066', '07,06,05,08,10,02,09,01,03,04');
INSERT INTO ac_data_pk10bj VALUES ('53640', '1531210662', '692067', '02,09,04,03,01,06,07,10,05,08');
INSERT INTO ac_data_pk10bj VALUES ('53675', '1531210974', '692068', '09,03,02,07,10,01,04,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('53712', '1531211270', '692069', '07,03,01,08,09,05,10,02,04,06');
INSERT INTO ac_data_pk10bj VALUES ('53747', '1531211569', '692070', '04,06,03,02,09,07,08,01,10,05');
INSERT INTO ac_data_pk10bj VALUES ('53782', '1531211867', '692071', '09,03,06,07,01,08,04,10,05,02');
INSERT INTO ac_data_pk10bj VALUES ('53819', '1531212162', '692072', '05,02,10,09,03,04,08,06,01,07');
INSERT INTO ac_data_pk10bj VALUES ('53856', '1531212471', '692073', '06,07,01,08,10,05,03,04,02,09');
INSERT INTO ac_data_pk10bj VALUES ('53890', '1531212761', '692074', '02,05,08,09,04,10,03,07,06,01');
INSERT INTO ac_data_pk10bj VALUES ('53928', '1531213062', '692075', '09,03,05,01,08,02,04,07,06,10');
INSERT INTO ac_data_pk10bj VALUES ('53959', '1531213373', '692076', '05,06,04,08,07,02,01,03,09,10');
INSERT INTO ac_data_pk10bj VALUES ('53992', '1531213669', '692077', '05,01,08,06,07,03,10,04,09,02');
INSERT INTO ac_data_pk10bj VALUES ('54027', '1531213967', '692078', '08,01,07,06,10,04,05,02,09,03');
INSERT INTO ac_data_pk10bj VALUES ('54063', '1531214267', '692079', '02,05,10,07,04,06,09,01,03,08');
INSERT INTO ac_data_pk10bj VALUES ('54099', '1531214568', '692080', '10,09,01,06,05,02,08,03,07,04');
INSERT INTO ac_data_pk10bj VALUES ('54133', '1531214869', '692081', '10,02,01,05,09,03,04,07,08,06');
INSERT INTO ac_data_pk10bj VALUES ('54168', '1531215165', '692082', '08,09,02,04,03,06,01,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('54205', '1531215466', '692083', '03,07,09,06,04,08,10,01,02,05');
INSERT INTO ac_data_pk10bj VALUES ('54239', '1531215764', '692084', '02,03,01,10,07,04,09,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('54274', '1531216062', '692085', '08,02,09,05,07,06,03,01,10,04');
INSERT INTO ac_data_pk10bj VALUES ('54307', '1531216367', '692086', '02,03,10,01,05,07,06,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('54343', '1531216670', '692087', '05,04,06,07,09,10,02,03,01,08');
INSERT INTO ac_data_pk10bj VALUES ('54377', '1531216964', '692088', '04,01,08,09,03,05,10,02,06,07');
INSERT INTO ac_data_pk10bj VALUES ('54413', '1531217267', '692089', '09,07,08,10,01,05,04,03,02,06');
INSERT INTO ac_data_pk10bj VALUES ('54446', '1531217569', '692090', '02,01,07,08,04,05,10,03,09,06');
INSERT INTO ac_data_pk10bj VALUES ('54482', '1531217862', '692091', '07,02,03,08,04,10,05,09,01,06');
INSERT INTO ac_data_pk10bj VALUES ('54519', '1531218167', '692092', '06,04,08,10,01,03,05,07,02,09');
INSERT INTO ac_data_pk10bj VALUES ('54556', '1531218462', '692093', '02,10,03,06,01,07,08,09,04,05');
INSERT INTO ac_data_pk10bj VALUES ('54588', '1531218765', '692094', '09,10,07,06,08,02,05,03,01,04');
INSERT INTO ac_data_pk10bj VALUES ('54624', '1531219066', '692095', '03,10,02,06,07,04,05,01,09,08');
INSERT INTO ac_data_pk10bj VALUES ('54661', '1531219364', '692096', '02,04,07,10,01,06,03,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('54697', '1531219663', '692097', '09,06,04,07,02,10,03,01,08,05');
INSERT INTO ac_data_pk10bj VALUES ('54734', '1531219966', '692098', '04,03,01,08,05,07,09,06,02,10');
INSERT INTO ac_data_pk10bj VALUES ('54770', '1531220270', '692099', '01,02,03,07,10,06,05,09,08,04');
INSERT INTO ac_data_pk10bj VALUES ('54805', '1531220569', '692100', '09,08,02,03,04,07,01,05,06,10');
INSERT INTO ac_data_pk10bj VALUES ('54840', '1531220864', '692101', '01,04,07,06,02,09,10,03,05,08');
INSERT INTO ac_data_pk10bj VALUES ('54874', '1531221164', '692102', '03,04,02,08,06,07,01,09,05,10');
INSERT INTO ac_data_pk10bj VALUES ('54909', '1531221470', '692103', '01,07,06,08,02,03,05,09,04,10');
INSERT INTO ac_data_pk10bj VALUES ('54942', '1531221765', '692104', '03,08,07,05,04,10,09,01,06,02');
INSERT INTO ac_data_pk10bj VALUES ('54978', '1531222070', '692105', '04,03,06,08,01,02,07,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('55014', '1531222368', '692106', '07,05,10,03,01,04,06,09,08,02');
INSERT INTO ac_data_pk10bj VALUES ('55051', '1531222663', '692107', '09,08,02,07,03,01,10,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('55086', '1531222965', '692108', '10,02,07,01,04,08,09,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('55120', '1531223264', '692109', '02,08,04,07,03,10,09,05,01,06');
INSERT INTO ac_data_pk10bj VALUES ('55156', '1531223561', '692110', '04,01,03,10,09,08,06,05,07,02');
INSERT INTO ac_data_pk10bj VALUES ('55193', '1531223868', '692111', '01,02,09,10,05,07,04,06,08,03');
INSERT INTO ac_data_pk10bj VALUES ('55229', '1531224169', '692112', '08,07,03,01,02,10,09,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('55260', '1531224469', '692113', '02,01,04,08,10,05,03,07,09,06');
INSERT INTO ac_data_pk10bj VALUES ('55293', '1531224776', '692114', '05,02,06,09,08,03,04,10,07,01');
INSERT INTO ac_data_pk10bj VALUES ('55327', '1531225078', '692115', '04,08,05,10,07,09,03,06,02,01');
INSERT INTO ac_data_pk10bj VALUES ('55361', '1531225364', '692116', '06,03,05,01,07,09,04,08,02,10');
INSERT INTO ac_data_pk10bj VALUES ('55395', '1531225679', '692117', '04,07,08,09,10,05,02,06,03,01');
INSERT INTO ac_data_pk10bj VALUES ('55423', '1531225969', '692118', '10,06,01,07,04,03,09,08,02,05');
INSERT INTO ac_data_pk10bj VALUES ('55460', '1531226270', '692119', '09,06,07,03,02,10,08,04,01,05');
INSERT INTO ac_data_pk10bj VALUES ('55495', '1531226569', '692120', '08,06,01,04,05,02,07,10,09,03');
INSERT INTO ac_data_pk10bj VALUES ('55530', '1531226864', '692121', '06,04,01,07,05,02,03,09,08,10');
INSERT INTO ac_data_pk10bj VALUES ('55563', '1531227172', '692122', '02,09,05,07,06,10,03,08,01,04');
INSERT INTO ac_data_pk10bj VALUES ('55598', '1531227462', '692123', '02,09,05,01,10,08,04,07,06,03');
INSERT INTO ac_data_pk10bj VALUES ('55634', '1531227766', '692124', '09,05,10,02,01,04,03,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('55667', '1531228067', '692125', '09,02,04,01,03,05,10,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('55701', '1531228363', '692126', '08,04,01,05,09,06,02,03,07,10');
INSERT INTO ac_data_pk10bj VALUES ('55731', '1531228666', '692127', '09,05,08,02,03,01,06,10,07,04');
INSERT INTO ac_data_pk10bj VALUES ('55765', '1531228968', '692128', '02,07,05,09,04,01,03,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('55800', '1531229271', '692129', '01,05,10,04,03,07,02,08,09,06');
INSERT INTO ac_data_pk10bj VALUES ('55835', '1531229561', '692130', '03,02,06,10,05,09,07,08,01,04');
INSERT INTO ac_data_pk10bj VALUES ('55871', '1531229866', '692131', '05,03,04,02,07,08,06,01,10,09');
INSERT INTO ac_data_pk10bj VALUES ('55907', '1531230163', '692132', '07,01,05,04,09,10,02,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('55944', '1531230471', '692133', '01,02,10,09,07,04,05,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('55979', '1531230763', '692134', '07,04,01,06,10,08,09,03,02,05');
INSERT INTO ac_data_pk10bj VALUES ('56016', '1531231061', '692135', '08,02,01,05,06,03,07,09,04,10');
INSERT INTO ac_data_pk10bj VALUES ('56052', '1531231372', '692136', '05,01,08,03,09,10,04,06,07,02');
INSERT INTO ac_data_pk10bj VALUES ('56088', '1531231663', '692137', '08,04,05,06,01,03,07,09,10,02');
INSERT INTO ac_data_pk10bj VALUES ('56120', '1531231972', '692138', '07,04,06,08,05,01,02,10,09,03');
INSERT INTO ac_data_pk10bj VALUES ('56155', '1531232275', '692139', '09,07,08,03,06,10,01,02,05,04');
INSERT INTO ac_data_pk10bj VALUES ('56189', '1531232569', '692140', '02,04,10,03,01,06,08,09,07,05');
INSERT INTO ac_data_pk10bj VALUES ('56226', '1531232866', '692141', '01,09,02,04,07,03,05,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('56258', '1531233170', '692142', '03,02,06,09,07,04,05,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('56290', '1531233468', '692143', '01,02,04,06,10,09,08,07,03,05');
INSERT INTO ac_data_pk10bj VALUES ('56326', '1531233767', '692144', '08,10,05,03,04,06,09,02,07,01');
INSERT INTO ac_data_pk10bj VALUES ('56362', '1531234066', '692145', '09,08,10,03,07,04,06,05,02,01');
INSERT INTO ac_data_pk10bj VALUES ('56396', '1531234379', '692146', '04,02,03,06,08,09,07,10,01,05');
INSERT INTO ac_data_pk10bj VALUES ('56424', '1531234668', '692147', '02,07,04,09,08,10,05,03,01,06');
INSERT INTO ac_data_pk10bj VALUES ('56460', '1531234966', '692148', '09,01,02,05,08,03,10,04,06,07');
INSERT INTO ac_data_pk10bj VALUES ('56494', '1531235273', '692149', '10,03,09,07,02,04,06,05,08,01');
INSERT INTO ac_data_pk10bj VALUES ('56527', '1531235563', '692150', '09,06,05,04,01,08,02,10,03,07');
INSERT INTO ac_data_pk10bj VALUES ('56561', '1531235874', '692151', '10,06,07,03,02,09,05,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('56593', '1531236167', '692152', '06,02,03,08,09,04,07,10,05,01');
INSERT INTO ac_data_pk10bj VALUES ('56631', '1531236472', '692153', '08,09,07,10,03,06,02,04,01,05');
INSERT INTO ac_data_pk10bj VALUES ('56663', '1531236768', '692154', '02,05,06,09,04,01,10,07,08,03');
INSERT INTO ac_data_pk10bj VALUES ('56700', '1531237066', '692155', '07,02,01,08,10,04,09,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('56736', '1531237365', '692156', '02,05,08,06,03,01,09,04,10,07');
INSERT INTO ac_data_pk10bj VALUES ('56770', '1531237671', '692157', '05,06,07,02,10,09,08,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('56803', '1531237977', '692158', '06,08,07,09,10,04,05,02,01,03');
INSERT INTO ac_data_pk10bj VALUES ('56838', '1531238268', '692159', '06,04,01,08,07,10,05,02,03,09');
INSERT INTO ac_data_pk10bj VALUES ('56919', '1531271263', '692160', '04,03,10,09,05,01,02,06,07,08');
INSERT INTO ac_data_pk10bj VALUES ('56953', '1531271567', '692161', '09,08,03,05,10,04,06,01,02,07');
INSERT INTO ac_data_pk10bj VALUES ('56988', '1531271871', '692162', '03,10,06,07,09,05,02,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('57025', '1531272174', '692163', '09,07,06,05,01,04,03,10,02,08');
INSERT INTO ac_data_pk10bj VALUES ('57056', '1531272460', '692164', '07,06,08,09,05,10,01,02,03,04');
INSERT INTO ac_data_pk10bj VALUES ('57093', '1531272768', '692165', '08,02,06,07,09,05,01,04,03,10');
INSERT INTO ac_data_pk10bj VALUES ('57130', '1531273064', '692166', '05,09,04,03,02,08,01,10,07,06');
INSERT INTO ac_data_pk10bj VALUES ('57165', '1531273372', '692167', '10,07,04,02,03,01,09,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('57199', '1531273672', '692168', '04,06,07,03,10,09,02,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('57230', '1531273968', '692169', '07,10,09,02,06,01,05,03,08,04');
INSERT INTO ac_data_pk10bj VALUES ('57262', '1531274269', '692170', '07,05,02,10,03,01,08,04,09,06');
INSERT INTO ac_data_pk10bj VALUES ('57298', '1531274563', '692171', '04,01,02,08,06,03,07,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('57331', '1531274877', '692172', '07,09,04,03,08,02,10,05,06,01');
INSERT INTO ac_data_pk10bj VALUES ('57362', '1531275173', '692173', '03,07,02,04,06,01,10,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('57394', '1531275465', '692174', '04,07,06,10,08,03,02,01,05,09');
INSERT INTO ac_data_pk10bj VALUES ('57432', '1531275768', '692175', '10,02,01,08,05,07,04,03,09,06');
INSERT INTO ac_data_pk10bj VALUES ('57468', '1531276073', '692176', '04,02,05,01,09,10,03,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('57503', '1531276376', '692177', '07,04,10,03,05,06,09,08,01,02');
INSERT INTO ac_data_pk10bj VALUES ('57538', '1531276672', '692178', '06,05,08,03,01,07,02,04,09,10');
INSERT INTO ac_data_pk10bj VALUES ('57568', '1531276964', '692179', '03,02,09,06,07,10,04,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('57602', '1531277266', '692180', '06,08,01,10,02,09,05,07,04,03');
INSERT INTO ac_data_pk10bj VALUES ('57636', '1531277571', '692181', '01,09,08,05,10,06,02,03,04,07');
INSERT INTO ac_data_pk10bj VALUES ('57670', '1531277865', '692182', '08,02,07,05,01,03,04,10,09,06');
INSERT INTO ac_data_pk10bj VALUES ('57704', '1531278163', '692183', '08,09,04,05,03,06,02,01,10,07');
INSERT INTO ac_data_pk10bj VALUES ('57741', '1531278469', '692184', '06,09,01,10,07,08,04,05,02,03');
INSERT INTO ac_data_pk10bj VALUES ('57776', '1531278771', '692185', '05,08,06,03,07,09,02,04,10,01');
INSERT INTO ac_data_pk10bj VALUES ('57809', '1531279065', '692186', '07,04,08,03,05,06,10,02,09,01');
INSERT INTO ac_data_pk10bj VALUES ('57846', '1531279368', '692187', '01,05,09,06,02,04,03,10,07,08');
INSERT INTO ac_data_pk10bj VALUES ('57882', '1531279666', '692188', '02,09,03,04,08,01,06,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('57916', '1531279975', '692189', '06,09,07,01,02,10,08,04,05,03');
INSERT INTO ac_data_pk10bj VALUES ('57949', '1531280271', '692190', '03,04,09,06,10,02,01,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('57985', '1531280566', '692191', '03,08,10,01,06,04,07,02,05,09');
INSERT INTO ac_data_pk10bj VALUES ('58017', '1531280876', '692192', '02,04,08,07,09,05,06,10,01,03');
INSERT INTO ac_data_pk10bj VALUES ('58050', '1531281175', '692193', '08,03,10,02,07,06,04,09,01,05');
INSERT INTO ac_data_pk10bj VALUES ('58082', '1531281466', '692194', '05,08,09,02,04,10,06,03,01,07');
INSERT INTO ac_data_pk10bj VALUES ('58117', '1531281777', '692195', '10,06,09,05,07,02,03,01,08,04');
INSERT INTO ac_data_pk10bj VALUES ('58151', '1531282070', '692196', '06,09,08,07,02,03,05,01,10,04');
INSERT INTO ac_data_pk10bj VALUES ('58186', '1531282371', '692197', '04,07,09,10,01,06,02,03,05,08');
INSERT INTO ac_data_pk10bj VALUES ('58221', '1531282667', '692198', '01,05,04,03,06,10,07,02,08,09');
INSERT INTO ac_data_pk10bj VALUES ('58253', '1531282967', '692199', '09,10,02,01,07,08,04,03,06,05');
INSERT INTO ac_data_pk10bj VALUES ('58288', '1531283263', '692200', '08,09,04,01,05,02,03,06,10,07');
INSERT INTO ac_data_pk10bj VALUES ('58323', '1531283574', '692201', '01,08,09,07,06,10,04,03,02,05');
INSERT INTO ac_data_pk10bj VALUES ('58359', '1531283871', '692202', '06,04,05,07,10,09,01,08,02,03');
INSERT INTO ac_data_pk10bj VALUES ('58389', '1531284165', '692203', '09,01,07,05,04,06,08,03,02,10');
INSERT INTO ac_data_pk10bj VALUES ('58422', '1531284464', '692204', '01,07,04,09,10,06,02,03,05,08');
INSERT INTO ac_data_pk10bj VALUES ('58456', '1531284768', '692205', '03,09,07,10,04,01,08,06,02,05');
INSERT INTO ac_data_pk10bj VALUES ('58488', '1531285068', '692206', '01,05,08,06,10,04,03,09,02,07');
INSERT INTO ac_data_pk10bj VALUES ('58522', '1531285360', '692207', '05,06,04,02,10,07,03,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('58558', '1531285663', '692208', '05,07,03,06,09,10,01,08,04,02');
INSERT INTO ac_data_pk10bj VALUES ('58595', '1531285976', '692209', '04,01,03,06,08,07,05,02,10,09');
INSERT INTO ac_data_pk10bj VALUES ('58629', '1531286261', '692210', '06,10,03,09,07,05,04,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('58665', '1531286572', '692211', '07,02,04,01,10,09,08,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('58702', '1531286868', '692212', '09,10,05,01,02,04,06,07,08,03');
INSERT INTO ac_data_pk10bj VALUES ('58738', '1531287166', '692213', '04,05,01,08,06,10,02,03,09,07');
INSERT INTO ac_data_pk10bj VALUES ('58773', '1531287463', '692214', '03,04,06,02,05,01,07,08,09,10');
INSERT INTO ac_data_pk10bj VALUES ('58812', '1531287765', '692215', '08,01,04,02,05,03,10,06,09,07');
INSERT INTO ac_data_pk10bj VALUES ('58845', '1531288067', '692216', '09,03,02,07,08,04,10,01,05,06');
INSERT INTO ac_data_pk10bj VALUES ('58882', '1531288375', '692217', '05,07,04,02,06,01,08,10,09,03');
INSERT INTO ac_data_pk10bj VALUES ('58918', '1531288670', '692218', '07,08,10,06,03,01,05,04,09,02');
INSERT INTO ac_data_pk10bj VALUES ('58955', '1531288966', '692219', '08,06,04,02,10,05,03,09,01,07');
INSERT INTO ac_data_pk10bj VALUES ('58986', '1531289274', '692220', '02,03,05,06,07,10,04,09,08,01');
INSERT INTO ac_data_pk10bj VALUES ('59010', '1531289595', '692221', '07,02,03,09,05,01,10,06,04,08');
INSERT INTO ac_data_pk10bj VALUES ('59036', '1531289863', '692222', '06,03,02,04,10,01,05,08,09,07');
INSERT INTO ac_data_pk10bj VALUES ('59073', '1531290167', '692223', '07,02,03,10,01,04,08,05,09,06');
INSERT INTO ac_data_pk10bj VALUES ('59110', '1531290470', '692224', '10,04,03,08,06,02,01,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('59145', '1531290760', '692225', '02,09,01,04,05,08,03,07,10,06');
INSERT INTO ac_data_pk10bj VALUES ('59182', '1531291061', '692226', '03,06,04,02,07,01,08,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('59215', '1531291367', '692227', '01,05,06,02,03,04,10,09,08,07');
INSERT INTO ac_data_pk10bj VALUES ('59251', '1531291664', '692228', '02,04,08,07,10,06,03,09,05,01');
INSERT INTO ac_data_pk10bj VALUES ('59289', '1531291970', '692229', '10,07,02,08,04,03,05,06,01,09');
INSERT INTO ac_data_pk10bj VALUES ('59326', '1531292268', '692230', '05,10,03,09,02,04,01,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('59358', '1531292567', '692231', '02,10,06,01,05,08,07,04,03,09');
INSERT INTO ac_data_pk10bj VALUES ('59392', '1531292868', '692232', '06,05,04,02,09,10,03,07,01,08');
INSERT INTO ac_data_pk10bj VALUES ('59428', '1531293175', '692233', '06,03,02,07,10,01,05,09,08,04');
INSERT INTO ac_data_pk10bj VALUES ('59462', '1531293469', '692234', '07,09,10,04,01,03,08,06,02,05');
INSERT INTO ac_data_pk10bj VALUES ('59498', '1531293773', '692235', '01,08,03,02,05,10,06,09,07,04');
INSERT INTO ac_data_pk10bj VALUES ('59533', '1531294066', '692236', '02,05,10,01,09,08,04,07,06,03');
INSERT INTO ac_data_pk10bj VALUES ('59567', '1531294363', '692237', '07,01,10,09,02,06,08,05,04,03');
INSERT INTO ac_data_pk10bj VALUES ('59601', '1531294665', '692238', '03,08,07,02,09,04,05,01,10,06');
INSERT INTO ac_data_pk10bj VALUES ('59635', '1531294977', '692239', '04,06,08,01,07,09,02,03,05,10');
INSERT INTO ac_data_pk10bj VALUES ('59672', '1531295276', '692240', '07,06,02,08,09,05,03,10,01,04');
INSERT INTO ac_data_pk10bj VALUES ('59706', '1531295564', '692241', '02,05,10,09,08,04,07,06,03,01');
INSERT INTO ac_data_pk10bj VALUES ('59734', '1531295879', '692242', '03,06,09,08,07,10,04,05,02,01');
INSERT INTO ac_data_pk10bj VALUES ('59763', '1531296164', '692243', '02,01,09,07,10,04,08,05,06,03');
INSERT INTO ac_data_pk10bj VALUES ('59801', '1531296477', '692244', '06,03,08,02,01,05,07,09,04,10');
INSERT INTO ac_data_pk10bj VALUES ('59832', '1531296774', '692245', '10,04,03,07,09,08,01,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('59865', '1531297064', '692246', '07,10,06,09,02,08,05,01,03,04');
INSERT INTO ac_data_pk10bj VALUES ('59897', '1531297369', '692247', '09,06,03,10,07,02,04,08,01,05');
INSERT INTO ac_data_pk10bj VALUES ('59932', '1531297663', '692248', '01,10,04,02,08,07,03,05,09,06');
INSERT INTO ac_data_pk10bj VALUES ('59969', '1531297974', '692249', '03,05,07,01,04,08,10,06,02,09');
INSERT INTO ac_data_pk10bj VALUES ('60003', '1531298276', '692250', '06,10,05,04,03,09,08,07,02,01');
INSERT INTO ac_data_pk10bj VALUES ('60038', '1531298570', '692251', '05,08,02,01,06,03,07,04,10,09');
INSERT INTO ac_data_pk10bj VALUES ('60075', '1531298861', '692252', '06,05,10,03,02,07,01,09,08,04');
INSERT INTO ac_data_pk10bj VALUES ('60111', '1531299166', '692253', '04,07,01,08,09,02,05,03,10,06');
INSERT INTO ac_data_pk10bj VALUES ('60145', '1531299470', '692254', '08,04,03,01,07,09,06,10,02,05');
INSERT INTO ac_data_pk10bj VALUES ('60180', '1531299773', '692255', '10,06,05,08,07,03,09,04,01,02');
INSERT INTO ac_data_pk10bj VALUES ('60216', '1531300080', '692256', '02,10,09,05,01,08,06,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('60249', '1531300367', '692257', '01,06,09,08,04,02,07,03,10,05');
INSERT INTO ac_data_pk10bj VALUES ('60283', '1531300662', '692258', '03,05,04,08,10,01,09,06,02,07');
INSERT INTO ac_data_pk10bj VALUES ('60321', '1531300973', '692259', '04,05,09,02,06,03,07,10,01,08');
INSERT INTO ac_data_pk10bj VALUES ('60353', '1531301263', '692260', '09,05,08,10,04,06,01,03,02,07');
INSERT INTO ac_data_pk10bj VALUES ('60389', '1531301566', '692261', '04,03,10,07,01,05,02,06,08,09');
INSERT INTO ac_data_pk10bj VALUES ('60425', '1531301870', '692262', '07,06,04,02,05,10,09,01,03,08');
INSERT INTO ac_data_pk10bj VALUES ('60460', '1531302167', '692263', '01,09,04,05,03,07,08,06,02,10');
INSERT INTO ac_data_pk10bj VALUES ('60499', '1531302472', '692264', '09,10,03,04,08,06,07,02,05,01');
INSERT INTO ac_data_pk10bj VALUES ('60531', '1531302781', '692265', '05,10,01,07,06,03,09,08,04,02');
INSERT INTO ac_data_pk10bj VALUES ('60562', '1531303071', '692266', '08,10,04,03,06,05,02,01,07,09');
INSERT INTO ac_data_pk10bj VALUES ('60598', '1531303366', '692267', '04,05,09,01,02,08,07,10,06,03');
INSERT INTO ac_data_pk10bj VALUES ('60629', '1531303664', '692268', '09,07,04,02,10,08,03,05,06,01');
INSERT INTO ac_data_pk10bj VALUES ('60664', '1531303967', '692269', '01,05,09,10,07,08,02,03,06,04');
INSERT INTO ac_data_pk10bj VALUES ('60701', '1531304268', '692270', '03,05,08,07,04,09,02,10,06,01');
INSERT INTO ac_data_pk10bj VALUES ('60736', '1531304564', '692271', '04,09,08,06,03,01,02,05,07,10');
INSERT INTO ac_data_pk10bj VALUES ('60774', '1531304868', '692272', '10,09,05,08,02,07,03,01,04,06');
INSERT INTO ac_data_pk10bj VALUES ('60809', '1531305165', '692273', '04,05,08,02,03,10,06,07,09,01');
INSERT INTO ac_data_pk10bj VALUES ('60845', '1531305468', '692274', '08,09,01,03,04,10,07,05,02,06');
INSERT INTO ac_data_pk10bj VALUES ('60880', '1531305771', '692275', '05,09,04,08,06,07,10,03,02,01');
INSERT INTO ac_data_pk10bj VALUES ('60916', '1531306070', '692276', '05,03,01,08,06,02,10,09,04,07');
INSERT INTO ac_data_pk10bj VALUES ('60952', '1531306366', '692277', '04,03,08,05,02,01,10,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('60988', '1531306674', '692278', '03,04,09,02,07,08,05,10,01,06');
INSERT INTO ac_data_pk10bj VALUES ('61025', '1531306972', '692279', '09,08,03,02,04,01,06,07,05,10');
INSERT INTO ac_data_pk10bj VALUES ('61061', '1531307277', '692280', '03,06,05,01,10,04,02,07,08,09');
INSERT INTO ac_data_pk10bj VALUES ('61095', '1531307570', '692281', '07,08,01,10,06,04,02,03,09,05');
INSERT INTO ac_data_pk10bj VALUES ('61132', '1531307866', '692282', '02,01,10,03,09,07,06,05,04,08');
INSERT INTO ac_data_pk10bj VALUES ('61166', '1531308168', '692283', '03,02,07,01,06,05,10,04,08,09');
INSERT INTO ac_data_pk10bj VALUES ('61198', '1531308474', '692284', '05,07,10,09,08,02,01,06,04,03');
INSERT INTO ac_data_pk10bj VALUES ('61232', '1531308764', '692285', '09,03,04,08,10,02,01,07,05,06');
INSERT INTO ac_data_pk10bj VALUES ('61266', '1531309065', '692286', '02,01,08,04,05,07,06,03,09,10');
INSERT INTO ac_data_pk10bj VALUES ('61302', '1531309365', '692287', '07,04,03,05,10,02,08,09,06,01');
INSERT INTO ac_data_pk10bj VALUES ('61338', '1531309668', '692288', '08,02,09,07,01,04,10,03,05,06');
INSERT INTO ac_data_pk10bj VALUES ('61374', '1531309978', '692289', '08,10,05,07,04,03,01,02,09,06');
INSERT INTO ac_data_pk10bj VALUES ('61410', '1531310264', '692290', '02,04,07,01,05,06,03,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('61447', '1531310572', '692291', '08,09,02,06,01,03,05,10,04,07');
INSERT INTO ac_data_pk10bj VALUES ('61481', '1531310862', '692292', '05,06,10,02,04,03,08,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('61508', '1531311163', '692293', '09,02,01,06,10,07,04,05,03,08');
INSERT INTO ac_data_pk10bj VALUES ('61542', '1531311471', '692294', '01,07,03,08,05,09,04,06,10,02');
INSERT INTO ac_data_pk10bj VALUES ('61577', '1531311765', '692295', '02,10,01,09,04,05,06,08,03,07');
INSERT INTO ac_data_pk10bj VALUES ('61611', '1531312065', '692296', '07,05,01,03,04,09,08,06,02,10');
INSERT INTO ac_data_pk10bj VALUES ('61647', '1531312375', '692297', '09,08,01,04,06,05,10,07,03,02');
INSERT INTO ac_data_pk10bj VALUES ('61681', '1531312660', '692298', '01,03,08,04,10,05,06,02,07,09');
INSERT INTO ac_data_pk10bj VALUES ('61718', '1531312967', '692299', '02,04,03,06,08,01,09,05,10,07');
INSERT INTO ac_data_pk10bj VALUES ('61754', '1531313276', '692300', '01,03,05,04,08,02,06,07,10,09');
INSERT INTO ac_data_pk10bj VALUES ('61790', '1531313572', '692301', '07,04,03,01,05,02,09,08,06,10');
INSERT INTO ac_data_pk10bj VALUES ('61823', '1531313867', '692302', '06,09,03,02,04,05,01,08,07,10');
INSERT INTO ac_data_pk10bj VALUES ('61859', '1531314176', '692303', '10,01,04,06,02,09,08,07,05,03');
INSERT INTO ac_data_pk10bj VALUES ('61894', '1531314476', '692304', '08,02,01,07,10,05,03,06,09,04');
INSERT INTO ac_data_pk10bj VALUES ('61929', '1531314773', '692305', '06,03,05,02,08,09,01,04,07,10');
INSERT INTO ac_data_pk10bj VALUES ('61962', '1531315060', '692306', '07,09,01,06,02,10,04,08,03,05');
INSERT INTO ac_data_pk10bj VALUES ('61998', '1531315367', '692307', '06,09,08,05,01,02,03,07,10,04');
INSERT INTO ac_data_pk10bj VALUES ('62032', '1531315671', '692308', '02,04,07,01,10,09,06,08,03,05');
INSERT INTO ac_data_pk10bj VALUES ('62066', '1531315958', '692309', '02,01,09,08,05,06,07,10,04,03');
INSERT INTO ac_data_pk10bj VALUES ('62104', '1531316268', '692310', '05,07,06,03,08,10,04,01,09,02');
INSERT INTO ac_data_pk10bj VALUES ('62140', '1531316567', '692311', '10,08,03,07,05,04,01,06,09,02');
INSERT INTO ac_data_pk10bj VALUES ('62176', '1531316866', '692312', '02,10,07,03,04,06,08,09,05,01');
INSERT INTO ac_data_pk10bj VALUES ('62211', '1531317164', '692313', '03,01,07,10,09,04,08,02,05,06');
INSERT INTO ac_data_pk10bj VALUES ('62247', '1531317476', '692314', '06,01,09,02,05,03,08,10,04,07');
INSERT INTO ac_data_pk10bj VALUES ('62279', '1531317764', '692315', '03,06,01,07,10,08,02,09,04,05');
INSERT INTO ac_data_pk10bj VALUES ('62313', '1531318067', '692316', '02,08,09,05,10,07,03,06,04,01');
INSERT INTO ac_data_pk10bj VALUES ('62343', '1531318359', '692317', '06,03,09,07,02,10,08,05,01,04');
INSERT INTO ac_data_pk10bj VALUES ('62381', '1531318667', '692318', '01,04,02,05,07,10,03,06,09,08');
INSERT INTO ac_data_pk10bj VALUES ('62418', '1531318970', '692319', '10,06,09,05,01,04,03,08,02,07');
INSERT INTO ac_data_pk10bj VALUES ('62453', '1531319269', '692320', '01,03,09,04,10,07,02,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('62488', '1531319567', '692321', '08,10,04,06,05,02,09,01,07,03');
INSERT INTO ac_data_pk10bj VALUES ('62521', '1531319863', '692322', '03,08,09,10,06,02,04,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('62558', '1531320160', '692323', '03,02,10,01,06,09,05,07,04,08');
INSERT INTO ac_data_pk10bj VALUES ('62594', '1531320472', '692324', '07,05,04,02,08,09,03,10,01,06');
INSERT INTO ac_data_pk10bj VALUES ('62630', '1531320776', '692325', '06,10,05,04,02,07,01,09,03,08');
INSERT INTO ac_data_pk10bj VALUES ('62665', '1531321071', '692326', '08,09,04,10,02,01,06,03,05,07');
INSERT INTO ac_data_pk10bj VALUES ('62701', '1531321372', '692327', '03,09,04,08,10,06,05,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('62737', '1531321664', '692328', '02,08,09,10,03,07,05,01,04,06');
INSERT INTO ac_data_pk10bj VALUES ('62773', '1531321974', '692329', '04,05,02,03,08,09,10,07,01,06');
INSERT INTO ac_data_pk10bj VALUES ('62803', '1531322265', '692330', '09,01,07,04,03,06,08,05,02,10');
INSERT INTO ac_data_pk10bj VALUES ('62834', '1531322565', '692331', '05,09,04,01,10,08,07,03,06,02');
INSERT INTO ac_data_pk10bj VALUES ('62868', '1531322878', '692332', '06,02,05,03,01,09,08,10,07,04');
INSERT INTO ac_data_pk10bj VALUES ('62902', '1531323163', '692333', '08,02,01,03,07,06,05,10,09,04');
INSERT INTO ac_data_pk10bj VALUES ('62937', '1531323467', '692334', '02,09,07,05,03,06,04,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('62971', '1531323764', '692335', '10,04,09,01,05,08,06,03,02,07');
INSERT INTO ac_data_pk10bj VALUES ('63004', '1531324067', '692336', '08,02,05,10,01,04,03,06,07,09');
INSERT INTO ac_data_pk10bj VALUES ('63040', '1531324366', '692337', '07,10,04,02,05,03,09,06,01,08');
INSERT INTO ac_data_pk10bj VALUES ('63074', '1531324672', '692338', '07,04,08,09,05,10,03,06,01,02');
INSERT INTO ac_data_pk10bj VALUES ('63140', '1531357693', '692339', '04,09,07,02,05,03,08,10,01,06');
INSERT INTO ac_data_pk10bj VALUES ('63174', '1531357986', '692340', '04,03,10,07,08,05,02,09,01,06');
INSERT INTO ac_data_pk10bj VALUES ('63211', '1531358295', '692341', '05,03,07,04,02,08,01,10,09,06');
INSERT INTO ac_data_pk10bj VALUES ('63247', '1531358594', '692342', '05,02,04,09,01,10,06,07,03,08');
INSERT INTO ac_data_pk10bj VALUES ('63283', '1531358893', '692343', '10,01,02,08,09,06,04,07,05,03');
INSERT INTO ac_data_pk10bj VALUES ('63315', '1531359188', '692344', '03,06,08,09,05,02,07,01,10,04');
INSERT INTO ac_data_pk10bj VALUES ('63351', '1531359490', '692345', '05,09,02,01,10,08,04,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('63383', '1531359797', '692346', '05,08,09,07,10,01,04,06,03,02');
INSERT INTO ac_data_pk10bj VALUES ('63417', '1531360094', '692347', '05,01,04,02,08,09,06,03,07,10');
INSERT INTO ac_data_pk10bj VALUES ('63454', '1531360396', '692348', '09,01,08,06,05,07,04,03,02,10');
INSERT INTO ac_data_pk10bj VALUES ('63486', '1531360701', '692349', '03,04,09,01,05,08,10,06,07,02');
INSERT INTO ac_data_pk10bj VALUES ('63519', '1531360998', '692350', '01,05,04,06,10,09,02,03,07,08');
INSERT INTO ac_data_pk10bj VALUES ('63548', '1531361292', '692351', '02,10,06,01,09,05,03,08,07,04');
INSERT INTO ac_data_pk10bj VALUES ('63581', '1531361592', '692352', '05,09,08,04,06,10,01,07,02,03');
INSERT INTO ac_data_pk10bj VALUES ('63608', '1531361886', '692353', '03,04,05,10,07,02,01,08,09,06');
INSERT INTO ac_data_pk10bj VALUES ('63640', '1531362196', '692354', '03,01,09,08,06,05,07,04,10,02');
INSERT INTO ac_data_pk10bj VALUES ('63673', '1531362495', '692355', '06,05,08,10,03,01,07,02,04,09');
INSERT INTO ac_data_pk10bj VALUES ('63707', '1531362797', '692356', '02,05,07,06,10,01,03,09,08,04');
INSERT INTO ac_data_pk10bj VALUES ('63743', '1531363097', '692357', '02,03,04,05,09,10,07,08,06,01');
INSERT INTO ac_data_pk10bj VALUES ('63777', '1531363396', '692358', '04,01,07,08,10,05,02,06,09,03');
INSERT INTO ac_data_pk10bj VALUES ('63812', '1531363701', '692359', '08,10,02,01,06,09,07,05,03,04');
INSERT INTO ac_data_pk10bj VALUES ('63849', '1531363992', '692360', '08,06,04,02,07,09,03,01,10,05');
INSERT INTO ac_data_pk10bj VALUES ('63883', '1531364292', '692361', '08,10,04,06,09,07,02,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('63915', '1531364589', '692362', '06,07,02,09,01,05,03,08,04,10');
INSERT INTO ac_data_pk10bj VALUES ('63950', '1531364894', '692363', '10,07,08,04,09,05,01,06,03,02');
INSERT INTO ac_data_pk10bj VALUES ('63986', '1531365191', '692364', '07,02,06,05,10,01,04,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('64016', '1531365490', '692365', '10,03,02,04,05,09,06,08,07,01');
INSERT INTO ac_data_pk10bj VALUES ('64049', '1531365796', '692366', '01,02,09,04,08,10,07,03,06,05');
INSERT INTO ac_data_pk10bj VALUES ('64077', '1531366087', '692367', '10,01,07,06,02,03,04,08,05,09');
INSERT INTO ac_data_pk10bj VALUES ('64112', '1531366390', '692368', '06,07,03,02,01,10,08,09,05,04');
INSERT INTO ac_data_pk10bj VALUES ('64146', '1531366693', '692369', '03,05,01,04,02,06,09,10,08,07');
INSERT INTO ac_data_pk10bj VALUES ('64178', '1531366998', '692370', '01,08,10,09,05,02,07,04,03,06');
INSERT INTO ac_data_pk10bj VALUES ('64212', '1531367295', '692371', '09,10,04,08,06,02,07,01,05,03');
INSERT INTO ac_data_pk10bj VALUES ('64247', '1531367588', '692372', '05,03,01,02,08,07,09,06,10,04');
INSERT INTO ac_data_pk10bj VALUES ('64281', '1531367889', '692373', '07,01,06,09,05,03,08,02,04,10');
INSERT INTO ac_data_pk10bj VALUES ('64314', '1531368186', '692374', '08,04,07,06,01,05,09,02,10,03');
INSERT INTO ac_data_pk10bj VALUES ('64350', '1531368492', '692375', '08,05,03,04,07,06,10,02,09,01');
INSERT INTO ac_data_pk10bj VALUES ('64384', '1531368801', '692376', '05,10,04,03,06,01,02,09,08,07');
INSERT INTO ac_data_pk10bj VALUES ('64417', '1531369094', '692377', '04,06,09,08,03,05,02,01,10,07');
INSERT INTO ac_data_pk10bj VALUES ('64451', '1531369392', '692378', '07,08,01,04,06,09,10,05,03,02');
INSERT INTO ac_data_pk10bj VALUES ('64486', '1531369687', '692379', '04,09,01,03,07,08,05,10,02,06');
INSERT INTO ac_data_pk10bj VALUES ('64523', '1531369988', '692380', '06,05,07,09,03,08,04,02,01,10');
INSERT INTO ac_data_pk10bj VALUES ('64557', '1531370298', '692381', '09,05,01,04,02,08,07,03,10,06');
INSERT INTO ac_data_pk10bj VALUES ('64593', '1531370592', '692382', '09,05,02,06,10,04,01,07,03,08');
INSERT INTO ac_data_pk10bj VALUES ('64629', '1531370894', '692383', '10,06,03,02,04,05,07,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('64665', '1531371185', '692384', '09,08,04,01,06,03,10,07,05,02');
INSERT INTO ac_data_pk10bj VALUES ('64700', '1531371483', '692385', '07,06,08,03,02,09,01,10,04,05');
INSERT INTO ac_data_pk10bj VALUES ('64737', '1531371797', '692386', '07,02,01,05,10,09,03,08,06,04');
INSERT INTO ac_data_pk10bj VALUES ('64768', '1531372091', '692387', '09,01,07,10,05,04,08,02,03,06');
INSERT INTO ac_data_pk10bj VALUES ('64800', '1531372392', '692388', '10,09,05,08,03,07,01,02,04,06');
INSERT INTO ac_data_pk10bj VALUES ('64834', '1531372693', '692389', '03,10,09,08,07,04,05,01,02,06');
INSERT INTO ac_data_pk10bj VALUES ('64869', '1531373008', '692390', '10,09,06,02,03,07,08,04,01,05');
INSERT INTO ac_data_pk10bj VALUES ('64901', '1531373291', '692391', '02,04,09,08,10,07,01,03,05,06');
INSERT INTO ac_data_pk10bj VALUES ('64937', '1531373593', '692392', '07,04,08,01,02,10,05,03,09,06');
INSERT INTO ac_data_pk10bj VALUES ('64972', '1531373893', '692393', '08,01,09,04,02,10,07,03,05,06');
INSERT INTO ac_data_pk10bj VALUES ('65007', '1531374184', '692394', '07,01,10,06,08,02,09,04,05,03');
INSERT INTO ac_data_pk10bj VALUES ('65036', '1531374495', '692395', '01,04,09,03,08,06,05,07,02,10');
INSERT INTO ac_data_pk10bj VALUES ('65070', '1531374797', '692396', '02,04,07,05,01,09,03,08,10,06');
INSERT INTO ac_data_pk10bj VALUES ('65103', '1531375086', '692397', '08,01,03,09,07,06,10,04,02,05');
INSERT INTO ac_data_pk10bj VALUES ('65137', '1531375388', '692398', '01,06,03,04,10,08,09,02,05,07');
INSERT INTO ac_data_pk10bj VALUES ('65172', '1531375697', '692399', '03,02,01,04,07,08,06,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('65203', '1531375986', '692400', '05,08,07,10,01,09,02,06,03,04');
INSERT INTO ac_data_pk10bj VALUES ('65238', '1531376295', '692401', '04,09,03,01,06,02,08,10,05,07');
INSERT INTO ac_data_pk10bj VALUES ('65274', '1531376595', '692402', '10,03,01,04,06,07,09,08,05,02');
INSERT INTO ac_data_pk10bj VALUES ('65305', '1531376892', '692403', '10,07,08,09,03,01,04,06,05,02');
INSERT INTO ac_data_pk10bj VALUES ('65338', '1531377190', '692404', '02,03,06,10,09,05,01,07,08,04');
INSERT INTO ac_data_pk10bj VALUES ('65375', '1531377500', '692405', '05,04,06,01,09,08,10,03,02,07');
INSERT INTO ac_data_pk10bj VALUES ('65422', '1531377973', '692406', '01,07,03,05,04,09,10,06,08,02');
INSERT INTO ac_data_pk10bj VALUES ('65448', '1531378189', '692407', '02,06,04,07,03,01,05,08,09,10');
INSERT INTO ac_data_pk10bj VALUES ('65481', '1531378481', '692408', '06,10,01,05,07,03,08,02,09,04');
INSERT INTO ac_data_pk10bj VALUES ('65515', '1531378787', '692409', '07,09,10,08,01,05,03,06,04,02');
INSERT INTO ac_data_pk10bj VALUES ('65551', '1531379101', '692410', '09,08,07,01,02,10,06,03,05,04');
INSERT INTO ac_data_pk10bj VALUES ('65580', '1531379353', '692411', '06,01,02,04,08,03,09,07,10,05');
INSERT INTO ac_data_pk10bj VALUES ('65603', '1531379566', '692412', '10,03,04,02,01,07,05,09,08,06');
INSERT INTO ac_data_pk10bj VALUES ('65639', '1531379872', '692413', '04,05,07,10,01,09,02,06,08,03');
INSERT INTO ac_data_pk10bj VALUES ('65671', '1531380172', '692414', '09,04,06,03,08,07,01,05,02,10');
INSERT INTO ac_data_pk10bj VALUES ('65704', '1531380474', '692415', '05,07,03,01,09,06,02,08,04,10');
INSERT INTO ac_data_pk10bj VALUES ('65738', '1531380773', '692416', '07,04,03,02,09,06,01,08,05,10');
INSERT INTO ac_data_pk10bj VALUES ('65770', '1531381071', '692417', '07,09,01,05,03,02,04,06,08,10');
INSERT INTO ac_data_pk10bj VALUES ('65803', '1531381365', '692418', '07,04,08,01,09,06,02,03,10,05');
INSERT INTO ac_data_pk10bj VALUES ('65833', '1531381669', '692419', '06,03,09,10,04,02,07,01,08,05');
INSERT INTO ac_data_pk10bj VALUES ('65868', '1531381962', '692420', '02,04,08,07,06,10,05,01,03,09');
INSERT INTO ac_data_pk10bj VALUES ('65900', '1531382302', '692421', '02,10,08,05,01,03,07,06,04,09');
INSERT INTO ac_data_pk10bj VALUES ('65917', '1531382563', '692422', '01,09,04,02,07,03,10,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('65948', '1531382863', '692423', '02,03,01,07,06,04,05,08,10,09');
INSERT INTO ac_data_pk10bj VALUES ('65986', '1531383166', '692424', '09,08,04,03,10,06,01,02,05,07');
INSERT INTO ac_data_pk10bj VALUES ('66020', '1531383463', '692425', '09,10,03,07,05,08,01,06,02,04');
INSERT INTO ac_data_pk10bj VALUES ('66054', '1531383770', '692426', '09,03,01,10,08,02,06,05,04,07');
INSERT INTO ac_data_pk10bj VALUES ('66086', '1531384063', '692427', '09,06,01,08,03,05,02,04,10,07');
INSERT INTO ac_data_pk10bj VALUES ('66119', '1531384374', '692428', '02,10,01,03,09,08,04,06,05,07');
INSERT INTO ac_data_pk10bj VALUES ('66152', '1531384672', '692429', '03,06,04,05,07,09,02,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('66180', '1531384968', '692430', '06,05,02,10,04,07,03,09,01,08');
INSERT INTO ac_data_pk10bj VALUES ('66217', '1531385267', '692431', '06,08,01,09,02,03,04,07,05,10');
INSERT INTO ac_data_pk10bj VALUES ('66250', '1531385566', '692432', '04,05,03,06,10,08,01,02,09,07');
INSERT INTO ac_data_pk10bj VALUES ('66281', '1531385867', '692433', '02,01,06,08,10,03,07,05,09,04');
INSERT INTO ac_data_pk10bj VALUES ('66317', '1531386169', '692434', '06,01,10,07,04,09,05,02,03,08');
INSERT INTO ac_data_pk10bj VALUES ('66351', '1531386475', '692435', '03,01,10,06,07,05,02,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('66384', '1531386774', '692436', '09,04,06,05,07,02,08,03,10,01');
INSERT INTO ac_data_pk10bj VALUES ('66415', '1531387081', '692437', '02,01,07,09,08,04,06,05,03,10');
INSERT INTO ac_data_pk10bj VALUES ('66449', '1531387373', '692438', '04,08,09,02,05,06,03,10,07,01');
INSERT INTO ac_data_pk10bj VALUES ('66481', '1531387672', '692439', '07,09,02,04,03,05,10,01,08,06');
INSERT INTO ac_data_pk10bj VALUES ('66516', '1531387977', '692440', '05,06,08,02,09,10,01,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('66545', '1531388278', '692441', '10,07,02,06,04,03,09,01,08,05');
INSERT INTO ac_data_pk10bj VALUES ('66579', '1531388570', '692442', '09,03,07,02,04,05,10,01,06,08');
INSERT INTO ac_data_pk10bj VALUES ('66615', '1531388867', '692443', '09,05,02,07,04,10,06,03,01,08');
INSERT INTO ac_data_pk10bj VALUES ('66652', '1531389171', '692444', '03,06,05,01,04,09,08,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('66687', '1531389468', '692445', '02,09,07,01,10,05,04,08,06,03');
INSERT INTO ac_data_pk10bj VALUES ('66722', '1531389771', '692446', '07,09,02,01,04,05,10,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('66753', '1531390065', '692447', '04,10,08,01,03,05,09,06,07,02');
INSERT INTO ac_data_pk10bj VALUES ('66787', '1531390373', '692448', '01,06,02,04,09,03,07,08,05,10');
INSERT INTO ac_data_pk10bj VALUES ('66822', '1531390669', '692449', '02,08,09,04,06,05,01,07,03,10');
INSERT INTO ac_data_pk10bj VALUES ('66848', '1531390972', '692450', '07,09,03,04,06,10,05,01,08,02');
INSERT INTO ac_data_pk10bj VALUES ('66879', '1531391279', '692451', '10,06,01,02,08,09,03,05,07,04');
INSERT INTO ac_data_pk10bj VALUES ('66911', '1531391570', '692452', '02,09,04,06,10,05,01,03,07,08');
INSERT INTO ac_data_pk10bj VALUES ('66947', '1531391866', '692453', '10,06,02,05,03,01,09,04,08,07');
INSERT INTO ac_data_pk10bj VALUES ('66980', '1531392166', '692454', '09,07,10,06,05,02,08,03,01,04');
INSERT INTO ac_data_pk10bj VALUES ('67015', '1531392466', '692455', '09,08,10,01,05,06,04,03,07,02');
INSERT INTO ac_data_pk10bj VALUES ('67046', '1531392761', '692456', '03,04,01,08,07,05,09,06,02,10');
INSERT INTO ac_data_pk10bj VALUES ('67083', '1531393070', '692457', '04,07,06,01,02,10,09,08,05,03');
INSERT INTO ac_data_pk10bj VALUES ('67118', '1531393371', '692458', '02,03,01,09,06,10,04,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('67149', '1531393661', '692459', '05,10,02,08,01,03,09,07,06,04');
INSERT INTO ac_data_pk10bj VALUES ('67182', '1531393975', '692460', '02,10,04,08,01,05,09,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('67214', '1531394263', '692461', '02,04,05,08,09,07,06,03,01,10');
INSERT INTO ac_data_pk10bj VALUES ('67248', '1531394569', '692462', '07,08,04,10,03,05,06,01,09,02');
INSERT INTO ac_data_pk10bj VALUES ('67280', '1531394859', '692463', '01,09,03,05,10,07,06,04,02,08');
INSERT INTO ac_data_pk10bj VALUES ('67317', '1531395177', '692464', '03,06,01,08,09,10,05,07,02,04');
INSERT INTO ac_data_pk10bj VALUES ('67349', '1531395465', '692465', '04,02,08,05,10,07,09,01,03,06');
INSERT INTO ac_data_pk10bj VALUES ('67380', '1531395760', '692466', '05,06,09,04,07,08,10,01,02,03');
INSERT INTO ac_data_pk10bj VALUES ('67405', '1531396069', '692467', '09,04,05,02,10,01,07,06,08,03');
INSERT INTO ac_data_pk10bj VALUES ('67439', '1531396367', '692468', '08,07,06,04,10,05,03,01,09,02');
INSERT INTO ac_data_pk10bj VALUES ('67475', '1531396679', '692469', '02,10,06,01,07,03,09,05,08,04');
INSERT INTO ac_data_pk10bj VALUES ('67509', '1531396972', '692470', '06,10,01,08,07,09,04,02,03,05');
INSERT INTO ac_data_pk10bj VALUES ('67544', '1531397270', '692471', '06,07,03,02,04,05,10,01,09,08');
INSERT INTO ac_data_pk10bj VALUES ('67577', '1531397569', '692472', '01,02,03,06,07,05,10,04,08,09');
INSERT INTO ac_data_pk10bj VALUES ('67612', '1531397871', '692473', '02,01,09,08,04,03,10,05,06,07');
INSERT INTO ac_data_pk10bj VALUES ('67648', '1531398163', '692474', '07,06,03,01,10,05,02,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('67680', '1531398466', '692475', '07,03,08,01,06,04,05,02,09,10');
INSERT INTO ac_data_pk10bj VALUES ('67715', '1531398768', '692476', '08,09,05,07,04,01,02,10,03,06');
INSERT INTO ac_data_pk10bj VALUES ('67748', '1531399066', '692477', '09,03,04,06,07,01,10,05,02,08');
INSERT INTO ac_data_pk10bj VALUES ('67779', '1531399372', '692478', '09,02,04,08,01,10,05,07,03,06');
INSERT INTO ac_data_pk10bj VALUES ('67813', '1531399663', '692479', '07,08,01,06,09,03,04,10,05,02');
INSERT INTO ac_data_pk10bj VALUES ('67848', '1531399971', '692480', '10,09,07,06,04,05,01,02,03,08');
INSERT INTO ac_data_pk10bj VALUES ('67880', '1531400267', '692481', '05,04,02,10,01,08,06,09,03,07');
INSERT INTO ac_data_pk10bj VALUES ('67911', '1531400563', '692482', '01,10,06,07,02,04,09,08,03,05');
INSERT INTO ac_data_pk10bj VALUES ('67944', '1531400882', '692483', '01,08,05,10,07,06,09,04,03,02');
INSERT INTO ac_data_pk10bj VALUES ('67968', '1531401164', '692484', '07,08,06,03,05,09,02,04,10,01');
INSERT INTO ac_data_pk10bj VALUES ('68004', '1531401465', '692485', '01,05,06,07,09,03,04,08,02,10');
INSERT INTO ac_data_pk10bj VALUES ('68034', '1531401772', '692486', '10,01,02,03,08,04,07,06,09,05');
INSERT INTO ac_data_pk10bj VALUES ('68062', '1531402064', '692487', '02,05,07,10,03,01,06,09,08,04');
INSERT INTO ac_data_pk10bj VALUES ('68093', '1531402365', '692488', '09,06,01,08,07,03,04,05,10,02');
INSERT INTO ac_data_pk10bj VALUES ('68127', '1531402663', '692489', '07,06,05,01,03,02,09,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('68161', '1531402967', '692490', '05,02,07,10,01,08,04,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('68196', '1531403271', '692491', '05,10,01,06,04,09,08,07,02,03');
INSERT INTO ac_data_pk10bj VALUES ('68229', '1531403575', '692492', '04,07,10,08,06,09,05,03,01,02');
INSERT INTO ac_data_pk10bj VALUES ('68263', '1531403865', '692493', '03,10,01,09,07,08,04,06,05,02');
INSERT INTO ac_data_pk10bj VALUES ('68296', '1531404168', '692494', '01,03,08,04,07,06,02,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('68329', '1531404472', '692495', '08,02,03,04,01,06,09,07,10,05');
INSERT INTO ac_data_pk10bj VALUES ('68361', '1531404772', '692496', '06,03,02,10,09,04,05,01,07,08');
INSERT INTO ac_data_pk10bj VALUES ('68395', '1531405071', '692497', '02,06,04,10,07,01,03,08,09,05');
INSERT INTO ac_data_pk10bj VALUES ('68427', '1531405366', '692498', '09,04,02,07,03,05,06,08,01,10');
INSERT INTO ac_data_pk10bj VALUES ('68462', '1531405667', '692499', '02,03,01,07,04,08,06,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('68497', '1531405964', '692500', '07,04,08,05,01,03,06,09,10,02');
INSERT INTO ac_data_pk10bj VALUES ('68534', '1531406273', '692501', '07,04,06,08,10,05,09,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('68567', '1531406568', '692502', '10,02,01,06,07,05,03,08,09,04');
INSERT INTO ac_data_pk10bj VALUES ('68604', '1531406870', '692503', '01,03,07,10,06,02,09,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('68637', '1531407174', '692504', '10,01,07,02,09,03,04,06,05,08');
INSERT INTO ac_data_pk10bj VALUES ('68671', '1531407471', '692505', '09,01,10,02,08,04,07,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('68708', '1531407768', '692506', '08,01,04,06,03,07,09,02,05,10');
INSERT INTO ac_data_pk10bj VALUES ('68741', '1531408075', '692507', '05,02,04,10,07,03,08,06,01,09');
INSERT INTO ac_data_pk10bj VALUES ('68776', '1531408363', '692508', '07,01,02,03,10,09,04,05,06,08');
INSERT INTO ac_data_pk10bj VALUES ('68812', '1531408666', '692509', '08,02,09,10,05,07,01,03,06,04');
INSERT INTO ac_data_pk10bj VALUES ('68847', '1531408970', '692510', '04,05,10,08,06,02,03,07,09,01');
INSERT INTO ac_data_pk10bj VALUES ('68879', '1531409272', '692511', '03,07,10,06,05,01,09,04,02,08');
INSERT INTO ac_data_pk10bj VALUES ('68915', '1531409566', '692512', '03,08,01,04,09,06,05,10,02,07');
INSERT INTO ac_data_pk10bj VALUES ('68951', '1531409868', '692513', '04,05,06,10,02,01,03,08,09,07');
INSERT INTO ac_data_pk10bj VALUES ('68983', '1531410164', '692514', '02,07,01,04,09,05,10,03,06,08');
INSERT INTO ac_data_pk10bj VALUES ('69017', '1531410472', '692515', '08,06,04,09,05,07,10,02,03,01');
INSERT INTO ac_data_pk10bj VALUES ('69051', '1531410769', '692516', '05,03,10,02,01,08,04,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('69084', '1531411067', '692517', '06,10,05,07,08,01,09,04,02,03');
INSERT INTO ac_data_pk10bj VALUES ('69166', '1531444061', '692518', '03,04,08,10,02,01,09,07,06,05');
INSERT INTO ac_data_pk10bj VALUES ('69200', '1531444369', '692519', '05,07,02,09,08,01,06,10,03,04');
INSERT INTO ac_data_pk10bj VALUES ('69234', '1531444668', '692520', '08,02,09,07,06,05,01,10,04,03');
INSERT INTO ac_data_pk10bj VALUES ('69271', '1531444965', '692521', '01,09,05,06,08,10,03,07,04,02');
INSERT INTO ac_data_pk10bj VALUES ('69302', '1531445271', '692522', '05,03,07,10,04,06,02,08,01,09');
INSERT INTO ac_data_pk10bj VALUES ('69338', '1531445563', '692523', '04,09,06,01,08,03,10,02,05,07');
INSERT INTO ac_data_pk10bj VALUES ('69372', '1531445863', '692524', '10,09,05,07,06,04,01,02,08,03');
INSERT INTO ac_data_pk10bj VALUES ('69407', '1531446169', '692525', '04,10,05,09,02,08,06,01,03,07');
INSERT INTO ac_data_pk10bj VALUES ('69441', '1531446473', '692526', '06,09,03,08,10,01,04,05,07,02');
INSERT INTO ac_data_pk10bj VALUES ('69475', '1531446763', '692527', '10,09,06,08,04,05,07,03,02,01');
INSERT INTO ac_data_pk10bj VALUES ('69509', '1531447069', '692528', '03,04,08,02,07,05,01,06,09,10');
INSERT INTO ac_data_pk10bj VALUES ('69542', '1531447369', '692529', '02,08,10,01,09,04,07,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('69578', '1531447670', '692530', '02,10,04,01,05,07,08,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('69613', '1531447966', '692531', '08,09,03,10,02,05,06,07,04,01');
INSERT INTO ac_data_pk10bj VALUES ('69649', '1531448267', '692532', '04,01,05,07,10,09,02,08,06,03');
INSERT INTO ac_data_pk10bj VALUES ('69680', '1531448569', '692533', '10,04,02,09,05,01,08,03,06,07');
INSERT INTO ac_data_pk10bj VALUES ('69711', '1531448869', '692534', '01,09,02,10,06,07,05,08,03,04');
INSERT INTO ac_data_pk10bj VALUES ('69745', '1531449170', '692535', '04,02,10,09,06,03,08,07,01,05');
INSERT INTO ac_data_pk10bj VALUES ('69780', '1531449469', '692536', '07,06,09,02,04,08,10,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('69815', '1531449774', '692537', '05,09,08,02,06,04,07,10,03,01');
INSERT INTO ac_data_pk10bj VALUES ('69844', '1531450076', '692538', '01,05,03,09,10,02,08,04,06,07');
INSERT INTO ac_data_pk10bj VALUES ('69879', '1531450365', '692539', '10,08,03,07,02,01,05,09,06,04');
INSERT INTO ac_data_pk10bj VALUES ('69913', '1531450663', '692540', '03,05,10,09,02,06,07,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('69925', '1531451066', '692541', '08,07,02,09,04,03,01,05,06,10');
INSERT INTO ac_data_pk10bj VALUES ('69940', '1531451265', '692542', '07,05,10,09,02,01,04,03,06,08');
INSERT INTO ac_data_pk10bj VALUES ('69974', '1531451563', '692543', '05,06,09,02,10,07,08,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('70011', '1531451866', '692544', '06,04,08,10,07,09,03,01,02,05');
INSERT INTO ac_data_pk10bj VALUES ('70046', '1531452175', '692545', '01,08,10,04,02,05,06,09,07,03');
INSERT INTO ac_data_pk10bj VALUES ('70077', '1531452474', '692546', '02,09,06,08,04,07,01,05,03,10');
INSERT INTO ac_data_pk10bj VALUES ('70110', '1531452762', '692547', '03,06,02,01,05,09,08,04,10,07');
INSERT INTO ac_data_pk10bj VALUES ('70147', '1531453072', '692548', '08,01,03,09,07,04,02,10,06,05');
INSERT INTO ac_data_pk10bj VALUES ('70184', '1531453371', '692549', '03,08,04,10,06,09,07,01,02,05');
INSERT INTO ac_data_pk10bj VALUES ('70219', '1531453666', '692550', '01,09,07,10,03,04,06,02,05,08');
INSERT INTO ac_data_pk10bj VALUES ('70245', '1531453967', '692551', '07,03,09,08,01,10,02,05,04,06');
INSERT INTO ac_data_pk10bj VALUES ('70281', '1531454263', '692552', '08,06,09,02,05,04,10,03,01,07');
INSERT INTO ac_data_pk10bj VALUES ('70315', '1531454581', '692553', '08,02,10,03,06,09,05,07,01,04');
INSERT INTO ac_data_pk10bj VALUES ('70348', '1531454864', '692554', '01,03,07,04,09,02,05,08,06,10');
INSERT INTO ac_data_pk10bj VALUES ('70381', '1531455168', '692555', '06,09,01,08,07,10,02,05,03,04');
INSERT INTO ac_data_pk10bj VALUES ('70416', '1531455469', '692556', '08,07,03,09,04,05,06,01,02,10');
INSERT INTO ac_data_pk10bj VALUES ('70439', '1531455760', '692557', '02,03,05,07,08,04,10,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('70477', '1531456070', '692558', '02,01,07,08,05,06,09,10,03,04');
INSERT INTO ac_data_pk10bj VALUES ('70511', '1531456373', '692559', '03,01,05,09,06,02,07,08,10,04');
INSERT INTO ac_data_pk10bj VALUES ('70545', '1531456668', '692560', '03,06,10,04,08,09,05,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('70581', '1531456978', '692561', '03,06,07,01,09,02,10,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('70614', '1531457267', '692562', '05,01,06,09,08,03,02,10,04,07');
INSERT INTO ac_data_pk10bj VALUES ('70646', '1531457565', '692563', '10,06,08,01,04,05,09,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('70682', '1531457874', '692564', '05,08,06,07,09,04,02,01,10,03');
INSERT INTO ac_data_pk10bj VALUES ('70719', '1531458169', '692565', '06,10,04,01,02,08,07,03,05,09');
INSERT INTO ac_data_pk10bj VALUES ('70756', '1531458470', '692566', '09,02,08,01,06,10,03,05,04,07');
INSERT INTO ac_data_pk10bj VALUES ('70785', '1531458776', '692567', '03,01,05,09,06,07,08,04,10,02');
INSERT INTO ac_data_pk10bj VALUES ('70816', '1531459068', '692568', '03,01,06,05,10,04,08,09,07,02');
INSERT INTO ac_data_pk10bj VALUES ('70846', '1531459370', '692569', '06,09,04,07,08,02,01,03,05,10');
INSERT INTO ac_data_pk10bj VALUES ('70879', '1531459674', '692570', '09,10,04,01,08,05,03,02,06,07');
INSERT INTO ac_data_pk10bj VALUES ('70914', '1531459966', '692571', '07,06,02,03,10,01,09,05,04,08');
INSERT INTO ac_data_pk10bj VALUES ('70948', '1531460275', '692572', '10,03,08,04,07,02,01,05,09,06');
INSERT INTO ac_data_pk10bj VALUES ('70982', '1531460563', '692573', '07,05,06,10,09,04,02,08,01,03');
INSERT INTO ac_data_pk10bj VALUES ('71016', '1531460863', '692574', '06,09,10,03,08,04,01,02,05,07');
INSERT INTO ac_data_pk10bj VALUES ('71050', '1531461164', '692575', '08,03,04,01,07,05,10,02,06,09');
INSERT INTO ac_data_pk10bj VALUES ('71083', '1531461461', '692576', '08,10,05,09,02,03,04,01,06,07');
INSERT INTO ac_data_pk10bj VALUES ('71108', '1531461765', '692577', '01,06,08,02,10,04,03,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('71128', '1531462068', '692578', '09,06,03,04,05,08,10,02,07,01');
INSERT INTO ac_data_pk10bj VALUES ('71160', '1531462362', '692579', '06,09,02,03,07,05,10,01,08,04');
INSERT INTO ac_data_pk10bj VALUES ('71196', '1531462671', '692580', '03,10,08,07,04,05,06,02,01,09');
INSERT INTO ac_data_pk10bj VALUES ('71232', '1531462971', '692581', '08,07,02,01,09,06,03,04,10,05');
INSERT INTO ac_data_pk10bj VALUES ('71265', '1531463265', '692582', '09,02,08,06,04,03,10,05,01,07');
INSERT INTO ac_data_pk10bj VALUES ('71300', '1531463574', '692583', '06,03,08,09,04,02,07,01,10,05');
INSERT INTO ac_data_pk10bj VALUES ('71333', '1531463866', '692584', '10,05,06,01,02,08,03,04,09,07');
INSERT INTO ac_data_pk10bj VALUES ('71366', '1531464170', '692585', '07,10,03,08,01,02,04,09,05,06');
INSERT INTO ac_data_pk10bj VALUES ('71400', '1531464466', '692586', '04,06,02,10,01,07,03,05,09,08');
INSERT INTO ac_data_pk10bj VALUES ('71434', '1531464769', '692587', '04,01,05,06,08,03,09,10,07,02');
INSERT INTO ac_data_pk10bj VALUES ('71468', '1531465073', '692588', '10,08,05,04,02,01,03,06,09,07');
INSERT INTO ac_data_pk10bj VALUES ('71502', '1531465369', '692589', '06,07,04,02,08,09,01,03,05,10');
INSERT INTO ac_data_pk10bj VALUES ('71534', '1531465674', '692590', '01,07,06,03,02,04,10,05,08,09');
INSERT INTO ac_data_pk10bj VALUES ('71566', '1531465978', '692591', '07,09,03,04,06,05,02,01,08,10');
INSERT INTO ac_data_pk10bj VALUES ('71600', '1531466268', '692592', '02,10,03,04,09,01,08,05,06,07');
INSERT INTO ac_data_pk10bj VALUES ('71635', '1531466567', '692593', '08,10,04,07,06,05,01,03,09,02');
INSERT INTO ac_data_pk10bj VALUES ('71671', '1531466885', '692594', '08,04,05,03,07,06,01,09,10,02');
INSERT INTO ac_data_pk10bj VALUES ('71697', '1531467165', '692595', '10,07,04,03,09,02,05,01,08,06');
INSERT INTO ac_data_pk10bj VALUES ('71729', '1531467471', '692596', '03,10,02,05,06,01,07,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('71763', '1531467768', '692597', '01,10,08,04,06,05,07,02,09,03');
INSERT INTO ac_data_pk10bj VALUES ('71788', '1531468072', '692598', '02,05,03,08,10,04,09,01,07,06');
INSERT INTO ac_data_pk10bj VALUES ('71820', '1531468371', '692599', '04,07,02,05,01,08,09,03,10,06');
INSERT INTO ac_data_pk10bj VALUES ('71851', '1531468670', '692600', '09,01,03,10,04,08,02,06,07,05');
INSERT INTO ac_data_pk10bj VALUES ('71882', '1531468968', '692601', '06,01,07,09,05,10,02,03,08,04');
INSERT INTO ac_data_pk10bj VALUES ('71909', '1531469262', '692602', '02,04,08,09,10,03,07,01,05,06');
INSERT INTO ac_data_pk10bj VALUES ('71945', '1531469568', '692603', '09,04,02,03,08,07,01,06,05,10');
INSERT INTO ac_data_pk10bj VALUES ('71980', '1531469867', '692604', '07,08,02,04,01,09,03,10,05,06');
INSERT INTO ac_data_pk10bj VALUES ('72010', '1531470173', '692605', '09,08,05,03,06,10,01,04,07,02');
INSERT INTO ac_data_pk10bj VALUES ('72045', '1531470464', '692606', '10,04,05,09,03,07,01,06,02,08');
INSERT INTO ac_data_pk10bj VALUES ('72082', '1531470777', '692607', '02,05,01,09,06,08,03,04,10,07');
INSERT INTO ac_data_pk10bj VALUES ('72114', '1531471072', '692608', '10,06,09,05,01,07,03,02,04,08');
INSERT INTO ac_data_pk10bj VALUES ('72148', '1531471367', '692609', '01,04,06,02,05,07,10,03,08,09');
INSERT INTO ac_data_pk10bj VALUES ('72183', '1531471670', '692610', '03,09,06,01,10,04,05,02,07,08');
INSERT INTO ac_data_pk10bj VALUES ('72214', '1531471962', '692611', '05,09,04,06,03,10,08,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('72249', '1531472274', '692612', '10,01,02,05,03,06,04,09,07,08');
INSERT INTO ac_data_pk10bj VALUES ('72284', '1531472572', '692613', '10,01,03,06,05,04,09,08,02,07');
INSERT INTO ac_data_pk10bj VALUES ('72314', '1531472868', '692614', '09,05,04,02,01,07,06,10,08,03');
INSERT INTO ac_data_pk10bj VALUES ('72350', '1531473170', '692615', '07,02,06,08,04,09,05,10,03,01');
INSERT INTO ac_data_pk10bj VALUES ('72386', '1531473464', '692616', '07,05,08,09,06,03,04,02,10,01');
INSERT INTO ac_data_pk10bj VALUES ('72417', '1531473762', '692617', '02,05,04,06,08,09,03,10,07,01');
INSERT INTO ac_data_pk10bj VALUES ('72452', '1531474063', '692618', '09,08,04,03,10,05,01,02,07,06');
INSERT INTO ac_data_pk10bj VALUES ('72485', '1531474372', '692619', '03,05,10,06,01,09,07,08,02,04');
INSERT INTO ac_data_pk10bj VALUES ('72519', '1531474672', '692620', '02,01,07,03,10,04,06,05,09,08');
INSERT INTO ac_data_pk10bj VALUES ('72552', '1531474967', '692621', '06,05,10,01,07,03,02,04,08,09');
INSERT INTO ac_data_pk10bj VALUES ('72584', '1531475262', '692622', '03,02,09,05,04,01,06,07,08,10');
INSERT INTO ac_data_pk10bj VALUES ('72619', '1531475569', '692623', '03,08,04,10,02,07,09,05,01,06');
INSERT INTO ac_data_pk10bj VALUES ('72654', '1531475875', '692624', '08,05,07,01,10,09,03,04,02,06');
INSERT INTO ac_data_pk10bj VALUES ('72687', '1531476167', '692625', '03,08,07,01,05,09,02,10,06,04');
INSERT INTO ac_data_pk10bj VALUES ('72722', '1531476477', '692626', '03,05,02,08,06,01,10,04,07,09');
INSERT INTO ac_data_pk10bj VALUES ('72757', '1531476762', '692627', '01,03,06,02,04,09,10,05,07,08');
INSERT INTO ac_data_pk10bj VALUES ('72790', '1531477062', '692628', '01,03,06,07,05,10,09,04,08,02');
INSERT INTO ac_data_pk10bj VALUES ('72824', '1531477365', '692629', '02,08,04,09,07,03,10,06,01,05');
INSERT INTO ac_data_pk10bj VALUES ('72858', '1531477666', '692630', '05,01,03,09,06,07,08,04,02,10');
INSERT INTO ac_data_pk10bj VALUES ('72891', '1531477963', '692631', '06,02,01,09,07,05,10,04,08,03');
INSERT INTO ac_data_pk10bj VALUES ('72924', '1531478268', '692632', '01,02,06,09,04,05,03,08,07,10');
INSERT INTO ac_data_pk10bj VALUES ('72959', '1531478568', '692633', '03,02,10,04,06,07,05,09,08,01');
INSERT INTO ac_data_pk10bj VALUES ('72996', '1531478867', '692634', '05,02,06,08,04,07,10,09,03,01');
INSERT INTO ac_data_pk10bj VALUES ('73033', '1531479174', '692635', '10,04,02,08,05,07,01,03,06,09');
INSERT INTO ac_data_pk10bj VALUES ('73067', '1531479473', '692636', '09,04,02,06,05,10,03,01,07,08');
INSERT INTO ac_data_pk10bj VALUES ('73101', '1531479773', '692637', '05,01,08,03,10,07,06,09,04,02');
INSERT INTO ac_data_pk10bj VALUES ('73136', '1531480076', '692638', '08,05,02,10,01,07,04,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('73167', '1531480376', '692639', '01,03,09,08,02,04,06,10,05,07');
INSERT INTO ac_data_pk10bj VALUES ('73201', '1531480676', '692640', '08,01,02,06,09,03,07,04,10,05');
INSERT INTO ac_data_pk10bj VALUES ('73232', '1531480964', '692641', '10,05,04,01,06,08,02,09,07,03');
INSERT INTO ac_data_pk10bj VALUES ('73266', '1531481267', '692642', '09,02,03,05,07,10,04,08,06,01');
INSERT INTO ac_data_pk10bj VALUES ('73303', '1531481562', '692643', '10,03,09,02,07,04,05,08,01,06');
INSERT INTO ac_data_pk10bj VALUES ('73339', '1531481862', '692644', '05,01,08,07,03,04,02,09,06,10');
INSERT INTO ac_data_pk10bj VALUES ('73371', '1531482167', '692645', '01,09,07,08,10,04,05,03,06,02');
INSERT INTO ac_data_pk10bj VALUES ('73406', '1531482474', '692646', '05,09,02,06,08,04,01,03,07,10');
INSERT INTO ac_data_pk10bj VALUES ('73435', '1531482766', '692647', '02,10,06,09,08,01,03,04,07,05');
INSERT INTO ac_data_pk10bj VALUES ('73471', '1531483067', '692648', '01,02,04,10,06,05,08,03,09,07');
INSERT INTO ac_data_pk10bj VALUES ('73504', '1531483362', '692649', '02,05,07,01,10,08,04,03,06,09');
INSERT INTO ac_data_pk10bj VALUES ('73537', '1531483672', '692650', '04,07,06,02,08,05,10,01,03,09');
INSERT INTO ac_data_pk10bj VALUES ('73574', '1531483978', '692651', '10,08,07,02,05,04,06,03,09,01');
INSERT INTO ac_data_pk10bj VALUES ('73607', '1531484263', '692652', '05,01,06,03,02,10,07,04,09,08');
INSERT INTO ac_data_pk10bj VALUES ('73641', '1531484570', '692653', '04,06,07,02,09,03,10,01,05,08');
INSERT INTO ac_data_pk10bj VALUES ('73672', '1531484865', '692654', '03,05,06,04,02,07,01,08,09,10');
INSERT INTO ac_data_pk10bj VALUES ('73705', '1531485172', '692655', '08,06,05,07,01,04,10,09,03,02');
INSERT INTO ac_data_pk10bj VALUES ('73738', '1531485475', '692656', '09,05,08,01,10,03,02,04,06,07');
INSERT INTO ac_data_pk10bj VALUES ('73767', '1531485769', '692657', '04,01,10,06,09,05,08,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('73803', '1531486063', '692658', '02,10,09,04,08,03,07,06,01,05');
INSERT INTO ac_data_pk10bj VALUES ('73840', '1531486377', '692659', '10,08,06,05,03,09,02,01,04,07');
INSERT INTO ac_data_pk10bj VALUES ('73875', '1531486676', '692660', '09,06,08,05,03,07,02,04,10,01');
INSERT INTO ac_data_pk10bj VALUES ('73905', '1531486970', '692661', '07,10,05,09,08,04,03,01,06,02');
INSERT INTO ac_data_pk10bj VALUES ('73936', '1531487266', '692662', '04,09,07,02,01,03,10,08,05,06');
INSERT INTO ac_data_pk10bj VALUES ('73969', '1531487566', '692663', '04,09,01,07,10,05,03,08,06,02');
INSERT INTO ac_data_pk10bj VALUES ('74000', '1531487869', '692664', '10,01,05,04,02,08,09,06,03,07');
INSERT INTO ac_data_pk10bj VALUES ('74025', '1531488166', '692665', '06,05,10,09,07,01,02,04,08,03');
INSERT INTO ac_data_pk10bj VALUES ('74060', '1531488475', '692666', '05,01,10,03,07,02,09,06,04,08');
INSERT INTO ac_data_pk10bj VALUES ('74095', '1531488775', '692667', '02,10,09,05,06,04,01,03,08,07');
INSERT INTO ac_data_pk10bj VALUES ('74129', '1531489071', '692668', '04,06,01,05,07,08,03,09,02,10');
INSERT INTO ac_data_pk10bj VALUES ('74164', '1531489371', '692669', '09,01,08,02,05,03,10,04,07,06');
INSERT INTO ac_data_pk10bj VALUES ('74199', '1531489671', '692670', '06,03,08,02,04,05,09,10,07,01');
INSERT INTO ac_data_pk10bj VALUES ('74234', '1531489967', '692671', '02,05,04,08,07,10,09,01,06,03');
INSERT INTO ac_data_pk10bj VALUES ('74268', '1531490261', '692672', '04,07,06,03,10,08,02,01,05,09');
INSERT INTO ac_data_pk10bj VALUES ('74295', '1531490572', '692673', '07,01,06,04,02,05,03,09,10,08');
INSERT INTO ac_data_pk10bj VALUES ('74330', '1531490875', '692674', '06,07,03,04,08,05,09,10,02,01');
INSERT INTO ac_data_pk10bj VALUES ('74365', '1531491171', '692675', '03,04,08,07,02,06,09,05,10,01');
INSERT INTO ac_data_pk10bj VALUES ('74402', '1531491469', '692676', '05,06,08,10,07,03,09,02,01,04');
INSERT INTO ac_data_pk10bj VALUES ('74438', '1531491765', '692677', '07,09,04,02,03,10,05,08,06,01');
INSERT INTO ac_data_pk10bj VALUES ('74471', '1531492067', '692678', '03,04,02,07,01,08,09,10,05,06');
INSERT INTO ac_data_pk10bj VALUES ('74504', '1531492366', '692679', '03,06,07,08,05,01,09,04,02,10');
INSERT INTO ac_data_pk10bj VALUES ('74538', '1531492666', '692680', '01,02,08,03,09,10,05,04,07,06');
INSERT INTO ac_data_pk10bj VALUES ('74567', '1531492969', '692681', '03,02,07,10,05,04,08,01,09,06');
INSERT INTO ac_data_pk10bj VALUES ('74604', '1531493272', '692682', '05,10,06,02,07,09,08,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('74639', '1531493563', '692683', '10,04,05,01,02,03,08,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('74677', '1531493871', '692684', '08,10,01,05,06,09,02,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('74712', '1531494171', '692685', '09,08,04,01,02,10,03,07,05,06');
INSERT INTO ac_data_pk10bj VALUES ('74744', '1531494464', '692686', '06,10,03,05,04,07,08,02,09,01');
INSERT INTO ac_data_pk10bj VALUES ('74778', '1531494763', '692687', '07,08,03,06,04,01,09,02,10,05');
INSERT INTO ac_data_pk10bj VALUES ('74814', '1531495068', '692688', '09,07,02,05,06,01,03,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('74848', '1531495367', '692689', '08,05,02,06,09,07,10,04,01,03');
INSERT INTO ac_data_pk10bj VALUES ('74884', '1531495663', '692690', '04,05,10,02,09,07,01,06,03,08');
INSERT INTO ac_data_pk10bj VALUES ('74919', '1531495975', '692691', '10,08,02,04,05,07,03,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('74954', '1531496270', '692692', '10,08,06,07,09,01,02,03,04,05');
INSERT INTO ac_data_pk10bj VALUES ('74988', '1531496563', '692693', '06,10,05,03,08,09,01,02,07,04');
INSERT INTO ac_data_pk10bj VALUES ('75019', '1531496872', '692694', '04,09,01,07,08,10,05,06,03,02');
INSERT INTO ac_data_pk10bj VALUES ('75051', '1531497161', '692695', '04,02,05,09,03,07,10,01,08,06');
INSERT INTO ac_data_pk10bj VALUES ('75089', '1531497467', '692696', '02,04,10,06,09,01,07,08,03,05');
INSERT INTO ac_data_pk10bj VALUES ('75173', '1531530468', '692697', '08,03,05,04,02,10,06,07,09,01');
INSERT INTO ac_data_pk10bj VALUES ('75208', '1531530763', '692698', '10,08,01,09,05,02,06,04,07,03');
INSERT INTO ac_data_pk10bj VALUES ('75243', '1531531066', '692699', '08,07,02,05,01,06,04,03,09,10');
INSERT INTO ac_data_pk10bj VALUES ('75277', '1531531360', '692700', '05,07,08,02,10,06,03,01,09,04');
INSERT INTO ac_data_pk10bj VALUES ('75314', '1531531663', '692701', '06,03,10,07,05,09,04,02,01,08');
INSERT INTO ac_data_pk10bj VALUES ('75351', '1531531964', '692702', '06,10,02,07,04,08,03,01,05,09');
INSERT INTO ac_data_pk10bj VALUES ('75390', '1531532280', '692703', '03,04,06,08,09,07,01,02,05,10');
INSERT INTO ac_data_pk10bj VALUES ('75423', '1531532569', '692704', '06,04,03,02,10,09,01,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('75456', '1531532876', '692705', '08,01,09,10,02,03,06,04,05,07');
INSERT INTO ac_data_pk10bj VALUES ('75490', '1531533170', '692706', '02,04,03,09,06,05,08,10,01,07');
INSERT INTO ac_data_pk10bj VALUES ('75526', '1531533469', '692707', '01,06,04,02,05,07,09,08,10,03');
INSERT INTO ac_data_pk10bj VALUES ('75560', '1531533764', '692708', '04,07,10,03,02,08,09,01,05,06');
INSERT INTO ac_data_pk10bj VALUES ('75595', '1531534059', '692709', '03,07,06,05,10,09,04,08,02,01');
INSERT INTO ac_data_pk10bj VALUES ('75634', '1531534365', '692710', '05,03,07,08,09,04,01,02,10,06');
INSERT INTO ac_data_pk10bj VALUES ('75671', '1531534663', '692711', '05,09,06,04,03,08,01,02,10,07');
INSERT INTO ac_data_pk10bj VALUES ('75705', '1531534968', '692712', '01,09,06,10,04,07,05,02,03,08');
INSERT INTO ac_data_pk10bj VALUES ('75739', '1531535265', '692713', '01,05,04,06,07,10,09,03,08,02');
INSERT INTO ac_data_pk10bj VALUES ('75773', '1531535572', '692714', '03,04,09,08,01,07,10,06,05,02');
INSERT INTO ac_data_pk10bj VALUES ('75803', '1531535867', '692715', '10,03,01,07,04,08,02,05,06,09');
INSERT INTO ac_data_pk10bj VALUES ('75839', '1531536177', '692716', '04,01,02,08,07,05,09,10,03,06');
INSERT INTO ac_data_pk10bj VALUES ('75873', '1531536469', '692717', '04,10,05,08,06,07,03,01,09,02');
INSERT INTO ac_data_pk10bj VALUES ('75905', '1531536776', '692718', '06,10,09,08,04,01,02,05,03,07');
INSERT INTO ac_data_pk10bj VALUES ('75940', '1531537070', '692719', '09,04,01,03,05,07,10,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('75974', '1531537382', '692720', '01,04,02,08,03,10,07,05,06,09');
INSERT INTO ac_data_pk10bj VALUES ('76007', '1531537675', '692721', '06,03,02,08,04,07,05,01,10,09');
INSERT INTO ac_data_pk10bj VALUES ('76039', '1531537966', '692722', '05,09,06,08,01,03,04,10,07,02');
INSERT INTO ac_data_pk10bj VALUES ('76071', '1531538265', '692723', '06,05,10,09,08,03,04,02,01,07');
INSERT INTO ac_data_pk10bj VALUES ('76104', '1531538568', '692724', '01,07,08,10,02,06,04,05,03,09');
INSERT INTO ac_data_pk10bj VALUES ('76138', '1531538867', '692725', '08,04,10,02,07,01,05,06,03,09');
INSERT INTO ac_data_pk10bj VALUES ('76176', '1531539166', '692726', '09,06,08,02,01,10,07,04,03,05');
INSERT INTO ac_data_pk10bj VALUES ('76213', '1531539466', '692727', '04,03,08,07,10,06,05,02,09,01');
INSERT INTO ac_data_pk10bj VALUES ('76250', '1531539769', '692728', '05,08,02,03,04,09,01,06,07,10');
INSERT INTO ac_data_pk10bj VALUES ('76284', '1531540065', '692729', '05,07,08,03,02,04,09,01,10,06');
INSERT INTO ac_data_pk10bj VALUES ('76319', '1531540365', '692730', '07,04,08,10,09,05,02,03,01,06');
INSERT INTO ac_data_pk10bj VALUES ('76350', '1531540666', '692731', '05,07,01,02,10,03,06,08,09,04');
INSERT INTO ac_data_pk10bj VALUES ('76384', '1531540961', '692732', '03,05,06,02,01,09,10,04,07,08');
INSERT INTO ac_data_pk10bj VALUES ('76418', '1531541266', '692733', '08,03,09,01,02,07,10,04,05,06');
INSERT INTO ac_data_pk10bj VALUES ('76452', '1531541566', '692734', '10,04,07,06,08,02,01,03,09,05');
INSERT INTO ac_data_pk10bj VALUES ('76490', '1531541882', '692735', '06,07,08,03,04,02,10,09,05,01');
INSERT INTO ac_data_pk10bj VALUES ('76523', '1531542166', '692736', '02,04,01,09,03,10,05,07,06,08');
INSERT INTO ac_data_pk10bj VALUES ('76560', '1531542462', '692737', '07,09,02,04,06,08,10,01,03,05');
INSERT INTO ac_data_pk10bj VALUES ('76596', '1531542762', '692738', '09,10,01,02,03,07,05,08,06,04');
INSERT INTO ac_data_pk10bj VALUES ('76634', '1531543077', '692739', '10,08,02,04,05,03,06,01,09,07');
INSERT INTO ac_data_pk10bj VALUES ('76668', '1531543370', '692740', '07,02,10,04,01,09,08,03,06,05');
INSERT INTO ac_data_pk10bj VALUES ('76704', '1531543671', '692741', '08,07,01,06,04,02,03,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('76738', '1531543965', '692742', '02,06,04,07,09,03,10,01,08,05');
INSERT INTO ac_data_pk10bj VALUES ('76770', '1531544267', '692743', '09,04,03,06,05,07,02,01,10,08');
INSERT INTO ac_data_pk10bj VALUES ('76805', '1531544573', '692744', '09,01,08,03,06,07,10,05,02,04');
INSERT INTO ac_data_pk10bj VALUES ('76841', '1531544867', '692745', '05,02,07,03,04,08,09,06,10,01');
INSERT INTO ac_data_pk10bj VALUES ('76876', '1531545166', '692746', '04,06,08,01,02,10,03,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('76911', '1531545466', '692747', '05,03,04,10,02,07,09,01,08,06');
INSERT INTO ac_data_pk10bj VALUES ('76948', '1531545765', '692748', '06,02,01,03,10,04,05,07,09,08');
INSERT INTO ac_data_pk10bj VALUES ('76983', '1531546066', '692749', '09,07,02,08,05,03,01,06,10,04');
INSERT INTO ac_data_pk10bj VALUES ('77020', '1531546371', '692750', '10,03,06,07,04,05,08,02,01,09');
INSERT INTO ac_data_pk10bj VALUES ('77054', '1531546667', '692751', '08,09,10,03,06,04,05,07,01,02');
INSERT INTO ac_data_pk10bj VALUES ('77090', '1531546963', '692752', '02,04,10,08,05,06,07,03,01,09');
INSERT INTO ac_data_pk10bj VALUES ('77127', '1531547264', '692753', '06,05,04,07,02,10,03,01,09,08');
INSERT INTO ac_data_pk10bj VALUES ('77165', '1531547573', '692754', '09,08,06,05,03,07,02,04,01,10');
INSERT INTO ac_data_pk10bj VALUES ('77199', '1531547873', '692755', '09,08,07,02,10,05,01,06,03,04');
INSERT INTO ac_data_pk10bj VALUES ('77233', '1531548167', '692756', '03,01,04,05,09,10,07,02,08,06');
INSERT INTO ac_data_pk10bj VALUES ('77270', '1531548471', '692757', '08,01,02,07,09,04,06,10,03,05');
INSERT INTO ac_data_pk10bj VALUES ('77305', '1531548779', '692758', '10,01,03,05,08,02,07,04,06,09');
INSERT INTO ac_data_pk10bj VALUES ('77341', '1531549073', '692759', '05,09,01,10,03,06,04,02,08,07');
INSERT INTO ac_data_pk10bj VALUES ('77377', '1531549362', '692760', '02,09,05,07,01,10,03,08,04,06');
INSERT INTO ac_data_pk10bj VALUES ('77413', '1531549679', '692761', '01,05,07,08,03,09,02,10,06,04');
INSERT INTO ac_data_pk10bj VALUES ('77445', '1531549961', '692762', '04,02,07,10,05,08,01,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('77483', '1531550266', '692763', '08,06,05,09,04,07,03,02,01,10');
INSERT INTO ac_data_pk10bj VALUES ('77517', '1531550564', '692764', '09,05,10,07,04,02,08,01,03,06');
INSERT INTO ac_data_pk10bj VALUES ('77554', '1531550877', '692765', '08,10,01,02,04,05,06,09,03,07');
INSERT INTO ac_data_pk10bj VALUES ('77585', '1531551160', '692766', '06,04,02,05,07,09,08,10,03,01');
INSERT INTO ac_data_pk10bj VALUES ('77620', '1531551471', '692767', '07,02,06,09,10,03,01,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('77653', '1531551767', '692768', '04,08,05,03,07,09,01,02,10,06');
INSERT INTO ac_data_pk10bj VALUES ('77688', '1531552077', '692769', '09,08,01,10,04,07,05,02,03,06');
INSERT INTO ac_data_pk10bj VALUES ('77721', '1531552365', '692770', '04,09,05,03,10,06,01,07,08,02');
INSERT INTO ac_data_pk10bj VALUES ('77758', '1531552674', '692771', '06,05,09,01,10,07,03,08,02,04');
INSERT INTO ac_data_pk10bj VALUES ('77793', '1531552973', '692772', '05,03,08,06,09,01,10,04,07,02');
INSERT INTO ac_data_pk10bj VALUES ('77828', '1531553280', '692773', '03,06,04,01,08,05,02,10,07,09');
INSERT INTO ac_data_pk10bj VALUES ('77859', '1531553565', '692774', '07,03,05,10,08,04,06,09,01,02');
INSERT INTO ac_data_pk10bj VALUES ('77893', '1531553873', '692775', '08,03,09,05,10,01,07,02,06,04');
INSERT INTO ac_data_pk10bj VALUES ('77926', '1531554177', '692776', '01,02,05,07,06,03,09,08,10,04');
INSERT INTO ac_data_pk10bj VALUES ('77961', '1531554472', '692777', '02,04,01,07,06,09,05,03,08,10');
INSERT INTO ac_data_pk10bj VALUES ('77994', '1531554762', '692778', '01,02,06,04,07,03,10,05,08,09');
INSERT INTO ac_data_pk10bj VALUES ('78029', '1531555063', '692779', '09,04,06,03,10,02,01,07,05,08');
INSERT INTO ac_data_pk10bj VALUES ('78065', '1531555372', '692780', '02,04,05,01,06,09,07,03,08,10');
INSERT INTO ac_data_pk10bj VALUES ('78098', '1531555671', '692781', '02,03,07,09,06,05,10,01,04,08');
INSERT INTO ac_data_pk10bj VALUES ('78131', '1531555975', '692782', '06,02,05,04,01,03,10,08,07,09');
INSERT INTO ac_data_pk10bj VALUES ('78166', '1531556269', '692783', '04,10,07,02,06,09,08,01,03,05');
INSERT INTO ac_data_pk10bj VALUES ('78200', '1531556566', '692784', '06,09,07,04,10,01,08,02,05,03');
INSERT INTO ac_data_pk10bj VALUES ('78236', '1531556876', '692785', '03,08,05,02,10,09,07,01,06,04');
INSERT INTO ac_data_pk10bj VALUES ('78267', '1531557169', '692786', '10,07,09,05,08,04,02,03,06,01');
INSERT INTO ac_data_pk10bj VALUES ('78303', '1531557475', '692787', '02,07,01,10,06,03,05,08,09,04');
INSERT INTO ac_data_pk10bj VALUES ('78338', '1531557763', '692788', '07,08,02,10,01,05,06,09,04,03');
INSERT INTO ac_data_pk10bj VALUES ('78375', '1531558062', '692789', '10,01,03,07,08,02,04,06,05,09');
INSERT INTO ac_data_pk10bj VALUES ('78409', '1531558367', '692790', '09,05,04,03,10,01,06,07,08,02');
INSERT INTO ac_data_pk10bj VALUES ('78444', '1531558670', '692791', '05,08,03,02,04,10,07,06,09,01');
INSERT INTO ac_data_pk10bj VALUES ('78479', '1531558965', '692792', '05,09,08,01,07,03,04,02,06,10');
INSERT INTO ac_data_pk10bj VALUES ('78515', '1531559269', '692793', '02,01,03,10,04,07,09,05,08,06');
INSERT INTO ac_data_pk10bj VALUES ('78549', '1531559566', '692794', '04,08,10,03,01,09,06,02,07,05');
INSERT INTO ac_data_pk10bj VALUES ('78585', '1531559872', '692795', '05,09,10,02,01,04,03,08,07,06');
INSERT INTO ac_data_pk10bj VALUES ('78618', '1531560169', '692796', '02,04,06,07,08,03,10,05,09,01');
INSERT INTO ac_data_pk10bj VALUES ('78655', '1531560473', '692797', '10,04,08,06,03,02,09,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('78690', '1531560767', '692798', '02,06,01,07,09,03,05,04,10,08');
INSERT INTO ac_data_pk10bj VALUES ('78725', '1531561079', '692799', '05,08,07,01,02,06,10,03,04,09');
INSERT INTO ac_data_pk10bj VALUES ('78758', '1531561373', '692800', '08,10,01,02,04,03,05,07,09,06');
INSERT INTO ac_data_pk10bj VALUES ('78789', '1531561664', '692801', '07,02,10,03,01,09,06,04,05,08');
INSERT INTO ac_data_pk10bj VALUES ('78826', '1531561973', '692802', '01,10,05,08,03,07,09,06,04,02');
INSERT INTO ac_data_pk10bj VALUES ('78861', '1531562269', '692803', '01,05,09,08,03,02,10,07,04,06');
INSERT INTO ac_data_pk10bj VALUES ('78897', '1531562576', '692804', '07,08,10,09,03,02,05,06,04,01');
INSERT INTO ac_data_pk10bj VALUES ('78933', '1531562864', '692805', '10,06,07,01,04,02,09,03,08,05');
INSERT INTO ac_data_pk10bj VALUES ('78969', '1531563175', '692806', '05,03,07,06,08,02,01,10,04,09');
INSERT INTO ac_data_pk10bj VALUES ('79005', '1531563465', '692807', '08,06,02,05,09,07,01,04,10,03');
INSERT INTO ac_data_pk10bj VALUES ('79040', '1531563772', '692808', '03,05,01,04,09,08,10,06,02,07');
INSERT INTO ac_data_pk10bj VALUES ('79073', '1531564075', '692809', '08,05,02,06,07,04,10,03,09,01');
INSERT INTO ac_data_pk10bj VALUES ('79108', '1531564365', '692810', '07,08,03,06,02,05,01,09,04,10');
INSERT INTO ac_data_pk10bj VALUES ('79141', '1531564663', '692811', '10,05,01,03,04,08,02,09,06,07');
INSERT INTO ac_data_pk10bj VALUES ('79174', '1531564963', '692812', '06,08,05,04,02,09,03,07,01,10');
INSERT INTO ac_data_pk10bj VALUES ('79209', '1531565270', '692813', '07,08,04,02,09,01,05,06,03,10');
INSERT INTO ac_data_pk10bj VALUES ('79244', '1531565575', '692814', '08,10,03,09,06,07,05,04,02,01');
INSERT INTO ac_data_pk10bj VALUES ('79279', '1531565875', '692815', '07,08,05,10,09,06,04,01,02,03');
INSERT INTO ac_data_pk10bj VALUES ('79312', '1531566174', '692816', '03,01,05,04,10,07,02,06,08,09');
INSERT INTO ac_data_pk10bj VALUES ('79343', '1531566470', '692817', '03,07,08,06,04,05,01,09,10,02');
INSERT INTO ac_data_pk10bj VALUES ('79379', '1531566780', '692818', '08,09,05,04,10,02,07,01,03,06');
INSERT INTO ac_data_pk10bj VALUES ('79415', '1531567081', '692819', '07,02,04,09,06,03,01,10,05,08');
INSERT INTO ac_data_pk10bj VALUES ('79450', '1531567372', '692820', '08,07,02,09,03,10,04,01,05,06');
INSERT INTO ac_data_pk10bj VALUES ('79485', '1531567661', '692821', '04,02,07,09,06,01,03,10,08,05');
INSERT INTO ac_data_pk10bj VALUES ('79521', '1531567970', '692822', '07,03,01,02,09,10,08,06,04,05');
INSERT INTO ac_data_pk10bj VALUES ('79557', '1531568271', '692823', '03,05,09,02,04,08,10,06,01,07');
INSERT INTO ac_data_pk10bj VALUES ('79586', '1531568564', '692824', '05,06,04,02,01,10,08,07,09,03');
INSERT INTO ac_data_pk10bj VALUES ('79624', '1531568868', '692825', '09,04,05,02,07,08,06,03,01,10');
INSERT INTO ac_data_pk10bj VALUES ('79655', '1531569172', '692826', '06,09,03,07,10,02,08,01,05,04');
INSERT INTO ac_data_pk10bj VALUES ('79691', '1531569469', '692827', '07,05,09,06,02,10,08,04,03,01');
INSERT INTO ac_data_pk10bj VALUES ('79727', '1531569779', '692828', '08,02,09,05,03,04,01,07,10,06');
INSERT INTO ac_data_pk10bj VALUES ('79760', '1531570065', '692829', '01,06,09,08,07,05,04,10,03,02');
INSERT INTO ac_data_pk10bj VALUES ('79797', '1531570363', '692830', '03,06,08,10,02,09,04,01,05,07');
INSERT INTO ac_data_pk10bj VALUES ('79833', '1531570664', '692831', '04,01,05,06,03,02,08,10,09,07');
INSERT INTO ac_data_pk10bj VALUES ('79868', '1531570985', '692832', '08,01,07,05,04,06,09,10,03,02');
INSERT INTO ac_data_pk10bj VALUES ('79900', '1531571270', '692833', '06,10,05,01,08,07,02,03,04,09');
INSERT INTO ac_data_pk10bj VALUES ('79936', '1531571578', '692834', '10,04,02,09,07,05,01,03,06,08');
INSERT INTO ac_data_pk10bj VALUES ('79970', '1531571869', '692835', '08,04,02,10,01,03,05,07,09,06');
INSERT INTO ac_data_pk10bj VALUES ('80000', '1531572171', '692836', '04,06,10,02,05,03,08,09,01,07');
INSERT INTO ac_data_pk10bj VALUES ('80032', '1531572466', '692837', '05,10,08,04,06,02,01,09,03,07');
INSERT INTO ac_data_pk10bj VALUES ('80067', '1531572769', '692838', '01,08,03,05,02,06,10,04,07,09');
INSERT INTO ac_data_pk10bj VALUES ('80103', '1531573076', '692839', '06,10,04,05,08,09,07,01,03,02');
INSERT INTO ac_data_pk10bj VALUES ('80133', '1531573367', '692840', '06,05,04,02,09,10,03,01,07,08');
INSERT INTO ac_data_pk10bj VALUES ('80170', '1531573666', '692841', '07,06,01,09,04,02,05,10,03,08');
INSERT INTO ac_data_pk10bj VALUES ('80203', '1531573965', '692842', '05,08,06,07,09,04,03,01,02,10');
INSERT INTO ac_data_pk10bj VALUES ('80240', '1531574270', '692843', '05,03,07,02,01,08,10,06,04,09');
INSERT INTO ac_data_pk10bj VALUES ('80273', '1531574571', '692844', '03,04,08,01,06,07,02,05,09,10');
INSERT INTO ac_data_pk10bj VALUES ('80307', '1531574872', '692845', '09,03,08,04,10,01,05,06,07,02');
INSERT INTO ac_data_pk10bj VALUES ('80341', '1531575167', '692846', '09,05,01,03,06,02,07,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('80378', '1531575470', '692847', '01,02,08,03,04,06,09,07,05,10');
INSERT INTO ac_data_pk10bj VALUES ('80414', '1531575766', '692848', '08,03,04,02,01,10,07,06,09,05');
INSERT INTO ac_data_pk10bj VALUES ('80446', '1531576066', '692849', '05,04,03,06,02,07,09,01,08,10');
INSERT INTO ac_data_pk10bj VALUES ('80482', '1531576372', '692850', '07,03,06,02,04,01,08,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('80514', '1531576664', '692851', '02,06,07,08,10,09,04,01,05,03');
INSERT INTO ac_data_pk10bj VALUES ('80552', '1531576972', '692852', '05,09,07,04,06,10,08,02,01,03');
INSERT INTO ac_data_pk10bj VALUES ('80588', '1531577273', '692853', '05,10,07,01,02,08,03,09,04,06');
INSERT INTO ac_data_pk10bj VALUES ('80624', '1531577576', '692854', '03,07,04,06,05,01,02,10,08,09');
INSERT INTO ac_data_pk10bj VALUES ('80658', '1531577864', '692855', '04,07,06,09,01,10,05,02,08,03');
INSERT INTO ac_data_pk10bj VALUES ('80695', '1531578175', '692856', '09,02,04,10,05,01,06,03,08,07');
INSERT INTO ac_data_pk10bj VALUES ('80731', '1531578480', '692857', '07,08,09,03,01,05,04,06,02,10');
INSERT INTO ac_data_pk10bj VALUES ('80766', '1531578774', '692858', '03,02,05,10,06,08,04,09,07,01');
INSERT INTO ac_data_pk10bj VALUES ('80801', '1531579072', '692859', '01,07,02,04,09,08,06,03,10,05');
INSERT INTO ac_data_pk10bj VALUES ('80835', '1531579377', '692860', '02,10,04,08,01,03,06,05,07,09');
INSERT INTO ac_data_pk10bj VALUES ('80871', '1531579667', '692861', '04,05,07,02,01,10,03,09,06,08');
INSERT INTO ac_data_pk10bj VALUES ('80908', '1531579975', '692862', '08,07,02,03,01,05,10,04,09,06');
INSERT INTO ac_data_pk10bj VALUES ('80938', '1531580264', '692863', '10,03,08,04,01,02,06,05,09,07');
INSERT INTO ac_data_pk10bj VALUES ('80969', '1531580567', '692864', '05,06,10,02,09,08,04,01,07,03');
INSERT INTO ac_data_pk10bj VALUES ('81004', '1531580867', '692865', '05,04,10,01,03,06,09,02,07,08');
INSERT INTO ac_data_pk10bj VALUES ('81040', '1531581168', '692866', '08,04,07,02,06,01,03,10,05,09');
INSERT INTO ac_data_pk10bj VALUES ('81066', '1531581461', '692867', '03,02,09,06,04,08,05,01,07,10');
INSERT INTO ac_data_pk10bj VALUES ('81105', '1531581777', '692868', '05,06,03,07,09,10,02,08,01,04');
INSERT INTO ac_data_pk10bj VALUES ('81140', '1531582070', '692869', '03,09,02,07,08,04,01,10,06,05');
INSERT INTO ac_data_pk10bj VALUES ('81174', '1531582367', '692870', '06,04,05,09,02,10,07,03,08,01');
INSERT INTO ac_data_pk10bj VALUES ('81209', '1531582667', '692871', '08,09,03,06,02,05,01,10,04,07');
INSERT INTO ac_data_pk10bj VALUES ('81244', '1531582964', '692872', '10,03,05,02,07,06,04,08,09,01');
INSERT INTO ac_data_pk10bj VALUES ('81282', '1531583270', '692873', '01,07,05,06,04,09,02,03,08,10');
INSERT INTO ac_data_pk10bj VALUES ('81316', '1531583565', '692874', '08,10,05,09,03,07,02,06,04,01');
INSERT INTO ac_data_pk10bj VALUES ('81352', '1531583875', '692875', '03,07,01,06,09,10,02,04,08,05');
INSERT INTO ac_data_pk10bj VALUES ('81434', '1531616861', '692876', '06,02,01,07,04,08,03,09,10,05');
INSERT INTO ac_data_pk10bj VALUES ('81468', '1531617163', '692877', '06,09,07,05,02,01,03,10,08,04');
INSERT INTO ac_data_pk10bj VALUES ('81504', '1531617469', '692878', '06,04,02,10,03,09,05,07,08,01');
INSERT INTO ac_data_pk10bj VALUES ('81541', '1531617766', '692879', '08,03,05,07,06,02,10,01,04,09');
INSERT INTO ac_data_pk10bj VALUES ('81577', '1531618067', '692880', '03,08,09,10,04,07,06,02,01,05');
INSERT INTO ac_data_pk10bj VALUES ('81606', '1531618375', '692881', '09,04,03,10,05,08,02,07,01,06');
INSERT INTO ac_data_pk10bj VALUES ('81639', '1531618672', '692882', '04,01,05,03,10,09,06,02,08,07');
INSERT INTO ac_data_pk10bj VALUES ('81672', '1531618976', '692883', '10,08,07,05,01,04,02,09,03,06');
INSERT INTO ac_data_pk10bj VALUES ('81703', '1531619269', '692884', '03,01,06,05,04,02,07,08,09,10');
INSERT INTO ac_data_pk10bj VALUES ('81736', '1531619567', '692885', '01,04,06,08,10,02,03,09,05,07');
INSERT INTO ac_data_pk10bj VALUES ('81770', '1531619865', '692886', '07,01,02,10,06,04,05,09,08,03');
INSERT INTO ac_data_pk10bj VALUES ('81803', '1531620169', '692887', '07,04,09,02,03,06,08,05,10,01');
INSERT INTO ac_data_pk10bj VALUES ('81838', '1531620470', '692888', '06,10,08,09,07,04,02,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('81876', '1531620770', '692889', '05,07,02,10,06,03,08,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('81911', '1531621061', '692890', '06,09,03,10,05,02,08,04,07,01');
INSERT INTO ac_data_pk10bj VALUES ('81947', '1531621376', '692891', '04,07,01,05,10,02,03,09,06,08');
INSERT INTO ac_data_pk10bj VALUES ('81980', '1531621677', '692892', '07,08,03,06,10,02,05,04,09,01');
INSERT INTO ac_data_pk10bj VALUES ('82013', '1531621969', '692893', '09,02,03,04,07,06,01,10,05,08');
INSERT INTO ac_data_pk10bj VALUES ('82048', '1531622273', '692894', '01,02,07,03,09,10,06,04,08,05');
INSERT INTO ac_data_pk10bj VALUES ('82084', '1531622569', '692895', '06,04,07,02,08,09,10,01,03,05');
INSERT INTO ac_data_pk10bj VALUES ('82120', '1531622863', '692896', '08,05,10,02,09,03,07,01,04,06');
INSERT INTO ac_data_pk10bj VALUES ('82158', '1531623171', '692897', '07,09,03,10,05,06,02,08,01,04');
INSERT INTO ac_data_pk10bj VALUES ('82193', '1531623465', '692898', '04,02,03,07,06,01,05,09,08,10');
INSERT INTO ac_data_pk10bj VALUES ('82229', '1531623769', '692899', '03,07,01,04,05,10,08,06,02,09');
INSERT INTO ac_data_pk10bj VALUES ('82265', '1531624073', '692900', '10,03,05,06,09,07,02,04,08,01');
INSERT INTO ac_data_pk10bj VALUES ('82298', '1531624374', '692901', '08,10,04,07,03,01,05,02,06,09');
INSERT INTO ac_data_pk10bj VALUES ('82334', '1531624663', '692902', '02,10,07,04,01,06,08,03,05,09');
INSERT INTO ac_data_pk10bj VALUES ('82370', '1531624965', '692903', '01,08,02,09,04,10,07,03,05,06');
INSERT INTO ac_data_pk10bj VALUES ('82403', '1531625268', '692904', '05,02,07,01,08,03,04,06,10,09');
INSERT INTO ac_data_pk10bj VALUES ('82437', '1531625567', '692905', '06,01,07,05,08,09,10,03,04,02');
INSERT INTO ac_data_pk10bj VALUES ('82471', '1531625870', '692906', '03,02,10,08,04,07,01,05,09,06');
INSERT INTO ac_data_pk10bj VALUES ('82504', '1531826770', '693359', '07,02,06,05,09,04,01,08,10,03');
INSERT INTO ac_data_pk10bj VALUES ('82515', '1531884797', '693443', '10,06,07,01,04,08,03,05,02,09');
INSERT INTO ac_data_pk10bj VALUES ('82527', '1531884978', '693444', '09,08,02,05,10,03,07,06,01,04');
INSERT INTO ac_data_pk10bj VALUES ('82547', '1531885281', '693445', '07,08,10,06,04,02,01,09,03,05');
INSERT INTO ac_data_pk10bj VALUES ('82566', '1531885569', '693446', '06,07,04,01,08,09,02,05,03,10');
INSERT INTO ac_data_pk10bj VALUES ('82586', '1531885871', '693447', '08,07,06,05,10,02,09,03,01,04');
INSERT INTO ac_data_pk10bj VALUES ('82606', '1531886175', '693448', '01,02,10,07,04,08,09,06,05,03');
INSERT INTO ac_data_pk10bj VALUES ('82626', '1531886479', '693449', '08,06,04,10,03,02,07,09,01,05');
INSERT INTO ac_data_pk10bj VALUES ('82646', '1531886782', '693450', '10,03,06,09,02,05,04,08,01,07');
INSERT INTO ac_data_pk10bj VALUES ('82666', '1531887085', '693451', '08,09,06,01,07,04,02,03,05,10');
INSERT INTO ac_data_pk10bj VALUES ('82685', '1531887373', '693452', '06,04,05,07,09,01,08,10,03,02');
INSERT INTO ac_data_pk10bj VALUES ('82705', '1531887677', '693453', '07,04,09,05,02,03,06,08,10,01');
INSERT INTO ac_data_pk10bj VALUES ('82724', '1531887966', '693454', '01,09,06,04,07,10,03,05,02,08');
INSERT INTO ac_data_pk10bj VALUES ('82744', '1531888270', '693455', '01,05,06,08,10,04,09,07,03,02');
INSERT INTO ac_data_pk10bj VALUES ('82764', '1531888573', '693456', '02,06,08,09,05,01,10,07,04,03');
INSERT INTO ac_data_pk10bj VALUES ('82784', '1531888879', '693457', '07,06,09,01,02,03,10,08,04,05');
INSERT INTO ac_data_pk10bj VALUES ('82804', '1531889178', '693458', '02,03,05,10,04,01,06,09,08,07');
INSERT INTO ac_data_pk10bj VALUES ('82824', '1531889481', '693459', '04,05,08,01,10,06,07,02,03,09');
INSERT INTO ac_data_pk10bj VALUES ('82843', '1531889769', '693460', '02,03,05,07,04,10,09,01,06,08');
INSERT INTO ac_data_pk10bj VALUES ('82863', '1531890071', '693461', '04,02,03,05,10,08,06,07,09,01');
INSERT INTO ac_data_pk10bj VALUES ('82883', '1531890378', '693462', '08,06,01,09,04,02,03,07,10,05');
INSERT INTO ac_data_pk10bj VALUES ('82903', '1531890679', '693463', '03,10,04,01,09,08,06,07,02,05');
INSERT INTO ac_data_pk10bj VALUES ('82922', '1531890967', '693464', '05,04,07,09,01,08,03,06,10,02');
INSERT INTO ac_data_pk10bj VALUES ('82942', '1531891270', '693465', '08,09,06,01,05,10,04,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('82962', '1531891575', '693466', '01,04,02,08,09,06,10,05,07,03');
INSERT INTO ac_data_pk10bj VALUES ('82982', '1531891878', '693467', '05,01,10,09,02,03,06,04,07,08');
INSERT INTO ac_data_pk10bj VALUES ('83002', '1531892182', '693468', '06,04,10,02,03,09,08,01,07,05');
INSERT INTO ac_data_pk10bj VALUES ('83021', '1531892470', '693469', '04,07,06,02,08,05,01,09,10,03');
INSERT INTO ac_data_pk10bj VALUES ('83041', '1531892773', '693470', '10,08,09,04,06,07,01,05,02,03');
INSERT INTO ac_data_pk10bj VALUES ('83061', '1531893075', '693471', '09,06,01,10,03,04,02,05,07,08');
INSERT INTO ac_data_pk10bj VALUES ('83081', '1531893378', '693472', '04,10,03,02,09,06,08,07,01,05');
INSERT INTO ac_data_pk10bj VALUES ('83100', '1531893667', '693473', '03,02,10,01,09,05,07,06,08,04');
INSERT INTO ac_data_pk10bj VALUES ('83120', '1531893969', '693474', '02,03,10,08,07,05,06,09,01,04');
INSERT INTO ac_data_pk10bj VALUES ('83140', '1531894272', '693475', '08,06,07,03,05,09,02,10,04,01');
INSERT INTO ac_data_pk10bj VALUES ('83146', '1531894575', '693476', '02,05,09,04,08,10,07,03,06,01');
INSERT INTO ac_data_pk10bj VALUES ('83166', '1531894878', '693477', '08,02,06,09,04,05,01,07,03,10');
INSERT INTO ac_data_pk10bj VALUES ('83187', '1531895183', '693478', '04,10,02,05,06,07,09,01,08,03');
INSERT INTO ac_data_pk10bj VALUES ('83206', '1531895473', '693479', '06,04,08,05,02,09,10,03,01,07');
INSERT INTO ac_data_pk10bj VALUES ('83226', '1531895775', '693480', '04,07,10,03,08,05,09,02,06,01');
INSERT INTO ac_data_pk10bj VALUES ('83246', '1531896078', '693481', '05,09,04,10,08,07,06,03,01,02');
INSERT INTO ac_data_pk10bj VALUES ('83266', '1531896382', '693482', '10,02,06,01,07,09,05,08,04,03');
INSERT INTO ac_data_pk10bj VALUES ('83285', '1531896671', '693483', '02,09,05,04,07,01,10,08,06,03');
INSERT INTO ac_data_pk10bj VALUES ('83305', '1531896974', '693484', '04,06,08,09,10,05,01,02,03,07');
INSERT INTO ac_data_pk10bj VALUES ('83325', '1531897287', '693485', '06,02,10,05,04,07,01,08,09,03');
INSERT INTO ac_data_pk10bj VALUES ('83344', '1531897574', '693486', '06,08,07,02,01,04,05,03,10,09');
INSERT INTO ac_data_pk10bj VALUES ('83364', '1531897868', '693487', '10,03,06,04,01,05,08,09,02,07');
INSERT INTO ac_data_pk10bj VALUES ('83384', '1531898170', '693488', '06,07,03,05,08,09,02,04,01,10');
INSERT INTO ac_data_pk10bj VALUES ('83404', '1531898473', '693489', '06,09,07,04,01,08,10,02,05,03');
INSERT INTO ac_data_pk10bj VALUES ('83424', '1531898776', '693490', '01,02,07,09,03,10,04,06,05,08');
INSERT INTO ac_data_pk10bj VALUES ('83444', '1531899079', '693491', '10,08,02,09,04,01,06,07,05,03');
INSERT INTO ac_data_pk10bj VALUES ('83464', '1531899369', '693492', '04,08,05,10,03,06,07,09,01,02');
INSERT INTO ac_data_pk10bj VALUES ('83484', '1531899671', '693493', '06,10,02,03,04,01,09,08,05,07');
INSERT INTO ac_data_pk10bj VALUES ('83504', '1531899974', '693494', '01,10,08,02,06,09,07,03,05,04');
INSERT INTO ac_data_pk10bj VALUES ('83523', '1531900265', '693495', '04,09,02,08,06,07,10,03,01,05');
INSERT INTO ac_data_pk10bj VALUES ('83543', '1531900572', '693496', '03,09,10,05,07,01,04,02,06,08');
INSERT INTO ac_data_pk10bj VALUES ('83563', '1531900871', '693497', '07,08,03,10,01,05,09,02,04,06');
INSERT INTO ac_data_pk10bj VALUES ('83583', '1531901173', '693498', '09,03,06,04,07,05,08,10,01,02');
INSERT INTO ac_data_pk10bj VALUES ('83603', '1531901477', '693499', '04,08,10,02,01,06,03,09,05,07');
INSERT INTO ac_data_pk10bj VALUES ('83623', '1531901780', '693500', '09,10,04,01,06,03,02,05,08,07');
INSERT INTO ac_data_pk10bj VALUES ('83642', '1531902068', '693501', '06,09,02,05,08,10,01,07,04,03');
INSERT INTO ac_data_pk10bj VALUES ('83662', '1531902376', '693502', '02,05,04,03,10,07,06,09,08,01');
INSERT INTO ac_data_pk10bj VALUES ('83681', '1531902664', '693503', '03,07,05,08,09,01,02,10,06,04');
INSERT INTO ac_data_pk10bj VALUES ('83702', '1531902982', '693504', '08,01,07,05,09,02,04,10,03,06');
INSERT INTO ac_data_pk10bj VALUES ('83721', '1531903272', '693505', '01,09,05,03,10,02,04,08,07,06');
INSERT INTO ac_data_pk10bj VALUES ('83741', '1531903569', '693506', '01,04,08,03,06,02,09,05,07,10');
INSERT INTO ac_data_pk10bj VALUES ('83761', '1531903872', '693507', '10,01,08,02,03,07,06,04,09,05');
INSERT INTO ac_data_pk10bj VALUES ('83781', '1531904182', '693508', '09,05,10,07,01,02,04,08,03,06');
INSERT INTO ac_data_pk10bj VALUES ('83800', '1531904470', '693509', '01,05,07,02,08,03,10,06,04,09');
INSERT INTO ac_data_pk10bj VALUES ('83820', '1531904773', '693510', '06,07,04,09,03,02,08,10,05,01');
INSERT INTO ac_data_pk10bj VALUES ('83840', '1531905071', '693511', '08,01,06,04,03,02,05,09,10,07');
INSERT INTO ac_data_pk10bj VALUES ('83860', '1531905379', '693512', '04,07,09,01,10,08,06,03,05,02');
INSERT INTO ac_data_pk10bj VALUES ('83878', '1531905676', '693513', '06,03,10,05,09,01,02,07,04,08');

-- ----------------------------
-- Table structure for `ac_data_pl3`
-- ----------------------------
DROP TABLE IF EXISTS `ac_data_pl3`;
CREATE TABLE `ac_data_pl3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32662 DEFAULT CHARSET=utf8 COMMENT='开奖数据';

-- ----------------------------
-- Records of ac_data_pl3
-- ----------------------------
INSERT INTO ac_data_pl3 VALUES ('1', '1527078600', '2018136', '0,6,4');
INSERT INTO ac_data_pl3 VALUES ('490', '1527165000', '2018137', '1,7,7');
INSERT INTO ac_data_pl3 VALUES ('1820', '1527251400', '2018138', '1,5,3');
INSERT INTO ac_data_pl3 VALUES ('2700', '1527337800', '2018139', '8,2,8');
INSERT INTO ac_data_pl3 VALUES ('3960', '1527424200', '2018140', '6,8,0');
INSERT INTO ac_data_pl3 VALUES ('5302', '1527510600', '2018141', '2,7,9');
INSERT INTO ac_data_pl3 VALUES ('6132', '1527856200', '2018145', '5,2,3');
INSERT INTO ac_data_pl3 VALUES ('7259', '1527942600', '2018146', '6,2,3');
INSERT INTO ac_data_pl3 VALUES ('8369', '1528029000', '2018147', '0,3,8');
INSERT INTO ac_data_pl3 VALUES ('8370', '1529757000', '2018167', '1,3,2');
INSERT INTO ac_data_pl3 VALUES ('8844', '1529843400', '2018168', '2,7,5');
INSERT INTO ac_data_pl3 VALUES ('10043', '1529929800', '2018169', '7,1,6');
INSERT INTO ac_data_pl3 VALUES ('11340', '1530016200', '2018170', '1,2,7');
INSERT INTO ac_data_pl3 VALUES ('12155', '1530275400', '2018173', '2,4,2');
INSERT INTO ac_data_pl3 VALUES ('12286', '1530361800', '2018174', '0,1,9');
INSERT INTO ac_data_pl3 VALUES ('12287', '1530534600', '2018176', '2,0,7');
INSERT INTO ac_data_pl3 VALUES ('12298', '1530707400', '2018178', '5,2,8');
INSERT INTO ac_data_pl3 VALUES ('12756', '1530793800', '2018179', '7,1,3');
INSERT INTO ac_data_pl3 VALUES ('13986', '1530880200', '2018180', '4,3,3');
INSERT INTO ac_data_pl3 VALUES ('15596', '1530966600', '2018181', '5,7,3');
INSERT INTO ac_data_pl3 VALUES ('17636', '1531053000', '2018182', '4,0,0');
INSERT INTO ac_data_pl3 VALUES ('20114', '1531139400', '2018183', '8,4,4');
INSERT INTO ac_data_pl3 VALUES ('22590', '1531225800', '2018184', '2,6,1');
INSERT INTO ac_data_pl3 VALUES ('25090', '1531312200', '2018185', '6,9,6');
INSERT INTO ac_data_pl3 VALUES ('26083', '1531398600', '2018186', '3,5,0');
INSERT INTO ac_data_pl3 VALUES ('28611', '1531485000', '2018187', '5,0,7');
INSERT INTO ac_data_pl3 VALUES ('31112', '1531571400', '2018188', '0,6,8');
INSERT INTO ac_data_pl3 VALUES ('32650', '1531744200', '2018190', '0,3,1');
INSERT INTO ac_data_pl3 VALUES ('32661', '1531830600', '2018191', '3,4,0');

-- ----------------------------
-- Table structure for `ac_data_ssccq`
-- ----------------------------
DROP TABLE IF EXISTS `ac_data_ssccq`;
CREATE TABLE `ac_data_ssccq` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18423 DEFAULT CHARSET=utf8 COMMENT='开奖数据';

-- ----------------------------
-- Records of ac_data_ssccq
-- ----------------------------
INSERT INTO ac_data_ssccq VALUES ('1', '1527133294', '20180524034', '7,5,0,3,4');
INSERT INTO ac_data_ssccq VALUES ('4', '1527133810', '20180524035', '7,8,2,1,2');
INSERT INTO ac_data_ssccq VALUES ('5', '1527134410', '20180524036', '8,5,1,1,6');
INSERT INTO ac_data_ssccq VALUES ('6', '1527135010', '20180524037', '0,4,0,5,6');
INSERT INTO ac_data_ssccq VALUES ('8', '1527135610', '20180524038', '2,2,2,5,1');
INSERT INTO ac_data_ssccq VALUES ('9', '1527136210', '20180524039', '6,4,7,5,3');
INSERT INTO ac_data_ssccq VALUES ('11', '1527136810', '20180524040', '7,7,5,1,5');
INSERT INTO ac_data_ssccq VALUES ('12', '1527137410', '20180524041', '1,7,7,4,0');
INSERT INTO ac_data_ssccq VALUES ('13', '1527139511', '20180524044', '2,0,1,4,7');
INSERT INTO ac_data_ssccq VALUES ('15', '1527139810', '20180524045', '2,7,9,6,5');
INSERT INTO ac_data_ssccq VALUES ('16', '1527140410', '20180524046', '1,3,7,0,9');
INSERT INTO ac_data_ssccq VALUES ('17', '1527140936', '20180524047', '3,1,2,6,7');
INSERT INTO ac_data_ssccq VALUES ('25', '1527141611', '20180524048', '1,3,8,5,4');
INSERT INTO ac_data_ssccq VALUES ('26', '1527142210', '20180524049', '3,4,0,6,1');
INSERT INTO ac_data_ssccq VALUES ('28', '1527142855', '20180524050', '2,9,0,6,6');
INSERT INTO ac_data_ssccq VALUES ('30', '1527143410', '20180524051', '4,5,8,9,4');
INSERT INTO ac_data_ssccq VALUES ('32', '1527144010', '20180524052', '8,6,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('33', '1527144611', '20180524053', '1,9,3,8,5');
INSERT INTO ac_data_ssccq VALUES ('34', '1527145210', '20180524054', '8,2,2,2,3');
INSERT INTO ac_data_ssccq VALUES ('36', '1527145811', '20180524055', '2,5,3,6,3');
INSERT INTO ac_data_ssccq VALUES ('37', '1527146410', '20180524056', '8,7,3,7,0');
INSERT INTO ac_data_ssccq VALUES ('39', '1527147010', '20180524057', '1,9,8,0,3');
INSERT INTO ac_data_ssccq VALUES ('40', '1527147610', '20180524058', '4,4,9,4,8');
INSERT INTO ac_data_ssccq VALUES ('41', '1527148138', '20180524059', '1,1,9,1,3');
INSERT INTO ac_data_ssccq VALUES ('48', '1527148810', '20180524060', '5,6,5,0,3');
INSERT INTO ac_data_ssccq VALUES ('49', '1527149410', '20180524061', '9,2,2,0,6');
INSERT INTO ac_data_ssccq VALUES ('51', '1527150010', '20180524062', '7,3,3,4,6');
INSERT INTO ac_data_ssccq VALUES ('52', '1527150610', '20180524063', '6,9,3,0,7');
INSERT INTO ac_data_ssccq VALUES ('54', '1527151210', '20180524064', '1,3,0,4,0');
INSERT INTO ac_data_ssccq VALUES ('55', '1527151810', '20180524065', '7,0,1,3,0');
INSERT INTO ac_data_ssccq VALUES ('56', '1527152411', '20180524066', '9,1,2,3,6');
INSERT INTO ac_data_ssccq VALUES ('58', '1527153010', '20180524067', '5,3,8,5,1');
INSERT INTO ac_data_ssccq VALUES ('59', '1527153610', '20180524068', '2,8,6,7,4');
INSERT INTO ac_data_ssccq VALUES ('61', '1527154210', '20180524069', '0,7,3,4,6');
INSERT INTO ac_data_ssccq VALUES ('62', '1527154810', '20180524070', '7,1,4,6,6');
INSERT INTO ac_data_ssccq VALUES ('63', '1527155340', '20180524071', '3,0,6,0,1');
INSERT INTO ac_data_ssccq VALUES ('70', '1527156011', '20180524072', '4,7,1,4,9');
INSERT INTO ac_data_ssccq VALUES ('71', '1527156610', '20180524073', '5,0,8,2,1');
INSERT INTO ac_data_ssccq VALUES ('73', '1527157210', '20180524074', '5,8,1,3,3');
INSERT INTO ac_data_ssccq VALUES ('74', '1527157810', '20180524075', '9,6,4,1,6');
INSERT INTO ac_data_ssccq VALUES ('76', '1527158410', '20180524076', '4,4,2,5,6');
INSERT INTO ac_data_ssccq VALUES ('77', '1527159010', '20180524077', '4,4,8,7,5');
INSERT INTO ac_data_ssccq VALUES ('78', '1527159611', '20180524078', '3,2,3,5,1');
INSERT INTO ac_data_ssccq VALUES ('80', '1527160211', '20180524079', '3,9,2,5,6');
INSERT INTO ac_data_ssccq VALUES ('81', '1527160810', '20180524080', '5,2,3,1,9');
INSERT INTO ac_data_ssccq VALUES ('83', '1527161410', '20180524081', '2,5,3,3,4');
INSERT INTO ac_data_ssccq VALUES ('84', '1527162010', '20180524082', '0,6,1,4,4');
INSERT INTO ac_data_ssccq VALUES ('85', '1527162542', '20180524083', '8,2,8,4,2');
INSERT INTO ac_data_ssccq VALUES ('92', '1527163210', '20180524084', '0,4,8,1,3');
INSERT INTO ac_data_ssccq VALUES ('93', '1527163810', '20180524085', '1,2,7,5,1');
INSERT INTO ac_data_ssccq VALUES ('95', '1527164410', '20180524086', '7,9,5,1,2');
INSERT INTO ac_data_ssccq VALUES ('96', '1527165010', '20180524087', '7,5,9,6,1');
INSERT INTO ac_data_ssccq VALUES ('98', '1527165610', '20180524088', '8,4,1,0,0');
INSERT INTO ac_data_ssccq VALUES ('99', '1527166210', '20180524089', '1,2,3,0,6');
INSERT INTO ac_data_ssccq VALUES ('100', '1527166810', '20180524090', '8,1,7,1,9');
INSERT INTO ac_data_ssccq VALUES ('102', '1527167410', '20180524091', '5,2,7,1,0');
INSERT INTO ac_data_ssccq VALUES ('103', '1527168010', '20180524092', '6,0,2,3,6');
INSERT INTO ac_data_ssccq VALUES ('105', '1527168610', '20180524093', '1,3,2,3,6');
INSERT INTO ac_data_ssccq VALUES ('106', '1527169210', '20180524094', '5,7,6,3,7');
INSERT INTO ac_data_ssccq VALUES ('107', '1527169744', '20180524095', '7,3,9,3,9');
INSERT INTO ac_data_ssccq VALUES ('114', '1527170410', '20180524096', '9,7,4,3,0');
INSERT INTO ac_data_ssccq VALUES ('115', '1527170715', '20180524097', '5,8,6,9,1');
INSERT INTO ac_data_ssccq VALUES ('116', '1527171010', '20180524098', '4,7,7,2,4');
INSERT INTO ac_data_ssccq VALUES ('118', '1527171310', '20180524099', '7,4,4,4,2');
INSERT INTO ac_data_ssccq VALUES ('119', '1527171610', '20180524100', '0,4,5,7,1');
INSERT INTO ac_data_ssccq VALUES ('132', '1527171807', '20180524101', '2,8,7,4,7');
INSERT INTO ac_data_ssccq VALUES ('152', '1527172109', '20180524102', '7,0,9,2,2');
INSERT INTO ac_data_ssccq VALUES ('171', '1527172398', '20180524103', '1,7,0,7,5');
INSERT INTO ac_data_ssccq VALUES ('191', '1527172701', '20180524104', '0,6,9,4,8');
INSERT INTO ac_data_ssccq VALUES ('211', '1527173004', '20180524105', '4,4,1,6,3');
INSERT INTO ac_data_ssccq VALUES ('231', '1527173306', '20180524106', '0,7,7,1,4');
INSERT INTO ac_data_ssccq VALUES ('250', '1527173596', '20180524107', '9,6,0,3,5');
INSERT INTO ac_data_ssccq VALUES ('270', '1527173899', '20180524108', '6,4,8,6,2');
INSERT INTO ac_data_ssccq VALUES ('290', '1527174202', '20180524109', '8,9,9,3,4');
INSERT INTO ac_data_ssccq VALUES ('310', '1527174510', '20180524110', '0,2,9,4,7');
INSERT INTO ac_data_ssccq VALUES ('329', '1527174805', '20180524111', '9,7,9,1,3');
INSERT INTO ac_data_ssccq VALUES ('348', '1527175097', '20180524112', '1,8,6,7,9');
INSERT INTO ac_data_ssccq VALUES ('369', '1527175415', '20180524113', '4,0,0,2,2');
INSERT INTO ac_data_ssccq VALUES ('388', '1527175703', '20180524114', '3,8,1,5,6');
INSERT INTO ac_data_ssccq VALUES ('408', '1527176006', '20180524115', '7,2,6,6,7');
INSERT INTO ac_data_ssccq VALUES ('429', '1527176324', '20180524116', '9,0,2,2,2');
INSERT INTO ac_data_ssccq VALUES ('448', '1527176616', '20180524117', '9,9,0,8,6');
INSERT INTO ac_data_ssccq VALUES ('468', '1527176919', '20180524118', '9,1,3,4,8');
INSERT INTO ac_data_ssccq VALUES ('488', '1527177221', '20180524119', '0,3,9,8,0');
INSERT INTO ac_data_ssccq VALUES ('507', '1527177508', '20180524120', '1,2,4,3,0');
INSERT INTO ac_data_ssccq VALUES ('533', '1527177804', '20180525001', '2,8,2,9,8');
INSERT INTO ac_data_ssccq VALUES ('534', '1527178210', '20180525002', '2,0,4,1,2');
INSERT INTO ac_data_ssccq VALUES ('536', '1527178510', '20180525003', '2,7,1,0,2');
INSERT INTO ac_data_ssccq VALUES ('537', '1527178810', '20180525004', '0,2,6,7,0');
INSERT INTO ac_data_ssccq VALUES ('538', '1527179110', '20180525005', '4,6,1,9,7');
INSERT INTO ac_data_ssccq VALUES ('539', '1527179410', '20180525006', '7,2,6,7,5');
INSERT INTO ac_data_ssccq VALUES ('540', '1527179710', '20180525007', '1,2,6,9,2');
INSERT INTO ac_data_ssccq VALUES ('542', '1527180011', '20180525008', '3,3,8,4,7');
INSERT INTO ac_data_ssccq VALUES ('543', '1527180310', '20180525009', '7,0,3,9,5');
INSERT INTO ac_data_ssccq VALUES ('544', '1527180611', '20180525010', '9,2,6,3,7');
INSERT INTO ac_data_ssccq VALUES ('545', '1527180910', '20180525011', '8,3,5,1,9');
INSERT INTO ac_data_ssccq VALUES ('546', '1527181210', '20180525012', '6,6,3,1,1');
INSERT INTO ac_data_ssccq VALUES ('548', '1527181510', '20180525013', '6,0,5,5,2');
INSERT INTO ac_data_ssccq VALUES ('549', '1527181811', '20180525014', '8,9,1,3,3');
INSERT INTO ac_data_ssccq VALUES ('550', '1527182110', '20180525015', '5,2,6,1,4');
INSERT INTO ac_data_ssccq VALUES ('551', '1527182410', '20180525016', '3,9,9,3,3');
INSERT INTO ac_data_ssccq VALUES ('552', '1527182708', '20180525017', '4,8,4,9,0');
INSERT INTO ac_data_ssccq VALUES ('553', '1527183010', '20180525018', '6,7,5,6,3');
INSERT INTO ac_data_ssccq VALUES ('554', '1527183310', '20180525019', '3,6,4,7,9');
INSERT INTO ac_data_ssccq VALUES ('555', '1527183610', '20180525020', '7,4,3,7,9');
INSERT INTO ac_data_ssccq VALUES ('556', '1527183911', '20180525021', '4,9,8,8,6');
INSERT INTO ac_data_ssccq VALUES ('557', '1527184148', '20180525022', '3,7,4,9,6');
INSERT INTO ac_data_ssccq VALUES ('558', '1527184510', '20180525023', '1,8,6,0,5');
INSERT INTO ac_data_ssccq VALUES ('579', '1527213610', '20180525024', '8,5,6,6,0');
INSERT INTO ac_data_ssccq VALUES ('580', '1527214210', '20180525025', '5,8,2,3,5');
INSERT INTO ac_data_ssccq VALUES ('582', '1527215235', '20180525026', '7,8,3,4,7');
INSERT INTO ac_data_ssccq VALUES ('583', '1527215410', '20180525027', '9,7,8,7,3');
INSERT INTO ac_data_ssccq VALUES ('585', '1527216010', '20180525028', '2,7,1,1,8');
INSERT INTO ac_data_ssccq VALUES ('586', '1527216611', '20180525029', '7,0,4,5,1');
INSERT INTO ac_data_ssccq VALUES ('587', '1527217210', '20180525030', '7,8,5,7,9');
INSERT INTO ac_data_ssccq VALUES ('589', '1527217810', '20180525031', '9,5,7,4,0');
INSERT INTO ac_data_ssccq VALUES ('590', '1527218410', '20180525032', '5,1,6,7,4');
INSERT INTO ac_data_ssccq VALUES ('592', '1527219010', '20180525033', '7,9,8,6,3');
INSERT INTO ac_data_ssccq VALUES ('593', '1527219610', '20180525034', '4,7,3,3,0');
INSERT INTO ac_data_ssccq VALUES ('594', '1527220158', '20180525035', '3,7,7,9,1');
INSERT INTO ac_data_ssccq VALUES ('600', '1527220810', '20180525036', '1,3,4,3,2');
INSERT INTO ac_data_ssccq VALUES ('601', '1527221410', '20180525037', '8,6,2,2,6');
INSERT INTO ac_data_ssccq VALUES ('603', '1527222010', '20180525038', '5,8,8,9,9');
INSERT INTO ac_data_ssccq VALUES ('604', '1527222610', '20180525039', '6,2,3,8,7');
INSERT INTO ac_data_ssccq VALUES ('606', '1527223211', '20180525040', '1,0,0,6,8');
INSERT INTO ac_data_ssccq VALUES ('607', '1527223810', '20180525041', '4,2,7,8,8');
INSERT INTO ac_data_ssccq VALUES ('608', '1527224410', '20180525042', '0,2,3,5,3');
INSERT INTO ac_data_ssccq VALUES ('610', '1527225011', '20180525043', '0,2,3,1,5');
INSERT INTO ac_data_ssccq VALUES ('611', '1527225610', '20180525044', '7,2,9,2,5');
INSERT INTO ac_data_ssccq VALUES ('613', '1527226210', '20180525045', '7,7,2,1,5');
INSERT INTO ac_data_ssccq VALUES ('614', '1527226810', '20180525046', '9,7,8,8,9');
INSERT INTO ac_data_ssccq VALUES ('615', '1527227359', '20180525047', '5,2,4,4,8');
INSERT INTO ac_data_ssccq VALUES ('620', '1527228010', '20180525048', '4,8,6,5,1');
INSERT INTO ac_data_ssccq VALUES ('621', '1527228610', '20180525049', '2,6,5,2,9');
INSERT INTO ac_data_ssccq VALUES ('623', '1527229210', '20180525050', '0,9,5,9,4');
INSERT INTO ac_data_ssccq VALUES ('624', '1527229810', '20180525051', '1,9,8,1,6');
INSERT INTO ac_data_ssccq VALUES ('626', '1527230410', '20180525052', '0,5,3,0,0');
INSERT INTO ac_data_ssccq VALUES ('627', '1527231010', '20180525053', '0,1,3,9,3');
INSERT INTO ac_data_ssccq VALUES ('628', '1527231611', '20180525054', '6,0,9,7,7');
INSERT INTO ac_data_ssccq VALUES ('630', '1527232210', '20180525055', '5,6,0,7,4');
INSERT INTO ac_data_ssccq VALUES ('631', '1527232810', '20180525056', '0,0,8,4,7');
INSERT INTO ac_data_ssccq VALUES ('633', '1527233410', '20180525057', '2,3,3,1,9');
INSERT INTO ac_data_ssccq VALUES ('634', '1527234010', '20180525058', '4,9,8,2,9');
INSERT INTO ac_data_ssccq VALUES ('635', '1527234561', '20180525059', '5,1,8,0,4');
INSERT INTO ac_data_ssccq VALUES ('640', '1527235210', '20180525060', '8,2,1,2,0');
INSERT INTO ac_data_ssccq VALUES ('641', '1527235810', '20180525061', '9,8,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('643', '1527236410', '20180525062', '6,4,3,8,0');
INSERT INTO ac_data_ssccq VALUES ('644', '1527237010', '20180525063', '3,3,2,3,0');
INSERT INTO ac_data_ssccq VALUES ('646', '1527237610', '20180525064', '9,9,6,8,5');
INSERT INTO ac_data_ssccq VALUES ('647', '1527238210', '20180525065', '3,3,3,0,9');
INSERT INTO ac_data_ssccq VALUES ('648', '1527238811', '20180525066', '0,6,4,7,6');
INSERT INTO ac_data_ssccq VALUES ('650', '1527239410', '20180525067', '1,6,2,0,3');
INSERT INTO ac_data_ssccq VALUES ('651', '1527240010', '20180525068', '9,3,9,7,9');
INSERT INTO ac_data_ssccq VALUES ('653', '1527240610', '20180525069', '7,4,0,6,6');
INSERT INTO ac_data_ssccq VALUES ('654', '1527241210', '20180525070', '9,5,0,1,0');
INSERT INTO ac_data_ssccq VALUES ('655', '1527241763', '20180525071', '5,1,6,4,1');
INSERT INTO ac_data_ssccq VALUES ('660', '1527242410', '20180525072', '1,5,7,2,9');
INSERT INTO ac_data_ssccq VALUES ('661', '1527243010', '20180525073', '9,3,2,6,2');
INSERT INTO ac_data_ssccq VALUES ('663', '1527243610', '20180525074', '8,5,0,8,3');
INSERT INTO ac_data_ssccq VALUES ('664', '1527244210', '20180525075', '8,1,4,5,0');
INSERT INTO ac_data_ssccq VALUES ('666', '1527244810', '20180525076', '2,6,1,6,3');
INSERT INTO ac_data_ssccq VALUES ('667', '1527245410', '20180525077', '2,2,8,1,4');
INSERT INTO ac_data_ssccq VALUES ('668', '1527246010', '20180525078', '1,3,6,6,3');
INSERT INTO ac_data_ssccq VALUES ('670', '1527246610', '20180525079', '2,0,8,0,0');
INSERT INTO ac_data_ssccq VALUES ('671', '1527247210', '20180525080', '8,0,8,0,7');
INSERT INTO ac_data_ssccq VALUES ('673', '1527247810', '20180525081', '3,5,2,7,8');
INSERT INTO ac_data_ssccq VALUES ('674', '1527248410', '20180525082', '3,9,1,1,7');
INSERT INTO ac_data_ssccq VALUES ('675', '1527248965', '20180525083', '2,8,5,9,2');
INSERT INTO ac_data_ssccq VALUES ('680', '1527249610', '20180525084', '0,7,6,0,3');
INSERT INTO ac_data_ssccq VALUES ('681', '1527250210', '20180525085', '9,2,7,7,5');
INSERT INTO ac_data_ssccq VALUES ('683', '1527250811', '20180525086', '3,3,4,1,1');
INSERT INTO ac_data_ssccq VALUES ('684', '1527251410', '20180525087', '8,0,7,7,7');
INSERT INTO ac_data_ssccq VALUES ('686', '1527252010', '20180525088', '3,2,8,0,4');
INSERT INTO ac_data_ssccq VALUES ('687', '1527252610', '20180525089', '5,2,3,7,0');
INSERT INTO ac_data_ssccq VALUES ('688', '1527253210', '20180525090', '1,4,2,7,3');
INSERT INTO ac_data_ssccq VALUES ('690', '1527253810', '20180525091', '5,7,4,4,7');
INSERT INTO ac_data_ssccq VALUES ('691', '1527254410', '20180525092', '5,9,3,4,5');
INSERT INTO ac_data_ssccq VALUES ('693', '1527255010', '20180525093', '8,5,5,1,8');
INSERT INTO ac_data_ssccq VALUES ('694', '1527255611', '20180525094', '8,8,3,0,1');
INSERT INTO ac_data_ssccq VALUES ('695', '1527256167', '20180525095', '4,2,8,2,7');
INSERT INTO ac_data_ssccq VALUES ('700', '1527256810', '20180525096', '1,1,6,3,9');
INSERT INTO ac_data_ssccq VALUES ('701', '1527257110', '20180525097', '8,5,6,1,8');
INSERT INTO ac_data_ssccq VALUES ('702', '1527257410', '20180525098', '7,1,8,6,2');
INSERT INTO ac_data_ssccq VALUES ('703', '1527257607', '20180525099', '0,5,3,6,5');
INSERT INTO ac_data_ssccq VALUES ('704', '1527258010', '20180525100', '7,9,4,1,7');
INSERT INTO ac_data_ssccq VALUES ('717', '1527258207', '20180525101', '1,9,9,0,1');
INSERT INTO ac_data_ssccq VALUES ('737', '1527258511', '20180525102', '4,1,0,5,2');
INSERT INTO ac_data_ssccq VALUES ('756', '1527258804', '20180525103', '5,9,8,0,4');
INSERT INTO ac_data_ssccq VALUES ('775', '1527259096', '20180525104', '1,3,3,5,4');
INSERT INTO ac_data_ssccq VALUES ('792', '1527300608', '20180526025', '6,8,1,8,4');
INSERT INTO ac_data_ssccq VALUES ('793', '1527301210', '20180526026', '2,6,0,3,8');
INSERT INTO ac_data_ssccq VALUES ('794', '1527301810', '20180526027', '4,2,1,3,8');
INSERT INTO ac_data_ssccq VALUES ('796', '1527302410', '20180526028', '6,6,1,7,8');
INSERT INTO ac_data_ssccq VALUES ('797', '1527303010', '20180526029', '9,2,6,8,2');
INSERT INTO ac_data_ssccq VALUES ('798', '1527303499', '20180526030', '5,2,9,6,4');
INSERT INTO ac_data_ssccq VALUES ('809', '1527304210', '20180526031', '4,6,4,9,3');
INSERT INTO ac_data_ssccq VALUES ('810', '1527304810', '20180526032', '1,4,1,6,9');
INSERT INTO ac_data_ssccq VALUES ('812', '1527305410', '20180526033', '2,3,5,6,5');
INSERT INTO ac_data_ssccq VALUES ('813', '1527306010', '20180526034', '4,3,4,3,6');
INSERT INTO ac_data_ssccq VALUES ('815', '1527306610', '20180526035', '0,9,6,9,9');
INSERT INTO ac_data_ssccq VALUES ('816', '1527307210', '20180526036', '4,9,4,9,0');
INSERT INTO ac_data_ssccq VALUES ('817', '1527307809', '20180526037', '9,3,1,7,8');
INSERT INTO ac_data_ssccq VALUES ('818', '1527308410', '20180526038', '5,7,6,2,2');
INSERT INTO ac_data_ssccq VALUES ('819', '1527309010', '20180526039', '1,0,8,2,5');
INSERT INTO ac_data_ssccq VALUES ('821', '1527309610', '20180526040', '7,7,3,3,1');
INSERT INTO ac_data_ssccq VALUES ('822', '1527310211', '20180526041', '5,9,5,5,9');
INSERT INTO ac_data_ssccq VALUES ('824', '1527310810', '20180526042', '1,1,5,7,0');
INSERT INTO ac_data_ssccq VALUES ('825', '1527311410', '20180526043', '2,4,5,2,2');
INSERT INTO ac_data_ssccq VALUES ('826', '1527312010', '20180526044', '9,3,8,8,6');
INSERT INTO ac_data_ssccq VALUES ('828', '1527312610', '20180526045', '1,5,1,4,4');
INSERT INTO ac_data_ssccq VALUES ('829', '1527313210', '20180526046', '0,1,0,8,4');
INSERT INTO ac_data_ssccq VALUES ('831', '1527313810', '20180526047', '8,6,6,5,6');
INSERT INTO ac_data_ssccq VALUES ('832', '1527314410', '20180526048', '9,9,4,0,3');
INSERT INTO ac_data_ssccq VALUES ('833', '1527315010', '20180526049', '0,2,0,0,7');
INSERT INTO ac_data_ssccq VALUES ('834', '1527315610', '20180526050', '1,0,6,1,6');
INSERT INTO ac_data_ssccq VALUES ('835', '1527316211', '20180526051', '6,4,2,2,4');
INSERT INTO ac_data_ssccq VALUES ('837', '1527316810', '20180526052', '7,0,5,6,6');
INSERT INTO ac_data_ssccq VALUES ('838', '1527317410', '20180526053', '8,7,2,1,5');
INSERT INTO ac_data_ssccq VALUES ('839', '1527317891', '20180526054', '2,2,2,4,9');
INSERT INTO ac_data_ssccq VALUES ('851', '1527318610', '20180526055', '7,3,6,6,3');
INSERT INTO ac_data_ssccq VALUES ('852', '1527319210', '20180526056', '0,1,9,1,9');
INSERT INTO ac_data_ssccq VALUES ('854', '1527319810', '20180526057', '9,8,4,0,1');
INSERT INTO ac_data_ssccq VALUES ('855', '1527320410', '20180526058', '5,7,2,9,5');
INSERT INTO ac_data_ssccq VALUES ('857', '1527321010', '20180526059', '5,3,1,1,0');
INSERT INTO ac_data_ssccq VALUES ('858', '1527321611', '20180526060', '2,7,9,6,1');
INSERT INTO ac_data_ssccq VALUES ('859', '1527322210', '20180526061', '8,8,9,8,4');
INSERT INTO ac_data_ssccq VALUES ('861', '1527322810', '20180526062', '8,1,4,7,0');
INSERT INTO ac_data_ssccq VALUES ('862', '1527323410', '20180526063', '4,0,1,9,4');
INSERT INTO ac_data_ssccq VALUES ('864', '1527324010', '20180526064', '8,7,3,5,7');
INSERT INTO ac_data_ssccq VALUES ('865', '1527324610', '20180526065', '8,6,8,9,2');
INSERT INTO ac_data_ssccq VALUES ('866', '1527325092', '20180526066', '1,8,8,1,6');
INSERT INTO ac_data_ssccq VALUES ('878', '1527325810', '20180526067', '9,5,1,1,7');
INSERT INTO ac_data_ssccq VALUES ('879', '1527332445', '20180526078', '8,5,6,6,8');
INSERT INTO ac_data_ssccq VALUES ('881', '1527333010', '20180526079', '0,6,3,0,0');
INSERT INTO ac_data_ssccq VALUES ('882', '1527333610', '20180526080', '5,7,6,3,8');
INSERT INTO ac_data_ssccq VALUES ('884', '1527334210', '20180526081', '6,7,2,5,1');
INSERT INTO ac_data_ssccq VALUES ('885', '1527334810', '20180526082', '5,5,5,2,2');
INSERT INTO ac_data_ssccq VALUES ('886', '1527335311', '20180526083', '8,6,1,8,9');
INSERT INTO ac_data_ssccq VALUES ('896', '1527336010', '20180526084', '1,7,2,5,8');
INSERT INTO ac_data_ssccq VALUES ('897', '1527336610', '20180526085', '5,9,6,9,0');
INSERT INTO ac_data_ssccq VALUES ('899', '1527337210', '20180526086', '4,0,9,7,9');
INSERT INTO ac_data_ssccq VALUES ('900', '1527337810', '20180526087', '5,8,7,6,7');
INSERT INTO ac_data_ssccq VALUES ('902', '1527338410', '20180526088', '0,8,7,0,6');
INSERT INTO ac_data_ssccq VALUES ('903', '1527339011', '20180526089', '9,3,7,2,0');
INSERT INTO ac_data_ssccq VALUES ('904', '1527339610', '20180526090', '3,7,7,6,5');
INSERT INTO ac_data_ssccq VALUES ('906', '1527340210', '20180526091', '5,3,2,5,8');
INSERT INTO ac_data_ssccq VALUES ('907', '1527340810', '20180526092', '1,6,5,4,9');
INSERT INTO ac_data_ssccq VALUES ('909', '1527341410', '20180526093', '4,1,2,6,8');
INSERT INTO ac_data_ssccq VALUES ('910', '1527342010', '20180526094', '5,3,5,5,1');
INSERT INTO ac_data_ssccq VALUES ('911', '1527342512', '20180526095', '4,3,1,9,5');
INSERT INTO ac_data_ssccq VALUES ('921', '1527343210', '20180526096', '0,6,3,5,6');
INSERT INTO ac_data_ssccq VALUES ('922', '1527343510', '20180526097', '0,4,0,1,1');
INSERT INTO ac_data_ssccq VALUES ('923', '1527343810', '20180526098', '2,4,1,9,3');
INSERT INTO ac_data_ssccq VALUES ('925', '1527344111', '20180526099', '1,6,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('926', '1527344410', '20180526100', '6,7,7,5,9');
INSERT INTO ac_data_ssccq VALUES ('938', '1527344591', '20180526101', '4,4,9,7,5');
INSERT INTO ac_data_ssccq VALUES ('958', '1527344898', '20180526102', '3,5,5,6,1');
INSERT INTO ac_data_ssccq VALUES ('978', '1527345200', '20180526103', '7,4,7,4,2');
INSERT INTO ac_data_ssccq VALUES ('997', '1527345500', '20180526104', '7,6,5,6,5');
INSERT INTO ac_data_ssccq VALUES ('1017', '1527345803', '20180526105', '1,3,1,5,6');
INSERT INTO ac_data_ssccq VALUES ('1035', '1527346102', '20180526106', '7,9,8,3,1');
INSERT INTO ac_data_ssccq VALUES ('1053', '1527346393', '20180526107', '2,7,0,4,3');
INSERT INTO ac_data_ssccq VALUES ('1072', '1527346691', '20180526108', '5,6,7,4,1');
INSERT INTO ac_data_ssccq VALUES ('1093', '1527347001', '20180526109', '5,5,6,1,9');
INSERT INTO ac_data_ssccq VALUES ('1113', '1527347310', '20180526110', '6,8,8,5,1');
INSERT INTO ac_data_ssccq VALUES ('1132', '1527347610', '20180526111', '4,9,3,4,4');
INSERT INTO ac_data_ssccq VALUES ('1151', '1527347899', '20180526112', '4,3,7,9,4');
INSERT INTO ac_data_ssccq VALUES ('1171', '1527348204', '20180526113', '4,1,0,0,7');
INSERT INTO ac_data_ssccq VALUES ('1190', '1527348496', '20180526114', '9,6,7,6,1');
INSERT INTO ac_data_ssccq VALUES ('1208', '1527348795', '20180526115', '1,0,2,8,2');
INSERT INTO ac_data_ssccq VALUES ('1227', '1527349098', '20180526116', '0,3,5,0,3');
INSERT INTO ac_data_ssccq VALUES ('1247', '1527349410', '20180526117', '2,4,6,9,8');
INSERT INTO ac_data_ssccq VALUES ('1261', '1527387924', '20180527026', '5,9,9,4,4');
INSERT INTO ac_data_ssccq VALUES ('1263', '1527388210', '20180527027', '3,3,1,8,3');
INSERT INTO ac_data_ssccq VALUES ('1264', '1527388810', '20180527028', '6,6,4,6,3');
INSERT INTO ac_data_ssccq VALUES ('1266', '1527389414', '20180527029', '8,9,4,2,9');
INSERT INTO ac_data_ssccq VALUES ('1267', '1527390010', '20180527030', '3,3,9,5,5');
INSERT INTO ac_data_ssccq VALUES ('1268', '1527390610', '20180527031', '9,7,3,4,0');
INSERT INTO ac_data_ssccq VALUES ('1270', '1527391211', '20180527032', '7,2,9,3,8');
INSERT INTO ac_data_ssccq VALUES ('1271', '1527391810', '20180527033', '1,9,7,4,7');
INSERT INTO ac_data_ssccq VALUES ('1272', '1527392666', '20180527034', '2,9,8,6,0');
INSERT INTO ac_data_ssccq VALUES ('1274', '1527393010', '20180527035', '1,9,3,8,2');
INSERT INTO ac_data_ssccq VALUES ('1275', '1527393555', '20180527036', '4,6,9,7,7');
INSERT INTO ac_data_ssccq VALUES ('1281', '1527394210', '20180527037', '1,1,8,6,4');
INSERT INTO ac_data_ssccq VALUES ('1282', '1527394810', '20180527038', '3,9,1,6,0');
INSERT INTO ac_data_ssccq VALUES ('1284', '1527395410', '20180527039', '3,1,1,6,7');
INSERT INTO ac_data_ssccq VALUES ('1285', '1527396010', '20180527040', '3,5,8,7,3');
INSERT INTO ac_data_ssccq VALUES ('1287', '1527396611', '20180527041', '0,3,4,8,3');
INSERT INTO ac_data_ssccq VALUES ('1288', '1527397210', '20180527042', '5,5,1,4,1');
INSERT INTO ac_data_ssccq VALUES ('1289', '1527397810', '20180527043', '2,1,6,7,9');
INSERT INTO ac_data_ssccq VALUES ('1291', '1527398410', '20180527044', '9,8,3,9,6');
INSERT INTO ac_data_ssccq VALUES ('1292', '1527399010', '20180527045', '1,6,1,1,8');
INSERT INTO ac_data_ssccq VALUES ('1294', '1527399610', '20180527046', '8,2,4,9,1');
INSERT INTO ac_data_ssccq VALUES ('1295', '1527400210', '20180527047', '1,5,4,6,0');
INSERT INTO ac_data_ssccq VALUES ('1296', '1527400756', '20180527048', '5,5,7,3,6');
INSERT INTO ac_data_ssccq VALUES ('1302', '1527401410', '20180527049', '1,6,9,6,3');
INSERT INTO ac_data_ssccq VALUES ('1303', '1527402010', '20180527050', '7,2,6,4,0');
INSERT INTO ac_data_ssccq VALUES ('1305', '1527402610', '20180527051', '5,4,4,9,7');
INSERT INTO ac_data_ssccq VALUES ('1306', '1527403210', '20180527052', '7,6,2,1,2');
INSERT INTO ac_data_ssccq VALUES ('1308', '1527403810', '20180527053', '4,9,0,5,8');
INSERT INTO ac_data_ssccq VALUES ('1309', '1527404410', '20180527054', '2,8,6,3,0');
INSERT INTO ac_data_ssccq VALUES ('1310', '1527405010', '20180527055', '7,3,9,8,1');
INSERT INTO ac_data_ssccq VALUES ('1312', '1527405610', '20180527056', '4,0,3,9,5');
INSERT INTO ac_data_ssccq VALUES ('1313', '1527406210', '20180527057', '9,2,0,2,2');
INSERT INTO ac_data_ssccq VALUES ('1315', '1527406810', '20180527058', '0,2,2,9,4');
INSERT INTO ac_data_ssccq VALUES ('1316', '1527407410', '20180527059', '0,5,3,4,7');
INSERT INTO ac_data_ssccq VALUES ('1317', '1527407957', '20180527060', '7,6,5,9,6');
INSERT INTO ac_data_ssccq VALUES ('1323', '1527408610', '20180527061', '4,8,9,3,6');
INSERT INTO ac_data_ssccq VALUES ('1324', '1527409210', '20180527062', '9,0,0,6,2');
INSERT INTO ac_data_ssccq VALUES ('1326', '1527409810', '20180527063', '7,1,6,2,3');
INSERT INTO ac_data_ssccq VALUES ('1327', '1527410410', '20180527064', '5,3,6,9,3');
INSERT INTO ac_data_ssccq VALUES ('1329', '1527411010', '20180527065', '1,5,8,8,4');
INSERT INTO ac_data_ssccq VALUES ('1330', '1527411610', '20180527066', '8,7,5,9,5');
INSERT INTO ac_data_ssccq VALUES ('1331', '1527412210', '20180527067', '6,7,1,8,4');
INSERT INTO ac_data_ssccq VALUES ('1333', '1527412810', '20180527068', '2,5,6,9,5');
INSERT INTO ac_data_ssccq VALUES ('1334', '1527413410', '20180527069', '4,0,0,8,9');
INSERT INTO ac_data_ssccq VALUES ('1336', '1527414010', '20180527070', '6,1,0,0,1');
INSERT INTO ac_data_ssccq VALUES ('1337', '1527414611', '20180527071', '0,2,4,3,1');
INSERT INTO ac_data_ssccq VALUES ('1338', '1527415159', '20180527072', '5,7,1,6,9');
INSERT INTO ac_data_ssccq VALUES ('1343', '1527415811', '20180527073', '8,3,3,4,1');
INSERT INTO ac_data_ssccq VALUES ('1344', '1527416410', '20180527074', '3,6,4,2,5');
INSERT INTO ac_data_ssccq VALUES ('1346', '1527417010', '20180527075', '0,2,5,6,9');
INSERT INTO ac_data_ssccq VALUES ('1347', '1527417610', '20180527076', '2,2,9,9,2');
INSERT INTO ac_data_ssccq VALUES ('1349', '1527418210', '20180527077', '1,8,9,0,0');
INSERT INTO ac_data_ssccq VALUES ('1350', '1527418810', '20180527078', '6,4,4,9,3');
INSERT INTO ac_data_ssccq VALUES ('1351', '1527419411', '20180527079', '8,9,2,7,8');
INSERT INTO ac_data_ssccq VALUES ('1353', '1527420010', '20180527080', '0,1,3,4,0');
INSERT INTO ac_data_ssccq VALUES ('1354', '1527420610', '20180527081', '7,1,5,9,3');
INSERT INTO ac_data_ssccq VALUES ('1356', '1527421210', '20180527082', '4,0,0,8,4');
INSERT INTO ac_data_ssccq VALUES ('1357', '1527421810', '20180527083', '6,6,5,9,7');
INSERT INTO ac_data_ssccq VALUES ('1358', '1527422360', '20180527084', '3,5,5,8,8');
INSERT INTO ac_data_ssccq VALUES ('1363', '1527423011', '20180527085', '9,4,1,7,4');
INSERT INTO ac_data_ssccq VALUES ('1364', '1527423610', '20180527086', '2,5,2,8,9');
INSERT INTO ac_data_ssccq VALUES ('1366', '1527424210', '20180527087', '4,5,4,2,6');
INSERT INTO ac_data_ssccq VALUES ('1367', '1527424810', '20180527088', '3,0,7,3,3');
INSERT INTO ac_data_ssccq VALUES ('1369', '1527425411', '20180527089', '4,1,4,8,5');
INSERT INTO ac_data_ssccq VALUES ('1370', '1527426010', '20180527090', '6,1,9,7,5');
INSERT INTO ac_data_ssccq VALUES ('1371', '1527426610', '20180527091', '1,2,6,8,8');
INSERT INTO ac_data_ssccq VALUES ('1373', '1527427210', '20180527092', '7,2,4,8,3');
INSERT INTO ac_data_ssccq VALUES ('1374', '1527427810', '20180527093', '7,5,0,5,5');
INSERT INTO ac_data_ssccq VALUES ('1376', '1527428410', '20180527094', '1,1,6,7,2');
INSERT INTO ac_data_ssccq VALUES ('1377', '1527429010', '20180527095', '9,4,7,1,5');
INSERT INTO ac_data_ssccq VALUES ('1378', '1527429561', '20180527096', '8,0,1,5,0');
INSERT INTO ac_data_ssccq VALUES ('1379', '1527429910', '20180527097', '1,5,4,2,6');
INSERT INTO ac_data_ssccq VALUES ('1380', '1527430210', '20180527098', '1,2,4,5,4');
INSERT INTO ac_data_ssccq VALUES ('1381', '1527430511', '20180527099', '4,4,5,5,9');
INSERT INTO ac_data_ssccq VALUES ('1382', '1527430810', '20180527100', '3,8,7,5,0');
INSERT INTO ac_data_ssccq VALUES ('1395', '1527431001', '20180527101', '1,6,7,0,8');
INSERT INTO ac_data_ssccq VALUES ('1414', '1527431290', '20180527102', '9,1,7,1,6');
INSERT INTO ac_data_ssccq VALUES ('1434', '1527431596', '20180527103', '1,1,9,1,3');
INSERT INTO ac_data_ssccq VALUES ('1453', '1527431884', '20180527104', '7,3,9,5,9');
INSERT INTO ac_data_ssccq VALUES ('1473', '1527432187', '20180527105', '9,9,0,8,9');
INSERT INTO ac_data_ssccq VALUES ('1494', '1527432502', '20180527106', '1,4,8,0,7');
INSERT INTO ac_data_ssccq VALUES ('1514', '1527432805', '20180527107', '6,3,2,0,7');
INSERT INTO ac_data_ssccq VALUES ('1533', '1527433096', '20180527108', '5,8,3,6,8');
INSERT INTO ac_data_ssccq VALUES ('1552', '1527433385', '20180527109', '9,7,9,3,6');
INSERT INTO ac_data_ssccq VALUES ('1573', '1527433702', '20180527110', '2,1,2,7,0');
INSERT INTO ac_data_ssccq VALUES ('1592', '1527433991', '20180527111', '9,8,7,7,9');
INSERT INTO ac_data_ssccq VALUES ('1612', '1527434294', '20180527112', '1,8,8,2,8');
INSERT INTO ac_data_ssccq VALUES ('1632', '1527434599', '20180527113', '9,8,3,2,2');
INSERT INTO ac_data_ssccq VALUES ('1652', '1527434902', '20180527114', '5,6,5,5,0');
INSERT INTO ac_data_ssccq VALUES ('1671', '1527435189', '20180527115', '6,8,5,9,3');
INSERT INTO ac_data_ssccq VALUES ('1691', '1527435491', '20180527116', '9,3,0,1,5');
INSERT INTO ac_data_ssccq VALUES ('1711', '1527435794', '20180527117', '0,5,9,7,0');
INSERT INTO ac_data_ssccq VALUES ('1731', '1527436096', '20180527118', '9,8,1,4,2');
INSERT INTO ac_data_ssccq VALUES ('1751', '1527436401', '20180527119', '0,4,8,4,8');
INSERT INTO ac_data_ssccq VALUES ('1770', '1527436689', '20180527120', '4,2,8,9,5');
INSERT INTO ac_data_ssccq VALUES ('1797', '1527437001', '20180528001', '9,6,9,8,9');
INSERT INTO ac_data_ssccq VALUES ('1798', '1527437410', '20180528002', '6,5,2,5,3');
INSERT INTO ac_data_ssccq VALUES ('1799', '1527437710', '20180528003', '3,4,2,6,0');
INSERT INTO ac_data_ssccq VALUES ('1800', '1527438013', '20180528004', '0,4,3,9,6');
INSERT INTO ac_data_ssccq VALUES ('1801', '1527438207', '20180528005', '1,9,9,3,9');
INSERT INTO ac_data_ssccq VALUES ('1802', '1527438610', '20180528006', '5,4,4,9,9');
INSERT INTO ac_data_ssccq VALUES ('1803', '1527438910', '20180528007', '0,5,0,4,7');
INSERT INTO ac_data_ssccq VALUES ('1804', '1527439210', '20180528008', '4,5,0,2,2');
INSERT INTO ac_data_ssccq VALUES ('1805', '1527439510', '20180528009', '1,4,2,8,7');
INSERT INTO ac_data_ssccq VALUES ('1807', '1527439810', '20180528010', '7,0,8,2,7');
INSERT INTO ac_data_ssccq VALUES ('1808', '1527440110', '20180528011', '7,6,6,8,7');
INSERT INTO ac_data_ssccq VALUES ('1809', '1527440410', '20180528012', '1,0,7,7,5');
INSERT INTO ac_data_ssccq VALUES ('1810', '1527440710', '20180528013', '3,9,2,6,5');
INSERT INTO ac_data_ssccq VALUES ('1811', '1527441010', '20180528014', '4,1,0,9,7');
INSERT INTO ac_data_ssccq VALUES ('1813', '1527441310', '20180528015', '8,2,9,2,8');
INSERT INTO ac_data_ssccq VALUES ('1814', '1527441610', '20180528016', '8,8,2,6,2');
INSERT INTO ac_data_ssccq VALUES ('1815', '1527441911', '20180528017', '4,1,5,0,1');
INSERT INTO ac_data_ssccq VALUES ('1816', '1527442210', '20180528018', '0,3,9,8,9');
INSERT INTO ac_data_ssccq VALUES ('1817', '1527442510', '20180528019', '4,8,3,1,5');
INSERT INTO ac_data_ssccq VALUES ('1819', '1527442810', '20180528020', '1,2,6,0,5');
INSERT INTO ac_data_ssccq VALUES ('1820', '1527443110', '20180528021', '3,3,9,5,4');
INSERT INTO ac_data_ssccq VALUES ('1821', '1527443411', '20180528022', '1,2,2,4,9');
INSERT INTO ac_data_ssccq VALUES ('1822', '1527443710', '20180528023', '5,8,7,3,6');
INSERT INTO ac_data_ssccq VALUES ('1843', '1527472769', '20180528024', '4,7,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('1848', '1527473410', '20180528025', '0,6,9,4,2');
INSERT INTO ac_data_ssccq VALUES ('1849', '1527474010', '20180528026', '9,0,0,7,2');
INSERT INTO ac_data_ssccq VALUES ('1851', '1527474610', '20180528027', '0,9,1,4,3');
INSERT INTO ac_data_ssccq VALUES ('1852', '1527475210', '20180528028', '1,2,0,9,7');
INSERT INTO ac_data_ssccq VALUES ('1854', '1527475810', '20180528029', '5,0,3,8,5');
INSERT INTO ac_data_ssccq VALUES ('1855', '1527476410', '20180528030', '2,7,9,7,9');
INSERT INTO ac_data_ssccq VALUES ('1856', '1527477010', '20180528031', '6,0,9,9,2');
INSERT INTO ac_data_ssccq VALUES ('1858', '1527477610', '20180528032', '0,7,6,5,1');
INSERT INTO ac_data_ssccq VALUES ('1859', '1527478210', '20180528033', '6,1,7,0,8');
INSERT INTO ac_data_ssccq VALUES ('1861', '1527478810', '20180528034', '4,1,0,0,4');
INSERT INTO ac_data_ssccq VALUES ('1862', '1527479410', '20180528035', '1,1,3,3,0');
INSERT INTO ac_data_ssccq VALUES ('1863', '1527479971', '20180528036', '8,8,0,1,1');
INSERT INTO ac_data_ssccq VALUES ('1867', '1527480610', '20180528037', '6,9,0,4,3');
INSERT INTO ac_data_ssccq VALUES ('1868', '1527481211', '20180528038', '5,2,3,8,7');
INSERT INTO ac_data_ssccq VALUES ('1870', '1527481810', '20180528039', '3,1,6,2,4');
INSERT INTO ac_data_ssccq VALUES ('1871', '1527482410', '20180528040', '0,0,0,0,1');
INSERT INTO ac_data_ssccq VALUES ('1873', '1527483010', '20180528041', '2,8,0,7,1');
INSERT INTO ac_data_ssccq VALUES ('1874', '1527483610', '20180528042', '3,5,8,0,4');
INSERT INTO ac_data_ssccq VALUES ('1875', '1527484211', '20180528043', '5,3,2,6,9');
INSERT INTO ac_data_ssccq VALUES ('1877', '1527484811', '20180528044', '1,5,1,0,6');
INSERT INTO ac_data_ssccq VALUES ('1878', '1527485410', '20180528045', '2,7,4,3,7');
INSERT INTO ac_data_ssccq VALUES ('1880', '1527486010', '20180528046', '7,0,6,1,5');
INSERT INTO ac_data_ssccq VALUES ('1881', '1527486610', '20180528047', '4,2,6,7,0');
INSERT INTO ac_data_ssccq VALUES ('1882', '1527487172', '20180528048', '9,8,6,7,6');
INSERT INTO ac_data_ssccq VALUES ('1886', '1527487811', '20180528049', '3,2,7,6,2');
INSERT INTO ac_data_ssccq VALUES ('1887', '1527488411', '20180528050', '1,5,7,7,1');
INSERT INTO ac_data_ssccq VALUES ('1889', '1527489010', '20180528051', '1,0,5,9,2');
INSERT INTO ac_data_ssccq VALUES ('1890', '1527489610', '20180528052', '3,9,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('1892', '1527490210', '20180528053', '5,9,2,8,8');
INSERT INTO ac_data_ssccq VALUES ('1893', '1527490810', '20180528054', '7,5,6,8,6');
INSERT INTO ac_data_ssccq VALUES ('1894', '1527491410', '20180528055', '2,7,4,9,0');
INSERT INTO ac_data_ssccq VALUES ('1896', '1527492010', '20180528056', '4,3,9,1,2');
INSERT INTO ac_data_ssccq VALUES ('1897', '1527492610', '20180528057', '4,1,2,3,8');
INSERT INTO ac_data_ssccq VALUES ('1899', '1527493210', '20180528058', '4,3,8,9,5');
INSERT INTO ac_data_ssccq VALUES ('1900', '1527493810', '20180528059', '6,6,5,3,4');
INSERT INTO ac_data_ssccq VALUES ('1901', '1527494373', '20180528060', '2,3,4,2,8');
INSERT INTO ac_data_ssccq VALUES ('1905', '1527495010', '20180528061', '9,2,2,4,2');
INSERT INTO ac_data_ssccq VALUES ('1906', '1527495610', '20180528062', '5,8,2,3,3');
INSERT INTO ac_data_ssccq VALUES ('1908', '1527496210', '20180528063', '9,2,8,4,4');
INSERT INTO ac_data_ssccq VALUES ('1909', '1527496810', '20180528064', '7,2,4,7,0');
INSERT INTO ac_data_ssccq VALUES ('1911', '1527497410', '20180528065', '1,3,5,5,0');
INSERT INTO ac_data_ssccq VALUES ('1912', '1527498010', '20180528066', '5,5,2,2,0');
INSERT INTO ac_data_ssccq VALUES ('1913', '1527498611', '20180528067', '5,1,3,3,8');
INSERT INTO ac_data_ssccq VALUES ('1915', '1527499210', '20180528068', '0,2,2,8,1');
INSERT INTO ac_data_ssccq VALUES ('1916', '1527499810', '20180528069', '2,5,5,5,7');
INSERT INTO ac_data_ssccq VALUES ('1918', '1527500410', '20180528070', '3,5,2,8,7');
INSERT INTO ac_data_ssccq VALUES ('1919', '1527501010', '20180528071', '5,4,1,4,1');
INSERT INTO ac_data_ssccq VALUES ('1920', '1527501574', '20180528072', '2,0,4,6,1');
INSERT INTO ac_data_ssccq VALUES ('1924', '1527502210', '20180528073', '1,0,0,8,9');
INSERT INTO ac_data_ssccq VALUES ('1925', '1527502810', '20180528074', '0,9,6,1,4');
INSERT INTO ac_data_ssccq VALUES ('1927', '1527503410', '20180528075', '1,0,6,2,5');
INSERT INTO ac_data_ssccq VALUES ('1928', '1527504010', '20180528076', '8,6,7,7,5');
INSERT INTO ac_data_ssccq VALUES ('1930', '1527504610', '20180528077', '3,5,8,0,5');
INSERT INTO ac_data_ssccq VALUES ('1931', '1527505211', '20180528078', '2,0,9,0,6');
INSERT INTO ac_data_ssccq VALUES ('1932', '1527505810', '20180528079', '5,6,3,2,4');
INSERT INTO ac_data_ssccq VALUES ('1934', '1527506410', '20180528080', '1,3,0,0,7');
INSERT INTO ac_data_ssccq VALUES ('1935', '1527507010', '20180528081', '7,4,5,6,7');
INSERT INTO ac_data_ssccq VALUES ('1937', '1527507610', '20180528082', '8,3,7,9,7');
INSERT INTO ac_data_ssccq VALUES ('1938', '1527508210', '20180528083', '4,6,5,6,4');
INSERT INTO ac_data_ssccq VALUES ('1939', '1527508776', '20180528084', '4,7,0,2,2');
INSERT INTO ac_data_ssccq VALUES ('1943', '1527509410', '20180528085', '9,5,2,9,5');
INSERT INTO ac_data_ssccq VALUES ('1944', '1527510010', '20180528086', '7,6,9,7,1');
INSERT INTO ac_data_ssccq VALUES ('1946', '1527510610', '20180528087', '0,8,2,4,9');
INSERT INTO ac_data_ssccq VALUES ('1947', '1527511210', '20180528088', '7,0,2,8,2');
INSERT INTO ac_data_ssccq VALUES ('1949', '1527511810', '20180528089', '0,3,5,7,6');
INSERT INTO ac_data_ssccq VALUES ('1950', '1527512411', '20180528090', '3,2,4,8,6');
INSERT INTO ac_data_ssccq VALUES ('1951', '1527513010', '20180528091', '4,9,3,4,3');
INSERT INTO ac_data_ssccq VALUES ('1953', '1527513610', '20180528092', '7,5,0,6,2');
INSERT INTO ac_data_ssccq VALUES ('1954', '1527514210', '20180528093', '6,3,4,6,0');
INSERT INTO ac_data_ssccq VALUES ('1956', '1527514810', '20180528094', '4,6,0,8,3');
INSERT INTO ac_data_ssccq VALUES ('1957', '1527515410', '20180528095', '0,3,8,6,0');
INSERT INTO ac_data_ssccq VALUES ('1958', '1527515977', '20180528096', '5,9,8,4,3');
INSERT INTO ac_data_ssccq VALUES ('1959', '1527516310', '20180528097', '9,4,6,0,4');
INSERT INTO ac_data_ssccq VALUES ('1960', '1527516610', '20180528098', '5,5,5,4,4');
INSERT INTO ac_data_ssccq VALUES ('1961', '1527516911', '20180528099', '9,5,7,4,8');
INSERT INTO ac_data_ssccq VALUES ('1962', '1527517210', '20180528100', '7,6,4,4,3');
INSERT INTO ac_data_ssccq VALUES ('1974', '1527517393', '20180528101', '0,1,0,6,7');
INSERT INTO ac_data_ssccq VALUES ('1994', '1527517693', '20180528102', '5,8,0,3,3');
INSERT INTO ac_data_ssccq VALUES ('2014', '1527517997', '20180528103', '8,7,0,9,3');
INSERT INTO ac_data_ssccq VALUES ('2033', '1527518287', '20180528104', '7,3,3,1,1');
INSERT INTO ac_data_ssccq VALUES ('2053', '1527518590', '20180528105', '0,9,2,2,4');
INSERT INTO ac_data_ssccq VALUES ('2073', '1527518888', '20180528106', '4,1,3,1,7');
INSERT INTO ac_data_ssccq VALUES ('2093', '1527519191', '20180528107', '9,9,6,1,7');
INSERT INTO ac_data_ssccq VALUES ('2113', '1527519495', '20180528108', '8,9,3,2,9');
INSERT INTO ac_data_ssccq VALUES ('2132', '1527519786', '20180528109', '0,7,2,8,3');
INSERT INTO ac_data_ssccq VALUES ('2152', '1527520091', '20180528110', '6,9,6,8,9');
INSERT INTO ac_data_ssccq VALUES ('2172', '1527520388', '20180528111', '7,4,9,2,3');
INSERT INTO ac_data_ssccq VALUES ('2192', '1527520692', '20180528112', '0,0,8,6,7');
INSERT INTO ac_data_ssccq VALUES ('2212', '1527520997', '20180528113', '5,6,4,2,3');
INSERT INTO ac_data_ssccq VALUES ('2232', '1527521302', '20180528114', '7,1,4,0,9');
INSERT INTO ac_data_ssccq VALUES ('2251', '1527521590', '20180528115', '0,8,2,3,1');
INSERT INTO ac_data_ssccq VALUES ('2271', '1527521892', '20180528116', '5,8,8,9,8');
INSERT INTO ac_data_ssccq VALUES ('2291', '1527522195', '20180528117', '2,5,9,4,3');
INSERT INTO ac_data_ssccq VALUES ('2311', '1527522498', '20180528118', '0,3,2,8,4');
INSERT INTO ac_data_ssccq VALUES ('2330', '1527522786', '20180528119', '6,4,7,0,2');
INSERT INTO ac_data_ssccq VALUES ('2350', '1527523090', '20180528120', '3,6,5,3,6');
INSERT INTO ac_data_ssccq VALUES ('2375', '1527523382', '20180529001', '1,4,4,7,6');
INSERT INTO ac_data_ssccq VALUES ('2376', '1527523810', '20180529002', '5,4,7,7,6');
INSERT INTO ac_data_ssccq VALUES ('2377', '1527524110', '20180529003', '0,8,5,0,4');
INSERT INTO ac_data_ssccq VALUES ('2378', '1527524410', '20180529004', '8,6,3,5,1');
INSERT INTO ac_data_ssccq VALUES ('2379', '1527524618', '20180529005', '1,9,0,9,7');
INSERT INTO ac_data_ssccq VALUES ('2380', '1527525010', '20180529006', '6,9,5,0,6');
INSERT INTO ac_data_ssccq VALUES ('2381', '1527525310', '20180529007', '2,2,7,9,6');
INSERT INTO ac_data_ssccq VALUES ('2382', '1527525610', '20180529008', '8,8,9,8,0');
INSERT INTO ac_data_ssccq VALUES ('2383', '1527525910', '20180529009', '0,7,4,4,8');
INSERT INTO ac_data_ssccq VALUES ('2385', '1527526210', '20180529010', '0,9,3,3,7');
INSERT INTO ac_data_ssccq VALUES ('2386', '1527526510', '20180529011', '2,5,2,8,0');
INSERT INTO ac_data_ssccq VALUES ('2387', '1527526810', '20180529012', '7,4,2,0,1');
INSERT INTO ac_data_ssccq VALUES ('2388', '1527527110', '20180529013', '2,4,6,4,6');
INSERT INTO ac_data_ssccq VALUES ('2389', '1527527410', '20180529014', '8,3,8,8,4');
INSERT INTO ac_data_ssccq VALUES ('2391', '1527527710', '20180529015', '7,2,8,3,9');
INSERT INTO ac_data_ssccq VALUES ('2392', '1527528010', '20180529016', '1,1,7,0,4');
INSERT INTO ac_data_ssccq VALUES ('2393', '1527528310', '20180529017', '6,6,0,5,6');
INSERT INTO ac_data_ssccq VALUES ('2394', '1527528610', '20180529018', '2,1,1,2,8');
INSERT INTO ac_data_ssccq VALUES ('2395', '1527528910', '20180529019', '4,3,0,8,2');
INSERT INTO ac_data_ssccq VALUES ('2397', '1527529210', '20180529020', '5,2,7,3,2');
INSERT INTO ac_data_ssccq VALUES ('2398', '1527529510', '20180529021', '8,5,9,5,8');
INSERT INTO ac_data_ssccq VALUES ('2399', '1527529811', '20180529022', '3,6,2,2,2');
INSERT INTO ac_data_ssccq VALUES ('2400', '1527530110', '20180529023', '9,9,6,1,7');
INSERT INTO ac_data_ssccq VALUES ('2421', '1527559184', '20180529024', '5,4,2,5,1');
INSERT INTO ac_data_ssccq VALUES ('2424', '1527857148', '20180601088', '9,8,7,7,2');
INSERT INTO ac_data_ssccq VALUES ('2425', '1527857410', '20180601089', '8,1,1,0,6');
INSERT INTO ac_data_ssccq VALUES ('2426', '1527858010', '20180601090', '9,6,3,0,7');
INSERT INTO ac_data_ssccq VALUES ('2427', '1527858588', '20180601091', '1,2,4,6,2');
INSERT INTO ac_data_ssccq VALUES ('2430', '1527859210', '20180601092', '6,8,4,2,7');
INSERT INTO ac_data_ssccq VALUES ('2431', '1527859810', '20180601093', '6,7,2,0,1');
INSERT INTO ac_data_ssccq VALUES ('2433', '1527860540', '20180601094', '6,3,0,2,0');
INSERT INTO ac_data_ssccq VALUES ('2435', '1527861010', '20180601095', '9,7,9,3,1');
INSERT INTO ac_data_ssccq VALUES ('2436', '1527861469', '20180601096', '8,3,6,0,3');
INSERT INTO ac_data_ssccq VALUES ('2437', '1527861910', '20180601097', '8,0,8,7,8');
INSERT INTO ac_data_ssccq VALUES ('2438', '1527862210', '20180601098', '3,9,7,1,2');
INSERT INTO ac_data_ssccq VALUES ('2439', '1527862510', '20180601099', '8,0,6,6,3');
INSERT INTO ac_data_ssccq VALUES ('2440', '1527862810', '20180601100', '5,5,8,7,0');
INSERT INTO ac_data_ssccq VALUES ('2451', '1527862973', '20180601101', '5,5,7,9,2');
INSERT INTO ac_data_ssccq VALUES ('2470', '1527863260', '20180601102', '6,8,8,5,6');
INSERT INTO ac_data_ssccq VALUES ('2489', '1527863558', '20180601103', '4,8,4,4,4');
INSERT INTO ac_data_ssccq VALUES ('2509', '1527863861', '20180601104', '0,6,0,9,8');
INSERT INTO ac_data_ssccq VALUES ('2529', '1527864169', '20180601105', '3,1,0,4,7');
INSERT INTO ac_data_ssccq VALUES ('2549', '1527864474', '20180601106', '0,0,4,2,6');
INSERT INTO ac_data_ssccq VALUES ('2568', '1527864763', '20180601107', '3,5,4,6,5');
INSERT INTO ac_data_ssccq VALUES ('2588', '1527865066', '20180601108', '3,4,2,4,0');
INSERT INTO ac_data_ssccq VALUES ('2608', '1527865370', '20180601109', '3,9,1,7,8');
INSERT INTO ac_data_ssccq VALUES ('2627', '1527865660', '20180601110', '4,9,9,4,1');
INSERT INTO ac_data_ssccq VALUES ('2648', '1527865971', '20180601111', '2,0,8,0,5');
INSERT INTO ac_data_ssccq VALUES ('2667', '1527866260', '20180601112', '7,2,3,5,1');
INSERT INTO ac_data_ssccq VALUES ('2688', '1527866578', '20180601113', '9,4,8,2,3');
INSERT INTO ac_data_ssccq VALUES ('2702', '1527907528', '20180602028', '9,2,7,0,8');
INSERT INTO ac_data_ssccq VALUES ('2704', '1527907810', '20180602029', '2,9,4,7,8');
INSERT INTO ac_data_ssccq VALUES ('2705', '1527908410', '20180602030', '0,2,4,5,8');
INSERT INTO ac_data_ssccq VALUES ('2706', '1527908954', '20180602031', '1,0,5,9,0');
INSERT INTO ac_data_ssccq VALUES ('2712', '1527909610', '20180602032', '2,1,0,9,2');
INSERT INTO ac_data_ssccq VALUES ('2713', '1527910214', '20180602033', '0,0,5,8,4');
INSERT INTO ac_data_ssccq VALUES ('2715', '1527910810', '20180602034', '5,7,5,2,1');
INSERT INTO ac_data_ssccq VALUES ('2716', '1527911410', '20180602035', '2,9,3,6,0');
INSERT INTO ac_data_ssccq VALUES ('2718', '1527912010', '20180602036', '6,1,3,2,3');
INSERT INTO ac_data_ssccq VALUES ('2719', '1527912610', '20180602037', '9,5,4,9,5');
INSERT INTO ac_data_ssccq VALUES ('2720', '1527913210', '20180602038', '3,0,3,5,0');
INSERT INTO ac_data_ssccq VALUES ('2722', '1527913810', '20180602039', '0,8,3,6,7');
INSERT INTO ac_data_ssccq VALUES ('2723', '1527914410', '20180602040', '0,2,2,6,9');
INSERT INTO ac_data_ssccq VALUES ('2725', '1527915011', '20180602041', '4,9,0,4,1');
INSERT INTO ac_data_ssccq VALUES ('2726', '1527915610', '20180602042', '0,2,9,4,2');
INSERT INTO ac_data_ssccq VALUES ('2727', '1527916155', '20180602043', '6,7,0,5,4');
INSERT INTO ac_data_ssccq VALUES ('2733', '1527916814', '20180602044', '5,5,2,4,7');
INSERT INTO ac_data_ssccq VALUES ('2734', '1527917410', '20180602045', '8,8,8,0,5');
INSERT INTO ac_data_ssccq VALUES ('2736', '1527918010', '20180602046', '1,5,0,1,1');
INSERT INTO ac_data_ssccq VALUES ('2737', '1527918610', '20180602047', '7,1,2,7,6');
INSERT INTO ac_data_ssccq VALUES ('2739', '1527919210', '20180602048', '3,7,6,7,5');
INSERT INTO ac_data_ssccq VALUES ('2740', '1527919810', '20180602049', '9,5,3,4,0');
INSERT INTO ac_data_ssccq VALUES ('2741', '1527920411', '20180602050', '9,3,1,7,9');
INSERT INTO ac_data_ssccq VALUES ('2743', '1527921011', '20180602051', '3,7,9,3,0');
INSERT INTO ac_data_ssccq VALUES ('2744', '1527921612', '20180602052', '6,5,4,4,2');
INSERT INTO ac_data_ssccq VALUES ('2746', '1527922210', '20180602053', '6,6,7,9,7');
INSERT INTO ac_data_ssccq VALUES ('2747', '1527922810', '20180602054', '3,8,5,0,0');
INSERT INTO ac_data_ssccq VALUES ('2748', '1527923356', '20180602055', '8,5,5,2,3');
INSERT INTO ac_data_ssccq VALUES ('2754', '1527924010', '20180602056', '9,3,5,7,1');
INSERT INTO ac_data_ssccq VALUES ('2755', '1527924610', '20180602057', '5,9,6,0,3');
INSERT INTO ac_data_ssccq VALUES ('2757', '1527925210', '20180602058', '0,7,7,6,9');
INSERT INTO ac_data_ssccq VALUES ('2758', '1527925810', '20180602059', '9,0,0,4,2');
INSERT INTO ac_data_ssccq VALUES ('2760', '1527926410', '20180602060', '5,1,4,1,0');
INSERT INTO ac_data_ssccq VALUES ('2761', '1527927010', '20180602061', '8,0,6,0,0');
INSERT INTO ac_data_ssccq VALUES ('2762', '1527927610', '20180602062', '0,7,9,1,4');
INSERT INTO ac_data_ssccq VALUES ('2764', '1527928210', '20180602063', '0,0,1,2,3');
INSERT INTO ac_data_ssccq VALUES ('2765', '1527928810', '20180602064', '9,8,6,6,7');
INSERT INTO ac_data_ssccq VALUES ('2767', '1527929410', '20180602065', '7,5,7,4,4');
INSERT INTO ac_data_ssccq VALUES ('2768', '1527930010', '20180602066', '2,7,1,3,9');
INSERT INTO ac_data_ssccq VALUES ('2769', '1527930557', '20180602067', '4,5,3,4,4');
INSERT INTO ac_data_ssccq VALUES ('2775', '1527931210', '20180602068', '8,2,1,9,8');
INSERT INTO ac_data_ssccq VALUES ('2776', '1527931810', '20180602069', '1,9,1,8,7');
INSERT INTO ac_data_ssccq VALUES ('2778', '1527932411', '20180602070', '8,5,9,8,8');
INSERT INTO ac_data_ssccq VALUES ('2779', '1527933010', '20180602071', '0,8,2,2,7');
INSERT INTO ac_data_ssccq VALUES ('2781', '1527933610', '20180602072', '4,3,0,0,6');
INSERT INTO ac_data_ssccq VALUES ('2782', '1527934210', '20180602073', '1,3,3,0,9');
INSERT INTO ac_data_ssccq VALUES ('2783', '1527934810', '20180602074', '1,2,4,1,6');
INSERT INTO ac_data_ssccq VALUES ('2785', '1527935410', '20180602075', '9,1,9,0,8');
INSERT INTO ac_data_ssccq VALUES ('2786', '1527936010', '20180602076', '3,1,8,6,1');
INSERT INTO ac_data_ssccq VALUES ('2788', '1527936610', '20180602077', '2,6,8,4,4');
INSERT INTO ac_data_ssccq VALUES ('2789', '1527937210', '20180602078', '3,7,0,8,0');
INSERT INTO ac_data_ssccq VALUES ('2790', '1527937758', '20180602079', '7,8,8,7,2');
INSERT INTO ac_data_ssccq VALUES ('2796', '1527938410', '20180602080', '0,3,9,9,8');
INSERT INTO ac_data_ssccq VALUES ('2797', '1527939010', '20180602081', '7,7,1,6,4');
INSERT INTO ac_data_ssccq VALUES ('2799', '1527939610', '20180602082', '9,9,2,8,8');
INSERT INTO ac_data_ssccq VALUES ('2800', '1527940210', '20180602083', '0,5,7,4,2');
INSERT INTO ac_data_ssccq VALUES ('2802', '1527940810', '20180602084', '9,2,5,4,0');
INSERT INTO ac_data_ssccq VALUES ('2803', '1527941410', '20180602085', '4,1,8,6,3');
INSERT INTO ac_data_ssccq VALUES ('2804', '1527942010', '20180602086', '2,6,5,6,8');
INSERT INTO ac_data_ssccq VALUES ('2806', '1527942610', '20180602087', '3,1,9,8,5');
INSERT INTO ac_data_ssccq VALUES ('2807', '1527943211', '20180602088', '3,7,4,5,3');
INSERT INTO ac_data_ssccq VALUES ('2809', '1527943810', '20180602089', '5,5,0,2,0');
INSERT INTO ac_data_ssccq VALUES ('2810', '1527944412', '20180602090', '0,8,7,2,6');
INSERT INTO ac_data_ssccq VALUES ('2811', '1527944960', '20180602091', '2,1,5,5,9');
INSERT INTO ac_data_ssccq VALUES ('2816', '1527945610', '20180602092', '1,7,4,3,1');
INSERT INTO ac_data_ssccq VALUES ('2817', '1527946210', '20180602093', '9,4,8,9,2');
INSERT INTO ac_data_ssccq VALUES ('2819', '1527946812', '20180602094', '0,8,2,2,6');
INSERT INTO ac_data_ssccq VALUES ('2820', '1527947410', '20180602095', '6,8,8,4,8');
INSERT INTO ac_data_ssccq VALUES ('2822', '1527948010', '20180602096', '2,5,7,1,5');
INSERT INTO ac_data_ssccq VALUES ('2823', '1527948310', '20180602097', '9,3,1,8,4');
INSERT INTO ac_data_ssccq VALUES ('2824', '1527948610', '20180602098', '7,3,6,0,5');
INSERT INTO ac_data_ssccq VALUES ('2825', '1527948910', '20180602099', '4,4,9,4,2');
INSERT INTO ac_data_ssccq VALUES ('2826', '1527949210', '20180602100', '3,2,1,7,0');
INSERT INTO ac_data_ssccq VALUES ('2837', '1527949372', '20180602101', '7,4,4,9,2');
INSERT INTO ac_data_ssccq VALUES ('2857', '1527949674', '20180602102', '0,9,5,8,2');
INSERT INTO ac_data_ssccq VALUES ('2876', '1527949964', '20180602103', '9,9,2,6,4');
INSERT INTO ac_data_ssccq VALUES ('2895', '1527950264', '20180602104', '4,6,6,8,6');
INSERT INTO ac_data_ssccq VALUES ('2915', '1527950566', '20180602105', '9,3,6,6,5');
INSERT INTO ac_data_ssccq VALUES ('2936', '1527950872', '20180602106', '7,6,4,6,9');
INSERT INTO ac_data_ssccq VALUES ('2956', '1527951175', '20180602107', '9,5,1,5,6');
INSERT INTO ac_data_ssccq VALUES ('2975', '1527951462', '20180602108', '1,4,7,9,0');
INSERT INTO ac_data_ssccq VALUES ('2995', '1527951767', '20180602109', '9,9,2,8,9');
INSERT INTO ac_data_ssccq VALUES ('3014', '1527952075', '20180602110', '5,4,2,7,3');
INSERT INTO ac_data_ssccq VALUES ('3032', '1527989892', '20180603023', '8,0,2,6,8');
INSERT INTO ac_data_ssccq VALUES ('3034', '1527991210', '20180603024', '8,9,4,8,6');
INSERT INTO ac_data_ssccq VALUES ('3036', '1527991810', '20180603025', '0,8,0,1,3');
INSERT INTO ac_data_ssccq VALUES ('3037', '1527992410', '20180603026', '6,5,7,3,8');
INSERT INTO ac_data_ssccq VALUES ('3039', '1527993010', '20180603027', '6,0,1,4,2');
INSERT INTO ac_data_ssccq VALUES ('3040', '1527993610', '20180603028', '7,4,9,7,2');
INSERT INTO ac_data_ssccq VALUES ('3041', '1527994198', '20180603029', '4,0,7,6,5');
INSERT INTO ac_data_ssccq VALUES ('3043', '1527994810', '20180603030', '7,8,1,2,1');
INSERT INTO ac_data_ssccq VALUES ('3044', '1527995410', '20180603031', '0,6,1,5,4');
INSERT INTO ac_data_ssccq VALUES ('3046', '1527996010', '20180603032', '4,0,5,4,5');
INSERT INTO ac_data_ssccq VALUES ('3047', '1527996611', '20180603033', '4,5,7,6,5');
INSERT INTO ac_data_ssccq VALUES ('3048', '1527997079', '20180603034', '2,9,2,4,5');
INSERT INTO ac_data_ssccq VALUES ('3061', '1527997810', '20180603035', '6,2,0,4,3');
INSERT INTO ac_data_ssccq VALUES ('3062', '1527998410', '20180603036', '6,2,9,6,9');
INSERT INTO ac_data_ssccq VALUES ('3064', '1527999010', '20180603037', '4,2,8,8,0');
INSERT INTO ac_data_ssccq VALUES ('3065', '1527999610', '20180603038', '1,1,5,3,4');
INSERT INTO ac_data_ssccq VALUES ('3067', '1528000210', '20180603039', '4,2,8,6,1');
INSERT INTO ac_data_ssccq VALUES ('3068', '1528000810', '20180603040', '1,2,5,2,8');
INSERT INTO ac_data_ssccq VALUES ('3069', '1528001399', '20180603041', '8,7,3,4,6');
INSERT INTO ac_data_ssccq VALUES ('3071', '1528002011', '20180603042', '6,4,3,2,4');
INSERT INTO ac_data_ssccq VALUES ('3072', '1528002610', '20180603043', '0,1,8,7,1');
INSERT INTO ac_data_ssccq VALUES ('3074', '1528003210', '20180603044', '3,1,2,4,4');
INSERT INTO ac_data_ssccq VALUES ('3075', '1528003810', '20180603045', '4,0,5,1,4');
INSERT INTO ac_data_ssccq VALUES ('3076', '1528004280', '20180603046', '6,5,4,4,4');
INSERT INTO ac_data_ssccq VALUES ('3089', '1528005010', '20180603047', '8,8,3,7,9');
INSERT INTO ac_data_ssccq VALUES ('3090', '1528005610', '20180603048', '4,4,3,7,0');
INSERT INTO ac_data_ssccq VALUES ('3092', '1528006210', '20180603049', '7,4,7,0,5');
INSERT INTO ac_data_ssccq VALUES ('3093', '1528006810', '20180603050', '3,3,2,9,6');
INSERT INTO ac_data_ssccq VALUES ('3095', '1528007411', '20180603051', '8,0,7,1,7');
INSERT INTO ac_data_ssccq VALUES ('3096', '1528008010', '20180603052', '9,0,5,6,8');
INSERT INTO ac_data_ssccq VALUES ('3097', '1528008601', '20180603053', '9,2,2,3,5');
INSERT INTO ac_data_ssccq VALUES ('3098', '1528009210', '20180603054', '6,3,7,7,1');
INSERT INTO ac_data_ssccq VALUES ('3099', '1528009810', '20180603055', '6,5,7,1,9');
INSERT INTO ac_data_ssccq VALUES ('3101', '1528010410', '20180603056', '3,6,1,5,9');
INSERT INTO ac_data_ssccq VALUES ('3102', '1528011010', '20180603057', '6,2,8,6,8');
INSERT INTO ac_data_ssccq VALUES ('3103', '1528011481', '20180603058', '8,4,9,4,4');
INSERT INTO ac_data_ssccq VALUES ('3116', '1528012210', '20180603059', '3,1,3,3,4');
INSERT INTO ac_data_ssccq VALUES ('3117', '1528012810', '20180603060', '1,8,2,2,6');
INSERT INTO ac_data_ssccq VALUES ('3119', '1528013411', '20180603061', '1,2,9,7,4');
INSERT INTO ac_data_ssccq VALUES ('3120', '1528014010', '20180603062', '7,3,7,0,9');
INSERT INTO ac_data_ssccq VALUES ('3122', '1528014610', '20180603063', '6,8,7,7,2');
INSERT INTO ac_data_ssccq VALUES ('3123', '1528015210', '20180603064', '2,5,4,7,0');
INSERT INTO ac_data_ssccq VALUES ('3124', '1528015802', '20180603065', '4,6,1,7,5');
INSERT INTO ac_data_ssccq VALUES ('3125', '1528016410', '20180603066', '9,1,6,5,6');
INSERT INTO ac_data_ssccq VALUES ('3126', '1528017010', '20180603067', '6,2,4,2,9');
INSERT INTO ac_data_ssccq VALUES ('3128', '1528017610', '20180603068', '0,3,9,6,0');
INSERT INTO ac_data_ssccq VALUES ('3129', '1528018210', '20180603069', '1,2,7,8,6');
INSERT INTO ac_data_ssccq VALUES ('3130', '1528018682', '20180603070', '7,6,8,3,6');
INSERT INTO ac_data_ssccq VALUES ('3143', '1528019410', '20180603071', '0,7,7,3,6');
INSERT INTO ac_data_ssccq VALUES ('3144', '1528020010', '20180603072', '8,5,9,2,7');
INSERT INTO ac_data_ssccq VALUES ('3146', '1528020610', '20180603073', '4,5,6,4,2');
INSERT INTO ac_data_ssccq VALUES ('3147', '1528021210', '20180603074', '6,4,5,9,7');
INSERT INTO ac_data_ssccq VALUES ('3149', '1528021810', '20180603075', '3,6,8,6,3');
INSERT INTO ac_data_ssccq VALUES ('3150', '1528022410', '20180603076', '3,3,2,7,5');
INSERT INTO ac_data_ssccq VALUES ('3151', '1528023003', '20180603077', '0,6,3,0,5');
INSERT INTO ac_data_ssccq VALUES ('3152', '1528023611', '20180603078', '6,3,8,9,0');
INSERT INTO ac_data_ssccq VALUES ('3153', '1528024210', '20180603079', '3,5,5,5,6');
INSERT INTO ac_data_ssccq VALUES ('3155', '1528024810', '20180603080', '3,5,0,4,4');
INSERT INTO ac_data_ssccq VALUES ('3156', '1528025410', '20180603081', '3,1,8,0,5');
INSERT INTO ac_data_ssccq VALUES ('3157', '1528025884', '20180603082', '9,8,2,3,9');
INSERT INTO ac_data_ssccq VALUES ('3169', '1528026610', '20180603083', '3,5,7,4,6');
INSERT INTO ac_data_ssccq VALUES ('3170', '1528027210', '20180603084', '6,8,6,4,6');
INSERT INTO ac_data_ssccq VALUES ('3172', '1528027810', '20180603085', '9,2,0,6,8');
INSERT INTO ac_data_ssccq VALUES ('3173', '1528028410', '20180603086', '1,6,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('3175', '1528029010', '20180603087', '1,9,8,4,2');
INSERT INTO ac_data_ssccq VALUES ('3176', '1528029610', '20180603088', '9,6,8,8,0');
INSERT INTO ac_data_ssccq VALUES ('3177', '1528030204', '20180603089', '7,2,8,1,0');
INSERT INTO ac_data_ssccq VALUES ('3178', '1528030811', '20180603090', '8,8,0,8,6');
INSERT INTO ac_data_ssccq VALUES ('3179', '1528031410', '20180603091', '0,6,8,4,7');
INSERT INTO ac_data_ssccq VALUES ('3181', '1528042881', '20180604004', '4,5,1,8,6');
INSERT INTO ac_data_ssccq VALUES ('3182', '1528043110', '20180604005', '9,9,3,1,5');
INSERT INTO ac_data_ssccq VALUES ('3183', '1528043410', '20180604006', '5,9,8,4,5');
INSERT INTO ac_data_ssccq VALUES ('3184', '1528043710', '20180604007', '4,4,3,7,1');
INSERT INTO ac_data_ssccq VALUES ('3185', '1528044010', '20180604008', '9,6,3,8,7');
INSERT INTO ac_data_ssccq VALUES ('3186', '1528044310', '20180604009', '5,6,7,2,1');
INSERT INTO ac_data_ssccq VALUES ('3188', '1528044610', '20180604010', '0,6,9,8,9');
INSERT INTO ac_data_ssccq VALUES ('3189', '1528044910', '20180604011', '0,5,3,5,5');
INSERT INTO ac_data_ssccq VALUES ('3190', '1528045210', '20180604012', '6,1,8,4,7');
INSERT INTO ac_data_ssccq VALUES ('3191', '1528045510', '20180604013', '3,5,4,5,9');
INSERT INTO ac_data_ssccq VALUES ('3192', '1528045761', '20180604014', '0,3,3,3,5');
INSERT INTO ac_data_ssccq VALUES ('3193', '1528074968', '20180604023', '1,5,1,0,8');
INSERT INTO ac_data_ssccq VALUES ('3195', '1528077610', '20180604024', '6,6,4,0,3');
INSERT INTO ac_data_ssccq VALUES ('3197', '1528078210', '20180604025', '7,9,1,4,1');
INSERT INTO ac_data_ssccq VALUES ('3198', '1528078810', '20180604026', '1,6,8,9,6');
INSERT INTO ac_data_ssccq VALUES ('3199', '1528079289', '20180604027', '2,1,0,2,4');
INSERT INTO ac_data_ssccq VALUES ('3200', '1529827658', '20180624061', '6,9,6,2,9');
INSERT INTO ac_data_ssccq VALUES ('3215', '1529828410', '20180624062', '1,2,0,9,8');
INSERT INTO ac_data_ssccq VALUES ('3216', '1529829010', '20180624063', '0,9,2,7,8');
INSERT INTO ac_data_ssccq VALUES ('3218', '1529829610', '20180624064', '2,3,4,7,2');
INSERT INTO ac_data_ssccq VALUES ('3219', '1529830210', '20180624065', '3,5,8,9,7');
INSERT INTO ac_data_ssccq VALUES ('3221', '1529830810', '20180624066', '3,8,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('3222', '1529831410', '20180624067', '8,2,3,3,4');
INSERT INTO ac_data_ssccq VALUES ('3223', '1529831979', '20180624068', '4,4,7,9,9');
INSERT INTO ac_data_ssccq VALUES ('3227', '1529832610', '20180624069', '8,8,4,3,1');
INSERT INTO ac_data_ssccq VALUES ('3228', '1529833210', '20180624070', '5,2,6,6,8');
INSERT INTO ac_data_ssccq VALUES ('3230', '1529833811', '20180624071', '7,2,4,4,5');
INSERT INTO ac_data_ssccq VALUES ('3231', '1529834410', '20180624072', '0,9,3,6,7');
INSERT INTO ac_data_ssccq VALUES ('3232', '1529834860', '20180624073', '0,6,6,3,5');
INSERT INTO ac_data_ssccq VALUES ('3247', '1529835611', '20180624074', '2,5,3,9,2');
INSERT INTO ac_data_ssccq VALUES ('3248', '1529836210', '20180624075', '8,4,6,2,9');
INSERT INTO ac_data_ssccq VALUES ('3250', '1529836810', '20180624076', '0,4,8,1,6');
INSERT INTO ac_data_ssccq VALUES ('3251', '1529837411', '20180624077', '8,8,1,9,8');
INSERT INTO ac_data_ssccq VALUES ('3253', '1529838010', '20180624078', '2,6,0,1,6');
INSERT INTO ac_data_ssccq VALUES ('3254', '1529838610', '20180624079', '8,9,6,1,6');
INSERT INTO ac_data_ssccq VALUES ('3255', '1529839181', '20180624080', '1,1,0,1,8');
INSERT INTO ac_data_ssccq VALUES ('3258', '1529839810', '20180624081', '1,8,1,0,8');
INSERT INTO ac_data_ssccq VALUES ('3259', '1529840410', '20180624082', '0,8,2,6,8');
INSERT INTO ac_data_ssccq VALUES ('3261', '1529841011', '20180624083', '0,6,1,4,5');
INSERT INTO ac_data_ssccq VALUES ('3262', '1529841610', '20180624084', '4,4,3,8,8');
INSERT INTO ac_data_ssccq VALUES ('3263', '1529842062', '20180624085', '3,4,4,4,4');
INSERT INTO ac_data_ssccq VALUES ('3278', '1529842810', '20180624086', '9,1,1,8,9');
INSERT INTO ac_data_ssccq VALUES ('3279', '1529843410', '20180624087', '9,1,9,1,0');
INSERT INTO ac_data_ssccq VALUES ('3281', '1529844010', '20180624088', '5,5,5,1,9');
INSERT INTO ac_data_ssccq VALUES ('3282', '1529844610', '20180624089', '1,4,8,3,5');
INSERT INTO ac_data_ssccq VALUES ('3284', '1529845210', '20180624090', '5,1,8,8,5');
INSERT INTO ac_data_ssccq VALUES ('3285', '1529845810', '20180624091', '6,7,9,9,2');
INSERT INTO ac_data_ssccq VALUES ('3286', '1529846383', '20180624092', '3,6,6,9,1');
INSERT INTO ac_data_ssccq VALUES ('3289', '1529847010', '20180624093', '6,6,6,7,7');
INSERT INTO ac_data_ssccq VALUES ('3290', '1529847610', '20180624094', '6,6,6,7,5');
INSERT INTO ac_data_ssccq VALUES ('3292', '1529848210', '20180624095', '6,7,6,5,5');
INSERT INTO ac_data_ssccq VALUES ('3293', '1529848810', '20180624096', '4,0,1,9,8');
INSERT INTO ac_data_ssccq VALUES ('3294', '1529849110', '20180624097', '4,1,2,4,0');
INSERT INTO ac_data_ssccq VALUES ('3295', '1529849264', '20180624098', '0,4,1,6,5');
INSERT INTO ac_data_ssccq VALUES ('3296', '1529849710', '20180624099', '9,7,5,6,0');
INSERT INTO ac_data_ssccq VALUES ('3297', '1529850011', '20180624100', '1,1,7,8,0');
INSERT INTO ac_data_ssccq VALUES ('3302', '1529850086', '20180624101', '4,8,1,8,2');
INSERT INTO ac_data_ssccq VALUES ('3322', '1529850389', '20180624102', '6,6,3,6,5');
INSERT INTO ac_data_ssccq VALUES ('3342', '1529850692', '20180624103', '2,0,7,9,6');
INSERT INTO ac_data_ssccq VALUES ('3361', '1529850978', '20180624104', '8,7,2,9,5');
INSERT INTO ac_data_ssccq VALUES ('3381', '1529851281', '20180624105', '3,7,2,8,3');
INSERT INTO ac_data_ssccq VALUES ('3401', '1529851583', '20180624106', '0,3,9,2,8');
INSERT INTO ac_data_ssccq VALUES ('3421', '1529851886', '20180624107', '8,0,8,0,5');
INSERT INTO ac_data_ssccq VALUES ('3441', '1529852191', '20180624108', '1,5,3,8,9');
INSERT INTO ac_data_ssccq VALUES ('3461', '1529852493', '20180624109', '3,7,0,3,9');
INSERT INTO ac_data_ssccq VALUES ('3481', '1529852798', '20180624110', '0,1,8,7,5');
INSERT INTO ac_data_ssccq VALUES ('3500', '1529853086', '20180624111', '0,4,9,9,8');
INSERT INTO ac_data_ssccq VALUES ('3520', '1529853388', '20180624112', '9,3,2,3,4');
INSERT INTO ac_data_ssccq VALUES ('3540', '1529853691', '20180624113', '0,9,5,0,5');
INSERT INTO ac_data_ssccq VALUES ('3559', '1529853979', '20180624114', '3,3,7,2,9');
INSERT INTO ac_data_ssccq VALUES ('3579', '1529854281', '20180624115', '9,9,5,4,6');
INSERT INTO ac_data_ssccq VALUES ('3599', '1529896750', '20180625032', '9,7,3,3,3');
INSERT INTO ac_data_ssccq VALUES ('3605', '1529913711', '20180625060', '1,9,9,6,8');
INSERT INTO ac_data_ssccq VALUES ('3606', '1529914210', '20180625061', '1,4,0,0,4');
INSERT INTO ac_data_ssccq VALUES ('3607', '1529914810', '20180625062', '0,7,8,4,6');
INSERT INTO ac_data_ssccq VALUES ('3609', '1529915410', '20180625063', '6,8,6,2,5');
INSERT INTO ac_data_ssccq VALUES ('3610', '1529916010', '20180625064', '4,8,1,5,8');
INSERT INTO ac_data_ssccq VALUES ('3611', '1529916592', '20180625065', '8,9,9,2,8');
INSERT INTO ac_data_ssccq VALUES ('3613', '1529917210', '20180625066', '6,8,5,5,3');
INSERT INTO ac_data_ssccq VALUES ('3614', '1529917810', '20180625067', '2,8,6,9,8');
INSERT INTO ac_data_ssccq VALUES ('3615', '1529919309', '20180625069', '5,4,8,4,1');
INSERT INTO ac_data_ssccq VALUES ('3616', '1529919610', '20180625070', '9,8,5,9,2');
INSERT INTO ac_data_ssccq VALUES ('3617', '1529920210', '20180625071', '2,2,7,1,3');
INSERT INTO ac_data_ssccq VALUES ('3618', '1529920749', '20180625072', '4,1,4,0,4');
INSERT INTO ac_data_ssccq VALUES ('3624', '1529921361', '20180625073', '5,0,2,0,4');
INSERT INTO ac_data_ssccq VALUES ('3629', '1529922010', '20180625074', '2,1,2,2,4');
INSERT INTO ac_data_ssccq VALUES ('3630', '1529922610', '20180625075', '0,6,4,6,8');
INSERT INTO ac_data_ssccq VALUES ('3632', '1529923210', '20180625076', '7,8,0,7,6');
INSERT INTO ac_data_ssccq VALUES ('3633', '1529923811', '20180625077', '0,9,8,2,1');
INSERT INTO ac_data_ssccq VALUES ('3634', '1529924242', '20180625078', '7,4,5,7,2');
INSERT INTO ac_data_ssccq VALUES ('3651', '1529925010', '20180625079', '8,5,7,1,5');
INSERT INTO ac_data_ssccq VALUES ('3652', '1529925610', '20180625080', '0,1,0,1,5');
INSERT INTO ac_data_ssccq VALUES ('3654', '1529926210', '20180625081', '6,1,2,6,6');
INSERT INTO ac_data_ssccq VALUES ('3655', '1529926810', '20180625082', '9,8,9,7,8');
INSERT INTO ac_data_ssccq VALUES ('3657', '1529927410', '20180625083', '3,6,6,5,4');
INSERT INTO ac_data_ssccq VALUES ('3658', '1529928010', '20180625084', '7,3,8,0,7');
INSERT INTO ac_data_ssccq VALUES ('3659', '1529928564', '20180625085', '1,8,3,2,0');
INSERT INTO ac_data_ssccq VALUES ('3664', '1529929211', '20180625086', '1,4,3,3,0');
INSERT INTO ac_data_ssccq VALUES ('3665', '1529929810', '20180625087', '4,2,8,6,2');
INSERT INTO ac_data_ssccq VALUES ('3667', '1529930410', '20180625088', '2,7,7,9,3');
INSERT INTO ac_data_ssccq VALUES ('3668', '1529931013', '20180625089', '9,4,1,7,0');
INSERT INTO ac_data_ssccq VALUES ('3669', '1529931444', '20180625090', '0,7,9,6,3');
INSERT INTO ac_data_ssccq VALUES ('3686', '1529932210', '20180625091', '1,9,1,1,6');
INSERT INTO ac_data_ssccq VALUES ('3687', '1529932810', '20180625092', '5,5,5,5,8');
INSERT INTO ac_data_ssccq VALUES ('3689', '1529933410', '20180625093', '4,3,0,6,0');
INSERT INTO ac_data_ssccq VALUES ('3690', '1529934010', '20180625094', '1,5,6,7,3');
INSERT INTO ac_data_ssccq VALUES ('3692', '1529934610', '20180625095', '9,2,3,8,3');
INSERT INTO ac_data_ssccq VALUES ('3693', '1529935210', '20180625096', '2,1,2,0,0');
INSERT INTO ac_data_ssccq VALUES ('3694', '1529935510', '20180625097', '4,4,4,5,9');
INSERT INTO ac_data_ssccq VALUES ('3695', '1529935766', '20180625098', '9,1,4,1,0');
INSERT INTO ac_data_ssccq VALUES ('3696', '1529936111', '20180625099', '5,9,6,0,5');
INSERT INTO ac_data_ssccq VALUES ('3697', '1529936410', '20180625100', '2,1,4,5,6');
INSERT INTO ac_data_ssccq VALUES ('3702', '1529936485', '20180625101', '1,8,7,0,8');
INSERT INTO ac_data_ssccq VALUES ('3721', '1529936773', '20180625102', '2,2,6,3,5');
INSERT INTO ac_data_ssccq VALUES ('3741', '1529937076', '20180625103', '6,2,5,0,4');
INSERT INTO ac_data_ssccq VALUES ('3761', '1529937373', '20180625104', '5,4,1,8,4');
INSERT INTO ac_data_ssccq VALUES ('3781', '1529937680', '20180625105', '0,5,0,7,3');
INSERT INTO ac_data_ssccq VALUES ('3801', '1529937983', '20180625106', '0,9,7,1,9');
INSERT INTO ac_data_ssccq VALUES ('3821', '1529938285', '20180625107', '0,3,4,1,1');
INSERT INTO ac_data_ssccq VALUES ('3840', '1529938573', '20180625108', '2,2,1,8,8');
INSERT INTO ac_data_ssccq VALUES ('3860', '1529938875', '20180625109', '2,3,0,6,0');
INSERT INTO ac_data_ssccq VALUES ('3880', '1529939179', '20180625110', '7,7,4,3,6');
INSERT INTO ac_data_ssccq VALUES ('3900', '1529939484', '20180625111', '1,1,1,7,4');
INSERT INTO ac_data_ssccq VALUES ('3920', '1529939786', '20180625112', '6,9,9,1,4');
INSERT INTO ac_data_ssccq VALUES ('3940', '1529940088', '20180625113', '2,5,5,4,8');
INSERT INTO ac_data_ssccq VALUES ('3959', '1529940375', '20180625114', '2,3,9,4,4');
INSERT INTO ac_data_ssccq VALUES ('3979', '1529940679', '20180625115', '7,8,5,2,1');
INSERT INTO ac_data_ssccq VALUES ('3995', '1529940986', '20180625116', '7,9,4,8,7');
INSERT INTO ac_data_ssccq VALUES ('4014', '1529941274', '20180625117', '6,1,3,8,5');
INSERT INTO ac_data_ssccq VALUES ('4034', '1529941574', '20180625118', '6,3,5,4,1');
INSERT INTO ac_data_ssccq VALUES ('4055', '1529941892', '20180625119', '2,0,3,8,9');
INSERT INTO ac_data_ssccq VALUES ('4074', '1529942180', '20180625120', '5,7,2,5,2');
INSERT INTO ac_data_ssccq VALUES ('4097', '1529942490', '20180626001', '3,9,4,9,9');
INSERT INTO ac_data_ssccq VALUES ('4098', '1529942969', '20180626002', '1,3,9,0,5');
INSERT INTO ac_data_ssccq VALUES ('4099', '1529943310', '20180626003', '2,9,6,9,6');
INSERT INTO ac_data_ssccq VALUES ('4100', '1529943611', '20180626004', '8,1,3,4,1');
INSERT INTO ac_data_ssccq VALUES ('4101', '1529943910', '20180626005', '1,6,8,4,2');
INSERT INTO ac_data_ssccq VALUES ('4102', '1529944210', '20180626006', '6,2,3,9,7');
INSERT INTO ac_data_ssccq VALUES ('4103', '1529944409', '20180626007', '8,7,1,2,0');
INSERT INTO ac_data_ssccq VALUES ('4104', '1529944811', '20180626008', '2,5,0,0,9');
INSERT INTO ac_data_ssccq VALUES ('4105', '1529945110', '20180626009', '8,3,8,5,5');
INSERT INTO ac_data_ssccq VALUES ('4106', '1529945410', '20180626010', '9,0,9,8,6');
INSERT INTO ac_data_ssccq VALUES ('4107', '1529945710', '20180626011', '9,2,9,0,3');
INSERT INTO ac_data_ssccq VALUES ('4108', '1529945850', '20180626012', '7,4,0,0,1');
INSERT INTO ac_data_ssccq VALUES ('4109', '1529946310', '20180626013', '8,5,8,3,9');
INSERT INTO ac_data_ssccq VALUES ('4110', '1529946610', '20180626014', '2,0,7,4,0');
INSERT INTO ac_data_ssccq VALUES ('4111', '1529946910', '20180626015', '6,8,5,5,4');
INSERT INTO ac_data_ssccq VALUES ('4112', '1529947211', '20180626016', '6,6,3,7,1');
INSERT INTO ac_data_ssccq VALUES ('4113', '1529947290', '20180626017', '2,3,5,8,0');
INSERT INTO ac_data_ssccq VALUES ('4114', '1529947810', '20180626018', '4,5,7,2,8');
INSERT INTO ac_data_ssccq VALUES ('4115', '1529948110', '20180626019', '3,4,5,9,4');
INSERT INTO ac_data_ssccq VALUES ('4116', '1529948411', '20180626020', '0,1,5,3,6');
INSERT INTO ac_data_ssccq VALUES ('4117', '1529948710', '20180626021', '6,9,5,7,8');
INSERT INTO ac_data_ssccq VALUES ('4119', '1529949010', '20180626022', '1,5,4,6,4');
INSERT INTO ac_data_ssccq VALUES ('4120', '1529949311', '20180626023', '6,5,7,4,6');
INSERT INTO ac_data_ssccq VALUES ('4123', '1529978881', '20180626025', '5,7,1,3,3');
INSERT INTO ac_data_ssccq VALUES ('4136', '1529979610', '20180626026', '4,5,8,7,8');
INSERT INTO ac_data_ssccq VALUES ('4137', '1529980210', '20180626027', '1,8,0,9,5');
INSERT INTO ac_data_ssccq VALUES ('4139', '1529980810', '20180626028', '7,9,3,8,9');
INSERT INTO ac_data_ssccq VALUES ('4140', '1529982767', '20180626031', '3,9,6,9,8');
INSERT INTO ac_data_ssccq VALUES ('4142', '1529983210', '20180626032', '0,5,5,8,7');
INSERT INTO ac_data_ssccq VALUES ('4143', '1529983810', '20180626033', '4,7,4,1,7');
INSERT INTO ac_data_ssccq VALUES ('4144', '1529984177', '20180626034', '1,3,4,7,7');
INSERT INTO ac_data_ssccq VALUES ('4167', '1529985010', '20180626035', '6,0,9,7,8');
INSERT INTO ac_data_ssccq VALUES ('4168', '1529985610', '20180626036', '0,3,3,2,8');
INSERT INTO ac_data_ssccq VALUES ('4170', '1529986210', '20180626037', '0,6,4,7,7');
INSERT INTO ac_data_ssccq VALUES ('4171', '1529986810', '20180626038', '9,0,3,3,4');
INSERT INTO ac_data_ssccq VALUES ('4173', '1529987410', '20180626039', '4,0,1,0,9');
INSERT INTO ac_data_ssccq VALUES ('4174', '1529988010', '20180626040', '2,7,6,9,7');
INSERT INTO ac_data_ssccq VALUES ('4175', '1529988498', '20180626041', '9,7,2,0,5');
INSERT INTO ac_data_ssccq VALUES ('4186', '1529989210', '20180626042', '4,6,4,1,6');
INSERT INTO ac_data_ssccq VALUES ('4187', '1529989810', '20180626043', '3,4,6,8,6');
INSERT INTO ac_data_ssccq VALUES ('4189', '1529990410', '20180626044', '9,6,8,2,3');
INSERT INTO ac_data_ssccq VALUES ('4190', '1529991010', '20180626045', '6,9,1,6,9');
INSERT INTO ac_data_ssccq VALUES ('4191', '1529991381', '20180626046', '5,2,5,6,7');
INSERT INTO ac_data_ssccq VALUES ('4214', '1529992210', '20180626047', '6,5,6,3,7');
INSERT INTO ac_data_ssccq VALUES ('4215', '1529992810', '20180626048', '1,1,3,0,1');
INSERT INTO ac_data_ssccq VALUES ('4217', '1529993410', '20180626049', '8,8,7,1,2');
INSERT INTO ac_data_ssccq VALUES ('4218', '1529994010', '20180626050', '9,9,8,1,9');
INSERT INTO ac_data_ssccq VALUES ('4220', '1529994611', '20180626051', '5,5,7,1,4');
INSERT INTO ac_data_ssccq VALUES ('4221', '1529995211', '20180626052', '4,8,8,1,2');
INSERT INTO ac_data_ssccq VALUES ('4222', '1529995701', '20180626053', '4,6,7,7,2');
INSERT INTO ac_data_ssccq VALUES ('4233', '1529996410', '20180626054', '7,7,8,9,9');
INSERT INTO ac_data_ssccq VALUES ('4234', '1529997010', '20180626055', '8,0,6,8,7');
INSERT INTO ac_data_ssccq VALUES ('4236', '1529997610', '20180626056', '0,9,3,0,0');
INSERT INTO ac_data_ssccq VALUES ('4237', '1529998210', '20180626057', '4,1,2,3,4');
INSERT INTO ac_data_ssccq VALUES ('4238', '1529998583', '20180626058', '8,3,7,8,1');
INSERT INTO ac_data_ssccq VALUES ('4261', '1529999410', '20180626059', '9,3,1,6,1');
INSERT INTO ac_data_ssccq VALUES ('4262', '1530000010', '20180626060', '3,9,2,4,9');
INSERT INTO ac_data_ssccq VALUES ('4264', '1530000610', '20180626061', '9,2,2,9,4');
INSERT INTO ac_data_ssccq VALUES ('4265', '1530001210', '20180626062', '6,8,8,8,9');
INSERT INTO ac_data_ssccq VALUES ('4267', '1530001810', '20180626063', '7,5,0,9,3');
INSERT INTO ac_data_ssccq VALUES ('4268', '1530002411', '20180626064', '7,1,4,6,4');
INSERT INTO ac_data_ssccq VALUES ('4269', '1530002904', '20180626065', '1,3,7,0,2');
INSERT INTO ac_data_ssccq VALUES ('4280', '1530003610', '20180626066', '7,6,8,7,1');
INSERT INTO ac_data_ssccq VALUES ('4281', '1530005359', '20180626069', '0,8,4,9,7');
INSERT INTO ac_data_ssccq VALUES ('4287', '1530006010', '20180626070', '6,1,5,3,9');
INSERT INTO ac_data_ssccq VALUES ('4288', '1530006610', '20180626071', '2,6,2,4,5');
INSERT INTO ac_data_ssccq VALUES ('4290', '1530007528', '20180626072', '5,9,7,2,0');
INSERT INTO ac_data_ssccq VALUES ('4292', '1530007810', '20180626073', '7,1,9,8,1');
INSERT INTO ac_data_ssccq VALUES ('4293', '1530008318', '20180626074', '0,7,4,4,2');
INSERT INTO ac_data_ssccq VALUES ('4303', '1530009010', '20180626075', '4,7,7,7,7');
INSERT INTO ac_data_ssccq VALUES ('4304', '1530009610', '20180626076', '4,3,6,0,2');
INSERT INTO ac_data_ssccq VALUES ('4306', '1530010210', '20180626077', '5,3,9,1,4');
INSERT INTO ac_data_ssccq VALUES ('4307', '1530010810', '20180626078', '8,4,2,5,3');
INSERT INTO ac_data_ssccq VALUES ('4308', '1530011199', '20180626079', '1,9,0,5,6');
INSERT INTO ac_data_ssccq VALUES ('4329', '1530012010', '20180626080', '2,6,3,0,6');
INSERT INTO ac_data_ssccq VALUES ('4330', '1530012610', '20180626081', '8,2,2,0,9');
INSERT INTO ac_data_ssccq VALUES ('4332', '1530013210', '20180626082', '5,8,8,2,5');
INSERT INTO ac_data_ssccq VALUES ('4333', '1530013810', '20180626083', '3,9,7,0,3');
INSERT INTO ac_data_ssccq VALUES ('4335', '1530014410', '20180626084', '6,3,5,3,1');
INSERT INTO ac_data_ssccq VALUES ('4336', '1530015010', '20180626085', '1,6,2,0,5');
INSERT INTO ac_data_ssccq VALUES ('4337', '1530015520', '20180626086', '8,0,7,4,3');
INSERT INTO ac_data_ssccq VALUES ('4346', '1530016210', '20180626087', '1,3,7,6,7');
INSERT INTO ac_data_ssccq VALUES ('4347', '1530016811', '20180626088', '7,1,2,0,2');
INSERT INTO ac_data_ssccq VALUES ('4349', '1530017410', '20180626089', '3,2,8,7,7');
INSERT INTO ac_data_ssccq VALUES ('4350', '1530018010', '20180626090', '0,6,1,3,6');
INSERT INTO ac_data_ssccq VALUES ('4351', '1530018401', '20180626091', '4,8,3,2,0');
INSERT INTO ac_data_ssccq VALUES ('4371', '1530019210', '20180626092', '1,0,6,4,4');
INSERT INTO ac_data_ssccq VALUES ('4372', '1530019810', '20180626093', '7,6,2,3,1');
INSERT INTO ac_data_ssccq VALUES ('4374', '1530020410', '20180626094', '6,0,1,1,4');
INSERT INTO ac_data_ssccq VALUES ('4375', '1530021010', '20180626095', '3,8,0,9,4');
INSERT INTO ac_data_ssccq VALUES ('4377', '1530021610', '20180626096', '3,1,9,3,8');
INSERT INTO ac_data_ssccq VALUES ('4378', '1530021910', '20180626097', '4,0,8,7,2');
INSERT INTO ac_data_ssccq VALUES ('4379', '1530022210', '20180626098', '6,3,5,4,7');
INSERT INTO ac_data_ssccq VALUES ('4380', '1530022510', '20180626099', '3,9,4,2,7');
INSERT INTO ac_data_ssccq VALUES ('4381', '1530022723', '20180626100', '2,6,7,6,0');
INSERT INTO ac_data_ssccq VALUES ('4391', '1530022874', '20180626101', '5,7,2,1,5');
INSERT INTO ac_data_ssccq VALUES ('4411', '1530023177', '20180626102', '0,2,0,4,5');
INSERT INTO ac_data_ssccq VALUES ('4431', '1530023480', '20180626103', '2,3,4,7,8');
INSERT INTO ac_data_ssccq VALUES ('4450', '1530023767', '20180626104', '7,6,1,8,4');
INSERT INTO ac_data_ssccq VALUES ('4470', '1530024074', '20180626105', '1,5,4,1,1');
INSERT INTO ac_data_ssccq VALUES ('4490', '1530024375', '20180626106', '1,3,4,8,8');
INSERT INTO ac_data_ssccq VALUES ('4509', '1530024665', '20180626107', '4,6,3,9,3');
INSERT INTO ac_data_ssccq VALUES ('4530', '1530024983', '20180626108', '1,1,7,8,7');
INSERT INTO ac_data_ssccq VALUES ('4550', '1530025286', '20180626109', '9,1,0,4,0');
INSERT INTO ac_data_ssccq VALUES ('4569', '1530025573', '20180626110', '6,7,6,1,4');
INSERT INTO ac_data_ssccq VALUES ('4589', '1530025877', '20180626111', '2,5,0,1,0');
INSERT INTO ac_data_ssccq VALUES ('4609', '1530026179', '20180626112', '5,9,2,7,4');
INSERT INTO ac_data_ssccq VALUES ('4629', '1530026481', '20180626113', '9,3,8,2,5');
INSERT INTO ac_data_ssccq VALUES ('4648', '1530026769', '20180626114', '8,3,5,7,4');
INSERT INTO ac_data_ssccq VALUES ('4668', '1530027074', '20180626115', '3,7,0,4,9');
INSERT INTO ac_data_ssccq VALUES ('4688', '1530027382', '20180626116', '8,6,5,5,0');
INSERT INTO ac_data_ssccq VALUES ('4703', '1530027670', '20180626117', '2,8,3,0,5');
INSERT INTO ac_data_ssccq VALUES ('4723', '1530027972', '20180626118', '3,5,8,5,1');
INSERT INTO ac_data_ssccq VALUES ('4743', '1530028275', '20180626119', '4,3,9,9,5');
INSERT INTO ac_data_ssccq VALUES ('4764', '1530028591', '20180626120', '3,4,8,3,8');
INSERT INTO ac_data_ssccq VALUES ('4785', '1530028873', '20180627001', '1,7,6,5,6');
INSERT INTO ac_data_ssccq VALUES ('4786', '1530029410', '20180627002', '9,7,4,8,4');
INSERT INTO ac_data_ssccq VALUES ('4787', '1530029710', '20180627003', '0,1,4,1,1');
INSERT INTO ac_data_ssccq VALUES ('4788', '1530029926', '20180627004', '1,9,4,5,8');
INSERT INTO ac_data_ssccq VALUES ('4789', '1530030310', '20180627005', '8,8,1,0,9');
INSERT INTO ac_data_ssccq VALUES ('4790', '1530030610', '20180627006', '7,7,3,3,5');
INSERT INTO ac_data_ssccq VALUES ('4791', '1530030910', '20180627007', '8,3,8,9,0');
INSERT INTO ac_data_ssccq VALUES ('4792', '1530031210', '20180627008', '9,2,6,1,3');
INSERT INTO ac_data_ssccq VALUES ('4793', '1530031366', '20180627009', '7,3,1,1,5');
INSERT INTO ac_data_ssccq VALUES ('4794', '1530031811', '20180627010', '8,1,4,9,6');
INSERT INTO ac_data_ssccq VALUES ('4795', '1530032110', '20180627011', '3,0,0,6,1');
INSERT INTO ac_data_ssccq VALUES ('4796', '1530032410', '20180627012', '7,8,2,0,8');
INSERT INTO ac_data_ssccq VALUES ('4797', '1530032711', '20180627013', '1,0,1,9,7');
INSERT INTO ac_data_ssccq VALUES ('4798', '1530032807', '20180627014', '3,0,1,6,1');
INSERT INTO ac_data_ssccq VALUES ('4799', '1530033310', '20180627015', '3,0,2,7,0');
INSERT INTO ac_data_ssccq VALUES ('4800', '1530033610', '20180627016', '3,7,1,0,6');
INSERT INTO ac_data_ssccq VALUES ('4801', '1530033910', '20180627017', '6,7,3,6,2');
INSERT INTO ac_data_ssccq VALUES ('4802', '1530034210', '20180627018', '5,1,8,4,9');
INSERT INTO ac_data_ssccq VALUES ('4804', '1530034510', '20180627019', '7,0,7,6,0');
INSERT INTO ac_data_ssccq VALUES ('4805', '1530034811', '20180627020', '0,4,2,1,3');
INSERT INTO ac_data_ssccq VALUES ('4806', '1530035111', '20180627021', '7,5,1,8,3');
INSERT INTO ac_data_ssccq VALUES ('4807', '1530035410', '20180627022', '2,6,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('4808', '1530035688', '20180627023', '1,8,7,0,9');
INSERT INTO ac_data_ssccq VALUES ('4810', '1530359963', '20180630084', '6,3,9,8,5');
INSERT INTO ac_data_ssccq VALUES ('4815', '1530360610', '20180630085', '9,9,6,5,4');
INSERT INTO ac_data_ssccq VALUES ('4816', '1530361210', '20180630086', '9,4,7,6,4');
INSERT INTO ac_data_ssccq VALUES ('4818', '1530361810', '20180630087', '3,2,9,0,3');
INSERT INTO ac_data_ssccq VALUES ('4819', '1530362410', '20180630088', '1,0,3,2,1');
INSERT INTO ac_data_ssccq VALUES ('4820', '1530362844', '20180630089', '8,6,4,8,1');
INSERT INTO ac_data_ssccq VALUES ('4837', '1530363611', '20180630090', '9,9,7,2,4');
INSERT INTO ac_data_ssccq VALUES ('4838', '1530364210', '20180630091', '3,4,9,2,7');
INSERT INTO ac_data_ssccq VALUES ('4840', '1530364811', '20180630092', '5,8,5,0,0');
INSERT INTO ac_data_ssccq VALUES ('4841', '1530365410', '20180630093', '3,2,5,9,4');
INSERT INTO ac_data_ssccq VALUES ('4843', '1530366010', '20180630094', '9,2,7,5,4');
INSERT INTO ac_data_ssccq VALUES ('4844', '1530366610', '20180630095', '7,2,8,7,4');
INSERT INTO ac_data_ssccq VALUES ('4845', '1530367165', '20180630096', '2,8,4,8,5');
INSERT INTO ac_data_ssccq VALUES ('4846', '1530367510', '20180630097', '3,7,5,2,9');
INSERT INTO ac_data_ssccq VALUES ('4847', '1530367812', '20180630098', '0,6,2,9,0');
INSERT INTO ac_data_ssccq VALUES ('4848', '1530368110', '20180630099', '3,9,8,1,9');
INSERT INTO ac_data_ssccq VALUES ('4849', '1530368410', '20180630100', '9,2,3,1,4');
INSERT INTO ac_data_ssccq VALUES ('4852', '1530368456', '20180630101', '8,6,6,6,2');
INSERT INTO ac_data_ssccq VALUES ('4872', '1530368757', '20180630102', '7,3,9,9,2');
INSERT INTO ac_data_ssccq VALUES ('4891', '1530369048', '20180630103', '4,0,4,3,3');
INSERT INTO ac_data_ssccq VALUES ('4911', '1530369351', '20180630104', '5,6,7,9,0');
INSERT INTO ac_data_ssccq VALUES ('4931', '1530369654', '20180630105', '6,6,6,8,8');
INSERT INTO ac_data_ssccq VALUES ('4951', '1530369958', '20180630106', '9,9,3,1,4');
INSERT INTO ac_data_ssccq VALUES ('4971', '1530370259', '20180630107', '3,7,4,6,0');
INSERT INTO ac_data_ssccq VALUES ('4990', '1530370551', '20180630108', '5,6,3,7,1');
INSERT INTO ac_data_ssccq VALUES ('5010', '1530370853', '20180630109', '2,5,8,5,0');
INSERT INTO ac_data_ssccq VALUES ('5031', '1530371172', '20180630110', '4,9,3,3,0');
INSERT INTO ac_data_ssccq VALUES ('5050', '1530371462', '20180630111', '4,2,3,4,6');
INSERT INTO ac_data_ssccq VALUES ('5070', '1530371760', '20180630112', '5,6,9,9,8');
INSERT INTO ac_data_ssccq VALUES ('5072', '1530608425', '20180703066', '9,8,7,2,3');
INSERT INTO ac_data_ssccq VALUES ('5074', '1530608443', '20180630113', '1,2,3,4,5');
INSERT INTO ac_data_ssccq VALUES ('5075', '1530608758', '20180703067', '5,2,9,8,2');
INSERT INTO ac_data_ssccq VALUES ('5083', '1530773267', '20180705052', '2,0,1,9,7');
INSERT INTO ac_data_ssccq VALUES ('5087', '1530773461', '20180705053', '4,5,9,2,8');
INSERT INTO ac_data_ssccq VALUES ('5091', '1530774079', '20180705054', '8,4,7,7,0');
INSERT INTO ac_data_ssccq VALUES ('5094', '1530774669', '20180705055', '4,7,2,5,2');
INSERT INTO ac_data_ssccq VALUES ('5099', '1530775268', '20180705056', '4,8,5,6,2');
INSERT INTO ac_data_ssccq VALUES ('5103', '1530775864', '20180705057', '8,6,5,7,3');
INSERT INTO ac_data_ssccq VALUES ('5107', '1530776456', '20180705058', '3,1,4,2,8');
INSERT INTO ac_data_ssccq VALUES ('5111', '1530777067', '20180705059', '5,1,3,2,3');
INSERT INTO ac_data_ssccq VALUES ('5116', '1530777665', '20180705060', '8,0,5,3,2');
INSERT INTO ac_data_ssccq VALUES ('5119', '1530778260', '20180705061', '1,4,1,6,3');
INSERT INTO ac_data_ssccq VALUES ('5122', '1530778858', '20180705062', '1,6,8,2,8');
INSERT INTO ac_data_ssccq VALUES ('5127', '1530779468', '20180705063', '1,4,0,7,7');
INSERT INTO ac_data_ssccq VALUES ('5130', '1530780055', '20180705064', '0,0,0,2,7');
INSERT INTO ac_data_ssccq VALUES ('5134', '1530780654', '20180705065', '2,1,6,3,2');
INSERT INTO ac_data_ssccq VALUES ('5138', '1530781270', '20180705066', '1,2,4,0,2');
INSERT INTO ac_data_ssccq VALUES ('5142', '1530781865', '20180705067', '3,3,1,9,6');
INSERT INTO ac_data_ssccq VALUES ('5146', '1530782455', '20180705068', '9,2,7,5,8');
INSERT INTO ac_data_ssccq VALUES ('5150', '1530783065', '20180705069', '3,2,9,5,0');
INSERT INTO ac_data_ssccq VALUES ('5154', '1530783671', '20180705070', '1,2,6,3,6');
INSERT INTO ac_data_ssccq VALUES ('5156', '1530784257', '20180705071', '5,2,8,1,8');
INSERT INTO ac_data_ssccq VALUES ('5159', '1530784873', '20180705072', '8,6,1,0,5');
INSERT INTO ac_data_ssccq VALUES ('5162', '1530785463', '20180705073', '9,2,6,4,4');
INSERT INTO ac_data_ssccq VALUES ('5166', '1530786067', '20180705074', '8,1,5,8,6');
INSERT INTO ac_data_ssccq VALUES ('5170', '1530786671', '20180705075', '5,2,7,3,9');
INSERT INTO ac_data_ssccq VALUES ('5173', '1530787259', '20180705076', '9,1,4,6,6');
INSERT INTO ac_data_ssccq VALUES ('5177', '1530787858', '20180705077', '2,4,8,3,3');
INSERT INTO ac_data_ssccq VALUES ('5181', '1530788473', '20180705078', '9,8,1,6,3');
INSERT INTO ac_data_ssccq VALUES ('5184', '1530789080', '20180705079', '3,9,9,2,5');
INSERT INTO ac_data_ssccq VALUES ('5188', '1530789656', '20180705080', '5,5,0,7,2');
INSERT INTO ac_data_ssccq VALUES ('5191', '1530790256', '20180705081', '0,5,7,9,4');
INSERT INTO ac_data_ssccq VALUES ('5195', '1530790868', '20180705082', '1,3,9,3,5');
INSERT INTO ac_data_ssccq VALUES ('5198', '1530791459', '20180705083', '8,6,9,1,3');
INSERT INTO ac_data_ssccq VALUES ('5201', '1530792070', '20180705084', '0,4,7,6,0');
INSERT INTO ac_data_ssccq VALUES ('5204', '1530792664', '20180705085', '1,3,2,2,0');
INSERT INTO ac_data_ssccq VALUES ('5207', '1530793265', '20180705086', '8,2,5,9,6');
INSERT INTO ac_data_ssccq VALUES ('5211', '1530793853', '20180705087', '3,4,8,3,1');
INSERT INTO ac_data_ssccq VALUES ('5214', '1530794468', '20180705088', '4,1,4,1,7');
INSERT INTO ac_data_ssccq VALUES ('5219', '1530795073', '20180705089', '0,3,6,9,1');
INSERT INTO ac_data_ssccq VALUES ('5223', '1530795665', '20180705090', '2,4,0,2,6');
INSERT INTO ac_data_ssccq VALUES ('5226', '1530796267', '20180705091', '9,8,8,2,8');
INSERT INTO ac_data_ssccq VALUES ('5231', '1530796871', '20180705092', '7,7,6,0,0');
INSERT INTO ac_data_ssccq VALUES ('5234', '1530797458', '20180705093', '3,3,6,8,3');
INSERT INTO ac_data_ssccq VALUES ('5239', '1530798073', '20180705094', '7,1,1,6,2');
INSERT INTO ac_data_ssccq VALUES ('5243', '1530798671', '20180705095', '1,0,1,0,3');
INSERT INTO ac_data_ssccq VALUES ('5246', '1530799258', '20180705096', '8,3,6,8,4');
INSERT INTO ac_data_ssccq VALUES ('5251', '1530799570', '20180705097', '9,1,8,3,9');
INSERT INTO ac_data_ssccq VALUES ('5255', '1530799865', '20180705098', '8,9,4,1,5');
INSERT INTO ac_data_ssccq VALUES ('5258', '1530800156', '20180705099', '6,8,1,8,4');
INSERT INTO ac_data_ssccq VALUES ('5262', '1530800469', '20180705100', '4,3,8,0,3');
INSERT INTO ac_data_ssccq VALUES ('5279', '1530800762', '20180705101', '7,9,9,4,7');
INSERT INTO ac_data_ssccq VALUES ('5298', '1530801060', '20180705102', '5,9,4,5,4');
INSERT INTO ac_data_ssccq VALUES ('5318', '1530801372', '20180705103', '8,5,9,3,4');
INSERT INTO ac_data_ssccq VALUES ('5336', '1530801657', '20180705104', '9,3,4,3,3');
INSERT INTO ac_data_ssccq VALUES ('5355', '1530801974', '20180705105', '0,5,7,9,1');
INSERT INTO ac_data_ssccq VALUES ('5372', '1530802266', '20180705106', '5,6,1,9,3');
INSERT INTO ac_data_ssccq VALUES ('5390', '1530802561', '20180705107', '4,9,6,9,6');
INSERT INTO ac_data_ssccq VALUES ('5409', '1530802864', '20180705108', '4,0,2,1,4');
INSERT INTO ac_data_ssccq VALUES ('5428', '1530803164', '20180705109', '5,2,1,2,6');
INSERT INTO ac_data_ssccq VALUES ('5446', '1530803457', '20180705110', '4,4,2,3,1');
INSERT INTO ac_data_ssccq VALUES ('5466', '1530803779', '20180705111', '7,1,0,6,3');
INSERT INTO ac_data_ssccq VALUES ('5483', '1530804064', '20180705112', '7,3,0,6,5');
INSERT INTO ac_data_ssccq VALUES ('5502', '1530804373', '20180705113', '1,2,7,5,2');
INSERT INTO ac_data_ssccq VALUES ('5520', '1530804656', '20180705114', '0,7,4,1,7');
INSERT INTO ac_data_ssccq VALUES ('5540', '1530804975', '20180705115', '3,1,6,8,9');
INSERT INTO ac_data_ssccq VALUES ('5558', '1530805257', '20180705116', '7,7,9,1,4');
INSERT INTO ac_data_ssccq VALUES ('5577', '1530805567', '20180705117', '3,4,2,0,2');
INSERT INTO ac_data_ssccq VALUES ('5596', '1530805860', '20180705118', '0,9,8,1,8');
INSERT INTO ac_data_ssccq VALUES ('5615', '1530806160', '20180705119', '5,3,5,3,0');
INSERT INTO ac_data_ssccq VALUES ('5634', '1530806460', '20180705120', '1,0,3,1,5');
INSERT INTO ac_data_ssccq VALUES ('5662', '1530806758', '20180706001', '3,5,1,6,6');
INSERT INTO ac_data_ssccq VALUES ('5665', '1530807053', '20180706002', '8,1,1,0,0');
INSERT INTO ac_data_ssccq VALUES ('5669', '1530807369', '20180706003', '0,1,0,3,8');
INSERT INTO ac_data_ssccq VALUES ('5672', '1530807671', '20180706004', '4,4,6,8,4');
INSERT INTO ac_data_ssccq VALUES ('5676', '1530807969', '20180706005', '4,8,3,6,8');
INSERT INTO ac_data_ssccq VALUES ('5680', '1530808258', '20180706006', '7,8,0,7,7');
INSERT INTO ac_data_ssccq VALUES ('5684', '1530808569', '20180706007', '6,8,6,7,0');
INSERT INTO ac_data_ssccq VALUES ('5688', '1530808867', '20180706008', '1,5,9,8,1');
INSERT INTO ac_data_ssccq VALUES ('5691', '1530809153', '20180706009', '5,1,2,6,8');
INSERT INTO ac_data_ssccq VALUES ('5693', '1530809464', '20180706010', '5,6,3,9,1');
INSERT INTO ac_data_ssccq VALUES ('5696', '1530809757', '20180706011', '2,3,5,7,4');
INSERT INTO ac_data_ssccq VALUES ('5700', '1530810070', '20180706012', '9,2,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('5704', '1530810361', '20180706013', '0,8,7,3,8');
INSERT INTO ac_data_ssccq VALUES ('5708', '1530810671', '20180706014', '6,5,3,0,0');
INSERT INTO ac_data_ssccq VALUES ('5712', '1530810968', '20180706015', '3,2,4,1,6');
INSERT INTO ac_data_ssccq VALUES ('5716', '1530811270', '20180706016', '8,7,1,6,3');
INSERT INTO ac_data_ssccq VALUES ('5720', '1530811564', '20180706017', '9,9,0,7,2');
INSERT INTO ac_data_ssccq VALUES ('5724', '1530811867', '20180706018', '5,3,0,1,5');
INSERT INTO ac_data_ssccq VALUES ('5728', '1530812166', '20180706019', '9,9,5,2,0');
INSERT INTO ac_data_ssccq VALUES ('5732', '1530812456', '20180706020', '9,2,9,2,0');
INSERT INTO ac_data_ssccq VALUES ('5735', '1530812756', '20180706021', '2,9,0,0,5');
INSERT INTO ac_data_ssccq VALUES ('5739', '1530813074', '20180706022', '9,4,2,9,0');
INSERT INTO ac_data_ssccq VALUES ('5743', '1530813369', '20180706023', '1,6,4,8,7');
INSERT INTO ac_data_ssccq VALUES ('5767', '1530842472', '20180706024', '2,7,4,1,1');
INSERT INTO ac_data_ssccq VALUES ('5772', '1530843067', '20180706025', '5,9,5,9,8');
INSERT INTO ac_data_ssccq VALUES ('5776', '1530843667', '20180706026', '2,0,9,0,1');
INSERT INTO ac_data_ssccq VALUES ('5781', '1530844267', '20180706027', '1,0,2,0,3');
INSERT INTO ac_data_ssccq VALUES ('5785', '1530844879', '20180706028', '6,5,6,3,3');
INSERT INTO ac_data_ssccq VALUES ('5788', '1530845470', '20180706029', '1,0,6,4,8');
INSERT INTO ac_data_ssccq VALUES ('5792', '1530846068', '20180706030', '0,6,6,8,8');
INSERT INTO ac_data_ssccq VALUES ('5796', '1530846666', '20180706031', '9,7,4,6,8');
INSERT INTO ac_data_ssccq VALUES ('5801', '1530847266', '20180706032', '8,1,9,4,8');
INSERT INTO ac_data_ssccq VALUES ('5805', '1530847868', '20180706033', '3,6,4,9,5');
INSERT INTO ac_data_ssccq VALUES ('5809', '1530848469', '20180706034', '8,6,2,3,4');
INSERT INTO ac_data_ssccq VALUES ('5812', '1530849064', '20180706035', '3,3,3,9,3');
INSERT INTO ac_data_ssccq VALUES ('5815', '1530849663', '20180706036', '0,7,9,1,3');
INSERT INTO ac_data_ssccq VALUES ('5818', '1530850255', '20180706037', '2,5,4,3,0');
INSERT INTO ac_data_ssccq VALUES ('5822', '1530850868', '20180706038', '2,3,3,4,5');
INSERT INTO ac_data_ssccq VALUES ('5826', '1530851459', '20180706039', '1,2,4,5,3');
INSERT INTO ac_data_ssccq VALUES ('5829', '1530852056', '20180706040', '3,0,0,3,8');
INSERT INTO ac_data_ssccq VALUES ('5833', '1530852664', '20180706041', '9,9,2,1,2');
INSERT INTO ac_data_ssccq VALUES ('5837', '1530853261', '20180706042', '5,1,7,2,7');
INSERT INTO ac_data_ssccq VALUES ('5840', '1530853857', '20180706043', '0,4,6,1,2');
INSERT INTO ac_data_ssccq VALUES ('5845', '1530854471', '20180706044', '8,0,0,5,3');
INSERT INTO ac_data_ssccq VALUES ('5849', '1530855070', '20180706045', '2,7,4,8,3');
INSERT INTO ac_data_ssccq VALUES ('5852', '1530855657', '20180706046', '9,9,8,4,0');
INSERT INTO ac_data_ssccq VALUES ('5855', '1530856259', '20180706047', '7,3,3,0,8');
INSERT INTO ac_data_ssccq VALUES ('5858', '1530856858', '20180706048', '0,3,0,9,6');
INSERT INTO ac_data_ssccq VALUES ('5862', '1530857463', '20180706049', '8,3,2,5,8');
INSERT INTO ac_data_ssccq VALUES ('5865', '1530858061', '20180706050', '2,1,6,1,2');
INSERT INTO ac_data_ssccq VALUES ('5870', '1530858670', '20180706051', '2,1,5,8,2');
INSERT INTO ac_data_ssccq VALUES ('5874', '1530859269', '20180706052', '0,0,7,3,9');
INSERT INTO ac_data_ssccq VALUES ('5878', '1530859868', '20180706053', '6,8,8,0,2');
INSERT INTO ac_data_ssccq VALUES ('5882', '1530860466', '20180706054', '3,0,6,0,0');
INSERT INTO ac_data_ssccq VALUES ('5885', '1530861054', '20180706055', '7,0,8,5,7');
INSERT INTO ac_data_ssccq VALUES ('5889', '1530861660', '20180706056', '6,7,9,1,1');
INSERT INTO ac_data_ssccq VALUES ('5892', '1530862255', '20180706057', '5,4,1,9,0');
INSERT INTO ac_data_ssccq VALUES ('5895', '1530862869', '20180706058', '2,0,4,9,6');
INSERT INTO ac_data_ssccq VALUES ('5899', '1530863471', '20180706059', '0,6,5,4,3');
INSERT INTO ac_data_ssccq VALUES ('5903', '1530864065', '20180706060', '5,2,9,8,8');
INSERT INTO ac_data_ssccq VALUES ('5907', '1530864661', '20180706061', '4,3,9,3,9');
INSERT INTO ac_data_ssccq VALUES ('5911', '1530865267', '20180706062', '8,6,9,0,0');
INSERT INTO ac_data_ssccq VALUES ('5916', '1530865871', '20180706063', '7,9,3,4,6');
INSERT INTO ac_data_ssccq VALUES ('5919', '1530866467', '20180706064', '7,9,4,4,2');
INSERT INTO ac_data_ssccq VALUES ('5923', '1530867068', '20180706065', '7,4,3,7,1');
INSERT INTO ac_data_ssccq VALUES ('5927', '1530867660', '20180706066', '1,8,7,5,1');
INSERT INTO ac_data_ssccq VALUES ('5930', '1530868263', '20180706067', '9,4,2,8,6');
INSERT INTO ac_data_ssccq VALUES ('5933', '1530868858', '20180706068', '6,0,9,5,9');
INSERT INTO ac_data_ssccq VALUES ('5937', '1530869466', '20180706069', '7,1,2,5,5');
INSERT INTO ac_data_ssccq VALUES ('5939', '1530870061', '20180706070', '2,8,1,4,9');
INSERT INTO ac_data_ssccq VALUES ('5943', '1530870671', '20180706071', '9,3,1,6,1');
INSERT INTO ac_data_ssccq VALUES ('5948', '1530871271', '20180706072', '0,6,8,5,6');
INSERT INTO ac_data_ssccq VALUES ('5951', '1530871861', '20180706073', '3,4,6,0,4');
INSERT INTO ac_data_ssccq VALUES ('5955', '1530872459', '20180706074', '9,9,9,5,2');
INSERT INTO ac_data_ssccq VALUES ('5959', '1530873067', '20180706075', '1,3,6,0,2');
INSERT INTO ac_data_ssccq VALUES ('5962', '1530873664', '20180706076', '2,4,2,7,7');
INSERT INTO ac_data_ssccq VALUES ('5966', '1530874265', '20180706077', '2,9,5,0,8');
INSERT INTO ac_data_ssccq VALUES ('5970', '1530874880', '20180706078', '9,2,6,0,6');
INSERT INTO ac_data_ssccq VALUES ('5975', '1530875470', '20180706079', '6,2,6,7,5');
INSERT INTO ac_data_ssccq VALUES ('5978', '1530876058', '20180706080', '0,4,1,6,0');
INSERT INTO ac_data_ssccq VALUES ('5983', '1530876667', '20180706081', '9,4,2,7,6');
INSERT INTO ac_data_ssccq VALUES ('5986', '1530877270', '20180706082', '9,0,4,5,1');
INSERT INTO ac_data_ssccq VALUES ('5989', '1530877876', '20180706083', '7,4,5,3,4');
INSERT INTO ac_data_ssccq VALUES ('5994', '1530878468', '20180706084', '4,3,2,0,3');
INSERT INTO ac_data_ssccq VALUES ('5998', '1530879069', '20180706085', '1,4,8,5,3');
INSERT INTO ac_data_ssccq VALUES ('6002', '1530879667', '20180706086', '4,0,8,1,8');
INSERT INTO ac_data_ssccq VALUES ('6007', '1530880274', '20180706087', '8,4,4,8,6');
INSERT INTO ac_data_ssccq VALUES ('6010', '1530880857', '20180706088', '5,4,8,4,6');
INSERT INTO ac_data_ssccq VALUES ('6013', '1530881456', '20180706089', '7,1,7,1,4');
INSERT INTO ac_data_ssccq VALUES ('6018', '1530882062', '20180706090', '6,6,1,5,5');
INSERT INTO ac_data_ssccq VALUES ('6020', '1530882666', '20180706091', '0,3,9,6,2');
INSERT INTO ac_data_ssccq VALUES ('6025', '1530883260', '20180706092', '0,4,3,2,8');
INSERT INTO ac_data_ssccq VALUES ('6028', '1530883859', '20180706093', '5,6,8,4,8');
INSERT INTO ac_data_ssccq VALUES ('6032', '1530884475', '20180706094', '2,4,2,6,2');
INSERT INTO ac_data_ssccq VALUES ('6036', '1530885072', '20180706095', '7,5,4,1,4');
INSERT INTO ac_data_ssccq VALUES ('6040', '1530885664', '20180706096', '5,4,3,7,5');
INSERT INTO ac_data_ssccq VALUES ('6041', '1530885959', '20180706097', '5,0,6,3,9');
INSERT INTO ac_data_ssccq VALUES ('6045', '1530886267', '20180706098', '0,0,0,3,1');
INSERT INTO ac_data_ssccq VALUES ('6049', '1530886565', '20180706099', '4,5,9,1,9');
INSERT INTO ac_data_ssccq VALUES ('6053', '1530886877', '20180706100', '5,6,9,2,0');
INSERT INTO ac_data_ssccq VALUES ('6070', '1530887170', '20180706101', '4,4,6,2,1');
INSERT INTO ac_data_ssccq VALUES ('6088', '1530887465', '20180706102', '3,1,1,8,7');
INSERT INTO ac_data_ssccq VALUES ('6106', '1530887764', '20180706103', '1,7,9,6,8');
INSERT INTO ac_data_ssccq VALUES ('6124', '1530888062', '20180706104', '7,9,1,5,9');
INSERT INTO ac_data_ssccq VALUES ('6142', '1530888374', '20180706105', '6,0,7,2,2');
INSERT INTO ac_data_ssccq VALUES ('6158', '1530888654', '20180706106', '4,0,4,7,9');
INSERT INTO ac_data_ssccq VALUES ('6178', '1530888977', '20180706107', '3,9,4,7,5');
INSERT INTO ac_data_ssccq VALUES ('6195', '1530889261', '20180706108', '1,8,0,3,3');
INSERT INTO ac_data_ssccq VALUES ('6214', '1530889573', '20180706109', '7,3,9,2,7');
INSERT INTO ac_data_ssccq VALUES ('6232', '1530889885', '20180706110', '6,0,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('6249', '1530890171', '20180706111', '0,8,3,0,5');
INSERT INTO ac_data_ssccq VALUES ('6267', '1530890465', '20180706112', '0,6,4,7,1');
INSERT INTO ac_data_ssccq VALUES ('6285', '1530890767', '20180706113', '8,4,1,8,8');
INSERT INTO ac_data_ssccq VALUES ('6302', '1530891070', '20180706114', '3,6,1,8,2');
INSERT INTO ac_data_ssccq VALUES ('6320', '1530891370', '20180706115', '7,1,8,2,0');
INSERT INTO ac_data_ssccq VALUES ('6338', '1530891672', '20180706116', '8,2,9,7,3');
INSERT INTO ac_data_ssccq VALUES ('6356', '1530891965', '20180706117', '0,5,9,0,2');
INSERT INTO ac_data_ssccq VALUES ('6373', '1530892258', '20180706118', '4,1,1,3,1');
INSERT INTO ac_data_ssccq VALUES ('6391', '1530892559', '20180706119', '3,4,1,6,4');
INSERT INTO ac_data_ssccq VALUES ('6408', '1530892854', '20180706120', '2,6,1,6,2');
INSERT INTO ac_data_ssccq VALUES ('6434', '1530893176', '20180707001', '8,5,7,6,4');
INSERT INTO ac_data_ssccq VALUES ('6438', '1530893467', '20180707002', '4,0,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('6442', '1530893769', '20180707003', '2,2,7,0,6');
INSERT INTO ac_data_ssccq VALUES ('6446', '1530894059', '20180707004', '6,3,9,0,6');
INSERT INTO ac_data_ssccq VALUES ('6450', '1530894363', '20180707005', '8,0,7,1,9');
INSERT INTO ac_data_ssccq VALUES ('6453', '1530894674', '20180707006', '6,5,3,3,9');
INSERT INTO ac_data_ssccq VALUES ('6456', '1530894957', '20180707007', '1,3,6,3,3');
INSERT INTO ac_data_ssccq VALUES ('6459', '1530895261', '20180707008', '6,8,5,7,9');
INSERT INTO ac_data_ssccq VALUES ('6462', '1530895565', '20180707009', '5,5,4,6,9');
INSERT INTO ac_data_ssccq VALUES ('6465', '1530895866', '20180707010', '6,8,8,2,0');
INSERT INTO ac_data_ssccq VALUES ('6470', '1530896165', '20180707011', '0,8,9,9,8');
INSERT INTO ac_data_ssccq VALUES ('6474', '1530896469', '20180707012', '9,5,1,5,1');
INSERT INTO ac_data_ssccq VALUES ('6477', '1530896758', '20180707013', '3,5,7,3,0');
INSERT INTO ac_data_ssccq VALUES ('6480', '1530897057', '20180707014', '4,7,2,0,0');
INSERT INTO ac_data_ssccq VALUES ('6483', '1530897363', '20180707015', '8,2,9,9,2');
INSERT INTO ac_data_ssccq VALUES ('6487', '1530897660', '20180707016', '0,1,4,4,9');
INSERT INTO ac_data_ssccq VALUES ('6490', '1530897955', '20180707017', '7,7,9,0,7');
INSERT INTO ac_data_ssccq VALUES ('6493', '1530898261', '20180707018', '7,9,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('6496', '1530898582', '20180707019', '3,8,5,3,4');
INSERT INTO ac_data_ssccq VALUES ('6499', '1530898854', '20180707020', '6,9,8,1,7');
INSERT INTO ac_data_ssccq VALUES ('6503', '1530899157', '20180707021', '1,6,4,5,8');
INSERT INTO ac_data_ssccq VALUES ('6507', '1530899470', '20180707022', '8,2,8,1,0');
INSERT INTO ac_data_ssccq VALUES ('6510', '1530899754', '20180707023', '7,2,5,5,8');
INSERT INTO ac_data_ssccq VALUES ('6541', '1530928886', '20180707024', '9,4,9,5,2');
INSERT INTO ac_data_ssccq VALUES ('6543', '1530929502', '20180707025', '9,4,1,1,8');
INSERT INTO ac_data_ssccq VALUES ('6547', '1530930079', '20180707026', '2,9,8,8,5');
INSERT INTO ac_data_ssccq VALUES ('6549', '1530930891', '20180707027', '2,6,6,6,7');
INSERT INTO ac_data_ssccq VALUES ('6550', '1530931300', '20180707028', '2,3,3,0,0');
INSERT INTO ac_data_ssccq VALUES ('6552', '1530932026', '20180707029', '4,6,9,5,0');
INSERT INTO ac_data_ssccq VALUES ('6555', '1530932486', '20180707030', '4,8,0,7,5');
INSERT INTO ac_data_ssccq VALUES ('6560', '1530933146', '20180707031', '2,8,8,6,6');
INSERT INTO ac_data_ssccq VALUES ('6563', '1530933710', '20180707032', '9,5,1,9,6');
INSERT INTO ac_data_ssccq VALUES ('6565', '1530934308', '20180707033', '3,2,9,7,8');
INSERT INTO ac_data_ssccq VALUES ('6566', '1530934940', '20180707034', '6,0,9,3,0');
INSERT INTO ac_data_ssccq VALUES ('6567', '1530935546', '20180707035', '5,4,0,6,0');
INSERT INTO ac_data_ssccq VALUES ('6572', '1530936065', '20180707036', '3,7,9,8,4');
INSERT INTO ac_data_ssccq VALUES ('6575', '1530936656', '20180707037', '3,8,8,3,1');
INSERT INTO ac_data_ssccq VALUES ('6576', '1530939938', '20180707042', '0,4,8,2,4');
INSERT INTO ac_data_ssccq VALUES ('6582', '1530940264', '20180707043', '3,5,5,9,0');
INSERT INTO ac_data_ssccq VALUES ('6584', '1530940853', '20180707044', '2,2,5,4,5');
INSERT INTO ac_data_ssccq VALUES ('6585', '1530942837', '20180707047', '9,3,9,7,6');
INSERT INTO ac_data_ssccq VALUES ('6594', '1530943260', '20180707048', '0,5,0,0,4');
INSERT INTO ac_data_ssccq VALUES ('6599', '1530943859', '20180707049', '1,6,2,4,7');
INSERT INTO ac_data_ssccq VALUES ('6608', '1530944466', '20180707050', '5,7,0,9,2');
INSERT INTO ac_data_ssccq VALUES ('6614', '1530945058', '20180707051', '5,4,4,4,3');
INSERT INTO ac_data_ssccq VALUES ('6620', '1530945664', '20180707052', '6,5,2,7,6');
INSERT INTO ac_data_ssccq VALUES ('6627', '1530946259', '20180707053', '5,1,0,7,2');
INSERT INTO ac_data_ssccq VALUES ('6632', '1530946857', '20180707054', '2,6,2,4,0');
INSERT INTO ac_data_ssccq VALUES ('6640', '1530947464', '20180707055', '1,8,0,2,2');
INSERT INTO ac_data_ssccq VALUES ('6648', '1530948066', '20180707056', '8,8,2,0,3');
INSERT INTO ac_data_ssccq VALUES ('6655', '1530948657', '20180707057', '5,4,8,3,2');
INSERT INTO ac_data_ssccq VALUES ('6662', '1530949272', '20180707058', '1,2,5,0,4');
INSERT INTO ac_data_ssccq VALUES ('6670', '1530949865', '20180707059', '7,1,4,9,3');
INSERT INTO ac_data_ssccq VALUES ('6680', '1530950460', '20180707060', '8,9,2,8,7');
INSERT INTO ac_data_ssccq VALUES ('6687', '1530951067', '20180707061', '9,4,8,4,6');
INSERT INTO ac_data_ssccq VALUES ('6696', '1530951668', '20180707062', '6,0,2,7,2');
INSERT INTO ac_data_ssccq VALUES ('6702', '1530952263', '20180707063', '3,4,3,3,2');
INSERT INTO ac_data_ssccq VALUES ('6710', '1530952865', '20180707064', '1,8,5,4,0');
INSERT INTO ac_data_ssccq VALUES ('6719', '1530953468', '20180707065', '1,1,6,1,3');
INSERT INTO ac_data_ssccq VALUES ('6727', '1530954064', '20180707066', '2,1,2,0,9');
INSERT INTO ac_data_ssccq VALUES ('6736', '1530954664', '20180707067', '0,1,7,9,2');
INSERT INTO ac_data_ssccq VALUES ('6742', '1530955258', '20180707068', '0,5,5,3,3');
INSERT INTO ac_data_ssccq VALUES ('6751', '1530955860', '20180707069', '1,8,0,4,2');
INSERT INTO ac_data_ssccq VALUES ('6759', '1530956466', '20180707070', '5,7,9,7,9');
INSERT INTO ac_data_ssccq VALUES ('6767', '1530957068', '20180707071', '1,9,8,1,5');
INSERT INTO ac_data_ssccq VALUES ('6778', '1530957681', '20180707072', '2,7,0,6,2');
INSERT INTO ac_data_ssccq VALUES ('6785', '1530958268', '20180707073', '5,0,5,4,9');
INSERT INTO ac_data_ssccq VALUES ('6793', '1530958866', '20180707074', '8,0,2,7,0');
INSERT INTO ac_data_ssccq VALUES ('6799', '1530959464', '20180707075', '1,6,6,5,2');
INSERT INTO ac_data_ssccq VALUES ('6805', '1530960058', '20180707076', '7,3,0,2,1');
INSERT INTO ac_data_ssccq VALUES ('6813', '1530960658', '20180707077', '0,1,2,1,7');
INSERT INTO ac_data_ssccq VALUES ('6819', '1530961261', '20180707078', '5,8,1,2,6');
INSERT INTO ac_data_ssccq VALUES ('6829', '1530961870', '20180707079', '5,2,5,6,2');
INSERT INTO ac_data_ssccq VALUES ('6837', '1530962469', '20180707080', '6,2,2,8,7');
INSERT INTO ac_data_ssccq VALUES ('6843', '1530963061', '20180707081', '0,8,5,7,5');
INSERT INTO ac_data_ssccq VALUES ('6849', '1530963664', '20180707082', '8,9,0,8,8');
INSERT INTO ac_data_ssccq VALUES ('6853', '1530964254', '20180707083', '4,2,2,8,1');
INSERT INTO ac_data_ssccq VALUES ('6861', '1530964859', '20180707084', '3,0,1,8,3');
INSERT INTO ac_data_ssccq VALUES ('6867', '1530965469', '20180707085', '2,3,5,5,0');
INSERT INTO ac_data_ssccq VALUES ('6874', '1530966056', '20180707086', '5,4,8,2,3');
INSERT INTO ac_data_ssccq VALUES ('6880', '1530966660', '20180707087', '2,4,6,1,9');
INSERT INTO ac_data_ssccq VALUES ('6886', '1530967259', '20180707088', '3,1,6,9,0');
INSERT INTO ac_data_ssccq VALUES ('6894', '1530967859', '20180707089', '2,1,4,0,7');
INSERT INTO ac_data_ssccq VALUES ('6900', '1530968464', '20180707090', '2,7,6,5,5');
INSERT INTO ac_data_ssccq VALUES ('6908', '1530969061', '20180707091', '7,9,5,3,4');
INSERT INTO ac_data_ssccq VALUES ('6914', '1530969659', '20180707092', '6,5,8,9,5');
INSERT INTO ac_data_ssccq VALUES ('6920', '1530970263', '20180707093', '7,5,1,2,4');
INSERT INTO ac_data_ssccq VALUES ('6926', '1530970857', '20180707094', '5,6,7,2,6');
INSERT INTO ac_data_ssccq VALUES ('6932', '1530971461', '20180707095', '0,5,6,0,1');
INSERT INTO ac_data_ssccq VALUES ('6940', '1530972058', '20180707096', '4,0,0,4,5');
INSERT INTO ac_data_ssccq VALUES ('6946', '1530972361', '20180707097', '6,0,1,7,2');
INSERT INTO ac_data_ssccq VALUES ('6951', '1530972655', '20180707098', '8,1,1,7,3');
INSERT INTO ac_data_ssccq VALUES ('6957', '1530972961', '20180707099', '7,6,4,7,6');
INSERT INTO ac_data_ssccq VALUES ('6964', '1530973258', '20180707100', '1,9,0,5,6');
INSERT INTO ac_data_ssccq VALUES ('6993', '1530973571', '20180707101', '1,5,9,0,8');
INSERT INTO ac_data_ssccq VALUES ('7019', '1530973860', '20180707102', '2,3,0,5,9');
INSERT INTO ac_data_ssccq VALUES ('7044', '1530974155', '20180707103', '3,3,3,7,6');
INSERT INTO ac_data_ssccq VALUES ('7073', '1530974465', '20180707104', '9,1,0,1,6');
INSERT INTO ac_data_ssccq VALUES ('7102', '1530974760', '20180707105', '7,0,0,6,5');
INSERT INTO ac_data_ssccq VALUES ('7131', '1530975062', '20180707106', '4,5,7,8,2');
INSERT INTO ac_data_ssccq VALUES ('7159', '1530975354', '20180707107', '7,8,7,0,7');
INSERT INTO ac_data_ssccq VALUES ('7184', '1530975653', '20180707108', '4,4,3,3,9');
INSERT INTO ac_data_ssccq VALUES ('7209', '1530975964', '20180707109', '4,0,5,2,5');
INSERT INTO ac_data_ssccq VALUES ('7238', '1530976270', '20180707110', '1,6,2,8,5');
INSERT INTO ac_data_ssccq VALUES ('7267', '1530976565', '20180707111', '6,5,1,4,8');
INSERT INTO ac_data_ssccq VALUES ('7294', '1530976854', '20180707112', '5,0,4,9,4');
INSERT INTO ac_data_ssccq VALUES ('7324', '1530977165', '20180707113', '6,1,5,0,1');
INSERT INTO ac_data_ssccq VALUES ('7352', '1530977455', '20180707114', '8,4,4,6,1');
INSERT INTO ac_data_ssccq VALUES ('7382', '1530977769', '20180707115', '7,9,0,7,9');
INSERT INTO ac_data_ssccq VALUES ('7407', '1530978056', '20180707116', '3,6,2,4,0');
INSERT INTO ac_data_ssccq VALUES ('7434', '1530978364', '20180707117', '8,6,8,6,6');
INSERT INTO ac_data_ssccq VALUES ('7459', '1530978673', '20180707118', '9,0,4,7,9');
INSERT INTO ac_data_ssccq VALUES ('7486', '1530978973', '20180707119', '8,0,9,4,4');
INSERT INTO ac_data_ssccq VALUES ('7515', '1530979263', '20180707120', '2,7,8,5,7');
INSERT INTO ac_data_ssccq VALUES ('7552', '1530979562', '20180708001', '6,2,8,1,9');
INSERT INTO ac_data_ssccq VALUES ('7558', '1530979863', '20180708002', '5,7,1,2,9');
INSERT INTO ac_data_ssccq VALUES ('7563', '1530980164', '20180708003', '3,8,8,3,2');
INSERT INTO ac_data_ssccq VALUES ('7571', '1530980461', '20180708004', '8,0,0,9,1');
INSERT INTO ac_data_ssccq VALUES ('7577', '1530980762', '20180708005', '2,7,5,1,8');
INSERT INTO ac_data_ssccq VALUES ('7583', '1530981062', '20180708006', '4,7,4,3,9');
INSERT INTO ac_data_ssccq VALUES ('7589', '1530981363', '20180708007', '5,3,6,4,5');
INSERT INTO ac_data_ssccq VALUES ('7595', '1530981666', '20180708008', '1,2,0,8,9');
INSERT INTO ac_data_ssccq VALUES ('7603', '1530981958', '20180708009', '4,1,6,8,7');
INSERT INTO ac_data_ssccq VALUES ('7610', '1530982282', '20180708010', '4,0,8,5,6');
INSERT INTO ac_data_ssccq VALUES ('7616', '1530982559', '20180708011', '7,3,8,8,4');
INSERT INTO ac_data_ssccq VALUES ('7622', '1530982862', '20180708012', '5,0,7,8,5');
INSERT INTO ac_data_ssccq VALUES ('7628', '1530983163', '20180708013', '9,4,3,9,1');
INSERT INTO ac_data_ssccq VALUES ('7636', '1530983465', '20180708014', '3,2,2,1,1');
INSERT INTO ac_data_ssccq VALUES ('7641', '1530983760', '20180708015', '0,1,0,3,7');
INSERT INTO ac_data_ssccq VALUES ('7646', '1530984059', '20180708016', '7,0,4,8,5');
INSERT INTO ac_data_ssccq VALUES ('7651', '1530984367', '20180708017', '2,6,1,3,8');
INSERT INTO ac_data_ssccq VALUES ('7657', '1530984669', '20180708018', '4,8,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('7663', '1530984965', '20180708019', '3,9,1,4,2');
INSERT INTO ac_data_ssccq VALUES ('7669', '1530985264', '20180708020', '4,1,0,8,6');
INSERT INTO ac_data_ssccq VALUES ('7675', '1530985559', '20180708021', '5,4,2,4,7');
INSERT INTO ac_data_ssccq VALUES ('7681', '1530985863', '20180708022', '7,4,9,4,9');
INSERT INTO ac_data_ssccq VALUES ('7687', '1530986164', '20180708023', '0,6,3,7,5');
INSERT INTO ac_data_ssccq VALUES ('7735', '1531015279', '20180708024', '6,5,3,4,1');
INSERT INTO ac_data_ssccq VALUES ('7743', '1531015878', '20180708025', '7,3,6,5,1');
INSERT INTO ac_data_ssccq VALUES ('7752', '1531016478', '20180708026', '5,2,0,2,5');
INSERT INTO ac_data_ssccq VALUES ('7758', '1531017063', '20180708027', '3,0,6,8,0');
INSERT INTO ac_data_ssccq VALUES ('7766', '1531017660', '20180708028', '1,3,7,1,5');
INSERT INTO ac_data_ssccq VALUES ('7772', '1531018260', '20180708029', '7,9,1,1,0');
INSERT INTO ac_data_ssccq VALUES ('7779', '1531018858', '20180708030', '7,5,7,4,7');
INSERT INTO ac_data_ssccq VALUES ('7785', '1531019467', '20180708031', '6,9,9,2,2');
INSERT INTO ac_data_ssccq VALUES ('7791', '1531020063', '20180708032', '4,6,7,4,9');
INSERT INTO ac_data_ssccq VALUES ('7799', '1531020658', '20180708033', '3,0,2,3,8');
INSERT INTO ac_data_ssccq VALUES ('7805', '1531021261', '20180708034', '6,5,7,9,5');
INSERT INTO ac_data_ssccq VALUES ('7812', '1531021874', '20180708035', '6,9,4,7,5');
INSERT INTO ac_data_ssccq VALUES ('7818', '1531022461', '20180708036', '6,9,9,9,0');
INSERT INTO ac_data_ssccq VALUES ('7823', '1531023069', '20180708037', '2,1,0,4,5');
INSERT INTO ac_data_ssccq VALUES ('7830', '1531023656', '20180708038', '3,2,9,9,6');
INSERT INTO ac_data_ssccq VALUES ('7835', '1531024259', '20180708039', '7,8,8,1,6');
INSERT INTO ac_data_ssccq VALUES ('7843', '1531024868', '20180708040', '5,7,5,2,9');
INSERT INTO ac_data_ssccq VALUES ('7849', '1531025465', '20180708041', '1,6,4,6,4');
INSERT INTO ac_data_ssccq VALUES ('7856', '1531026063', '20180708042', '4,6,0,9,1');
INSERT INTO ac_data_ssccq VALUES ('7862', '1531026662', '20180708043', '9,3,7,8,1');
INSERT INTO ac_data_ssccq VALUES ('7868', '1531027261', '20180708044', '7,8,5,9,7');
INSERT INTO ac_data_ssccq VALUES ('7876', '1531027859', '20180708045', '8,7,6,1,6');
INSERT INTO ac_data_ssccq VALUES ('7882', '1531028463', '20180708046', '6,5,0,9,2');
INSERT INTO ac_data_ssccq VALUES ('7889', '1531029057', '20180708047', '9,8,3,8,4');
INSERT INTO ac_data_ssccq VALUES ('7895', '1531029664', '20180708048', '1,8,9,2,6');
INSERT INTO ac_data_ssccq VALUES ('7901', '1531030261', '20180708049', '1,3,6,0,0');
INSERT INTO ac_data_ssccq VALUES ('7908', '1531030872', '20180708050', '1,8,3,0,0');
INSERT INTO ac_data_ssccq VALUES ('7914', '1531031465', '20180708051', '4,9,8,3,3');
INSERT INTO ac_data_ssccq VALUES ('7922', '1531032066', '20180708052', '1,2,4,8,5');
INSERT INTO ac_data_ssccq VALUES ('7928', '1531032675', '20180708053', '7,7,0,2,8');
INSERT INTO ac_data_ssccq VALUES ('7934', '1531033259', '20180708054', '0,3,3,0,6');
INSERT INTO ac_data_ssccq VALUES ('7939', '1531033848', '20180708055', '1,5,0,9,7');
INSERT INTO ac_data_ssccq VALUES ('7945', '1531034464', '20180708056', '3,7,9,0,4');
INSERT INTO ac_data_ssccq VALUES ('7953', '1531035066', '20180708057', '5,9,6,9,5');
INSERT INTO ac_data_ssccq VALUES ('7959', '1531035661', '20180708058', '7,7,9,9,5');
INSERT INTO ac_data_ssccq VALUES ('7967', '1531036268', '20180708059', '3,2,5,2,1');
INSERT INTO ac_data_ssccq VALUES ('7973', '1531036860', '20180708060', '7,0,8,7,7');
INSERT INTO ac_data_ssccq VALUES ('7979', '1531037463', '20180708061', '2,1,6,5,9');
INSERT INTO ac_data_ssccq VALUES ('7987', '1531038060', '20180708062', '0,8,4,8,3');
INSERT INTO ac_data_ssccq VALUES ('7992', '1531038659', '20180708063', '9,4,1,9,8');
INSERT INTO ac_data_ssccq VALUES ('8000', '1531039265', '20180708064', '2,0,8,5,8');
INSERT INTO ac_data_ssccq VALUES ('8005', '1531039862', '20180708065', '4,4,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('8010', '1531040458', '20180708066', '8,2,1,8,8');
INSERT INTO ac_data_ssccq VALUES ('8017', '1531041052', '20180708067', '7,1,0,6,3');
INSERT INTO ac_data_ssccq VALUES ('8022', '1531041657', '20180708068', '2,7,9,3,3');
INSERT INTO ac_data_ssccq VALUES ('8030', '1531042267', '20180708069', '2,9,8,6,3');
INSERT INTO ac_data_ssccq VALUES ('8036', '1531042865', '20180708070', '3,4,2,9,8');
INSERT INTO ac_data_ssccq VALUES ('8044', '1531043461', '20180708071', '0,8,2,4,6');
INSERT INTO ac_data_ssccq VALUES ('8050', '1531044062', '20180708072', '3,9,7,9,9');
INSERT INTO ac_data_ssccq VALUES ('8056', '1531044665', '20180708073', '3,5,7,1,3');
INSERT INTO ac_data_ssccq VALUES ('8064', '1531045264', '20180708074', '7,4,5,3,6');
INSERT INTO ac_data_ssccq VALUES ('8070', '1531045862', '20180708075', '8,5,2,3,2');
INSERT INTO ac_data_ssccq VALUES ('8079', '1531046459', '20180708076', '8,0,4,2,0');
INSERT INTO ac_data_ssccq VALUES ('8084', '1531047061', '20180708077', '9,4,6,4,8');
INSERT INTO ac_data_ssccq VALUES ('8090', '1531047675', '20180708078', '7,7,6,3,6');
INSERT INTO ac_data_ssccq VALUES ('8099', '1531048279', '20180708079', '0,8,2,8,1');
INSERT INTO ac_data_ssccq VALUES ('8105', '1531048861', '20180708080', '2,2,2,2,0');
INSERT INTO ac_data_ssccq VALUES ('8111', '1531049475', '20180708081', '8,2,3,7,9');
INSERT INTO ac_data_ssccq VALUES ('8114', '1531050080', '20180708082', '0,9,8,4,0');
INSERT INTO ac_data_ssccq VALUES ('8125', '1531050663', '20180708083', '7,9,2,3,7');
INSERT INTO ac_data_ssccq VALUES ('8133', '1531051267', '20180708084', '2,6,3,3,2');
INSERT INTO ac_data_ssccq VALUES ('8140', '1531051867', '20180708085', '0,5,2,1,5');
INSERT INTO ac_data_ssccq VALUES ('8148', '1531052459', '20180708086', '8,0,9,1,5');
INSERT INTO ac_data_ssccq VALUES ('8153', '1531053059', '20180708087', '3,4,5,9,1');
INSERT INTO ac_data_ssccq VALUES ('8161', '1531053664', '20180708088', '8,6,0,8,6');
INSERT INTO ac_data_ssccq VALUES ('8167', '1531054254', '20180708089', '1,6,8,2,3');
INSERT INTO ac_data_ssccq VALUES ('8174', '1531054873', '20180708090', '2,8,2,7,8');
INSERT INTO ac_data_ssccq VALUES ('8181', '1531055459', '20180708091', '8,9,1,2,5');
INSERT INTO ac_data_ssccq VALUES ('8189', '1531056069', '20180708092', '9,3,2,3,7');
INSERT INTO ac_data_ssccq VALUES ('8198', '1531056669', '20180708093', '9,9,4,9,8');
INSERT INTO ac_data_ssccq VALUES ('8206', '1531057271', '20180708094', '3,1,1,4,7');
INSERT INTO ac_data_ssccq VALUES ('8213', '1531057867', '20180708095', '9,6,5,7,9');
INSERT INTO ac_data_ssccq VALUES ('8219', '1531058464', '20180708096', '3,9,6,7,7');
INSERT INTO ac_data_ssccq VALUES ('8227', '1531058774', '20180708097', '0,2,6,7,0');
INSERT INTO ac_data_ssccq VALUES ('8232', '1531059068', '20180708098', '2,2,5,2,8');
INSERT INTO ac_data_ssccq VALUES ('8242', '1531059364', '20180708099', '3,6,9,0,1');
INSERT INTO ac_data_ssccq VALUES ('8248', '1531059659', '20180708100', '9,3,9,2,6');
INSERT INTO ac_data_ssccq VALUES ('8283', '1531059960', '20180708101', '7,6,5,3,8');
INSERT INTO ac_data_ssccq VALUES ('8318', '1531060257', '20180708102', '2,1,5,6,4');
INSERT INTO ac_data_ssccq VALUES ('8351', '1531060557', '20180708103', '7,2,0,7,2');
INSERT INTO ac_data_ssccq VALUES ('8387', '1531060860', '20180708104', '0,6,0,8,7');
INSERT INTO ac_data_ssccq VALUES ('8423', '1531061160', '20180708105', '8,5,7,7,9');
INSERT INTO ac_data_ssccq VALUES ('8462', '1531061471', '20180708106', '2,3,2,3,1');
INSERT INTO ac_data_ssccq VALUES ('8494', '1531061763', '20180708107', '0,7,1,5,5');
INSERT INTO ac_data_ssccq VALUES ('8528', '1531062056', '20180708108', '5,9,3,8,6');
INSERT INTO ac_data_ssccq VALUES ('8565', '1531062355', '20180708109', '8,4,1,4,2');
INSERT INTO ac_data_ssccq VALUES ('8603', '1531062663', '20180708110', '8,9,6,7,2');
INSERT INTO ac_data_ssccq VALUES ('8637', '1531062967', '20180708111', '0,7,8,2,3');
INSERT INTO ac_data_ssccq VALUES ('8672', '1531063257', '20180708112', '6,8,6,5,9');
INSERT INTO ac_data_ssccq VALUES ('8708', '1531063564', '20180708113', '4,6,5,6,5');
INSERT INTO ac_data_ssccq VALUES ('8742', '1531063869', '20180708114', '2,4,0,8,8');
INSERT INTO ac_data_ssccq VALUES ('8778', '1531064156', '20180708115', '1,0,8,1,9');
INSERT INTO ac_data_ssccq VALUES ('8816', '1531064467', '20180708116', '2,4,2,7,7');
INSERT INTO ac_data_ssccq VALUES ('8852', '1531064774', '20180708117', '6,9,8,4,0');
INSERT INTO ac_data_ssccq VALUES ('8883', '1531065063', '20180708118', '6,3,0,0,8');
INSERT INTO ac_data_ssccq VALUES ('8921', '1531065360', '20180708119', '7,8,6,0,9');
INSERT INTO ac_data_ssccq VALUES ('8960', '1531065671', '20180708120', '5,5,9,7,6');
INSERT INTO ac_data_ssccq VALUES ('9009', '1531065959', '20180709001', '5,8,9,3,2');
INSERT INTO ac_data_ssccq VALUES ('9017', '1531066272', '20180709002', '7,9,2,3,1');
INSERT INTO ac_data_ssccq VALUES ('9027', '1531066583', '20180709003', '7,2,8,3,5');
INSERT INTO ac_data_ssccq VALUES ('9035', '1531066868', '20180709004', '8,3,2,1,9');
INSERT INTO ac_data_ssccq VALUES ('9042', '1531067157', '20180709005', '8,0,8,2,4');
INSERT INTO ac_data_ssccq VALUES ('9047', '1531067453', '20180709006', '6,5,9,8,0');
INSERT INTO ac_data_ssccq VALUES ('9054', '1531067765', '20180709007', '1,8,7,5,3');
INSERT INTO ac_data_ssccq VALUES ('9063', '1531068069', '20180709008', '8,4,6,1,6');
INSERT INTO ac_data_ssccq VALUES ('9070', '1531068364', '20180709009', '8,3,2,5,8');
INSERT INTO ac_data_ssccq VALUES ('9077', '1531068657', '20180709010', '4,3,6,7,1');
INSERT INTO ac_data_ssccq VALUES ('9084', '1531068956', '20180709011', '1,3,9,1,7');
INSERT INTO ac_data_ssccq VALUES ('9092', '1531069267', '20180709012', '8,5,3,2,5');
INSERT INTO ac_data_ssccq VALUES ('9100', '1531069560', '20180709013', '7,3,5,9,7');
INSERT INTO ac_data_ssccq VALUES ('9106', '1531069868', '20180709014', '7,3,0,3,5');
INSERT INTO ac_data_ssccq VALUES ('9113', '1531070166', '20180709015', '8,0,8,6,8');
INSERT INTO ac_data_ssccq VALUES ('9120', '1531070468', '20180709016', '8,9,3,8,7');
INSERT INTO ac_data_ssccq VALUES ('9125', '1531070751', '20180709017', '9,1,0,4,1');
INSERT INTO ac_data_ssccq VALUES ('9132', '1531071054', '20180709018', '6,8,3,8,4');
INSERT INTO ac_data_ssccq VALUES ('9138', '1531071357', '20180709019', '9,2,1,2,2');
INSERT INTO ac_data_ssccq VALUES ('9146', '1531071664', '20180709020', '6,4,1,8,1');
INSERT INTO ac_data_ssccq VALUES ('9152', '1531071970', '20180709021', '0,4,0,0,4');
INSERT INTO ac_data_ssccq VALUES ('9159', '1531072254', '20180709022', '6,9,1,4,5');
INSERT INTO ac_data_ssccq VALUES ('9167', '1531072555', '20180709023', '9,4,0,7,0');
INSERT INTO ac_data_ssccq VALUES ('9214', '1531101678', '20180709024', '5,7,6,3,3');
INSERT INTO ac_data_ssccq VALUES ('9222', '1531102260', '20180709025', '7,6,3,6,8');
INSERT INTO ac_data_ssccq VALUES ('9230', '1531102865', '20180709026', '2,0,1,3,7');
INSERT INTO ac_data_ssccq VALUES ('9238', '1531103469', '20180709027', '5,0,5,2,9');
INSERT INTO ac_data_ssccq VALUES ('9248', '1531104072', '20180709028', '8,9,7,2,1');
INSERT INTO ac_data_ssccq VALUES ('9255', '1531104658', '20180709029', '5,9,5,2,3');
INSERT INTO ac_data_ssccq VALUES ('9263', '1531105271', '20180709030', '9,2,7,7,7');
INSERT INTO ac_data_ssccq VALUES ('9269', '1531105849', '20180709031', '6,5,7,5,6');
INSERT INTO ac_data_ssccq VALUES ('9277', '1531106459', '20180709032', '2,9,9,9,6');
INSERT INTO ac_data_ssccq VALUES ('9284', '1531107054', '20180709033', '7,7,1,1,6');
INSERT INTO ac_data_ssccq VALUES ('9291', '1531107656', '20180709034', '5,8,5,3,2');
INSERT INTO ac_data_ssccq VALUES ('9297', '1531108257', '20180709035', '0,1,3,7,1');
INSERT INTO ac_data_ssccq VALUES ('9303', '1531108862', '20180709036', '0,1,2,1,4');
INSERT INTO ac_data_ssccq VALUES ('9309', '1531109456', '20180709037', '8,1,4,1,6');
INSERT INTO ac_data_ssccq VALUES ('9316', '1531110065', '20180709038', '3,2,6,0,1');
INSERT INTO ac_data_ssccq VALUES ('9324', '1531110662', '20180709039', '0,7,3,4,6');
INSERT INTO ac_data_ssccq VALUES ('9331', '1531111268', '20180709040', '4,4,6,4,8');
INSERT INTO ac_data_ssccq VALUES ('9340', '1531111863', '20180709041', '5,7,7,5,8');
INSERT INTO ac_data_ssccq VALUES ('9346', '1531112456', '20180709042', '7,7,2,5,4');
INSERT INTO ac_data_ssccq VALUES ('9353', '1531113069', '20180709043', '8,9,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('9361', '1531113656', '20180709044', '2,9,3,6,7');
INSERT INTO ac_data_ssccq VALUES ('9367', '1531114263', '20180709045', '3,1,2,1,5');
INSERT INTO ac_data_ssccq VALUES ('9377', '1531114872', '20180709046', '1,4,8,0,5');
INSERT INTO ac_data_ssccq VALUES ('9383', '1531115457', '20180709047', '0,7,6,5,4');
INSERT INTO ac_data_ssccq VALUES ('9389', '1531116050', '20180709048', '1,1,3,6,1');
INSERT INTO ac_data_ssccq VALUES ('9397', '1531116665', '20180709049', '6,0,5,7,5');
INSERT INTO ac_data_ssccq VALUES ('9404', '1531117269', '20180709050', '6,8,9,8,1');
INSERT INTO ac_data_ssccq VALUES ('9412', '1531117864', '20180709051', '3,8,7,3,0');
INSERT INTO ac_data_ssccq VALUES ('9417', '1531118460', '20180709052', '1,4,1,6,7');
INSERT INTO ac_data_ssccq VALUES ('9424', '1531119064', '20180709053', '6,3,6,4,2');
INSERT INTO ac_data_ssccq VALUES ('9431', '1531119662', '20180709054', '2,6,1,0,1');
INSERT INTO ac_data_ssccq VALUES ('9437', '1531120267', '20180709055', '4,3,2,4,5');
INSERT INTO ac_data_ssccq VALUES ('9444', '1531120849', '20180709056', '1,2,4,0,6');
INSERT INTO ac_data_ssccq VALUES ('9449', '1531121453', '20180709057', '7,1,1,8,5');
INSERT INTO ac_data_ssccq VALUES ('9456', '1531122061', '20180709058', '5,5,7,3,3');
INSERT INTO ac_data_ssccq VALUES ('9462', '1531122665', '20180709059', '5,8,1,8,8');
INSERT INTO ac_data_ssccq VALUES ('9468', '1531123259', '20180709060', '1,0,8,7,6');
INSERT INTO ac_data_ssccq VALUES ('9475', '1531123857', '20180709061', '4,1,7,5,9');
INSERT INTO ac_data_ssccq VALUES ('9479', '1531124457', '20180709062', '8,7,8,2,8');
INSERT INTO ac_data_ssccq VALUES ('9487', '1531125061', '20180709063', '6,9,6,9,9');
INSERT INTO ac_data_ssccq VALUES ('9492', '1531125656', '20180709064', '4,6,4,9,3');
INSERT INTO ac_data_ssccq VALUES ('9500', '1531126258', '20180709065', '5,3,1,9,7');
INSERT INTO ac_data_ssccq VALUES ('9506', '1531126856', '20180709066', '2,9,0,4,2');
INSERT INTO ac_data_ssccq VALUES ('9511', '1531127457', '20180709067', '9,4,9,5,7');
INSERT INTO ac_data_ssccq VALUES ('9520', '1531128072', '20180709068', '7,7,6,8,5');
INSERT INTO ac_data_ssccq VALUES ('9527', '1531128667', '20180709069', '1,3,2,2,3');
INSERT INTO ac_data_ssccq VALUES ('9535', '1531129271', '20180709070', '1,9,0,7,7');
INSERT INTO ac_data_ssccq VALUES ('9541', '1531129859', '20180709071', '3,9,6,0,3');
INSERT INTO ac_data_ssccq VALUES ('9547', '1531130458', '20180709072', '2,3,9,2,2');
INSERT INTO ac_data_ssccq VALUES ('9555', '1531131064', '20180709073', '0,6,3,8,8');
INSERT INTO ac_data_ssccq VALUES ('9562', '1531131660', '20180709074', '9,8,6,8,6');
INSERT INTO ac_data_ssccq VALUES ('9570', '1531132258', '20180709075', '6,7,8,6,1');
INSERT INTO ac_data_ssccq VALUES ('9574', '1531132865', '20180709076', '9,2,7,6,1');
INSERT INTO ac_data_ssccq VALUES ('9578', '1531133448', '20180709077', '9,4,5,1,6');
INSERT INTO ac_data_ssccq VALUES ('9586', '1531134061', '20180709078', '5,9,5,9,5');
INSERT INTO ac_data_ssccq VALUES ('9592', '1531134670', '20180709079', '2,2,6,9,4');
INSERT INTO ac_data_ssccq VALUES ('9601', '1531135269', '20180709080', '7,6,4,8,8');
INSERT INTO ac_data_ssccq VALUES ('9606', '1531135858', '20180709081', '4,8,4,7,8');
INSERT INTO ac_data_ssccq VALUES ('9614', '1531136454', '20180709082', '5,3,6,5,3');
INSERT INTO ac_data_ssccq VALUES ('9620', '1531137056', '20180709083', '9,1,7,0,3');
INSERT INTO ac_data_ssccq VALUES ('9626', '1531137663', '20180709084', '9,2,5,6,8');
INSERT INTO ac_data_ssccq VALUES ('9634', '1531138258', '20180709085', '4,9,7,1,0');
INSERT INTO ac_data_ssccq VALUES ('9641', '1531138857', '20180709086', '7,0,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('9650', '1531139463', '20180709087', '3,8,0,2,8');
INSERT INTO ac_data_ssccq VALUES ('9656', '1531140066', '20180709088', '0,3,3,0,8');
INSERT INTO ac_data_ssccq VALUES ('9660', '1531140660', '20180709089', '4,7,4,1,1');
INSERT INTO ac_data_ssccq VALUES ('9666', '1531141257', '20180709090', '6,8,9,5,3');
INSERT INTO ac_data_ssccq VALUES ('9673', '1531141868', '20180709091', '5,4,3,6,1');
INSERT INTO ac_data_ssccq VALUES ('9683', '1531142469', '20180709092', '2,2,0,2,6');
INSERT INTO ac_data_ssccq VALUES ('9689', '1531143065', '20180709093', '8,2,3,9,5');
INSERT INTO ac_data_ssccq VALUES ('9698', '1531143660', '20180709094', '9,5,0,1,0');
INSERT INTO ac_data_ssccq VALUES ('9704', '1531144257', '20180709095', '7,6,6,5,8');
INSERT INTO ac_data_ssccq VALUES ('9710', '1531144865', '20180709096', '5,3,2,1,1');
INSERT INTO ac_data_ssccq VALUES ('9719', '1531145161', '20180709097', '0,5,4,8,8');
INSERT INTO ac_data_ssccq VALUES ('9727', '1531145461', '20180709098', '7,4,7,7,1');
INSERT INTO ac_data_ssccq VALUES ('9735', '1531145772', '20180709099', '0,1,9,2,4');
INSERT INTO ac_data_ssccq VALUES ('9743', '1531146063', '20180709100', '9,9,2,2,8');
INSERT INTO ac_data_ssccq VALUES ('9780', '1531146370', '20180709101', '4,2,0,9,8');
INSERT INTO ac_data_ssccq VALUES ('9815', '1531146663', '20180709102', '6,5,9,9,7');
INSERT INTO ac_data_ssccq VALUES ('9851', '1531146967', '20180709103', '8,1,6,8,4');
INSERT INTO ac_data_ssccq VALUES ('9885', '1531147259', '20180709104', '3,2,3,0,5');
INSERT INTO ac_data_ssccq VALUES ('9921', '1531147555', '20180709105', '1,8,2,5,4');
INSERT INTO ac_data_ssccq VALUES ('9957', '1531147855', '20180709106', '3,4,3,4,3');
INSERT INTO ac_data_ssccq VALUES ('9994', '1531148164', '20180709107', '7,4,5,5,2');
INSERT INTO ac_data_ssccq VALUES ('10028', '1531148467', '20180709108', '6,9,6,6,5');
INSERT INTO ac_data_ssccq VALUES ('10062', '1531148758', '20180709109', '1,8,9,9,4');
INSERT INTO ac_data_ssccq VALUES ('10098', '1531149066', '20180709110', '6,9,3,6,2');
INSERT INTO ac_data_ssccq VALUES ('10134', '1531149358', '20180709111', '1,6,6,3,6');
INSERT INTO ac_data_ssccq VALUES ('10162', '1531149661', '20180709112', '1,9,0,2,9');
INSERT INTO ac_data_ssccq VALUES ('10199', '1531149960', '20180709113', '9,7,5,9,7');
INSERT INTO ac_data_ssccq VALUES ('10233', '1531150257', '20180709114', '5,6,8,5,6');
INSERT INTO ac_data_ssccq VALUES ('10267', '1531150554', '20180709115', '7,3,9,2,4');
INSERT INTO ac_data_ssccq VALUES ('10305', '1531150855', '20180709116', '4,3,9,8,9');
INSERT INTO ac_data_ssccq VALUES ('10339', '1531151166', '20180709117', '8,2,3,2,8');
INSERT INTO ac_data_ssccq VALUES ('10371', '1531151463', '20180709118', '7,2,4,6,0');
INSERT INTO ac_data_ssccq VALUES ('10394', '1531151764', '20180709119', '3,5,0,9,0');
INSERT INTO ac_data_ssccq VALUES ('10425', '1531152064', '20180709120', '5,1,3,4,7');
INSERT INTO ac_data_ssccq VALUES ('10474', '1531152361', '20180710001', '4,9,8,4,9');
INSERT INTO ac_data_ssccq VALUES ('10482', '1531152666', '20180710002', '1,2,1,0,3');
INSERT INTO ac_data_ssccq VALUES ('10487', '1531152953', '20180710003', '2,3,0,0,6');
INSERT INTO ac_data_ssccq VALUES ('10493', '1531153253', '20180710004', '3,4,1,2,4');
INSERT INTO ac_data_ssccq VALUES ('10499', '1531153570', '20180710005', '1,6,2,2,0');
INSERT INTO ac_data_ssccq VALUES ('10509', '1531153868', '20180710006', '1,2,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('10515', '1531154155', '20180710007', '1,4,9,5,5');
INSERT INTO ac_data_ssccq VALUES ('10521', '1531154458', '20180710008', '0,1,0,3,7');
INSERT INTO ac_data_ssccq VALUES ('10529', '1531154768', '20180710009', '0,9,8,6,6');
INSERT INTO ac_data_ssccq VALUES ('10536', '1531155066', '20180710010', '8,7,8,4,8');
INSERT INTO ac_data_ssccq VALUES ('10542', '1531155357', '20180710011', '1,4,2,1,3');
INSERT INTO ac_data_ssccq VALUES ('10548', '1531155654', '20180710012', '9,0,4,3,6');
INSERT INTO ac_data_ssccq VALUES ('10555', '1531155964', '20180710013', '5,6,4,7,1');
INSERT INTO ac_data_ssccq VALUES ('10561', '1531156257', '20180710014', '4,7,4,2,2');
INSERT INTO ac_data_ssccq VALUES ('10565', '1531156569', '20180710015', '9,5,7,2,1');
INSERT INTO ac_data_ssccq VALUES ('10572', '1531156867', '20180710016', '4,7,3,7,5');
INSERT INTO ac_data_ssccq VALUES ('10578', '1531157157', '20180710017', '2,3,6,4,7');
INSERT INTO ac_data_ssccq VALUES ('10585', '1531157467', '20180710018', '7,6,2,9,3');
INSERT INTO ac_data_ssccq VALUES ('10593', '1531157772', '20180710019', '9,5,7,2,6');
INSERT INTO ac_data_ssccq VALUES ('10601', '1531158058', '20180710020', '2,2,2,1,0');
INSERT INTO ac_data_ssccq VALUES ('10607', '1531158356', '20180710021', '4,4,7,4,0');
INSERT INTO ac_data_ssccq VALUES ('10615', '1531158669', '20180710022', '0,0,8,9,2');
INSERT INTO ac_data_ssccq VALUES ('10620', '1531158953', '20180710023', '8,4,8,0,6');
INSERT INTO ac_data_ssccq VALUES ('10668', '1531188068', '20180710024', '0,9,9,3,0');
INSERT INTO ac_data_ssccq VALUES ('10675', '1531188685', '20180710025', '7,2,9,3,3');
INSERT INTO ac_data_ssccq VALUES ('10684', '1531189259', '20180710026', '2,1,4,6,1');
INSERT INTO ac_data_ssccq VALUES ('10692', '1531189863', '20180710027', '3,1,7,0,0');
INSERT INTO ac_data_ssccq VALUES ('10698', '1531190457', '20180710028', '7,6,3,0,2');
INSERT INTO ac_data_ssccq VALUES ('10704', '1531191055', '20180710029', '7,6,6,6,7');
INSERT INTO ac_data_ssccq VALUES ('10714', '1531191669', '20180710030', '5,1,8,4,8');
INSERT INTO ac_data_ssccq VALUES ('10722', '1531192281', '20180710031', '2,4,1,2,5');
INSERT INTO ac_data_ssccq VALUES ('10730', '1531192856', '20180710032', '0,3,0,8,3');
INSERT INTO ac_data_ssccq VALUES ('10736', '1531193456', '20180710033', '0,3,2,4,5');
INSERT INTO ac_data_ssccq VALUES ('10741', '1531194059', '20180710034', '3,1,6,8,4');
INSERT INTO ac_data_ssccq VALUES ('10749', '1531194667', '20180710035', '4,1,7,5,6');
INSERT INTO ac_data_ssccq VALUES ('10755', '1531195248', '20180710036', '4,0,9,4,2');
INSERT INTO ac_data_ssccq VALUES ('10763', '1531195857', '20180710037', '9,5,9,4,8');
INSERT INTO ac_data_ssccq VALUES ('10768', '1531196454', '20180710038', '2,9,5,5,9');
INSERT INTO ac_data_ssccq VALUES ('10777', '1531197068', '20180710039', '1,6,1,4,2');
INSERT INTO ac_data_ssccq VALUES ('10782', '1531197657', '20180710040', '9,0,1,3,7');
INSERT INTO ac_data_ssccq VALUES ('10790', '1531198266', '20180710041', '7,6,7,0,4');
INSERT INTO ac_data_ssccq VALUES ('10798', '1531198854', '20180710042', '2,6,5,9,8');
INSERT INTO ac_data_ssccq VALUES ('10806', '1531199479', '20180710043', '8,6,9,0,0');
INSERT INTO ac_data_ssccq VALUES ('10813', '1531200057', '20180710044', '0,0,4,8,9');
INSERT INTO ac_data_ssccq VALUES ('10820', '1531200660', '20180710045', '9,4,4,2,6');
INSERT INTO ac_data_ssccq VALUES ('10825', '1531201256', '20180710046', '6,4,3,7,8');
INSERT INTO ac_data_ssccq VALUES ('10833', '1531201857', '20180710047', '6,9,7,1,1');
INSERT INTO ac_data_ssccq VALUES ('10838', '1531202458', '20180710048', '4,6,0,2,1');
INSERT INTO ac_data_ssccq VALUES ('10846', '1531203063', '20180710049', '5,8,1,1,0');
INSERT INTO ac_data_ssccq VALUES ('10852', '1531203660', '20180710050', '4,3,0,4,4');
INSERT INTO ac_data_ssccq VALUES ('10860', '1531204262', '20180710051', '3,9,7,8,3');
INSERT INTO ac_data_ssccq VALUES ('10867', '1531204856', '20180710052', '0,7,8,4,8');
INSERT INTO ac_data_ssccq VALUES ('10874', '1531205464', '20180710053', '7,4,9,8,9');
INSERT INTO ac_data_ssccq VALUES ('10881', '1531206052', '20180710054', '6,8,0,6,6');
INSERT INTO ac_data_ssccq VALUES ('10887', '1531206659', '20180710055', '6,9,6,9,2');
INSERT INTO ac_data_ssccq VALUES ('10895', '1531207261', '20180710056', '1,5,9,1,6');
INSERT INTO ac_data_ssccq VALUES ('10901', '1531207854', '20180710057', '7,2,8,8,3');
INSERT INTO ac_data_ssccq VALUES ('10909', '1531208469', '20180710058', '5,9,1,0,1');
INSERT INTO ac_data_ssccq VALUES ('10918', '1531209069', '20180710059', '0,6,0,4,1');
INSERT INTO ac_data_ssccq VALUES ('10926', '1531209671', '20180710060', '6,7,6,3,6');
INSERT INTO ac_data_ssccq VALUES ('10934', '1531210258', '20180710061', '3,6,1,4,0');
INSERT INTO ac_data_ssccq VALUES ('10942', '1531210873', '20180710062', '0,6,6,1,5');
INSERT INTO ac_data_ssccq VALUES ('10952', '1531211462', '20180710063', '0,8,4,3,5');
INSERT INTO ac_data_ssccq VALUES ('10959', '1531212067', '20180710064', '9,3,0,8,8');
INSERT INTO ac_data_ssccq VALUES ('10965', '1531212663', '20180710065', '0,2,6,8,4');
INSERT INTO ac_data_ssccq VALUES ('10973', '1531213260', '20180710066', '6,4,2,5,5');
INSERT INTO ac_data_ssccq VALUES ('10979', '1531213858', '20180710067', '1,0,5,0,7');
INSERT INTO ac_data_ssccq VALUES ('10986', '1531214454', '20180710068', '8,1,8,9,3');
INSERT INTO ac_data_ssccq VALUES ('10991', '1531215056', '20180710069', '4,0,1,1,2');
INSERT INTO ac_data_ssccq VALUES ('10997', '1531215660', '20180710070', '0,3,7,7,1');
INSERT INTO ac_data_ssccq VALUES ('11005', '1531216261', '20180710071', '4,8,3,0,0');
INSERT INTO ac_data_ssccq VALUES ('11012', '1531216857', '20180710072', '3,0,3,3,6');
INSERT INTO ac_data_ssccq VALUES ('11021', '1531217465', '20180710073', '8,3,4,0,9');
INSERT INTO ac_data_ssccq VALUES ('11027', '1531218063', '20180710074', '4,6,4,5,3');
INSERT INTO ac_data_ssccq VALUES ('11033', '1531218658', '20180710075', '7,8,5,3,2');
INSERT INTO ac_data_ssccq VALUES ('11041', '1531219268', '20180710076', '4,8,2,0,8');
INSERT INTO ac_data_ssccq VALUES ('11048', '1531219872', '20180710077', '8,8,4,8,7');
INSERT INTO ac_data_ssccq VALUES ('11056', '1531220462', '20180710078', '6,6,9,0,5');
INSERT INTO ac_data_ssccq VALUES ('11062', '1531221072', '20180710079', '4,2,1,6,6');
INSERT INTO ac_data_ssccq VALUES ('11070', '1531221671', '20180710080', '3,9,0,9,5');
INSERT INTO ac_data_ssccq VALUES ('11077', '1531222265', '20180710081', '6,9,3,0,9');
INSERT INTO ac_data_ssccq VALUES ('11083', '1531222869', '20180710082', '0,7,0,4,3');
INSERT INTO ac_data_ssccq VALUES ('11092', '1531223458', '20180710083', '3,4,5,8,8');
INSERT INTO ac_data_ssccq VALUES ('11100', '1531224067', '20180710084', '5,2,1,2,7');
INSERT INTO ac_data_ssccq VALUES ('11108', '1531224662', '20180710085', '4,3,4,5,3');
INSERT INTO ac_data_ssccq VALUES ('11116', '1531225263', '20180710086', '1,2,3,8,6');
INSERT INTO ac_data_ssccq VALUES ('11120', '1531225860', '20180710087', '7,4,1,5,7');
INSERT INTO ac_data_ssccq VALUES ('11124', '1531226461', '20180710088', '9,3,0,6,2');
INSERT INTO ac_data_ssccq VALUES ('11130', '1531227072', '20180710089', '8,3,9,8,4');
INSERT INTO ac_data_ssccq VALUES ('11138', '1531227659', '20180710090', '6,5,4,0,8');
INSERT INTO ac_data_ssccq VALUES ('11143', '1531228258', '20180710091', '3,7,6,1,5');
INSERT INTO ac_data_ssccq VALUES ('11153', '1531228876', '20180710092', '2,0,8,9,1');
INSERT INTO ac_data_ssccq VALUES ('11158', '1531229462', '20180710093', '5,0,3,3,6');
INSERT INTO ac_data_ssccq VALUES ('11165', '1531230057', '20180710094', '7,9,5,8,5');
INSERT INTO ac_data_ssccq VALUES ('11174', '1531230657', '20180710095', '7,5,0,3,8');
INSERT INTO ac_data_ssccq VALUES ('11179', '1531231262', '20180710096', '5,8,3,5,4');
INSERT INTO ac_data_ssccq VALUES ('11187', '1531231570', '20180710097', '8,1,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('11193', '1531231858', '20180710098', '5,2,2,9,2');
INSERT INTO ac_data_ssccq VALUES ('11201', '1531232166', '20180710099', '9,9,6,0,4');
INSERT INTO ac_data_ssccq VALUES ('11208', '1531232462', '20180710100', '4,4,0,7,6');
INSERT INTO ac_data_ssccq VALUES ('11246', '1531232767', '20180710101', '8,6,0,1,8');
INSERT INTO ac_data_ssccq VALUES ('11280', '1531233077', '20180710102', '9,9,1,0,8');
INSERT INTO ac_data_ssccq VALUES ('11308', '1531233352', '20180710103', '5,1,0,4,0');
INSERT INTO ac_data_ssccq VALUES ('11346', '1531233657', '20180710104', '2,5,5,6,7');
INSERT INTO ac_data_ssccq VALUES ('11383', '1531233958', '20180710105', '4,7,1,4,1');
INSERT INTO ac_data_ssccq VALUES ('11418', '1531234274', '20180710106', '4,7,1,4,8');
INSERT INTO ac_data_ssccq VALUES ('11448', '1531234561', '20180710107', '1,3,2,6,3');
INSERT INTO ac_data_ssccq VALUES ('11484', '1531234872', '20180710108', '7,1,1,8,0');
INSERT INTO ac_data_ssccq VALUES ('11518', '1531235163', '20180710109', '7,0,5,5,1');
INSERT INTO ac_data_ssccq VALUES ('11553', '1531235469', '20180710110', '6,4,2,7,1');
INSERT INTO ac_data_ssccq VALUES ('11587', '1531235768', '20180710111', '0,5,9,7,4');
INSERT INTO ac_data_ssccq VALUES ('11622', '1531236074', '20180710112', '1,5,7,9,9');
INSERT INTO ac_data_ssccq VALUES ('11654', '1531236367', '20180710113', '7,7,2,1,0');
INSERT INTO ac_data_ssccq VALUES ('11687', '1531236669', '20180710114', '4,7,3,6,8');
INSERT INTO ac_data_ssccq VALUES ('11719', '1531236959', '20180710115', '0,1,1,1,4');
INSERT INTO ac_data_ssccq VALUES ('11756', '1531237265', '20180710116', '9,9,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('11793', '1531237563', '20180710117', '4,3,3,6,8');
INSERT INTO ac_data_ssccq VALUES ('11829', '1531237870', '20180710118', '7,4,3,3,5');
INSERT INTO ac_data_ssccq VALUES ('11859', '1531238174', '20180710119', '0,0,7,6,4');
INSERT INTO ac_data_ssccq VALUES ('11897', '1531238462', '20180710120', '2,7,7,8,9');
INSERT INTO ac_data_ssccq VALUES ('11947', '1531238763', '20180711001', '7,0,4,2,6');
INSERT INTO ac_data_ssccq VALUES ('11954', '1531239055', '20180711002', '2,9,0,9,3');
INSERT INTO ac_data_ssccq VALUES ('11961', '1531239366', '20180711003', '1,2,3,6,0');
INSERT INTO ac_data_ssccq VALUES ('11969', '1531239669', '20180711004', '5,0,3,1,9');
INSERT INTO ac_data_ssccq VALUES ('11977', '1531239968', '20180711005', '7,3,2,0,2');
INSERT INTO ac_data_ssccq VALUES ('11984', '1531240259', '20180711006', '4,2,0,4,6');
INSERT INTO ac_data_ssccq VALUES ('11994', '1531240569', '20180711007', '3,4,8,3,8');
INSERT INTO ac_data_ssccq VALUES ('12001', '1531240858', '20180711008', '1,1,3,5,1');
INSERT INTO ac_data_ssccq VALUES ('12008', '1531241164', '20180711009', '2,5,0,1,0');
INSERT INTO ac_data_ssccq VALUES ('12016', '1531241467', '20180711010', '6,1,1,5,0');
INSERT INTO ac_data_ssccq VALUES ('12023', '1531241775', '20180711011', '7,9,3,5,1');
INSERT INTO ac_data_ssccq VALUES ('12031', '1531242069', '20180711012', '5,1,0,4,2');
INSERT INTO ac_data_ssccq VALUES ('12037', '1531242354', '20180711013', '9,9,4,5,7');
INSERT INTO ac_data_ssccq VALUES ('12043', '1531242661', '20180711014', '3,6,7,4,7');
INSERT INTO ac_data_ssccq VALUES ('12051', '1531242966', '20180711015', '7,6,2,4,1');
INSERT INTO ac_data_ssccq VALUES ('12059', '1531243257', '20180711016', '6,9,4,9,8');
INSERT INTO ac_data_ssccq VALUES ('12067', '1531243567', '20180711017', '3,4,0,0,3');
INSERT INTO ac_data_ssccq VALUES ('12073', '1531243855', '20180711018', '2,7,8,2,0');
INSERT INTO ac_data_ssccq VALUES ('12081', '1531244166', '20180711019', '8,3,1,5,1');
INSERT INTO ac_data_ssccq VALUES ('12088', '1531244458', '20180711020', '0,9,3,7,4');
INSERT INTO ac_data_ssccq VALUES ('12096', '1531244753', '20180711021', '1,9,5,8,7');
INSERT INTO ac_data_ssccq VALUES ('12104', '1531245073', '20180711022', '6,1,3,6,9');
INSERT INTO ac_data_ssccq VALUES ('12112', '1531245365', '20180711023', '9,1,9,1,8');
INSERT INTO ac_data_ssccq VALUES ('12161', '1531274472', '20180711024', '3,8,7,9,3');
INSERT INTO ac_data_ssccq VALUES ('12170', '1531275069', '20180711025', '1,0,7,0,1');
INSERT INTO ac_data_ssccq VALUES ('12176', '1531275656', '20180711026', '2,1,4,7,3');
INSERT INTO ac_data_ssccq VALUES ('12184', '1531276269', '20180711027', '0,0,4,7,8');
INSERT INTO ac_data_ssccq VALUES ('12194', '1531276869', '20180711028', '3,3,1,2,4');
INSERT INTO ac_data_ssccq VALUES ('12200', '1531277459', '20180711029', '3,1,4,1,0');
INSERT INTO ac_data_ssccq VALUES ('12208', '1531278068', '20180711030', '7,8,0,0,1');
INSERT INTO ac_data_ssccq VALUES ('12214', '1531278664', '20180711031', '2,1,8,6,8');
INSERT INTO ac_data_ssccq VALUES ('12222', '1531279261', '20180711032', '8,4,2,4,1');
INSERT INTO ac_data_ssccq VALUES ('12229', '1531279867', '20180711033', '4,3,6,4,2');
INSERT INTO ac_data_ssccq VALUES ('12236', '1531280469', '20180711034', '4,2,0,6,6');
INSERT INTO ac_data_ssccq VALUES ('12243', '1531281057', '20180711035', '5,1,6,0,7');
INSERT INTO ac_data_ssccq VALUES ('12248', '1531281656', '20180711036', '5,3,2,3,1');
INSERT INTO ac_data_ssccq VALUES ('12256', '1531282264', '20180711037', '6,9,7,2,5');
INSERT INTO ac_data_ssccq VALUES ('12264', '1531282863', '20180711038', '0,0,0,4,4');
INSERT INTO ac_data_ssccq VALUES ('12271', '1531283459', '20180711039', '2,8,8,8,0');
INSERT INTO ac_data_ssccq VALUES ('12279', '1531284066', '20180711040', '6,7,4,6,6');
INSERT INTO ac_data_ssccq VALUES ('12286', '1531284658', '20180711041', '6,2,1,7,9');
INSERT INTO ac_data_ssccq VALUES ('12296', '1531285268', '20180711042', '6,7,7,6,5');
INSERT INTO ac_data_ssccq VALUES ('12301', '1531285857', '20180711043', '8,1,4,4,1');
INSERT INTO ac_data_ssccq VALUES ('12307', '1531286462', '20180711044', '5,0,3,2,3');
INSERT INTO ac_data_ssccq VALUES ('12315', '1531287061', '20180711045', '6,5,6,4,9');
INSERT INTO ac_data_ssccq VALUES ('12323', '1531287667', '20180711046', '3,4,3,5,1');
INSERT INTO ac_data_ssccq VALUES ('12331', '1531288261', '20180711047', '0,3,1,1,7');
INSERT INTO ac_data_ssccq VALUES ('12338', '1531288871', '20180711048', '1,6,8,0,6');
INSERT INTO ac_data_ssccq VALUES ('12346', '1531289460', '20180711049', '1,9,3,0,5');
INSERT INTO ac_data_ssccq VALUES ('12354', '1531290060', '20180711050', '7,4,7,7,8');
INSERT INTO ac_data_ssccq VALUES ('12360', '1531290653', '20180711051', '2,9,4,9,2');
INSERT INTO ac_data_ssccq VALUES ('12367', '1531291256', '20180711052', '7,3,7,9,5');
INSERT INTO ac_data_ssccq VALUES ('12373', '1531291858', '20180711053', '0,7,3,1,6');
INSERT INTO ac_data_ssccq VALUES ('12381', '1531292456', '20180711054', '4,7,9,4,0');
INSERT INTO ac_data_ssccq VALUES ('12388', '1531293056', '20180711055', '6,6,1,5,4');
INSERT INTO ac_data_ssccq VALUES ('12395', '1531293662', '20180711056', '1,1,7,3,8');
INSERT INTO ac_data_ssccq VALUES ('12403', '1531294254', '20180711057', '2,7,0,2,1');
INSERT INTO ac_data_ssccq VALUES ('12411', '1531294869', '20180711058', '2,8,3,8,1');
INSERT INTO ac_data_ssccq VALUES ('12420', '1531295457', '20180711059', '6,3,1,1,9');
INSERT INTO ac_data_ssccq VALUES ('12427', '1531296056', '20180711060', '5,4,3,9,9');
INSERT INTO ac_data_ssccq VALUES ('12435', '1531296665', '20180711061', '4,8,9,5,9');
INSERT INTO ac_data_ssccq VALUES ('12442', '1531297264', '20180711062', '1,2,7,8,3');
INSERT INTO ac_data_ssccq VALUES ('12449', '1531297864', '20180711063', '4,1,4,3,7');
INSERT INTO ac_data_ssccq VALUES ('12457', '1531298470', '20180711064', '6,2,7,9,9');
INSERT INTO ac_data_ssccq VALUES ('12465', '1531299068', '20180711065', '9,2,8,3,9');
INSERT INTO ac_data_ssccq VALUES ('12472', '1531299658', '20180711066', '7,9,9,0,7');
INSERT INTO ac_data_ssccq VALUES ('12480', '1531300271', '20180711067', '9,6,8,8,3');
INSERT INTO ac_data_ssccq VALUES ('12488', '1531300866', '20180711068', '8,8,8,6,1');
INSERT INTO ac_data_ssccq VALUES ('12496', '1531301452', '20180711069', '9,2,2,7,8');
INSERT INTO ac_data_ssccq VALUES ('12503', '1531302068', '20180711070', '8,5,9,5,8');
INSERT INTO ac_data_ssccq VALUES ('12511', '1531302662', '20180711071', '0,2,9,3,1');
INSERT INTO ac_data_ssccq VALUES ('12519', '1531303272', '20180711072', '9,7,7,5,4');
INSERT INTO ac_data_ssccq VALUES ('12524', '1531303858', '20180711073', '0,7,3,3,9');
INSERT INTO ac_data_ssccq VALUES ('12531', '1531304455', '20180711074', '5,0,5,4,4');
INSERT INTO ac_data_ssccq VALUES ('12538', '1531305060', '20180711075', '1,7,7,8,8');
INSERT INTO ac_data_ssccq VALUES ('12548', '1531305668', '20180711076', '2,7,8,5,8');
INSERT INTO ac_data_ssccq VALUES ('12554', '1531306263', '20180711077', '2,4,8,3,2');
INSERT INTO ac_data_ssccq VALUES ('12564', '1531306868', '20180711078', '6,2,2,8,6');
INSERT INTO ac_data_ssccq VALUES ('12570', '1531307463', '20180711079', '4,1,0,1,8');
INSERT INTO ac_data_ssccq VALUES ('12576', '1531308059', '20180711080', '3,3,3,5,5');
INSERT INTO ac_data_ssccq VALUES ('12583', '1531308655', '20180711081', '3,1,3,6,9');
INSERT INTO ac_data_ssccq VALUES ('12590', '1531309258', '20180711082', '7,7,9,8,6');
INSERT INTO ac_data_ssccq VALUES ('12597', '1531309853', '20180711083', '5,2,6,3,1');
INSERT INTO ac_data_ssccq VALUES ('12604', '1531310459', '20180711084', '1,6,4,8,8');
INSERT INTO ac_data_ssccq VALUES ('12608', '1531311055', '20180711085', '1,1,4,3,8');
INSERT INTO ac_data_ssccq VALUES ('12614', '1531311661', '20180711086', '8,0,9,5,4');
INSERT INTO ac_data_ssccq VALUES ('12621', '1531312263', '20180711087', '8,8,5,0,9');
INSERT INTO ac_data_ssccq VALUES ('12629', '1531312856', '20180711088', '6,0,1,5,5');
INSERT INTO ac_data_ssccq VALUES ('12637', '1531313463', '20180711089', '0,4,8,7,5');
INSERT INTO ac_data_ssccq VALUES ('12645', '1531314066', '20180711090', '1,5,8,7,2');
INSERT INTO ac_data_ssccq VALUES ('12651', '1531314657', '20180711091', '3,0,3,8,6');
INSERT INTO ac_data_ssccq VALUES ('12658', '1531315273', '20180711092', '7,3,8,8,6');
INSERT INTO ac_data_ssccq VALUES ('12669', '1531315878', '20180711093', '6,4,7,3,0');
INSERT INTO ac_data_ssccq VALUES ('12676', '1531316457', '20180711094', '5,6,4,1,7');
INSERT INTO ac_data_ssccq VALUES ('12684', '1531317062', '20180711095', '9,1,3,2,8');
INSERT INTO ac_data_ssccq VALUES ('12691', '1531317654', '20180711096', '9,7,4,7,4');
INSERT INTO ac_data_ssccq VALUES ('12699', '1531317961', '20180711097', '8,7,9,7,4');
INSERT INTO ac_data_ssccq VALUES ('12704', '1531318264', '20180711098', '5,0,9,5,9');
INSERT INTO ac_data_ssccq VALUES ('12711', '1531318563', '20180711099', '3,0,8,2,6');
INSERT INTO ac_data_ssccq VALUES ('12718', '1531318861', '20180711100', '1,6,7,3,7');
INSERT INTO ac_data_ssccq VALUES ('12754', '1531319156', '20180711101', '8,3,3,9,2');
INSERT INTO ac_data_ssccq VALUES ('12791', '1531319457', '20180711102', '9,4,6,8,6');
INSERT INTO ac_data_ssccq VALUES ('12827', '1531319758', '20180711103', '0,2,2,9,6');
INSERT INTO ac_data_ssccq VALUES ('12864', '1531320065', '20180711104', '3,4,5,3,9');
INSERT INTO ac_data_ssccq VALUES ('12899', '1531320357', '20180711105', '0,4,7,5,5');
INSERT INTO ac_data_ssccq VALUES ('12933', '1531320654', '20180711106', '2,8,3,4,8');
INSERT INTO ac_data_ssccq VALUES ('12968', '1531320956', '20180711107', '9,7,3,1,1');
INSERT INTO ac_data_ssccq VALUES ('13005', '1531321265', '20180711108', '2,9,7,3,7');
INSERT INTO ac_data_ssccq VALUES ('13036', '1531321554', '20180711109', '4,2,2,9,4');
INSERT INTO ac_data_ssccq VALUES ('13072', '1531321866', '20180711110', '1,6,5,6,4');
INSERT INTO ac_data_ssccq VALUES ('13107', '1531322161', '20180711111', '9,4,2,1,1');
INSERT INTO ac_data_ssccq VALUES ('13140', '1531322457', '20180711112', '2,8,4,7,0');
INSERT INTO ac_data_ssccq VALUES ('13172', '1531322757', '20180711113', '2,3,2,9,0');
INSERT INTO ac_data_ssccq VALUES ('13208', '1531323073', '20180711114', '5,1,0,6,1');
INSERT INTO ac_data_ssccq VALUES ('13241', '1531323361', '20180711115', '5,9,3,9,4');
INSERT INTO ac_data_ssccq VALUES ('13276', '1531323663', '20180711116', '2,4,8,9,8');
INSERT INTO ac_data_ssccq VALUES ('13306', '1531323967', '20180711117', '5,0,0,7,0');
INSERT INTO ac_data_ssccq VALUES ('13341', '1531324265', '20180711118', '7,9,3,4,8');
INSERT INTO ac_data_ssccq VALUES ('13377', '1531324564', '20180711119', '2,9,9,4,7');
INSERT INTO ac_data_ssccq VALUES ('13378', '1531324867', '20180711120', '4,3,8,8,0');
INSERT INTO ac_data_ssccq VALUES ('13425', '1531325154', '20180712001', '5,4,3,7,9');
INSERT INTO ac_data_ssccq VALUES ('13432', '1531325463', '20180712002', '3,9,7,1,4');
INSERT INTO ac_data_ssccq VALUES ('13442', '1531325770', '20180712003', '4,0,4,8,6');
INSERT INTO ac_data_ssccq VALUES ('13450', '1531326063', '20180712004', '5,5,8,2,5');
INSERT INTO ac_data_ssccq VALUES ('13456', '1531326359', '20180712005', '1,4,0,4,0');
INSERT INTO ac_data_ssccq VALUES ('13464', '1531326668', '20180712006', '7,7,0,7,7');
INSERT INTO ac_data_ssccq VALUES ('13472', '1531326981', '20180712007', '2,2,4,9,5');
INSERT INTO ac_data_ssccq VALUES ('13479', '1531327266', '20180712008', '5,6,1,4,0');
INSERT INTO ac_data_ssccq VALUES ('13486', '1531327584', '20180712009', '8,7,9,0,4');
INSERT INTO ac_data_ssccq VALUES ('13495', '1531327866', '20180712010', '0,5,0,3,9');
INSERT INTO ac_data_ssccq VALUES ('13502', '1531328156', '20180712011', '6,8,4,2,1');
INSERT INTO ac_data_ssccq VALUES ('13512', '1531328467', '20180712012', '5,1,5,9,2');
INSERT INTO ac_data_ssccq VALUES ('13519', '1531328766', '20180712013', '1,2,0,2,7');
INSERT INTO ac_data_ssccq VALUES ('13527', '1531329064', '20180712014', '6,0,7,8,5');
INSERT INTO ac_data_ssccq VALUES ('13534', '1531329353', '20180712015', '7,4,0,4,8');
INSERT INTO ac_data_ssccq VALUES ('13541', '1531329660', '20180712016', '1,6,7,8,0');
INSERT INTO ac_data_ssccq VALUES ('13549', '1531329956', '20180712017', '6,0,0,4,8');
INSERT INTO ac_data_ssccq VALUES ('13557', '1531330267', '20180712018', '5,4,7,2,4');
INSERT INTO ac_data_ssccq VALUES ('13565', '1531330566', '20180712019', '3,2,2,8,1');
INSERT INTO ac_data_ssccq VALUES ('13572', '1531330865', '20180712020', '9,8,1,2,3');
INSERT INTO ac_data_ssccq VALUES ('13579', '1531331164', '20180712021', '4,2,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('13590', '1531331481', '20180712022', '8,3,8,7,3');
INSERT INTO ac_data_ssccq VALUES ('13598', '1531331768', '20180712023', '1,2,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('13648', '1531360879', '20180712024', '5,6,5,6,9');
INSERT INTO ac_data_ssccq VALUES ('13657', '1531361469', '20180712025', '7,9,5,3,5');
INSERT INTO ac_data_ssccq VALUES ('13666', '1531362064', '20180712026', '3,8,0,2,3');
INSERT INTO ac_data_ssccq VALUES ('13674', '1531362668', '20180712027', '5,6,1,6,2');
INSERT INTO ac_data_ssccq VALUES ('13682', '1531363254', '20180712028', '8,1,3,3,1');
INSERT INTO ac_data_ssccq VALUES ('13689', '1531363854', '20180712029', '4,3,5,8,3');
INSERT INTO ac_data_ssccq VALUES ('13696', '1531364462', '20180712030', '9,8,7,9,5');
INSERT INTO ac_data_ssccq VALUES ('13702', '1531365052', '20180712031', '6,5,8,2,2');
INSERT INTO ac_data_ssccq VALUES ('13708', '1531365649', '20180712032', '8,4,4,6,8');
INSERT INTO ac_data_ssccq VALUES ('13718', '1531366266', '20180712033', '6,7,3,2,8');
INSERT INTO ac_data_ssccq VALUES ('13725', '1531366870', '20180712034', '6,7,4,2,1');
INSERT INTO ac_data_ssccq VALUES ('13735', '1531367467', '20180712035', '9,1,6,5,2');
INSERT INTO ac_data_ssccq VALUES ('13742', '1531368054', '20180712036', '1,8,9,3,6');
INSERT INTO ac_data_ssccq VALUES ('13750', '1531368666', '20180712037', '6,7,2,8,6');
INSERT INTO ac_data_ssccq VALUES ('13758', '1531369272', '20180712038', '8,9,5,7,9');
INSERT INTO ac_data_ssccq VALUES ('13767', '1531369874', '20180712039', '1,1,8,8,8');
INSERT INTO ac_data_ssccq VALUES ('13775', '1531370454', '20180712040', '1,6,7,0,0');
INSERT INTO ac_data_ssccq VALUES ('13782', '1531371052', '20180712041', '8,1,1,7,2');
INSERT INTO ac_data_ssccq VALUES ('13790', '1531371655', '20180712042', '6,8,2,9,5');
INSERT INTO ac_data_ssccq VALUES ('13796', '1531372257', '20180712043', '1,2,3,2,7');
INSERT INTO ac_data_ssccq VALUES ('13803', '1531372861', '20180712044', '9,2,7,7,5');
INSERT INTO ac_data_ssccq VALUES ('13811', '1531373454', '20180712045', '1,2,2,2,1');
INSERT INTO ac_data_ssccq VALUES ('13819', '1531374067', '20180712046', '3,7,5,0,1');
INSERT INTO ac_data_ssccq VALUES ('13827', '1531374666', '20180712047', '2,9,9,8,0');
INSERT INTO ac_data_ssccq VALUES ('13834', '1531375254', '20180712048', '0,7,6,8,1');
INSERT INTO ac_data_ssccq VALUES ('13842', '1531375868', '20180712049', '8,0,9,7,2');
INSERT INTO ac_data_ssccq VALUES ('13851', '1531376459', '20180712050', '1,7,9,5,6');
INSERT INTO ac_data_ssccq VALUES ('13858', '1531377062', '20180712051', '8,6,3,8,6');
INSERT INTO ac_data_ssccq VALUES ('13867', '1531377658', '20180712052', '2,9,2,9,6');
INSERT INTO ac_data_ssccq VALUES ('13874', '1531378262', '20180712053', '4,0,5,6,3');
INSERT INTO ac_data_ssccq VALUES ('13880', '1531378858', '20180712054', '4,7,1,2,1');
INSERT INTO ac_data_ssccq VALUES ('13890', '1531379470', '20180712055', '6,8,0,9,3');
INSERT INTO ac_data_ssccq VALUES ('13897', '1531380066', '20180712056', '3,1,5,4,8');
INSERT INTO ac_data_ssccq VALUES ('13905', '1531380656', '20180712057', '6,8,9,9,5');
INSERT INTO ac_data_ssccq VALUES ('13912', '1531381258', '20180712058', '2,6,8,0,3');
INSERT INTO ac_data_ssccq VALUES ('13922', '1531381873', '20180712059', '6,2,7,1,8');
INSERT INTO ac_data_ssccq VALUES ('13930', '1531382484', '20180712060', '5,9,0,5,8');
INSERT INTO ac_data_ssccq VALUES ('13939', '1531383061', '20180712061', '9,2,6,6,9');
INSERT INTO ac_data_ssccq VALUES ('13949', '1531383670', '20180712062', '7,3,1,2,9');
INSERT INTO ac_data_ssccq VALUES ('13955', '1531384261', '20180712063', '2,5,5,9,6');
INSERT INTO ac_data_ssccq VALUES ('13964', '1531384866', '20180712064', '5,8,9,8,1');
INSERT INTO ac_data_ssccq VALUES ('13972', '1531385465', '20180712065', '5,3,7,9,2');
INSERT INTO ac_data_ssccq VALUES ('13981', '1531386067', '20180712066', '1,4,3,6,4');
INSERT INTO ac_data_ssccq VALUES ('13990', '1531386670', '20180712067', '9,7,1,7,9');
INSERT INTO ac_data_ssccq VALUES ('13998', '1531387267', '20180712068', '9,0,8,6,0');
INSERT INTO ac_data_ssccq VALUES ('14008', '1531387864', '20180712069', '5,9,5,9,2');
INSERT INTO ac_data_ssccq VALUES ('14016', '1531388470', '20180712070', '4,9,0,4,7');
INSERT INTO ac_data_ssccq VALUES ('14026', '1531389073', '20180712071', '7,6,7,9,9');
INSERT INTO ac_data_ssccq VALUES ('14034', '1531389665', '20180712072', '0,4,2,8,9');
INSERT INTO ac_data_ssccq VALUES ('14042', '1531390278', '20180712073', '0,8,7,0,6');
INSERT INTO ac_data_ssccq VALUES ('14051', '1531390872', '20180712074', '5,9,0,6,0');
INSERT INTO ac_data_ssccq VALUES ('14059', '1531391466', '20180712075', '1,3,7,0,9');
INSERT INTO ac_data_ssccq VALUES ('14068', '1531392065', '20180712076', '5,5,5,3,6');
INSERT INTO ac_data_ssccq VALUES ('14076', '1531392669', '20180712077', '0,3,4,6,9');
INSERT INTO ac_data_ssccq VALUES ('14082', '1531393257', '20180712078', '4,5,9,1,3');
INSERT INTO ac_data_ssccq VALUES ('14091', '1531393869', '20180712079', '1,2,3,7,6');
INSERT INTO ac_data_ssccq VALUES ('14097', '1531394458', '20180712080', '5,3,1,5,3');
INSERT INTO ac_data_ssccq VALUES ('14107', '1531395068', '20180712081', '7,9,8,4,8');
INSERT INTO ac_data_ssccq VALUES ('14113', '1531395653', '20180712082', '9,0,2,0,5');
INSERT INTO ac_data_ssccq VALUES ('14122', '1531396272', '20180712083', '6,1,7,4,0');
INSERT INTO ac_data_ssccq VALUES ('14131', '1531396869', '20180712084', '8,6,1,6,6');
INSERT INTO ac_data_ssccq VALUES ('14138', '1531397464', '20180712085', '4,9,8,0,8');
INSERT INTO ac_data_ssccq VALUES ('14149', '1531398063', '20180712086', '4,9,9,5,8');
INSERT INTO ac_data_ssccq VALUES ('14157', '1531398661', '20180712087', '9,3,5,7,3');
INSERT INTO ac_data_ssccq VALUES ('14164', '1531399263', '20180712088', '4,6,8,2,7');
INSERT INTO ac_data_ssccq VALUES ('14172', '1531399857', '20180712089', '9,2,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('14176', '1531400457', '20180712090', '3,7,0,4,4');
INSERT INTO ac_data_ssccq VALUES ('14186', '1531401066', '20180712091', '1,9,0,6,6');
INSERT INTO ac_data_ssccq VALUES ('14195', '1531401670', '20180712092', '4,9,9,0,4');
INSERT INTO ac_data_ssccq VALUES ('14204', '1531402262', '20180712093', '5,6,5,4,4');
INSERT INTO ac_data_ssccq VALUES ('14210', '1531402875', '20180712094', '1,1,7,3,1');
INSERT INTO ac_data_ssccq VALUES ('14215', '1531403466', '20180712095', '9,6,9,9,2');
INSERT INTO ac_data_ssccq VALUES ('14223', '1531404070', '20180712096', '4,5,6,3,8');
INSERT INTO ac_data_ssccq VALUES ('14229', '1531404353', '20180712097', '9,5,0,6,3');
INSERT INTO ac_data_ssccq VALUES ('14234', '1531404665', '20180712098', '4,8,1,0,3');
INSERT INTO ac_data_ssccq VALUES ('14244', '1531404966', '20180712099', '6,6,9,6,9');
INSERT INTO ac_data_ssccq VALUES ('14253', '1531405271', '20180712100', '7,0,9,5,6');
INSERT INTO ac_data_ssccq VALUES ('14286', '1531405556', '20180712101', '5,5,0,0,4');
INSERT INTO ac_data_ssccq VALUES ('14321', '1531405871', '20180712102', '9,6,1,0,0');
INSERT INTO ac_data_ssccq VALUES ('14355', '1531406167', '20180712103', '3,3,2,6,1');
INSERT INTO ac_data_ssccq VALUES ('14389', '1531406471', '20180712104', '2,4,3,1,1');
INSERT INTO ac_data_ssccq VALUES ('14423', '1531406761', '20180712105', '4,2,5,3,3');
INSERT INTO ac_data_ssccq VALUES ('14459', '1531407070', '20180712106', '5,4,2,9,8');
INSERT INTO ac_data_ssccq VALUES ('14490', '1531407365', '20180712107', '4,3,5,5,3');
INSERT INTO ac_data_ssccq VALUES ('14526', '1531407661', '20180712108', '6,4,9,8,3');
INSERT INTO ac_data_ssccq VALUES ('14562', '1531407959', '20180712109', '2,9,9,1,5');
INSERT INTO ac_data_ssccq VALUES ('14598', '1531408264', '20180712110', '9,2,0,3,7');
INSERT INTO ac_data_ssccq VALUES ('14634', '1531408570', '20180712111', '8,0,2,3,2');
INSERT INTO ac_data_ssccq VALUES ('14666', '1531408871', '20180712112', '5,9,7,9,2');
INSERT INTO ac_data_ssccq VALUES ('14698', '1531409162', '20180712113', '7,6,7,9,5');
INSERT INTO ac_data_ssccq VALUES ('14731', '1531409461', '20180712114', '9,9,7,4,8');
INSERT INTO ac_data_ssccq VALUES ('14766', '1531409758', '20180712115', '9,0,9,7,3');
INSERT INTO ac_data_ssccq VALUES ('14801', '1531410063', '20180712116', '3,3,4,3,9');
INSERT INTO ac_data_ssccq VALUES ('14834', '1531410361', '20180712117', '6,2,6,7,9');
INSERT INTO ac_data_ssccq VALUES ('14865', '1531410663', '20180712118', '8,7,1,4,9');
INSERT INTO ac_data_ssccq VALUES ('14901', '1531410975', '20180712119', '6,7,9,5,9');
INSERT INTO ac_data_ssccq VALUES ('14933', '1531411259', '20180712120', '1,8,7,0,2');
INSERT INTO ac_data_ssccq VALUES ('14983', '1531411572', '20180713001', '8,1,5,5,6');
INSERT INTO ac_data_ssccq VALUES ('14990', '1531411868', '20180713002', '6,9,4,0,3');
INSERT INTO ac_data_ssccq VALUES ('14998', '1531412155', '20180713003', '9,2,9,2,0');
INSERT INTO ac_data_ssccq VALUES ('15005', '1531412466', '20180713004', '6,8,9,6,7');
INSERT INTO ac_data_ssccq VALUES ('15013', '1531412771', '20180713005', '7,6,0,5,8');
INSERT INTO ac_data_ssccq VALUES ('15020', '1531413069', '20180713006', '9,5,0,2,8');
INSERT INTO ac_data_ssccq VALUES ('15024', '1531413371', '20180713007', '2,6,5,5,3');
INSERT INTO ac_data_ssccq VALUES ('15033', '1531413668', '20180713008', '3,7,8,1,3');
INSERT INTO ac_data_ssccq VALUES ('15039', '1531413973', '20180713009', '8,1,5,5,5');
INSERT INTO ac_data_ssccq VALUES ('15046', '1531414259', '20180713010', '1,8,7,0,5');
INSERT INTO ac_data_ssccq VALUES ('15053', '1531414567', '20180713011', '7,5,4,7,6');
INSERT INTO ac_data_ssccq VALUES ('15062', '1531414884', '20180713012', '6,8,5,7,8');
INSERT INTO ac_data_ssccq VALUES ('15070', '1531415154', '20180713013', '5,7,6,8,3');
INSERT INTO ac_data_ssccq VALUES ('15078', '1531415468', '20180713014', '1,7,5,4,9');
INSERT INTO ac_data_ssccq VALUES ('15084', '1531415768', '20180713015', '4,6,9,4,0');
INSERT INTO ac_data_ssccq VALUES ('15090', '1531416052', '20180713016', '4,4,9,7,1');
INSERT INTO ac_data_ssccq VALUES ('15097', '1531416357', '20180713017', '7,5,8,8,1');
INSERT INTO ac_data_ssccq VALUES ('15105', '1531416652', '20180713018', '7,7,7,2,8');
INSERT INTO ac_data_ssccq VALUES ('15111', '1531416954', '20180713019', '6,7,6,5,2');
INSERT INTO ac_data_ssccq VALUES ('15117', '1531417255', '20180713020', '6,0,7,2,5');
INSERT INTO ac_data_ssccq VALUES ('15124', '1531417554', '20180713021', '9,3,9,1,8');
INSERT INTO ac_data_ssccq VALUES ('15131', '1531417868', '20180713022', '5,1,8,4,6');
INSERT INTO ac_data_ssccq VALUES ('15139', '1531418167', '20180713023', '1,9,1,5,1');
INSERT INTO ac_data_ssccq VALUES ('15186', '1531447269', '20180713024', '8,5,4,7,5');
INSERT INTO ac_data_ssccq VALUES ('15194', '1531447870', '20180713025', '8,4,9,9,5');
INSERT INTO ac_data_ssccq VALUES ('15204', '1531448463', '20180713026', '2,2,2,1,2');
INSERT INTO ac_data_ssccq VALUES ('15210', '1531449063', '20180713027', '3,4,3,7,3');
INSERT INTO ac_data_ssccq VALUES ('15220', '1531449656', '20180713028', '3,2,8,9,1');
INSERT INTO ac_data_ssccq VALUES ('15227', '1531450265', '20180713029', '9,8,7,9,4');
INSERT INTO ac_data_ssccq VALUES ('15230', '1531450889', '20180713030', '3,8,6,1,2');
INSERT INTO ac_data_ssccq VALUES ('15238', '1531451460', '20180713031', '9,1,6,2,7');
INSERT INTO ac_data_ssccq VALUES ('15243', '1531452059', '20180713032', '7,3,9,9,7');
INSERT INTO ac_data_ssccq VALUES ('15252', '1531452671', '20180713033', '0,7,0,6,0');
INSERT INTO ac_data_ssccq VALUES ('15259', '1531453254', '20180713034', '0,5,2,0,3');
INSERT INTO ac_data_ssccq VALUES ('15265', '1531453857', '20180713035', '1,1,9,2,0');
INSERT INTO ac_data_ssccq VALUES ('15274', '1531454449', '20180713036', '4,1,4,8,5');
INSERT INTO ac_data_ssccq VALUES ('15279', '1531455062', '20180713037', '4,9,5,9,6');
INSERT INTO ac_data_ssccq VALUES ('15287', '1531455664', '20180713038', '5,7,5,4,9');
INSERT INTO ac_data_ssccq VALUES ('15295', '1531456272', '20180713039', '4,6,4,6,7');
INSERT INTO ac_data_ssccq VALUES ('15301', '1531456866', '20180713040', '4,4,9,1,5');
INSERT INTO ac_data_ssccq VALUES ('15308', '1531457460', '20180713041', '5,9,1,3,2');
INSERT INTO ac_data_ssccq VALUES ('15316', '1531458061', '20180713042', '9,7,6,2,9');
INSERT INTO ac_data_ssccq VALUES ('15323', '1531458665', '20180713043', '6,9,0,1,7');
INSERT INTO ac_data_ssccq VALUES ('15331', '1531459267', '20180713044', '8,0,8,2,2');
INSERT INTO ac_data_ssccq VALUES ('15340', '1531459858', '20180713045', '2,6,1,7,4');
INSERT INTO ac_data_ssccq VALUES ('15347', '1531460470', '20180713046', '2,9,2,1,7');
INSERT INTO ac_data_ssccq VALUES ('15353', '1531461059', '20180713047', '4,9,5,4,3');
INSERT INTO ac_data_ssccq VALUES ('15361', '1531461662', '20180713048', '9,0,3,5,1');
INSERT INTO ac_data_ssccq VALUES ('15367', '1531462267', '20180713049', '8,1,0,0,0');
INSERT INTO ac_data_ssccq VALUES ('15375', '1531462855', '20180713050', '5,5,8,5,4');
INSERT INTO ac_data_ssccq VALUES ('15381', '1531463454', '20180713051', '6,6,9,5,2');
INSERT INTO ac_data_ssccq VALUES ('15385', '1531464050', '20180713052', '0,5,0,8,1');
INSERT INTO ac_data_ssccq VALUES ('15390', '1531464649', '20180713053', '8,4,2,6,0');
INSERT INTO ac_data_ssccq VALUES ('15397', '1531465265', '20180713054', '6,3,8,4,0');
INSERT INTO ac_data_ssccq VALUES ('15405', '1531465865', '20180713055', '5,3,6,7,7');
INSERT INTO ac_data_ssccq VALUES ('15410', '1531466450', '20180713056', '0,0,4,5,2');
INSERT INTO ac_data_ssccq VALUES ('15420', '1531467062', '20180713057', '3,1,0,7,2');
INSERT INTO ac_data_ssccq VALUES ('15425', '1531467656', '20180713058', '2,3,7,7,0');
INSERT INTO ac_data_ssccq VALUES ('15431', '1531468256', '20180713059', '7,7,6,0,9');
INSERT INTO ac_data_ssccq VALUES ('15440', '1531468870', '20180713060', '1,9,6,6,2');
INSERT INTO ac_data_ssccq VALUES ('15447', '1531469469', '20180713061', '3,6,3,2,5');
INSERT INTO ac_data_ssccq VALUES ('15455', '1531470071', '20180713062', '4,3,3,2,2');
INSERT INTO ac_data_ssccq VALUES ('15460', '1531470653', '20180713063', '3,5,9,1,8');
INSERT INTO ac_data_ssccq VALUES ('15466', '1531471263', '20180713064', '4,5,4,6,6');
INSERT INTO ac_data_ssccq VALUES ('15472', '1531471854', '20180713065', '7,0,0,6,0');
INSERT INTO ac_data_ssccq VALUES ('15480', '1531472465', '20180713066', '0,0,0,3,2');
INSERT INTO ac_data_ssccq VALUES ('15489', '1531473056', '20180713067', '4,1,3,8,4');
INSERT INTO ac_data_ssccq VALUES ('15496', '1531473658', '20180713068', '6,3,5,2,2');
INSERT INTO ac_data_ssccq VALUES ('15504', '1531474265', '20180713069', '2,7,5,6,4');
INSERT INTO ac_data_ssccq VALUES ('15510', '1531474856', '20180713070', '2,6,8,4,1');
INSERT INTO ac_data_ssccq VALUES ('15516', '1531475449', '20180713071', '6,5,0,3,6');
INSERT INTO ac_data_ssccq VALUES ('15523', '1531476062', '20180713072', '5,2,3,8,3');
INSERT INTO ac_data_ssccq VALUES ('15529', '1531476657', '20180713073', '8,3,8,5,5');
INSERT INTO ac_data_ssccq VALUES ('15537', '1531477260', '20180713074', '3,3,4,7,5');
INSERT INTO ac_data_ssccq VALUES ('15544', '1531477868', '20180713075', '0,4,8,0,3');
INSERT INTO ac_data_ssccq VALUES ('15549', '1531478451', '20180713076', '7,9,6,0,3');
INSERT INTO ac_data_ssccq VALUES ('15556', '1531479061', '20180713077', '6,3,2,1,9');
INSERT INTO ac_data_ssccq VALUES ('15562', '1531479657', '20180713078', '0,5,0,2,0');
INSERT INTO ac_data_ssccq VALUES ('15571', '1531480273', '20180713079', '5,2,4,7,2');
INSERT INTO ac_data_ssccq VALUES ('15577', '1531480859', '20180713080', '7,9,0,9,9');
INSERT INTO ac_data_ssccq VALUES ('15587', '1531481462', '20180713081', '2,2,5,7,2');
INSERT INTO ac_data_ssccq VALUES ('15593', '1531482074', '20180713082', '5,0,4,2,7');
INSERT INTO ac_data_ssccq VALUES ('15598', '1531482668', '20180713083', '1,6,8,2,6');
INSERT INTO ac_data_ssccq VALUES ('15607', '1531483267', '20180713084', '1,5,9,3,5');
INSERT INTO ac_data_ssccq VALUES ('15614', '1531483856', '20180713085', '2,4,4,1,8');
INSERT INTO ac_data_ssccq VALUES ('15624', '1531484460', '20180713086', '4,7,6,7,4');
INSERT INTO ac_data_ssccq VALUES ('15630', '1531485059', '20180713087', '5,0,4,0,7');
INSERT INTO ac_data_ssccq VALUES ('15636', '1531485663', '20180713088', '0,3,6,2,2');
INSERT INTO ac_data_ssccq VALUES ('15645', '1531486261', '20180713089', '2,8,7,7,8');
INSERT INTO ac_data_ssccq VALUES ('15651', '1531486854', '20180713090', '8,1,1,0,7');
INSERT INTO ac_data_ssccq VALUES ('15658', '1531487457', '20180713091', '7,7,1,2,8');
INSERT INTO ac_data_ssccq VALUES ('15665', '1531488070', '20180713092', '4,6,2,4,8');
INSERT INTO ac_data_ssccq VALUES ('15675', '1531488673', '20180713093', '7,5,8,6,4');
INSERT INTO ac_data_ssccq VALUES ('15682', '1531489260', '20180713094', '3,8,7,8,4');
INSERT INTO ac_data_ssccq VALUES ('15690', '1531489873', '20180713095', '0,1,3,3,4');
INSERT INTO ac_data_ssccq VALUES ('15697', '1531490476', '20180713096', '6,8,3,9,2');
INSERT INTO ac_data_ssccq VALUES ('15705', '1531490762', '20180713097', '2,9,7,5,6');
INSERT INTO ac_data_ssccq VALUES ('15712', '1531491062', '20180713098', '5,5,6,3,0');
INSERT INTO ac_data_ssccq VALUES ('15719', '1531491359', '20180713099', '5,5,1,6,6');
INSERT INTO ac_data_ssccq VALUES ('15726', '1531491655', '20180713100', '9,6,1,0,2');
INSERT INTO ac_data_ssccq VALUES ('15760', '1531491958', '20180713101', '2,4,5,6,9');
INSERT INTO ac_data_ssccq VALUES ('15791', '1531492249', '20180713102', '0,7,7,3,8');
INSERT INTO ac_data_ssccq VALUES ('15826', '1531492557', '20180713103', '2,8,8,5,0');
INSERT INTO ac_data_ssccq VALUES ('15859', '1531492859', '20180713104', '1,7,8,1,3');
INSERT INTO ac_data_ssccq VALUES ('15892', '1531493148', '20180713105', '7,6,6,2,3');
INSERT INTO ac_data_ssccq VALUES ('15926', '1531493466', '20180713106', '7,8,4,6,0');
INSERT INTO ac_data_ssccq VALUES ('15960', '1531493764', '20180713107', '8,9,2,9,8');
INSERT INTO ac_data_ssccq VALUES ('15994', '1531494062', '20180713108', '5,0,7,3,2');
INSERT INTO ac_data_ssccq VALUES ('16026', '1531494368', '20180713109', '6,6,3,9,8');
INSERT INTO ac_data_ssccq VALUES ('16061', '1531494665', '20180713110', '6,7,4,0,7');
INSERT INTO ac_data_ssccq VALUES ('16096', '1531494961', '20180713111', '2,6,4,8,2');
INSERT INTO ac_data_ssccq VALUES ('16129', '1531495266', '20180713112', '4,5,3,7,4');
INSERT INTO ac_data_ssccq VALUES ('16165', '1531495559', '20180713113', '4,9,0,8,1');
INSERT INTO ac_data_ssccq VALUES ('16202', '1531495865', '20180713114', '8,0,9,4,1');
INSERT INTO ac_data_ssccq VALUES ('16237', '1531496162', '20180713115', '0,4,8,0,0');
INSERT INTO ac_data_ssccq VALUES ('16273', '1531496461', '20180713116', '9,3,8,9,3');
INSERT INTO ac_data_ssccq VALUES ('16308', '1531496759', '20180713117', '6,1,1,5,3');
INSERT INTO ac_data_ssccq VALUES ('16343', '1531497067', '20180713118', '5,2,7,0,8');
INSERT INTO ac_data_ssccq VALUES ('16376', '1531497361', '20180713119', '7,0,3,4,7');
INSERT INTO ac_data_ssccq VALUES ('16408', '1531497658', '20180713120', '2,5,4,5,9');
INSERT INTO ac_data_ssccq VALUES ('16460', '1531497962', '20180714001', '3,3,5,9,2');
INSERT INTO ac_data_ssccq VALUES ('16468', '1531498264', '20180714002', '0,9,1,3,5');
INSERT INTO ac_data_ssccq VALUES ('16475', '1531498561', '20180714003', '6,5,8,5,3');
INSERT INTO ac_data_ssccq VALUES ('16485', '1531498870', '20180714004', '9,2,5,6,5');
INSERT INTO ac_data_ssccq VALUES ('16492', '1531499167', '20180714005', '6,4,5,0,1');
INSERT INTO ac_data_ssccq VALUES ('16499', '1531499467', '20180714006', '2,2,8,2,9');
INSERT INTO ac_data_ssccq VALUES ('16506', '1531499764', '20180714007', '5,0,6,0,0');
INSERT INTO ac_data_ssccq VALUES ('16509', '1531500089', '20180714008', '4,9,0,0,3');
INSERT INTO ac_data_ssccq VALUES ('16517', '1531500355', '20180714009', '3,4,3,0,7');
INSERT INTO ac_data_ssccq VALUES ('16523', '1531500654', '20180714010', '8,6,5,1,1');
INSERT INTO ac_data_ssccq VALUES ('16529', '1531500957', '20180714011', '0,0,4,2,3');
INSERT INTO ac_data_ssccq VALUES ('16537', '1531501269', '20180714012', '3,7,2,5,2');
INSERT INTO ac_data_ssccq VALUES ('16545', '1531501558', '20180714013', '6,7,0,0,8');
INSERT INTO ac_data_ssccq VALUES ('16551', '1531501858', '20180714014', '0,2,2,7,7');
INSERT INTO ac_data_ssccq VALUES ('16557', '1531502156', '20180714015', '1,0,0,7,0');
INSERT INTO ac_data_ssccq VALUES ('16563', '1531502456', '20180714016', '0,8,6,0,3');
INSERT INTO ac_data_ssccq VALUES ('16569', '1531502755', '20180714017', '4,1,1,7,0');
INSERT INTO ac_data_ssccq VALUES ('16578', '1531503054', '20180714018', '0,0,4,2,7');
INSERT INTO ac_data_ssccq VALUES ('16584', '1531503355', '20180714019', '1,7,9,0,5');
INSERT INTO ac_data_ssccq VALUES ('16590', '1531503655', '20180714020', '1,1,1,7,0');
INSERT INTO ac_data_ssccq VALUES ('16596', '1531503954', '20180714021', '0,1,3,0,4');
INSERT INTO ac_data_ssccq VALUES ('16604', '1531504262', '20180714022', '9,9,8,7,8');
INSERT INTO ac_data_ssccq VALUES ('16612', '1531504555', '20180714023', '5,7,7,5,8');
INSERT INTO ac_data_ssccq VALUES ('16658', '1531533668', '20180714024', '1,0,0,4,3');
INSERT INTO ac_data_ssccq VALUES ('16666', '1531534263', '20180714025', '4,3,0,2,9');
INSERT INTO ac_data_ssccq VALUES ('16675', '1531534863', '20180714026', '1,0,2,7,7');
INSERT INTO ac_data_ssccq VALUES ('16681', '1531535463', '20180714027', '4,8,0,7,1');
INSERT INTO ac_data_ssccq VALUES ('16687', '1531536053', '20180714028', '2,6,8,9,3');
INSERT INTO ac_data_ssccq VALUES ('16695', '1531536663', '20180714029', '1,3,0,0,5');
INSERT INTO ac_data_ssccq VALUES ('16700', '1531537262', '20180714030', '8,2,0,4,1');
INSERT INTO ac_data_ssccq VALUES ('16708', '1531537858', '20180714031', '2,2,8,4,9');
INSERT INTO ac_data_ssccq VALUES ('16713', '1531538469', '20180714032', '2,8,3,1,2');
INSERT INTO ac_data_ssccq VALUES ('16719', '1531539050', '20180714033', '0,0,2,0,7');
INSERT INTO ac_data_ssccq VALUES ('16727', '1531539670', '20180714034', '2,1,7,7,5');
INSERT INTO ac_data_ssccq VALUES ('16734', '1531540268', '20180714035', '8,9,4,1,8');
INSERT INTO ac_data_ssccq VALUES ('16742', '1531540851', '20180714036', '5,2,7,1,1');
INSERT INTO ac_data_ssccq VALUES ('16747', '1531541456', '20180714037', '6,3,2,6,6');
INSERT INTO ac_data_ssccq VALUES ('16755', '1531542054', '20180714038', '7,7,0,5,7');
INSERT INTO ac_data_ssccq VALUES ('16763', '1531542667', '20180714039', '5,6,9,4,5');
INSERT INTO ac_data_ssccq VALUES ('16770', '1531543275', '20180714040', '8,7,6,5,4');
INSERT INTO ac_data_ssccq VALUES ('16777', '1531543856', '20180714041', '3,8,4,6,9');
INSERT INTO ac_data_ssccq VALUES ('16783', '1531544466', '20180714042', '9,1,9,1,8');
INSERT INTO ac_data_ssccq VALUES ('16793', '1531545068', '20180714043', '6,8,8,7,8');
INSERT INTO ac_data_ssccq VALUES ('16802', '1531545678', '20180714044', '2,3,8,1,9');
INSERT INTO ac_data_ssccq VALUES ('16812', '1531546279', '20180714045', '7,5,7,0,6');
INSERT INTO ac_data_ssccq VALUES ('16822', '1531546867', '20180714046', '8,8,6,7,0');
INSERT INTO ac_data_ssccq VALUES ('16830', '1531547469', '20180714047', '8,5,0,7,2');
INSERT INTO ac_data_ssccq VALUES ('16837', '1531548053', '20180714048', '9,9,9,7,9');
INSERT INTO ac_data_ssccq VALUES ('16844', '1531548663', '20180714049', '0,3,7,8,6');
INSERT INTO ac_data_ssccq VALUES ('16851', '1531549254', '20180714050', '3,1,7,1,4');
INSERT INTO ac_data_ssccq VALUES ('16860', '1531549882', '20180714051', '1,6,6,6,6');
INSERT INTO ac_data_ssccq VALUES ('16866', '1531550466', '20180714052', '0,8,1,6,7');
INSERT INTO ac_data_ssccq VALUES ('16875', '1531551068', '20180714053', '2,5,1,9,1');
INSERT INTO ac_data_ssccq VALUES ('16883', '1531551671', '20180714054', '9,8,3,7,6');
INSERT INTO ac_data_ssccq VALUES ('16891', '1531552257', '20180714055', '3,6,8,1,9');
INSERT INTO ac_data_ssccq VALUES ('16897', '1531552854', '20180714056', '0,9,0,3,1');
INSERT INTO ac_data_ssccq VALUES ('16904', '1531553464', '20180714057', '9,4,7,7,8');
INSERT INTO ac_data_ssccq VALUES ('16913', '1531554070', '20180714058', '6,4,0,9,2');
INSERT INTO ac_data_ssccq VALUES ('16920', '1531554660', '20180714059', '3,1,0,9,8');
INSERT INTO ac_data_ssccq VALUES ('16927', '1531555262', '20180714060', '3,9,7,3,9');
INSERT INTO ac_data_ssccq VALUES ('16935', '1531555864', '20180714061', '2,8,5,0,2');
INSERT INTO ac_data_ssccq VALUES ('16940', '1531556457', '20180714062', '8,5,5,1,2');
INSERT INTO ac_data_ssccq VALUES ('16946', '1531557055', '20180714063', '2,6,3,0,3');
INSERT INTO ac_data_ssccq VALUES ('16954', '1531557668', '20180714064', '9,4,8,0,9');
INSERT INTO ac_data_ssccq VALUES ('16962', '1531558257', '20180714065', '1,1,5,3,6');
INSERT INTO ac_data_ssccq VALUES ('16969', '1531558859', '20180714066', '1,4,0,8,5');
INSERT INTO ac_data_ssccq VALUES ('16976', '1531559448', '20180714067', '5,9,0,8,1');
INSERT INTO ac_data_ssccq VALUES ('16982', '1531560055', '20180714068', '5,8,6,4,0');
INSERT INTO ac_data_ssccq VALUES ('16989', '1531560666', '20180714069', '0,1,6,2,0');
INSERT INTO ac_data_ssccq VALUES ('16997', '1531561259', '20180714070', '2,4,1,3,6');
INSERT INTO ac_data_ssccq VALUES ('17003', '1531561858', '20180714071', '1,9,5,4,8');
INSERT INTO ac_data_ssccq VALUES ('17013', '1531562469', '20180714072', '6,8,8,8,5');
INSERT INTO ac_data_ssccq VALUES ('17020', '1531563059', '20180714073', '9,8,8,3,0');
INSERT INTO ac_data_ssccq VALUES ('17028', '1531563657', '20180714074', '5,9,2,8,5');
INSERT INTO ac_data_ssccq VALUES ('17034', '1531564254', '20180714075', '6,1,3,4,1');
INSERT INTO ac_data_ssccq VALUES ('17040', '1531564863', '20180714076', '9,4,0,5,7');
INSERT INTO ac_data_ssccq VALUES ('17049', '1531565448', '20180714077', '3,4,7,9,9');
INSERT INTO ac_data_ssccq VALUES ('17053', '1531566062', '20180714078', '7,2,4,2,3');
INSERT INTO ac_data_ssccq VALUES ('17062', '1531566665', '20180714079', '4,0,7,1,8');
INSERT INTO ac_data_ssccq VALUES ('17070', '1531567276', '20180714080', '0,8,2,0,7');
INSERT INTO ac_data_ssccq VALUES ('17078', '1531567865', '20180714081', '9,9,6,5,0');
INSERT INTO ac_data_ssccq VALUES ('17086', '1531568474', '20180714082', '3,9,9,0,0');
INSERT INTO ac_data_ssccq VALUES ('17091', '1531569059', '20180714083', '9,3,8,7,1');
INSERT INTO ac_data_ssccq VALUES ('17098', '1531569658', '20180714084', '2,0,8,8,2');
INSERT INTO ac_data_ssccq VALUES ('17105', '1531570265', '20180714085', '0,5,4,9,8');
INSERT INTO ac_data_ssccq VALUES ('17113', '1531570862', '20180714086', '7,1,7,0,6');
INSERT INTO ac_data_ssccq VALUES ('17118', '1531571450', '20180714087', '7,4,0,7,6');
INSERT INTO ac_data_ssccq VALUES ('17123', '1531572067', '20180714088', '8,9,3,3,4');
INSERT INTO ac_data_ssccq VALUES ('17130', '1531572656', '20180714089', '8,8,8,2,7');
INSERT INTO ac_data_ssccq VALUES ('17135', '1531573267', '20180714090', '6,8,9,3,5');
INSERT INTO ac_data_ssccq VALUES ('17143', '1531573856', '20180714091', '5,4,2,0,2');
INSERT INTO ac_data_ssccq VALUES ('17148', '1531574463', '20180714092', '2,6,3,4,2');
INSERT INTO ac_data_ssccq VALUES ('17156', '1531575058', '20180714093', '4,3,0,5,4');
INSERT INTO ac_data_ssccq VALUES ('17162', '1531575655', '20180714094', '7,4,6,2,0');
INSERT INTO ac_data_ssccq VALUES ('17167', '1531576249', '20180714095', '8,0,6,3,4');
INSERT INTO ac_data_ssccq VALUES ('17176', '1531576868', '20180714096', '5,2,3,9,1');
INSERT INTO ac_data_ssccq VALUES ('17182', '1531577167', '20180714097', '7,4,0,2,6');
INSERT INTO ac_data_ssccq VALUES ('17187', '1531577460', '20180714098', '8,1,1,9,6');
INSERT INTO ac_data_ssccq VALUES ('17195', '1531577764', '20180714099', '2,4,6,7,9');
INSERT INTO ac_data_ssccq VALUES ('17204', '1531578054', '20180714100', '7,1,7,0,9');
INSERT INTO ac_data_ssccq VALUES ('17239', '1531578363', '20180714101', '2,0,8,4,6');
INSERT INTO ac_data_ssccq VALUES ('17275', '1531578655', '20180714102', '9,4,5,1,5');
INSERT INTO ac_data_ssccq VALUES ('17311', '1531578966', '20180714103', '2,4,0,8,6');
INSERT INTO ac_data_ssccq VALUES ('17344', '1531579257', '20180714104', '7,8,3,5,0');
INSERT INTO ac_data_ssccq VALUES ('17381', '1531579552', '20180714105', '7,6,3,6,4');
INSERT INTO ac_data_ssccq VALUES ('17416', '1531579866', '20180714106', '2,6,1,2,4');
INSERT INTO ac_data_ssccq VALUES ('17446', '1531580169', '20180714107', '5,8,0,0,1');
INSERT INTO ac_data_ssccq VALUES ('17476', '1531580463', '20180714108', '0,4,0,8,9');
INSERT INTO ac_data_ssccq VALUES ('17511', '1531580766', '20180714109', '7,6,3,4,3');
INSERT INTO ac_data_ssccq VALUES ('17542', '1531581060', '20180714110', '3,2,7,8,0');
INSERT INTO ac_data_ssccq VALUES ('17575', '1531581367', '20180714111', '2,1,9,0,9');
INSERT INTO ac_data_ssccq VALUES ('17611', '1531581654', '20180714112', '1,3,1,6,3');
INSERT INTO ac_data_ssccq VALUES ('17646', '1531581960', '20180714113', '5,5,8,9,4');
INSERT INTO ac_data_ssccq VALUES ('17678', '1531582259', '20180714114', '4,8,1,9,5');
INSERT INTO ac_data_ssccq VALUES ('17713', '1531582559', '20180714115', '7,9,3,1,5');
INSERT INTO ac_data_ssccq VALUES ('17750', '1531582860', '20180714116', '0,4,0,5,3');
INSERT INTO ac_data_ssccq VALUES ('17786', '1531583157', '20180714117', '1,0,2,5,1');
INSERT INTO ac_data_ssccq VALUES ('17820', '1531583459', '20180714118', '5,2,5,4,4');
INSERT INTO ac_data_ssccq VALUES ('17857', '1531583769', '20180714119', '2,9,5,5,7');
INSERT INTO ac_data_ssccq VALUES ('17893', '1531584066', '20180714120', '4,4,7,5,4');
INSERT INTO ac_data_ssccq VALUES ('17942', '1531584356', '20180715001', '6,4,4,6,8');
INSERT INTO ac_data_ssccq VALUES ('17950', '1531584676', '20180715002', '9,2,5,9,0');
INSERT INTO ac_data_ssccq VALUES ('17957', '1531584964', '20180715003', '6,1,3,5,6');
INSERT INTO ac_data_ssccq VALUES ('17965', '1531585256', '20180715004', '1,7,9,3,2');
INSERT INTO ac_data_ssccq VALUES ('17971', '1531585556', '20180715005', '0,5,3,1,3');
INSERT INTO ac_data_ssccq VALUES ('17977', '1531585856', '20180715006', '4,2,7,2,1');
INSERT INTO ac_data_ssccq VALUES ('17984', '1531586156', '20180715007', '1,9,1,6,4');
INSERT INTO ac_data_ssccq VALUES ('17992', '1531586459', '20180715008', '8,8,5,1,2');
INSERT INTO ac_data_ssccq VALUES ('17999', '1531586773', '20180715009', '9,4,2,5,7');
INSERT INTO ac_data_ssccq VALUES ('18006', '1531587058', '20180715010', '6,7,0,1,3');
INSERT INTO ac_data_ssccq VALUES ('18014', '1531587361', '20180715011', '5,5,0,1,5');
INSERT INTO ac_data_ssccq VALUES ('18022', '1531587665', '20180715012', '3,9,0,6,0');
INSERT INTO ac_data_ssccq VALUES ('18032', '1531587963', '20180715013', '5,6,2,0,3');
INSERT INTO ac_data_ssccq VALUES ('18039', '1531588257', '20180715014', '6,5,3,1,9');
INSERT INTO ac_data_ssccq VALUES ('18045', '1531588555', '20180715015', '3,3,1,2,7');
INSERT INTO ac_data_ssccq VALUES ('18052', '1531588854', '20180715016', '3,3,4,6,6');
INSERT INTO ac_data_ssccq VALUES ('18059', '1531589166', '20180715017', '4,1,2,1,6');
INSERT INTO ac_data_ssccq VALUES ('18066', '1531589467', '20180715018', '5,8,1,9,4');
INSERT INTO ac_data_ssccq VALUES ('18072', '1531589761', '20180715019', '6,3,7,9,1');
INSERT INTO ac_data_ssccq VALUES ('18079', '1531590066', '20180715020', '7,8,1,2,5');
INSERT INTO ac_data_ssccq VALUES ('18085', '1531590353', '20180715021', '6,6,3,1,7');
INSERT INTO ac_data_ssccq VALUES ('18093', '1531590666', '20180715022', '7,6,9,8,7');
INSERT INTO ac_data_ssccq VALUES ('18100', '1531590955', '20180715023', '1,6,3,5,7');
INSERT INTO ac_data_ssccq VALUES ('18148', '1531620077', '20180715024', '4,7,3,8,1');
INSERT INTO ac_data_ssccq VALUES ('18156', '1531620663', '20180715025', '3,0,2,9,7');
INSERT INTO ac_data_ssccq VALUES ('18164', '1531621260', '20180715026', '9,0,5,0,8');
INSERT INTO ac_data_ssccq VALUES ('18170', '1531621860', '20180715027', '8,6,6,7,0');
INSERT INTO ac_data_ssccq VALUES ('18176', '1531622450', '20180715028', '5,1,2,6,3');
INSERT INTO ac_data_ssccq VALUES ('18185', '1531623062', '20180715029', '6,0,8,3,8');
INSERT INTO ac_data_ssccq VALUES ('18192', '1531623663', '20180715030', '5,3,5,2,7');
INSERT INTO ac_data_ssccq VALUES ('18200', '1531624259', '20180715031', '7,3,1,2,2');
INSERT INTO ac_data_ssccq VALUES ('18208', '1531624869', '20180715032', '3,3,7,0,5');
INSERT INTO ac_data_ssccq VALUES ('18214', '1531625459', '20180715033', '5,5,6,5,2');
INSERT INTO ac_data_ssccq VALUES ('18220', '1531626063', '20180715034', '8,3,5,9,5');
INSERT INTO ac_data_ssccq VALUES ('18222', '1531826770', '20180717081', '6,6,3,5,3');
INSERT INTO ac_data_ssccq VALUES ('18238', '1531884798', '20180718033', '6,7,8,7,4');
INSERT INTO ac_data_ssccq VALUES ('18239', '1531885210', '20180718034', '9,7,0,1,0');
INSERT INTO ac_data_ssccq VALUES ('18240', '1531885810', '20180718035', '1,3,3,1,8');
INSERT INTO ac_data_ssccq VALUES ('18241', '1531886237', '20180718036', '7,0,3,1,7');
INSERT INTO ac_data_ssccq VALUES ('18258', '1531887010', '20180718037', '4,2,5,8,6');
INSERT INTO ac_data_ssccq VALUES ('18259', '1531887610', '20180718038', '7,0,5,7,5');
INSERT INTO ac_data_ssccq VALUES ('18261', '1531888210', '20180718039', '9,6,5,4,4');
INSERT INTO ac_data_ssccq VALUES ('18262', '1531888810', '20180718040', '1,4,4,3,2');
INSERT INTO ac_data_ssccq VALUES ('18263', '1531889118', '20180718041', '5,4,2,8,8');
INSERT INTO ac_data_ssccq VALUES ('18292', '1531890010', '20180718042', '1,9,0,9,5');
INSERT INTO ac_data_ssccq VALUES ('18293', '1531890558', '20180718043', '1,6,0,2,8');
INSERT INTO ac_data_ssccq VALUES ('18298', '1531891210', '20180718044', '8,1,6,8,7');
INSERT INTO ac_data_ssccq VALUES ('18299', '1531891810', '20180718045', '9,9,7,3,4');
INSERT INTO ac_data_ssccq VALUES ('18301', '1531892410', '20180718046', '0,5,4,1,6');
INSERT INTO ac_data_ssccq VALUES ('18302', '1531893010', '20180718047', '3,2,9,4,9');
INSERT INTO ac_data_ssccq VALUES ('18303', '1531893439', '20180718048', '5,0,2,3,0');
INSERT INTO ac_data_ssccq VALUES ('18320', '1531894210', '20180718049', '4,7,1,9,8');
INSERT INTO ac_data_ssccq VALUES ('18321', '1531894810', '20180718050', '3,1,7,3,5');
INSERT INTO ac_data_ssccq VALUES ('18323', '1531895411', '20180718051', '0,5,5,9,9');
INSERT INTO ac_data_ssccq VALUES ('18324', '1531896010', '20180718052', '7,2,3,7,5');
INSERT INTO ac_data_ssccq VALUES ('18325', '1531896321', '20180718053', '8,5,3,3,4');
INSERT INTO ac_data_ssccq VALUES ('18354', '1531897210', '20180718054', '5,7,7,7,3');
INSERT INTO ac_data_ssccq VALUES ('18355', '1531897762', '20180718055', '5,4,8,6,1');
INSERT INTO ac_data_ssccq VALUES ('18360', '1531898410', '20180718056', '8,4,7,4,7');
INSERT INTO ac_data_ssccq VALUES ('18361', '1531899010', '20180718057', '5,4,2,5,8');
INSERT INTO ac_data_ssccq VALUES ('18363', '1531899610', '20180718058', '3,4,1,5,9');
INSERT INTO ac_data_ssccq VALUES ('18364', '1531900210', '20180718059', '8,5,9,6,7');
INSERT INTO ac_data_ssccq VALUES ('18365', '1531900644', '20180718060', '0,2,8,1,9');
INSERT INTO ac_data_ssccq VALUES ('18382', '1531901410', '20180718061', '6,9,4,2,6');
INSERT INTO ac_data_ssccq VALUES ('18383', '1531902010', '20180718062', '3,5,2,4,5');
INSERT INTO ac_data_ssccq VALUES ('18385', '1531902610', '20180718063', '6,1,7,6,2');
INSERT INTO ac_data_ssccq VALUES ('18386', '1531903210', '20180718064', '7,5,0,3,5');
INSERT INTO ac_data_ssccq VALUES ('18387', '1531903524', '20180718065', '0,7,7,5,0');
INSERT INTO ac_data_ssccq VALUES ('18416', '1531904410', '20180718066', '7,5,1,9,2');
INSERT INTO ac_data_ssccq VALUES ('18417', '1531904965', '20180718067', '5,6,5,2,6');
INSERT INTO ac_data_ssccq VALUES ('18422', '1531905610', '20180718068', '7,5,0,3,0');

-- ----------------------------
-- Table structure for `ac_data_syxwgd`
-- ----------------------------
DROP TABLE IF EXISTS `ac_data_syxwgd`;
CREATE TABLE `ac_data_syxwgd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8979 DEFAULT CHARSET=utf8 COMMENT='开奖数据';

-- ----------------------------
-- Records of ac_data_syxwgd
-- ----------------------------
INSERT INTO ac_data_syxwgd VALUES ('1', '1527133624', '20180524016', '07,04,09,06,01');
INSERT INTO ac_data_syxwgd VALUES ('2', '1527133811', '20180524017', '09,07,10,05,06');
INSERT INTO ac_data_syxwgd VALUES ('3', '1527134411', '20180524018', '07,04,05,06,10');
INSERT INTO ac_data_syxwgd VALUES ('4', '1527135011', '20180524019', '01,06,08,04,07');
INSERT INTO ac_data_syxwgd VALUES ('6', '1527135610', '20180524020', '06,04,07,10,02');
INSERT INTO ac_data_syxwgd VALUES ('7', '1527136211', '20180524021', '03,05,07,01,09');
INSERT INTO ac_data_syxwgd VALUES ('9', '1527136811', '20180524022', '05,06,02,07,09');
INSERT INTO ac_data_syxwgd VALUES ('10', '1527137412', '20180524023', '04,07,05,11,02');
INSERT INTO ac_data_syxwgd VALUES ('11', '1527139512', '20180524026', '08,11,10,01,06');
INSERT INTO ac_data_syxwgd VALUES ('13', '1527139810', '20180524027', '11,07,01,10,05');
INSERT INTO ac_data_syxwgd VALUES ('14', '1527140411', '20180524028', '11,07,09,10,02');
INSERT INTO ac_data_syxwgd VALUES ('15', '1527140952', '20180524029', '04,07,10,09,06');
INSERT INTO ac_data_syxwgd VALUES ('16', '1527141611', '20180524030', '01,04,09,02,06');
INSERT INTO ac_data_syxwgd VALUES ('17', '1527142211', '20180524031', '01,03,05,07,09');
INSERT INTO ac_data_syxwgd VALUES ('19', '1527142811', '20180524032', '10,04,05,06,01');
INSERT INTO ac_data_syxwgd VALUES ('20', '1527143410', '20180524033', '05,03,07,10,01');
INSERT INTO ac_data_syxwgd VALUES ('22', '1527144010', '20180524034', '01,11,03,06,10');
INSERT INTO ac_data_syxwgd VALUES ('23', '1527144611', '20180524035', '04,10,01,06,02');
INSERT INTO ac_data_syxwgd VALUES ('24', '1527145211', '20180524036', '02,07,05,01,09');
INSERT INTO ac_data_syxwgd VALUES ('26', '1527145811', '20180524037', '01,11,03,02,07');
INSERT INTO ac_data_syxwgd VALUES ('27', '1527146411', '20180524038', '11,10,08,04,07');
INSERT INTO ac_data_syxwgd VALUES ('29', '1527147010', '20180524039', '05,09,02,03,01');
INSERT INTO ac_data_syxwgd VALUES ('30', '1527147611', '20180524040', '03,07,09,02,08');
INSERT INTO ac_data_syxwgd VALUES ('31', '1527148154', '20180524041', '09,04,10,08,06');
INSERT INTO ac_data_syxwgd VALUES ('32', '1527148811', '20180524042', '02,03,10,11,06');
INSERT INTO ac_data_syxwgd VALUES ('33', '1527149411', '20180524043', '07,09,02,11,06');
INSERT INTO ac_data_syxwgd VALUES ('35', '1527150011', '20180524044', '09,02,07,05,03');
INSERT INTO ac_data_syxwgd VALUES ('36', '1527150610', '20180524045', '02,06,10,11,05');
INSERT INTO ac_data_syxwgd VALUES ('38', '1527151210', '20180524046', '06,09,05,02,11');
INSERT INTO ac_data_syxwgd VALUES ('39', '1527151810', '20180524047', '10,09,04,07,08');
INSERT INTO ac_data_syxwgd VALUES ('40', '1527152410', '20180524048', '10,05,01,03,08');
INSERT INTO ac_data_syxwgd VALUES ('42', '1527153011', '20180524049', '08,09,04,05,07');
INSERT INTO ac_data_syxwgd VALUES ('43', '1527153610', '20180524050', '09,02,03,07,11');
INSERT INTO ac_data_syxwgd VALUES ('45', '1527154210', '20180524051', '03,05,07,02,06');
INSERT INTO ac_data_syxwgd VALUES ('46', '1527154811', '20180524052', '03,06,09,05,11');
INSERT INTO ac_data_syxwgd VALUES ('47', '1527155356', '20180524053', '07,05,06,01,10');
INSERT INTO ac_data_syxwgd VALUES ('48', '1527156010', '20180524054', '09,08,10,07,02');
INSERT INTO ac_data_syxwgd VALUES ('49', '1527156611', '20180524055', '09,03,06,02,11');
INSERT INTO ac_data_syxwgd VALUES ('51', '1527157211', '20180524056', '07,01,09,02,10');
INSERT INTO ac_data_syxwgd VALUES ('52', '1527157810', '20180524057', '10,03,05,07,06');
INSERT INTO ac_data_syxwgd VALUES ('54', '1527158410', '20180524058', '09,11,05,01,08');
INSERT INTO ac_data_syxwgd VALUES ('55', '1527159011', '20180524059', '02,10,11,03,01');
INSERT INTO ac_data_syxwgd VALUES ('56', '1527159610', '20180524060', '09,02,07,06,08');
INSERT INTO ac_data_syxwgd VALUES ('58', '1527160210', '20180524061', '07,03,01,05,02');
INSERT INTO ac_data_syxwgd VALUES ('59', '1527160810', '20180524062', '09,08,01,07,04');
INSERT INTO ac_data_syxwgd VALUES ('61', '1527161411', '20180524063', '09,10,05,07,06');
INSERT INTO ac_data_syxwgd VALUES ('62', '1527162010', '20180524064', '04,03,01,02,06');
INSERT INTO ac_data_syxwgd VALUES ('63', '1527162543', '20180524065', '10,06,08,11,09');
INSERT INTO ac_data_syxwgd VALUES ('64', '1527163210', '20180524066', '08,10,06,04,01');
INSERT INTO ac_data_syxwgd VALUES ('65', '1527163811', '20180524067', '04,10,07,03,11');
INSERT INTO ac_data_syxwgd VALUES ('67', '1527164411', '20180524068', '03,11,06,01,07');
INSERT INTO ac_data_syxwgd VALUES ('68', '1527165010', '20180524069', '08,03,07,05,04');
INSERT INTO ac_data_syxwgd VALUES ('70', '1527165610', '20180524070', '05,04,06,02,08');
INSERT INTO ac_data_syxwgd VALUES ('71', '1527166211', '20180524071', '01,10,07,09,08');
INSERT INTO ac_data_syxwgd VALUES ('72', '1527166811', '20180524072', '08,01,07,03,09');
INSERT INTO ac_data_syxwgd VALUES ('74', '1527167410', '20180524073', '02,08,01,05,06');
INSERT INTO ac_data_syxwgd VALUES ('75', '1527168058', '20180524074', '06,03,09,11,05');
INSERT INTO ac_data_syxwgd VALUES ('77', '1527168610', '20180524075', '05,07,11,10,09');
INSERT INTO ac_data_syxwgd VALUES ('78', '1527169210', '20180524076', '10,02,01,08,05');
INSERT INTO ac_data_syxwgd VALUES ('79', '1527169776', '20180524077', '04,05,01,11,09');
INSERT INTO ac_data_syxwgd VALUES ('80', '1527170410', '20180524078', '01,11,06,03,05');
INSERT INTO ac_data_syxwgd VALUES ('81', '1527171011', '20180524079', '09,03,07,06,02');
INSERT INTO ac_data_syxwgd VALUES ('83', '1527171611', '20180524080', '03,06,01,07,10');
INSERT INTO ac_data_syxwgd VALUES ('84', '1527172210', '20180524081', '06,11,07,09,10');
INSERT INTO ac_data_syxwgd VALUES ('86', '1527172810', '20180524082', '07,09,10,02,08');
INSERT INTO ac_data_syxwgd VALUES ('87', '1527173411', '20180524083', '09,10,03,01,02');
INSERT INTO ac_data_syxwgd VALUES ('115', '1527173971', '20180524084', '04,03,08,01,06');
INSERT INTO ac_data_syxwgd VALUES ('373', '1527210610', '20180525001', '03,01,05,08,09');
INSERT INTO ac_data_syxwgd VALUES ('374', '1527211211', '20180525002', '04,01,05,11,06');
INSERT INTO ac_data_syxwgd VALUES ('376', '1527211810', '20180525003', '05,11,06,04,07');
INSERT INTO ac_data_syxwgd VALUES ('377', '1527212411', '20180525004', '08,01,09,11,04');
INSERT INTO ac_data_syxwgd VALUES ('378', '1527212956', '20180525005', '10,08,11,06,07');
INSERT INTO ac_data_syxwgd VALUES ('379', '1527213611', '20180525006', '01,07,02,11,05');
INSERT INTO ac_data_syxwgd VALUES ('380', '1527214211', '20180525007', '08,09,10,04,07');
INSERT INTO ac_data_syxwgd VALUES ('382', '1527215235', '20180525008', '03,08,10,04,06');
INSERT INTO ac_data_syxwgd VALUES ('383', '1527215411', '20180525009', '09,03,06,04,10');
INSERT INTO ac_data_syxwgd VALUES ('385', '1527216011', '20180525010', '05,04,07,08,02');
INSERT INTO ac_data_syxwgd VALUES ('386', '1527216610', '20180525011', '04,01,05,06,10');
INSERT INTO ac_data_syxwgd VALUES ('387', '1527217211', '20180525012', '06,08,02,10,05');
INSERT INTO ac_data_syxwgd VALUES ('389', '1527217810', '20180525013', '03,02,09,11,08');
INSERT INTO ac_data_syxwgd VALUES ('390', '1527218411', '20180525014', '05,01,11,08,03');
INSERT INTO ac_data_syxwgd VALUES ('392', '1527219010', '20180525015', '01,09,03,08,02');
INSERT INTO ac_data_syxwgd VALUES ('393', '1527219610', '20180525016', '08,09,06,05,10');
INSERT INTO ac_data_syxwgd VALUES ('394', '1527220158', '20180525017', '04,05,01,03,08');
INSERT INTO ac_data_syxwgd VALUES ('395', '1527220811', '20180525018', '05,01,03,10,02');
INSERT INTO ac_data_syxwgd VALUES ('396', '1527221410', '20180525019', '01,05,09,06,02');
INSERT INTO ac_data_syxwgd VALUES ('398', '1527222010', '20180525020', '09,10,11,06,04');
INSERT INTO ac_data_syxwgd VALUES ('399', '1527222611', '20180525021', '06,11,03,09,01');
INSERT INTO ac_data_syxwgd VALUES ('401', '1527223210', '20180525022', '11,09,05,07,02');
INSERT INTO ac_data_syxwgd VALUES ('402', '1527223811', '20180525023', '03,05,08,07,09');
INSERT INTO ac_data_syxwgd VALUES ('403', '1527224410', '20180525024', '11,09,06,07,01');
INSERT INTO ac_data_syxwgd VALUES ('405', '1527225011', '20180525025', '04,11,06,10,03');
INSERT INTO ac_data_syxwgd VALUES ('406', '1527225610', '20180525026', '11,09,10,01,04');
INSERT INTO ac_data_syxwgd VALUES ('408', '1527226210', '20180525027', '05,09,07,04,08');
INSERT INTO ac_data_syxwgd VALUES ('409', '1527226811', '20180525028', '10,01,02,04,06');
INSERT INTO ac_data_syxwgd VALUES ('410', '1527227360', '20180525029', '05,09,10,06,04');
INSERT INTO ac_data_syxwgd VALUES ('411', '1527228011', '20180525030', '11,10,09,03,02');
INSERT INTO ac_data_syxwgd VALUES ('412', '1527228610', '20180525031', '07,06,11,02,04');
INSERT INTO ac_data_syxwgd VALUES ('414', '1527229211', '20180525032', '07,10,05,03,09');
INSERT INTO ac_data_syxwgd VALUES ('415', '1527229810', '20180525033', '07,04,06,05,08');
INSERT INTO ac_data_syxwgd VALUES ('416', '1527230349', '20180525034', '11,08,07,01,03');
INSERT INTO ac_data_syxwgd VALUES ('417', '1527231011', '20180525035', '07,11,06,03,09');
INSERT INTO ac_data_syxwgd VALUES ('418', '1527231610', '20180525036', '09,03,07,06,10');
INSERT INTO ac_data_syxwgd VALUES ('420', '1527232211', '20180525037', '02,01,06,07,11');
INSERT INTO ac_data_syxwgd VALUES ('421', '1527232810', '20180525038', '09,06,10,02,01');
INSERT INTO ac_data_syxwgd VALUES ('423', '1527233411', '20180525039', '10,01,05,03,02');
INSERT INTO ac_data_syxwgd VALUES ('424', '1527234011', '20180525040', '06,07,02,05,09');
INSERT INTO ac_data_syxwgd VALUES ('425', '1527234608', '20180525041', '03,09,07,10,02');
INSERT INTO ac_data_syxwgd VALUES ('426', '1527235211', '20180525042', '01,05,02,06,09');
INSERT INTO ac_data_syxwgd VALUES ('427', '1527235810', '20180525043', '09,08,03,06,10');
INSERT INTO ac_data_syxwgd VALUES ('429', '1527236410', '20180525044', '09,11,07,08,06');
INSERT INTO ac_data_syxwgd VALUES ('430', '1527237010', '20180525045', '01,08,06,03,07');
INSERT INTO ac_data_syxwgd VALUES ('431', '1527237551', '20180525046', '08,06,05,07,04');
INSERT INTO ac_data_syxwgd VALUES ('432', '1527238210', '20180525047', '01,08,03,11,10');
INSERT INTO ac_data_syxwgd VALUES ('433', '1527238811', '20180525048', '10,03,07,04,01');
INSERT INTO ac_data_syxwgd VALUES ('435', '1527239410', '20180525049', '06,05,03,08,10');
INSERT INTO ac_data_syxwgd VALUES ('436', '1527240011', '20180525050', '11,02,06,08,01');
INSERT INTO ac_data_syxwgd VALUES ('438', '1527240611', '20180525051', '04,05,07,01,09');
INSERT INTO ac_data_syxwgd VALUES ('439', '1527241210', '20180525052', '09,10,07,02,01');
INSERT INTO ac_data_syxwgd VALUES ('440', '1527241764', '20180525053', '08,09,01,10,03');
INSERT INTO ac_data_syxwgd VALUES ('441', '1527242410', '20180525054', '07,04,06,05,03');
INSERT INTO ac_data_syxwgd VALUES ('442', '1527243011', '20180525055', '03,11,09,04,02');
INSERT INTO ac_data_syxwgd VALUES ('444', '1527243610', '20180525056', '03,08,09,07,10');
INSERT INTO ac_data_syxwgd VALUES ('445', '1527244211', '20180525057', '09,10,04,01,03');
INSERT INTO ac_data_syxwgd VALUES ('446', '1527244753', '20180525058', '06,07,05,09,04');
INSERT INTO ac_data_syxwgd VALUES ('447', '1527245411', '20180525059', '05,02,10,09,08');
INSERT INTO ac_data_syxwgd VALUES ('448', '1527246010', '20180525060', '07,03,09,05,10');
INSERT INTO ac_data_syxwgd VALUES ('450', '1527246611', '20180525061', '09,08,06,07,01');
INSERT INTO ac_data_syxwgd VALUES ('451', '1527247210', '20180525062', '05,01,10,07,09');
INSERT INTO ac_data_syxwgd VALUES ('453', '1527247811', '20180525063', '09,06,02,11,08');
INSERT INTO ac_data_syxwgd VALUES ('454', '1527248410', '20180525064', '04,06,08,09,07');
INSERT INTO ac_data_syxwgd VALUES ('455', '1527248966', '20180525065', '09,08,02,06,11');
INSERT INTO ac_data_syxwgd VALUES ('456', '1527249610', '20180525066', '01,10,06,11,04');
INSERT INTO ac_data_syxwgd VALUES ('457', '1527250211', '20180525067', '11,04,09,08,05');
INSERT INTO ac_data_syxwgd VALUES ('459', '1527250811', '20180525068', '11,04,03,05,02');
INSERT INTO ac_data_syxwgd VALUES ('460', '1527251410', '20180525069', '06,08,09,02,11');
INSERT INTO ac_data_syxwgd VALUES ('461', '1527251971', '20180525070', '03,06,05,07,10');
INSERT INTO ac_data_syxwgd VALUES ('462', '1527252610', '20180525071', '02,05,01,09,06');
INSERT INTO ac_data_syxwgd VALUES ('463', '1527253211', '20180525072', '07,01,02,04,09');
INSERT INTO ac_data_syxwgd VALUES ('465', '1527253810', '20180525073', '06,01,07,09,02');
INSERT INTO ac_data_syxwgd VALUES ('466', '1527254411', '20180525074', '04,11,02,01,07');
INSERT INTO ac_data_syxwgd VALUES ('468', '1527255011', '20180525075', '06,07,02,09,08');
INSERT INTO ac_data_syxwgd VALUES ('469', '1527255610', '20180525076', '11,10,03,06,04');
INSERT INTO ac_data_syxwgd VALUES ('470', '1527256167', '20180525077', '09,11,03,08,01');
INSERT INTO ac_data_syxwgd VALUES ('471', '1527256811', '20180525078', '07,04,09,05,01');
INSERT INTO ac_data_syxwgd VALUES ('472', '1527257410', '20180525079', '04,06,05,07,01');
INSERT INTO ac_data_syxwgd VALUES ('474', '1527258010', '20180525080', '06,11,03,09,04');
INSERT INTO ac_data_syxwgd VALUES ('475', '1527258611', '20180525081', '01,08,02,09,03');
INSERT INTO ac_data_syxwgd VALUES ('476', '1527259157', '20180525082', '10,06,03,09,11');
INSERT INTO ac_data_syxwgd VALUES ('477', '1527300608', '20180526007', '02,05,11,04,09');
INSERT INTO ac_data_syxwgd VALUES ('478', '1527301211', '20180526008', '03,08,02,11,04');
INSERT INTO ac_data_syxwgd VALUES ('479', '1527301810', '20180526009', '02,04,06,03,08');
INSERT INTO ac_data_syxwgd VALUES ('481', '1527302410', '20180526010', '01,03,11,10,06');
INSERT INTO ac_data_syxwgd VALUES ('482', '1527303011', '20180526011', '07,01,11,09,04');
INSERT INTO ac_data_syxwgd VALUES ('483', '1527303535', '20180526012', '02,04,09,06,11');
INSERT INTO ac_data_syxwgd VALUES ('484', '1527304211', '20180526013', '03,01,02,05,11');
INSERT INTO ac_data_syxwgd VALUES ('485', '1527304810', '20180526014', '05,09,01,07,02');
INSERT INTO ac_data_syxwgd VALUES ('487', '1527305410', '20180526015', '07,02,05,08,01');
INSERT INTO ac_data_syxwgd VALUES ('488', '1527306011', '20180526016', '04,01,07,02,03');
INSERT INTO ac_data_syxwgd VALUES ('490', '1527306611', '20180526017', '09,08,10,03,01');
INSERT INTO ac_data_syxwgd VALUES ('491', '1527307210', '20180526018', '05,09,03,06,04');
INSERT INTO ac_data_syxwgd VALUES ('492', '1527307809', '20180526019', '04,02,10,09,01');
INSERT INTO ac_data_syxwgd VALUES ('493', '1527308411', '20180526020', '03,10,04,01,11');
INSERT INTO ac_data_syxwgd VALUES ('494', '1527309011', '20180526021', '01,09,04,11,06');
INSERT INTO ac_data_syxwgd VALUES ('496', '1527309610', '20180526022', '07,03,10,04,01');
INSERT INTO ac_data_syxwgd VALUES ('497', '1527310211', '20180526023', '07,03,01,05,02');
INSERT INTO ac_data_syxwgd VALUES ('498', '1527310737', '20180526024', '03,06,09,01,10');
INSERT INTO ac_data_syxwgd VALUES ('499', '1527311410', '20180526025', '02,03,11,04,10');
INSERT INTO ac_data_syxwgd VALUES ('500', '1527312011', '20180526026', '09,11,02,01,10');
INSERT INTO ac_data_syxwgd VALUES ('502', '1527312611', '20180526027', '05,11,08,09,04');
INSERT INTO ac_data_syxwgd VALUES ('503', '1527313210', '20180526028', '02,01,06,07,09');
INSERT INTO ac_data_syxwgd VALUES ('505', '1527313811', '20180526029', '09,06,01,02,04');
INSERT INTO ac_data_syxwgd VALUES ('506', '1527314410', '20180526030', '07,06,08,01,09');
INSERT INTO ac_data_syxwgd VALUES ('507', '1527315011', '20180526031', '08,04,10,07,09');
INSERT INTO ac_data_syxwgd VALUES ('508', '1527315610', '20180526032', '05,07,04,02,11');
INSERT INTO ac_data_syxwgd VALUES ('509', '1527316211', '20180526033', '10,08,04,11,01');
INSERT INTO ac_data_syxwgd VALUES ('511', '1527316810', '20180526034', '07,03,10,05,08');
INSERT INTO ac_data_syxwgd VALUES ('512', '1527317410', '20180526035', '06,01,02,11,03');
INSERT INTO ac_data_syxwgd VALUES ('513', '1527317938', '20180526036', '03,06,11,05,01');
INSERT INTO ac_data_syxwgd VALUES ('514', '1527318610', '20180526037', '03,10,05,01,08');
INSERT INTO ac_data_syxwgd VALUES ('515', '1527319210', '20180526038', '03,02,04,06,07');
INSERT INTO ac_data_syxwgd VALUES ('517', '1527319811', '20180526039', '04,07,08,02,11');
INSERT INTO ac_data_syxwgd VALUES ('518', '1527320411', '20180526040', '03,10,08,05,04');
INSERT INTO ac_data_syxwgd VALUES ('520', '1527321010', '20180526041', '01,06,08,03,09');
INSERT INTO ac_data_syxwgd VALUES ('521', '1527321611', '20180526042', '10,01,11,03,08');
INSERT INTO ac_data_syxwgd VALUES ('522', '1527322210', '20180526043', '07,05,08,11,10');
INSERT INTO ac_data_syxwgd VALUES ('524', '1527322811', '20180526044', '09,10,07,03,06');
INSERT INTO ac_data_syxwgd VALUES ('525', '1527323410', '20180526045', '07,10,09,11,08');
INSERT INTO ac_data_syxwgd VALUES ('527', '1527324011', '20180526046', '02,09,10,04,06');
INSERT INTO ac_data_syxwgd VALUES ('528', '1527324610', '20180526047', '08,04,03,02,09');
INSERT INTO ac_data_syxwgd VALUES ('529', '1527325139', '20180526048', '03,04,09,02,10');
INSERT INTO ac_data_syxwgd VALUES ('530', '1527325811', '20180526049', '05,04,09,02,03');
INSERT INTO ac_data_syxwgd VALUES ('531', '1527332446', '20180526060', '07,06,10,03,01');
INSERT INTO ac_data_syxwgd VALUES ('533', '1527333011', '20180526061', '02,11,10,06,09');
INSERT INTO ac_data_syxwgd VALUES ('534', '1527333610', '20180526062', '11,09,01,08,10');
INSERT INTO ac_data_syxwgd VALUES ('536', '1527334210', '20180526063', '02,09,03,10,11');
INSERT INTO ac_data_syxwgd VALUES ('537', '1527334811', '20180526064', '07,01,04,09,06');
INSERT INTO ac_data_syxwgd VALUES ('538', '1527335342', '20180526065', '11,09,05,07,03');
INSERT INTO ac_data_syxwgd VALUES ('539', '1527336011', '20180526066', '10,04,08,02,05');
INSERT INTO ac_data_syxwgd VALUES ('540', '1527336611', '20180526067', '01,11,04,10,02');
INSERT INTO ac_data_syxwgd VALUES ('542', '1527337210', '20180526068', '04,08,07,06,03');
INSERT INTO ac_data_syxwgd VALUES ('543', '1527337810', '20180526069', '02,01,05,09,04');
INSERT INTO ac_data_syxwgd VALUES ('545', '1527338410', '20180526070', '03,10,07,11,09');
INSERT INTO ac_data_syxwgd VALUES ('546', '1527339011', '20180526071', '10,06,05,08,09');
INSERT INTO ac_data_syxwgd VALUES ('547', '1527339611', '20180526072', '05,08,01,06,03');
INSERT INTO ac_data_syxwgd VALUES ('549', '1527340211', '20180526073', '04,02,01,06,10');
INSERT INTO ac_data_syxwgd VALUES ('550', '1527340810', '20180526074', '10,05,04,03,07');
INSERT INTO ac_data_syxwgd VALUES ('552', '1527341411', '20180526075', '07,03,10,11,09');
INSERT INTO ac_data_syxwgd VALUES ('553', '1527342010', '20180526076', '04,06,01,08,03');
INSERT INTO ac_data_syxwgd VALUES ('554', '1527342559', '20180526077', '09,08,07,04,05');
INSERT INTO ac_data_syxwgd VALUES ('555', '1527343211', '20180526078', '08,09,06,01,02');
INSERT INTO ac_data_syxwgd VALUES ('556', '1527343810', '20180526079', '08,07,06,09,11');
INSERT INTO ac_data_syxwgd VALUES ('558', '1527344410', '20180526080', '05,06,08,11,04');
INSERT INTO ac_data_syxwgd VALUES ('559', '1527345010', '20180526081', '08,01,06,02,07');
INSERT INTO ac_data_syxwgd VALUES ('561', '1527345611', '20180526082', '08,07,05,11,02');
INSERT INTO ac_data_syxwgd VALUES ('562', '1527346210', '20180526083', '11,08,05,04,09');
INSERT INTO ac_data_syxwgd VALUES ('589', '1527346756', '20180526084', '07,10,04,08,03');
INSERT INTO ac_data_syxwgd VALUES ('775', '1527387924', '20180527008', '06,08,09,02,11');
INSERT INTO ac_data_syxwgd VALUES ('777', '1527388211', '20180527009', '03,07,04,01,02');
INSERT INTO ac_data_syxwgd VALUES ('778', '1527388810', '20180527010', '03,02,01,05,07');
INSERT INTO ac_data_syxwgd VALUES ('779', '1527389327', '20180527011', '06,11,01,03,10');
INSERT INTO ac_data_syxwgd VALUES ('780', '1527390011', '20180527012', '08,03,09,02,06');
INSERT INTO ac_data_syxwgd VALUES ('781', '1527390611', '20180527013', '01,07,11,08,03');
INSERT INTO ac_data_syxwgd VALUES ('783', '1527391210', '20180527014', '01,07,05,03,08');
INSERT INTO ac_data_syxwgd VALUES ('784', '1527391810', '20180527015', '03,04,07,11,10');
INSERT INTO ac_data_syxwgd VALUES ('785', '1527392668', '20180527016', '05,10,03,02,11');
INSERT INTO ac_data_syxwgd VALUES ('787', '1527393010', '20180527017', '04,09,03,02,06');
INSERT INTO ac_data_syxwgd VALUES ('788', '1527393555', '20180527018', '11,10,07,02,09');
INSERT INTO ac_data_syxwgd VALUES ('789', '1527394211', '20180527019', '06,09,10,03,05');
INSERT INTO ac_data_syxwgd VALUES ('790', '1527394811', '20180527020', '11,06,03,01,04');
INSERT INTO ac_data_syxwgd VALUES ('792', '1527395410', '20180527021', '09,06,08,10,04');
INSERT INTO ac_data_syxwgd VALUES ('793', '1527396011', '20180527022', '11,06,08,07,09');
INSERT INTO ac_data_syxwgd VALUES ('794', '1527396529', '20180527023', '07,11,06,02,04');
INSERT INTO ac_data_syxwgd VALUES ('795', '1527397211', '20180527024', '01,06,03,10,04');
INSERT INTO ac_data_syxwgd VALUES ('796', '1527397810', '20180527025', '08,07,02,03,05');
INSERT INTO ac_data_syxwgd VALUES ('798', '1527398411', '20180527026', '07,10,01,11,09');
INSERT INTO ac_data_syxwgd VALUES ('799', '1527399010', '20180527027', '07,05,04,09,01');
INSERT INTO ac_data_syxwgd VALUES ('801', '1527399611', '20180527028', '04,11,02,07,03');
INSERT INTO ac_data_syxwgd VALUES ('802', '1527400210', '20180527029', '11,04,08,01,05');
INSERT INTO ac_data_syxwgd VALUES ('803', '1527400757', '20180527030', '11,07,05,10,08');
INSERT INTO ac_data_syxwgd VALUES ('804', '1527401410', '20180527031', '07,08,10,02,06');
INSERT INTO ac_data_syxwgd VALUES ('805', '1527402011', '20180527032', '03,05,11,10,04');
INSERT INTO ac_data_syxwgd VALUES ('807', '1527402610', '20180527033', '02,07,04,10,11');
INSERT INTO ac_data_syxwgd VALUES ('808', '1527403211', '20180527034', '07,08,10,11,01');
INSERT INTO ac_data_syxwgd VALUES ('809', '1527403731', '20180527035', '03,08,01,05,07');
INSERT INTO ac_data_syxwgd VALUES ('810', '1527404410', '20180527036', '05,01,03,10,09');
INSERT INTO ac_data_syxwgd VALUES ('811', '1527405011', '20180527037', '01,06,04,05,07');
INSERT INTO ac_data_syxwgd VALUES ('813', '1527405611', '20180527038', '02,11,10,09,07');
INSERT INTO ac_data_syxwgd VALUES ('814', '1527406211', '20180527039', '04,10,08,06,01');
INSERT INTO ac_data_syxwgd VALUES ('816', '1527406810', '20180527040', '08,05,06,01,07');
INSERT INTO ac_data_syxwgd VALUES ('817', '1527407411', '20180527041', '07,06,01,11,03');
INSERT INTO ac_data_syxwgd VALUES ('818', '1527407958', '20180527042', '06,07,03,08,04');
INSERT INTO ac_data_syxwgd VALUES ('819', '1527408610', '20180527043', '08,11,04,10,09');
INSERT INTO ac_data_syxwgd VALUES ('820', '1527409211', '20180527044', '07,09,01,08,06');
INSERT INTO ac_data_syxwgd VALUES ('822', '1527409810', '20180527045', '11,05,10,08,01');
INSERT INTO ac_data_syxwgd VALUES ('823', '1527410411', '20180527046', '02,08,06,07,03');
INSERT INTO ac_data_syxwgd VALUES ('824', '1527410931', '20180527047', '02,10,05,03,01');
INSERT INTO ac_data_syxwgd VALUES ('825', '1527411611', '20180527048', '11,10,03,01,05');
INSERT INTO ac_data_syxwgd VALUES ('826', '1527412210', '20180527049', '11,04,09,03,01');
INSERT INTO ac_data_syxwgd VALUES ('828', '1527412811', '20180527050', '09,11,06,05,03');
INSERT INTO ac_data_syxwgd VALUES ('829', '1527413410', '20180527051', '11,02,06,03,04');
INSERT INTO ac_data_syxwgd VALUES ('831', '1527414010', '20180527052', '10,03,01,11,07');
INSERT INTO ac_data_syxwgd VALUES ('832', '1527414611', '20180527053', '09,10,06,03,11');
INSERT INTO ac_data_syxwgd VALUES ('833', '1527415159', '20180527054', '08,06,01,04,05');
INSERT INTO ac_data_syxwgd VALUES ('834', '1527415811', '20180527055', '06,05,01,02,10');
INSERT INTO ac_data_syxwgd VALUES ('835', '1527416410', '20180527056', '05,06,11,07,08');
INSERT INTO ac_data_syxwgd VALUES ('837', '1527417011', '20180527057', '04,01,07,02,06');
INSERT INTO ac_data_syxwgd VALUES ('838', '1527417610', '20180527058', '04,09,10,06,05');
INSERT INTO ac_data_syxwgd VALUES ('839', '1527418148', '20180527059', '09,05,02,01,11');
INSERT INTO ac_data_syxwgd VALUES ('840', '1527418811', '20180527060', '04,09,01,02,07');
INSERT INTO ac_data_syxwgd VALUES ('841', '1527419410', '20180527061', '09,08,06,03,07');
INSERT INTO ac_data_syxwgd VALUES ('843', '1527420010', '20180527062', '09,11,08,05,06');
INSERT INTO ac_data_syxwgd VALUES ('844', '1527420610', '20180527063', '05,08,11,09,04');
INSERT INTO ac_data_syxwgd VALUES ('846', '1527421211', '20180527064', '05,10,06,03,08');
INSERT INTO ac_data_syxwgd VALUES ('847', '1527421810', '20180527065', '10,02,05,03,06');
INSERT INTO ac_data_syxwgd VALUES ('848', '1527422360', '20180527066', '06,08,11,02,03');
INSERT INTO ac_data_syxwgd VALUES ('849', '1527423011', '20180527067', '10,09,04,01,11');
INSERT INTO ac_data_syxwgd VALUES ('850', '1527423611', '20180527068', '03,11,04,01,07');
INSERT INTO ac_data_syxwgd VALUES ('852', '1527424210', '20180527069', '06,10,01,07,09');
INSERT INTO ac_data_syxwgd VALUES ('853', '1527424811', '20180527070', '01,02,09,04,07');
INSERT INTO ac_data_syxwgd VALUES ('854', '1527425349', '20180527071', '02,08,07,01,10');
INSERT INTO ac_data_syxwgd VALUES ('855', '1527426011', '20180527072', '09,11,03,02,07');
INSERT INTO ac_data_syxwgd VALUES ('856', '1527426610', '20180527073', '10,01,07,02,04');
INSERT INTO ac_data_syxwgd VALUES ('858', '1527427210', '20180527074', '10,03,02,07,05');
INSERT INTO ac_data_syxwgd VALUES ('859', '1527427810', '20180527075', '01,06,07,08,03');
INSERT INTO ac_data_syxwgd VALUES ('861', '1527428411', '20180527076', '09,10,07,11,08');
INSERT INTO ac_data_syxwgd VALUES ('862', '1527429010', '20180527077', '07,08,10,06,04');
INSERT INTO ac_data_syxwgd VALUES ('863', '1527429562', '20180527078', '07,06,10,03,02');
INSERT INTO ac_data_syxwgd VALUES ('864', '1527430210', '20180527079', '08,05,03,04,11');
INSERT INTO ac_data_syxwgd VALUES ('865', '1527430811', '20180527080', '09,07,05,11,06');
INSERT INTO ac_data_syxwgd VALUES ('867', '1527431411', '20180527081', '02,05,04,06,07');
INSERT INTO ac_data_syxwgd VALUES ('868', '1527432010', '20180527082', '08,06,03,09,10');
INSERT INTO ac_data_syxwgd VALUES ('869', '1527432536', '20180527083', '02,10,03,08,09');
INSERT INTO ac_data_syxwgd VALUES ('901', '1527433143', '20180527084', '01,06,03,04,07');
INSERT INTO ac_data_syxwgd VALUES ('1161', '1527469810', '20180528001', '08,03,09,01,06');
INSERT INTO ac_data_syxwgd VALUES ('1163', '1527470411', '20180528002', '06,01,02,05,08');
INSERT INTO ac_data_syxwgd VALUES ('1164', '1527471010', '20180528003', '07,08,09,01,04');
INSERT INTO ac_data_syxwgd VALUES ('1166', '1527471611', '20180528004', '05,02,06,09,10');
INSERT INTO ac_data_syxwgd VALUES ('1167', '1527472210', '20180528005', '09,08,10,07,05');
INSERT INTO ac_data_syxwgd VALUES ('1168', '1527472769', '20180528006', '03,06,04,07,08');
INSERT INTO ac_data_syxwgd VALUES ('1169', '1527473411', '20180528007', '05,06,10,04,01');
INSERT INTO ac_data_syxwgd VALUES ('1170', '1527474011', '20180528008', '08,02,01,09,07');
INSERT INTO ac_data_syxwgd VALUES ('1172', '1527474610', '20180528009', '04,03,07,06,11');
INSERT INTO ac_data_syxwgd VALUES ('1173', '1527475211', '20180528010', '09,01,08,07,11');
INSERT INTO ac_data_syxwgd VALUES ('1174', '1527475728', '20180528011', '06,02,10,03,01');
INSERT INTO ac_data_syxwgd VALUES ('1175', '1527476410', '20180528012', '02,08,10,05,09');
INSERT INTO ac_data_syxwgd VALUES ('1176', '1527477011', '20180528013', '09,11,03,05,04');
INSERT INTO ac_data_syxwgd VALUES ('1178', '1527477611', '20180528014', '05,08,09,11,03');
INSERT INTO ac_data_syxwgd VALUES ('1179', '1527478210', '20180528015', '04,06,09,02,10');
INSERT INTO ac_data_syxwgd VALUES ('1181', '1527478810', '20180528016', '02,09,04,03,10');
INSERT INTO ac_data_syxwgd VALUES ('1182', '1527479411', '20180528017', '03,01,07,10,05');
INSERT INTO ac_data_syxwgd VALUES ('1183', '1527479971', '20180528018', '04,08,07,11,02');
INSERT INTO ac_data_syxwgd VALUES ('1184', '1527480611', '20180528019', '02,04,01,03,10');
INSERT INTO ac_data_syxwgd VALUES ('1185', '1527481210', '20180528020', '02,06,07,09,05');
INSERT INTO ac_data_syxwgd VALUES ('1187', '1527481810', '20180528021', '05,02,11,04,08');
INSERT INTO ac_data_syxwgd VALUES ('1188', '1527482411', '20180528022', '02,11,07,04,05');
INSERT INTO ac_data_syxwgd VALUES ('1189', '1527482929', '20180528023', '08,11,03,07,09');
INSERT INTO ac_data_syxwgd VALUES ('1190', '1527483610', '20180528024', '03,09,02,05,04');
INSERT INTO ac_data_syxwgd VALUES ('1191', '1527484210', '20180528025', '09,11,06,03,02');
INSERT INTO ac_data_syxwgd VALUES ('1193', '1527484810', '20180528026', '02,11,07,10,06');
INSERT INTO ac_data_syxwgd VALUES ('1194', '1527485411', '20180528027', '09,10,02,11,01');
INSERT INTO ac_data_syxwgd VALUES ('1196', '1527486011', '20180528028', '09,03,04,02,11');
INSERT INTO ac_data_syxwgd VALUES ('1197', '1527486610', '20180528029', '11,09,05,07,10');
INSERT INTO ac_data_syxwgd VALUES ('1198', '1527487172', '20180528030', '07,01,04,08,11');
INSERT INTO ac_data_syxwgd VALUES ('1199', '1527487811', '20180528031', '03,01,07,09,08');
INSERT INTO ac_data_syxwgd VALUES ('1200', '1527488410', '20180528032', '02,06,08,11,05');
INSERT INTO ac_data_syxwgd VALUES ('1202', '1527489010', '20180528033', '07,05,03,06,04');
INSERT INTO ac_data_syxwgd VALUES ('1203', '1527489611', '20180528034', '04,05,07,06,09');
INSERT INTO ac_data_syxwgd VALUES ('1204', '1527490131', '20180528035', '06,02,08,10,09');
INSERT INTO ac_data_syxwgd VALUES ('1205', '1527490810', '20180528036', '11,02,08,04,09');
INSERT INTO ac_data_syxwgd VALUES ('1206', '1527491411', '20180528037', '02,01,11,08,07');
INSERT INTO ac_data_syxwgd VALUES ('1208', '1527492011', '20180528038', '09,01,06,03,05');
INSERT INTO ac_data_syxwgd VALUES ('1209', '1527492610', '20180528039', '11,06,05,09,10');
INSERT INTO ac_data_syxwgd VALUES ('1211', '1527493211', '20180528040', '11,06,07,04,01');
INSERT INTO ac_data_syxwgd VALUES ('1212', '1527493810', '20180528041', '01,05,02,06,10');
INSERT INTO ac_data_syxwgd VALUES ('1213', '1527494373', '20180528042', '05,04,08,11,03');
INSERT INTO ac_data_syxwgd VALUES ('1214', '1527495010', '20180528043', '10,09,03,11,02');
INSERT INTO ac_data_syxwgd VALUES ('1215', '1527495611', '20180528044', '06,04,08,03,11');
INSERT INTO ac_data_syxwgd VALUES ('1217', '1527496210', '20180528045', '11,02,03,08,10');
INSERT INTO ac_data_syxwgd VALUES ('1218', '1527496811', '20180528046', '02,04,01,07,10');
INSERT INTO ac_data_syxwgd VALUES ('1219', '1527497332', '20180528047', '02,08,06,04,05');
INSERT INTO ac_data_syxwgd VALUES ('1220', '1527498010', '20180528048', '06,10,01,07,08');
INSERT INTO ac_data_syxwgd VALUES ('1221', '1527498611', '20180528049', '06,10,04,09,01');
INSERT INTO ac_data_syxwgd VALUES ('1223', '1527499211', '20180528050', '10,05,06,04,03');
INSERT INTO ac_data_syxwgd VALUES ('1224', '1527499810', '20180528051', '04,06,09,07,02');
INSERT INTO ac_data_syxwgd VALUES ('1226', '1527500410', '20180528052', '03,07,04,11,05');
INSERT INTO ac_data_syxwgd VALUES ('1227', '1527501011', '20180528053', '11,10,04,05,06');
INSERT INTO ac_data_syxwgd VALUES ('1228', '1527501575', '20180528054', '03,05,07,11,02');
INSERT INTO ac_data_syxwgd VALUES ('1229', '1527502210', '20180528055', '10,07,06,08,03');
INSERT INTO ac_data_syxwgd VALUES ('1230', '1527502810', '20180528056', '03,05,04,09,06');
INSERT INTO ac_data_syxwgd VALUES ('1232', '1527503411', '20180528057', '02,08,07,09,05');
INSERT INTO ac_data_syxwgd VALUES ('1233', '1527504010', '20180528058', '04,05,08,01,06');
INSERT INTO ac_data_syxwgd VALUES ('1234', '1527504533', '20180528059', '07,05,06,03,10');
INSERT INTO ac_data_syxwgd VALUES ('1235', '1527505210', '20180528060', '04,10,01,09,08');
INSERT INTO ac_data_syxwgd VALUES ('1236', '1527505811', '20180528061', '04,10,09,02,06');
INSERT INTO ac_data_syxwgd VALUES ('1238', '1527506410', '20180528062', '10,06,11,05,04');
INSERT INTO ac_data_syxwgd VALUES ('1239', '1527507011', '20180528063', '08,01,10,07,04');
INSERT INTO ac_data_syxwgd VALUES ('1241', '1527507610', '20180528064', '04,05,07,03,01');
INSERT INTO ac_data_syxwgd VALUES ('1242', '1527508211', '20180528065', '09,10,01,06,04');
INSERT INTO ac_data_syxwgd VALUES ('1243', '1527508776', '20180528066', '11,03,02,07,08');
INSERT INTO ac_data_syxwgd VALUES ('1244', '1527509411', '20180528067', '01,06,07,04,02');
INSERT INTO ac_data_syxwgd VALUES ('1245', '1527510010', '20180528068', '06,05,11,08,01');
INSERT INTO ac_data_syxwgd VALUES ('1247', '1527510611', '20180528069', '05,07,02,11,01');
INSERT INTO ac_data_syxwgd VALUES ('1248', '1527511211', '20180528070', '03,01,08,10,02');
INSERT INTO ac_data_syxwgd VALUES ('1249', '1527511735', '20180528071', '09,02,11,10,05');
INSERT INTO ac_data_syxwgd VALUES ('1250', '1527512410', '20180528072', '04,02,05,07,10');
INSERT INTO ac_data_syxwgd VALUES ('1251', '1527513011', '20180528073', '01,04,11,03,05');
INSERT INTO ac_data_syxwgd VALUES ('1253', '1527513611', '20180528074', '08,10,02,03,05');
INSERT INTO ac_data_syxwgd VALUES ('1254', '1527514210', '20180528075', '01,04,07,06,11');
INSERT INTO ac_data_syxwgd VALUES ('1256', '1527514811', '20180528076', '01,10,04,03,07');
INSERT INTO ac_data_syxwgd VALUES ('1257', '1527515410', '20180528077', '08,06,09,03,05');
INSERT INTO ac_data_syxwgd VALUES ('1258', '1527515977', '20180528078', '06,10,08,04,05');
INSERT INTO ac_data_syxwgd VALUES ('1259', '1527516611', '20180528079', '08,10,02,06,07');
INSERT INTO ac_data_syxwgd VALUES ('1260', '1527517211', '20180528080', '05,02,11,08,01');
INSERT INTO ac_data_syxwgd VALUES ('1262', '1527517810', '20180528081', '02,07,10,04,05');
INSERT INTO ac_data_syxwgd VALUES ('1263', '1527518411', '20180528082', '10,07,09,04,01');
INSERT INTO ac_data_syxwgd VALUES ('1264', '1527518951', '20180528083', '05,09,10,06,08');
INSERT INTO ac_data_syxwgd VALUES ('1295', '1527519543', '20180528084', '02,11,09,07,10');
INSERT INTO ac_data_syxwgd VALUES ('1552', '1527556210', '20180529001', '06,01,09,03,04');
INSERT INTO ac_data_syxwgd VALUES ('1554', '1527556811', '20180529002', '11,04,01,08,05');
INSERT INTO ac_data_syxwgd VALUES ('1555', '1527557410', '20180529003', '01,11,05,02,07');
INSERT INTO ac_data_syxwgd VALUES ('1557', '1527558011', '20180529004', '02,04,10,11,03');
INSERT INTO ac_data_syxwgd VALUES ('1558', '1527558611', '20180529005', '07,11,04,02,01');
INSERT INTO ac_data_syxwgd VALUES ('1559', '1527559185', '20180529006', '03,05,04,10,01');
INSERT INTO ac_data_syxwgd VALUES ('1560', '1527857149', '20180601070', '06,11,02,08,01');
INSERT INTO ac_data_syxwgd VALUES ('1561', '1527857410', '20180601071', '04,05,10,11,07');
INSERT INTO ac_data_syxwgd VALUES ('1562', '1527858011', '20180601072', '10,08,04,07,09');
INSERT INTO ac_data_syxwgd VALUES ('1563', '1527858589', '20180601073', '07,06,04,03,05');
INSERT INTO ac_data_syxwgd VALUES ('1564', '1527859210', '20180601074', '07,05,10,02,08');
INSERT INTO ac_data_syxwgd VALUES ('1565', '1527859811', '20180601075', '10,06,03,11,01');
INSERT INTO ac_data_syxwgd VALUES ('1567', '1527860540', '20180601076', '05,01,02,07,04');
INSERT INTO ac_data_syxwgd VALUES ('1569', '1527861010', '20180601077', '02,07,05,08,01');
INSERT INTO ac_data_syxwgd VALUES ('1570', '1527861531', '20180601078', '04,10,07,09,08');
INSERT INTO ac_data_syxwgd VALUES ('1571', '1527862211', '20180601079', '11,01,06,07,10');
INSERT INTO ac_data_syxwgd VALUES ('1572', '1527862810', '20180601080', '02,06,04,08,05');
INSERT INTO ac_data_syxwgd VALUES ('1574', '1527863411', '20180601081', '07,09,06,01,11');
INSERT INTO ac_data_syxwgd VALUES ('1575', '1527864011', '20180601082', '06,04,01,11,07');
INSERT INTO ac_data_syxwgd VALUES ('1577', '1527864610', '20180601083', '09,08,07,03,04');
INSERT INTO ac_data_syxwgd VALUES ('1603', '1527865124', '20180601084', '03,05,09,06,08');
INSERT INTO ac_data_syxwgd VALUES ('1711', '1527907529', '20180602010', '03,10,09,07,01');
INSERT INTO ac_data_syxwgd VALUES ('1713', '1527907810', '20180602011', '09,05,04,01,11');
INSERT INTO ac_data_syxwgd VALUES ('1714', '1527908411', '20180602012', '05,10,07,03,02');
INSERT INTO ac_data_syxwgd VALUES ('1715', '1527908954', '20180602013', '10,03,11,01,05');
INSERT INTO ac_data_syxwgd VALUES ('1716', '1527909611', '20180602014', '06,03,08,01,09');
INSERT INTO ac_data_syxwgd VALUES ('1717', '1527910210', '20180602015', '07,06,02,04,05');
INSERT INTO ac_data_syxwgd VALUES ('1719', '1527910811', '20180602016', '08,11,07,03,02');
INSERT INTO ac_data_syxwgd VALUES ('1720', '1527911410', '20180602017', '03,07,05,11,01');
INSERT INTO ac_data_syxwgd VALUES ('1721', '1527911896', '20180602018', '06,02,09,10,08');
INSERT INTO ac_data_syxwgd VALUES ('1722', '1527912611', '20180602019', '02,03,11,01,10');
INSERT INTO ac_data_syxwgd VALUES ('1723', '1527913210', '20180602020', '05,09,04,10,11');
INSERT INTO ac_data_syxwgd VALUES ('1725', '1527913810', '20180602021', '08,04,01,10,02');
INSERT INTO ac_data_syxwgd VALUES ('1726', '1527914411', '20180602022', '05,06,08,03,02');
INSERT INTO ac_data_syxwgd VALUES ('1728', '1527915010', '20180602023', '06,05,03,11,09');
INSERT INTO ac_data_syxwgd VALUES ('1729', '1527915611', '20180602024', '10,01,03,09,11');
INSERT INTO ac_data_syxwgd VALUES ('1730', '1527916155', '20180602025', '11,05,04,08,09');
INSERT INTO ac_data_syxwgd VALUES ('1731', '1527916811', '20180602026', '10,03,04,11,02');
INSERT INTO ac_data_syxwgd VALUES ('1732', '1527917410', '20180602027', '04,07,01,02,11');
INSERT INTO ac_data_syxwgd VALUES ('1734', '1527918011', '20180602028', '02,04,09,11,03');
INSERT INTO ac_data_syxwgd VALUES ('1735', '1527918610', '20180602029', '06,04,02,11,01');
INSERT INTO ac_data_syxwgd VALUES ('1736', '1527919098', '20180602030', '10,11,09,04,08');
INSERT INTO ac_data_syxwgd VALUES ('1737', '1527919810', '20180602031', '08,04,03,05,01');
INSERT INTO ac_data_syxwgd VALUES ('1738', '1527920411', '20180602032', '10,09,01,08,11');
INSERT INTO ac_data_syxwgd VALUES ('1740', '1527921010', '20180602033', '06,11,03,05,07');
INSERT INTO ac_data_syxwgd VALUES ('1741', '1527921610', '20180602034', '03,02,04,05,01');
INSERT INTO ac_data_syxwgd VALUES ('1743', '1527922210', '20180602035', '04,10,09,07,06');
INSERT INTO ac_data_syxwgd VALUES ('1744', '1527922811', '20180602036', '09,01,05,08,04');
INSERT INTO ac_data_syxwgd VALUES ('1745', '1527923356', '20180602037', '06,03,08,11,05');
INSERT INTO ac_data_syxwgd VALUES ('1746', '1527924011', '20180602038', '09,04,08,02,01');
INSERT INTO ac_data_syxwgd VALUES ('1747', '1527924610', '20180602039', '05,06,02,04,08');
INSERT INTO ac_data_syxwgd VALUES ('1749', '1527925210', '20180602040', '03,01,05,08,07');
INSERT INTO ac_data_syxwgd VALUES ('1750', '1527925811', '20180602041', '06,07,02,03,04');
INSERT INTO ac_data_syxwgd VALUES ('1751', '1527926299', '20180602042', '11,01,02,06,07');
INSERT INTO ac_data_syxwgd VALUES ('1752', '1527927010', '20180602043', '11,02,07,04,08');
INSERT INTO ac_data_syxwgd VALUES ('1753', '1527927611', '20180602044', '11,06,02,08,01');
INSERT INTO ac_data_syxwgd VALUES ('1755', '1527928211', '20180602045', '03,09,02,10,07');
INSERT INTO ac_data_syxwgd VALUES ('1756', '1527928810', '20180602046', '08,03,07,02,10');
INSERT INTO ac_data_syxwgd VALUES ('1758', '1527929411', '20180602047', '05,03,01,02,07');
INSERT INTO ac_data_syxwgd VALUES ('1759', '1527930010', '20180602048', '08,09,02,03,04');
INSERT INTO ac_data_syxwgd VALUES ('1760', '1527930558', '20180602049', '03,02,09,07,06');
INSERT INTO ac_data_syxwgd VALUES ('1761', '1527931210', '20180602050', '06,03,09,08,10');
INSERT INTO ac_data_syxwgd VALUES ('1762', '1527931811', '20180602051', '08,02,04,11,05');
INSERT INTO ac_data_syxwgd VALUES ('1764', '1527932410', '20180602052', '10,06,07,08,02');
INSERT INTO ac_data_syxwgd VALUES ('1765', '1527933011', '20180602053', '01,09,02,11,04');
INSERT INTO ac_data_syxwgd VALUES ('1766', '1527933515', '20180602054', '01,10,11,02,05');
INSERT INTO ac_data_syxwgd VALUES ('1767', '1527934211', '20180602055', '08,02,05,06,03');
INSERT INTO ac_data_syxwgd VALUES ('1768', '1527934810', '20180602056', '02,07,11,09,04');
INSERT INTO ac_data_syxwgd VALUES ('1770', '1527935411', '20180602057', '05,08,04,07,03');
INSERT INTO ac_data_syxwgd VALUES ('1771', '1527936011', '20180602058', '10,03,11,04,05');
INSERT INTO ac_data_syxwgd VALUES ('1773', '1527936610', '20180602059', '08,02,05,06,11');
INSERT INTO ac_data_syxwgd VALUES ('1774', '1527937211', '20180602060', '02,04,08,11,05');
INSERT INTO ac_data_syxwgd VALUES ('1775', '1527937759', '20180602061', '05,11,01,07,06');
INSERT INTO ac_data_syxwgd VALUES ('1776', '1527938410', '20180602062', '07,01,03,11,10');
INSERT INTO ac_data_syxwgd VALUES ('1777', '1527939011', '20180602063', '04,05,09,08,01');
INSERT INTO ac_data_syxwgd VALUES ('1779', '1527939611', '20180602064', '05,01,10,04,02');
INSERT INTO ac_data_syxwgd VALUES ('1780', '1527940210', '20180602065', '08,01,03,10,07');
INSERT INTO ac_data_syxwgd VALUES ('1781', '1527940717', '20180602066', '04,10,06,02,07');
INSERT INTO ac_data_syxwgd VALUES ('1782', '1527941411', '20180602067', '04,02,08,09,06');
INSERT INTO ac_data_syxwgd VALUES ('1783', '1527942010', '20180602068', '08,02,10,04,01');
INSERT INTO ac_data_syxwgd VALUES ('1785', '1527942610', '20180602069', '01,09,04,11,05');
INSERT INTO ac_data_syxwgd VALUES ('1786', '1527943211', '20180602070', '03,08,02,06,09');
INSERT INTO ac_data_syxwgd VALUES ('1788', '1527943810', '20180602071', '03,02,05,11,01');
INSERT INTO ac_data_syxwgd VALUES ('1789', '1527944410', '20180602072', '05,11,09,07,06');
INSERT INTO ac_data_syxwgd VALUES ('1790', '1527944960', '20180602073', '09,10,08,02,03');
INSERT INTO ac_data_syxwgd VALUES ('1791', '1527945611', '20180602074', '03,02,10,04,09');
INSERT INTO ac_data_syxwgd VALUES ('1792', '1527946210', '20180602075', '03,05,11,06,09');
INSERT INTO ac_data_syxwgd VALUES ('1794', '1527946811', '20180602076', '05,07,02,04,08');
INSERT INTO ac_data_syxwgd VALUES ('1795', '1527947410', '20180602077', '04,01,02,06,05');
INSERT INTO ac_data_syxwgd VALUES ('1796', '1527947918', '20180602078', '01,04,03,07,10');
INSERT INTO ac_data_syxwgd VALUES ('1797', '1527948611', '20180602079', '06,10,05,08,03');
INSERT INTO ac_data_syxwgd VALUES ('1798', '1527949211', '20180602080', '08,01,10,04,03');
INSERT INTO ac_data_syxwgd VALUES ('1800', '1527949811', '20180602081', '10,11,05,07,08');
INSERT INTO ac_data_syxwgd VALUES ('1801', '1527950410', '20180602082', '04,07,08,10,02');
INSERT INTO ac_data_syxwgd VALUES ('1803', '1527951011', '20180602083', '07,09,01,02,03');
INSERT INTO ac_data_syxwgd VALUES ('1828', '1527951525', '20180602084', '06,09,03,04,11');
INSERT INTO ac_data_syxwgd VALUES ('1880', '1527989893', '20180603004', '05,09,07,08,10');
INSERT INTO ac_data_syxwgd VALUES ('1882', '1527990610', '20180603005', '09,07,01,03,10');
INSERT INTO ac_data_syxwgd VALUES ('1883', '1527991211', '20180603006', '11,02,04,07,03');
INSERT INTO ac_data_syxwgd VALUES ('1885', '1527991810', '20180603007', '09,11,01,06,02');
INSERT INTO ac_data_syxwgd VALUES ('1886', '1527992411', '20180603008', '10,04,11,05,09');
INSERT INTO ac_data_syxwgd VALUES ('1888', '1527993010', '20180603009', '03,11,01,06,10');
INSERT INTO ac_data_syxwgd VALUES ('1889', '1527993610', '20180603010', '04,05,07,02,09');
INSERT INTO ac_data_syxwgd VALUES ('1890', '1527994198', '20180603011', '06,01,03,07,04');
INSERT INTO ac_data_syxwgd VALUES ('1891', '1527994811', '20180603012', '07,05,08,01,09');
INSERT INTO ac_data_syxwgd VALUES ('1892', '1527995410', '20180603013', '10,04,02,08,11');
INSERT INTO ac_data_syxwgd VALUES ('1894', '1527996010', '20180603014', '08,05,06,02,09');
INSERT INTO ac_data_syxwgd VALUES ('1895', '1527996611', '20180603015', '04,09,08,03,11');
INSERT INTO ac_data_syxwgd VALUES ('1896', '1527997095', '20180603016', '07,01,08,11,04');
INSERT INTO ac_data_syxwgd VALUES ('1897', '1527997810', '20180603017', '11,10,03,08,02');
INSERT INTO ac_data_syxwgd VALUES ('1898', '1527998411', '20180603018', '06,08,10,01,02');
INSERT INTO ac_data_syxwgd VALUES ('1900', '1527999011', '20180603019', '07,01,11,05,08');
INSERT INTO ac_data_syxwgd VALUES ('1901', '1527999610', '20180603020', '03,11,07,05,08');
INSERT INTO ac_data_syxwgd VALUES ('1903', '1528000210', '20180603021', '01,04,08,05,06');
INSERT INTO ac_data_syxwgd VALUES ('1904', '1528000811', '20180603022', '01,08,02,07,03');
INSERT INTO ac_data_syxwgd VALUES ('1905', '1528001400', '20180603023', '10,01,11,02,06');
INSERT INTO ac_data_syxwgd VALUES ('1906', '1528002010', '20180603024', '06,05,01,02,04');
INSERT INTO ac_data_syxwgd VALUES ('1907', '1528002611', '20180603025', '07,01,02,05,09');
INSERT INTO ac_data_syxwgd VALUES ('1909', '1528003211', '20180603026', '08,10,09,07,11');
INSERT INTO ac_data_syxwgd VALUES ('1910', '1528003810', '20180603027', '02,08,09,05,04');
INSERT INTO ac_data_syxwgd VALUES ('1911', '1528004296', '20180603028', '10,08,04,05,02');
INSERT INTO ac_data_syxwgd VALUES ('1912', '1528005010', '20180603029', '01,09,04,10,07');
INSERT INTO ac_data_syxwgd VALUES ('1913', '1528005611', '20180603030', '01,10,03,02,05');
INSERT INTO ac_data_syxwgd VALUES ('1915', '1528006210', '20180603031', '05,02,09,08,04');
INSERT INTO ac_data_syxwgd VALUES ('1916', '1528006811', '20180603032', '07,04,09,10,01');
INSERT INTO ac_data_syxwgd VALUES ('1918', '1528007410', '20180603033', '11,09,04,01,07');
INSERT INTO ac_data_syxwgd VALUES ('1919', '1528008011', '20180603034', '04,08,06,07,11');
INSERT INTO ac_data_syxwgd VALUES ('1920', '1528008601', '20180603035', '07,08,04,02,03');
INSERT INTO ac_data_syxwgd VALUES ('1921', '1528009211', '20180603036', '03,02,06,04,01');
INSERT INTO ac_data_syxwgd VALUES ('1922', '1528009810', '20180603037', '06,03,04,01,11');
INSERT INTO ac_data_syxwgd VALUES ('1924', '1528010411', '20180603038', '09,05,11,08,04');
INSERT INTO ac_data_syxwgd VALUES ('1925', '1528011010', '20180603039', '04,03,09,02,01');
INSERT INTO ac_data_syxwgd VALUES ('1926', '1528011497', '20180603040', '03,08,07,01,09');
INSERT INTO ac_data_syxwgd VALUES ('1927', '1528012210', '20180603041', '06,10,07,01,08');
INSERT INTO ac_data_syxwgd VALUES ('1928', '1528012811', '20180603042', '11,06,08,05,07');
INSERT INTO ac_data_syxwgd VALUES ('1930', '1528013410', '20180603043', '11,03,04,09,01');
INSERT INTO ac_data_syxwgd VALUES ('1931', '1528014011', '20180603044', '03,10,04,09,07');
INSERT INTO ac_data_syxwgd VALUES ('1933', '1528014610', '20180603045', '07,02,01,08,06');
INSERT INTO ac_data_syxwgd VALUES ('1934', '1528015211', '20180603046', '09,11,03,04,07');
INSERT INTO ac_data_syxwgd VALUES ('1935', '1528015802', '20180603047', '11,05,03,01,06');
INSERT INTO ac_data_syxwgd VALUES ('1936', '1528016411', '20180603048', '03,10,07,01,11');
INSERT INTO ac_data_syxwgd VALUES ('1937', '1528017010', '20180603049', '09,03,04,08,07');
INSERT INTO ac_data_syxwgd VALUES ('1939', '1528017611', '20180603050', '08,09,10,06,07');
INSERT INTO ac_data_syxwgd VALUES ('1940', '1528018210', '20180603051', '10,11,05,09,01');
INSERT INTO ac_data_syxwgd VALUES ('1941', '1528018698', '20180603052', '09,05,04,01,10');
INSERT INTO ac_data_syxwgd VALUES ('1942', '1528019411', '20180603053', '09,11,07,06,08');
INSERT INTO ac_data_syxwgd VALUES ('1943', '1528020011', '20180603054', '02,06,07,09,05');
INSERT INTO ac_data_syxwgd VALUES ('1945', '1528020611', '20180603055', '09,11,08,06,04');
INSERT INTO ac_data_syxwgd VALUES ('1946', '1528021210', '20180603056', '11,09,04,05,10');
INSERT INTO ac_data_syxwgd VALUES ('1948', '1528021811', '20180603057', '04,01,02,09,05');
INSERT INTO ac_data_syxwgd VALUES ('1949', '1528022410', '20180603058', '07,09,02,10,11');
INSERT INTO ac_data_syxwgd VALUES ('1950', '1528023004', '20180603059', '10,09,01,11,06');
INSERT INTO ac_data_syxwgd VALUES ('1951', '1528023610', '20180603060', '01,03,10,08,06');
INSERT INTO ac_data_syxwgd VALUES ('1952', '1528024211', '20180603061', '03,07,10,11,04');
INSERT INTO ac_data_syxwgd VALUES ('1954', '1528024810', '20180603062', '04,08,02,05,11');
INSERT INTO ac_data_syxwgd VALUES ('1955', '1528025410', '20180603063', '02,04,05,01,11');
INSERT INTO ac_data_syxwgd VALUES ('1956', '1528025915', '20180603064', '06,08,04,09,01');
INSERT INTO ac_data_syxwgd VALUES ('1957', '1528026611', '20180603065', '10,02,01,05,09');
INSERT INTO ac_data_syxwgd VALUES ('1958', '1528027210', '20180603066', '08,05,10,02,01');
INSERT INTO ac_data_syxwgd VALUES ('1960', '1528027811', '20180603067', '04,02,05,03,01');
INSERT INTO ac_data_syxwgd VALUES ('1961', '1528028410', '20180603068', '11,03,05,06,01');
INSERT INTO ac_data_syxwgd VALUES ('1963', '1528029010', '20180603069', '02,04,07,09,01');
INSERT INTO ac_data_syxwgd VALUES ('1964', '1528029611', '20180603070', '07,05,06,02,10');
INSERT INTO ac_data_syxwgd VALUES ('1965', '1528030205', '20180603071', '04,07,08,06,11');
INSERT INTO ac_data_syxwgd VALUES ('1966', '1528030810', '20180603072', '03,07,02,11,08');
INSERT INTO ac_data_syxwgd VALUES ('1967', '1528031411', '20180603073', '09,02,11,08,07');
INSERT INTO ac_data_syxwgd VALUES ('1969', '1528042881', '20180603084', '11,05,04,06,09');
INSERT INTO ac_data_syxwgd VALUES ('1972', '1528074969', '20180604001', '06,01,09,07,04');
INSERT INTO ac_data_syxwgd VALUES ('1973', '1528075210', '20180604002', '08,09,04,10,05');
INSERT INTO ac_data_syxwgd VALUES ('1974', '1528075811', '20180604003', '03,05,09,06,10');
INSERT INTO ac_data_syxwgd VALUES ('1975', '1528076409', '20180604004', '03,10,07,02,09');
INSERT INTO ac_data_syxwgd VALUES ('1976', '1528077011', '20180604005', '06,07,03,09,11');
INSERT INTO ac_data_syxwgd VALUES ('1977', '1528077610', '20180604006', '10,01,04,06,05');
INSERT INTO ac_data_syxwgd VALUES ('1979', '1528078211', '20180604007', '02,10,11,05,03');
INSERT INTO ac_data_syxwgd VALUES ('1980', '1528078810', '20180604008', '10,06,09,01,04');
INSERT INTO ac_data_syxwgd VALUES ('1981', '1528079290', '20180604009', '04,10,05,08,09');
INSERT INTO ac_data_syxwgd VALUES ('1982', '1529827658', '20180624043', '06,05,04,10,01');
INSERT INTO ac_data_syxwgd VALUES ('1983', '1529828411', '20180624044', '06,04,01,08,02');
INSERT INTO ac_data_syxwgd VALUES ('1984', '1529829011', '20180624045', '11,09,10,01,05');
INSERT INTO ac_data_syxwgd VALUES ('1986', '1529829610', '20180624046', '06,09,01,10,05');
INSERT INTO ac_data_syxwgd VALUES ('1987', '1529830211', '20180624047', '11,05,06,07,04');
INSERT INTO ac_data_syxwgd VALUES ('1988', '1529830632', '20180624048', '03,06,11,10,01');
INSERT INTO ac_data_syxwgd VALUES ('1989', '1529831410', '20180624049', '07,09,02,10,05');
INSERT INTO ac_data_syxwgd VALUES ('1990', '1529831980', '20180624050', '10,03,04,01,05');
INSERT INTO ac_data_syxwgd VALUES ('1991', '1529832610', '20180624051', '07,02,05,06,08');
INSERT INTO ac_data_syxwgd VALUES ('1992', '1529833211', '20180624052', '10,01,07,03,02');
INSERT INTO ac_data_syxwgd VALUES ('1994', '1529833810', '20180624053', '10,06,07,11,03');
INSERT INTO ac_data_syxwgd VALUES ('1995', '1529834411', '20180624054', '11,01,08,06,04');
INSERT INTO ac_data_syxwgd VALUES ('1996', '1529834860', '20180624055', '04,01,06,10,08');
INSERT INTO ac_data_syxwgd VALUES ('1997', '1529835611', '20180624056', '05,01,03,09,02');
INSERT INTO ac_data_syxwgd VALUES ('1998', '1529836626', '20180624058', '05,02,08,10,09');
INSERT INTO ac_data_syxwgd VALUES ('1999', '1529837411', '20180624059', '10,03,04,11,09');
INSERT INTO ac_data_syxwgd VALUES ('2000', '1529837834', '20180624060', '04,01,07,11,06');
INSERT INTO ac_data_syxwgd VALUES ('2001', '1529838611', '20180624061', '08,09,05,03,07');
INSERT INTO ac_data_syxwgd VALUES ('2002', '1529839181', '20180624062', '07,06,03,05,01');
INSERT INTO ac_data_syxwgd VALUES ('2003', '1529839811', '20180624063', '09,04,03,06,05');
INSERT INTO ac_data_syxwgd VALUES ('2004', '1529840411', '20180624064', '07,05,10,09,11');
INSERT INTO ac_data_syxwgd VALUES ('2006', '1529841010', '20180624065', '04,09,06,02,11');
INSERT INTO ac_data_syxwgd VALUES ('2007', '1529841611', '20180624066', '04,10,11,09,02');
INSERT INTO ac_data_syxwgd VALUES ('2008', '1529842062', '20180624067', '08,03,07,04,06');
INSERT INTO ac_data_syxwgd VALUES ('2009', '1529842811', '20180624068', '09,11,03,10,01');
INSERT INTO ac_data_syxwgd VALUES ('2010', '1529843410', '20180624069', '03,07,09,02,01');
INSERT INTO ac_data_syxwgd VALUES ('2012', '1529844010', '20180624070', '04,07,09,10,02');
INSERT INTO ac_data_syxwgd VALUES ('2013', '1529844611', '20180624071', '01,09,02,05,10');
INSERT INTO ac_data_syxwgd VALUES ('2014', '1529845037', '20180624072', '04,06,07,11,05');
INSERT INTO ac_data_syxwgd VALUES ('2015', '1529845811', '20180624073', '02,11,04,03,06');
INSERT INTO ac_data_syxwgd VALUES ('2016', '1529846384', '20180624074', '06,04,10,07,02');
INSERT INTO ac_data_syxwgd VALUES ('2017', '1529847011', '20180624075', '07,09,03,08,02');
INSERT INTO ac_data_syxwgd VALUES ('2018', '1529847610', '20180624076', '10,09,03,01,04');
INSERT INTO ac_data_syxwgd VALUES ('2020', '1529848211', '20180624077', '10,07,09,02,11');
INSERT INTO ac_data_syxwgd VALUES ('2021', '1529848810', '20180624078', '11,05,09,06,02');
INSERT INTO ac_data_syxwgd VALUES ('2022', '1529849265', '20180624079', '08,04,09,11,02');
INSERT INTO ac_data_syxwgd VALUES ('2023', '1529850010', '20180624080', '10,11,01,08,05');
INSERT INTO ac_data_syxwgd VALUES ('2024', '1529850611', '20180624081', '10,11,06,09,05');
INSERT INTO ac_data_syxwgd VALUES ('2026', '1529851211', '20180624082', '05,01,10,08,04');
INSERT INTO ac_data_syxwgd VALUES ('2027', '1529851810', '20180624083', '06,02,03,05,04');
INSERT INTO ac_data_syxwgd VALUES ('2047', '1529852239', '20180624084', '04,07,11,03,10');
INSERT INTO ac_data_syxwgd VALUES ('2198', '1529896750', '20180625014', '03,04,08,11,09');
INSERT INTO ac_data_syxwgd VALUES ('2199', '1529913711', '20180625042', '02,04,05,01,03');
INSERT INTO ac_data_syxwgd VALUES ('2200', '1529914212', '20180625043', '10,11,03,04,01');
INSERT INTO ac_data_syxwgd VALUES ('2201', '1529914811', '20180625044', '07,03,09,05,01');
INSERT INTO ac_data_syxwgd VALUES ('2202', '1529915215', '20180625045', '07,02,01,10,06');
INSERT INTO ac_data_syxwgd VALUES ('2203', '1529916010', '20180625046', '10,11,04,08,05');
INSERT INTO ac_data_syxwgd VALUES ('2204', '1529916592', '20180625047', '07,03,04,11,01');
INSERT INTO ac_data_syxwgd VALUES ('2205', '1529917211', '20180625048', '02,06,08,04,11');
INSERT INTO ac_data_syxwgd VALUES ('2206', '1529920021', '20180625053', '05,04,03,06,09');
INSERT INTO ac_data_syxwgd VALUES ('2207', '1529920750', '20180625054', '06,08,07,10,01');
INSERT INTO ac_data_syxwgd VALUES ('2208', '1529921361', '20180625055', '11,01,05,02,03');
INSERT INTO ac_data_syxwgd VALUES ('2209', '1529922011', '20180625056', '07,11,06,05,03');
INSERT INTO ac_data_syxwgd VALUES ('2210', '1529922610', '20180625057', '10,04,07,03,05');
INSERT INTO ac_data_syxwgd VALUES ('2212', '1529923210', '20180625058', '02,01,11,10,08');
INSERT INTO ac_data_syxwgd VALUES ('2213', '1529923811', '20180625059', '09,03,02,11,05');
INSERT INTO ac_data_syxwgd VALUES ('2214', '1529924242', '20180625060', '04,09,07,10,11');
INSERT INTO ac_data_syxwgd VALUES ('2215', '1529925011', '20180625061', '02,03,10,01,07');
INSERT INTO ac_data_syxwgd VALUES ('2216', '1529925610', '20180625062', '10,05,08,04,01');
INSERT INTO ac_data_syxwgd VALUES ('2218', '1529926210', '20180625063', '11,05,08,06,09');
INSERT INTO ac_data_syxwgd VALUES ('2219', '1529926811', '20180625064', '11,02,05,08,07');
INSERT INTO ac_data_syxwgd VALUES ('2220', '1529927217', '20180625065', '09,11,06,05,02');
INSERT INTO ac_data_syxwgd VALUES ('2221', '1529928010', '20180625066', '01,07,05,09,03');
INSERT INTO ac_data_syxwgd VALUES ('2222', '1529928564', '20180625067', '03,01,11,06,07');
INSERT INTO ac_data_syxwgd VALUES ('2223', '1529929210', '20180625068', '06,08,04,11,10');
INSERT INTO ac_data_syxwgd VALUES ('2224', '1529929810', '20180625069', '11,03,09,01,02');
INSERT INTO ac_data_syxwgd VALUES ('2226', '1529930410', '20180625070', '07,11,01,10,02');
INSERT INTO ac_data_syxwgd VALUES ('2227', '1529931011', '20180625071', '09,08,06,10,05');
INSERT INTO ac_data_syxwgd VALUES ('2228', '1529931445', '20180625072', '05,02,08,09,11');
INSERT INTO ac_data_syxwgd VALUES ('2229', '1529932211', '20180625073', '05,07,06,08,04');
INSERT INTO ac_data_syxwgd VALUES ('2230', '1529932810', '20180625074', '06,11,05,09,03');
INSERT INTO ac_data_syxwgd VALUES ('2232', '1529933410', '20180625075', '09,11,10,03,01');
INSERT INTO ac_data_syxwgd VALUES ('2233', '1529934011', '20180625076', '11,01,06,04,10');
INSERT INTO ac_data_syxwgd VALUES ('2234', '1529934434', '20180625077', '09,07,11,05,10');
INSERT INTO ac_data_syxwgd VALUES ('2235', '1529935210', '20180625078', '08,07,11,05,01');
INSERT INTO ac_data_syxwgd VALUES ('2236', '1529935767', '20180625079', '09,08,03,05,04');
INSERT INTO ac_data_syxwgd VALUES ('2237', '1529936410', '20180625080', '05,11,09,07,02');
INSERT INTO ac_data_syxwgd VALUES ('2238', '1529937010', '20180625081', '04,11,10,07,08');
INSERT INTO ac_data_syxwgd VALUES ('2240', '1529937611', '20180625082', '10,07,08,06,05');
INSERT INTO ac_data_syxwgd VALUES ('2241', '1529938210', '20180625083', '03,07,08,01,04');
INSERT INTO ac_data_syxwgd VALUES ('2261', '1529938631', '20180625084', '11,02,03,08,01');
INSERT INTO ac_data_syxwgd VALUES ('2514', '1529978881', '20180626007', '03,05,01,11,02');
INSERT INTO ac_data_syxwgd VALUES ('2516', '1529979611', '20180626008', '04,03,02,11,01');
INSERT INTO ac_data_syxwgd VALUES ('2517', '1529980210', '20180626009', '11,09,02,03,06');
INSERT INTO ac_data_syxwgd VALUES ('2519', '1529980811', '20180626010', '05,02,11,07,06');
INSERT INTO ac_data_syxwgd VALUES ('2520', '1529982767', '20180626013', '10,07,11,02,05');
INSERT INTO ac_data_syxwgd VALUES ('2522', '1529983211', '20180626014', '03,06,09,11,04');
INSERT INTO ac_data_syxwgd VALUES ('2523', '1529983810', '20180626015', '11,01,03,07,05');
INSERT INTO ac_data_syxwgd VALUES ('2524', '1529984224', '20180626016', '01,03,09,08,02');
INSERT INTO ac_data_syxwgd VALUES ('2525', '1529985011', '20180626017', '01,04,02,03,08');
INSERT INTO ac_data_syxwgd VALUES ('2526', '1529985611', '20180626018', '11,03,01,04,02');
INSERT INTO ac_data_syxwgd VALUES ('2528', '1529986211', '20180626019', '08,04,09,01,06');
INSERT INTO ac_data_syxwgd VALUES ('2529', '1529986810', '20180626020', '01,10,07,04,06');
INSERT INTO ac_data_syxwgd VALUES ('2531', '1529987411', '20180626021', '06,09,08,05,02');
INSERT INTO ac_data_syxwgd VALUES ('2532', '1529988010', '20180626022', '01,06,02,11,03');
INSERT INTO ac_data_syxwgd VALUES ('2533', '1529988499', '20180626023', '07,11,10,08,01');
INSERT INTO ac_data_syxwgd VALUES ('2534', '1529989211', '20180626024', '11,09,08,03,05');
INSERT INTO ac_data_syxwgd VALUES ('2535', '1529989810', '20180626025', '02,05,01,08,07');
INSERT INTO ac_data_syxwgd VALUES ('2537', '1529990411', '20180626026', '05,07,11,09,10');
INSERT INTO ac_data_syxwgd VALUES ('2538', '1529991011', '20180626027', '04,08,07,09,01');
INSERT INTO ac_data_syxwgd VALUES ('2539', '1529991412', '20180626028', '11,10,05,04,06');
INSERT INTO ac_data_syxwgd VALUES ('2540', '1529992211', '20180626029', '01,08,09,04,05');
INSERT INTO ac_data_syxwgd VALUES ('2541', '1529992810', '20180626030', '05,08,04,06,01');
INSERT INTO ac_data_syxwgd VALUES ('2543', '1529993411', '20180626031', '06,05,07,11,09');
INSERT INTO ac_data_syxwgd VALUES ('2544', '1529994011', '20180626032', '01,04,10,11,05');
INSERT INTO ac_data_syxwgd VALUES ('2546', '1529994610', '20180626033', '06,07,03,11,05');
INSERT INTO ac_data_syxwgd VALUES ('2547', '1529995212', '20180626034', '03,04,05,11,09');
INSERT INTO ac_data_syxwgd VALUES ('2548', '1529995701', '20180626035', '04,05,01,09,08');
INSERT INTO ac_data_syxwgd VALUES ('2549', '1529996411', '20180626036', '04,02,05,07,06');
INSERT INTO ac_data_syxwgd VALUES ('2550', '1529997011', '20180626037', '04,10,09,08,03');
INSERT INTO ac_data_syxwgd VALUES ('2552', '1529997611', '20180626038', '10,01,11,06,04');
INSERT INTO ac_data_syxwgd VALUES ('2553', '1529998210', '20180626039', '04,05,01,02,08');
INSERT INTO ac_data_syxwgd VALUES ('2554', '1529998614', '20180626040', '02,05,03,04,08');
INSERT INTO ac_data_syxwgd VALUES ('2555', '1529999411', '20180626041', '09,05,03,10,04');
INSERT INTO ac_data_syxwgd VALUES ('2556', '1530000011', '20180626042', '10,05,09,07,06');
INSERT INTO ac_data_syxwgd VALUES ('2558', '1530000611', '20180626043', '10,05,01,03,08');
INSERT INTO ac_data_syxwgd VALUES ('2559', '1530001210', '20180626044', '06,04,09,08,11');
INSERT INTO ac_data_syxwgd VALUES ('2561', '1530001811', '20180626045', '11,10,08,07,03');
INSERT INTO ac_data_syxwgd VALUES ('2562', '1530002410', '20180626046', '02,07,01,03,05');
INSERT INTO ac_data_syxwgd VALUES ('2563', '1530002904', '20180626047', '08,02,10,09,11');
INSERT INTO ac_data_syxwgd VALUES ('2564', '1530003611', '20180626048', '09,08,10,11,02');
INSERT INTO ac_data_syxwgd VALUES ('2565', '1530005360', '20180626051', '04,01,07,02,08');
INSERT INTO ac_data_syxwgd VALUES ('2567', '1530006011', '20180626052', '06,10,05,04,01');
INSERT INTO ac_data_syxwgd VALUES ('2568', '1530006610', '20180626053', '05,09,08,02,03');
INSERT INTO ac_data_syxwgd VALUES ('2570', '1530007613', '20180626055', '09,02,01,11,06');
INSERT INTO ac_data_syxwgd VALUES ('2571', '1530008318', '20180626056', '03,01,02,11,04');
INSERT INTO ac_data_syxwgd VALUES ('2572', '1530009011', '20180626057', '02,07,08,03,11');
INSERT INTO ac_data_syxwgd VALUES ('2573', '1530009610', '20180626058', '11,05,04,07,09');
INSERT INTO ac_data_syxwgd VALUES ('2575', '1530010210', '20180626059', '07,11,08,09,10');
INSERT INTO ac_data_syxwgd VALUES ('2576', '1530010811', '20180626060', '06,08,05,11,03');
INSERT INTO ac_data_syxwgd VALUES ('2577', '1530011231', '20180626061', '09,10,02,01,04');
INSERT INTO ac_data_syxwgd VALUES ('2578', '1530012010', '20180626062', '07,10,08,05,02');
INSERT INTO ac_data_syxwgd VALUES ('2579', '1530012611', '20180626063', '07,01,09,06,04');
INSERT INTO ac_data_syxwgd VALUES ('2581', '1530013210', '20180626064', '01,05,09,11,07');
INSERT INTO ac_data_syxwgd VALUES ('2582', '1530013810', '20180626065', '05,04,11,09,06');
INSERT INTO ac_data_syxwgd VALUES ('2584', '1530014410', '20180626066', '04,06,05,01,07');
INSERT INTO ac_data_syxwgd VALUES ('2585', '1530015011', '20180626067', '04,07,10,06,01');
INSERT INTO ac_data_syxwgd VALUES ('2586', '1530015521', '20180626068', '03,08,01,07,06');
INSERT INTO ac_data_syxwgd VALUES ('2587', '1530016210', '20180626069', '09,07,01,08,02');
INSERT INTO ac_data_syxwgd VALUES ('2588', '1530016811', '20180626070', '02,10,07,08,05');
INSERT INTO ac_data_syxwgd VALUES ('2590', '1530017411', '20180626071', '05,09,07,01,08');
INSERT INTO ac_data_syxwgd VALUES ('2591', '1530018010', '20180626072', '09,04,02,06,03');
INSERT INTO ac_data_syxwgd VALUES ('2592', '1530018417', '20180626073', '11,04,07,02,03');
INSERT INTO ac_data_syxwgd VALUES ('2593', '1530019211', '20180626074', '03,06,02,09,07');
INSERT INTO ac_data_syxwgd VALUES ('2594', '1530019810', '20180626075', '10,05,11,04,01');
INSERT INTO ac_data_syxwgd VALUES ('2596', '1530020411', '20180626076', '03,06,02,01,09');
INSERT INTO ac_data_syxwgd VALUES ('2597', '1530021010', '20180626077', '05,03,04,11,07');
INSERT INTO ac_data_syxwgd VALUES ('2599', '1530021610', '20180626078', '07,05,11,04,09');
INSERT INTO ac_data_syxwgd VALUES ('2600', '1530022211', '20180626079', '06,04,11,03,10');
INSERT INTO ac_data_syxwgd VALUES ('2601', '1530022723', '20180626080', '03,04,08,02,01');
INSERT INTO ac_data_syxwgd VALUES ('2602', '1530023411', '20180626081', '01,08,09,07,11');
INSERT INTO ac_data_syxwgd VALUES ('2603', '1530024010', '20180626082', '03,05,04,11,06');
INSERT INTO ac_data_syxwgd VALUES ('2605', '1530024610', '20180626083', '06,11,08,03,04');
INSERT INTO ac_data_syxwgd VALUES ('2624', '1530025031', '20180626084', '02,06,05,07,08');
INSERT INTO ac_data_syxwgd VALUES ('2875', '1530061810', '20180627001', '07,01,05,04,09');
INSERT INTO ac_data_syxwgd VALUES ('2876', '1530062410', '20180627002', '11,05,04,07,10');
INSERT INTO ac_data_syxwgd VALUES ('2877', '1530359964', '20180630066', '11,02,06,03,07');
INSERT INTO ac_data_syxwgd VALUES ('2878', '1530360610', '20180630067', '07,06,03,02,11');
INSERT INTO ac_data_syxwgd VALUES ('2879', '1530361211', '20180630068', '05,08,02,10,06');
INSERT INTO ac_data_syxwgd VALUES ('2881', '1530361810', '20180630069', '10,05,08,03,06');
INSERT INTO ac_data_syxwgd VALUES ('2882', '1530362410', '20180630070', '09,11,07,10,06');
INSERT INTO ac_data_syxwgd VALUES ('2883', '1530362844', '20180630071', '07,10,01,05,03');
INSERT INTO ac_data_syxwgd VALUES ('2884', '1530363611', '20180630072', '09,02,03,05,10');
INSERT INTO ac_data_syxwgd VALUES ('2885', '1530364210', '20180630073', '07,06,02,04,10');
INSERT INTO ac_data_syxwgd VALUES ('2887', '1530364810', '20180630074', '10,05,06,08,03');
INSERT INTO ac_data_syxwgd VALUES ('2888', '1530365411', '20180630075', '09,08,04,06,07');
INSERT INTO ac_data_syxwgd VALUES ('2889', '1530365834', '20180630076', '05,02,11,10,06');
INSERT INTO ac_data_syxwgd VALUES ('2890', '1530366610', '20180630077', '11,04,10,05,03');
INSERT INTO ac_data_syxwgd VALUES ('2891', '1530367166', '20180630078', '06,10,09,04,03');
INSERT INTO ac_data_syxwgd VALUES ('2892', '1530367810', '20180630079', '06,07,03,05,04');
INSERT INTO ac_data_syxwgd VALUES ('2893', '1530368411', '20180630080', '06,01,10,08,02');
INSERT INTO ac_data_syxwgd VALUES ('2895', '1530369011', '20180630081', '03,06,05,08,01');
INSERT INTO ac_data_syxwgd VALUES ('2896', '1530369610', '20180630082', '04,07,01,08,10');
INSERT INTO ac_data_syxwgd VALUES ('2897', '1530370047', '20180630083', '01,04,08,05,10');
INSERT INTO ac_data_syxwgd VALUES ('2926', '1530370622', '20180630084', '01,08,04,06,09');
INSERT INTO ac_data_syxwgd VALUES ('2927', '1530783403', '20180705051', '01,07,11,09,10');
INSERT INTO ac_data_syxwgd VALUES ('2928', '1530783702', '20180705052', '11,06,02,10,05');
INSERT INTO ac_data_syxwgd VALUES ('2929', '1530784303', '20180705053', '09,08,01,11,04');
INSERT INTO ac_data_syxwgd VALUES ('2930', '1530784905', '20180705054', '01,11,04,07,05');
INSERT INTO ac_data_syxwgd VALUES ('2931', '1530785510', '20180705055', '08,07,09,05,01');
INSERT INTO ac_data_syxwgd VALUES ('2932', '1530786115', '20180705056', '10,06,11,03,09');
INSERT INTO ac_data_syxwgd VALUES ('2934', '1530786701', '20180705057', '04,11,08,06,05');
INSERT INTO ac_data_syxwgd VALUES ('2935', '1530787306', '20180705058', '10,05,06,07,11');
INSERT INTO ac_data_syxwgd VALUES ('2937', '1530787904', '20180705059', '03,09,01,11,07');
INSERT INTO ac_data_syxwgd VALUES ('2938', '1530788505', '20180705060', '10,02,04,07,03');
INSERT INTO ac_data_syxwgd VALUES ('2939', '1530789102', '20180705061', '10,11,09,02,06');
INSERT INTO ac_data_syxwgd VALUES ('2941', '1530789703', '20180705062', '05,07,10,03,08');
INSERT INTO ac_data_syxwgd VALUES ('2942', '1530790301', '20180705063', '10,02,11,06,03');
INSERT INTO ac_data_syxwgd VALUES ('2944', '1530790909', '20180705064', '08,04,07,03,11');
INSERT INTO ac_data_syxwgd VALUES ('2945', '1530791507', '20180705065', '10,01,07,06,04');
INSERT INTO ac_data_syxwgd VALUES ('2946', '1530792103', '20180705066', '10,08,09,07,03');
INSERT INTO ac_data_syxwgd VALUES ('2947', '1530792712', '20180705067', '01,03,05,10,08');
INSERT INTO ac_data_syxwgd VALUES ('2948', '1530793322', '20180705068', '11,09,03,06,08');
INSERT INTO ac_data_syxwgd VALUES ('2950', '1530793901', '20180705069', '09,01,10,07,11');
INSERT INTO ac_data_syxwgd VALUES ('2951', '1530794513', '20180705070', '08,01,02,10,07');
INSERT INTO ac_data_syxwgd VALUES ('2953', '1530795106', '20180705071', '04,06,10,09,02');
INSERT INTO ac_data_syxwgd VALUES ('2954', '1530795697', '20180705072', '08,02,04,03,10');
INSERT INTO ac_data_syxwgd VALUES ('2955', '1530796297', '20180705073', '02,10,06,11,07');
INSERT INTO ac_data_syxwgd VALUES ('2957', '1530796905', '20180705074', '01,06,03,10,05');
INSERT INTO ac_data_syxwgd VALUES ('2958', '1530797538', '20180705075', '10,06,11,08,01');
INSERT INTO ac_data_syxwgd VALUES ('2960', '1530798120', '20180705076', '05,04,01,09,10');
INSERT INTO ac_data_syxwgd VALUES ('2961', '1530798698', '20180705077', '07,05,03,01,09');
INSERT INTO ac_data_syxwgd VALUES ('2962', '1530799305', '20180705078', '08,10,11,05,09');
INSERT INTO ac_data_syxwgd VALUES ('2963', '1530799912', '20180705079', '01,07,11,03,06');
INSERT INTO ac_data_syxwgd VALUES ('2964', '1530800515', '20180705080', '02,05,06,11,10');
INSERT INTO ac_data_syxwgd VALUES ('2966', '1530801110', '20180705081', '01,07,05,04,08');
INSERT INTO ac_data_syxwgd VALUES ('2967', '1530801704', '20180705082', '07,10,03,05,01');
INSERT INTO ac_data_syxwgd VALUES ('2968', '1530802326', '20180705083', '09,05,08,10,06');
INSERT INTO ac_data_syxwgd VALUES ('2997', '1530802916', '20180705084', '06,09,01,07,10');
INSERT INTO ac_data_syxwgd VALUES ('3230', '1530839516', '20180706001', '10,07,05,09,04');
INSERT INTO ac_data_syxwgd VALUES ('3232', '1530840108', '20180706002', '06,10,01,05,08');
INSERT INTO ac_data_syxwgd VALUES ('3233', '1530840704', '20180706003', '11,09,02,07,10');
INSERT INTO ac_data_syxwgd VALUES ('3235', '1530841309', '20180706004', '06,02,11,04,07');
INSERT INTO ac_data_syxwgd VALUES ('3236', '1530841909', '20180706005', '05,01,11,04,02');
INSERT INTO ac_data_syxwgd VALUES ('3237', '1530842508', '20180706006', '06,01,09,03,02');
INSERT INTO ac_data_syxwgd VALUES ('3239', '1530843115', '20180706007', '05,10,01,03,09');
INSERT INTO ac_data_syxwgd VALUES ('3240', '1530843717', '20180706008', '04,03,09,05,10');
INSERT INTO ac_data_syxwgd VALUES ('3242', '1530844328', '20180706009', '07,05,10,01,09');
INSERT INTO ac_data_syxwgd VALUES ('3243', '1530844905', '20180706010', '03,11,08,01,09');
INSERT INTO ac_data_syxwgd VALUES ('3244', '1530845503', '20180706011', '04,07,10,03,01');
INSERT INTO ac_data_syxwgd VALUES ('3246', '1530846106', '20180706012', '01,05,08,04,03');
INSERT INTO ac_data_syxwgd VALUES ('3247', '1530846697', '20180706013', '08,09,04,02,05');
INSERT INTO ac_data_syxwgd VALUES ('3249', '1530847299', '20180706014', '05,01,03,04,10');
INSERT INTO ac_data_syxwgd VALUES ('3250', '1530847896', '20180706015', '08,06,09,10,02');
INSERT INTO ac_data_syxwgd VALUES ('3251', '1530848505', '20180706016', '03,05,09,07,08');
INSERT INTO ac_data_syxwgd VALUES ('3252', '1530849100', '20180706017', '08,03,02,05,07');
INSERT INTO ac_data_syxwgd VALUES ('3253', '1530849709', '20180706018', '11,07,09,01,10');
INSERT INTO ac_data_syxwgd VALUES ('3256', '1530850321', '20180706019', '07,08,01,05,02');
INSERT INTO ac_data_syxwgd VALUES ('3257', '1530850943', '20180706020', '03,02,07,05,10');
INSERT INTO ac_data_syxwgd VALUES ('3261', '1530851505', '20180706021', '04,07,05,11,01');
INSERT INTO ac_data_syxwgd VALUES ('3262', '1530852102', '20180706022', '11,02,03,08,06');
INSERT INTO ac_data_syxwgd VALUES ('3263', '1530852705', '20180706023', '09,11,10,05,03');
INSERT INTO ac_data_syxwgd VALUES ('3265', '1530853307', '20180706024', '02,08,06,09,10');
INSERT INTO ac_data_syxwgd VALUES ('3266', '1530853905', '20180706025', '06,01,08,03,05');
INSERT INTO ac_data_syxwgd VALUES ('3268', '1530854504', '20180706026', '09,10,02,05,11');
INSERT INTO ac_data_syxwgd VALUES ('3269', '1530855102', '20180706027', '04,03,01,08,07');
INSERT INTO ac_data_syxwgd VALUES ('3270', '1530855703', '20180706028', '10,07,03,08,06');
INSERT INTO ac_data_syxwgd VALUES ('3271', '1530856319', '20180706029', '04,01,05,08,07');
INSERT INTO ac_data_syxwgd VALUES ('3272', '1530856905', '20180706030', '01,08,06,04,02');
INSERT INTO ac_data_syxwgd VALUES ('3274', '1530857497', '20180706031', '10,05,09,01,08');
INSERT INTO ac_data_syxwgd VALUES ('3275', '1530858106', '20180706032', '11,08,07,10,05');
INSERT INTO ac_data_syxwgd VALUES ('3277', '1530858706', '20180706033', '04,03,02,09,08');
INSERT INTO ac_data_syxwgd VALUES ('3278', '1530859305', '20180706034', '03,11,08,09,01');
INSERT INTO ac_data_syxwgd VALUES ('3279', '1530859900', '20180706035', '05,08,10,03,02');
INSERT INTO ac_data_syxwgd VALUES ('3281', '1530860515', '20180706036', '02,09,01,07,05');
INSERT INTO ac_data_syxwgd VALUES ('3282', '1530861100', '20180706037', '07,10,09,06,05');
INSERT INTO ac_data_syxwgd VALUES ('3284', '1530861707', '20180706038', '05,03,11,04,09');
INSERT INTO ac_data_syxwgd VALUES ('3285', '1530862308', '20180706039', '05,08,10,03,02');
INSERT INTO ac_data_syxwgd VALUES ('3286', '1530862905', '20180706040', '02,08,07,03,01');
INSERT INTO ac_data_syxwgd VALUES ('3287', '1530863522', '20180706041', '04,01,08,06,11');
INSERT INTO ac_data_syxwgd VALUES ('3288', '1530864127', '20180706042', '04,05,03,07,09');
INSERT INTO ac_data_syxwgd VALUES ('3290', '1530864721', '20180706043', '04,02,03,10,01');
INSERT INTO ac_data_syxwgd VALUES ('3291', '1530865300', '20180706044', '03,08,10,02,11');
INSERT INTO ac_data_syxwgd VALUES ('3293', '1530865910', '20180706045', '09,10,05,07,06');
INSERT INTO ac_data_syxwgd VALUES ('3294', '1530866499', '20180706046', '06,05,02,01,03');
INSERT INTO ac_data_syxwgd VALUES ('3295', '1530867095', '20180706047', '08,03,10,02,01');
INSERT INTO ac_data_syxwgd VALUES ('3297', '1530867702', '20180706048', '09,03,11,07,02');
INSERT INTO ac_data_syxwgd VALUES ('3298', '1530868329', '20180706049', '10,02,11,07,04');
INSERT INTO ac_data_syxwgd VALUES ('3300', '1530868911', '20180706050', '10,08,03,01,06');
INSERT INTO ac_data_syxwgd VALUES ('3301', '1530869509', '20180706051', '04,03,01,10,07');
INSERT INTO ac_data_syxwgd VALUES ('3302', '1530870104', '20180706052', '01,09,08,07,05');
INSERT INTO ac_data_syxwgd VALUES ('3303', '1530870707', '20180706053', '10,11,09,02,08');
INSERT INTO ac_data_syxwgd VALUES ('3305', '1530871297', '20180706054', '09,06,05,10,07');
INSERT INTO ac_data_syxwgd VALUES ('3306', '1530871918', '20180706055', '05,03,02,04,11');
INSERT INTO ac_data_syxwgd VALUES ('3308', '1530872505', '20180706056', '08,09,06,02,07');
INSERT INTO ac_data_syxwgd VALUES ('3309', '1530873098', '20180706057', '08,09,11,04,07');
INSERT INTO ac_data_syxwgd VALUES ('3310', '1530873711', '20180706058', '03,06,08,11,05');
INSERT INTO ac_data_syxwgd VALUES ('3311', '1530874320', '20180706059', '08,02,09,10,07');
INSERT INTO ac_data_syxwgd VALUES ('3312', '1530874904', '20180706060', '06,09,10,07,04');
INSERT INTO ac_data_syxwgd VALUES ('3314', '1530875506', '20180706061', '11,03,09,02,04');
INSERT INTO ac_data_syxwgd VALUES ('3315', '1530876111', '20180706062', '07,11,05,03,06');
INSERT INTO ac_data_syxwgd VALUES ('3317', '1530876702', '20180706063', '10,11,08,02,01');
INSERT INTO ac_data_syxwgd VALUES ('3318', '1530877317', '20180706064', '11,04,07,09,08');
INSERT INTO ac_data_syxwgd VALUES ('3319', '1530877897', '20180706065', '04,06,09,03,02');
INSERT INTO ac_data_syxwgd VALUES ('3321', '1530878504', '20180706066', '03,06,02,09,04');
INSERT INTO ac_data_syxwgd VALUES ('3322', '1530879100', '20180706067', '08,07,05,01,10');
INSERT INTO ac_data_syxwgd VALUES ('3324', '1530879699', '20180706068', '06,04,01,03,02');
INSERT INTO ac_data_syxwgd VALUES ('3326', '1530880296', '20180706069', '09,07,05,02,04');
INSERT INTO ac_data_syxwgd VALUES ('3327', '1530880898', '20180706070', '11,10,08,01,04');
INSERT INTO ac_data_syxwgd VALUES ('3328', '1530881518', '20180706071', '11,05,01,07,09');
INSERT INTO ac_data_syxwgd VALUES ('3330', '1530882096', '20180706072', '10,11,01,08,04');
INSERT INTO ac_data_syxwgd VALUES ('3331', '1530882703', '20180706073', '09,06,08,07,01');
INSERT INTO ac_data_syxwgd VALUES ('3333', '1530883308', '20180706074', '09,05,02,10,08');
INSERT INTO ac_data_syxwgd VALUES ('3334', '1530883912', '20180706075', '05,09,02,03,11');
INSERT INTO ac_data_syxwgd VALUES ('3335', '1530884500', '20180706076', '03,06,07,11,08');
INSERT INTO ac_data_syxwgd VALUES ('3336', '1530885099', '20180706077', '08,02,06,07,04');
INSERT INTO ac_data_syxwgd VALUES ('3337', '1530885697', '20180706078', '10,11,04,02,05');
INSERT INTO ac_data_syxwgd VALUES ('3339', '1530886308', '20180706079', '01,03,09,08,11');
INSERT INTO ac_data_syxwgd VALUES ('3340', '1530886908', '20180706080', '03,06,02,10,11');
INSERT INTO ac_data_syxwgd VALUES ('3341', '1530887495', '20180706081', '09,07,06,04,10');
INSERT INTO ac_data_syxwgd VALUES ('3342', '1530888100', '20180706082', '04,06,08,05,10');
INSERT INTO ac_data_syxwgd VALUES ('3343', '1530888706', '20180706083', '08,05,02,06,01');
INSERT INTO ac_data_syxwgd VALUES ('3371', '1530889310', '20180706084', '03,10,09,02,01');
INSERT INTO ac_data_syxwgd VALUES ('3598', '1530925983', '20180707001', '09,02,03,10,06');
INSERT INTO ac_data_syxwgd VALUES ('3599', '1530926508', '20180707002', '04,02,10,06,09');
INSERT INTO ac_data_syxwgd VALUES ('3601', '1530927358', '20180707003', '05,06,02,04,01');
INSERT INTO ac_data_syxwgd VALUES ('3603', '1530927734', '20180707004', '02,03,10,07,11');
INSERT INTO ac_data_syxwgd VALUES ('3604', '1530928411', '20180707005', '07,02,05,01,10');
INSERT INTO ac_data_syxwgd VALUES ('3606', '1530928914', '20180707006', '06,11,09,03,08');
INSERT INTO ac_data_syxwgd VALUES ('3607', '1530929579', '20180707007', '01,02,08,09,11');
INSERT INTO ac_data_syxwgd VALUES ('3609', '1530930106', '20180707008', '04,08,01,07,09');
INSERT INTO ac_data_syxwgd VALUES ('3610', '1530930772', '20180707009', '04,10,09,05,02');
INSERT INTO ac_data_syxwgd VALUES ('3612', '1530931339', '20180707010', '10,11,02,05,06');
INSERT INTO ac_data_syxwgd VALUES ('3613', '1530931985', '20180707011', '10,09,08,06,01');
INSERT INTO ac_data_syxwgd VALUES ('3614', '1530932500', '20180707012', '03,07,08,04,10');
INSERT INTO ac_data_syxwgd VALUES ('3616', '1530933106', '20180707013', '02,05,10,01,07');
INSERT INTO ac_data_syxwgd VALUES ('3617', '1530933792', '20180707014', '10,08,07,11,01');
INSERT INTO ac_data_syxwgd VALUES ('3618', '1530934418', '20180707015', '02,03,05,10,11');
INSERT INTO ac_data_syxwgd VALUES ('3619', '1530934952', '20180707016', '10,07,06,05,11');
INSERT INTO ac_data_syxwgd VALUES ('3620', '1530935503', '20180707017', '06,01,03,08,10');
INSERT INTO ac_data_syxwgd VALUES ('3622', '1530936102', '20180707018', '11,05,03,01,06');
INSERT INTO ac_data_syxwgd VALUES ('3623', '1530936713', '20180707019', '10,07,04,02,11');
INSERT INTO ac_data_syxwgd VALUES ('3626', '1530937306', '20180707020', '10,05,04,06,03');
INSERT INTO ac_data_syxwgd VALUES ('3627', '1530937917', '20180707021', '07,05,02,06,08');
INSERT INTO ac_data_syxwgd VALUES ('3628', '1530939528', '20180707023', '01,08,11,04,06');
INSERT INTO ac_data_syxwgd VALUES ('3634', '1530939713', '20180707024', '05,06,03,08,02');
INSERT INTO ac_data_syxwgd VALUES ('3645', '1530940304', '20180707025', '04,02,10,09,05');
INSERT INTO ac_data_syxwgd VALUES ('3646', '1530940895', '20180707026', '09,11,04,10,02');
INSERT INTO ac_data_syxwgd VALUES ('3647', '1530942840', '20180707029', '04,10,01,06,09');
INSERT INTO ac_data_syxwgd VALUES ('3649', '1530943295', '20180707030', '06,01,07,02,11');
INSERT INTO ac_data_syxwgd VALUES ('3651', '1530943903', '20180707031', '10,05,03,06,02');
INSERT INTO ac_data_syxwgd VALUES ('3655', '1530944513', '20180707032', '05,01,10,09,06');
INSERT INTO ac_data_syxwgd VALUES ('3657', '1530945106', '20180707033', '03,06,01,11,05');
INSERT INTO ac_data_syxwgd VALUES ('3659', '1530945707', '20180707034', '09,10,05,03,08');
INSERT INTO ac_data_syxwgd VALUES ('3661', '1530946308', '20180707035', '02,01,05,11,09');
INSERT INTO ac_data_syxwgd VALUES ('3663', '1530946898', '20180707036', '05,07,09,06,08');
INSERT INTO ac_data_syxwgd VALUES ('3667', '1530947497', '20180707037', '08,02,04,05,06');
INSERT INTO ac_data_syxwgd VALUES ('3669', '1530948100', '20180707038', '05,09,06,04,03');
INSERT INTO ac_data_syxwgd VALUES ('3673', '1530948701', '20180707039', '11,03,02,08,01');
INSERT INTO ac_data_syxwgd VALUES ('3675', '1530949308', '20180707040', '03,08,01,09,06');
INSERT INTO ac_data_syxwgd VALUES ('3677', '1530949916', '20180707041', '05,11,07,03,02');
INSERT INTO ac_data_syxwgd VALUES ('3681', '1530950496', '20180707042', '04,09,07,02,06');
INSERT INTO ac_data_syxwgd VALUES ('3683', '1530951101', '20180707043', '07,08,05,11,02');
INSERT INTO ac_data_syxwgd VALUES ('3687', '1530951699', '20180707044', '01,11,07,03,04');
INSERT INTO ac_data_syxwgd VALUES ('3689', '1530952309', '20180707045', '03,09,08,01,10');
INSERT INTO ac_data_syxwgd VALUES ('3691', '1530952904', '20180707046', '06,03,09,11,02');
INSERT INTO ac_data_syxwgd VALUES ('3695', '1530953497', '20180707047', '07,10,04,09,06');
INSERT INTO ac_data_syxwgd VALUES ('3697', '1530954352', '20180707048', '10,03,09,07,02');
INSERT INTO ac_data_syxwgd VALUES ('3699', '1530954696', '20180707049', '11,08,03,09,05');
INSERT INTO ac_data_syxwgd VALUES ('3701', '1530955306', '20180707050', '01,02,06,11,07');
INSERT INTO ac_data_syxwgd VALUES ('3703', '1530955895', '20180707051', '03,09,01,06,02');
INSERT INTO ac_data_syxwgd VALUES ('3705', '1530956505', '20180707052', '07,05,04,10,01');
INSERT INTO ac_data_syxwgd VALUES ('3707', '1530957095', '20180707053', '02,10,08,04,01');
INSERT INTO ac_data_syxwgd VALUES ('3711', '1530957707', '20180707054', '10,07,04,05,06');
INSERT INTO ac_data_syxwgd VALUES ('3713', '1530958294', '20180707055', '05,08,03,09,11');
INSERT INTO ac_data_syxwgd VALUES ('3717', '1530958897', '20180707056', '02,03,06,11,04');
INSERT INTO ac_data_syxwgd VALUES ('3719', '1530959497', '20180707057', '05,09,11,04,07');
INSERT INTO ac_data_syxwgd VALUES ('3721', '1530960105', '20180707058', '09,11,08,05,07');
INSERT INTO ac_data_syxwgd VALUES ('3725', '1530960704', '20180707059', '08,04,06,05,09');
INSERT INTO ac_data_syxwgd VALUES ('3727', '1530961306', '20180707060', '07,01,03,05,04');
INSERT INTO ac_data_syxwgd VALUES ('3731', '1530961907', '20180707061', '09,07,05,02,03');
INSERT INTO ac_data_syxwgd VALUES ('3733', '1530962507', '20180707062', '07,04,03,01,08');
INSERT INTO ac_data_syxwgd VALUES ('3735', '1530963093', '20180707063', '07,08,05,03,01');
INSERT INTO ac_data_syxwgd VALUES ('3737', '1530963705', '20180707064', '04,06,11,09,01');
INSERT INTO ac_data_syxwgd VALUES ('3739', '1530964314', '20180707065', '11,10,05,03,06');
INSERT INTO ac_data_syxwgd VALUES ('3743', '1530964902', '20180707066', '06,02,08,05,11');
INSERT INTO ac_data_syxwgd VALUES ('3745', '1530965498', '20180707067', '01,10,06,03,11');
INSERT INTO ac_data_syxwgd VALUES ('3749', '1530966102', '20180707068', '05,03,09,11,10');
INSERT INTO ac_data_syxwgd VALUES ('3751', '1530966701', '20180707069', '04,01,02,08,06');
INSERT INTO ac_data_syxwgd VALUES ('3753', '1530967309', '20180707070', '03,11,08,09,10');
INSERT INTO ac_data_syxwgd VALUES ('3757', '1530967902', '20180707071', '04,10,05,06,09');
INSERT INTO ac_data_syxwgd VALUES ('3759', '1530968508', '20180707072', '07,08,04,09,06');
INSERT INTO ac_data_syxwgd VALUES ('3763', '1530969104', '20180707073', '07,06,02,05,04');
INSERT INTO ac_data_syxwgd VALUES ('3765', '1530969707', '20180707074', '11,09,03,06,04');
INSERT INTO ac_data_syxwgd VALUES ('3767', '1530970307', '20180707075', '01,11,08,07,03');
INSERT INTO ac_data_syxwgd VALUES ('3769', '1530970903', '20180707076', '07,03,10,05,08');
INSERT INTO ac_data_syxwgd VALUES ('3771', '1530971514', '20180707077', '10,11,05,08,06');
INSERT INTO ac_data_syxwgd VALUES ('3775', '1530972102', '20180707078', '09,10,11,05,01');
INSERT INTO ac_data_syxwgd VALUES ('3777', '1530972706', '20180707079', '01,10,07,03,06');
INSERT INTO ac_data_syxwgd VALUES ('3781', '1530973325', '20180707080', '04,02,09,03,06');
INSERT INTO ac_data_syxwgd VALUES ('3783', '1530973903', '20180707081', '09,01,05,08,06');
INSERT INTO ac_data_syxwgd VALUES ('3785', '1530974508', '20180707082', '05,09,08,04,11');
INSERT INTO ac_data_syxwgd VALUES ('3789', '1530975102', '20180707083', '08,02,01,05,09');
INSERT INTO ac_data_syxwgd VALUES ('3834', '1530975703', '20180707084', '08,10,09,03,06');
INSERT INTO ac_data_syxwgd VALUES ('4204', '1531012309', '20180708001', '01,08,04,11,09');
INSERT INTO ac_data_syxwgd VALUES ('4206', '1531012901', '20180708002', '08,01,05,06,11');
INSERT INTO ac_data_syxwgd VALUES ('4210', '1531013506', '20180708003', '06,07,08,11,09');
INSERT INTO ac_data_syxwgd VALUES ('4212', '1531014109', '20180708004', '01,11,06,03,07');
INSERT INTO ac_data_syxwgd VALUES ('4216', '1531014710', '20180708005', '05,10,07,08,01');
INSERT INTO ac_data_syxwgd VALUES ('4218', '1531015323', '20180708006', '07,04,02,11,08');
INSERT INTO ac_data_syxwgd VALUES ('4220', '1531015902', '20180708007', '01,03,07,06,05');
INSERT INTO ac_data_syxwgd VALUES ('4223', '1531016548', '20180708008', '08,04,06,11,03');
INSERT INTO ac_data_syxwgd VALUES ('4227', '1531017106', '20180708009', '08,04,10,05,02');
INSERT INTO ac_data_syxwgd VALUES ('4231', '1531017728', '20180708010', '10,03,06,07,08');
INSERT INTO ac_data_syxwgd VALUES ('4233', '1531018303', '20180708011', '06,07,05,09,02');
INSERT INTO ac_data_syxwgd VALUES ('4236', '1531018902', '20180708012', '04,08,11,06,01');
INSERT INTO ac_data_syxwgd VALUES ('4238', '1531019507', '20180708013', '10,03,05,02,09');
INSERT INTO ac_data_syxwgd VALUES ('4240', '1531020104', '20180708014', '11,07,02,08,06');
INSERT INTO ac_data_syxwgd VALUES ('4244', '1531020703', '20180708015', '11,05,02,01,10');
INSERT INTO ac_data_syxwgd VALUES ('4246', '1531021308', '20180708016', '05,08,04,01,07');
INSERT INTO ac_data_syxwgd VALUES ('4250', '1531021912', '20180708017', '08,03,10,01,05');
INSERT INTO ac_data_syxwgd VALUES ('4252', '1531022503', '20180708018', '08,06,10,07,02');
INSERT INTO ac_data_syxwgd VALUES ('4254', '1531023108', '20180708019', '08,07,03,10,06');
INSERT INTO ac_data_syxwgd VALUES ('4257', '1531023707', '20180708020', '01,05,11,03,10');
INSERT INTO ac_data_syxwgd VALUES ('4259', '1531024302', '20180708021', '06,09,04,01,08');
INSERT INTO ac_data_syxwgd VALUES ('4263', '1531024908', '20180708022', '07,10,11,05,03');
INSERT INTO ac_data_syxwgd VALUES ('4265', '1531025509', '20180708023', '11,02,03,10,07');
INSERT INTO ac_data_syxwgd VALUES ('4267', '1531026110', '20180708024', '06,05,01,10,08');
INSERT INTO ac_data_syxwgd VALUES ('4269', '1531026703', '20180708025', '05,01,06,03,09');
INSERT INTO ac_data_syxwgd VALUES ('4271', '1531027323', '20180708026', '09,07,03,02,08');
INSERT INTO ac_data_syxwgd VALUES ('4275', '1531027904', '20180708027', '05,02,08,07,03');
INSERT INTO ac_data_syxwgd VALUES ('4277', '1531028504', '20180708028', '05,07,08,01,11');
INSERT INTO ac_data_syxwgd VALUES ('4281', '1531029110', '20180708029', '04,03,06,01,11');
INSERT INTO ac_data_syxwgd VALUES ('4283', '1531029705', '20180708030', '05,04,11,09,08');
INSERT INTO ac_data_syxwgd VALUES ('4285', '1531030324', '20180708031', '10,11,07,02,05');
INSERT INTO ac_data_syxwgd VALUES ('4288', '1531030897', '20180708032', '02,01,03,09,11');
INSERT INTO ac_data_syxwgd VALUES ('4290', '1531031526', '20180708033', '03,07,11,09,04');
INSERT INTO ac_data_syxwgd VALUES ('4294', '1531032107', '20180708034', '06,10,11,02,09');
INSERT INTO ac_data_syxwgd VALUES ('4296', '1531032714', '20180708035', '04,06,03,07,10');
INSERT INTO ac_data_syxwgd VALUES ('4298', '1531033330', '20180708036', '04,02,10,07,11');
INSERT INTO ac_data_syxwgd VALUES ('4300', '1531033909', '20180708037', '04,01,11,02,03');
INSERT INTO ac_data_syxwgd VALUES ('4302', '1531034506', '20180708038', '04,02,07,06,08');
INSERT INTO ac_data_syxwgd VALUES ('4306', '1531035108', '20180708039', '03,10,05,01,04');
INSERT INTO ac_data_syxwgd VALUES ('4308', '1531035724', '20180708040', '05,06,02,09,11');
INSERT INTO ac_data_syxwgd VALUES ('4312', '1531036309', '20180708041', '09,02,01,11,07');
INSERT INTO ac_data_syxwgd VALUES ('4314', '1531036924', '20180708042', '06,11,08,05,01');
INSERT INTO ac_data_syxwgd VALUES ('4316', '1531037525', '20180708043', '10,05,01,11,07');
INSERT INTO ac_data_syxwgd VALUES ('4320', '1531038106', '20180708044', '10,11,01,09,03');
INSERT INTO ac_data_syxwgd VALUES ('4322', '1531038702', '20180708045', '04,06,05,03,10');
INSERT INTO ac_data_syxwgd VALUES ('4326', '1531039313', '20180708046', '03,01,02,05,09');
INSERT INTO ac_data_syxwgd VALUES ('4328', '1531039896', '20180708047', '08,04,02,10,07');
INSERT INTO ac_data_syxwgd VALUES ('4330', '1531040501', '20180708048', '11,06,04,07,01');
INSERT INTO ac_data_syxwgd VALUES ('4332', '1531041095', '20180708049', '06,03,11,04,07');
INSERT INTO ac_data_syxwgd VALUES ('4334', '1531041723', '20180708050', '09,11,07,06,01');
INSERT INTO ac_data_syxwgd VALUES ('4338', '1531042307', '20180708051', '09,10,01,04,06');
INSERT INTO ac_data_syxwgd VALUES ('4340', '1531042902', '20180708052', '09,10,04,03,07');
INSERT INTO ac_data_syxwgd VALUES ('4343', '1531043502', '20180708053', '07,05,01,06,03');
INSERT INTO ac_data_syxwgd VALUES ('4345', '1531044105', '20180708054', '08,01,07,06,03');
INSERT INTO ac_data_syxwgd VALUES ('4347', '1531044726', '20180708055', '01,02,08,11,03');
INSERT INTO ac_data_syxwgd VALUES ('4351', '1531045304', '20180708056', '11,07,01,04,03');
INSERT INTO ac_data_syxwgd VALUES ('4353', '1531045923', '20180708057', '01,05,09,07,10');
INSERT INTO ac_data_syxwgd VALUES ('4357', '1531046500', '20180708058', '04,06,10,11,05');
INSERT INTO ac_data_syxwgd VALUES ('4359', '1531047104', '20180708059', '07,11,05,03,09');
INSERT INTO ac_data_syxwgd VALUES ('4361', '1531047696', '20180708060', '08,07,11,06,04');
INSERT INTO ac_data_syxwgd VALUES ('4364', '1531048323', '20180708061', '09,11,03,08,06');
INSERT INTO ac_data_syxwgd VALUES ('4366', '1531048923', '20180708062', '04,07,05,03,10');
INSERT INTO ac_data_syxwgd VALUES ('4370', '1531049503', '20180708063', '10,04,02,06,05');
INSERT INTO ac_data_syxwgd VALUES ('4372', '1531050105', '20180708064', '06,03,07,08,02');
INSERT INTO ac_data_syxwgd VALUES ('4375', '1531050720', '20180708065', '03,06,02,05,11');
INSERT INTO ac_data_syxwgd VALUES ('4377', '1531051298', '20180708066', '03,05,01,09,07');
INSERT INTO ac_data_syxwgd VALUES ('4379', '1531051901', '20180708067', '01,11,03,04,06');
INSERT INTO ac_data_syxwgd VALUES ('4383', '1531052508', '20180708068', '10,08,11,07,04');
INSERT INTO ac_data_syxwgd VALUES ('4385', '1531053111', '20180708069', '11,10,05,07,02');
INSERT INTO ac_data_syxwgd VALUES ('4389', '1531053713', '20180708070', '08,05,02,10,07');
INSERT INTO ac_data_syxwgd VALUES ('4391', '1531054305', '20180708071', '10,11,09,03,04');
INSERT INTO ac_data_syxwgd VALUES ('4393', '1531054906', '20180708072', '11,02,03,07,10');
INSERT INTO ac_data_syxwgd VALUES ('4396', '1531055520', '20180708073', '03,11,09,06,04');
INSERT INTO ac_data_syxwgd VALUES ('4398', '1531056094', '20180708074', '04,03,08,02,11');
INSERT INTO ac_data_syxwgd VALUES ('4402', '1531056702', '20180708075', '05,03,01,04,08');
INSERT INTO ac_data_syxwgd VALUES ('4404', '1531057292', '20180708076', '05,09,11,03,10');
INSERT INTO ac_data_syxwgd VALUES ('4407', '1531057915', '20180708077', '11,09,06,07,02');
INSERT INTO ac_data_syxwgd VALUES ('4409', '1531058515', '20180708078', '05,11,03,02,01');
INSERT INTO ac_data_syxwgd VALUES ('4411', '1531059112', '20180708079', '03,08,01,04,02');
INSERT INTO ac_data_syxwgd VALUES ('4415', '1531059707', '20180708080', '04,08,06,10,09');
INSERT INTO ac_data_syxwgd VALUES ('4417', '1531060298', '20180708081', '06,09,04,05,02');
INSERT INTO ac_data_syxwgd VALUES ('4421', '1531060905', '20180708082', '04,07,05,03,02');
INSERT INTO ac_data_syxwgd VALUES ('4423', '1531061503', '20180708083', '09,03,05,11,06');
INSERT INTO ac_data_syxwgd VALUES ('4441', '1531062099', '20180708084', '05,09,04,02,03');
INSERT INTO ac_data_syxwgd VALUES ('4891', '1531098706', '20180709001', '06,03,02,04,08');
INSERT INTO ac_data_syxwgd VALUES ('4893', '1531099315', '20180709002', '05,04,02,07,10');
INSERT INTO ac_data_syxwgd VALUES ('4897', '1531099893', '20180709003', '05,11,01,03,02');
INSERT INTO ac_data_syxwgd VALUES ('4899', '1531100518', '20180709004', '11,10,04,06,05');
INSERT INTO ac_data_syxwgd VALUES ('4901', '1531101111', '20180709005', '02,11,09,07,01');
INSERT INTO ac_data_syxwgd VALUES ('4903', '1531101707', '20180709006', '10,01,02,09,11');
INSERT INTO ac_data_syxwgd VALUES ('4905', '1531102300', '20180709007', '04,11,09,01,03');
INSERT INTO ac_data_syxwgd VALUES ('4909', '1531102898', '20180709008', '02,04,06,05,03');
INSERT INTO ac_data_syxwgd VALUES ('4911', '1531103502', '20180709009', '01,11,03,08,10');
INSERT INTO ac_data_syxwgd VALUES ('4913', '1531104105', '20180709010', '10,06,02,11,01');
INSERT INTO ac_data_syxwgd VALUES ('4917', '1531104705', '20180709011', '03,01,09,07,06');
INSERT INTO ac_data_syxwgd VALUES ('4920', '1531105305', '20180709012', '09,04,02,10,03');
INSERT INTO ac_data_syxwgd VALUES ('4924', '1531105895', '20180709013', '09,10,02,11,07');
INSERT INTO ac_data_syxwgd VALUES ('4928', '1531106496', '20180709014', '11,07,04,02,09');
INSERT INTO ac_data_syxwgd VALUES ('4930', '1531107096', '20180709015', '06,09,05,02,10');
INSERT INTO ac_data_syxwgd VALUES ('4934', '1531107696', '20180709016', '06,11,01,09,05');
INSERT INTO ac_data_syxwgd VALUES ('4936', '1531108328', '20180709017', '11,04,01,03,07');
INSERT INTO ac_data_syxwgd VALUES ('4938', '1531108894', '20180709018', '08,09,02,01,10');
INSERT INTO ac_data_syxwgd VALUES ('4940', '1531109500', '20180709019', '03,10,01,02,08');
INSERT INTO ac_data_syxwgd VALUES ('4942', '1531110095', '20180709020', '01,11,09,03,02');
INSERT INTO ac_data_syxwgd VALUES ('4946', '1531110709', '20180709021', '10,06,02,03,08');
INSERT INTO ac_data_syxwgd VALUES ('4948', '1531111301', '20180709022', '01,10,07,06,08');
INSERT INTO ac_data_syxwgd VALUES ('4952', '1531111894', '20180709023', '07,03,04,02,08');
INSERT INTO ac_data_syxwgd VALUES ('4954', '1531112507', '20180709024', '06,08,11,07,10');
INSERT INTO ac_data_syxwgd VALUES ('4956', '1531113102', '20180709025', '06,01,03,09,04');
INSERT INTO ac_data_syxwgd VALUES ('4960', '1531113712', '20180709026', '04,08,01,09,05');
INSERT INTO ac_data_syxwgd VALUES ('4962', '1531114308', '20180709027', '04,09,03,07,06');
INSERT INTO ac_data_syxwgd VALUES ('4966', '1531114906', '20180709028', '02,08,09,01,10');
INSERT INTO ac_data_syxwgd VALUES ('4968', '1531115504', '20180709029', '05,11,09,02,03');
INSERT INTO ac_data_syxwgd VALUES ('4970', '1531116112', '20180709030', '04,07,02,03,01');
INSERT INTO ac_data_syxwgd VALUES ('4972', '1531116699', '20180709031', '01,03,06,05,08');
INSERT INTO ac_data_syxwgd VALUES ('4974', '1531117302', '20180709032', '02,01,07,04,06');
INSERT INTO ac_data_syxwgd VALUES ('4978', '1531117893', '20180709033', '03,04,01,06,08');
INSERT INTO ac_data_syxwgd VALUES ('4980', '1531118499', '20180709034', '03,07,06,11,02');
INSERT INTO ac_data_syxwgd VALUES ('4984', '1531119096', '20180709035', '01,02,09,07,05');
INSERT INTO ac_data_syxwgd VALUES ('4986', '1531119707', '20180709036', '08,01,02,04,03');
INSERT INTO ac_data_syxwgd VALUES ('4988', '1531120306', '20180709037', '02,07,10,03,06');
INSERT INTO ac_data_syxwgd VALUES ('4992', '1531120906', '20180709038', '11,01,04,06,08');
INSERT INTO ac_data_syxwgd VALUES ('4994', '1531121516', '20180709039', '03,08,07,02,04');
INSERT INTO ac_data_syxwgd VALUES ('4998', '1531122108', '20180709040', '05,04,10,02,07');
INSERT INTO ac_data_syxwgd VALUES ('5000', '1531122696', '20180709041', '11,04,08,05,09');
INSERT INTO ac_data_syxwgd VALUES ('5002', '1531123308', '20180709042', '06,11,02,07,03');
INSERT INTO ac_data_syxwgd VALUES ('5005', '1531123911', '20180709043', '07,05,04,09,02');
INSERT INTO ac_data_syxwgd VALUES ('5007', '1531124505', '20180709044', '01,10,05,11,08');
INSERT INTO ac_data_syxwgd VALUES ('5011', '1531125096', '20180709045', '07,05,02,09,11');
INSERT INTO ac_data_syxwgd VALUES ('5013', '1531125709', '20180709046', '06,10,11,07,05');
INSERT INTO ac_data_syxwgd VALUES ('5016', '1531126307', '20180709047', '01,05,06,08,09');
INSERT INTO ac_data_syxwgd VALUES ('5017', '1531126904', '20180709048', '03,04,08,07,10');
INSERT INTO ac_data_syxwgd VALUES ('5019', '1531127504', '20180709049', '05,04,11,03,06');
INSERT INTO ac_data_syxwgd VALUES ('5023', '1531128095', '20180709050', '06,03,08,04,11');
INSERT INTO ac_data_syxwgd VALUES ('5025', '1531128703', '20180709051', '11,01,02,10,08');
INSERT INTO ac_data_syxwgd VALUES ('5029', '1531129301', '20180709052', '03,05,02,08,09');
INSERT INTO ac_data_syxwgd VALUES ('5031', '1531129921', '20180709053', '05,04,06,01,09');
INSERT INTO ac_data_syxwgd VALUES ('5033', '1531130503', '20180709054', '05,07,10,03,11');
INSERT INTO ac_data_syxwgd VALUES ('5037', '1531131112', '20180709055', '09,01,06,11,10');
INSERT INTO ac_data_syxwgd VALUES ('5039', '1531131703', '20180709056', '03,05,06,07,04');
INSERT INTO ac_data_syxwgd VALUES ('5043', '1531132295', '20180709057', '11,06,05,04,02');
INSERT INTO ac_data_syxwgd VALUES ('5045', '1531132913', '20180709058', '01,07,11,04,06');
INSERT INTO ac_data_syxwgd VALUES ('5047', '1531133512', '20180709059', '08,11,10,07,06');
INSERT INTO ac_data_syxwgd VALUES ('5049', '1531134105', '20180709060', '09,07,10,08,04');
INSERT INTO ac_data_syxwgd VALUES ('5051', '1531134702', '20180709061', '06,02,04,09,08');
INSERT INTO ac_data_syxwgd VALUES ('5055', '1531135301', '20180709062', '07,11,04,01,09');
INSERT INTO ac_data_syxwgd VALUES ('5057', '1531135904', '20180709063', '06,10,03,01,05');
INSERT INTO ac_data_syxwgd VALUES ('5061', '1531136501', '20180709064', '03,08,07,11,09');
INSERT INTO ac_data_syxwgd VALUES ('5063', '1531137104', '20180709065', '06,05,09,08,01');
INSERT INTO ac_data_syxwgd VALUES ('5065', '1531137709', '20180709066', '02,06,05,11,07');
INSERT INTO ac_data_syxwgd VALUES ('5069', '1531138293', '20180709067', '03,06,02,08,11');
INSERT INTO ac_data_syxwgd VALUES ('5071', '1531138902', '20180709068', '07,10,01,06,02');
INSERT INTO ac_data_syxwgd VALUES ('5075', '1531139506', '20180709069', '01,05,08,10,06');
INSERT INTO ac_data_syxwgd VALUES ('5077', '1531140100', '20180709070', '04,07,06,09,10');
INSERT INTO ac_data_syxwgd VALUES ('5079', '1531140707', '20180709071', '11,05,06,09,03');
INSERT INTO ac_data_syxwgd VALUES ('5081', '1531141302', '20180709072', '04,02,05,06,09');
INSERT INTO ac_data_syxwgd VALUES ('5083', '1531141899', '20180709073', '07,08,02,10,11');
INSERT INTO ac_data_syxwgd VALUES ('5087', '1531142505', '20180709074', '05,11,10,06,03');
INSERT INTO ac_data_syxwgd VALUES ('5089', '1531143096', '20180709075', '07,03,06,01,10');
INSERT INTO ac_data_syxwgd VALUES ('5093', '1531143710', '20180709076', '03,11,01,07,10');
INSERT INTO ac_data_syxwgd VALUES ('5095', '1531144301', '20180709077', '11,02,09,01,06');
INSERT INTO ac_data_syxwgd VALUES ('5097', '1531144897', '20180709078', '03,08,11,01,05');
INSERT INTO ac_data_syxwgd VALUES ('5101', '1531145493', '20180709079', '10,08,06,09,11');
INSERT INTO ac_data_syxwgd VALUES ('5103', '1531146114', '20180709080', '09,10,06,07,05');
INSERT INTO ac_data_syxwgd VALUES ('5107', '1531146696', '20180709081', '06,11,07,08,01');
INSERT INTO ac_data_syxwgd VALUES ('5109', '1531147309', '20180709082', '03,09,10,11,01');
INSERT INTO ac_data_syxwgd VALUES ('5111', '1531147904', '20180709083', '11,08,05,10,03');
INSERT INTO ac_data_syxwgd VALUES ('5170', '1531148501', '20180709084', '09,04,07,10,01');
INSERT INTO ac_data_syxwgd VALUES ('5623', '1531185106', '20180710001', '05,11,06,07,01');
INSERT INTO ac_data_syxwgd VALUES ('5627', '1531185702', '20180710002', '10,08,11,04,01');
INSERT INTO ac_data_syxwgd VALUES ('5629', '1531186304', '20180710003', '06,02,08,03,04');
INSERT INTO ac_data_syxwgd VALUES ('5631', '1531186909', '20180710004', '03,02,05,09,01');
INSERT INTO ac_data_syxwgd VALUES ('5633', '1531187507', '20180710005', '11,03,01,05,07');
INSERT INTO ac_data_syxwgd VALUES ('5635', '1531188102', '20180710006', '05,08,07,04,01');
INSERT INTO ac_data_syxwgd VALUES ('5639', '1531188706', '20180710007', '07,06,08,10,04');
INSERT INTO ac_data_syxwgd VALUES ('5641', '1531189310', '20180710008', '01,04,10,09,05');
INSERT INTO ac_data_syxwgd VALUES ('5645', '1531189893', '20180710009', '08,06,10,02,05');
INSERT INTO ac_data_syxwgd VALUES ('5647', '1531190505', '20180710010', '06,08,01,05,09');
INSERT INTO ac_data_syxwgd VALUES ('5649', '1531191102', '20180710011', '09,06,04,07,05');
INSERT INTO ac_data_syxwgd VALUES ('5653', '1531191706', '20180710012', '04,02,01,09,06');
INSERT INTO ac_data_syxwgd VALUES ('5655', '1531192298', '20180710013', '07,11,09,04,03');
INSERT INTO ac_data_syxwgd VALUES ('5659', '1531192919', '20180710014', '10,07,05,04,01');
INSERT INTO ac_data_syxwgd VALUES ('5661', '1531193508', '20180710015', '04,07,03,05,01');
INSERT INTO ac_data_syxwgd VALUES ('5663', '1531194106', '20180710016', '02,07,01,10,11');
INSERT INTO ac_data_syxwgd VALUES ('5665', '1531194716', '20180710017', '05,09,07,10,06');
INSERT INTO ac_data_syxwgd VALUES ('5667', '1531195310', '20180710018', '07,04,05,08,01');
INSERT INTO ac_data_syxwgd VALUES ('5671', '1531195904', '20180710019', '02,03,09,10,08');
INSERT INTO ac_data_syxwgd VALUES ('5673', '1531196534', '20180710020', '05,08,07,09,10');
INSERT INTO ac_data_syxwgd VALUES ('5677', '1531197098', '20180710021', '01,04,02,10,07');
INSERT INTO ac_data_syxwgd VALUES ('5679', '1531197705', '20180710022', '04,08,09,03,11');
INSERT INTO ac_data_syxwgd VALUES ('5681', '1531198299', '20180710023', '02,10,11,06,07');
INSERT INTO ac_data_syxwgd VALUES ('5685', '1531198907', '20180710024', '07,04,09,06,02');
INSERT INTO ac_data_syxwgd VALUES ('5687', '1531199506', '20180710025', '03,02,11,05,06');
INSERT INTO ac_data_syxwgd VALUES ('5691', '1531200106', '20180710026', '11,02,08,06,01');
INSERT INTO ac_data_syxwgd VALUES ('5693', '1531200721', '20180710027', '02,07,03,09,01');
INSERT INTO ac_data_syxwgd VALUES ('5695', '1531201317', '20180710028', '10,05,06,01,04');
INSERT INTO ac_data_syxwgd VALUES ('5697', '1531201904', '20180710029', '06,02,03,08,04');
INSERT INTO ac_data_syxwgd VALUES ('5699', '1531202494', '20180710030', '08,02,10,04,05');
INSERT INTO ac_data_syxwgd VALUES ('5703', '1531203109', '20180710031', '04,06,10,02,01');
INSERT INTO ac_data_syxwgd VALUES ('5705', '1531203707', '20180710032', '01,05,10,08,07');
INSERT INTO ac_data_syxwgd VALUES ('5709', '1531204294', '20180710033', '09,07,02,01,10');
INSERT INTO ac_data_syxwgd VALUES ('5711', '1531204905', '20180710034', '10,08,07,09,04');
INSERT INTO ac_data_syxwgd VALUES ('5713', '1531205502', '20180710035', '03,11,09,10,04');
INSERT INTO ac_data_syxwgd VALUES ('5717', '1531206098', '20180710036', '04,01,03,02,11');
INSERT INTO ac_data_syxwgd VALUES ('5719', '1531206706', '20180710037', '07,04,01,08,11');
INSERT INTO ac_data_syxwgd VALUES ('5723', '1531207295', '20180710038', '04,10,06,03,05');
INSERT INTO ac_data_syxwgd VALUES ('5725', '1531207903', '20180710039', '11,06,10,07,03');
INSERT INTO ac_data_syxwgd VALUES ('5727', '1531208503', '20180710040', '01,02,09,06,05');
INSERT INTO ac_data_syxwgd VALUES ('5730', '1531209102', '20180710041', '04,05,07,09,02');
INSERT INTO ac_data_syxwgd VALUES ('5732', '1531209703', '20180710042', '08,03,02,05,04');
INSERT INTO ac_data_syxwgd VALUES ('5736', '1531210307', '20180710043', '04,02,01,09,08');
INSERT INTO ac_data_syxwgd VALUES ('5738', '1531210903', '20180710044', '03,11,04,09,05');
INSERT INTO ac_data_syxwgd VALUES ('5740', '1531211509', '20180710045', '09,01,03,10,11');
INSERT INTO ac_data_syxwgd VALUES ('5742', '1531212100', '20180710046', '08,05,11,09,02');
INSERT INTO ac_data_syxwgd VALUES ('5744', '1531212697', '20180710047', '06,11,03,10,04');
INSERT INTO ac_data_syxwgd VALUES ('5748', '1531213306', '20180710048', '05,08,02,03,11');
INSERT INTO ac_data_syxwgd VALUES ('5750', '1531213908', '20180710049', '08,11,02,09,10');
INSERT INTO ac_data_syxwgd VALUES ('5754', '1531214506', '20180710050', '10,06,09,05,08');
INSERT INTO ac_data_syxwgd VALUES ('5756', '1531215110', '20180710051', '09,11,01,05,08');
INSERT INTO ac_data_syxwgd VALUES ('5758', '1531215697', '20180710052', '02,11,05,03,09');
INSERT INTO ac_data_syxwgd VALUES ('5762', '1531216308', '20180710053', '11,03,08,10,06');
INSERT INTO ac_data_syxwgd VALUES ('5764', '1531216901', '20180710054', '11,01,07,03,02');
INSERT INTO ac_data_syxwgd VALUES ('5768', '1531217497', '20180710055', '03,08,02,09,11');
INSERT INTO ac_data_syxwgd VALUES ('5770', '1531218095', '20180710056', '11,03,10,07,01');
INSERT INTO ac_data_syxwgd VALUES ('5772', '1531218706', '20180710057', '01,04,03,11,05');
INSERT INTO ac_data_syxwgd VALUES ('5774', '1531219300', '20180710058', '11,07,04,06,10');
INSERT INTO ac_data_syxwgd VALUES ('5776', '1531219900', '20180710059', '09,01,04,08,06');
INSERT INTO ac_data_syxwgd VALUES ('5780', '1531220506', '20180710060', '04,06,08,05,01');
INSERT INTO ac_data_syxwgd VALUES ('5782', '1531221113', '20180710061', '09,08,07,11,04');
INSERT INTO ac_data_syxwgd VALUES ('5786', '1531221697', '20180710062', '02,06,08,04,01');
INSERT INTO ac_data_syxwgd VALUES ('5788', '1531222301', '20180710063', '01,11,10,04,09');
INSERT INTO ac_data_syxwgd VALUES ('5790', '1531222915', '20180710064', '02,01,11,07,06');
INSERT INTO ac_data_syxwgd VALUES ('5794', '1531223503', '20180710065', '08,03,05,02,10');
INSERT INTO ac_data_syxwgd VALUES ('5796', '1531224100', '20180710066', '03,08,04,10,11');
INSERT INTO ac_data_syxwgd VALUES ('5800', '1531224698', '20180710067', '09,03,08,02,01');
INSERT INTO ac_data_syxwgd VALUES ('5802', '1531225308', '20180710068', '11,08,03,10,07');
INSERT INTO ac_data_syxwgd VALUES ('5804', '1531225903', '20180710069', '05,04,02,01,07');
INSERT INTO ac_data_syxwgd VALUES ('5806', '1531226507', '20180710070', '04,05,09,08,03');
INSERT INTO ac_data_syxwgd VALUES ('5808', '1531227099', '20180710071', '09,05,11,04,01');
INSERT INTO ac_data_syxwgd VALUES ('5812', '1531227695', '20180710072', '10,04,06,07,01');
INSERT INTO ac_data_syxwgd VALUES ('5814', '1531228306', '20180710073', '10,07,08,03,01');
INSERT INTO ac_data_syxwgd VALUES ('5818', '1531228901', '20180710074', '06,11,05,08,10');
INSERT INTO ac_data_syxwgd VALUES ('5820', '1531229498', '20180710075', '08,03,10,01,06');
INSERT INTO ac_data_syxwgd VALUES ('5822', '1531230107', '20180710076', '07,11,06,05,04');
INSERT INTO ac_data_syxwgd VALUES ('5826', '1531230701', '20180710077', '05,07,09,03,02');
INSERT INTO ac_data_syxwgd VALUES ('5828', '1531231304', '20180710078', '04,05,11,03,02');
INSERT INTO ac_data_syxwgd VALUES ('5832', '1531231914', '20180710079', '06,11,05,09,03');
INSERT INTO ac_data_syxwgd VALUES ('5834', '1531232496', '20180710080', '10,05,07,11,04');
INSERT INTO ac_data_syxwgd VALUES ('5836', '1531233094', '20180710081', '02,11,07,04,08');
INSERT INTO ac_data_syxwgd VALUES ('5838', '1531233707', '20180710082', '09,04,05,08,06');
INSERT INTO ac_data_syxwgd VALUES ('5840', '1531234304', '20180710083', '09,03,11,08,10');
INSERT INTO ac_data_syxwgd VALUES ('5898', '1531234896', '20180710084', '07,06,03,10,01');
INSERT INTO ac_data_syxwgd VALUES ('6354', '1531271514', '20180711001', '09,05,03,10,07');
INSERT INTO ac_data_syxwgd VALUES ('6356', '1531272098', '20180711002', '05,07,10,03,08');
INSERT INTO ac_data_syxwgd VALUES ('6358', '1531272707', '20180711003', '08,06,04,10,01');
INSERT INTO ac_data_syxwgd VALUES ('6360', '1531273302', '20180711004', '02,10,03,06,01');
INSERT INTO ac_data_syxwgd VALUES ('6364', '1531273905', '20180711005', '05,08,04,03,07');
INSERT INTO ac_data_syxwgd VALUES ('6366', '1531274513', '20180711006', '07,05,04,11,08');
INSERT INTO ac_data_syxwgd VALUES ('6370', '1531275096', '20180711007', '08,05,02,01,11');
INSERT INTO ac_data_syxwgd VALUES ('6372', '1531275706', '20180711008', '01,11,05,04,06');
INSERT INTO ac_data_syxwgd VALUES ('6374', '1531276305', '20180711009', '01,03,06,10,04');
INSERT INTO ac_data_syxwgd VALUES ('6378', '1531276902', '20180711010', '11,03,09,02,06');
INSERT INTO ac_data_syxwgd VALUES ('6380', '1531277507', '20180711011', '03,10,07,05,09');
INSERT INTO ac_data_syxwgd VALUES ('6384', '1531278100', '20180711012', '02,11,03,10,08');
INSERT INTO ac_data_syxwgd VALUES ('6386', '1531278702', '20180711013', '07,08,01,04,10');
INSERT INTO ac_data_syxwgd VALUES ('6388', '1531279308', '20180711014', '04,05,01,03,06');
INSERT INTO ac_data_syxwgd VALUES ('6390', '1531279909', '20180711015', '09,05,08,06,01');
INSERT INTO ac_data_syxwgd VALUES ('6392', '1531280517', '20180711016', '08,01,09,04,07');
INSERT INTO ac_data_syxwgd VALUES ('6396', '1531281094', '20180711017', '11,08,09,01,03');
INSERT INTO ac_data_syxwgd VALUES ('6398', '1531281696', '20180711018', '01,10,08,03,05');
INSERT INTO ac_data_syxwgd VALUES ('6402', '1531282311', '20180711019', '03,11,04,01,10');
INSERT INTO ac_data_syxwgd VALUES ('6404', '1531282898', '20180711020', '09,01,11,10,05');
INSERT INTO ac_data_syxwgd VALUES ('6406', '1531283502', '20180711021', '03,05,02,09,11');
INSERT INTO ac_data_syxwgd VALUES ('6410', '1531284115', '20180711022', '10,05,03,09,06');
INSERT INTO ac_data_syxwgd VALUES ('6412', '1531284706', '20180711023', '02,11,01,07,10');
INSERT INTO ac_data_syxwgd VALUES ('6416', '1531285304', '20180711024', '11,05,02,04,03');
INSERT INTO ac_data_syxwgd VALUES ('6418', '1531285908', '20180711025', '03,10,09,02,05');
INSERT INTO ac_data_syxwgd VALUES ('6420', '1531286503', '20180711026', '04,05,06,11,10');
INSERT INTO ac_data_syxwgd VALUES ('6422', '1531287107', '20180711027', '07,06,11,01,08');
INSERT INTO ac_data_syxwgd VALUES ('6424', '1531287700', '20180711028', '11,04,01,08,05');
INSERT INTO ac_data_syxwgd VALUES ('6428', '1531288309', '20180711029', '01,09,08,04,02');
INSERT INTO ac_data_syxwgd VALUES ('6430', '1531288903', '20180711030', '02,01,08,06,03');
INSERT INTO ac_data_syxwgd VALUES ('6434', '1531289505', '20180711031', '09,04,06,01,11');
INSERT INTO ac_data_syxwgd VALUES ('6436', '1531290106', '20180711032', '04,07,02,11,09');
INSERT INTO ac_data_syxwgd VALUES ('6438', '1531290703', '20180711033', '06,10,05,07,03');
INSERT INTO ac_data_syxwgd VALUES ('6442', '1531291308', '20180711034', '05,11,01,09,03');
INSERT INTO ac_data_syxwgd VALUES ('6444', '1531291905', '20180711035', '03,01,02,08,06');
INSERT INTO ac_data_syxwgd VALUES ('6448', '1531292502', '20180711036', '07,11,06,09,10');
INSERT INTO ac_data_syxwgd VALUES ('6450', '1531293108', '20180711037', '10,08,04,01,05');
INSERT INTO ac_data_syxwgd VALUES ('6452', '1531293702', '20180711038', '05,02,07,06,10');
INSERT INTO ac_data_syxwgd VALUES ('6456', '1531294294', '20180711039', '03,01,11,04,10');
INSERT INTO ac_data_syxwgd VALUES ('6458', '1531294900', '20180711040', '04,02,11,08,07');
INSERT INTO ac_data_syxwgd VALUES ('6462', '1531295509', '20180711041', '08,10,01,05,11');
INSERT INTO ac_data_syxwgd VALUES ('6464', '1531296117', '20180711042', '11,05,10,03,07');
INSERT INTO ac_data_syxwgd VALUES ('6466', '1531296694', '20180711043', '09,02,04,07,10');
INSERT INTO ac_data_syxwgd VALUES ('6468', '1531297309', '20180711044', '03,04,01,09,07');
INSERT INTO ac_data_syxwgd VALUES ('6470', '1531297897', '20180711045', '01,02,11,04,07');
INSERT INTO ac_data_syxwgd VALUES ('6474', '1531298504', '20180711046', '04,08,11,06,10');
INSERT INTO ac_data_syxwgd VALUES ('6476', '1531299102', '20180711047', '01,07,08,03,10');
INSERT INTO ac_data_syxwgd VALUES ('6480', '1531299707', '20180711048', '08,11,05,10,02');
INSERT INTO ac_data_syxwgd VALUES ('6482', '1531300295', '20180711049', '04,06,05,07,01');
INSERT INTO ac_data_syxwgd VALUES ('6484', '1531300916', '20180711050', '01,04,09,05,02');
INSERT INTO ac_data_syxwgd VALUES ('6488', '1531301518', '20180711051', '03,08,04,01,06');
INSERT INTO ac_data_syxwgd VALUES ('6490', '1531302100', '20180711052', '06,09,03,02,05');
INSERT INTO ac_data_syxwgd VALUES ('6494', '1531302697', '20180711053', '11,06,10,01,09');
INSERT INTO ac_data_syxwgd VALUES ('6496', '1531303303', '20180711054', '05,10,07,03,02');
INSERT INTO ac_data_syxwgd VALUES ('6498', '1531303920', '20180711055', '02,07,04,01,09');
INSERT INTO ac_data_syxwgd VALUES ('6500', '1531304532', '20180711056', '09,05,11,02,01');
INSERT INTO ac_data_syxwgd VALUES ('6502', '1531305095', '20180711057', '11,05,04,06,01');
INSERT INTO ac_data_syxwgd VALUES ('6506', '1531305713', '20180711058', '06,03,04,05,07');
INSERT INTO ac_data_syxwgd VALUES ('6508', '1531306312', '20180711059', '05,06,01,02,08');
INSERT INTO ac_data_syxwgd VALUES ('6512', '1531306900', '20180711060', '01,11,04,10,06');
INSERT INTO ac_data_syxwgd VALUES ('6514', '1531307524', '20180711061', '11,02,08,04,01');
INSERT INTO ac_data_syxwgd VALUES ('6516', '1531308111', '20180711062', '05,09,03,08,10');
INSERT INTO ac_data_syxwgd VALUES ('6520', '1531308729', '20180711063', '05,07,01,09,08');
INSERT INTO ac_data_syxwgd VALUES ('6522', '1531309304', '20180711064', '09,07,03,08,05');
INSERT INTO ac_data_syxwgd VALUES ('6526', '1531309915', '20180711065', '05,10,02,08,03');
INSERT INTO ac_data_syxwgd VALUES ('6528', '1531310508', '20180711066', '08,06,05,09,10');
INSERT INTO ac_data_syxwgd VALUES ('6530', '1531311094', '20180711067', '03,05,09,06,02');
INSERT INTO ac_data_syxwgd VALUES ('6532', '1531311699', '20180711068', '02,09,06,10,08');
INSERT INTO ac_data_syxwgd VALUES ('6534', '1531312311', '20180711069', '07,09,11,04,08');
INSERT INTO ac_data_syxwgd VALUES ('6538', '1531312898', '20180711070', '01,05,06,10,04');
INSERT INTO ac_data_syxwgd VALUES ('6540', '1531313496', '20180711071', '04,07,08,01,09');
INSERT INTO ac_data_syxwgd VALUES ('6544', '1531314099', '20180711072', '08,05,02,11,01');
INSERT INTO ac_data_syxwgd VALUES ('6546', '1531314705', '20180711073', '02,09,11,06,01');
INSERT INTO ac_data_syxwgd VALUES ('6548', '1531315302', '20180711074', '08,10,11,06,05');
INSERT INTO ac_data_syxwgd VALUES ('6552', '1531315898', '20180711075', '07,02,01,05,08');
INSERT INTO ac_data_syxwgd VALUES ('6554', '1531316506', '20180711076', '10,03,09,11,04');
INSERT INTO ac_data_syxwgd VALUES ('6558', '1531317099', '20180711077', '02,10,03,04,01');
INSERT INTO ac_data_syxwgd VALUES ('6560', '1531317707', '20180711078', '01,08,06,11,03');
INSERT INTO ac_data_syxwgd VALUES ('6562', '1531318311', '20180711079', '08,07,10,05,04');
INSERT INTO ac_data_syxwgd VALUES ('6564', '1531318897', '20180711080', '09,06,08,03,02');
INSERT INTO ac_data_syxwgd VALUES ('6566', '1531319506', '20180711081', '05,02,04,01,07');
INSERT INTO ac_data_syxwgd VALUES ('6570', '1531320098', '20180711082', '09,10,03,02,07');
INSERT INTO ac_data_syxwgd VALUES ('6572', '1531320702', '20180711083', '04,01,08,11,10');
INSERT INTO ac_data_syxwgd VALUES ('6632', '1531321308', '20180711084', '03,11,05,02,01');
INSERT INTO ac_data_syxwgd VALUES ('6679', '1531357904', '20180712001', '01,07,06,11,05');
INSERT INTO ac_data_syxwgd VALUES ('6681', '1531358517', '20180712002', '06,05,07,02,03');
INSERT INTO ac_data_syxwgd VALUES ('6685', '1531359106', '20180712003', '03,06,04,05,11');
INSERT INTO ac_data_syxwgd VALUES ('6687', '1531359697', '20180712004', '01,02,06,03,05');
INSERT INTO ac_data_syxwgd VALUES ('6691', '1531360298', '20180712005', '09,01,11,07,08');
INSERT INTO ac_data_syxwgd VALUES ('6693', '1531360898', '20180712006', '03,04,07,09,02');
INSERT INTO ac_data_syxwgd VALUES ('6695', '1531361509', '20180712007', '04,02,06,09,08');
INSERT INTO ac_data_syxwgd VALUES ('6699', '1531362109', '20180712008', '02,09,01,11,03');
INSERT INTO ac_data_syxwgd VALUES ('6701', '1531362698', '20180712009', '08,10,09,11,07');
INSERT INTO ac_data_syxwgd VALUES ('6705', '1531363300', '20180712010', '04,11,10,02,05');
INSERT INTO ac_data_syxwgd VALUES ('6707', '1531363909', '20180712011', '04,11,09,05,02');
INSERT INTO ac_data_syxwgd VALUES ('6709', '1531364510', '20180712012', '08,03,05,07,09');
INSERT INTO ac_data_syxwgd VALUES ('6711', '1531365097', '20180712013', '05,08,11,02,10');
INSERT INTO ac_data_syxwgd VALUES ('6713', '1531365696', '20180712014', '08,06,07,11,03');
INSERT INTO ac_data_syxwgd VALUES ('6717', '1531366298', '20180712015', '07,05,10,09,02');
INSERT INTO ac_data_syxwgd VALUES ('6719', '1531366902', '20180712016', '11,02,09,06,05');
INSERT INTO ac_data_syxwgd VALUES ('6723', '1531367499', '20180712017', '07,06,04,01,02');
INSERT INTO ac_data_syxwgd VALUES ('6725', '1531368097', '20180712018', '10,08,01,11,03');
INSERT INTO ac_data_syxwgd VALUES ('6727', '1531368697', '20180712019', '11,04,05,06,02');
INSERT INTO ac_data_syxwgd VALUES ('6731', '1531369305', '20180712020', '02,11,06,10,03');
INSERT INTO ac_data_syxwgd VALUES ('6733', '1531369903', '20180712021', '03,04,05,11,10');
INSERT INTO ac_data_syxwgd VALUES ('6737', '1531370501', '20180712022', '04,11,08,07,03');
INSERT INTO ac_data_syxwgd VALUES ('6739', '1531371095', '20180712023', '06,08,01,04,11');
INSERT INTO ac_data_syxwgd VALUES ('6741', '1531371702', '20180712024', '04,11,09,05,02');
INSERT INTO ac_data_syxwgd VALUES ('6743', '1531372306', '20180712025', '02,06,04,05,01');
INSERT INTO ac_data_syxwgd VALUES ('6745', '1531372914', '20180712026', '06,10,11,05,04');
INSERT INTO ac_data_syxwgd VALUES ('6749', '1531373504', '20180712027', '03,02,06,11,10');
INSERT INTO ac_data_syxwgd VALUES ('6751', '1531374098', '20180712028', '02,04,05,01,11');
INSERT INTO ac_data_syxwgd VALUES ('6755', '1531374699', '20180712029', '01,03,04,05,07');
INSERT INTO ac_data_syxwgd VALUES ('6757', '1531375317', '20180712030', '05,07,10,09,03');
INSERT INTO ac_data_syxwgd VALUES ('6759', '1531375908', '20180712031', '01,05,08,02,11');
INSERT INTO ac_data_syxwgd VALUES ('6763', '1531376501', '20180712032', '10,07,03,09,01');
INSERT INTO ac_data_syxwgd VALUES ('6765', '1531377109', '20180712033', '09,10,06,03,11');
INSERT INTO ac_data_syxwgd VALUES ('6769', '1531377702', '20180712034', '01,03,04,11,05');
INSERT INTO ac_data_syxwgd VALUES ('6771', '1531378295', '20180712035', '11,08,07,04,03');
INSERT INTO ac_data_syxwgd VALUES ('6773', '1531378915', '20180712036', '08,03,04,10,11');
INSERT INTO ac_data_syxwgd VALUES ('6775', '1531379507', '20180712037', '11,10,05,09,08');
INSERT INTO ac_data_syxwgd VALUES ('6777', '1531380099', '20180712038', '06,08,03,09,02');
INSERT INTO ac_data_syxwgd VALUES ('6781', '1531380700', '20180712039', '08,05,07,09,01');
INSERT INTO ac_data_syxwgd VALUES ('6783', '1531381307', '20180712040', '11,01,03,08,04');
INSERT INTO ac_data_syxwgd VALUES ('6786', '1531381901', '20180712041', '02,06,11,01,03');
INSERT INTO ac_data_syxwgd VALUES ('6788', '1531382497', '20180712042', '09,06,08,03,01');
INSERT INTO ac_data_syxwgd VALUES ('6790', '1531383094', '20180712043', '11,02,07,03,05');
INSERT INTO ac_data_syxwgd VALUES ('6794', '1531383705', '20180712044', '07,03,11,06,04');
INSERT INTO ac_data_syxwgd VALUES ('6796', '1531384309', '20180712045', '05,10,04,06,08');
INSERT INTO ac_data_syxwgd VALUES ('6800', '1531384908', '20180712046', '02,09,05,01,11');
INSERT INTO ac_data_syxwgd VALUES ('6802', '1531385505', '20180712047', '01,11,05,10,06');
INSERT INTO ac_data_syxwgd VALUES ('6804', '1531386094', '20180712048', '04,03,05,08,07');
INSERT INTO ac_data_syxwgd VALUES ('6806', '1531386701', '20180712049', '10,04,03,08,07');
INSERT INTO ac_data_syxwgd VALUES ('6808', '1531387307', '20180712050', '04,09,10,02,06');
INSERT INTO ac_data_syxwgd VALUES ('6812', '1531387897', '20180712051', '03,06,05,09,08');
INSERT INTO ac_data_syxwgd VALUES ('6814', '1531388515', '20180712052', '03,11,01,09,10');
INSERT INTO ac_data_syxwgd VALUES ('6818', '1531389099', '20180712053', '06,01,11,03,04');
INSERT INTO ac_data_syxwgd VALUES ('6820', '1531389698', '20180712054', '06,10,08,09,05');
INSERT INTO ac_data_syxwgd VALUES ('6822', '1531390311', '20180712055', '03,04,08,10,11');
INSERT INTO ac_data_syxwgd VALUES ('6826', '1531390906', '20180712056', '10,06,04,11,01');
INSERT INTO ac_data_syxwgd VALUES ('6828', '1531391499', '20180712057', '07,01,03,08,06');
INSERT INTO ac_data_syxwgd VALUES ('6832', '1531392096', '20180712058', '07,06,08,09,11');
INSERT INTO ac_data_syxwgd VALUES ('6834', '1531392712', '20180712059', '02,07,04,08,06');
INSERT INTO ac_data_syxwgd VALUES ('6836', '1531393307', '20180712060', '04,06,09,02,08');
INSERT INTO ac_data_syxwgd VALUES ('6838', '1531393915', '20180712061', '08,05,03,07,01');
INSERT INTO ac_data_syxwgd VALUES ('6840', '1531394506', '20180712062', '08,10,07,03,04');
INSERT INTO ac_data_syxwgd VALUES ('6844', '1531395096', '20180712063', '05,01,03,09,10');
INSERT INTO ac_data_syxwgd VALUES ('6846', '1531395699', '20180712064', '08,02,10,11,07');
INSERT INTO ac_data_syxwgd VALUES ('6849', '1531396298', '20180712065', '04,02,10,01,09');
INSERT INTO ac_data_syxwgd VALUES ('6851', '1531396896', '20180712066', '10,01,03,11,08');
INSERT INTO ac_data_syxwgd VALUES ('6853', '1531397499', '20180712067', '01,02,06,09,05');
INSERT INTO ac_data_syxwgd VALUES ('6857', '1531398112', '20180712068', '10,01,08,07,04');
INSERT INTO ac_data_syxwgd VALUES ('6859', '1531398710', '20180712069', '05,02,03,01,09');
INSERT INTO ac_data_syxwgd VALUES ('6863', '1531399296', '20180712070', '01,11,05,08,09');
INSERT INTO ac_data_syxwgd VALUES ('6865', '1531399905', '20180712071', '06,03,08,09,11');
INSERT INTO ac_data_syxwgd VALUES ('6867', '1531400496', '20180712072', '10,04,09,05,06');
INSERT INTO ac_data_syxwgd VALUES ('6871', '1531401099', '20180712073', '02,03,05,10,01');
INSERT INTO ac_data_syxwgd VALUES ('6873', '1531401708', '20180712074', '07,01,09,11,02');
INSERT INTO ac_data_syxwgd VALUES ('6877', '1531402318', '20180712075', '02,11,06,07,08');
INSERT INTO ac_data_syxwgd VALUES ('6879', '1531402901', '20180712076', '08,11,02,07,03');
INSERT INTO ac_data_syxwgd VALUES ('6881', '1531403507', '20180712077', '11,03,06,07,01');
INSERT INTO ac_data_syxwgd VALUES ('6883', '1531404104', '20180712078', '10,07,04,02,11');
INSERT INTO ac_data_syxwgd VALUES ('6885', '1531404696', '20180712079', '10,07,09,02,03');
INSERT INTO ac_data_syxwgd VALUES ('6889', '1531405298', '20180712080', '09,01,04,11,05');
INSERT INTO ac_data_syxwgd VALUES ('6891', '1531405897', '20180712081', '09,02,05,06,03');
INSERT INTO ac_data_syxwgd VALUES ('6895', '1531406510', '20180712082', '05,09,11,07,10');
INSERT INTO ac_data_syxwgd VALUES ('6897', '1531407115', '20180712083', '11,06,10,02,05');
INSERT INTO ac_data_syxwgd VALUES ('6954', '1531407706', '20180712084', '06,08,07,11,04');
INSERT INTO ac_data_syxwgd VALUES ('7417', '1531444307', '20180713001', '07,05,10,09,03');
INSERT INTO ac_data_syxwgd VALUES ('7419', '1531444900', '20180713002', '05,10,02,08,06');
INSERT INTO ac_data_syxwgd VALUES ('7423', '1531445502', '20180713003', '08,10,11,06,01');
INSERT INTO ac_data_syxwgd VALUES ('7425', '1531446106', '20180713004', '07,06,04,09,03');
INSERT INTO ac_data_syxwgd VALUES ('7427', '1531446696', '20180713005', '06,01,11,09,04');
INSERT INTO ac_data_syxwgd VALUES ('7431', '1531447305', '20180713006', '07,05,10,04,06');
INSERT INTO ac_data_syxwgd VALUES ('7433', '1531447900', '20180713007', '03,10,01,06,11');
INSERT INTO ac_data_syxwgd VALUES ('7437', '1531448497', '20180713008', '02,06,07,10,09');
INSERT INTO ac_data_syxwgd VALUES ('7439', '1531449098', '20180713009', '08,10,09,03,11');
INSERT INTO ac_data_syxwgd VALUES ('7441', '1531449705', '20180713010', '10,03,06,04,09');
INSERT INTO ac_data_syxwgd VALUES ('7443', '1531450316', '20180713011', '02,09,07,11,10');
INSERT INTO ac_data_syxwgd VALUES ('7445', '1531451087', '20180713012', '01,10,11,07,03');
INSERT INTO ac_data_syxwgd VALUES ('7447', '1531451501', '20180713013', '09,08,10,05,03');
INSERT INTO ac_data_syxwgd VALUES ('7449', '1531452101', '20180713014', '08,03,07,09,02');
INSERT INTO ac_data_syxwgd VALUES ('7453', '1531452700', '20180713015', '06,02,09,11,04');
INSERT INTO ac_data_syxwgd VALUES ('7455', '1531453301', '20180713016', '06,07,08,10,09');
INSERT INTO ac_data_syxwgd VALUES ('7457', '1531453910', '20180713017', '07,11,02,08,10');
INSERT INTO ac_data_syxwgd VALUES ('7461', '1531454500', '20180713018', '09,03,02,08,10');
INSERT INTO ac_data_syxwgd VALUES ('7463', '1531455096', '20180713019', '07,05,11,02,06');
INSERT INTO ac_data_syxwgd VALUES ('7467', '1531455705', '20180713020', '03,01,04,08,09');
INSERT INTO ac_data_syxwgd VALUES ('7469', '1531456314', '20180713021', '10,06,08,01,11');
INSERT INTO ac_data_syxwgd VALUES ('7471', '1531456898', '20180713022', '10,09,01,11,03');
INSERT INTO ac_data_syxwgd VALUES ('7473', '1531457508', '20180713023', '09,05,08,07,11');
INSERT INTO ac_data_syxwgd VALUES ('7475', '1531458099', '20180713024', '05,02,10,08,09');
INSERT INTO ac_data_syxwgd VALUES ('7479', '1531458703', '20180713025', '09,02,03,08,11');
INSERT INTO ac_data_syxwgd VALUES ('7481', '1531459300', '20180713026', '10,03,06,01,04');
INSERT INTO ac_data_syxwgd VALUES ('7485', '1531459905', '20180713027', '03,04,11,07,08');
INSERT INTO ac_data_syxwgd VALUES ('7487', '1531460505', '20180713028', '08,06,09,05,03');
INSERT INTO ac_data_syxwgd VALUES ('7489', '1531461105', '20180713029', '07,10,11,04,09');
INSERT INTO ac_data_syxwgd VALUES ('7493', '1531461707', '20180713030', '11,04,03,08,02');
INSERT INTO ac_data_syxwgd VALUES ('7495', '1531462300', '20180713031', '07,06,10,04,01');
INSERT INTO ac_data_syxwgd VALUES ('7499', '1531462918', '20180713032', '04,07,11,09,03');
INSERT INTO ac_data_syxwgd VALUES ('7501', '1531463506', '20180713033', '06,08,04,11,03');
INSERT INTO ac_data_syxwgd VALUES ('7503', '1531464098', '20180713034', '01,10,02,06,09');
INSERT INTO ac_data_syxwgd VALUES ('7505', '1531464705', '20180713035', '06,05,03,02,10');
INSERT INTO ac_data_syxwgd VALUES ('7507', '1531465310', '20180713036', '02,01,10,03,06');
INSERT INTO ac_data_syxwgd VALUES ('7511', '1531465907', '20180713037', '02,06,04,05,01');
INSERT INTO ac_data_syxwgd VALUES ('7513', '1531466501', '20180713038', '10,07,06,09,04');
INSERT INTO ac_data_syxwgd VALUES ('7517', '1531467094', '20180713039', '02,01,07,08,03');
INSERT INTO ac_data_syxwgd VALUES ('7519', '1531467708', '20180713040', '11,04,09,08,05');
INSERT INTO ac_data_syxwgd VALUES ('7521', '1531468298', '20180713041', '07,11,06,10,05');
INSERT INTO ac_data_syxwgd VALUES ('7525', '1531468902', '20180713042', '11,07,04,01,10');
INSERT INTO ac_data_syxwgd VALUES ('7527', '1531469495', '20180713043', '11,05,01,07,06');
INSERT INTO ac_data_syxwgd VALUES ('7531', '1531470121', '20180713044', '07,10,08,05,06');
INSERT INTO ac_data_syxwgd VALUES ('7533', '1531470715', '20180713045', '01,09,03,07,11');
INSERT INTO ac_data_syxwgd VALUES ('7535', '1531471296', '20180713046', '03,01,07,06,05');
INSERT INTO ac_data_syxwgd VALUES ('7537', '1531471905', '20180713047', '09,10,04,08,05');
INSERT INTO ac_data_syxwgd VALUES ('7539', '1531472497', '20180713048', '06,05,07,08,01');
INSERT INTO ac_data_syxwgd VALUES ('7543', '1531473104', '20180713049', '02,10,09,04,05');
INSERT INTO ac_data_syxwgd VALUES ('7545', '1531473697', '20180713050', '03,05,07,11,01');
INSERT INTO ac_data_syxwgd VALUES ('7549', '1531474310', '20180713051', '04,08,11,06,03');
INSERT INTO ac_data_syxwgd VALUES ('7551', '1531474901', '20180713052', '09,03,08,11,01');
INSERT INTO ac_data_syxwgd VALUES ('7553', '1531475502', '20180713053', '06,07,05,10,11');
INSERT INTO ac_data_syxwgd VALUES ('7558', '1531476100', '20180713054', '07,10,08,01,11');
INSERT INTO ac_data_syxwgd VALUES ('7559', '1531476702', '20180713055', '11,09,05,07,10');
INSERT INTO ac_data_syxwgd VALUES ('7563', '1531477297', '20180713056', '05,03,09,01,02');
INSERT INTO ac_data_syxwgd VALUES ('7565', '1531477914', '20180713057', '07,08,03,04,11');
INSERT INTO ac_data_syxwgd VALUES ('7567', '1531478505', '20180713058', '03,05,07,11,04');
INSERT INTO ac_data_syxwgd VALUES ('7569', '1531479096', '20180713059', '05,11,08,09,07');
INSERT INTO ac_data_syxwgd VALUES ('7571', '1531479718', '20180713060', '10,06,04,03,01');
INSERT INTO ac_data_syxwgd VALUES ('7575', '1531480305', '20180713061', '09,11,01,04,06');
INSERT INTO ac_data_syxwgd VALUES ('7577', '1531480903', '20180713062', '01,07,11,06,02');
INSERT INTO ac_data_syxwgd VALUES ('7581', '1531481495', '20180713063', '10,05,09,06,07');
INSERT INTO ac_data_syxwgd VALUES ('7583', '1531482094', '20180713064', '01,02,03,08,07');
INSERT INTO ac_data_syxwgd VALUES ('7585', '1531482700', '20180713065', '04,03,01,05,09');
INSERT INTO ac_data_syxwgd VALUES ('7589', '1531483295', '20180713066', '06,10,05,11,07');
INSERT INTO ac_data_syxwgd VALUES ('7591', '1531483900', '20180713067', '04,08,10,09,03');
INSERT INTO ac_data_syxwgd VALUES ('7595', '1531484495', '20180713068', '01,02,07,09,11');
INSERT INTO ac_data_syxwgd VALUES ('7597', '1531485106', '20180713069', '06,09,03,08,01');
INSERT INTO ac_data_syxwgd VALUES ('7599', '1531485699', '20180713070', '02,07,04,10,11');
INSERT INTO ac_data_syxwgd VALUES ('7601', '1531486310', '20180713071', '07,01,02,11,05');
INSERT INTO ac_data_syxwgd VALUES ('7603', '1531486898', '20180713072', '05,07,09,11,06');
INSERT INTO ac_data_syxwgd VALUES ('7607', '1531487504', '20180713073', '01,05,11,07,04');
INSERT INTO ac_data_syxwgd VALUES ('7609', '1531488106', '20180713074', '06,01,09,05,02');
INSERT INTO ac_data_syxwgd VALUES ('7613', '1531488705', '20180713075', '02,11,01,03,10');
INSERT INTO ac_data_syxwgd VALUES ('7615', '1531489299', '20180713076', '05,11,09,06,04');
INSERT INTO ac_data_syxwgd VALUES ('7617', '1531489905', '20180713077', '06,11,07,05,01');
INSERT INTO ac_data_syxwgd VALUES ('7621', '1531490499', '20180713078', '05,03,01,08,10');
INSERT INTO ac_data_syxwgd VALUES ('7623', '1531491094', '20180713079', '04,05,02,07,09');
INSERT INTO ac_data_syxwgd VALUES ('7627', '1531491699', '20180713080', '07,06,01,05,02');
INSERT INTO ac_data_syxwgd VALUES ('7629', '1531492295', '20180713081', '08,07,03,02,11');
INSERT INTO ac_data_syxwgd VALUES ('7631', '1531492896', '20180713082', '07,04,02,06,10');
INSERT INTO ac_data_syxwgd VALUES ('7633', '1531493495', '20180713083', '09,05,01,03,02');
INSERT INTO ac_data_syxwgd VALUES ('7694', '1531494108', '20180713084', '05,11,02,07,08');
INSERT INTO ac_data_syxwgd VALUES ('8165', '1531530714', '20180714001', '07,10,04,02,06');
INSERT INTO ac_data_syxwgd VALUES ('8167', '1531531298', '20180714002', '01,06,09,02,08');
INSERT INTO ac_data_syxwgd VALUES ('8169', '1531531895', '20180714003', '01,06,09,07,10');
INSERT INTO ac_data_syxwgd VALUES ('8171', '1531532501', '20180714004', '01,10,07,02,06');
INSERT INTO ac_data_syxwgd VALUES ('8173', '1531533095', '20180714005', '01,11,02,05,06');
INSERT INTO ac_data_syxwgd VALUES ('8177', '1531533701', '20180714006', '09,02,07,04,08');
INSERT INTO ac_data_syxwgd VALUES ('8179', '1531534311', '20180714007', '06,04,01,10,08');
INSERT INTO ac_data_syxwgd VALUES ('8183', '1531534910', '20180714008', '05,01,10,08,02');
INSERT INTO ac_data_syxwgd VALUES ('8185', '1531535504', '20180714009', '03,01,02,10,04');
INSERT INTO ac_data_syxwgd VALUES ('8187', '1531536107', '20180714010', '03,06,01,11,09');
INSERT INTO ac_data_syxwgd VALUES ('8191', '1531536710', '20180714011', '08,01,04,02,07');
INSERT INTO ac_data_syxwgd VALUES ('8193', '1531537309', '20180714012', '01,06,03,05,10');
INSERT INTO ac_data_syxwgd VALUES ('8197', '1531537905', '20180714013', '07,05,02,11,08');
INSERT INTO ac_data_syxwgd VALUES ('8199', '1531538509', '20180714014', '02,01,03,05,09');
INSERT INTO ac_data_syxwgd VALUES ('8201', '1531539099', '20180714015', '01,10,06,04,11');
INSERT INTO ac_data_syxwgd VALUES ('8203', '1531539705', '20180714016', '11,07,09,08,01');
INSERT INTO ac_data_syxwgd VALUES ('8205', '1531540299', '20180714017', '05,11,09,03,04');
INSERT INTO ac_data_syxwgd VALUES ('8209', '1531540898', '20180714018', '03,08,11,02,07');
INSERT INTO ac_data_syxwgd VALUES ('8211', '1531541504', '20180714019', '01,02,09,11,10');
INSERT INTO ac_data_syxwgd VALUES ('8215', '1531542106', '20180714020', '04,08,02,11,03');
INSERT INTO ac_data_syxwgd VALUES ('8217', '1531542698', '20180714021', '10,08,06,07,03');
INSERT INTO ac_data_syxwgd VALUES ('8219', '1531543295', '20180714022', '10,09,11,02,07');
INSERT INTO ac_data_syxwgd VALUES ('8223', '1531543903', '20180714023', '07,11,10,01,09');
INSERT INTO ac_data_syxwgd VALUES ('8225', '1531544497', '20180714024', '10,03,02,07,06');
INSERT INTO ac_data_syxwgd VALUES ('8229', '1531545136', '20180714025', '07,04,06,10,03');
INSERT INTO ac_data_syxwgd VALUES ('8232', '1531545696', '20180714026', '04,06,10,07,09');
INSERT INTO ac_data_syxwgd VALUES ('8234', '1531546296', '20180714027', '07,05,06,11,04');
INSERT INTO ac_data_syxwgd VALUES ('8237', '1531546913', '20180714028', '10,08,03,01,06');
INSERT INTO ac_data_syxwgd VALUES ('8239', '1531547502', '20180714029', '01,03,06,11,02');
INSERT INTO ac_data_syxwgd VALUES ('8243', '1531548101', '20180714030', '11,07,10,06,02');
INSERT INTO ac_data_syxwgd VALUES ('8245', '1531548712', '20180714031', '01,11,02,05,06');
INSERT INTO ac_data_syxwgd VALUES ('8247', '1531549316', '20180714032', '08,05,03,07,01');
INSERT INTO ac_data_syxwgd VALUES ('8249', '1531549893', '20180714033', '04,02,05,08,06');
INSERT INTO ac_data_syxwgd VALUES ('8251', '1531550515', '20180714034', '02,09,08,07,10');
INSERT INTO ac_data_syxwgd VALUES ('8255', '1531551108', '20180714035', '08,01,04,10,02');
INSERT INTO ac_data_syxwgd VALUES ('8257', '1531551698', '20180714036', '01,08,06,04,10');
INSERT INTO ac_data_syxwgd VALUES ('8261', '1531552303', '20180714037', '09,03,04,08,01');
INSERT INTO ac_data_syxwgd VALUES ('8263', '1531552917', '20180714038', '04,07,03,01,11');
INSERT INTO ac_data_syxwgd VALUES ('8265', '1531553499', '20180714039', '01,03,05,07,09');
INSERT INTO ac_data_syxwgd VALUES ('8269', '1531554097', '20180714040', '09,04,01,07,06');
INSERT INTO ac_data_syxwgd VALUES ('8271', '1531554715', '20180714041', '01,03,06,05,11');
INSERT INTO ac_data_syxwgd VALUES ('8275', '1531555309', '20180714042', '01,03,08,02,10');
INSERT INTO ac_data_syxwgd VALUES ('8277', '1531555898', '20180714043', '06,09,04,07,03');
INSERT INTO ac_data_syxwgd VALUES ('8279', '1531556505', '20180714044', '11,08,06,05,03');
INSERT INTO ac_data_syxwgd VALUES ('8281', '1531557127', '20180714045', '03,11,04,09,01');
INSERT INTO ac_data_syxwgd VALUES ('8283', '1531557714', '20180714046', '04,08,10,03,05');
INSERT INTO ac_data_syxwgd VALUES ('8287', '1531558304', '20180714047', '01,05,02,08,09');
INSERT INTO ac_data_syxwgd VALUES ('8289', '1531558904', '20180714048', '07,09,06,03,04');
INSERT INTO ac_data_syxwgd VALUES ('8293', '1531559511', '20180714049', '11,01,04,07,09');
INSERT INTO ac_data_syxwgd VALUES ('8295', '1531560103', '20180714050', '07,09,05,06,01');
INSERT INTO ac_data_syxwgd VALUES ('8297', '1531560718', '20180714051', '04,07,01,02,10');
INSERT INTO ac_data_syxwgd VALUES ('8301', '1531561296', '20180714052', '09,02,05,08,01');
INSERT INTO ac_data_syxwgd VALUES ('8303', '1531561905', '20180714053', '05,01,02,03,09');
INSERT INTO ac_data_syxwgd VALUES ('8307', '1531562504', '20180714054', '02,05,09,04,07');
INSERT INTO ac_data_syxwgd VALUES ('8309', '1531563108', '20180714055', '10,08,11,02,05');
INSERT INTO ac_data_syxwgd VALUES ('8313', '1531563706', '20180714056', '04,01,07,06,02');
INSERT INTO ac_data_syxwgd VALUES ('8315', '1531564304', '20180714057', '04,01,05,07,11');
INSERT INTO ac_data_syxwgd VALUES ('8317', '1531564903', '20180714058', '01,02,11,08,04');
INSERT INTO ac_data_syxwgd VALUES ('8319', '1531565493', '20180714059', '10,11,08,05,07');
INSERT INTO ac_data_syxwgd VALUES ('8321', '1531566094', '20180714060', '03,01,02,05,11');
INSERT INTO ac_data_syxwgd VALUES ('8325', '1531566704', '20180714061', '01,10,09,05,11');
INSERT INTO ac_data_syxwgd VALUES ('8327', '1531567296', '20180714062', '05,09,06,07,04');
INSERT INTO ac_data_syxwgd VALUES ('8331', '1531567909', '20180714063', '08,10,06,11,01');
INSERT INTO ac_data_syxwgd VALUES ('8333', '1531568505', '20180714064', '09,10,01,06,03');
INSERT INTO ac_data_syxwgd VALUES ('8335', '1531569108', '20180714065', '05,03,06,08,09');
INSERT INTO ac_data_syxwgd VALUES ('8339', '1531569705', '20180714066', '06,04,05,02,11');
INSERT INTO ac_data_syxwgd VALUES ('8341', '1531570299', '20180714067', '03,06,08,09,07');
INSERT INTO ac_data_syxwgd VALUES ('8345', '1531570901', '20180714068', '04,06,07,01,05');
INSERT INTO ac_data_syxwgd VALUES ('8347', '1531571513', '20180714069', '09,08,07,05,04');
INSERT INTO ac_data_syxwgd VALUES ('8349', '1531572100', '20180714070', '04,06,02,07,03');
INSERT INTO ac_data_syxwgd VALUES ('8352', '1531572721', '20180714071', '03,07,09,08,04');
INSERT INTO ac_data_syxwgd VALUES ('8354', '1531573297', '20180714072', '01,06,11,03,08');
INSERT INTO ac_data_syxwgd VALUES ('8358', '1531573901', '20180714073', '02,08,01,05,04');
INSERT INTO ac_data_syxwgd VALUES ('8360', '1531574509', '20180714074', '06,04,10,03,09');
INSERT INTO ac_data_syxwgd VALUES ('8362', '1531575107', '20180714075', '04,09,05,07,02');
INSERT INTO ac_data_syxwgd VALUES ('8364', '1531575701', '20180714076', '03,01,02,11,04');
INSERT INTO ac_data_syxwgd VALUES ('8366', '1531576297', '20180714077', '05,06,09,01,03');
INSERT INTO ac_data_syxwgd VALUES ('8370', '1531576899', '20180714078', '06,01,11,05,10');
INSERT INTO ac_data_syxwgd VALUES ('8372', '1531577501', '20180714079', '10,01,08,04,03');
INSERT INTO ac_data_syxwgd VALUES ('8376', '1531578094', '20180714080', '04,03,10,11,07');
INSERT INTO ac_data_syxwgd VALUES ('8379', '1531578698', '20180714081', '10,09,11,02,04');
INSERT INTO ac_data_syxwgd VALUES ('8381', '1531579316', '20180714082', '04,01,06,05,02');
INSERT INTO ac_data_syxwgd VALUES ('8383', '1531579897', '20180714083', '03,05,01,10,06');
INSERT INTO ac_data_syxwgd VALUES ('8442', '1531580517', '20180714084', '07,08,09,01,03');
INSERT INTO ac_data_syxwgd VALUES ('8902', '1531619492', '20180715005', '10,07,09,11,05');
INSERT INTO ac_data_syxwgd VALUES ('8906', '1531620108', '20180715006', '07,09,06,01,02');
INSERT INTO ac_data_syxwgd VALUES ('8908', '1531620707', '20180715007', '07,11,02,09,05');
INSERT INTO ac_data_syxwgd VALUES ('8912', '1531621294', '20180715008', '10,08,03,09,06');
INSERT INTO ac_data_syxwgd VALUES ('8914', '1531621907', '20180715009', '01,09,08,03,10');
INSERT INTO ac_data_syxwgd VALUES ('8916', '1531622498', '20180715010', '10,03,01,11,05');
INSERT INTO ac_data_syxwgd VALUES ('8920', '1531623095', '20180715011', '06,04,11,03,05');
INSERT INTO ac_data_syxwgd VALUES ('8922', '1531623698', '20180715012', '07,03,04,09,08');
INSERT INTO ac_data_syxwgd VALUES ('8926', '1531624306', '20180715013', '06,09,11,03,01');
INSERT INTO ac_data_syxwgd VALUES ('8928', '1531624901', '20180715014', '05,11,06,03,07');
INSERT INTO ac_data_syxwgd VALUES ('8930', '1531625504', '20180715015', '01,05,04,10,03');
INSERT INTO ac_data_syxwgd VALUES ('8932', '1531626110', '20180715016', '02,09,10,11,08');
INSERT INTO ac_data_syxwgd VALUES ('8934', '1531826771', '20180717063', '10,09,07,04,11');
INSERT INTO ac_data_syxwgd VALUES ('8935', '1531884909', '20180718016', '05,04,09,08,03');
INSERT INTO ac_data_syxwgd VALUES ('8936', '1531885826', '20180718017', '05,01,11,04,07');
INSERT INTO ac_data_syxwgd VALUES ('8939', '1531886237', '20180718018', '02,05,11,10,04');
INSERT INTO ac_data_syxwgd VALUES ('8940', '1531887011', '20180718019', '02,09,06,10,04');
INSERT INTO ac_data_syxwgd VALUES ('8941', '1531887611', '20180718020', '06,04,09,05,01');
INSERT INTO ac_data_syxwgd VALUES ('8943', '1531888210', '20180718021', '02,11,09,06,08');
INSERT INTO ac_data_syxwgd VALUES ('8944', '1531888811', '20180718022', '07,11,04,06,03');
INSERT INTO ac_data_syxwgd VALUES ('8945', '1531889118', '20180718023', '07,02,04,06,08');
INSERT INTO ac_data_syxwgd VALUES ('8946', '1531890011', '20180718024', '06,08,04,09,02');
INSERT INTO ac_data_syxwgd VALUES ('8947', '1531890559', '20180718025', '02,10,04,11,06');
INSERT INTO ac_data_syxwgd VALUES ('8948', '1531891226', '20180718026', '10,07,05,03,08');
INSERT INTO ac_data_syxwgd VALUES ('8950', '1531891811', '20180718027', '06,02,05,01,10');
INSERT INTO ac_data_syxwgd VALUES ('8951', '1531892108', '20180718028', '10,03,01,04,09');
INSERT INTO ac_data_syxwgd VALUES ('8952', '1531893011', '20180718029', '05,07,11,09,10');
INSERT INTO ac_data_syxwgd VALUES ('8953', '1531893440', '20180718030', '06,05,08,07,03');
INSERT INTO ac_data_syxwgd VALUES ('8954', '1531894225', '20180718031', '09,10,08,04,07');
INSERT INTO ac_data_syxwgd VALUES ('8955', '1531894810', '20180718032', '02,03,08,05,01');
INSERT INTO ac_data_syxwgd VALUES ('8957', '1531895410', '20180718033', '10,09,01,03,02');
INSERT INTO ac_data_syxwgd VALUES ('8958', '1531896011', '20180718034', '02,07,05,08,11');
INSERT INTO ac_data_syxwgd VALUES ('8959', '1531896322', '20180718035', '03,01,06,10,02');
INSERT INTO ac_data_syxwgd VALUES ('8960', '1531897211', '20180718036', '09,01,06,04,02');
INSERT INTO ac_data_syxwgd VALUES ('8961', '1531897762', '20180718037', '11,08,03,09,01');
INSERT INTO ac_data_syxwgd VALUES ('8962', '1531898411', '20180718038', '09,02,03,07,04');
INSERT INTO ac_data_syxwgd VALUES ('8963', '1531899026', '20180718039', '11,01,06,04,10');
INSERT INTO ac_data_syxwgd VALUES ('8966', '1531899312', '20180718040', '06,08,04,02,07');
INSERT INTO ac_data_syxwgd VALUES ('8967', '1531900210', '20180718041', '10,09,03,07,08');
INSERT INTO ac_data_syxwgd VALUES ('8968', '1531900643', '20180718042', '09,11,10,03,07');
INSERT INTO ac_data_syxwgd VALUES ('8969', '1531901411', '20180718043', '07,01,10,02,03');
INSERT INTO ac_data_syxwgd VALUES ('8970', '1531902026', '20180718044', '02,04,07,05,06');
INSERT INTO ac_data_syxwgd VALUES ('8973', '1531902610', '20180718045', '03,11,06,04,08');
INSERT INTO ac_data_syxwgd VALUES ('8974', '1531903210', '20180718046', '03,09,10,11,04');
INSERT INTO ac_data_syxwgd VALUES ('8975', '1531903525', '20180718047', '05,04,02,01,06');
INSERT INTO ac_data_syxwgd VALUES ('8976', '1531904410', '20180718048', '06,03,07,10,02');
INSERT INTO ac_data_syxwgd VALUES ('8977', '1531904965', '20180718049', '03,04,07,08,02');
INSERT INTO ac_data_syxwgd VALUES ('8978', '1531905611', '20180718050', '03,10,06,11,01');

-- ----------------------------
-- Table structure for `ac_data_xy28pc`
-- ----------------------------
DROP TABLE IF EXISTS `ac_data_xy28pc`;
CREATE TABLE `ac_data_xy28pc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开奖数据';

-- ----------------------------
-- Records of ac_data_xy28pc
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_hook`
-- ----------------------------
DROP TABLE IF EXISTS `ac_hook`;
CREATE TABLE `ac_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='系统钩子表';

-- ----------------------------
-- Records of ac_hook
-- ----------------------------
INSERT INTO ac_hook VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO ac_hook VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO ac_hook VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO ac_hook VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO ac_hook VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO ac_hook VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO ac_hook VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO ac_hook VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO ac_hook VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO ac_hook VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO ac_hook VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO ac_hook VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO ac_hook VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO ac_hook VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO ac_hook VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO ac_hook VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO ac_hook VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO ac_hook VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO ac_hook VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO ac_hook VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO ac_hook VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO ac_hook VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO ac_hook VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO ac_hook VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO ac_hook VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO ac_hook VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO ac_hook VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO ac_hook VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO ac_hook VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO ac_hook VALUES ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO ac_hook VALUES ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO ac_hook VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO ac_hook VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO ac_hook VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO ac_hook VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');

-- ----------------------------
-- Table structure for `ac_hook_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `ac_hook_plugin`;
CREATE TABLE `ac_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of ac_hook_plugin
-- ----------------------------
INSERT INTO ac_hook_plugin VALUES ('1', '10000', '1', 'admin_login', 'CustomAdminLogin');

-- ----------------------------
-- Table structure for `ac_lhc_category`
-- ----------------------------
DROP TABLE IF EXISTS `ac_lhc_category`;
CREATE TABLE `ac_lhc_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名称',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='六合彩分类表';

-- ----------------------------
-- Records of ac_lhc_category
-- ----------------------------
INSERT INTO ac_lhc_category VALUES ('1', '1', '10000', '平码特区', 'business/20180713/72e9e78f8b93735177efa72ad5b61c27.png', '平码特区', '0');
INSERT INTO ac_lhc_category VALUES ('2', '1', '10000', '特码专区', 'business/20180713/d214e17bd69da0cdcb85ff7b6f16d6be.png', '特码专区', '0');
INSERT INTO ac_lhc_category VALUES ('3', '1', '10000', '生肖专区', 'business/20180713/c7cea94e4e2dd94c0d09d91c42390f9e.png', '生肖专区', '0');
INSERT INTO ac_lhc_category VALUES ('4', '1', '10000', '玄机解特', 'business/20180713/bc725cde04508ec40e785e29f6c31e46.png', '玄机解特', '0');
INSERT INTO ac_lhc_category VALUES ('5', '1', '10000', '综合资料', 'business/20180713/e7698a9bf3ff72dcec301049597e1828.png', '综合资料', '0');
INSERT INTO ac_lhc_category VALUES ('6', '1', '10000', '高手分析', 'business/20180713/43bf08bbcd6267303c3191b72b0553e9.png', '高手分析', '0');

-- ----------------------------
-- Table structure for `ac_lhc_post`
-- ----------------------------
DROP TABLE IF EXISTS `ac_lhc_post`;
CREATE TABLE `ac_lhc_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_number` varchar(16) NOT NULL COMMENT '期号(场次)',
  `post_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_content` text COMMENT '文章内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `list_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `post_number` (`post_number`),
  KEY `create_time` (`create_time`),
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='六合彩文章表';

-- ----------------------------
-- Records of ac_lhc_post
-- ----------------------------
INSERT INTO ac_lhc_post VALUES ('1', '1', '2018079', '南巷清风〓【⒈尾平特】〓', '南巷清风〓【⒈尾平特】〓', '\n&lt;p&gt;让你告白输钱！&lt;/p&gt;\n&lt;p&gt;078期：一尾平特《999》中中中  &lt;br&gt;&lt;/p&gt;\n&lt;p&gt;077期：一尾平特《333》XXX&lt;br&gt;076期：一尾平特《777》中中中&lt;br&gt;075期：一尾平特《666》中中中&lt;br&gt;074期：一尾平特《555》xxxxxx&lt;br&gt;073期：一尾平特《333》中中中&lt;br&gt;072期：一尾平特《777》中中中&lt;br&gt;对错不改料，仅供参考！&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', '1531556851', '0', '0', '0', '1', '0');
INSERT INTO ac_lhc_post VALUES ('2', '1', '2018079', '花开满天〓【一肖平特】〓', '花开满天〓【一肖平特】〓', '\n&lt;p&gt;跟上不遗憾......&lt;/p&gt;\n&lt;p&gt;078期:平特一肖〖猴猴猴〗:开？？准 &lt;br&gt;&lt;/p&gt;\n&lt;p&gt;077期:平特一肖〖牛牛牛〗:开22准  &lt;br&gt;076期:平特一肖〖鸡鸡鸡〗:开38准&lt;br&gt;075期:平特一肖〖兔兔兔〗:开08.20准&lt;br&gt;074期:平特一肖〖猪猪猪〗:xx&lt;br&gt;073期:平特一肖〖牛牛牛〗:开10.22准&lt;br&gt;072期:平特一肖〖狗狗狗〗:xx&lt;br&gt;071期:平特一肖〖狗狗狗〗:开13准&lt;br&gt;对错不改料，仅供参考！&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', '1531558958', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for `ac_lhc_time`
-- ----------------------------
DROP TABLE IF EXISTS `ac_lhc_time`;
CREATE TABLE `ac_lhc_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '投注种类，对应ssc_type.id',
  `action_number` int(2) unsigned NOT NULL COMMENT '开奖期号(当天)',
  `action_time` datetime NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='开奖时间对照表';

-- ----------------------------
-- Records of ac_lhc_time
-- ----------------------------
INSERT INTO ac_lhc_time VALUES ('2', '7', '2018076', '2018-07-10 21:30:00');
INSERT INTO ac_lhc_time VALUES ('3', '7', '2018077', '2018-07-12 21:30:00');
INSERT INTO ac_lhc_time VALUES ('4', '7', '2018078', '2018-07-14 21:30:00');
INSERT INTO ac_lhc_time VALUES ('5', '7', '2018079', '2018-07-17 21:30:00');
INSERT INTO ac_lhc_time VALUES ('6', '7', '2018080', '2018-07-19 21:30:00');
INSERT INTO ac_lhc_time VALUES ('7', '7', '2018081', '2018-07-21 21:30:00');
INSERT INTO ac_lhc_time VALUES ('8', '7', '2018082', '2018-07-24 21:30:00');
INSERT INTO ac_lhc_time VALUES ('9', '7', '2018083', '2018-07-26 21:30:00');
INSERT INTO ac_lhc_time VALUES ('10', '7', '2018084', '2018-07-28 21:30:00');
INSERT INTO ac_lhc_time VALUES ('11', '7', '2018085', '2018-07-31 21:30:00');

-- ----------------------------
-- Table structure for `ac_link`
-- ----------------------------
DROP TABLE IF EXISTS `ac_link`;
CREATE TABLE `ac_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of ac_link
-- ----------------------------
INSERT INTO ac_link VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for `ac_nav`
-- ----------------------------
DROP TABLE IF EXISTS `ac_nav`;
CREATE TABLE `ac_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of ac_nav
-- ----------------------------
INSERT INTO ac_nav VALUES ('1', '1', '主导航', '主导航');
INSERT INTO ac_nav VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for `ac_nav_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ac_nav_menu`;
CREATE TABLE `ac_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of ac_nav_menu
-- ----------------------------
INSERT INTO ac_nav_menu VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for `ac_option`
-- ----------------------------
DROP TABLE IF EXISTS `ac_option`;
CREATE TABLE `ac_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of ac_option
-- ----------------------------
INSERT INTO ac_option VALUES ('1', '1', 'site_info', '{\"site_name\":\"\\u5b9d\\u9a6c\\u8ba1\\u5212\\u7f51\",\"site_seo_title\":\"\\u7231\\u5f69\\u8ba1\\u5212\\u7f51\",\"site_seo_keywords\":\"\\u7231\\u5f69\\u8ba1\\u5212\\u7f51\",\"site_seo_description\":\"\\u7231\\u5f69\\u8ba1\\u5212\\u7f51\",\"site_icp\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"urlmode\":\"1\",\"html_suffix\":\"\",\"weixin\":\"999999\",\"qq\":\"678888\",\"register_url\":\"http:\\/\\/www.baidu.com\",\"login_url\":\"http:\\/\\/www.baidu2.com\"}');
INSERT INTO ac_option VALUES ('2', '1', 'cmf_settings', '{\"open_registration\":\"1\",\"banned_usernames\":\"\"}');
INSERT INTO ac_option VALUES ('3', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO ac_option VALUES ('4', '1', 'admin_settings', '{\"admin_password\":\"\",\"admin_style\":\"flatadmin\"}');

-- ----------------------------
-- Table structure for `ac_plan_fc3d`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plan_fc3d`;
CREATE TABLE `ac_plan_fc3d` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `played_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `date` int(8) NOT NULL COMMENT '日期',
  `plan_number` varchar(16) NOT NULL COMMENT '计划期间(场次)，如943-946期',
  `from_number` int(8) NOT NULL COMMENT '从哪一期',
  `to_number` int(8) NOT NULL COMMENT '到哪一期',
  `number` varchar(16) NOT NULL COMMENT '中奖期数(场次)，如943期',
  `data` varchar(80) NOT NULL COMMENT '推荐号码，半角逗号分开',
  `kj_data` varchar(32) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别中奖，0未开奖 1 中奖 2未中奖',
  `create_time` int(10) unsigned NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_played_id` (`played_id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_date_from_to_number` (`date`,`from_number`,`to_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='推荐计划';

-- ----------------------------
-- Records of ac_plan_fc3d
-- ----------------------------
INSERT INTO ac_plan_fc3d VALUES ('1', '22', '20180715', '2018189-2018191', '2018189', '2018191', '', '4', '', '2', '1531654371');
INSERT INTO ac_plan_fc3d VALUES ('2', '23', '20180715', '2018189-2018191', '2018189', '2018191', '', '4', '', '2', '1531654371');
INSERT INTO ac_plan_fc3d VALUES ('3', '24', '20180715', '2018189-2018191', '2018189', '2018191', '', '6', '', '2', '1531654371');

-- ----------------------------
-- Table structure for `ac_plan_lhc`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plan_lhc`;
CREATE TABLE `ac_plan_lhc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `played_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `date` int(8) NOT NULL COMMENT '日期',
  `plan_number` varchar(16) NOT NULL COMMENT '计划期间(场次)，如943-946期',
  `from_number` int(8) NOT NULL COMMENT '从哪一期',
  `to_number` int(8) NOT NULL COMMENT '到哪一期',
  `number` varchar(16) NOT NULL COMMENT '中奖期数(场次)，如943期',
  `data` varchar(1024) NOT NULL COMMENT '推荐号码，半角逗号分开',
  `kj_data` varchar(32) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别中奖，0未开奖 1 中奖 2未中奖',
  `create_time` int(10) unsigned NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_played_id` (`played_id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_date_from_to_number` (`date`,`from_number`,`to_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐计划';

-- ----------------------------
-- Records of ac_plan_lhc
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_plan_pk10bj`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plan_pk10bj`;
CREATE TABLE `ac_plan_pk10bj` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `played_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `date` int(8) NOT NULL COMMENT '日期',
  `plan_number` varchar(16) NOT NULL COMMENT '计划期间(场次)，如943-946期',
  `from_number` int(8) NOT NULL COMMENT '从哪一期',
  `to_number` int(8) NOT NULL COMMENT '到哪一期',
  `number` varchar(16) NOT NULL COMMENT '中奖期数(场次)，如943期',
  `data` varchar(80) NOT NULL COMMENT '推荐号码，半角逗号分开',
  `kj_data` varchar(32) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别中奖，0未开奖 1 中奖 2未中奖',
  `create_time` int(10) unsigned NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_played_id` (`played_id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_date_from_to_number` (`date`,`from_number`,`to_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='推荐计划';

-- ----------------------------
-- Records of ac_plan_pk10bj
-- ----------------------------
INSERT INTO ac_plan_pk10bj VALUES ('1', '16', '20180715', '693003-693005', '693003', '693005', '', '01,03,04,05,06', '', '0', '1531654594');
INSERT INTO ac_plan_pk10bj VALUES ('2', '17', '20180715', '693003-693005', '693003', '693005', '', '01,04,06,07,10', '', '0', '1531654594');
INSERT INTO ac_plan_pk10bj VALUES ('3', '18', '20180715', '693003-693005', '693003', '693005', '', '03,05,06,07,09', '', '0', '1531654594');

-- ----------------------------
-- Table structure for `ac_plan_pl3`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plan_pl3`;
CREATE TABLE `ac_plan_pl3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `played_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `date` int(8) NOT NULL COMMENT '日期',
  `plan_number` varchar(16) NOT NULL COMMENT '计划期间(场次)，如943-946期',
  `from_number` int(8) NOT NULL COMMENT '从哪一期',
  `to_number` int(8) NOT NULL COMMENT '到哪一期',
  `number` varchar(16) NOT NULL COMMENT '中奖期数(场次)，如943期',
  `data` varchar(80) NOT NULL COMMENT '推荐号码，半角逗号分开',
  `kj_data` varchar(32) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别中奖，0未开奖 1 中奖 2未中奖',
  `create_time` int(10) unsigned NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_played_id` (`played_id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_date_from_to_number` (`date`,`from_number`,`to_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='推荐计划';

-- ----------------------------
-- Records of ac_plan_pl3
-- ----------------------------
INSERT INTO ac_plan_pl3 VALUES ('1', '25', '20180715', '2018189-2018191', '2018189', '2018191', '', '6', '', '2', '1531654435');
INSERT INTO ac_plan_pl3 VALUES ('2', '26', '20180715', '2018189-2018191', '2018189', '2018191', '2018190', '3', '0,3,1', '1', '1531654435');
INSERT INTO ac_plan_pl3 VALUES ('3', '27', '20180715', '2018189-2018191', '2018189', '2018191', '2018190', '0', '0,3,1', '1', '1531654435');

-- ----------------------------
-- Table structure for `ac_plan_ssccq`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plan_ssccq`;
CREATE TABLE `ac_plan_ssccq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `played_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `date` int(8) NOT NULL COMMENT '日期',
  `plan_number` varchar(16) NOT NULL COMMENT '计划期间(场次)，如943-946期',
  `from_number` bigint(11) NOT NULL COMMENT '从哪一期',
  `to_number` bigint(11) NOT NULL COMMENT '到哪一期',
  `number` varchar(16) NOT NULL COMMENT '中奖期数(场次)，如943期',
  `data` varchar(80) NOT NULL COMMENT '推荐号码，半角逗号分开',
  `kj_data` varchar(32) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别中奖，0未开奖 1 中奖 2未中奖',
  `create_time` int(10) unsigned NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`,`to_number`),
  KEY `idx_played_id` (`played_id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_date_from_to_number` (`date`,`from_number`,`to_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='推荐计划';

-- ----------------------------
-- Records of ac_plan_ssccq
-- ----------------------------
INSERT INTO ac_plan_ssccq VALUES ('1', '1', '20180715', '083-085', '20180715083', '20180715085', '', '3,4,5,6,7,8,9-0,1,2,3,5,6,7', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('2', '2', '20180715', '083-085', '20180715083', '20180715085', '', '2,4,5,6,7,8,9-0,3,4,6,7,8,9', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('3', '3', '20180715', '083-085', '20180715083', '20180715085', '', '2,3,4,6,7,8,9-0,1,3,4,5,6,7', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('4', '4', '20180715', '083-085', '20180715083', '20180715085', '', '1,2,3,4,5,6,8,9-0,1,2,3,4,5,6,8-0,1,2,3,4,5,6,9', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('5', '5', '20180715', '083-085', '20180715083', '20180715085', '', '0,2,3,4,5,7,8,9-0,1,2,3,4,5,7,8-1,2,3,5,6,7,8,9', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('6', '6', '20180715', '083-085', '20180715083', '20180715085', '', '0,1,2,3,4,6,7,9-0,2,3,4,5,7,8,9-0,1,2,3,4,5,6,8', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('7', '13', '20180715', '083-085', '20180715083', '20180715085', '', '0,1,2,3,4,5,6,7,8', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('8', '14', '20180715', '083-085', '20180715083', '20180715085', '', '0,1,2,3,4,6,7,8,9', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('9', '15', '20180715', '083-085', '20180715083', '20180715085', '', '0,1,2,3,4,5,7,8,9', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('10', '7', '20180715', '083-085', '20180715083', '20180715085', '', '1', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('11', '8', '20180715', '083-085', '20180715083', '20180715085', '', '2', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('12', '9', '20180715', '083-085', '20180715083', '20180715085', '', '7', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('13', '10', '20180715', '083-085', '20180715083', '20180715085', '', '0,1,2,4,8', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('14', '11', '20180715', '083-085', '20180715083', '20180715085', '', '1,3,5,6,8', '', '0', '1531655284');
INSERT INTO ac_plan_ssccq VALUES ('15', '12', '20180715', '083-085', '20180715083', '20180715085', '', '0,3,5,7,8', '', '0', '1531655284');

-- ----------------------------
-- Table structure for `ac_plan_syxwgd`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plan_syxwgd`;
CREATE TABLE `ac_plan_syxwgd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `played_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `date` int(8) NOT NULL COMMENT '日期',
  `plan_number` varchar(16) NOT NULL COMMENT '计划期间(场次)，如943-946期',
  `from_number` bigint(11) NOT NULL COMMENT '从哪一期',
  `to_number` bigint(11) NOT NULL COMMENT '到哪一期',
  `number` varchar(16) NOT NULL COMMENT '中奖期数(场次)，如943期',
  `data` varchar(80) NOT NULL COMMENT '推荐号码，半角逗号分开',
  `kj_data` varchar(32) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别中奖，0未开奖 1 中奖 2未中奖',
  `create_time` int(10) unsigned NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_played_id` (`played_id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_date_from_to_number` (`date`,`from_number`,`to_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='推荐计划';

-- ----------------------------
-- Records of ac_plan_syxwgd
-- ----------------------------
INSERT INTO ac_plan_syxwgd VALUES ('1', '19', '20180715', '064-066', '20180715064', '20180715066', '', '04,05,06,07,09', '', '0', '1531654735');
INSERT INTO ac_plan_syxwgd VALUES ('2', '20', '20180715', '064-066', '20180715064', '20180715066', '', '02,03,06,09,10', '', '0', '1531654735');
INSERT INTO ac_plan_syxwgd VALUES ('3', '21', '20180715', '064-066', '20180715064', '20180715066', '', '03,07,08,09,11', '', '0', '1531654735');
INSERT INTO ac_plan_syxwgd VALUES ('4', '19', '20180719', '017-019', '20180719017', '20180719019', '', '01,02,04,07,08', '', '0', '1531971855');
INSERT INTO ac_plan_syxwgd VALUES ('5', '20', '20180719', '017-019', '20180719017', '20180719019', '', '01,02,03,07,10', '', '0', '1531971855');
INSERT INTO ac_plan_syxwgd VALUES ('6', '21', '20180719', '017-019', '20180719017', '20180719019', '', '01,04,05,06,08', '', '0', '1531971855');

-- ----------------------------
-- Table structure for `ac_plan_xy28pc`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plan_xy28pc`;
CREATE TABLE `ac_plan_xy28pc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `played_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '玩法ID',
  `date` int(8) NOT NULL COMMENT '日期',
  `plan_number` varchar(16) NOT NULL COMMENT '计划期间(场次)，如943-946期',
  `number` varchar(16) NOT NULL COMMENT '中奖期数(场次)，如943期',
  `data` varchar(80) NOT NULL COMMENT '推荐号码，半角逗号分开',
  `kj_data` varchar(32) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别中奖，0未开奖 1 中奖 2未中奖',
  `create_time` int(10) unsigned NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_played_id` (`played_id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐计划';

-- ----------------------------
-- Records of ac_plan_xy28pc
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_played`
-- ----------------------------
DROP TABLE IF EXISTS `ac_played`;
CREATE TABLE `ac_played` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(16) NOT NULL COMMENT '玩法名称',
  `rule_fun` varchar(32) NOT NULL COMMENT '中奖规则',
  `is_split` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认显示彩种',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 0 暂停',
  `list_order` smallint(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='玩法表';

-- ----------------------------
-- Records of ac_played
-- ----------------------------
INSERT INTO ac_played VALUES ('1', '1', '后二直选-高手计划一', 'sscH2ZX', '1', '1', '1', '100');
INSERT INTO ac_played VALUES ('2', '1', '后二直选-高手计划二', 'sscH2ZX', '1', '1', '1', '100');
INSERT INTO ac_played VALUES ('3', '1', '后二直选-高手计划三', 'sscH2ZX', '1', '1', '1', '100');
INSERT INTO ac_played VALUES ('4', '1', '后三直选-高手计划一', 'sscH3ZX', '1', '0', '1', '99');
INSERT INTO ac_played VALUES ('5', '1', '后三直选-高手计划二', 'sscH3ZX', '1', '0', '1', '99');
INSERT INTO ac_played VALUES ('6', '1', '后三直选-高手计划三', 'sscH3ZX', '1', '0', '1', '99');
INSERT INTO ac_played VALUES ('7', '1', '不定位五星-高手计划一', 'sscBDW5X', '0', '0', '1', '97');
INSERT INTO ac_played VALUES ('8', '1', '不定位五星-高手计划二', 'sscBDW5X', '0', '0', '1', '97');
INSERT INTO ac_played VALUES ('9', '1', '不定位五星-高手计划三', 'sscBDW5X', '0', '0', '1', '97');
INSERT INTO ac_played VALUES ('10', '1', '个位定位胆-高手计划一', 'sscDWGW', '0', '0', '1', '96');
INSERT INTO ac_played VALUES ('11', '1', '个位定位胆-高手计划二', 'sscDWGW', '0', '0', '1', '96');
INSERT INTO ac_played VALUES ('12', '1', '个位定位胆-高手计划三', 'sscDWGW', '0', '0', '1', '96');
INSERT INTO ac_played VALUES ('13', '1', '后三组六-高手计划一', 'sscH3Z6', '0', '0', '1', '95');
INSERT INTO ac_played VALUES ('14', '1', '后三组六-高手计划二', 'sscH3Z6', '0', '0', '1', '95');
INSERT INTO ac_played VALUES ('15', '1', '后三组六-高手计划三', 'sscH3Z6', '0', '0', '1', '95');
INSERT INTO ac_played VALUES ('16', '2', '冠军-高手计划一', 'pk10NO1', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('17', '2', '冠军-高手计划二', 'pk10NO1', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('18', '2', '冠军-高手计划三', 'pk10NO1', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('19', '3', '第一球-高手计划一', 'gd11x5Q1', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('20', '3', '第一球-高手计划二', 'gd11x5Q1', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('21', '3', '第一球-高手计划三', 'gd11x5Q1', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('22', '4', '不定胆三星-高手计划一', 'fc3dBDD3X', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('23', '4', '不定胆三星-高手计划二', 'fc3dBDD3X', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('24', '4', '不定胆三星-高手计划三', 'fc3dBDD3X', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('25', '5', '不定胆三星-高手计划一', 'pl3BDD3X', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('26', '5', '不定胆三星-高手计划二', 'pl3BDD3X', '0', '1', '1', '0');
INSERT INTO ac_played VALUES ('27', '5', '不定胆三星-高手计划三', 'pl3BDD3X', '0', '1', '1', '0');

-- ----------------------------
-- Table structure for `ac_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `ac_plugin`;
CREATE TABLE `ac_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ac_plugin
-- ----------------------------
INSERT INTO ac_plugin VALUES ('1', '1', '0', '1', '0', 'CustomAdminLogin', '自定义后台登录页', '', '', 'ThinkCMF', '', '1.0', '自定义后台登录页', '[]');

-- ----------------------------
-- Table structure for `ac_portal_category`
-- ----------------------------
DROP TABLE IF EXISTS `ac_portal_category`;
CREATE TABLE `ac_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of ac_portal_category
-- ----------------------------
INSERT INTO ac_portal_category VALUES ('1', '0', '0', '1', '0', '10000', '重庆时时彩', '重庆时时彩', '0-1-7', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('2', '0', '0', '1', '0', '10000', '北京赛车', '北京赛车', '0-2', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('3', '0', '0', '1', '0', '10000', '广东11选5', '广东11选5', '0-3', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('4', '0', '0', '1', '0', '10000', '福彩3D', '福彩3D', '0-4', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('5', '0', '0', '1', '0', '10000', '排列3', '排列3', '0-5', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('6', '1', '0', '1', '0', '10000', '玩法规则', '玩法规则', '0-1-6', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('7', '1', '0', '1', '0', '10000', '玩法技巧', '玩法技巧', '0-1-7', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('8', '2', '0', '1', '0', '10000', '玩法规则', '玩法规则', '0-2-8', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('9', '2', '0', '1', '0', '10000', '玩法技巧', '玩法技巧', '0-2-9', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('10', '3', '0', '1', '0', '10000', '玩法规则', '玩法规则', '0-3-10', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('11', '3', '0', '1', '0', '10000', '玩法技巧', '玩法技巧', '0-3-11', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('12', '4', '0', '1', '0', '10000', '玩法规则', '玩法规则', '0-4-12', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('13', '4', '0', '1', '0', '10000', '玩法技巧', '玩法技巧', '0-4-13', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('14', '5', '0', '1', '0', '10000', '玩法规则', '玩法规则', '0-5-14', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('15', '5', '0', '1', '0', '10000', ' 玩法技巧', ' 玩法技巧', '0-5-15', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('16', '0', '0', '1', '0', '10000', 'PC蛋蛋幸运28', '六合彩', '0-16-18', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('17', '16', '0', '1', '0', '10000', ' 玩法规则', ' 玩法规则', '0-16-17', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('18', '16', '0', '1', '0', '10000', '玩法技巧', '玩法技巧', '0-16-18', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('19', '0', '0', '1', '0', '10000', '香港六合彩', '香港六合彩', '0-19', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('20', '19', '0', '1', '0', '10000', ' 玩法规则', ' 玩法规则', '0-19-20', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
INSERT INTO ac_portal_category VALUES ('21', '19', '0', '1', '0', '10000', ' 玩法技巧', ' 玩法技巧', '0-19-21', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');

-- ----------------------------
-- Table structure for `ac_portal_category_post`
-- ----------------------------
DROP TABLE IF EXISTS `ac_portal_category_post`;
CREATE TABLE `ac_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of ac_portal_category_post
-- ----------------------------
INSERT INTO ac_portal_category_post VALUES ('1', '1', '6', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('2', '2', '1', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('3', '2', '6', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('4', '3', '1', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('5', '3', '6', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('6', '4', '1', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('7', '4', '6', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('8', '5', '1', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('12', '6', '7', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('13', '5', '7', '10000', '0');
INSERT INTO ac_portal_category_post VALUES ('14', '7', '1', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('15', '7', '7', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('16', '8', '2', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('17', '8', '9', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('18', '9', '3', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('19', '9', '11', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('20', '10', '4', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('21', '10', '13', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('22', '11', '5', '10000', '1');
INSERT INTO ac_portal_category_post VALUES ('23', '11', '15', '10000', '1');

-- ----------------------------
-- Table structure for `ac_portal_post`
-- ----------------------------
DROP TABLE IF EXISTS `ac_portal_post`;
CREATE TABLE `ac_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of ac_portal_post
-- ----------------------------
INSERT INTO ac_portal_post VALUES ('1', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1527563357', '1527570697', '1527563280', '1530331899', '时时彩玩法规则', '时时彩玩法规则', '时时彩玩法规则', '时时彩玩法规则', '&lt;p&gt;时时彩玩法规则&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20180524\\/418ecf94dd374555e088f3d54b758a4d.jpg\",\"template\":\"\",\"photos\":[{\"url\":\"portal\\/20180524\\/418ecf94dd374555e088f3d54b758a4d.jpg\",\"name\":\"timg.jpg\"}]}');
INSERT INTO ac_portal_post VALUES ('2', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1530071871', '1530071941', '1530071760', '1530331899', '测试一下吧', '测试一下吧', '', '', '&lt;p&gt;测试一下吧&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20180627\\/c42255014151599fbfa3200187fdb25d.jpg\",\"template\":\"\",\"photos\":[{\"url\":\"portal\\/20180627\\/c42255014151599fbfa3200187fdb25d.jpg\",\"name\":\"img1.jpg\"}]}');
INSERT INTO ac_portal_post VALUES ('3', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1530071899', '1530071899', '1530071880', '1530331899', '测试一下吧2', '测试一下吧2', '测试一下吧2', '测试一下吧2', '&lt;p&gt;测试一下吧2&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('4', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1530071918', '1530071918', '1530071902', '1530331899', '测试一下吧3', '测试一下吧3', '', '', '&lt;p&gt;测试一下吧3&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('5', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1530420631', '1530522770', '1530420600', '1530630673', '测试一下吧', '测试一下吧', '测试一下吧', '测试一下吧', '&lt;p&gt;测试一下吧&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20180627\\/c42255014151599fbfa3200187fdb25d.jpg\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('6', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1530420655', '1530522748', '1530420600', '1530630673', '测试一下吧2', '测试一下吧2', '测试一下吧2', '测试一下吧2', '&lt;p&gt;测试一下吧2&lt;/p&gt;', null, '{\"thumbnail\":\"portal\\/20180627\\/c42255014151599fbfa3200187fdb25d.jpg\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('7', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1531040838', '1531040925', '1531040700', '0', '重庆时时彩技巧与实战攻略', '重庆时时彩技巧,重庆时时彩实战攻略', '重庆时时彩技巧与实战攻略', '', '\n&lt;p&gt;重庆时时彩玩法5-10分钟开奖一期，一天开奖多达120期。因为开奖频率快，所以留给每个彩民的选号时间非常短暂。要想在极短的时间内选出中奖率高的号码实非易事，这就对每一个时时彩玩家提出了一个较高的要求——必须拥有一套行之有效、简单快速的时时彩选号技术。&lt;/p&gt;\n&lt;p&gt;只有掌握了这种简便、有效、快速的选号技术，时时彩玩家才能在快速的开奖中做到有的放矢地进行选号投注，也才能真正地享受到中奖赢利的快乐，否则只能是“肉包子打狗”有去无回了，更别谈投资回报率是多少。&lt;/p&gt;\n&lt;p&gt;临渊慕鱼不如退而结网。建议在时时彩上已经巨额亏损或者刚刚准备进入时时彩领域投资获利的彩民朋友，不如静下心来，踏踏实实地阅读学习本书内的时时彩技巧与实战攻略，在战斗前把自己全副武装好。&lt;/p&gt;\n&lt;p&gt;老话说得好，磨刀不误砍柴工，等您的刀磨得快快的时候再战重庆时时彩，自然就会得心应手、游刃有余了。&lt;/p&gt;\n', null, '{\"thumbnail\":\"business\\/20180625\\/03f8e287667339c60ccadeaf94b8ca4b.png\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('8', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1531041163', '1531041163', '1531041115', '0', ' 北京赛车PK10老玩家的窍门技巧分享', ' 北京赛车PK10窍门技巧', '北京赛车PK10老玩家的窍门技巧分享', '', '\n&lt;p&gt;玩北京赛车PK10的人很多，每个人都在思考着如何能提高中奖率，如何才能在北京赛车PK10里面赚到钱，网上也有许许多多的技术文章与计划研究PK10技巧，可是却还是一样在平台里亏钱，其实玩PK10也没有多么复杂，只要把该想明白的想明白，该控制的控制好，切勿心浮气躁，心态一定要稳，总有运气好，也总有运气不好的时候，小心使得万年船，在PK10上同样受用。&lt;/p&gt;\n&lt;p&gt;下面就来讲讲玩北京赛车PK10最重要的是什么。&lt;/p&gt;\n&lt;p&gt;玩PK10重点就是要有自己的一套方法方案，你没有方法的话，只知道到处找计划跟，即使运气再好，也有输钱的一天。&lt;/p&gt;\n&lt;p&gt;计划只是一套软件发出来的，都是早死晚死的问题罢了，PK10这么变化万千，能赚的都是随机应变的，而不是过多的依赖软件计划。与其像个无头苍蝇一样到处找计划，不如静下心仔细琢磨琢磨自己玩法的规律，别闲麻烦，比跟计划靠谱多了。&lt;/p&gt;\n&lt;p&gt;越简单的玩法，其难度系数越高。比如冠军，不要以为就那么几个号码就简单了，越简单的玩法能应用的条件就越少，判断的条件少了，那么它开起来不就随心所欲，自然坑也就越多。&lt;/p&gt;\n&lt;p&gt;输的最多的都是玩定位胆和直选跟计划，我不否认有的人确实赚了，但确实输的是大部分人，归根结底还是在于计划，计划是期期都有的，但是开奖不是期期都稳定的，一旦遇上十几期甚至二十几期的遗漏，基本只有哭晕在厕所的份了。&lt;/p&gt;\n&lt;p&gt;最后也不要想着一夜暴富，上来就想赚个金鹏满钵的，释怀一点，全当娱乐就好。&lt;/p&gt;\n', null, '{\"thumbnail\":\"business\\/20180625\\/ec42a91d2f1b5e76fab6613f194f5a9c.png\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('9', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1531041345', '1531041345', '1531041291', '0', '广东11选5技巧稳赚', '广东11选5技巧稳赚', '', '广东11选5技巧稳赚', '\n&lt;p&gt;广东11选5“广东11选5”电脑体育彩票12分钟一期，10分钟销售，2分钟开奖，一天70期，广东11选5有多种玩法，投注方式灵活，奖金固定，回报率高。最常用的一种方法就是杀号法，通过准确的杀掉其中一个或几个号码，就大大缩小了选号范围，投资成本也减少了，中奖率也就跟着提高了，怎样才能正确杀号呢，上期我们说到“广东11选5前一技巧稳赚之两大攻略玩前一”，本期就介绍下广东11选5中三个选号小技巧。&lt;/p&gt;\n&lt;p&gt;1、开奖号的前后相减，此方法准确率高达90%以上，如14032408期开奖号码为02、03、05、06、08，开奖号码相减为01、02，下期可杀01、02，第14032409期开奖号码为06、08、09、11，杀号正确。&lt;/p&gt;\n&lt;p&gt;2、取开奖号码中间的号码可作为下期选号，前提是此号码务必是遗漏5期以上的号码。这个要看情况，看当时的走势来决定的。&lt;/p&gt;\n&lt;p&gt;3、99算法：比如14032405期开奖号码为1、3、4、5、11,取前两位1、3组成一个数值13，用13/9=1，余4，然后用1和4相加减得5、3，这两个号在下期开奖号中最少出1个，据统计大概有80%以上几率，14032403期开奖号码为1、2、4、6、10，其中有1号，判断正确。&lt;/p&gt;\n&lt;p&gt;总结：以上三种技巧都是经过实践证明的，准确率极高，投注广东11选5，技巧是关键，掌握了技巧，还愁中大奖吗?&lt;/p&gt;\n', null, '{\"thumbnail\":\"business\\/20180625\\/d51f5f59038198e53b7101af2e167f9d.png\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('10', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1531041543', '1531041543', '1531041363', '0', '玩转3d 先学会“趋热避冷”', '玩转3d 先学会“趋热避冷”', '玩转3d 先学会“趋热避冷”', '玩转3d 先学会“趋热避冷”', '\n&lt;p&gt;相信大部分彩民与小编一样，在对3d选号时，经常经常会去对一些冷码多加关注，并且常常对这些冷码作“触底反弹”的估计，但它仿佛和我们作对，偏不反弹，而一些热码却频频开出，让我们对奖号的所谓“大致平衡”产生疑问。&lt;/p&gt;\n&lt;p&gt;为什么呢?因为太过关注近十期或近二十期号码，导致我们把目光只拘囿于短期的数据，自然无法得到“各个奖号基本持平”的结论。长期来看号码基本持平，不过，短期内号码的走势则肯定是不平衡的。有了这个结论再来谈投注彩票时的“趋热避冷”。&lt;/p&gt;\n&lt;p&gt;要求在具体选号时，眼光不必太过于“放”眼到数百期，要及时把眼光“收”到局部，注重短期内号码的热度变化情况，尤其对热码的走势要做详尽的观察和统计。&lt;/p&gt;\n&lt;p&gt;首先，在号码上趋热避冷：对于短期内销声匿迹的冷码，我们不妨不理睬它，等它反弹后再对其做持续关注，对十期内走势活跃的号码则不妨紧紧跟进，主要精力应该放在热码上。&lt;/p&gt;\n&lt;p&gt;其次，在形态上趋热避冷：在投注3d时，根据历史开奖号码的大小或者单双的形态分布作为依据进行投注，近期如果“大大小”常见，则在选号时不妨继续将其做备选，尤其是形态上稍呈“偏态”的“大大大”或者“小小小”如果在十期内屡次开出，那这十期是此形态的高发期，须紧密留意，并切实跟进。&lt;/p&gt;\n', null, '{\"thumbnail\":\"business\\/20180625\\/06937117ba79dbdccf5d6b66863c2728.png\",\"template\":\"\"}');
INSERT INTO ac_portal_post VALUES ('11', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1531041648', '1531041648', '1531041588', '0', '排列三追号，谨记三步走', '排列三追号', '排列三追号 谨记三步走', '排列三追号 谨记三步走', '\n&lt;p&gt;在购买排列三时，很多彩民朋友喜欢追号法，追号法的理解也很简单，指的是对3d彩票连续多期买同一注号，一直不出就一直买下去，直到它有一天真的开出来为止。&lt;/p&gt;\n&lt;p&gt;第一：隔期法&lt;/p&gt;\n&lt;p&gt;追号同样要讲究方法，比如可以采取隔期追，采取在相近号后面追，采取在完全不同号码后面追，这些方法要看近期内排列的走势，以及这种走势会否在一个较长的周期内延续。&lt;/p&gt;\n&lt;p&gt;第二：简化法&lt;/p&gt;\n&lt;p&gt;将排列5简化成排列3。排列5在一定时期内容易开出诸如22446，12233，55499等带有重号的号码，还有12125，34432，08308等都属于这种情况。将这些数字简化后就是包含有3个不同数字的组合了。比如上面的例子可以是246、123、549、125、342、308等数字的组合清醒的一种扩展。我们从众多的开奖数字中提出这些具有特性的数字单独制作一张表格，将其简化成排列3的走势，相信很多朋友在排列3上都有自己独到的一套，那么就把你在排列3上的方法运用到此处，猜测出下期的数字如205，在一个较大的周期内(如5--10天)的相隔时间下进行扩展(如20505)投注，这样就达到了简化排列5提高中奖率的目的，还娱乐了这种玩法。&lt;/p&gt;\n&lt;p&gt;第三：挖洞法&lt;/p&gt;\n&lt;p&gt;这种方法其实是上边第二种方法的一种特例。就是将0这个数字作为一种特例来对待。有些朋友对0比较敏感，因此喜欢投带0的号码。0虽然是一个数字，但是它代表了一种空无，因此我们可以将它看成一种空洞。可以视为一种不存在，既然不存在就减少了排列5的数字，如果有两个0，那么排列5又可以变成排列3了。比如00549，我们可以将它看成是549。&lt;/p&gt;\n&lt;p&gt;以上说了一些比较简单实用而且不费脑子的方法，如果你喜欢可以运用一下。当然在排列三的投注中还有许多许多的方法，关键是要看我们自己的掌握程度，最后最为关键的是要抱有一种乐观的娱乐心态对待排列三及排列五，对待各种彩票。&lt;/p&gt;\n', null, '{\"thumbnail\":\"business\\/20180625\\/0ff5e711ade547fc3491c676d49c63d0.png\",\"template\":\"\"}');

-- ----------------------------
-- Table structure for `ac_portal_tag`
-- ----------------------------
DROP TABLE IF EXISTS `ac_portal_tag`;
CREATE TABLE `ac_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of ac_portal_tag
-- ----------------------------
INSERT INTO ac_portal_tag VALUES ('5', '1', '0', '0', '重庆时时彩技巧');
INSERT INTO ac_portal_tag VALUES ('6', '1', '0', '0', '重庆时时彩实战攻略');
INSERT INTO ac_portal_tag VALUES ('7', '1', '0', '0', '北京赛车PK10窍门技巧');
INSERT INTO ac_portal_tag VALUES ('8', '1', '0', '0', '广东11选5技巧稳赚');
INSERT INTO ac_portal_tag VALUES ('9', '1', '0', '0', '玩转3d 先学会“趋热避冷”');
INSERT INTO ac_portal_tag VALUES ('10', '1', '0', '0', '排列三追号');

-- ----------------------------
-- Table structure for `ac_portal_tag_post`
-- ----------------------------
DROP TABLE IF EXISTS `ac_portal_tag_post`;
CREATE TABLE `ac_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of ac_portal_tag_post
-- ----------------------------
INSERT INTO ac_portal_tag_post VALUES ('7', '5', '7', '1');
INSERT INTO ac_portal_tag_post VALUES ('8', '6', '7', '1');
INSERT INTO ac_portal_tag_post VALUES ('9', '7', '8', '1');
INSERT INTO ac_portal_tag_post VALUES ('10', '8', '9', '1');
INSERT INTO ac_portal_tag_post VALUES ('11', '9', '10', '1');
INSERT INTO ac_portal_tag_post VALUES ('12', '10', '11', '1');

-- ----------------------------
-- Table structure for `ac_recycle_bin`
-- ----------------------------
DROP TABLE IF EXISTS `ac_recycle_bin`;
CREATE TABLE `ac_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT=' 回收站';

-- ----------------------------
-- Records of ac_recycle_bin
-- ----------------------------
INSERT INTO ac_recycle_bin VALUES ('1', '1', '1527059913', 'portal_post', '测试', '1');
INSERT INTO ac_recycle_bin VALUES ('2', '1', '1527129176', 'slide', '11', '0');
INSERT INTO ac_recycle_bin VALUES ('3', '1', '1530331899', 'portal_post', '时时彩玩法规则', '1');
INSERT INTO ac_recycle_bin VALUES ('4', '2', '1530331899', 'portal_post', '测试一下吧', '1');
INSERT INTO ac_recycle_bin VALUES ('5', '3', '1530331899', 'portal_post', '测试一下吧2', '1');
INSERT INTO ac_recycle_bin VALUES ('6', '4', '1530331899', 'portal_post', '测试一下吧3', '1');
INSERT INTO ac_recycle_bin VALUES ('7', '5', '1530630673', 'portal_post', '测试一下吧', '1');
INSERT INTO ac_recycle_bin VALUES ('8', '6', '1530630673', 'portal_post', '测试一下吧2', '1');

-- ----------------------------
-- Table structure for `ac_role`
-- ----------------------------
DROP TABLE IF EXISTS `ac_role`;
CREATE TABLE `ac_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ac_role
-- ----------------------------
INSERT INTO ac_role VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO ac_role VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');

-- ----------------------------
-- Table structure for `ac_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `ac_role_user`;
CREATE TABLE `ac_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of ac_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_route`
-- ----------------------------
DROP TABLE IF EXISTS `ac_route`;
CREATE TABLE `ac_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of ac_route
-- ----------------------------
INSERT INTO ac_route VALUES ('1', '5000', '1', '2', 'portal/List/index?id=1', '重庆时时彩');
INSERT INTO ac_route VALUES ('2', '4999', '1', '2', 'portal/Article/index?cid=1', '重庆时时彩/:id');
INSERT INTO ac_route VALUES ('3', '5000', '1', '2', 'portal/List/index?id=2', '北京赛车');
INSERT INTO ac_route VALUES ('4', '4999', '1', '2', 'portal/Article/index?cid=2', '北京赛车/:id');
INSERT INTO ac_route VALUES ('5', '5000', '1', '2', 'portal/List/index?id=3', '广东11选5');
INSERT INTO ac_route VALUES ('6', '4999', '1', '2', 'portal/Article/index?cid=3', '广东11选5/:id');
INSERT INTO ac_route VALUES ('7', '5000', '1', '2', 'portal/List/index?id=4', '福彩3D');
INSERT INTO ac_route VALUES ('8', '4999', '1', '2', 'portal/Article/index?cid=4', '福彩3D/:id');
INSERT INTO ac_route VALUES ('9', '5000', '1', '2', 'portal/List/index?id=5', '排列3');
INSERT INTO ac_route VALUES ('10', '4999', '1', '2', 'portal/Article/index?cid=5', '排列3/:id');

-- ----------------------------
-- Table structure for `ac_slide`
-- ----------------------------
DROP TABLE IF EXISTS `ac_slide`;
CREATE TABLE `ac_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of ac_slide
-- ----------------------------
INSERT INTO ac_slide VALUES ('1', '1', '0', '首页幻灯片', '首页幻灯片');

-- ----------------------------
-- Table structure for `ac_slide_item`
-- ----------------------------
DROP TABLE IF EXISTS `ac_slide_item`;
CREATE TABLE `ac_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) NOT NULL COMMENT '幻灯片描述',
  `content` text COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of ac_slide_item
-- ----------------------------
INSERT INTO ac_slide_item VALUES ('1', '1', '1', '10000', '爱财为您推荐稳定、安全、可靠购彩平台', 'admin/20180708/c45903abb1641a58afe93cba2c4ad272.jpg', '#', '', '爱财为您推荐稳定、安全、可靠购彩平台', '爱财为您推荐稳定、安全、可靠购彩平台', null);
INSERT INTO ac_slide_item VALUES ('2', '1', '1', '10000', '爱彩网全新上线为您提供精准彩票推荐号码', 'admin/20180708/1a6e96ea15233b9bb62dbbc02312becd.jpg', '#', '', '爱彩网全新上线为您提供精准彩票推荐号码', '爱彩网全新上线为您提供精准彩票推荐号码', null);

-- ----------------------------
-- Table structure for `ac_theme`
-- ----------------------------
DROP TABLE IF EXISTS `ac_theme`;
CREATE TABLE `ac_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ac_theme
-- ----------------------------
INSERT INTO ac_theme VALUES ('1', '0', '0', '0', '0', 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for `ac_theme_file`
-- ----------------------------
DROP TABLE IF EXISTS `ac_theme_file`;
CREATE TABLE `ac_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ac_theme_file
-- ----------------------------
INSERT INTO ac_theme_file VALUES ('1', '0', '10', 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);
INSERT INTO ac_theme_file VALUES ('2', '0', '10', 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO ac_theme_file VALUES ('3', '0', '5', 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO ac_theme_file VALUES ('4', '0', '10', 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO ac_theme_file VALUES ('5', '0', '10', 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO ac_theme_file VALUES ('6', '0', '10', 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO ac_theme_file VALUES ('7', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', null);
INSERT INTO ac_theme_file VALUES ('8', '1', '1', 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);

-- ----------------------------
-- Table structure for `ac_third_party_user`
-- ----------------------------
DROP TABLE IF EXISTS `ac_third_party_user`;
CREATE TABLE `ac_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of ac_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_time`
-- ----------------------------
DROP TABLE IF EXISTS `ac_time`;
CREATE TABLE `ac_time` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '投注种类，对应ssc_type.id',
  `action_number` int(2) unsigned NOT NULL COMMENT '开奖期号(当天)',
  `start_time` time NOT NULL COMMENT '开盘时间',
  `stop_time` time NOT NULL COMMENT '封单时间',
  `action_time` time NOT NULL COMMENT '开奖时间',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8 COMMENT='开奖时间对照表';

-- ----------------------------
-- Records of ac_time
-- ----------------------------
INSERT INTO ac_time VALUES ('1', '1', '1', '00:00:00', '00:04:00', '00:05:00');
INSERT INTO ac_time VALUES ('2', '1', '2', '00:05:00', '00:09:00', '00:10:00');
INSERT INTO ac_time VALUES ('3', '1', '3', '00:10:00', '00:14:00', '00:15:00');
INSERT INTO ac_time VALUES ('4', '1', '4', '00:15:00', '00:19:00', '00:20:00');
INSERT INTO ac_time VALUES ('5', '1', '5', '00:20:00', '00:24:00', '00:25:00');
INSERT INTO ac_time VALUES ('6', '1', '6', '00:25:00', '00:29:00', '00:30:00');
INSERT INTO ac_time VALUES ('7', '1', '7', '00:30:00', '00:34:00', '00:35:00');
INSERT INTO ac_time VALUES ('8', '1', '8', '00:35:00', '00:39:00', '00:40:00');
INSERT INTO ac_time VALUES ('9', '1', '9', '00:40:00', '00:44:00', '00:45:00');
INSERT INTO ac_time VALUES ('10', '1', '10', '00:45:00', '00:49:00', '00:50:00');
INSERT INTO ac_time VALUES ('11', '1', '11', '00:50:00', '00:54:00', '00:55:00');
INSERT INTO ac_time VALUES ('12', '1', '12', '00:55:00', '00:59:00', '01:00:00');
INSERT INTO ac_time VALUES ('13', '1', '13', '01:00:00', '01:04:00', '01:05:00');
INSERT INTO ac_time VALUES ('14', '1', '14', '01:05:00', '01:09:00', '01:10:00');
INSERT INTO ac_time VALUES ('15', '1', '15', '01:10:00', '01:14:00', '01:15:00');
INSERT INTO ac_time VALUES ('16', '1', '16', '01:15:00', '01:19:00', '01:20:00');
INSERT INTO ac_time VALUES ('17', '1', '17', '01:20:00', '01:24:00', '01:25:00');
INSERT INTO ac_time VALUES ('18', '1', '18', '01:25:00', '01:29:00', '01:30:00');
INSERT INTO ac_time VALUES ('19', '1', '19', '01:30:00', '01:34:00', '01:35:00');
INSERT INTO ac_time VALUES ('20', '1', '20', '01:35:00', '01:39:00', '01:40:00');
INSERT INTO ac_time VALUES ('21', '1', '21', '01:40:00', '01:44:00', '01:45:00');
INSERT INTO ac_time VALUES ('22', '1', '22', '01:45:00', '01:49:00', '01:50:00');
INSERT INTO ac_time VALUES ('23', '1', '23', '01:50:00', '01:54:00', '01:55:00');
INSERT INTO ac_time VALUES ('24', '1', '24', '01:55:00', '09:59:00', '10:00:00');
INSERT INTO ac_time VALUES ('25', '1', '25', '10:00:00', '10:09:00', '10:10:00');
INSERT INTO ac_time VALUES ('26', '1', '26', '10:10:00', '10:19:00', '10:20:00');
INSERT INTO ac_time VALUES ('27', '1', '27', '10:20:00', '10:29:00', '10:30:00');
INSERT INTO ac_time VALUES ('28', '1', '28', '10:30:00', '10:39:00', '10:40:00');
INSERT INTO ac_time VALUES ('29', '1', '29', '10:40:00', '10:49:00', '10:50:00');
INSERT INTO ac_time VALUES ('30', '1', '30', '10:50:00', '10:59:00', '11:00:00');
INSERT INTO ac_time VALUES ('31', '1', '31', '11:00:00', '11:09:00', '11:10:00');
INSERT INTO ac_time VALUES ('32', '1', '32', '11:10:00', '11:19:00', '11:20:00');
INSERT INTO ac_time VALUES ('33', '1', '33', '11:20:00', '11:29:00', '11:30:00');
INSERT INTO ac_time VALUES ('34', '1', '34', '11:30:00', '11:39:00', '11:40:00');
INSERT INTO ac_time VALUES ('35', '1', '35', '11:40:00', '11:49:00', '11:50:00');
INSERT INTO ac_time VALUES ('36', '1', '36', '11:50:00', '11:59:00', '12:00:00');
INSERT INTO ac_time VALUES ('37', '1', '37', '12:00:00', '12:09:00', '12:10:00');
INSERT INTO ac_time VALUES ('38', '1', '38', '12:10:00', '12:19:00', '12:20:00');
INSERT INTO ac_time VALUES ('39', '1', '39', '12:20:00', '12:29:00', '12:30:00');
INSERT INTO ac_time VALUES ('40', '1', '40', '12:30:00', '12:39:00', '12:40:00');
INSERT INTO ac_time VALUES ('41', '1', '41', '12:40:00', '12:49:00', '12:50:00');
INSERT INTO ac_time VALUES ('42', '1', '42', '12:50:00', '12:59:00', '13:00:00');
INSERT INTO ac_time VALUES ('43', '1', '43', '13:00:00', '13:09:00', '13:10:00');
INSERT INTO ac_time VALUES ('44', '1', '44', '13:10:00', '13:19:00', '13:20:00');
INSERT INTO ac_time VALUES ('45', '1', '45', '13:20:00', '13:29:00', '13:30:00');
INSERT INTO ac_time VALUES ('46', '1', '46', '13:30:00', '13:39:00', '13:40:00');
INSERT INTO ac_time VALUES ('47', '1', '47', '13:40:00', '13:49:00', '13:50:00');
INSERT INTO ac_time VALUES ('48', '1', '48', '13:50:00', '13:59:00', '14:00:00');
INSERT INTO ac_time VALUES ('49', '1', '49', '14:00:00', '14:09:00', '14:10:00');
INSERT INTO ac_time VALUES ('50', '1', '50', '14:10:00', '14:19:00', '14:20:00');
INSERT INTO ac_time VALUES ('51', '1', '51', '14:20:00', '14:29:00', '14:30:00');
INSERT INTO ac_time VALUES ('52', '1', '52', '14:30:00', '14:39:00', '14:40:00');
INSERT INTO ac_time VALUES ('53', '1', '53', '14:40:00', '14:49:00', '14:50:00');
INSERT INTO ac_time VALUES ('54', '1', '54', '14:50:00', '14:59:00', '15:00:00');
INSERT INTO ac_time VALUES ('55', '1', '55', '15:00:00', '15:09:00', '15:10:00');
INSERT INTO ac_time VALUES ('56', '1', '56', '15:10:00', '15:19:00', '15:20:00');
INSERT INTO ac_time VALUES ('57', '1', '57', '15:20:00', '15:29:00', '15:30:00');
INSERT INTO ac_time VALUES ('58', '1', '58', '15:30:00', '15:39:00', '15:40:00');
INSERT INTO ac_time VALUES ('59', '1', '59', '15:40:00', '15:49:00', '15:50:00');
INSERT INTO ac_time VALUES ('60', '1', '60', '15:50:00', '15:59:00', '16:00:00');
INSERT INTO ac_time VALUES ('61', '1', '61', '16:00:00', '16:09:00', '16:10:00');
INSERT INTO ac_time VALUES ('62', '1', '62', '16:10:00', '16:19:00', '16:20:00');
INSERT INTO ac_time VALUES ('63', '1', '63', '16:20:00', '16:29:00', '16:30:00');
INSERT INTO ac_time VALUES ('64', '1', '64', '16:30:00', '16:39:00', '16:40:00');
INSERT INTO ac_time VALUES ('65', '1', '65', '16:40:00', '16:49:00', '16:50:00');
INSERT INTO ac_time VALUES ('66', '1', '66', '16:50:00', '16:59:00', '17:00:00');
INSERT INTO ac_time VALUES ('67', '1', '67', '17:00:00', '17:09:00', '17:10:00');
INSERT INTO ac_time VALUES ('68', '1', '68', '17:10:00', '17:19:00', '17:20:00');
INSERT INTO ac_time VALUES ('69', '1', '69', '17:20:00', '17:29:00', '17:30:00');
INSERT INTO ac_time VALUES ('70', '1', '70', '17:30:00', '17:39:00', '17:40:00');
INSERT INTO ac_time VALUES ('71', '1', '71', '17:40:00', '17:49:00', '17:50:00');
INSERT INTO ac_time VALUES ('72', '1', '72', '17:50:00', '17:59:00', '18:00:00');
INSERT INTO ac_time VALUES ('73', '1', '73', '18:00:00', '18:09:00', '18:10:00');
INSERT INTO ac_time VALUES ('74', '1', '74', '18:10:00', '18:19:00', '18:20:00');
INSERT INTO ac_time VALUES ('75', '1', '75', '18:20:00', '18:29:00', '18:30:00');
INSERT INTO ac_time VALUES ('76', '1', '76', '18:30:00', '18:39:00', '18:40:00');
INSERT INTO ac_time VALUES ('77', '1', '77', '18:40:00', '18:49:00', '18:50:00');
INSERT INTO ac_time VALUES ('78', '1', '78', '18:50:00', '18:59:00', '19:00:00');
INSERT INTO ac_time VALUES ('79', '1', '79', '19:00:00', '19:09:00', '19:10:00');
INSERT INTO ac_time VALUES ('80', '1', '80', '19:10:00', '19:19:00', '19:20:00');
INSERT INTO ac_time VALUES ('81', '1', '81', '19:20:00', '19:29:00', '19:30:00');
INSERT INTO ac_time VALUES ('82', '1', '82', '19:30:00', '19:39:00', '19:40:00');
INSERT INTO ac_time VALUES ('83', '1', '83', '19:40:00', '19:49:00', '19:50:00');
INSERT INTO ac_time VALUES ('84', '1', '84', '19:50:00', '19:59:00', '20:00:00');
INSERT INTO ac_time VALUES ('85', '1', '85', '20:00:00', '20:09:00', '20:10:00');
INSERT INTO ac_time VALUES ('86', '1', '86', '20:10:00', '20:19:00', '20:20:00');
INSERT INTO ac_time VALUES ('87', '1', '87', '20:20:00', '20:29:00', '20:30:00');
INSERT INTO ac_time VALUES ('88', '1', '88', '20:30:00', '20:39:00', '20:40:00');
INSERT INTO ac_time VALUES ('89', '1', '89', '20:40:00', '20:49:00', '20:50:00');
INSERT INTO ac_time VALUES ('90', '1', '90', '20:50:00', '20:59:00', '21:00:00');
INSERT INTO ac_time VALUES ('91', '1', '91', '21:00:00', '21:09:00', '21:10:00');
INSERT INTO ac_time VALUES ('92', '1', '92', '21:10:00', '21:19:00', '21:20:00');
INSERT INTO ac_time VALUES ('93', '1', '93', '21:20:00', '21:29:00', '21:30:00');
INSERT INTO ac_time VALUES ('94', '1', '94', '21:30:00', '21:39:00', '21:40:00');
INSERT INTO ac_time VALUES ('95', '1', '95', '21:40:00', '21:49:00', '21:50:00');
INSERT INTO ac_time VALUES ('96', '1', '96', '21:50:00', '21:59:00', '22:00:00');
INSERT INTO ac_time VALUES ('97', '1', '97', '22:00:00', '22:04:00', '22:05:00');
INSERT INTO ac_time VALUES ('98', '1', '98', '22:05:00', '22:09:00', '22:10:00');
INSERT INTO ac_time VALUES ('99', '1', '99', '22:10:00', '22:14:00', '22:15:00');
INSERT INTO ac_time VALUES ('100', '1', '100', '22:15:00', '22:19:00', '22:20:00');
INSERT INTO ac_time VALUES ('101', '1', '101', '22:20:00', '22:24:00', '22:25:00');
INSERT INTO ac_time VALUES ('102', '1', '102', '22:25:00', '22:29:00', '22:30:00');
INSERT INTO ac_time VALUES ('103', '1', '103', '22:30:00', '22:34:00', '22:35:00');
INSERT INTO ac_time VALUES ('104', '1', '104', '22:35:00', '22:39:00', '22:40:00');
INSERT INTO ac_time VALUES ('105', '1', '105', '22:40:00', '22:44:00', '22:45:00');
INSERT INTO ac_time VALUES ('106', '1', '106', '22:45:00', '22:49:00', '22:50:00');
INSERT INTO ac_time VALUES ('107', '1', '107', '22:50:00', '22:54:00', '22:55:00');
INSERT INTO ac_time VALUES ('108', '1', '108', '22:55:00', '22:59:00', '23:00:00');
INSERT INTO ac_time VALUES ('109', '1', '109', '23:00:00', '23:04:00', '23:05:00');
INSERT INTO ac_time VALUES ('110', '1', '110', '23:05:00', '23:09:00', '23:10:00');
INSERT INTO ac_time VALUES ('111', '1', '111', '23:10:00', '23:14:00', '23:15:00');
INSERT INTO ac_time VALUES ('112', '1', '112', '23:15:00', '23:19:00', '23:20:00');
INSERT INTO ac_time VALUES ('113', '1', '113', '23:20:00', '23:24:00', '23:25:00');
INSERT INTO ac_time VALUES ('114', '1', '114', '23:25:00', '23:29:00', '23:30:00');
INSERT INTO ac_time VALUES ('115', '1', '115', '23:30:00', '23:34:00', '23:35:00');
INSERT INTO ac_time VALUES ('116', '1', '116', '23:35:00', '23:39:00', '23:40:00');
INSERT INTO ac_time VALUES ('117', '1', '117', '23:40:00', '23:44:00', '23:45:00');
INSERT INTO ac_time VALUES ('118', '1', '118', '23:45:00', '23:49:00', '23:50:00');
INSERT INTO ac_time VALUES ('119', '1', '119', '23:50:00', '23:54:00', '23:55:00');
INSERT INTO ac_time VALUES ('120', '1', '120', '23:55:00', '23:59:00', '00:00:00');
INSERT INTO ac_time VALUES ('162', '2', '1', '00:00:00', '09:07:00', '09:07:00');
INSERT INTO ac_time VALUES ('163', '2', '2', '00:00:00', '09:12:00', '09:12:00');
INSERT INTO ac_time VALUES ('164', '2', '3', '00:00:00', '09:17:00', '09:17:00');
INSERT INTO ac_time VALUES ('165', '2', '4', '00:00:00', '09:22:00', '09:22:00');
INSERT INTO ac_time VALUES ('166', '2', '5', '00:00:00', '09:27:00', '09:27:00');
INSERT INTO ac_time VALUES ('167', '2', '6', '00:00:00', '09:32:00', '09:32:00');
INSERT INTO ac_time VALUES ('168', '2', '7', '00:00:00', '09:37:00', '09:37:00');
INSERT INTO ac_time VALUES ('169', '2', '8', '00:00:00', '09:42:00', '09:42:00');
INSERT INTO ac_time VALUES ('170', '2', '9', '00:00:00', '09:47:00', '09:47:00');
INSERT INTO ac_time VALUES ('171', '2', '10', '00:00:00', '09:52:00', '09:52:00');
INSERT INTO ac_time VALUES ('172', '2', '11', '00:00:00', '09:57:00', '09:57:00');
INSERT INTO ac_time VALUES ('173', '2', '12', '00:00:00', '10:02:00', '10:02:00');
INSERT INTO ac_time VALUES ('174', '2', '13', '00:00:00', '10:07:00', '10:07:00');
INSERT INTO ac_time VALUES ('175', '2', '14', '00:00:00', '10:12:00', '10:12:00');
INSERT INTO ac_time VALUES ('176', '2', '15', '00:00:00', '10:17:00', '10:17:00');
INSERT INTO ac_time VALUES ('177', '2', '16', '00:00:00', '10:22:00', '10:22:00');
INSERT INTO ac_time VALUES ('178', '2', '17', '00:00:00', '10:27:00', '10:27:00');
INSERT INTO ac_time VALUES ('179', '2', '18', '00:00:00', '10:32:00', '10:32:00');
INSERT INTO ac_time VALUES ('180', '2', '19', '00:00:00', '10:37:00', '10:37:00');
INSERT INTO ac_time VALUES ('181', '2', '20', '00:00:00', '10:42:00', '10:42:00');
INSERT INTO ac_time VALUES ('182', '2', '21', '00:00:00', '10:47:00', '10:47:00');
INSERT INTO ac_time VALUES ('183', '2', '22', '00:00:00', '10:52:00', '10:52:00');
INSERT INTO ac_time VALUES ('184', '2', '23', '00:00:00', '10:57:00', '10:57:00');
INSERT INTO ac_time VALUES ('185', '2', '24', '00:00:00', '11:02:00', '11:02:00');
INSERT INTO ac_time VALUES ('186', '2', '25', '00:00:00', '11:07:00', '11:07:00');
INSERT INTO ac_time VALUES ('187', '2', '26', '00:00:00', '11:12:00', '11:12:00');
INSERT INTO ac_time VALUES ('188', '2', '27', '00:00:00', '11:17:00', '11:17:00');
INSERT INTO ac_time VALUES ('189', '2', '28', '00:00:00', '11:22:00', '11:22:00');
INSERT INTO ac_time VALUES ('190', '2', '29', '00:00:00', '11:27:00', '11:27:00');
INSERT INTO ac_time VALUES ('191', '2', '30', '00:00:00', '11:32:00', '11:32:00');
INSERT INTO ac_time VALUES ('192', '2', '31', '00:00:00', '11:37:00', '11:37:00');
INSERT INTO ac_time VALUES ('193', '2', '32', '00:00:00', '11:42:00', '11:42:00');
INSERT INTO ac_time VALUES ('194', '2', '33', '00:00:00', '11:47:00', '11:47:00');
INSERT INTO ac_time VALUES ('195', '2', '34', '00:00:00', '11:52:00', '11:52:00');
INSERT INTO ac_time VALUES ('196', '2', '35', '00:00:00', '11:57:00', '11:57:00');
INSERT INTO ac_time VALUES ('197', '2', '36', '00:00:00', '12:02:00', '12:02:00');
INSERT INTO ac_time VALUES ('198', '2', '37', '00:00:00', '12:07:00', '12:07:00');
INSERT INTO ac_time VALUES ('199', '2', '38', '00:00:00', '12:12:00', '12:12:00');
INSERT INTO ac_time VALUES ('200', '2', '39', '00:00:00', '12:17:00', '12:17:00');
INSERT INTO ac_time VALUES ('201', '2', '40', '00:00:00', '12:22:00', '12:22:00');
INSERT INTO ac_time VALUES ('202', '2', '41', '00:00:00', '12:27:00', '12:27:00');
INSERT INTO ac_time VALUES ('203', '2', '42', '00:00:00', '12:32:00', '12:32:00');
INSERT INTO ac_time VALUES ('204', '2', '43', '00:00:00', '12:37:00', '12:37:00');
INSERT INTO ac_time VALUES ('205', '2', '44', '00:00:00', '12:42:00', '12:42:00');
INSERT INTO ac_time VALUES ('206', '2', '45', '00:00:00', '12:47:00', '12:47:00');
INSERT INTO ac_time VALUES ('207', '2', '46', '00:00:00', '12:52:00', '12:52:00');
INSERT INTO ac_time VALUES ('208', '2', '47', '00:00:00', '12:57:00', '12:57:00');
INSERT INTO ac_time VALUES ('209', '2', '48', '00:00:00', '13:02:00', '13:02:00');
INSERT INTO ac_time VALUES ('210', '2', '49', '00:00:00', '13:07:00', '13:07:00');
INSERT INTO ac_time VALUES ('211', '2', '50', '00:00:00', '13:12:00', '13:12:00');
INSERT INTO ac_time VALUES ('212', '2', '51', '00:00:00', '13:17:00', '13:17:00');
INSERT INTO ac_time VALUES ('213', '2', '52', '00:00:00', '13:22:00', '13:22:00');
INSERT INTO ac_time VALUES ('214', '2', '53', '00:00:00', '13:27:00', '13:27:00');
INSERT INTO ac_time VALUES ('215', '2', '54', '00:00:00', '13:32:00', '13:32:00');
INSERT INTO ac_time VALUES ('216', '2', '55', '00:00:00', '13:37:00', '13:37:00');
INSERT INTO ac_time VALUES ('217', '2', '56', '00:00:00', '13:42:00', '13:42:00');
INSERT INTO ac_time VALUES ('218', '2', '57', '00:00:00', '13:47:00', '13:47:00');
INSERT INTO ac_time VALUES ('219', '2', '58', '00:00:00', '13:52:00', '13:52:00');
INSERT INTO ac_time VALUES ('220', '2', '59', '00:00:00', '13:57:00', '13:57:00');
INSERT INTO ac_time VALUES ('221', '2', '60', '00:00:00', '14:02:00', '14:02:00');
INSERT INTO ac_time VALUES ('222', '2', '61', '00:00:00', '14:07:00', '14:07:00');
INSERT INTO ac_time VALUES ('223', '2', '62', '00:00:00', '14:12:00', '14:12:00');
INSERT INTO ac_time VALUES ('224', '2', '63', '00:00:00', '14:17:00', '14:17:00');
INSERT INTO ac_time VALUES ('225', '2', '64', '00:00:00', '14:22:00', '14:22:00');
INSERT INTO ac_time VALUES ('226', '2', '65', '00:00:00', '14:27:00', '14:27:00');
INSERT INTO ac_time VALUES ('227', '2', '66', '00:00:00', '14:32:00', '14:32:00');
INSERT INTO ac_time VALUES ('228', '2', '67', '00:00:00', '14:37:00', '14:37:00');
INSERT INTO ac_time VALUES ('229', '2', '68', '00:00:00', '14:42:00', '14:42:00');
INSERT INTO ac_time VALUES ('230', '2', '69', '00:00:00', '14:47:00', '14:47:00');
INSERT INTO ac_time VALUES ('231', '2', '70', '00:00:00', '14:52:00', '14:52:00');
INSERT INTO ac_time VALUES ('232', '2', '71', '00:00:00', '14:57:00', '14:57:00');
INSERT INTO ac_time VALUES ('233', '2', '72', '00:00:00', '15:02:00', '15:02:00');
INSERT INTO ac_time VALUES ('234', '2', '73', '00:00:00', '15:07:00', '15:07:00');
INSERT INTO ac_time VALUES ('235', '2', '74', '00:00:00', '15:12:00', '15:12:00');
INSERT INTO ac_time VALUES ('236', '2', '75', '00:00:00', '15:17:00', '15:17:00');
INSERT INTO ac_time VALUES ('237', '2', '76', '00:00:00', '15:22:00', '15:22:00');
INSERT INTO ac_time VALUES ('238', '2', '77', '00:00:00', '15:27:00', '15:27:00');
INSERT INTO ac_time VALUES ('239', '2', '78', '00:00:00', '15:32:00', '15:32:00');
INSERT INTO ac_time VALUES ('240', '2', '79', '00:00:00', '15:37:00', '15:37:00');
INSERT INTO ac_time VALUES ('241', '2', '80', '00:00:00', '15:42:00', '15:42:00');
INSERT INTO ac_time VALUES ('242', '2', '81', '00:00:00', '15:47:00', '15:47:00');
INSERT INTO ac_time VALUES ('243', '2', '82', '00:00:00', '15:52:00', '15:52:00');
INSERT INTO ac_time VALUES ('244', '2', '83', '00:00:00', '15:57:00', '15:57:00');
INSERT INTO ac_time VALUES ('245', '2', '84', '00:00:00', '16:02:00', '16:02:00');
INSERT INTO ac_time VALUES ('246', '2', '85', '00:00:00', '16:07:00', '16:07:00');
INSERT INTO ac_time VALUES ('247', '2', '86', '00:00:00', '16:12:00', '16:12:00');
INSERT INTO ac_time VALUES ('248', '2', '87', '00:00:00', '16:17:00', '16:17:00');
INSERT INTO ac_time VALUES ('249', '2', '88', '00:00:00', '16:22:00', '16:22:00');
INSERT INTO ac_time VALUES ('250', '2', '89', '00:00:00', '16:27:00', '16:27:00');
INSERT INTO ac_time VALUES ('251', '2', '90', '00:00:00', '16:32:00', '16:32:00');
INSERT INTO ac_time VALUES ('252', '2', '91', '00:00:00', '16:37:00', '16:37:00');
INSERT INTO ac_time VALUES ('253', '2', '92', '00:00:00', '16:42:00', '16:42:00');
INSERT INTO ac_time VALUES ('254', '2', '93', '00:00:00', '16:47:00', '16:47:00');
INSERT INTO ac_time VALUES ('255', '2', '94', '00:00:00', '16:52:00', '16:52:00');
INSERT INTO ac_time VALUES ('256', '2', '95', '00:00:00', '16:57:00', '16:57:00');
INSERT INTO ac_time VALUES ('257', '2', '96', '00:00:00', '17:02:00', '17:02:00');
INSERT INTO ac_time VALUES ('258', '2', '97', '00:00:00', '17:07:00', '17:07:00');
INSERT INTO ac_time VALUES ('259', '2', '98', '00:00:00', '17:12:00', '17:12:00');
INSERT INTO ac_time VALUES ('260', '2', '99', '00:00:00', '17:17:00', '17:17:00');
INSERT INTO ac_time VALUES ('261', '2', '100', '00:00:00', '17:22:00', '17:22:00');
INSERT INTO ac_time VALUES ('262', '2', '101', '00:00:00', '17:27:00', '17:27:00');
INSERT INTO ac_time VALUES ('263', '2', '102', '00:00:00', '17:32:00', '17:32:00');
INSERT INTO ac_time VALUES ('264', '2', '103', '00:00:00', '17:37:00', '17:37:00');
INSERT INTO ac_time VALUES ('265', '2', '104', '00:00:00', '17:42:00', '17:42:00');
INSERT INTO ac_time VALUES ('266', '2', '105', '00:00:00', '17:47:00', '17:47:00');
INSERT INTO ac_time VALUES ('267', '2', '106', '00:00:00', '17:52:00', '17:52:00');
INSERT INTO ac_time VALUES ('268', '2', '107', '00:00:00', '17:57:00', '17:57:00');
INSERT INTO ac_time VALUES ('269', '2', '108', '00:00:00', '18:02:00', '18:02:00');
INSERT INTO ac_time VALUES ('270', '2', '109', '00:00:00', '18:07:00', '18:07:00');
INSERT INTO ac_time VALUES ('271', '2', '110', '00:00:00', '18:12:00', '18:12:00');
INSERT INTO ac_time VALUES ('272', '2', '111', '00:00:00', '18:17:00', '18:17:00');
INSERT INTO ac_time VALUES ('273', '2', '112', '00:00:00', '18:22:00', '18:22:00');
INSERT INTO ac_time VALUES ('274', '2', '113', '00:00:00', '18:27:00', '18:27:00');
INSERT INTO ac_time VALUES ('275', '2', '114', '00:00:00', '18:32:00', '18:32:00');
INSERT INTO ac_time VALUES ('276', '2', '115', '00:00:00', '18:37:00', '18:37:00');
INSERT INTO ac_time VALUES ('277', '2', '116', '00:00:00', '18:42:00', '18:42:00');
INSERT INTO ac_time VALUES ('278', '2', '117', '00:00:00', '18:47:00', '18:47:00');
INSERT INTO ac_time VALUES ('279', '2', '118', '00:00:00', '18:52:00', '18:52:00');
INSERT INTO ac_time VALUES ('280', '2', '119', '00:00:00', '18:57:00', '18:57:00');
INSERT INTO ac_time VALUES ('281', '2', '120', '00:00:00', '19:02:00', '19:02:00');
INSERT INTO ac_time VALUES ('282', '2', '121', '00:00:00', '19:07:00', '19:07:00');
INSERT INTO ac_time VALUES ('283', '2', '122', '00:00:00', '19:12:00', '19:12:00');
INSERT INTO ac_time VALUES ('284', '2', '123', '00:00:00', '19:17:00', '19:17:00');
INSERT INTO ac_time VALUES ('285', '2', '124', '00:00:00', '19:22:00', '19:22:00');
INSERT INTO ac_time VALUES ('286', '2', '125', '00:00:00', '19:27:00', '19:27:00');
INSERT INTO ac_time VALUES ('287', '2', '126', '00:00:00', '19:32:00', '19:32:00');
INSERT INTO ac_time VALUES ('288', '2', '127', '00:00:00', '19:37:00', '19:37:00');
INSERT INTO ac_time VALUES ('289', '2', '128', '00:00:00', '19:42:00', '19:42:00');
INSERT INTO ac_time VALUES ('290', '2', '129', '00:00:00', '19:47:00', '19:47:00');
INSERT INTO ac_time VALUES ('291', '2', '130', '00:00:00', '19:52:00', '19:52:00');
INSERT INTO ac_time VALUES ('292', '2', '131', '00:00:00', '19:57:00', '19:57:00');
INSERT INTO ac_time VALUES ('293', '2', '132', '00:00:00', '20:02:00', '20:02:00');
INSERT INTO ac_time VALUES ('294', '2', '133', '00:00:00', '20:07:00', '20:07:00');
INSERT INTO ac_time VALUES ('295', '2', '134', '00:00:00', '20:12:00', '20:12:00');
INSERT INTO ac_time VALUES ('296', '2', '135', '00:00:00', '20:17:00', '20:17:00');
INSERT INTO ac_time VALUES ('297', '2', '136', '00:00:00', '20:22:00', '20:22:00');
INSERT INTO ac_time VALUES ('298', '2', '137', '00:00:00', '20:27:00', '20:27:00');
INSERT INTO ac_time VALUES ('299', '2', '138', '00:00:00', '20:32:00', '20:32:00');
INSERT INTO ac_time VALUES ('300', '2', '139', '00:00:00', '20:37:00', '20:37:00');
INSERT INTO ac_time VALUES ('301', '2', '140', '00:00:00', '20:42:00', '20:42:00');
INSERT INTO ac_time VALUES ('302', '2', '141', '00:00:00', '20:47:00', '20:47:00');
INSERT INTO ac_time VALUES ('303', '2', '142', '00:00:00', '20:52:00', '20:52:00');
INSERT INTO ac_time VALUES ('304', '2', '143', '00:00:00', '20:57:00', '20:57:00');
INSERT INTO ac_time VALUES ('305', '2', '144', '00:00:00', '21:02:00', '21:02:00');
INSERT INTO ac_time VALUES ('306', '2', '145', '00:00:00', '21:07:00', '21:07:00');
INSERT INTO ac_time VALUES ('307', '2', '146', '00:00:00', '21:12:00', '21:12:00');
INSERT INTO ac_time VALUES ('308', '2', '147', '00:00:00', '21:17:00', '21:17:00');
INSERT INTO ac_time VALUES ('309', '2', '148', '00:00:00', '21:22:00', '21:22:00');
INSERT INTO ac_time VALUES ('310', '2', '149', '00:00:00', '21:27:00', '21:27:00');
INSERT INTO ac_time VALUES ('311', '2', '150', '00:00:00', '21:32:00', '21:32:00');
INSERT INTO ac_time VALUES ('312', '2', '151', '00:00:00', '21:37:00', '21:37:00');
INSERT INTO ac_time VALUES ('313', '2', '152', '00:00:00', '21:42:00', '21:42:00');
INSERT INTO ac_time VALUES ('314', '2', '153', '00:00:00', '21:47:00', '21:47:00');
INSERT INTO ac_time VALUES ('315', '2', '154', '00:00:00', '21:52:00', '21:52:00');
INSERT INTO ac_time VALUES ('316', '2', '155', '00:00:00', '21:57:00', '21:57:00');
INSERT INTO ac_time VALUES ('317', '2', '156', '00:00:00', '22:02:00', '22:02:00');
INSERT INTO ac_time VALUES ('318', '2', '157', '00:00:00', '22:07:00', '22:07:00');
INSERT INTO ac_time VALUES ('319', '2', '158', '00:00:00', '22:12:00', '22:12:00');
INSERT INTO ac_time VALUES ('320', '2', '159', '00:00:00', '22:17:00', '22:17:00');
INSERT INTO ac_time VALUES ('321', '2', '160', '00:00:00', '22:22:00', '22:22:00');
INSERT INTO ac_time VALUES ('322', '2', '161', '00:00:00', '22:27:00', '22:27:00');
INSERT INTO ac_time VALUES ('323', '2', '162', '00:00:00', '22:32:00', '22:32:00');
INSERT INTO ac_time VALUES ('324', '2', '163', '00:00:00', '22:37:00', '22:37:00');
INSERT INTO ac_time VALUES ('325', '2', '164', '00:00:00', '22:42:00', '22:42:00');
INSERT INTO ac_time VALUES ('326', '2', '165', '00:00:00', '22:47:00', '22:47:00');
INSERT INTO ac_time VALUES ('327', '2', '166', '00:00:00', '22:52:00', '22:52:00');
INSERT INTO ac_time VALUES ('328', '2', '167', '00:00:00', '22:57:00', '22:57:00');
INSERT INTO ac_time VALUES ('329', '2', '168', '00:00:00', '23:02:00', '23:02:00');
INSERT INTO ac_time VALUES ('330', '2', '169', '00:00:00', '23:07:00', '23:07:00');
INSERT INTO ac_time VALUES ('331', '2', '170', '00:00:00', '23:12:00', '23:12:00');
INSERT INTO ac_time VALUES ('332', '2', '171', '00:00:00', '23:17:00', '23:17:00');
INSERT INTO ac_time VALUES ('333', '2', '172', '00:00:00', '23:22:00', '23:22:00');
INSERT INTO ac_time VALUES ('334', '2', '173', '00:00:00', '23:27:00', '23:27:00');
INSERT INTO ac_time VALUES ('335', '2', '174', '00:00:00', '23:32:00', '23:32:00');
INSERT INTO ac_time VALUES ('336', '2', '175', '00:00:00', '23:37:00', '23:37:00');
INSERT INTO ac_time VALUES ('337', '2', '176', '00:00:00', '23:42:00', '23:42:00');
INSERT INTO ac_time VALUES ('338', '2', '177', '00:00:00', '23:47:00', '23:47:00');
INSERT INTO ac_time VALUES ('339', '2', '178', '00:00:00', '23:52:00', '23:52:00');
INSERT INTO ac_time VALUES ('340', '2', '179', '00:00:00', '23:57:00', '23:57:00');
INSERT INTO ac_time VALUES ('374', '3', '1', '00:00:00', '09:10:00', '09:10:00');
INSERT INTO ac_time VALUES ('375', '3', '2', '00:00:00', '09:20:00', '09:20:00');
INSERT INTO ac_time VALUES ('376', '3', '3', '00:00:00', '09:30:00', '09:30:00');
INSERT INTO ac_time VALUES ('377', '3', '4', '00:00:00', '09:40:00', '09:40:00');
INSERT INTO ac_time VALUES ('378', '3', '5', '00:00:00', '09:50:00', '09:50:00');
INSERT INTO ac_time VALUES ('379', '3', '6', '00:00:00', '10:00:00', '10:00:00');
INSERT INTO ac_time VALUES ('380', '3', '7', '00:00:00', '10:10:00', '10:10:00');
INSERT INTO ac_time VALUES ('381', '3', '8', '00:00:00', '10:20:00', '10:20:00');
INSERT INTO ac_time VALUES ('382', '3', '9', '00:00:00', '10:30:00', '10:30:00');
INSERT INTO ac_time VALUES ('383', '3', '10', '00:00:00', '10:40:00', '10:40:00');
INSERT INTO ac_time VALUES ('384', '3', '11', '00:00:00', '10:50:00', '10:50:00');
INSERT INTO ac_time VALUES ('385', '3', '12', '00:00:00', '11:00:00', '11:00:00');
INSERT INTO ac_time VALUES ('386', '3', '13', '00:00:00', '11:10:00', '11:10:00');
INSERT INTO ac_time VALUES ('387', '3', '14', '00:00:00', '11:20:00', '11:20:00');
INSERT INTO ac_time VALUES ('388', '3', '15', '00:00:00', '11:30:00', '11:30:00');
INSERT INTO ac_time VALUES ('389', '3', '16', '00:00:00', '11:40:00', '11:40:00');
INSERT INTO ac_time VALUES ('390', '3', '17', '00:00:00', '11:50:00', '11:50:00');
INSERT INTO ac_time VALUES ('391', '3', '18', '00:00:00', '12:00:00', '12:00:00');
INSERT INTO ac_time VALUES ('392', '3', '19', '00:00:00', '12:10:00', '12:10:00');
INSERT INTO ac_time VALUES ('393', '3', '20', '00:00:00', '12:20:00', '12:20:00');
INSERT INTO ac_time VALUES ('394', '3', '21', '00:00:00', '12:30:00', '12:30:00');
INSERT INTO ac_time VALUES ('395', '3', '22', '00:00:00', '12:40:00', '12:40:00');
INSERT INTO ac_time VALUES ('396', '3', '23', '00:00:00', '12:50:00', '12:50:00');
INSERT INTO ac_time VALUES ('397', '3', '24', '00:00:00', '13:00:00', '13:00:00');
INSERT INTO ac_time VALUES ('398', '3', '25', '00:00:00', '13:10:00', '13:10:00');
INSERT INTO ac_time VALUES ('399', '3', '26', '00:00:00', '13:20:00', '13:20:00');
INSERT INTO ac_time VALUES ('400', '3', '27', '00:00:00', '13:30:00', '13:30:00');
INSERT INTO ac_time VALUES ('401', '3', '28', '00:00:00', '13:40:00', '13:40:00');
INSERT INTO ac_time VALUES ('402', '3', '29', '00:00:00', '13:50:00', '13:50:00');
INSERT INTO ac_time VALUES ('403', '3', '30', '00:00:00', '14:00:00', '14:00:00');
INSERT INTO ac_time VALUES ('404', '3', '31', '00:00:00', '14:10:00', '14:10:00');
INSERT INTO ac_time VALUES ('405', '3', '32', '00:00:00', '14:20:00', '14:20:00');
INSERT INTO ac_time VALUES ('406', '3', '33', '00:00:00', '14:30:00', '14:30:00');
INSERT INTO ac_time VALUES ('407', '3', '34', '00:00:00', '14:40:00', '14:40:00');
INSERT INTO ac_time VALUES ('408', '3', '35', '00:00:00', '14:50:00', '14:50:00');
INSERT INTO ac_time VALUES ('409', '3', '36', '00:00:00', '15:00:00', '15:00:00');
INSERT INTO ac_time VALUES ('410', '3', '37', '00:00:00', '15:10:00', '15:10:00');
INSERT INTO ac_time VALUES ('411', '3', '38', '00:00:00', '15:20:00', '15:20:00');
INSERT INTO ac_time VALUES ('412', '3', '39', '00:00:00', '15:30:00', '15:30:00');
INSERT INTO ac_time VALUES ('413', '3', '40', '00:00:00', '15:40:00', '15:40:00');
INSERT INTO ac_time VALUES ('414', '3', '41', '00:00:00', '15:50:00', '15:50:00');
INSERT INTO ac_time VALUES ('415', '3', '42', '00:00:00', '16:00:00', '16:00:00');
INSERT INTO ac_time VALUES ('416', '3', '43', '00:00:00', '16:10:00', '16:10:00');
INSERT INTO ac_time VALUES ('417', '3', '44', '00:00:00', '16:20:00', '16:20:00');
INSERT INTO ac_time VALUES ('418', '3', '45', '00:00:00', '16:30:00', '16:30:00');
INSERT INTO ac_time VALUES ('419', '3', '46', '00:00:00', '16:40:00', '16:40:00');
INSERT INTO ac_time VALUES ('420', '3', '47', '00:00:00', '16:50:00', '16:50:00');
INSERT INTO ac_time VALUES ('421', '3', '48', '00:00:00', '17:00:00', '17:00:00');
INSERT INTO ac_time VALUES ('422', '3', '49', '00:00:00', '17:10:00', '17:10:00');
INSERT INTO ac_time VALUES ('423', '3', '50', '00:00:00', '17:20:00', '17:20:00');
INSERT INTO ac_time VALUES ('424', '3', '51', '00:00:00', '17:30:00', '17:30:00');
INSERT INTO ac_time VALUES ('425', '3', '52', '00:00:00', '17:40:00', '17:40:00');
INSERT INTO ac_time VALUES ('426', '3', '53', '00:00:00', '17:50:00', '17:50:00');
INSERT INTO ac_time VALUES ('427', '3', '54', '00:00:00', '18:00:00', '18:00:00');
INSERT INTO ac_time VALUES ('428', '3', '55', '00:00:00', '18:10:00', '18:10:00');
INSERT INTO ac_time VALUES ('429', '3', '56', '00:00:00', '18:20:00', '18:20:00');
INSERT INTO ac_time VALUES ('430', '3', '57', '00:00:00', '18:30:00', '18:30:00');
INSERT INTO ac_time VALUES ('431', '3', '58', '00:00:00', '18:40:00', '18:40:00');
INSERT INTO ac_time VALUES ('432', '3', '59', '00:00:00', '18:50:00', '18:50:00');
INSERT INTO ac_time VALUES ('433', '3', '60', '00:00:00', '19:00:00', '19:00:00');
INSERT INTO ac_time VALUES ('434', '3', '61', '00:00:00', '19:10:00', '19:10:00');
INSERT INTO ac_time VALUES ('435', '3', '62', '00:00:00', '19:20:00', '19:20:00');
INSERT INTO ac_time VALUES ('436', '3', '63', '00:00:00', '19:30:00', '19:30:00');
INSERT INTO ac_time VALUES ('437', '3', '64', '00:00:00', '19:40:00', '19:40:00');
INSERT INTO ac_time VALUES ('438', '3', '65', '00:00:00', '19:50:00', '19:50:00');
INSERT INTO ac_time VALUES ('439', '3', '66', '00:00:00', '20:00:00', '20:00:00');
INSERT INTO ac_time VALUES ('440', '3', '67', '00:00:00', '20:10:00', '20:10:00');
INSERT INTO ac_time VALUES ('441', '3', '68', '00:00:00', '20:20:00', '20:20:00');
INSERT INTO ac_time VALUES ('442', '3', '69', '00:00:00', '20:30:00', '20:30:00');
INSERT INTO ac_time VALUES ('443', '3', '70', '00:00:00', '20:40:00', '20:40:00');
INSERT INTO ac_time VALUES ('444', '3', '71', '00:00:00', '20:50:00', '20:50:00');
INSERT INTO ac_time VALUES ('445', '3', '72', '00:00:00', '21:00:00', '21:00:00');
INSERT INTO ac_time VALUES ('446', '3', '73', '00:00:00', '21:10:00', '21:10:00');
INSERT INTO ac_time VALUES ('447', '3', '74', '00:00:00', '21:20:00', '21:20:00');
INSERT INTO ac_time VALUES ('448', '3', '75', '00:00:00', '21:30:00', '21:30:00');
INSERT INTO ac_time VALUES ('449', '3', '76', '00:00:00', '21:40:00', '21:40:00');
INSERT INTO ac_time VALUES ('450', '3', '77', '00:00:00', '21:50:00', '21:50:00');
INSERT INTO ac_time VALUES ('451', '3', '78', '00:00:00', '22:00:00', '22:00:00');
INSERT INTO ac_time VALUES ('452', '3', '79', '00:00:00', '22:10:00', '22:10:00');
INSERT INTO ac_time VALUES ('453', '3', '80', '00:00:00', '22:20:00', '22:20:00');
INSERT INTO ac_time VALUES ('454', '3', '81', '00:00:00', '22:30:00', '22:30:00');
INSERT INTO ac_time VALUES ('455', '3', '82', '00:00:00', '22:40:00', '22:40:00');
INSERT INTO ac_time VALUES ('456', '3', '83', '00:00:00', '22:50:00', '22:50:00');
INSERT INTO ac_time VALUES ('457', '3', '84', '00:00:00', '23:00:00', '23:00:00');
INSERT INTO ac_time VALUES ('570', '4', '1', '00:00:00', '20:30:00', '20:30:00');
INSERT INTO ac_time VALUES ('591', '5', '1', '00:00:00', '20:30:00', '20:30:00');

-- ----------------------------
-- Table structure for `ac_type`
-- ----------------------------
DROP TABLE IF EXISTS `ac_type`;
CREATE TABLE `ac_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '彩种类型',
  `name` varchar(32) NOT NULL COMMENT '表名',
  `code_list` varchar(1024) NOT NULL DEFAULT '0,1,2,3,4,5,6,7,8,9' COMMENT '彩票可选号码列表，用半角逗号分隔',
  `title` varchar(64) NOT NULL COMMENT '名称',
  `info` varchar(255) NOT NULL COMMENT '介绍',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `data_ftime` tinyint(3) NOT NULL DEFAULT '0' COMMENT '时间误差',
  `get_number_func` varchar(64) NOT NULL COMMENT '请求当前期号时后置事件函数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 正常 0 暂停',
  `list_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='彩种';

-- ----------------------------
-- Records of ac_type
-- ----------------------------
INSERT INTO ac_type VALUES ('1', '1', 'ssccq', '0,1,2,3,4,5,6,7,8,9', '重庆时时彩', '', 'business/20180625/03f8e287667339c60ccadeaf94b8ca4b.png', '30', 'noHdCQSSC', '1', '10');
INSERT INTO ac_type VALUES ('2', '2', 'pk10bj', '01,02,03,04,05,06,07,08,09,10', '北京赛车PK10', '', 'business/20180625/ec42a91d2f1b5e76fab6613f194f5a9c.png', '30', 'BJpk10', '1', '9');
INSERT INTO ac_type VALUES ('3', '3', 'syxwgd', '01,02,03,04,05,06,07,08,09,10,11', '广东11选5', '', 'business/20180625/d51f5f59038198e53b7101af2e167f9d.png', '30', 'no0Hd', '1', '8');
INSERT INTO ac_type VALUES ('4', '4', 'fc3d', '0,1,2,3,4,5,6,7,8,9', '福彩3D', '', 'business/20180625/06937117ba79dbdccf5d6b66863c2728.png', '30', 'pai3', '1', '7');
INSERT INTO ac_type VALUES ('5', '4', 'pl3', '0,1,2,3,4,5,6,7,8,9', '排列3', '', 'business/20180625/0ff5e711ade547fc3491c676d49c63d0.png', '30', 'pai3', '1', '6');
INSERT INTO ac_type VALUES ('6', '6', 'xy28pc', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24', 'PC蛋蛋幸运28', '', '', '30', '', '0', '5');
INSERT INTO ac_type VALUES ('7', '7', 'lhc', '01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49', '香港六合彩', '', 'business/20180714/ea55bbaf83461bd44a01839b0adbb52f.png', '30', 'no6Hd', '1', '4');

-- ----------------------------
-- Table structure for `ac_user`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ac_user
-- ----------------------------
INSERT INTO ac_user VALUES ('1', '1', '0', '0', '1531969355', '2', '2', '0.00', '1521441479', '1', 'admin', '###8ad7dda2b88ac440f11a3052d20c9da4', 'admin', '89252922@qq.com', '', '', '', '127.0.0.1', '', '', null);
INSERT INTO ac_user VALUES ('2', '2', '1', '0', '1531579037', '8', '8', '0.00', '1530208141', '1', '18695601286', '###b2d4da209192b97a8965b0bc637382d9', '哈哈', '', '', 'avatar/20180714/5b4a0afacd9a5.jpg', '我爱你中国，中国万岁！', '220.249.163.71', '', '', null);

-- ----------------------------
-- Table structure for `ac_user_action`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_action`;
CREATE TABLE `ac_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户操作表';

-- ----------------------------
-- Records of ac_user_action
-- ----------------------------
INSERT INTO ac_user_action VALUES ('1', '1', '1', '1', '2', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for `ac_user_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_action_log`;
CREATE TABLE `ac_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of ac_user_action_log
-- ----------------------------
INSERT INTO ac_user_action_log VALUES ('1', '1', '1', '1521512073', 'posts1', 'portal/Article/dolike', '127.0.0.1');

-- ----------------------------
-- Table structure for `ac_user_balance_log`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_balance_log`;
CREATE TABLE `ac_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户余额变更日志表';

-- ----------------------------
-- Records of ac_user_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_user_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_favorite`;
CREATE TABLE `ac_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of ac_user_favorite
-- ----------------------------
INSERT INTO ac_user_favorite VALUES ('81', '2', '广东11选5走势图表', '/public/index.php/mobile/business/zst/id/3.html', '', 'type', '3', '1531580228');
INSERT INTO ac_user_favorite VALUES ('82', '2', '广东11选5追号计划', '/public/index.php/mobile/business/plan/id/3.html', '', 'type', '3', '1531580234');
INSERT INTO ac_user_favorite VALUES ('83', '2', '福彩3D追号计划', '/public/index.php/mobile/business/plan/id/4.html', '', 'type', '4', '1531580281');
INSERT INTO ac_user_favorite VALUES ('84', '2', '排列3走势图表', '/public/index.php/mobile/business/zst/id/5.html', '', 'type', '5', '1531580286');
INSERT INTO ac_user_favorite VALUES ('85', '2', '福彩3D玩法技巧', '/public/index.php/mobile/business/article/id/4.html', '', 'type', '4', '1531580516');

-- ----------------------------
-- Table structure for `ac_user_login_attempt`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_login_attempt`;
CREATE TABLE `ac_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of ac_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_user_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_score_log`;
CREATE TABLE `ac_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of ac_user_score_log
-- ----------------------------
INSERT INTO ac_user_score_log VALUES ('1', '1', '1521511799', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('2', '1', '1522118253', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('3', '2', '1530243725', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('4', '2', '1530266407', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('5', '2', '1530331143', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('6', '2', '1530378988', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('7', '2', '1530424902', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('8', '2', '1530437099', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('9', '2', '1530629040', 'login', '1', '1');
INSERT INTO ac_user_score_log VALUES ('10', '2', '1531579037', 'login', '1', '1');

-- ----------------------------
-- Table structure for `ac_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_token`;
CREATE TABLE `ac_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of ac_user_token
-- ----------------------------
INSERT INTO ac_user_token VALUES ('1', '1', '1536993508', '1521441508', '87474e2a364ca57fad21a85bbbdd730487474e2a364ca57fad21a85bbbdd7304', 'web');
INSERT INTO ac_user_token VALUES ('2', '2', '1545760141', '1530208141', 'b114aa90371c53fdcfb6fac1d82cf5b28846ee270e6ce3b423aad4d9236ade66', 'web');

-- ----------------------------
-- Table structure for `ac_verification_code`
-- ----------------------------
DROP TABLE IF EXISTS `ac_verification_code`;
CREATE TABLE `ac_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of ac_verification_code
-- ----------------------------

-- ----------------------------
-- Procedure structure for `kanJiang`
-- ----------------------------
DROP PROCEDURE IF EXISTS `kanJiang`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kanJiang`(_table varchar(255) character set utf8, _planId int, _zjCount int, _number varchar(255) character set utf8, _toNumber varchar(255) character set utf8,  _kjData varchar(255) character set utf8, _kset varchar(255) character set utf8)
begin
		
	start transaction;

	if md5(_kset)='0209fd6eb5a00aefb15d4b4406c1f9b1' then	
		
		if _zjCount=1 then	

			set @tbl_name = CONCAT('ac_plan_', _table);
			set @statement = CONCAT("update ", @tbl_name ," SET number='", _number ,"',kj_data='", _kjData ,"',flag=1 WHERE id =", _planId);
			prepare stmt FROM @statement;
			execute stmt;

		elseif _number=_toNumber then
			
			set @tbl_name = CONCAT('ac_plan_', _table);
			set @statement = CONCAT("update ", @tbl_name ," SET flag=2 WHERE id =", _planId);
			prepare stmt FROM @statement;
			execute stmt;

		end if;

	end if;
	
	commit;
	
end
;;
DELIMITER ;
