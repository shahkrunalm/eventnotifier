package com.eventnotifier.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.StateDAO;
import com.eventnotifier.dao.impl.StateDAOImpl;
import com.eventnotifier.model.State;
import com.eventnotifier.service.StateService;

public class StateServiceImpl implements StateService {

	private StateDAO stateDAO = null;
	
	private static final Logger LOGGER = Logger
			.getLogger(StateServiceImpl.class);

	@Override
	public void addState(HttpServletRequest request,
			HttpServletResponse response) {
		String stateName = request.getParameter("stateName");
		State state = new State();
		state.setStateName(stateName);
		state.setStatus(1);
		this.stateDAO = new StateDAOImpl();
		this.stateDAO.save(state);
		LOGGER.info("State added successfully");
		loadActiveStates(request, this.stateDAO);
	}

	private void loadActiveStates(HttpServletRequest request, StateDAO stateDAO) {
		request.getServletContext().setAttribute("loadedStateList",
				this.stateDAO.getListByCriteria(new State(), "stateName", 1));
	}

	@Override
	public List<State> getStateList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		this.stateDAO = new StateDAOImpl();
		return this.stateDAO
				.getListByCriteria(new State(), "stateName", status);
	}

	@Override
	public State updateState(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteState(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	public State getState(int id) {
		this.stateDAO = new StateDAOImpl();
		return this.stateDAO.getState(id);
	}

}
