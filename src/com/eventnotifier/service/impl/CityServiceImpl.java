package com.eventnotifier.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.CityDAO;
import com.eventnotifier.dao.impl.CityDAOImpl;
import com.eventnotifier.model.City;
import com.eventnotifier.service.CityService;

public class CityServiceImpl implements CityService {

	private CityDAO cityDAO = null;
	
	private static final Logger LOGGER = Logger
			.getLogger(CityServiceImpl.class);

	@Override
	public void addCity(HttpServletRequest request,
			HttpServletResponse response) {
		String cityName = request.getParameter("cityName");
		City city = new City();
		city.setCityName(cityName);
		city.setStatus(1);
		this.cityDAO = new CityDAOImpl();
		this.cityDAO.save(city);
		LOGGER.info("City added successfully");
		loadActiveCitys(request, this.cityDAO);
	}

	private void loadActiveCitys(HttpServletRequest request, CityDAO cityDAO) {
		request.getServletContext().setAttribute("loadedCityList",
				this.cityDAO.getListByCriteria(new City(), "cityName", 1));
	}

	@Override
	public List<City> getCityList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		this.cityDAO = new CityDAOImpl();
		return this.cityDAO
				.getListByCriteria(new City(), "cityName", status);
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

}
