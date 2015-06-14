$(document)
		.ready(
				function() {
					$(function() {
						var token = $("meta[name='_csrf']").attr("content");
						var header = $("meta[name='_csrf_header']").attr("content");
						$(document).ajaxSend(function(e, xhr, options) {
							xhr.setRequestHeader(header, token);
						});
					});
					$(document)
							.on(
									"click",
									"#postToWallGroup",
									function(e) {
										e.preventDefault();
									var mydata=$("#formPostToGroup").serialize();
									console.log("mydata"+mydata);
										// if you Transaction ajax
										$.ajax({
													type : 'post',
													url : 'postToWallGroupJson',
													data : mydata,
													datatype : 'json',											
													success : function(data) {
														console.log(data);
														
															if (data.success == true) {
																alert("Success!!! "+ data.message);
															
															} else {
																alert("Fail!!!" + data.message);

															}
														
													},
													error : function(a, b, c) {
														alert("Fail:"
																+ "Post TO Group");
																									
														console.log(a);
													}
												});

									});
	
				
				});
