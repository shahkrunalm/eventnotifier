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
@WebServlet("/EventBannerController")
public class EventBannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger
			.getLogger(EventBannerController.class);

	private EventService eventService = null;

	public void init() throws ServletException {
		this.eventService = new EventServiceImpl();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventBannerController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		LOGGER.info("Uploading image");
		this.eventService.uploadEventBanner(request, response);
		request.getRequestDispatcher("event-banner-acknowledgement.jsp")
				.forward(request, response);

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