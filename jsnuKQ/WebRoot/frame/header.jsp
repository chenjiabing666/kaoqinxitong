<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.navbar {
	position: relative;
	min-height: 87px;
	box-shadow: 2px 2px 2px grey;
	background-color: rgba(38, 140, 115, 0.99);
}

.navbar-default .navbar-nav>.active>a,.navbar-default .navbar-nav>.active>a:focus,.navbar-default .navbar-nav>.active>a:hover
	{
	color: #555;
	background-color: #2196F3;
}

.carousel-inner>.item>a>img,.carousel-inner>.item>img,.img-responsive,.thumbnail a>img,.thumbnail>img
	{
	height: 60px;
}

.nav>li {
	font-size: 20px;
	margin-right: 118px;
	margin-top: 18px;
}

/*设置链接的大小和颜色*/
.navbar-default .navbar-nav>li>a {
	color: #9fc34a;
	font-size: 29px;
	font-weight: 400;
}
</style>
<!--导航栏-->
<header>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" ref="#"> <img
				src="jiangsushifa.png" class="img-responsive" />
			</a>
		</div>

		<div class="collapse navbar-collapse pull-right"
			id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#">查看</a></li>
				<li><a href="#">修改</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 设置<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">注销</a></li>
						<li class="divider"></li>
						<li><a href="#">退出登录</a></li>

					</ul></li>
			</ul>
		</div>
	</nav>

</header>