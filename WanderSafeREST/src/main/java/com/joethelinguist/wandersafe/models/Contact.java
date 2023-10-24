package com.joethelinguist.wandersafe.models;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Contact {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@OneToOne
	@JoinColumn(name="contact_card_id")
	private ContactCard contactCard;
	@JsonIgnore
	@OneToMany(mappedBy="contact")
	private List<SosEvent> sosEvents;
	
	Contact() {
		
	}
	
	Contact(int id, String name, ContactCard contactCard, List<SosEvent> sosEvents) {
		this.id = id;
		this.name = name;
		this.contactCard = contactCard;
		this.sosEvents = sosEvents;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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
			this.sosEvents = new ArrayList<>();
		}
		if (!sosEvents.contains(sosEvent)) {
			sosEvents.add(sosEvent);
			sosEvent.setContact(this);
		}
	}
	
	public void removeSosEvent(SosEvent sosEvent) {
		if (sosEvents != null && sosEvents.contains(sosEvent)) {
			sosEvents.remove(sosEvent);
			sosEvent.setContact(null);
		}
	}
}
