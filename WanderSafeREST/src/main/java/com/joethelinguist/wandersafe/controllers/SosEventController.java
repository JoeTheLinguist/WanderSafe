package com.joethelinguist.wandersafe.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.joethelinguist.wandersafe.models.SosEvent;
import com.joethelinguist.wandersafe.services.SosEventServiceImpl;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/api/v1/sos-events/")
public class SosEventController {
	
	@Autowired
	private SosEventServiceImpl sosEventServiceImpl;
	
	@GetMapping("username/{username}")
	private List<SosEvent> getAllByUsername(@PathVariable String username, HttpServletResponse response) {
		response.setStatus(200);
		return sosEventServiceImpl.getSosEventsByUsername(username);
	}

}
