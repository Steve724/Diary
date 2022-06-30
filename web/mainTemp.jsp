<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>个人日记本主页</title>
	<link href="${pageContext.request.contextPath}/style/diary.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
	<style type="text/css">
		body{
			padding-top: 60px;
			padding-bottom: 40px;
		}
		.data_list{
			border: 1px solid #E5E5E5;
			padding: 10px;
			background-color: #FDFDFD;
			margin-top: 15px;
		}

		.data_list .data_list_title{
			font-size: 15px;
			font-weight: bold;
			border-bottom: 1px solid #E5E5E5;
			padding-bottom: 10px;
			padding-top: 5px;
		}

		.data_list .data_list_title img{
			vertical-align: top;
		}

		.data_list .datas{
			padding: 5px;
		}

		.data_list .datas ul {
			list-style-type: none;
		}

		.data_list .datas ul li {
			margin-top: 10px;
		}

		.data_list .user_image{
			text-align: center;
		}

		.data_list .user_image img{
			padding-top:10px;
			width: 200px;;
			height: 250px;;
		}

		.data_list .nickName , .data_list .userSign{
			text-align: center;
		}

	</style>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">屌丝的日记本</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main?all=true"><i class="glyphicon glyphicon-home"></i>&nbsp;主页</a></li>
				<li class="active"><a href="diary?action=preSave"><i class="glyphicon glyphicon-pencil"></i>&nbsp;写日记</a></li>
				<li class="active"><a href="diaryType?action=list"><i class="glyphicon glyphicon-book"></i>&nbsp;日记分类管理</a></li>
				<li class="active"><a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;个人中心</a></li>
			</ul>
			<form name="myForm" class="navbar-form pull-right" method="post" action="main?all=true">
				<input class="span2" id="s_title" name="s_title"  type="text" style="margin-top:2px;height:30px;" placeholder="往事如烟...">
				<button type="submit" class="btn" onkeydown="if(event.keyCode==13) myForm.submit()"><i class="glyphicon glyphicon-search"></i>&nbsp;搜索日志</button>
			</form>
		</div>
	</div>
</nav>
<div class="container">
	<div class="row-fluid">
		<div class="span9">
			<jsp:include page="${mainPage }"></jsp:include>
		</div>
		<div class="span3">
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/images/user_icon.png"/>
					个人中心
				</div>
				<div class="user_image">
					<img src="${currentUser.imageName}">
				</div>
				<div class="nickName">${currentUser.nickName }</div>
				<div class="userSign">(${currentUser.mood })</div>
			</div>
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/images/byType_icon.png"/>
					按日志类别
				</div>
				<div class="datas">
					<ul>
						<c:forEach var="diaryTypeCount" items="${diaryTypeCountList }">
							<li><span><a href="main?s_typeId=${diaryTypeCount.diaryTypeId }">${diaryTypeCount.typeName}(${diaryTypeCount.diaryCount})</a></span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="data_list">
				<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/images/byDate_icon.png"/>
					按日志日期
				</div>
				<div class="datas">
					<ul>
						<c:forEach var="diaryCount" items="${diaryCountList }">
							<li><span><a href="main?s_releaseDateStr=${diaryCount.releaseDateStr }">${diaryCount.releaseDateStr}(${diaryCount.diaryCount})</a></span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>