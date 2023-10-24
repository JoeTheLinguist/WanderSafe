package com.joethelinguist.wandersafe.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joethelinguist.wandersafe.models.SosEvent;
import com.joethelinguist.wandersafe.repositories.SosEventRepository;

@Service
public class SosEventServiceImpl implements SosEventService {

	@Autowired
	private SosEventRepository sosEventRepo;
	
	public List<SosEvent> getSosEventsByUsername(String username) {
		return sosEventRepo.findAllByUserUsername(username);
	}
	
}
