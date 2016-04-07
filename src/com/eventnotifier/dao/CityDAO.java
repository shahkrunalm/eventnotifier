package com.eventnotifier.dao;

import java.util.List;

import com.eventnotifier.model.City;

public interface CityDAO extends BaseDAO<City, Long> {
	City getCity(int id);

	List<City> getCities(int id);
}
