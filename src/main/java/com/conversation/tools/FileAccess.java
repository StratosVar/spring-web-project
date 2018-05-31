package com.conversation.tools;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;

import com.conversation.model.Conversation;
import com.conversation.model.Message;

import java.io.FileWriter;

public class FileAccess { 

	public static void fileWriterAccess(Conversation c, Message m) {
		File directory = new File("conversation_logs");
		if (!directory.exists()) {
			directory.mkdir();
			// use directory.mkdirs(); if more folders needed
		}
		try {
			FileWriter fw = new FileWriter(directory.getPath() + "/" + c.getId() + "_" + ".txt", true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(m.toString());
			bw.newLine();
			bw.close();
			fw.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	public static void imageWriter(Conversation c, Message m) {
		File directory = new File("profile_images");
		if (!directory.exists()) {
			directory.mkdir();
			// use directory.mkdirs(); if more folders needed
		}
		try {
			FileWriter fw = new FileWriter(directory.getPath() + "/" + c.getId() + "_" + ".txt", true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(m.toString());
			bw.newLine();
			bw.close();
			fw.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	
	
	public static void fileGetAccess(Conversation c) {
		
		
	}

}

