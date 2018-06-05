package com.conversation.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.conversation.model.User;

public interface UserData extends PagingAndSortingRepository<User, Integer>  {

List<User> findAllByUsernameOrPassword(String u,String pwd);
User findById(int id);
User findByUsername(String uname);
boolean existsByUsername(String uname);
boolean existsByEmail(String email);
}
