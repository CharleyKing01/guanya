/*
2018.01.11
*/
-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  `address` varchar(255) DEFAULT NULL COMMENT '地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `level` int(11) DEFAULT NULL COMMENT '部门级别',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级部门ID',
  `type` varchar(100) DEFAULT NULL COMMENT '部门类型',
  `company_id` int(11) DEFAULT NULL COMMENT '公司编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门名称',
  `company_id` int(11) DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for recruitment
-- ----------------------------
DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(11) DEFAULT NULL COMMENT '招聘职位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属部',
  `workability` varchar(255) DEFAULT NULL COMMENT '工作性',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `education` varchar(20) DEFAULT NULL COMMENT '所需文化',
  `age` int(11) DEFAULT NULL COMMENT '所需年龄',
  `address` varchar(255) DEFAULT NULL COMMENT '工作地点',
  `experience` varchar(20) DEFAULT NULL COMMENT '工作经验',
  `pulish_user` varchar(255) DEFAULT NULL COMMENT '发布人',
  `pulish_time` datetime DEFAULT NULL COMMENT '发布日期',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_user` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruitment
-- ----------------------------

-- ----------------------------
-- Table structure for resume_application
-- ----------------------------
DROP TABLE IF EXISTS `resume_application`;
CREATE TABLE `resume_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
  `company_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL COMMENT '部门编号',
  `role_id` int(11) DEFAULT NULL COMMENT '岗位编号',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `sex` char(10) DEFAULT NULL COMMENT '性别',
  `born_year` int(11) DEFAULT NULL COMMENT '出生年',
  `born_month` int(11) DEFAULT NULL COMMENT '出生月',
  `born_day` int(11) DEFAULT NULL COMMENT '出生日',
  `e_mail` varchar(100) DEFAULT NULL COMMENT 'E-mail',
  `education` varchar(100) DEFAULT NULL COMMENT '学历',
  `profession` varchar(100) DEFAULT NULL COMMENT '专业',
  `work_years` int(11) DEFAULT NULL COMMENT '工作年限',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `description` varchar(800) DEFAULT NULL COMMENT '个人简历描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume_application
-- ----------------------------
