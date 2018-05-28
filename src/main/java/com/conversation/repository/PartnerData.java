package com.conversation.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.conversation.model.Category;
import com.conversation.model.Partner;
import com.conversation.model.User;

public interface PartnerData extends PagingAndSortingRepository<Partner, Integer>  {
	
	List<Partner> findAll();
	
	Optional<Partner> findById(int id);
	
		
	@Query(value = "SELECT * FROM partner INNER JOIN category ON category.id=:id",  nativeQuery=true )
	List<Partner> findByCategoryId(@Param("id") int id);
	
	
	
	@Query(value = "SELECT partner.description, partner.user_id,partner.category_id FROM partner WHERE partner.category_id=:id"
			+ " UNION SELECT partner.description, partner.user_id,partner.category_id FROM partner WHERE partner.description LIKE %:keyword% ",  nativeQuery=true )
	List<Partner> findAllByCategoryIdOrDescriptionContaining(@Param("id") int id,@Param("keyword") String keyword, Pageable pageable);
	

	
//	@Query("SELECT AVG(u.age) from User u")
//    int getAverageAge();
// 
//    @Query(value = "SELECT max(age) from User where first_name <> ?1", nativeQuery = true)
//    int getMaxAgeMinus(String name);

}
