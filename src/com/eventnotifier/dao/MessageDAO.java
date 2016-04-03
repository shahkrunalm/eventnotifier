package com.eventnotifier.dao;

import java.util.List;

import com.eventnotifier.model.Event;
import com.eventnotifier.model.Message;

public interface MessageDAO extends BaseDAO<Message, Long> {

	void sendEventMessage(Event event);
	
	void sendEventStatusMessage(Event event, String messageTo);

	List<Message> getMessageList(String emailId);

	List<Message> sentMessageList(String emailId);

	Message getMessage(int id);

}
