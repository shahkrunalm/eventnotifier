package com.eventnotifier.dao.impl;

import org.apache.log4j.Logger;
import org.hibernate.Session;

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

}
