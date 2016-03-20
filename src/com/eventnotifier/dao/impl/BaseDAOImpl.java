package com.eventnotifier.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.eventnotifier.dao.BaseDAO;
import com.eventnotifier.hibernate.HibernateUtil;

public class BaseDAOImpl<T, ID extends Serializable> implements BaseDAO<T, ID> {

	private Class<T> type;

	private SessionFactory sessionFactory;

	private static final Logger LOGGER = Logger.getLogger(BaseDAOImpl.class
			.getName());

	public BaseDAOImpl(final Class<T> type) {
		super();
		this.type = type;
	}

	@SuppressWarnings("unchecked")
	public BaseDAOImpl() {
		this.type = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@SuppressWarnings("unchecked")
	@Override
	public T save(final T entity) {
		LOGGER.info("\n\nsave method of BaseDAOImpl called....");
		T savedEntity = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			savedEntity = (T) session.save(entity);
			tx.commit();
		} catch (Exception e) {

		}

		return savedEntity;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T read(ID id) {
		LOGGER.info("read method of BaseDAOImpl called....");
		T entity = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			System.out.println("id is " + id);
			System.out.println("type is " + this.type.toString());
			entity = (T) session.get(this.type, id);
		} catch (Exception e) {

		}
		return entity;
	}

	@Override
	public void update(T entity) {
		LOGGER.info("\n\n update method of BaseDAOImpl called....");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(entity);
			tx.commit();
			LOGGER.info("Entity updated successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(T entity) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(entity);
			tx.commit();
			LOGGER.info(entity + " is deleted successfully");
		} catch (Exception e) {

		}
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getListByCriteria(final T instance, final String orderBy,
			final int status) {
		Session session = null;
		Criteria criteria = null;
		List<T> list = new ArrayList<T>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			criteria = session.createCriteria(this.type);
			if (status >= 0)
				criteria.add(Restrictions.eq("status", status));
			if (orderBy != null)
				criteria.addOrder(Order.asc(orderBy));
			list = criteria.list();
		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public boolean isExists(final T instance, final String propertyName,
			final String propertyValue) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(this.type);
		criteria.add(Restrictions.eq(propertyName, propertyValue));
		if (criteria.list().size() == 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean changeStatus(T instance) {
		boolean status = false;
		LOGGER.info("\n\n change status method of BaseDAOImpl called....");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(instance);
			tx.commit();
			status = true;
			LOGGER.info("Status updated successfully");
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}

}