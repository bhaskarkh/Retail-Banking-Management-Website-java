package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import com.bean.Account;
import com.bean.TransactionDetails;
import com.service.FactoryService;
import com.service.Service;

/**
 * Servlet implementation class ServletCT
 */
public class ServletAccount extends HttpServlet {
	Service service = FactoryService.getService();
	private static final Logger log = Logger.getLogger(ServletAccount.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addaccount")) {
			RequestDispatcher rs = request.getRequestDispatcher("jsp/AddAccountPage.jsp");
			rs.forward(request, response);
		}

		// transaction view USO14 redirect to Viewtransaction Page
		else if (action.equals("viewTransaction")) {
			request.getRequestDispatcher("jsp/viewTransactions.jsp").forward(request, response);
		}

		// transaction view USO14
		else if (action.equals("viewTransactions")) {
			int accountid = Integer.parseInt(request.getParameter("accountid"));
			int transaction = Integer.parseInt(request.getParameter("lastTransactions"));
			String startdate = request.getParameter("startdate");
			String enddate = request.getParameter("enddate");
             
			if (transaction == 99) {
			log.info("View Transactions for account Id: " + accountid);
				try {
					ArrayList<TransactionDetails> list = service.viewTransactionsdate(accountid, startdate,	enddate);
					request.setAttribute("list", list);
					
					request.setAttribute("TotBalance", service.giveTotalBalanceInView(accountid));
					request.getRequestDispatcher("jsp/transactionDetails.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					log.error(e);
				}
			}
			else {
				try {
					ArrayList<TransactionDetails> list = service.viewTransactions(accountid, transaction, startdate,
							enddate);
					request.setAttribute("list", list);
					request.setAttribute("TotBalance", service.giveTotalBalanceInView(accountid));
					request.getRequestDispatcher("jsp/transactionDetails.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					log.error(e);
				}
			}
		} 
		
		else if (action.equalsIgnoreCase("Transfer")) {
			request.getRequestDispatcher("jsp/CashierTransferInput.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		/*
		 * add Account method to add account as saving or current
		 * 
		 */

		if (action.equalsIgnoreCase("submit2")) {
			int CustomerId = Integer.parseInt(request.getParameter("cid"));
			String AccountType = request.getParameter("at");
	
			double DepositAmount = Double.parseDouble(request.getParameter("damount"));
			Account acc = new Account();
			acc.setCustomerId(CustomerId);
			acc.setAccountType(AccountType);
			acc.setDepositAmount(DepositAmount);
			log.info("Adding account for Customer Id: " + CustomerId);
			
			try {
				boolean b = service.createAccount(acc);
				if (b) {
					log.info("Account of" + CustomerId+"Added To DataBase");
					RequestDispatcher rs = request.getRequestDispatcher("jsp/AddAccountSuccessPage.jsp");
					rs.forward(request, response);
				} else {
					RequestDispatcher rs = request.getRequestDispatcher("jsp/AddAccountErrorPage.jsp");
					rs.forward(request, response);
				}
			} catch (SQLException e) {
				log.error(e);
				request.getRequestDispatcher("jsp/AccountIdDoesNotExistsPage.jsp").forward(request, response);
			}

		}

		else if (action.equalsIgnoreCase("transferComplete")) {
			boolean b;
			boolean c;
			boolean a;
			boolean d;
			double tamount = Double.parseDouble(request.getParameter("tamount"));

			int SourceAccountID = Integer.parseInt(request.getParameter("SourceAccountID"));

			int TargetAccountID = Integer.parseInt(request.getParameter("TargetAccountID"));
			double SourceLatestBalance = Double.parseDouble(request.getParameter("SourceLatestBalance"));
			double TargetLatestBalance = Double.parseDouble(request.getParameter("TargetLatestBalance"));
			Service ser = FactoryService.getService();
			if (SourceLatestBalance > 0) {
				log.info("Transfer of amount is Successfull");
				try {
					b = ser.updatebalance(SourceLatestBalance, SourceAccountID);
					a = ser.updatebalance(TargetLatestBalance, TargetAccountID);
					c = ser.updatetransaction(SourceAccountID, tamount);
					d = ser.updatetranscationtarget(TargetAccountID, tamount);

					RequestDispatcher rs = request.getRequestDispatcher("jsp/CashierTransferSuccess.jsp");
					rs.forward(request, response);

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					log.error(e);
				}
			} else {
				RequestDispatcher rs = request.getRequestDispatcher("jsp/CashierTransferError.jsp");
				rs.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("transeferamount")) {
			double tamount = Double.parseDouble(request.getParameter("TransferAmount"));
			int srcaccountid = Integer.parseInt(request.getParameter("SourceAccountID"));
			int trgaccountid = Integer.parseInt(request.getParameter("TargetAccountID"));
			log.info("Transferring amount from "+srcaccountid+" to "+trgaccountid);
			if (srcaccountid != trgaccountid) {
				Service ser = FactoryService.getService();
				try {
					boolean b = ser.check(srcaccountid, trgaccountid);
					if (b) {
						
						Account sourceacc = ser.informationsource(srcaccountid);
						Account targetacc = ser.informationsource(trgaccountid);
						double sourcebal = ser.sourcebalance(tamount, srcaccountid);
						double targetbal = ser.targetbalance(tamount, trgaccountid);
						String sourcename = ser.sourcename(srcaccountid);
						String targetname = ser.sourcename(trgaccountid);
						request.setAttribute("sourcename", sourcename);
						request.setAttribute("tamount", tamount);
						request.setAttribute("targetname", targetname);
						request.setAttribute("sourceacc", sourceacc);
						request.setAttribute("targetacc", targetacc);
						request.setAttribute("sourcebal", sourcebal);
						request.setAttribute("targetbal", targetbal);
						RequestDispatcher rs = request.getRequestDispatcher("jsp/CashierTransferOutput.jsp");
						rs.forward(request, response);
					} else {
						RequestDispatcher rs = request.getRequestDispatcher("jsp/SrcTrgAccountIdNotExists.jsp");
						rs.forward(request, response);
					}

				} catch (SQLException e) {
					log.error(e);
				}

			}

			else {
				request.setAttribute("sameId", "SourceId and TargetId Cant Be same");
				request.getRequestDispatcher("jsp/CashierTransferInput.jsp").forward(request, response);
			}
		}
	}
}
