package com.eventnotifier.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventnotifier.dao.UserDAO;
import com.eventnotifier.dao.impl.UserDAOImpl;
import com.eventnotifier.model.User;
import com.eventnotifier.service.UserService;
import com.eventnotifier.service.impl.UserServiceImpl;
import com.eventnotifier.util.Constants;
import com.eventnotifier.util.DateUtil;

/**
 * Servlet implementation class Login
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = null;

	/**
	 * Default constructor.
	 */
	public UserController() {
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {
		this.userService = new UserServiceImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		if (action.equals(Constants.LOGIN)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			UserDAO userDAO = new UserDAOImpl();
			User user = userDAO.login(username, password);
			if (user != null) {
				if (user.getStatus() == 0) {
					response.sendRedirect(request.getContextPath()
							+ "/login.jsp?code=2");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					session.setAttribute("lastLogin",
							DateUtil.getFormattedDate(user.getLastLogin()));
					user.setLastLogin(new Date());
					userDAO.update(user);
					if (user.getType() == Constants.ADMIN_USER) {
						response.sendRedirect(request.getContextPath()
								+ "/admin-dashboard.jsp");
					} else if (user.getType() == Constants.NORMAL_USER) {
						response.sendRedirect(request.getContextPath()
								+ "/user-dashboard.jsp");
					}
				}
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/login.jsp?code=1");
			}
		} else if (action.equals(Constants.SIGNUP)) {
			this.userService.register(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/user-dashboard.jsp");
		} else if (action.equals(Constants.LOGOUT)) {
			HttpSession session = request.getSession(false);
			if (session == null) {
				response.sendRedirect("login.jsp");
			} else {
				new UserServiceImpl().logout(session);
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		} else if (action.equals(Constants.VIEW_LIST)) {
			List<User> userList = this.userService.getUserList(request,
					response);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("view-user-list.jsp").forward(request,
					response);
		} else if (action.equals(Constants.VIEW_PROFILE)) {
			request.setAttribute("userProfile",
					this.userService.getUser(request, response));
			request.getRequestDispatcher("view-user-profile.jsp").forward(
					request, response);
		} else if (action.equals(Constants.CHANGE_PASSWORD)) {
			int status = this.userService.changePassword(request, response);
			if (status == 0) {
				response.sendRedirect(request.getContextPath()
						+ "/login.jsp?code=0");
			} else {
				if (status == 1) {
					request.setAttribute("code", "1");
				} else if (status == 2) {
					request.setAttribute("code", "2");
				} else {
					request.setAttribute("code", "3");
				}
				request.getRequestDispatcher("change-password.jsp").forward(
						request, response);
			}
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
