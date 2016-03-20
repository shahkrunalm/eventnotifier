package com.eventnotifier.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.CategoryDAO;
import com.eventnotifier.dao.impl.CategoryDAOImpl;
import com.eventnotifier.model.Category;
import com.eventnotifier.model.Event;
import com.eventnotifier.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	private static final Logger LOGGER = Logger
			.getLogger(CategoryServiceImpl.class);

	@Override
	public void addCategory(HttpServletRequest request,
			HttpServletResponse response) {
		String categoryName = request.getParameter("categoryName");
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setStatus(1);
		CategoryDAO categoryDAO = new CategoryDAOImpl();
		categoryDAO.save(category);
		
	}

	@Override
	public List<Category> getCategoryList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		CategoryDAO categoryDAO = new CategoryDAOImpl();
		return categoryDAO.getListByCriteria(new Category(), "categoryName", status);
	}

	@Override
	public Event updateCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}


}
