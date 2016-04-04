package com.eventnotifier.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventnotifier.model.User;

public interface UserService {
	void register(HttpServletRequest request, HttpServletResponse response);

	int changePassword(HttpServletRequest request, HttpServletResponse response);

	User getUser(HttpServletRequest request, HttpServletResponse response);
	
	User getUserById(int id);

	List<User> getUserList(HttpServletRequest request,
			HttpServletResponse response);

	void logout(HttpSession session);
}
