package com.eventnotifier.dao;

import java.util.List;

import com.eventnotifier.model.Event;

public interface EventDAO extends BaseDAO<Event, Integer> {
	Event getEvent(int id);

	List<Event> getUpcomingEventList();

	List<Event> getMyEventList(int id, int status);

	List<Event> getStateWiseEventList(int stateId);

	List<Event> getCityWiseEventList(int cityId);

	List<Event> getCategoryWiseEventList(int categoryId);
}
