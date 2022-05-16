package controllers.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entities.User;
import utils.EncryptUtil;

@WebServlet({ "/login", "/logout", "/update" })
public class QLInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao = new UserDAO();

	public QLInfo() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String URI = request.getRequestURI();
		if (URI.contains("logout")) {
			this.logout(request, response);
		} else {
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String URI = request.getRequestURI();
		if (URI.contains("login")) {
			this.login(request, response);
		} else if (URI.contains("update")) {
			this.update(request, response);
		} else {
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		try {
			user = dao.findByID(request.getParameter("username"));
			BeanUtils.populate(user, request.getParameterMap());
			user.setPassword(EncryptUtil.encrypt(request.getParameter("password")));
			dao.update(user);
			request.getSession().setAttribute("message", "Cập nhật người dùng thành công");
			response.sendRedirect("/Assignment/products/show");
		} catch (Exception e) {
			request.getSession().setAttribute("error", "Cập nhật người dùng thất bại");
			e.printStackTrace();
		}

	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().setAttribute("user", null);
		response.sendRedirect("/Assignment/products/show");
	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User u = new User();
		u = dao.findByID(request.getParameter("username"));
		if (u == null) {
			request.getSession().setAttribute("error","Tài khoản người dùng không tồn tại");
			response.sendRedirect("/Assignment/products/show");
		} else if (!EncryptUtil.check(request.getParameter("password"), u.getPassword())) {
			request.getSession().setAttribute("error","Mật khẩu người dùng không chính xác");
			response.sendRedirect("/Assignment/products/show");
		} else {
			request.getSession().setAttribute("message","Đăng nhập thành công");
			request.getSession().setAttribute("user", u);
			response.sendRedirect("/Assignment/products/show");
		}
	}

}
