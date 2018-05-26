package com.conversation.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.conversation.model.Message;

public interface MessageData extends PagingAndSortingRepository<Message, Integer> {

	
	List<Message> findAll();
}
