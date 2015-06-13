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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.Facebook;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.social.model.*;
import org.springframework.social.service.Facebook4JService;
import org.springframework.social.service.FacebookService;
import org.springframework.social.service.GroupFaceService;
import org.springframework.social.service.BigGroupFaceService;
import org.springframework.social.service.PostFacebookService;
import org.springframework.social.service.SystemService;
import org.springframework.social.service.UserService;

import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.PostUpdate;
import facebook4j.auth.AccessToken;

/**
 * Simple little @Controller that invokes Facebook and renders the result. The
 * injected {@link Facebook} reference is configured with the required
 * authorization credentials for the current user behind the scenes.
 * 
 * @author Keith Donald
 */
@Controller
@SessionAttributes("facebookSession")
public class HomeController {

	
	@Autowired
	PostFacebookService postFacebookService;
	@Autowired
	FacebookService facebookService;
	@Autowired
	BigGroupFaceService bigGroupFaceService;
	@Autowired
	GroupFaceService groupFaceService;
	@Autowired
	Facebook4JService facebook4J;
	@Autowired
	UserService userService;

	/**
	 * NOTE: IN FUTURE THE PAGE WILL USED TO INTRUDUCE ABOUT OUR APP redirect to
	 * intruduce page
	 * 
	 * @param model
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping(value = "intruduce", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String redirectIntruduce(Model model, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}
		return "intruduce";
	}

	/**
	 * NOTE: THE PAGE ONLY USER FOR TEST FUNCTION THAT SEARCHER FROM WEBSITE SO
	 * IN FURTURE THE PAGE WILL REMOVED ) redirect to test page
	 * 
	 * @param model
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping(value = "test", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String redirectTest(Model model, HttpServletRequest req,
			HttpServletResponse res) {

		model.addAttribute("name", facebookService.getUserProfile()
				.getName());
		model.addAttribute("id", facebookService.getUserProfile()
				.getId());
		return "Test";
	}

	/**
	 * redirect to authorizationUrl to find accesstoken
	 * 
	 * @param model
	 * @param req
	 * @param group
	 * @param res
	 * @return
	 */
	@RequestMapping(value = "/", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String redirectLogin(Model model, HttpServletRequest req, HttpServletResponse res) {

		if (!facebookService.getFacebook().isAuthorized()) {
			return "redirect:/signin/facebook";
		}
		
		req.getSession().setAttribute("facebook4JSession", facebook4J);
		StringBuffer callbackURL = req.getRequestURL();
		int index = callbackURL.lastIndexOf("/");
        callbackURL.replace(index, callbackURL.length(), "").append("/callback&method=POST");
	
		return "redirect:"+facebook4J.getFacebook().getOAuthAuthorizationURL(callbackURL.toString());
	}
	@RequestMapping(value = "/callback", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView redirectCallBack(Model model, HttpServletRequest req, HttpServletResponse res) throws FacebookException {

		if (!facebookService.getFacebook().isAuthorized()) {
			return new ModelAndView("redirect:/signin/facebook");
		}
		ModelAndView modelView=new ModelAndView("redirect:/home");
		Facebook4JService face=(Facebook4JService) req.getSession().getAttribute("facebook4JSession");
		String code=req.getParameter("code");
		try{
		//Get User Profile
		FacebookProfile facebookProfile=facebookService.getUserProfile();
		modelView.addObject("facebookSession", facebookProfile);
		 AccessToken accessToken= face.getFacebook().getOAuthAccessToken(code);
		 
		 facebook4J.setAccessToken(accessToken);
		//facebook4J.getFacebook().setOAuthAccessToken(accessToken);
		//Check if user in db or not, if not insert to db
		if(!userService.isExistUserId(facebookProfile.getId())){
			userService.createUser(new User(0, facebookProfile.getId(), null, null, accessToken.getToken()));
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return modelView;
	}
	
	/**
	 * return to Home Page
	 * 
	 * @param model
	 * @param req
	 * @param group
	 * @param res
	 * @return
	 */
	@RequestMapping(value = "/home", method = {RequestMethod.GET,
			RequestMethod.POST })
	public String redirectHome(Model model, HttpServletRequest req,
			@ModelAttribute("group") MyGroup group, HttpServletResponse res,HttpSession session) throws FacebookException {

		if (!facebookService.getFacebook().isAuthorized() || session.getAttribute("facebookSession") == null) {
			return "redirect:/signin/facebook";
		}
		//Get User Profile
		FacebookProfile facebookProfile=(FacebookProfile) session.getAttribute("facebookSession");
		String clientId=facebookProfile.getId();
		
		List<GroupFace> groupFaces;
		String id=req.getParameter("id");
		if(id==null) {
			groupFaces = this.groupFaceService.getAllGroupFaceOfClient(clientId);
		}
		else {
			BigGroupFace bigGroupFace=this.bigGroupFaceService.getBigGroupFace(Integer.parseInt(id));
			groupFaces=bigGroupFace.getListGroupFaces();
		}
		
		//add all group of user in database
		List<GroupMembership> groups=this.facebookService.getFacebookGroups();
		for(GroupMembership groupAddDB:groups) {
			if(!this.groupFaceService.isExistIdGroupFace(groupAddDB.getId(),facebookProfile.getId())) {
				GroupFace groupFace=new GroupFace();
				groupFace.setIdGroupFace(groupAddDB.getId());
				groupFace.setNameGroupFace(groupAddDB.getName());
				groupFace.setClientId(facebookProfile.getId());
				this.groupFaceService.createGroupFace(groupFace);
			}
		}
		
		// Get Friend List
		List<Reference> friends = facebookService.getFacebookFriends();
		List<Reference> friends2 = new ArrayList<Reference>();
		for (int i = 0; i < friends.size(); i++) {

			friends2.add(friends.get(i));
			if (i == 10) {
				break;
			}
		}	
	

		
		List<BigGroupFace> bigGroupFaces=bigGroupFaceService.getAllBigGroupFaceOfClient(clientId);
		
		
		model.addAttribute("user_name", facebookProfile.getName());
		model.addAttribute("user_id", facebookProfile.getId());
		model.addAttribute("bigGroupFaces", bigGroupFaces);	
		model.addAttribute("groupFaces", groupFaces);

		return "my_home";
	}



}
