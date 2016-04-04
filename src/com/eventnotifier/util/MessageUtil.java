package com.eventnotifier.util;

import javax.servlet.http.HttpServletRequest;

import com.eventnotifier.model.Event;
import com.eventnotifier.model.User;

public class MessageUtil {

	public static final String ADMIN_EMAIL = "admin@eventnotifier.com";
	public static final String SYSTEM_EMAIL = "system@eventnotifier.com";
	public static final String WELCOME_MSG = "Welcome to Curated Event Notifier";
	public static final String GREETING = "Greetings from Curated Event Notifier.<br><br>";
	public static final String EVENT_APPROVED_MSG = "Your event is approved.";
	public static final String EVENT_REJECTED_MSG = "Your event is rejected.";
	public static final String REGISTER_MSG = "Thank you for registering yourself with us. Happy eventing.<br><br>";
	public static final String FOR_QUERIES_MSG = "For any queries, mail us at info@eventnotifier.com<br><br>";
	public static final String THANKS = "Thanks,<br>";
	public static final String EVENT_NOTIFIER_TEAM = "Curated Event Notifier Team.";
	public static final String NEW_EVENT_ADDED = "New event is added";
	public static final String NEW_EVENT_CONTENT = "Please verify event details and approve/reject it.<br><br>";
	public static final String TWO_BR = "<br><br>";
	public static final String UPDATE_EVENT_CONTENT = "We request you to provide more details. Do not hesitate to contact us for more details";
	public static final String WELCOME_MSG_CONTENT = "In the past 4 months we have stretched our arms to all states of India. We have been assisting more than 100 event seekers every month and now we are one of the largest event discovery portal.";

	public String getEventMsgContent(HttpServletRequest request, Event event,
			int status) {
		StringBuilder sb = new StringBuilder("");
		if (event != null && status == 0) {
			sb.append("Hi admin,").append(TWO_BR);
			sb.append(GREETING);
			sb.append("<a title=\"Click here to view event details\" href=\""
					+ request.getContextPath()
					+ "/EventController?action=view&id=" + event.getId()
					+ "\">View event details</a>");
		}

		sb.append(FOR_QUERIES_MSG).append(THANKS).append(EVENT_NOTIFIER_TEAM);
		return sb.toString();
	}

	public String getWelcomeMsg(User user) {
		StringBuilder sb = new StringBuilder("");
		sb.append("Hi ").append(user.getFirstname()).append(",").append(TWO_BR);
		sb.append(GREETING);
		sb.append(WELCOME_MSG_CONTENT).append(TWO_BR);
		sb.append(
				"Never miss an event. Explore events from any where. Happy eventing!!!")
				.append(TWO_BR);
		sb.append(FOR_QUERIES_MSG).append(THANKS).append(EVENT_NOTIFIER_TEAM);
		return sb.toString();
	}
}
