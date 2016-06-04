package com.eventnotifier.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.model.City;
import com.eventnotifier.service.CityService;
import com.eventnotifier.service.impl.CityServiceImpl;
import com.eventnotifier.util.Constants;

/**
 * Servlet implementation class EventController
 */
@WebServlet("/CityController")
public class CityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger.getLogger(CityController.class);

	private CityService cityService = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CityController() {
		super();
		this.cityService = new CityServiceImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		LOGGER.info("Action - " + action);
		if (action.equals(Constants.ADD)) {
			this.cityService.addCity(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/city-acknowledgement.jsp");
		} else if (action.equals(Constants.VIEW_LIST)) {
			List<City> cityList = this.cityService.getCityList(request,
					response);
			request.setAttribute("cityList", cityList);
			request.getRequestDispatcher("view-city-list.jsp").forward(request,
					response);
		} else if (action.equals(Constants.UPDATE)) {
		} else if (action.equals(Constants.DELETE)) {
		} else if (action.equals(Constants.GET_CITIES)) {
			List<City> cityList = this.cityService.getCities(request, response);
			StringBuffer sb = new StringBuffer();
			for (City city : cityList) {
				sb.append(city.getCityId() + ":" + city.getCityName()).append(
						",");
			}
			PrintWriter out = response.getWriter();
			out.print(sb);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
