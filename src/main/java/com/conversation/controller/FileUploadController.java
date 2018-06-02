package com.conversation.controller;


import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.conversation.tools.FileAccess;

@Controller
public class FileUploadController {


	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam(value="name",required=false) String name, @RequestParam("file") MultipartFile file,HttpSession session) {


		int userid=(int)session.getAttribute("id");
	
		FileAccess.imageWriter(file,userid,file.getOriginalFilename());
		
		return "users1";
	}

	
	@RequestMapping(value = "/files/{file_name}", method = RequestMethod.GET)
	public FileSystemResource getFile(@PathVariable("file_name") String fileName) {
		File dir = new File("./assets/profile_images");
		System.out.println(dir);
		System.out.println(dir.getAbsolutePath()+File.separator+fileName);
		
		return new FileSystemResource(dir.getAbsolutePath()+File.separator+fileName);
	}
}