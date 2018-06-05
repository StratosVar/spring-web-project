package com.conversation.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.conversation.model.Category;
import com.conversation.model.Message;
import com.conversation.model.Partner;
import com.conversation.model.User;

public interface CategoryData extends PagingAndSortingRepository<Category, Integer>  {
	
	ArrayList<Category> findAll();
	
}
