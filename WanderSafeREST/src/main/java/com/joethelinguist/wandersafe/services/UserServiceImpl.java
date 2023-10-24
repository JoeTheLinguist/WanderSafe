package com.joethelinguist.wandersafe.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joethelinguist.wandersafe.models.User;
import com.joethelinguist.wandersafe.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public List<User> getAllUsers() {
		return userRepo.findAll();
	}

}
