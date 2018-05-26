package com.conversation.repository;

import java.util.List;

import com.conversation.model.Conversation;

public interface ConversationRepository {

	public List<Conversation> getConversations();

	public void saveConversation(Conversation conversation);
	
	public List<Conversation> getConversationsByUserID(int id);

	public Conversation getConversationByID(int conversationId);
	
}
