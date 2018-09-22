package com.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Account;
import com.bean.AddCustomer;
import com.bean.LoginGroupF;
import com.bean.TransactionDetails;

public interface ServiceInterface {
	public LoginGroupF verifyDetails(LoginGroupF login) throws SQLException;
	public boolean addCustomer(AddCustomer customer) throws SQLException;
	public boolean createAccount(Account acc) throws SQLException;
	public int transfer(double tamount, int srcaccountid, int trgaccountid);
	public ArrayList<TransactionDetails> viewTransactions(int accountid, int transaction, String startdate, String enddate) throws SQLException;
	public boolean verifyCustomer(AddCustomer customer) throws SQLException;
	public double giveTotalBalanceInView(int accId) throws SQLException;
	public boolean check(int srcaccountid, int trgaccountid) throws SQLException;
	public ArrayList<TransactionDetails> viewTransactionsdate(int accountid, String startdate, String enddate)throws SQLException;
}
