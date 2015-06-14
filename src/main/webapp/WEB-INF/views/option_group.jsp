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
<title>Option</title>

<!--Import CSS  -->
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
<link rel="stylesheet" href="resources/css/jquery.dataTables.css"
	type="text/css" />
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css" />

<!--Import Jquery  -->
<script src="resources/js/jquery/jquery-ui.min.js"></script>
<script src="resources/js/modernizr.custom.js"></script>
<script src="resources/js/jquery/jquery-1.10.2.min.js"></script>
<script src="resources/js/jquery/jquery.dataTables.js"
	type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js"></script>
<!-- Input Ajax PostToWall Group -->
<script language=javascript type="text/javascript"
	src="resources/js/ajaxjson/postToWallGroup.js"></script>

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

.button_general {
	padding: 7px 12px;
	margin-bottom: 20px;
	margin-top: 5px;
}

.button_general:hover {
	background: #FFCC00;
}

.checkbox1 {
	-ms-transform: scale(2); /* IE */
	-moz-transform: scale(2); /* FF */
	-webkit-transform: scale(2); /* Safari and Chrome */
	-o-transform: scale(2); /* Opera */
}

#mytable th, #mytable td {
	padding-left: 20px;
}

#cover_content {
	padding-left: 20px;
	padding-right: 0px;
}

.cover_all_box_group {
	padding: 0px;
}

.fb-send {
	margin: 15px 15px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#mytable").dataTable();

		$("#selectall").click(function(event) { //on click 
			if (this.checked) { // check select status
				$(".checkbox1").each(function() { //loop through each checkbox
					this.checked = true; //select all checkboxes with class "checkbox1"               
				});
			} else {
				$(".checkbox1").each(function() { //loop through each checkbox
					this.checked = false; //deselect all checkboxes with class "checkbox1"                       
				});
			}
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
						<c:forEach items="${friends}" var="friend">
							<li><img
								src="http://graph.facebook.com/<c:out value="${friend.id}"/>/picture"
								align="middle" /> <c:out value="${friend.name}" /></li>

						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- end_negative_left -->
			<div id="content">
				<form:form id="formPostToGroup" modelAttribute="group">
					<div class="col-lg-12">
						<div class="col-lg-12">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-group has-success">
								<form:textarea path="groupMessage" placeholder="Message"
									style="border: .1em solid white;" class="form-control" rows="3" />
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group has-success">
								<form:input path="groupLink" placeholder="Link" type="text"
									class="form-control" />
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group has-warning">
								<form:input path="groupName" type="text" placeholder="Name"
									class="form-control" />
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group has-error">
								<form:input path="groupCaption" placeholder="Caption"
									type="text" class="form-control" />
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group has-error">
								<form:input path="groupDescription" placeholder="Description"
									type="text" class="form-control" />
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group has-error">
								<p class="btn btn-primary"
									style="width: 100%; padding: 20px 0px" role="button"
									id="postToWallGroup">Post</p>
							</div>
						</div>
						<div id="errorPane"></div>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-12">
							<table id="mytable">
								<thead>
									<tr align="left">
										<th><input type="checkbox" id="selectall"
											class="checkbox1" />All</th>
										<th>Image</th>
										<th>Group Name</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="group" items="${groups}">
										<tr>
											<td><form:checkbox class="checkbox1" path="listGroup"
													value="${group.id}" /></td>
											<td><img
												src="http://graph.facebook.com/<c:out value="${group.id}"/>/picture"
												align="middle" /></td>
											<td><c:out value="${group.name}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</form:form>
			</div>
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