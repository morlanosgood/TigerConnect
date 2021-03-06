package com.tigerconnect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tigerconnect.dao.UserInfoDao;
import com.tigerconnect.model.UserInfo;

public class SignInServlet extends HttpServlet {

	private static final String SUCCESS = "success";
	private static final String FAILURE = "failure";
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String pass = request.getParameter("password");
		System.out.println("Login= " + login + " Password= " + pass);
		if (login != null && pass != null) {
			UserInfoDao test1Dao = new UserInfoDao();
			PrintWriter writer = response.getWriter();
			try {
				UserInfo test1 = test1Dao.get(login);
				if (test1 == null) {
					writer.println(FAILURE);
				} else {
					String pw = test1.getPassword();
					if (pw != null && pw.equals(pass)) {
						writer.println(SUCCESS);
					} else {
						writer.println(FAILURE);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				writer.println(FAILURE);
			}
		}
	}
}
