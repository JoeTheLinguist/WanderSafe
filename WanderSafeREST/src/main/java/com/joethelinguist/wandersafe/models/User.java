package com.joethelinguist.wandersafe.models;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class User {

	@Id
	private String username;
	@OneToOne
	@JoinColumn(name="contact_card_id")
	private ContactCard contactCard;
	@JsonIgnore
	@OneToMany(mappedBy="user")
	private List<SosEvent> sosEvents;
	
	User() {
	
	}
	
	User(String username, ContactCard contactCard, List<SosEvent> sosEvents) {
		this.username = username;
		this.contactCard = contactCard;
		this.sosEvents = sosEvents;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public ContactCard getContactCard() {
		return this.contactCard;
	}
	
	public void setContactCard(ContactCard contactCard) {
		this.contactCard = contactCard;
	}
	
	public List<SosEvent> getSosEvents() {
		return this.sosEvents;
	}
	
	public void setSosEvents(List<SosEvent> sosEvents) {
		this.sosEvents = sosEvents;
	}
	
	public void addSosEvent(SosEvent sosEvent) {
		if (sosEvents == null) {
			sosEvents = new ArrayList<>();
		}
		if (!sosEvents.contains(sosEvent)) {
			sosEvents.add(sosEvent);
			sosEvent.setUser(this);
		}
	}
	
	public void removeSosEvent(SosEvent sosEvent) {
		if (sosEvents != null && sosEvents.contains(sosEvent)) {
			sosEvents.remove(sosEvent);
			sosEvent.setUser(null);
		}
	}
	
}
