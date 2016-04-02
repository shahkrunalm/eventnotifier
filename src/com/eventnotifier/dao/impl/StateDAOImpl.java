package com.eventnotifier.dao.impl;

import org.apache.log4j.Logger;
import org.hibernate.Session;

import com.eventnotifier.dao.StateDAO;
import com.eventnotifier.hibernate.HibernateUtil;
import com.eventnotifier.model.State;

public class StateDAOImpl extends BaseDAOImpl<State, Long> implements StateDAO {

	private static final Logger LOGGER = Logger.getLogger(StateDAOImpl.class);

	@Override
	public State getState(int id) {
		LOGGER.info("Getting state details of id " + id);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return (State) session.get(State.class, id);
	}

}
