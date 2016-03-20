package com.eventnotifier.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.model.Category;
import com.eventnotifier.service.CategoryService;
import com.eventnotifier.service.impl.CategoryServiceImpl;
import com.eventnotifier.util.Constants;

/**
 * Servlet implementation class EventController
 */
@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger
			.getLogger(CategoryController.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryController() {
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
		LOGGER.info("Category controller called with action - " + action);
		if (action.equals(Constants.ADD)) {
			CategoryService categoryService = new CategoryServiceImpl();
			categoryService.addCategory(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/category-acknowledgement.jsp");
		} else if (action.equals(Constants.VIEW_LIST)) {
			CategoryService categoryService = new CategoryServiceImpl();
			List<Category> categoryList = categoryService.getCategoryList(request, response);
			request.setAttribute("categoryList", categoryList);
			request.getRequestDispatcher("view-category-list.jsp").forward(request, response);
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
