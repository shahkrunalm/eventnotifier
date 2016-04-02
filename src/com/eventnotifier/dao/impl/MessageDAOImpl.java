package com.eventnotifier.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.eventnotifier.dao.MessageDAO;
import com.eventnotifier.hibernate.HibernateUtil;
import com.eventnotifier.model.Event;
import com.eventnotifier.model.Message;

public class MessageDAOImpl extends BaseDAOImpl<Message, Long> implements
		MessageDAO {

	@Override
	public void sendEventMessage(Event event) {

	}

	private static final Logger LOGGER = Logger.getLogger(MessageDAOImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getMessageList(String emailId) {
		LOGGER.info("Getting messages of " + emailId);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createCriteria(Message.class)
				.addOrder(Order.desc("messageOn"))
				.add(Restrictions.eq("messageTo", emailId))
				.add(Restrictions.eq("fromDeleteStatus", 0)).list();
	}

	@Override
	public Message getMessage(int id) {
		LOGGER.info("Getting message details of id " + id);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return (Message) session.get(Message.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> sentMessageList(String emailId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createCriteria(Message.class)
				.addOrder(Order.desc("messageOn"))
				.add(Restrictions.eq("messageFrom", emailId))
				.add(Restrictions.eq("toDeleteStatus", 0)).list();
	}
}
