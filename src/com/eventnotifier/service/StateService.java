package com.eventnotifier.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventnotifier.model.Event;
import com.eventnotifier.model.State;

public interface StateService {
	void addState(HttpServletRequest request, HttpServletResponse response);

	List<State> getStateList(HttpServletRequest request,
			HttpServletResponse response);

	Event updateState(HttpServletRequest request,
			HttpServletResponse response);

	void deleteState(HttpServletRequest request, HttpServletResponse response);
}
