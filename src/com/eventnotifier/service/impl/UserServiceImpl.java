package com.eventnotifier.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.MessageDAO;
import com.eventnotifier.dao.UserDAO;
import com.eventnotifier.dao.impl.MessageDAOImpl;
import com.eventnotifier.dao.impl.UserDAOImpl;
import com.eventnotifier.model.Message;
import com.eventnotifier.model.User;
import com.eventnotifier.service.CategoryService;
import com.eventnotifier.service.StateService;
import com.eventnotifier.service.UserService;
import com.eventnotifier.util.DateUtil;
import com.eventnotifier.util.MessageUtil;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = null;
	private CategoryService categoryService = null;
	private StateService stateService = null;
	private MessageDAO messageDAO = null;
	private static final Logger LOGGER = Logger
			.getLogger(UserServiceImpl.class);

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
		String stateId = request.getParameter("stateId");
		String pincode = request.getParameter("pincode");
		String occupation = request.getParameter("occupation");
		String education = request.getParameter("education");
		String email = request.getParameter("email");
		String categoryId = request.getParameter("categoryId");
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
		this.stateService = new StateServiceImpl();
		user.setState(this.stateService.getState(Integer.parseInt(stateId)));
		user.setPincode(pincode);
		user.setOccupation(occupation);
		user.setEducation(education);
		user.setMemberSince(new Date());
		user.setBirthDate(birthDate);
		user.setStatus(1);
		user.setType(2);
		this.categoryService = new CategoryServiceImpl();
		user.setCategory(this.categoryService.getCategory(Integer
				.parseInt(categoryId)));
		this.userDAO = new UserDAOImpl();
		this.userDAO.save(user);
		LOGGER.info("User added successfully.");

		this.messageDAO = new MessageDAOImpl();
		Message message = getMessage(request, user);
		this.messageDAO.save(message);
	}

	private Message getMessage(HttpServletRequest request, User user) {
		Message message = new Message();
		message.setMessageTo(user.getEmail());
		message.setMessageFrom(MessageUtil.SYSTEM_EMAIL);
		message.setMessageOn(new Date());
		message.setSubject(MessageUtil.WELCOME_MSG);
		message.setContent(new MessageUtil().getWelcomeMsg(user));
		return message;
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
		this.userDAO = new UserDAOImpl();
		return this.userDAO.getListByCriteria(new User(), "username", status);
	}

	@Override
	public User getUser(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		this.userDAO = new UserDAOImpl();
		return this.userDAO.getUser(id);
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

	@Override
	public User getUserById(int id) {
		this.userDAO = new UserDAOImpl();
		return this.userDAO.getUser(id);
	}

	@Override
	public List<User> getUserListByCategoryId(int id) {
		this.userDAO = new UserDAOImpl();
		return this.userDAO.getUserListByCategoryId(id);
	}

}
