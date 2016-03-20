package com.eventnotifier.hibernate;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {
	private static final Logger LOGGER = Logger.getLogger(HibernateUtil.class);
	private static SessionFactory sessionFactory;
	static {
		try {
			sessionFactory = new AnnotationConfiguration()
					.addAnnotatedClass(com.eventnotifier.model.User.class)
					.addAnnotatedClass(com.eventnotifier.model.Event.class)
					.addAnnotatedClass(com.eventnotifier.model.Category.class)
					.addAnnotatedClass(com.eventnotifier.model.State.class)
					.configure().buildSessionFactory();
			LOGGER.info("Session factory initialized");
		} catch (Throwable ex) {
			LOGGER.warn("Error occured while initializing session factory "
					+ ex);
			throw new ExceptionInInitializerError(ex);

		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}
