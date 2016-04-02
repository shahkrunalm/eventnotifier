package com.eventnotifier.dao.impl;

import org.apache.log4j.Logger;
import org.hibernate.Session;

import com.eventnotifier.dao.CategoryDAO;
import com.eventnotifier.hibernate.HibernateUtil;
import com.eventnotifier.model.Category;

public class CategoryDAOImpl extends BaseDAOImpl<Category, Long> implements
		CategoryDAO {

	private static final Logger LOGGER = Logger.getLogger(CategoryDAOImpl.class);

	@Override
	public Category getCategory(int id) {
		LOGGER.info("Getting category details of id " + id);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return (Category) session.get(Category.class, id);
	}

}
