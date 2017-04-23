package HW4Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;


@SuppressWarnings({ "unused", "serial" })
@WebServlet("/search_action")
public class search_action extends HttpServlet {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/CS3365";
	static final String USER = "root";
	static final String PASS = "root";
	private static Connection connection;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
	 	response.setContentType("text/html");
	    String book;
	    book = request.getParameter("Title");
	    try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	 	connection = DriverManager.getConnection(DB_URL, USER, PASS);
	 	PreparedStatement ps2 = connection.prepareStatement("select count(*) as number from (SELECT Title, PublisherName, AuthorName from book inner join Book_Authors on Book.BookID = Book_Authors.BookID where Title = '"+book+"') as book;");
	    PreparedStatement ps = connection.prepareStatement("SELECT Title, PublisherName, AuthorName from book inner join Book_Authors on Book.BookID = Book_Authors.BookID where Title = '"+book+"';");
	    ResultSet rs = ps2.executeQuery();
	    ResultSet data = ps.executeQuery();
	    
	    if(rs.next() && rs.getInt("number") == 0){ 
	         out.print("No Record Found");
	    }else {
	    	if (data.first())
	    	{
	    		out.println("Book Found" + " | ");
	    		out.println("Book Title: " + data.getString("Title") + " | " + "Publisher: " + data.getString("PublisherName") + " | " + "Author: " + data.getString("AuthorName"));  
	    	}
	    	while(data.next())
	    		out.println("**Co-Author**: " + data.getString("AuthorName"));
	    }
	    out.println("<html><body><center><a href = 'search.jsp'> Search Again</a></center></body></html>");
	    out.println("<body bgcolor='yellow'/>");
	} catch (SQLException se)
	       {
 	   se.printStackTrace();
    }
    catch (Exception e){
 	   e.printStackTrace();
	}
}}