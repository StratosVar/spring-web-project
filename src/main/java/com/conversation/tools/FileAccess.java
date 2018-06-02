package com.conversation.tools;

import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.conversation.model.Conversation;
import com.conversation.model.Message;

import java.io.FileWriter;

public class FileAccess { 

	
	public static void fileWriterAccess(Conversation c, Message m) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date d=new Date();
		dateFormat.format(d);
		m.setDateTime(d);
		
		File directory = new File("./assets/conversation_logs");
		if (!directory.exists()) {
			directory.mkdir();
			// use directory.mkdirs(); if more folders needed
		}
		try {
			FileWriter fw = new FileWriter(directory.getPath() + "/" + c.getId() + "_" + ".txt", true);
			BufferedWriter bw = new BufferedWriter(fw);
			
			@SuppressWarnings("static-access")
			String message = m.toString().format("Sender:%10s %10s Receiver:%10s %10s Date:%s \nMessage:%s",
					m.getSender().getFirstName(),m.getSender().getLastName(),m.getReceiver().getFirstName(), m.getReceiver().getLastName(), m.getDateTime(), m.getText());
			bw.write(message);
			bw.newLine();
			bw.close();
			fw.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	public static void imageWriter(MultipartFile file, int userid,String name) {

		if (!file.isEmpty()) {
			try {
				String fileExtension = FilenameUtils.getExtension(name);
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				File dir = new File("./assets/profile_images");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + userid+"."+fileExtension);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println("You successfully uploaded file=" + name);
			} catch (Exception e) {
				System.out.println("Upload failure " + name + " => " + e.getMessage());
			}
		} else {
			System.out.println("File upload failure " + name + " empty file.");
		}	
	}
	
	
	

}

