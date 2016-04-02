package com.eventnotifier.dao;

import com.eventnotifier.model.State;

public interface StateDAO extends BaseDAO<State, Long> {

	State getState(int id);
}
