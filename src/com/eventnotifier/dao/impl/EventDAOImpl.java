package com.eventnotifier.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.eventnotifier.dao.EventDAO;
import com.eventnotifier.hibernate.HibernateUtil;
import com.eventnotifier.model.Event;

public class EventDAOImpl extends BaseDAOImpl<Event, Integer> implements
		EventDAO {

	private static final Logger LOGGER = Logger.getLogger(EventDAOImpl.class);

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
				.add(Restrictions.eq("status", 1))
				.addOrder(Order.asc("startDate")).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getMyEventList(int id, int status) {
		LOGGER.info("Getting my event list");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Event.class);
		criteria.add(Restrictions.eq("user.id", id));
		if (status >= 0)
			criteria.add(Restrictions.eq("status", status));
		criteria.addOrder(Order.desc("createdOn"));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getStateWiseEventList(int stateId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Event.class);
		criteria.add(Restrictions.eq("state.stateId", stateId));
		criteria.add(Restrictions.ge("startDate", new Date()));
		criteria.add(Restrictions.eq("status", 1));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getCityWiseEventList(int cityId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Event.class);
		criteria.add(Restrictions.eq("city.cityId", cityId));
		criteria.add(Restrictions.ge("startDate", new Date()));
		criteria.add(Restrictions.eq("status", 1));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getCategoryWiseEventList(int categoryId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Event.class);
		criteria.add(Restrictions.eq("category.categoryId", categoryId));
		criteria.add(Restrictions.ge("startDate", new Date()));
		criteria.add(Restrictions.eq("status", 1));
		return criteria.list();
	}

}
