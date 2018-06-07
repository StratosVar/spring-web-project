package com.conversation.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.hibernate.QueryException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conversation.model.User;

@Repository
public class UserRepositoryImp implements UserRepository {

	@Autowired
    private EntityManager sessionFactory;

    private Session getSession() {
        return sessionFactory.unwrap(Session.class);
    }
	
	
			
	@Override
	public List<User> getUsers() {	
		Session session = getSession();				
		Query<User> theQuery = session.createQuery("from User order by username",User.class);
	
		List<User> list = theQuery.getResultList();
		return list;
	}

	@Override
	public void saveUser(User user) {
		Session session = getSession();
		session.saveOrUpdate(user);		
	}

	
	
	
	@Override
	public User getUserByUsername(String username) {
		User user=null;
		
		Session session = getSession();
		Query<User> query = session.createQuery("from User where first_name=:username", User.class);
		query.setParameter("username", username);
		try {
			user = query.getSingleResult(); // GET SIGNLE RESULT HAS EXCEPTION AT COMPILETIME
		} catch (QueryException |NullPointerException|NoResultException e) {
			
		}
		return user;
	}

	@Override
	public void deleteUser(int id) {	
		Session session = getSession();
		Query<?> theQuery =session.createQuery("delete from User where id=:customerId");
		theQuery.setParameter("customerId", id);	
		theQuery.executeUpdate();		
	}
	
	
	@Override
	public User getUser(int id) {
		Session session = getSession();	
		User user = session.get(User.class, id);
		return user;
	}
	
	
	@Override
	public boolean checkUsernamePassword(String username, String password) {
	User user=null;
		
		boolean answer= false;
	
		Session session = getSession();
		Query<User> query = session.createQuery("from User where username=:username and password=:password", User.class);
		query.setParameter("username", username);
		query.setParameter("password", password);
		try {
			user = query.getSingleResult();
		} catch (QueryException | NullPointerException | NoResultException e) {
			
		answer=false	;
		}
		
		if (user!=null)
		answer=true;
		
		return answer;
		
	}



	@Override
	public Integer getUserId(String username) {
		User user=null;
		Integer id=null;
		
		Session session = getSession();
		Query<User> query = session.createQuery("from User where username=:username", User.class);
		query.setParameter("username", username);
		try {
			user = query.getSingleResult();
		} catch (QueryException | NullPointerException | NoResultException e) {
			
		id=null;
		}
		
		if (user!=null)
		id=user.getId();
		
		return id;

	}
	
	

	@Override
	public boolean checkIfUsernameExists(String username) {
		User user=null;

		boolean answer= false;

		Session session = getSession();
		Query<User> query = session.createQuery("from User where username=:username", User.class);
		query.setParameter("username", username);

		try {
			user = query.getSingleResult();
		} catch (QueryException | NullPointerException | NoResultException e) {

			answer=false	;
		}

		if (user!=null)
			answer=true;

		return answer;
	}



	@Override
	public boolean checkIfEmailExists(String email) {
		User user=null;

		boolean answer= false;

		Session session = getSession();
		Query<User> query = session.createQuery("from User where email=:email", User.class);
		query.setParameter("email", email);

		try {
			user = query.getSingleResult();
		} catch (QueryException | NullPointerException | NoResultException e) {

			answer=false	;
		}

		if (user!=null)
			answer=true;

		return answer;
	}
	
	
	
	

	
}
