package com.eventnotifier.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventnotifier.model.City;

public interface CityService {

	City getCity(int id);

	void addCity(HttpServletRequest request, HttpServletResponse response);

	List<City> getCityList(HttpServletRequest request,
			HttpServletResponse response);

	City updateCity(HttpServletRequest request, HttpServletResponse response);

	void deleteCity(HttpServletRequest request, HttpServletResponse response);
}
