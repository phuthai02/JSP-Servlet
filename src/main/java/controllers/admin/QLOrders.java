package controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BillDAO;
import entities.Bill;

@WebServlet({ "/order", "/order/index", // GET
		"/order/create", // GET
		"/order/store", // POST
		"/order/edit", // GET
		"/order/update", // POST
		"/order/delete" })
public class QLOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BillDAO bdao = new BillDAO();

	public QLOrders() {
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
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
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
		} 
	}


	private void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void create(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Bill> list;
		if(request.getParameter("stt")==null) {
			list = bdao.getAll();
		}else {
			list = bdao.getByStatus(Integer.parseInt(request.getParameter("stt")));
		}
		request.setAttribute("list", list);
		request.setAttribute("view", "/views/admin/order/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("mavd");
		int stt = Integer.parseInt(request.getParameter("tt"));
		Bill bill = bdao.findByID(id);
		bill.setTrangthai(stt);
		try {
			bdao.update(bill);
		} catch (Exception e) {
			request.getSession().setAttribute("error","Lỗi xác nhận");
			response.sendRedirect("/Assignment/order/index");
			e.printStackTrace();
		}
		if(stt==1) {
			request.getSession().setAttribute("message", "Xác nhân đơn hàng "+id+" thành công");
		} else if(stt==-1) {
			request.getSession().setAttribute("error", "Đã huỷ hơn hàng "+id+" thành công");
		}
		response.sendRedirect("/Assignment/order/index");
	}

	private void store(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

}
