package controllers.user;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import java.util.List;
import java.util.Random;

import dao.BillDAO;
import dao.CartDAO;
import dao.DetailBillDAO;
import entities.Bill;
import entities.Cart;
import entities.CartPK;
import entities.DetailBill;
import entities.Product;
import entities.User;
import dao.ProductDAO;
import dao.UserDAO;

@WebServlet({ "/cart", "/cart/index", // GET
		"/cart/add", // POST
		"/cart/edit", // GET
		"/cart/update", // POST
		"/cart/delete" }) // GET
public class QLCarts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartDAO cdao = new CartDAO();
	private ProductDAO pdao = new ProductDAO();
	private UserDAO udao = new UserDAO();
	private DetailBillDAO dtdao = new DetailBillDAO();
	private BillDAO bdao = new BillDAO();

	public QLCarts() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("edit")) {
			this.edit(request, response);
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
		if (uri.contains("add")) {
			this.add(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		} else {
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			String username = request.getParameter("username");
			int product_id = Integer.parseInt(request.getParameter("pid"));

			CartPK pk = new CartPK(username, product_id);

			Cart cartDelete = cdao.findByID(pk);

			cdao.delete(cartDelete);
			response.sendRedirect("/Assignment/cart/index?username=" + username);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("edit");
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Cart> list = cdao.getByUser(request.getParameter("username"));
		request.setAttribute("list", list);
		request.setAttribute("view", "/views/user/cart/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		List<Cart> list = cdao.getByUser(username);
		SimpleDateFormat fm = new SimpleDateFormat("yyMMddhhssa");
		Random r = new Random();
		String mavd = "PTCF" + fm.format(new Date()) + r.nextInt(100);
		Bill b = new Bill();
		try {
			BeanUtils.populate(b, request.getParameterMap());
			b.setMavd(mavd);
			b.setUser(udao.findByID(username));
			try {
				bdao.create(b);
				for (Cart c : list) {
					int id = c.getId().getProductId();
					if (request.getParameter("check" + id) != null) {
						int amountNew = Integer.parseInt(request.getParameter("amount" + id));
						DetailBill dt = new DetailBill(amountNew, c.getPrice(), pdao.findByID(id), b);
						try {
							dtdao.create(dt);
							cdao.delete(c);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						cdao.delete(c);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("message", "Đặt hàng thành công! Mã vận đơn của bạn là: " + mavd);
			response.sendRedirect("/Assignment/bill/index?username="+username);
		} catch (IllegalAccessException | InvocationTargetException e) {
			request.getSession().setAttribute("error", "Đặt hàng thất bại!");
			e.printStackTrace();
		}
	}

	private void add(HttpServletRequest request, HttpServletResponse response) {
		try {
			String username = request.getParameter("username");
			int product_id = Integer.parseInt(request.getParameter("pid"));
			int amount = Integer.parseInt(request.getParameter("amount"));

			CartPK pk = new CartPK(username, product_id);
			Product p = pdao.findByID(product_id);
			Cart cartOld = cdao.findByID(pk);

			if (cartOld == null) {

				User u = udao.findByID(username);

				Cart cartNew = new Cart(pk, new Date(), amount, p.getPrice(), p, u);
				cdao.create(cartNew);
			} else {
				cartOld.setAmount(cartOld.getAmount() + amount);
				cdao.update(cartOld);
			}
			request.getSession().setAttribute("message", "Đã thêm " + p.getName() + " vào giỏ hàng");
			response.sendRedirect("/Assignment/products/show");

		} catch (Exception e) {
			request.getSession().setAttribute("error", "Lỗi thêm sản phẩm vào giỏ hàng");
			e.printStackTrace();
		}
	}

}
