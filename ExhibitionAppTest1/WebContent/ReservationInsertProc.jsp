<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
String sdate = request.getParameter("sdate");
String tprice = request.getParameter("tprice");
String tcnt = request.getParameter("tcnt");
String payment = request.getParameter("payment");
String names = custname + "(" + custid + ")";
		
	
	String sql = "insert into tickets values(null,?,?,now(),?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,names);
	pstmt.setString(2,sdate);
	pstmt.setString(3,tprice);
	pstmt.setString(4,tcnt);
	pstmt.setString(5,payment);
	
	int resultUpdate = pstmt.executeUpdate();
	
	if(resultUpdate > 0){
		response.sendRedirect("Ticket.jsp");
	}



%>