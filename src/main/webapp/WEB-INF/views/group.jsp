<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/boostrap/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/css/boostrap/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/nagative_left.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/normalize.css" />
<!-- 		<link rel="stylesheet" type="text/css" href="css/demo.css" /> -->
<link rel="stylesheet" type="text/css" href="resources/css/icons.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" />
<script src="resources/js/modernizr.custom.js"></script>
<script src="resources/js/jquery/jquery-1.10.2.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script language=javascript type="text/javascript"
	src="resources/js/ajaxjson/postToWallGroup.js"></script>
<script language=javascript type="text/javascript"
	src="resources/js/ajaxjson/getPostOfGroupId.js"></script>
<style type="text/css">
#menu_main {
	background-color: #3662B9;
	color: white;
	padding: 0px 100px;
	overflow: hidden;
}

.badge {
	background-color: red;
	color: white;
}

.notify_new {
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	background-color: red;
	color: white;
	padding: 2px 4px;
}

.placeholder {
	min-height: 300px;
}

.fb-send {
	margin: 15px 15px;
}

.my_show {
	display: none;
}

#negative_left {
	float: left;
	width: 24%;
	min-height: 500px;
}

#negative_right {
	float: right;
	width: 20%;
	min-height: 500px;
}

#content {
	padding: 20px 0px;
	float: left;
	width: 56.5%;
	/* 	border-left: .1em solid gray; */
	/* 	border-right: .1em solid gray; */
	min-height: 500px;
}

.sidebar_right {
	width: 20%;
	position: fixed;
	top: 51px;
	bottom: 0;
	right: 15px;
	z-index: 1000;
	display: block;
	padding-left: 20px;
	overflow-x: hidden;
	overflow-y: auto;
	background-color: #f5f5f5;
	border-right: 1px solid #eee;
}

.sidebar {
	padding-top: 0px;
	padding-left: 20px;
	width: 24%;
}

#cover_status_group {
	margin: 20px 16px;
}

.my_show{
display: none;
}
</style>
<script>
	$(document).ready(function() {
		$(".showme").click(function() {
			$(".my_show").slideToggle();
		});
	});
</script>
</head>
<body>
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.3&appId=742085339245974";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<jsp:include page="include/effect_header.jsp" />
	<div id="cover_all">
		<div id="menu_main" style="padding: 0px;">
			<nav class="navbar navbar-inverse navbar-fixed-top"
				style="padding: 0px;margin: 0px; ">
			<div class="container-fluid"
				style="background-color: #6281BF; color: white; padding: 0px 10%; border: 0px;">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" style="color: white;" href="#"></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><div class="fb-send"
								data-href="https://developers.facebook.com/docs/plugins/"
								data-colorscheme="light"></div></li>
						<li role="presentation"><a style="color: white;" href="#"><img
								src="http://graph.facebook.com/<c:out value="${user_id}"/>/picture"
								align="middle" width="20px" /> ${user_name} </a></li>
						<li role="presentation"><a style="color: white;" href="#">Home
								<span class="badge">42</span>
						</a></li>
						<li role="presentation"><a style="color: white;" href="#">Messages
								<span class="badge">3</span>
						</a></li>
						<li role="presentation" class="dropdown"><a
							style="color: white; background-color: #6281BF;" href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false">Profile<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>

								<li><a href="#">Separated link</a></li>

								<li><a href="#">One more separated link</a></li>
							</ul></li>
						<li role="presentation"></li>
					</ul>
					<form class="navbar-form navbar-left">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Search</button>
					</form>
				</div>
			</div>
			</nav>
		</div>
		<div id="cover_content">
			<div id="negative_left">
				<div class="col-sm-3 col-md-2 sidebar">
					<ul class="nav nav-sidebar">
						<c:forEach items="${bigGroupFaces}" var="bigGroupFace">
							<li><a
								href="<%=request.getContextPath() %>/home?id=<c:out value='${bigGroupFace.idBigGroupFace}'/>"><img
									src="resources/images/group.png" width="50px" height="50px"
									align="middle" /> <c:out
										value='${bigGroupFace.nameBigGroupFace}' /></a></li>

						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- end_negative_left -->
			<div id="content">
				<form:form id="formPostToGroup" action="subPostToSingleGroup" modelAttribute="group">

					<div class="col-lg-12">
						<div class="cover_post_status">
							<div class="post_status_top">
								<ul>
									<li><span class="glyphicon glyphicon-edit"
										aria-hidden="true"></span> Update Status</li>
									<li><span class="glyphicon glyphicon-film"
										aria-hidden="true"></span> Add Photo/Video</li>
									<li><span class="glyphicon glyphicon-book"
										aria-hidden="true"></span> Create Photo Anbum</li>


								</ul>
							</div>
							<div class="post_status_center">

								<div class="form-group" style="margin: 0px">
									<form:textarea path="groupMessage"
										style="border: .1em solid white;" class="form-control"
										rows="3" />
								</div>

							</div>
							<div class="post_status_bottom">
								<div class="menu_float_left">
									<ul class="nav nav-pills">
										<li role="presentation" class="active showme"><a href="#">Show
												Me</a></li>
									</ul>
								</div>
								<div class="menu_float_right">

									<ul class="nav nav-pills">
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false">Only
												Me <span class="caret"></span>
										</a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
												<li class="divider"></li>
												<li><a href="#">One more separated link</a></li>
											</ul></li>
										<li role="presentation" class="active"><input class="btn btn-primary" style="padding: 9px 20px" type="submit" value="Post"/></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="col-lg-12">

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="my_show">
								<div class="form-group has-success">
									<form:input path="groupLink" type="text" placeholder="Link"
										class="form-control" />
								</div>
								<div class="form-group has-warning">
									<form:input path="groupName" type="text" placeholder="Name"
										class="form-control" />
								</div>
								<div class="form-group has-error">
									<form:input path="groupCaption" type="text"
										placeholder="Caption" class="form-control" />
								</div>
								<div class="form-group has-error">
									<form:input path="groupDescription" placeholder="Description"
										type="text" class="form-control" />
								</div>
							</div>
						</div>
					</div>
					<!-- end_cover_status -->
					<div style="display: none;">
						<form:checkbox checked="checked" class="checkbox1"
							path="listGroup" value="${idGroupFace}" />
					</div>
				</form:form>
				<div id="cover_status_group">
					<div>Newest Post: <span id="newestPost" style="color:red;"></span> </div>
					<!-- ID Group for Ajax automatic getting  -->
					<input id="idGroup" type="hidden" value="${idGroup}"/>
					<!-- begin while for post-->
					<c:forEach items="${postFacebooks}" var="postFacebook">
						<div class="col-lg-12"
							style="padding: 15px 0px 0px 0px; background-color: white; margin: 20px 0px 0px 0px;">
							<div class="col-lg-1">
								<img
									src="http://graph.facebook.com/<c:out value="${user_id}"/>/picture"
									align="middle" width="50px" />

							</div>
							
							<div class="col-lg-11">
								<h4 style="color: #6281BF; margin: 0px; padding: 0px;">${user_name}</h4>
								${postFacebook.createdDate }
							</div>
							<div class="col-lg-12" style="margin: 10px 0px;">
								${postFacebook.message }<br/>
								<a href="${postFacebook.link }" target="target">${postFacebook.link }</a>
								<br/>
								<c:if test="${not empty postFacebook.picture }">
											<a href="${postFacebook.link }" target="target"><img alt="" src="${postFacebook.picture }"/></a>
								</c:if>
								</div>
							<div class="col-lg-12" style="padding-bottom: 10px;">
								<a href="#">Like</a> <a href="#">Comment</a>
								${postFacebook.like_count }<a href="#"><span
									class="glyphicon glyphicon-hand-right"></span></a>
							</div>
						</div>
						<div class="col-lg-12"
							style="padding: 5px 0px 5px 0px; background-color: #FBFBEF; margin: 0px 0px 20px 0px; border-top: 1px solid #F2F2F2;">
							<div class="col-lg-12" style="color: #6281BF;">
								<span class="glyphicon glyphicon-chevron-down"></span> Seen by 4
							</div>
							<!-- begin while for comment of post-->
							<c:forEach items="${postFacebook.listComments}"
								var="commentFacebook">
								<div class="col-lg-1"
									style="padding-right: 0px; margin-top: 10px;">
									<img
										src="http://graph.facebook.com/<c:out value="${commentFacebook.from_client_id}"/>/picture"
										align="middle" width="35px" />

								</div>
								<div class="col-lg-11"
									style="padding-left: 0px; margin-top: 10px;">
									<div class="col-lg-12" style="padding-left: 0px;">
										<span style="color: #6281BF;">${commentFacebook.name_client}</span>
										${commentFacebook.message }
									</div>
									<div class="col-lg-12" style="padding-left: 0px;">
										<span style="color: #BDBDBD">${commentFacebook.date_create }</span>
										<a href="#">Like</a> ${commentFacebook.like_count }
									</div>
								</div>
							</c:forEach>
							<!-- end while for comment of post-->

							<div class="col-lg-12" style="padding-left: 0px;">
								<div class="col-lg-1"
									style="padding-right: 0px; margin-top: 10px;">
									<img
										src="http://graph.facebook.com/<c:out value="${user_id}"/>/picture"
										align="middle" width="35px" />

								</div>
								<div class="col-lg-11"
									style="padding-left: 0px; margin-top: 10px;">
									<div class="col-lg-12" style="padding-left: 0px;">
										<div class="form-group has-warning">
											<input type="text" class="form-control"
												placeholder="Write a comment ... " />
										</div>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>
					<!-- end while for post-->
				</div>
				<!--end cover_status_group -->

			</div>
			<!-- end content -->
			<div id="negative_right">
				<div class="col-sm-3 col-md-2 sidebar_right">
					<ul class="nav nav-sidebar">
						<c:forEach items="${groups}" var="group">
							<li><a href="group?id=${group.getId()}"> <img alt=""
									src="http://graph.facebook.com/<c:out value="${group.getId()}"/>/picture"
									align="middle" /> <c:out value="${group.getName() }" />
							</a></li>

						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- end nagetive_right -->
		</div>
		<!-- end cover_content -->
		<div id="footer"></div>
	</div>
	<!-- cover_all -->
	<jsp:include page="include/effect_footer.jsp" />
	<script src="resources/js/classie.js"></script>
	<script src="resources/js/sidebarEffects.js"></script>
</body>
</html>