package com.joethelinguist.wandersafe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.joethelinguist.wandersafe.models.User;

public interface UserRepository extends JpaRepository<User, String> {

}
