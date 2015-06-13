package org.springframework.social.service;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import facebook4j.Comment;
import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.IdNameEntity;
import facebook4j.Media;
import facebook4j.Notification;
import facebook4j.PagableList;
import facebook4j.PhotoUpdate;
import facebook4j.Post;
import facebook4j.PostUpdate;
import facebook4j.PrivacyBuilder;
import facebook4j.PrivacyParameter;
import facebook4j.PrivacyType;
import facebook4j.Reading;
import facebook4j.ResponseList;
import facebook4j.auth.AccessToken;
import facebook4j.conf.ConfigurationBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.data.repository.query.Parameter;
import org.springframework.stereotype.Service;
import org.springframework.social.dao.PostFacebookDAO;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.Group;
import org.springframework.social.facebook.api.GroupMembership;
import org.springframework.social.facebook.api.Reference;
import org.springframework.social.model.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

/**
 * Facebook4J Service use Facebook4J jar
 * Data.
 * 
 * @author Anh Minh Nguyen
 *
 */
@Service("facebook4JService")
public class Facebook4JService {

	private Facebook facebook;
	SystemService systemService ;

	@Autowired
	UserService userService;
	@Autowired
	PostFacebookService postFacebookService;
	@Autowired
	CommentFacebookService commentFacebookService;
	@Autowired
	GroupFaceService groupDbService;
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	FacebookService facebookService;
	public Facebook4JService() {
		systemService= new SystemService();
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthAppId("1438460799780610")
		  .setOAuthAppSecret("6993efa92ea971fb36e52c41fb316798")
		//  .setOAuthAccessToken("1438460799780610|xdpOmnGZNAmAyJH2N59miDYWbso")
		  .setOAuthPermissions("email,publish_actions,public_profile,  user_likes, "
		  		+ "manage_pages,user_posts,user_groups, user_events, user_photos, user_friends, user_about_me,read_stream");
		FacebookFactory ff = new FacebookFactory(cb.build());
		// Generate facebook instance.
		this.facebook = ff.getInstance();
	}

	
	public FacebookService getFacebookService() {
		return facebookService;
	}


	public void setFacebookService(FacebookService facebookService) {
		this.facebookService = facebookService;
	}


	public ScheduleService getScheduleService() {
		return scheduleService;
	}


	public void setScheduleService(ScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}


	public GroupFaceService getGroupDbService() {
		return groupDbService;
	}


	public void setGroupDbService(GroupFaceService groupDbService) {
		this.groupDbService = groupDbService;
	}


	public SystemService getSystemService() {
		return systemService;
	}


	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}


	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public PostFacebookService getPostFacebookService() {
		return postFacebookService;
	}


	public void setPostFacebookService(PostFacebookService postFacebookService) {
		this.postFacebookService = postFacebookService;
	}


	public CommentFacebookService getCommentFacebookService() {
		return commentFacebookService;
	}


	public void setCommentFacebookService(
			CommentFacebookService commentFacebookService) {
		this.commentFacebookService = commentFacebookService;
	}


	public Facebook getFacebook() {
		return facebook;
	}

	public void setFacebook(Facebook facebook) {
		this.facebook = facebook;
	}
	public void setAccessToken(AccessToken accessToken){
		this.facebook.setOAuthAccessToken(accessToken);
	}
	/**
	 * NOTE: Post to Wall group base on value of MyGroup
	 * @param MyGroup postItem
	 * @return boolean
	 */
	public boolean postToWall(MyGroup postItem)
	{	boolean success=true;
		PrivacyParameter privacy= new PrivacyBuilder().setValue(PrivacyType.EVERYONE).build();
		PostUpdate update = null;
		
		try {
			update = new PostUpdate("");
			if(postItem.getGroupMessage() !=null && !postItem.getGroupMessage().isEmpty()){
				update.message(postItem.getGroupMessage());
			}
			if(postItem.getGroupImage() !=null && !postItem.getGroupImage().isEmpty()){
				update.picture(new URL(postItem.getGroupImage()));
			}
			if(postItem.getGroupName() !=null && !postItem.getGroupName().isEmpty()){
				update.name(postItem.getGroupName());
			}
			if(postItem.getGroupDescription() !=null && !postItem.getGroupDescription().isEmpty()){
				update.description(postItem.getGroupDescription());
			}
			if(postItem.getGroupCaption() !=null && !postItem.getGroupCaption().isEmpty()){
				update.caption(postItem.getGroupCaption());
			}
			if(postItem.getGroupCaption() !=null && !postItem.getGroupCaption().isEmpty()){
				update.link(new URL(postItem.getGroupLink()));
			}
			
			for (String idGroup : postItem.getListGroup()) {
				String idPost= facebook.postFeed(idGroup,update);
				Post post= facebook.getPost(idPost);
				//get GroupFace base on idGroup and current Id user
				GroupFace groupFace=groupDbService.getGroupFaceWithidGroupFaceAndClientId(idGroup, postItem.getClientId());
				//Save PostFacebook to db
				PostFacebook postFacebook = new PostFacebook(
					0, //int id
					idPost,//String idPost from Facebook
					idGroup,//String idGroup on Facebook
					post.getMessage()== null || post.getMessage().isEmpty()? null : post.getMessage() ,//String message
					post.getLink() == null ? null : post.getLink().toString(),//String link
					post.getName()== null || post.getName().isEmpty()? null : post.getName(), // String name
					post.getCaption()== null || post.getCaption().isEmpty()? null : post.getCaption(), //String caption
							post.getDescription()== null || post.getDescription().isEmpty()? null : post.getDescription(),//String description 
					post.getPicture()== null ? null : post.getDescription(), //String picture
					systemService.convertDateToString(post.getCreatedTime()), //String createdDate
					systemService.convertDateToString(post.getUpdatedTime()), //String updated_date
					postItem.getClientId(),//String from_client_id
					post.getLikes() == null || post.getLikes().isEmpty()  ? 0 : post.getLikes().getCount().intValue(), //int like_count
					post.getType()== null || post.getType().isEmpty() ? null :post.getType().toString(),// String type
					groupFace,//GroupFace idGroupFace
					new ArrayList<CommentFacebook>());// List<CommentFacebook> listComments
				
				
				List<CommentFacebook> listComs=new ArrayList<CommentFacebook>();
				for(Comment com: post.getComments()){
					CommentFacebook comment=new CommentFacebook(
							0,
							com.getId(),
							com.getMessage(), 
							com.getFrom().getId(), 
							com.getLikeCount().intValue(),
							postFacebook, 
							com.getFrom().getName(), 
							com.getCreatedTime());
					commentFacebookService.createCommentFacebook(comment);
					listComs.add(comment);
				}
				//set list comments to post
				postFacebook.setListComments(listComs);
				//save postFaceBook to db
				if(!postFacebookService.createPostFacebook(postFacebook)) success=false;
						
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			success=false;
		}
		catch (FacebookException e) {
			// TODO: handle exception
			e.printStackTrace();
			success=false;
		}
		return success;
	}
	
	/**
	 * NOTE: Get Notifications of Group and show it in Detail Group Page
	 * @param String idGroup
	 * @param String idUser of current user
	 * @return List<Notification>
	 */
	public List<Notification> getNotificationsGroup(String idGroup, String idUser){
		ResponseList<Notification> notis=null;
		try {
			notis=facebook.getNotifications(idUser, new Reading().since(new Date(12,6,2015)), true);
			
		} catch (FacebookException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notis;
	}
	
}
