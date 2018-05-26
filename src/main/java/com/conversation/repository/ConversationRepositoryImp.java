package com.conversation.repository;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conversation.model.Conversation;

@Repository
public class ConversationRepositoryImp implements ConversationRepository {
	
	
	@Autowired
    private EntityManager sessionFactory;

    private Session getSession() {
        return sessionFactory.unwrap(Session.class);
    }
    

	@Override
	public List<Conversation> getConversations() {
		Session session = getSession();
		Query<Conversation> query = session.createQuery("from Conversation", Conversation.class);
		List<Conversation> conversations = query.getResultList();

		return conversations;
	}

	@Override
	public void saveConversation(Conversation conversation) {
		Session session = getSession();
		session.saveOrUpdate(conversation);

	}
	
	@Override
	public List<Conversation> getConversationsByUserID(int id) {
		Session session = getSession();
		Query<Conversation> query = session.createQuery("from Conversation where creator_id= :id or interlocutor_id= :id1", Conversation.class);
		query.setParameter("id", id);
		query.setParameter("id1", id);
		List<Conversation> conversations = query.getResultList();

		return conversations;
	}


	@Override
	public Conversation getConversationByID(int conversationId) {
		Session session = getSession();
		
		Conversation conversation = session.get(Conversation.class, conversationId);
		return conversation;
	
	}
	
	
	

}
