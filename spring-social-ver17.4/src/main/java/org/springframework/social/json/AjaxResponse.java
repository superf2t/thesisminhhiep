package org.springframework.social.json;

import java.util.List;

import org.springframework.social.facebook.api.Group;
import org.springframework.social.facebook.api.Post;
import org.springframework.social.model.BigGroupFace;
import org.springframework.social.model.Schedule;

public class AjaxResponse {
	private boolean success;
	private String message;
	private BigGroupFace bigGroupFace;
	private Schedule schedule;
	private List<Post> listPosts;

	
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
	public List<Post> getListPosts() {
		return listPosts;
	}
	public void setListPosts(List<Post> listPosts) {
		this.listPosts = listPosts;
	}
	public BigGroupFace getBigGroupFace() {
		return bigGroupFace;
	}
	public void setBigGroupFace(BigGroupFace bigGroupFace) {
		this.bigGroupFace = bigGroupFace;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public AjaxResponse(boolean success, String message) {
		super();
		this.success = success;
		this.message = message;
	
	}
	public AjaxResponse(){
		
	}
}
