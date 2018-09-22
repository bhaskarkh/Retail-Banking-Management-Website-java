package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import com.bean.AddCustomer;
import com.service.FactoryService;
import com.service.Service;

/**
 * Servlet implementation class ServletCAE
 */
public class ServletCustomer extends HttpServlet {
	Service service = FactoryService.getService();
	private static final Logger log = Logger.getLogger(ServletCustomer.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		/*
		 * For Creating a new Customer, redirect it to addCustomer page;
		 */
		if (action.equalsIgnoreCase("createCustomer")) {
			request.getRequestDispatcher("jsp/AddCustomer.jsp").forward(request, response);
		}
		/*
		 * Adding a new customer based on SSNID 
		 * 
		 */
		else if (action.equalsIgnoreCase("addCustomer")) {
			String ssnid = request.getParameter("SSNID");
			String name = request.getParameter("Name");
			int age=0;
			try{age=Integer.parseInt(request.getParameter("Age"));}
			catch(NumberFormatException ex)
			{
				age=0;
			}
			String addressline2=" ";
			String addressline1 = request.getParameter("AddressLine1");
			
			addressline2=request.getParameter("AddressLine2");
			
		
			String city = request.getParameter("City");
			String state = request.getParameter("State");
			AddCustomer addcustomer = new AddCustomer(ssnid, name, age, addressline1, addressline2, city, state);
			log.info("Adding Customer with SSN Id: " + ssnid);
			try {
				log.info("CustomerDetails Verification="+ service.verifyCustomer(addcustomer));
				if (service.verifyCustomer(addcustomer)) {
					
					
					 if(service.addCustomer(addcustomer)){
					log.info("Adding a Customer to database with SSNID: "+ ssnid);
					request.setAttribute("customer", addcustomer);
					request.getRequestDispatcher("jsp/AddSuccess.jsp").forward(request, response);
					 }
				} else {
					// if ssnid is already present then verifyCustomerError page
					log.info("Adding Customer with SSN Id:"+ssnid+"Failed");
					request.getRequestDispatcher("jsp/verifyCustomerError.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// if insertion Error then it redirects it to Error page
				log.error(e);
				request.getRequestDispatcher("jsp/Error.jsp").forward(request, response);
			}
		}
		
	}
}
