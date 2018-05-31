package com.conversation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.conversation.model.Partner;
import com.conversation.model.Review;

public interface ReviewData extends PagingAndSortingRepository<Review, Integer>   {

List<Review> findAllByPartner(Partner p);

@Query(value="SELECT COUNT(review) FROM review  WHERE review.partner_id=:id",nativeQuery=true)
Double coutReviews(@Param("id") int id);

@Query(value="SELECT AVG(review.points) FROM review  WHERE review.partner_id=:id",nativeQuery=true)
Double countPoints(@Param("id") int id);
}
