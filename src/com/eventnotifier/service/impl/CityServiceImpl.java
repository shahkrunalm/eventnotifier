package com.eventnotifier.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.CityDAO;
import com.eventnotifier.dao.impl.CityDAOImpl;
import com.eventnotifier.model.City;
import com.eventnotifier.service.CityService;
import com.eventnotifier.service.StateService;

public class CityServiceImpl implements CityService {

	private CityDAO cityDAO = null;
	private StateService stateService = null;
	private static final Logger LOGGER = Logger
			.getLogger(CityServiceImpl.class);

	@Override
	public void addCity(HttpServletRequest request, HttpServletResponse response) {
		String cityName = request.getParameter("cityName");
		String stateId = request.getParameter("stateId");
		City city = new City();
		city.setCityName(cityName);
		this.stateService = new StateServiceImpl();
		city.setState(this.stateService.getState(Integer.parseInt(stateId)));
		city.setStatus(1);
		this.cityDAO = new CityDAOImpl();
		this.cityDAO.save(city);
		LOGGER.info("City added successfully");
		loadActiveCities(request, this.cityDAO);
	}

	private void loadActiveCities(HttpServletRequest request, CityDAO cityDAO) {
		request.getServletContext().setAttribute("loadedCityList",
				this.cityDAO.getListByCriteria(new City(), "cityName", 1));
		LOGGER.info("Loaded active cities");
	}

	@Override
	public List<City> getCityList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		this.cityDAO = new CityDAOImpl();
		return this.cityDAO.getListByCriteria(new City(), "cityName", status);
	}

	@Override
	public City updateCity(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCity(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	public City getCity(int id) {
		this.cityDAO = new CityDAOImpl();
		return this.cityDAO.getCity(id);
	}

	@Override
	public List<City> getCities(HttpServletRequest request,
			HttpServletResponse response) {
		this.cityDAO = new CityDAOImpl();
		int stateId = Integer.parseInt(request.getParameter("stateId"));
		return this.cityDAO.getCities(stateId);
	}

}
