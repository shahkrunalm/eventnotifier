package com.eventnotifier.dao;

import com.eventnotifier.model.City;

public interface CityDAO extends BaseDAO<City, Long> {
	City getCity(int id);
}
