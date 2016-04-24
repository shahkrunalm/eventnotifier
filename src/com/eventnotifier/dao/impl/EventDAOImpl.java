package com.eventnotifier.dao.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
				.add(Restrictions.gt("startDate", new Date()))
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getEventListBySearch(String search) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Event.class);
		criteria.add(Restrictions.like("eventName", search));
		criteria.add(Restrictions.eq("status", 1));
		criteria.addOrder(Order.desc("createdOn"));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getOnGoingEventList() throws ParseException {
		LOGGER.info("Getting ongoing event list");
		/*
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date fromDate = df.parse("2012-04-09 00:00:00");
		Date toDate = df.parse("2012-04-09 23:59:59");
		*/
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		LOGGER.info(dateFormat.parse(dateFormat.format(new Date())));
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createCriteria(Event.class)
				.add(Restrictions.le("startDate", dateFormat.parse(dateFormat.format(new Date()))))
				.add(Restrictions.gt("endDate", dateFormat.parse(dateFormat.format(new Date()))))
				.add(Restrictions.eq("status", 1))
				.addOrder(Order.asc("startDate")).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getPastEventList() {
		LOGGER.info("Getting past event list");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createCriteria(Event.class)
				.add(Restrictions.lt("endDate", new Date()))
				.add(Restrictions.eq("status", 1))
				.addOrder(Order.desc("endDate")).list();
	}

}
