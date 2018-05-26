package com.conversation.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.conversation.model.Conversation;
import com.conversation.model.User;


public interface ConversationData extends PagingAndSortingRepository<Conversation, Integer>  {

	
	Conversation findById(int id);
	
	Conversation findByTitle(String s);
	
	Conversation findByTitleOrId(String s,int id);
	
	List<Conversation> findAllByTitle(String s);
	
	List<Conversation> findAllByCreator(User user);
	
	
	Page<Conversation> findAll(Pageable arg0);
}
