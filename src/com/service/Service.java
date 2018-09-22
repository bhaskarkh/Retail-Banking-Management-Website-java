package com.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Account;
import com.bean.AddCustomer;

import com.bean.LoginGroupF;
import com.bean.TransactionDetails;
import com.dao.DAO;
import com.dao.FactoryDAO;

public class Service implements ServiceInterface {
	DAO dao = FactoryDAO.getDAO();
	LoginGroupF log = new LoginGroupF();

	public LoginGroupF verifyDetails(LoginGroupF login) throws SQLException {
		return dao.verifyDetails(login);
	}

	@Override
	public boolean addCustomer(AddCustomer customer) throws SQLException {
		return dao.addCustomer(customer); 
	}

	public boolean createAccount(Account acc) throws SQLException {
		boolean b = dao.createAccount(acc);
		return b;
	}

	public int transfer(double tamount, int srcaccountid, int trgaccountid) {
		return dao.transfer(tamount, srcaccountid, trgaccountid);

	}

	@Override
	public ArrayList<TransactionDetails> viewTransactions(int accountid, int transaction, String startdate, String enddate) throws SQLException {
		return dao.viewTransactions(accountid, transaction, startdate, enddate);
	}

	public Account informationsource(int srcaccountid) throws SQLException {
		return dao.informationsource(srcaccountid);
	}

	public double sourcebalance(double tamount, int srcaccountid) throws SQLException {
		return dao.sourcebalance(tamount,srcaccountid);
	}

	public double targetbalance(double tamount, int trgaccountid) throws SQLException {
		return dao.targetbalance(tamount,trgaccountid);
	}

	public String sourcename(int srcaccountid) throws SQLException {
		return dao.sourcename(srcaccountid);
	}

	public boolean updatebalance(double sourceLatestBalance, int sourceAccountID) throws SQLException {
		return dao.updatebalance(sourceLatestBalance,sourceAccountID);
	}

	@Override
	public boolean verifyCustomer(AddCustomer customer) throws SQLException {
		// TODO Auto-generated method stub
		
		return dao.verifyCustomer(customer);
	}


	public boolean updatetransaction(int sourceAccountID, double tamount) throws SQLException {
		return dao.updatetransaction(sourceAccountID,tamount);
	}


	public double giveTotalBalanceInView(int accountid) throws SQLException {
		return dao.giveTotalBalanceInView(accountid);
	}

	public boolean updatetranscationtarget(int targetAccountID, double tamount) throws SQLException {
		return dao.updatetrnsactiontareget(targetAccountID,tamount);
	}

	public boolean check(int srcaccountid, int trgaccountid) throws SQLException {
		return dao.check(srcaccountid, trgaccountid);
	}

	@Override
	public ArrayList<TransactionDetails> viewTransactionsdate(int accountid, String startdate,String enddate) throws SQLException {
		return dao.viewTransactionsdate(accountid, startdate, enddate);
	}

}
