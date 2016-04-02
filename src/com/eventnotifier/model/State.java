package com.eventnotifier.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity()
@Table(name = "state")
@org.hibernate.annotations.Entity(dynamicInsert = true, dynamicUpdate = true, mutable = true)
public class State {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int stateId;

	private String stateName;

	private int status;

	@OneToMany(mappedBy = "state")
	private Set<User> users;

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public State() {
		super();
	}

	public State(String stateName, int status) {
		this.stateName = stateName;
		this.status = status;
	}

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
