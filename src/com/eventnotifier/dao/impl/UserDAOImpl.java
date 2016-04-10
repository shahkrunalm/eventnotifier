package com.eventnotifier.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.eventnotifier.dao.UserDAO;
import com.eventnotifier.hibernate.HibernateUtil;
import com.eventnotifier.model.User;

public class UserDAOImpl extends BaseDAOImpl<User, Long> implements UserDAO {

	private static final Logger LOGGER = Logger.getLogger(UserDAOImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	public User login(String username, String password) {
		List<User> userList = new ArrayList<User>();
		User user = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			userList = session.createCriteria(User.class)
					.add(Restrictions.eq("username", username))
					.add(Restrictions.eq("password", password)).list();
			if (userList.size() == 1) {
				user = userList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		session.invalidate();
	}

	@Override
	public User getUser(int id) {
		LOGGER.info("Getting user details of id " + id);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return (User) session.get(User.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserListByCategoryId(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		return session.createCriteria(User.class)
				.add(Restrictions.eq("category.categoryId", id)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isUserNameAvailable(String username) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		List<User> userList = null;
		try {
			userList = session.createCriteria(User.class)
					.add(Restrictions.eq("username", username)).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (userList != null && userList.size() == 0)
			return true;
		else
			return false;
	}

}
