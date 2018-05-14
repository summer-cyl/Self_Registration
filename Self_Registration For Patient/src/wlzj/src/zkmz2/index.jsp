<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="css/style.css">
	<title>专科门诊-填写问诊信息</title>
	</head>
	<body>
		<iframe id="c_iframe" height="0" width="0" src="../../index.html" style="display:none"></iframe>
		<script type="text/javascript"> (function autoHeight() {
		    var b_width = Math.max(document.body.scrollWidth, document.body.clientWidth);
		    var b_height = Math.max(document.body.scrollHeight, document.body.clientHeight);
		    var c_iframe = document.getElementById("c_iframe");
		    c_iframe.src = c_iframe.src + "#" + b_width + "|" + b_height
			})(); 
		</script>
		<div class="content">
			<div class="inthoscontent">
				<div class="bigphofig">
					<img src="image/speclinic.png">
				</div>
				<div class="clinicdetail">
					<div class="clinicflowc">
						<img src="image/docoppfc2.png">
					</div>
					<div class="ordertop" style="border-bottom: none;">
						<div style="height: 30px;"></div>
						<b id="form_title">专科门诊</b>&nbsp;&nbsp;&nbsp;
						<span style="font-size: 12px;color:#999;">
							上午 08:00-12:00，下午 14:00-17:30
						</span>
					</div>
				<form>
			    <div class="vddlist">
				<div class="vddli">
					<div id="deptTitle" class="vddliname">申请科室：</div>
					<div class="vddlicon">
						<span class="vddliconli">
							<span id="deptName">血液病科专家门诊</span>		
							 <div class="deptinsbut">
							 	科室介绍								
							 	<div class="deptinsjiao"></div>
								<div class="deptinsdet" style="left: -146px;">
									<span class="didtitle">专家介绍</span>
									<span class="diddet">
										1997年毕业于上海铁道大学医学院，2008年获浙江大学医学硕士学位，现为浙江大学附属第一医院血液科副主任医师 。
									</span>
								</div>
							</div>
						</span>
					</div>
				</div>

				<div class="vddli">
					<div class="vddliname">挂号费：</div>
					<div class="vddlicon">
						<span class="vddliconli">
							<span style="color: #ff6c00;">
								<span id="sum">20</span>
								元/15分钟
							</span>
							（
							<span style="text-decoration: line-through;">
								原价：50元
							</span>
							）
						</span>
					</div>
				</div>

				<div class="vddli">
					<div class="vddliname">时间：</div>
					<div class="vddlicon">
						<div class="vddtimechoose">
							<div class="paywaycheckout">
								<input type="radio" class="paywaycheck" name="timeScope" disabled="disabled" value="1">
							</div>
							<span id="morningTime" class="paywayname pyncant">上午</span>
						</div>
						<div class="vddtimechoose">
							<div class="paywaycheckout pwchecked">
								<input type="radio" class="paywaycheck" name="timeScope" checked="checked" value="2">
							</div>
							<span  id="aftTime" class="paywayname pyncant">下午</span>
						</div>
					</div>
				</div>

				<div class="vddli" style="margin-bottom: 10px;">
					<div class="vddliname"><span style="color: red;">*</span>姓名：</div>
					<div class="vddlicon">
						<input id="name" name="name" type="text" class="vddinpname" style="float:left;vertical-align:top;" value="">
						<div >
							<span class="ihcasename""> 本人 </span>
							<img src="image/morecase.png" class="morecase" onclick="getLink()">
						</div>
					</div>
				</div>
				<div class="vddli">
					<div class="vddliname"><span style="color: red;">*</span>手机号：</div>
					<div class="vddlicon">
						<input id="phone" name="phone" type="text" class="vddinpname" readonly="readonly" value="">
					</div>
				</div>
				<div class="vddli">
					<div class="vddliname"><span style="color: red;">*</span>身份证号：</div>
					<div class="vddlicon">
						<input id="idCard" name="idCard" type="text" class="vddinpname" value="">
					</div>
				</div>
				<div class="vddli">
					<div class="vddliname"><span style="color: red;">*</span>病情描述：</div>
					<div class="vddlicon">
						<textarea id="diseaseDescription" name="diseaseDescription" class="sickdisc" placeholder="请在此输入"></textarea>
					</div>
				</div>
				<div class="vddli">
					<div class="vddliname">个人病史：</div>
					<div class="vddlicon">
						<table class="vddli-list" cellpadding="0" cellspacing="0">
							<tbody><tr class="addbct">
								<td class="vddlith">既往史</td>
								<td id="pastMedicalHistory">无</td>
								<td class="medhischoose">
									<!-- <a val="1" onclick = "chooseClick('既往史');return false;">选择</a> -->
									<a onclick="chooseClick('既往史'); return false;">选择</a>
								</td>
							</tr>
							<tr>
								<td class="vddlith">婚育史</td>
								<td id="obstetricalHistory">未生育、未婚</td>
								<td class="medhischoose">
									<!-- <a val="2">选择</a> -->
									<!-- <a onclick="getHistory('2'); return false;">选择</a> -->
									<a onclick="chooseClick('婚育史'); return false;">选择</a>
								</td>
								
							</tr>
							<tr class="addbct">
								<td class="vddlith">过敏史</td>
								<td id="allergicHistory">无</td>
								<td class="medhischoose">
									<!-- <a val="3">选择</a> -->
									<!-- <a onclick="getHistory('3'); return false;">选择</a> -->
									<a onclick="chooseClick('过敏史'); return false;">选择</a>
								</td>
							</tr>
							<tr>
								<td class="vddlith">家族史</td>
								<td id="familyMedicalHistory">无</td>
								<td class="medhischoose">
									<!-- <a val="4">选择</a> -->
									<!-- <a onclick="getHistory('4'); return false;">选择</a> -->
									<a onclick="chooseClick('家族史'); return false;">选择</a>
								</td>
								
							</tr>
							<tr class="addbct">
								<td class="vddlith">个人习惯</td>
								<td id="personalHabits">无</td>
								<td class="medhischoose">
									<!-- <a val="5">选择</a> -->
									<!-- <a onclick="getHistory('5'); return false;">选择</a> -->
									<a onclick="chooseClick('个人习惯'); return false;">选择</a>
								</td>
							</tr>
						</tbody></table>
					</div>
				</div>
				<div class="vddli" style="margin-bottom: 50px;">
					<div class="vddliname"></div>
					<div class="vddlicon">
						<a>
							<div class="vddbutlast">上一步</div>
						</a>
						<div id="submitBtn" class="vddbutup">提交申请</div>					
				</div>
			</div>
		</div>
				</form>
		<!-- 新增联系人-弹窗 -->
		<div id="addPop" class="inthospopup" style="display: none;">
			<div class="cover"></div>
			<div class="ihconpop" style="height: 250px">
				<div class="closeihconpop"></div>
				<div style="padding: 30px;">
					<select id="treatCardType" style="display: none;" onchange="selectOpt()">
							<option value="5" selected="selected">浙一就诊卡</option>
							<option value="6">海创园门诊部就诊卡</option>
							<option value="7">医保卡</option>
						</select><table class="addcaseimf">
						<tbody><tr>
							<td class="aciname"><span style="color: red;">*</span>姓名：</td>
							<td><input id="name2" type="text" class="aciinp"></td>
						</tr>
						<tr>
							<td class="aciname"><span style="color: red;">*</span>身份证号：</td>
							<td><input id="idCard2" type="text" class="aciinp"></td>
						</tr>
						<tr style="display: none;">
							<td class="aciname"><span style="color: red;">*</span>手机号：</td>
							<td><input id="phone2" type="text" class="aciinp" value=""></td>
						</tr>
						<input id="treatCard2" type="hidden">
					</tbody></table>
					<div id="btnSave" class="surebut" style="float: none;margin-left: 90px;margin-top: 20px;" onclick="save()">保存</div>
				</div>
			</div>
		</div>

		<!-- 既往史 -->
		<div id="chooseHistory1" class="inthospopup" style="display: none;">
			<div class="cover"></div>
			<div class="ihsickhis">
				<div class="closeihconpop"></div>
				<div class="ihshtitle"><span>既往史</span></div>
				<div id="historyDetail" style="margin: 0 35px;">
					<div class="ihshliname">疾病史</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>哮喘</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>高脂血症</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>高尿酸血症</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>高血压</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>心脏病</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>糖尿病</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>脑卒中</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>肾炎</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>癫痫</label>
					</div>
					<div class="ihshliname">传染病</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>肺结核</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>病毒性肝炎</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>血吸虫病</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>淋病</label>
					</div>
					<div class="ihshliname">手术史</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>颅脑手术</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>颈部手术</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>胸部手术</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>腹部手术</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>背部手术</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>四肢手术</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>骨折</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>头部外伤</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>烧伤</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>烫伤</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>肌腱损伤</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>皮肤软组织损伤</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>刀砍伤</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>刀刺伤</label>			
					</div>
					<div class="uploadsome">
						<span>其它</span><input id="others1" type="text" class="uploadother" placeholder="补充说明">
						<div class="surebut" onclick="saveMedicalHistory('既往史')">确定</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 婚育史 -->
		<div id="chooseHistory2" class="inthospopup" style="display: none;">
			<div class="cover"></div>
			<div class="ihsickhis">
				<div class="closeihconpop"></div>
				<div class="ihshtitle"><span>婚育史</span></div>
				<div id="historyDetail" style="margin: 0 35px;">
					<div class="ihshliname">婚姻状况</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="radio" name="radio1"></u>已婚</label>
						<label class="in-label"><u class="shcheck"><input type="radio" name="radio1"></u>未婚</label>
					</div>
					<div class="ihshliname">生育状态</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="radio" name="radio2"></u>未生育</label>
						<label class="in-label"><u class="shcheck"><input type="radio" name="radio2"></u>备孕期</label>
						<label class="in-label"><u class="shcheck"><input type="radio" name="radio2"></u>怀孕期</label>
						<label class="in-label"><u class="shcheck"><input type="radio" name="radio2"></u>已生育</label>
					</div>
					<div class="uploadsome">
						<div class="surebut" onclick="saveMedicalHistory('婚育史')">确定</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 过敏史 -->
		<div id="chooseHistory3" class="inthospopup" style="display: none;">
			<div class="cover"></div>
			<div class="ihsickhis">
				<div class="closeihconpop"></div>
				<div class="ihshtitle"><span>过敏史</span></div>
				<div id="historyDetail" style="margin: 0 35px;">
					<div class="ihshliname">药物过敏</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>青霉素</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>头孢类抗生素</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>破伤风抗毒素（TAT）</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>普鲁卡因</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>地卡因</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>磺胺类药物</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>维生素B1</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>泛影葡胺</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>阿司匹林</label>
					</div>
					<div class="ihshliname">食物过敏</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>芒果</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>牛奶</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>海鲜</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>笋</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>香菇</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>黄瓜</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>花粉</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>油漆</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>皮毛</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>化妆品</label>
					</div>
					<div class="uploadsome">
						<span>其它</span><input id="others3" type="text" class="uploadother" placeholder="补充说明" name="elseSick" >
						<div class="surebut" onclick="saveMedicalHistory('过敏史')">确定</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 家族史 -->
		<div id="chooseHistory4" class="inthospopup" style="display: none;">
			<div class="cover"></div>
			<div class="ihsickhis">
				<div class="closeihconpop"></div>
				<div class="ihshtitle"><span>家族史</span></div>
				<div id="historyDetail" style="margin: 0 35px;">
					<div class="ihshliname">家族史（父母、兄弟姐妹）</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>高血压</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>糖尿病</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>心脏病</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>脑梗</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>脑出血</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>癌症</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>过敏性疾病</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>哮喘</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>癫痫病</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>白癜风</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>近视</label>
					</div>
					<div class="uploadsome">
						<span>其它</span><input id="others4" type="text" class="uploadother" placeholder="补充说明">
						<div class="surebut" onclick="saveMedicalHistory('家族史')">确定</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 个人习惯 -->
		<div id="chooseHistory5" class="inthospopup" style="display: none;">
			<div class="cover"></div>
			<div class="ihsickhis">
				<div class="closeihconpop"></div>
				<div class="ihshtitle"><span>个人习惯</span></div>
				<div id="historyDetail" style="margin: 0 35px;">
					<div class="ihshliname">个人习惯</div>
					<div class="ihshchoose">
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>吸烟</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>饮酒</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>熬夜</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>低头</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>久坐</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>久站</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>跷二郎腿</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>强忍大小便</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>饭后卧床</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>如厕看书报</label>
						<label class="in-label"><u class="shcheck"><input type="checkbox"></u>不喜喝水</label>
					</div>
					<div class="uploadsome">
						<span>其它</span><input id="others5" type="text" class="uploadother" placeholder="补充说明">
						<div class="surebut" onclick="saveMedicalHistory('个人习惯')">确定</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 就诊卡 弹窗 -->
		<div id="jzkPopup" class="inthospopup" style="display:none;"></div>
		<!-- 提交中弹窗 -->
		<!-- <div id="submitPopup" class="inthospopup" style="display:none;">
			<div class="cover"></div>
			<div class="zywaiting">
				<span>提交中…</span>
				<img src="image/loadingzy.gif">
			</div>
		</div> -->
	</body>
	<script src="lib/jquery-3.2.1.js"></script>
	<script src="../../js/index.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/util/util.js"></script>
	<script type="text/javascript" src="js/header.js"></script>
	<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
	<!-- <script type="text/javascript" src="js/writeInfo.js"></script> -->
	<script src="js/index.js"></script>
</html>