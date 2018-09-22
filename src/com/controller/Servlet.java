package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.bean.LoginGroupF;
import com.service.FactoryService;
import com.service.Service;

public class Servlet extends HttpServlet {
	Service service = FactoryService.getService();
	private static final Logger log = Logger.getLogger(Servlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		// For Logout
		if (action.equalsIgnoreCase("Logout")) {
			log.info("Session Logout");
			HttpSession session = request.getSession();
			session.removeAttribute("AccType");
			session.invalidate();
			response.sendRedirect("jsp/Loginpage.jsp");
		}

		/*
		 * For redirecting it to CAE or CT page based on the role
		 */
		else if (action.equals("HomePage")) {
			HttpSession session = request.getSession();
			String PageCurr = (String) session.getAttribute("currPage");
			if (PageCurr != null) {
				if (PageCurr.equalsIgnoreCase("CustomerAccountExecutive")) {
					log.info("Open CustomerAccountExecutive page");
					request.getRequestDispatcher("jsp/CustomerAccountExecutive.jsp").forward(request, response);
				} else if (PageCurr.equalsIgnoreCase("Cashier")) {
					log.info("Open Cashier page");
					RequestDispatcher rs = request.getRequestDispatcher("jsp/Cashier.jsp");
					rs.forward(request, response);
				}
				else{log.info("Not Logged In Redirect To Login Page");
				RequestDispatcher rs = request.getRequestDispatcher("jsp/Loginpage.jsp");
				rs.forward(request, response);}
			}
			else{log.info("Not Logged In Redirect To Login Page");
			RequestDispatcher rs = request.getRequestDispatcher("jsp/Loginpage.jsp");
			rs.forward(request, response);}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Login Validations using Post Method;
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		// For Login
		if (action.equalsIgnoreCase("Login")) {
			String userid = request.getParameter("UserId");
			String password = request.getParameter("Password");
			LoginGroupF login = new LoginGroupF();
			login.setUserid(userid);
			login.setPassword(password);
			try {
				log.info("Logging In user with ID:" + userid);
				LoginGroupF log = service.verifyDetails(login);
				session.setAttribute("AccType", log.getRole());
				session.setAttribute("currPage", "Loginpage");
				if (log.getRole() == null) {
					request.setAttribute("InvalidData", "Invalid UserName and Password");
					RequestDispatcher rs = request.getRequestDispatcher("jsp/Loginpage.jsp");
					rs.forward(request, response);
				} else if (log.getRole().equalsIgnoreCase("CAE")) {
					// Loggedin session
					boolean LoggedIn = true;
					session.setAttribute("LoggedIn", LoggedIn);
					session.setAttribute("currPage", "Loginpage");
					request.getRequestDispatcher("jsp/CustomerAccountExecutive.jsp").forward(request, response);
				} else if (log.getRole().equalsIgnoreCase("CT")) {
					boolean LoggedIn = true;
					session.setAttribute("LoggedIn", LoggedIn);
					session.setAttribute("currPage", "Loginpage");
					RequestDispatcher rs = request.getRequestDispatcher("jsp/Cashier.jsp");
					rs.forward(request, response);
				} else {
					request.setAttribute("InvalidData", "Invalid UserName and Password");
					RequestDispatcher rs = request.getRequestDispatcher("jsp/Loginpage.jsp");
					rs.forward(request, response);
				}
			} catch (SQLException e) {
				log.error(e);
			}
		}
	}
}