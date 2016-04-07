package com.eventnotifier.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.eventnotifier.dao.CityDAO;
import com.eventnotifier.hibernate.HibernateUtil;
import com.eventnotifier.model.City;

public class CityDAOImpl extends BaseDAOImpl<City, Long> implements CityDAO {

	private static final Logger LOGGER = Logger.getLogger(CityDAOImpl.class);

	@Override
	public City getCity(int id) {
		LOGGER.info("Getting city details of id " + id);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return (City) session.get(City.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<City> getCities(int stateId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createCriteria(City.class)
				.add(Restrictions.eq("state.stateId", stateId))
				.add(Restrictions.eq("status", 1)).list();
	}

}
