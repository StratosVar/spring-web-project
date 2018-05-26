package com.conversation.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.conversation.model.Partner;
import com.conversation.model.User;

public interface PartnerData extends PagingAndSortingRepository<Partner, Integer>  {
	
	List<Partner> findAll();
	
//	@Query("SELECT AVG(u.age) from User u")
//    int getAverageAge();
// 
//    @Query(value = "SELECT max(age) from User where first_name <> ?1", nativeQuery = true)
//    int getMaxAgeMinus(String name);

}
