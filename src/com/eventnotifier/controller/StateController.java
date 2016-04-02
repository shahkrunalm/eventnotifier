package com.eventnotifier.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.model.State;
import com.eventnotifier.service.StateService;
import com.eventnotifier.service.impl.StateServiceImpl;
import com.eventnotifier.util.Constants;

/**
 * Servlet implementation class EventController
 */
@WebServlet("/StateController")
public class StateController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger
			.getLogger(StateController.class);

	private StateService stateService = null;

	public void init() throws ServletException {
		LOGGER.info("init() method of StateController called");
		this.stateService = new StateServiceImpl();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		LOGGER.info("State controller called with action - " + action);
		if (action.equals(Constants.ADD)) {
			this.stateService.addState(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/state-acknowledgement.jsp");
		} else if (action.equals(Constants.VIEW_LIST)) {
			List<State> stateList = this.stateService.getStateList(request,
					response);
			request.setAttribute("stateList", stateList);
			request.getRequestDispatcher("view-state-list.jsp").forward(
					request, response);
		} else if (action.equals(Constants.UPDATE)) {
		} else if (action.equals(Constants.DELETE)) {
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
