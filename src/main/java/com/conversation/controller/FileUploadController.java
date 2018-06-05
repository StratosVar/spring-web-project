package com.conversation.controller;


import java.io.File;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.conversation.model.User;
import com.conversation.repository.UserData;
import com.conversation.tools.FileAccess;

@Controller
public class FileUploadController {
	
	@Autowired
	UserData ud;

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam(value="name",required=false) String name, @RequestParam("file") MultipartFile file,HttpSession session) {
		
		if (session.getAttribute("id")==null){
			return  "redirect:/logout";
		}	
		
		int userid=(int)session.getAttribute("id");
		String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
		User user=ud.findById(userid);
		user.setProfileimage("/profile_images/"+userid+"."+fileExtension);
		ud.save(user);

		FileAccess.imageWriter(file,userid,file.getOriginalFilename());
		
		return "redirect:/profile";
	}

	

}