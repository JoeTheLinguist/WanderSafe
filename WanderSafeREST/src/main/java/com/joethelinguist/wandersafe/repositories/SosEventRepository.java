package com.joethelinguist.wandersafe.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.joethelinguist.wandersafe.models.SosEvent;

public interface SosEventRepository extends JpaRepository<SosEvent, Integer> {
	
	List<SosEvent> findAllByUserUsername(String username);

}
