<table border="0" width="100%" id="table-with-padding">
	<tr>
		<td align="center">add: <a href="add-event.jsp"
			title="click here to add event">event</a> | <a
			href="add-category.jsp" title="click here to add category">category</a>
			| <a href="add-state.jsp" title="click here to add state">state</a> |
			<a href="add-city.jsp" title="click here to add city">city</a>
		</td>
	</tr>
	<tr>
		<td align="center">view: <a
			href='<%=request.getContextPath()
					+ "/EventController?action=view-list&status=-1"%>'
			title="click here to view event list">event</a> | <a
			href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=-1"%>'
			title="click here to view all category">category</a> | <a
			href='<%=request.getContextPath()
					+ "/StateController?action=view-list&status=-1"%>'
			title="click here to view state list">state</a> | <a
			href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=-1"%>'
			title="click here to view category list">city</a></td>
	</tr>
</table>