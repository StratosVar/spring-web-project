package com.conversation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.conversation.model.Message;

public interface MessageData extends PagingAndSortingRepository<Message, Integer> {

	
	List<Message> findAll();
	
	@Query(value = "SELECT count(unread)\n" + 
			"FROM message\n" + 
			"INNER JOIN conversation_messages ON message.id=conversation_messages.messages_id\n" + 
			"WHERE conversation_id=:cid AND receiver_id=:rid AND unread=true;",  nativeQuery=true )
	int CountByConversationIdAndReceiverIdAndUnread(@Param("cid") int cid,@Param("rid") int rid);
	
	@Query(value = "SELECT *\n" + 
			"FROM message\n" + 
			"INNER JOIN conversation_messages ON message.id=conversation_messages.messages_id\n" + 
			"WHERE conversation_id=:cid AND receiver_id=:rid AND unread=true;",  nativeQuery=true )
	List<Message> findAllByConversationIdAndReceiverId(@Param("cid") int cid,@Param("rid") int rid);
}
