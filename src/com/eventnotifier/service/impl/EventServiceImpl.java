package com.eventnotifier.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.EventDAO;
import com.eventnotifier.dao.impl.EventDAOImpl;
import com.eventnotifier.model.Event;
import com.eventnotifier.model.User;
import com.eventnotifier.service.EventService;
import com.eventnotifier.util.DateUtil;

public class EventServiceImpl implements EventService {

	private static final Logger LOGGER = Logger
			.getLogger(EventServiceImpl.class);

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
		String city = request.getParameter("city");
		String pincode = request.getParameter("pincode");
		String state = request.getParameter("state");
		String category = request.getParameter("category");
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
		event.setCity(city);
		event.setPincode(pincode);
		event.setState(state);
		event.setCategory(category);
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
		event.setCreatedBy(user.getUsername());
		event.setCreatedOn(new Date());
		event.setIpAddress(request.getRemoteAddr());
		event.setStatus(0);
		EventDAO eventDAO = new EventDAOImpl();
		eventDAO.save(event);
	}

	@Override
	public Event viewEvent(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		EventDAO eventDAO = new EventDAOImpl();
		Event event = eventDAO.getEvent(id);
		return event;
	}

	@Override
	public Event updateEvent(HttpServletRequest request,
			HttpServletResponse response) {
		EventDAO eventDAO = new EventDAOImpl();
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
		EventDAO eventDAO = new EventDAOImpl();
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
		EventDAO eventDAO = new EventDAOImpl();
		Event event = eventDAO.getEvent(id);
		if (status.equals("1")) {
			event.setStatus(1);
			event.setVerifyBy(user.getUsername());
			event.setVerifyOn(new Date());
			event.setApprovedBy(user.getUsername());
			event.setApprovedOn(new Date());
			eventDAO.update(event);
			changeStatus = true;
		} else if (status.equals("2")) {
			event.setStatus(2);
			event.setVerifyBy(user.getUsername());
			event.setVerifyOn(new Date());
			event.setRejectedBy(user.getUsername());
			event.setRejectedOn(new Date());
			eventDAO.update(event);
			changeStatus = true;
		}

		return changeStatus;
	}

	@Override
	public List<Event> getMyEventList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		EventDAO eventDAO = new EventDAOImpl();
		return eventDAO.getMyEventList(user.getUsername(), status);
	}

	@Override
	public List<Event> getEventList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		EventDAO eventDAO = new EventDAOImpl();
		return eventDAO.getListByCriteria(new Event(), "id", status);
	}

}