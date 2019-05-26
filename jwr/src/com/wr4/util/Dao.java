package com.wr4.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wr4.domain.FileItem;

public class Dao  
{  public static void createInidc1(){
	
	StringBuilder ss= new StringBuilder();
	ss.append("[{'_id':'4fba0d3ab9207ef62d2a3939','i':1,'name':'一、安全目标35分','type2':11},{'_id':'4fba0d3ab9207ef62d2a393a','i':2,'name':'二、管理机构和人员40分','type2':11},{'_id':'4fba0d3ab9207ef62d2a393b','i':3,'name':'三、安全责任体系45分','type2':11},{'_id':'4fba0d3ab9207ef62d2a393c','i':4,'name':'四、法规和安全管理制度70分','type2':11},{'_id':'4fba0d3ab9207ef62d2a393d','i':5,'name':'五、安全投入50分','type2':11},{'_id':'4fba0d3ab9207ef62d2a393e','i':6,'name':'六、装备设施75分','type2':11},{'_id':'4fba0d3ab9207ef62d2a393f','i':7,'name':'七、科技创新与信息化100分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3940','i':8,'name':'八、队伍建设90分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3941','i':9,'name':'九、作业管理155分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3942','i':10,'name':'十、危险源辩识与风险控制40分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3943','i':11,'name':'十一、隐患排查与治理70分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3944','i':12,'name':'十二、职业健康25分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3945','i':13,'name':'十三、安全文化35分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3946','i':14,'name':'十四、应急救援85分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3947','i':15,'name':'十五、事故报告调查处理50分','type2':11},{'_id':'4fba0d3ab9207ef62d2a3948','i':16,'name':'十六、绩效考评与持续改进35分','type2':11},{'_id':'4fba5f13b9207ef62d2a39fa','i':1,'name':'一、安全目标35分','type2':12},{'_id':'4fba5f13b9207ef62d2a39fb','i':2,'name':'二、管理机构和人员40分','type2':12},{'_id':'4fba5f13b9207ef62d2a39fc','i':3,'name':'三、安全责任体系45分','type2':12},{'_id':'4fba5f13b9207ef62d2a39fd','i':4,'name':'四、法规和安全管理制度70分','type2':12},{'_id':'4fba5f13b9207ef62d2a39fe','i':5,'name':'五、安全投入50分','type2':12},{'_id':'4fba5f13b9207ef62d2a39ff','i':6,'name':'六、装备设施85分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a00','i':7,'name':'七、科技创新与信息化70分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a01','i':8,'name':'八、队伍建设90分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a02','i':9,'name':'九、作业管理170分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a03','i':10,'name':'十、危险源辩识与风险控制45分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a04','i':11,'name':'十一、隐患排查与治理70分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a05','i':12,'name':'十二、职业健康25分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a06','i':13,'name':'十三、安全文化35分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a07','i':14,'name':'十四、应急救援85分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a08','i':15,'name':'十五、事故报告调查处理50分','type2':12},{'_id':'4fba5f13b9207ef62d2a3a09','i':16,'name':'十六、绩效考评与持续改进35分','type2':12},{'_id':'4fba6155b9207ef62d2a3ae2','i':1,'name':'一、安全目标35分','type2':13},{'_id':'4fba6155b9207ef62d2a3ae3','i':2,'name':'二、管理机构和人员40分','type2':13},{'_id':'4fba6155b9207ef62d2a3ae4','i':3,'name':'三、安全责任体系45分','type2':13},{'_id':'4fba6155b9207ef62d2a3ae5','i':4,'name':'四、法规和安全管理制度70分','type2':13},{'_id':'4fba6155b9207ef62d2a3ae6','i':5,'name':'五、安全投入50分','type2':13},{'_id':'4fba6155b9207ef62d2a3ae7','i':6,'name':'六、装备设施90分','type2':13},{'_id':'4fba6155b9207ef62d2a3ae8','i':7,'name':'七、科技创新与信息化50分','type2':13},{'_id':'4fba6155b9207ef62d2a3ae9','i':8,'name':'八、队伍建设90分','type2':13},{'_id':'4fba6155b9207ef62d2a3aea','i':9,'name':'九、作业管理200分','type2':13},{'_id':'4fba6155b9207ef62d2a3aeb','i':10,'name':'十、危险源辩识与风险控制35分','type2':13},{'_id':'4fba6155b9207ef62d2a3aec','i':11,'name':'十一、隐患排查与治理70分','type2':13},{'_id':'4fba6155b9207ef62d2a3aed','i':12,'name':'十二、职业健康20分','type2':13},{'_id':'4fba6155b9207ef62d2a3aee','i':13,'name':'十三、安全文化35分','type2':13},{'_id':'4fba6155b9207ef62d2a3aef','i':14,'name':'十四、应急救援85分','type2':13},{'_id':'4fba6155b9207ef62d2a3af0','i':15,'name':'十五、事故报告调查处理50分','type2':13},{'_id':'4fba6155b9207ef62d2a3af1','i':16,'name':'十六、绩效考核与持续改进35分','type2':13},{'_id':'4fba634eb9207ef62d2a3bf9','i':1,'name':'一、安全目标35分','type2':14},{'_id':'4fba634eb9207ef62d2a3bfa','i':2,'name':'二、管理机构和人员35分','type2':14},{'_id':'4fba634eb9207ef62d2a3bfb','i':3,'name':'三、安全责任体系45分','type2':14},{'_id':'4fba634eb9207ef62d2a3bfc','i':4,'name':'四、法规和安全管理制度70分','type2':14},{'_id':'4fba634eb9207ef62d2a3bfd','i':5,'name':'五、安全投入50分','type2':14},{'_id':'4fba634eb9207ef62d2a3bfe','i':6,'name':'六、装备设施85分','type2':14},{'_id':'4fba634eb9207ef62d2a3bff','i':7,'name':'七、科技创新与信息化65分','type2':14},{'_id':'4fba634eb9207ef62d2a3c00','i':8,'name':'八、队伍建设90分','type2':14},{'_id':'4fba634eb9207ef62d2a3c01','i':9,'name':'九、作业管理165分','type2':14},{'_id':'4fba634eb9207ef62d2a3c02','i':10,'name':'十、危险源辩识与风险控制50分','type2':14},{'_id':'4fba634eb9207ef62d2a3c03','i':11,'name':'十一、隐患排查与治理75分','type2':14},{'_id':'4fba634eb9207ef62d2a3c04','i':12,'name':'十二、职业健康30分','type2':14},{'_id':'4fba634eb9207ef62d2a3c05','i':13,'name':'十三、安全文化35分','type2':14},{'_id':'4fba634eb9207ef62d2a3c06','i':14,'name':'十四、应急救援85分','type2':14},{'_id':'4fba634eb9207ef62d2a3c07','i':15,'name':'十五、事故报告调查处理50分','type2':14},{'_id':'4fba634eb9207ef62d2a3c08','i':16,'name':'十六、绩效考核与持续改进35分','type2':14},{'_id':'4fba6452b9207ef62d2a3cb5','i':1,'name':'一、安全目标35分','type2':15},{'_id':'4fba6452b9207ef62d2a3cb6','i':2,'name':'二、管理机构和人员35分','type2':15},{'_id':'4fba6452b9207ef62d2a3cb7','i':3,'name':'三、安全责任体系45分','type2':15},{'_id':'4fba6452b9207ef62d2a3cb8','i':4,'name':'四、法规和安全管理制度70分','type2':15},{'_id':'4fba6452b9207ef62d2a3cb9','i':5,'name':'五、安全投入50分','type2':15},{'_id':'4fba6452b9207ef62d2a3cba','i':6,'name':'六、装备设施105分','type2':15},{'_id':'4fba6452b9207ef62d2a3cbb','i':7,'name':'七、科技创新与信息化45分','type2':15},{'_id':'4fba6452b9207ef62d2a3cbc','i':8,'name':'八、队伍建设90分','type2':15},{'_id':'4fba6452b9207ef62d2a3cbd','i':9,'name':'九、作业管理160分','type2':15},{'_id':'4fba6452b9207ef62d2a3cbe','i':10,'name':'十、危险源辩识与风险控制50分','type2':15},{'_id':'4fba6452b9207ef62d2a3cbf','i':11,'name':'十一、隐患排查与治理80分','type2':15},{'_id':'4fba6452b9207ef62d2a3cc0','i':12,'name':'十二、职业健康30分','type2':15},{'_id':'4fba6452b9207ef62d2a3cc1','i':13,'name':'十三、安全文化35分','type2':15},{'_id':'4fba6452b9207ef62d2a3cc2','i':14,'name':'十四、应急救援85分','type2':15},{'_id':'4fba6452b9207ef62d2a3cc3','i':15,'name':'十五、事故报告调查处理50分','type2':15},{'_id':'4fba6452b9207ef62d2a3cc4','i':16,'name':'十六、绩效考核与持续改进35分','type2':15},{'_id':'4fba6547b9207ef62d2a3d6c','i':1,'name':'一、安全目标35分','type2':16},{'_id':'4fba6547b9207ef62d2a3d6d','i':2,'name':'二、管理机构和人员35分','type2':16},{'_id':'4fba6547b9207ef62d2a3d6e','i':3,'name':'三、安全责任体系45分','type2':16},{'_id':'4fba6547b9207ef62d2a3d6f','i':4,'name':'四、法规和安全管理制度70分','type2':16},{'_id':'4fba6547b9207ef62d2a3d70','i':5,'name':'五、安全投入50分','type2':16},{'_id':'4fba6547b9207ef62d2a3d71','i':6,'name':'六、装备设施130分','type2':16},{'_id':'4fba6547b9207ef62d2a3d72','i':7,'name':'七、科技创新与信息化45分','type2':16},{'_id':'4fba6547b9207ef62d2a3d73','i':8,'name':'八、队伍建设90分','type2':16},{'_id':'4fba6547b9207ef62d2a3d74','i':9,'name':'九、作业管理140分','type2':16},{'_id':'4fba6547b9207ef62d2a3d75','i':10,'name':'十、危险源辩识与风险控制50分','type2':16},{'_id':'4fba6547b9207ef62d2a3d76','i':11,'name':'十一、隐患排查与治理70分','type2':16},{'_id':'4fba6547b9207ef62d2a3d77','i':12,'name':'十二、职业健康35分','type2':16},{'_id':'4fba6547b9207ef62d2a3d78','i':13,'name':'十三、安全文化35分','type2':16},{'_id':'4fba6547b9207ef62d2a3d79','i':14,'name':'十四、应急救援85分','type2':16},{'_id':'4fba6547b9207ef62d2a3d7a','i':15,'name':'十五、事故报告调查处理50分','type2':16},{'_id':'4fba6547b9207ef62d2a3d7b','i':16,'name':'十六、绩效考核与持续改进35分','type2':16},{'_id':'4fba665db9207ef62d2a3e34','i':1,'name':'一、安全目标35分','type2':21},{'_id':'4fba665db9207ef62d2a3e35','i':2,'name':'二、管理机构和人员40分','type2':21},{'_id':'4fba665db9207ef62d2a3e36','i':3,'name':'三、安全责任体系45分','type2':21},{'_id':'4fba665db9207ef62d2a3e37','i':4,'name':'四、法规和安全管理制度70分','type2':21},{'_id':'4fba665db9207ef62d2a3e38','i':5,'name':'五、安全投入45分','type2':21},{'_id':'4fba665db9207ef62d2a3e39','i':6,'name':'六、装备设施100分','type2':21},{'_id':'4fba665db9207ef62d2a3e3a','i':7,'name':'七、科技与信息化55分','type2':21},{'_id':'4fba665db9207ef62d2a3e3b','i':8,'name':'八、队伍建设90分','type2':21},{'_id':'4fba665db9207ef62d2a3e3c','i':9,'name':'九、作业管理175分','type2':21},{'_id':'4fba665db9207ef62d2a3e3d','i':10,'name':'十、危险源辩识与风险控制45分','type2':21},{'_id':'4fba665db9207ef62d2a3e3e','i':11,'name':'十一、隐患排查与治理70分','type2':21},{'_id':'4fba665db9207ef62d2a3e3f','i':12,'name':'十二、职业健康25分','type2':21},{'_id':'4fba665db9207ef62d2a3e40','i':13,'name':'十三、安全文化35分','type2':21},{'_id':'4fba665db9207ef62d2a3e41','i':14,'name':'十四、应急救援85分','type2':21},{'_id':'4fba665db9207ef62d2a3e42','i':15,'name':'十五、事故报告调查处理50分','type2':21},{'_id':'4fba665db9207ef62d2a3e43','i':16,'name':'十六、绩效考核与持续改进35分','type2':21},{'_id':'4fba674cb9207ef62d2a3f07','i':1,'name':'一、安全目标35分','type2':22},{'_id':'4fba674cb9207ef62d2a3f08','i':2,'name':'二、管理机构和人员40分','type2':22},{'_id':'4fba674cb9207ef62d2a3f09','i':3,'name':'三、安全责任体系45分','type2':22},{'_id':'4fba674cb9207ef62d2a3f0a','i':4,'name':'四、法规和安全管理制度70分','type2':22},{'_id':'4fba674cb9207ef62d2a3f0b','i':5,'name':'五、安全投入40分','type2':22},{'_id':'4fba674cb9207ef62d2a3f0c','i':6,'name':'六、装备设施90分','type2':22},{'_id':'4fba674cb9207ef62d2a3f0d','i':7,'name':'七、科技创新与信息化55分','type2':22},{'_id':'4fba674cb9207ef62d2a3f0e','i':8,'name':'八、队伍建设90分','type2':22},{'_id':'4fba674cb9207ef62d2a3f0f','i':9,'name':'九、作业管理190分','type2':22},{'_id':'4fba674cb9207ef62d2a3f10','i':10,'name':'十、危险源辩识与风险控制45分','type2':22},{'_id':'4fba674cb9207ef62d2a3f11','i':11,'name':'十一、隐患排查与治理70分','type2':22},{'_id':'4fba674cb9207ef62d2a3f12','i':12,'name':'十二、职业健康25分','type2':22},{'_id':'4fba674cb9207ef62d2a3f13','i':13,'name':'十三、安全文化35分','type2':22},{'_id':'4fba674cb9207ef62d2a3f14','i':14,'name':'十四、应急救援85分','type2':22},{'_id':'4fba674cb9207ef62d2a3f15','i':15,'name':'十五、事故报告调查处理50分','type2':22},{'_id':'4fba674cb9207ef62d2a3f16','i':16,'name':'十六、绩效考核与持续改进35分','type2':22},{'_id':'4fba684bb9207ef62d2a3fd9','i':1,'name':'一、安全目标35分','type2':23},{'_id':'4fba684bb9207ef62d2a3fda','i':2,'name':'二、管理机构和人员40分','type2':23},{'_id':'4fba684bb9207ef62d2a3fdb','i':3,'name':'三、安全责任体系45分','type2':23},{'_id':'4fba684bb9207ef62d2a3fdc','i':4,'name':'四、法规和安全管理制度70分','type2':23},{'_id':'4fba684bb9207ef62d2a3fdd','i':5,'name':'五、安全投入40分','type2':23},{'_id':'4fba684bb9207ef62d2a3fde','i':6,'name':'六、装备设施110分','type2':23},{'_id':'4fba684bb9207ef62d2a3fdf','i':7,'name':'七、科技创新与信息化55分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe0','i':8,'name':'八、队伍建设90分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe1','i':9,'name':'九、作业管理170分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe2','i':10,'name':'十、危险源辩识与风险控制45分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe3','i':11,'name':'十一、隐患排查与治理70分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe4','i':12,'name':'十二、职业健康25分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe5','i':13,'name':'十三、安全文化35分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe6','i':14,'name':'十四、应急救援85分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe7','i':15,'name':'十五、事故报告调查处理50分','type2':23},{'_id':'4fba684bb9207ef62d2a3fe8','i':16,'name':'十六、绩效考核与持续改进35分','type2':23},{'_id':'4fba6945b9207ef62d2a40a7','i':1,'name':'一、安全目标35分','type2':31},{'_id':'4fba6945b9207ef62d2a40a8','i':2,'name':'二、管理机构和人员40分','type2':31},{'_id':'4fba6945b9207ef62d2a40a9','i':3,'name':'三、安全责任体系45分','type2':31},{'_id':'4fba6945b9207ef62d2a40aa','i':4,'name':'四、法规和安全管理制度70分','type2':31},{'_id':'4fba6945b9207ef62d2a40ab','i':5,'name':'五、安全投入45分','type2':31},{'_id':'4fba6945b9207ef62d2a40ac','i':6,'name':'六、装备设施115分','type2':31},{'_id':'4fba6945b9207ef62d2a40ad','i':7,'name':'七、科技创新与信息化55分','type2':31},{'_id':'4fba6945b9207ef62d2a40ae','i':8,'name':'八、队伍建设90分','type2':31},{'_id':'4fba6945b9207ef62d2a40af','i':9,'name':'九、作业管理160分','type2':31},{'_id':'4fba6945b9207ef62d2a40b0','i':10,'name':'十、危险源辩识与风险控制45分','type2':31},{'_id':'4fba6945b9207ef62d2a40b1','i':11,'name':'十一、隐患排查与治理70分','type2':31},{'_id':'4fba6945b9207ef62d2a40b2','i':12,'name':'十二、职业健康25分','type2':31},{'_id':'4fba6945b9207ef62d2a40b3','i':13,'name':'十三、安全文化35分','type2':31},{'_id':'4fba6945b9207ef62d2a40b4','i':14,'name':'十四、应急救援85分','type2':31},{'_id':'4fba6945b9207ef62d2a40b5','i':15,'name':'十五、事故报告调查处理50分','type2':31},{'_id':'4fba6945b9207ef62d2a40b6','i':16,'name':'十六、绩效考核与持续改进35分','type2':31},{'_id':'4fba6aa2b9207ef62d2a416d','i':1,'name':'一、安全目标35分','type2':32},{'_id':'4fba6aa2b9207ef62d2a416e','i':2,'name':'二、管理机构和人员40分','type2':32},{'_id':'4fba6aa2b9207ef62d2a416f','i':3,'name':'三、安全责任体系45分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4170','i':4,'name':'四、法规和安全管理制度70分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4171','i':5,'name':'五、安全投入45分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4172','i':6,'name':'六、装备设施130分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4173','i':7,'name':'七、科技创新与信息化55分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4174','i':8,'name':'八、队伍建设90分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4175','i':9,'name':'九、作业管理145分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4176','i':10,'name':'十、危险源辩识与风险控制45分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4177','i':11,'name':'十一、隐患排查与治理70分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4178','i':12,'name':'十二、职业健康25分','type2':32},{'_id':'4fba6aa2b9207ef62d2a4179','i':13,'name':'十三、安全文化35分','type2':32},{'_id':'4fba6aa2b9207ef62d2a417a','i':14,'name':'十四、应急救援85分','type2':32},{'_id':'4fba6aa2b9207ef62d2a417b','i':15,'name':'十五、事故报告调查处理50分','type2':32},{'_id':'4fba6aa2b9207ef62d2a417c','i':16,'name':'十六、绩效考核与持续改进35分','type2':32},{'_id':'4fba6b7ab9207ef62d2a4234','i':1,'name':'一、安全目标35分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4235','i':2,'name':'二、管理机构和人员35分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4236','i':3,'name':'三、安全责任体系45分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4237','i':4,'name':'四、法规和安全管理制度70分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4238','i':5,'name':'五、安全投入45分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4239','i':6,'name':'六、装备设施140分','type2':33},{'_id':'4fba6b7ab9207ef62d2a423a','i':7,'name':'七、科技创新与信息化55分','type2':33},{'_id':'4fba6b7ab9207ef62d2a423b','i':8,'name':'八、队伍建设90分','type2':33},{'_id':'4fba6b7ab9207ef62d2a423c','i':9,'name':'九、作业管理140分','type2':33},{'_id':'4fba6b7ab9207ef62d2a423d','i':10,'name':'十、危险源辩识与风险控制45分','type2':33},{'_id':'4fba6b7ab9207ef62d2a423e','i':11,'name':'十一、隐患排查与治理70分','type2':33},{'_id':'4fba6b7ab9207ef62d2a423f','i':12,'name':'十二、职业健康25分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4240','i':13,'name':'十三、安全文化35分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4241','i':14,'name':'十四、应急救援85分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4242','i':15,'name':'十五、事故报告调查处理50分','type2':33},{'_id':'4fba6b7ab9207ef62d2a4243','i':16,'name':'十六、绩效考核与持续改进35分','type2':33},{'_id':'4fba6c67b9207ef62d2a42f4','i':1,'name':'一、安全目标35分','type2':41},{'_id':'4fba6c67b9207ef62d2a42f5','i':2,'name':'二、管理机构和人员40分','type2':41},{'_id':'4fba6c67b9207ef62d2a42f6','i':3,'name':'三、安全责任体系45分','type2':41},{'_id':'4fba6c67b9207ef62d2a42f7','i':4,'name':'四、法规和安全管理制度70分','type2':41},{'_id':'4fba6c67b9207ef62d2a42f8','i':5,'name':'五、安全投入50分','type2':41},{'_id':'4fba6c67b9207ef62d2a42f9','i':6,'name':'六、装备设施115分','type2':41},{'_id':'4fba6c67b9207ef62d2a42fa','i':7,'name':'七、科技创新与信息化85分','type2':41},{'_id':'4fba6c67b9207ef62d2a42fb','i':8,'name':'八、队伍建设90分','type2':41},{'_id':'4fba6c67b9207ef62d2a42fc','i':9,'name':'九、作业管理125分','type2':41},{'_id':'4fba6c67b9207ef62d2a42fd','i':10,'name':'十、危险源辩识与风险控制45分','type2':41},{'_id':'4fba6c67b9207ef62d2a42fe','i':11,'name':'十一、隐患排查与治理70分','type2':41},{'_id':'4fba6c67b9207ef62d2a42ff','i':12,'name':'十二、职业健康25分','type2':41},{'_id':'4fba6c67b9207ef62d2a4300','i':13,'name':'十三、安全文化35分','type2':41},{'_id':'4fba6c67b9207ef62d2a4301','i':14,'name':'十四、应急救援85分','type2':41},{'_id':'4fba6c67b9207ef62d2a4302','i':15,'name':'十五、事故报告调查处理50分','type2':41},{'_id':'4fba6c67b9207ef62d2a4303','i':16,'name':'十六、绩效考核与持续改进35分','type2':41},{'_id':'4fba6d2fb9207ef62d2a43b9','i':1,'name':'一、安全目标35分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43ba','i':2,'name':'二、管理机构和人员40分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43bb','i':3,'name':'三、安全责任体系45分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43bc','i':4,'name':'四、法规和安全管理制度70分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43bd','i':5,'name':'五、安全投入50分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43be','i':6,'name':'六、装备设施130分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43bf','i':7,'name':'七、科技创新与信息化80分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c0','i':8,'name':'八、队伍建设90分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c1','i':9,'name':'九、作业管理115分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c2','i':10,'name':'十、危险源辩识与风险控制45分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c3','i':11,'name':'十一、隐患排查与治理70分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c4','i':12,'name':'十二、职业健康25分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c5','i':13,'name':'十三、安全文化35分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c6','i':14,'name':'十四、应急救援85分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c7','i':15,'name':'十五、事故报告调查处理50分','type2':42},{'_id':'4fba6d2fb9207ef62d2a43c8','i':16,'name':'十六、绩效考核与持续改进35分','type2':42},{'_id':'4fba6e03b9207ef62d2a4483','i':1,'name':'一、安全目标35分','type2':43},{'_id':'4fba6e03b9207ef62d2a4484','i':2,'name':'二、管理机构和人员40分','type2':43},{'_id':'4fba6e03b9207ef62d2a4485','i':3,'name':'三、安全责任体系45分','type2':43},{'_id':'4fba6e03b9207ef62d2a4486','i':4,'name':'四、法规和安全管理制度70分','type2':43},{'_id':'4fba6e03b9207ef62d2a4487','i':5,'name':'五、安全投入50分','type2':43},{'_id':'4fba6e03b9207ef62d2a4488','i':6,'name':'六、装备设施90分','type2':43},{'_id':'4fba6e03b9207ef62d2a4489','i':7,'name':'七、科技创新与信息化90分','type2':43},{'_id':'4fba6e03b9207ef62d2a448a','i':8,'name':'八、队伍建设90分','type2':43},{'_id':'4fba6e03b9207ef62d2a448b','i':9,'name':'九、作业管理145分','type2':43},{'_id':'4fba6e03b9207ef62d2a448c','i':10,'name':'十、危险源辩识与风险控制45分','type2':43},{'_id':'4fba6e03b9207ef62d2a448d','i':11,'name':'十一、隐患排查与治理70分','type2':43},{'_id':'4fba6e03b9207ef62d2a448e','i':12,'name':'十二、职业健康25分','type2':43},{'_id':'4fba6e03b9207ef62d2a448f','i':13,'name':'十三、安全文化35分','type2':43},{'_id':'4fba6e03b9207ef62d2a4490','i':14,'name':'十四、应急救援85分','type2':43},{'_id':'4fba6e03b9207ef62d2a4491','i':15,'name':'十五、事故报告调查处理50分','type2':43},{'_id':'4fba6e03b9207ef62d2a4492','i':16,'name':'十六、绩效考核与持续改进35分','type2':43},{'_id':'4fba6ec1b9207ef62d2a4546','i':1,'name':'一、安全目标35分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4547','i':2,'name':'二、管理机构和人员35分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4548','i':3,'name':'三、安全责任体系45分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4549','i':4,'name':'四、法规和安全管理制度70分','type2':51},{'_id':'4fba6ec1b9207ef62d2a454a','i':5,'name':'五、安全投入45分','type2':51},{'_id':'4fba6ec1b9207ef62d2a454b','i':6,'name':'六、装备设施100分','type2':51},{'_id':'4fba6ec1b9207ef62d2a454c','i':7,'name':'七、安全技术管理110分','type2':51},{'_id':'4fba6ec1b9207ef62d2a454d','i':8,'name':'八、队伍建设90分','type2':51},{'_id':'4fba6ec1b9207ef62d2a454e','i':9,'name':'九、作业管理120分','type2':51},{'_id':'4fba6ec1b9207ef62d2a454f','i':10,'name':'十、危险源辩识与风险控制45分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4550','i':11,'name':'十一、隐患排查与治理70分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4551','i':12,'name':'十二、职业健康30分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4552','i':13,'name':'十三、安全文化35分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4553','i':14,'name':'十四、应急救援85分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4554','i':15,'name':'十五、事故报告调查处理50分','type2':51},{'_id':'4fba6ec1b9207ef62d2a4555','i':16,'name':'十六、绩效考评与持续改进35分','type2':51}]");
	JSONObject js=JSONObject.fromObject(ss);
	JSONArray jsList=JSONArray.fromObject(ss);
	JSONArray jsl=new JSONArray();
	 for (int i = 0; i < jsList.size(); i++) {
		 JSONObject js1 =(JSONObject) jsList.get(i);
		 js1.remove("_id");
		 jsl.add(js1);
	}
	 
	

}
public static void main(String [] args){
	createInidc1();
	
}
      
    //静态数据，本该从数据库查出来的成为一个集合  
    private static  Map<String, FileItem>files=new HashMap<String, FileItem>();  
 
    //获得文件下载列表  
    public List<FileItem> getFileList()  
    {  
        return new ArrayList<FileItem>(files.values());  
    }  
      
      
    //根据id获得单个文件  
    public FileItem getFileItem(String fileName)  
    {  
        return files.get(fileName);  
    }  
}  