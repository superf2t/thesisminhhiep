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
	<script src="resources/ckeditor/ckeditor.js"></script>
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
.my_show{
display: none;
}
.sidebar {
	padding-top: 0px;
	padding-left: 20px;
	width: 23%;
}
</style>
<script>
	$(document).ready(function() {
		$(".showme").click(function() {
			$(".my_show").slideToggle();
		});
		if (window.location.hash == '#_=_'){

		    // Check if the browser supports history.replaceState.
		    if (history.replaceState) {

		        // Keep the exact URL up to the hash.
		        var cleanHref = window.location.href.split('#')[0];

		        // Replace the URL in the address bar without messing with the back button.
		        history.replaceState(null, null, cleanHref);

		    } else {

		        // Well, you're on an old browser, we can get rid of the _=_ but not the #.
		        window.location.hash = '';

		    }

		}
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
				<form:form id="formPostToGroup" modelAttribute="group">
					
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
											<li role="presentation" class="active showme"><a href="#">Show Me</a></li>
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
											<li role="presentation" class="active"><a
												href="#" id="postToWallGroup">Post</a></li>
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
					<div class="cover_all_box_group">
						<div class="row placeholders">
							<c:forEach items="${groupFaces}" var="groupFace">
								<div class="col-xs-6 col-sm-3 placeholder">
									<img data-src="holder.js/200x200/auto/sky" width="150px"
										height="150px" class="img-responsive img-circle" alt="200x200"
										src="http://graph.facebook.com/<c:out value="${groupFace.idGroupFace}"/>/picture"
										data-holder-rendered="true">
									<h4>
										<form:checkbox checked="checked" class="checkbox1"
											path="listGroup" value="${groupFace.idGroupFace}" />
										<a href="group?id=${groupFace.idGroupFace}"><c:out value="${groupFace.nameGroupFace }" /></a>
										<span class="notify_new">42</span>
									</h4>
									<span class="text-muted">Overview of Group</span>
								</div>
							</c:forEach>
						</div>

					</div>
					<!-- end cover_group_box -->

				</form:form>
			</div>
			<!-- end content -->
			<div id="negative_right"></div>
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