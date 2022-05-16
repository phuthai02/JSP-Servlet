package controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entities.User;
import utils.EncryptUtil;

@WebServlet({ "/users", "/users/index", // GET
		"/users/create", // GET
		"/users/store", // POST
		"/users/edit", // GET
		"/users/update", // POST
		"/users/delete", "/users/login" }) // GET
public class QLUsers extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDAO userDao = new UserDAO();

	public QLUsers() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("create")) {
			this.create(request, response);
		} else if (uri.contains("edit")) {
			this.edit(request, response);
		} else if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		} else {
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("store")) {
			this.store(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		}
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list = userDao.getAll();
		request.setAttribute("list", list);
		request.setAttribute("view", "/views/admin/user/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "/views/admin/user/create.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			user.setPassword(EncryptUtil.encrypt(request.getParameter("password")));
			userDao.create(user);
			request.getSession().setAttribute("message", "Thêm người dùng thành công!");
			response.sendRedirect("/Assignment/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Thêm người dùng thất bại!");
			response.sendRedirect("/Assignment/users/create");
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = userDao.findByID(request.getParameter("username"));
		request.setAttribute("u", u);
		request.setAttribute("view", "/views/admin/user/edit.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			user.setPassword(EncryptUtil.encrypt(request.getParameter("password")));
			userDao.update(user);
			request.getSession().setAttribute("message", "Chỉnh sửa người dùng thành công!");
			response.sendRedirect("/Assignment/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Chỉnh sửa người dùng thất bại!");
			response.sendRedirect("/Assignment/users/edit");
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User u = userDao.findByID(request.getParameter("username"));
		try {
			userDao.delete(u);
			request.getSession().setAttribute("message", "Xoá người dùng thành công!");
			response.sendRedirect("/Assignment/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Xoá người dùng thất bại!");
			response.sendRedirect("/Assignment/users/index");
		}
	}

}
