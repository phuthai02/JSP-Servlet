package controllers.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import dao.CategoryDAO;
import dao.ProductDAO;
import entities.Product;

@MultipartConfig
@WebServlet({ "/products/show", "/products/index", // GET
		"/products/create", // GET
		"/products/store", // POST
		"/products/edit", // GET
		"/products/update", // POST
		"/products/delete" }) // GET
public class QLProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO pDAO = new ProductDAO();
	private CategoryDAO cDAO = new CategoryDAO();

	public QLProducts() {
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
		} else if (uri.contains("show")) {
			this.show(request, response);
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

	private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("cate_id");
		String st = request.getParameter("star");
		String pr = request.getParameter("price");
		if (id == null && st == null && pr == null) {
			request.setAttribute("list", pDAO.getAll());
		} else if (id != null && st != null && pr == null) {
			request.setAttribute("list", pDAO.getByBound(Integer.parseInt(id), getMin(st), getMax(st)));
		} else if (id != null && st == null && pr != null) {
			request.setAttribute("list", pDAO.getByBound(Integer.parseInt(id), getMin(pr), getMax(pr)));
		} else if (id == null && st != null && pr != null) {
			request.setAttribute("list", pDAO.getPrice(getMin(pr), getMax(pr)));
		} else if (id != null && st != null && pr != null) {
			request.setAttribute("list", pDAO.getByBound(Integer.parseInt(id), getMin(st), getMax(st)));
		} else if (id != null && st == null && pr == null) {
			request.setAttribute("list", pDAO.getCate(Integer.parseInt(id)));
		} else if (id == null && st == null && pr != null) {
			request.setAttribute("list", pDAO.getPrice(getMin(pr), getMax(pr)));
		} else if (id == null && st != null && pr == null) {
			request.setAttribute("list", pDAO.getPrice(getMin(st), getMax(st)));
		}
		request.setAttribute("view", "/views/admin/product/show.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private int getMin(String key) {
		if (key.equals("5")) {
			return 50;
		} else if (key.equals("4.5")) {
			return 31;
		} else if (key.equals("4")) {
			return 0;
		} else {
			return Integer.MIN_VALUE;
		}
	}

	private int getMax(String key) {
		if (key.equals("5")) {
			return Integer.MAX_VALUE;
		} else if (key.equals("4.5")) {
			return 49;
		} else if (key.equals("4")) {
			return 30;
		} else {
			return Integer.MAX_VALUE;
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Product p = pDAO.findByID(Integer.parseInt(request.getParameter("id")));
		try {
			pDAO.delete(p);
			request.getSession().setAttribute("message", "Xoá thành công");
			response.sendRedirect("/Assignment/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Xoá thất bại");
			response.sendRedirect("/Assignment/products/index");
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("listCategory", cDAO.getAll());
		request.setAttribute("p", pDAO.findByID(Integer.parseInt(request.getParameter("id"))));
		request.setAttribute("view", "/views/admin/product/edit.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("listCategory", cDAO.getAll());
		request.setAttribute("view", "/views/admin/product/create.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("list", pDAO.getAll());
		request.setAttribute("view", "/views/admin/product/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Product p = new Product();
		try {
			BeanUtils.populate(p, request.getParameterMap());
			p.setId(Integer.parseInt(request.getParameter("id")));
			p.setCategory(cDAO.findByID(Integer.parseInt(request.getParameter("categoryID"))));
			pDAO.update(p);
			request.getSession().setAttribute("message", "Chỉnh sửa thành công");
			response.sendRedirect("/Assignment/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Chỉnh sửa thất bại");
			response.sendRedirect("/Assignment/products/edit");
		}
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Product p = new Product();
		try {
			BeanUtils.populate(p, request.getParameterMap());
			p.setImg(request.getPart("img").getSubmittedFileName());
			p.setCategory(cDAO.findByID(Integer.parseInt(request.getParameter("categoryID"))));
			pDAO.create(p);
			File dir = new File(request.getServletContext().getRealPath("/images"));
			if (!dir.exists()) {
				dir.mkdir();
			}
			Part img = request.getPart("img");
			File imgFile = new File(dir, img.getSubmittedFileName());
			img.write(imgFile.getAbsolutePath());
			request.getSession().setAttribute("message", "Thêm thành công");
			response.sendRedirect("/Assignment/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Thêm thất bại");
			response.sendRedirect("/Assignment/products/create");
		}

	}

}
