package com.conversation.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversation.model.Conversation;
import com.conversation.repository.ConversationRepository;

@Service
public class ConversationServiceImp implements ConversationService {

	@Autowired
	ConversationRepository conversationRepository;
	
	
	@Override
	@Transactional
	public List<Conversation> getConversations() {	
		return conversationRepository.getConversations();
	}

	@Override
	@Transactional
	public void saveConversation(Conversation conversation) {
		conversationRepository.saveConversation(conversation);
	}
	
	@Override
	@Transactional
	public List<Conversation> getConversationsByUserID(int id) {
		return conversationRepository.getConversationsByUserID(id);
	
	}

	@Override
	@Transactional
	public Conversation getConversationByID(int conversationId) {
		
		return conversationRepository.getConversationByID(conversationId);
	}

}
