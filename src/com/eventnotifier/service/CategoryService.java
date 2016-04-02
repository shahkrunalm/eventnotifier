package com.eventnotifier.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventnotifier.model.Category;

public interface CategoryService {

	Category getCategory(int id);

	void addCategory(HttpServletRequest request, HttpServletResponse response);

	List<Category> getCategoryList(HttpServletRequest request,
			HttpServletResponse response);

	Category updateCategory(HttpServletRequest request,
			HttpServletResponse response);

	void deleteCategory(HttpServletRequest request, HttpServletResponse response);
}
