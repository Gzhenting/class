<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<header id="mr-header" class="wrap mr-header">
	<div class="container">
		<div class="row">
			<!-- //网站Logo -->
			<!-- 主导航条 -->
			<nav id="mr-mainnav"
				class="col-xs-12 col-md-6 mr-mainnav navbar navbar-default">
				<div class="mr-navbar navbar-collapse collapse">
					<div class="mr-megamenu animate slide" data-duration="400"
						data-responsive="true">
						<ul class="nav navbar-nav level0">
							<li itemprop="name" data-id="435" data-level="1">
								<a id="index" itemprop="url" class="" href="index.jsp"
								   data-target="#">首页</a></li>
							<li itemprop="name" data-id="510" data-level="1">
								<a id="zhuanye" itemprop="url" class="" href="bookList.jsp?type=1"
								   data-target="#">专业类</a></li>
							<li itemprop="name" data-id="510" data-level="1">
								<a id="jichu" itemprop="url" class="" href="bookList.jsp?type=2"
								data-target="#">基础类</a></li>
							<li itemprop="name" data-id="510" data-level="1">
								<a id="kaoyan" itemprop="url" class="" href="bookList.jsp?type=3"
								data-target="#">考研类</a></li>
							<li itemprop="name" data-id="510" data-level="1">
								<a id="qita" itemprop="url" class="" href="bookList.jsp?type=4"
								   data-target="#">其他</a></li>
						</ul>
					</div>

				</div>
			</nav>
			<!-- //主导航条 -->
		</div>
	</div>
</header>
<script>
	// 获取页面参数
	function GetString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");//正则表达式
		var r = window.location.search.substr(1).match(reg);//获取鼠标点击区域
		if (r != null)
			return unescape(r[2]);//返回区域编号
		return null;
	}
	var type = GetString('type');
	if (type === '1') {
		var zhuanye = document.getElementById('zhuanye');
		zhuanye.style.backgroundColor = "#014d91";

	}
	if (type === '2') {
		var jichu= document.getElementById('jichu');
		jichu.style.backgroundColor = "#014d91";

	}
	if (type === '3') {
		var kaoyan = document.getElementById('kaoyan');
		kaoyan.style.backgroundColor = "#014d91";

	}
	if (type === '4') {
		var qita = document.getElementById('qita');
		qita.style.backgroundColor = "#014d91";

	}
	if (type == null) {//默认登录无点击
		var index = document.getElementById('index');
		index.style.backgroundColor = "#014d91";

	}
</script>