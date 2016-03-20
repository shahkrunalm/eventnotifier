package com.eventnotifier.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity()
@Table(name="state")
@org.hibernate.annotations.Entity(dynamicInsert = true, dynamicUpdate = true, mutable = true)
public class State {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String stateName;
	
	private int status;

	public int getId() {
		return id;
	}

	public void setStateId(int stateId) {
		this.id = stateId;
	}

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
	
	
}
