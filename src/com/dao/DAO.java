package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Account;
import com.bean.AddCustomer;
import com.bean.LoginGroupF;
import com.bean.TransactionDetails;
import com.service.ServiceInterface;
import com.util.Util;

public class DAO implements DAOInterface {
	Connection con = null;

	public LoginGroupF verifyDetails(LoginGroupF login) throws SQLException {
		// TODO Auto-generated method stub
		con = Util.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from logingroupf where userid=? and password=?");
		ps.setString(1, login.getUserid());
		ps.setString(2, login.getPassword());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			login.setRole(rs.getString("role"));
		}
		return login;
	}

	public boolean createAccount(Account acc) throws SQLException {
		boolean b = false;
		int i = 0;

		con = Util.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from Account where CustomerId=? AND AccountType=?");
		ps.setInt(1, acc.getCustomerId());
		ps.setString(2, acc.getAccountType());
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			i++;
		}
		if (i == 0) {
			b = insertNewACcount(acc);
		}
		return b;
	}

	private boolean insertNewACcount(Account acc) throws SQLException {
		// TODO Auto-generated method stub
		boolean b = true;
		con = Util.getConnection();
		PreparedStatement ps1 = con.prepareStatement("insert into Account values(sqw.nextval,?,?,?)");

		ps1.setInt(1, acc.getCustomerId());
		ps1.setString(2, acc.getAccountType());
		ps1.setDouble(3, acc.getDepositAmount());
		
		int e = ps1.executeUpdate();
		if (e > 0) {
			b = true;
		}
		return b;
	}

	public boolean addCustomer(AddCustomer customer) throws SQLException {
		boolean flag = false;
		con = Util.getConnection();
		PreparedStatement ps = con.prepareStatement("insert into addcustomer values(?,squcust.nextval,?,?,?,?,?,?)");
		ps.setString(1, customer.getSsnid());
		ps.setString(2, customer.getCustomerName());
		ps.setInt(3, customer.getCustomerAge());
		ps.setString(4, customer.getAddressLine1());
		ps.setString(5, customer.getAddressLine2());
		ps.setString(6, customer.getCity());
		ps.setString(7, customer.getState());
		int i = ps.executeUpdate();
		if (i > 0) {
			PreparedStatement ps1 = con.prepareStatement("select * from addcustomer where ssnid=? and customername=?");
			ps1.setString(1, customer.getSsnid());
			ps1.setString(2, customer.getCustomerName());
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				customer.setCustomerId(rs.getInt("customerid"));
			}
			flag = true;
		}
		return flag;
	}

	public int transfer(double tamount, int srcaccountid, int trgaccountid) {
		int d = 0;
		int c = 0;
		Account ac = new Account();
		double credit = ac.getDepositAmount() + tamount;
		double debit = ac.getDepositAmount() - tamount;
		con = Util.getConnection();

		try {
			PreparedStatement pst = con.prepareStatement("update Account set DepositAmount=? where AccountId=?");
			pst.setDouble(1, debit);
			pst.setInt(2, srcaccountid);
			d = pst.executeUpdate();
			if (d != 0) {
				PreparedStatement pst1 = con.prepareStatement("update Account set DepositAmount=? where AccountId=?");
				pst1.setDouble(1, credit);
				pst1.setInt(2, trgaccountid);
				c = pst1.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	public ArrayList<TransactionDetails> viewTransactions(int accountid, int transaction, String startdate,
			String enddate) throws SQLException {
		// TODO Auto-generated method stub
		con = Util.getConnection();
		ArrayList<TransactionDetails> list = new ArrayList<TransactionDetails>();
		int count = 1;
		PreparedStatement ps = con.prepareStatement("select * from transactiongroupF where accountid=?");
		ps.setInt(1, accountid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			if (count > transaction) {
				break;
			} else {
				TransactionDetails details = new TransactionDetails();
				details.setDescription(rs.getString("transactiontype"));
				details.setDate(rs.getString("transactiontime"));
				details.setBalance(rs.getInt("transactionamount"));
				list.add(details);
				count++;
			}
		}
		return list;
	}

	public Account informationsource(int srcaccountid) throws SQLException {
		Account a = new Account();
		con = Util.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from Account where AccountId=?");
		ps.setInt(1, srcaccountid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			a.setAccountId(rs.getInt(1));
			a.setCustomerId(rs.getInt(2));
			a.setAccountType(rs.getString(3));
			a.setDepositAmount(rs.getInt(4));
		}
		return a;
	}

	public double sourcebalance(double tamount, int srcaccountid) throws SQLException {
		con = Util.getConnection();
		double bal = 0;
		PreparedStatement ps = con.prepareStatement("select DepositAmount from Account where AccountId=?");
		ps.setInt(1, srcaccountid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bal = rs.getInt(1);
		}
		bal = bal - tamount;
		return bal;
	}

	public double targetbalance(double tamount, int trgaccountid) throws SQLException {
		con = Util.getConnection();
		double bal = 0;
		PreparedStatement ps = con.prepareStatement("select DepositAmount from Account where AccountId=?");
		ps.setInt(1, trgaccountid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bal = rs.getInt(1);
		}
		bal = bal + tamount;
		return bal;
	}

	public String sourcename(int srcaccountid) throws SQLException {
		con = Util.getConnection();
		String sname = null;
		PreparedStatement ps = con.prepareStatement("select CustomerId from Account where AccountId=?");
		ps.setInt(1, srcaccountid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			PreparedStatement ps2 = con.prepareStatement("select customerName from addCustomer where CustomerId=?");
			ps2.setInt(1, rs.getInt(1));
			ResultSet rs1 = ps2.executeQuery();
			while (rs1.next()) {
				sname = rs1.getString(1);
			}
		}
		return sname;
	}

	public boolean updatebalance(double sourceLatestBalance, int sourceAccountID) throws SQLException {
		con = Util.getConnection();
		boolean b = false;
		PreparedStatement ps = con.prepareStatement("update Account set DepositAmount=? where AccountId=? ");
		ps.setDouble(1, sourceLatestBalance);
		ps.setInt(2, sourceAccountID);
		int i = ps.executeUpdate();
		if (i > 0)
			b = true;
		return b;
	}

	/*
	 * verify the customer id before creating it on the basis of SSNID
	 * 
	 */
	public boolean verifyCustomer(AddCustomer customer) throws SQLException {
		// TODO Auto-generated method stub
		con = Util.getConnection();
		boolean flag = true;
		PreparedStatement ps1 = con.prepareStatement("select ssnid from addCustomer where SSNID=?");
		ps1.setString(1, customer.getSsnid());
		ResultSet rs = ps1.executeQuery();
		while (rs.next()) {
			
				flag = false;
			
		}
		return flag;
	}

	public boolean updatetransaction(int sourceAccountID, double tamount) throws SQLException {
		con = Util.getConnection();
		int a = 0;
		boolean b = false;
		PreparedStatement ps = con.prepareStatement("insert into transactiongroupF values(?,?,?,CURRENT_TIMESTAMP)");
		ps.setInt(1, sourceAccountID);
		ps.setDouble(2, tamount);
		ps.setString(3, "DEBIT");
		int i = ps.executeUpdate();
		if (i > 0) {
			b = true;
		}
		return b;
	}

	public double giveTotalBalanceInView(int accountid) throws SQLException {
		// TODO Auto-generated method stub

		double totalBalance = 0;

		con = Util.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from Account where AccountId=?");
		ps.setInt(1, accountid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			totalBalance = rs.getDouble("DepositAmount");
		}

		return totalBalance;
	}

	public boolean updatetrnsactiontareget(int targetAccountID, double tamount) throws SQLException {
		con = Util.getConnection();
		int a = 0;
		boolean b = false;
		PreparedStatement ps = con.prepareStatement("insert into transactiongroupF values(?,?,?,CURRENT_TIMESTAMP)");
		ps.setInt(1, targetAccountID);
		ps.setDouble(2, tamount);
		ps.setString(3, "CREDIT");
		int i = ps.executeUpdate();
		if (i > 0) {
			b = true;
		}
		return b;
	}

	public boolean check(int srcaccountid, int trgaccountid) throws SQLException {
		con = Util.getConnection();
		boolean b = false;
		PreparedStatement ps = con.prepareStatement("select * from account where accountid=?");
		ps.setInt(1, srcaccountid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			PreparedStatement ps1 = con.prepareStatement("select * from account where accountid=?");
			ps1.setInt(1, trgaccountid);
			ResultSet rs1 = ps.executeQuery();
			while (rs1.next()) {
				b = true;
			}
		}
		return b;
	}

	public ArrayList<TransactionDetails> viewTransactionsdate(int accountid, String startdate, String enddate)
			throws SQLException {
		con = Util.getConnection();
		ArrayList<TransactionDetails> list = new ArrayList<TransactionDetails>();
		
		PreparedStatement ps = con.prepareStatement("select * from transactiongroupf where accountid=? and trunc(transactiontime) between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')");
		ps.setInt(1, accountid);
		
		ps.setString(2, startdate);
		
		ps.setString(3, enddate);
		
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			TransactionDetails details = new TransactionDetails();
			
			details.setDescription(rs.getString(3));
			
			details.setDate(rs.getString(4));
			details.setBalance(rs.getInt(2));
			list.add(details);
		}
		return list;
	}
}
