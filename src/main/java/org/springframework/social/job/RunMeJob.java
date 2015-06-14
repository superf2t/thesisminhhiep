package org.springframework.social.job;
import facebook4j.Comment;
import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.PagableList;
import facebook4j.Post;
import facebook4j.Reading;
import facebook4j.ResponseList;
import facebook4j.auth.AccessToken;
import facebook4j.conf.ConfigurationBuilder;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.joda.time.DateTime;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.social.model.CommentFacebook;
import org.springframework.social.model.GroupFace;
import org.springframework.social.model.MyGroup;
import org.springframework.social.model.PostFacebook;
import org.springframework.social.model.Schedule;
import org.springframework.social.model.User;
import org.springframework.social.service.Facebook4JService;
import org.springframework.social.service.FacebookService;
import org.springframework.social.service.SystemService;
public class RunMeJob extends QuartzJobBean implements Serializable {
	private static final long serialVersionUID = 1L;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	@Override
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {
		// TODO Auto-generated method stub
		// Process @Autowired injection for the given target object, based on
		// the current web application context.

		try {
			System.out.println("\n!!*****Quartz-Start-Job*****!!");
			
			ApplicationContextProvider appContext = new ApplicationContextProvider();
			Facebook4JService facebookService = appContext.getApplicationContext().getBean("facebook4JService", Facebook4JService.class);
			SystemService sysService=facebookService.getSystemService();
			
			try{
			
				//get all schedules
				List<Schedule> schedules= facebookService.getScheduleService()
						.getAllSchedule();
				//loop all schedule
				for(Schedule schedule: schedules) {
					
					//Get system current time and check with Time of schedule post
					Date date=new Date();
					Date systemDate =sysService
							.convertStringToDate(facebookService.getSystemService()
									.convertDateToString(date));
					//get Schedule Date
					Date scheduleDate = sysService
							.convertStringToDate(schedule.getDatePost());
					if(systemDate.getTime() == scheduleDate.getTime()){
						
					//get User base on userId
					User user = facebookService.getUserService().getUserByUserId(schedule.getClientId());	
					//get access Token of that user
					AccessToken accessToken=new AccessToken(user.getAccessToken());
					//Set it to facebook to know that which user need to post 
					facebookService.getFacebook().setOAuthAccessToken(accessToken);
					if("pending".equalsIgnoreCase(schedule.getState())){
					
					// loop all groups that need to post the message
					for(GroupFace group: schedule.getListGroupFaces()){
						
					String idPost=	facebookService.getFacebook().postGroupStatusMessage(group.getIdGroupFace(), schedule.getGroupMessage());
					
					Post post= facebookService.getFacebook().getPost(idPost);
					
					//Save PostFacebook to db
					PostFacebook postFacebook = new PostFacebook(
							0, //int id
							idPost,//String idPost from Facebook
							group.getIdGroupFace(),//String idGroup on Facebook
							post.getMessage()== null || post.getMessage().isEmpty()? null : post.getMessage() ,//String message
							post.getLink() == null ? null : post.getLink().toString(),//String link
							post.getName()== null || post.getName().isEmpty()? null : post.getName(), // String name
							post.getCaption()== null || post.getCaption().isEmpty()? null : post.getCaption(), //String caption
									post.getDescription()== null || post.getDescription().isEmpty()? null : post.getDescription(),//String description 
							post.getPicture()== null ? null : post.getDescription(), //String picture
							sysService.convertDateToString(post.getCreatedTime()), //String createdDate
							sysService.convertDateToString(post.getUpdatedTime()), //String updated_date
							user.getUserId(),//String from_client_id
							post.getLikes() == null || post.getLikes().isEmpty()  ? 0 : post.getLikes().getCount().intValue(), //int like_count
							post.getType()== null || post.getType().isEmpty() ? null :post.getType().toString(),// String type
							group,//GroupFace idGroupFace
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
						facebookService.getCommentFacebookService().createCommentFacebook(comment);
						listComs.add(comment);
					}
					//set list comments to post
					postFacebook.setListComments(listComs);
					//save postFaceBook to db
					facebookService.getPostFacebookService().createPostFacebook(postFacebook);
					}//end group loop
				  }//close if it's pending
					
					schedule.setState("active");
					facebookService.getScheduleService().updateSchedule(schedule);
				}//end if compare sysDate and scheduleDate
			}//end schedule loop
			
			}catch(FacebookException e) {
				e.printStackTrace();
			}
			//System.out.println(feeds.get(0).getMessage());
			//runMeTask.printMe();
			//System.out.println("!!*****Quartz-Minh-Done*****!!");
		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}
