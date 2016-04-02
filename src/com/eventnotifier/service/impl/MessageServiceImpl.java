package com.eventnotifier.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventnotifier.dao.MessageDAO;
import com.eventnotifier.dao.impl.MessageDAOImpl;
import com.eventnotifier.model.Message;
import com.eventnotifier.model.User;
import com.eventnotifier.service.MessageService;

public class MessageServiceImpl implements MessageService {

	private MessageDAO messageDAO = null;

	@Override
	public List<Message> inbox(HttpServletRequest request,
			HttpServletResponse response) {
		this.messageDAO = new MessageDAOImpl();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return this.messageDAO.getMessageList(user.getEmail());
		}
		return null;
	}

	@Override
	public Message getMessage(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		this.messageDAO = new MessageDAOImpl();
		Message message = this.messageDAO.getMessage(id);
		User user = (User) request.getSession().getAttribute("user");
		System.out.println("message.getReadStatus() " + message.getReadStatus() );
		System.out.println("message.getMessageTo()" + message.getMessageTo());
		System.out.println("user.getEmail()" + user.getEmail());
		if(message.getReadStatus() == 0 && message.getMessageTo().equals(user.getEmail())) {
			System.out.println("inside if condition");
			message.setReadStatus(1);
			this.messageDAO.update(message);
		}
		return message;
	}

	@Override
	public void send(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		this.messageDAO = new MessageDAOImpl();
		Message message = new Message();
		message.setMessageTo(request.getParameter("messageTo"));
		message.setMessageFrom(user.getEmail());
		message.setSubject(request.getParameter("subject"));
		message.setContent(request.getParameter("content"));
		message.setReadStatus(0);
		message.setTrashStatus(0);
		message.setToDeleteStatus(0);
		message.setFromDeleteStatus(0);
		message.setMessageOn(new Date());
		this.messageDAO.save(message);
	}

	@Override
	public List<Message> sentMessageList(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		this.messageDAO = new MessageDAOImpl();
		return this.messageDAO.sentMessageList(user.getEmail());
	}

	@Override
	public void deleteTo(HttpServletRequest request,
			HttpServletResponse response) {
		this.messageDAO = new MessageDAOImpl();
		int messageId = Integer.parseInt(request.getParameter("messageId"));
		Message message = this.messageDAO.getMessage(messageId);
		message.setToDeleteStatus(-1);
		this.messageDAO.update(message);
	}

	@Override
	public void deleteFrom(HttpServletRequest request,
			HttpServletResponse response) {
		this.messageDAO = new MessageDAOImpl();
		int messageId = Integer.parseInt(request.getParameter("messageId"));
		Message message = this.messageDAO.getMessage(messageId);
		message.setFromDeleteStatus(-1);
		this.messageDAO.update(message);
	}
}
