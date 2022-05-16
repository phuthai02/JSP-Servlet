package controllers.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BillDAO;
import dao.DetailBillDAO;
import entities.Bill;
import entities.DetailBill;
import entities.User;


@WebServlet({ "/bill", "/bill/index", // GET
		"/bill/add", // POST
		"/bill/edit", // GET
		"/bill/update", // POST
		"/bill/delete", "/bill/detail" }) // GET
public class QLBills extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BillDAO bdao = new BillDAO();
	private DetailBillDAO dtdao = new DetailBillDAO();
	public QLBills() {
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
		} else if (uri.contains("detail")) {
			this.detail(request, response);
		} else {
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}

	}

	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("mavd");
		Bill b = bdao.findByID(id);
		double tongtien = 0;
		for (int i = 0; i < b.getDetailBills().size(); i++) {
			int tien = b.getDetailBills().get(i).getAmount() * b.getDetailBills().get(i).getPrice();
			tongtien += tien;
		}
		request.setAttribute("tongtien", tongtien + getVAT(tongtien));
		request.setAttribute("bill", b);
		request.setAttribute("view", "/views/user/bill/detail.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
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

	private void update(HttpServletRequest request, HttpServletResponse response) {

	}

	private void add(HttpServletRequest request, HttpServletResponse response) {

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("mavd");
		Bill b = bdao.findByID(id);
		List<DetailBill> list = dtdao.getByMaVD(id);
		try {
			for (DetailBill detailBill : list) {
				dtdao.delete(detailBill);
			}
			bdao.delete(b);
			request.getSession().setAttribute("message", "Huỷ đơn hàng "+id+" thành công");
			User u = (User) request.getSession().getAttribute("user");
			response.sendRedirect("/Assignment/bill/index?username="+u.getUsername());
		} catch (Exception e) {
			request.getSession().setAttribute("error", "Huỷ đơn hàng "+id+" thất bại");
			response.sendRedirect("/Assignment/bill/detail?mavd="+id);
			e.printStackTrace();
		}
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {

	}

	private double getVAT(double s) {
		if (s > 200) {
			return s * 0.1;
		} else if (s > 150) {
			return s * 0.08;
		} else if (s > 100) {
			return s * 0.05;
		} else if (s > 50) {
			return s * 0.03;
		} else {
			return s * 0;
		}
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		List<Bill> list = bdao.getByUser(username);
		request.setAttribute("list", list);
		request.setAttribute("view", "/views/user/bill/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}
}
