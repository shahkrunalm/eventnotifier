package com.eventnotifier.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventnotifier.model.Event;
import com.eventnotifier.model.Message;
import com.eventnotifier.model.User;

public interface MessageService {
	List<Message> inbox(HttpServletRequest request, HttpServletResponse response);

	Message getMessage(HttpServletRequest request, HttpServletResponse response);

	void send(HttpServletRequest request, HttpServletResponse response);

	void deleteTo(HttpServletRequest request, HttpServletResponse response);

	void deleteFrom(HttpServletRequest request, HttpServletResponse response);

	List<Message> sentMessageList(HttpServletRequest request,
			HttpServletResponse response);

	void sendEventStatusMessage(HttpServletRequest request, Event event,
			User user);

	void sendEventNotification(HttpServletRequest request, Event event,
			User user);

}
