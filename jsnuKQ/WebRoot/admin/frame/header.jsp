<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--导航栏-->
<header>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> <img
				src="image/jiangsushifa.png" class="img-responsive" />
			</a>
		</div>

		<div class="collapse navbar-collapse pull-right"
			id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 添加<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="/jsnuKQ/admin/AddStudent">学生</a></li>
						<li class="divider"></li>
						<li><a href="/jsnuKQ/admin/AddTeacher">教职工</a></li>

					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 管理<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="/jsnuKQ/admin/home">学生</a></li>
						<li class="divider"></li>
						<li><a href="/jsnuKQ/admin/manage-teacher">教职工</a></li>

					</ul></li>

				<li><a href="/jsnuKQ/admin/exit">退出系统</a></li>

			</ul>
		</div>
	</nav>
</header>