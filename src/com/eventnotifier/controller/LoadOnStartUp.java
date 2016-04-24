package com.eventnotifier.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.impl.CategoryDAOImpl;
import com.eventnotifier.dao.impl.StateDAOImpl;
import com.eventnotifier.model.Category;
import com.eventnotifier.model.State;
import com.eventnotifier.service.impl.EventServiceImpl;

/**
 * Servlet implementation class LoadOnStartUp
 */
@WebServlet("/load-on-start-up")
public class LoadOnStartUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger.getLogger(LoadOnStartUp.class);

	public void init() throws ServletException {
		LOGGER.info("init() method of LoadOnStartUp called");
		/**
		 * Upcoming event list
		 */
		getServletContext().setAttribute("upcomingEventList",
				new EventServiceImpl().getUpcomingEventList());
		try {
			getServletContext().setAttribute("onGoingEventList",
					new EventServiceImpl().getOnGoingEventList());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getServletContext().setAttribute("pastEventList",
				new EventServiceImpl().getPastEventList());
		/**
		 * category list
		 */
		getServletContext().setAttribute(
				"loadedCategoryList",
				new CategoryDAOImpl().getListByCriteria(new Category(),
						"categoryName", 1));
		/**
		 * state list
		 */
		getServletContext().setAttribute(
				"loadedStateList",
				new StateDAOImpl().getListByCriteria(new State(), "stateName",
						1));
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadOnStartUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
