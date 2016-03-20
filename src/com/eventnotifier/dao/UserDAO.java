package com.eventnotifier.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventnotifier.model.User;

public interface UserDAO extends BaseDAO<User, Long> {
	public User login(String username, String password);

	public User getUser(int id);

	public void logout(HttpServletRequest request, HttpServletResponse response);
}
