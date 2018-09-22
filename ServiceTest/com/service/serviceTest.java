package com.service;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;

import com.bean.Account;
import com.bean.AddCustomer;
import com.bean.LoginGroupF;
import com.bean.TransactionDetails;

public class serviceTest {
	Service service = FactoryService.getService();
	
	@Test
	public void testVerifyDetails() throws SQLException {
		LoginGroupF login = new LoginGroupF();
		login.setUserid("CAE0001");
		login.setPassword("1234567890");
		LoginGroupF test = service.verifyDetails(login);
		assertEquals("CAE",test.getRole());
	}

	@Test
	public void testCreateAccount() throws SQLException {
		Account acc = new Account();
		acc.setCustomerId(1150);
		acc.setAccountType("Saving");
		acc.setDepositAmount(200);
		boolean test = service.createAccount(acc);
		assertEquals(true, test);
	}

	@Test
	public void testTransfer() {
		//fail("Not yet implemented");		
		int res=service.transfer(200, 513, 506);
		assertEquals(1,res);
	}

	@Test
	public void testViewTransactions() throws SQLException {
		ArrayList<TransactionDetails> list = service.viewTransactions(506, 5, "2018-08-08", "2018-08-08");
		assertNotEquals(null,list);
	}

	@Test
	public void testInformationsource() throws SQLException {
		Account test = service.informationsource(506);
		assertNotEquals(null,test);
	}

	@SuppressWarnings("deprecation")
	@Test
	public void testSourcebalance() throws SQLException {
		double test = service.sourcebalance(100, 502);
		assertEquals(1500,test,2);
	}

	@Test
	public void testTargetbalance() throws SQLException {
		double test = service.sourcebalance(100, 502);
		assertEquals(1500,test,2);
	}

	@Test
	public void testSourcename() throws SQLException {
		String test = service.sourcename(506);
		assertEquals("jhe", test);
	}

	@Test
	public void testUpdatebalance() throws SQLException {
		boolean test = service.updatebalance(500, 506);
		assertEquals(true, test);
	}

	@Test
	public void testVerifyCustomer() throws SQLException {
		AddCustomer customer = new AddCustomer("506",  "abc", 20, "pqr", "xyz", "mno", "fgh");
		boolean test = service.verifyCustomer(customer);
		assertEquals(true, test);
	}

	@Test
	public void testUpdatetransaction() throws SQLException {
		boolean test = service.updatetransaction(506, 200);
		assertEquals(true, test);
	}

	@Test
	public void testGiveTotalBalanceInView() throws SQLException {
		double test = service.giveTotalBalanceInView(502);
		assertEquals(1600.0, test,2);
	}

	@Test
	public void testUpdatetranscationtarget() throws SQLException {
		boolean test = service.updatetranscationtarget(506, 200);
		assertEquals(true, test);
	}

	@Test
	public void testCheck() throws SQLException {
		boolean test = service.check(506, 513);
		assertEquals(true, test);
	}

}
