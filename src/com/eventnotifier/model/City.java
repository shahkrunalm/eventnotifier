package com.eventnotifier.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity()
@Table(name = "city")
@org.hibernate.annotations.Entity(dynamicInsert = true, dynamicUpdate = true, mutable = true)
public class City {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cityId;

	private String cityName;

	@Column(name = "status")
	private int status;

	@ManyToOne
	@JoinColumn(name = "stateId")
	private State state;

	@OneToMany(mappedBy = "city")
	private Set<Event> events;

	@OneToMany(mappedBy = "city")
	private Set<User> users;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public City() {
		super();
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public Set<Event> getEvents() {
		return events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}

}
