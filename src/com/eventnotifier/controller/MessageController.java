package com.eventnotifier.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.model.Message;
import com.eventnotifier.service.MessageService;
import com.eventnotifier.service.impl.MessageServiceImpl;
import com.eventnotifier.util.Constants;

/**
 * Servlet implementation class MessageController
 */
@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger
			.getLogger(MessageController.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MessageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	private MessageService messageService = null;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		final String action = request.getParameter(Constants.ACTION);
		LOGGER.info("Action - " + action);
		if (action.equals(Constants.INBOX)) {
			this.messageService = new MessageServiceImpl();
			List<Message> messageList = this.messageService.inbox(request,
					response);
			if (messageList != null) {
				request.setAttribute("messageList", messageList);
				request.getRequestDispatcher("inbox.jsp").forward(request,
						response);
			} else {
				response.sendRedirect("login.jsp?code=0");
			}
		} else if (action.equals(Constants.VIEW)) {
			Message message = this.messageService.getMessage(request, response);
			request.setAttribute("message", message);
			request.getRequestDispatcher("view-message.jsp").forward(request,
					response);
		} else if (action.equals(Constants.SEND)) {
			this.messageService = new MessageServiceImpl();
			this.messageService.send(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/message-acknowledgement.jsp");
		} else if (action.equals(Constants.SENT)) {
			this.messageService = new MessageServiceImpl();
			List<Message> messageList = this.messageService.sentMessageList(
					request, response);
			if (messageList != null) {
				request.setAttribute("sentMessageList", messageList);
				request.getRequestDispatcher("sent-messages.jsp").forward(
						request, response);
			} else {
				response.sendRedirect("login.jsp?code=0");
			}

		} else if (action.equals(Constants.DELETE_TO)) {
			this.messageService = new MessageServiceImpl();
			this.messageService.deleteTo(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/MessageController?action=sent");
		} else if (action.equals(Constants.DELETE_FROM)) {
			this.messageService = new MessageServiceImpl();
			this.messageService.deleteFrom(request, response);
			response.sendRedirect(request.getContextPath()
					+ "/MessageController?action=inbox");
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
