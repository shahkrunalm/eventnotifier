package com.eventnotifier.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.eventnotifier.dao.CategoryDAO;
import com.eventnotifier.dao.impl.CategoryDAOImpl;
import com.eventnotifier.model.Category;
import com.eventnotifier.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	private CategoryDAO categoryDAO = null;
	private static final Logger LOGGER = Logger
			.getLogger(CategoryServiceImpl.class);

	@Override
	public void addCategory(HttpServletRequest request,
			HttpServletResponse response) {
		String categoryName = request.getParameter("categoryName");
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setStatus(1);
		this.categoryDAO = new CategoryDAOImpl();
		this.categoryDAO.save(category);
		LOGGER.info("Category added successfully");
		loadActiveCategories(request, this.categoryDAO);
	}

	private void loadActiveCategories(HttpServletRequest request,
			CategoryDAO categoryDAO) {
		request.getServletContext().setAttribute(
				"loadedCategoryList",
				categoryDAO
						.getListByCriteria(new Category(), "categoryName", 1));
		LOGGER.info("Loaded active categories");
	}

	@Override
	public List<Category> getCategoryList(HttpServletRequest request,
			HttpServletResponse response) {
		int status = Integer.parseInt(request.getParameter("status"));
		this.categoryDAO = new CategoryDAOImpl();
		return this.categoryDAO.getListByCriteria(new Category(),
				"categoryName", status);
	}

	@Override
	public Category updateCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	public Category getCategory(int id) {
		this.categoryDAO = new CategoryDAOImpl();
		return this.categoryDAO.getCategory(id);
	}

}
