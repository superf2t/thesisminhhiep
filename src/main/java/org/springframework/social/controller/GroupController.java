/*
 * Copyright 2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.social.controller;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

import facebook4j.Comment;
import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.PagableList;
import facebook4j.Post;
import facebook4j.PostUpdate;
import facebook4j.PrivacyBuilder;
import facebook4j.PrivacyParameter;
import facebook4j.PrivacyType;
import facebook4j.Reading;
import facebook4j.ResponseList;
import facebook4j.auth.AccessToken;
import facebook4j.conf.ConfigurationBuilder;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.FacebookLink;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.Group;
import org.springframework.social.facebook.api.GroupMembership;
import org.springframework.social.facebook.api.Reference;
import org.springframework.social.json.AjaxResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.social.model.*;
import org.springframework.social.service.BigGroupFaceService;
import org.springframework.social.service.CommentFacebookService;
import org.springframework.social.service.Facebook4JService;
import org.springframework.social.service.FacebookService;
import org.springframework.social.service.GroupFaceService;
import org.springframework.social.service.PostFacebookService;
import org.springframework.social.service.ScheduleService;
import org.springframework.social.service.SystemService;

import facebook4j.Media;
import facebook4j.PhotoUpdate;



/**
 * Simple little @Controller that invokes Facebook and renders the result. The
 * injected {@link Facebook} reference is configured with the required
 * authorization credentials for the current user behind the scenes.
 * 
 * @author Keith Donald
 */
@Controller
public class GroupController {


	SystemService systemService=new SystemService();
	@Autowired
	PostFacebookService postFacebookService;
	@Autowired
	FacebookService facebookService;
	
	//Hiep add 9:04 PM date 20/04/2015
	@Autowired
	BigGroupFaceService bigGroupFaceService;
	
	//Hiep add 9:04 PM date 20/04/2015
	@Autowired
	GroupFaceService groupFaceService;
	
	@Autowired
	CommentFacebookService commentFacebookService;
	
	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	Facebook4JService facebook4J;
	/**
	 * redirect to option_group page
	 * 
	 * @param model
	 * @param req
	 * @param res
	 * @param group
	 * @return
	 */
	@RequestMapping(value = "optionGroup", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String redirectOptionGroup(Model model, HttpServletRequest req,
			HttpServletResponse res, @ModelAttribute("group") MyGroup group, HttpSession session) {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}

		// Get Friend List
		List<Reference> friends = facebookService.getFacebookFriends();
		

		// Get Groups of user
		List<GroupMembership> groups =facebookService.getFacebookGroups();

		//Get User Profile
		FacebookProfile facebookProfile=facebookService.getUserProfile();
		
		
	

		model.addAttribute("user_name", facebookProfile.getName());
		model.addAttribute("user_id", facebookProfile.getId());
		model.addAttribute("groups", groups);
		model.addAttribute("friends", friends);

		return "option_group";
	}
	/**
	 * Action for Post to Wall with much group that use Json
	 * 
	 * @param group
	 * @param request
	 * @return
	 * @throws FacebookException 
	 */
	@RequestMapping(value = "/postToWallGroupJson", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody AjaxResponse postToWallGroupJson(
			@ModelAttribute("group") MyGroup group, HttpServletRequest request, HttpSession session) throws FacebookException {

		// Define AjaxResponse
		AjaxResponse response = new AjaxResponse();
		String message = "";
		boolean success = false;
		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			success = false;
			message = "Please login before Post To Group!!!";
		}
		
		FacebookProfile fbProfile=(FacebookProfile) session.getAttribute("facebookSession");
		//Set current user to MyGroup group
		group.setClientId(fbProfile.getId());
		//Post to Wall Groups Facebook
		if(facebook4J.postToWall(group)){
			success = true;
			message = "Success to Post to Group!!!";
		}
		
		response.setMessage(message);
		response.setSuccess(success);
		return response;
	}
	
	
	//Hiep add 9:04 PM date 20/04/2015
	/**
	 * 
	 * @param model
	 * @param req
	 * @param res
	 * @param bigGroupFace
	 * @return
	 */
	@RequestMapping(value = "addBigGroup", method = { RequestMethod.GET,RequestMethod.POST })
	public String redirectAddBigGroup(Model model, HttpServletRequest req,
			HttpServletResponse res, @ModelAttribute("bigGroupFace") BigGroupFace bigGroupFace, HttpSession session) {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}	
		//Get User Profile
		FacebookProfile facebookProfile=facebookService.getUserProfile();

		// Get Groups of user
		List<GroupMembership> groups =facebookService.getFacebookGroups();
		
		//Get bigGroupFace of client.
		String clientId=facebookProfile.getId();
		List<BigGroupFace> bigGroupFaces=bigGroupFaceService.getAllBigGroupFaceOfClient(clientId);
		
		model.addAttribute("user_name", facebookProfile.getName());
		model.addAttribute("user_id", facebookProfile.getId());
		model.addAttribute("bigGroupFaces", bigGroupFaces);
		model.addAttribute("bigGroupFace", new BigGroupFace());
		model.addAttribute("groups", groups);

		return "add_big_group";
	}
	
	@RequestMapping(value = "subDeleteBigGroupFace", method = { RequestMethod.GET,RequestMethod.POST })
	public String subDeleteBigGroupFace(Model model, HttpServletRequest req,HttpServletResponse res, HttpSession session) {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}
		
		this.bigGroupFaceService.deleteBigGroupFaceById(Integer.parseInt(req.getParameter("id")));

		return "redirect:addBigGroup";
	}
	
	//Hiep add 9:04 PM date 20/04/2015
	
	/**
	 * create BigGroupFace
	 * @param bigGroupFace
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/postAddBigGroupJson", method = {RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody AjaxResponse postAddBigGroupJson(@ModelAttribute("bigGroupFace") BigGroupFace bigGroupFace,
			HttpServletRequest request, HttpSession session) {
		
		AjaxResponse response = new AjaxResponse();
		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			response.setSuccess(false);
			response.setMessage("Please Login");
		}
		if(!this.bigGroupFaceService.isExistNameBigGroupFace(bigGroupFace.getNameBigGroupFace()))
		{
				String[] groupIds = request.getParameterValues("names");
				
				List<GroupFace> groupFaces=new ArrayList<GroupFace>();
				List<GroupMembership> groups =facebookService.getFacebookGroups();
				for(String groupId:groupIds)
				{
					GroupFace groupFace=this.groupFaceService.getGroupFaceWithidGroupFaceAndClientId(groupId,facebookService.getUserProfile().getId());
					groupFace.setListBigGroups(null);
					groupFaces.add(groupFace);
					//this.groupFaceService.createGroupFace(groupFace);
				}
				
				bigGroupFace.setClientId(facebookService.getUserProfile().getId());
				bigGroupFace.setListGroupFaces(groupFaces);
				
				boolean check=this.bigGroupFaceService.createBigGroupFace(bigGroupFace);
				if(check)
				{
					response.setSuccess(true);
					bigGroupFace.setListGroupFaces(null);
					response.setBigGroupFace(bigGroupFace);
					response.setMessage("Create Group Successfull");
				}
				else
				{
					response.setSuccess(false);
					response.setMessage("Create Group Fail");
				}	
		}
		else	
		{
			response.setSuccess(false);
			response.setMessage("Group's Name already exist!!!");
		}
		
		return response;
	}
	
	
	@RequestMapping(value = "/group", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String redirectLogin(Model model, HttpServletRequest req,
			@ModelAttribute("group") MyGroup group, HttpServletResponse res, HttpSession session) {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}
		
		FacebookProfile facebookProfile=facebookService.getUserProfile();
		String clientId=facebookProfile.getId();
		
		String idGroup=req.getParameter("id");
		List<PostFacebook> postFacebooks=this.postFacebookService.getPostFacebookbyIdGroup(idGroup,clientId);
		
		for(PostFacebook postFacebook:postFacebooks)
		{
			org.springframework.social.facebook.api.Post post = (this.facebookService.getFacebook().feedOperations().getPost(postFacebook.getIdPost()));
			for(org.springframework.social.facebook.api.Comment com: post.getComments())
			{
				if(!this.commentFacebookService.isExistIdComment(com.getId()))
				{
					FacebookProfile facebookProfileClientId=facebookService.getUserProfileWithClientId(com.getFrom().getId());
					CommentFacebook comF=new CommentFacebook(0, com.getId(), com.getMessage(), com.getFrom().getId(), com.getLikesCount(), postFacebook,facebookProfileClientId.getName(),com.getCreatedTime());
					commentFacebookService.createCommentFacebook(comF);
					
				}
				else
				{
					CommentFacebook comF=commentFacebookService.getCommentFacebookbyIdPost(com.getId());
					comF.setLike_count(com.getLikesCount());
					commentFacebookService.updateLikeCountOfCommentFacebook(comF);
				}
			}
			int likes=post.getLikeCount();
			postFacebook.setLike_count(likes);
			postFacebook.setMessage(post.getMessage());
			this.postFacebookService.updateLikeCountAndMessageOfPostFacebook(postFacebook);
		}
		
		List<PostFacebook> postFacebookTemps=this.postFacebookService.getPostFacebookbyIdGroup(idGroup,clientId);
		postFacebooks=new ArrayList<PostFacebook>();
		for(int i=postFacebookTemps.size()-1;i>=0;i--)
		{
			postFacebooks.add(postFacebookTemps.get(i));
		}
		

		List<BigGroupFace> bigGroupFaces=bigGroupFaceService.getAllBigGroupFaceOfClient(clientId);
		// Get Groups of user
		List<GroupMembership> groups =facebookService.getFacebookGroups();
		
		model.addAttribute("user_name", facebookProfile.getName());
		model.addAttribute("user_id", facebookProfile.getId());
		model.addAttribute("bigGroupFaces", bigGroupFaces);	
		model.addAttribute("groups", groups);
		model.addAttribute("postFacebooks", postFacebooks);
		model.addAttribute("idGroupFace", idGroup);
		return "group";

	}
	
	@RequestMapping(value = "/subPostToSingleGroup", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String subPostToSingleGroup(Model model, HttpServletRequest req,
			@ModelAttribute("group") MyGroup group, HttpServletResponse res, HttpSession session) {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}
		
		facebookService.postToWallGroups(group);
		
		return "redirect:group?id="+group.getListGroup()[0];

	}
	
	/**
	 * create BigGroupFace
	 * @param bigGroupFace
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getPostOfGroupId", method = {RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody AjaxResponse getPostOfGroupId( HttpServletRequest request, HttpSession session) {

		AjaxResponse response = new AjaxResponse();
		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			response.setSuccess(false);
			response.setMessage("Please Login");
		}
		try{
		List<org.springframework.social.facebook.api.Post> list=facebookService.getListPostOfGroupId("943562415694364");
		response.setMessage("Get Posts of Group Successfully!!!" );
		response.setSuccess(true);
		response.setListPosts(list);
		response.setBigGroupFace(null);
		
		}catch(Exception e)
		{
			response.setMessage("Get Posts of Group Fail!!!" );
			response.setSuccess(false);
			response.setListPosts(null);
			response.setBigGroupFace(null);
		}
		
		return response;
	}
	
	@RequestMapping(value = "/schedule", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String redirectSchedule(Model model, HttpServletRequest req,
			HttpServletResponse res, @ModelAttribute("schedule") Schedule schedule, HttpSession session) {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}

		// Get Friend List
		List<Reference> friends = facebookService.getFacebookFriends();
		

		// Get Groups of user
		List<GroupMembership> groups =facebookService.getFacebookGroups();

		//Get User Profile
		FacebookProfile facebookProfile=facebookService.getUserProfile();
		
		List<Schedule> schedules=scheduleService.getAllScheduleOfClient(facebookProfile.getId());
		
	

		model.addAttribute("user_name", facebookProfile.getName());
		model.addAttribute("user_id", facebookProfile.getId());
		model.addAttribute("groups", groups);
		model.addAttribute("schedules",schedules);

		return "add_schedule_group";
	}
	
	
	@RequestMapping(value = "/postCreateScheduleJson", method = {RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody AjaxResponse postCreateScheduleJson(@ModelAttribute("schedule") Schedule schedule
			, HttpServletRequest request, HttpSession session) {
		FacebookProfile facebookProfile=facebookService.getUserProfile();
		AjaxResponse response = new AjaxResponse();
		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			response.setSuccess(false);
			response.setMessage("Please Login");
		}
		String[] groupIds = request.getParameterValues("names");
		String date=request.getParameter("myDate");
		String time=request.getParameter("myTime");
		boolean checkInfo=true;
		String msgCheckInfo="";

		
		
		if(schedule.getGroupMessage()==""||schedule.getGroupMessage()==null)
		{
			checkInfo=false;
			msgCheckInfo="Message not empty";
		}
		else if(date==""||time=="")
		{
			checkInfo=false;
			msgCheckInfo="Please enter date and time";
			
		}
		else if(groupIds==null)
		{
			checkInfo=false;
			msgCheckInfo="Please select least a group";
		}
		
		if(checkInfo)
		{
				String datetime=request.getParameter("myDate")+" "+request.getParameter("myTime");
				schedule.setClientId(facebookProfile.getId());
				schedule.setDatePost(systemService.formatStringToDDMMYYYYHHMMSS(datetime));
				schedule.setState("Pending");
				
				if(this.scheduleService.isExistMessageAndDatePost(facebookProfile.getId(),schedule.getGroupMessage(), schedule.getDatePost()))
				{
						Schedule scheduleE=this.scheduleService.getScheduleOfClientWithMessageAndDatePost(facebookProfile.getId(),schedule.getGroupMessage(), schedule.getDatePost());
						List<GroupFace> listgroupFaceE=scheduleE.getListGroupFaces();
						for(String groupId:groupIds)
						{
							boolean checkE=true;
							for(GroupFace groupFaceE:scheduleE.getListGroupFaces())
							{
								if(groupFaceE.getIdGroupFace().equals(groupId))
								{
									checkE=false;
								}
							}
							if(checkE)
							{
								GroupFace groupFaceE=this.groupFaceService.getGroupFaceWithidGroupFaceAndClientId(groupId, facebookProfile.getId());
								listgroupFaceE.add(groupFaceE);
							}
						}
						scheduleE.setListGroupFaces(listgroupFaceE);
						boolean check=this.scheduleService.updateSchedule(scheduleE);
						if(check)
						{
							response.setSuccess(true);
							schedule.setListGroupFaces(null);
							response.setSchedule(schedule);
							response.setMessage("Create Schedule Successfull");
						}
						else
						{
							response.setSuccess(false);
							response.setMessage("Create Schedule Fail");
						}	
				}else{
						List<GroupFace> listGroupFace=new ArrayList<GroupFace>();
						for(String groupId:groupIds)
						{
							GroupFace groupFace=this.groupFaceService.getGroupFaceWithidGroupFaceAndClientId(groupId, facebookProfile.getId());
							boolean check=true;
							for(GroupFace g:listGroupFace)
							{
								if(g.getIdGroupFace().equals(groupId))
								{
									check=false;
								}
							}
							if(check)
							{
								listGroupFace.add(groupFace);
							}
						}
						schedule.setListGroupFaces(listGroupFace);
						boolean check=scheduleService.createSchedule(schedule);
						if(check)
						{
							response.setSuccess(true);
							schedule.setListGroupFaces(null);
							response.setSchedule(schedule);
							response.setMessage("Create Schedule Successfull");
						}
						else
						{
							response.setSuccess(false);
							response.setMessage("Create Schedule Fail");
						}
				}
		}
		else
		{
			response.setSuccess(false);
			response.setMessage(msgCheckInfo);
		}
		
		return response;
	}
	
	@RequestMapping(value = "/subDeleteSchedule", method = { RequestMethod.GET,RequestMethod.POST })
	public String subDeleteSchedule(Model model, HttpServletRequest req,HttpServletResponse res, HttpSession session) {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}	
		
		this.scheduleService.deleteScheduleId(Integer.parseInt(req.getParameter("id")));

		return "redirect:schedule";
	}
	
	@RequestMapping(value = "/viewDetailScheduleJson", method = {	RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody String viewDetailSchedule(HttpServletRequest request, HttpSession session) {
		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return null;
		}	
		Schedule schedule=this.scheduleService.getScheduleById(Integer.parseInt(request.getParameter("id")));
		String kq = "";
		
		if (schedule == null) {

		} else {

			kq += "<table class='table table-condensed' border='0' style=' width: 500px;margin: auto;'>";
			for(GroupFace group:schedule.getListGroupFaces())
			{
				kq+="<p>"+group.getNameGroupFace()+"</p>";
			}
			kq += "</table>";

		}
		return kq;

	}
}
