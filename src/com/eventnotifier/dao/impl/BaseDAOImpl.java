package com.eventnotifier.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

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

	private static final Logger LOGGER = Logger.getLogger(BaseDAOImpl.class);

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
		T savedEntity = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			savedEntity = (T) session.save(entity);
			tx.commit();
			LOGGER.info(entity + " saved successfully");
		} catch (Exception e) {
			LOGGER.error("Exception occurred while saving " + entity, e);
		}

		return savedEntity;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T read(ID id) {
		T entity = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			entity = (T) session.get(this.type, id);
		} catch (Exception e) {
			LOGGER.error(
					"Exception occurred while getting details of id " + id, e);
		}
		return entity;
	}

	@Override
	public void update(T entity) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(entity);
			tx.commit();
			LOGGER.info(entity + " updated successfully");
		} catch (Exception e) {
			LOGGER.error("Exception occurred while updating " + entity, e);
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
			LOGGER.info(entity + " deleted successfully");
		} catch (Exception e) {
			LOGGER.error("Exception occurred while deleting " + entity, e);
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
			LOGGER.error("Exception occurred while getting list", e);
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
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(instance);
			tx.commit();
			status = true;
			LOGGER.info("Status changed successfully");
		} catch (Exception e) {
			status = false;
			LOGGER.error("Exception occurred while changing status ", e);
		}
		return status;
	}

}