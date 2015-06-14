$(document).ready(function() {
					$(function() {
						var token = $("meta[name='_csrf']").attr("content");
						var header = $("meta[name='_csrf_header']").attr("content");
						$(document).ajaxSend(function(e, xhr, options) {
							xhr.setRequestHeader(header, token);
						});
					});
					
					$("#mytable2").dataTable();
					var table=$("#mytable1").DataTable({
						"bFilter" : true,
						responsive : true
					});

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
					
					$(document).on("click","#postAddBigGroup",function(e) {
									e.preventDefault();
									var mydata=$("#formAddBigGroup").serialize();
									console.log("mydata"+mydata);
										$.ajax({
													type : 'post',
													url : 'postAddBigGroupJson',
													data : mydata,
													datatype : 'json',											
													success : function(data) {
														console.log(data);
														
															if (data.success == true) {
																alert("Success!!! "+ data.message);
																table.row.add( [
																          "<a class='btn btn-primary' href='subDeleteBigGroupFace?id="+data.bigGroupFace.idBigGroupFace+"'>Delete</a>",
																          "<img src='resources/images/group.png' width='50px' height='50px'/>",
																          "<a href='#'>"+data.bigGroupFace.nameBigGroupFace+"</a>"
																        ] ).draw();
															
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
