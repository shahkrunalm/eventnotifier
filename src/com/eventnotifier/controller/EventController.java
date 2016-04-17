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

import com.eventnotifier.model.Event;
import com.eventnotifier.service.EventService;
import com.eventnotifier.service.impl.EventServiceImpl;
import com.eventnotifier.util.Constants;

/**
 * Servlet implementation class EventController
 */
@WebServlet("/EventController")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger
			.getLogger(EventController.class);

	private EventService eventService = null;

	public void init() throws ServletException {
		LOGGER.info("init() method of EventController called");
		this.eventService = new EventServiceImpl();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventController() {
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
		LOGGER.info("Event controller called with action - " + action);
		if (action.equals(Constants.ADD)) {
			this.eventService.addEvent(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/event-acknowledgement.jsp");
		} else if (action.equals(Constants.VIEW)) {
			Event event = this.eventService.viewEvent(request, response);
			if (event != null) {
				request.setAttribute("event", event);
			} else {
				request.setAttribute("message", "no event found");
			}
			request.getRequestDispatcher("view-event-detail.jsp").forward(
					request, response);
		} else if (action.equals(Constants.UPDATE)) {
			EventService eventService = new EventServiceImpl();
			Event event = eventService.updateEvent(request, response);
			if (event != null) {
				request.setAttribute("event", event);
			} else {
				request.setAttribute("message", "no event found");
			}
			request.getRequestDispatcher("view-event.jsp").forward(request,
					response);
		} else if (action.equals(Constants.DELETE)) {
			this.eventService.deleteEvent(request, response);
		} else if (action.equals(Constants.CHANGE_STATUS)) {
			PrintWriter out = response.getWriter();
			boolean status = this.eventService.changeStatus(request, response);
			if (status) {
				out.print("Event status updated successfully. Please refresh your page.");
			} else {
				out.print("Error occurred while updating event status, please try after sometime.");
			}
		} else if (action.equals(Constants.VIEW_MY_EVENT_LIST)) {
			List<Event> eventList = this.eventService.getMyEventList(request,
					response);
			request.setAttribute("eventList", eventList);
			request.getRequestDispatcher("view-event-list.jsp").forward(
					request, response);

		} else if (action.equals(Constants.VIEW_LIST)) {
			List<Event> eventList = this.eventService.getEventList(request,
					response);
			request.setAttribute("eventList", eventList);
			request.getRequestDispatcher("view-event-list.jsp").forward(
					request, response);

		} else if (action.equals(Constants.CITY)) {
			List<Event> eventList = this.eventService.getCityWiseEventList(
					request, response);
			request.setAttribute("eventList", eventList);
			request.getRequestDispatcher("view-criteria-wise-event-list.jsp")
					.forward(request, response);

		} else if (action.equals(Constants.CATEGORY)) {
			List<Event> eventList = this.eventService.getCategoryWiseEventList(
					request, response);
			request.setAttribute("eventList", eventList);
			request.getRequestDispatcher("view-criteria-wise-event-list.jsp")
					.forward(request, response);

		} else if (action.equals(Constants.STATE)) {
			List<Event> eventList = this.eventService.getStateWiseEventList(
					request, response);
			request.setAttribute("eventList", eventList);
			request.getRequestDispatcher("view-criteria-wise-event-list.jsp")
					.forward(request, response);

		}  else if (action.equals(Constants.SEARCH)) {
			List<Event> eventList = this.eventService.getEventListBySearch(
					request, response);
			request.setAttribute("eventList", eventList);
			request.getRequestDispatcher("search-result-event-list.jsp")
					.forward(request, response);

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