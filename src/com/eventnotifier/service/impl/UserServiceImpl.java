package com.eventnotifier.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventnotifier.dao.UserDAO;
import com.eventnotifier.dao.impl.UserDAOImpl;
import com.eventnotifier.model.User;
import com.eventnotifier.service.UserService;
import com.eventnotifier.util.DateUtil;

public class UserServiceImpl implements UserService {

	@Override
	public void register(HttpServletRequest request,
			HttpServletResponse response) {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String occupation = request.getParameter("occupation");
		String education = request.getParameter("education");
		String email = request.getParameter("email");

		Date birthDate = DateUtil.convertToSQLDate(request
				.getParameter("birthDate"));

		User user = new User();
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setUsername(username);
		user.setPassword(password);
		user.setGender(gender);
		user.setMobile(mobile);
		user.setEmail(email);
		user.setAddress(address);
		user.setCity(city);
		user.setState(state);
		user.setPincode(pincode);
		user.setOccupation(occupation);
		user.setEducation(education);
		user.setMemberSince(new Date());
		user.setLastLogin(new Date());
		user.setBirthDate(birthDate);
		user.setStatus(1);
		user.setType(2);

		UserDAO userDAO = new UserDAOImpl();
		userDAO.save(user);

		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		session.setAttribute("lastLogin",
				DateUtil.getFormattedDate(user.getLastLogin()));
	}

	@Override
	public void logout(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null)
			session.invalidate();
	}

	@Override
	public List<User> getUserList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		UserDAO userDAO = new UserDAOImpl();
		return userDAO.getListByCriteria(new User(), "username", status);
	}

	@Override
	public User getUser(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		UserDAO userDAO = new UserDAOImpl();
		return userDAO.getUser(id);
	}

	@Override
	public int changePassword(HttpServletRequest request,
			HttpServletResponse response) {
		String currentPassword = request.getParameter("password");
		String newPassword = request.getParameter("new_password");
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		UserDAO userDAO = new UserDAOImpl();
		if (user != null) {
			if (currentPassword.equals(user.getPassword())) {
				if (currentPassword.equals(newPassword)) {
					return 2;
				} else {
					user.setPassword(newPassword);
					session.setAttribute("user", user);
					userDAO.update(user);
					return 1;
				}
			} else {
				return 3;
			}
		} else {
			return 0;
		}
	}

}
