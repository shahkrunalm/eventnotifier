package com.eventnotifier.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.EventDAO;
import com.eventnotifier.dao.MessageDAO;
import com.eventnotifier.dao.impl.EventDAOImpl;
import com.eventnotifier.dao.impl.MessageDAOImpl;
import com.eventnotifier.model.Event;
import com.eventnotifier.model.Message;
import com.eventnotifier.model.User;
import com.eventnotifier.service.CategoryService;
import com.eventnotifier.service.CityService;
import com.eventnotifier.service.EventService;
import com.eventnotifier.service.MessageService;
import com.eventnotifier.service.StateService;
import com.eventnotifier.service.UserService;
import com.eventnotifier.util.DateUtil;
import com.eventnotifier.util.MessageUtil;

public class EventServiceImpl implements EventService {

	private static final Logger LOGGER = Logger
			.getLogger(EventServiceImpl.class);
	private StateService stateService = null;
	private CityService cityService = null;
	private CategoryService categoryService = null;
	private UserService userService = null;
	private MessageService messageService = null;
	private EventDAO eventDAO = null;
	private MessageDAO messageDAO = null;

	@Override
	public void addEvent(HttpServletRequest request,
			HttpServletResponse response) {
		String eventName = request.getParameter("eventName");
		String description = request.getParameter("description");
		Date startDate = DateUtil.convertToSQLDate(request
				.getParameter("startDate"));
		String startHour = request.getParameter("startHour");
		String startMinute = request.getParameter("startMinute");
		String startAMPM = request.getParameter("startAMPM");
		String startTime = startHour + ":" + startMinute + " " + startAMPM;
		Date endDate = DateUtil.convertToSQLDate(request
				.getParameter("endDate"));
		String endHour = request.getParameter("endHour");
		String endMinute = request.getParameter("endMinute");
		String endAMPM = request.getParameter("endAMPM");
		String endTime = endHour + ":" + endMinute + " " + endAMPM;
		String address = request.getParameter("address");
		String landmark = request.getParameter("landmark");
		String cityId = request.getParameter("cityId");
		String pincode = request.getParameter("pincode");
		String stateId = request.getParameter("stateId");
		String categoryId = request.getParameter("categoryId");
		String isChargeable = request.getParameter("isChargeable");
		String fee = request.getParameter("fee");
		String organizedBy = request.getParameter("organizedBy");
		String phoneNo = request.getParameter("phoneNo");
		String faxNo = request.getParameter("faxNo");
		String mobileNo = request.getParameter("mobileNo");
		String contactPerson = request.getParameter("contactPerson");
		String website = request.getParameter("website");
		String emailId = request.getParameter("emailId");
		String termsConditions = request.getParameter("termsConditions");

		Event event = new Event();
		event.setEventName(eventName);
		event.setDescription(description);
		event.setStartDate(startDate);
		event.setStartTime(startTime);
		event.setEndDate(endDate);
		event.setEndTime(endTime);
		event.setAddress(address);
		event.setLandmark(landmark);
		this.cityService = new CityServiceImpl();
		event.setCity(this.cityService.getCity(Integer.parseInt(cityId)));
		event.setPincode(pincode);
		this.stateService = new StateServiceImpl();
		event.setState(this.stateService.getState(Integer.parseInt(stateId)));
		this.categoryService = new CategoryServiceImpl();

		event.setCategory(this.categoryService.getCategory(Integer
				.parseInt(categoryId)));
		event.setIsChargeable(isChargeable);
		event.setFee(fee);
		event.setOrganizedBy(organizedBy);
		event.setPhoneNo(phoneNo);
		event.setFaxNo(faxNo);
		event.setMobileNo(mobileNo);
		event.setContactPerson(contactPerson);
		event.setWebsite(website);
		event.setEmailId(emailId);
		event.setTermsConditions(termsConditions);
		User user = (User) request.getSession().getAttribute("user");
		event.setUser(user);
		event.setCreatedOn(new Date());
		event.setIpAddress(request.getRemoteAddr());
		event.setStatus(0);
		this.eventDAO = new EventDAOImpl();
		this.eventDAO.save(event);

		this.messageDAO = new MessageDAOImpl();
		Message message = getMessage(request, event);
		this.messageDAO.save(message);
	}

	private Message getMessage(HttpServletRequest request, Event event) {
		Message message = new Message();
		message.setMessageTo(MessageUtil.ADMIN_EMAIL);
		message.setMessageFrom(MessageUtil.SYSTEM_EMAIL);
		message.setMessageOn(new Date());
		message.setSubject(MessageUtil.NEW_EVENT_ADDED);
		message.setContent(new MessageUtil().getEventMsgContent(request, event,
				0));
		return message;
	}

	@Override
	public Event viewEvent(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		this.eventDAO = new EventDAOImpl();
		Event event = eventDAO.getEvent(id);
		return event;
	}

	@Override
	public Event updateEvent(HttpServletRequest request,
			HttpServletResponse response) {
		this.eventDAO = new EventDAOImpl();
		int id = 4;
		LOGGER.info("Update Event with id : " + id);
		Event event = eventDAO.getEvent(id);
		event.setEventName("test");
		eventDAO.update(event);
		return event;

	}

	@Override
	public void deleteEvent(HttpServletRequest request,
			HttpServletResponse response) {
		this.eventDAO = new EventDAOImpl();
		int id = 1;
		LOGGER.info("Delete Event with id : " + id);
		Event event = eventDAO.getEvent(id);
		eventDAO.delete(event);
	}

	public List<Event> getUpcomingEventList() {
		return new EventDAOImpl().getUpcomingEventList();
	}

	@Override
	public boolean changeStatus(HttpServletRequest request,
			HttpServletResponse response) {
		boolean changeStatus = false;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");
		this.eventDAO = new EventDAOImpl();
		Event event = eventDAO.getEvent(id);

		int userId = event.getUser().getId();
		this.userService = new UserServiceImpl();
		User usr = this.userService.getUserById(userId);
		int categoryId = event.getCategory().getCategoryId();
		this.messageService = new MessageServiceImpl();
		if (status.equals("1")) {
			event.setStatus(1);
			event.setVerifyBy(user.getUsername());
			event.setVerifyOn(new Date());
			event.setApprovedBy(user.getUsername());
			event.setApprovedOn(new Date());
			eventDAO.update(event);
			changeStatus = true;
			request.getServletContext().setAttribute("upcomingEventList",
					new EventServiceImpl().getUpcomingEventList());
			this.messageService.sendEventStatusMessage(request, event, usr);
			List<User> userList = this.userService
					.getUserListByCategoryId(categoryId);
			for (User u : userList) {
				this.messageService.sendEventNotification(request, event, u);
			}
		} else if (status.equals("2")) {
			event.setStatus(2);
			event.setVerifyBy(user.getUsername());
			event.setVerifyOn(new Date());
			event.setRejectedBy(user.getUsername());
			event.setRejectedOn(new Date());
			eventDAO.update(event);
			changeStatus = true;
			this.messageService.sendEventStatusMessage(request, event, usr);
		}

		return changeStatus;
	}

	@Override
	public List<Event> getMyEventList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		this.eventDAO = new EventDAOImpl();
		return eventDAO.getMyEventList(user.getId(), status);
	}

	@Override
	public List<Event> getEventList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		this.eventDAO = new EventDAOImpl();
		return eventDAO.getListByCriteria(new Event(), "id", status);
	}

	@Override
	public List<Event> getCategoryWiseEventList(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		this.eventDAO = new EventDAOImpl();
		return this.eventDAO.getCategoryWiseEventList(id);
	}

	@Override
	public List<Event> getStateWiseEventList(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		this.eventDAO = new EventDAOImpl();
		return this.eventDAO.getStateWiseEventList(id);
	}

	@Override
	public List<Event> getCityWiseEventList(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		this.eventDAO = new EventDAOImpl();
		return this.eventDAO.getCityWiseEventList(id);
	}

}
