package com.joethelinguist.wandersafe.services;

import java.util.List;

import com.joethelinguist.wandersafe.models.SosEvent;

public interface SosEventService {
	
	List<SosEvent> getSosEventsByUsername(String username);

}
