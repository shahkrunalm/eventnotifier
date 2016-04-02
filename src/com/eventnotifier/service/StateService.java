package com.eventnotifier.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventnotifier.model.State;

public interface StateService {

	State getState(int id);

	void addState(HttpServletRequest request, HttpServletResponse response);

	List<State> getStateList(HttpServletRequest request,
			HttpServletResponse response);

	State updateState(HttpServletRequest request, HttpServletResponse response);

	void deleteState(HttpServletRequest request, HttpServletResponse response);
}
