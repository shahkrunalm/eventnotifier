package com.eventnotifier.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.eventnotifier.dao.EventDAO;
import com.eventnotifier.hibernate.HibernateUtil;
import com.eventnotifier.model.Event;

public class EventDAOImpl extends BaseDAOImpl<Event, Integer> implements
		EventDAO {

	private static final Logger LOGGER = Logger.getLogger(EventDAOImpl.class);

	/*
	 * @Override
	 * 
	 * public Event save(Event event) { Session session =
	 * HibernateUtil.getSessionFactory().getCurrentSession(); Transaction tx =
	 * session.beginTransaction(); session.persist(event); tx.commit(); return
	 * event; }
	 */

	@Override
	public Event getEvent(int id) {
		LOGGER.info("Getting event details of id " + id);
		Event event = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		event = (Event) session.get(Event.class, id);
		return event;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getUpcomingEventList() {
		LOGGER.info("Getting upcoming event list");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createCriteria(Event.class)
				.add(Restrictions.ge("startDate", new Date()))
				.add(Restrictions.eq("status", 1)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getMyEventList(String username, int status) {
		LOGGER.info("Getting upcoming event list");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Event.class);
		criteria.add(Restrictions.eq("createdBy", username));
		if (status >= 0)
			criteria.add(Restrictions.eq("status", status));
		return criteria.list();
	}

}
