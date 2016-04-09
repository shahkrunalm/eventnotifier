package com.eventnotifier.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventnotifier.model.Event;

public interface EventService {
	void addEvent(HttpServletRequest request, HttpServletResponse response);

	Event viewEvent(HttpServletRequest request, HttpServletResponse response);

	Event updateEvent(HttpServletRequest request, HttpServletResponse response);

	void deleteEvent(HttpServletRequest request, HttpServletResponse response);

	boolean changeStatus(HttpServletRequest request,
			HttpServletResponse response);

	List<Event> getEventList(HttpServletRequest request,
			HttpServletResponse response);

	List<Event> getCategoryWiseEventList(HttpServletRequest request,
			HttpServletResponse response);

	List<Event> getStateWiseEventList(HttpServletRequest request,
			HttpServletResponse response);

	List<Event> getCityWiseEventList(HttpServletRequest request,
			HttpServletResponse response);

	List<Event> getMyEventList(HttpServletRequest request,
			HttpServletResponse response);
}
