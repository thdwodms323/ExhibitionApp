<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>


<h3 class="text-center">관람권 구매</h3>
<%
	String extitle = "";
	String placename = "";
	String exprice = "";
	String sdate = "";
	String tcnt = "";

String sql = "select * from exhibition";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	do{ 
		String rextitle = rs.getString("extitle");
		String rplacename = rs.getString("placename");
		int rexprice = rs.getInt("exprice");
		String rsdate = rs.getString("sdate");
	%>
<section class="row">
<div class= "form_warp">
<form action="ReservationInsertProc.jsp" name="">
	<table class="table table-response table-striped">
		<tr>
			<td colspan="2"><h3 class="text-danger"><%=rextitle %></h3>
			</td>
		</tr>
		<tr>
			<th>전시장소</th>
			<td><input type="text" value="<%=rplacename %>" class="form-control" disabled/></td>
		</tr>
		<tr>
			<th>관람료</th>
			<td><input type="text" value="<%=rexprice %>" class="form-control" disabled/></td>
		</tr>
		<tr>
			<th>관람일자</th>
			<td><input type="date" value="<%=rsdate %>" name="sdate"  class="form-control"/></td>
		</tr>
		<tr>
			<th>결제방법</th>
			<td><input type="text" value="신용카드" name="payment"  class="form-control"/></td>
		</tr>
		<tr>
			<td colspan ="2">
			<input type="submit" value="예매" class="btn btn-success btn-block btn-info"/>
		</td>
		</tr>
	</table>
</form>
</div>
</section>		
	<%}while(rs.next());
}else{out.println("조회 실패");}
%>


<%@ include file="./include/Footer.jsp" %>