package com.conversation.service;

import java.util.List;

import com.conversation.model.Conversation;

public interface ConversationService {
	
	public List<Conversation> getConversations();
	public List<Conversation> getConversationsByUserID(int id);
	public void saveConversation(Conversation conversation);
	public Conversation getConversationByID(int conversationId);

}
